local composer = require("composer")
local dropDownModule = require("lua.modules.dropdownHelper")
local coinRewardModule = require("lua.modules.coinReward")
local scene = composer.newScene()
local cointickloopChannel = 25
local clean, cleanEnter, addChatBubble
local backgroundImage, layoutPostLobby, resizeListener

function scene:create(event)
    local screenGroup = self.view
    local effectGroup = display.newGroup()
    local newStatsGroup = display.newGroup()
    local newTotalStatsGroup = display.newGroup()
    local chatBubbleGroup = display.newGroup()
    local monsterLoader = require("spine-corona.monsterLoader")
    local basicBoostAdModule = require("lua.ads.postGameVideoAds")
    local chest
    local avatarDisplayGroupList = {}
    local rankingEarned
    local rankingTextGroup = display.newGroup()
    local monsters = {}
    local friends = composer.database.getFriends()
    local sendFriendRequestTable = {}
    local addFriendButtonList = {}
    local startMoneyTimer, moneyTimer, startRatingTimer, ratingTimer, addFriendsButton
    local chatButtons = {}
    local startedClean = false
    local chatText = {
        "Well played",
        "Add me.. if you dare!",
        "Yaay!",
        "#&!?@*!",
        "So unlucky!"
    }
    local imagePath = "images/gui/postgame/postBG_forest.png"
    local themeToImage = {
        forest = "images/gui/postgame/postBG_forest.png",
        space = "images/gui/postgame/postBG_space.png",
        town = "images/gui/postgame/postBG_town.png",
        tropical = "images/gui/postgame/postBG_tropical.png",
        winter = "images/gui/postgame/postBG_winter.png"
    }
    local otherPlayersId = {}
    local coinEffect, chestCoinEffect, updateStats
    composer.data.gameInfo = composer.data.gameInfo or {}
    composer.data.gameInfo.players = composer.data.gameInfo.players or {}
    composer.data.gameInfo.stats = composer.data.gameInfo.stats
    if composer.data.gameInfo.map == nil then
        composer.data.gameInfo.map = 1
    end
    local mapId = tonumber(composer.data.gameInfo.map)
    if mapId and mapId < 1000 then
        local mapData = composer.data.getMapInfo(mapId)
        if mapData then
            local mapTheme = mapData.theme
            if mapTheme and themeToImage[mapTheme] then
                imagePath = themeToImage[mapTheme]
            end
        end
    end
    backgroundImage = display.newImageRect(imagePath, 1920, 1080)
    screenGroup:insert(backgroundImage)
    -- Store references for layout function to access
    local uiElements = {}

    layoutPostLobby = function()
        if backgroundImage then
            backgroundImage.x = display.contentWidth * 0.5
            backgroundImage.y = display.contentHeight * 0.5
            local contentWidth = display.actualContentWidth
            local contentHeight = display.actualContentHeight
            local scale = math.max(contentWidth / backgroundImage.width, contentHeight / backgroundImage.height)
            backgroundImage.xScale = scale
            backgroundImage.yScale = scale
        end
    end
    local backgroundTimeImage = display.newImageRect("images/gui/postgame/windowTimes.png", 300, 170)
    backgroundTimeImage.x = 748
    backgroundTimeImage.y = 80
    uiElements.backgroundTimeImage = backgroundTimeImage
    local photoIcon = display.newImageRect("images/gui/postgame/photo.png", 40, 40)
    photoIcon.xScale = 1
    photoIcon.yScale = 1
    photoIcon.x = 875
    photoIcon.y = 169
    uiElements.photoIcon = photoIcon
    screenGroup:insert(photoIcon)

    local screenshotInProgress = false
    local screenshotPreview = nil
    local screenshotTimers = {}

    local function cleanupScreenshotTimers()
        for i = #screenshotTimers, 1, -1 do
            if screenshotTimers[i] then
                timer.cancel(screenshotTimers[i])
                screenshotTimers[i] = nil
            end
        end
        screenshotTimers = {}
    end

    local function savePostLobbyScreenshot()
        if screenshotInProgress then
            return true
        end
        screenshotInProgress = true

        local photoIconWasVisible = photoIcon.isVisible
        photoIcon.isVisible = false

        local capture = display.captureScreen(false)
        if not capture then
            photoIcon.isVisible = photoIconWasVisible
            screenshotInProgress = false
            return true
        end

        photoIcon.isVisible = photoIconWasVisible

        local filename = "FR2_Screenshot_" .. os.date("%Y%m%d_%H%M%S") .. ".png"
        local platform = system.getInfo("platform")
        local isMobile = (platform == "android" or platform == "ios")

        local saveDir = system.DocumentsDirectory

        display.save(capture, { filename = filename, baseDir = saveDir, isFullResolution = true })

        if isMobile then
            local filePath = system.pathForFile(filename, saveDir)
            if filePath then
                local function onSaveComplete(event)
                end
                if media and media.save then
                    media.save(filename, { baseDir = saveDir, listener = onSaveComplete })
                end
            end
        end

        local flash = display.newRect(screenGroup, display.contentCenterX, display.contentCenterY,
            display.actualContentWidth + 100, display.actualContentHeight + 100)
        flash:setFillColor(1, 1, 1)
        flash.alpha = 0.9
        transition.to(flash, {
            time = 150,
            alpha = 0,
            onComplete = function()
                display.remove(flash)
            end
        })

        if composer.audio and composer.audio.play then
            composer.audio.play("button_press", { channel = 20 })
        end

        local thumbnailWidth = 120
        local thumbnailHeight = 68
        local contentLeft = display.screenOriginX
        local contentBottom = display.screenOriginY + display.actualContentHeight

        screenshotPreview = display.newImageRect(screenGroup, filename, system.DocumentsDirectory,
            thumbnailWidth, thumbnailHeight)

        if screenshotPreview then
            local fullScreenScale = math.max(
                display.actualContentWidth / thumbnailWidth,
                display.actualContentHeight / thumbnailHeight
            )

            screenshotPreview.x = display.contentCenterX
            screenshotPreview.y = display.contentCenterY
            screenshotPreview.xScale = fullScreenScale
            screenshotPreview.yScale = fullScreenScale
            screenshotPreview.alpha = 1

            local targetX = contentLeft + 110
            local targetY = contentBottom - 50

            transition.to(screenshotPreview, {
                time = 600,
                x = targetX,
                y = targetY,
                xScale = 1,
                yScale = 1,
                transition = easing.outQuad,
                onComplete = function()
                    local holdTimer = timer.performWithDelay(3000, function()
                        if screenshotPreview and screenshotPreview.removeSelf then
                            transition.to(screenshotPreview, {
                                time = 400,
                                x = contentLeft - 100,
                                alpha = 0,
                                transition = easing.inQuad,
                                onComplete = function()
                                    if screenshotPreview and screenshotPreview.removeSelf then
                                        display.remove(screenshotPreview)
                                        screenshotPreview = nil
                                    end
                                    screenshotInProgress = false
                                end
                            })
                        else
                            screenshotInProgress = false
                        end
                    end, 1)
                    screenshotTimers[#screenshotTimers + 1] = holdTimer
                end
            })
        else
            screenshotInProgress = false
        end

        display.remove(capture)

        return true
    end

    photoIcon:addEventListener("tap", savePostLobbyScreenshot)
    local chatButtonOverlay = display.newImageRect("images/gui/postgame/buttonToggle.png", 65, 65)
    chatButtonOverlay.x = 160
    chatButtonOverlay.y = 384
    chatButtonOverlay.isVisible = false
    uiElements.chatButtonOverlay = chatButtonOverlay
    local friendButtonOverlay = display.newImageRect("images/gui/postgame/buttonToggle.png", 65, 65)
    friendButtonOverlay.x = 250
    friendButtonOverlay.y = 384
    friendButtonOverlay.isVisible = false
    uiElements.friendButtonOverlay = friendButtonOverlay
    local marketButtonOverlay = display.newImageRect("images/gui/postgame/buttonToggle.png", 65, 65)
    marketButtonOverlay.x = 680
    marketButtonOverlay.y = 384
    marketButtonOverlay.isVisible = false
    uiElements.marketButtonOverlay = marketButtonOverlay
    local chatButtonDropdown = display.newImageRect("images/gui/postgame/bubbleList.png", 175, 179)
    chatButtonDropdown.x = display.contentWidth * 0.26
    chatButtonDropdown.y = display.contentHeight * 0.65
    chatButtonDropdown.isVisible = false
    uiElements.chatButtonDropdown = chatButtonDropdown
    local name = ""
    if composer.onboarding.isActive == true then
        name = composer.onboarding.getMapName()
    else
        if mapId then
            name = composer.data.getMapName(mapId)
        end
        composer.gamesPlayed = composer.gamesPlayed + 1
    end
    local mapName = composer.newText({
        string = name,
        size = 30,
        z = 7,
        x = 755,
        y = 21,
        color = {
            1,
            1,
            1
        }
    })
    uiElements.mapName = mapName

    local placeholdersEnabled = true
    local placeholderGroup = display.newGroup()
    local placeholderMapX = 755
    local placeholderMapY = 21
    local mapPlaceholder = composer.newText({
        string = "STUMPY SLOPES",
        size = 30,
        x = placeholderMapX,
        y = placeholderMapY,
        color = { 1, 1, 1 }
    })
    placeholderGroup:insert(mapPlaceholder)
    placeholderGroup.isVisible = placeholdersEnabled
    local function setPlaceholdersVisible(isVisible)
        placeholdersEnabled = not not isVisible
        placeholderGroup.isVisible = placeholdersEnabled
    end


    function addChatBubble(playerId, chatId)
        local playerIndex = 1
        local text, chatBubble
        for i = 1, #composer.data.gameInfo.players do
            if playerId == composer.data.gameInfo.players[i].playerId then
                playerIndex = i
            end
        end

        local function cleanBubble()
            if startedClean then
                return
            end
            if chatBubble then
                chatBubble:removeSelf()
                chatBubble = nil
            end
            if text then
                text:removeSelf()
                text = nil
            end
        end

        if composer.data.gameInfo.players[playerIndex].pos == 1 then
            chatBubble = display.newImageRect("images/gui/postgame/bubbleTalk.png", 159, 47)
            chatBubble.x = composer.data.gameInfo.players[playerIndex].x + 30
            chatBubble.y = composer.data.gameInfo.players[playerIndex].y - 76
            text = composer.newText({
                string = composer.localized.get(chatText[chatId]),
                size = 14,
                x = chatBubble.x,
                y = chatBubble.y - 8
            })
        elseif composer.data.gameInfo.players[playerIndex].pos == 2 then
            chatBubble = display.newImageRect("images/gui/postgame/bubbleTalk3.png", 159, 47)
            chatBubble.x = composer.data.gameInfo.players[playerIndex].x + 42
            chatBubble.y = composer.data.gameInfo.players[playerIndex].y + 10
            text = composer.newText({
                string = composer.localized.get(chatText[chatId]),
                size = 14,
                x = chatBubble.x,
                y = chatBubble.y + 6
            })
        elseif composer.data.gameInfo.players[playerIndex].pos == 3 then
            chatBubble = display.newImageRect("images/gui/postgame/bubbleTalk.png", 159, 47)
            chatBubble.x = composer.data.gameInfo.players[playerIndex].x + 30
            chatBubble.y = composer.data.gameInfo.players[playerIndex].y - 76
            text = composer.newText({
                string = composer.localized.get(chatText[chatId]),
                size = 14,
                x = chatBubble.x,
                y = chatBubble.y - 8
            })
        elseif composer.data.gameInfo.players[playerIndex].pos == 4 then
            chatBubble = display.newImageRect("images/gui/postgame/bubbleTalk2.png", 159, 47)
            chatBubble.x = composer.data.gameInfo.players[playerIndex].x + 38
            chatBubble.y = composer.data.gameInfo.players[playerIndex].y + 10
            text = composer.newText({
                string = composer.localized.get(chatText[chatId]),
                size = 14,
                x = chatBubble.x,
                y = chatBubble.y + 6
            })
        end
        if chatBubble and text then
            chatBubbleGroup:insert(chatBubble)
            chatBubbleGroup:insert(text)
        end
        timer.performWithDelay(4000, cleanBubble)
    end

    local function chatButtonRelease()
        if chatButtonOverlay.isVisible then
            chatButtonOverlay.isVisible = false
            chatButtonDropdown.isVisible = false
            for i = 1, #chatButtons do
                chatButtons[i].isVisible = false
            end
        else
            chatButtonOverlay.isVisible = true
            chatButtonDropdown.isVisible = true
            for i = 1, #chatButtons do
                chatButtons[i].isVisible = true
            end
        end
    end

    local function addChatButtons()
        local basePath = "images/gui/postgame/"
        for i = 1, 5 do
            local function sendChatMessage()
                composer.comm.postGameChat(i, otherPlayersId)

                addChatBubble(composer.database.getPlayerInformation().playerId, i)
                chatButtonRelease()
            end

            local path
            if i % 2 == 0 then
                path = basePath .. "bubbleListRow1.png"
            else
                path = basePath .. "bubbleListRow2.png"
            end
            chatButtons[i] = composer.newButton({
                image = path,
                text = {
                    string = composer.localized.get(chatText[i]),
                    x = 0,
                    y = -4
                },
                width = 156,
                height = 30,
                onRelease = sendChatMessage,
                x = 236,
                y = 171 + i * 30
            })
            chatButtons[i].isVisible = false
            screenGroup:insert(chatButtons[i])
        end
    end

    local function returnToMenuButtonRelease()
        composer.tcpClient.stopTCPClient()
        composer.gotoScene("lua.scenes.mainMenu")
        composer.removeScene("lua.scenes.postLobby")
    end

    local function stopOnboardingComplete(event)
        if "clicked" == event.action then
            local i = event.index
            if 1 == i then
                if startedClean then
                    return
                end
                composer.onboarding.deactivate()
                composer.gotoScene("lua.scenes.mainMenu")
                composer.removeScene("lua.scenes.postLobby")
            elseif 2 == i then
            end
        end
    end

    local function stopOnboarding()
        local message = composer.localized.get("QuitOnboarding")
        quitAlert = native.showAlert(composer.localized.get("Quit"), message, {
            composer.localized.get("Yes"),
            composer.localized.get("No")
        }, stopOnboardingComplete)
    end

    local function rematchButtonRelease()
        if composer.onboarding.isActive == true then
            composer.onboarding.stepDone()
            return
        elseif composer.data.gameInfo.gameType == 0 then
            composer.gotoScene("lua.scenes.lobbyPractice")
        elseif composer.data.gameInfo.gameType == 1 then
            composer.gotoScene("lua.scenes.lobbyQuickPlay")
        elseif composer.data.gameInfo.gameType == 3 or composer.data.gameInfo.gameType == 4 then
            composer.gotoScene("lua.scenes.lobbyCustomPlay")
        end
        composer.removeScene("lua.scenes.postLobby")
    end

    local function sendFriendRequest(pos, playerId)
        addFriendButtonList[pos].isVisible = false
        addFriendButtonList[pos].inviteSent = true
        composer.comm.addFriend(playerId, false)
    end

    local function addFriendsButtonRelease()
        if friendButtonOverlay.isVisible then
            for i = 1, 4 do
                if addFriendButtonList[i] then
                    addFriendButtonList[i].isVisible = false
                end
            end
            friendButtonOverlay.isVisible = false
        else
            for i = 1, 4 do
                if addFriendButtonList[i] and not addFriendButtonList[i].inviteSent then
                    addFriendButtonList[i].isVisible = true
                end
            end
            friendButtonOverlay.isVisible = true
        end
    end

    local function marketButtonRelease()
        composer.tcpClient.stopTCPClient()
        if composer.data.gameInfo.stats then
            composer.analytics.newEvent("design", {
                event_id = "marketButton:postLobby",
                value = composer.data.gameInfo.stats.h,
                area = "postLobby"
            })
        end
        composer.gotoScene("lua.scenes.marketplace")
        composer.removeScene("lua.scenes.postLobby")
    end

    local returnToMenuButton = composer.newButton({
        image = "images/gui/common/buttonClosePopup.png",
        width = 35,
        height = 35,
        onRelease = returnToMenuButtonRelease,
        x = 30,
        y = 20
    })
    uiElements.returnToMenuButton = returnToMenuButton
    local rematchButton = composer.newButton({
        image = "images/gui/postgame/buttonReplay.png",
        width = 115,
        height = 61,
        onRelease = rematchButtonRelease,
        x = display.contentWidth - 128,
        y = 384
    })
    uiElements.rematchButton = rematchButton
    addFriendsButton = composer.newButton({
        image = "images/gui/postgame/buttonFriends.png",
        width = 65,
        height = 65,
        onRelease = addFriendsButtonRelease,
        x = friendButtonOverlay.x,
        y = friendButtonOverlay.y
    })
    addFriendsButton.isVisible = true
    uiElements.addFriendsButton = addFriendsButton
    local chatButton = composer.newButton({
        image = "images/gui/postgame/buttonChat.png",
        width = 65,
        height = 65,
        onRelease = chatButtonRelease,
        x = chatButtonOverlay.x,
        y = chatButtonOverlay.y
    })
    chatButton.isVisible = true
    uiElements.chatButton = chatButton
    local marketButton = composer.newButton({
        image = "images/gui/postgame/buttonMarket.png",
        width = 65,
        height = 65,
        onRelease = marketButtonRelease,
        x = marketButtonOverlay.x,
        y = marketButtonOverlay.y
    })
    marketButton.isVisible = true
    uiElements.marketButton = marketButton
    local exitOnboarding
    if composer.onboarding.isActive == true then
        exitOnboarding = composer.newButton({
            image = "images/gui/common/buttonClosePopup.png",
            width = 35,
            height = 35,
            onRelease = stopOnboarding,
            x = 25.5,
            y = 25.5
        })
    end
    local postLobbyButtonsVisible = true
    local function setPostLobbyButtonsVisible(isVisible)
        postLobbyButtonsVisible = not not isVisible
        addFriendsButton.isVisible = postLobbyButtonsVisible
        chatButton.isVisible = postLobbyButtonsVisible
        marketButton.isVisible = postLobbyButtonsVisible
    end
    for i = 1, 4 do
        avatarDisplayGroupList[i] = display.newGroup()
        screenGroup:insert(avatarDisplayGroupList[i])
    end

    local function updateAvatar(indexInList, username, pos)
        if not composer.data.gameInfo.players or not composer.data.gameInfo.players[indexInList] then
            return
        end
        local networkFormat = true
        if composer.data.gameInfo.gameType == 0 then
            networkFormat = false
        end
        local monsterData = composer.data.gameInfo.players[indexInList].avatar
        monsters[indexInList] = monsterLoader.new(monsterData, networkFormat)
        local monsterGroup = monsters[indexInList].getGroup()
        monsterGroup.xScale = 0.5
        monsterGroup.yScale = 0.5
        screenGroup:insert(monsterGroup)
        local x, y
        if pos == 1 then
            x = 254
            y = 176
        elseif pos == 2 then
            x = 94
            y = 236
        elseif pos == 3 then
            x = 412
            y = 250
        elseif pos == 4 then
            x = 576
            y = 310
        end
        monsterGroup.y = y + 40
        monsterGroup.x = x
        composer.data.gameInfo.players[indexInList].pos = pos
        composer.data.gameInfo.players[indexInList].x = x
        composer.data.gameInfo.players[indexInList].y = y
        local includeAddFriendButton = true
        local playerId = composer.data.gameInfo.players[indexInList].playerId
        if playerId == composer.database.getPlayerInformation().playerId then
            includeAddFriendButton = false
            if pos == 1 and networkFormat then
                composer.database.updateWinsForAvatar()
            end
            updateStats(pos)
        else
            otherPlayersId[#otherPlayersId + 1] = playerId
        end
        for i = 1, #friends do
            if playerId == friends[i].p then
                includeAddFriendButton = false
                break
            end
        end
        if includeAddFriendButton and composer.data.gameInfo.gameType ~= 0 then
            local function addFriendButtonRelease()
                sendFriendRequest(pos, playerId)
            end

            addFriendButtonList[pos] = composer.newButton({
                image = "images/gui/postgame/buttonFriendsAdd.png",
                width = 30,
                height = 30,
                onRelease = addFriendButtonRelease,
                x = x,
                y = y + 30
            })
            addFriendButtonList[pos].isVisible = false
            addFriendsButton.isVisible = true
            screenGroup:insert(addFriendButtonList[pos])
        end
    end

    local function getSign(number)
        if -1 < number then
            return "+ "
        else
            return "- "
        end
    end

    local function sign(number)
        if number < 0 then
            return -1
        else
            return 1
        end
    end

    local function updateRank(rating, deltaRating, extraDelay)
        if deltaRating then
            local ratingX = 463
            local ratingY = 39
            local ratingIconX = ratingX + 36
            rankingEarned = composer.newText({
                string = "",
                size = 20,
                color = {
                    1,
                    1,
                    1
                }
            })
            rankingEarned.anchorX = 1
            rankingEarned.anchorY = 1
            rankingEarned.x = ratingX
            rankingEarned.y = ratingY
            newStatsGroup:insert(rankingEarned)
            local ratingIcon = display.newImageRect("images/gui/postgame/iconRating.png", 28, 28)
            if ratingIcon then
                ratingIcon.anchorX = 1
                ratingIcon.anchorY = 1
                ratingIcon.x = ratingIconX
                ratingIcon.y = ratingY
                newTotalStatsGroup:insert(ratingIcon)
            end
            local prevRating = rating - deltaRating
            local totalRating = composer.newText({
                string = prevRating,
                size = 20,
                color = {
                    1,
                    1,
                    1
                }
            })
            totalRating.anchorX = 1
            totalRating.anchorY = 1
            totalRating.x = ratingX
            totalRating.y = ratingY
            newTotalStatsGroup:insert(totalRating)
            local counterRating = 0

            local function updateRating()
                counterRating = counterRating + 1
                prevRating = math.floor(prevRating + sign(deltaRating))
                rankingEarned.text = getSign(deltaRating) .. counterRating
                if counterRating == math.abs(deltaRating) then
                    prevRating = rating
                    composer.audio.stop(cointickloopChannel)
                    composer.audio.play("rating_end", { channel = cointickloopChannel })
                    if composer.contextualOnboarding.isActive == true then
                        local gt = composer.data.gameInfo.gameType
                        local onlineGamePlayed = gt == 1 or gt == 3 or gt == 4
                        if onlineGamePlayed and composer.gamesPlayed == 1 and composer.contextualOnboarding.isPartActive(3) then
                            composer.contextualOnboarding.firstGameCompleted(screenGroup)
                            composer.contextualOnboarding.setPartDone(3)
                        end
                        if not (composer.database.getMoney() >= 250) or composer.contextualOnboarding.isPartActive(2) then
                        end
                    end
                end
                if totalRating then
                    totalRating.text = prevRating
                    newTotalStatsGroup:insert(totalRating)
                end
            end

            local function setRating()
                if deltaRating == 0 then
                    rankingEarned.text = "+0"
                    composer.audio.stop(cointickloopChannel)
                    composer.audio.play("rating_end", { channel = cointickloopChannel })
                else
                    composer.audio.stop(cointickloopChannel)
                    composer.audio.play("rating", {
                        channel = cointickloopChannel,
                        loops = -1,
                        fadein = 500
                    })
                    ratingTimer = timer.performWithDelay(40, updateRating, math.abs(deltaRating))
                end
            end

            startRatingTimer = timer.performWithDelay(2000 + extraDelay, setRating, 1)
        end
    end

    local function updateMoney(money, deltaMoney, indexInList)
        if money then
            composer.database.setMoney(money)
        end
        if deltaMoney then
            local moneyX = 319
            local moneyY = 39
            local moneyIconX = moneyX + 36
            local moneyText = composer.newText({
                string = "",
                size = 20,
                color = {
                    1,
                    1,
                    1
                }
            })
            moneyText.anchorX = 1
            moneyText.anchorY = 1
            moneyText.x = moneyX
            moneyText.y = moneyY
            newStatsGroup:insert(moneyText)
            local prevMoney = money - deltaMoney
            local moneyIcon = display.newImageRect("images/gui/postgame/iconCoin.png", 28, 28)
            moneyIcon.anchorX = 1
            moneyIcon.anchorY = 1
            moneyIcon.x = moneyIconX
            moneyIcon.y = moneyY
            newTotalStatsGroup:insert(moneyIcon)
            local totalMoneyText = composer.newText({
                string = prevMoney,
                size = 20,
                color = {
                    1,
                    1,
                    1
                }
            })
            totalMoneyText.anchorX = 1
            totalMoneyText.anchorY = 1
            totalMoneyText.x = moneyX
            totalMoneyText.y = moneyY
            newTotalStatsGroup:insert(totalMoneyText)
            local coinEffectDelta = deltaMoney
            if composer.data.gameInfo.stats.fa then
                coinEffectDelta = math.floor(coinEffectDelta / 2)
            end

            local contentBottom = display.screenOriginY + display.actualContentHeight
            local coinTargetX = display.screenOriginX + 95 + moneyIconX - 14
            local coinTargetY = contentBottom - 44 + moneyY - 14
            coinEffect = coinRewardModule.createCoinReward(money, coinEffectDelta, indexInList, true, coinTargetX, coinTargetY)
            coinEffect.animateCoins()
            effectGroup:insert(coinEffect)
            local counterMoney = 0
            local moneyToAddPerTick = 1
            local numberOfTicks = 30
            if deltaMoney < 30 then
                numberOfTicks = deltaMoney
            end
            if 30 < deltaMoney then
                moneyToAddPerTick = deltaMoney / 30
            end

            local function updateMoney()
                counterMoney = counterMoney + moneyToAddPerTick
                prevMoney = prevMoney + moneyToAddPerTick
                if counterMoney == deltaMoney then
                    prevMoney = money
                    composer.audio.stop(cointickloopChannel)
                    composer.audio.play("coins_end", { channel = cointickloopChannel })
                end
                if totalMoneyText then
                    moneyText.text = " + " .. math.round(counterMoney)
                    totalMoneyText.text = math.round(prevMoney)
                end
            end

            local function setMoney()
                if deltaMoney == 0 then
                    composer.audio.stop(cointickloopChannel)
                    composer.audio.play("coins_end", { channel = cointickloopChannel })
                    moneyText.text = "+0"
                else
                    composer.audio.play("coins", {
                        channel = cointickloopChannel,
                        loops = -1,
                        fadein = 500
                    })
                    moneyTimer = timer.performWithDelay(50, updateMoney, numberOfTicks)
                end
            end

            startMoneyTimer = timer.performWithDelay(650, setMoney, 1)
        end
    end

    local xpTimer, startXpTimer
    local function updateXpAndGems(totalXp, deltaXp, totalGems, deltaGems)
        if deltaXp and deltaXp > 0 then
            local xpX = 464
            local xpY = 39
            local xpIconX = xpX + 36

            local newRating, ratingDelta = composer.database.addXpAndUpdateRating(deltaXp)

            local xpText = composer.newText({
                string = "",
                size = 20,
                color = { 1, 1, 1 }
            })
            xpText.anchorX = 1
            xpText.anchorY = 1
            xpText.x = xpX
            xpText.y = xpY
            newStatsGroup:insert(xpText)

            local xpIcon = display.newImageRect("images/gui/postgame/iconRating.png", 28, 28)
            if xpIcon then
                xpIcon.anchorX = 1
                xpIcon.anchorY = 1
                xpIcon.x = xpIconX
                xpIcon.y = xpY
                xpIcon:setFillColor(0.3, 0.8, 1)
                newTotalStatsGroup:insert(xpIcon)
            end

            local prevXp = (totalXp or composer.database.getXp()) - deltaXp
            local totalXpText = composer.newText({
                string = prevXp,
                size = 20,
                color = { 1, 1, 1 }
            })
            totalXpText.anchorX = 1
            totalXpText.anchorY = 1
            totalXpText.x = xpX
            totalXpText.y = xpY
            newTotalStatsGroup:insert(totalXpText)

            local counterXp = 0
            local xpToAddPerTick = 1
            local numberOfTicks = 30
            if deltaXp < 30 then
                numberOfTicks = deltaXp
            end
            if deltaXp > 30 then
                xpToAddPerTick = deltaXp / 30
            end

            local function updateXpTick()
                counterXp = counterXp + xpToAddPerTick
                prevXp = prevXp + xpToAddPerTick
                if counterXp >= deltaXp then
                    prevXp = totalXp or composer.database.getXp()
                end
                if totalXpText then
                    xpText.text = " + " .. math.round(counterXp)
                    totalXpText.text = math.round(prevXp)
                end
            end

            local function setXpDisplay()
                if deltaXp == 0 then
                    xpText.text = "+0"
                else
                    xpTimer = timer.performWithDelay(50, updateXpTick, numberOfTicks)
                end
            end

            local extraDelay = (composer.data.gameInfo.stats.g or 0) * 50 + 1500
            startXpTimer = timer.performWithDelay(650 + extraDelay, setXpDisplay, 1)
        end

        if deltaGems and deltaGems > 0 then
            local gemsX = 700
            local gemsY = 39
            local gemsIconX = gemsX + 36

            composer.database.increaseGems(deltaGems)

            local gemsText = composer.newText({
                string = "",
                size = 20,
                color = { 1, 1, 1 }
            })
            gemsText.anchorX = 1
            gemsText.anchorY = 1
            gemsText.x = gemsX
            gemsText.y = gemsY
            newStatsGroup:insert(gemsText)

            local gemsIcon = display.newImageRect("images/gui/postgame/iconCoin.png", 28, 28)
            if gemsIcon then
                gemsIcon.anchorX = 1
                gemsIcon.anchorY = 1
                gemsIcon.x = gemsIconX
                gemsIcon.y = gemsY
                gemsIcon:setFillColor(0.5, 1, 0.5)
                newTotalStatsGroup:insert(gemsIcon)
            end

            local prevGems = (totalGems or composer.database.getGems()) - deltaGems
            local totalGemsText = composer.newText({
                string = prevGems,
                size = 20,
                color = { 1, 1, 1 }
            })
            totalGemsText.anchorX = 1
            totalGemsText.anchorY = 1
            totalGemsText.x = gemsX
            totalGemsText.y = gemsY
            newTotalStatsGroup:insert(totalGemsText)

            local function setGemsDisplay()
                gemsText.text = " + " .. deltaGems
                totalGemsText.text = totalGems or composer.database.getGems()
            end

            local extraDelay = (composer.data.gameInfo.stats.g or 0) * 50 + 2500
            timer.performWithDelay(650 + extraDelay, setGemsDisplay, 1)
        end
    end

    function updateStats(indexInList)
        local list = composer.data.gameInfo.stats
        if list then
            print("postLobby stats: a=" .. tostring(list.a) .. " r=" .. tostring(list.r) ..
                " g=" .. tostring(list.g) .. " h=" .. tostring(list.h))
            if list.a ~= nil then
                local deltaRating = list.r or 0
                local extraDelay = (list.g or 0) * 50
                updateRank(list.a, deltaRating, extraDelay)
            end
            if list.h ~= nil and list.g ~= nil then
                updateMoney(list.h, list.g, indexInList)
            end
            if list.xp or list.gems then
                if updateXpAndGems then
                    updateXpAndGems(list.xpTotal, list.xp, list.gemsTotal, list.gems)
                end
            end
        end
    end

    local function controllString(textString)
        textString = "" .. textString
        local dotPosition = string.find(textString, "%.")
        if dotPosition then
            if dotPosition + 2 < string.len(textString) then
                textString = "" .. textString:sub(1, dotPosition + 2)
            elseif dotPosition + 2 == string.len(textString) then
            elseif dotPosition + 1 == string.len(textString) then
                textString = textString .. "0"
            elseif dotPosition == string.len(textString) then
                textString = textString .. "00"
            end
        else
            textString = textString .. ".00"
        end
        return textString
    end

    local rankingTextLabels = {}
    local timeTextLabels = {}
    local rankingGroupScale = 1

    local function setUpRankingTable(rankingTableFromComposer)
        local rankingTable = rankingTableFromComposer
        if not rankingTable or #rankingTable == 0 then
            rankingTable = {
                { username = "Player 1", goalTime = 10000, index = 1 },
                { username = "Player 2", goalTime = 12000, index = 2 },
                { username = "Player 3", goalTime = 14000, index = 3 },
                { username = "Player 4", goalTime = 16000, index = 4 }
            }
        end
        if not composer.data.gameInfo.players or #composer.data.gameInfo.players == 0 then
            composer.data.gameInfo.players = {}
            local defaultAvatar = composer.database.getAvatarData()
            for i = 1, 4 do
                composer.data.gameInfo.players[i] = {
                    username = "Player " .. i,
                    avatar = defaultAvatar,
                    playerId = i
                }
            end
        end
        if rankingTable and #rankingTable < 5 then
            local fastestTime
            table.sort(rankingTable, function(a, b)
                return a.goalTime < b.goalTime
            end)
            local tempFastestTime = rankingTable[1].goalTime
            tempFastestTime = math.round(tempFastestTime)
            tempFastestTime = tempFastestTime / 1000
            fastestTime = tempFastestTime
            for i = 1, #rankingTable - 1 do
                if rankingTable[i].goalTime >= rankingTable[i + 1].goalTime then
                    rankingTable[i + 1].goalTime = rankingTable[i].goalTime + 0.01
                end
            end
            for i = 1, #rankingTable do
                local username = rankingTable[i].username
                local goalTime = rankingTable[i].goalTime
                local index = rankingTable[i].index
                if index == nil then
                    index = i
                end

                local nameToShow = username and username:gsub("#%d+$", "") or username
                if string.len(nameToShow) > 11 then
                    nameToShow = nameToShow:sub(1, 11) .. ".."
                end
                goalTime = math.round(goalTime)
                goalTime = goalTime / 1000
                local rankingText, timeText
                if i == 1 then
                    goalTime = controllString(goalTime)
                    rankingText = i .. ". " .. nameToShow
                    timeText = goalTime .. " s"
                elseif 999999 < goalTime then
                    rankingText = i .. ". " .. nameToShow
                    timeText = composer.localized.get("PlayerDisconnected")
                else
                    local diffTime = "" .. goalTime - fastestTime
                    diffTime = controllString(diffTime)
                    rankingText = i .. ". " .. nameToShow
                    timeText = " + " .. diffTime .. " s"
                end
                rankingTextLabels[i] = composer.newText({
                    string = rankingText,
                    size = 23,
                    color = {
                        1,
                        1,
                        1
                    },
                    ax = 0,
                    ay = 0
                })
                rankingTextLabels[i].x = 0
                rankingTextLabels[i].y = (i - 1) * 24
                rankingTextGroup:insert(rankingTextLabels[i])
                timeTextLabels[i] = composer.newText({
                    string = timeText,
                    size = 23,
                    color = {
                        1,
                        1,
                        1
                    },
                    ax = 1,
                    ay = 0
                })
                timeTextLabels[i].x = 267
                timeTextLabels[i].y = rankingTextLabels[i].y
                rankingTextGroup:insert(timeTextLabels[i])
                updateAvatar(index, username, i)
                sendFriendRequestTable[#sendFriendRequestTable + 1] = username
            end
            rankingTextGroup.anchorX = 0
            rankingTextGroup.anchorY = 0
            rankingTextGroup.anchorChildren = true
            rankingTextGroup.x = 612
            rankingTextGroup.y = 46
            rankingTextGroup.xScale = rankingGroupScale
            rankingTextGroup.yScale = rankingGroupScale
            uiElements.rankingTextGroup = rankingTextGroup
            screenGroup:insert(rankingTextGroup)
            effectGroup:toFront()
        else
            local errorText = composer.newText({
                string = composer.localized.get("ErrorNoPlayers"),
                size = 25
            })
            errorText.x = display.contentWidth * 0.5
            errorText.y = display.contentHeight * 0.3
            screenGroup:insert(errorText)
        end
    end

    local backgroundStatsImage = display.newImageRect("images/gui/postgame/windowCurrency.png", 318, 70)
    backgroundStatsImage.x = display.contentWidth * 0.509
    backgroundStatsImage.y = 384
    uiElements.backgroundStatsImage = backgroundStatsImage
    screenGroup:insert(backgroundStatsImage)

    local function createOnlinePostLobby()
        chatButton.isVisible = true
        chatButton.isVisible = true
    end

    local function updateDisplayGroups()
        screenGroup:insert(photoIcon)
        screenGroup:insert(backgroundTimeImage)
        screenGroup:insert(placeholderGroup)
        screenGroup:insert(mapName)
        screenGroup:insert(backgroundStatsImage)
        screenGroup:insert(returnToMenuButton)
        screenGroup:insert(rematchButton)
        screenGroup:insert(addFriendsButton)
        screenGroup:insert(friendButtonOverlay)
        screenGroup:insert(chatButton)
        screenGroup:insert(chatButtonOverlay)
        screenGroup:insert(chatButtonDropdown)
        screenGroup:insert(marketButton)
        screenGroup:insert(marketButtonOverlay)
        screenGroup:insert(effectGroup)
        if exitOnboarding then
            screenGroup:insert(exitOnboarding)
        end
        if placeholdersEnabled and placeholderGroup then
            placeholderGroup:toFront()
        end
        if photoIcon then
            photoIcon:toFront()
        end
    end

    function clean()
        startedClean = true
        if startMoneyTimer then
            timer.cancel(startMoneyTimer)
            startMoneyTimer = nil
        end
        if moneyTimer then
            timer.cancel(moneyTimer)
            moneyTimer = nil
        end
        if startRatingTimer then
            timer.cancel(startRatingTimer)
            startRatingTimer = nil
        end
        if ratingTimer then
            timer.cancel(ratingTimer)
            ratingTimer = nil
        end
        if startXpTimer then
            timer.cancel(startXpTimer)
            startXpTimer = nil
        end
        if xpTimer then
            timer.cancel(xpTimer)
            xpTimer = nil
        end
        if chest then
            chest.clean()
            chest = nil
        end
        if chestCoinEffect then
            chestCoinEffect.clean()
            chestCoinEffect = nil
        end
        -- Cleanup screenshot resources
        if cleanupScreenshotTimers then
            cleanupScreenshotTimers()
        end
        if screenshotPreview then
            display.remove(screenshotPreview)
            screenshotPreview = nil
        end
        display.remove(marketButton)
        display.remove(returnToMenuButton)
        display.remove(rematchButton)
        display.remove(addFriendsButton)
        display.remove(chatButton)
        display.remove(photoIcon)
        display.remove(placeholderGroup)
        if exitOnboarding then
            display.remove(exitOnboarding)
        end
        composer.audio.stop(cointickloopChannel)
        for i = 1, #chatButtons do
            display.remove(chatButtons[i])
        end
        if monsters then
            for i = 1, #monsters do
                monsters[i].clean()
            end
        end
        if coinEffect and coinEffect.clean then
            coinEffect.clean()
        end
    end

    if composer.config.showPostLobby then
        composer.data.gameInfo.quickPlayerRankingTable = {
            { username = "gunnar", goalTime = 10000 },
            { username = "per",    goalTime = 13000 },
            { username = "arne",   goalTime = 40000 },
            { username = "ole",    goalTime = 20000 }
        }
        composer.data.gameInfo.stats = {}
        composer.data.gameInfo.stats.a = 15
        composer.data.gameInfo.stats.h = 26
        composer.data.gameInfo.stats.b = 0
        composer.data.gameInfo.stats.d = 0
        composer.data.gameInfo.stats.g = 30
        composer.data.gameInfo.stats.r = 5
        composer.data.gameInfo.stats.fa = nil
        composer.data.gameInfo.stats.xp = 25        -- XP gained this game
        composer.data.gameInfo.stats.xpTotal = 125  -- Total XP after game
        composer.data.gameInfo.stats.gems = 5       -- Gems gained (optional)
        composer.data.gameInfo.stats.gemsTotal = 10 -- Total gems
    end

    local function createChest()
        chest = basicBoostAdModule.init(composer.data.gameInfo.stats.fa, screenGroup, composer.gamesPlayed)
        if composer.data.gameInfo.stats.fa then
            local chestContentBottom = display.screenOriginY + display.actualContentHeight
            local chestCoinTargetX = display.screenOriginX + 95 + 355 - 14
            local chestCoinTargetY = chestContentBottom - 44 + 39 - 14
            chestCoinEffect = coinRewardModule.createCoinReward(composer.data.gameInfo.stats.h,
                math.floor(composer.data.gameInfo.stats.g / 2), 5, true, chestCoinTargetX, chestCoinTargetY)
            chestCoinEffect.animateCoins()
            effectGroup:insert(chestCoinEffect)
        end
    end

    if composer.data.gameInfo.gameType ~= 0 then
        createChest()
    else
    end
    updateDisplayGroups()
    if composer.data.gameInfo.gameType ~= 0 then
        createOnlinePostLobby()
    end
    newStatsGroup.x = 95
    newStatsGroup.y = display.contentHeight - 62
    screenGroup:insert(newStatsGroup)
    newTotalStatsGroup.x = 95
    newTotalStatsGroup.y = display.contentHeight - 44
    screenGroup:insert(newTotalStatsGroup)
    if composer.data.gameInfo.stats and next(composer.data.gameInfo.stats) then
        updateStats(1)
    else
        updateRank(1000, 0, 0)
        updateMoney(1000, 0, 1)
        if updateXpAndGems then
            updateXpAndGems(0, 0, 0, 0)
        end
    end
    setUpRankingTable(composer.data.gameInfo.quickPlayerRankingTable)
    screenGroup:insert(chatBubbleGroup)
    screenGroup:insert(chatButtonDropdown)
    addChatButtons()
    if composer.onboarding.isActive == true then
        composer.onboarding.addGuiReference("postlobby_exit", returnToMenuButton)
        composer.onboarding.addGuiReference("postlobby_addFriends", addFriendsButton)
        composer.onboarding.addGuiReference("postlobby_chat", chatButton)
        composer.onboarding.addGuiReference("postlobby_times", backgroundTimeImage)
        composer.onboarding.addGuiReference("postlobby_mapName", mapName)
        composer.onboarding.addGuiReference("postlobby_market", marketButton)
        composer.onboarding.updateDisplayGroups(nil, screenGroup)
    end
    scene.setPostLobbyButtonsVisible = setPostLobbyButtonsVisible
    scene.setPostLobbyPlaceholdersVisible = setPlaceholdersVisible
end

function scene:show(event)
    local phase = event.phase
    if phase == "will" then
        return
    end
    local screenGroup = self.view
    local startedClean = false
    local tcpFormat = require("lua.network.tcpMessageFormat")
    local androidLogic = require("lua.modules.androidBackButton")

    -- Offline mode: do not load the ads module
    local adModule
    if not composer.config.offlineMode then
        adModule = require("lua.ads.adModule")
    end
    androidLogic.addBackButton("lua.scenes.mainMenu", "lua.scenes.postLobby")
    resizeListener = function()
        if layoutPostLobby then
            layoutPostLobby()
        end
    end
    Runtime:addEventListener("resize", resizeListener)
    resizeListener()

    local function receiveUpdateFromNetworkGamePlay(data)
        if startedClean then
            return
        end
        local messageID = data[1]
        local messageType = composer.gameConfig.getMessageTypeForID(messageID)
        if messageType == "UNLOCKED_AWARD" then
            local formatedData = {}
            formatedData[1] = 0
            formatedData[2] = data[2]
            formatedData[3] = data[3]
            formatedData[4] = data[4]
            dropDownModule.showAchivement(formatedData)
        else
            print("ERROR NETWORK: Got this stuff, dunno what to do: ", data)
        end
    end

    composer.tcpClient.setReceiveFunction(receiveUpdateFromNetworkGamePlay)

    local function callbackFunction(data)
        if startedClean then
            return
        end
        if data and data.m == tcpFormat.postGameChat() and addChatBubble then
            addChatBubble(data.a, data.b)
        end
    end

    composer.comm.setCallback(callbackFunction)

    local function runBotAgain()
        if isSimulator and composer.config.bot then
            composer.gotoScene("lua.scenes.mainMenu")
            composer.removeScene("lua.scenes.postLobby")
        end
    end

    local botTimer = timer.performWithDelay(2000, runBotAgain, 1)

    function cleanEnter()
        startedClean = true
        androidLogic.removeBackButton()
        if botTimer then
            timer.cancel(botTimer)
            botTimer = nil
        end
        if composer.data.gameInfo.gameType == 1 or composer.data.gameInfo.gameType == 4 then
            composer.tcpClient.stopTCPClient()
        end
    end

    if adModule and adModule.shouldShowAds() and composer.showingDailyChallange == false then
        adModule.showAds()
        timer.performWithDelay(composer.adsTable.showTime, adModule.hideAds, 1)
    end
end

function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase
    if phase == "will" then
        if resizeListener then
            Runtime:removeEventListener("resize", resizeListener)
            resizeListener = nil
        end
        if cleanEnter then
            cleanEnter()
            cleanEnter = nil
        end
    elseif phase == "did" then
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
