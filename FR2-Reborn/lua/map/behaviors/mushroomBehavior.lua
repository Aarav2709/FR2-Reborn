local M = {}
local composer = require("composer")
local physics = require("physics")

local function addBehavior(block)
  local displayGroup = block.displayGroup
  local imageSheet = block.animatedBlockSheet
  local shroomType = block.tileId
  local isReversed = block.image.xScale < 0
  local startImage = ""
  local physicsRadius = 1
  local xOffset = 0
  local yOffset = 0
  if shroomType == 68 then
    startImage = "small_shroom1"
    xOffset = 0
    yOffset = -24
  elseif shroomType == 69 then
    if not isReversed then
      return
    end
    startImage = "big_shroom1"
    xOffset = -42
    yOffset = -14
  elseif shroomType == 70 then
    if isReversed then
      return
    end
    startImage = "big_shroom1"
    xOffset = -42
    yOffset = -14
  end
  sequenceData = {
    name = "collisionAnimation",
    start = block.animatedBlockSheetFile:getFrameIndex(startImage),
    count = 4,
    time = 500,
    loopCount = 1,
    loopDirection = "bounce"
  }
  local mushroomSprite = display.newSprite(imageSheet, sequenceData)
  mushroomSprite.x = block.x + xOffset
  mushroomSprite.y = block.y + yOffset
  mushroomSprite:scale(block.scale, block.scale)
  displayGroup:insert(mushroomSprite)
  local physicsPath = "lua.map.assets.physics.forest_special"
  local physicsSheet = require(physicsPath).physicsData(block.scale)
  local bodies = {
    physicsSheet:get(startImage)
  }
  for i, body in ipairs(bodies) do
    body.filter = obstacleFilter
  end
  physics.addBody(mushroomSprite, unpack(bodies))
  mushroomSprite.bodyType = "static"
  mushroomSprite.mapElement = true
  mushroomSprite.bounce = true
  
  local function shouldPlay()
    if composer.isOnScreen(block.x, block.y) then
      return true
    end
    return false
  end
  
  local function stop()
    if mushroomSprite then
      mushroomSprite:pause()
    end
  end
  
  local function play()
    if mushroomSprite and shouldPlay() then
      mushroomSprite:setSequence("collisionAnimation")
      mushroomSprite:play()
    end
  end
  
  local function onCollision()
    play()
  end
  
  local function clean()
    if mushroomSprite and mushroomSprite.removeSelf then
      mushroomSprite:removeSelf()
      mushroomSprite = nil
    end
  end
  
  block.behaviors.mushroom = {}
  block.behaviors.mushroom.clean = clean
  mushroomSprite.onCollision = onCollision
end

M.addBehavior = addBehavior
return M
