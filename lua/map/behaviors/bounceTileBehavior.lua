-- Bounce pads (mushrooms / springs). Tiles 68 (small pad), 69/70 (the two halves of
-- a big pad; only one half spawns the sprite). The sprite carries the bouncy body.
local util = require("lua.map.behaviors.behaviorUtil")

local M = {}

-- Physics bodies were renamed in some themes' data; accept both names.
local PHYSICS_ALIASES = {
  small_bounce1 = { "small_bounce1", "small_shroom1" },
  big_bounce1 = { "big_bounce1", "big_shroom1" },
}

function M.addBehavior(block)
  local tileId = block.tileId
  local isFlipped = block.image ~= nil and block.image.xScale < 0
  local frameName, xOffset, yOffset
  if tileId == 68 then
    frameName, xOffset, yOffset = "small_bounce1", 0, -24
  elseif tileId == 69 then
    if not isFlipped then
      return
    end
    frameName, xOffset, yOffset = "big_bounce1", -42, -14
  elseif tileId == 70 then
    if isFlipped then
      return
    end
    frameName, xOffset, yOffset = "big_bounce1", -42, -14
  else
    return
  end

  local startFrame = util.frameIndex(block.animatedBlockSheetFile, frameName)
  if not startFrame then
    -- No pad animation in this theme: make the tile itself bouncy instead.
    if block.image then
      block.image.bounce = true
    end
    return
  end
  local theme = util.getTheme(block)
  local frameCount, time, scale = 4, 350, block.scale
  if theme == "space" then
    frameCount, time, yOffset = 8, 200, -45
  elseif theme == "tropical" then
    frameCount, scale = 6, block.scale * 0.75
    yOffset = yOffset + 6
  end
  local frames = {}
  for i = 1, frameCount do
    frames[i] = startFrame + i - 1
  end
  frames[#frames + 1] = startFrame

  local sprite = display.newSprite(block.displayGroup, block.animatedBlockSheet, {
    name = "collisionAnimation",
    frames = frames,
    time = time,
    loopCount = 1,
    loopDirection = "forward"
  })
  sprite.x = block.x + xOffset
  sprite.y = block.y + yOffset
  sprite:scale(scale, scale)

  local names = PHYSICS_ALIASES[frameName]
  local fixtures = util.getBodies(block, names[1], names[2])
  if fixtures then
    util.addStaticBody(sprite, fixtures, false)
    sprite.mapElement = true
    sprite.bounce = true
  elseif block.image then
    block.image.bounce = true
  end
  util.registerAnimatedTile(block, sprite)

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

  block.behaviors.bounceTile = { clean = clean }
  sprite.onCollision = play
end

return M
