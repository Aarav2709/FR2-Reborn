-- boost pads
local util = require("lua.map.behaviors.behaviorUtil")

local M = {}

function M.addBehavior(block)
  if not block.image then
    return
  end
  local startImage = "speedFlat1"
  local yOffset = -1
  if block.tileId == 89 then
    startImage = "speedHill1"
    yOffset = 32
  end
  local startFrame = util.frameIndex(block.animatedBlockSheetFile, startImage)
  if not startFrame then
    return
  end
  local sprite = display.newSprite(block.displayGroup, block.animatedBlockSheet, {
    name = "idleAnimation",
    start = startFrame,
    count = 2,
    time = 200,
    loopCount = 0,
    loopDirection = "forward"
  })
  sprite.x = block.x
  sprite.y = block.y + yOffset
  local direction = block.image.xScale < 0 and -1 or 1
  sprite:scale(block.scale * direction, block.scale)

  local isPlaying = false
  local function update()
    if not sprite then
      return
    end
    if util.isOnScreen(block.x, block.y) then
      if not isPlaying then
        sprite:setSequence("idleAnimation")
        sprite:play()
        isPlaying = true
      end
    elseif isPlaying then
      sprite:pause()
      isPlaying = false
    end
  end

  local animationTimer = timer.performWithDelay(1000, update, 0)
  update()

  local function clean()
    if animationTimer then
      timer.cancel(animationTimer)
      animationTimer = nil
    end
    util.removeObject(sprite)
    sprite = nil
  end

  block.behaviors.speedHamster = { clean = clean }
end

return M
