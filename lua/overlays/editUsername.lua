local composer = require("composer")
local screen = require("lua.modules.screen")
local scene = composer.newScene()
local clean, cleanEnter, nameTextField

-- Rename sign in the original 480x320 design units: it hangs from the top of the
-- screen, with the currency board in its usual corner.
local DESIGN_W, DESIGN_H = 480, 320

function scene:create(event)
  local group = self.view
  local box = screen.designBox(DESIGN_W, DESIGN_H)
  local s = box.scale
  local price = composer.storeConfig.getUsernameChangePrice()
  local continueButton

  local function newText(params)
    params.size = (params.size or composer.localized.getFontSize()) * s
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

  local background = display.newImageRect(dropdownGroup, "images/gui/settings/windowRename.png", 350, 137)
  background.anchorY = 0
  background.x, background.y = 240, top

  local backgroundCoins = display.newImageRect(designGroup, "images/gui/market/currentCoins.png", 70, 81)
  backgroundCoins.anchorX, backgroundCoins.anchorY = 0, 0
  backgroundCoins.x, backgroundCoins.y = box.SR - 80, top

  local function newCurrencyLabel(value, y, color)
    local label = newText({ string = value, size = 14, x = backgroundCoins.x + 24, y = top + y, ax = 0, color = color })
    designGroup:insert(label)
    return label
  end

  local moneyValue = composer.database.getMoney()
  local gemValue = composer.database.getGems()
  local moneyLabel = newCurrencyLabel(moneyValue, 69, { 1, 1, 1 })
  local moneyLabelRed = newCurrencyLabel(moneyValue, 69, { 1, 0, 0 })
  moneyLabelRed.alpha = 0
  newCurrencyLabel(gemValue, 41, { 1, 1, 1 })

  local info = newText({ string = composer.localized.get("SetUsername"), size = 25, x = 240, y = top + 25, color = { 1, 1, 1 } })
  dropdownGroup:insert(info)
  local infoText = newText({ string = "", size = 13, x = 200, y = top + 111, color = { 1, 0.85, 0.6 } })
  dropdownGroup:insert(infoText)

  -- The name is typed on a cream plank drawn in the game's style; the phone's own
  -- text box sits on it without a background, in the game font.
  local INPUT_X, INPUT_Y, INPUT_W, INPUT_H = 200, top + 80, 200, 32
  local inputBox = display.newRoundedRect(dropdownGroup, INPUT_X, INPUT_Y, INPUT_W, INPUT_H, 7)
  inputBox:setFillColor(0.98, 0.93, 0.8)
  inputBox:setStrokeColor(0.36, 0.22, 0.12)
  inputBox.strokeWidth = 2
  local keyboardOpen = false

  local function onNameInput(event)
    if event.phase == "began" then
      keyboardOpen = true
      infoText.text = ""
    elseif event.phase == "ended" or event.phase == "submitted" then
      keyboardOpen = false
    end
    nameTextField.limit(event)
  end

  -- Native objects don't follow the sign's drop-in animation, so the text box is
  -- created once the sign has landed, in screen units.
  local function createNameField()
    if not background or not background.parent then
      return
    end
    local fieldX = box.left + INPUT_X * s
    local fieldY = box.top + INPUT_Y * s
    nameTextField = native.newTextField(fieldX, fieldY, (INPUT_W - 16) * s, (INPUT_H - 4) * s)
    nameTextField.hasBackground = false
    nameTextField.font = native.newFont(composer.data.font or native.systemFontBold, 17 * s)
    nameTextField:setTextColor(0.29, 0.16, 0.06)
    nameTextField.align = "center"
    nameTextField.placeholder = composer.localized.get("Username")
    nameTextField.text = composer.database.getPlayerInformation().username
    nameTextField.limit = composer.validateInput.limitTextField(15)
    nameTextField.userInput = onNameInput
    nameTextField:addEventListener("userInput", onNameInput)
    group:insert(nameTextField)
    if not isAndroid then
      native.setKeyboardFocus(nameTextField)
    end
  end

  local function giveCoinFeedback()
    local base = moneyLabel.baseScale
    transition.to(moneyLabel, { time = 100, xScale = base * 1.2, yScale = base * 1.2 })
    transition.to(moneyLabel, { time = 100, delay = 200, xScale = base, yScale = base })
    transition.to(moneyLabelRed, { time = 100, xScale = base * 1.2, yScale = base * 1.2, alpha = 1 })
    transition.to(moneyLabelRed, { time = 100, delay = 200, xScale = base, yScale = base, alpha = 0 })
  end

  local function canPlayerAffordItem()
    if price and composer.database.getMoney() >= price then
      composer.analytics.newEvent("design", {
        event_id = "rename:coins",
        area = composer.config.fullVersion
      })
      return true
    end
    composer.audio.play("no_powerup")
    giveCoinFeedback()
    return false
  end

  local function close()
    native.setKeyboardFocus(nil)
    composer.hideOverlay()
  end

  -- A tap outside the sign first puts the keyboard away, then closes the sign.
  local function escapeTouchEvent(event)
    if event.phase == "ended" then
      if keyboardOpen then
        keyboardOpen = false
        native.setKeyboardFocus(nil)
      else
        close()
      end
    end
    return true
  end

  local function backgroundImageTouchEvent(event)
    if event.phase == "ended" then
      native.setKeyboardFocus(nil)
    end
    return true
  end

  local closeButton = composer.newButton({
    x = 380,
    y = top + 32,
    width = 43,
    height = 38,
    image = "images/gui/common/buttonClosePopupBrown.png",
    onRelease = close
  })
  dropdownGroup:insert(closeButton)

  local function continueButtonEvent()
    if not nameTextField then
      return
    end
    if canPlayerAffordItem() then
      local newName, nameError = composer.validateInput.validateUsername(nameTextField.text)
      if not newName then
        infoText.text = composer.localized.get(nameError)
        composer.analytics.newEvent("design", {
          event_id = "renameUser:invalidUsername",
          area = composer.config.fullVersion
        })
      else
        composer.commHttps.changeUsername(newName)
        composer.analytics.newEvent("design", {
          event_id = "renameUser:attempt",
          area = composer.config.fullVersion
        })
        close()
      end
    end
  end

  continueButton = composer.newButton({
    x = 350,
    y = INPUT_Y,
    width = 62,
    height = 45,
    text = {
      string = price,
      y = 7,
      x = 0
    },
    image = "images/gui/settings/buttonRenameCoins.png",
    onRelease = continueButtonEvent
  })
  dropdownGroup:insert(continueButton)

  alphaBackground:addEventListener("touch", escapeTouchEvent)
  background:addEventListener("touch", backgroundImageTouchEvent)

  function clean()
    display.remove(closeButton)
    display.remove(continueButton)
    native.setKeyboardFocus(nil)
    if nameTextField then
      nameTextField:removeEventListener("userInput", nameTextField.userInput)
      display.remove(nameTextField)
      nameTextField = nil
    end
    alphaBackground:removeEventListener("touch", escapeTouchEvent)
    background:removeEventListener("touch", backgroundImageTouchEvent)
  end

  composer.bouncer.down(dropdownGroup)
  timer.performWithDelay(650, createNameField)
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
