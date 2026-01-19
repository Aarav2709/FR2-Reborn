local composer = require("composer")
local tcpClient = require("lua.network.tcpClient")
local scene = composer.newScene()
local clean, cleanEnter

function scene:create(event)
  local group = self.view
  local tableHelper = require("lua.modules.tableHelper")
  local chatFormat = require("lua.network.chatMessageFormat")
  local chatTable
  local tableHeight = 0
  local moveText, originalSendButtonY, originalChatTableY, originalChatInputField, originalTableBackground
  local keyboardIsUp = false
  local startedClean = false
  local chatBuffer = 25
  local moveHeight = 160
  local actualMoveHeight = 0
  local lastPerson = ""
  local chatAddTimer, addListenersTimer
  
  local function limitTextField(length)
    length = length or 1000
    return function(event)
      if event.text and string.len(event.text) > length then
        event.target.text = event.text:sub(1, length)
      end
      if "began" == event.phase then
        moveText(true)
      elseif "ended" == event.phase then
        moveText(false)
      elseif "submitted" == event.phase then
        native.setKeyboardFocus(nil)
        moveText(false)
      end
    end
  end
  
  local textFieldSize = 25
  if isAndroid then
    textFieldSize = 35
  end
  local alphaBackground = display.newRect(0, 0, display.contentWidth, display.contentHeight)
  alphaBackground.anchorX = 0
  alphaBackground.anchorY = 0
  alphaBackground:setFillColor(0, 0, 0, 0.5882352941176471)
  alphaBackground.x = 0
  alphaBackground.y = 0
  local tableBackground = display.newImageRect("images/gui/customplay/chatWindow.png", 287, 320)
  tableBackground.anchorX = 0.5
  tableBackground.anchorY = 0
  tableBackground.x = 240
  tableBackground.y = 0
  local chatTextField = native.newTextField(display.contentWidth * 4, display.contentHeight * 0.2, 250, textFieldSize)
  chatTextField.anchorX = 0.5
  chatTextField.anchorY = 0.5
  chatTextField.x = 240
  chatTextField.y = 300
  chatTextField.userInput = limitTextField(300)
  chatTextField:addEventListener("userInput", chatTextField.userInput)
  local bottomTableBackground = display.newImageRect("images/gui/customplay/chatBar.png", 327, 44)
  bottomTableBackground.anchorX = 0.5
  bottomTableBackground.anchorY = 1
  bottomTableBackground.x = 240
  bottomTableBackground.y = 320
  
  local function closeButtonEvent()
    composer.hideOverlay()
    native.setKeyboardFocus(nil)
  end
  
  local closeButton = composer.newButton({
    x = 360,
    y = 20,
    width = 43,
    height = 38,
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = closeButtonEvent
  })
  
  local function tableCallback()
  end
  
  local function getMapChangeText(id)
    local mapId = tonumber(id)
    local text = composer.localized.get("HostSelect") .. "some map"
    return text
  end
  
  chatTable = tableHelper.new(130, 0, 220, 270, 138, nil, "chat", tableCallback)
  
  local function generateChatMessage(data)
    local chatMessageType = data[2]
    local chatMessageFrom = data[3]
    local chatMessage = data[4]
    local text
    if chatMessageType == chatFormat.playerMessageName() then
      text = chatMessageFrom .. ":"
    elseif chatMessageType == chatFormat.playerMessage() then
      text = chatMessage
    elseif chatMessageType == chatFormat.joinGame() then
      text = chatMessageFrom .. " " .. composer.localized.get("JoinedGame")
    elseif chatMessageType == chatFormat.leaveGame() then
      text = chatMessageFrom .. " " .. composer.localized.get("LeftGame")
    elseif chatMessageType == chatFormat.playerKicked() then
      text = chatMessageFrom .. " " .. composer.localized.get("WasKicked")
    elseif chatMessageType == chatFormat.startGame() then
      text = composer.localized.get("GameStartingChat")
    elseif chatMessageType == chatFormat.serverMessage() then
      text = chatMessageFrom
    elseif chatMessageType == chatFormat.changedMap() then
      text = getMapChangeText(chatMessageFrom)
    end
    return text
  end
  
  local function addChatToTable(data, extraHeight)
    if startedClean then
      return
    end
    local chatMessageType = data[2]
    local chatMessageFrom = data[3]
    local chatMessage = data[4]
    local splitTable = false
    local extraMoveHeight = 0
    if extraHeight then
      extraMoveHeight = extraHeight
    end
    if lastPerson and chatMessageType == chatFormat.playerMessage() then
      if lastPerson ~= chatMessageFrom then
        splitTable = true
        chatMessageType = chatFormat.playerMessageName()
        data[2] = chatFormat.playerMessageName()
      end
      lastPerson = chatMessageFrom
    else
      lastPerson = ""
    end
    local formatedText = generateChatMessage(data)
    if formatedText == nil then
      return
    end
    local chat = chatTable.getTable()
    local text = composer.newText({
      string = formatedText,
      size = 14,
      width = 220,
      height = 0
    })
    local newParams = {}
    newParams.textType = chatMessageType
    newParams.formatedText = formatedText
    newParams.from = chatMessageFrom
    newParams.splitTable = splitTable
    local cellHeight = math.ceil(text.height) + 6
    tableHeight = tableHeight + cellHeight
    if chat then
      chat:insertRow({
        rowHeight = cellHeight,
        rowColor = {
          default = {
            1,
            1,
            1,
            0
          }
        },
        lineColor = {
          0.8627450980392157,
          0.8627450980392157,
          0.8627450980392157
        },
        params = newParams
      })
    end
    local bottomTableY = tableHeight + chat:getContentPosition()
    if keyboardIsUp then
      bottomTableY = bottomTableY - actualMoveHeight
    end
    if splitTable then
      data[2] = chatFormat.playerMessage()
      addChatToTable(data, cellHeight)
    elseif bottomTableY > chatTextField.y - chatBuffer then
      local newPos = chat:getContentPosition()
      newPos = newPos - cellHeight - extraMoveHeight
      chat:scrollToY({y = newPos, time = 0})
    end
    text:removeSelf()
    text = nil
  end
  
  composer.chatListener = addChatToTable
  
  local function moveToBottom()
    local chat = chatTable.getTable()
    local bottomTableY = tableHeight + chat:getContentPosition()
    if bottomTableY > chatTextField.y - chatBuffer then
      local newPos = chat:getContentPosition()
      local diff = bottomTableY - (chatTextField.y - chatBuffer)
      newPos = newPos - diff
      chat:scrollToY({y = newPos, time = 0})
    end
  end
  
  local function closeOnTouchEvent(event)
    if event.phase == "ended" then
      composer.hideOverlay()
      native.setKeyboardFocus(nil)
    end
    return true
  end
  
  local function doNothingOnTouchEvent(event)
    if keyboardIsUp and not isAndroid then
      moveText(false)
      native.setKeyboardFocus(nil)
    end
    return true
  end
  
  local function sendButtonEvent()
    local chatMessage = chatTextField.text
    if isSimulator then
      chatMessage = "random text asdasd asd asd asdasasdasdasd asd asd wqd asd sad as b v dasda sdasdas d " .. math.random(1, 1000000)
    end
    if chatMessage and string.len(chatMessage) > 0 then
      local msgID = composer.gameConfig.getClientMessageTypeForName("CHAT")
      local msg = "[" .. msgID .. "," .. chatMessage .. "]"
      tcpClient.sendMinimizedMessage(msg)
      chatTextField.text = ""
    end
    return true
  end
  
  local sendButton = composer.newButton({
    x = 426,
    y = 298,
    width = 75,
    height = 44,
    image = "images/gui/customplay/buttonSendmsg.png",
    onRelease = sendButtonEvent
  })
  
  function moveText(moveUp)
    local chat = chatTable.getTable()
    keyboardIsUp = moveUp
    if moveUp then
      sendButton.y = originalSendButtonY - moveHeight
      chatTextField.y = originalChatInputField - moveHeight
      bottomTableBackground.y = originalTableBackground - moveHeight
      local bottomTableY = tableHeight + chat:getContentPosition()
      if bottomTableY > chatTextField.y - chatBuffer then
        local diff = bottomTableY - (chatTextField.y - chatBuffer)
        if diff > moveHeight then
          diff = moveHeight
        end
        actualMoveHeight = diff
        chat.y = originalChatTableY - diff
      end
      tcpClient.sendStartTyping()
    else
      sendButton.y = originalSendButtonY
      chat.y = originalChatTableY
      chatTextField.y = originalChatInputField
      bottomTableBackground.y = originalTableBackground
      actualMoveHeight = 0
      tcpClient.sendStopTyping()
    end
  end
  
  local function updateDisplayGroup()
    group:insert(alphaBackground)
    group:insert(tableBackground)
    group:insert(closeButton)
  end
  
  local function updateDisplayGroup2()
    group:insert(bottomTableBackground)
    group:insert(closeButton)
    group:insert(chatTextField)
    group:insert(sendButton)
  end
  
  local function addListeners()
    if not startedClean then
      alphaBackground:addEventListener("touch", closeOnTouchEvent)
      tableBackground:addEventListener("touch", doNothingOnTouchEvent)
      tableBackground:addEventListener("tap", doNothingOnTouchEvent)
    end
  end
  
  function clean()
    if startedClean then
      return
    end
    startedClean = true
    tcpClient.sendStopTyping()
    composer.chatListener = nil
    native.setKeyboardFocus(nil)
    if addListenersTimer then
      timer.cancel(addListenersTimer)
      addListenersTimer = nil
    end
    chatTextField:removeEventListener("userInput", chatTextField.userInput)
    if chatAddTimer then
      timer.cancel(chatAddTimer)
      chatAddTimer = nil
    end
    if chatTable then
      chatTable.cleanTable()
      chatTable = nil
    end
    alphaBackground:removeEventListener("touch", closeOnTouchEvent)
    tableBackground:removeEventListener("touch", doNothingOnTouchEvent)
    tableBackground:removeEventListener("tap", doNothingOnTouchEvent)
  end
  
  updateDisplayGroup()
  chatTable.createTable({}, group)
  updateDisplayGroup2()
  addListenersTimer = timer.performWithDelay(200, addListeners)
  for i = 1, #composer.data.chatLog do
    addChatToTable(composer.data.chatLog[i])
  end
  moveToBottom()
  originalSendButtonY = sendButton.y
  originalChatTableY = chatTable.getTable().y
  originalChatInputField = chatTextField.y
  originalTableBackground = bottomTableBackground.y
  if not isAndroid and not isSimulator then
    moveText(true)
    native.setKeyboardFocus(chatTextField)
  end
end

function scene:show(event)
  local screenGroup = self.view
  local phase = event.phase
  if phase == "will" then
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
  if phase == "did" then
    if event.parent and event.parent.overlayEnded then
      event.parent:overlayEnded()
    end
    return
  end
  if cleanEnter then
    cleanEnter()
    cleanEnter = nil
  end
end

function scene:destroy(event)
  if clean then
    clean()
    clean = nil
  end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
