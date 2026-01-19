local M = {}
local physicsData, themeTileset, themeReverseTileset, propsTileset, propsReverseTileset, specialTileset, themeImageSheet, propsImageSheet, animatedBlockSheet, imageSheetFile, propsSheetFile, animatedBlockSheetFile
local scaleFactor = 0.5
local physics = require("physics")
local normalPropertyMap
local propPropertyMap = {
  getBlock = function()
  end
}
local startedClean, elements, mapWidth
local xSize = 160 * scaleFactor
local ySize = 100 * scaleFactor

local function invertShapes(shapeInvert)
  local function updateShapeList(input)
    local output = {}
    
    for k, v in pairs(input) do
      output[k] = v
    end
    for e = 1, #output, 2 do
      local n = output[e]
      if 0 < n then
        n = n * -1
      elseif n < 0 then
        n = math.abs(n)
      end
      output[e] = n
    end
    return output
  end
  
  local function changeVectorDirection(shapes)
    local tempshape = {}
    local c = 1
    for e = #shapes, 1, -2 do
      tempshape[c] = shapes[e - 1]
      c = c + 1
      tempshape[c] = shapes[e]
      c = c + 1
    end
    return tempshape
  end
  
  local temp = updateShapeList(shapeInvert)
  temp = changeVectorDirection(temp)
  return temp
end

local function getIndex(tileId)
  local physicsIndex
  if tileId < 10 then
    physicsIndex = "00" .. tileId
  elseif tileId < 100 then
    physicsIndex = "0" .. tileId
  else
    physicsIndex = "" .. tileId
  end
  return physicsIndex
end

local function findTilesetIndex(tileId, tileset)
  return tileId - tileset.firstgid + 1
end

local function addPhysicsToBlock(block, blockId, isReverse)
  if not block then
    return
  end
  local physicsIndex = getIndex(blockId)
  local bodies = {
    physicsData:get(physicsIndex)
  }
  if #bodies == 0 then
    return
  end
  for i, body in ipairs(bodies) do
    body.filter = obstacleFilter
    if physicsIndex == "001" then
      body.isSensor = true
    else
      body.friction = 0.2
    end
  end
  if isReverse then
    for i, body in ipairs(bodies) do
      body.shape = invertShapes(body.shape)
    end
    physics.addBody(block, unpack(bodies))
    for i, body in ipairs(bodies) do
      body.shape = invertShapes(body.shape)
    end
  else
    physics.addBody(block, unpack(bodies))
  end
end

local function addBehaviorToBlock(block, behaviorData)
  block.behaviors = {}
  for key, value in pairs(behaviorData) do
    local behaviorFile = require(value)
    behaviorFile.addBehavior(block)
  end
end

local function createStaticTile(tileId, tilesetTag)
  local blockImageSheet
  if tilesetTag == "prop" then
    blockImageSheet = propsImageSheet
  else
    blockImageSheet = themeImageSheet
  end
  local block = display.newImage(blockImageSheet, tileId)
  return block
end

local function createAnimatedBlock(tileId, tilesetTag, blockAnimationData)
  local blockImageSheet
  if tilesetTag == "prop" then
    blockImageSheet = propsImageSheet
  else
    blockImageSheet = animatedBlockSheet
  end
  local block = display.newSprite(blockImageSheet, blockAnimationData.sequenceData)
  return block
end

local function createTile(block, tilesetIndex, tilesetTag, isReverse)
  block.tileId = tilesetIndex
  if tilesetTag == "prop" then
    block.animatedBlockSheet = propsImageSheet
    block.animatedBlockSheetFile = propsSheetFile
    block.blockImageSheet = propsImageSheet
    block.blockImageSheetFile = propsSheetFile
  elseif tilesetTag == "special" then
    block.animatedBlockSheet = animatedBlockSheet
    block.animatedBlockSheetFile = animatedBlockSheetFile
    block.blockImageSheet = themeImageSheet
    block.blockImageSheetFile = imageSheetFile
  else
    block.animatedBlockSheet = animatedBlockSheet
    block.animatedBlockSheetFile = animatedBlockSheetFile
    block.blockImageSheet = themeImageSheet
    block.blockImageSheetFile = imageSheetFile
  end
  local blockPropertyData = normalPropertyMap.getBlock(tilesetTag .. getIndex(tilesetIndex))
  if blockPropertyData and blockPropertyData.animation then
    block.animation = blockPropertyData.animation
    block.image = createAnimatedBlock(tilesetIndex, tilesetTag, blockPropertyData.animation)
  elseif blockPropertyData and blockPropertyData.noBaseImage then
  else
    block.image = createStaticTile(tilesetIndex, tilesetTag)
  end
  if block.image then
    block.displayGroup:insert(block.image)
    if isReverse then
      block.image.xScale = -1
    end
  end
  if block.image and tilesetTag == "normal" then
    addPhysicsToBlock(block.image, tilesetIndex, isReverse)
  end
  if blockPropertyData and blockPropertyData.properties then
    for key, value in pairs(blockPropertyData.properties) do
      block.image[key] = value
    end
  end
  if blockPropertyData and blockPropertyData.behavior then
    addBehaviorToBlock(block, blockPropertyData.behavior)
  end
  return block
end

local function createElement(tileId, xPos, yPos, cameraGroup)
  if startedClean then
    return
  end
  local block = {}
  block.x = xSize * (xPos - 1)
  block.y = ySize * (yPos - 1)
  block.scale = scaleFactor
  block.displayGroup = cameraGroup
  local blockId, isReverse
  if propsTileset and propsTileset:isInTileset(tileId) or propsReverseTileset and propsReverseTileset:isInTileset(tileId) then
    blockId = findTilesetIndex(tileId, propsTileset)
    isReverse = false
    if propsReverseTileset:isInTileset(tileId) then
      blockId = findTilesetIndex(tileId, propsReverseTileset)
      isReverse = true
    end
    createTile(block, blockId, "prop", isReverse)
  elseif specialTileset and specialTileset:isInTileset(tileId) then
    blockId = findTilesetIndex(tileId, specialTileset)
    createTile(block, blockId, "special")
  else
    blockId = findTilesetIndex(tileId, themeTileset)
    isReverse = false
    if themeReverseTileset:isInTileset(tileId) then
      blockId = findTilesetIndex(tileId, themeReverseTileset)
      isReverse = true
    end
    if blockId == 1 then
      isReverse = false
    end
    createTile(block, blockId, "normal", isReverse)
    if not block.image.powerUp then
      block.image.mapElement = true
    end
    block.image.bodyType = "static"
  end
  if block.image then
    block.image.x = block.x
    block.image.y = block.y
    block.image.xScale = block.image.xScale * scaleFactor
    block.image.yScale = scaleFactor
    block.image.canTileHaveDecal = normalPropertyMap.canTileHaveDecal(getIndex(blockId))
  end
  return block
end

local function createPowerup(xPos, yPos, cameraGroup)
  if startedClean then
    return
  end
  local block = display.newImage(themeImageSheet, 1)
  block.x = xSize * (xPos - 1)
  block.y = ySize * (yPos - 1)
  local bodies = {
    physicsData:get("001")
  }
  for i, body in ipairs(bodies) do
    body.filter = obstacleFilter
    body.isSensor = true
  end
  physics.addBody(block, unpack(bodies))
  block.bodyType = "static"
  block.powerUp = true
  block.xScale = block.xScale * scaleFactor
  block.yScale = scaleFactor
  cameraGroup:insert(block)
  return block
end

local function setTilesets(tilesets)
  for i = 1, #tilesets do
    if i == #tilesets then
      tilesets[i].lastgid = tilesets[i].firstgid + 1000
    else
      tilesets[i].lastgid = tilesets[i + 1].firstgid - 1
    end
  end
  for i, tileset in pairs(tilesets) do
    function tileset:isInTileset(tileId)
      if tonumber(self.firstgid) <= tonumber(tileId) and tonumber(self.lastgid) >= tonumber(tileId) then
        return true
      end
      return false
    end
    
    if string.sub(tileset.name, 1, 5) == "props" then
      if string.sub(tileset.name, #tileset.name) == "R" then
        propsReverseTileset = tileset
      else
        propsTileset = tileset
      end
    elseif tileset.name == "special" then
      specialTileset = tileset
    elseif string.sub(tileset.name, 1, 5) == "tiles" then
      if string.sub(tileset.name, #tileset.name) == "R" then
        themeReverseTileset = tileset
      else
        themeTileset = tileset
      end
    else
      print("WARNING: NO TILESET DEFINITION FOR TILESET NAMED: ", tileset.name)
    end
  end
end

local function loadImageData(mapJson)
  local theme = mapJson.properties.theme
  physicsData = require("lua.map.tilePhysics").physicsData(scaleFactor)
  normalPropertyMap = require("lua.map.blockPropertyMap").init(theme)
  imageSheetFile = require("lua.map.assets." .. theme .. ".tiles")
  propsSheetFile = require("lua.map.assets." .. theme .. ".props")
  animatedBlockSheetFile = require("lua.map.assets." .. theme .. ".animatedTiles")
  setTilesets(mapJson.tilesets)
  mapWidth = mapJson.width
  themeImageSheet = graphics.newImageSheet("lua/map/assets/" .. theme .. "/tiles.png", imageSheetFile:getSheet())
  propsImageSheet = graphics.newImageSheet("lua/map/assets/" .. theme .. "/props.png", propsSheetFile:getSheet())
  animatedBlockSheet = graphics.newImageSheet("lua/map/assets/" .. theme .. "/animatedTiles.png", animatedBlockSheetFile:getSheet())
end

local function createAllElements(mapJson, cameraGroup, frontCameraGroup)
  local layers = mapJson.layers
  elements = {}
  startedClean = false
  local widthStarter = 1
  local widthEnd
  
  local function createElementsForLayer(layer, cameraGroup)
    for j = 1, layer.height do
      for i = widthStarter, widthEnd do
        local tileId = layer.data[(j - 1) * layer.width + i]
        if tileId ~= 0 then
          local block
          block = createElement(tileId, i, j, cameraGroup)
          if block then
            elements[#elements + 1] = block
          end
        end
      end
    end
  end
  
  local function createNewColumns(event)
    if startedClean then
      timer.cancel(event.source)
    end
    widthEnd = widthStarter + 15
    if widthEnd > mapWidth then
      widthEnd = mapWidth
    end
    for i = 1, #layers do
      if layers[i].name == "Front Layer" then
        createElementsForLayer(layers[i], frontCameraGroup)
      elseif string.sub(mapJson.layers[i].name, 1, 10) == "Background" then
      else
        createElementsForLayer(layers[i], cameraGroup)
      end
    end
    if widthEnd == mapWidth then
      timer.cancel(event.source)
      local respawnEvent = {name = "mapDone"}
      Runtime:dispatchEvent(respawnEvent)
    end
    widthStarter = widthEnd + 1
  end
  
  createNewColumns()
  timer.performWithDelay(50, createNewColumns, 0)
  return elements
end

local function clean()
  startedClean = true
end

M.createAllElements = createAllElements
M.loadImageData = loadImageData
M.clean = clean
return M
