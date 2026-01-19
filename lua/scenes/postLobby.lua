local composer = require("composer")
local dropDownModule = require("lua.modules.dropdownHelper")
local coinRewardModule = require("lua.modules.coinReward")
local scene = composer.newScene()
local cointickloopChannel = 25
local clean, cleanEnter, addChatBubble

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
  local otherPlayersId = {}
  local coinEffect, chestCoinEffect, updateStats
  if composer.data.gameInfo.map < 1000 then
    local mapData = composer.data.getMapInfo(composer.data.gameInfo.map)
    if mapData then
      local mapTheme = mapData.theme
      if mapTheme then
        imagePath = "images/gui/postgame/postBG_" .. mapTheme .. ".png"
      end
    end
  end
  local backgroundImage = display.newImageRect(imagePath, 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  screenGroup:insert(backgroundImage)
  local backgroundTimeImage = display.newImageRect("images/gui/postgame/windowTimes.png", 182, 131)
  backgroundTimeImage.x = display.contentWidth * 0.8
  backgroundTimeImage.y = display.contentHeight * 0.2
  local chatButtonOverlay = display.newImageRect("images/gui/postgame/buttonToggle.png", 55, 52)
  chatButtonOverlay.x = 30
  chatButtonOverlay.y = 294
  chatButtonOverlay.isVisible = false
  local friendButtonOverlay = display.newImageRect("images/gui/postgame/buttonToggle.png", 55, 52)
  friendButtonOverlay.x = 90
  friendButtonOverlay.y = 294
  friendButtonOverlay.isVisible = false
  local chatButtonDropdown = display.newImageRect("images/gui/postgame/bubbleList.png", 175, 179)
  chatButtonDropdown.x = display.contentWidth * 0.19
  chatButtonDropdown.y = display.contentHeight * 0.56
  chatButtonDropdown.isVisible = false
  local name = ""
  if composer.onboarding.isActive == true then
    name = composer.onboarding.getMapName()
  else
    name = composer.data.getMapName(composer.data.gameInfo.map)
    composer.gamesPlayed = composer.gamesPlayed + 1
  end
  local mapName = composer.newText({
    string = name,
    size = 22,
    x = backgroundTimeImage.x,
    y = backgroundTimeImage.y - 44,
    color = {
      1,
      1,
      1
    }
  })
  
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
        x = 90,
        y = 84 + i * 30
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
      composer.gotoScene("lua.scenes.lobbyPractise")
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
    if composer.comm.isOnline() then
      if composer.data.gameInfo.stats then
        composer.analytics.newEvent("design", {
          event_id = "marketButton:postLobby",
          value = composer.data.gameInfo.stats.h,
          area = "postLobby"
        })
      end
      composer.gotoScene("lua.scenes.marketplace")
      composer.removeScene("lua.scenes.postLobby")
    else
      composer.createCustomOverlay(1)
    end
  end
  
  local returnToMenuButton = composer.newButton({
    image = "images/gui/common/buttonClosePopup.png",
    width = 43,
    height = 38,
    onRelease = returnToMenuButtonRelease,
    x = 22,
    y = 22
  })
  local rematchButton = composer.newButton({
    image = "images/gui/postgame/buttonReplay.png",
    width = 90,
    height = 52,
    onRelease = rematchButtonRelease,
    x = display.contentWidth - 50,
    y = 294
  })
  addFriendsButton = composer.newButton({
    image = "images/gui/postgame/buttonFriends.png",
    width = 55,
    height = 52,
    onRelease = addFriendsButtonRelease,
    x = friendButtonOverlay.x,
    y = friendButtonOverlay.y
  })
  addFriendsButton.isVisible = false
  local chatButton = composer.newButton({
    image = "images/gui/postgame/buttonChat.png",
    width = 55,
    height = 52,
    onRelease = chatButtonRelease,
    x = chatButtonOverlay.x,
    y = chatButtonOverlay.y
  })
  chatButton.isVisible = false
  local marketButton = composer.newButton({
    image = "images/gui/postgame/buttonMarket.png",
    width = 55,
    height = 52,
    onRelease = marketButtonRelease,
    x = 350,
    y = 294
  })
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
  for i = 1, 4 do
    avatarDisplayGroupList[i] = display.newGroup()
    screenGroup:insert(avatarDisplayGroupList[i])
  end
  
  local function updateAvatar(indexInList, username, pos)
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
      x = 130
      y = 128
    elseif pos == 2 then
      x = 46
      y = 165
    elseif pos == 3 then
      x = 220
      y = 172
    elseif pos == 4 then
      x = 310
      y = 212
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
      local ratingX = 176
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
      rankingEarned.anchorY = 0
      rankingEarned.x = ratingX
      rankingEarned.y = 10
      newStatsGroup:insert(rankingEarned)
      local ratingIcon = display.newImageRect("images/gui/postgame/iconRating.png", 22, 14)
      ratingIcon.anchorX = 1
      ratingIcon.anchorY = 0
      ratingIcon.x = ratingX + 26
      ratingIcon.y = 15
      newTotalStatsGroup:insert(ratingIcon)
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
      totalRating.anchorY = 0
      totalRating.x = ratingX
      totalRating.y = 10
      newTotalStatsGroup:insert(totalRating)
      local counterRating = 0
      
      local function updateRating()
        counterRating = counterRating + 1
        prevRating = math.floor(prevRating + sign(deltaRating))
        rankingEarned.text = getSign(deltaRating) .. counterRating
        if counterRating == math.abs(deltaRating) then
          prevRating = rating
          composer.audio.stop(cointickloopChannel)
          composer.audio.play("rating_end", {channel = cointickloopChannel})
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
          composer.audio.play("rating_end", {channel = cointickloopChannel})
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
      moneyText.anchorY = 0
      moneyText.x = 90
      moneyText.y = 10
      newStatsGroup:insert(moneyText)
      local prevMoney = money - deltaMoney
      local moneyIcon = display.newImageRect("images/gui/postgame/iconCoin.png", 14, 14)
      moneyIcon.anchorX = 1
      moneyIcon.anchorY = 0
      moneyIcon.x = moneyText.x + 15
      moneyIcon.y = 18
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
      totalMoneyText.anchorY = 0
      totalMoneyText.x = 90
      totalMoneyText.y = 10
      newTotalStatsGroup:insert(totalMoneyText)
      local coinEffectDelta = deltaMoney
      if composer.data.gameInfo.stats.fa then
        coinEffectDelta = math.floor(coinEffectDelta / 2)
      end
      coinEffect = coinRewardModule.createCoinReward(money, coinEffectDelta, indexInList, true)
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
          composer.audio.play("coins_end", {channel = cointickloopChannel})
        end
        if totalMoneyText then
          moneyText.text = " + " .. math.round(counterMoney)
          totalMoneyText.text = math.round(prevMoney)
        end
      end
      
      local function setMoney()
        if deltaMoney == 0 then
          composer.audio.stop(cointickloopChannel)
          composer.audio.play("coins_end", {channel = cointickloopChannel})
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
  
  function updateStats(indexInList)
    local list = composer.data.gameInfo.stats
    if list then
      if list.a and list.r and list.g then
        updateRank(list.a, list.r, list.g * 50)
      end
      if list.h and list.g then
        updateMoney(list.h, list.g, indexInList)
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
  
  local function setUpRankingTable(rankingTableFromComposer)
    local rankingTable = rankingTableFromComposer
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
        local nameToShow = username
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
          size = 20,
          color = {
            1,
            1,
            1
          },
          ax = 0,
          ay = 0
        })
        rankingTextLabels[i].x = display.contentWidth * 0.4
        rankingTextLabels[i].y = display.contentHeight * 0.2 * (i * 0.3)
        rankingTextGroup:insert(rankingTextLabels[i])
        timeTextLabels[i] = composer.newText({
          string = timeText,
          size = 20,
          color = {
            1,
            1,
            1
          },
          ax = 1,
          ay = 0
        })
        timeTextLabels[i].x = display.contentWidth * 0.75
        timeTextLabels[i].y = rankingTextLabels[i].y
        rankingTextGroup:insert(timeTextLabels[i])
        updateAvatar(index, username, i)
        sendFriendRequestTable[#sendFriendRequestTable + 1] = username
      end
      rankingTextGroup.anchorX = 0
      rankingTextGroup.anchorY = 0
      rankingTextGroup.anchorChildren = true
      rankingTextGroup.x = display.contentWidth * 0.63
      rankingTextGroup.y = 36
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
  
  local function createOnlinePostLobby()
    chatButton.isVisible = true
    chatButton.isVisible = true
    local backgroundStatsImage = display.newImageRect("images/gui/postgame/windowCurrency.png", 184, 55)
    backgroundStatsImage.x = display.contentWidth * 0.455
    backgroundStatsImage.y = 293
    screenGroup:insert(backgroundStatsImage)
  end
  
  local function updateDisplayGroups()
    screenGroup:insert(backgroundTimeImage)
    screenGroup:insert(mapName)
    screenGroup:insert(returnToMenuButton)
    screenGroup:insert(rematchButton)
    screenGroup:insert(addFriendsButton)
    screenGroup:insert(friendButtonOverlay)
    screenGroup:insert(chatButton)
    screenGroup:insert(chatButtonOverlay)
    screenGroup:insert(chatButtonDropdown)
    screenGroup:insert(marketButton)
    screenGroup:insert(effectGroup)
    if exitOnboarding then
      screenGroup:insert(exitOnboarding)
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
    if chest then
      chest.clean()
      chest = nil
    end
    if chestCoinEffect then
      chestCoinEffect.clean()
      chestCoinEffect = nil
    end
    display.remove(marketButton)
    display.remove(returnToMenuButton)
    display.remove(rematchButton)
    display.remove(addFriendsButton)
    display.remove(chatButton)
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
      {username = "gunnar", goalTime = 10000},
      {username = "per", goalTime = 13000},
      {username = "arne", goalTime = 40000},
      {username = "ole", goalTime = 20000}
    }
    composer.data.gameInfo.stats = {}
    composer.data.gameInfo.stats.a = 15
    composer.data.gameInfo.stats.h = 26
    composer.data.gameInfo.stats.b = 0
    composer.data.gameInfo.stats.d = 0
    composer.data.gameInfo.stats.g = 30
    composer.data.gameInfo.stats.r = 5
    composer.data.gameInfo.stats.fa = nil
  end
  
  local function createChest()
    chest = basicBoostAdModule.init(composer.data.gameInfo.stats.fa, screenGroup, composer.gamesPlayed)
    if composer.data.gameInfo.stats.fa then
      chestCoinEffect = coinRewardModule.createCoinReward(composer.data.gameInfo.stats.h, math.floor(composer.data.gameInfo.stats.g / 2), 5, true)
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
  
  -- OFFLINE MOD: Reklam modülünü yükleme!
  local adModule
  if not composer.config.offlineMode then
    adModule = require("lua.ads.adModule")
  end
  androidLogic.addBackButton("lua.scenes.mainMenu", "lua.scenes.postLobby")
  
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
