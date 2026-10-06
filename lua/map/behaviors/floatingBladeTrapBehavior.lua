-- floating blade trap (tropical)
local composer = require("composer")
local util = require("lua.map.behaviors.behaviorUtil")

local M = {}

local SAW_FRAME = "1201"

function M.addBehavior(block)
  local baseFrame = util.frameIndex(block.animatedBlockSheetFile, "floatingBladeTrap")
  if not baseFrame then
    return
  end
  local group = display.newGroup()
  block.displayGroup:insert(group)

  local sawFrame = util.frameIndex(composer.powerUpImageSheetInfo, SAW_FRAME)
  local saw
  if sawFrame and composer.powerUpImageSheet then
    saw = display.newImage(group, composer.powerUpImageSheet, sawFrame)
    saw.xScale = 0.7
    saw.yScale = 0.7
    saw.x = block.x
    saw.y = block.y
  end

  local trap = display.newImage(group, block.animatedBlockSheet, baseFrame)
  trap:scale(block.scale, block.scale)
  trap.x = block.x
  trap.y = block.y

  local fixtures = util.getBodies(block, "floatingBladeTrap")
  if fixtures then
    util.addStaticBody(trap, fixtures, true)
  end
  trap.floatingBladeTrap = true
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

  block.behaviors.floatingBladeTrap = { clean = clean }
  Runtime:addEventListener("enterFrame", rotate)
end

return M
