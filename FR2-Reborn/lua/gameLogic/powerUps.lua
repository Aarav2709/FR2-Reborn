local powerUps = {}
local functionList = {}
local basicBlade = require("lua.game.powerups.puBlade")
local basicBladeAnimation = require("lua.game.powerups.puBladeAnimation")
local basicTrap = require("lua.game.powerups.puTrap")
local basicTrapAnimation = require("lua.game.powerups.puTrapAnimation")
local basicLightning = require("lua.game.powerups.puLightning")
local basicSpeed = require("lua.game.powerups.puSpeed")
local basicShield = require("lua.game.powerups.puShield")
local basicArmor = require("lua.game.powerups.puArmor")
local basicMagnet = require("lua.game.powerups.puMagnet")
local basicJump = require("lua.game.powerups.puJump")
local basicMagnetAnimation = require("lua.game.powerups.puMagnetAnimation")
local basicBounceTrap = require("lua.game.powerups.puBounceTrap")
local basicBounceTrapAnimation = require("lua.game.powerups.puBounceTrapAnimation")
local basicNinja = require("lua.game.powerups.puNinja")
local basicHuntersMarkAnimation = require("lua.game.powerups.puHuntersMarkAnimation")
local basicRocket = require("lua.game.powerups.puRocket")
local basicTeleport = require("lua.game.powerups.puTeleport")
local updateTimer, playSound

local function usePowerUp(puType, playerId, myPlayerId, player, x, y, displayGroup, screenGroup, playerList)
  local index = #powerUps + 1
  local newPowerUp
  if playerList and displayGroup and screenGroup and puType then
  else
    return 1, 1
  end
  if puType == 1 then
    newPowerUp = basicBlade.new(playerId, player, x, y, displayGroup, playerList)
    powerUps[index] = newPowerUp
    playerList[playerId].playSound("blade_activate")
  elseif puType == 2 then
    newPowerUp = basicTrap.new(playerId, player, x, y, displayGroup, playerList)
    powerUps[index] = newPowerUp
    playerList[playerId].playSound("trap_activate")
  elseif puType == 3 then
    newPowerUp = basicLightning.new(playerId, myPlayerId, playerList)
    powerUps[index] = newPowerUp
    playSound("lightning_activate")
  elseif puType == 4 then
    newPowerUp = basicSpeed.new(playerId, playerList)
    playerList[playerId].playSound("speed_activate")
  elseif puType == 5 then
    newPowerUp = basicShield.new(playerId, playerList)
    playerList[playerId].playSound("invul_activate")
  elseif puType == 6 then
    newPowerUp = basicArmor.new(playerId, playerList)
    playerList[playerId].playSound("armor_activate")
  elseif puType == 7 then
    newPowerUp = basicMagnet.new(playerId, myPlayerId, playerList)
    playerList[playerId].playSound("magnet_activate")
  elseif puType == 8 then
    newPowerUp = basicBounceTrap.new(playerId, player, x, y, displayGroup, playerList)
    powerUps[index] = newPowerUp
    playerList[playerId].playSound("bounce_activate")
  elseif puType == 9 then
    newPowerUp = basicNinja.new(playerId, x, myPlayerId, playerList)
    powerUps[index] = newPowerUp
    playerList[playerId].playSound("hunter_activate")
  elseif puType == 10 then
    newPowerUp = basicRocket.new(playerId, playerList, displayGroup)
    powerUps[index] = newPowerUp
    playerList[playerId].playSound("rocket_activate")
  elseif puType == 11 then
    newPowerUp = basicTeleport.new(playerId, playerList)
    powerUps[index] = newPowerUp
    playerList[playerId].playSound("teleport_activate")
  end
  if puType == 51 then
    newPowerUp = basicBladeAnimation.new(playerId, playerList)
  elseif puType == 52 then
    newPowerUp = basicTrapAnimation.new(playerId, playerList)
  elseif puType == 57 then
    newPowerUp = basicMagnetAnimation.new(playerId, playerList)
  elseif puType == 58 then
    newPowerUp = basicBounceTrapAnimation.new(playerId, playerList)
  elseif puType == 59 then
    newPowerUp = basicHuntersMarkAnimation.new(playerId, playerList)
  end
  if newPowerUp == nil then
    return 1, 1
  end
  return newPowerUp.x, newPowerUp.y
end

functionList.usePowerUp = usePowerUp

local function getPowerUps()
  return powerUps
end

functionList.getPowerUps = getPowerUps

local function updatePowerUps()
  for i = 1, #powerUps do
    if powerUps[i] and powerUps[i].update then
      powerUps[i].update()
    end
  end
end

local function clean()
  if updateTimer then
    timer.cancel(updateTimer)
    updateTimer = nil
  end
  for i = 1, #powerUps do
    if powerUps[i] then
      if powerUps[i].removeObject then
        powerUps[i].removeObject()
        powerUps[i] = nil
      else
        powerUps[i] = nil
      end
    end
  end
end

functionList.clean = clean

local function init()
  powerUps = {}
  updateTimer = timer.performWithDelay(100, updatePowerUps, 0)
end

functionList.init = init

local function addPlaySoundFunction(playSoundFunction)
  playSound = playSoundFunction
end

functionList.addPlaySoundFunction = addPlaySoundFunction
return functionList
