local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter

function scene:create(event)
  local screenGroup = self.view
  local startedClean = false
  local mapIconsGroup = display.newGroup()
  local practiseButtons = {}
  local practiseButtonsText = {}
  local lookingAtZone = 1
  local numberOfMaps = composer.mapHandler.getNumberOfMaps()
  local maksZones = math.ceil(numberOfMaps / 4)
  local btnNextZone, btnPrevZone
  local backgroundImage = display.newImageRect("images/gui/common/bgMain.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  local buttonStickBottom = display.newImageRect("images/gui/practice/bottom.png", 42, 45)
  buttonStickBottom.x = display.contentWidth * 0.5
  buttonStickBottom.y = display.contentHeight * 0.8
  local window = display.newImageRect("images/gui/practice/window.png", 284, 222)
  window.x = buttonStickBottom.x
  window.y = buttonStickBottom.y - window.height * 0.55
  local buttonStickTop = display.newImageRect("images/gui/practice/top.png", 22, 14)
  buttonStickTop.x = window.x
  buttonStickTop.y = window.y - window.height * 0.51
  
  local function startGameOnId(id)
    -- Oyuncu bilgileri
    composer.data.gameInfo.players[1] = {
      username = composer.database.getPlayerInformation().username,
      avatar = composer.database.getAvatarData(),
      playerId = composer.database.getPlayerInformation().playerId
    }
    
    -- Bot oyuncuları ekle (Offline Mod)
    local botAI = require("lua.ai.botPlayer")
    local difficulty = composer.data.gameInfo.difficulty or 2 -- Varsayılan: Orta
    local bots = botAI.createBots(difficulty)
    
    -- Botları oyuncu listesine ekle
    for i = 1, #bots do
      composer.data.gameInfo.players[i + 1] = bots[i]
    end
    
    composer.data.gameInfo.gameType = 0
    composer.data.gameInfo.map = id
    composer.gotoScene("lua.scenes.gamePlay")
  end
  
  local function addMapIcons()
    local baseX1, baseY1 = 280, 180
    local baseX2, baseY2 = 400, 180
    local baseX3, baseY3 = 280, 290
    local baseX4, baseY4 = 400, 290
    for i = 1, numberOfMaps do
      local baseZone = math.ceil(i / 4)
      local basePos = i % 4
      local padding = (baseZone - 1) * 480
      local mapData = composer.data.getMapInfo(i)
      if not mapData then
        print("WARNING: NO DATA FOR MAP NR: ", i)
        return
      end
      
      local function startGame()
        startGameOnId(i)
      end
      
      local imagePath = "images/gui/practice/icon" .. i .. ".png"
      local testImage = display.newImage(imagePath)
      if not testImage then
        local mapTheme = mapData.theme
        imagePath = "images/gui/practice/default" .. mapTheme .. ".png"
      else
        testImage:removeSelf()
        testImage = nil
      end
      practiseButtons[i] = composer.newButton({
        image = imagePath,
        width = 88,
        height = 90,
        onRelease = startGame,
        x = -100,
        y = -100
      })
      if basePos == 1 then
        practiseButtons[i].x = baseX1 + padding
        practiseButtons[i].y = baseY1
      elseif basePos == 2 then
        practiseButtons[i].x = baseX2 + padding
        practiseButtons[i].y = baseY2
      elseif basePos == 3 then
        practiseButtons[i].x = baseX3 + padding
        practiseButtons[i].y = baseY3
      elseif basePos == 0 then
        practiseButtons[i].x = baseX4 + padding
        practiseButtons[i].y = baseY4
      end
      if mapData.name then
        practiseButtonsText[i] = composer.newText({
          string = mapData.name,
          size = 14,
          x = practiseButtons[i].x - 100,
          y = practiseButtons[i].y - 72
        })
      end
      mapIconsGroup:insert(practiseButtons[i])
      mapIconsGroup:insert(practiseButtonsText[i])
    end
  end
  
  local function btnPrevZoneRelease()
    lookingAtZone = lookingAtZone - 1
    if lookingAtZone == 1 then
      btnPrevZone.isVisible = false
    end
    if lookingAtZone < maksZones then
      btnNextZone.isVisible = true
    end
    local newXPos = -1 * (lookingAtZone - 1) * 480
    transition.to(mapIconsGroup, {time = 200, x = newXPos})
  end
  
  btnPrevZone = composer.newButton({
    image = "images/gui/practice/left.png",
    width = 45,
    height = 45,
    onRelease = btnPrevZoneRelease,
    x = 116,
    y = 140
  })
  
  local function btnNextZoneRelease()
    lookingAtZone = lookingAtZone + 1
    if 1 < lookingAtZone then
      btnPrevZone.isVisible = true
    end
    if lookingAtZone >= maksZones then
      btnNextZone.isVisible = false
    end
    local newXPos = -1 * (lookingAtZone - 1) * 480
    transition.to(mapIconsGroup, {time = 200, x = newXPos})
  end
  
  btnNextZone = composer.newButton({
    image = "images/gui/practice/right.png",
    width = 45,
    height = 45,
    onRelease = btnNextZoneRelease,
    x = 364,
    y = 140
  })
  
  local function btnBackRelease()
    composer.gotoScene("lua.scenes.mainMenu")
    composer.removeScene("lua.scenes.lobbyPractise")
  end
  
  local btnBack = composer.newButton({
    image = "images/gui/common/buttonHome.png",
    width = 90,
    height = 57,
    onRelease = btnBackRelease,
    x = 50,
    y = 292
  })
  
  local function updateDisplay()
    screenGroup:insert(backgroundImage)
    screenGroup:insert(buttonStickBottom)
    screenGroup:insert(buttonStickTop)
    screenGroup:insert(window)
    screenGroup:insert(mapIconsGroup)
    screenGroup:insert(btnNextZone)
    screenGroup:insert(btnPrevZone)
    screenGroup:insert(btnBack)
  end
  
  function clean()
    startedClean = true
    display.remove(btnBack)
    display.remove(btnNextZone)
    display.remove(btnPrevZone)
    for i = 1, #practiseButtons do
      display.remove(practiseButtons[i])
    end
  end
  
  updateDisplay()
  addMapIcons()
  if lookingAtZone == 1 then
    btnPrevZone.isVisible = false
  end
  if maksZones == lookingAtZone then
    btnNextZone.isVisible = false
  end
end

function scene:show(event)
  local phase = event.phase
  local screenGroup = self.view
  if phase == "will" then
    return
  end
  local androidLogic = require("lua.modules.androidBackButton")
  
  function cleanEnter()
    androidLogic.removeBackButton()
  end
  
  androidLogic.addBackButton("lua.scenes.playMenu", "lua.scenes.lobbyPractise")
end

function scene:hide(event)
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
