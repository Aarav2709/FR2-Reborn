local composer = require("composer")
composer.config = {}
composer.config.version = "1.1.0"
composer.config.fullVersion = "1.1.0"
composer.config.onboardingVersion = "0.1"
composer.config.abTest = ""
composer.config.serverVersion = 24
composer.config.newItems = { version = 7, number = 0 }
composer.config.numberOfMonsters = 1
composer.config.offlineMode = true
composer.config.tcpSocial = "minttuentrypoint.dirtybit.no"
composer.config.configAddress = "http://minttuconfig.dirtybit.no"
composer.config.httpsClient = "https://minttuentrypoint.dirtybit.no:6389"
composer.config.serverTimeout = 6000
composer.config.tutorial = false
composer.config.jsonMap = composer.config.configAddress
composer.config.jsonConfig = composer.config.configAddress .. "/config.json"
composer.config.jsonStoreConfig = composer.config.configAddress .. "/storeConfig.json"
composer.config.jsonAwardsConfig = composer.config.configAddress .. "/awards.json"
composer.config.jsonVersionConfig = composer.config.configAddress .. "/version.json"
composer.config.facebookAppId = "1483695935221554"
composer.config.platform = 0
local platform = system.getInfo("targetAppStore")
if platform == "apple" then
  composer.config.platform = "a"
elseif platform == "google" then
  composer.config.platform = "g"
elseif platform == "amazon" then
  composer.config.platform = "z"
end
