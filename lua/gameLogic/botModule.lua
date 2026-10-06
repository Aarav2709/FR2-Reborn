-- offline race bots
local physics = require("physics")
local powerUps = require("lua.gameLogic.powerUps")

local M = {}

local BOT_SPEED_MIN = 1.03
local BOT_SPEED_MAX = 1.06
local UPDATE_INTERVAL = 80
local JUMP_COOLDOWN = 500
local BLOCKED_SPEED = 90

local GRAVITY = 600
local JUMP_SPEED = 295
local JUMP_KEEP = 0.7
local AIR_ACCELERATION = 100
local ARC_POINTS = { { 15, 14 }, { -15, 14 }, { 15, -17 } }
local ARC_STEP = 0.075
local ARC_TIME = 1.3
local SCAN_HEIGHTS = { 12, -10, -38, -66, -92 }
local RUN_HEIGHTS = { 12, -1, -15 }
local RUN_HORIZON = 0.75
local FRONT = 15
local HAZARD_LEAD = 20

local BLADE_RADIUS = 18
local BLADE_JUMP_MIN = 65
local BLADE_JUMP_MAX = 165
local BLADE_SHIELD_GAP = 200
local REACTION_MIN = 90
local REACTION_MAX = 220

local BLADE_RANGE = 1100
local BLADE_HEIGHT = 110
local TRAP_RANGE = 650
local LIGHTNING_RANGE = 480
local ROCKET_BLAST = 260
local SPEED_CLEARANCE = 150
-- a power up is used a moment after the pickup, never instantly.
local USE_DELAY_MIN = 120
local USE_DELAY_MAX = 350

local BOX_RANGE = 260
local BOX_HEIGHTS = { -38, -60 }
local BOX_EARLY = 30
local BOX_LATE = 20

local CATCH_UP_GAP = 120
local CATCH_UP_STEP = 40
local CATCH_UP_MAX = 0.14
local CATCH_UP_EASE = 0.1

local function arcPosition(vx, t, topSpeed)
  local x
  local v0 = vx
  if vx > topSpeed * 0.2 then
    v0 = vx * JUMP_KEEP
  end
  if v0 >= topSpeed then
    x = v0 * t
  else
    local untilTop = (topSpeed - v0) / AIR_ACCELERATION
    if t <= untilTop then
      x = v0 * t + 0.5 * AIR_ACCELERATION * t * t
    else
      x = v0 * untilTop + 0.5 * AIR_ACCELERATION * untilTop * untilTop + topSpeed * (t - untilTop)
    end
  end
  return x, -JUMP_SPEED * t + 0.5 * GRAVITY * t * t
end

M.arcPosition = arcPosition
M.CATCH_UP_MAX = CATCH_UP_MAX

local function new(player, playerList)
  local composer = require("composer")
  local botPlayer = player
  playerList = playerList or {}
  local botTimer
  local gameFunction
  local gameState = 0
  local systemStartTime
  local btnPowerUpPress
  local startTime = system.getTimer()
  local nextJumpTime = startTime + 350
  local nextStuckSample = startTime
  local positionSamples = {}
  local speedSamples = {}
  local runningSince
  local heldType, useAfter, heldSince = 0, 0, 0
  local lastCastTime = startTime
  local shieldAt
  local rocketBlasts = {}
  local paceFactor = 1

  if composer.onboarding.isActive == true then
    botPlayer.speedMultiplier = 1
  else
    botPlayer.speedMultiplier = BOT_SPEED_MIN + math.random() * (BOT_SPEED_MAX - BOT_SPEED_MIN)
  end

  local function topSpeed()
    return botPlayer.getTopSpeedX and botPlayer.getTopSpeedX() or 350
  end

  local function isTeammate(other)
    return composer.data.gameInfo.teamMode and botPlayer.team ~= nil and other.team == botPlayer.team
  end

  local function inRace(other)
    if other == botPlayer or type(other) ~= "table" or type(other.x) ~= "number" then
      return false
    end
    if other.getPlayerGoalTime and other.getPlayerGoalTime() > 0 then
      return false
    end
    return not (other.isDisconnected and other.isDisconnected())
  end

  local function isRival(other)
    return inRace(other) and not isTeammate(other)
  end

  local function isTarget(other)
    if not isRival(other) then
      return false
    end
    if other.isDead and other.isDead() then
      return false
    end
    local states = other.booleanStates
    return not (states and (states.shieldActive or states.playerInvulnerable))
  end

  local function surroundings()
    local around = { rivalsAhead = 0, targetsAhead = 0, lightningTargets = 0, anyoneAhead = false }
    for i = 1, #playerList do
      local other = playerList[i]
      if other ~= botPlayer and type(other) == "table" and type(other.x) == "number" then
        local dx = other.x - botPlayer.x
        if dx > 0 then
          around.anyoneAhead = true
        end
        if isRival(other) then
          if dx > 0 then
            around.rivalsAhead = around.rivalsAhead + 1
          end
          if isTarget(other) then
            if dx > 0 then
              around.targetsAhead = around.targetsAhead + 1
              if not around.nearestAhead or other.x < around.nearestAhead.x then
                around.nearestAhead = other
              end
            elseif not around.nearestBehind or other.x > around.nearestBehind.x then
              around.nearestBehind = other
            end
            if dx > -LIGHTNING_RANGE then
              around.lightningTargets = around.lightningTargets + 1
            end
            if not around.leader or other.x > around.leader.x then
              around.leader = other
            end
            if other.mainPlayer then
              around.human = other
            end
          end
        end
      end
    end
    return around
  end

  local function castRay(x1, y1, x2, y2)
    local ok, hits = pcall(physics.rayCast, x1, y1, x2, y2, "sorted")
    if ok and type(hits) == "table" then
      return hits
    end
  end

  -- a teammate's traps and blades don't hurt (the bot's own ones do).
  local function isFriendly(object)
    local owner = object.ownerId and playerList[object.ownerId]
    return owner ~= nil and owner ~= botPlayer and isTeammate(owner)
  end

  local function severity(object, vx)
    if type(object) ~= "table" then
      return 0
    end
    if object.floatingBladeTrap or object.flatBladeTrap then
      return 2
    end
    if object.slow then
      return 1
    end
    local kind = object.botHazard
    if not kind or isFriendly(object) then
      return 0
    end
    if kind == "blade" then
      local ok, bladeVx = pcall(object.getLinearVelocity, object)
      if ok and type(bladeVx) == "number" and bladeVx > vx + 40 then
        return 0
      end
    end
    return 2
  end

  local function isSolid(object)
    return type(object) == "table" and object.mapElement and not object.slow and not object.floatingBladeTrap
      and not object.flatBladeTrap
  end

  local function lineCost(x1, y1, x2, y2, vx)
    local hits = castRay(x1, y1, x2, y2)
    if not hits then
      return 0
    end
    local worst, at = 0, nil
    for i = 1, #hits do
      local hit = hits[i]
      local cost = severity(hit.object, vx)
      if cost > worst then
        worst = cost
        at = hit.position and hit.position.x or x1
      end
      if isSolid(hit.object) then
        return worst, at, true
      end
    end
    return worst, at, false
  end

  local function wallAhead(distance)
    local y = botPlayer.y + 6
    local hits = castRay(botPlayer.x + 18, y, botPlayer.x + distance, y)
    if not hits then
      return false
    end
    for i = 1, #hits do
      local object = hits[i].object
      if isSolid(object) then
        return not object.bounce
      end
    end
    return false
  end

  local function lookAhead(vx)
    return math.max(75, math.min(185, vx * 0.24 + 28))
  end

  local function hazardsNear(vx)
    local reach = math.max(330, arcPosition(vx, ARC_TIME, topSpeed()) + 40)
    local x1 = botPlayer.x + FRONT + 1
    for i = 1, #SCAN_HEIGHTS do
      local y = botPlayer.y + SCAN_HEIGHTS[i]
      if lineCost(x1, y, x1 + reach, y, vx) > 0 then
        return true
      end
    end
    return false
  end

  local function runCost(vx)
    local x1 = botPlayer.x + FRONT + 1
    local reach = math.max(vx, 200) * RUN_HORIZON
    local worst, nearest = 0, nil
    for i = 1, #RUN_HEIGHTS do
      local y = botPlayer.y + RUN_HEIGHTS[i]
      local cost, at = lineCost(x1, y, x1 + reach, y, vx)
      if cost > worst or (cost > 0 and cost == worst and at < nearest) then
        worst, nearest = cost, at
      end
    end
    return worst, nearest and nearest - x1
  end

  local function jumpCost(vx)
    local top = topSpeed()
    local x0, y0 = botPlayer.x, botPlayer.y
    local worst = 0
    local px, py = 0, 0
    local t = 0
    while t < ARC_TIME do
      t = t + ARC_STEP
      local nx, ny = arcPosition(vx, t, top)
      local landed = false
      for i = 1, #ARC_POINTS do
        local point = ARC_POINTS[i]
        local cost, _, blocked = lineCost(x0 + px + point[1], y0 + py + point[2], x0 + nx + point[1], y0 + ny + point[2], vx)
        if cost > worst then
          worst = cost
          if worst >= 2 then
            return worst
          end
        end
        if blocked and point[2] > 0 and ny > py then
          landed = true
        end
      end
      if landed then
        break
      end
      px, py = nx, ny
    end
    return worst
  end

  local function hazardJumpDistance(vx)
    local apexX = arcPosition(vx, JUMP_SPEED / GRAVITY, topSpeed())
    return apexX - 2 * FRONT + HAZARD_LEAD
  end

  local function bladeComing(vx)
    local list = powerUps.getPowerUps and powerUps.getPowerUps()
    if type(list) ~= "table" then
      return nil
    end
    local closest
    for _, object in pairs(list) do
      if type(object) == "table" and object.botHazard == "blade" and type(object.x) == "number"
          and type(object.y) == "number" and not isFriendly(object) then
        local ok, bladeVx, bladeVy = pcall(object.getLinearVelocity, object)
        if ok and type(bladeVx) == "number" and bladeVx > vx + 60 and math.abs(bladeVy or 0) < 150
            and math.abs(object.y - botPlayer.y) < 45 then
          local gap = (botPlayer.x - FRONT) - (object.x + BLADE_RADIUS)
          if gap > -10 and gap < 300 and (not closest or gap < closest) then
            closest = gap
          end
        end
      end
    end
    return closest
  end

  local function firstBox(hits)
    for j = 1, #(hits or {}) do
      local object = hits[j].object
      if type(object) == "table" and object.powerUp then
        return hits[j]
      end
      if isSolid(object) then
        return nil
      end
    end
  end

  local function boxAhead()
    local x1 = botPlayer.x + FRONT + 1
    for i = 1, #RUN_HEIGHTS do
      local y = botPlayer.y + RUN_HEIGHTS[i]
      if firstBox(castRay(x1, y, x1 + BOX_RANGE, y)) then
        return nil
      end
    end
    local nearest
    for i = 1, #BOX_HEIGHTS do
      local y = botPlayer.y + BOX_HEIGHTS[i]
      local hit = firstBox(castRay(x1, y, x1 + BOX_RANGE, y))
      if hit then
        local at = hit.position and hit.position.x or x1
        if not nearest or at - x1 < nearest then
          nearest = at - x1
        end
      end
    end
    return nearest
  end

  local function jump(now)
    if not botPlayer.canJump() then
      return false
    end
    botPlayer.jump()
    positionSamples = {}
    nextJumpTime = now + JUMP_COOLDOWN
    return true
  end

  local function stalled(now, vx)
    if not runningSince or now - runningSince < 700 or vx >= BLOCKED_SPEED then
      return false
    end
    local earlier = speedSamples[3]
    return earlier ~= nil and vx - earlier < 30
  end

  local function checkIfStuck(now)
    if #positionSamples < 8 or not botPlayer.canJump() then
      return
    end
    local first = positionSamples[1]
    for i = 2, #positionSamples do
      if math.abs(first - positionSamples[i]) > 34 then
        return
      end
    end
    jump(now)
  end

  local function sampleProgress(now, vx)
    table.insert(speedSamples, 1, vx)
    if #speedSamples > 4 then
      table.remove(speedSamples)
    end
    if now < nextStuckSample then
      return
    end
    nextStuckSample = now + 100
    if botPlayer.canJump() then
      table.insert(positionSamples, 1, botPlayer.x)
      if #positionSamples > 10 then
        table.remove(positionSamples)
      end
      checkIfStuck(now)
    else
      positionSamples = {}
    end
  end

  local function steer(now, vx)
    if now < nextJumpTime or not botPlayer.canJump() then
      return
    end
    local states = botPlayer.booleanStates or {}
    if states.rocketActive then
      if wallAhead(lookAhead(vx)) then
        jump(now)
      end
      return
    end
    local hazards = hazardsNear(vx)
    local runWorst, hazardDistance = 0, nil
    if hazards then
      runWorst, hazardDistance = runCost(vx)
    end
    local reason
    if wallAhead(lookAhead(vx)) then
      reason = "wall"
    elseif runWorst > 0 and hazardDistance and hazardDistance <= hazardJumpDistance(vx) then
      reason = "hazard"
    else
      local gap = bladeComing(vx)
      if gap and gap >= BLADE_JUMP_MIN and gap <= BLADE_JUMP_MAX then
        reason = "blade"
      elseif stalled(now, vx) then
        reason = "stalled"
      elseif heldType == 0 and botPlayer.getPowerUp() == 0 then
        local box = boxAhead()
        local at = hazardJumpDistance(vx)
        if box and box >= at - BOX_EARLY and box <= at + BOX_LATE then
          reason = "box"
        end
      end
    end
    if not reason then
      return
    end
    if hazards then
      local jumpWorst = jumpCost(vx)
      if reason == "wall" then
        -- the wall has to be jumped, unless that means jumping into worse.
        if jumpWorst > runWorst then
          return
        end
      elseif reason == "hazard" then
        if jumpWorst >= runWorst then
          return
        end
      elseif jumpWorst > 0 and (reason == "box" or jumpWorst >= runWorst) then
        -- a box is never worth getting hurt for.
        return
      end
    end
    jump(now)
  end

  local function send(powerUpType, x)
    if gameFunction then
      gameFunction({ "11", botPlayer.id, {}, powerUpType, x or botPlayer.x, botPlayer.y })
    end
  end

  local function firePowerUp(powerUpType, target)
    if composer.data.gameInfo.gameType ~= 0 then
      if btnPowerUpPress then
        btnPowerUpPress(nil, { phase = "began" })
      end
      return
    end
    botPlayer.usedPowerUp()
    heldType = 0
    send(powerUpType, target)
    if powerUpType > 50 then
      timer.performWithDelay(200, function()
        send(powerUpType - 50, target)
      end, 1)
    end
  end

  local function shouldUse(kind, held, vx)
    local around = surroundings()
    local states = botPlayer.booleanStates or {}
    if kind == 1 then
      local target = around.nearestAhead
      if target and target.x - botPlayer.x < BLADE_RANGE and math.abs(target.y - botPlayer.y) < BLADE_HEIGHT then
        return true
      end
      -- no one to hit: don't keep the slot blocked forever.
      return held > (around.rivalsAhead == 0 and 6000 or 10000)
    elseif kind == 2 or kind == 8 then
      if not botPlayer.onGround then
        return false
      end
      local chaser = around.nearestBehind
      if chaser then
        local gap = botPlayer.x - chaser.x
        if gap > 70 and gap < TRAP_RANGE and math.abs(chaser.y - botPlayer.y) < 120 then
          return true
        end
      end
      return held > 9000
    elseif kind == 3 then
      return around.lightningTargets > 0 or held > 12000
    elseif kind == 4 then
      return botPlayer.onGround and not wallAhead(SPEED_CLEARANCE)
    elseif kind == 5 then
      return held > 15000 and not states.armorActive
    elseif kind == 7 then
      return around.targetsAhead > 0 or held > 15000
    elseif kind == 9 then
      local target = around.human or around.leader
      if target then
        return true, target.id
      end
      return held > 8000
    elseif kind == 11 then
      return around.anyoneAhead
    end
    return true
  end

  local function handlePowerUp(now, vx)
    local powerUpType = botPlayer.getPowerUp()
    if powerUpType <= 0 then
      if not (botPlayer.isDead and botPlayer.isDead()) then
        heldType = 0
      end
      return
    end
    if powerUpType ~= heldType then
      heldType = powerUpType
      heldSince = now
      useAfter = now + math.random(USE_DELAY_MIN, USE_DELAY_MAX)
    end
    local kind = powerUpType > 50 and powerUpType - 50 or powerUpType
    local states = botPlayer.booleanStates or {}
    if shieldAt and now >= shieldAt then
      shieldAt = nil
      if kind == 5 and not states.shieldActive and not states.armorActive then
        firePowerUp(powerUpType)
        return
      end
    end
    if now < useAfter then
      return
    end
    local use, target = shouldUse(kind, now - heldSince, vx)
    if use then
      firePowerUp(powerUpType, target)
    end
  end

  local function wantShield(at)
    if heldType == 5 and (not shieldAt or at < shieldAt) then
      shieldAt = at
    end
  end

  local function watchAttacks(now, vx)
    local casts = powerUps.getRecentCasts and powerUps.getRecentCasts()
    if type(casts) == "table" then
      local newest = lastCastTime
      for i = 1, #casts do
        local cast = casts[i]
        if cast.time > lastCastTime then
          newest = math.max(newest, cast.time)
          local caster = playerList[cast.caster]
          if caster and caster ~= botPlayer and isRival(caster) then
            local hitsAt
            if cast.type == 3 and botPlayer.x + LIGHTNING_RANGE > caster.x then
              hitsAt = cast.time + 500
            elseif cast.type == 57 and botPlayer.x > caster.x then
              hitsAt = cast.time + 200
            elseif cast.type == 59 and (cast.target == botPlayer.id or (caster.mainPlayer and botPlayer.ninjaMark)) then
              hitsAt = cast.time + 200
            elseif cast.type == 10 then
              rocketBlasts[#rocketBlasts + 1] = { caster = caster, at = cast.time + 5000 }
            end
            local reactAt = now + math.random(REACTION_MIN, REACTION_MAX)
            if hitsAt and reactAt < hitsAt then
              wantShield(reactAt)
            end
          end
        end
      end
      lastCastTime = newest
    end
    for i = #rocketBlasts, 1, -1 do
      local blast = rocketBlasts[i]
      if now > blast.at then
        table.remove(rocketBlasts, i)
      elseif blast.at - now < 450 and type(blast.caster.x) == "number"
          and math.abs(blast.caster.x - botPlayer.x) < ROCKET_BLAST and math.abs(blast.caster.y - botPlayer.y) < ROCKET_BLAST then
        wantShield(now)
      end
    end
    local gap = bladeComing(vx)
    if gap and gap < BLADE_SHIELD_GAP then
      wantShield(now)
    end
  end

  local function keepUp()
    if not botPlayer.setBotSpeedFactor or composer.data.gameInfo.gameType ~= 0 or botPlayer.mainPlayer then
      return
    end
    local human
    for i = 1, #playerList do
      local other = playerList[i]
      if other ~= botPlayer and type(other) == "table" and other.mainPlayer and type(other.x) == "number" then
        human = other
        break
      end
    end
    local target = 1
    if human and not (human.getPlayerGoalTime and human.getPlayerGoalTime() > 0) then
      local gap = human.x - botPlayer.x
      if gap > CATCH_UP_GAP then
        target = 1 + math.min(CATCH_UP_MAX, (gap - CATCH_UP_GAP) / CATCH_UP_STEP * 0.01)
      end
    end
    paceFactor = paceFactor + (target - paceFactor) * CATCH_UP_EASE
    if math.abs(paceFactor - target) < 0.001 then
      paceFactor = target
    end
    botPlayer.setBotSpeedFactor(paceFactor)
  end

  local function updateBot(event)
    if composer.onboarding.isActive == true and composer.onboarding.overrideAI() then
      return
    end
    if not botPlayer or type(botPlayer.x) ~= "number" then
      if event and event.source then
        timer.cancel(event.source)
      end
      return
    end
    local now = system.getTimer()
    local vx = botPlayer:getLinearVelocity()
    if vx > 0 and gameState == 0 then
      gameState = 1
      runningSince = now
      nextJumpTime = now + 350
    end
    if gameState ~= 1 then
      return
    end
    sampleProgress(now, vx)
    keepUp()
    steer(now, vx)
    watchAttacks(now, vx)
    handlePowerUp(now, vx)
  end

  local function startBotModule()
    gameState = 0
    botTimer = timer.performWithDelay(UPDATE_INTERVAL, updateBot, 0)
  end

  local function setGameFunction(powerUpFunction, raceStartTime, powerUpButton)
    gameFunction = powerUpFunction
    systemStartTime = raceStartTime
    btnPowerUpPress = powerUpButton
  end

  local function botDied()
    positionSamples = {}
    speedSamples = {}
    runningSince = nil
    gameState = 0
  end

  local function cleanBot()
    if botTimer then
      timer.cancel(botTimer)
      botTimer = nil
    end
  end

  local function inGoal()
    if gameFunction and gameState ~= 2 and composer.data.gameInfo.gameType == 0 then
      gameFunction({ "15", botPlayer.id, "", system.getTimer() - (systemStartTime or 0) })
    end
    gameState = 2
    cleanBot()
  end

  local function forceInGoal(time)
    if gameFunction then
      gameFunction({ "15", botPlayer.id, "", time })
    end
    gameState = 2
    cleanBot()
  end

  botPlayer.setGameFunction = setGameFunction
  botPlayer.botDied = botDied
  botPlayer.cleanBot = cleanBot
  botPlayer.inGoal = inGoal
  botPlayer.forceInGoal = forceInGoal
  startBotModule()
  return botPlayer
end

M.new = new
return M
