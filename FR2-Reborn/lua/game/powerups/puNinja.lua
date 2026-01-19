local M = {}

local function new(id, playerToKill, playerId, playerList)
  local composer = require("composer")
  local ninja = {1}
  ninja.x = 1
  ninja.y = 1
  
  local function chopHeadOff()
    if composer.data.gameInfo.gameType == 0 then
      if playerList[id].playerId == playerId then
        for i = 1, #playerList do
          if playerList[i].ninjaMark then
            playerList[i].onCollisionPowerUp(id, 9)
          end
        end
      else
        local playerToHit = math.random(1, #playerList)
        playerList[playerToHit].onCollisionPowerUp(id, 9)
      end
    else
      if playerList[id].playerId == playerId then
        for i = 1, #playerList do
          if playerList[i].ninjaMark then
            ninja.x = i
            playerToKill = i
          end
        end
      end
      if playerToKill == 0 then
        return
      end
      if playerList[playerToKill].playerId == playerId then
        playerList[playerToKill].onCollisionPowerUp(id, 9)
      end
    end
  end
  
  chopHeadOff()
  return ninja
end

M.new = new
return M
