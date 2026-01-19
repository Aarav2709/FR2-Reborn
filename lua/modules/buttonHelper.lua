local composer = require("composer")
local widget = require("widget")

local function newButton(params)
  local buttonGroup = display.newGroup()
  local widthSize = params.width
  local heightSize = params.height
  local x = params.x - widthSize * 0.5
  local y = params.y - heightSize * 0.5
  local imagePath = params.image
  local textInfo = params.text
  local noSound = params.noSound
  local noFill = params.noFill
  local button, text, textColor
  local clickStartedInButton = false
  
  local function handleButtonEvent(event)
    if "began" == event.phase then
      clickStartedInButton = true
      if noSound then
      else
        composer.audio.play("button_press")
      end
      if noFill then
      else
        button:setFillColor(0.5)
        if text then
          text.fadeColor()
        end
      end
      if params.onPress then
        params.onPress(event)
      end
    elseif "ended" == event.phase then
      if clickStartedInButton then
        if params.onRelease then
          params.onRelease(event)
        end
        button:setFillColor(1)
        if text then
          text.returnToNormalColor()
        end
      end
      clickStartedInButton = false
    elseif "cancelled" == event.phase then
      button:setFillColor(1)
      if text then
        text.returnToNormalColor()
      end
      clickStartedInButton = false
    end
  end
  
  local function changeButtonImage(displayObject, imagePath)
    if button then
      button:removeSelf()
      button = nil
      button = composer.newButton({
        left = x,
        top = y,
        width = widthSize,
        height = heightSize,
        font = composer.data.font,
        defaultFile = imagePath,
        onPress = params.onPress,
        onRelease = params.onRelease
      })
    end
    displayObject:insert(button)
    return button
  end
  
  button = widget.newButton({
    left = x,
    top = y,
    width = widthSize,
    height = heightSize,
    font = composer.data.font,
    defaultFile = imagePath,
    onEvent = handleButtonEvent
  })
  
  local function getX()
    return params.x
  end
  
  local function getY()
    return params.y
  end
  
  local function changeText(newText)
    if newText and text then
      text.text = newText
    end
  end
  
  buttonGroup:insert(button)
  buttonGroup.changeButtonImage = changeButtonImage
  buttonGroup.getX = getX
  buttonGroup.getY = getY
  buttonGroup.changeText = changeText
  if textInfo then
    text = composer.newButtonText(textInfo, params.x, params.y)
    textColor = text.fillColor
    buttonGroup:insert(text)
  end
  return buttonGroup
end

composer.newButton = newButton
