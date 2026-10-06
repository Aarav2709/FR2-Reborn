local composer = require("composer")
local seasonal = require("lua.modules.seasonalModule")
local screen = require("lua.modules.screen")
local scene = composer.newScene()
local clean

local DESIGN_W, DESIGN_H = 480, 320
local SIGN_SCALE = 0.92
local ICONS_PER_PAGE = 6
local COLUMNS = 3
local CARD_W, CARD_H = 88, 90
local FIRST_CARD_X, FIRST_CARD_Y = 140, 81
local CARD_SPACING = 100
local PAGE_WIDTH = 480
local BOARD_X, BOARD_Y, BOARD_W, BOARD_H = 240, 133.9, 358, 222

function scene:create(event)
  local screenGroup = self.view
  local buttons = {}
  local lookingAtPage = 1

  if composer.mapHandler and composer.mapHandler.readMapDataToMemory then
    composer.mapHandler.readMapDataToMemory()
  end
  local numberOfMaps = composer.mapHandler.getNumberOfMaps()
  if numberOfMaps < 1 then
    numberOfMaps = 30
  end

  screen.update()
  local box = screen.designBox(DESIGN_W, DESIGN_H)
  local k = box.scale * SIGN_SCALE

  local function newText(textParams)
    textParams.size = textParams.size * k
    local text = composer.newText(textParams)
    text.xScale, text.yScale = 1 / k, 1 / k
    return text
  end

  local backgroundImage = display.newImageRect(screenGroup, seasonal.menuBackground(), 1920, 1080)
  screen.cover(backgroundImage)

  local sign = display.newGroup()
  sign.xScale, sign.yScale = k, k
  sign.x = screen.centerX - DESIGN_W * 0.5 * k
  sign.y = screen.centerY - 146 * k
  screenGroup:insert(sign)
  local post = display.newImageRect(sign, "images/gui/practice/bottom.png", 42, 45)
  post.x, post.y = BOARD_X, 256
  local board = display.newImageRect(sign, "images/gui/practice/window.png", BOARD_W, BOARD_H)
  board.x, board.y = BOARD_X, BOARD_Y
  local roof = display.newImageRect(sign, "images/gui/practice/top.png", 22, 14)
  roof.x, roof.y = BOARD_X, BOARD_Y - BOARD_H * 0.51

  local cardsWindow = display.newContainer(330, 212)
  cardsWindow.x, cardsWindow.y = BOARD_X, BOARD_Y
  sign:insert(cardsWindow)
  local cards = display.newGroup()
  cards.x, cards.y = -BOARD_X, -BOARD_Y
  cardsWindow:insert(cards)

  local function startGameOnId(id)
    if id == 0 then
      id = math.random(1, numberOfMaps)
    end
    composer.data.gameInfo.players = {}
    composer.data.gameInfo.players[1] = {
      username = composer.database.getPlayerInformation().username,
      avatar = composer.database.getAvatarData(),
      playerId = composer.database.getPlayerInformation().playerId,
      customPowerUps = composer.database.getPowerupSkin(),
      backwear = composer.database.getBackwear and composer.database.getBackwear() or 0
    }
    local botAI = require("lua.ai.botPlayer")
    local bots = botAI.createBots()
    for i = 1, #bots do
      composer.data.gameInfo.players[i + 1] = bots[i]
    end
    composer.data.gameInfo.gameType = 0
    composer.data.gameInfo.teamMode = nil
    composer.data.gameInfo.ranked = false
    composer.data.gameInfo.map = id
    composer.gotoScene("lua.scenes.gamePlay")
  end

  local function cardImage(mapId, theme)
    if mapId == 0 then
      return "images/gui/practice/iconRandom.png"
    end
    local path = "images/gui/practice/icon" .. mapId .. ".png"
    if system.pathForFile(path, system.ResourceDirectory) then
      return path
    end
    return "images/gui/practice/default" .. (theme or "forest") .. ".png"
  end

  local function addCard(mapId, slot)
    local mapData = mapId > 0 and composer.data.getMapInfo(mapId) or nil
    local page = math.ceil(slot / ICONS_PER_PAGE)
    local index = (slot - 1) % ICONS_PER_PAGE
    local x = FIRST_CARD_X + (index % COLUMNS) * CARD_SPACING + (page - 1) * PAGE_WIDTH
    local y = FIRST_CARD_Y + math.floor(index / COLUMNS) * CARD_SPACING
    local card = composer.newButton({
      image = cardImage(mapId, mapData and mapData.theme),
      width = CARD_W,
      height = CARD_H,
      x = x,
      y = y,
      onRelease = function()
        startGameOnId(mapId)
      end
    })
    cards:insert(card)
    buttons[#buttons + 1] = card
    local name = (mapData and mapData.name) or composer.localized.get("Random")
    local nameText = newText({ string = name, size = 14 })
    nameText.x, nameText.y = x, y + 28
    local maxWidth = CARD_W - 12
    local width = nameText.width * nameText.xScale
    if width > maxWidth then
      local fit = maxWidth / width
      nameText.xScale, nameText.yScale = nameText.xScale * fit, nameText.yScale * fit
    end
    cards:insert(nameText)
  end

  addCard(0, 1)
  local slot = 2
  for mapId = 1, numberOfMaps do
    if composer.data.getMapInfo(mapId) then
      addCard(mapId, slot)
      slot = slot + 1
    end
  end
  local pages = math.max(1, math.ceil((slot - 1) / ICONS_PER_PAGE))

  local function showPage(page)
    lookingAtPage = (page - 1) % pages + 1
    transition.cancel(cards)
    transition.to(cards, { time = 250, x = -BOARD_X - (lookingAtPage - 1) * PAGE_WIDTH, transition = easing.outQuad })
  end

  local previousButton = composer.newButton({
    image = "images/gui/practice/left.png",
    width = 45,
    height = 45,
    x = 73,
    y = 140,
    onRelease = function()
      showPage(lookingAtPage - 1)
    end
  })
  sign:insert(previousButton)
  buttons[#buttons + 1] = previousButton
  local nextButton = composer.newButton({
    image = "images/gui/practice/right.png",
    width = 45,
    height = 45,
    x = 408,
    y = 140,
    onRelease = function()
      showPage(lookingAtPage + 1)
    end
  })
  sign:insert(nextButton)
  buttons[#buttons + 1] = nextButton
  previousButton.isVisible = pages > 1
  nextButton.isVisible = pages > 1

  local homeButton = composer.newButton({
    image = "images/gui/common/buttonHome.png",
    width = 90,
    height = 57,
    x = screen.safeLeft + 70,
    y = screen.bottom - 26,
    onRelease = function()
      composer.gotoScene("lua.scenes.mainMenu")
    end
  })
  screenGroup:insert(homeButton)
  buttons[#buttons + 1] = homeButton

  function clean()
    transition.cancel(cards)
    for _, button in ipairs(buttons) do
      display.remove(button)
    end
    buttons = {}
  end
end

function scene:show(event)
  if event.phase == "did" then
    composer.removeHidden()
    require("lua.modules.androidBackButton").addBackButton("lua.scenes.mainMenu")
  end
end

function scene:hide(event)
  if event.phase == "will" then
    require("lua.modules.androidBackButton").removeBackButton()
  elseif event.phase == "did" then
    composer.removeScene("lua.scenes.lobbyPractice")
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
