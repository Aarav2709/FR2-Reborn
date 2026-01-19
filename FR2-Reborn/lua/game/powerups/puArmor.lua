local M = {}

local function new(id, playerList)
  local armor = {1}
  armor.x = 1
  armor.y = 1
  local player = playerList[id]
  local startedClean = false
  playerList[id].armorPowerUp()
  
  local function removeObject()
    if startedClean or player == nil then
      return
    end
    startedClean = true
    player.booleanStates.armorActive = false
  end
  
  local function init()
    if player then
      player.armorPowerUp()
      player.booleanStates.armorActive = true
      player.powerUpLinks.armor = armor
    end
  end
  
  init()
  armor.removeObject = removeObject
  return armor
end

M.new = new
return M
