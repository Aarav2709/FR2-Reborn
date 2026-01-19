local M = {}
local background = require("lua.map.backgroundCreator")
local elements = require("lua.map.elementCreator")
local composer = require("composer")
local backgroundGroup, backgroundLayers, mapElements, startX, startY, height, width, goalX, goalY, mapNameText, mapName, theme, playerNames, mapJson
local xSize = 80
local ySize = 50

local function getStartPos()
  local convertedX = xSize * startX
  local convertedY = ySize * startY
  return convertedX, convertedY
end

local function getGoal()
  return xSize * goalX, ySize * goalY
end

local function isInGoal(xPos)
  return xPos > xSize * goalX
end

local function generateBackground(id, cameraGroup)
  backgroundGroup = display.newGroup()
  backgroundLayers = background.createBackground(id, mapJson)
  for i = 1, #backgroundLayers do
    backgroundGroup:insert(backgroundLayers[i])
  end
  backgroundGroup:insert(5, backgroundLayers[6])
  cameraGroup:insert(backgroundGroup)
end

local function addmapNameText(frontCameraGroup, x, y)
  mapNameText = composer.newText({
    string = mapName,
    size = 30,
    color = {
      1,
      1,
      1
    }
  })
  mapNameText.x = x + 90
  mapNameText.y = y + 90
  frontCameraGroup:insert(mapNameText)
end

local function removePlayerNameText(id)
  if playerNames[id] then
    playerNames[id]:removeSelf()
    playerNames[id] = nil
  end
end

local function addPlayerNameText(frontCameraGroup, id, name)
  if composer.tutorial.game then
    return
  end
  removePlayerNameText(id)
  if name and id then
    local x, y = getStartPos()
    local playerName = composer.newText({string = name, size = 14})
    playerName.x = x + 90 + (id - 1) * 92
    playerName.y = y + 38
    if id % 2 == 0 then
      playerName.y = y + 54
    end
    playerNames[id] = playerName
    frontCameraGroup:insert(playerName)
  end
end

local function loadMapData(id)
  local parser = require("lua.modules.jsonParser")
  mapJson = parser.getJsonFromFile("config/map/" .. id .. ".json")
  local properties = mapJson.properties
  startX = properties.startX
  startY = properties.startY
  goalX = properties.goalX
  goalY = properties.goalY
  mapName = properties.name
  theme = properties.theme
  height = mapJson.height
  width = mapJson.width
end

local function generateMapElements(cameraGroup, frontCameraGroup)
  elements.loadImageData(mapJson)
  mapElements = elements.createAllElements(mapJson, cameraGroup, frontCameraGroup)
end

local function generateMap(id, cameraGroup, frontCameraGroup)
  loadMapData(id)
  generateBackground(id, cameraGroup)
  generateMapElements(cameraGroup, frontCameraGroup)
  playerNames = {}
end

local function convertY(yBlocks)
  return ySize * yBlocks
end

local function getDisplayGroup()
  return backgroundGroup
end

local function updateBackgrounds(x, y)
  composer.debugger.profile("UpdateBackgrounds")
  local mapHeightInPixels = convertY(height)
  local partOfMapHeight = y / mapHeightInPixels
  local yPos = (1 + partOfMapHeight) * 20
  backgroundLayers[2].y = yPos * 1
  backgroundLayers[3].y = yPos * 2
  backgroundLayers[4].y = y * 0.6
  backgroundLayers[5].y = y * 0.8
  backgroundLayers[6].y = y * 0.7
  backgroundLayers[2].x = backgroundLayers[2].moved * backgroundLayers[2].width / 3 + x * 0.01
  backgroundLayers[3].x = backgroundLayers[3].moved * backgroundLayers[3].width / 3 + x * 0.06
  backgroundLayers[4].x = x * 0.6
  backgroundLayers[5].x = x * 0.8
  backgroundLayers[6].x = x * 0.7
  for i = 2, 3 do
    if backgroundLayers[i].x < -(2 * (backgroundLayers[i].width / 3)) then
      backgroundLayers[i].x = backgroundLayers[i].x + backgroundLayers[i].width / 3
      backgroundLayers[i].moved = backgroundLayers[i].moved + 1
    end
  end
  composer.debugger.profile("UpdateBackgrounds")
end

local function getLength()
  return xSize * goalX - ySize * (startY + 0.5)
end

local function getTheme()
  return theme
end

local function clean()
  elements.clean()
  if mapElements then
    for i = 1, #mapElements do
      if mapElements[i] then
        if mapElements[i].behaviors then
          for key, value in pairs(mapElements[i].behaviors) do
            if value and value.clean then
              value.clean()
            end
          end
        end
        if mapElements[i].clean then
          mapElements[i].clean()
        end
        transition.cancel(mapElements[i])
        if mapElements[i].image then
          mapElements[i].image:removeSelf()
          mapElements[i] = nil
        end
      end
    end
    mapElements = nil
  end
end

M.getStartPos = getStartPos
M.getTheme = getTheme
M.getGoal = getGoal
M.isInGoal = isInGoal
M.generateMap = generateMap
M.clean = clean
M.getDisplayGroup = getDisplayGroup
M.updateBackgrounds = updateBackgrounds
M.getLength = getLength
M.addPlayerNameText = addPlayerNameText
M.addmapNameText = addmapNameText
M.removePlayerNameText = removePlayerNameText
composer.getGoal = getGoal
return M
