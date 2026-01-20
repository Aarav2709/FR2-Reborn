local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter
local backgroundImage, bearHead, tipBackground, btnSingleplayerStick, btnQuickPlayrStick, btnCustomPlayStick
local btnSingleplayer, btnQuickPlay, btnCustomPlay, btnBack, infoText
local layoutPlayMenu, resizeListener

function scene:create(event)
  local screenGroup = self.view
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

  local function btnPractisePlayPlayRelease(event)
    -- Offline mode: go directly to difficulty selection
    composer.gotoScene("lua.scenes.difficultySelect")
  end

  local function btnQuickPlayRelease(event)
    if composer.errorTable.quickplay then
      showAlert(3)
    elseif composer.comm.isOnline() then
      composer.data.gameInfo.gameType = 1
      composer.gotoScene("lua.scenes.lobbyQuickPlay")
      composer.removeScene("lua.scenes.playMenu")
    else
      composer.createCustomOverlay(1)
    end
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

  backgroundImage = display.newImageRect("images/gui/common/bgMain.png", 480, 320)
  bearHead = display.newImageRect("images/gui/common/bgMainBear.png", 62, 60)
  tipBackground = display.newImageRect("images/gui/play/windowTips.png", 305, 60)
  btnSingleplayerStick = display.newImageRect("images/gui/play/buttonStickPractice.png", 39, 153)
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
      string = composer.localized.get("Practice"),
      size = 20,
      languageSizes = { fr = 18, es = 16 },
      y = 30,
      x = 0
    },
    width = practiceButtonScaledWidth,
    height = practiceButtonScaledHeight,
    onRelease = btnPractisePlayPlayRelease,
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
    if bearHead then
      bearHead.x = contentLeft + contentWidth * 0.55
      bearHead.y = contentTop + contentHeight * 0.78
    end
    if tipBackground then
      tipBackground.x = centerX
      tipBackground.y = contentTop + contentHeight * (30 / 320)
    end
    if btnSingleplayerStick then
      btnSingleplayerStick.x = contentLeft + contentWidth * 0.17
      btnSingleplayerStick.y = contentTop + contentHeight * 0.58
    end
    if btnQuickPlayrStick then
      btnQuickPlayrStick.x = contentLeft + contentWidth * 0.501
      btnQuickPlayrStick.y = contentTop + contentHeight * (167 / 320)
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
    if btnCustomPlay then
      btnCustomPlay.x = contentLeft + contentWidth * 0.83
      btnCustomPlay.y = contentTop + contentHeight * 0.52
    end
    if btnBack then
      btnBack.x = contentLeft + contentWidth * (50 / 480)
      btnBack.y = contentTop + contentHeight * (292 / 320)
    end
    if infoText then
      infoText.x = contentLeft + contentWidth * (242 / 480)
      infoText.y = contentTop + contentHeight * (36 / 320)
    end
  end

  local function updateDisplayGroups()
    screenGroup:insert(backgroundImage)
    screenGroup:insert(tipBackground)
    screenGroup:insert(btnSingleplayerStick)
    screenGroup:insert(btnQuickPlayrStick)
    screenGroup:insert(btnCustomPlayStick)
    screenGroup:insert(btnSingleplayer)
    screenGroup:insert(btnQuickPlay)
    screenGroup:insert(btnCustomPlay)
    screenGroup:insert(bearHead)
    screenGroup:insert(btnBack)
  end

  function clean()
    display.remove(btnSingleplayer)
    display.remove(btnQuickPlay)
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
  local tipOfTheDay = {
    "TD1",
    "TD2",
    "TD3",
    "TD4",
    "TD5",
    "TD6",
    "TD7",
    "TD8",
    "TD9",
    "TD10",
    "TD11",
    "TD12",
    "TD13",
    "TD14",
    "TD15",
    "TD16",
    "TD17",
    "TD18",
    "TD19",
    "TD20",
    "TD21",
    "TD22",
    "TD23",
    "TD24",
    "TD25",
    "TD26",
    "TD27",
    "TD28",
    "TD29",
    "TD30",
    "TD31",
    "TD32",
    "TD33",
    "TD34",
    "TD35",
    "TD36",
    "TD37"
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
  local tipToUseString = tipOfTheDay[math.random(1, #tipOfTheDay)]
  local tipToUse = composer.localized.get(tipToUseString)
  if type(composer.data.messageOfTheDay) == "string" and 1 < string.len(composer.data.messageOfTheDay) then
    tipToUse = composer.data.messageOfTheDay
  end
  infoText = composer.newText({
    string = tipToUse,
    x = 0,
    y = 0,
    size = 12,
    width = 290,
    height = 50,
    color = {
      1,
      1,
      1
    },
    align = "center"
  })
  screenGroup:insert(infoText)
  if layoutPlayMenu then
    layoutPlayMenu()
  end
  resizeListener = function()
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
