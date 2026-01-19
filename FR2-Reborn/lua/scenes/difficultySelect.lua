-- Zorluk Seçim Ekranı
-- Offline Pratik Mod için bot zorluğu seçimi

local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter

function scene:create(event)
  local screenGroup = self.view
  
  -- Arka plan
  local backgroundImage = display.newImageRect("images/gui/common/bgMain.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  screenGroup:insert(backgroundImage)
  
  -- Başlık
  local headerText = composer.newText({
    string = "ZORLUK SEÇ",
    x = display.contentWidth * 0.5,
    y = 40,
    size = 32,
    color = {1, 1, 1}
  })
  screenGroup:insert(headerText)
  
  -- Alt başlık
  local subText = composer.newText({
    string = "Bot rakiplere karşı yarış!",
    x = display.contentWidth * 0.5,
    y = 75,
    size = 16,
    color = {0.8, 0.8, 0.8}
  })
  screenGroup:insert(subText)
  
  -- Zorluk butonları için fonksiyonlar
  local function btnEasyRelease(event)
    composer.data.gameInfo.difficulty = 1 -- Kolay
    composer.data.gameInfo.botSpeed = 0.7 -- %70 hız
    composer.gotoScene("lua.scenes.lobbyPractise")
  end
  
  local function btnMediumRelease(event)
    composer.data.gameInfo.difficulty = 2 -- Orta
    composer.data.gameInfo.botSpeed = 1.0 -- %100 hız
    composer.gotoScene("lua.scenes.lobbyPractise")
  end
  
  local function btnHardRelease(event)
    composer.data.gameInfo.difficulty = 3 -- Zor
    composer.data.gameInfo.botSpeed = 1.3 -- %130 hız
    composer.gotoScene("lua.scenes.lobbyPractise")
  end
  
  local function btnBackRelease(event)
    composer.gotoScene("lua.scenes.playMenu")
  end
  
  -- KOLAY butonu
  local btnEasy = composer.newButton({
    image = "images/gui/play/buttonPractice.png",
    text = {
      string = "KOLAY",
      size = 24,
      y = 35,
      x = 0
    },
    width = 130,
    height = 115,
    onRelease = btnEasyRelease,
    x = display.contentWidth * 0.25,
    y = display.contentHeight * 0.5
  })
  screenGroup:insert(btnEasy)
  
  local easyDesc = composer.newText({
    string = "Yavaş Botlar\n%70 Hız",
    x = display.contentWidth * 0.25,
    y = display.contentHeight * 0.5 + 70,
    size = 12,
    color = {0.5, 1, 0.5},
    align = "center"
  })
  screenGroup:insert(easyDesc)
  
  -- ORTA butonu
  local btnMedium = composer.newButton({
    image = "images/gui/play/buttonQuickplay.png",
    text = {
      string = "ORTA",
      size = 28,
      y = 45,
      x = 0
    },
    width = 160,
    height = 140,
    onRelease = btnMediumRelease,
    x = display.contentWidth * 0.5,
    y = display.contentHeight * 0.48
  })
  screenGroup:insert(btnMedium)
  
  local mediumDesc = composer.newText({
    string = "Normal Botlar\n%100 Hız",
    x = display.contentWidth * 0.5,
    y = display.contentHeight * 0.48 + 85,
    size = 12,
    color = {1, 1, 0.5},
    align = "center"
  })
  screenGroup:insert(mediumDesc)
  
  -- ZOR butonu
  local btnHard = composer.newButton({
    image = "images/gui/play/buttonFriends.png",
    text = {
      string = "ZOR",
      size = 24,
      y = 35,
      x = 0
    },
    width = 130,
    height = 115,
    onRelease = btnHardRelease,
    x = display.contentWidth * 0.75,
    y = display.contentHeight * 0.5
  })
  screenGroup:insert(btnHard)
  
  local hardDesc = composer.newText({
    string = "Hızlı Botlar\n%130 Hız",
    x = display.contentWidth * 0.75,
    y = display.contentHeight * 0.5 + 70,
    size = 12,
    color = {1, 0.5, 0.5},
    align = "center"
  })
  screenGroup:insert(hardDesc)
  
  -- Geri butonu
  local btnBack = composer.newButton({
    image = "images/gui/common/buttonHome.png",
    width = 90,
    height = 57,
    onRelease = btnBackRelease,
    x = 50,
    y = 292
  })
  screenGroup:insert(btnBack)
  
  function clean()
    display.remove(btnEasy)
    display.remove(btnMedium)
    display.remove(btnHard)
    display.remove(btnBack)
  end
end

function scene:show(event)
  local phase = event.phase
  if phase == "will" then
    return
  end
  local screenGroup = self.view
  
  function cleanEnter()
    -- Android back button desteği
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
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
