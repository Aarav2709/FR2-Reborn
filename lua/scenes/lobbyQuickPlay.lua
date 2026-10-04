local composer = require("composer")
local screen = require("lua.modules.screen")
local seasonal = require("lua.modules.seasonalModule")
local league = require("lua.modules.offlineLeague")
local quickPlayBots = require("lua.modules.quickPlayBots")
local scene = composer.newScene()
local clean, stopLobby

-- Quick Play, offline. Like Fun Run 2's lobby (480x320 design units): the vote panel
-- on the left edge with two maps, "Game starting in" on top and the four racers on
-- their stands. Three bots join, everybody gets one vote (the bots vote too), and the
-- race starts on the map with the most votes when the countdown ends. Before that the
-- player can try a power-up set for one race for a gem.
local DESIGN_W, DESIGN_H = 480, 320
local PANEL_W = 132
local COUNTDOWN_SECONDS = 5
local SLOT_DX = 76.8
local SLOT_ROWS = { 112, 249.6 }
local STAND_DY, NAME_DY = 32, 57.6
local CARD_W, CARD_H = 88, 90
local CARD_ROWS = { 102, 206 }
local OFFER_GEMS = 1
local OFFER_Y = 200
local OFFER_W, OFFER_H = 46, 35
local SET_COUNT = 7
local SEARCHING_COLOR = { 1, 1, 1 }
-- Name strips as in Fun Run 2: dark under the others, light (with dark text) under you.
local PLATE_COLOR, NAME_COLOR = { 0, 0, 0, 0.3 }, { 1, 1, 1 }
local OWN_PLATE_COLOR, OWN_NAME_COLOR = { 1, 1, 1, 0.5 }, { 0, 0, 0 }
local AVATAR_SCALE = 0.36

function scene:create(event)
  local group = self.view
  screen.update()
  local box = screen.designBox(DESIGN_W, DESIGN_H)
  local s = box.scale
  local top = box.T
  local timers = {}
  local buttons = {}
  local monsters = {}
  local slots = {}
  local startedClean = false
  local countdownLeft = COUNTDOWN_SECONDS
  local raceStarting = false
  local playerVoted = false
  local votes = { 0, 0 }
  local chosenSet
  local playerInfo = composer.database.getPlayerInformation() or {}

  local function later(delay, listener, iterations)
    local handle = timer.performWithDelay(delay, function(event)
      if not startedClean then
        listener(event)
      end
    end, iterations or 1)
    timers[#timers + 1] = handle
    return handle
  end

  local function newText(textParams)
    textParams.size = textParams.size * s
    if textParams.width then
      textParams.width = textParams.width * s
    end
    local text = composer.newText(textParams)
    text.xScale, text.yScale = 1 / s, 1 / s
    return text
  end

  -- Back to its normal size, then shrunk to `maxWidth` design units if needed
  -- (measured in the parent's units, so it works before or after insertion).
  local function fitWidth(text, maxWidth)
    text.xScale, text.yScale = 1 / s, 1 / s
    local width = text.width * text.xScale
    if width > maxWidth then
      local fit = maxWidth / width
      text.xScale, text.yScale = text.xScale * fit, text.yScale * fit
    end
  end

  local background = display.newImageRect(group, seasonal.blurredBackground(), 1920, 1080)
  screen.cover(background)
  local ui = display.newGroup()
  ui.xScale, ui.yScale = s, s
  ui.x, ui.y = box.left, box.top
  group:insert(ui)
  local standsGroup = display.newGroup()
  ui:insert(standsGroup)

  -- The vote panel hugs the left edge of the screen; the racers fill the space to
  -- its right.
  local panelLeft = math.max(box.L, box.SL - 12)
  local panel = display.newImageRect(ui, "images/gui/lobby/bg_vote.png", PANEL_W, DESIGN_H - top)
  panel.anchorX, panel.anchorY = 0, 0
  panel.x, panel.y = box.L, top
  if panelLeft > box.L then
    panel.width = PANEL_W + (panelLeft - box.L)
  end
  local panelCenter = panelLeft + 55
  local voteTitle = newText({ string = composer.localized.get("Vote"), size = 30, color = { 1, 1, 1 } })
  voteTitle.x, voteTitle.y = panelLeft + 52.8, top + 16
  ui:insert(voteTitle)
  local areaCenter = (panelLeft + PANEL_W + box.SR) * 0.5 - 8
  local slotXs = { areaCenter - SLOT_DX, areaCenter + SLOT_DX }

  local countdownBoard = display.newImageRect(ui, "images/gui/lobby/bg_countdown.png", 218, 32)
  countdownBoard.anchorY = 0
  countdownBoard.x, countdownBoard.y = areaCenter, top
  local countdownText = newText({ string = composer.localized.get("SearchingForGame"), size = 17, color = { 1, 1, 1 } })
  countdownText.x, countdownText.y = areaCenter, top + 15
  fitWidth(countdownText, 200)
  ui:insert(countdownText)

  -- Gems and coins in the top right corner.
  local currencyBoard = display.newImageRect(ui, "images/gui/market/currentCoins.png", 70, 81)
  currencyBoard.anchorX, currencyBoard.anchorY = 0, 0
  currencyBoard.x, currencyBoard.y = box.SR - 80, top
  local gemText = newText({ string = tostring(composer.database.getGems()), size = 14, color = { 1, 1, 1 }, ax = 0 })
  gemText.x, gemText.y = currencyBoard.x + 24, top + 41
  ui:insert(gemText)
  local moneyText = newText({ string = tostring(composer.database.getMoney()), size = 14, color = { 1, 1, 1 }, ax = 0 })
  moneyText.x, moneyText.y = currencyBoard.x + 24, top + 69
  ui:insert(moneyText)

  -- Two maps to vote for.
  if composer.mapHandler.readMapDataToMemory then
    composer.mapHandler.readMapDataToMemory()
  end
  local mapIds = {}
  local numberOfMaps = composer.mapHandler.getNumberOfMaps()
  if numberOfMaps < 1 then
    numberOfMaps = 30
  end
  local candidates = {}
  for id = 1, numberOfMaps do
    if composer.data.getMapInfo(id) then
      candidates[#candidates + 1] = id
    end
  end
  for _ = 1, 2 do
    if #candidates > 0 then
      mapIds[#mapIds + 1] = table.remove(candidates, math.random(#candidates))
    else
      mapIds[#mapIds + 1] = #mapIds + 1
    end
  end

  local cards, voteTexts = {}, {}
  local function updateVotes()
    for i = 1, 2 do
      voteTexts[i].text = tostring(votes[i])
    end
  end

  local function vote(index)
    votes[index] = votes[index] + 1
    updateVotes()
    local card = cards[index]
    transition.cancel(card)
    card.xScale, card.yScale = 1.08, 1.08
    transition.to(card, { time = 250, xScale = 1, yScale = 1, transition = easing.outBack })
  end

  for i = 1, 2 do
    local mapData = composer.data.getMapInfo(mapIds[i])
    local imagePath = "images/gui/practice/icon" .. mapIds[i] .. ".png"
    if not system.pathForFile(imagePath, system.ResourceDirectory) then
      imagePath = "images/gui/practice/default" .. ((mapData and mapData.theme) or "forest") .. ".png"
    end
    local card = display.newGroup()
    card.x, card.y = panelCenter, CARD_ROWS[i]
    ui:insert(card)
    cards[i] = card
    local cardButton = composer.newButton({
      image = imagePath,
      width = CARD_W,
      height = CARD_H,
      x = 0,
      y = 0,
      onRelease = function()
        if not playerVoted and not raceStarting then
          playerVoted = true
          vote(i)
          composer.audio.play("button_press")
        end
      end
    })
    card:insert(cardButton)
    buttons[#buttons + 1] = cardButton
    local name = newText({ string = (mapData and mapData.name) or "", size = 13 })
    name.x, name.y = 0, 28
    fitWidth(name, CARD_W - 12)
    card:insert(name)
    voteTexts[i] = newText({ string = "0", size = 16 })
    voteTexts[i].x, voteTexts[i].y = 0, -CARD_H * 0.5 + 9
    card:insert(voteTexts[i])
  end

  local homeButton = composer.newButton({
    image = "images/gui/common/buttonHome.png",
    width = 90,
    height = 57,
    x = panelCenter,
    y = 292,
    onRelease = function()
      if not raceStarting then
        composer.gotoScene("lua.scenes.playMenu")
      end
    end
  })
  ui:insert(homeButton)
  buttons[#buttons + 1] = homeButton

  -- A racer on a stand (or an empty stand while searching).
  local function fillSlot(index, racer)
    local slot = slots[index]
    local x = slotXs[(index - 1) % 2 + 1]
    local y = SLOT_ROWS[math.floor((index - 1) / 2) + 1]
    if slot then
      display.remove(slot.group)
    end
    slot = { racer = racer, group = display.newGroup() }
    slots[index] = slot
    standsGroup:insert(slot.group)
    local plate = racer and quickPlayBots.plateFor(racer.avatar) or 6
    local stand = display.newImageRect(slot.group, "images/gui/lobby/" .. plate .. ".png", 81, 28)
    stand.x, stand.y = x, y + STAND_DY
    local isMe = racer and racer == slots.me
    local namePlate = display.newRect(slot.group, x, y + NAME_DY, 130, 18)
    namePlate:setFillColor(unpack(isMe and OWN_PLATE_COLOR or PLATE_COLOR))
    if not racer then
      local searching = newText({ string = composer.localized.get("Searching"), size = 15, color = SEARCHING_COLOR })
      searching.x, searching.y = x, y + NAME_DY
      slot.group:insert(searching)
      return
    end
    local monsterLoader = require("spine-corona.monsterLoader")
    local monster = monsterLoader.new(racer.avatar, false, nil, racer.backwear)
    if monster and monster.getGroup then
      monsters[#monsters + 1] = monster
      local monsterGroup = monster.getGroup()
      monsterGroup.xScale, monsterGroup.yScale = AVATAR_SCALE, AVATAR_SCALE
      monsterGroup.x, monsterGroup.y = x, y + STAND_DY - 6
      slot.group:insert(monsterGroup)
    end
    local name = newText({ string = racer.username or "", size = 15, color = isMe and OWN_NAME_COLOR or NAME_COLOR })
    name.x, name.y = x, y + NAME_DY
    fitWidth(name, 122)
    slot.group:insert(name)
    -- The league shield sits apart from the name strip, in the gap left of it.
    local shield = display.newImageRect(slot.group, "images/gui/ranking/league/tierS_" .. (racer.league or league.WOOD) .. ".png", 17, 17)
    shield.x, shield.y = x - SLOT_DX, y + NAME_DY
    slot.group.alpha = 0
    transition.to(slot.group, { time = 250, alpha = 1 })
  end

  local me = {
    username = playerInfo.username,
    avatar = composer.database.getAvatarData(),
    playerId = playerInfo.playerId,
    customPowerUps = composer.database.getPowerupSkin(),
    backwear = composer.database.getBackwear and composer.database.getBackwear() or 0,
    league = league.getTier()
  }
  slots.me = me
  fillSlot(1, me)
  for i = 2, 4 do
    fillSlot(i, nil)
  end

  -- Try a power-up set for one race (1 gem): just the button; once bought it shows
  -- the set's own sign.
  local offer = display.newGroup()
  offer.x, offer.y = areaCenter, OFFER_Y
  ui:insert(offer)
  local offerButton
  -- Behind the button the sets' power-ups (blades, rockets...) cycle until one is bought.
  local preview
  local previewSet = math.random(1, SET_COUNT)
  local function showPreview(setId)
    display.remove(preview)
    preview = display.newImageRect(offer, "images/gui/lobby/preview/skinSet" .. setId .. ".png", OFFER_W * 102 / 61, OFFER_H * 58 / 47)
    if preview then
      preview:toBack()
    end
  end
  showPreview(previewSet)
  local cycleTimer = later(400, function()
    if not chosenSet then
      -- A random set each time, never the same one twice in a row.
      local nextSet = math.random(1, SET_COUNT - 1)
      if nextSet >= previewSet then
        nextSet = nextSet + 1
      end
      previewSet = nextSet
      showPreview(previewSet)
    end
  end, 0)
  -- The price, on the button's blue strip next to its gem.
  local offerPrice = newText({ string = tostring(OFFER_GEMS), size = 10, color = { 1, 1, 1 }, ax = 1 })

  local function buySet()
    if chosenSet or raceStarting then
      return
    end
    if composer.database.getGems() < OFFER_GEMS then
      transition.cancel(gemText)
      gemText:setFillColor(1, 0.3, 0.3)
      later(600, function()
        gemText:setFillColor(1, 1, 1)
      end)
      return
    end
    composer.database.decreaseGems(OFFER_GEMS)
    gemText.text = tostring(composer.database.getGems())
    -- "- 1" rises from the gem count to show what the set cost.
    local cost = newText({ string = "- " .. OFFER_GEMS, size = 14, color = { 1, 0.35, 0.35 }, ax = 1 })
    cost.x, cost.y = gemText.x - 4, gemText.y
    ui:insert(cost)
    transition.to(cost, { time = 1200, y = gemText.y - 18, alpha = 0, transition = easing.outQuad,
      onComplete = function() display.remove(cost) end })
    chosenSet = quickPlayBots.randomPowerupSetId()
    me.customPowerUps = quickPlayBots.powerupSet(chosenSet)
    timer.cancel(cycleTimer)
    showPreview(chosenSet)
    display.remove(offerButton)
    display.remove(offerPrice)
    -- A puff of smoke, and the set's own sign in place of the button.
    display.newImageRect(offer, "images/gui/lobby/preview/buttonSkin" .. chosenSet .. ".png", OFFER_W, OFFER_H)
    local poof = composer.data.animations.poff and display.newSprite(offer, composer.powerUpEffectImageSheet, composer.data.animations.poff)
    if poof then
      poof.xScale, poof.yScale = 0.65, 0.65
      poof:setSequence("end")
      poof:play()
    end
    composer.audio.play("buy_item")
  end

  offerButton = composer.newButton({
    image = "images/gui/lobby/preview/buttonDefault.png",
    width = OFFER_W,
    height = OFFER_H,
    x = 0,
    y = 0,
    onRelease = buySet
  })
  offer:insert(offerButton)
  buttons[#buttons + 1] = offerButton
  offerPrice.x, offerPrice.y = OFFER_W * 4 / 61, OFFER_H * 15 / 47
  offer:insert(offerPrice)

  -- The race: everyone in a random start slot, on the map with the most votes.
  local function startRace()
    raceStarting = true
    local winner = votes[1] > votes[2] and 1 or (votes[2] > votes[1] and 2 or math.random(1, 2))
    transition.to(cards[winner], { time = 300, xScale = 1.15, yScale = 1.15, transition = easing.outBack })
    transition.to(cards[3 - winner], { time = 300, alpha = 0.4 })
    later(700, function()
      local racers = {}
      for i = 1, 4 do
        racers[i] = slots[i].racer
      end
      for i = #racers, 2, -1 do
        local j = math.random(1, i)
        racers[i], racers[j] = racers[j], racers[i]
      end
      composer.data.gameInfo.players = racers
      composer.data.gameInfo.gameType = 0
      composer.data.gameInfo.ranked = true
      composer.data.gameInfo.map = mapIds[winner]
      league.startRankedRace()
      composer.gotoScene("lua.scenes.gamePlay")
    end)
  end

  local function tickCountdown()
    countdownLeft = countdownLeft - 1
    if countdownLeft <= 0 then
      countdownText.text = composer.localized.get("GameStarting") .. "0"
      fitWidth(countdownText, 200)
      startRace()
      return
    end
    countdownText.text = composer.localized.get("GameStarting") .. countdownLeft
    fitWidth(countdownText, 200)
    composer.audio.play("countdown")
  end

  local function startCountdown()
    countdownText.text = composer.localized.get("GameStarting") .. countdownLeft
    fitWidth(countdownText, 200)
    later(1000, tickCountdown, COUNTDOWN_SECONDS)
  end

  -- Bots join one by one, then vote at random moments before the start.
  local bots = quickPlayBots.createBots()
  local joinTime = 0
  for i = 1, 3 do
    joinTime = joinTime + math.random(500, 1300)
    later(joinTime, function()
      fillSlot(i + 1, bots[i])
      composer.audio.play("button_press")
      if i == 3 then
        startCountdown()
      end
    end)
    later(joinTime + math.random(800, COUNTDOWN_SECONDS * 1000 - 400), function()
      if not raceStarting then
        vote(math.random(1, 2))
      end
    end)
  end

  -- Nothing more happens once the lobby is left (home, back, or the race starting).
  function stopLobby()
    startedClean = true
    for _, handle in ipairs(timers) do
      timer.cancel(handle)
    end
  end

  function clean()
    stopLobby()
    for _, card in ipairs(cards) do
      transition.cancel(card)
    end
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
    require("lua.modules.androidBackButton").removeBackButton()
  elseif event.phase == "did" then
    composer.removeScene("lua.scenes.lobbyQuickPlay")
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
