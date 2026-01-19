local M = {}
local composer = require("composer")
local physics = require("physics")
local cannonEffectCreator = require("lua.game.effects.cannonEffect")

local function addBehavior(block)
  local displayGroup = block.displayGroup
  local imageSheet = block.animatedBlockSheet
  local startImage = "cannon"
  local yOffset = 0
  sequenceData = {
    name = "collisionAnimation",
    start = block.animatedBlockSheetFile:getFrameIndex(startImage),
    count = 1,
    time = 350,
    loopCount = 1,
    loopDirection = "bounce"
  }
  local sprite = display.newSprite(imageSheet, sequenceData)
  sprite.x = block.x
  sprite.y = block.y + yOffset
  sprite:scale(block.scale, block.scale)
  displayGroup:insert(sprite)
  local physicsPath = "lua.map.assets.physics.town_special"
  local physicsSheet = require(physicsPath).physicsData(block.scale)
  local bodies = {
    physicsSheet:get(startImage)
  }
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
