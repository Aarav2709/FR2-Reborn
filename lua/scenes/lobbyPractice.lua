local composer = require("composer")
local layoutGroup = require("lua.modules.layoutGroup")
local scene = composer.newScene()
local clean, cleanEnter
local backgroundImage, buttonStickBottom, window, buttonStickTop
local btnNextZone, btnPrevZone, btnBack, mapIconsGroup, mapIconsContainer
local layoutLobbyPractice, resizeListener
local uiGroup, updateUiGroup
local UI_BASE_W, UI_BASE_H

function scene:create(event)
  local screenGroup = self.view
  UI_BASE_W = display.contentWidth
  UI_BASE_H = display.contentHeight
  uiGroup, updateUiGroup = layoutGroup.new(screenGroup, UI_BASE_W, UI_BASE_H)
  local startedClean = false

  if composer.mapHandler and composer.mapHandler.readMapDataToMemory then
    composer.mapHandler.readMapDataToMemory()
  end

  local boardW = 460
  local boardH = 284
  local boardCenterY = 245
  local centerX = UI_BASE_W * 0.5

  mapIconsContainer = display.newContainer(420, 250)
  mapIconsContainer.x = centerX
  mapIconsContainer.y = boardCenterY

  mapIconsGroup = display.newGroup()
  mapIconsContainer:insert(mapIconsGroup)

  local practiceButtons = {}
  local practiceButtonsText = {}
  local iconsPerPage = 6
  local iconWidth = 72
  local iconHeight = 72
  local lookingAtZone = 1
  local numberOfMaps = composer.mapHandler.getNumberOfMaps()
  if numberOfMaps < 1 then
    numberOfMaps = 30
  end
  local maksZones = math.max(2, math.ceil((numberOfMaps + 1) / iconsPerPage))

  backgroundImage = display.newImageRect("images/gui/common/bgBlur.png", 1920, 1080)
  buttonStickBottom = display.newImageRect("images/gui/practice/bottom.png", 42, 45)
  window = display.newImageRect("images/gui/practice/window.png", boardW, boardH)
  buttonStickTop = display.newImageRect("images/gui/practice/top.png", 22, 14)

  local function startGameOnId(id)
    if id == 0 then
      id = math.random(1, numberOfMaps)
    end
    composer.data.gameInfo.players[1] = {
      username = composer.database.getPlayerInformation().username,
      avatar = composer.database.getAvatarData(),
      playerId = composer.database.getPlayerInformation().playerId
    }

    local botAI = require("lua.ai.botPlayer")
    local difficulty = composer.data.gameInfo.difficulty or 2
    local bots = botAI.createBots(difficulty)

    for i = 1, #bots do
      composer.data.gameInfo.players[i + 1] = bots[i]
    end

    composer.data.gameInfo.gameType = 0
    composer.data.gameInfo.map = id
    composer.gotoScene("lua.scenes.gamePlay")
    composer.removeScene("lua.scenes.lobbyPractice")
  end

  local function addMapIcons()
    local iconPositions = {
      [1] = { x = -130, y = -58 },
      [2] = { x = 0, y = -58 },
      [3] = { x = 130, y = -58 },
      [4] = { x = -130, y = 46 },
      [5] = { x = 0, y = 46 },
      [6] = { x = 130, y = 46 }
    }
    local textPositions = {
      [1] = { x = -130, y = -14 },
      [2] = { x = 0, y = -14 },
      [3] = { x = 130, y = -14 },
      [4] = { x = -130, y = 90 },
      [5] = { x = 0, y = 90 },
      [6] = { x = 130, y = 90 }
    }

    local function createButtonForMap(mapIdx, displaySlotIdx)
      local baseZone = math.ceil(displaySlotIdx / iconsPerPage)
      local basePos = displaySlotIdx % iconsPerPage
      if basePos == 0 then
        basePos = iconsPerPage
      end

      local mapData = composer.data.getMapInfo(mapIdx)
      local mapName = (mapData and mapData.name) or composer.localized.get("Random")
      local mapTheme = (mapData and mapData.theme) or "forest"

      local imagePath = "images/gui/practice/icon" .. mapIdx .. ".png"
      local testImage = display.newImage(imagePath)
      if not testImage then
        if mapIdx == 0 then
          imagePath = "images/gui/practice/iconRandom.png"
        else
          imagePath = "images/gui/practice/default" .. mapTheme .. ".png"
        end
      else
        testImage:removeSelf()
        testImage = nil
      end

      local btn = composer.newButton({
        image = imagePath,
        width = iconWidth,
        height = iconHeight,
        onRelease = function() startGameOnId(mapIdx) end,
        x = 0,
        y = 0
      })
      practiceButtons[#practiceButtons + 1] = btn

      local txt = composer.newText({
        string = mapName,
        size = 12,
        x = -100,
        y = -100
      })
      practiceButtonsText[#practiceButtonsText + 1] = txt

      local iconPos = iconPositions[basePos]
      local textPos = textPositions[basePos]
      if iconPos then
        local padding = (baseZone - 1) * UI_BASE_W
        btn.x = iconPos.x + padding
        btn.y = iconPos.y
        if textPos then
          txt.x = textPos.x + padding
          txt.y = textPos.y
        end
      end
      mapIconsGroup:insert(btn)
      mapIconsGroup:insert(txt)
    end

    createButtonForMap(0, 1)

    local slotCounter = 2
    for i = 1, numberOfMaps do
      local mapData = composer.data.getMapInfo(i)
      if mapData then
        createButtonForMap(i, slotCounter)
        slotCounter = slotCounter + 1
      end
    end
  end

  local function updateArrows()
    if btnPrevZone then
      btnPrevZone.isVisible = true
      btnPrevZone.alpha = 1.0
    end
    if btnNextZone then
      btnNextZone.isVisible = true
      btnNextZone.alpha = 1.0
    end
  end

  local function btnPrevZoneRelease()
    if lookingAtZone > 1 then
      lookingAtZone = lookingAtZone - 1
    else
      lookingAtZone = maksZones
    end
    updateArrows()
    local newXPos = -1 * (lookingAtZone - 1) * UI_BASE_W
    transition.to(mapIconsGroup, { time = 250, x = newXPos, transition = easing.outQuad })
  end

  btnPrevZone = display.newImageRect("images/gui/practice/left.png", 50, 50)
  btnPrevZone.x = centerX - 260
  btnPrevZone.y = boardCenterY
  btnPrevZone.isVisible = true
  btnPrevZone.alpha = 1.0
  btnPrevZone:addEventListener("touch", function(event)
    if event.phase == "began" then
      btnPrevZone.xScale = 0.85
      btnPrevZone.yScale = 0.85
    elseif event.phase == "ended" or event.phase == "cancelled" then
      btnPrevZone.xScale = 1.0
      btnPrevZone.yScale = 1.0
      if event.phase == "ended" then
        btnPrevZoneRelease()
      end
    end
    return true
  end)

  local function btnNextZoneRelease()
    if lookingAtZone < maksZones then
      lookingAtZone = lookingAtZone + 1
    else
      lookingAtZone = 1
    end
    updateArrows()
    local newXPos = -1 * (lookingAtZone - 1) * UI_BASE_W
    transition.to(mapIconsGroup, { time = 250, x = newXPos, transition = easing.outQuad })
  end

  btnNextZone = display.newImageRect("images/gui/practice/right.png", 50, 50)
  btnNextZone.x = centerX + 260
  btnNextZone.y = boardCenterY
  btnNextZone.isVisible = true
  btnNextZone.alpha = 1.0
  btnNextZone:addEventListener("touch", function(event)
    if event.phase == "began" then
      btnNextZone.xScale = 0.85
      btnNextZone.yScale = 0.85
    elseif event.phase == "ended" or event.phase == "cancelled" then
      btnNextZone.xScale = 1.0
      btnNextZone.yScale = 1.0
      if event.phase == "ended" then
        btnNextZoneRelease()
      end
    end
    return true
  end)

  local function btnBackRelease()
    composer.gotoScene("lua.scenes.mainMenu")
    composer.removeScene("lua.scenes.lobbyPractice")
  end

  btnBack = composer.newButton({
    image = "images/gui/common/buttonHome.png",
    width = 90,
    height = 57,
    onRelease = btnBackRelease,
    x = 0,
    y = 0
  })

  layoutLobbyPractice = function()
    local screenLeft = display.screenOriginX
    local screenTop = display.screenOriginY
    local screenWidth = display.actualContentWidth
    local screenHeight = display.actualContentHeight
    local screenCenterX = screenLeft + screenWidth * 0.5
    local screenCenterY = screenTop + screenHeight * 0.5

    local cX = UI_BASE_W * 0.5
    local cY = 245

    if backgroundImage then
      backgroundImage.x = screenCenterX
      backgroundImage.y = screenCenterY
      backgroundImage.xScale = 1
      backgroundImage.yScale = 1
      local scale = math.max(screenWidth / backgroundImage.width, screenHeight / backgroundImage.height)
      backgroundImage.xScale = scale
      backgroundImage.yScale = scale
    end
    if window then
      window.x = cX
      window.y = cY
    end
    if buttonStickBottom then
      buttonStickBottom.x = cX
      buttonStickBottom.y = cY + (boardH * 0.5) + 15
    end
    if buttonStickTop then
      buttonStickTop.x = cX
      buttonStickTop.y = cY - (boardH * 0.5) - 8
    end
    if mapIconsContainer then
      mapIconsContainer.x = cX
      mapIconsContainer.y = cY
    end
    if btnPrevZone then
      btnPrevZone.x = cX - 260
      btnPrevZone.y = cY
      btnPrevZone.isVisible = true
      btnPrevZone.alpha = 1.0
      btnPrevZone:toFront()
    end
    if btnNextZone then
      btnNextZone.x = cX + 260
      btnNextZone.y = cY
      btnNextZone.isVisible = true
      btnNextZone.alpha = 1.0
      btnNextZone:toFront()
    end
    if btnBack then
      btnBack.x = 100
      btnBack.y = 475
    end
  end

  local function updateDisplay()
    screenGroup:insert(1, backgroundImage)
    uiGroup:insert(buttonStickBottom)
    uiGroup:insert(buttonStickTop)
    uiGroup:insert(window)
    uiGroup:insert(mapIconsContainer)
    uiGroup:insert(btnNextZone)
    uiGroup:insert(btnPrevZone)
    uiGroup:insert(btnBack)
    btnNextZone:toFront()
    btnPrevZone:toFront()
  end

  function clean()
    startedClean = true
    if practiceButtons then
      for i = 1, #practiceButtons do
        display.remove(practiceButtons[i])
      end
      practiceButtons = {}
    end
    if practiceButtonsText then
      for i = 1, #practiceButtonsText do
        display.remove(practiceButtonsText[i])
      end
      practiceButtonsText = {}
    end
    display.remove(btnBack)
    display.remove(btnNextZone)
    display.remove(btnPrevZone)
    display.remove(mapIconsContainer)
    display.remove(window)
    display.remove(buttonStickTop)
    display.remove(buttonStickBottom)
    display.remove(backgroundImage)
  end

  updateDisplay()
  addMapIcons()
  updateArrows()
  if layoutLobbyPractice then
    layoutLobbyPractice()
  end
end

function scene:show(event)
  local phase = event.phase
  if phase == "will" then
    if layoutLobbyPractice then
      layoutLobbyPractice()
    end
  elseif phase == "did" then
    composer.removeHidden()
  end
end

function scene:hide(event)
  local phase = event.phase
  if phase == "will" then
    if clean then
      clean()
    end
  end
end

function scene:destroy(event)
  if clean then
    clean()
  end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
