local M = {}
local layers, theme, backdrop
local landmarkOffsets = {
  ["4.1-trunks"] = {
    x = 130,
    y = 302,
    width = 524,
    height = 176
  },
  ["4.4-shrooms"] = {
    x = 90,
    y = 200,
    width = 533,
    height = 270
  },
  ["4.4-thorns"] = {
    x = 106,
    y = 252,
    width = 555,
    height = 279
  },
  ["4.1-flowerfield"] = {
    x = 114,
    y = 300,
    width = 551,
    height = 182
  },
  ["4.1-big_trunk"] = {
    x = 316,
    y = 278,
    width = 228,
    height = 216
  },
  ["5.2_landmark_clothes"] = {
    x = 0,
    y = 0,
    width = 767,
    height = 641
  },
  ["5.4_landmark_flowers"] = {
    x = 0,
    y = 0,
    width = 767,
    height = 641
  },
  ["5.5_landmark_cannons"] = {
    x = 0,
    y = 0,
    width = 767,
    height = 641
  },
  ["5.5_cannons"] = {
    x = 0,
    y = 0,
    width = 767,
    height = 641
  },
  ["4.2_structure"] = {
    x = 0,
    y = 0,
    width = 767,
    height = 641
  },
  ["5.2_crystals"] = {
    x = 0,
    y = 0,
    width = 767,
    height = 641
  },
  ["5.4_spaceship"] = {
    x = 0,
    y = 0,
    width = 767,
    height = 641
  }
}

local function initLayers(numberOfLayers)
  layers = {}
  for i = 1, numberOfLayers do
    layers[i] = display.newGroup()
    layers[i].moved = 0
  end
end

local function createImage(layerId)
  local image
  if not backdrop then
    backdrop = "blue"
  end
  if backdrop == "tall" and layerId == 2 and theme == "town" then
    backdrop = "blue"
  end
  if backdrop == "dusk" and theme == "town" then
    backdrop = "blue"
  end
  local dimX = 480
  local dimY = 320
  local yOffset = 0
  local screenOriginX = display.screenOriginX or 0
  local screenOriginY = display.screenOriginY or 0
  local visibleWidth = math.ceil((display.actualContentWidth or display.contentWidth or 480) + math.abs(screenOriginX) * 2)
  local visibleHeight = math.ceil((display.actualContentHeight or display.contentHeight or 320) + math.abs(screenOriginY) * 2)
  local xOffset = math.floor(screenOriginX)
  if layerId == 2 then
    dimX = math.max(680, visibleWidth)
    dimY = 327
    if theme == "space" then
      yOffset = -10
    end
  elseif layerId == 3 then
    if theme == "space" then
      dimX = math.max(680, visibleWidth)
      dimY = 327
    else
      dimX = math.max(680, visibleWidth)
      dimY = 236
      yOffset = 110
    end
  else
    dimX = math.max(480, visibleWidth)
    dimY = math.max(320, visibleHeight)
  end
  image = display.newImageRect("images/map/" .. theme .. "/background/" .. layerId .. "_" .. backdrop .. ".png", dimX, dimY)
  if not image then
    local backdrop = "blue"
    image = display.newImageRect("images/map/" .. theme .. "/background/" .. layerId .. "_" .. backdrop .. ".png", dimX, dimY)
  end
  image.anchorX = 0
  image.anchorY = 0
  image.x = xOffset
  image.y = math.floor(screenOriginY) + yOffset
  layers[layerId]:insert(image)
  if 1 < layerId then
    for copyIndex = 1, 2 do
      local copy = display.newImageRect("images/map/" .. theme .. "/background/" .. layerId .. "_" .. backdrop .. ".png", dimX, dimY)
      if not copy then
        local fallbackBackdrop = "blue"
        copy = display.newImageRect("images/map/" .. theme .. "/background/" .. layerId .. "_" .. fallbackBackdrop .. ".png", dimX, dimY)
      end
      copy.anchorX = 0
      copy.anchorY = 0
      copy.x = image.x + copyIndex * image.width * image.xScale - (copyIndex + 1)
      copy.y = math.floor(screenOriginY) + yOffset
      layers[layerId]:insert(copy)
    end
  end
end

local function createCustomImage(layerId, imageId, x, y)
  local xDim = 767
  local yDim = 641
  if theme == "space" then
    xDim = 613.6
    yDim = 512.8
  end
  local image = display.newImageRect("images/map/" .. theme .. "/background/" .. layerId .. "." .. imageId .. ".png", xDim, yDim)
  image.anchorX = 0
  image.anchorY = 0
  image.x = x * 0.5
  image.y = y * 0.5
  layers[layerId]:insert(image)
end

local function createBackgroundProp(layerId, props, x, y)
  local offsets = landmarkOffsets[props]
  local imagePath = "images/map/" .. theme .. "/background/" .. props .. ".png"
  local image
  if offsets and offsets.width and offsets.height then
    image = display.newImageRect(imagePath, offsets.width, offsets.height)
  else
    image = display.newImage(imagePath)
  end
  if not image then
    return
  end
  if theme == "space" then
    image.width = image.width * 0.8
    image.height = image.height * 0.8
  end
  image.anchorX = 0
  image.anchorY = 0
  image.x = x * 0.5 + ((offsets and offsets.x) or 0)
  image.y = y * 0.5 + ((offsets and offsets.y) or 0)
  layers[layerId]:insert(image)
end

local function createBackgroundBeams(image, x, y)
  local beams = display.newImageRect("images/map/sunbeams" .. image .. ".png", 647, 600)
  if not beams then
    return
  end
  beams.anchorX = 0
  beams.anchorY = 0
  beams.x = x * 0.5
  beams.y = y * 0.5
  layers[6]:insert(beams)
end

local function createLoopingBackground()
  for i = 1, 3 do
    createImage(i)
  end
end

local function createCustomBackgroundLayer(layerData, index)
  local LayerParallaxFactor = 0.8
  if index == 4 then
    LayerParallaxFactor = 0.6
  end
  for i = 1, #layerData.objects do
    local objectX = layerData.objects[i].x
    local objectY = layerData.objects[i].y
    local x = objectX * LayerParallaxFactor
    local y = objectY * LayerParallaxFactor
    local image = layerData.objects[i].properties.image
    if image then
      createCustomImage(index, image, x, y)
    end
    local props = layerData.objects[i].properties.props
    if props then
      createBackgroundProp(index, props, x, y)
    end
    local landmark = layerData.objects[i].properties.landmark
    if landmark then
      createBackgroundProp(index, landmark, x, y)
    end
    local beams = layerData.objects[i].properties.beams
    if beams then
      createBackgroundBeams(beams, objectX * 0.7, objectY * 0.7)
    end
  end
end

local function createCustomBackgrounds(mapJson)
  for i = 1, #mapJson.layers do
    if string.sub(mapJson.layers[i].name, 1, 10) == "Background" then
      local index = 5 - (tonumber(string.sub(mapJson.layers[i].name, 11)) - 1)
      createCustomBackgroundLayer(mapJson.layers[i], index)
    end
  end
end

local function createBackground(id, mapJson)
  theme = mapJson.properties.theme
  backdrop = mapJson.properties.backdrop
  initLayers(6)
  createLoopingBackground()
  createCustomBackgrounds(mapJson)
  return layers
end

M.createBackground = createBackground
return M
