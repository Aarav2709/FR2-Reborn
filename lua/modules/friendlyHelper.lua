local M = {}
local composer = require("composer")
local monsterLoader = require("spine-corona.monsterLoader")
local bubbleGroup, helperText, helperTextBuble, alphaBackground, closeImage, cleanOldOverlay, canClose, monster, monsterGroup, onCloseFunction, refreshTimer, helperTextBubbleArrow
local bubbleArrowOffsetX = 0
local bubbleArrowOffsetY = -20

local function closeOnTouchEvent(event)
  if event.phase == "ended" and canClose then
    cleanOldOverlay()
    if onCloseFunction then
      local keepOnCloseFunction = onCloseFunction()
      if not keepOnCloseFunction then
        onCloseFunction = nil
      end
    end
  end
  return true
end

local function androidBackButtonFunction()
  onCloseFunction = nil
  cleanOldOverlay()
end

local function allowCustomOverlay()
  composer.customOverlayActive = false
end

function cleanOldOverlay()
  if alphaBackground then
    alphaBackground:removeEventListener("touch", closeOnTouchEvent)
    alphaBackground:removeSelf()
    alphaBackground = nil
  end
  transition.cancel("helperTransition")
  if monster then
    monster.clean()
    monster = nil
  end
  if bubbleGroup then
    bubbleGroup:removeSelf()
    bubbleGroup = nil
  end
  if helperTextBuble then
    helperTextBuble:removeSelf()
    helperTextBuble = nil
  end
  if closeImage then
    closeImage:removeSelf()
    closeImage = nil
  end
  if helperTextBubbleArrow then
    helperTextBubbleArrow:removeSelf()
    helperTextBubbleArrow = nil
  end
  if helperText then
    helperText:removeSelf()
    helperText = nil
  end
  refreshTimer = timer.performWithDelay(400, allowCustomOverlay, 1)
end

local function addListeners()
  alphaBackground:addEventListener("touch", closeOnTouchEvent)
end

local function createMessage(message, group, monsterData, animateHelper)
  cleanOldOverlay()
  bubbleGroup = display.newGroup()
  if refreshTimer then
    timer.cancel(refreshTimer)
    refreshTimer = nil
  end
  local text = message
  if text == nil then
    composer.getText("SOMETHING WENT WRONG")
  end
  alphaBackground = display.newRect(0, 0, display.contentWidth, display.contentHeight)
  alphaBackground.anchorX = 0
  alphaBackground.anchorY = 0
  alphaBackground:setFillColor(0, 0, 0, 0.5882352941176471)
  alphaBackground.x = 0
  alphaBackground.y = 0
  monster = monsterLoader.new(monsterData)
  monsterGroup = monster.getGroup()
  monsterGroup.xScale = 0.75
  monsterGroup.yScale = 0.75
  monsterGroup.x = -200
  monsterGroup.y = display.contentHeight + 25
  monsterGroup.anchorX = 0
  monsterGroup.anchorY = 1
  if not animateHelper then
    monsterGroup.x = monsterGroup.width * 0.25 + 10
  end
  local monsterWidth = 80
  helperTextBuble = display.newImageRect("images/gui/tutorial/helper/bubble2.png", 445, 158)
  helperTextBuble.anchorX = 0
  helperTextBuble.anchorY = 1
  helperTextBuble:scale(0.05, 0.5)
  helperTextBuble.isVisible = false
  bubbleGroup:insert(helperTextBuble)
  helperTextBubbleArrow = display.newImageRect("images/gui/tutorial/helper/bubble_Arrow.png", 53, 47)
  helperTextBubbleArrow.anchorX = 0.5
  helperTextBubbleArrow.anchorY = 0.5
  helperTextBubbleArrow:scale(0.05, 0.5)
  helperTextBubbleArrow.isVisible = false
  helperTextBubbleArrow.x = -3
  helperTextBubbleArrow.y = -30
  bubbleGroup:insert(helperTextBubbleArrow)
  closeImage = display.newImageRect("images/gui/common/buttonClosePopup.png", 86, 76)
  closeImage.anchorX = 0.5
  closeImage.anchorY = 0.5
  closeImage:scale(0.25, 0.25)
  closeImage.alpha = 0
  closeImage.x = helperTextBuble.width * 0.5 - 8
  closeImage.y = -helperTextBuble.height * 0.5 + 8
  bubbleGroup:insert(closeImage)
  bubbleGroup.x = monsterWidth
  bubbleGroup.y = display.contentHeight
  helperText = composer.newText({
    string = text,
    size = 14,
    color = {
      0,
      0,
      0
    },
    width = 180,
    align = "center"
  })
  helperText.anchorX = 0.5
  helperText.anchorY = 0.5
  helperText.isVisible = false
  helperText.alpha = 0
  helperText.xScale = 0.01
  helperText.yScale = 0.01
  helperText.x = 111.25
  helperText.y = -39.5
  bubbleGroup:insert(helperText)
  
  local function showText()
    helperText.isVisible = true
    transition.to(helperText, {
      time = 300,
      alpha = 1,
      xScale = 1,
      yScale = 1,
      transition = easing.outCubic,
      tag = "helperTransition"
    })
  end
  
  local function animateSpeechBubble()
    if not monsterGroup or not helperTextBuble then
      return
    end
    helperTextBuble.isVisible = true
    helperTextBuble.x = 0
    helperTextBuble.y = 0
    helperTextBubbleArrow.isVisible = true
    local newPosition = 0
    transition.to(helperTextBuble, {
      time = 50,
      onComplete = showText,
      tag = "helperTransition"
    })
    transition.to(helperTextBuble, {
      time = 300,
      x = newPosition,
      xScale = 0.5,
      yScale = 0.5,
      transition = easing.outCubic,
      tag = "helperTransition"
    })
    transition.to(helperTextBubbleArrow, {
      time = 300,
      xScale = 0.5,
      yScale = 0.5,
      transition = easing.outBounce,
      tag = "helperTransition"
    })
    transition.to(closeImage, {
      time = 200,
      alpha = 0.5,
      tag = "helperTransition",
      delay = 500
    })
  end
  
  local function animateHelperOnScreen()
    transition.to(monsterGroup, {
      time = 300,
      x = monsterWidth * 0.25 + 10,
      transition = easing.outCubic,
      onComplete = animateSpeechBubble,
      tag = "helperTransition"
    })
  end
  
  group:insert(alphaBackground)
  group:insert(monsterGroup)
  group:insert(bubbleGroup)
  canClose = false
  
  local function allowClose()
    canClose = true
  end
  
  timer.performWithDelay(1000, allowClose, 1)
  addListeners()
  composer.customOverlayActive = true
  if animateHelper then
    animateHelperOnScreen()
  else
    animateSpeechBubble()
  end
end

local function setOnCloseFunction(closeFunction)
  onCloseFunction = closeFunction
end

M.createMessage = createMessage
M.setOnCloseFunction = setOnCloseFunction
M.cleanOldOverlay = cleanOldOverlay
return M
