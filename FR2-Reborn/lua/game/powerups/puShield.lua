local M = {}

local function new(id, playerList)
  local shield = {1}
  shield.x = 1
  shield.y = 1
  local shieldDuration = 4000
  local player = playerList[id]
  local startedClean = false
  
  local function init()
    if player then
      player.shieldPowerUp()
      player.booleanStates.shieldActive = true
      player.powerUpLinks.shield = shield
    end
  end
  
  init()
  return shield
end

M.new = new
return M
