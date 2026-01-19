local M = {}

local function new(id, playerList)
  local speed = {1}
  speed.x = 1
  speed.y = 1
  local speedDuration = 4000
  local player = playerList[id]
  local startedClean = false
  local cleanTimer
  
  local function removeObject(event, fromPlayer)
    if startedClean or player == nil then
      return
    end
    startedClean = true
    if cleanTimer then
      timer.cancel(cleanTimer)
      cleanTimer = nil
    end
    if not fromPlayer then
      player.stopPowerUpSpeed(true)
    end
    player.booleanStates.speedActive = false
  end
  
  local function init()
    if player then
      player.speedPowerUp()
      player.booleanStates.speedActive = true
      player.powerUpLinks.speed = speed
    end
  end
  
  init()
  cleanTimer = timer.performWithDelay(speedDuration, removeObject, 1)
  speed.removeObject = removeObject
  return speed
end

M.new = new
return M
