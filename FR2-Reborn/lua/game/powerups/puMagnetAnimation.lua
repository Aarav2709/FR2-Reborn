local M = {}

local function new(id, playerList)
  local magnetAnimation = {1}
  magnetAnimation.x = 1
  magnetAnimation.y = 1
  playerList[id].createMagnetAnimation()
  return magnetAnimation
end

M.new = new
return M
