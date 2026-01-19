local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter, checkForNewNotifications
local notificationPlugin
if "simulator" ~= system.getInfo("environment") then
  local success, plugin = pcall(require, "plugin.notifications")
  if success then notificationPlugin = plugin end
end
local backgroundImage, bearHead, logo, buttonStick
local btnPlay, btnSettings, btnRanking, btnFriends, btnCustomize, btnEarnCoins
local tutorialLoadingScreen, loadText
local layoutMainMenu, layoutSaleGroup, resizeListener

function scene:create(event)
  local screenGroup = self.view
  local allreadyRun = false
  local notifications = {}
  local notificationText = {}
  local startedClean = false

  local function btnPlayRelease(event)
    composer.gotoScene("lua.scenes.playMenu")
  end

  local function btnSettingsRelease(event)
    composer.gotoScene("lua.scenes.settings")
  end

  local function btnRankingRelease(event)
    if composer.comm.isOnline() then
      composer.gotoScene("lua.scenes.ranking")
    else
      composer.createCustomOverlay(1)
    end
  end

  local function btnFriendsRelease(event)
    if composer.comm.isOnline() then
      local options = { isModal = true }
      composer.showOverlay("lua.overlays.messages", options)
    else
      composer.createCustomOverlay(1)
    end
  end

  local function btnCustomizeRelease(event)
    if composer.comm.isOnline() then
      composer.analytics.newEvent("design", {
        event_id = "marketButton:mainMenu",
        value = composer.database.getMoney(),
        area = "mainMenu"
      })
      composer.gotoScene("lua.scenes.marketplace")
    else
      composer.createCustomOverlay(1)
    end
  end

  local function btnEarnCoinsRelease(event)
    if composer.comm.isOnline() then
      local options = { isModal = true }
      composer.showOverlay("lua.overlays.achievementsScene", options)
    else
      composer.createCustomOverlay(1)
    end
  end

  composer.playerInfo = composer.database.getPlayerInformation()
  backgroundImage = display.newImageRect("images/gui/common/bgMain.png", 480, 320)
  bearHead = display.newImageRect("images/gui/common/bgMainBear.png", 62, 60)
  logo = display.newImageRect("images/gui/common/logo.png", 224, 135)
  buttonStick = display.newImageRect("images/gui/mainMenu/buttonPlayStick.png", 130, 120)
  btnPlay = composer.newButton({
    image = "images/gui/mainMenu/buttonPlayX.png",
    width = 128,
    height = 75,
    onRelease = btnPlayRelease,
    x = 0,
    y = 0
  })
  btnSettings = composer.newButton({
    image = "images/gui/mainMenu/buttonSettings.png",
    width = 52,
    height = 52,
    onRelease = btnSettingsRelease,
    x = 0,
    y = 0
  })
  btnRanking = composer.newButton({
    image = "images/gui/mainMenu/buttonLeaderboards.png",
    width = 52,
    height = 52,
    onRelease = btnRankingRelease,
    x = 0,
    y = 0
  })
  btnFriends = composer.newButton({
    image = "images/gui/mainMenu/buttonFriends.png",
    width = 52,
    height = 52,
    onRelease = btnFriendsRelease,
    x = 0,
    y = 0
  })
  btnCustomize = composer.newButton({
    image = "images/gui/mainMenu/buttonMarket.png",
    width = 89,
    height = 52,
    onRelease = btnCustomizeRelease,
    x = 0,
    y = 0
  })
  btnEarnCoins = composer.newButton({
    image = "images/gui/mainMenu/buttonAchievements.png",
    width = 52,
    height = 52,
    onRelease = btnEarnCoinsRelease,
    x = 0,
    y = 0
  })

  layoutMainMenu = function()
    local contentLeft = display.screenOriginX
    local contentTop = display.screenOriginY
    local contentWidth = display.actualContentWidth
    local contentHeight = display.actualContentHeight
    local centerX = contentLeft + contentWidth * 0.5
    local centerY = contentTop + contentHeight * 0.5
    local bottom = contentTop + contentHeight

    if backgroundImage then
      backgroundImage.x = centerX
      backgroundImage.y = centerY
      backgroundImage.xScale = 1
      backgroundImage.yScale = 1
      local scale = math.max(contentWidth / backgroundImage.width, contentHeight / backgroundImage.height)
      backgroundImage.xScale = scale
      backgroundImage.yScale = scale
    end
    if logo then
      logo.x = centerX
      logo.y = contentTop + contentHeight * 0.25
    end
    if buttonStick then
      buttonStick.x = centerX
      buttonStick.y = contentTop + contentHeight * 0.65
    end
    if btnPlay then
      btnPlay.x = centerX
      btnPlay.y = contentTop + contentHeight * 0.6
    end
    if bearHead then
      bearHead.x = centerX + contentWidth * 0.05
      bearHead.y = contentTop + contentHeight * 0.78
    end
    if btnSettings then
      btnSettings.x = contentLeft + 30
      btnSettings.y = bottom - 26
    end
    if btnRanking then
      btnRanking.x = contentLeft + 85
      btnRanking.y = bottom - 26
    end
    if btnFriends then
      btnFriends.x = contentLeft + 140
      btnFriends.y = bottom - 26
    end
    if btnCustomize then
      btnCustomize.x = contentLeft + contentWidth - 50
      btnCustomize.y = bottom - 26
    end
    if btnEarnCoins then
      btnEarnCoins.x = contentLeft + contentWidth - 124
      btnEarnCoins.y = bottom - 26
    end
    if tutorialLoadingScreen then
      tutorialLoadingScreen.x = centerX
      tutorialLoadingScreen.y = centerY
      tutorialLoadingScreen.xScale = 1
      tutorialLoadingScreen.yScale = 1
      local scale = math.max(contentWidth / tutorialLoadingScreen.width, contentHeight / tutorialLoadingScreen.height)
      tutorialLoadingScreen.xScale = scale
      tutorialLoadingScreen.yScale = scale
    end
    if loadText then
      loadText.x = centerX
      loadText.y = centerY
    end
  end

  local function cleanNotifications()
    if notifications[1] then
      notifications[1]:removeSelf()
      notifications[1] = nil
    end
    if notificationText[1] then
      notificationText[1]:removeSelf()
      notificationText[1] = nil
    end
    if notifications[2] then
      notifications[2]:removeSelf()
      notifications[2] = nil
    end
    if notificationText[2] then
      notificationText[2]:removeSelf()
      notificationText[2] = nil
    end
    if notifications[3] then
      notifications[3]:removeSelf()
      notifications[3] = nil
    end
    if notificationText[3] then
      notificationText[3]:removeSelf()
      notificationText[3] = nil
    end
  end

  local function checkForNotifications()
    if startedClean then
      return
    end
    cleanNotifications()
    local friendNotifications = composer.comm.getNumberOfNotifications()
    if 0 < friendNotifications then
      if 99 < friendNotifications then
        friendNotifications = 99
      end
      notifications[1] = display.newImageRect("images/gui/mainMenu/alert.png", 20, 20)
      notifications[1].x = btnFriends.getX() + 23
      notifications[1].y = btnFriends.getY() - 20
      screenGroup:insert(notifications[1])
      notificationText[1] = composer.newText({
        string = friendNotifications,
        x = notifications[1].x,
        y = notifications[1].y,
        size = 20,
        color = {
          1,
          1,
          1
        }
      })
      screenGroup:insert(notificationText[1])
    end
    local marketNotificationList = composer.database.getMarketNotification()
    local marketNotifications = marketNotificationList.number
    if 0 < marketNotifications then
      if 99 < marketNotifications then
        marketNotifications = 99
      end
      notifications[2] = display.newImageRect("images/gui/mainMenu/alert.png", 20, 20)
      notifications[2].x = btnCustomize.getX() + 34
      notifications[2].y = btnCustomize.getY() - 20
      screenGroup:insert(notifications[2])
      notificationText[2] = composer.newText({
        string = marketNotifications,
        x = notifications[2].x,
        y = notifications[2].y,
        size = 20,
        color = {
          1,
          1,
          1
        }
      })
      screenGroup:insert(notificationText[2])
    end
    local achievementNotifications = composer.data.dailyToClaim + composer.data.achievementToClaim
    if 0 < achievementNotifications then
      if 99 < achievementNotifications then
        achievementNotifications = 99
      end
      notifications[3] = display.newImageRect("images/gui/mainMenu/alert.png", 20, 20)
      notifications[3].x = btnEarnCoins.getX() + 23
      notifications[3].y = btnEarnCoins.getY() - 20
      screenGroup:insert(notifications[3])
      notificationText[3] = composer.newText({
        string = achievementNotifications,
        x = notifications[3].x,
        y = notifications[3].y,
        size = 20,
        color = {
          1,
          1,
          1
        }
      })
      screenGroup:insert(notificationText[3])
    end
  end

  local function addTutorialImages()
    if composer.data.tutorial then
      tutorialLoadingScreen = display.newImageRect("images/gui/common/bgBlur.png", 480, 320)
      screenGroup:insert(tutorialLoadingScreen)
      tutorialLoadingScreen.alpha = 0
      loadText = composer.newText({
        string = composer.localized.get("LoadingGame"),
        x = 0,
        y = 0,
        size = 24
      })
      screenGroup:insert(loadText)
      loadText.alpha = 0
    end
  end

  local function updateDisplay()
    screenGroup:insert(backgroundImage)
    screenGroup:insert(logo)
    screenGroup:insert(buttonStick)
    screenGroup:insert(btnPlay)
    screenGroup:insert(bearHead)
    screenGroup:insert(btnSettings)
    screenGroup:insert(btnRanking)
    screenGroup:insert(btnFriends)
    screenGroup:insert(btnCustomize)
    screenGroup:insert(btnEarnCoins)
  end

  function checkForNewNotifications()
    if startedClean then
      return
    end
    checkForNotifications()
  end

  function clean()
    startedClean = true
    display.remove(btnPlay)
    display.remove(btnSettings)
    display.remove(btnRanking)
    display.remove(btnFriends)
    display.remove(btnCustomize)
    display.remove(btnEarnCoins)
  end

  updateDisplay()
  addTutorialImages()
  if layoutMainMenu then
    layoutMainMenu()
  end
end

function scene:show(event)
  local phase = event.phase
  local screenGroup = self.view
  if phase == "will" then
    return
  end
  local androidLogic = require("lua.modules.androidBackButton")
  local videoModule = require("lua.ads.videoModule")
  local saleGroup = display.newGroup()
  local showingSaleInfo = false
  screenGroup:insert(saleGroup)

  resizeListener = function()
    if layoutMainMenu then
      layoutMainMenu()
    end
    if layoutSaleGroup then
      layoutSaleGroup()
    end
    if checkForNewNotifications then
      checkForNewNotifications()
    end
  end
  Runtime:addEventListener("resize", resizeListener)
  resizeListener()

  local function getTimeLeftInText(timeLeft)
    if timeLeft then
      local minutes = math.floor(timeLeft / 60)
      local hours = math.floor(minutes / 60)
      local days = math.floor(hours / 24)
      minutes = minutes - hours * 60
      hours = hours - days * 24
      local text = days .. "d " .. hours .. "h " .. minutes .. "m"
      return text
    end
    return ""
  end

  local function goToMarket()
    if composer.comm.isOnline() then
      composer.analytics.newEvent("design", {
        event_id = "marketButton:mainMenu",
        value = composer.database.getMoney(),
        area = "mainMenu"
      })
      composer.gotoScene("lua.scenes.marketplace")
    else
      composer.createCustomOverlay(1)
    end
  end

  local saleBackground, saleItem, infoText, timeLeftText
  layoutSaleGroup = function()
    local contentLeft = display.screenOriginX
    local contentTop = display.screenOriginY
    local contentWidth = display.actualContentWidth
    if saleBackground then
      saleBackground.x = contentLeft + contentWidth
      saleBackground.y = contentTop
    end
    if saleItem and saleBackground then
      saleItem.x = saleBackground.x - 36
      saleItem.y = saleBackground.y + 14
    end
    if infoText and saleBackground then
      infoText.x = saleBackground.x - 34
      infoText.y = saleBackground.y + 40
    end
    if timeLeftText and saleBackground then
      timeLeftText.x = saleBackground.x - 38
      timeLeftText.y = saleBackground.y + 54
    end
  end

  local function checkForPromoItem()
    if showingSaleInfo then
      return
    end
    if composer.database.promoSale then
      if composer.database.promoSale.b < 0 then
        return
      end
      local saleItemPath = "images/gui/mainMenu/" .. composer.database.promoSale.a .. ".png"
      if system.pathForFile(saleItemPath, system.ResourceDirectory) == nil then
        return
      end
      saleItem = display.newImageRect(saleItemPath, 50, 32)
      showingSaleInfo = true
      saleBackground = display.newImageRect("images/gui/mainMenu/specialCorner.png", 80, 67)
      saleBackground.anchorX = 1
      saleBackground.anchorY = 0
      saleGroup:insert(saleBackground)
      saleItem.anchorX = 0.5
      saleItem.anchorY = 0.5
      saleGroup:insert(saleItem)
      infoText = composer.newText({
        string = composer.localized.get("sale"),
        size = 20,
        x = 0,
        y = 0,
        ax = 0.5
      })
      saleGroup:insert(infoText)
      timeLeftText = composer.newText({
        string = getTimeLeftInText(composer.database.promoSale.b),
        size = 14,
        x = 0,
        y = 0,
        ax = 0.5,
        color = {
          0.47058823529411764,
          0.47058823529411764,
          0.47058823529411764
        }
      })
      saleGroup:insert(timeLeftText)
      saleGroup:addEventListener("tap", goToMarket)
      if layoutSaleGroup then
        layoutSaleGroup()
      end
    end
  end

  local function getUpdatesFromServer(data)
    if data.m then
      checkForNewNotifications()
      checkForPromoItem()
    end
  end

  local function startGame()
    composer.data.gameInfo.players[1] = {
      username = composer.database.getPlayerInformation().username,
      avatar = composer.database.getAvatarData(),
      playerId = composer.database.getPlayerInformation().playerId
    }
    composer.data.gameInfo.gameType = composer.config.gameType
    composer.data.gameInfo.map = composer.config.mapId
    composer.gotoScene("lua.scenes.gamePlay")
  end

  local function runBot()
    if isSimulator and composer.config.bot then
      composer.comm.isOnline()
      composer.gotoScene("lua.scenes.playMenu")
    end
  end

  function cleanEnter()
    androidLogic.removeBackButton()
    saleGroup:removeEventListener("tap", goToMarket)
  end

  checkForNewNotifications()
  composer.comm.setCallback(getUpdatesFromServer)

  function scene:overlayEnded()
    checkForNewNotifications()
    composer.comm.setCallback(getUpdatesFromServer)
  end

  if composer.data.wrongVersion then
    composer.gotoScene("lua.scenes.updateScene")
  end
  composer.enterMainMenu = true
  if composer.errorTable.server and composer.errorTable.showServerError then
    composer.errorTable.showServerError = false
  end
  if composer.config.startGameAtOnce then
    startGame()
  elseif composer.config.showPostLobby then
    composer.data.gameInfo.map = composer.config.mapId
    composer.data.gameInfo.gameType = composer.config.gameType
    composer.data.gameInfo.players[1] = {
      username = composer.database.getPlayerInformation().username,
      avatar = composer.database.getAvatarData(),
      playerId = composer.database.getPlayerInformation().playerId
    }
    composer.data.gameInfo.players[2] = {
      username = "BearBot",
      avatar = {
        105,
        0,
        0,
        0,
        0,
        0,
        0
      },
      playerId = 1
    }
    composer.data.gameInfo.players[3] = {
      username = "PandaBot",
      avatar = {
        105,
        214,
        0,
        0,
        0,
        0,
        0
      },
      playerId = 2
    }
    composer.data.gameInfo.players[4] = {
      username = "TurtleBot",
      avatar = {
        104,
        0,
        0,
        0,
        0,
        0,
        0
      },
      playerId = 3
    }
    composer.gotoScene("lua.scenes.postLobby")
  end
  if composer.contextualOnboarding.isActive == true then
    composer.onboarding.addGuiReference("mainMenu_playButton", screenGroup)
    if composer.contextualOnboarding.isPartActive(3) then
      if 1 > composer.gamesPlayed then
        composer.contextualOnboarding.showPlayArrow()
      else
        composer.contextualOnboarding.setPartDone(3)
      end
    end
  end
  androidLogic.addBackButton()
  timer.performWithDelay(2000, runBot, 1)
  composer.notification.checkForPushNotification()
  if notificationPlugin and notificationPlugin.cancelAllNotifications then
    notificationPlugin.cancelAllNotifications()
  end
  videoModule.loadAd()
  checkForPromoItem()
  if composer.goToLobbyCustomPlay then
    composer.goToLobbyCustomPlay = false
    composer.gameHostData = {}
    composer.data.gameInfo.gameType = 3
    composer.gotoScene("lua.scenes.lobbyCustomPlay")
  elseif composer.showingSendGift then
    composer.showingSendGift = false
    local options = {
      isModal = true,
      params = { mysteryBox = true }
    }
    composer.showOverlay("lua.overlays.messages", options)
  elseif composer.todayChallenges.shouldShow and composer.todayChallenges.data and composer.todayChallenges.time then
    local options = { isModal = true }
    composer.showOverlay("lua.overlays.todaysChallenges", options)
  end
end

function scene:hide(event)
  local phase = event.phase
  if phase == "will" then
    if composer.contextualOnboarding.isActive == true and composer.contextualOnboarding.isPartActive(3) then
      composer.contextualOnboarding.hidePlayArrow()
    end
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
