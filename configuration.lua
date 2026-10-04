local composer = require("composer")
composer.config = {}
composer.config.version = "1.1.0"
composer.config.fullVersion = "1.1.0"
composer.config.onboardingVersion = "0.1"
composer.config.abTest = ""
composer.config.serverVersion = 24
composer.config.newItems = { version = 7, number = 0 }
composer.config.numberOfMonsters = 1
composer.config.offlineMode = true -- Offline mode enabled
composer.config.tcpSocial = "minttuentrypoint.dirtybit.no"
composer.config.configAddress = "http://minttuconfig.dirtybit.no"
composer.config.httpsClient = "https://minttuentrypoint.dirtybit.no:6389"
composer.config.serverTimeout = 6000
composer.config.tutorial = false
composer.config.testMode = false
if composer.config.testMode then
  composer.config.tcpSocial = "minttuentrypointdev.dirtybit.no"
  composer.config.configAddress = "http://minttuconfigdev.dirtybit.no"
  composer.config.httpsClient = "https://minttuentrypointdev.dirtybit.no:6389"
  composer.config.gameType = 0
  composer.config.mapId = 3
  composer.config.ignoreJsonConfig = false
  composer.config.fullVersion = composer.config.fullVersion .. "testMode"
  composer.config.bot = false
  composer.config.startGameAtOnce = false
  composer.config.showPostLobby = false
  if composer.config.bot then
    composer.config.serverBot = false
  end
  composer.config.hideUI = false
  composer.debugger.main = false
  composer.debugger.friends = false
  composer.debugger.database = false
  composer.debugger.network = false
  composer.debugger.filesystem = false
  composer.debugger.ticket = false
  composer.debugger.physics = false
  composer.debugger.audio = false
  composer.isDebug = false
  composer.debugger.iap = false
  composer.debugger.loadingTime = false
  composer.debugger.facebook = false
  composer.debugger.memoryCheck = false
  composer.debugger.fpsGame = false
  composer.debugger.profiling = false
  composer.debugger.notification = false
  composer.debugger.spine = false
end
composer.config.jsonMap = composer.config.configAddress
composer.config.jsonConfig = composer.config.configAddress .. "/config.json"
composer.config.jsonStoreConfig = composer.config.configAddress .. "/storeConfig.json"
composer.config.jsonAwardsConfig = composer.config.configAddress .. "/awards.json"
composer.config.jsonVersionConfig = composer.config.configAddress .. "/version.json"
composer.config.facebookAppId = "1483695935221554"
if isSimulator then
  composer.isDebug = true
end
composer.config.platform = 0
local platform = system.getInfo("targetAppStore")
if platform == "apple" then
  composer.config.platform = "a"
elseif platform == "google" then
  composer.config.platform = "g"
elseif platform == "amazon" then
  composer.config.platform = "z"
end
