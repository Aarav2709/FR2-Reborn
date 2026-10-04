local composer = require("composer")
local seasonal = require("lua.modules.seasonalModule")
local layoutGroup = require("lua.modules.layoutGroup")
local screen = require("lua.modules.screen")
local scene = composer.newScene()
local clean, cleanEnter
local backgroundImage, tipBackground, btnSingleplayerStick, btnQuickPlayrStick, btnCustomPlayStick
local btnSingleplayer, btnQuickPlay, btnCustomPlay, btnBack, btnPractice, infoText
local layoutPlayMenu, resizeListener
local uiGroup, updateUiGroup
local UI_BASE_W, UI_BASE_H

function scene:create(event)
  local screenGroup = self.view
  UI_BASE_W = display.contentWidth
  UI_BASE_H = display.contentHeight
  uiGroup, updateUiGroup = layoutGroup.new(screenGroup, UI_BASE_W, UI_BASE_H)
  local tryItAlert

  local function showAlert(alertType)
    if tryItAlert then
      native.cancelAlert(tryItAlert)
      tryItAlert = nil
    end
    if alertType == 1 then
    elseif alertType == 2 then
    elseif alertType == 3 then
      tryItAlert = native.showAlert(composer.localized.get("ServerMessage"), composer.errorTable.quickplay, {
        composer.localized.get("Ok")
      })
    elseif alertType == 4 then
      tryItAlert = native.showAlert(composer.localized.get("ServerMessage"), composer.errorTable.friends, {
        composer.localized.get("Ok")
      })
    end
  end

  local function btnPracticePlayPlayRelease(event)
    composer.data.gameInfo.teamMode = nil
    composer.gotoScene("lua.scenes.lobbyPractice")
  end

  local function btn2v2Release(event)
    composer.data.gameInfo.teamMode = true
    composer.gotoScene("lua.scenes.lobbyPractice")
  end

  -- Quick Play is the ranked mode (offline: against bots), with coins, gems and league.
  local function btnQuickPlayRelease(event)
    composer.data.gameInfo.teamMode = nil
    composer.data.gameInfo.gameType = 0
    composer.gotoScene("lua.scenes.lobbyQuickPlay")
    composer.removeScene("lua.scenes.playMenu")
  end

  local function btnCustomPlayRelease(event)
    if composer.comm.isOnline() then
      composer.gameHostData = {}
      composer.data.gameInfo.gameType = 3
      composer.gotoScene("lua.scenes.lobbyCustomPlay")
    else
      composer.createCustomOverlay(1)
    end
  end

  local function btnBackRelease(event)
    composer.gotoScene("lua.scenes.mainMenu")
  end

  backgroundImage = display.newImageRect(seasonal.menuBackground(), 1920, 1080)
  tipBackground = display.newImageRect("images/gui/play/windowTips.png", 305, 60)
  btnSingleplayerStick = display.newImageRect("images/gui/play/buttonStickFriends.png", 38, 159)
  btnQuickPlayrStick = display.newImageRect("images/gui/play/buttonQuickplayStick.png", 50, 200)
  btnCustomPlayStick = display.newImageRect("images/gui/play/buttonStickFriends.png", 38, 159)
  local practiceButtonSize = display.newImage("images/gui/play/button2v2Play.png")
  local practiceButtonWidth = practiceButtonSize.width
  local practiceButtonHeight = practiceButtonSize.height
  local targetPracticeWidth = 116
  local targetPracticeHeight = 103
  local practiceScale = math.min(targetPracticeWidth / practiceButtonWidth, targetPracticeHeight / practiceButtonHeight)
  local practiceButtonScaledWidth = math.floor(practiceButtonWidth * practiceScale + 0.5)
  local practiceButtonScaledHeight = math.floor(practiceButtonHeight * practiceScale + 0.5)
  practiceButtonSize:removeSelf()
  practiceButtonSize = nil
  btnSingleplayer = composer.newButton({
    image = "images/gui/play/button2v2Play.png",
    text = {
      string = composer.localized.get("2 vs 2"),
      size = 22,
      languageSizes = { fr = 18, es = 16 },
      y = 30,
      x = 0
    },
    width = practiceButtonScaledWidth,
    height = practiceButtonScaledHeight,
    onRelease = btn2v2Release,
    x = 0,
    y = 0
  })
  -- Practice hangs under the Quick Play sign, as in Fun Run 2.
  btnPractice = composer.newButton({
    image = "images/gui/play/buttonPractice.png",
    width = 125,
    height = 41,
    onRelease = btnPracticePlayPlayRelease,
    x = 0,
    y = 0
  })
  btnQuickPlay = composer.newButton({
    image = "images/gui/play/buttonQuickplay.png",
    text = {
      string = composer.localized.get("QuickPlay"),
      size = 30,
      languageSizes = {
        fr = 28,
        es = 26,
        ja = 18,
        ko = 25,
        de = 24
      },
      y = 40,
      x = 0
    },
    width = 168,
    height = 145,
    onRelease = btnQuickPlayRelease,
    x = 0,
    y = 0
  })
  btnCustomPlay = composer.newButton({
    image = "images/gui/play/buttonFriends.png",
    text = {
      string = composer.localized.get("Friends"),
      size = 20,
      languageSizes = { fr = 18, es = 16 },
      y = 30,
      x = 0
    },
    width = 116,
    height = 103,
    onRelease = btnCustomPlayRelease,
    x = 0,
    y = 0
  })
  btnBack = composer.newButton({
    image = "images/gui/common/buttonHome.png",
    width = 90,
    height = 57,
    onRelease = btnBackRelease,
    x = 0,
    y = 0
  })

  layoutPlayMenu = function()
    screen.update()
    local contentLeft = screen.left
    local contentTop = screen.top
    local contentWidth = screen.width
    local contentHeight = screen.height
    local centerX = screen.centerX

    screen.cover(backgroundImage)
    if tipBackground then
      tipBackground.x = centerX
      tipBackground.y = screen.safeTop + 28
    end
    if btnSingleplayerStick then
      btnSingleplayerStick.x = contentLeft + contentWidth * 0.17
      btnSingleplayerStick.y = contentTop + contentHeight * 0.58
    end
    if btnQuickPlayrStick then
      btnQuickPlayrStick.x = contentLeft + contentWidth * 0.501
      btnQuickPlayrStick.y = contentTop + contentHeight * (178 / 320)
    end
    if btnCustomPlayStick then
      btnCustomPlayStick.x = contentLeft + contentWidth * 0.83
      btnCustomPlayStick.y = contentTop + contentHeight * 0.58
    end
    if btnSingleplayer then
      btnSingleplayer.x = contentLeft + contentWidth * 0.17
      btnSingleplayer.y = contentTop + contentHeight * 0.52
    end
    if btnQuickPlay then
      btnQuickPlay.x = centerX
      btnQuickPlay.y = contentTop + contentHeight * 0.48
    end
    if btnPractice then
      btnPractice.x = centerX
      btnPractice.y = contentTop + contentHeight * 0.76
    end
    if btnCustomPlay then
      btnCustomPlay.x = contentLeft + contentWidth * 0.83
      btnCustomPlay.y = contentTop + contentHeight * 0.52
    end
    if btnBack then
      -- The home sign's post runs off the bottom edge on purpose.
      btnBack.x = screen.safeLeft + 70
      btnBack.y = screen.bottom - 26
    end
    if infoText and tipBackground then
      -- The plank is the upper 50 of the sign's 60 units (the rest is its shadow).
      infoText.x = tipBackground.x
      infoText.y = tipBackground.y - 3
    end
  end

  local function updateDisplayGroups()
    screenGroup:insert(1, backgroundImage)
    uiGroup:insert(tipBackground)
    uiGroup:insert(btnSingleplayerStick)
    uiGroup:insert(btnQuickPlayrStick)
    uiGroup:insert(btnCustomPlayStick)
    uiGroup:insert(btnSingleplayer)
    uiGroup:insert(btnQuickPlay)
    uiGroup:insert(btnPractice)
    uiGroup:insert(btnCustomPlay)
    uiGroup:insert(btnBack)
  end

  function clean()
    display.remove(btnSingleplayer)
    display.remove(btnQuickPlay)
    display.remove(btnPractice)
    display.remove(btnCustomPlay)
    display.remove(btnBack)
    if tryItAlert then
      native.cancelAlert(tryItAlert)
      tryItAlert = nil
    end
  end

  updateDisplayGroups()
  if layoutPlayMenu then
    layoutPlayMenu()
  end
end

function scene:show(event)
  local phase = event.phase
  if phase == "will" then
    return
  end
  local screenGroup = self.view
  local androidLogic = require("lua.modules.androidBackButton")
  local botTimer
  -- Tips on the sign at the top (the original's, minus the ones about its website,
  -- social pages, accounts and online modes, plus a few about this version).
  local tipOfTheDay = {
    "Fun Run: It's Fun!",
    "Tip: Avoid traps! This also applies outside of Fun Run.",
    "Tip: The balloon absorbs one hit, and is not limited by time.",
    "No animals were harmed in the making of this game.",
    "Tip: The shield lasts for 6 seconds and makes you invulnerable!",
    "Tip: You can get new avatars and accessories in the Shop.",
    "Tip: Got an argument you can't settle? Decide it with a race!",
    "Tip: Replay the tutorial from the Settings menu.",
    "Tip: Sawblades bounce off walls. Use it to your advantage!",
    "Tip: Jumping slows you down slightly. Think before you jump.",
    "Tip: Lightning strikes shortly after clouds appear.",
    "Tip: Be careful when handling sawblades outside of the app!",
    "Tip: Master skins can only be bought using coins!",
    "Tip: The coin booster doubles coins gained from races. Forever.",
    "Tip: The rocket explodes after a few seconds, killing anyone nearby. We blame poor engineering.",
    "Tip: Strapping animals to rockets is not as fun in real life.",
    "Tip: The Magnet pulls everyone towards you.",
    "Break a leg!",
    "Tip: Win races to earn league rating and climb to the next league.",
    "Tip: Finish the week in the top places of your league for the best prizes.",
    "Tip: Spin the prize wheel once a day for free coins, gems and items."
  }

  local function runBot()
    if isSimulator and composer.config.bot then
      composer.data.gameInfo.gameType = 1
      composer.gotoScene("lua.scenes.lobbyQuickPlay")
      composer.removeScene("lua.scenes.playMenu")
    end
  end

  function cleanEnter()
    androidLogic.removeBackButton()
    if infoText then
      infoText:removeSelf()
      infoText = nil
    end
    if botTimer then
      timer.cancel(botTimer)
      botTimer = nil
    end
    if composer.contextualOnboarding.isActive == true then
      composer.onboarding.clean()
    end
  end

  composer.data.gameInfo.players = {}
  androidLogic.addBackButton("lua.scenes.mainMenu")
  local tipToUse = composer.localized.get(tipOfTheDay[math.random(1, #tipOfTheDay)])
  if type(composer.data.messageOfTheDay) == "string" and 1 < string.len(composer.data.messageOfTheDay) then
    tipToUse = composer.data.messageOfTheDay
  end
  -- No fixed height, so one and two line tips both sit in the middle of the plank.
  infoText = composer.newText({
    string = tipToUse,
    size = 12,
    width = 285,
    color = { 1, 1, 1 },
    align = "center"
  })
  uiGroup:insert(infoText)
  if layoutPlayMenu then
    layoutPlayMenu()
  end
  resizeListener = function()
    if updateUiGroup then
      updateUiGroup()
    end
    if layoutPlayMenu then
      layoutPlayMenu()
    end
  end
  Runtime:addEventListener("resize", resizeListener)
  resizeListener()
  math.randomseed(os.time() + system.getTimer())
  composer.tcpClient.stopTCPClient()
  botTimer = timer.performWithDelay(2000, runBot, 1)
  if composer.contextualOnboarding.isActive == true and composer.contextualOnboarding.isPartActive(3) then
    if 1 > composer.gamesPlayed then
      composer.onboarding.addGuiReference("playMenu_quickPlay", screenGroup)
      composer.contextualOnboarding.showQuickPlayArrow()
    else
      composer.contextualOnboarding.setPartDone(3)
    end
  end
end

function scene:hide(event)
  local phase = event.phase
  if phase == "will" then
    if resizeListener then
      Runtime:removeEventListener("resize", resizeListener)
      resizeListener = nil
    end
    if composer.contextualOnboarding.isActive == true and composer.contextualOnboarding.isPartActive(3) then
      composer.contextualOnboarding.hideQuickPlayArrow()
    end
    if cleanEnter then
      cleanEnter()
      cleanEnter = nil
    end
  elseif phase == "did" then
  end
end

function scene:destroy(event)
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
