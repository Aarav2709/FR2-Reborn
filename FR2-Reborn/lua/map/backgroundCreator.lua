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
  local dimX = 480
  local dimY = 320
  local yOffset = 0
  if layerId == 2 then
    dimX = 680
    dimY = 327
  elseif layerId == 3 then
    dimX = 680
    dimY = 236
    yOffset = 110
  end
  image = display.newImageRect("images/map/" .. theme .. "/background/" .. layerId .. "_" .. backdrop .. ".png", dimX, dimY)
  if not image then
    local backdrop = "blue"
    image = display.newImageRect("images/map/" .. theme .. "/background/" .. layerId .. "_" .. backdrop .. ".png", dimX, dimY)
  end
  image.anchorX = 0
  image.anchorY = 0
  image.x = 0
  image.y = 0 + yOffset
  layers[layerId]:insert(image)
  if 1 < layerId then
    local image2 = display.newImageRect("images/map/" .. theme .. "/background/" .. layerId .. "_" .. backdrop .. ".png", dimX, dimY)
    if not image2 then
      local backdrop = "blue"
      image2 = display.newImageRect("images/map/" .. theme .. "/background/" .. layerId .. "_" .. backdrop .. ".png", dimX, dimY)
    end
    image2.anchorX = 0
    image2.anchorY = 0
    image2.x = image.x + image.width * image.xScale - 2
    image2.y = 0 + yOffset
    layers[layerId]:insert(image2)
    local image3 = display.newImageRect("images/map/" .. theme .. "/background/" .. layerId .. "_" .. backdrop .. ".png", dimX, dimY)
    if not image3 then
      local backdrop = "blue"
      image3 = display.newImageRect("images/map/" .. theme .. "/background/" .. layerId .. "_" .. backdrop .. ".png", dimX, dimY)
    end
    image3.anchorX = 0
    image3.anchorY = 0
    image3.x = image.x + 2 * image.width * image.xScale - 3
    image3.y = 0 + yOffset
    layers[layerId]:insert(image3)
  end
end

local function createCustomImage(layerId, imageId, x, y)
  local xDim = 767
  local yDim = 641
  local image = display.newImageRect("images/map/" .. theme .. "/background/" .. layerId .. "." .. imageId .. ".png", xDim, yDim)
  image.anchorX = 0
  image.anchorY = 0
  image.x = x * 0.5
  image.y = y * 0.5
  layers[layerId]:insert(image)
end

local function createBackgroundProp(layerId, props, x, y)
  local offsets = landmarkOffsets[props]
  local image = display.newImageRect("images/map/" .. theme .. "/background/" .. props .. ".png", offsets.width, offsets.height)
  if not image then
    return
  end
  image.anchorX = 0
  image.anchorY = 0
  image.x = x * 0.5 + offsets.x
  image.y = y * 0.5 + offsets.y
  layers[layerId]:insert(image)
end

local function createBackgroundBeams(image, x, y)
  local image = display.newImageRect("images/map/sunbeams" .. image .. ".png", 647, 600)
  if not image then
    return
  end
  image.anchorX = 0
  image.anchorY = 0
  image.x = x * 0.5
  image.y = y * 0.5
  layers[6]:insert(image)
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
