-- Difficulty selection screen
-- Bot difficulty selection for offline practice mode

local composer = require("composer")
local layoutGroup = require("lua.modules.layoutGroup")
local scene = composer.newScene()
local clean, cleanEnter
local backgroundImage, headerText, subText, btnEasy, easyDesc, btnMedium, mediumDesc, btnHard, hardDesc, btnBack
local layoutDifficultySelect, resizeListener
local uiGroup, updateUiGroup
local UI_BASE_W, UI_BASE_H

function scene:create(event)
  local screenGroup = self.view
  UI_BASE_W = display.contentWidth
  UI_BASE_H = display.contentHeight
  uiGroup, updateUiGroup = layoutGroup.new(screenGroup, UI_BASE_W, UI_BASE_H)

  -- Background
  backgroundImage = display.newImageRect("images/gui/common/bgMain.png", 1920, 1080)
  screenGroup:insert(backgroundImage)

  -- Title
  headerText = composer.newText({
    string = "SELECT DIFFICULTY",
    x = 0,
    y = 0,
    size = 32,
    color = { 1, 1, 1 }
  })
  uiGroup:insert(headerText)

  -- Subtitle
  subText = composer.newText({
    string = "Race against bot opponents!",
    x = 0,
    y = 0,
    size = 16,
    color = { 0.8, 0.8, 0.8 }
  })
  uiGroup:insert(subText)

  -- Difficulty button handlers
  local function btnEasyRelease(event)
    composer.data.gameInfo.difficulty = 1 -- Easy
    composer.data.gameInfo.botSpeed = 1.0 -- 100% exact player speed
    composer.gotoScene("lua.scenes.lobbyPractice")
  end

  local function btnMediumRelease(event)
    composer.data.gameInfo.difficulty = 2 -- Medium
    composer.data.gameInfo.botSpeed = 1.0 -- 100% exact player speed
    composer.gotoScene("lua.scenes.lobbyPractice")
  end

  local function btnHardRelease(event)
    composer.data.gameInfo.difficulty = 3 -- Hard
    composer.data.gameInfo.botSpeed = 1.0 -- 100% exact player speed
    composer.gotoScene("lua.scenes.lobbyPractice")
  end

  local function btnBackRelease(event)
    composer.gotoScene("lua.scenes.playMenu")
  end

  -- Easy button
  btnEasy = composer.newButton({
    image = "images/gui/play/buttonPractice.png",
    text = {
      string = "EASY",
      size = 24,
      y = 35,
      x = 0
    },
    width = 130,
    height = 115,
    onRelease = btnEasyRelease,
    x = 0,
    y = 0
  })
  uiGroup:insert(btnEasy)

  easyDesc = composer.newText({
    string = "Slow Bots\n70% Speed",
    x = 0,
    y = 0,
    size = 12,
    color = { 0.5, 1, 0.5 },
    align = "center"
  })
  uiGroup:insert(easyDesc)

  -- Medium button
  btnMedium = composer.newButton({
    image = "images/gui/play/buttonQuickplay.png",
    text = {
      string = "MEDIUM",
      size = 28,
      y = 45,
      x = 0
    },
    width = 160,
    height = 140,
    onRelease = btnMediumRelease,
    x = 0,
    y = 0
  })
  uiGroup:insert(btnMedium)

  mediumDesc = composer.newText({
    string = "Normal Bots\n100% Speed",
    x = 0,
    y = 0,
    size = 12,
    color = { 1, 1, 0.5 },
    align = "center"
  })
  uiGroup:insert(mediumDesc)

  -- Hard button
  btnHard = composer.newButton({
    image = "images/gui/play/buttonFriends.png",
    text = {
      string = "HARD",
      size = 24,
      y = 35,
      x = 0
    },
    width = 130,
    height = 115,
    onRelease = btnHardRelease,
    x = 0,
    y = 0
  })
  uiGroup:insert(btnHard)

  hardDesc = composer.newText({
    string = "Fast Bots\n130% Speed",
    x = 0,
    y = 0,
    size = 12,
    color = { 1, 0.5, 0.5 },
    align = "center"
  })
  uiGroup:insert(hardDesc)

  -- Back button
  btnBack = composer.newButton({
    image = "images/gui/common/buttonHome.png",
    width = 90,
    height = 57,
    onRelease = btnBackRelease,
    x = 0,
    y = 0
  })
  uiGroup:insert(btnBack)

  layoutDifficultySelect = function()
    local screenLeft = display.screenOriginX
    local screenTop = display.screenOriginY
    local screenWidth = display.actualContentWidth
    local screenHeight = display.actualContentHeight
    local screenCenterX = screenLeft + screenWidth * 0.5
    local screenCenterY = screenTop + screenHeight * 0.5

    local contentLeft = 0
    local contentTop = 0
    local contentWidth = UI_BASE_W
    local contentHeight = UI_BASE_H
    local centerX = UI_BASE_W * 0.5

    if backgroundImage then
      backgroundImage.x = screenCenterX
      backgroundImage.y = screenCenterY
      backgroundImage.xScale = 1
      backgroundImage.yScale = 1
      local scale = math.max(screenWidth / backgroundImage.width, screenHeight / backgroundImage.height)
      backgroundImage.xScale = scale
      backgroundImage.yScale = scale
    end
    if headerText then
      headerText.x = centerX
      headerText.y = contentTop + contentHeight * (40 / 320)
    end
    if subText then
      subText.x = centerX
      subText.y = contentTop + contentHeight * (75 / 320)
    end
    if btnEasy then
      btnEasy.x = contentLeft + contentWidth * 0.25
      btnEasy.y = contentTop + contentHeight * 0.5
    end
    if easyDesc then
      easyDesc.x = contentLeft + contentWidth * 0.25
      easyDesc.y = contentTop + contentHeight * 0.5 + contentHeight * (70 / 320)
    end
    if btnMedium then
      btnMedium.x = centerX
      btnMedium.y = contentTop + contentHeight * 0.48
    end
    if mediumDesc then
      mediumDesc.x = centerX
      mediumDesc.y = contentTop + contentHeight * 0.48 + contentHeight * (85 / 320)
    end
    if btnHard then
      btnHard.x = contentLeft + contentWidth * 0.75
      btnHard.y = contentTop + contentHeight * 0.5
    end
    if hardDesc then
      hardDesc.x = contentLeft + contentWidth * 0.75
      hardDesc.y = contentTop + contentHeight * 0.5 + contentHeight * (70 / 320)
    end
    if btnBack then
      btnBack.x = 120
      btnBack.y = 385
    end
  end

  function clean()
    display.remove(btnEasy)
    display.remove(btnMedium)
    display.remove(btnHard)
    display.remove(btnBack)
  end

  if layoutDifficultySelect then
    layoutDifficultySelect()
  end
end

function scene:show(event)
  local phase = event.phase
  if phase == "will" then
    return
  end
  local screenGroup = self.view

  function cleanEnter()
    -- Android back button handling
    if isAndroid then
      local androidLogic = require("lua.modules.androidBackButton")
      androidLogic.removeBackButton()
    end
  end

  -- Android back button
  if isAndroid then
    local androidLogic = require("lua.modules.androidBackButton")
    androidLogic.addBackButton("lua.scenes.playMenu")
  end
  resizeListener = function()
    if updateUiGroup then
      updateUiGroup()
    end
    if layoutDifficultySelect then
      layoutDifficultySelect()
    end
  end
  Runtime:addEventListener("resize", resizeListener)
  resizeListener()
end

function scene:hide(event)
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
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
