local composer = require("composer")
local tcpClient = require("lua.network.tcpClient")
local scene = composer.newScene()
local clean, cleanEnter, playerAvatarImage, playerText, map1Text, map2Text, countdownText, showImages, avatarDisplayGroupList

function scene:create(event)
  local screenGroup = self.view
  local voteTextColor = {
    0.1450980392156863,
    0.08235294117647059,
    0.06274509803921569,
    1
  }
  local runOnce = true
  playerAvatarImage = {}
  playerText = {}
  avatarDisplayGroupList = {}
  local backgroundImage = display.newImageRect("images/gui/common/bgBlur.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  local backgroundImage2 = display.newImageRect("images/gui/lobby/static.png", 480, 320)
  backgroundImage2.x = display.contentWidth * 0.5
  backgroundImage2.y = display.contentHeight * 0.5
  backgroundImage2.alpha = 0
  local voteText = composer.newText({
    string = composer.localized.get("Vote"),
    x = display.contentWidth * 0.11,
    y = display.contentHeight * 0.05,
    size = 30,
    color = {
      1,
      1,
      1
    }
  })
  voteText.alpha = 0
  for i = 1, 4 do
    avatarDisplayGroupList[i] = display.newGroup()
    screenGroup:insert(avatarDisplayGroupList[i])
  end
  local searchText = composer.newText({
    string = composer.localized.get("SearchingForGame"),
    x = display.contentWidth * 0.5,
    y = display.contentHeight * 0.5,
    size = 27
  })
  playerAvatarImage[1] = display.newImageRect("images/gui/lobby/6.png", 81, 28)
  playerAvatarImage[1].alpha = 0
  playerAvatarImage[1].x = 0
  playerAvatarImage[1].y = 32
  avatarDisplayGroupList[1]:insert(playerAvatarImage[1])
  playerText[1] = composer.newText({
    string = composer.localized.get("Searching"),
    x = display.contentWidth * 0.45,
    y = display.contentHeight * 0.53,
    size = 20
  })
  playerText[1].alpha = 0
  playerAvatarImage[2] = display.newImageRect("images/gui/lobby/6.png", 81, 28)
  playerAvatarImage[2].x = 0
  playerAvatarImage[2].y = 32
  playerAvatarImage[2].alpha = 0
  avatarDisplayGroupList[2]:insert(playerAvatarImage[2])
  playerText[2] = composer.newText({
    string = composer.localized.get("Searching"),
    x = display.contentWidth * 0.77,
    y = display.contentHeight * 0.53,
    size = 20
  })
  playerText[2].alpha = 0
  playerAvatarImage[3] = display.newImageRect("images/gui/lobby/6.png", 81, 28)
  playerAvatarImage[3].x = 0
  playerAvatarImage[3].y = 32
  playerAvatarImage[3].alpha = 0
  avatarDisplayGroupList[3]:insert(playerAvatarImage[3])
  playerText[3] = composer.newText({
    string = composer.localized.get("Searching"),
    x = display.contentWidth * 0.45,
    y = display.contentHeight * 0.96,
    size = 20
  })
  playerText[3].alpha = 0
  playerAvatarImage[4] = display.newImageRect("images/gui/lobby/6.png", 81, 28)
  playerAvatarImage[4].x = 0
  playerAvatarImage[4].y = 32
  playerAvatarImage[4].alpha = 0
  avatarDisplayGroupList[4]:insert(playerAvatarImage[4])
  playerText[4] = composer.newText({
    string = composer.localized.get("Searching"),
    x = display.contentWidth * 0.77,
    y = display.contentHeight * 0.96,
    size = 20
  })
  playerText[4].alpha = 0
  avatarDisplayGroupList[1].x = display.contentWidth * 0.45
  avatarDisplayGroupList[1].y = display.contentHeight * 0.35
  avatarDisplayGroupList[2].x = display.contentWidth * 0.77
  avatarDisplayGroupList[2].y = display.contentHeight * 0.35
  avatarDisplayGroupList[3].x = display.contentWidth * 0.45
  avatarDisplayGroupList[3].y = display.contentHeight * 0.78
  avatarDisplayGroupList[4].x = display.contentWidth * 0.77
  avatarDisplayGroupList[4].y = display.contentHeight * 0.78
  map1Text = composer.newText({
    string = "0",
    x = 50,
    y = 66,
    size = 20
  })
  map1Text:setFillColor(voteTextColor[1], voteTextColor[2], voteTextColor[3], voteTextColor[4])
  map1Text.alpha = 0
  map2Text = composer.newText({
    string = "0",
    x = 50,
    y = 170,
    size = 20
  })
  map2Text:setFillColor(voteTextColor[1], voteTextColor[2], voteTextColor[3], voteTextColor[4])
  map2Text.alpha = 0
  countdownText = composer.newText({
    string = "0",
    x = 200,
    y = 14,
    size = 24,
    ax = 0,
    color = {
      1,
      1,
      1
    }
  })
  countdownText.alpha = 0
  
  local function btnBackRelease(event)
    composer.gotoScene("lua.scenes.mainMenu")
    composer.removeScene("lua.scenes.lobbyQuickPlay")
  end
  
  local btnBack = composer.newButton({
    image = "images/gui/common/buttonHome.png",
    width = 90,
    height = 57,
    onRelease = btnBackRelease,
    x = 50,
    y = 292
  })
  btnBack.alpha = 0
  
  function showImages()
    if runOnce then
      runOnce = false
      searchText.alpha = 0
      backgroundImage2.alpha = 1
      voteText.alpha = 1
      for i = 1, 4 do
        playerAvatarImage[i].alpha = 1
        playerText[i].alpha = 1
      end
      map1Text.alpha = 1
      map2Text.alpha = 1
      countdownText.alpha = 1
      btnBack.alpha = 1
    end
  end
  
  local function updateDisplayGroups()
    screenGroup:insert(backgroundImage)
    screenGroup:insert(backgroundImage2)
    for i = 1, 4 do
      screenGroup:insert(avatarDisplayGroupList[i])
      screenGroup:insert(playerText[i])
    end
    screenGroup:insert(map1Text)
    screenGroup:insert(map2Text)
    screenGroup:insert(voteText)
    screenGroup:insert(countdownText)
    screenGroup:insert(searchText)
    screenGroup:insert(btnBack)
  end
  
  function clean()
    display.remove(btnBack)
  end
  
  updateDisplayGroups()
end

function scene:show(event)
  local screenGroup = self.view
  local phase = event.phase
  if phase == "will" then
    return
  end
  local monsterLoader = require("spine-corona.monsterLoader")
  local androidLogic = require("lua.modules.androidBackButton")
  local tcpFormat = require("lua.network.tcpMessageFormat")
  local mapAvailable = {0, 0}
  local votesMap1 = 0
  local votesMap2 = 0
  local playersVote = {
    0,
    0,
    0,
    0
  }
  local runOnce = true
  local connected = false
  local startGame = false
  local startedClean = false
  local checkNetworkTime, checkDisconnect, levelAlternativ1, levelAlternativ2, mapName1, mapName2
  local lastUpdateFormServer = -1
  local disconnectAlert, networkAlert, oldVersionAlert
  local monsters = {}
  local countdownTimer
  androidLogic.addBackButton("lua.scenes.playMenu", "lua.scenes.lobbyQuickPlay")
  local spriteImageList = {
    {},
    {},
    {},
    {}
  }
  
  local function removeOldInfo(id)
    if monsters[id] then
      monsters[id].clean()
      monsters[id] = nil
    end
    if playerAvatarImage[id] then
      playerAvatarImage[id]:removeSelf()
      playerAvatarImage[id] = nil
    end
  end
  
  local function setPlate(id, userData)
    local basePath = "images/gui/lobby/6.png"
    if userData then
      local plateId = composer.storeConfig.getPlateId(userData)
      basePath = "images/gui/lobby/" .. plateId .. ".png"
    end
    playerAvatarImage[id] = display.newImageRect(basePath, 81, 28)
    playerAvatarImage[id].x = 0
    playerAvatarImage[id].y = 32
    avatarDisplayGroupList[id]:insert(playerAvatarImage[id])
  end
  
  local function updateAvatar(id, avatarData, active, name, playerId)
    if active then
      if monsters[id] and monsters[id].playerId == playerId then
        return
      end
      removeOldInfo(id)
      setPlate(id, avatarData)
      monsters[id] = monsterLoader.new(avatarData, true)
      monsters[id].stopAllAnimation()
      monsters[id].playerId = playerId
      local monsterGroup = monsters[id].getGroup()
      monsterGroup.xScale = 0.36
      monsterGroup.yScale = 0.36
      avatarDisplayGroupList[id]:insert(monsterGroup)
    else
      removeOldInfo(id)
      setPlate(id)
    end
    playerText[id].text = name
  end
  
  local function updateVotes()
    votesMap1 = 0
    votesMap2 = 0
    for i = 1, #playersVote do
      if playersVote[i] == mapAvailable[1] then
        votesMap1 = votesMap1 + 1
      elseif playersVote[i] == mapAvailable[2] then
        votesMap2 = votesMap2 + 1
      end
    end
    map1Text.text = votesMap1
    map2Text.text = votesMap2
    screenGroup:insert(map1Text)
    screenGroup:insert(map2Text)
  end
  
  local function levelAlternativ1Release(self, event)
    tcpClient.sendMapSelected(mapAvailable[1])
    if composer.database.getSound() == 1 then
    end
  end
  
  local function levelAlternativ2Release(self, event)
    tcpClient.sendMapSelected(mapAvailable[2])
    if composer.database.getSound() == 1 then
    end
  end
  
  local function updateMapImage(alt1, alt2)
    levelAlternativ1 = display.newImageRect(alt1, 88, 90)
    local mapData1 = composer.data.getMapInfo(mapAvailable[1])
    if not levelAlternativ1 then
      if mapData1 then
        local mapTheme = mapData1.theme
        levelAlternativ1 = display.newImageRect("images/gui/practice/default" .. mapTheme .. ".png", 88, 90)
      else
        levelAlternativ1 = display.newImageRect("images/gui/practice/iconRandom.png", 88, 90)
      end
    end
    levelAlternativ1.tap = levelAlternativ1Release
    levelAlternativ1.x = 50
    levelAlternativ1.y = 102
    screenGroup:insert(levelAlternativ1)
    if mapData1 then
      mapName1 = composer.newText({
        string = mapData1.name,
        size = 14,
        x = levelAlternativ1.x,
        y = levelAlternativ1.y + 28
      })
      screenGroup:insert(mapName1)
    end
    levelAlternativ2 = display.newImageRect(alt2, 88, 90)
    local mapData2 = composer.data.getMapInfo(mapAvailable[2])
    if not levelAlternativ2 then
      if mapData2 then
        local mapTheme = mapData2.theme
        levelAlternativ2 = display.newImageRect("images/gui/practice/default" .. mapTheme .. ".png", 88, 90)
      else
        levelAlternativ2 = display.newImageRect("images/gui/practice/iconRandom.png", 88, 90)
      end
    end
    levelAlternativ2.tap = levelAlternativ2Release
    levelAlternativ2.x = 50
    levelAlternativ2.y = 206
    screenGroup:insert(levelAlternativ2)
    if mapData2 then
      mapName2 = composer.newText({
        string = mapData2.name,
        size = 14,
        x = levelAlternativ2.x,
        y = levelAlternativ2.y + 29
      })
      screenGroup:insert(mapName2)
    end
    levelAlternativ1:addEventListener("tap", levelAlternativ1)
    levelAlternativ2:addEventListener("tap", levelAlternativ2)
  end
  
  local function selectMap(mapSelected)
    if tonumber(mapSelected) == tonumber(mapAvailable[1]) then
      composer.data.gameInfo.map = mapAvailable[1]
    else
      composer.data.gameInfo.map = mapAvailable[2]
    end
  end
  
  local function setMapImage()
    if runOnce then
      runOnce = false
      local alt1 = "images/gui/practice/icon" .. mapAvailable[1] .. ".png"
      local alt2 = "images/gui/practice/icon" .. mapAvailable[2] .. ".png"
      updateMapImage(alt1, alt2)
    end
  end
  
  local function returnToPlayMenu()
    composer.gotoScene("lua.scenes.playMenu")
    composer.removeScene("lua.scenes.lobbyQuickPlay")
  end
  
  local function disconnectAlertComplete(event)
    if "clicked" == event.action then
      returnToPlayMenu()
    end
  end
  
  local function showDisconnectAlert()
    if composer.suspendAlert then
      return
    end
    if not disconnectAlert and not networkAlert and not oldVersionAlert then
      tcpClient.stopTCPClient()
      if isSimulator and composer.config.bot then
        composer.gotoScene("lua.scenes.playMenu")
        composer.removeScene("lua.scenes.lobbyQuickPlay")
      else
        disconnectAlert = native.showAlert(composer.localized.get("Disconnected"), composer.localized.get("You have lost the connection. Press the ok button to return to the menu."), {
          composer.localized.get("Ok")
        }, disconnectAlertComplete)
      end
    end
  end
  
  local function showOldVersionInfo()
    if not disconnectAlert then
      oldVersionAlert = native.showAlert(composer.localized.get("OldVersion"), composer.localized.get("PleaseUpdateApp"), {
        composer.localized.get("Ok")
      }, disconnectAlertComplete)
    end
  end
  
  local function checkForDisconnect()
    if connected and not startGame and tcpClient.isOnline() == false then
      showDisconnectAlert()
    end
  end
  
  local function stopCountdownTimer()
    if countdownTimer then
      timer.cancel(countdownTimer)
      countdownTimer = nil
    end
  end
  
  local function startCountdown(timeLeft)
    stopCountdownTimer()
    local timeAbove = timeLeft % 1000
    local numberOfTicks = math.floor(timeLeft / 1000)
    if 0 < numberOfTicks then
      countdownText.text = composer.localized.get("GameStarting") .. numberOfTicks
    end
    
    local function updateCounddownText()
      numberOfTicks = numberOfTicks - 1
      local text = ""
      if numberOfTicks < 0 then
        text = composer.localized.get("GameStartingNow")
      else
        text = composer.localized.get("GameStarting") .. numberOfTicks
      end
      countdownText.text = text
      countdownTimer = timer.performWithDelay(1000, updateCounddownText, 1)
    end
    
    countdownTimer = timer.performWithDelay(timeAbove, updateCounddownText, 1)
  end
  
  local function syncClock(newServerClockValue)
    composer.syncedClock = newServerClockValue / 1000000
    composer.serverSyncTime = system.getTimer()
    
    function composer.serverClock()
      return math.round(composer.syncedClock + (system.getTimer() - composer.serverSyncTime))
    end
  end
  
  local function addPlayerInfo(data)
    composer.data.gameInfo.players = {}
    local lobbySize = #data[2].p
    for i = 1, 4 do
      if i <= lobbySize then
        local player = data[2].p[i]
        composer.data.gameInfo.players[i] = {}
        composer.data.gameInfo.players[i].avatar = player.a
        composer.data.gameInfo.players[i].username = player.n
        composer.data.gameInfo.players[i].playerId = player.p
        playersVote[i] = player.v
        updateAvatar(i, player.a, true, player.n, player.p)
      else
        playersVote[i] = 0
        updateAvatar(i, nil, false, composer.localized.get("Searching"))
      end
    end
  end
  
  local function receiveUpdateFromNetwork(data)
    if startedClean then
      return
    end
    local messageID = data[1]
    local messageType = composer.gameConfig.getMessageTypeForID(messageID)
    lastUpdateFormServer = system.getTimer()
    connected = true
    if data.serverVersion then
      showOldVersionInfo()
    elseif messageType == "START_COUNTDOWN" then
      addPlayerInfo(data)
      startGame = true
      selectMap(data[3])
      composer.data.gameInfo.timeToStartGame = data[4] + system.getTimer()
      composer.gotoScene("lua.scenes.gamePlay")
      composer.removeScene("lua.scenes.lobbyQuickPlay")
    elseif messageType == "SET_CLOCK" then
      local serverTime = data[2]
      syncClock(serverTime)
    elseif messageType == "CREATE_OBJECT" then
      showImages()
      mapAvailable = data[3]
      setMapImage()
      startCountdown(data[4])
      addPlayerInfo(data)
      updateVotes()
    end
  end
  
  local function stopNetworkTimers()
    if checkNetworkTime then
      timer.cancel(checkNetworkTime)
      checkNetworkTime = nil
    end
    if checkDisconnect then
      timer.cancel(checkDisconnect)
      checkDisconnect = nil
    end
  end
  
  local function isConnected()
    if composer.suspendAlert then
      return
    end
    if not connected then
      returnToPlayMenu()
      composer.createCustomOverlay(39)
    end
  end
  
  local function getUpdatesFromServer(data)
    if data.m == tcpFormat.requestGame() then
      if data.r then
        if data.r == 53 then
          returnToPlayMenu()
        end
      elseif data.a then
        composer.config.tcpClient = data.a
        tcpClient.startTCP(receiveUpdateFromNetwork)
      end
    end
  end
  
  composer.comm.setCallback(getUpdatesFromServer)
  if composer.data.gameInfo.gameType == 1 then
    composer.comm.getGameServerAddress()
  else
    tcpClient.setReceiveFunction(receiveUpdateFromNetwork)
    receiveUpdateFromNetwork(event.params.gameInfo)
  end
  if composer.config.bot then
    composer.cleanOldOverlay()
    checkNetworkTime = timer.performWithDelay(120000, returnToPlayMenu, 1)
  else
    checkNetworkTime = timer.performWithDelay(8000, isConnected, 1)
    checkDisconnect = timer.performWithDelay(6000, checkForDisconnect, 0)
  end
  
  function cleanEnter()
    startedClean = true
    androidLogic.removeBackButton()
    stopNetworkTimers()
    for i, monster in pairs(monsters) do
      monster.clean()
    end
    stopCountdownTimer()
    if levelAlternativ1 then
      levelAlternativ1:removeEventListener("tap", levelAlternativ1)
    end
    if levelAlternativ2 then
      levelAlternativ2:removeEventListener("tap", levelAlternativ2)
    end
    if not startGame then
      tcpClient.stopTCPClient()
    end
    composer.comm.setCallback(function(data)
    end)
  end
end

function scene:hide(event)
  local phase = event.phase
  if phase == "did" then
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
  playerAvatarImage = nil
  map1Text = nil
  map2Text = nil
  showImages = nil
  avatarDisplayGroupList = nil
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
