local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter, refreshTable, tcpCallback

function scene:create(event)
  local group = self.view
  local tableHelper = require("lua.modules.tableHelper")
  local httpsFormat = require("lua.network.httpsMessageFormat")
  local updateTableDisplayGroup, searchForFriendButton, gameInviteTable, friendsTable, facebookTable, activeTableInt, closeOverlayButton, toggleDeleteButton
  local startedClean = false
  local isMysteryBox = false
  if event.params and event.params.mysteryBox then
    isMysteryBox = event.params.mysteryBox
  end
  composer.overlayWithNetwork = true
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
  local tableTitleText = composer.newText({
    string = composer.localized.get("Friends"),
    size = 30,
    x = display.contentWidth * 0.5,
    y = 16,
    color = {
      1,
      1,
      1
    }
  })
  local gameInviteInactive = display.newImageRect("images/gui/friends/buttonMessagesInactive.png", 62, 62)
  gameInviteInactive.anchorX = 0
  gameInviteInactive.anchorY = 0
  gameInviteInactive.x = 40
  gameInviteInactive.y = 70
  local friendInviteInactive = display.newImageRect("images/gui/friends/buttonFriendsInactive.png", 62, 62)
  friendInviteInactive.anchorX = 0
  friendInviteInactive.anchorY = 0
  friendInviteInactive.x = 40
  friendInviteInactive.y = 140
  local facebookInactive = display.newImageRect("images/gui/friends/buttonFacebookInactive.png", 62, 62)
  facebookInactive.anchorX = 0
  facebookInactive.anchorY = 0
  facebookInactive.x = 40
  facebookInactive.y = 210
  local toggleDeleteButtonActive = display.newImageRect("images/gui/friends/editPressed.png", 43, 38)
  toggleDeleteButtonActive.anchorX = 0.5
  toggleDeleteButtonActive.anchorY = 0.5
  toggleDeleteButtonActive.x = 160
  toggleDeleteButtonActive.y = 22
  toggleDeleteButtonActive.isVisible = false
  local facebookGroup = display.newGroup()
  local facebookBacground = display.newImageRect("images/gui/friends/connectFacebook.png", 210, 154)
  facebookBacground.anchorX = 0
  facebookBacground.anchorY = 0
  facebookBacground.x = 140
  facebookBacground.y = 70
  facebookGroup:insert(facebookBacground)
  local facebookText1 = composer.newText({
    string = composer.localized.get("Facebook1"),
    size = 14,
    x = facebookBacground.x + 134,
    y = facebookBacground.y + 36,
    width = 160,
    align = "center"
  })
  local facebookText2 = composer.newText({
    string = composer.localized.get("Facebook2"),
    size = 12,
    x = facebookBacground.x + 100,
    y = facebookBacground.y + 128,
    color = {
      0.5372549019607843,
      0.4823529411764706,
      0.41568627450980394
    },
    width = 160,
    align = "center"
  })
  facebookGroup:insert(facebookText1)
  facebookGroup:insert(facebookText2)
  
  local function facebookConnectButtonEvent()
    if not composer.database.getFacebookId() then
      composer.facebook.login()
    end
  end
  
  local facebookConnectButton = composer.newButton({
    image = "images/gui/common/buttonFacebook.png",
    width = 126,
    height = 40,
    text = {
      string = composer.localized.get("Connect"),
      color = {
        1,
        1,
        1
      }
    },
    x = 240,
    y = 160,
    onRelease = facebookConnectButtonEvent
  })
  facebookConnectButton.isVisible = false
  facebookGroup.isVisible = false
  local facebookInfo = composer.newText({
    string = composer.localized.get("Could not access Facebook"),
    size = 20,
    x = 240,
    y = 200
  })
  facebookInfo.isVisible = false
  
  local function sortFunction(a, b)
    if a.n and b.n then
      return string.lower(a.n) < string.lower(b.n)
    end
    return false
  end
  
  local function getFriendsData()
    local friendRequests = composer.database.getFriendRequests()
    local friends = composer.database.getFriends()
    local data = {}
    table.sort(friendRequests, sortFunction)
    table.sort(friends, sortFunction)
    if not isMysteryBox then
      for i = 1, #friendRequests do
        local index = #data + 1
        data[index] = friendRequests[i]
        data[index].request = true
      end
    end
    for i = 1, #friends do
      local index = #data + 1
      data[index] = friends[i]
      data[index].request = false
      data[index].showDelete = toggleDeleteButtonActive.isVisible
      if isMysteryBox then
        data[index].isMysteryBox = true
      else
        data[index].isMysteryBox = false
      end
    end
    return data
  end
  
  local function getInboxData()
    local data = {}
    local gameInvite = composer.database.getGameInvites()
    local mysteryBox = composer.database.getMysteryBoxes()
    for i = 1, #mysteryBox do
      local index = #data + 1
      data[index] = mysteryBox[i]
      data[index].mysteryBox = true
    end
    for i = 1, #gameInvite do
      local index = #data + 1
      data[index] = gameInvite[i]
    end
    return data
  end
  
  local function getFacebookFriendsData()
    local installedFriends = composer.database.getFacebookFriends()
    local data = {}
    for i = 1, #installedFriends do
      local index = #data + 1
      data[index] = installedFriends[i]
    end
    return data
  end
  
  local function cleanTables()
    if activeTableInt == 1 then
      gameInviteTable.cleanTable()
      gameInviteInactive.alpha = 1
    elseif activeTableInt == 2 then
      friendsTable.cleanTable()
      friendInviteInactive.alpha = 1
    elseif activeTableInt == 3 then
      facebookTable.cleanTable()
      facebookInactive.alpha = 1
    end
    facebookConnectButton.isVisible = false
    facebookGroup.isVisible = false
    facebookInfo.isVisible = false
  end
  
  local function hideDeleteButtons()
    toggleDeleteButtonActive.isVisible = false
    toggleDeleteButton.isVisible = false
  end
  
  local function setActiveTable(newTable)
    searchForFriendButton.alpha = 0
    cleanTables()
    hideDeleteButtons()
    activeTableInt = newTable
    if newTable == 1 then
      gameInviteTable.createTable(getInboxData(), group)
      tableTitleText.text = composer.localized.get("inbox")
      gameInviteInactive.alpha = 0
      composer.analytics.newEvent("design", {
        event_id = "tab:gameInvites",
        area = composer.config.fullVersion
      })
    elseif newTable == 2 then
      friendsTable.createTable(getFriendsData(), group)
      tableTitleText.text = composer.localized.get("Friends")
      friendInviteInactive.alpha = 0
      searchForFriendButton.alpha = 1
      composer.analytics.newEvent("design", {
        event_id = "tab:friends",
        area = composer.config.fullVersion
      })
      toggleDeleteButton.isVisible = true
    elseif newTable == 3 then
      facebookTable.createTable(getFacebookFriendsData(), group)
      tableTitleText.text = composer.localized.get("FacebookFriends")
      facebookInactive.alpha = 0
      composer.analytics.newEvent("design", {
        event_id = "tab:facebookFriends",
        area = composer.config.fullVersion
      })
      if not composer.database.getFacebookId() then
        facebookConnectButton.isVisible = true
        facebookGroup.isVisible = true
      elseif composer.config.facebookMissmatch then
        facebookInfo.isVisible = true
      else
        searchForFriendButton.alpha = 1
      end
    end
    updateTableDisplayGroup()
  end
  
  function refreshTable()
    if startedClean then
    elseif activeTableInt == 1 then
      gameInviteTable.refreshTable(getInboxData(), group)
    elseif activeTableInt == 2 then
      friendsTable.refreshTable(getFriendsData(), group)
    elseif activeTableInt == 3 then
      facebookTable.refreshTable(getFacebookFriendsData(), group)
    end
    updateTableDisplayGroup()
  end
  
  local function gameInviteButtonEvent()
    setActiveTable(1)
  end
  
  local gameInviteButton = composer.newButton({
    x = gameInviteInactive.x + 31,
    y = gameInviteInactive.y + 31,
    width = 62,
    height = 62,
    image = "images/gui/friends/buttonMessages.png",
    onRelease = gameInviteButtonEvent,
    noFill = true
  })
  
  local function searchForFriendButtonEvent()
    if activeTableInt == 2 then
      local options = {
        isModal = true,
        params = {friendScene = true}
      }
      composer.showOverlay("lua.overlays.sendFriendRequest", options)
    elseif activeTableInt == 3 then
      composer.facebook.invitePlayerToDownloadApp()
      composer.analytics.newEvent("design", {
        event_id = "facebook:invite",
        area = composer.config.fullVersion
      })
    end
  end
  
  local function toggleDeleteButtonEvent()
    if toggleDeleteButtonActive.isVisible then
      toggleDeleteButtonActive.isVisible = false
    else
      toggleDeleteButtonActive.isVisible = true
    end
    refreshTable()
  end
  
  toggleDeleteButton = composer.newButton({
    x = toggleDeleteButtonActive.x,
    y = toggleDeleteButtonActive.y,
    width = 43,
    height = 38,
    image = "images/gui/friends/edit.png",
    onRelease = toggleDeleteButtonEvent,
    noFill = true
  })
  if activeTableInt ~= 2 then
    toggleDeleteButton.isVisible = false
  end
  searchForFriendButton = composer.newButton({
    x = 116,
    y = 22,
    width = 43,
    height = 38,
    image = "images/gui/friends/add.png",
    onRelease = searchForFriendButtonEvent
  })
  
  local function friendInviteButtonEvent()
    setActiveTable(2)
  end
  
  local friendInviteButton = composer.newButton({
    x = friendInviteInactive.x + 31,
    y = friendInviteInactive.y + 31,
    width = 62,
    height = 62,
    image = "images/gui/friends/buttonFriends.png",
    onRelease = friendInviteButtonEvent,
    noFill = true
  })
  
  local function facebookButtonEvent()
    setActiveTable(3)
  end
  
  local facebookButton = composer.newButton({
    x = facebookInactive.x + 31,
    y = facebookInactive.y + 31,
    width = 62,
    height = 62,
    image = "images/gui/friends/buttonFacebook.png",
    onRelease = facebookButtonEvent,
    noFill = true
  })
  
  local function httpsCallback(data)
    if data.m == httpsFormat.registerFacebook() then
      facebookConnectButton.isVisible = false
      facebookGroup.isVisible = false
      setActiveTable(3)
    end
    refreshTable()
  end
  
  function updateTableDisplayGroup()
    group:insert(tableBackground)
    group:insert(gameInviteButton)
    group:insert(friendInviteButton)
    group:insert(facebookButton)
    group:insert(friendInviteInactive)
    group:insert(gameInviteInactive)
    group:insert(facebookInactive)
    if activeTableInt == 1 then
      group:insert(gameInviteTable.getTable())
      group:insert(gameInviteButton)
    end
    if activeTableInt == 2 then
      group:insert(friendsTable.getTable())
      group:insert(friendInviteButton)
    end
    if activeTableInt == 3 then
      group:insert(facebookTable.getTable())
      group:insert(facebookButton)
    end
    group:insert(tableTitleBakground)
    group:insert(tableTitleText)
    group:insert(searchForFriendButton)
    group:insert(facebookGroup)
    group:insert(facebookConnectButton)
    group:insert(closeOverlayButton)
    group:insert(toggleDeleteButton)
    group:insert(toggleDeleteButtonActive)
  end
  
  local function updateDisplayGroup()
    group:insert(alphaBackground)
    updateTableDisplayGroup()
  end
  
  local function moveToMysteryItemScene()
    local options = {
      isModal = true,
      params = {
        item = composer.storeConfig.getItem(isMysteryBox)
      }
    }
    local category = composer.storeConfig.getItemCategory(isMysteryBox)
    options.params.item.imagePath = "images/gui/market/items/" .. category .. "/" .. isMysteryBox .. ".png"
    composer.showOverlay("lua.overlays.marketFree", options)
  end
  
  local function closeOverlayButtonEvent()
    composer.hideOverlay()
  end
  
  local function closeOnTouchEvent(event)
    if event.phase == "ended" then
      composer.hideOverlay()
    end
    return true
  end
  
  local function doNothingOnTouchEvent(event)
    return true
  end
  
  closeOverlayButton = composer.newButton({
    x = 370,
    y = 22,
    width = 43,
    height = 38,
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = closeOverlayButtonEvent
  })
  
  function clean()
    startedClean = true
    cleanTables()
    display.remove(facebookButton)
    display.remove(friendInviteButton)
    display.remove(gameInviteButton)
    display.remove(searchForFriendButton)
    display.remove(facebookConnectButton)
    alphaBackground:removeEventListener("touch", closeOnTouchEvent)
    tableBackground:removeEventListener("touch", doNothingOnTouchEvent)
    composer.overlayWithNetwork = false
  end
  
  local function tableCallbackGameInbox(clickType, playerId, sessionId, serverAddress, item)
    print("")
    print("tableCallbackGameInbox")
    print("callback type", clickType)
    if clickType == 1 then
      composer.database.removeGameInvite(playerId)
      refreshTable()
      composer.analytics.newEvent("design", {
        event_id = "gameInvites:delete",
        area = composer.config.fullVersion
      })
    elseif clickType == 2 then
      composer.database.removeGameInvite(playerId)
      if composer.comm.isOnline() then
        print("go to game")
        composer.data.gameInfo.gameType = 4
        composer.gameHostData.serverAddress = serverAddress
        composer.gameHostData.sessionId = sessionId
        composer.analytics.newEvent("design", {
          event_id = "gameInvites:accept",
          area = composer.config.fullVersion
        })
        composer.hideOverlay()
        composer.gotoScene("lua.scenes.lobbyCustomPlay")
      else
      end
    elseif clickType == 3 then
      composer.comm.claimMysteryBox(item.i, item.f, item._id)
      composer.database.removeMysteryBox(item.i)
      refreshTable()
    end
  end
  
  local function tableCallbackFriends(clickType, playerId, rowIdex)
    if startedClean then
    elseif clickType == 1 then
      composer.comm.deleteFriend(playerId)
      composer.analytics.newEvent("design", {
        event_id = "friends:delete",
        area = composer.config.fullVersion
      })
    elseif clickType == 2 then
      composer.comm.deleteFriendRequest(playerId)
      composer.analytics.newEvent("design", {
        event_id = "friends:request:delete",
        area = composer.config.fullVersion
      })
    elseif clickType == 3 then
      composer.comm.acceptFriendRequest(playerId)
      composer.analytics.newEvent("design", {
        event_id = "friends:request:accept",
        area = composer.config.fullVersion
      })
    elseif clickType == 4 and composer.comm.isOnline() then
      composer.comm.sendMysteryBox(playerId)
      closeOverlayButtonEvent()
    end
  end
  
  local function tableCallbackFacebook()
  end
  
  gameInviteTable = tableHelper.new(105, 36, 270, 284, 55, nil, "friendsSettings1", tableCallbackGameInbox, 18)
  friendsTable = tableHelper.new(105, 36, 270, 284, 55, nil, "friendsSettings2", tableCallbackFriends, 18)
  facebookTable = tableHelper.new(105, 36, 270, 284, 55, nil, "friendsSettings3", tableCallbackFacebook, 18)
  if isMysteryBox then
    setActiveTable(2)
  elseif 0 < composer.database.getNumberOfGameInvites() or 0 < #composer.database.getMysteryBoxes() then
    setActiveTable(1)
  else
    setActiveTable(2)
  end
  
  local function runMysteryBoxCode()
    if isMysteryBox then
      hideDeleteButtons()
      gameInviteButton.isVisible = false
      gameInviteInactive.isVisible = false
      friendInviteButton.isVisible = false
      facebookButton.isVisible = false
      facebookInactive.isVisible = false
      searchForFriendButton.isVisible = false
      tableTitleText.text = composer.localized.get("chooseafriend")
    end
  end
  
  local function addListeners()
    alphaBackground:addEventListener("touch", closeOnTouchEvent)
    tableBackground:addEventListener("touch", doNothingOnTouchEvent)
  end
  
  addListeners()
  runMysteryBoxCode()
  updateDisplayGroup()
  composer.commHttps.setCallback(httpsCallback)
end

function scene:show(event)
  local group = self.view
  local phase = event.phase
  if phase == "will" then
    return
  end
  local androidLogic = require("lua.modules.androidBackButton")
  local tcpFormat = require("lua.network.tcpMessageFormat")
  local startedClean = false
  
  function cleanEnter()
    startedClean = true
    androidLogic.isOverlay(false)
  end
  
  androidLogic.isOverlay(true)
  
  local function refresh()
    if refreshTable then
      refreshTable()
    end
  end
  
  function tcpCallback(data)
    if startedClean then
      return
    end
    if data.m == tcpFormat.recieveGameInvite() then
      refresh()
    elseif data.m == tcpFormat.recieveAcceptedFriendRequest() then
      refresh()
    elseif data.m == tcpFormat.acceptFriendRequest() then
      refresh()
    elseif data.m == tcpFormat.deleteFriend() then
      refresh()
    elseif data.m == tcpFormat.recieveDeletedFriend() then
      refresh()
    elseif data.m == tcpFormat.deleteFriendRequest() then
      refresh()
    elseif data.m == tcpFormat.addFriend() then
      refresh()
    elseif data.m == tcpFormat.addFacebookFriend() then
      refresh()
    elseif data.m == tcpFormat.recieveFriendRequest() then
      refresh()
    elseif data.m == tcpFormat.recieveFriendRequest() then
      refresh()
    end
  end
  
  composer.comm.setCallback(tcpCallback)
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
