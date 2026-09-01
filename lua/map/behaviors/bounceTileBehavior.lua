local M = {}
local composer = require("composer")
local physics = require("physics")

local function addBehavior(block)
  local displayGroup = block.displayGroup
  local imageSheet = block.animatedBlockSheet
  local tileId = block.tileId
  local frameName = ""
  local xOffset = 0
  local yOffset = 0

  if tileId == 68 then
    frameName = "small_bounce1"
    if block.animatedBlockSheetFile and not block.animatedBlockSheetFile:getFrameIndex("small_bounce1") then
      frameName = "small_shroom1"
    end
    xOffset = 0
    yOffset = -24
  elseif tileId == 69 then
    frameName = "big_bounce1"
    if block.animatedBlockSheetFile and not block.animatedBlockSheetFile:getFrameIndex("big_bounce1") then
      frameName = "big_shroom1"
    end
    xOffset = -42
    yOffset = -14
  elseif tileId == 70 then
    frameName = "big_bounce1"
    if block.animatedBlockSheetFile and not block.animatedBlockSheetFile:getFrameIndex("big_bounce1") then
      frameName = "big_shroom1"
    end
    xOffset = -42
    yOffset = -14
  end

  local frameIndex = nil
  if block.animatedBlockSheetFile and frameName ~= "" then
    frameIndex = block.animatedBlockSheetFile:getFrameIndex(frameName)
  end
  if not frameIndex then
    frameIndex = 1
  end

  local sequenceData = {
    name = "collisionAnimation",
    start = frameIndex,
    count = 4,
    time = 500,
    loopCount = 1,
    loopDirection = "bounce"
  }

  local bounceSprite = display.newSprite(imageSheet, sequenceData)
  bounceSprite.x = block.x + xOffset
  bounceSprite.y = block.y + yOffset
  bounceSprite:scale(block.scale or 1, block.scale or 1)
  displayGroup:insert(bounceSprite)

  local theme = (composer.data and composer.data.currentLevelTheme) or "forest"
  local physicsPath = "lua.map.assets.physics." .. theme .. "_special"
  local ok, physicsModule = pcall(require, physicsPath)
  if not ok or not physicsModule then
    pcall(function() physicsModule = require("lua.map.assets.physics.forest_special") end)
  end

  local bodies = nil
  if physicsModule and physicsModule.physicsData then
    local physicsSheet = physicsModule.physicsData(block.scale or 1)
    if physicsSheet and physicsSheet.get then
      local physicsKey = (frameName == "small_bounce1" and "small_shroom1") or (frameName == "big_bounce1" and "big_shroom1") or frameName
      local bodyData = physicsSheet:get(physicsKey) or physicsSheet:get(frameName)
      if bodyData then
        bodies = { bodyData }
      end
    end
  end

  if not bodies or not bodies[1] then
    bodies = { { density = 2, friction = 0, bounce = 0, shape = { -40, -10, 40, -10, 40, 10, -40, 10 } } }
  end

  local activeFilter = obstacleFilter or { categoryBits = 2, maskBits = 21 }
  for _, body in ipairs(bodies) do
    if type(body) == "table" then
      body.filter = activeFilter
      body.isSensor = false
    end
  end

  physics.addBody(bounceSprite, unpack(bodies))
  bounceSprite.bodyType = "static"
  bounceSprite.mapElement = true
  bounceSprite.bounce = true

  if composer.culler and composer.culler.addAnimatedTile then
    composer.culler.addAnimatedTile(block.x, bounceSprite)
  end
  bounceSprite.isVisible = false

  local function shouldPlay()
    if composer.isOnScreen and composer.isOnScreen(block.x, block.y) then
      return true
    end
    return true
  end

  local function play()
    if bounceSprite and shouldPlay() then
      bounceSprite.isVisible = true
      bounceSprite:setSequence("collisionAnimation")
      bounceSprite:play()
    end
  end

  local function onCollision(self, event)
    play()
  end

  local function clean()
    if bounceSprite and bounceSprite.removeSelf then
      pcall(function() bounceSprite:removeEventListener("collision", bounceSprite) end)
      bounceSprite:removeSelf()
      bounceSprite = nil
    end
  end

  block.behaviors = block.behaviors or {}
  block.behaviors.bounceTile = { clean = clean }
  bounceSprite.collision = onCollision
  bounceSprite:addEventListener("collision", bounceSprite)
end

M.addBehavior = addBehavior
return M
