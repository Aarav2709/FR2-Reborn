display.setStatusBar(display.HiddenStatusBar)
system.setIdleTimer(false)
isAndroid = "Android" == system.getInfo("platformName")
isSimulator = "simulator" == system.getInfo("environment")
local font = "Brady Bunch Remastered"
if isAndroid then
  font = "BradyBunchRemastered"
  native.setProperty("androidSystemUiVisibility", "immersiveSticky")
end
localPlayerCollisionFilter = {categoryBits = 1, maskBits = 10}
remotePlayerCollisionFilter = {categoryBits = 16, maskBits = 2}
obstacleFilter = {categoryBits = 2, maskBits = 21}
powerUpFilter = {categoryBits = 4, maskBits = 2}
sensorFilter = {categoryBits = 8, maskBits = 1}
if audio.supportsSessionProperty == true then
  audio.setSessionProperty(audio.MixMode, audio.AmbientMixMode)
end
local closeTime = os.time()
local composer = require("composer")
require("lua.modules.debugMode")
local config = require("configuration")
-- OFFLINE MOD: Push notification devre dışı
-- local notificationPlugin = require("plugin.notifications")
-- notificationPlugin.registerForPushNotifications()
composer.localized = require("localization")
composer.database = require("database")
require("lua.modules.buttonHelper")
require("lua.modules.textHelper")
require("lua.modules.debugHelper")
require("lua.modules.validateInput")
require("lua.modules.notification")
require("lua.modules.audio")
require("lua.modules.bounceWindow")
require("lua.network.communicationModule")
require("lua.network.communicationModuleHttps")
require("lua.modules.monsterConvert")
require("lua.overlays.customOverlay")
require("lua.modules.onboardingModule")

local function clearMemory()
  if composer.data then
  end
end

local function closeNetwork()
  if composer and composer.comm then
    composer.comm.stopTCPSocial()
    local tcpClient = require("lua.network.tcpClient")
    tcpClient.stopTCPClient()
  end
end

local function closeTCPSocial()
  if composer and composer.comm then
    composer.comm.stopTCPSocial()
  end
end

local function disconnectAlertComplete(event)
  if "clicked" == event.action then
    local currentScene = composer.getSceneName("current")
    composer.gotoScene("lua.scenes.playMenu")
    composer.removeScene(currentScene)
    composer.suspendAlert = false
  end
end

local function showDisconnectAlert()
  if not composer.suspendAlert then
    composer.suspendAlert = true
    native.showAlert(composer.localized.get("Disconnected"), composer.localized.get("YouSuspended"), {
      composer.localized.get("Ok")
    }, disconnectAlertComplete)
  end
end

local onSystem = function(event)
  if event.type == "applicationStart" then
  elseif event.type == "applicationExit" then
    closeNetwork()
    clearMemory()
    composer.notification.clean()
    Runtime:removeEventListener("system", onSystem)
  elseif event.type == "applicationSuspend" then
    closeTime = os.time()
    if composer.getSceneName("current") == "lua.scenes.marketplace" then
      composer.comm.sendHeartbeat()
      print("keep connection open")
    elseif composer.data.openURL then
      composer.comm.sendHeartbeat()
      print("open link, keep connection open")
    elseif composer.adsTable.active then
      composer.comm.sendHeartbeat()
      print("is an ad, keep connection open")
    elseif composer.getSceneName("current") ~= "lua.scenes.gamePlay" then
      closeNetwork()
    else
      closeTCPSocial()
    end
    composer.notification.queue3DayNotification()
    composer.notification.queue7DayNotification()
  elseif event.type == "applicationResume" then
    if composer.comm then
      composer.comm.isOnline()
      if composer.getSceneName("current") == "lua.scenes.lobbyQuickPlay" then
        showDisconnectAlert()
      elseif composer.getSceneName("current") == "lua.scenes.lobbyCustomPlay" then
        showDisconnectAlert()
      end
    end
    if isAndroid then
      native.setProperty("androidSystemUiVisibility", "immersiveSticky")
      local inApp = require("lua.iap.inAppPurchase")
      if inApp.getStoreType() == 2 and closeTime and closeTime + 300 < os.time() then
        inApp.initInAppPurchase()
      end
    end
    composer.notification.clearLocalPushNotificationQueue()
    composer.data.openURL = false
  end
end
Runtime:addEventListener("system", onSystem)
if isAndroid then
  androidLogic = require("lua.modules.androidBackButton")
  androidLogic.startAndroidBackButton()
end

local function main()
  composer.data = {}
  composer.data.font = font
  composer.data.version = composer.config.version
  composer.data.serverVersion = composer.config.serverVersion
  composer.data.sounds = {}
  composer.data.sounds.buttonSound = audio.loadSound("sound/sfx_button_press.wav")
  composer.data.animations = {}
  composer.data.animations.avatar = {}
  composer.data.animations.boots = {}
  composer.data.animations.item = {}
  composer.data.animations.hat = {}
  composer.data.animations.face = {}
  composer.data.animations.neck = {}
  composer.data.messageOfTheDay = ""
  composer.data.monsterInMemory = {}
  composer.database.initPlayerVariables()
  composer.database.getViolence()
  composer.errorTable = {}
  composer.errorTable.showServerError = true
  composer.suspendAlert = false
  composer.wifiOn = true
  
  function composer.facebookCallback()
  end
  
  composer.onlineFriends = {}
  composer.gameType = 0
  composer.gameInvites = {}
  composer.tcpClient = require("lua.network.tcpClient")
  if composer.database.getPlayerInformation() then
    composer.gotoScene("lua.scenes.loadingScene")
  else
    composer.gotoScene("lua.scenes.startScreen")
  end
  composer.analytics = require("analytics")
  return true
end

main()
local launchArgs = (...)
if launchArgs and launchArgs.notification then
  composer.notification.notificationListener(launchArgs.notification)
end
