local M = {}
local composer = require("composer")
local physics = require("physics")

local function addBehavior(block)
  local displayGroup = block.displayGroup
  local imageSheet = block.animatedBlockSheet
  local tileType = block.tileId
  local isReversed = block.image.xScale < 0
  local animationTimer
  local isPlaying = false
  local startImage = "speedFlat1"
  local xOffset = 0
  local yOffset = -1
  if tileType == 89 then
    startImage = "speedHill1"
    yOffset = 32
  end
  sequenceData = {
    name = "idleAnimation",
    start = block.animatedBlockSheetFile:getFrameIndex(startImage),
    count = 2,
    time = 200,
    loopCount = 0,
    loopDirection = "forward"
  }
  local sprite = display.newSprite(imageSheet, sequenceData)
  sprite.x = block.x + xOffset
  sprite.y = block.y + yOffset
  sprite:scale(block.scale * (block.image.xScale / math.abs(block.image.xScale)), block.scale)
  displayGroup:insert(sprite)
  
  local function shouldPlay()
    if composer.isOnScreen(block.x, block.y) then
      return true
    end
    return false
  end
  
  local function stop()
    if sprite then
      sprite:pause()
      isPlaying = false
    end
  end
  
  local function play()
    if sprite and shouldPlay() then
      if not isPlaying then
        sprite:setSequence("idleAnimation")
        sprite:play()
        isPlaying = true
      end
    else
      stop()
    end
  end
  
  local function clean()
    if animationTimer then
      timer.cancel(animationTimer)
      animationTimer = nil
    end
    if sprite and sprite.removeSelf then
      sprite:removeSelf()
      sprite = nil
    end
  end
  
  animationTimer = timer.performWithDelay(1000, play, 0)
  play()
  block.behaviors.speedHamster = {}
  block.behaviors.speedHamster.clean = clean
end

M.addBehavior = addBehavior
return M
