-- Flat blade trap (tropical): a sawblade spinning out of the ground. Touching it
-- kills the runner and throws the body upwards.
local composer = require("composer")
local util = require("lua.map.behaviors.behaviorUtil")

local M = {}

local SAW_FRAME = "1201"
local SAW_OFFSET_Y = 20

function M.addBehavior(block)
  local baseFrame = util.frameIndex(block.animatedBlockSheetFile, "bladeTrap")
  if not baseFrame then
    return
  end
  local group = display.newGroup()
  block.displayGroup:insert(group)

  local sawFrame = util.frameIndex(composer.powerUpImageSheetInfo, SAW_FRAME)
  local saw
  if sawFrame and composer.powerUpImageSheet then
    saw = display.newImage(group, composer.powerUpImageSheet, sawFrame)
    saw.xScale = 0.6
    saw.yScale = 0.6
    saw.x = block.x
    saw.y = block.y + SAW_OFFSET_Y
  end

  local trap = display.newImage(group, block.animatedBlockSheet, baseFrame)
  trap:scale(block.scale, block.scale)
  trap.x = block.x
  trap.y = block.y

  local fixtures = util.getBodies(block, "bladeTrap")
  if fixtures then
    util.addStaticBody(trap, fixtures, true)
  end
  trap.flatBladeTrap = true
  trap.mapElement = true
  util.registerAnimatedTile(block, group)

  local stopped = false
  local frameClock = util.newFrameClock()
  local function rotate(event)
    local steps = frameClock(event)
    if not stopped and saw and group.isVisible then
      saw:rotate(30 * steps)
    end
  end

  local function clean()
    stopped = true
    Runtime:removeEventListener("enterFrame", rotate)
    util.removeObject(group)
    group, saw, trap = nil, nil, nil
  end

  block.behaviors.bladeTrap = { clean = clean }
  Runtime:addEventListener("enterFrame", rotate)
end

return M
