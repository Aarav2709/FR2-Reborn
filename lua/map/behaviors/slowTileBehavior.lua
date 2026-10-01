-- Slow tiles (forest thorns): a sensor that halves the runner's speed.
-- Special tile 1 hangs from the roof, special tile 2 lies on the ground.
local util = require("lua.map.behaviors.behaviorUtil")

local M = {}

function M.addBehavior(block)
  local frameName = "roofSlow1"
  local yOffset = 25
  if block.tileId == 2 then
    frameName = "groundSlow1"
    yOffset = -25
  end
  local startFrame = util.frameIndex(block.animatedBlockSheetFile, frameName)
  if not startFrame then
    return
  end
  local sprite = display.newSprite(block.displayGroup, block.animatedBlockSheet, {
    name = "collisionAnimation",
    start = startFrame,
    count = 4,
    time = 350,
    loopCount = 1,
    loopDirection = "bounce"
  })
  sprite.x = block.x
  sprite.y = block.y + yOffset
  sprite:scale(block.scale, block.scale)
  util.registerAnimatedTile(block, sprite)

  local fixtures = util.getBodies(block, frameName)
  if fixtures then
    util.addStaticBody(sprite, fixtures, true)
  end
  sprite.mapElement = true
  sprite.slow = true

  local function play()
    if sprite and util.isOnScreen(block.x, block.y) then
      sprite:setSequence("collisionAnimation")
      sprite:play()
    end
  end

  local function clean()
    util.removeObject(sprite)
    sprite = nil
  end

  block.behaviors.slowTile = { clean = clean }
  sprite.onCollision = play
end

return M
