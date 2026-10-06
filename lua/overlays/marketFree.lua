local composer = require("composer")
local screen = require("lua.modules.screen")
local scene = composer.newScene()
local clean, cleanEnter, overlayEndedData, onCloseFunction

local DESIGN_W, DESIGN_H = 480, 320

function scene:create(event)
  local sceneGroup = self.view
  local params = event.params or {}
  local item = params.item or {}
  onCloseFunction = params.onCloseFunction
  local box = screen.designBox(DESIGN_W, DESIGN_H)
  local s = box.scale
  local top = box.T
  local countDownImage, countDownStartTimer, countDownTimer
  local countdownTick = 4

  local function newText(textParams)
    textParams.size = textParams.size * s
    if textParams.width then
      textParams.width = textParams.width * s
    end
    local text = composer.newText(textParams)
    text.xScale, text.yScale = 1 / s, 1 / s
    return text
  end

  local backgroundImage = display.newImageRect(sceneGroup, "images/gui/common/black.png", screen.width + 4, screen.height + 4)
  backgroundImage.x, backgroundImage.y = screen.centerX, screen.centerY
  local designGroup = display.newGroup()
  designGroup.xScale, designGroup.yScale = s, s
  designGroup.x, designGroup.y = box.left, box.top
  sceneGroup:insert(designGroup)
  local dropdownGroup = display.newGroup()
  designGroup:insert(dropdownGroup)

  local backgroundWindow = display.newImageRect(dropdownGroup, "images/gui/market/popup/window.png", 215, 200)
  backgroundWindow.anchorY = 0
  backgroundWindow.x, backgroundWindow.y = 240, top
  local windowInfo = newText({ string = composer.localized.get("Yougot"), size = 18, color = { 1, 1, 1 } })
  windowInfo.x, windowInfo.y = 242, top + 56
  dropdownGroup:insert(windowInfo)
  local itemInfo = newText({ string = item.title or "", size = 24, color = { 1, 1, 1 }, width = 180, align = "center" })
  itemInfo.x, itemInfo.y = 240, top + 180
  itemInfo.isVisible = false
  dropdownGroup:insert(itemInfo)

  local plate
  if item.plate then
    plate = display.newImageRect(dropdownGroup, "images/gui/market/items/plate/" .. item.plate .. ".png", 35, 15)
  end
  if plate then
    plate.x, plate.y = 243, top + 130
    plate.isVisible = false
  end
  local icon = item.imagePath and display.newImageRect(dropdownGroup, item.imagePath, 50, 56)
  if icon then
    icon.x, icon.y = 240, top + 100
    icon.isVisible = false
  else
    itemInfo.text = composer.localized.get("updatetouse")
    itemInfo.y = itemInfo.y - 40
  end

  local function showCountdownNumber()
    display.remove(countDownImage)
    countDownImage = display.newImageRect(dropdownGroup, "images/game/countdown" .. countdownTick .. ".png", 129, 70)
    if countDownImage then
      countDownImage.x, countDownImage.y = 245, top + 105
      countDownImage:scale(0.1, 0.1)
      transition.to(countDownImage, { time = 400, xScale = 0.8, yScale = 0.8, transition = easing.outBounce })
      transition.to(countDownImage, { time = 400, delay = 500, alpha = 0 })
    end
  end

  local function doTick()
    countDownTimer = nil
    countdownTick = countdownTick - 1
    if countdownTick < 1 then
      if plate then
        plate.isVisible = true
      end
      if icon then
        icon.isVisible = true
      end
      itemInfo.isVisible = true
    else
      showCountdownNumber()
      countDownTimer = timer.performWithDelay(1000, doTick, 1)
    end
  end

  local btnExit = composer.newButton({
    image = "images/gui/common/buttonClosePopupBrown.png",
    onRelease = function()
      composer.hideOverlay()
    end,
    width = 34,
    height = 30,
    x = 334,
    y = top + 66
  })
  dropdownGroup:insert(btnExit)

  local function escapeTouchEvent(touchEvent)
    if touchEvent.phase == "ended" then
      composer.hideOverlay()
    end
    return true
  end

  local function swallowTouch()
    return true
  end

  backgroundImage:addEventListener("touch", escapeTouchEvent)
  backgroundWindow:addEventListener("touch", swallowTouch)

  function clean()
    display.remove(btnExit)
    if countDownTimer then
      timer.cancel(countDownTimer)
      countDownTimer = nil
    end
    if countDownStartTimer then
      timer.cancel(countDownStartTimer)
      countDownStartTimer = nil
    end
    if countDownImage then
      transition.cancel(countDownImage)
    end
    backgroundImage:removeEventListener("touch", escapeTouchEvent)
    backgroundWindow:removeEventListener("touch", swallowTouch)
  end

  countDownStartTimer = timer.performWithDelay(500, function()
    countDownStartTimer = nil
    doTick()
  end, 1)
  composer.bouncer.down(dropdownGroup)
end

function scene:show(event)
  if event.phase == "will" then
    return
  end
  local androidLogic = require("lua.modules.androidBackButton")

  function cleanEnter()
    androidLogic.isOverlay(false)
  end

  androidLogic.isOverlay(true)
end

function scene:hide(event)
  local phase = event.phase
  if phase == "will" then
    if cleanEnter then
      cleanEnter()
    end
  elseif phase == "did" and event.parent and event.parent.overlayEnded then
    event.parent:overlayEnded(overlayEndedData)
    overlayEndedData = nil
  end
end

function scene:destroy(event)
  if onCloseFunction then
    onCloseFunction()
    onCloseFunction = nil
  end
  if clean then
    clean()
  end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
