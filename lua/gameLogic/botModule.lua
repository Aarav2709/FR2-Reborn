local M = {}

local BOT_SPEED = 1
local LOOK_AHEAD = 185
local BLOCKED_SPEED = 280
local JUMP_COOLDOWN = 500
local POWER_UP_INTERVAL = 850

local function new(player)
  local composer = require("composer")
  local botPlayer = player
  local botTimer
  local gameFunction
  local gameState = 0
  local systemStartTime
  local btnPowerUpPress
  local nextJumpTime = system.getTimer() + 350
  local nextPowerUpTime = system.getTimer() + POWER_UP_INTERVAL
  local nextStuckSample = system.getTimer()
  local positionSamples = {}
  local runningSince

  botPlayer.speedMultiplier = BOT_SPEED

  local function jump()
    if not botPlayer.canJump() then
      return false
    end
    botPlayer.jump()
    return true
  end

  local function createPowerUpList(powerUpType)
    if not gameFunction then
      return
    end
    local data = {
      "11",
      botPlayer.id,
      {},
      powerUpType,
      botPlayer.x,
      botPlayer.y
    }
    gameFunction(data)
  end

  local function usePowerUp()
    if composer.data.gameInfo.gameType == 0 then
      local powerUpType = botPlayer.getPowerUp()
      if powerUpType > 0 then
        if powerUpType > 50 then
          createPowerUpList(powerUpType)
          timer.performWithDelay(200, function()
            createPowerUpList(powerUpType - 50)
          end, 1)
        else
          createPowerUpList(powerUpType)
        end
        botPlayer.usedPowerUp()
      end
    elseif btnPowerUpPress then
      btnPowerUpPress(nil, { phase = "began" })
    end
  end

  local function checkIfStuck()
    if #positionSamples < 8 or not botPlayer.canJump() then
      return
    end
    local first = positionSamples[1]
    local stuck = true
    for i = 2, #positionSamples do
      if math.abs(first - positionSamples[i]) > 34 then
        stuck = false
        break
      end
    end
    if stuck then
      jump()
      positionSamples = {}
      nextJumpTime = system.getTimer() + JUMP_COOLDOWN
    end
  end

  local function sampleProgress(now)
    if now < nextStuckSample then
      return
    end
    nextStuckSample = now + 100
    if botPlayer.canJump() then
      table.insert(positionSamples, 1, botPlayer.x)
      if #positionSamples > 10 then
        table.remove(positionSamples)
      end
      checkIfStuck()
    else
      positionSamples = {}
    end
  end

  local function updateBot(event)
    if composer.onboarding.isActive == true and composer.onboarding.overrideAI() then
      return
    end
    if not botPlayer then
      timer.cancel(event.source)
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

    sampleProgress(now)

    if now >= nextJumpTime then
      local lookAhead = math.max(75, math.min(LOOK_AHEAD, vx * 0.24 + 28))
      local obstacleAhead = botPlayer.obstacleAhead and botPlayer.obstacleAhead(lookAhead)
      local slowedDown = runningSince and now - runningSince > 700 and vx < BLOCKED_SPEED
      if obstacleAhead or slowedDown then
        if jump() then
          nextJumpTime = now + JUMP_COOLDOWN
        else
          nextJumpTime = now + 120
        end
      else
        nextJumpTime = now + 80
      end
    end

    if now >= nextPowerUpTime then
      usePowerUp()
      nextPowerUpTime = now + POWER_UP_INTERVAL
    end
  end

  local function startBotModule()
    gameState = 0
    botTimer = timer.performWithDelay(80, updateBot, 0)
  end

  local function setGameFunction(powerUpFunction, startTime, powerUpButton)
    gameFunction = powerUpFunction
    systemStartTime = startTime
    btnPowerUpPress = powerUpButton
  end

  local function botDied()
    positionSamples = {}
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
    if gameFunction and gameState == 1 and composer.data.gameInfo.gameType == 0 then
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
