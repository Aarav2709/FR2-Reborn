local M = {}

function M.new(parent, baseW, baseH)
  local group = display.newGroup()
  if parent and parent.insert then
    parent:insert(group)
  end

  local function update()
    -- Do not apply extra scaling or origin offsets here. Authored UI uses the
    -- content coordinate space; full-screen backgrounds handle screenOriginX/Y.
    group.xScale = 1
    group.yScale = 1
    group.x = 0
    group.y = 0
  end

  update()
  return group, update
end

return M
