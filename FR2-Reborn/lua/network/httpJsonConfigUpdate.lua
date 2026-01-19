local jsonParser = require("lua.modules.jsonParser")
local composer = require("composer")
local Network = {}
local url = composer.config.jsonConfig
local storeUrl = composer.config.jsonStoreConfig
local awardsUrl = composer.config.jsonAwardsConfig
local versionUrl = composer.config.jsonVersionConfig
local awardsRequestActive = false
local storeRequestActive = false
local configRequestActive = false
local awardsAttempts = 0
local maxAwardsAttempts = 3
local storeAttempts = 0
local maxStoreAttempts = 3
local configAttempts = 0
local maxConfigAttempts = 3

local function checkIfAllRequestIsDone()
  if not awardsRequestActive and not storeRequestActive and not configRequestActive then
    composer.updatingConfingFiles = false
  end
end

local function isValidRequest(event)
  if event.isError or event.status and tonumber(event.status) ~= 200 then
    return false
  end
  return true
end

local function didDownloadSucceed(event)
  if not isValidRequest(event) then
    print("Warning: Not valid request getting config.")
    return false
  end
  if not jsonParser.isValidJson(event.response.filename) then
    print("Downloaded file is not valid format!", event.response.filename)
    return false
  end
  return true
end

local function sendConfigDownloadRequest(filepath, httpUrl, responseListener)
  composer.updatingConfingFiles = true
  composer.configDownloadFailure = false
  local params = {}
  params.timeout = 10
  params.progress = false
  jsonParser.ensureNeededDirectoriesExist(filepath)
  network.download(httpUrl, "GET", responseListener, params, filepath, system.CachesDirectory)
end

local function awardsListener(event)
  local downloadConfigDone = {
    name = "downloadConfigDone",
    configType = "awards",
    success = true
  }
  if not didDownloadSucceed(event) then
    downloadConfigDone.success = false
  end
  awardsAttempts = awardsAttempts + 1
  if downloadConfigDone.success == false and awardsAttempts < maxAwardsAttempts then
    sendConfigDownloadRequest("config/awards.json", awardsUrl, awardsListener)
    return
  end
  awardsRequestActive = false
  checkIfAllRequestIsDone()
  Runtime:dispatchEvent(downloadConfigDone)
end

local function checkForJsonAwardsUpdate()
  if composer.config.ignoreJsonConfig then
    return
  end
  awardsRequestActive = true
  sendConfigDownloadRequest("config/awards.json", awardsUrl, awardsListener)
end

local function storeConfigListener(event)
  local downloadConfigDone = {
    name = "downloadConfigDone",
    configType = "store",
    success = true
  }
  if not didDownloadSucceed(event) then
    downloadConfigDone.success = false
  end
  storeAttempts = storeAttempts + 1
  if downloadConfigDone.success == false and storeAttempts < maxStoreAttempts then
    sendConfigDownloadRequest("config/storeConfig.json", storeUrl, storeConfigListener)
    return
  end
  storeRequestActive = false
  checkIfAllRequestIsDone()
  Runtime:dispatchEvent(downloadConfigDone)
end

local function checkForJsonStoreConfigUpdate()
  if composer.config.ignoreJsonConfig then
    return
  end
  storeRequestActive = true
  sendConfigDownloadRequest("config/storeConfig.json", storeUrl, storeConfigListener)
end

local function configListener(event)
  local downloadConfigDone = {
    name = "downloadConfigDone",
    configType = "config",
    success = true
  }
  if not didDownloadSucceed(event) then
    downloadConfigDone.success = false
  end
  configAttempts = configAttempts + 1
  if downloadConfigDone.success == false and configAttempts < maxConfigAttempts then
    sendConfigDownloadRequest("config/config.json", url, configListener)
    return
  end
  configRequestActive = false
  checkIfAllRequestIsDone()
  Runtime:dispatchEvent(downloadConfigDone)
end

local function checkForJsonConfigUpdate()
  if composer.config.ignoreJsonConfig then
    return
  end
  configRequestActive = true
  local params = {}
  sendConfigDownloadRequest("config/config.json", url, configListener)
end

local function versionListener(event)
  local jsonObject = event.response
  if not isValidRequest(event) then
    return
  end
  local json = require("json")
  jsonObject = json.decode(jsonObject)
  local minVersion = jsonObject.supportedVersion
  local currentVersion = jsonObject.version
  if composer.comm.haveValidVersion(currentVersion, minVersion) == false then
    print("WARNING: deny access")
    composer.data.wrongVersion = true
    composer.gotoScene("lua.scenes.intro.blockScene")
  end
end

local function checkForVersion()
  if composer.config.ignoreJsonConfig then
    return
  end
  local params = {}
  network.request(versionUrl, "GET", versionListener, params)
end

Network.checkForJsonConfigUpdate = checkForJsonConfigUpdate
Network.checkForJsonStoreConfigUpdate = checkForJsonStoreConfigUpdate
Network.checkForJsonAwardsUpdate = checkForJsonAwardsUpdate
Network.checkForJsonTextUpdate = checkForJsonTextUpdate
Network.checkForVersion = checkForVersion
return Network
