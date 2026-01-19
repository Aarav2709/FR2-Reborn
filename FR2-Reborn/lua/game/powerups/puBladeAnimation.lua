local M = {}

local function new(id, playerList)
  local bladeAnimation = {1}
  bladeAnimation.x = 1
  bladeAnimation.y = 1
  playerList[id].createBladeAnimation()
  return bladeAnimation
end

M.new = new
return M
