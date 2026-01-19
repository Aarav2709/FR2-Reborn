local M = {}
local composer = require("composer")

function M.selectRandomPowerUp(player, playerPosition, numberOfPlayers, playerList)
  local randomNumber = math.random(1, 100)
  local powerUpType = 1
  if playerPosition == numberOfPlayers then
    if 75 < randomNumber then
      powerUpType = 3
    elseif 45 < randomNumber then
      powerUpType = 7
    elseif 25 < randomNumber then
      powerUpType = 4
    elseif 15 < randomNumber then
      powerUpType = 9
    elseif 5 < randomNumber then
      powerUpType = 10
    else
      powerUpType = 5
    end
  elseif playerPosition == 1 then
    if 82 < randomNumber then
      powerUpType = 1
    elseif 64 < randomNumber then
      powerUpType = 8
    elseif 46 < randomNumber then
      powerUpType = 2
    elseif 33 < randomNumber then
      powerUpType = 9
    elseif 23 < randomNumber then
      powerUpType = 10
    elseif 10 < randomNumber then
      powerUpType = 4
    else
      powerUpType = 5
    end
  elseif 89 < randomNumber then
    powerUpType = 1
  elseif 82 < randomNumber then
    powerUpType = 10
  elseif 70 < randomNumber then
    powerUpType = 9
  elseif 60 < randomNumber then
    powerUpType = 7
  elseif 50 < randomNumber then
    powerUpType = 2
  elseif 40 < randomNumber then
    powerUpType = 8
  elseif 30 < randomNumber then
    powerUpType = 3
  elseif 20 < randomNumber then
    powerUpType = 4
  elseif 10 < randomNumber then
    powerUpType = 5
  else
    powerUpType = 6
  end
  if numberOfPlayers == 1 then
    if 87 < randomNumber then
      powerUpType = 1
    elseif 75 < randomNumber then
      powerUpType = 2
    elseif 62 < randomNumber then
      powerUpType = 3
    elseif 50 < randomNumber then
      powerUpType = 4
    elseif 38 < randomNumber then
      powerUpType = 5
    elseif 25 < randomNumber then
      powerUpType = 6
    elseif 12 < randomNumber then
      powerUpType = 7
    elseif 5 < randomNumber then
      powerUpType = 8
    else
      powerUpType = 9
    end
  end
  if composer.config.tutorial then
    powerUpType = 4
  end
  if playerPosition == #playerList then
    local shouldGiveTeleport = true
    for i = 1, #playerList do
      if not playerList[i].mainPlayer and playerList[i].x < player.x + 1200 then
        shouldGiveTeleport = false
      end
    end
    if shouldGiveTeleport then
      powerUpType = 11
    end
  end
  if composer.onboarding.isActive == true then
    powerUpType = composer.onboarding.powerBoxFunction(player.id)
  end
  return powerUpType
end

function M.convertPowerUp(powerUpType)
  if powerUpType == 1 then
    powerUpType = 51
  elseif powerUpType == 2 then
    powerUpType = 52
  elseif powerUpType == 7 then
    powerUpType = 57
  elseif powerUpType == 8 then
    powerUpType = 58
  elseif powerUpType == 9 then
    powerUpType = 59
  end
  return powerUpType
end

return M
