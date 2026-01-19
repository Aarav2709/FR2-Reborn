local composer = require("composer")
local font = "Brady Bunch Remastered"
if isAndroid then
  font = "BradyBunchRemastered"
end

local function createAdvancedText(params)
  local text = params.string
  local size = params.size
  local color = params.color
  local x = params.x
  local y = params.y
  local width = params.width
  local height = params.height
  local anchorX = params.ax
  local anchorY = params.ay
  local align = params.align
  local embos = true
  if text == nil then
    text = ""
    print("WARNING: text in newText is nil")
  end
  if x == nil then
    x = 0
  end
  if y == nil then
    y = 0
  end
  if color == nil then
    color = {
      0,
      0,
      0,
      1
    }
    params.noFade = true
  end
  if #color == 3 then
    color[4] = 1
  end
  for i = 1, #color do
    if color[i] ~= 1 then
      embos = false
    end
  end
  if size == nil then
    size = composer.localized.getFontSize()
  end
  if width == nil then
    width = 0
  end
  if height == nil then
    height = 0
  end
  text = string.upper(text)
  local textOptions = {
    text = text,
    width = width,
    height = height,
    fontSize = size,
    font = font,
    align = align
  }
  local newText
  if embos then
    newText = display.newEmbossedText(textOptions)
  else
    newText = display.newText(textOptions)
  end
  newText:setFillColor(color[1], color[2], color[3], color[4])
  newText.x = x
  newText.y = y
  if anchorX then
    newText.anchorX = anchorX
  end
  if anchorY then
    newText.anchorY = anchorY
  end
  
  local function fadeColor()
    if params.noFade then
    else
      newText:setFillColor(0.5)
    end
  end
  
  local function returnToNormalColor()
    newText:setFillColor(color[1], color[2], color[3], color[4])
  end
  
  newText.fadeColor = fadeColor
  newText.returnToNormalColor = returnToNormalColor
  return newText
end

local function newNormalText(text, x, y)
  local params = {}
  params.string = text
  params.size = composer.localized.getFontSize()
  params.color = {
    0.0784313725490196,
    0.0784313725490196,
    0.0784313725490196,
    1
  }
  params.x = 0
  params.y = 0
  params.noFade = true
  if x and y then
    params.x = x
    params.y = y
  end
  return createAdvancedText(params)
end

local function newText(params)
  if type(params) == "table" then
    return createAdvancedText(params)
  else
    return newNormalText(params, x, y)
  end
end

composer.newText = newText

local function newButtonText(params, x, y)
  if type(params) == "table" then
    if params.x and params.y then
      params.x = params.x + x
      params.y = params.y + y
    else
      params.x = x
      params.y = y
    end
    return createAdvancedText(params)
  else
    return newNormalText(params, x, y)
  end
end

composer.newButtonText = newButtonText
