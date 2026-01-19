local composer = require("composer")
composer.config = {}
composer.config.version = "1.2"
composer.config.fullVersion = "1.2.4-OFFLINE-BETA"
composer.config.onboardingVersion = "0.1"
composer.config.abTest = ""
composer.config.serverVersion = 24
composer.config.newItems = {version = 7, number = 0}
composer.config.numberOfMonsters = 1
composer.config.offlineMode = true -- OFFLINE MOD AKTIF
composer.config.tcpSocial = "minttuentrypoint.dirtybit.no"
composer.config.configAddress = "http://minttuconfig.dirtybit.no"
composer.config.httpsClient = "https://minttuentrypoint.dirtybit.no:6389"
composer.config.flurryAndroid = "6BZYN53JK6SBZX2PBCSH"
composer.config.flurryiOS = "G6GNT88TXRTNGTQHC8TQ"
composer.config.GAGameKey = "0fa375fa782312e75b85d8e74ae77b7d"
composer.config.GASecretKey = "0708a54895c00853758554623c6bc33f222d6d70"
composer.config.gameAnalytics = true
composer.config.adrallyAndroid = "7207d967-b5a0-4577-8e28-43b0a27a5695"
composer.config.adrallyiOS = "90a566f0-4063-44b1-946f-5957728e9cc1"
composer.config.admobVideoAndroid = "ca-app-pub-8676328093985387/2871350550"
composer.config.admobVideoiOS = "ca-app-pub-8676328093985387/5406014554"
composer.config.admobFullscreenAndroid = "ca-app-pub-8676328093985387/4348083759"
composer.config.admobFullscreeiOS = "ca-app-pub-8676328093985387/6882747753"
composer.config.nativeXAndroid = "22942"
composer.config.nativeXiOS = "22996"
composer.config.vungleAndroid = "com.dirtybit.funrun2"
composer.config.vungleiOS = "920482331"
composer.config.impactAndroid = "11343"
composer.config.impactiOS = "11344"
composer.config.revmobAndroid = "50b4ac7de4068c1000000064"
composer.config.revmobiOS = "50b4b07369103eaa00000037"
composer.config.revmobAmazon = "5224b1a1d1dc1e035800002e"
composer.config.cbIdAndroid = "54577fd00d6025036e8e07bd"
composer.config.cbSignartureAndroid = "844a0dabe5ccdeffce325093f8eaa8629a57415a"
composer.config.cbIdOS = "54578036bfe08450052a4a7f"
composer.config.cbSignartureOS = "5903b38aa32d429cd6a06f5d0870289bf9bc172e"
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
