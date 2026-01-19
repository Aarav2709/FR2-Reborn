local M = {}
local composer = require("composer")

local function new(id, playerId, playerList)
  local temp = {1}
  temp.x = 1
  temp.y = 1
  
  local function createMagnetEffect()
    for i = 1, #playerList do
      if playerList[i].id ~= id then
        if playerList[i].playerId == playerId then
          playerList[i].onCollisionPowerUp(id, 7)
        elseif composer.data.gameInfo.gameType == 0 then
          playerList[i].onCollisionPowerUp(id, 7)
        end
      end
    end
  end
  
  createMagnetEffect()
  return temp
end

M.new = new
return M
