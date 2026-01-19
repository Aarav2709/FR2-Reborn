local composer = require("composer")
local dropDownModule = require("lua.modules.dropdownHelper")
local assetLoader = require("lua.modules.assetLoader")
local tcpFormat = require("lua.network.tcpMessageFormat")
local tcpSocial = require("lua.network.tcpSocial")
local C = {}

local function onCompleteAlert()
  if composer.comm and composer.playerInfo then
    if composer.tcpSocial then
      composer.comm.stopTCPSocial()
    end
    if composer.tcpClient then
      composer.tcpClient.stopTCPClient()
    end
  end
  local currentScene = composer.getSceneName("current")
  if currentScene ~= "lua.scenes.mainMenu" then
    composer.removeScene("mainMenu")
  end
  composer.gotoScene("lua.scenes.startScreen")
  composer.removeScene(currentScene)
end

local function gotToStartScene()
  native.showAlert(composer.localized.get("LoggingOut"), composer.localized.get("AccountDevice"), {
    composer.localized.get("Ok")
  }, onCompleteAlert)
end

local function tcpReceiveFunction(data)
  if data.r then
    print("WARNING: got error in tcpReceiveFunction type ", data.r)
  end
  if data.m == tcpFormat.challenge() then
    if data.s == nil then
      data.s = "1"
    end
    local minVersion = data.s
    local currentVersion = data.v
    if tonumber(composer.config.serverVersion) >= tonumber(minVersion) then
      composer.data.wrongVersion = false
      assetLoader.checksumProcedure(data.c, data.p)
      tcpSocial.sendConnectMessage()
    else
      composer.data.wrongVersion = true
      composer.gotoScene("lua.scenes.updateScene")
    end
  elseif data.m == tcpFormat.loggedInElsewhere() then
    composer.config.invalidUser = true
    gotToStartScene()
  elseif data.m == tcpFormat.authenticate() then
    composer.config.invalidUser = false
    if data.r then
      if data.r == 43 then
        composer.cleanOldOverlay()
        composer.config.invalidUser = true
        composer.createCustomOverlay(11)
        composer.comm.stopTCPSocial()
        composer.facebook.stopDelayedTimer()
        composer.database.reset()
        local currentScene = composer.getSceneName("current")
        composer.gotoScene("lua.scenes.startScreen")
        if currentScene == "lua.scenes.loadingScene" then
          composer.removeScene("lua.scenes.loadingScene")
        else
          composer.removeScene("lua.scenes.mainMenu")
        end
      elseif data.r == 72 then
        composer.cleanOldOverlay()
        composer.config.invalidUser = true
        composer.createCustomOverlay(36)
        composer.comm.stopTCPSocial()
        composer.facebook.stopDelayedTimer()
        local currentScene = composer.getSceneName("current") ~= "lua.scenes.loadingScene"
        composer.gotoScene("lua.scenes.startScreen")
        if currentScene == "lua.scenes.loadingScene" then
          composer.removeScene("lua.scenes.loadingScene")
        else
          composer.removeScene("lua.scenes.mainMenu")
        end
      end
      return
    end
    if data.gi then
      composer.database.setMysteryBoxes(data.gi)
    end
    if data.ab then
      composer.config.abTest = data.ab
      if composer.config.abTest == "A" then
      else
      end
      if composer.analytics.setNewBuildVersion then
        composer.analytics.setNewBuildVersion(composer.config.fullVersion .. composer.config.abTest)
      end
    end
    composer.database.updatePlayerInfo(data.u, data.t)
    composer.database.setAvatarData(data.fa, true)
    if data.b then
      composer.data.playerInfo.email = data.b
    end
    if data.fb then
      composer.data.playerInfo.spins = data.fb
    end
    if data.fc then
      composer.gamesPlayed = data.fc
    end
    composer.database.setFriends(data.f)
    composer.database.setFriendRequests(data.q)
    composer.database.setItems(data.i)
    composer.database.setMoney(data.d)
    if data.o then
      composer.database.salesItem = data.o
      for key, value in pairs(composer.database.salesItem) do
        value.y = tonumber(value.y) + system.getTimer() / 1000
      end
    end
    if data.ff then
      composer.database.seasonalItem = data.ff
      for key, value in pairs(composer.database.seasonalItem) do
        value.y = tonumber(value.y) + system.getTimer() / 1000
      end
    end
    if data.aq then
      composer.database.promoSale = data.aq
    end
    if data.sa and data.sb and data.sc then
      composer.database.setPushEnableStatus(data.sa, data.sb, data.sc)
    end
    if data.v then
      composer.adsTable.use = true
      if data.v.t then
        composer.adsTable.refreshRate = data.v.t
      end
      composer.adsTable.chances.chartboostAdChance = data.v.c
      composer.adsTable.chances.fuseAdChance = data.v.d
      composer.adsTable.postGameVideo = data.v.p
      local chartboostVideoChance = data.v.cv
      local fuseVideoChance = data.v.dv
      local admobVideoChance = data.v.av
      local vungleVideoChance = data.v.v
      local nativeXVideoChance = data.v.x
      local videoModule = require("lua.ads.videoModule")
      videoModule.setChance(vungleVideoChance, admobVideoChance, chartboostVideoChance, nativeXVideoChance, fuseVideoChance)
      videoModule.init()
      if data.v.c then
        local cb = require("lua.ads.chartboostModule")
        cb.initAds()
      end
    end
    if data.fd and data.fe then
      composer.todayChallenges.data = data.fd
      composer.todayChallenges.time = data.fe
      if composer.gamesPlayed < 5 then
        composer.todayChallenges.shouldShow = false
      end
      if composer.todayChallenges.shouldShow and composer.getSceneName("current") ~= "lua.scenes.loadingScene" then
        local options = {isModal = true}
        composer.showOverlay("lua.overlays.todaysChallenges", options)
      end
    end
    if data.an then
      composer.data.achievementToClaim = data.an
    end
    if data.ap then
      composer.data.dailyToClaim = data.ap
    end
    if data.ar then
      composer.videosLeft = tonumber(data.ar)
    end
    if data.fh then
      composer.adBoostsLeft = tonumber(data.fh)
    else
      composer.adBoostsLeft = 0
    end
    composer.adBoostPrevGame = composer.gamesPlayed
    composer.adBoostDrop = false
    if data.z then
      composer.database.setFacebookId(data.z)
    else
      composer.database.removeFacebookId()
    end
    if data.fg then
      if composer.getSceneName("current") ~= "lua.scenes.loadingScene" then
        local options = {
          isModal = true,
          params = {mysteryBox = true}
        }
        composer.showOverlay("lua.overlays.messages", options)
      else
        composer.showingSendGift = true
      end
    end
    composer.config.authenticate = true
  elseif data.m == tcpFormat.refreshConfig() then
    if data.c ~= composer.data.configChecksum then
      print("WARNING: config checksum wrong, get new")
      assetLoader.updateConfigFiles()
    end
    if data.p ~= composer.data.mapChecksum then
      print("WARNING: map checksum wrong, get new")
      assetLoader.updateMapFiles()
    end
  elseif data.m == tcpFormat.getNewSeasonalSale() then
    if data.a then
      composer.database.seasonalItem = data.a
      for key, value in pairs(composer.database.seasonalItem) do
        value.y = tonumber(value.y) + system.getTimer() / 1000
      end
    end
  elseif data.m == tcpFormat.getNewSalesItems() then
    if data.a then
      composer.database.salesItem = data.a
      for key, value in pairs(composer.database.salesItem) do
        value.y = tonumber(value.y) + system.getTimer() / 1000
      end
    end
  elseif data.m == tcpFormat.maintenance() then
    if data.a then
      tcpSocial.closeTCP(true)
      composer.createCustomOverlay(98, nil, data.a)
    end
  elseif data.m == tcpFormat.getNewPromoSale() then
    if data.a then
      composer.database.promoSale = data.a
      if C.callback then
        C.callback(data)
      end
    end
  elseif data.m == tcpFormat.messageOfTheDay() then
    if data.t then
      composer.data.messageOfTheDay = data.t
    end
  elseif data.m == tcpFormat.getRankingListOnName() then
    if C.callback then
      C.callback(data)
    end
  elseif data.m == tcpFormat.postGameChat() then
    if data.r then
      return
    end
    if C.callback then
      C.callback(data)
    end
  elseif data.m == tcpFormat.requestGame() then
    if data.r and data.r == 53 then
      composer.createCustomOverlay(35)
    end
    if data.a then
      composer.config.tcpClient = data.a
    end
    if C.callback then
      C.callback(data)
    end
  elseif data.m == tcpFormat.playerSearch() then
    if data.f and C.callback then
      C.callback(data)
    end
  elseif data.m == tcpFormat.addFriend() then
    if data.r then
      if data.r == 35 then
        composer.cleanOldOverlay()
      elseif data.r == 36 then
        composer.cleanOldOverlay()
      elseif data.r == 69 then
        composer.cleanOldOverlay()
      elseif data.r == 71 then
        composer.cleanOldOverlay()
      elseif data.r == 37 then
      end
    end
    if C.callback then
      C.callback(data)
    end
  elseif data.m == tcpFormat.deleteFriend() then
    if data.p then
      composer.database.removeFriend(data.p)
      if C.callback then
        C.callback(data)
      end
    end
  elseif data.m == tcpFormat.acceptFriendRequest() then
    if data.r then
      if data.r == 38 then
        composer.cleanOldOverlay()
      elseif data.r == 39 then
        composer.cleanOldOverlay()
      elseif data.r == 71 then
        composer.cleanOldOverlay()
      end
      return
    end
    if data.p then
      local newFriend = composer.database.removeFriendRequest(data.p)
      if newFriend then
        composer.database.addNewFriend(newFriend)
      end
      if C.callback then
        C.callback(data)
      end
    end
  elseif data.m == tcpFormat.recieveAcceptedFriendRequest() then
    if data.f then
      composer.database.addNewFriend(data.f)
      composer.database.changeOnlineState(data.f.p, 1)
      if C.callback then
        C.callback(data)
      end
    end
  elseif data.m == tcpFormat.recieveFriendRequest() then
    if data.f then
      local newRequest = composer.database.addNewFriendRequest(data.f)
      if newRequest then
        dropDownModule.showFriendRequest(data.f)
      end
      if C.callback then
        C.callback(data)
      end
    end
  elseif data.m == tcpFormat.deleteFriendRequest() then
    if data.p then
      composer.database.removeFriendRequest(data.p)
      if C.callback then
        C.callback(data)
      end
    end
  elseif data.m == tcpFormat.recieveDeletedFriend() then
    if data.p then
      composer.database.removeFriend(data.p)
      if C.callback then
        C.callback(data)
      end
    end
  elseif data.m == tcpFormat.addFacebookFriend() then
    if data.r then
      if data.r == 40 then
        composer.cleanOldOverlay()
      elseif data.r == 41 then
      elseif data.r == 42 then
      end
      return
    end
    if data.f then
      composer.database.addNewFriend(data.f)
      if C.callback then
        C.callback(data)
      end
    end
  elseif data.m == tcpFormat.getOnlineFriends() then
    if data.r then
      return
    end
    if data.f then
      composer.database.setAllOnlineFriendsState(data.f)
      if #data.f > 0 and composer.showFriendsOnline then
        composer.showFriendsOnline = false
        dropDownModule.showOnlineFriend(#data.f)
      end
    end
  elseif data.m == tcpFormat.sendMysteryBox() then
    if data.r then
    else
      composer.createCustomOverlay(44)
    end
  elseif data.m == tcpFormat.claimMysteryBox() then
    if data.r then
      if data.r == 77 then
        composer.createCustomOverlay(45)
      end
    elseif data.a then
      composer.database.addItem(data.a)
      local options = {
        isModal = true,
        params = {
          item = composer.storeConfig.getItem(data.a)
        }
      }
      local category = composer.storeConfig.getItemCategory(data.a)
      options.params.item.imagePath = "images/gui/market/items/" .. category .. "/" .. data.a .. ".png"
      composer.showOverlay("lua.overlays.marketFree", options)
      composer.debugger.debugPrint("network", "Got item from claiming mystery box ", data.a)
    end
  elseif data.m == tcpFormat.getMysteryBox() then
    if data.a then
      local newData = {}
      newData.n = data.a.f
      dropDownModule.showFriendRequest(newData, true)
      composer.database.addNewMysteryBox(data.a)
      if C.callback then
        C.callback(data)
      end
    end
  elseif data.m == tcpFormat.playerStateUpdate() then
    if data.r then
      return
    end
    if data.f then
      composer.database.changeOnlineState(data.f.p, data.f.s)
      if C.callback then
        C.callback(data)
      end
    end
  elseif data.m == tcpFormat.hostGame() then
    if data.r then
      if data.r == 51 then
        composer.createCustomOverlay(20)
        composer.analytics.newEvent("design", {
          event_id = "server:couldnotfindgame",
          area = composer.config.fullVersion
        })
      end
      if C.callback then
        C.callback(data)
      end
    end
    if data.a and C.callback then
      C.callback(data)
    end
  elseif data.m == tcpFormat.inviteFriendToGame() then
  elseif data.m == tcpFormat.recieveGameInvite() then
    if data.r then
      return
    end
    local playerId = data.p
    local username = composer.database.getFriend(playerId).n
    data.username = username
    composer.database.addNewGameInvite(data)
    dropDownModule.showGameInvite(data)
    if C.callback then
      C.callback(data)
    end
  elseif data.m == tcpFormat.purchaseItem() then
    if data.i then
      composer.debugger.debugPrint("network", "purchaseItem ", data.i)
      local price = composer.storeConfig.getCoinPrice(data.i)
      if price then
        composer.database.decreaseMoney(price)
      end
      composer.database.addItem(data.i)
    end
    if C.callback then
      C.callback(data)
    end
  elseif data.m == tcpFormat.setActiveCreature() then
    if data.r then
      if data.r == 26 then
      end
      return
    end
    if C.callback then
      C.callback(data)
    end
  elseif data.m == tcpFormat.claimEarnCoins() then
    if data.r then
      if data.r == 44 then
        composer.createCustomOverlay(44)
      end
      return
    end
    if data.s then
      composer.database.increaseMoney(data.s)
    end
    if C.callback then
      C.callback(data)
    end
  elseif data.m == tcpFormat.claimAchievement() then
    if data.r then
      if data.r == 44 then
        composer.createCustomOverlay(44)
      end
      return
    end
    if data.s then
      composer.database.increaseMoney(data.s)
    end
    if C.callback then
      C.callback(data)
    end
    if data.b then
      composer.database.addItem(data.b)
      
      local function reopenAchievments()
        local options = {isModal = true}
        composer.showOverlay("lua.overlays.achievementsScene", options)
      end
      
      local options = {
        isModal = true,
        params = {
          item = composer.storeConfig.getItem(data.b),
          freeItem = true,
          onCloseFunction = reopenAchievments
        }
      }
      local category = composer.storeConfig.getItemCategory(data.b)
      options.params.item.imagePath = "images/gui/market/items/" .. category .. "/" .. data.b .. ".png"
      composer.showOverlay("lua.overlays.marketFree", options)
      composer.debugger.debugPrint("network", "Got item from claiming achievement ", data.b)
    end
  elseif data.m == tcpFormat.gotAchievement() then
    if data.r then
      return
    end
    if data.t and data.i then
      local formatedData = {}
      formatedData[1] = 0
      formatedData[2] = data.t
      formatedData[3] = data.i
      formatedData[4] = data.s
      dropDownModule.showAchivement(formatedData)
    end
  elseif data.m == tcpFormat.claimDailyChallenge() then
    if data.r then
      if data.r == 45 then
        composer.createCustomOverlay(30)
      end
      return
    end
    if data.s then
      composer.database.increaseMoney(data.s)
    end
    if C.callback then
      C.callback(data)
    end
  elseif data.m == tcpFormat.getEarnCoins() then
    if data.a and C.callback then
      C.callback(data)
    end
  elseif data.m == tcpFormat.getDailyChallenge() then
    if data.r then
      if data.r == 52 then
        composer.createCustomOverlay(31)
      end
      return
    end
    if data.a and C.callback then
      C.callback(data)
    end
  elseif data.m == tcpFormat.getAchievementList() then
    if data.a and C.callback then
      C.callback(data)
    end
  elseif data.m == tcpFormat.useSpin() then
    if data.i and data.v and C.callback then
      C.callback(data)
    end
  elseif data.m == tcpFormat.seenBoostVideo() then
    if data.r then
      return
    end
    if composer.adBoostsLeft then
      if composer.adBoostsLeft > 0 then
        composer.adBoostsLeft = composer.adBoostsLeft - 1
      end
    else
      composer.adBoostsLeft = 0
    end
    print("Seen boost video OK response, decrementing remaining ad boosts. Remaining boosts " .. composer.adBoostsLeft)
  elseif data.m == tcpFormat.seenVideo() then
    if data.r then
      return
    end
    if data.s then
      composer.database.increaseMoney(data.s)
    end
    if C.callback then
      C.callback(data)
    end
  elseif data.m == tcpFormat.heartbeat() then
  else
    print("WARNING: unknown tcp format")
    if data then
      print("data.m ", data.m)
      if data.corrupt then
        print("WARNING: got corrupt data")
      end
    end
  end
end

local function setCallback(callback)
  C.callback = callback
end

C.setCallback = setCallback

function C.startSocialTCP()
  local playerInfo = composer.database.getPlayerInformation()
  if playerInfo and playerInfo.token then
    local data = {}
    data.m = tcpFormat.authenticate()
    data.a = playerInfo.token
    data.p = playerInfo.playerId
    data.u = composer.pushToken
    data.v = composer.config.fullVersion
    tcpSocial.startTCP(tcpReceiveFunction, data)
  end
end

function C.sendHeartbeat()
  tcpSocial.sendHeatbeat()
end

function C.seenVideo()
  local data = {}
  data.m = tcpFormat.seenVideo()
  tcpSocial.sendPacket(data)
end

function C.seenBoostVideo()
  local data = {}
  data.m = tcpFormat.seenBoostVideo()
  tcpSocial.sendPacket(data)
end

function C.getRankingListOnName(name)
  local data = {}
  data.m = tcpFormat.getRankingListOnName()
  data.n = name
  tcpSocial.sendPacket(data)
end

function C.postGameChat(chatId, playerList)
  local data = {}
  data.m = tcpFormat.postGameChat()
  data.a = playerList
  data.b = chatId
  tcpSocial.sendPacket(data)
end

function C.playerSearch(username, userCode)
  local data = {}
  data.m = tcpFormat.playerSearch()
  data.n = username
  if userCode then
    data.t = userCode
  end
  tcpSocial.sendPacket(data)
end

function C.addFriend(playerId, manuallyAdded)
  local data = {}
  data.m = tcpFormat.addFriend()
  data.p = playerId
  data.s = manuallyAdded
  tcpSocial.sendPacket(data)
end

function C.addFacebookFriend(facebookId)
  local data = {}
  data.m = tcpFormat.addFacebookFriend()
  data.f = facebookId
  tcpSocial.sendPacket(data)
end

function C.inviteFriendToGame(friendId, sessionId, serverAddress)
  local data = {}
  data.m = tcpFormat.inviteFriendToGame()
  data.f = friendId
  data.s = sessionId
  data.a = serverAddress
  tcpSocial.sendPacket(data)
end

function C.changeSkin(avatar, skin)
  local data = {}
  data.m = tcpFormat.changeSkin()
  data.a = avatar
  data.b = skin
  tcpSocial.sendPacket(data)
end

function C.claimAchievement(id)
  local data = {}
  data.m = tcpFormat.claimAchievement()
  data.a = id
  tcpSocial.sendPacket(data)
end

function C.claimDailyChallenge(id)
  local data = {}
  data.m = tcpFormat.claimDailyChallenge()
  data.a = id
  tcpSocial.sendPacket(data)
end

function C.claimEarnCoins(id)
  local data = {}
  data.m = tcpFormat.claimEarnCoins()
  data.a = id
  tcpSocial.sendPacket(data)
end

function C.getAchievementList()
  local data = {}
  data.m = tcpFormat.getAchievementList()
  tcpSocial.sendPacket(data)
end

function C.getDailyChallenge()
  local data = {}
  data.m = tcpFormat.getDailyChallenge()
  tcpSocial.sendPacket(data)
end

function C.getEarnCoins()
  local data = {}
  data.m = tcpFormat.getEarnCoins()
  tcpSocial.sendPacket(data)
end

function C.sendMysteryBox(playerId)
  local data = {}
  data.m = tcpFormat.sendMysteryBox()
  data.f = playerId
  tcpSocial.sendPacket(data)
end

function C.claimMysteryBox(id, friendId, giftId)
  local data = {}
  data.m = tcpFormat.claimMysteryBox()
  data.f = friendId
  data.g = giftId
  data.i = id
  tcpSocial.sendPacket(data)
end

local function stopTCPSocial(isHardStop)
  C.callback = nil
  tcpSocial.closeTCP(isHardStop)
end

C.stopTCPSocial = stopTCPSocial

function C.hostGame(currentZone)
  local data = {}
  data.m = tcpFormat.hostGame()
  data.z = currentZone
  tcpSocial.sendPacket(data)
end

local function getGameServerAddress()
  local data = {}
  data.m = tcpFormat.requestGame()
  data.z = 1
  tcpSocial.sendPacket(data)
end

C.getGameServerAddress = getGameServerAddress

function C.deleteFriendRequest(playerId)
  local data = {}
  data.m = tcpFormat.deleteFriendRequest()
  data.p = playerId
  tcpSocial.sendPacket(data)
end

function C.acceptFriendRequest(playerId)
  local data = {}
  data.m = tcpFormat.acceptFriendRequest()
  data.p = playerId
  tcpSocial.sendPacket(data)
end

function C.deleteFriend(playerId)
  local data = {}
  data.m = tcpFormat.deleteFriend()
  data.p = playerId
  tcpSocial.sendPacket(data)
end

function C.isOnline()
  return tcpSocial.isOnline()
end

function C.playerStateUpdate(state)
  local data = {}
  data.m = tcpFormat.playerStateUpdate()
  data.s = state
  tcpSocial.sendPacket(data)
end

function C.useSpin()
  local data = {}
  data.m = tcpFormat.useSpin()
  tcpSocial.sendPacket(data)
end

function C.updatePushNotificationSettings(gameInviteStatus, friendRequestStatus, generalStatus)
  local data = {}
  data.m = tcpFormat.updatePushNotificationSettings()
  data.sa = gameInviteStatus
  data.sb = friendRequestStatus
  data.sc = generalStatus
  tcpSocial.sendPacket(data)
end

local function getNumberOfNotifications()
  local numberOfInvites = #composer.database.getGameInvites()
  local numberOfFriendRequests = composer.database.getNumberOfFriendRequests()
  local numberOfMysterBoxes = #composer.database.getMysteryBoxes()
  return numberOfFriendRequests + numberOfInvites + numberOfMysterBoxes
end

C.getNumberOfNotifications = getNumberOfNotifications

function C.purchaseItem(itemId)
  local data = {}
  data.m = tcpFormat.purchaseItem()
  data.i = itemId
  tcpSocial.sendPacket(data)
end

function C.setActiveCreature()
  local data = {}
  data.m = tcpFormat.setActiveCreature()
  data.fa = composer.monsterConverter.toServerFormat(composer.database.getAvatarData())
  tcpSocial.sendPacket(data)
end

composer.comm = C
