local M = {}
local composer = require("composer")
local physics = require("physics")
local gibPhysicsScale = 0.45
local gibPhysicsSmallerScale = 0.3
local gibPhysicsData = require("lua.monsters.physics.gibs").physicsData(gibPhysicsScale)
local gibPhysicsSmallerData = require("lua.monsters.physics.gibs").physicsData(gibPhysicsSmallerScale)
-- Tombstone outline (from the original physics data) for the 111x144 art at this scale.
local TOMBSTONE_SCALE = 0.25
local TOMBSTONE_SHAPE = { -41.5, 57, -33.5, -39, -1.5, -58, 29.5, -39, 41.5, 57 }

local function newCorpsParts(displayGroup, playerToUse)
  local N = {}
  local bodyParts = displayGroup
  local player = playerToUse
  local skullList = {}
  local headList = {}
  local headShotList = {}
  local brainList = {}
  local huntersMarkHead = {}
  local rocketParts = {}
  local gibs = {}
  local startedClean = false
  local bpForce = 30
  local deathAnimations
  local tombstones = {}
  local nextTombstone = 1
  local tombstoneTimer

  local function addSpriteSet(monsterDeathAnimations)
    deathAnimations = monsterDeathAnimations
  end

  N.addSpriteSet = addSpriteSet

  local function getDeathFrameIndex(frameName)
    if not deathAnimations or not deathAnimations.sheetInfo then
      return nil
    end
    return deathAnimations.sheetInfo:getFrameIndex(frameName)
  end

  local function getLast(list)
    if not list or #list == 0 then
      return nil
    end
    return list[#list]
  end

  local function startedCleanNow()
    startedClean = true
    for i = 1, #skullList do
      skullList[i]:removeSelf()
    end
    for i = 1, #headList do
      headList[i]:removeSelf()
    end
    for i = 1, #headShotList do
      headShotList[i]:removeSelf()
    end
    for i = 1, #brainList do
      brainList[i]:removeSelf()
    end
    for i = 1, #huntersMarkHead do
      huntersMarkHead[i]:removeSelf()
    end
    for i = 1, #rocketParts do
      rocketParts[i]:removeSelf()
    end
    for i = 1, #gibs do
      if gibs[i] then
        transition.cancel(gibs[i])
        if gibs[i].removeSelf then
          gibs[i]:removeSelf()
        end
      end
    end
    for i = 1, #tombstones do
      display.remove(tombstones[i])
    end
    tombstones = {}
  end

  N.startedCleanNow = startedCleanNow

  -- R.I.P. tombstones dropped where the runner died: three per runner, reused in
  -- turn, like Fun Run 2. They fall onto the map and stay there.
  local function readyTombstones()
    if startedClean then
      return
    end
    local shape = {}
    for i = 1, #TOMBSTONE_SHAPE do
      shape[i] = TOMBSTONE_SHAPE[i] * TOMBSTONE_SCALE
    end
    for i = 1, 3 do
      local stone = display.newImageRect(bodyParts, "images/game/powerups/tombstone.png", 111 * TOMBSTONE_SCALE, 144 * TOMBSTONE_SCALE)
      physics.addBody(stone, "dynamic", {
        density = 0.6,
        friction = 1,
        bounce = 0,
        shape = shape,
        filter = remotePlayerCollisionFilter
      })
      stone.x, stone.y = player.x, player.y
      stone.alpha = 0
      stone.isBodyActive = false
      tombstones[i] = stone
    end
  end

  N.readyTombstones = readyTombstones

  local function dropTombstone(delay)
    if tombstoneTimer then
      timer.cancel(tombstoneTimer)
    end
    -- Bodies can't be moved inside a collision, so this always runs on a timer.
    tombstoneTimer = timer.performWithDelay(math.max(10, delay or 0), function()
      tombstoneTimer = nil
      local stone = tombstones[nextTombstone]
      if startedClean or not stone or not stone.removeSelf then
        return
      end
      nextTombstone = nextTombstone % #tombstones + 1
      stone.isBodyActive = true
      stone.x, stone.y = player.x, player.y
      stone.rotation = 0
      stone:setLinearVelocity(0, 0)
      stone.angularVelocity = 0
      stone.alpha = 1
      stone:toFront()
    end)
  end

  N.dropTombstone = dropTombstone

  local function dropHuntersMarkHead()
    if not startedClean then
      local head = getLast(huntersMarkHead)
      if not head then
        return
      end
      head.x = player.x
      head.y = player.y
      head.alpha = 1
      head:toFront()
    end
  end

  N.dropHuntersMarkHead = dropHuntersMarkHead

  local function readyHuntersMarkHead()
    if not startedClean then
      local hunterMarksPath = getDeathFrameIndex("deaths/headSingleShot")
      if not hunterMarksPath then
        return
      end
      huntersMarkHead[#huntersMarkHead + 1] = display.newImage(deathAnimations.sheet, hunterMarksPath)
      huntersMarkHead[#huntersMarkHead].xScale = 0.5
      huntersMarkHead[#huntersMarkHead].yScale = 0.5
      physics.addBody(huntersMarkHead[#huntersMarkHead], {
        density = 0.6,
        friction = 1,
        radius = 10,
        bounce = 0.2,
        filter = powerUpFilter
      })
      huntersMarkHead[#huntersMarkHead].x = player.x
      huntersMarkHead[#huntersMarkHead].y = player.y
      huntersMarkHead[#huntersMarkHead].alpha = 0
      bodyParts:insert(huntersMarkHead[#huntersMarkHead])
    end
  end

  N.readyHuntersMarkHead = readyHuntersMarkHead

  local function dropRocketParts(vx, vy)
    if not startedClean then
      local startIndex = #rocketParts - 2
      if 0 < startIndex then
        for i = 1, 3 do
          rocketParts[startIndex].x = player.x
          rocketParts[startIndex].y = player.y
          rocketParts[startIndex].alpha = 1
          rocketParts[startIndex]:setLinearVelocity(vx, vy)
          rocketParts[startIndex]:toFront()
          rocketParts[startIndex]:applyForce(math.random(-bpForce * 2, bpForce * 2),
            math.random(-bpForce * 3.5, -bpForce * 2), rocketParts[startIndex].x + math.random(1, 5),
            rocketParts[startIndex].y)
          startIndex = startIndex + 1
        end
      end
    end
  end

  N.dropRocketParts = dropRocketParts
  -- Actual gib files are named gibs_1.png through gibs_9.png
  local gibArray = {
    "gibs_1",
    "gibs_2",
    "gibs_3",
    "gibs_4",
    "gibs_5",
    "gibs_6",
    "gibs_7",
    "gibs_8",
    "gibs_9"
  }

  local function clean(gib)
    if gib and gib.removeSelf then
      gib:removeSelf()
      gib = nil
    end
  end

  local function createGibObject(imageName, xScale, yScale, x, y, shouldApplyForce, physicsBody)
    -- Safe image load with error check
    local gib = display.newImage(imageName)

    if not gib then
      print("WARNING: Failed to create gib with image: " .. imageName)
      return nil
    end
    gib.xScale = xScale
    gib.yScale = yScale
    gib.x = x
    gib.y = y
    gib.alpha = 1
    transition.to(gib, {
      time = 1000,
      delay = 5000,
      onComplete = function()
        clean(gib)
      end,
      onCancel = function()
        clean(gib)
      end,
      alpha = 0
    })
    physicsBody.filter = remotePlayerCollisionFilter
    physicsBody.density = 15
    physicsBody.friction = 0.9
    physicsBody.bounce = 0.4
    physics.addBody(gib, physicsBody)
    local vx, vy = player.getLinearVelocityOnPlayer()
    gib:setLinearVelocity(vx, vy)
    if shouldApplyForce then
      gib:applyForce(math.random(-10, 10), -200, gib.x + math.random(-5, 5), gib.y + math.random(-5, 5))
    end
    gibs[#gibs + 1] = gib
    bodyParts:insert(gib)
    return gib
  end

  local function createGibSpriteObject(frameIndex, xScale, yScale, xAnchor, yAnchor, x, y, shouldApplyForce, forceX,
                                       forceY, forceDX, forceDY, physicsBody, vx, vy)
    local gib = display.newImage(deathAnimations.sheet, frameIndex)
    gib.xScale = xScale
    gib.yScale = yScale
    gib.anchorX = xAnchor
    gib.anchorY = yAnchor
    gib.x = x
    gib.y = y
    gib.alpha = 1
    transition.to(gib, {
      time = 1000,
      delay = 5000,
      onComplete = function()
        clean(gib)
      end,
      onCancel = function()
        clean(gib)
      end,
      alpha = 0
    })
    physicsBody.filter = remotePlayerCollisionFilter
    physics.addBody(gib, physicsBody)
    gib:setLinearVelocity(vx, vy)
    if shouldApplyForce then
      gib:applyForce(forceX, forceY, gib.x + forceDX, gib.y + forceDY)
    end
    gibs[#gibs + 1] = gib
    bodyParts:insert(gib)
    return gib
  end

  local function dropSawbladeGibs(vx, vy)
    if not startedClean then
      for i = 1, 3 do
        local randomGibIndex = math.random(1, #gibArray)
        local randomGibName = gibArray[randomGibIndex]
        local randomName = "images/game/powerups/" .. randomGibName .. ".png"

        -- Use a simple default physics body since gibs have no custom physics data
        local defaultPhysicsBody = {
          density = 2,
          friction = 0.5,
          bounce = 0.3,
          radius = 10,
          filter = remotePlayerCollisionFilter
        }

        -- Safe gib creation with nil check
        local gibObj = createGibObject(randomName, gibPhysicsSmallerScale, gibPhysicsSmallerScale, player.x, player.y,
          true, defaultPhysicsBody)
        if not gibObj then
          print("WARNING: Failed to create sawblade gib, skipping...")
        end
      end

      -- Use existing sawblade physics bodies when available
      local sawbladeLeftBody = gibPhysicsData:get("sawbladeLeft")
      local sawbladeRightBody = gibPhysicsData:get("sawbladeRight")

      -- Create only if sawblade physics data exists
      if sawbladeLeftBody and sawbladeRightBody then
        local sawbladeLeftFrame = getDeathFrameIndex("deaths/sawbladeLeft")
        local sawbladeRightFrame = getDeathFrameIndex("deaths/sawbladeRight")
        if sawbladeLeftFrame and sawbladeRightFrame then
          createGibSpriteObject(sawbladeLeftFrame, gibPhysicsScale,
            gibPhysicsScale, 0.5, 0.5, player.x, player.y, true, 100, -350, 30, -90, sawbladeLeftBody, vx, vy)
          createGibSpriteObject(sawbladeRightFrame, gibPhysicsScale,
            gibPhysicsScale, 0.5, 0.5, player.x, player.y, true, -100, -350, -30, -90, sawbladeRightBody, vx, vy)
        end
      else
        print("WARNING: Sawblade physics data not available")
      end
    end
  end

  N.dropSawbladeGibs = dropSawbladeGibs
  local hunterGibArray = {
    "gibs_1",
    "gibs_2",
    "gibs_3",
    "gibs_4"
  }

  local function dropHunterGibs()
    if not startedClean then
      for i = 1, 4 do
        local randomName = "images/game/powerups/" .. hunterGibArray[i] .. ".png"
        -- Use a simple default physics body
        local defaultPhysicsBody = {
          density = 2,
          friction = 0.5,
          bounce = 0.3,
          radius = 10,
          filter = remotePlayerCollisionFilter
        }
        createGibObject(randomName, gibPhysicsSmallerScale, gibPhysicsSmallerScale, player.x, player.y, true,
          defaultPhysicsBody)
      end
    end
  end

  N.dropHunterGibs = dropHunterGibs

  local function readyRocketParts()
    if not startedClean then
      local rocketPath = composer.powerUpEffectImageSheetInfo:getFrameIndex("rocketPart1")
      if not rocketPath then
        return
      end
      for i = 1, 3 do
        local index = rocketPath + i - 1
        rocketParts[#rocketParts + 1] = display.newImage(composer.powerUpEffectImageSheet, index)
        rocketParts[#rocketParts].xScale = 0.5
        rocketParts[#rocketParts].yScale = 0.5
        physics.addBody(rocketParts[#rocketParts], {
          density = 0.6,
          friction = 1,
          radius = 10,
          bounce = 0.2,
          filter = powerUpFilter
        })
        rocketParts[#rocketParts].x = player.x
        rocketParts[#rocketParts].y = player.y
        rocketParts[#rocketParts].alpha = 0
        bodyParts:insert(rocketParts[#rocketParts])
      end
    end
  end

  N.readyRocketParts = readyRocketParts

  local function dropSkull(vx, vy)
    if not startedClean then
      local skull = getLast(skullList)
      if not skull then
        return
      end
      skull.x = player.x
      skull.y = player.y
      skull:setLinearVelocity(vx, vy)
      skull.alpha = 1
      skull:toFront()
    end
  end

  N.dropSkull = dropSkull

  local function readySkull()
    if not startedClean then
      local skullPath = getDeathFrameIndex("deaths/headSkull")
      if not skullPath then
        return
      end
      skullList[#skullList + 1] = display.newImage(deathAnimations.sheet, skullPath)
      skullList[#skullList].xScale = 0.5
      skullList[#skullList].yScale = 0.5
      physics.addBody(skullList[#skullList], {
        density = 0.6,
        friction = 1,
        radius = 10,
        bounce = 0.2,
        filter = powerUpFilter
      })
      skullList[#skullList].x = player.x
      skullList[#skullList].y = player.y
      skullList[#skullList].alpha = 0
      bodyParts:insert(skullList[#skullList])
    end
  end

  N.readySkull = readySkull

  local function dropHeadShot(vx, vy)
    if not startedClean then
      local headShot = getLast(headShotList)
      if not headShot then
        return
      end
      headShot.x = player.x
      headShot.y = player.y
      headShot:setLinearVelocity(vx, vy)
      headShot.alpha = 1
      headShot:toFront()
    end
  end

  N.dropHeadShot = dropHeadShot

  local function readyHeadShot()
    if not startedClean then
      local skullPath = getDeathFrameIndex("deaths/headSingleShot")
      if not skullPath then
        return
      end
      headShotList[#headShotList + 1] = display.newImage(deathAnimations.sheet, skullPath)
      headShotList[#headShotList].xScale = 0.5
      headShotList[#headShotList].yScale = 0.5
      physics.addBody(headShotList[#headShotList], {
        density = 0.6,
        friction = 1,
        radius = 10,
        bounce = 0.2,
        filter = powerUpFilter
      })
      headShotList[#headShotList].x = player.x
      headShotList[#headShotList].y = player.y
      headShotList[#headShotList].alpha = 0
      bodyParts:insert(headShotList[#headShotList])
    end
  end

  N.readyHeadShot = readyHeadShot

  local function dropHead(vx, vy)
    if not startedClean then
      local head = getLast(headList)
      if not head then
        return
      end
      head.x = player.x
      head.y = player.y - 15
      head:setLinearVelocity(vx, vy)
      head.alpha = 1
      head:toFront()
      head:applyForce(math.random(-bpForce * 0.5, bpForce * 0.5), math.random(-bpForce * 2, -15),
        head.x, head.y)
    end
  end

  N.dropHead = dropHead

  local function readyHead()
    if not startedClean then
      local headPath = getDeathFrameIndex("deaths/headSingle")
      if not headPath then
        return
      end
      headList[#headList + 1] = display.newImage(deathAnimations.sheet, headPath)
      headList[#headList].xScale = 0.5
      headList[#headList].yScale = 0.5
      physics.addBody(headList[#headList], {
        density = 0.6,
        friction = 1,
        radius = 9,
        bounce = 0.2,
        filter = powerUpFilter
      })
      headList[#headList].x = player.x
      headList[#headList].y = player.y
      headList[#headList].alpha = 0
      bodyParts:insert(headList[#headList])
    end
  end

  N.readyHead = readyHead

  local function dropBrain(vx, vy)
    if not startedClean then
      local brain = getLast(brainList)
      if not brain then
        return
      end
      brain.x = player.x + 8
      brain.y = player.y - 15
      brain:setLinearVelocity(vx, vy)
      brain.alpha = 1
      brain:toFront()
    end
  end

  N.dropBrain = dropBrain

  local function readyBrain()
    if not startedClean then
      brainList[#brainList + 1] = display.newImage("images/monsters/powerups/sawblade/brain.png")
      brainList[#brainList].xScale = 0.5
      brainList[#brainList].yScale = 0.5
      physics.addBody(brainList[#brainList], {
        density = 0.6,
        friction = 1,
        radius = 6,
        bounce = 0.2,
        filter = powerUpFilter
      })
      brainList[#brainList].x = player.x
      brainList[#brainList].y = player.y
      brainList[#brainList].alpha = 0
      bodyParts:insert(brainList[#brainList])
    end
  end

  N.readyBrain = readyBrain
  return N
end

M.newCorpsParts = newCorpsParts
return M
