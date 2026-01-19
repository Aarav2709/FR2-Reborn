local M = {}
local composer = require("composer")
local jsonParser = require("lua.modules.jsonParser")
local crypto = require("crypto")
local soundsLoaded = false
local baseSoundsLoaded = false
local storeLoaded = false
local Animations3Loaded = false
local Animations2Loaded = false
local Animations1Loaded = false
local spineLoaded = false
local facebookLoaded = false
composer.mapHandler = require("lua.modules.jsonMapInfoHandler")

function M.loadBaseSounds()
  if baseSoundsLoaded then
    return
  end
  local sounds = composer.data.sounds
  sounds.button_back = audio.loadSound("sound/sfx_button_back.wav")
  sounds.button_press = audio.loadSound("sound/sfx_button_press.wav")
  sounds.dropdown_menu = audio.loadSound("sound/sfx_dropdown_menu.wav")
end

function M.loadSounds()
  if soundsLoaded then
    return
  end
  local timeToLoad = system.getTimer()
  M.loadBaseSounds()
  local sounds = composer.data.sounds
  sounds.armor_activate = audio.loadSound("sound/sfx_armor_activate.wav")
  sounds.armor_end = audio.loadSound("sound/sfx_armor_end.wav")
  sounds.blade_activate = audio.loadSound("sound/sfx_blade_activate.wav")
  sounds.blade_hit = audio.loadSound("sound/sfx_blade_hit.wav")
  sounds.blood = audio.loadSound("sound/sfx_blood.wav")
  sounds.bounce_activate = audio.loadSound("sound/sfx_bounce_activate.wav")
  sounds.bounce_hit = audio.loadSound("sound/sfx_bounce_hit.wav")
  sounds.bounce_tile = audio.loadSound("sound/sfx_bounce_tile.wav")
  sounds.buy_item = audio.loadSound("sound/sfx_buy_item.wav")
  sounds.cannon = audio.loadSound("sound/sfx_cannon.wav")
  sounds.collect_achievement = audio.loadSound("sound/sfx_collect_achievement.wav")
  sounds.crowd_cheer = audio.loadSound("sound/sfx_crowd_cheer.wav")
  sounds.coins = audio.loadSound("sound/sfx_coins.wav")
  sounds.coins_end = audio.loadSound("sound/sfx_coins_end.wav")
  sounds.countdown = audio.loadSound("sound/sfx_countdown.wav")
  sounds.dropdown = audio.loadSound("sound/sfx_dropdown.wav")
  sounds.dropdown_achievement = audio.loadSound("sound/sfx_dropdown_achievement.wav")
  sounds.hunter_activate = audio.loadSound("sound/sfx_hunter_activate.wav")
  sounds.hunter_hit = audio.loadSound("sound/sfx_hunter_hit.wav")
  sounds.invul_activate = audio.loadSound("sound/sfx_invul_activate.wav")
  sounds.invul_end = audio.loadSound("sound/sfx_invul_end.wav")
  sounds.jump = audio.loadSound("sound/sfx_jump.wav")
  sounds.lightning_activate = audio.loadSound("sound/sfx_lightning_activate.wav")
  sounds.lightning_hit = audio.loadSound("sound/sfx_lightning_hit.wav")
  sounds.magnet_activate = audio.loadSound("sound/sfx_magnet_activate.wav")
  sounds.magnet_hit = audio.loadSound("sound/sfx_magnet_hit.wav")
  sounds.message_received = audio.loadSound("sound/sfx_message_received.wav")
  sounds.no_powerup = audio.loadSound("sound/sfx_no_powerup.wav")
  sounds.pickup = audio.loadSound("sound/sfx_pickup.wav")
  sounds.rating = audio.loadSound("sound/sfx_rating_short.wav")
  sounds.rating_end = audio.loadSound("sound/sfx_rating_end.wav")
  sounds.rocket_activate = audio.loadSound("sound/sfx_rocket_activate.wav")
  sounds.rocket_hit = audio.loadSound("sound/sfx_rocket_hit.wav")
  sounds.rocket_jump = audio.loadSound("sound/sfx_rocket_jump.wav")
  sounds.speed_activate = audio.loadSound("sound/sfx_speed_activate.wav")
  sounds.speed_tile = audio.loadSound("sound/sfx_speed_tile.wav")
  sounds.spin_wheel = audio.loadSound("sound/sfx_spin_wheel.wav")
  sounds.start = audio.loadSound("sound/sfx_start.wav")
  sounds.teleport_activate = audio.loadSound("sound/sfx_teleport_activate.wav")
  sounds.trap_activate = audio.loadSound("sound/sfx_trap_activate.wav")
  sounds.trap_hit = audio.loadSound("sound/sfx_trap_hit.wav")
  sounds.wheel_win = audio.loadSound("sound/sfx_wheel_win.wav")
  timeToLoad = system.getTimer() - timeToLoad
  composer.debugger.debugPrint("loadingTime", "SOUND timeToLoad  " .. timeToLoad)
end

function M.loadAnimations3()
  if Animations3Loaded then
    return
  end
  Animations3Loaded = true
  local timeToLoad = system.getTimer()
  local animations = composer.data.animations
  composer.powerUpEffectImageSheetInfo = require("lua.game.powerups.effectsImageSheet")
  composer.powerUpEffectImageSheet = graphics.newImageSheet("images/game/powerups/effects.png", composer.powerUpEffectImageSheetInfo:getSheet())
  composer.characterPowerUpEffectsImageSheetInfo = require("lua.monsters.powerUpEffects")
  composer.characterPowerUpEffectsImageSheet = graphics.newImageSheet("images/monsters/powerups/powerUpEffects.png", composer.characterPowerUpEffectsImageSheetInfo:getSheet())
  local lightningEffectStartIndex = composer.powerUpEffectImageSheetInfo:getFrameIndex("lightningBolt1")
  local lightningEffectSequenceData = {
    name = "normal",
    start = lightningEffectStartIndex,
    count = 2,
    time = 400,
    loopCount = 2
  }
  animations.lightningBoltSet = lightningEffectSequenceData
  local lightningBackEffectStartIndex = composer.powerUpEffectImageSheetInfo:getFrameIndex("lightning1")
  local lightningBackEffectSequenceData = {
    name = "normal",
    start = lightningBackEffectStartIndex,
    count = 2,
    time = 300,
    loopCount = 2
  }
  animations.lightningBackSet = lightningBackEffectSequenceData
  local magnetEffectStartIndex = composer.powerUpEffectImageSheetInfo:getFrameIndex("magnetPull1")
  local magnetEffectSequenceData = {
    name = "normal",
    start = magnetEffectStartIndex,
    count = 3,
    time = 400,
    loopCount = 1
  }
  animations.magnetEffect = magnetEffectSequenceData
  local rocketEffectStartIndex = composer.powerUpEffectImageSheetInfo:getFrameIndex("explo1")
  local rocketEffectSequenceData = {
    name = "normal",
    start = rocketEffectStartIndex,
    count = 8,
    time = 500,
    loopCount = 1
  }
  animations.rocketEffect = rocketEffectSequenceData
  local bloodEffectStartIndex = composer.powerUpEffectImageSheetInfo:getFrameIndex("bloodspray1")
  local bloodEffectSequenceData = {
    name = "normal",
    start = bloodEffectStartIndex,
    count = 5,
    time = 400,
    loopCount = 1
  }
  animations.bloodEffect = bloodEffectSequenceData
  local bloodSquirtStartIndex = composer.powerUpEffectImageSheetInfo:getFrameIndex("bloodsquirt1")
  local bloodSquirtSequenceData = {
    name = "normal",
    start = bloodSquirtStartIndex,
    count = 5,
    time = 300,
    loopCount = 3
  }
  animations.bloodSquirt = bloodSquirtSequenceData
  local bloodScreeenEffectStartIndex1 = composer.powerUpEffectImageSheetInfo:getFrameIndex("bloodLL1")
  local bloodScreeenEffectSequenceData1 = {
    name = "normal",
    start = bloodScreeenEffectStartIndex1,
    count = 3,
    time = 100,
    loopCount = 1
  }
  animations.llBloodEffect = bloodScreeenEffectSequenceData1
  local bloodScreeenEffectStartIndex2 = composer.powerUpEffectImageSheetInfo:getFrameIndex("bloodTL1")
  local bloodScreeenEffectSequenceData2 = {
    name = "normal",
    start = bloodScreeenEffectStartIndex2,
    count = 3,
    time = 100,
    loopCount = 1
  }
  animations.tlBloodEffect = bloodScreeenEffectSequenceData2
  local bloodScreeenEffectStartIndex3 = composer.powerUpEffectImageSheetInfo:getFrameIndex("bloodTR1")
  local bloodScreeenEffectSequenceData3 = {
    name = "normal",
    start = bloodScreeenEffectStartIndex3,
    count = 3,
    time = 100,
    loopCount = 1
  }
  animations.trBloodEffect = bloodScreeenEffectSequenceData3
  local jumpEffectStartIndex = composer.powerUpEffectImageSheetInfo:getFrameIndex("jump_cloud1")
  local jumpEffectSequenceData = {
    name = "normal",
    start = jumpEffectStartIndex,
    count = 6,
    time = 250,
    loopCount = 1
  }
  animations.jumpEffect = jumpEffectSequenceData
  local landEffectStartIndex = composer.powerUpEffectImageSheetInfo:getFrameIndex("land_cloud1")
  local landEffectSequenceData = {
    name = "normal",
    start = landEffectStartIndex,
    count = 5,
    time = 200,
    loopCount = 1
  }
  animations.landEffect = landEffectSequenceData
  local ssStartIndex = composer.powerUpEffectImageSheetInfo:getFrameIndex("bloodspray1")
  local ssSequenceData = {
    name = "normal",
    start = ssStartIndex,
    count = 5,
    time = 300,
    loopCount = 1
  }
  animations.markBlood = ssSequenceData
  local chatStartIndex = composer.powerUpEffectImageSheetInfo:getFrameIndex("write1")
  local chatSequenceData = {
    name = "normal",
    start = chatStartIndex,
    count = 3,
    time = 900,
    loopCount = 0
  }
  animations.chat = chatSequenceData
  timeToLoad = system.getTimer() - timeToLoad
  composer.debugger.debugPrint("loadingTime", "Animations3 timeToLoad  " .. timeToLoad)
end

function M.loadAnimations2()
  if Animations2Loaded then
    return
  end
  Animations2Loaded = true
  local timeToLoad = system.getTimer()
  local animations = composer.data.animations
  composer.powerUpImageSheetInfo = require("lua.game.powerups.powerupsImageSheet")
  composer.powerUpImageSheet = graphics.newImageSheet("images/game/powerups/powerups.png", composer.powerUpImageSheetInfo:getSheet())
  local shieldStartIndex = composer.powerUpImageSheetInfo:getFrameIndex("shieldEnter1")
  local shieldActiveIndex = composer.powerUpImageSheetInfo:getFrameIndex("shieldActive1")
  local shieldEndIndex = composer.powerUpImageSheetInfo:getFrameIndex("shieldEnd1")
  local shieldAbsorbIndex = composer.powerUpImageSheetInfo:getFrameIndex("shieldAbs1")
  local shieldSequenceData = {
    {
      name = "shieldStart",
      start = shieldStartIndex,
      count = 6,
      time = 300,
      loopCount = 1
    },
    {
      name = "shieldActive",
      start = shieldActiveIndex,
      count = 6,
      time = 300,
      loopCount = 18
    },
    {
      name = "shieldEnd",
      start = shieldEndIndex,
      count = 7,
      time = 300,
      loopCount = 1
    },
    {
      name = "shieldAbsorb",
      start = shieldAbsorbIndex,
      count = 8,
      time = 500,
      loopCount = 1
    }
  }
  animations.shieldSpriteSet = shieldSequenceData
  local trapCloseIndex = composer.powerUpImageSheetInfo:getFrameIndex("trap1")
  local trapBloodCloseIndex = composer.powerUpImageSheetInfo:getFrameIndex("trapBlood1")
  local trapBloodOpenIndex = composer.powerUpImageSheetInfo:getFrameIndex("trapBlood4")
  local trapSequenceData = {
    {
      name = "closeNormal",
      start = trapCloseIndex,
      count = 4,
      time = 70,
      loopCount = 1
    },
    {
      name = "closeBlood",
      start = trapBloodCloseIndex,
      count = 4,
      time = 70,
      loopCount = 1
    },
    {
      name = "openBlood",
      frames = {
        trapBloodOpenIndex,
        trapBloodOpenIndex - 1,
        trapBloodOpenIndex - 2,
        trapBloodOpenIndex - 3
      },
      time = 1000,
      loopCount = 1
    }
  }
  animations.trapSet = trapSequenceData
  local bounceStartIndex = composer.powerUpImageSheetInfo:getFrameIndex("punchBox1")
  local bounceReturnIndex = composer.powerUpImageSheetInfo:getFrameIndex("punchBox5")
  local bounceSequenceData = {
    {
      name = "play",
      start = bounceStartIndex,
      count = 5,
      time = 70,
      loopCount = 1
    },
    {
      name = "reset",
      frames = {
        bounceReturnIndex,
        bounceReturnIndex - 1,
        bounceReturnIndex - 2,
        bounceReturnIndex - 3,
        bounceReturnIndex - 4
      },
      time = 800,
      loopCount = 1
    }
  }
  animations.bounceTrapSet = bounceSequenceData
  local teleportEffectStartIndex = composer.powerUpImageSheetInfo:getFrameIndex("tp1")
  local teleportEffectStopIndex = composer.powerUpImageSheetInfo:getFrameIndex("tp7")
  local teleportEffectSequenceData = {
    {
      name = "start",
      start = teleportEffectStartIndex,
      count = 7,
      time = 400,
      loopCount = 1
    },
    {
      name = "stop",
      frames = {
        teleportEffectStopIndex,
        teleportEffectStopIndex - 1,
        teleportEffectStopIndex - 2,
        teleportEffectStopIndex - 3,
        teleportEffectStopIndex - 4,
        teleportEffectStopIndex - 5,
        teleportEffectStopIndex - 6
      },
      time = 400,
      loopCount = 1
    }
  }
  animations.teleportEffect = teleportEffectSequenceData
  timeToLoad = system.getTimer() - timeToLoad
  composer.debugger.debugPrint("loadingTime", "Animations2 timeToLoad  " .. timeToLoad)
end

function M.loadAnimations1()
  if Animations1Loaded then
    return
  end
  Animations1Loaded = true
  local animations = composer.data.animations
  composer.powerUpFXImageSheetInfo = require("lua.game.powerups.powerupsFXImageSheet")
  composer.powerUpFXImageSheet = graphics.newImageSheet("images/game/powerups/powerupsFX.png", composer.powerUpFXImageSheetInfo:getSheet())
  local closedIndex = composer.powerUpFXImageSheetInfo:getFrameIndex("activate1")
  local openIndex = composer.powerUpFXImageSheetInfo:getFrameIndex("activate6")
  local puButtonSequenceData = {
    {
      name = "click",
      start = closedIndex,
      count = 6,
      time = 200,
      loopCount = 1,
      loopDirection = "bounce"
    },
    {
      name = "gotPU",
      start = closedIndex,
      count = 6,
      time = 100,
      loopCount = 1
    },
    {
      name = "close",
      frames = {
        openIndex,
        openIndex - 1,
        openIndex - 2,
        openIndex - 3,
        openIndex - 4,
        openIndex - 5
      },
      time = 200,
      loopCount = 1
    }
  }
  animations.puButtonEffect = puButtonSequenceData
  local startShineIndex = composer.powerUpFXImageSheetInfo:getFrameIndex("shine1")
  local shineSequenceData = {
    {
      name = "normal",
      start = startShineIndex,
      count = 4,
      time = 200,
      loopCount = 1
    }
  }
  animations.shineEffect = shineSequenceData
end

function M.loadFacebook()
  if facebookLoaded then
    return
  end
  local timeToLoad = system.getTimer()
  facebookLoaded = true
  composer.facebook = require("lua.modules.facebookModule")
  timeToLoad = system.getTimer() - timeToLoad
  composer.debugger.debugPrint("loadingTime", "facebook timeToLoad  " .. timeToLoad)
end

function M.loadIAP()
  if storeLoaded then
    return
  end
  storeLoaded = true
  local inApp = require("lua.iap.inAppPurchase")
  inApp.initInAppPurchase()
end

function M.createConfigChecksum()
  local timeToLoad = system.getTimer()
  local basesum = ""
  basesum = basesum .. jsonParser.getFile("config/config.json")
  basesum = basesum .. jsonParser.getFile("config/storeConfig.json")
  basesum = basesum .. jsonParser.getFile("config/awards.json")
  local checksum = crypto.digest(crypto.sha1, basesum)
  composer.data.configChecksum = checksum
  timeToLoad = system.getTimer() - timeToLoad
  composer.debugger.debugPrint("loadingTime", "createConfigChecksum timeToLoad  " .. timeToLoad)
end

function M.createMapChecksum()
  local timeToLoad = system.getTimer()
  local numberOfMaps = composer.mapHandler.getNumberOfMaps()
  local basesum = ""
  for i = 1, numberOfMaps do
    local mapString = jsonParser.getFile("config/map/" .. i .. ".json")
    if mapString then
      basesum = basesum .. mapString
    end
  end
  local checksum = crypto.digest(crypto.sha1, basesum)
  composer.data.mapChecksum = checksum
  timeToLoad = system.getTimer() - timeToLoad
  composer.debugger.debugPrint("loadingTime", "createMapChecksum timeToLoad  " .. timeToLoad)
end

function M.updateMapFiles()
  local timeToLoad = system.getTimer()
  composer.updatingMaps = true
  local downloadStart = {
    name = "downloadStartMaps"
  }
  Runtime:dispatchEvent(downloadStart)
  local mapUpdater = require("lua.network.httpMapUpdate")
  mapUpdater.checkForJsonMapUpdate()
  timeToLoad = system.getTimer() - timeToLoad
  composer.debugger.debugPrint("loadingTime", "UPDATE map files timeToLoad  " .. timeToLoad)
end

function M.readMapDataToMemory(override)
  composer.mapHandler.readMapDataToMemory(override)
end

function M.readJsonConfigFiles()
  local timeToLoad = system.getTimer()
  composer.gameConfig = require("lua.modules.jsonConfigHandler")
  composer.storeConfig = require("lua.modules.jsonStoreConfigHandler")
  composer.awards = require("lua.modules.jsonAwardsHandler")
  composer.gameConfig.readFromFile()
  if composer.gameConfig.isFileCorrupt() then
    return 0
  end
  composer.storeConfig.readFromFile()
  if composer.storeConfig.isFileCorrupt() then
    return 0
  end
  composer.awards.readFromFile()
  if composer.awards.isFileCorrupt() then
    return 0
  end
  timeToLoad = system.getTimer() - timeToLoad
  composer.debugger.debugPrint("loadingTime", "readJsonConfigFiles timeToLoad  " .. timeToLoad)
  return 1
end

function M.readJsonMapFiles()
  local timeToLoad = system.getTimer()
  M.readMapDataToMemory()
  if composer.mapHandler.isFileCorrupt() then
    return -1
  end
  timeToLoad = system.getTimer() - timeToLoad
  composer.debugger.debugPrint("loadingTime", "readJsonMapFiles timeToLoad  " .. timeToLoad)
  return 1
end

function M.updateConfigFiles()
  local timeToLoad = system.getTimer()
  composer.updatingConfingFiles = true
  local downloadStart = {
    name = "downloadStartConfig"
  }
  Runtime:dispatchEvent(downloadStart)
  local jsonConfig = require("lua.network.httpJsonConfigUpdate")
  jsonConfig.checkForJsonConfigUpdate()
  jsonConfig.checkForJsonStoreConfigUpdate()
  jsonConfig.checkForJsonAwardsUpdate()
  timeToLoad = system.getTimer() - timeToLoad
  composer.debugger.debugPrint("loadingTime", "UPDATE config files timeToLoad  " .. timeToLoad)
end

function M.checksumProcedure(serverConfigCheckSum, serverMapCheckSum)
  local function rereadMapDataAfterDownload(event)
    if not composer.updatingMaps then
      Runtime:removeEventListener("downloadMapDone", rereadMapDataAfterDownload)
      
      M.readJsonMapFiles()
    end
  end
  
  local function checkMapCheckSumAndDownload()
    if serverMapCheckSum ~= composer.data.mapChecksum then
      print("WARNING: map checksum wrong, get new")
      Runtime:addEventListener("downloadMapDone", rereadMapDataAfterDownload)
      M.updateMapFiles()
    end
  end
  
  local function downloadMaps(event)
    if event.configType == "config" then
      M.readJsonConfigFiles()
      M.loadIAP()
      print("Got new config file.")
      M.createMapChecksum()
      checkMapCheckSumAndDownload()
      Runtime:removeEventListener("downloadConfigDone", downloadMaps)
    end
  end
  
  if serverConfigCheckSum ~= composer.data.configChecksum then
    print("WARNING: config checksum wrong, get new")
    Runtime:addEventListener("downloadConfigDone", downloadMaps)
    M.updateConfigFiles()
  elseif serverMapCheckSum ~= composer.data.mapChecksum then
    checkMapCheckSumAndDownload()
  end
end

function M.loadSpine()
  if spineLoaded then
    return
  end
  spineLoaded = true
  local timeToLoad = system.getTimer()
  local spineInterface = require("spine-corona.interface")
  spineInterface.init()
  timeToLoad = system.getTimer() - timeToLoad
  composer.debugger.debugPrint("loadingTime", "spine timeToLoad  " .. timeToLoad)
end

return M
