local composer = require("composer")
local screen = require("lua.modules.screen")
local scene = composer.newScene()
local clean, cleanEnter, nameTextField

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

  local INPUT_X, INPUT_Y, INPUT_W, INPUT_H = 200, top + 80, 200, 32
  local textInput = require("lua.modules.textInput")
  local playerInfo = composer.database.getPlayerInformation() or {}
  local currentName = tostring(playerInfo.username or "")
  if playerInfo.usernameCode then
    local suffix = "#" .. tostring(playerInfo.usernameCode)
    if currentName:sub(-#suffix) ~= suffix then
      currentName = currentName .. suffix
    end
  end
  local continueButtonEvent

  local function createNameField()
    if not background or not background.parent or nameTextField then
      return
    end
    nameTextField = textInput.new({
      parent = dropdownGroup,
      x = INPUT_X,
      y = INPUT_Y,
      width = INPUT_W,
      height = INPUT_H,
      size = 17,
      text = currentName,
      placeholder = composer.localized.get("Username"),
      maxLength = 20,
      allowed = "[%w#]",
      onChange = function()
        infoText.text = ""
      end,
      onSubmit = function()
        if continueButtonEvent then
          continueButtonEvent()
        end
      end
    })
    nameTextField.focus()
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

  local function escapeTouchEvent(event)
    if event.phase == "ended" then
      close()
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

  function continueButtonEvent()
    if not nameTextField then
      return
    end
    if canPlayerAffordItem() then
      local newName, tagOrError = composer.validateInput.validateUsernameWithTag(nameTextField.getText())
      if not newName then
        infoText.text = tagOrError
        local fit = math.min(1, 260 / math.max(1, infoText.width * infoText.baseScale))
        infoText.xScale, infoText.yScale = infoText.baseScale * fit, infoText.baseScale * fit
        composer.analytics.newEvent("design", {
          event_id = "renameUser:invalidUsername",
          area = composer.config.fullVersion
        })
      else
        composer.commHttps.changeUsername(newName, tagOrError)
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
      nameTextField.remove()
      nameTextField = nil
    end
    alphaBackground:removeEventListener("touch", escapeTouchEvent)
    background:removeEventListener("touch", backgroundImageTouchEvent)
  end

  composer.bouncer.down(dropdownGroup)
  if require("lua.modules.pcMode").isPC then
    createNameField()
  else
    timer.performWithDelay(650, createNameField)
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
