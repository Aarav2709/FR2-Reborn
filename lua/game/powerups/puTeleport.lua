local M = {}

local function new(id, playerList)
  local teleport = {1}
  teleport.x = 1
  teleport.y = 1
  local player = playerList[id]
  local startedClean = false
  
  local function findPos()
    local myPos = 1
    local newX, newY
    for i = 1, #playerList do
      if i ~= player.id and playerList[i].x > player.x then
        myPos = myPos + 1
        if not newX then
          newX = playerList[i].x
          newY = playerList[i].y
        elseif newX > playerList[i].x then
          newX = playerList[i].x
          newY = playerList[i].y
        end
      end
    end
    return myPos, newX, newY
  end
  
  local function findNewPos()
    local myPos, newX, newY = findPos()
    if myPos == 1 then
      return false
    end
    if newX and newY then
      return newX, newY
    end
    return false
  end
  
  local function init()
    if player then
      local newX, newY = findNewPos()
      if newX and newY then
        player.playTeleportPowerUp(newX, newY)
      end
    end
  end
  
  init()
  return teleport
end

M.new = new
return M
