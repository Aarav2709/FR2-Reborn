local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter, usernameTextField, informationTextLabel, possibleFriendsTable, limitField, hildeInputFields

function scene:create(event)
  local group = self.view
  local textFieldSize = 30
  local backButton
  if isAndroid then
    textFieldSize = 40
  end
  local alphaBackground = display.newRect(0, 0, display.contentWidth, display.contentHeight)
  alphaBackground.anchorX = 0
  alphaBackground.anchorY = 0
  alphaBackground:setFillColor(0, 0, 0, 0.5882352941176471)
  alphaBackground.x = 0
  alphaBackground.y = 0
  local tableBackground = display.newImageRect("images/gui/friends/mainWindow.png", 330, 320)
  tableBackground.anchorX = 0.5
  tableBackground.anchorY = 0
  tableBackground.x = 240
  tableBackground.y = 0
  local tableTitleBakground = display.newImageRect("images/gui/friends/header.png", 306, 38)
  tableTitleBakground.anchorX = 0.5
  tableTitleBakground.anchorY = 0
  tableTitleBakground.x = 240
  tableTitleBakground.y = 0
  local infoText = composer.newText({
    string = composer.localized.get("Add friend"),
    size = 30,
    x = display.contentWidth * 0.5,
    y = 16,
    color = {
      1,
      1,
      1
    }
  })
  usernameTextField = native.newTextField(display.contentWidth * 3, display.contentHeight * 0.2, 200, textFieldSize)
  usernameTextField.anchorX = 0.5
  usernameTextField.anchorY = 0.5
  usernameTextField.x = display.contentWidth * 0.5
  usernameTextField.y = display.contentHeight * 0.25
  usernameTextField.userInput = composer.validateInput.limitTextField(15)
  usernameTextField:addEventListener("userInput", usernameTextField.userInput)
  informationTextLabel = composer.newText({
    string = "",
    size = 20,
    x = display.contentWidth * 0.5,
    y = 140,
    width = 200,
    color = {
      1,
      1,
      1
    }
  })
  local inputBackground = display.newImageRect("images/gui/friends/searchCover.png", 300, 55)
  inputBackground.x = usernameTextField.x
  inputBackground.y = usernameTextField.y + 6
  
  local function closeOverlayButtonEvent()
    composer.hideOverlay()
  end
  
  local function backButtonEvent()
    composer.showOverlay("lua.overlays.messages", {isModal = true})
  end
  
  local function escapeTouchEvent(event)
    if event.phase == "ended" then
      if false then
        native.setKeyboardFocus(nil)
      else
        composer.hideOverlay()
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
  
  if event.params and event.params.friendScene then
    backButton = composer.newButton({
      x = 116,
      y = 22,
      width = 43,
      height = 38,
      image = "images/gui/friends/back.png",
      onRelease = backButtonEvent
    })
  end
  local closeOverlayButton = composer.newButton({
    x = 370,
    y = 22,
    width = 43,
    height = 38,
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = closeOverlayButtonEvent
  })
  
  local function searchForFriendButtonEvent()
    native.setKeyboardFocus(nil)
    local usernameTable, usernameError = composer.validateInput.validateUsernameSearch(usernameTextField.text)
    if not usernameTable and isSimulator then
      usernameTable = {}
      usernameTable[1] = "hauki"
      usernameTable[2] = nil
    end
    if not usernameTable then
      informationTextLabel.text = usernameError
      composer.analytics.newEvent("design", {
        event_id = "search:noUsername",
        area = composer.config.fullVersion
      })
    else
      composer.comm.playerSearch(usernameTable[1], usernameTable[2])
      informationTextLabel.text = ""
      composer.analytics.newEvent("design", {
        event_id = "search:username",
        value = #usernameTable,
        area = composer.config.fullVersion
      })
    end
    if possibleFriendsTable then
      possibleFriendsTable.cleanTable()
    end
  end
  
  local searchForFriendButton = composer.newButton({
    x = 360,
    y = 78,
    width = 39,
    height = 39,
    image = "images/gui/friends/search.png",
    onRelease = searchForFriendButtonEvent
  })
  
  local function updateDisplayGroup()
    group:insert(alphaBackground)
    group:insert(tableBackground)
    group:insert(tableTitleBakground)
    group:insert(inputBackground)
    group:insert(infoText)
    group:insert(usernameTextField)
    group:insert(informationTextLabel)
    group:insert(closeOverlayButton)
    if backButton then
      group:insert(backButton)
    end
    group:insert(searchForFriendButton)
  end
  
  local function addListeners()
    alphaBackground:addEventListener("touch", escapeTouchEvent)
    tableBackground:addEventListener("touch", backgroundImageTouchEvent)
  end
  
  function limitField(getObj)
    return function(event)
      if string.len(usernameTextField.text) > 15 then
        usernameTextField.text = usernameTextField.text:sub(1, 15)
      end
      if "ended" == event.phase then
      elseif "submitted" == event.phase then
        native.setKeyboardFocus(nil)
      end
    end
  end
  
  function hildeInputFields(hide)
    if hide then
      usernameTextField.isVisible = false
      searchForFriendButton.isVisible = false
    else
      usernameTextField.isVisible = true
      searchForFriendButton.isVisible = true
    end
  end
  
  function clean()
    display.remove(searchForFriendButton)
    display.remove(closeOverlayButton)
    if backButton then
      display.remove(backButton)
    end
    alphaBackground:removeEventListener("touch", escapeTouchEvent)
    tableBackground:removeEventListener("touch", backgroundImageTouchEvent)
  end
  
  updateDisplayGroup()
  addListeners()
end

function scene:show(event)
  local group = self.view
  local phase = event.phase
  if phase == "will" then
    return
  end
  local tableHelper = require("lua.modules.tableHelper")
  local tcpFormat = require("lua.network.tcpMessageFormat")
  local androidLogic = require("lua.modules.androidBackButton")
  local possibleFriendsGroup = display.newGroup()
  possibleFriendsGroup.x = 105
  possibleFriendsGroup.y = 112
  possibleFriendsGroup.isVisible = false
  
  local function tableCallback(playerId)
    composer.comm.addFriend(playerId, true)
  end
  
  possibleFriendsTable = tableHelper.new(0, 0, 270, 208, 55, nil, "findFriends", tableCallback, 10)
  
  local function tcpCallback(data)
    if data.r then
      if data.r == 35 then
        informationTextLabel.text = composer.localized.get("CantAddYourself")
      elseif data.r == 36 then
        composer.createCustomOverlay(41)
      elseif data.r == 69 then
        composer.createCustomOverlay(42)
      elseif data.r == 71 then
        composer.createCustomOverlay(40)
      end
    elseif data.m == tcpFormat.playerSearch() and data.f then
      if #data.f == 0 then
        informationTextLabel.text = composer.localized.get("NoPlayer")
      else
        possibleFriendsTable.cleanTable()
        possibleFriendsTable.createTable(data.f, possibleFriendsGroup)
        possibleFriendsGroup:insert(possibleFriendsTable.getTable())
        possibleFriendsGroup.isVisible = true
      end
    end
  end
  
  local function updateDisplayGroup()
    group:insert(possibleFriendsGroup)
    group:insert(informationTextLabel)
  end
  
  function cleanEnter()
    if possibleFriendsTable then
      possibleFriendsTable.cleanTable()
      possibleFriendsTable = nil
    end
    androidLogic.isOverlay(false)
  end
  
  androidLogic.isOverlay(true)
  updateDisplayGroup()
  composer.comm.setCallback(tcpCallback)
  if not isAndroid then
    native.setKeyboardFocus(usernameTextField)
  end
end

function scene:hide(event)
  local group = self.view
  local phase = event.phase
  if phase == "did" then
    if event.parent and event.parent.overlayEnded then
      event.parent:overlayEnded()
    end
    return
  end
  cleanEnter()
end

function scene:destroy(event)
  local group = self.view
  clean()
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
