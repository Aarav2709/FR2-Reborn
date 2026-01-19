local jsonParser = require("lua.modules.jsonParser")
local composer = require("composer")
local json = require("json")
local assetLoader = require("lua.modules.assetLoader")
local Network = {}
local url = composer.config.jsonMap
local mapThatAreUpdated = {}
local numberOfMaps = 4
local updateRequestsSent = 0
local updateRequestsReceived = 0
local maxAttemptsPerFile = 3
local networkListener

local function checkIfAllMapsAreUpdated()
  if updateRequestsReceived ~= updateRequestsSent then
    return
  end
  composer.updatingMaps = false
end

local function isValidRequest(event)
  if event.isError or event.status and tonumber(event.status) ~= 200 then
    return false
  end
  return true
end

local function didDownloadSucceed(event)
  if not isValidRequest(event) then
    print("Warning: Not valid request getting map.")
    return false
  end
  if not jsonParser.isValidJson(event.response.filename) then
    print("Downloaded map file is not valid format!", event.response.filename)
    return false
  end
  return true
end

local function sendMapDownloadRequest(mapUrl)
  local params = {}
  params.progress = false
  params.timeout = 10
  updateRequestsSent = updateRequestsSent + 1
  jsonParser.ensureNeededDirectoriesExist("config" .. mapUrl)
  network.download(url .. mapUrl, "GET", networkListener, params, "config" .. mapUrl, system.CachesDirectory)
end

function networkListener(event)
  local downloadMapDone = {
    name = "downloadMapDone",
    success = true
  }
  if not didDownloadSucceed(event) then
    downloadMapDone.success = false
  end
  updateRequestsReceived = updateRequestsReceived + 1
  if event.response and mapThatAreUpdated[event.response.filename] then
    mapThatAreUpdated[event.response.filename] = mapThatAreUpdated[event.response.filename] + 1
    if mapThatAreUpdated[event.response.filename] < maxAttemptsPerFile and not downloadMapDone.success then
      sendMapDownloadRequest(string.sub(event.response.filename, 7))
      return
    end
  end
  checkIfAllMapsAreUpdated()
  Runtime:dispatchEvent(downloadMapDone)
end

local function checkForJsonMapUpdate()
  if composer.config.ignoreJsonConfig then
    return
  end
  composer.updatingMaps = true
  composer.mapDownloadFailure = false
  if composer.mapHandler == nil then
    numberOfMaps = 4
  else
    numberOfMaps = composer.mapHandler.getNumberOfMaps()
  end
  mapThatAreUpdated = {}
  for mapIdToUpdate = 1, numberOfMaps do
    local mapUrl = "/map/" .. mapIdToUpdate .. ".json"
    mapThatAreUpdated["config" .. mapUrl] = 0
    sendMapDownloadRequest(mapUrl)
  end
end

Network.checkForJsonMapUpdate = checkForJsonMapUpdate
return Network
