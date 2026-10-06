-- icicles (winter)
local util = require("lua.map.behaviors.behaviorUtil")

local M = {}

local BASE_OFFSET_Y = 50

function M.addBehavior(block)
  local size = "large"
  if block.tileId == 2 then
    size = "small"
  end
  local sheetInfo = block.animatedBlockSheetFile
  local icicleFrame = util.frameIndex(sheetInfo, size .. "Iceicle")
  if not icicleFrame then
    return
  end
  local group = display.newGroup()
  block.displayGroup:insert(group)

  local icicle = display.newImage(group, block.animatedBlockSheet, icicleFrame)
  icicle:scale(block.scale, block.scale)
  icicle.x = block.x
  icicle.y = block.y

  local baseFrame = util.frameIndex(sheetInfo, size .. "Base")
  if baseFrame then
    local base = display.newImage(group, block.animatedBlockSheet, baseFrame)
    base.xScale = 0.5
    base.yScale = 0.5
    base.x = block.x
    base.y = block.y - BASE_OFFSET_Y
  end

  local fixtures = util.getBodies(block, size .. "Iceicle")
  if fixtures then
    util.addStaticBody(icicle, fixtures, true)
  end
  icicle.floatingBladeTrap = true
  icicle.mapElement = true

  local cleaned = false
  local function clean()
    if cleaned then
      return
    end
    cleaned = true
    util.removeObject(group)
    group, icicle = nil, nil
  end

  block.behaviors.iceicle = { clean = clean }
end

return M
