local M = {}

local function new(playerId, playerList)
  local trapAnimation = {1}
  trapAnimation.x = 1
  trapAnimation.y = 1
  playerList[playerId].createBounceTrapAnimation()
  return trapAnimation
end

M.new = new
return M
