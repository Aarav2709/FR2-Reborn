local M = {}
local configInput
local jsonParser = require("lua.modules.jsonParser")
local composer = require("composer")

function M.readFromFile()
  configInput = jsonParser.getJsonFromFile("config/config.json")
end

function M.isFileCorrupt()
  if configInput == nil then
    return true
  end
  if not configInput.numberOfMaps then
    return true
  end
  return false
end

local function reloadConfigIfNil()
  if M.isFileCorrupt() then
    print("WARNING: Reloading Config File.")
    composer.analytics.newEvent("design", {
      event_id = "config:fileCorrupt",
      area = composer.config.fullVersion
    })
    M.readFromFile()
  end
end

function M.getNumberOfMaps()
  reloadConfigIfNil()
  if configInput then
    return tonumber(configInput.numberOfMaps)
  else
    return 0
  end
end

function M.getNumberOfZones()
  reloadConfigIfNil()
  if configInput.adventure.numberOfZones then
    return tonumber(configInput.adventure.numberOfZones)
  else
    return 1
  end
end

function M.getZoneThemeString(zoneId)
  reloadConfigIfNil()
  if not zoneId then
    return
  end
  local theme = configInput.adventure.themes[zoneId]
  if theme then
    return theme
  else
    print("Warning: No theme for zoneId, ", zoneId)
    return ""
  end
end

function M.getVersion()
  reloadConfigIfNil()
  return configInput.version
end

function M.getVelocityIterations()
  reloadConfigIfNil()
  return configInput.physicsDefinitions.setup.velocityIterations
end

function M.getPositionIterations()
  reloadConfigIfNil()
  return configInput.physicsDefinitions.setup.positionIterations
end

function M.getScale()
  reloadConfigIfNil()
  return configInput.physicsDefinitions.setup.scale
end

function M.getGravity()
  reloadConfigIfNil()
  return configInput.physicsDefinitions.setup.gravity
end

function M.getWaterUpScale()
  reloadConfigIfNil()
  return configInput.physicsDefinitions.setup.gravityWaterUpScale
end

function M.getWaterDownScale()
  reloadConfigIfNil()
  return configInput.physicsDefinitions.setup.gravityWaterDownScale
end

function M.getWaterSpeedTransitionFactor()
  reloadConfigIfNil()
  return configInput.physicsDefinitions.setup.waterSpeedTransitionFactor
end

function M.getTerminalVelocity()
  reloadConfigIfNil()
  return configInput.physicsDefinitions.setup.terminalVelocity
end

function M.getBlockSizeX()
  reloadConfigIfNil()
  return configInput.physicsDefinitions.setup.blockSizeX
end

function M.getBlockSizeY()
  reloadConfigIfNil()
  return configInput.physicsDefinitions.setup.blockSizeY
end

function M.getPlayerBodyOptions()
  reloadConfigIfNil()
  return configInput.physicsDefinitions.player.playerBody
end

function M.getAcceleration(phase)
  reloadConfigIfNil()
  return configInput.gameDefinitions.acceleration[phase]
end

function M.getAccelerationSteps()
  reloadConfigIfNil()
  local count = 0
  for key, value in pairs(configInput.gameDefinitions.acceleration) do
    count = count + 1
  end
  return count
end

function M.getDeadSlowFactor()
  reloadConfigIfNil()
  return configInput.gameDefinitions.deadSlowFactor
end

function M.getMaxSpeedDeaccelerationFactor()
  reloadConfigIfNil()
  return configInput.gameDefinitions.maxSpeedDeaccelerationFactor
end

function M.getAirBuoyancy()
  reloadConfigIfNil()
  return configInput.gameDefinitions.airBuoyancy
end

function M.getWaterBuoyancy()
  reloadConfigIfNil()
  return configInput.gameDefinitions.waterBuoyancy
end

function M.getMaxSpeed()
  reloadConfigIfNil()
  return configInput.gameDefinitions.maxSpeed
end

function M.yAccelerationCap()
  reloadConfigIfNil()
  return configInput.gameDefinitions.yAccelerationCap
end

function M.getMaxSpeedSlopeBonus()
  reloadConfigIfNil()
  return configInput.gameDefinitions.maxSpeedSlope
end

function M.getMaxSpeedCartBonus()
  reloadConfigIfNil()
  return configInput.gameDefinitions.maxSpeedCart
end

function M.getCartAccelerationBonus()
  reloadConfigIfNil()
  return configInput.gameDefinitions.cartAcceleration
end

function M.getMinecartJumpSpeed()
  reloadConfigIfNil()
  return configInput.gameDefinitions.minecartJumpSpeed
end

function M.getRespawnSpeed()
  reloadConfigIfNil()
  return configInput.gameDefinitions.respawnSpeed
end

function M.getRespawnTime()
  reloadConfigIfNil()
  return configInput.gameDefinitions.respawnTime
end

function M.getRegenTime()
  reloadConfigIfNil()
  return configInput.gameDefinitions.regenTime
end

function M.getContdownTime()
  reloadConfigIfNil()
  return configInput.gameDefinitions.contdownTime
end

function M.getStartingHP()
  reloadConfigIfNil()
  return configInput.gameDefinitions.startingHP
end

function M.getMaxHP()
  reloadConfigIfNil()
  return configInput.gameDefinitions.maxHP
end

function M.getPowerUpSelfHitDelay()
  reloadConfigIfNil()
  return configInput.gameDefinitions.selfHitDelay
end

function M.getNumberOfPlayers()
  reloadConfigIfNil()
  return configInput.gameDefinitions.numberOfPlayers
end

function M.getNumberOfPassives()
  reloadConfigIfNil()
  return configInput.gameDefinitions.numberOfPassives
end

function M.getPlayerGlideFactor()
  reloadConfigIfNil()
  return configInput.passiveAbilities.glide
end

function M.getJumpCheckDelay()
  reloadConfigIfNil()
  return configInput.gameDefinitions.jumpCheckDelay
end

function M.getJumpDelay()
  reloadConfigIfNil()
  return configInput.gameDefinitions.jumpDelay
end

function M.getJumpPenalty()
  reloadConfigIfNil()
  return configInput.gameDefinitions.jumpPenelty
end

function M.getJumpAccelerationPenalty()
  reloadConfigIfNil()
  return configInput.gameDefinitions.jumpAccelerationPenalty
end

function M.getPowerUpDelay()
  reloadConfigIfNil()
  return configInput.gameDefinitions.powerUpDelay
end

function M.getNumberOfJumps()
  reloadConfigIfNil()
  return configInput.gameDefinitions.numberOfJumps
end

function M.getJumpSpeed()
  reloadConfigIfNil()
  return configInput.gameDefinitions.jumpSpeed
end

function M.getInvulnerabilityTime()
  reloadConfigIfNil()
  return configInput.gameDefinitions.invulnerabilityTime
end

function M.getPowerUpName(id)
  reloadConfigIfNil()
  for key, value in pairs(configInput.powerUps) do
    if tonumber(value.id) == tonumber(id) then
      return key
    end
  end
  return "none"
end

function M.isDinoCorpTrap(id)
  reloadConfigIfNil()
  for key, value in pairs(configInput.powerUps) do
    if value.id == id and value.dinoCorpTrap then
      return true
    end
  end
  return false
end

function M.getPowerUpDamage(id)
  reloadConfigIfNil()
  local damage = 0
  for key, value in pairs(configInput.powerUps) do
    if value.id == id and value.damage then
      damage = value.damage
    end
  end
  return damage
end

function M.getPowerUpChance(id)
  reloadConfigIfNil()
  local chance = {}
  for key, value in pairs(configInput.powerUps) do
    if value.id == id and value.chance then
      chance = value.chance
    end
  end
  return chance
end

function M.getPowerUpNoneId()
  reloadConfigIfNil()
  return configInput.powerUps.none.id
end

function M.getLaserData()
  reloadConfigIfNil()
  return configInput.powerUps.laser
end

function M.getLaserId()
  reloadConfigIfNil()
  return configInput.powerUps.laser.id
end

function M.getWindData()
  reloadConfigIfNil()
  return configInput.powerUps.wind
end

function M.getWindId()
  reloadConfigIfNil()
  return configInput.powerUps.wind.id
end

function M.getSpeedId()
  reloadConfigIfNil()
  return configInput.powerUps.speed.id
end

function M.getSpeedMaxSpeedBonus()
  reloadConfigIfNil()
  return configInput.powerUps.speed.maxSpeedBonus
end

function M.getSpeedAccelerationBonus()
  reloadConfigIfNil()
  return configInput.powerUps.speed.accelerationBonus
end

function M.getSpeedDuration()
  reloadConfigIfNil()
  return configInput.powerUps.speed.duration
end

function M.getSpeedInitialBoost()
  reloadConfigIfNil()
  return configInput.powerUps.speed.initialBoost
end

function M.getSpeedData()
  reloadConfigIfNil()
  return configInput.powerUps.speed
end

function M.getTrapId()
  reloadConfigIfNil()
  return configInput.powerUps.trap.id
end

function M.getTrapData()
  reloadConfigIfNil()
  return configInput.powerUps.trap
end

function M.getTrapDuration()
  reloadConfigIfNil()
  return configInput.powerUps.trap.duration
end

function M.getTrapXForce()
  reloadConfigIfNil()
  return configInput.powerUps.trap.xForce
end

function M.getTrapYForce()
  reloadConfigIfNil()
  return configInput.powerUps.trap.yForce
end

function M.getTrapOptions()
  reloadConfigIfNil()
  return configInput.powerUps.trap.options
end

function M.getConfusionId()
  reloadConfigIfNil()
  return configInput.powerUps.confusion.id
end

function M.getConfusionPlayerDuration()
  reloadConfigIfNil()
  return configInput.powerUps.confusion.playerDuration
end

function M.getConfusionDuration()
  reloadConfigIfNil()
  return configInput.powerUps.confusion.duration
end

function M.getConfusionOptions()
  reloadConfigIfNil()
  return configInput.powerUps.confusion.options
end

function M.getShieldId()
  reloadConfigIfNil()
  return configInput.powerUps.shield.id
end

function M.getShieldTime()
  reloadConfigIfNil()
  return configInput.powerUps.shield.duration
end

function M.getShieldDamageRadius()
  reloadConfigIfNil()
  return configInput.powerUps.shield.damageRadius
end

function M.getShieldDamage()
  reloadConfigIfNil()
  return configInput.powerUps.shield.damage
end

function M.getTeleportId()
  reloadConfigIfNil()
  return configInput.powerUps.teleport.id
end

function M.getTeleportTrigerDistance()
  reloadConfigIfNil()
  return configInput.powerUps.teleport.trigerDistance
end

function M.getTeleportDelay()
  reloadConfigIfNil()
  return configInput.powerUps.teleport.delay
end

function M.getForestTrapData()
  reloadConfigIfNil()
  return configInput.powerUps.forestTrap
end

function M.getForestBladeData()
  reloadConfigIfNil()
  return configInput.powerUps.forestBlade
end

function M.getFireTrapData()
  reloadConfigIfNil()
  return configInput.powerUps.fireTrap
end

function M.getFireBladeData()
  reloadConfigIfNil()
  return configInput.powerUps.fireBlade
end

function M.getWaterTrapData()
  reloadConfigIfNil()
  return configInput.powerUps.waterTrap
end

function M.getWaterBladeData()
  reloadConfigIfNil()
  return configInput.powerUps.waterBlade
end

function M.getCageData()
  reloadConfigIfNil()
  return configInput.powerUps.cage
end

function M.getStealthData()
  reloadConfigIfNil()
  return configInput.powerUps.stealth
end

function M.getFakePUData()
  reloadConfigIfNil()
  return configInput.powerUps.fakePU
end

function M.getStumbleTrapData()
  reloadConfigIfNil()
  return configInput.powerUps.stumbleTrap
end

function M.getKnockUpTrapData()
  reloadConfigIfNil()
  return configInput.powerUps.knockUpTrap
end

function M.getRespawnType(id)
  reloadConfigIfNil()
  for key, value in pairs(configInput.powerUps) do
    if tonumber(value.id) == id and value.respawnType then
      return tonumber(value.respawnType)
    end
  end
  return 0
end

function M.getPassiveName(id)
  reloadConfigIfNil()
  for key, value in pairs(configInput.passiveAbilities) do
    if tonumber(value.id) == tonumber(id) then
      return key
    end
  end
  return "none"
end

function M.getPassiveData(id)
  reloadConfigIfNil()
  for key, value in pairs(configInput.passiveAbilities) do
    if tonumber(value.id) == tonumber(id) then
      return value
    end
  end
  return {}
end

function M.getNumberOfCharges(id)
  reloadConfigIfNil()
  for key, value in pairs(configInput.passiveAbilities) do
    if tonumber(value.id) == tonumber(id) then
      return value.charges
    end
  end
  return 0
end

function M.getFastLaserData()
  reloadConfigIfNil()
  return configInput.passiveAbilities.fastLaser
end

function M.getFastStealthData()
  reloadConfigIfNil()
  return configInput.passiveAbilities.fastStealth
end

function M.getDoubleTeleportData()
  reloadConfigIfNil()
  return configInput.passiveAbilities.doubleTeleport
end

function M.getLessCageTimeData()
  reloadConfigIfNil()
  return configInput.passiveAbilities.lessCageTime
end

function M.getLongShieldData()
  reloadConfigIfNil()
  return configInput.passiveAbilities.longShield
end

function M.getLongSpeedData()
  reloadConfigIfNil()
  return configInput.passiveAbilities.longSpeed
end

function M.getPassiveNoneId()
  reloadConfigIfNil()
  return configInput.passiveAbilities.none.id
end

function M.getPassiveGlideId()
  reloadConfigIfNil()
  return configInput.passiveAbilities.glide.id
end

function M.getGlideFactor()
  reloadConfigIfNil()
  return configInput.passiveAbilities.glide.glideFactor
end

function M.getIgnorePainId()
  reloadConfigIfNil()
  return configInput.passiveAbilities.ignorePain.id
end

function M.getIgnorePainRespawnTime()
  reloadConfigIfNil()
  return configInput.passiveAbilities.ignorePain.respawnTime
end

function M.getMotivationalPainId()
  reloadConfigIfNil()
  return configInput.passiveAbilities.motivationalPain.id
end

function M.getMotivationalPainRespawnSpeed()
  reloadConfigIfNil()
  return configInput.passiveAbilities.motivationalPain.respawnSpeed
end

function M.getMoreMaxSpeedId()
  reloadConfigIfNil()
  return configInput.passiveAbilities.moreMaxSpeed.id
end

function M.getMoreMaxSpeedSpeedFactor()
  reloadConfigIfNil()
  return configInput.passiveAbilities.moreMaxSpeed.speedFactor
end

function M.getMoreMaxAccelerationId()
  reloadConfigIfNil()
  return configInput.passiveAbilities.moreMaxAcceleration.id
end

function M.getMoreMaxAccelerationAccelerationFactor()
  reloadConfigIfNil()
  return configInput.passiveAbilities.moreMaxAcceleration.accelerationFactor
end

function M.getJumpAroundId()
  reloadConfigIfNil()
  return configInput.passiveAbilities.jumpAround.id
end

function M.getJumpAroundFactor()
  reloadConfigIfNil()
  return configInput.passiveAbilities.jumpAround.jumpAccelerationPenaltyFactor
end

function M.getArtfulDodgerId()
  reloadConfigIfNil()
  return configInput.passiveAbilities.artfulDodger.id
end

function M.getArtfulDodgerFactor()
  reloadConfigIfNil()
  return configInput.passiveAbilities.artfulDodger.invulnerabilityTimeFactor
end

function M.getDownHillChampionId()
  reloadConfigIfNil()
  return configInput.passiveAbilities.downHillChampion.id
end

function M.getDownHillChampionFactor()
  reloadConfigIfNil()
  return configInput.passiveAbilities.downHillChampion.maxSpeedSlopeFactor
end

function M.getFasterUpHillFactor()
  reloadConfigIfNil()
  return configInput.passiveAbilities.fasterUpHill.accelerationFactor
end

function M.getCoin1Id()
  reloadConfigIfNil()
  return configInput.passiveAbilities.coin1.id
end

function M.getCoin1Bonus()
  reloadConfigIfNil()
  return configInput.passiveAbilities.coin1.coinBonus
end

function M.getCoin2Id()
  reloadConfigIfNil()
  return configInput.passiveAbilities.coin2.id
end

function M.getCoin2Bonus()
  reloadConfigIfNil()
  return configInput.passiveAbilities.coin2.coinBonus
end

function M.getLearner1Id()
  reloadConfigIfNil()
  return configInput.passiveAbilities.learner1.id
end

function M.getLearner1Bonus()
  reloadConfigIfNil()
  return configInput.passiveAbilities.learner1.xpBonus
end

function M.getLearner2Id()
  reloadConfigIfNil()
  return configInput.passiveAbilities.learner2.id
end

function M.getLearner2Bonus()
  reloadConfigIfNil()
  return configInput.passiveAbilities.learner2.xpBonus
end

function M.getGodId()
  reloadConfigIfNil()
  return configInput.passiveAbilities.god.id
end

function M.getGodCoinBonus()
  reloadConfigIfNil()
  return configInput.passiveAbilities.god.coinBonus
end

function M.getGodXpBonus()
  reloadConfigIfNil()
  return configInput.passiveAbilities.god.xpBonus
end

function M.getCreatureName(id)
  reloadConfigIfNil()
  local name
  for key, value in pairs(configInput.characters) do
    if tonumber(value.id) == tonumber(id) then
      return key
    end
    name = key
  end
  return name
end

function M.getCreatureSlot1(id)
  reloadConfigIfNil()
  local slot1 = {
    {0, 0}
  }
  for key, value in pairs(configInput.characters) do
    if tonumber(value.id) == tonumber(id) then
      slot1 = value.slot1
      return slot1
    end
  end
  return slot1
end

function M.getCreatureSlot2(id)
  reloadConfigIfNil()
  local slot2 = {
    {0, 0}
  }
  for key, value in pairs(configInput.characters) do
    if tonumber(value.id) == tonumber(id) then
      slot2 = value.slot2
      return slot2
    end
  end
  return slot2
end

function M.getAllCharacters()
  reloadConfigIfNil()
  local num = 0
  for key, value in pairs(configInput.characters) do
    num = num + 1
  end
  if configInput.newCharacters then
    for key, value in pairs(configInput.newCharacters) do
      num = num + 1
    end
  end
  return num
end

function M.getNumberOfCharacters()
  reloadConfigIfNil()
  local num = 0
  print("getNumberOfCharacters ", configInput)
  for key, value in pairs(configInput.characters) do
    num = num + 1
  end
  return num
end

function M.getCreatureTheme(id)
  reloadConfigIfNil()
  local theme = ""
  for key, value in pairs(configInput.characters) do
    if tonumber(value.id) == tonumber(id) then
      return value.theme
    end
  end
  return theme
end

function M.getMonsterMood(moodValue)
  reloadConfigIfNil()
  local moodString = ""
  moodValue = tonumber(moodValue)
  if 1000 < moodValue then
    moodValue = 1000
  elseif moodValue < 0 then
    moodValue = 0
  end
  for key, value in pairs(configInput.monsterValues.mood) do
    if moodValue <= tonumber(value[1]) and moodValue >= tonumber(value[2]) then
      moodString = key
    end
  end
  return moodString
end

function M.getMoodChange()
  reloadConfigIfNil()
  if configInput.monsterValues.moodModifier then
    return configInput.monsterValues.moodModifier
  else
    return 0
  end
end

function M.getMonsterEyeColorValues()
  reloadConfigIfNil()
  return configInput.monsterValues.eyeColor
end

function M.getMonsterType(id)
  reloadConfigIfNil()
  for key, value in pairs(configInput.characters) do
    if tonumber(value.id) == id then
      return id
    end
  end
  return 1
end

function M.getMonsterStage(stage)
  reloadConfigIfNil()
  if stage < 1 or 3 < stage then
    return 1
  end
  return stage
end

function M.getMonsterEyes(eyeId)
  reloadConfigIfNil()
  if eyeId < 1 or eyeId > #configInput.monsterValues.eyeColor then
    return 1
  end
  return eyeId
end

function M.getMonsterHair(monsterType, stage, hairId)
  reloadConfigIfNil()
  if hairId < 1 or hairId > configInput.characters[M.getCreatureName(monsterType)]["stage" .. stage].hair then
    return 1
  end
  return hairId
end

function M.getMonsterSkin(monsterType, stage, skinId)
  reloadConfigIfNil()
  if skinId < 0 or skinId > tonumber(configInput.characters[M.getCreatureName(monsterType)]["stage" .. stage].skins) then
    return 0
  end
  return skinId
end

function M.getStageLevel(level)
  reloadConfigIfNil()
  local stageLevel = 1
  level = tonumber(level)
  for i = 1, #configInput.monsterValues.evolveLevel do
    if level >= tonumber(configInput.monsterValues.evolveLevel[i]) then
      stageLevel = stageLevel + 1
    end
  end
  return stageLevel
end

function M.getBlockType(id)
  reloadConfigIfNil()
  for key, value in pairs(configInput.specialBlock) do
    if tonumber(value.id) == tonumber(id) then
      return value.type
    end
  end
  return "none"
end

function M.getBlockName(id)
  reloadConfigIfNil()
  for key, value in pairs(configInput.specialBlock) do
    if tonumber(value.id) == tonumber(id) then
      return key
    end
  end
  return "none"
end

function M.getSlowingFlowerFactor()
  reloadConfigIfNil()
  return configInput.specialBlock.slowingFlower.speedSlowFactor
end

function M.getKnockBackFlowerFactor()
  reloadConfigIfNil()
  return configInput.specialBlock.knockBackFlower.xSpeed
end

function M.getCanonSpeed()
  reloadConfigIfNil()
  return configInput.specialBlock.cannon.xSpeed, configInput.specialBlock.cannon.ySpeed
end

function M.getCanonDuration()
  reloadConfigIfNil()
  return configInput.specialBlock.cannon.duration
end

function M.getBigCanonSpeed()
  reloadConfigIfNil()
  return configInput.specialBlock.bigCannon.xSpeed, configInput.specialBlock.bigCannon.ySpeed
end

function M.getBigCanonDuration()
  reloadConfigIfNil()
  return configInput.specialBlock.bigCannon.duration
end

function M.getMapElementSpeed()
  reloadConfigIfNil()
  return configInput.specialBlock.speed.maxSpeedBonus, configInput.specialBlock.speed.accelerationBonus
end

function M.getMapElementSlow()
  reloadConfigIfNil()
  return configInput.specialBlock.slow.maxSpeedBonus, configInput.specialBlock.slow.accelerationBonus
end

function M.getMessageTypeForID(id)
  reloadConfigIfNil()
  return configInput.messageIDs[id]
end

function M.getServerMessageTypeForName(name)
  reloadConfigIfNil()
  for key, value in pairs(configInput.messageIDs) do
    if name == value then
      return key
    end
  end
  return "00"
end

function M.getClientMessageTypeForName(name)
  reloadConfigIfNil()
  for key, value in pairs(configInput.clientIDs) do
    if name == value then
      return key
    end
  end
  return "00"
end

function M.getUnlockedZones(progression)
  reloadConfigIfNil()
  local zone = 1
  for key, value in ipairs(configInput.adventure.progression) do
    if progression >= tonumber(value) then
      zone = tonumber(key)
    end
  end
  return zone
end

function M.getProgressionReward(placement)
  reloadConfigIfNil()
  local reward = 0
  reward = tonumber(configInput.adventure.progressionRewards[placement])
  return reward
end

function M.getZoneProgressionPercentage(progression, unlockedZone)
  reloadConfigIfNil()
  local percentage
  if unlockedZone then
    local currentNeededProgression = configInput.adventure.progression[unlockedZone + 1]
    if currentNeededProgression then
      percentage = progression / tonumber(currentNeededProgression)
    else
      percentage = 1
    end
  end
  if percentage < 0 then
    percentage = 0
  elseif 1 < percentage then
    percentage = 1
  end
  if unlockedZone == 0 then
    percentage = 0
  end
  return percentage
end

function M.getZoneProgressionRequirement(zone)
  reloadConfigIfNil()
  return tonumber(configInput.adventure.progression[zone])
end

function M.getZoneEggHuntRequirement(zone)
  reloadConfigIfNil()
  return tonumber(configInput.adventure.unlockEgghunt[zone])
end

function M.getLevelRequirement(level)
  reloadConfigIfNil()
  if configInput.monsterValues.level[level] then
    return tonumber(configInput.monsterValues.level[level])
  else
    return tonumber(configInput.monsterValues.level[#configInput.monsterValues.level])
  end
end

function M.getLevelProgression(xp, level)
  reloadConfigIfNil()
  local targetXp = M.getLevelRequirement(level + 1)
  if xp and targetXp then
    if xp <= 0 then
      return 0
    end
    return xp / targetXp
  else
    print("M.getLevelProgression error", xp)
    return 1
  end
end

function M.getTicketRechargeTime()
  reloadConfigIfNil()
  return configInput.adventure.safariTicketRechargeRate
end

function M.getMaxTickets()
  reloadConfigIfNil()
  return configInput.adventure.maxSafariTicket
end

function M.getEggHuntPrice(zone)
  reloadConfigIfNil()
  if zone then
    local softPrice = configInput.adventure.eggHuntSoftCurrencyPrice[tonumber(zone)]
    local hardPrice = configInput.adventure.eggHuntHardCurrencyPrice[tonumber(zone)]
    return softPrice, hardPrice
  end
  return 10, 10
end

function M.getLevelSoftReward(level)
  reloadConfigIfNil()
  local softReward
  local levelindex = level
  if levelindex > #configInput.monsterValues.softRewards then
    softReward = tonumber(configInput.monsterValues.softRewards[#configInput.monsterValues.softRewards])
  else
    softReward = tonumber(configInput.monsterValues.softRewards[levelindex])
  end
  if softReward < 0 or softReward == nil then
    softReward = 0
    print("WARNING: Could not find valid soft reward for level " .. levelindex)
  end
  return softReward
end

function M.getLevelHardReward(level)
  reloadConfigIfNil()
  local hardReward
  local levelindex = level
  if levelindex > #configInput.monsterValues.hardRewards then
    hardReward = tonumber(configInput.monsterValues.hardRewards[#configInput.monsterValues.hardRewards])
  else
    hardReward = tonumber(configInput.monsterValues.hardRewards[levelindex])
  end
  if hardReward < 0 or hardReward == nil then
    hardReward = 0
    print("WARNING: Could not find valid hard reward for level " .. levelindex .. ". Returning 0.")
  end
  return hardReward
end

function M.getPowerUpLevel(puId)
  reloadConfigIfNil()
  local level = 1
  for key, value in pairs(configInput.powerUps) do
    if tonumber(value.id) == puId then
      return tonumber(value.level)
    end
  end
  return level
end

function M.getPowerUpTheme(puId)
  reloadConfigIfNil()
  local theme
  for key, value in pairs(configInput.powerUps) do
    if tonumber(value.id) == puId then
      if value.theme then
        return value.theme
      else
        return theme
      end
    end
  end
  return theme
end

function M.getLevelSpecialReward(level, monsterID)
  reloadConfigIfNil()
  local reward
  local rewardType = 0
  for i = 1, #configInput.monsterValues.evolveLevel do
    if level == configInput.monsterValues.evolveLevel[i] then
      return 1, true
    end
  end
  local slot2 = M.getCreatureSlot2(monsterID)
  for i = 1, #slot2 do
    if level == tonumber(slot2[i][2]) then
      return 2, tonumber(slot2[i][1])
    end
  end
  local slot1 = M.getCreatureSlot1(monsterID)
  for i = 1, #slot1 do
    if level == tonumber(slot1[i][2]) then
      return 2, tonumber(slot1[i][1])
    end
  end
  for key, value in pairs(configInput.powerUps) do
    if tonumber(value.level) == level then
      if value.theme and value.theme == M.getCreatureTheme(monsterID) then
        rewardType = 3
        reward = tonumber(value.id)
      elseif not value.theme then
        rewardType = 3
        reward = tonumber(value.id)
      end
    end
  end
  if rewardType == 0 and reward == nil then
    rewardType = 4
    reward = 1
  end
  return rewardType, reward
end

function M.getLevelUpString(type, id)
  reloadConfigIfNil()
  local string = ""
  if type == 2 then
    for key, value in pairs(configInput.passiveAbilities) do
      if tonumber(value.id) == id then
        return value.description
      end
    end
  elseif type == 3 then
    for key, value in pairs(configInput.powerUps) do
      if tonumber(value.id) == id then
        return value.description
      end
    end
  end
  return string
end

function M.getLevelCap()
  reloadConfigIfNil()
  if configInput.monsterValues and configInput.monsterValues.maxLevel then
    return configInput.monsterValues.maxLevel
  end
end

return M
