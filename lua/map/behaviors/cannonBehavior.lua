local M = {}
local composer = require("composer")
local physics = require("physics")
local cannonEffectCreator = require("lua.game.effects.cannonEffect")

local function addBehavior(block)
  local displayGroup = block.displayGroup
  local imageSheet = block.animatedBlockSheet
  local startImage = "cannon1"
  local yOffset = 0
  local count = 1
  if composer.data and composer.data.currentLevelTheme == "space" then
    count = 8
  end
  local startFrame = nil
  if block.animatedBlockSheetFile and block.animatedBlockSheetFile.getFrameIndex then
    startFrame = block.animatedBlockSheetFile:getFrameIndex(startImage)
    if not startFrame then
      startFrame = block.animatedBlockSheetFile:getFrameIndex("cannon1")
      if startFrame then
        startImage = "cannon1"
      end
    end
  end
  if not startFrame then
    return
  end
  local sequenceData = {
    name = "collisionAnimation",
    start = startFrame,
    count = count,
    time = 200,
    loopCount = 1,
    loopDirection = "bounce"
  }
  local sprite = display.newSprite(imageSheet, sequenceData)
  sprite.x = block.x
  sprite.y = block.y + yOffset
  sprite:scale(block.scale, block.scale)
  displayGroup:insert(sprite)
  if composer.culler and composer.culler.addAnimatedTile then
    composer.culler.addAnimatedTile(block.x, sprite)
    sprite.isVisible = false
  end
  local currentTheme = composer.data and composer.data.currentLevelTheme
  if not currentTheme then
    currentTheme = block.theme or "forest"
  end
  local physicsPath = "lua.map.assets.physics." .. currentTheme .. "_special"
  local physicsSheet = require(physicsPath).physicsData(block.scale)
  local function getBodiesFor(key)
    local ok, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13 = pcall(physicsSheet.get, physicsSheet, key)
    if not ok then
      return nil
    end
    local candidates = {b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13}
    local output = {}
    for i = 1, #candidates do
      if candidates[i] then
        output[#output + 1] = candidates[i]
      end
    end
    return output
  end

  local bodies = getBodiesFor(startImage)
  if not bodies or #bodies == 0 then
    bodies = getBodiesFor("cannon")
  end
  if not bodies or #bodies == 0 then
    return
  end
  for i, body in ipairs(bodies) do
    body.filter = obstacleFilter
  end
  physics.addBody(sprite, unpack(bodies))
  sprite.bodyType = "static"
  sprite.isFixedRotation = true
  sprite.cannon = true
  local timeRef
  local startedClean = false
  local objectsShot = {}
  local cannonCooldown = 1000
  local cannonTimers = {}
  local cannonEffect = cannonEffectCreator.new()
  displayGroup:insert(cannonEffect)
  cannonEffect.x = block.x + 105
  cannonEffect.y = block.y - 60

  local function shouldPlay()
    if composer.isOnScreen(block.x, block.y) then
      return true
    end
    return false
  end

  local function stop()
    if sprite then
      sprite:pause()
    end
  end

  local function play()
    if sprite and shouldPlay() then
      sprite:setSequence("collisionAnimation")
      sprite:play()
    end
  end

  local function onCollision(object, startedClean)
    if objectsShot[object.id] then
      local timer = system.getTimer()
      if timer - objectsShot[object.id] < cannonCooldown then
        return
      end
    end

    local function fire()
      if object and cannonEffect and not startedClean then
        objectsShot[object.id] = system.getTimer()
        cannonEffect.playEffect()
        play()
        if object.playSound then
          object.playSound("cannon")
        end
        object.cannonFunction(block)
      end
    end

    cannonTimers[object.id] = timer.performWithDelay(10, fire)
  end

  local function clean()
    startedClean = true
    if timeRef then
      timer.cancel(timeRef)
      timeRef = nil
    end
    if cannonTimers then
      for key, value in pairs(cannonTimers) do
        if value then
          timer.cancel(value)
          value = nil
        end
      end
      cannonTimers = nil
    end
    if cannonEffect then
      cannonEffect.clean()
      cannonEffect = nil
    end
    if sprite and sprite.removeSelf then
      sprite:removeSelf()
      sprite = nil
    end
  end

  block.behaviors.cannon = {}
  block.behaviors.cannon.clean = clean
  sprite.onCollision = onCollision
end

M.addBehavior = addBehavior
return M
