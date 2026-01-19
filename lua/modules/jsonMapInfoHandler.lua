local M = {}
local composer = require("composer")
local jsonParser = require("lua.modules.jsonParser")
local isCorrupt

function M.readMapDataToMemory(override)
  isCorrupt = false
  local numberOfMaps = composer.gameConfig.getNumberOfMaps()
  if override then
  elseif composer.data.mapInfo and #composer.data.mapInfo > 1 then
    return
  end
  
  local function addRandomMap()
    composer.data.mapInfo[1] = {}
    composer.data.mapInfo[1].id = 0
    composer.data.mapInfo[1].name = composer.localized.get("Random")
    composer.data.mapInfo[1].theme = "forest"
  end
  
  local function setMapInfo(configInput)
    local index = #composer.data.mapInfo + 1
    composer.data.mapInfo[index] = {}
    composer.data.mapInfo[index].id = configInput.id
    composer.data.mapInfo[index].name = configInput.name
    composer.data.mapInfo[index].theme = configInput.theme
  end
  
  function composer.data.getMapInfo(mapId)
    if composer.data.mapInfo[mapId + 1] then
      return composer.data.mapInfo[mapId + 1]
    end
    return nil
  end
  
  function composer.data.getMapName(mapId)
    if composer.data.mapInfo[mapId + 1] and composer.data.mapInfo[mapId + 1].name then
      return composer.data.mapInfo[mapId + 1].name
    end
    return ""
  end
  
  function composer.data.getMapTheme(mapId)
    if composer.data.mapInfo[mapId + 1] and composer.data.mapInfo[mapId + 1].theme then
      return composer.data.mapInfo[mapId + 1].theme
    end
    return ""
  end
  
  function composer.data.getMapId(mapId)
    if composer.data.mapInfo[mapId + 1] and composer.data.mapInfo[mapId + 1].id then
      return composer.data.mapInfo[mapId + 1].id
    end
    return -1
  end
  
  local fastReadFailed = false
  composer.data.mapInfo = {}
  addRandomMap()
  for i = 1, numberOfMaps do
    local configInput = jsonParser.getMapInfoFromFile("config/map/" .. i .. ".json")
    if configInput == -1 then
      fastReadFailed = true
      composer.analytics.newEvent("design", {
        event_id = "map:failedToReadMapInfo",
        value = i,
        area = composer.config.fullVersion
      })
      break
    end
    setMapInfo(configInput)
  end
  if fastReadFailed then
    composer.data.mapInfo = {}
    addRandomMap()
    print("WARNING: use slow read of maps")
    for i = 1, numberOfMaps do
      local configInput = jsonParser.getJsonFromFile("config/map/" .. i .. ".json")
      if configInput then
        setMapInfo(configInput.properties)
      else
        isCorrupt = true
        return
      end
    end
  end
end

function M.isFileCorrupt()
  return isCorrupt
end

function M.getNumberOfMaps()
  return composer.gameConfig.getNumberOfMaps()
end

function M.setNonMapActive()
  local numberOfMaps = composer.gameConfig.getNumberOfMaps()
  for i = 1, numberOfMaps + 1 do
    if composer.data.mapInfo[i] then
      composer.data.mapInfo[i].active = false
    end
  end
end

function M.setActiveMap(mapId)
  mapId = mapId + 1
  M.setNonMapActive()
  composer.data.mapInfo[mapId].active = true
end

return M
