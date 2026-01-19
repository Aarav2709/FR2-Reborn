local M = {}

local function new(id, playerList)
  local trapAnimation = {1}
  trapAnimation.x = 1
  trapAnimation.y = 1
  playerList[id].createTrapAnimation()
  return trapAnimation
end

M.new = new
return M
