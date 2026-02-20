local M = {}

function M.new(parent, baseW, baseH)
  local group = display.newGroup()
  if parent and parent.insert then
    parent:insert(group)
  end

  local function update()
    -- Do not apply extra scaling here. Solar2D already scales content
    -- according to config.lua. Keep a simple container aligned to the
    -- content area's origin for stable positioning across devices.
    local left = display.screenOriginX or 0
    local top = display.screenOriginY or 0
    group.xScale = 1
    group.yScale = 1
    group.x = left
    group.y = top
  end

  update()
  return group, update
end

return M
