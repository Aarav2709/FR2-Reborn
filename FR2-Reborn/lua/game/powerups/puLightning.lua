local M = {}
local composer = require("composer")

local function new(id, playerId, playerList)
  local cloud = {1}
  cloud.x = 1
  cloud.y = 1
  
  local function createLightning()
    for i = 1, #playerList do
      if playerList[i].id ~= id then
        if playerList[i].x == nil then
          print("createLightning race condition")
          return
        end
        if playerList[i].mainPlayer and playerList[i].x then
          if playerList[i].x + 480 > playerList[id].x then
            playerList[i].onCollisionPowerUp(id, 3)
          end
        elseif composer.data.gameInfo.gameType == 0 and playerList[i].x + 480 > playerList[id].x and playerList[i].x then
          playerList[i].onCollisionPowerUp(id, 3)
        end
      end
    end
  end
  
  local function showCloud()
    for i = 1, #playerList do
      if playerList[i].mainPlayer then
        playerList[i].showCloud()
      end
    end
  end
  
  showCloud()
  timer.performWithDelay(500, createLightning, 1)
  return cloud
end

M.new = new
return M
