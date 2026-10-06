local M = {}

local function isRival(playerList, id, index)
  local composer = require("composer")
  local other = playerList[index]
  local caster = playerList[id]
  if index == id or not other or not other.onCollisionPowerUp then
    return false
  end
  if other.getPlayerGoalTime and other.getPlayerGoalTime() > 0 then
    return false
  end
  if composer.data.gameInfo.teamMode and caster and caster.team ~= nil and other.team == caster.team then
    return false
  end
  return true
end

local function randomRival(playerList, id)
  local rivals = {}
  for i = 1, #playerList do
    if isRival(playerList, id, i) then
      rivals[#rivals + 1] = i
    end
  end
  if #rivals > 0 then
    return rivals[math.random(1, #rivals)]
  end
end

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
        local target = tonumber(playerToKill)
        if not (target and isRival(playerList, id, target)) then
          target = randomRival(playerList, id)
        end
        if target then
          playerList[target].onCollisionPowerUp(id, 9)
        end
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
