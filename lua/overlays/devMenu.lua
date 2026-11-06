-- hidden dev menu (settings: tap the title 7 times): shows the player's Dev ID and redeems dev codes
local composer = require("composer")
local screen = require("lua.modules.screen")
local devUnlock = require("lua.modules.devUnlock")
local scene = composer.newScene()
local clean, cleanEnter, codeField

local DESIGN_W, DESIGN_H = 480, 320
local HINT = "Send this ID to a developer to get a code for this account."

function scene:create(event)
  local group = self.view
  local box = screen.designBox(DESIGN_W, DESIGN_H)
  local s = box.scale
  local closed = false
  local checking = false

  local function newText(params)
    params.size = params.size * s
    local text = composer.newText(params)
    text.baseScale = 1 / s
    text.xScale, text.yScale = text.baseScale, text.baseScale
    return text
  end

  local alphaBackground = display.newRect(group, screen.centerX, screen.centerY, screen.width + 4, screen.height + 4)
  alphaBackground:setFillColor(0, 0, 0, 0.59)

  local designGroup = display.newGroup()
  designGroup.xScale, designGroup.yScale = s, s
  designGroup.x, designGroup.y = box.left, box.top
  group:insert(designGroup)
  local dropdownGroup = display.newGroup()
  designGroup:insert(dropdownGroup)
  local top = box.T

  local background = display.newImageRect(dropdownGroup, "images/gui/settings/pushWindow.png", 330, 240)
  background.anchorY = 0
  background.x, background.y = 240, top

  dropdownGroup:insert(newText({ string = "Dev menu", size = 18, x = 240, y = top + 60, color = { 1, 1, 1 } }))
  dropdownGroup:insert(newText({ string = "Your Dev ID", size = 12, x = 240, y = top + 88, color = { 1, 0.85, 0.6 } }))
  dropdownGroup:insert(newText({ string = devUnlock.getDevId(), size = 22, x = 240, y = top + 108, color = { 1, 1, 1 } }))
  local infoText = newText({ string = HINT, size = 11, x = 240, y = top + 132, color = { 1, 0.85, 0.6 } })
  dropdownGroup:insert(infoText)

  local function setInfo(message, color)
    infoText.text = message
    infoText:setFillColor(unpack(color or { 1, 0.85, 0.6 }))
    local fit = math.min(1, 300 / math.max(1, infoText.width * infoText.baseScale))
    infoText.xScale, infoText.yScale = infoText.baseScale * fit, infoText.baseScale * fit
  end

  local function close()
    native.setKeyboardFocus(nil)
    composer.hideOverlay()
  end

  local function redeem()
    if checking or not codeField then
      return
    end
    local code = codeField.getText()
    if code == "" then
      setInfo("Type or paste a dev code first.")
      return
    end
    native.setKeyboardFocus(nil)
    checking = true
    setInfo("Checking the code...")
    devUnlock.redeem(code, function(ok, message)
      checking = false
      if closed then
        return
      end
      if ok then
        composer.audio.play("collect_achievement")
        setInfo(message, { 0.6, 1, 0.6 })
        codeField.setText("")
      else
        composer.audio.play("no_powerup")
        setInfo(message, { 1, 0.55, 0.45 })
      end
    end)
  end

  local function createCodeField()
    if closed or codeField then
      return
    end
    codeField = require("lua.modules.textInput").new({
      parent = dropdownGroup,
      x = 240,
      y = top + 162,
      width = 290,
      height = 30,
      size = 12,
      placeholder = "Dev code",
      maxLength = 120,
      allowed = "[%w%-]",
      onChange = function()
        if not checking then
          setInfo(HINT)
        end
      end,
      onSubmit = redeem
    })
  end

  local closeButton = composer.newButton({
    x = 392,
    y = top + 64,
    width = 36,
    height = 32,
    image = "images/gui/common/buttonClosePopupBrown.png",
    onRelease = close
  })
  dropdownGroup:insert(closeButton)

  local redeemButton = composer.newButton({
    x = 240,
    y = top + 202,
    width = 116,
    height = 37,
    image = "images/gui/common/buttonTextA.png",
    text = { string = "Redeem", x = 0, y = 0 },
    onRelease = redeem
  })
  dropdownGroup:insert(redeemButton)

  local function escapeTouchEvent(event)
    if event.phase == "ended" and not checking then
      close()
    end
    return true
  end

  local function backgroundTouchEvent(event)
    if event.phase == "ended" then
      native.setKeyboardFocus(nil)
    end
    return true
  end

  alphaBackground:addEventListener("touch", escapeTouchEvent)
  background:addEventListener("touch", backgroundTouchEvent)

  function clean()
    closed = true
    display.remove(closeButton)
    display.remove(redeemButton)
    native.setKeyboardFocus(nil)
    if codeField then
      codeField.remove()
      codeField = nil
    end
    alphaBackground:removeEventListener("touch", escapeTouchEvent)
    background:removeEventListener("touch", backgroundTouchEvent)
  end

  composer.bouncer.down(dropdownGroup)
  if require("lua.modules.pcMode").isPC then
    createCodeField()
  else
    timer.performWithDelay(650, createCodeField)
  end
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
  if event.phase == "will" and cleanEnter then
    cleanEnter()
  end
end

function scene:destroy(event)
  if clean then
    clean()
  end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
