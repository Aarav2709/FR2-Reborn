local composer = require("composer")
local tcpClient = require("lua.network.tcpClient")
local scene = composer.newScene()
local clean, cleanEnter, playerText, refreshTable, mapText, shouldStartQuickPlay, numberOfNotifications, showImages, avatarDisplayGroupList, startGame, startChat
local playerAvatarImage = {}
local backgroundImage, backgroundImage2, tableBackground, titleText, searchText
local btnBack, btnChat, btnPlay, btnSettings, searchForFriendButton
local layoutLobbyCustomPlay, resizeListener

function scene:create(event)
    local screenGroup = self.view
    local runOnce = true
    local tableHelper = require("lua.modules.tableHelper")
    local inviteTimeTable = {}
    local friendTableView
    playerText = {}
    startGame = false
    avatarDisplayGroupList = {}
    backgroundImage = display.newImageRect("images/gui/common/bgBlur.png", 1920, 1080)
    -- backgroundImage2 = display.newImageRect("images/gui/common/bgMain.png", 1920, 1080)
    tableBackground = display.newImageRect("images/gui/ranking/cell.png", 480, 320)
    titleText = composer.newText({
        string = composer.localized.get("InviteFriends"),
        size = 24,
        x = 0,
        y = 0,
        ax = 0,
        color = {
            1,
            1,
            1
        }
    })
    mapText = composer.newText({
        string = composer.localized.get("QuickPlay"),
        size = 24,
        x = 0,
        y = 0,
        color = {
            1,
            1,
            1
        }
    })
    for i = 1, 4 do
        avatarDisplayGroupList[i] = display.newGroup()
        avatarDisplayGroupList[i].xScale = 0.8
        avatarDisplayGroupList[i].yScale = 0.8
    end
    local notConnectedString = composer.localized.get("NotConnected")
    searchText = composer.newText({
        string = composer.localized.get("LoadingGame"),
        x = 0,
        y = 0,
        size = 27
    })
    playerAvatarImage[1] = display.newImageRect("images/gui/lobby/6.png", 81, 28)
    playerAvatarImage[1].x = 0
    playerAvatarImage[1].y = 32
    avatarDisplayGroupList[1]:insert(playerAvatarImage[1])
    playerText[1] = composer.newText({
        string = notConnectedString,
        x = 0,
        y = 0,
        size = 14,
        ay = 0
    })
    playerAvatarImage[2] = display.newImageRect("images/gui/lobby/6.png", 81, 28)
    playerAvatarImage[2].x = 0
    playerAvatarImage[2].y = 32
    avatarDisplayGroupList[2]:insert(playerAvatarImage[2])
    playerText[2] = composer.newText({
        string = notConnectedString,
        x = 0,
        y = 0,
        size = 14,
        ay = 0
    })
    playerAvatarImage[3] = display.newImageRect("images/gui/lobby/6.png", 81, 28)
    playerAvatarImage[3].x = 0
    playerAvatarImage[3].y = 32
    avatarDisplayGroupList[3]:insert(playerAvatarImage[3])
    playerText[3] = composer.newText({
        string = notConnectedString,
        x = 0,
        y = 0,
        size = 14,
        ay = 0
    })
    playerAvatarImage[4] = display.newImageRect("images/gui/lobby/6.png", 81, 28)
    playerAvatarImage[4].x = 0
    playerAvatarImage[4].y = 32
    avatarDisplayGroupList[4]:insert(playerAvatarImage[4])
    playerText[4] = composer.newText({
        string = notConnectedString,
        x = 0,
        y = 0,
        size = 14,
        ay = 0
    })
    avatarDisplayGroupList[1].x = 0
    avatarDisplayGroupList[1].y = 0
    avatarDisplayGroupList[2].x = 0
    avatarDisplayGroupList[2].y = 0
    avatarDisplayGroupList[3].x = 0
    avatarDisplayGroupList[3].y = 0
    avatarDisplayGroupList[4].x = 0
    avatarDisplayGroupList[4].y = 0

    local function setGameMode(mode, mapId)
        if mode ~= shouldStartQuickPlay then
            tcpClient.sendToggleRandomPlayers(mode)
        end
        if mode == 0 and mapId then
            tcpClient.sendMapSelected(mapId)
        end
    end

    local function btnBackRelease(event)
        if not startGame and not backgroundImage.isVisible then
            composer.gotoScene("lua.scenes.mainMenu")
            composer.removeScene("lua.scenes.lobbyCustomPlay")
        end
    end

    local function btnChatRelease(event)
        if not startGame and not backgroundImage.isVisible then
            startChat = true
            local options = { isModal = true }
            composer.showOverlay("lua.overlays.chat", options)
        end
    end

    local function btnPlayRelease(event)
        if not startGame and not backgroundImage.isVisible then
            tcpClient.sendStartGame()
        end
    end

    local function btnSettingsRelease(event)
        if not startGame and not backgroundImage.isVisible then
            local options = {
                isModal = true,
                params = { setGameModeFunction = setGameMode }
            }
            composer.showOverlay("lua.overlays.customPlayModeSelect", options)
        end
    end

    local function searchForFriendButtonEvent()
        if not backgroundImage.isVisible then
            local options = { isModal = true }
            composer.showOverlay("lua.overlays.sendFriendRequest", options)
        end
    end

    btnBack = composer.newButton({
        image = "images/gui/common/buttonHome.png",
        width = 90,
        height = 57,
        onRelease = btnBackRelease,
        x = 0,
        y = 0
    })
    btnChat = composer.newButton({
        image = "images/gui/customplay/buttonChat.png",
        width = 60,
        height = 60,
        onRelease = btnChatRelease,
        x = 0,
        y = 0
    })
    searchForFriendButton = composer.newButton({
        x = 0,
        y = 0,
        width = 43,
        height = 38,
        image = "images/gui/friends/add.png",
        onRelease = searchForFriendButtonEvent
    })
    btnSettings = composer.newButton({
        image = "images/gui/customplay/settings.png",
        width = 45,
        height = 45,
        onRelease = btnSettingsRelease,
        x = 0,
        y = 0
    })
    btnSettings.alpha = 0
    btnPlay = composer.newButton({
        image = "images/gui/customplay/buttonStart.png",
        width = 60,
        height = 60,
        onRelease = btnPlayRelease,
        x = 0,
        y = 0
    })
    btnPlay.alpha = 0

    layoutLobbyCustomPlay = function()
        local contentLeft = display.screenOriginX
        local contentTop = display.screenOriginY
        local contentWidth = display.actualContentWidth
        local contentHeight = display.actualContentHeight
        local centerX = contentLeft + contentWidth * 0.5
        local centerY = contentTop + contentHeight * 0.5

        if backgroundImage then
            backgroundImage.x = centerX
            backgroundImage.y = centerY
            backgroundImage.xScale = 1
            backgroundImage.yScale = 1
            local scale = math.max(contentWidth / backgroundImage.width, contentHeight / backgroundImage.height)
            backgroundImage.xScale = scale
            backgroundImage.yScale = scale
        end
        if backgroundImage2 then
            backgroundImage2.x = centerX
            backgroundImage2.y = centerY
            backgroundImage2.xScale = 1
            backgroundImage2.yScale = 1
            local scale = math.max(contentWidth / backgroundImage2.width, contentHeight / backgroundImage2.height)
            backgroundImage2.xScale = scale
            backgroundImage2.yScale = scale
        end
        if tableBackground then
            tableBackground.x = centerX
            tableBackground.y = centerY
        end
        if titleText then
            titleText.x = contentLeft + contentWidth * (310 / 480)
            titleText.y = contentTop + contentHeight * (16 / 320)
        end
        if mapText then
            mapText.x = contentLeft + contentWidth * (150 / 480)
            mapText.y = contentTop + contentHeight * (12 / 320)
        end
        if searchText then
            searchText.x = centerX
            searchText.y = centerY
        end
        if avatarDisplayGroupList[1] then
            avatarDisplayGroupList[1].x = contentLeft + contentWidth * 0.14
            avatarDisplayGroupList[1].y = contentTop + contentHeight * 0.3
        end
        if avatarDisplayGroupList[2] then
            avatarDisplayGroupList[2].x = contentLeft + contentWidth * 0.4
            avatarDisplayGroupList[2].y = contentTop + contentHeight * 0.3
        end
        if avatarDisplayGroupList[3] then
            avatarDisplayGroupList[3].x = contentLeft + contentWidth * 0.14
            avatarDisplayGroupList[3].y = contentTop + contentHeight * 0.65
        end
        if avatarDisplayGroupList[4] then
            avatarDisplayGroupList[4].x = contentLeft + contentWidth * 0.4
            avatarDisplayGroupList[4].y = contentTop + contentHeight * 0.65
        end
        if playerText[1] then
            playerText[1].x = contentLeft + contentWidth * 0.14
            playerText[1].y = contentTop + contentHeight * 0.42
        end
        if playerText[2] then
            playerText[2].x = contentLeft + contentWidth * 0.4
            playerText[2].y = contentTop + contentHeight * 0.42
        end
        if playerText[3] then
            playerText[3].x = contentLeft + contentWidth * 0.14
            playerText[3].y = contentTop + contentHeight * 0.76
        end
        if playerText[4] then
            playerText[4].x = contentLeft + contentWidth * 0.4
            playerText[4].y = contentTop + contentHeight * 0.76
        end
        if btnBack then
            btnBack.x = 120
            btnBack.y = 385
        end
        if btnChat then
            btnChat.x = contentLeft + contentWidth * (262 / 480)
            btnChat.y = contentTop + contentHeight * (290 / 320)
        end
        if btnSettings then
            btnSettings.x = contentLeft + contentWidth * (50 / 480)
            btnSettings.y = contentTop + contentHeight * (30 / 320)
        end
        if btnPlay then
            btnPlay.x = contentLeft + contentWidth * (206 / 480)
            btnPlay.y = contentTop + contentHeight * (290 / 320)
        end
        if searchForFriendButton then
            searchForFriendButton.x = contentLeft + contentWidth * (460 / 480)
            searchForFriendButton.y = contentTop + contentHeight * (18 / 320)
        end
    end

    local function createFriendList()
        local allFriends = composer.database.getFriends()
        local tableFriends = {}
        local onlineFriends = {}
        local inGameFriends = {}
        local offlineFriends = {}
        onlineFriends[1] = {}
        onlineFriends[1].title = composer.localized.get("Online")
        inGameFriends[1] = {}
        inGameFriends[1].title = composer.localized.get("InGame")
        offlineFriends[1] = {}
        offlineFriends[1].title = composer.localized.get("Offline")
        for i = 1, #allFriends do
            if tonumber(allFriends[i].state) == 1 then
                onlineFriends[#onlineFriends + 1] = allFriends[i]
            elseif tonumber(allFriends[i].state) == 2 then
                inGameFriends[#inGameFriends + 1] = allFriends[i]
            else
                offlineFriends[#offlineFriends + 1] = allFriends[i]
            end
        end
        if 1 < #onlineFriends then
            for i = 1, #onlineFriends do
                tableFriends[#tableFriends + 1] = onlineFriends[i]
            end
        end
        if 1 < #inGameFriends then
            for i = 1, #inGameFriends do
                tableFriends[#tableFriends + 1] = inGameFriends[i]
            end
        end
        if 1 < #offlineFriends then
            for i = 1, #offlineFriends do
                tableFriends[#tableFriends + 1] = offlineFriends[i]
            end
        end
        return tableFriends
    end

    local function tableCallback(friendId)
        local emptpySlots = 4
        for i = 1, #playerAvatarImage do
            if playerAvatarImage[i].player then
                emptpySlots = emptpySlots - 1
            end
        end
        if emptpySlots == 0 then
        elseif friendId and composer.gameHostData.sessionId and composer.gameHostData.serverAddress then
            if inviteTimeTable[friendId] and os.time() < inviteTimeTable[friendId] + 5 then
                return
            end
            inviteTimeTable[friendId] = os.time()
            composer.comm.inviteFriendToGame(friendId, composer.gameHostData.sessionId,
                composer.gameHostData.serverAddress)
            composer.analytics.newEvent("design", {
                event_id = "inviteFriend:",
                area = composer.config.fullVersion
            })
        end
    end

    local function generateFriendTableView()
        friendTableView = tableHelper.new(306, 44, 180, 276, 40, nil, "friends", tableCallback)
        friendTableView.createTable(createFriendList(), screenGroup)
    end

    local function updateDisplayGroups()
        screenGroup:insert(tableBackground)
        local friendTable = friendTableView and friendTableView.getTable and friendTableView.getTable()
        if friendTable then
            screenGroup:insert(friendTable)
        end
        screenGroup:insert(backgroundImage2)
        screenGroup:insert(btnBack)
        screenGroup:insert(btnChat)
        screenGroup:insert(btnPlay)
        screenGroup:insert(titleText)
        screenGroup:insert(btnSettings)
        screenGroup:insert(mapText)
        screenGroup:insert(searchForFriendButton)
        for i = 1, #playerText do
            screenGroup:insert(avatarDisplayGroupList[i])
            screenGroup:insert(playerText[i])
        end
        screenGroup:insert(backgroundImage)
        screenGroup:insert(searchText)
    end

    function refreshTable()
        if friendTableView then
            local yPos
            if friendTableView.getTable() then
                yPos = friendTableView.getTable():getContentPosition()
            end
            friendTableView.cleanTable()
            friendTableView.createTable(createFriendList(), screenGroup)
            updateDisplayGroups()
            if yPos and friendTableView.getTable() then
                friendTableView.getTable():scrollToY({ y = yPos, time = 0 })
            elseif friendTableView.getTable() then
                friendTableView.getTable():scrollToY({ y = 0, time = 0 })
            end
        end
    end

    function clean()
        display.remove(btnBack)
        display.remove(btnChat)
        display.remove(btnPlay)
        display.remove(btnSettings)
        display.remove(searchForFriendButton)
        if friendTableView then
            friendTableView.cleanTable()
            friendTableView = nil
        end
        composer.mapHandler.setNonMapActive()
    end

    function showImages()
        if runOnce then
            runOnce = false
            searchText.isVisible = false
            backgroundImage.isVisible = false
            if composer.data.gameInfo.gameType == 3 then
                btnPlay.alpha = 1
                btnSettings.alpha = 1
            end
        end
    end

    generateFriendTableView()
    updateDisplayGroups()
    if layoutLobbyCustomPlay then
        layoutLobbyCustomPlay()
    end
end

function scene:show(event)
    local phase = event.phase
    if phase == "will" then
        return
    end
    local screenGroup = self.view
    local connected = false
    local alertShown = false
    startChat = false
    local checkNetworkTime
    local lastUpdateFormServer = system.getTimer()
    local disconnectAlert, networkAlert, oldVersionAlert, mapImage
    local playersVote = {
        0,
        0,
        0,
        0
    }
    local showAlert
    local startedClean = false
    local monsters = {}
    local monsterLoader = require("spine-corona.monsterLoader")
    local androidLogic = require("lua.modules.androidBackButton")
    local tcpFormat = require("lua.network.tcpMessageFormat")
    local chatFormat = require("lua.network.chatMessageFormat")
    shouldStartQuickPlay = 1
    local gameStateInfo, chatNotification, chatNotificationText
    local chatImages = {}
    local kickButtons = {}
    composer.data.chatLog = {}
    androidLogic.addBackButton("lua.scenes.playMenu", "lua.scenes.lobbyCustomPlay")
    resizeListener = function()
        if layoutLobbyCustomPlay then
            layoutLobbyCustomPlay()
        end
    end
    Runtime:addEventListener("resize", resizeListener)
    resizeListener()

    local function stopChatNotification(id)
        if chatImages[id] then
            chatImages[id]:removeSelf()
            chatImages[id] = nil
        end
    end

    local function removeKickButton(id)
        if kickButtons[id] then
            kickButtons[id]:removeSelf()
            kickButtons[id] = nil
        end
    end

    local function removeOldInfo(id)
        if monsters[id] then
            monsters[id].clean()
            monsters[id] = nil
        end
        if playerAvatarImage[id] then
            playerAvatarImage[id]:removeSelf()
            playerAvatarImage[id] = nil
        end
        stopChatNotification(id)
        removeKickButton(id)
    end

    local function addKickButton(id)
        removeKickButton(id)

        local function kickPlayer(event)
            tcpClient.sendKickPlayer(id)
        end

        if playerAvatarImage[id] then
            kickButtons[id] = composer.newButton({
                x = playerAvatarImage[id].x - 28,
                y = playerAvatarImage[id].y - 76,
                width = 43,
                height = 38,
                image = "images/gui/common/buttonClosePopup.png",
                onRelease = kickPlayer
            })
            avatarDisplayGroupList[id]:insert(kickButtons[id])
        end
    end

    local function startChatNotification(id)
        stopChatNotification(id)
        if playerAvatarImage[id] then
            chatImages[id] = display.newSprite(composer.powerUpEffectImageSheet, composer.data.animations.chat)
            chatImages[id].xScale = 0.5
            chatImages[id].yScale = 0.5
            chatImages[id].x = playerAvatarImage[id].x + 34
            chatImages[id].y = playerAvatarImage[id].y - 72
            chatImages[id]:setSequence("normal")
            chatImages[id]:play()
            avatarDisplayGroupList[id]:insert(chatImages[id])
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
        if userData then
            playerAvatarImage[id].player = true
        end
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
            if playerId ~= composer.database.getPlayerInformation().playerId and composer.data.gameInfo.gameType == 3 then
                addKickButton(id)
            end
        else
            removeOldInfo(id)
            setPlate(id)
        end

        playerText[id].text = name and name:gsub("#%d+$", "") or name
    end

    local function setImagePath(path)
        if mapImage then
            mapImage:removeSelf()
            mapImage = nil
        end
        mapImage = display.newImageRect(path, 80, 104)
        mapImage.x = 50
        mapImage.y = display.contentHeight * 0.5
        screenGroup:insert(mapImage)
    end

    local function returnToPlayMenu()
        local currentScene = composer.getSceneName("overlay")
        composer.gotoScene("lua.scenes.mainMenu")
        if currentScene == "lua.overlays.chatScene" then
            composer.hideOverlay()
            startChat = false
        end
        composer.removeScene("lua.scenes.lobbyCustomPlay")
    end

    local function disconnectAlertComplete(event)
        if "clicked" == event.action then
            if composer.suspendAlert then
                return
            end
            returnToPlayMenu()
        end
    end

    local function showDisconnectAlert()
        if composer.suspendAlert then
            return
        end
        disconnectAlert = native.showAlert(composer.localized.get("Disconnected"),
            composer.localized.get("LostConnection"),
            {
                composer.localized.get("OK")
            }, disconnectAlertComplete)
    end

    local function checkForDisconnect()
        if connected and tcpClient.isOnline() == false then
            showAlert(1)
        end
    end

    local function isConnected()
        if composer.suspendAlert then
            return
        end
        if not connected and not alertShown then
            returnToPlayMenu()
            composer.createCustomOverlay(39)
        end
    end

    function showAlert(alertType)
        if composer.suspendAlert then
            return
        end
        if not alertShown then
            alertShown = true
            if alertType == 1 then
                showDisconnectAlert()
            end
        end
    end

    numberOfNotifications = 0

    local function cleanNotifications()
        if chatNotification then
            chatNotification:removeSelf()
            chatNotification = nil
        end
        if chatNotificationText then
            chatNotificationText:removeSelf()
            chatNotificationText = nil
        end
    end

    local function checkForNotifications()
        cleanNotifications()
        if 0 < numberOfNotifications then
            if 99 < numberOfNotifications then
                numberOfNotifications = 99
            end
            chatNotification = display.newImageRect("images/gui/mainMenu/alert.png", 20, 20)
            chatNotification.x = 280
            chatNotification.y = 272
            screenGroup:insert(chatNotification)
            chatNotificationText = composer.newText({
                string = numberOfNotifications,
                x = chatNotification.x,
                y = chatNotification.y,
                size = 15,
                color = {
                    1,
                    1,
                    1
                }
            })
            screenGroup:insert(chatNotificationText)
            if composer.database.getSound() == 1 and composer.getCurrentSceneName() == "lua.scenes.lobbyCustomPlay" then
                audio.play(composer.data.sounds.message_received)
            end
        end
    end

    checkForNotifications()

    local function syncClock(newServerClockValue)
        composer.syncedClock = newServerClockValue / 1000000
        composer.serverSyncTime = system.getTimer()

        function composer.serverClock()
            return math.round(composer.syncedClock + (system.getTimer() - composer.serverSyncTime))
        end
    end

    local function updateModeName()
        if shouldStartQuickPlay == 1 then
            if mapText.text ~= composer.localized.get("QuickPlay") then
                mapText.text = composer.localized.get("QuickPlay")
            end
        else
            local mapId = 0
            for i = 1, #playersVote do
                if playersVote[i] and 0 < playersVote[i] then
                    mapId = playersVote[i]
                end
            end
            if composer.data.getMapName(mapId) ~= mapText.text and composer.data.getMapName(mapId) ~= "" then
                mapText.text = composer.data.getMapName(mapId)
            else
                print("WARNING: failed to find mapId based on vote")
            end
        end
    end

    local function exitLobby()
        tcpClient.stopTCPClient()
        composer.gotoScene("lua.scenes.playMenu")
        composer.removeScene("lua.scenes.lobbyCustomPlay")
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
                playersVote[i] = tonumber(player.v)
                updateAvatar(i, player.a, true, player.n, player.p)
            else
                playersVote[i] = 0
                updateAvatar(i, nil, false, composer.localized.get("NotConnected"))
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
        if messageType == "CUSTOM_GAME_READY" then
            if shouldStartQuickPlay == 1 then
                startGame = true
                tcpClient.pauseReadFromBuffer()
                local options = {
                    effect = "crossFade",
                    time = 400,
                    params = { gameInfo = gameStateInfo }
                }
                composer.gotoScene("lua.scenes.lobbyQuickPlay", options)
                composer.removeScene("lua.scenes.lobbyCustomPlay")
            end
        elseif messageType == "START_COUNTDOWN" then
            startGame = true
            addPlayerInfo(data)
            composer.data.gameInfo.map = data[3]
            composer.data.gameInfo.timeToStartGame = data[4] + system.getTimer()
            composer.gotoScene("lua.scenes.gamePlay")
            composer.removeScene("lua.scenes.lobbyCustomPlay")
        elseif messageType == "CREATE_OBJECT" then
            showImages()
            gameStateInfo = data
            addPlayerInfo(data)
            updateModeName()
        elseif messageType == "CUSTOM_GAME_SESSION_ID" then
            composer.gameHostData.sessionId = data[2]
        elseif messageType == "TOGGLE_RANDOM_PLAYERS" then
            shouldStartQuickPlay = data[2]
            updateModeName()
        elseif messageType == "CHAT_START_TYPING" then
            startChatNotification(data[2])
        elseif messageType == "CHAT_STOP_TYPING" then
            stopChatNotification(data[2])
        elseif messageType == "CHAT" then
            local chatMessageType = data[2]
            if composer.chatListener then
                composer.data.chatLog[#composer.data.chatLog + 1] = data
                composer.chatListener(data)
                numberOfNotifications = 0
            else
                composer.data.chatLog[#composer.data.chatLog + 1] = data
                if chatMessageType == chatFormat.playerMessage() then
                    composer.audio.play("message_received")
                    numberOfNotifications = numberOfNotifications + 1
                end
            end
            checkForNotifications()
        elseif messageType == "SET_CLOCK" then
            local serverTime = data[2]
            syncClock(serverTime)
        elseif messageType == "HOST_LEFT_GAME" then
            exitLobby()
            composer.createCustomOverlay(7)
        elseif messageType == "KICKED" then
            exitLobby()
            composer.createCustomOverlay(8)
        elseif messageType == "CUSTOM_GAME_UNAVAILABLE" then
            exitLobby()
            composer.createCustomOverlay(6)
        elseif messageType == "CUSTOM_GAME_ALREADY_STARTED" then
            exitLobby()
            composer.createCustomOverlay(34)
        elseif messageType == "CUSTOM_GAME_FULL" then
            exitLobby()
            composer.createCustomOverlay(33)
        elseif messageType == "PING" then
        elseif messageType == "HANDSHAKE" then
        elseif messageType then
            print("ERROR NETWORK: Uncaught messagetype: ", messageType)
        elseif messageID then
            print("ERROR NETWORK: Uncaught messageid: ", messageID)
        else
            print("ERROR NETWORK: Got this stuff, dunno what to do: ", data)
        end
    end

    local function tcpCallback(data)
        if startedClean then
            return
        end
        if data.m == tcpFormat.hostGame() then
            if data.r then
                tcpClient.stopTCPClient()
                composer.gotoScene("lua.scenes.playMenu")
                composer.removeScene("lua.scenes.lobbyCustomPlay")
                return
            end
            composer.gameHostData.serverAddress = data.a
            composer.config.tcpClient = data.a
            tcpClient.startTCP(receiveUpdateFromNetwork)
        elseif data.m == tcpFormat.playerStateUpdate() then
            refreshTable()
        elseif data.m == tcpFormat.addFacebookFriend() then
            refreshTable()
        elseif data.m == tcpFormat.recieveDeletedFriend() then
            refreshTable()
        elseif data.m == tcpFormat.recieveAcceptedFriendRequest() then
            refreshTable()
        end
    end

    function scene:overlayEnded()
        composer.comm.setCallback(tcpCallback)
        if refreshTable then
            refreshTable()
        end
    end

    local function startNetworkLogic()
        composer.comm.setCallback(tcpCallback)
        if composer.data.gameInfo.gameType == 3 then
            if composer.gameHostData.serverAddress then
                composer.gameHostData.serverAddress = composer.config.tcpClient
                tcpClient.setReceiveFunction(receiveUpdateFromNetwork)
                tcpClient.sendRejoinGame()
            else
                composer.comm.hostGame(1)
            end
        elseif composer.data.gameInfo.gameType == 4 then
            tcpClient.startTCP(receiveUpdateFromNetwork)
        else
            print("WARNING: gameType is ", composer.data.gameInfo.gameType)
        end
    end

    checkNetworkTime = timer.performWithDelay(8000, isConnected, 1)
    local checkDisconnect = timer.performWithDelay(6000, checkForDisconnect, 0)

    function cleanEnter()
        startedClean = true
        if not startGame then
            tcpClient.stopTCPClient()
        else
            tcpClient.setReceiveFunction(function(data)
            end)
        end
        androidLogic.removeBackButton()
        for i, monster in pairs(monsters) do
            monster.clean()
        end
        if checkNetworkTime then
            timer.cancel(checkNetworkTime)
            checkNetworkTime = nil
        end
        if checkDisconnect then
            timer.cancel(checkDisconnect)
            checkDisconnect = nil
        end
        cleanNotifications()
    end

    startNetworkLogic()
end

function scene:hide(event)
    local phase = event.phase
    if phase == "did" then
        return
    end
    if resizeListener then
        Runtime:removeEventListener("resize", resizeListener)
        resizeListener = nil
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
    if startChat then
        native.setKeyboardFocus(nil)
    end
    showImages = nil
    avatarDisplayGroupList = nil
    startGame = nil
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
