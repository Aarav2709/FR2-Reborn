local M = {}
local composer = require("composer")
local physics = require("physics")

local function addBehavior(block)
  local displayGroup = block.displayGroup
  local imageSheet = block.animatedBlockSheet
  local tileType = block.tileId
  local startImage = "roofThorns1"
  local yOffset = 25
  if tileType == 2 then
    startImage = "groundThorns1"
    yOffset = -25
  end
  sequenceData = {
    name = "collisionAnimation",
    start = block.animatedBlockSheetFile:getFrameIndex(startImage),
    count = 4,
    time = 350,
    loopCount = 1,
    loopDirection = "bounce"
  }
  local sprite = display.newSprite(imageSheet, sequenceData)
  sprite.x = block.x
  sprite.y = block.y + yOffset
  sprite:scale(block.scale, block.scale)
  displayGroup:insert(sprite)
  local physicsPath = "lua.map.assets.physics.forest_special"
  local physicsSheet = require(physicsPath).physicsData(block.scale)
  local bodies = {
    physicsSheet:get(startImage)
  }
  for i, body in ipairs(bodies) do
    body.filter = obstacleFilter
    body.isSensor = true
  end
  physics.addBody(sprite, unpack(bodies))
  sprite.bodyType = "static"
  sprite.mapElement = true
  sprite.slow = true
  
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
  
  local function onCollision()
    play()
  end
  
  local function clean()
    if sprite and sprite.removeSelf then
      sprite:removeSelf()
      sprite = nil
    end
  end
  
  block.behaviors.thorn = {}
  block.behaviors.thorn.clean = clean
  sprite.onCollision = onCollision
end

M.addBehavior = addBehavior
return M
