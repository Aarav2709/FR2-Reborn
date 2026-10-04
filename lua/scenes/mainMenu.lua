local composer = require("composer")
local seasonal = require("lua.modules.seasonalModule")
local layoutGroup = require("lua.modules.layoutGroup")
local screen = require("lua.modules.screen")
local dailySpin = require("lua.modules.dailySpin")
local offlineLeague = require("lua.modules.offlineLeague")
local newsfeed = require("lua.overlays.newsfeed")
local pcMode = require("lua.modules.pcMode")
local scene = composer.newScene()
local clean, cleanEnter, checkForNewNotifications, refreshMainMenuAvatar
local notificationPlugin
if "simulator" ~= system.getInfo("environment") then
  local success, plugin = pcall(require, "plugin.notifications")
  if success then notificationPlugin = plugin end
end
local backgroundImage, bearHead, logo, buttonStick, buttonStickClan
local playerAvatarGroup, playerAvatar
local btnPlay, btnClan, btnSettings, btnNewsfeedSubtleSettings, btnRanking, btnFriends, btnCustomize, btnEarnCoins
local tutorialLoadingScreen, loadText
local layoutMainMenu, layoutSaleGroup, resizeListener
local uiGroup, updateUiGroup
local UI_BASE_W, UI_BASE_H

function scene:create(event)
  local screenGroup = self.view
  UI_BASE_W = display.contentWidth
  UI_BASE_H = display.contentHeight
  uiGroup, updateUiGroup = layoutGroup.new(screenGroup, UI_BASE_W, UI_BASE_H)
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

  local function btnNewsfeedSubtleSettingsRelease(event)
    composer.showOverlay("lua.overlays.newsfeed", { isModal = true })
  end

  local function btnClanRelease(event)
    composer.showOverlay("lua.overlays.clanSimulation", { isModal = true })
  end

  local function btnRankingRelease(event)
    composer.showOverlay("lua.overlays.league", { isModal = true })
  end

  local function btnFriendsRelease(event)
    if composer.comm.isOnline() then
      local options = { isModal = true }
      composer.showOverlay("lua.overlays.messages", options)
    else
      composer.showOverlay("lua.overlays.lanFriends", { isModal = true })
    end
  end

  local function btnCustomizeRelease(event)
    composer.analytics.newEvent("design", {
      event_id = "marketButton:mainMenu",
      value = composer.database.getMoney(),
      area = "mainMenu"
    })
    composer.gotoScene("lua.scenes.marketplace")
  end

  local function btnEarnCoinsRelease(event)
    if composer.comm.isOnline() then
      local options = { isModal = true }
      composer.showOverlay("lua.overlays.achievementsScene", options)
    else
      -- Offline the trophy opens the prize wheel: one free spin every 24 hours.
      composer.showOverlay("lua.overlays.spinningWheel", { isModal = true, params = {} })
    end
  end

  composer.playerInfo = composer.database.getPlayerInformation()
  backgroundImage = display.newImageRect(seasonal.menuBackground(), 1920, 1080)
  bearHead = display.newImageRect("images/gui/common/bgMainBear.png", 62, 60)
  logo = display.newImageRect("images/gui/common/logo.png", 244, 155)
  buttonStick = display.newImageRect("images/gui/mainMenu/buttonPlayStick.png", 150, 140)
  buttonStickClan = display.newImageRect("images/gui/mainMenu/buttonPlayStick.png", 90, 90)
  btnPlay = composer.newButton({
    image = "images/gui/mainMenu/buttonPlayX.png",
    width = 148,
    height = 95,
    onRelease = btnPlayRelease,
    x = 0,
    y = 0
  })
  btnClan = composer.newButton({
    image = "images/gui/ranking/tab_clans.png",
    width = 58,
    height = 58,
    onRelease = btnClanRelease,
    x = 0,
    y = 0
  })
  btnSettings = composer.newButton({
    image = "images/gui/mainMenu/settingsSubtle.png",
    width = 45,
    height = 45,
    onRelease = btnSettingsRelease,
    x = 0,
    y = 0
  })
  btnNewsfeedSubtleSettings = composer.newButton({
    image = "images/gui/mainMenu/newsfeedSubtle.png",
    width = 45,
    height = 45,
    onRelease = btnNewsfeedSubtleSettingsRelease,
    x = 0,
    y = 0
  })
  btnRanking = composer.newButton({
    image = "images/gui/mainMenu/buttonLeaderboards.png",
    width = 62,
    height = 62,
    onRelease = btnRankingRelease,
    x = 0,
    y = 0
  })
  btnFriends = composer.newButton({
    image = "images/gui/mainMenu/buttonFriends.png",
    width = 62,
    height = 62,
    onRelease = btnFriendsRelease,
    x = 0,
    y = 0
  })
  btnCustomize = composer.newButton({
    image = "images/gui/mainMenu/buttonMarket.png",
    width = 99,
    height = 62,
    onRelease = btnCustomizeRelease,
    x = 0,
    y = 0
  })
  btnEarnCoins = composer.newButton({
    image = "images/gui/mainMenu/buttonAchievements.png",
    width = 62,
    height = 62,
    onRelease = btnEarnCoinsRelease,
    x = 0,
    y = 0
  })

  local monsterLoader = require("spine-corona.monsterLoader")
  playerAvatarGroup = display.newGroup()
  refreshMainMenuAvatar = function()
    if not playerAvatarGroup then
      return
    end
    if playerAvatar then
      playerAvatar.clean()
      playerAvatar = nil
    end
    local avatarData = composer.database.getAvatarData()
    if not avatarData then
      return
    end
    -- Use local avatar format (same as marketplace) so equipped cosmetics are applied.
    playerAvatar = monsterLoader.new(avatarData, false, nil,
      composer.database.getBackwear and composer.database.getBackwear() or 0)
    if playerAvatar and playerAvatar.getGroup then
      local avatarGroup = playerAvatar.getGroup()
      avatarGroup.xScale = 0.5
      avatarGroup.yScale = 0.5
      playerAvatarGroup:insert(avatarGroup)
    end
  end
  scene.refreshAvatarDisplay = refreshMainMenuAvatar
  refreshMainMenuAvatar()

  layoutMainMenu = function()
    screen.update()
    local centerX = screen.centerX
    local height = screen.height
    local top = screen.top
    local bottom = screen.safeBottom
    -- On taller screens (tablets) the centre stack grows a little to use the extra height.
    local stackScale = math.min(height / 400, 1.25)

    screen.cover(backgroundImage)
    if logo then
      logo.xScale, logo.yScale = stackScale, stackScale
      logo.x = centerX
      logo.y = top + height * 0.25
    end
    if playerAvatarGroup then
      local avatarScale = 1.2 * stackScale
      playerAvatarGroup.xScale, playerAvatarGroup.yScale = avatarScale, avatarScale
      playerAvatarGroup.x = math.max(screen.safeLeft + 110, screen.left + screen.width * 0.2)
      playerAvatarGroup.y = top + height * 0.7
    end
    if buttonStick then
      buttonStick.xScale, buttonStick.yScale = stackScale, stackScale
      buttonStick.x = centerX
      buttonStick.y = top + height * 0.75
    end
    if btnPlay then
      btnPlay.xScale, btnPlay.yScale = stackScale, stackScale
      btnPlay.x = centerX
      btnPlay.y = top + height * 0.72
    end
    if bearHead then
      bearHead.x = centerX + 45
      bearHead.y = top + height * 0.9
    end
    -- Corner buttons stay inside the safe area (notches, camera cut-outs).
    btnSettings.x = screen.safeLeft + 32
    btnSettings.y = screen.safeTop + 32
    btnNewsfeedSubtleSettings.x = screen.safeLeft + 82
    btnNewsfeedSubtleSettings.y = screen.safeTop + 32
    local leftX = screen.safeLeft + 50
    if btnClan then
      btnClan.x = leftX
      btnClan.y = bottom - 31
    end
    if buttonStickClan then
      buttonStickClan.x = leftX
      buttonStickClan.y = bottom + 3
    end
    if btnRanking then
      btnRanking.x = leftX + 71
      btnRanking.y = bottom - 28
    end
    if btnFriends then
      btnFriends.x = leftX + 142
      btnFriends.y = bottom - 28
    end
    if btnCustomize then
      btnCustomize.x = screen.safeRight - 58
      btnCustomize.y = bottom - 28
    end
    if btnEarnCoins then
      btnEarnCoins.x = screen.safeRight - 148
      btnEarnCoins.y = bottom - 28
    end
    screen.cover(tutorialLoadingScreen)
    if loadText then
      loadText.x = screen.centerX
      loadText.y = screen.centerY
    end
  end

  local function cleanNotifications()
    for i = 1, 4 do
      display.remove(notifications[i])
      notifications[i] = nil
      display.remove(notificationText[i])
      notificationText[i] = nil
    end
  end

  -- The red badge with a count on a menu button.
  local function addBadge(index, button, count, offsetX)
    notifications[index] = display.newImageRect("images/gui/mainMenu/alert.png", 20, 20)
    notifications[index].x = button.x + offsetX
    notifications[index].y = button.y - 20
    uiGroup:insert(notifications[index])
    notificationText[index] = composer.newText({
      string = math.min(count, 99),
      x = notifications[index].x,
      y = notifications[index].y,
      size = 20,
      color = { 1, 1, 1 }
    })
    uiGroup:insert(notificationText[index])
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
      notifications[1].x = btnFriends.x + 23
      notifications[1].y = btnFriends.y - 20
      uiGroup:insert(notifications[1])
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
      uiGroup:insert(notificationText[1])
    end
    local marketNotificationList = composer.database.getMarketNotification()
    local marketNotifications = marketNotificationList.number
    if 0 < marketNotifications then
      if 99 < marketNotifications then
        marketNotifications = 99
      end
      notifications[2] = display.newImageRect("images/gui/mainMenu/alert.png", 20, 20)
      notifications[2].x = btnCustomize.x + 34
      notifications[2].y = btnCustomize.y - 20
      uiGroup:insert(notifications[2])
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
      uiGroup:insert(notificationText[2])
    end
    local achievementNotifications = (composer.data.dailyToClaim or 0) + (composer.data.achievementToClaim or 0)
    if dailySpin.hasFreeSpin() then
      achievementNotifications = achievementNotifications + 1
    end
    if 0 < achievementNotifications then
      addBadge(3, btnEarnCoins, achievementNotifications, 23)
    end
    if newsfeed.hasUnreadNews() then
      addBadge(4, btnNewsfeedSubtleSettings, 1, 16)
    end
  end

  local function addTutorialImages()
    if composer.data.tutorial then
      tutorialLoadingScreen = display.newImageRect(seasonal.menuBackground(), display.actualContentWidth + 100, display.actualContentHeight + 100)
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
    screenGroup:insert(1, backgroundImage)
    uiGroup:insert(playerAvatarGroup)
    uiGroup:insert(logo)
    uiGroup:insert(buttonStick)
    uiGroup:insert(buttonStickClan)
    uiGroup:insert(btnPlay)
    uiGroup:insert(bearHead)
    uiGroup:insert(btnSettings)
    uiGroup:insert(btnClan)
    uiGroup:insert(btnNewsfeedSubtleSettings)
    uiGroup:insert(btnRanking)
    uiGroup:insert(btnFriends)
    uiGroup:insert(btnCustomize)
    uiGroup:insert(btnEarnCoins)
  end

  function checkForNewNotifications()
    if startedClean then
      return
    end
    checkForNotifications()
    -- (The PC menu has no corner buttons for the badges to sit on.)
    if pcMode.isPC then
      for _, badge in pairs(notifications) do
        badge.isVisible = false
      end
      for _, text in pairs(notificationText) do
        text.isVisible = false
      end
    end
  end

  function clean()
    startedClean = true
    display.remove(btnPlay)
    display.remove(btnSettings)
    display.remove(btnClan)
    display.remove(btnNewsfeedSubtleSettings)
    display.remove(btnRanking)
    display.remove(btnFriends)
    display.remove(btnCustomize)
    display.remove(btnEarnCoins)
    if playerAvatar then
      playerAvatar.clean()
      playerAvatar = nil
    end
    display.remove(playerAvatarGroup)
    playerAvatarGroup = nil
  end

  updateDisplay()
  addTutorialImages()

  -- PC: a column on the right with the logo, one wooden plank per option and the coins
  -- and gems below; the player's animal stands large on the left of a softly blurred
  -- scene. The planks are buttons (mouse,
  -- arrow keys and Enter); the one in focus swings out (see keyboardNav.lua).
  if pcMode.isPC then
    local PLANK_W, PLANK_H, PLANK_GAP, LABEL_SIZE = 200, 34, 6, 19
    local pcMenu = display.newGroup()
    uiGroup:insert(pcMenu)
    local items = {
      { "Play", btnPlayRelease },
      { "Shop", btnCustomizeRelease },
      { "Leagues", btnRankingRelease },
      { "Daily Spin", btnEarnCoinsRelease },
      { "News", btnNewsfeedSubtleSettingsRelease },
      { "Settings", btnSettingsRelease },
      { "Quit", function() native.requestExit() end }
    }
    local planks = {}
    for i, item in ipairs(items) do
      local plank = composer.newButton({
        image = "images/gui/ranking/league/nextLeague.png",
        width = PLANK_W,
        height = PLANK_H,
        x = 0,
        y = 0,
        onRelease = item[2]
      })
      local label = composer.newText({ string = composer.localized.get(item[1]), size = LABEL_SIZE, color = { 1, 1, 1 } })
      label.y = 1
      plank:insert(label)
      pcMenu:insert(plank)
      -- Every other plank leans a little, like a real signpost.
      plank.restRotation = (i % 2 == 0) and 1.5 or -1.5
      plank.navCustomFocus = function(isFocused)
        transition.cancel(plank)
        transition.to(plank, {
          time = 140,
          rotation = isFocused and 4 or plank.restRotation,
          x = plank.restX - (isFocused and 14 or 0),
          xScale = isFocused and 1.06 or 1,
          yScale = isFocused and 1.06 or 1,
          transition = easing.outQuad
        })
        label:setFillColor(1, isFocused and 0.85 or 1, isFocused and 0.3 or 1)
      end
      planks[i] = plank
    end
    local coinIcon = display.newImageRect(pcMenu, "images/gui/common/coin_small.png", 18, 18)
    local coinText = composer.newText({ string = "", size = 16, color = { 1, 1, 1 }, ax = 1 })
    pcMenu:insert(coinText)
    local gemIcon = display.newImageRect(pcMenu, "images/gui/common/gem_small.png", 18, 18)
    local gemText = composer.newText({ string = "", size = 16, color = { 1, 1, 1 }, ax = 1 })
    pcMenu:insert(gemText)

    -- A soft blur on the background puts the menu and the animal in front.
    backgroundImage.fill.effect = "filter.blurGaussian"
    backgroundImage.fill.effect.horizontal.blurSize = 12
    backgroundImage.fill.effect.horizontal.sigma = 6
    backgroundImage.fill.effect.vertical.blurSize = 12
    backgroundImage.fill.effect.vertical.sigma = 6

    local mobileLayout = layoutMainMenu
    layoutMainMenu = function()
      mobileLayout()
      for _, object in ipairs({ btnPlay, buttonStick, buttonStickClan, bearHead, btnClan, btnRanking, btnFriends,
        btnCustomize, btnEarnCoins, btnSettings, btnNewsfeedSubtleSettings }) do
        object.isVisible = false
      end
      local top, height, width = screen.top, screen.height, screen.width
      local columnX = screen.safeRight - PLANK_W * 0.5 - 24
      local logoScale = (PLANK_W - 30) / logo.width
      local logoH = logo.height * logoScale
      local listH = #planks * PLANK_H + (#planks - 1) * PLANK_GAP
      local CURRENCY_H = 22
      local columnTop = top + (height - (logoH + 14 + listH + 14 + CURRENCY_H)) * 0.5
      logo.xScale, logo.yScale = logoScale, logoScale
      logo.x, logo.y = columnX, columnTop + logoH * 0.5
      local firstY = columnTop + logoH + 14 + PLANK_H * 0.5
      for i, plank in ipairs(planks) do
        plank.restX = columnX
        plank.x, plank.y = plank.restX, firstY + (i - 1) * (PLANK_H + PLANK_GAP)
        plank.rotation = plank.restRotation
      end
      -- Coins and gems in one centred line under the planks.
      coinText.text = tostring(composer.database.getMoney())
      gemText.text = tostring(composer.database.getGems())
      local currencyY = firstY + listH - PLANK_H * 0.5 + 14 + CURRENCY_H * 0.5
      local lineW = 18 + 6 + coinText.width + 22 + 18 + 6 + gemText.width
      local x = columnX - lineW * 0.5
      coinIcon.x, coinIcon.y = x + 9, currencyY
      coinText.x, coinText.y = x + 24 + coinText.width, currencyY
      gemIcon.x, gemIcon.y = coinText.x + 22 + 9, currencyY
      gemText.x, gemText.y = gemIcon.x + 15 + gemText.width, currencyY
      -- The animal, larger, standing in the open space left of the column.
      if playerAvatarGroup then
        local avatarScale = 1.75 * height / 460
        playerAvatarGroup.xScale, playerAvatarGroup.yScale = avatarScale, avatarScale
        playerAvatarGroup.x = screen.safeLeft + (columnX - PLANK_W * 0.5 - screen.safeLeft) * 0.24
        playerAvatarGroup.y = top + height * 0.65
      end
    end
  end

  if layoutMainMenu then
    layoutMainMenu()
  end
end

function scene:show(event)
  local phase = event.phase
  local screenGroup = self.view
  if phase == "will" then
    if refreshMainMenuAvatar then
      refreshMainMenuAvatar()
    end
    return
  end
  local androidLogic = require("lua.modules.androidBackButton")
  local saleGroup = display.newGroup()
  local pendingLeaguePromotion, leaguePopupTimer
  -- A Quick Play race left by closing the app costs the same as leaving it.
  offlineLeague.settleAbandonedRace()
  local showingSaleInfo = false
  screenGroup:insert(saleGroup)

  resizeListener = function()
    if updateUiGroup then
      updateUiGroup()
    end
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
    composer.analytics.newEvent("design", {
      event_id = "marketButton:mainMenu",
      value = composer.database.getMoney(),
      area = "mainMenu"
    })
    composer.gotoScene("lua.scenes.marketplace")
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
    composer.data.gameInfo.ranked = false
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
    if leaguePopupTimer then
      timer.cancel(leaguePopupTimer)
      leaguePopupTimer = nil
    end
  end

  checkForNewNotifications()
  composer.comm.setCallback(getUpdatesFromServer)

  -- Last week's league prize and any league change, one popup after the other.
  local function showLeaguePopups()
    leaguePopupTimer = nil
    if composer.onboarding.isActive == true or composer.getSceneName("overlay") then
      return
    end
    if not pendingLeaguePromotion then
      local prize, promotion = offlineLeague.takePendingPopups()
      -- A promotion from a race whose results were left before it was shown.
      pendingLeaguePromotion = promotion or composer.league
      composer.league = nil
      if prize then
        composer.showOverlay("lua.overlays.leaguePrize", { isModal = true, params = prize })
        return
      end
    end
    if pendingLeaguePromotion then
      local promotion = pendingLeaguePromotion
      pendingLeaguePromotion = nil
      composer.showOverlay("lua.overlays.leaguePromotion", { isModal = true, params = promotion })
    end
  end

  function scene:overlayEnded()
    checkForNewNotifications()
    composer.comm.setCallback(getUpdatesFromServer)
    if pendingLeaguePromotion and not leaguePopupTimer then
      leaguePopupTimer = timer.performWithDelay(300, showLeaguePopups)
    end
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
  leaguePopupTimer = timer.performWithDelay(600, showLeaguePopups)
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
