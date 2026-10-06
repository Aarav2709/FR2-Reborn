local composer = require("composer")
local screen = require("lua.modules.screen")
local seasonal = require("lua.modules.seasonalModule")
local quickPlayBots = require("lua.modules.quickPlayBots")
local lan = require("lua.network.lanSession")
local scene = composer.newScene()
local clean, stopLobby

local DESIGN_W, DESIGN_H = 480, 320
local PANEL_W = 132
local SLOT_DX = 76.8
local SLOT_ROWS = { 112, 249.6 }
local STAND_DY, NAME_DY = 32, 57.6
local CARD_W, CARD_H = 88, 90
local AVATAR_SCALE = 0.36
local PLATE_COLOR, NAME_COLOR = { 0, 0, 0, 0.3 }, { 1, 1, 1 }
local OWN_PLATE_COLOR, OWN_NAME_COLOR = { 1, 1, 1, 0.5 }, { 0, 0, 0 }
local DARK = { 0.29, 0.16, 0.06 }
local MAX_LISTED_GAMES = 4
local ADDRESS_KEY = "lanLastAddress"
local REASONS = {
  full = "That game is full",
  racing = "That race has already started",
  version = "That game runs another version of the game",
  unreachable = "Could not reach that game",
  lost = "Lost the connection to the host",
  ["host left"] = "The host closed the game"
}

function scene:create(event)
  local group = self.view
  local params = event.params or {}
  screen.update()
  local box = screen.designBox(DESIGN_W, DESIGN_H)
  local s = box.scale
  local top = box.T
  local buttons, monsters = {}, {}
  local content, gamesGroup, addressField
  local listTimer
  local lastGamesKey
  local notice
  local mapIds = { 0 }
  local refresh

  local function newText(textParams)
    textParams.size = textParams.size * s
    if textParams.width then
      textParams.width = textParams.width * s
    end
    local text = composer.newText(textParams)
    text.xScale, text.yScale = 1 / s, 1 / s
    return text
  end

  local function fitWidth(text, maxWidth)
    text.xScale, text.yScale = 1 / s, 1 / s
    local width = text.width * text.xScale
    if width > maxWidth then
      local fit = maxWidth / width
      text.xScale, text.yScale = text.xScale * fit, text.yScale * fit
    end
  end

  local function newButton(parent, buttonParams)
    if buttonParams.text then
      buttonParams.text.size = buttonParams.text.size * s
    end
    local button = composer.newButton(buttonParams)
    if buttonParams.text then
      local label = button[button.numChildren]
      if label and label ~= button[1] then
        label.xScale, label.yScale = 1 / s, 1 / s
      end
    end
    parent:insert(button)
    buttons[#buttons + 1] = button
    return button
  end

  local background = display.newImageRect(group, seasonal.blurredBackground(), 1920, 1080)
  screen.cover(background)
  local ui = display.newGroup()
  ui.xScale, ui.yScale = s, s
  ui.x, ui.y = box.left, box.top
  group:insert(ui)

  local panelLeft = math.max(box.L, box.SL - 12)
  local panel = display.newImageRect(ui, "images/gui/lobby/bg_vote.png", PANEL_W, DESIGN_H - top)
  panel.anchorX, panel.anchorY = 0, 0
  panel.x, panel.y = box.L, top
  if panelLeft > box.L then
    panel.width = PANEL_W + (panelLeft - box.L)
  end
  local panelCenter = panelLeft + 55
  local title = newText({ string = composer.localized.get("LAN"), size = 30, color = { 1, 1, 1 } })
  title.x, title.y = panelLeft + 52.8, top + 16
  ui:insert(title)
  local areaCenter = (panelLeft + PANEL_W + box.SR) * 0.5 - 8
  local slotXs = { areaCenter - SLOT_DX, areaCenter + SLOT_DX }

  local board = display.newImageRect(ui, "images/gui/lobby/bg_countdown.png", 218, 32)
  board.anchorY = 0
  board.x, board.y = areaCenter, top
  local statusText = newText({ string = "", size = 14, color = { 1, 1, 1 } })
  statusText.x, statusText.y = areaCenter, top + 15
  ui:insert(statusText)
  local function setStatus(text)
    statusText.text = text
    fitWidth(statusText, 205)
  end

  if composer.mapHandler.readMapDataToMemory then
    composer.mapHandler.readMapDataToMemory()
  end
  local numberOfMaps = composer.mapHandler.getNumberOfMaps()
  for id = 1, (numberOfMaps > 0 and numberOfMaps or 30) do
    if composer.data.getMapInfo(id) then
      mapIds[#mapIds + 1] = id
    end
  end

  local function mapImage(mapId)
    if not mapId or mapId == 0 then
      return "images/gui/practice/iconRandom.png"
    end
    local mapData = composer.data.getMapInfo(mapId)
    local path = "images/gui/practice/icon" .. mapId .. ".png"
    if system.pathForFile(path, system.ResourceDirectory) then
      return path
    end
    return "images/gui/practice/default" .. ((mapData and mapData.theme) or "forest") .. ".png"
  end

  local function cleanContent()
    for _, button in ipairs(buttons) do
      display.remove(button)
    end
    buttons = {}
    for _, monster in ipairs(monsters) do
      monster.clean()
    end
    monsters = {}
    if addressField then
      addressField.remove()
      addressField = nil
    end
    display.remove(content)
    content = display.newGroup()
    ui:insert(content)
    gamesGroup = nil
    lastGamesKey = nil
  end

  local function leaveButton(onRelease)
    newButton(content, {
      image = "images/gui/common/buttonHome.png",
      width = 90,
      height = 57,
      x = panelCenter,
      y = 292,
      onRelease = onRelease
    })
  end

  local function showNotice(text)
    notice = text
  end

  local function fillSlot(index, racer, isMe)
    local x = slotXs[(index - 1) % 2 + 1]
    local y = SLOT_ROWS[math.floor((index - 1) / 2) + 1]
    local slot = display.newGroup()
    content:insert(slot)
    local plate = racer and quickPlayBots.plateFor(racer.avatar) or 6
    local stand = display.newImageRect(slot, "images/gui/lobby/" .. plate .. ".png", 81, 28)
    stand.x, stand.y = x, y + STAND_DY
    local namePlate = display.newRect(slot, x, y + NAME_DY, 130, 18)
    namePlate:setFillColor(unpack(isMe and OWN_PLATE_COLOR or PLATE_COLOR))
    if not racer then
      local open = newText({ string = composer.localized.get("Open"), size = 15, color = { 1, 1, 1 } })
      open.x, open.y = x, y + NAME_DY
      slot:insert(open)
      return
    end
    local monsterLoader = require("spine-corona.monsterLoader")
    local monster = monsterLoader.new(racer.avatar or { 101, 0, 0, 0, 0, 0, 0 }, false, nil, racer.backwear)
    if monster and monster.getGroup then
      monsters[#monsters + 1] = monster
      local monsterGroup = monster.getGroup()
      monsterGroup.xScale, monsterGroup.yScale = AVATAR_SCALE, AVATAR_SCALE
      monsterGroup.x, monsterGroup.y = x, y + STAND_DY - 6
      slot:insert(monsterGroup)
    end
    local name = newText({ string = racer.name or "", size = 15, color = isMe and OWN_NAME_COLOR or NAME_COLOR })
    name.x, name.y = x, y + NAME_DY
    fitWidth(name, 122)
    slot:insert(name)
  end

  local function buildSession(lobby)
    leaveButton(function()
      lan.leave()
      refresh()
    end)
    local card = display.newImageRect(content, mapImage(lobby.map), CARD_W, CARD_H)
    card.x, card.y = panelCenter, 102
    local mapName = lobby.map ~= 0 and composer.data.getMapName(lobby.map) or composer.localized.get("Random")
    local mapText = newText({ string = mapName or "", size = 13, color = DARK })
    mapText.x, mapText.y = panelCenter, 130
    fitWidth(mapText, CARD_W - 12)
    content:insert(mapText)
    if lobby.isHost then
      local function step(direction)
        local position = 1
        for i, id in ipairs(mapIds) do
          if id == lobby.map then
            position = i
          end
        end
        position = (position - 1 + direction) % #mapIds + 1
        lan.setMap(mapIds[position])
      end
      newButton(content, { image = "images/gui/practice/left.png", width = 30, height = 30, x = panelCenter - 26, y = 166,
        onRelease = function() step(-1) end })
      newButton(content, { image = "images/gui/practice/right.png", width = 30, height = 30, x = panelCenter + 26, y = 166,
        onRelease = function() step(1) end })
    else
      local pickedBy = newText({ string = composer.localized.get("The host picks the map"), size = 9, width = 100,
        align = "center", color = { 1, 1, 1 } })
      pickedBy.x, pickedBy.y = panelCenter, 166
      content:insert(pickedBy)
    end

    for i = 1, lan.MAX_PLAYERS do
      local racer = lobby.players[i]
      fillSlot(i, racer, racer and racer.id == lobby.selfId)
    end

    if lobby.isHost then
      local enough = #lobby.players >= 2
      local start = newButton(content, {
        image = "images/gui/common/buttonTextA.png",
        text = { string = composer.localized.get("Start race"), size = 15, x = 0, y = 0 },
        width = 110,
        height = 35,
        x = areaCenter,
        y = 196,
        onRelease = function()
          if not lan.startRace() then
            setStatus(composer.localized.get("Waiting for players to join"))
          end
        end
      })
      start.alpha = enough and 1 or 0.55
      local address = lan.localAddress()
      if #lobby.players < 2 then
        setStatus(composer.localized.get("Waiting for players to join"))
      else
        setStatus(#lobby.players .. "/" .. lan.MAX_PLAYERS .. " " .. composer.localized.get("players, ready to race!"))
      end
      local addressText = newText({ string = composer.localized.get("Others can join") .. ": "
        .. (address or composer.localized.get("this device")), size = 10, color = { 1, 1, 1 } })
      addressText.x, addressText.y = areaCenter, top + 42
      fitWidth(addressText, 230)
      content:insert(addressText)
    else
      setStatus(lobby.joined and (composer.localized.get("Waiting for") .. " " .. tostring(lobby.hostName or "the host"))
        or composer.localized.get("Joining..."))
    end
  end

  local function joinAddress(address)
    address = tostring(address or ""):gsub("^%s+", ""):gsub("%s+$", "")
    if address == "" then
      setStatus(composer.localized.get("Type the host's address"))
      return
    end
    composer.database.setValue(ADDRESS_KEY, address)
    local ok = lan.join(address)
    if not ok then
      setStatus(composer.localized.get(REASONS.unreachable))
      return
    end
    refresh()
  end

  local function updateGames()
    if not gamesGroup then
      return
    end
    local games = lan.games()
    local keyParts = {}
    for i = 1, math.min(#games, MAX_LISTED_GAMES) do
      keyParts[#keyParts + 1] = games[i].address .. "/" .. tostring(games[i].players) .. "/" .. tostring(games[i].name)
    end
    local key = table.concat(keyParts, "|")
    if key == lastGamesKey then
      return
    end
    lastGamesKey = key
    for i = gamesGroup.numChildren, 1, -1 do
      local child = gamesGroup[i]
      for j = #buttons, 1, -1 do
        if buttons[j] == child then
          table.remove(buttons, j)
        end
      end
      display.remove(child)
    end
    if #games == 0 then
      local searching = newText({ string = composer.localized.get("Looking for games on your network..."), size = 12,
        width = 230, align = "center", color = { 1, 1, 1 } })
      searching.x, searching.y = areaCenter, 112
      gamesGroup:insert(searching)
      return
    end
    for i = 1, math.min(#games, MAX_LISTED_GAMES) do
      local game = games[i]
      local y = 72 + (i - 1) * 32
      local full = (tonumber(game.players) or 0) >= (tonumber(game.max) or lan.MAX_PLAYERS)
      local name = newText({ string = tostring(game.name) .. "  " .. tostring(game.players) .. "/" .. tostring(game.max or lan.MAX_PLAYERS),
        size = 14, color = { 1, 1, 1 }, ax = 0 })
      name.x, name.y = areaCenter - 110, y
      fitWidth(name, 150)
      gamesGroup:insert(name)
      local join = newButton(gamesGroup, {
        image = "images/gui/ranking/button.png",
        width = 54,
        height = 26,
        x = areaCenter + 92,
        y = y,
        text = { string = composer.localized.get("Join"), size = 11 },
        onRelease = function()
          lan.join(game.address, tonumber(game.port))
          refresh()
        end
      })
      join.alpha = full and 0.55 or 1
    end
  end

  local function buildBrowse()
    leaveButton(function()
      composer.gotoScene(params.back or "lua.scenes.playMenu")
    end)
    local card = display.newImageRect(content, "images/gui/practice/iconRandom.png", CARD_W, CARD_H)
    card.x, card.y = panelCenter, 102
    local hint = newText({ string = composer.localized.get("Race friends on the same Wi-Fi or network"), size = 10,
      width = 104, align = "center", color = { 1, 1, 1 } })
    hint.x, hint.y = panelCenter, 178
    content:insert(hint)
    setStatus(notice or composer.localized.get("Friends nearby"))
    notice = nil

    local listBoard = display.newImageRect(content, "images/gui/common/generalPopup.png", 270, 150)
    listBoard.x, listBoard.y = areaCenter, 118
    gamesGroup = display.newGroup()
    content:insert(gamesGroup)
    lan.startBrowsing()
    updateGames()

    newButton(content, {
      image = "images/gui/common/buttonTextA.png",
      text = { string = composer.localized.get("Host a game"), size = 14, x = 0, y = 0 },
      width = 120,
      height = 38,
      x = areaCenter - 66,
      y = 222,
      onRelease = function()
        local ok, err = lan.host()
        if not ok then
          setStatus(composer.localized.get("Could not host") .. ": " .. tostring(err))
          return
        end
        refresh()
      end
    })
    -- joining by address, for networks that don't pass the game's broadcasts (the
    -- last address used is remembered).
    local savedAddress = composer.database.getValue(ADDRESS_KEY) or ""
    newButton(content, {
      image = "images/gui/common/buttonTextA.png",
      text = { string = composer.localized.get("Join address"), size = 14, x = 0, y = 0 },
      width = 120,
      height = 38,
      x = areaCenter + 66,
      y = 222,
      onRelease = function()
        local typed = addressField and addressField.getText()
        if not typed or typed == "" then
          typed = composer.database.getValue(ADDRESS_KEY)
        end
        joinAddress(typed)
      end
    })
    addressField = require("lua.modules.textInput").new({
      parent = content,
      x = areaCenter + 66,
      y = 256,
      width = 120,
      height = 22,
      size = 13,
      text = savedAddress,
      placeholder = "192.168.1.20",
      maxLength = 15,
      allowed = "[%d%.]",
      inputType = "decimal",
      onSubmit = function(typed)
        joinAddress(typed)
      end
    })
    local address = lan.localAddress()
    local own = newText({ string = composer.localized.get("Your address") .. ": " .. (address or "-"), size = 10,
      color = { 1, 1, 1 } })
    own.x, own.y = areaCenter - 66, 254
    fitWidth(own, 125)
    content:insert(own)
  end

  function refresh()
    cleanContent()
    local lobby = lan.getLobby()
    if lobby then
      lan.stopBrowsing()
      buildSession(lobby)
    else
      buildBrowse()
    end
  end

  lan.setListener(function(lanEvent)
    if lanEvent.type == "lobby" then
      refresh()
    elseif lanEvent.type == "closed" then
      showNotice(composer.localized.get(REASONS[lanEvent.reason] or REASONS.lost))
      refresh()
    end
  end)
  refresh()
  listTimer = timer.performWithDelay(1000, updateGames, 0)

  function stopLobby()
    if listTimer then
      timer.cancel(listTimer)
      listTimer = nil
    end
    lan.setListener(nil)
    lan.stopBrowsing()
    if addressField then
      addressField.remove()
      addressField = nil
    end
  end

  function clean()
    stopLobby()
    for _, button in ipairs(buttons) do
      display.remove(button)
    end
    for _, monster in ipairs(monsters) do
      monster.clean()
    end
  end
end

function scene:show(event)
  if event.phase == "did" then
    composer.removeHidden()
    require("lua.modules.androidBackButton").addBackButton("lua.scenes.playMenu")
  end
end

function scene:hide(event)
  if event.phase == "will" then
    if stopLobby then
      stopLobby()
    end
    if not lan.isRacing() then
      lan.leave()
    end
    require("lua.modules.androidBackButton").removeBackButton()
  elseif event.phase == "did" then
    composer.removeScene("lua.scenes.lobbyLan")
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
