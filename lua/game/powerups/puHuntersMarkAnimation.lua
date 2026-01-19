local M = {}

local function new(id, playerList)
  local huntersMarkAnimation = {1}
  huntersMarkAnimation.x = 1
  huntersMarkAnimation.y = 1
  playerList[id].createHuntersMarkAnimation()
  return huntersMarkAnimation
end

M.new = new
return M
