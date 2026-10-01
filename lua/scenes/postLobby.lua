local composer = require("composer")
local screen = require("lua.modules.screen")
local dropDownModule = require("lua.modules.dropdownHelper")
local coinRewardModule = require("lua.modules.coinReward")
local offlineLeague = require("lua.modules.offlineLeague")
local scene = composer.newScene()
local cointickloopChannel = 25
local clean, cleanEnter, addChatBubble

-- The results screen, laid out like Fun Run 2's (original 480x320 design units): the
-- racers on the podium painted into the background, the times on the board in the top
-- right, the coins, league rating and gems on the plank at the bottom.
local DESIGN_W, DESIGN_H = 480, 320
local THEME_BACKGROUNDS = {
  forest = "images/gui/postgame/postBG_forest.png",
  space = "images/gui/postgame/postBG_space.png",
  town = "images/gui/postgame/postBG_town.png",
  tropical = "images/gui/postgame/postBG_tropical.png",
  winter = "images/gui/postgame/postBG_winter.png"
}
-- Where the racers stand (their feet), in the 480x320 background art: the 1, 2 and 3
-- blocks of the podium and the grass next to it.
local PODIUM_FEET = { { 130, 168 }, { 46, 205 }, { 220, 212 }, { 310, 252 } }
-- The league shield on the podium next to each racer (its top right corner).
local PODIUM_BADGES = { { 170, 175 }, { 86, 210 }, { 256, 217 }, { 350, 234 } }
-- The phrase list sits a little above the chat button; the bubbles are a bit smaller
-- than the art.
local CHAT_LIST_Y = 166
-- The phrases sit evenly inside the list's frame (centred a little above the art's
-- middle, as its lower edge carries the post).
local CHAT_ROWS_DY, CHAT_ROW_SPACING = -7, 29
local CHAT_BUBBLE_SCALE = 0.8
local CHAT_TEXT = { "Well played", "Add me.. if you dare!", "Yaay!", "#&!?@*!", "So unlucky!" }
-- The plank at the bottom: the coins icon sits in its first light patch and the
-- league shield in the second, each with its total just left of it and the gain
-- above the total.
local PLANK_X, PLANK_Y, PLANK_W, PLANK_H = 220, 294, 170, 51
local PLANK_LEFT = PLANK_X - PLANK_W * 0.5
-- (The light patches, measured on the art: centres at 40.5% and 86.1% across, 65% down.)
local STATS_Y = PLANK_Y - PLANK_H * 0.5 + PLANK_H * 0.65
local STATS_GAIN_Y = STATS_Y - 14
local STATS_SLOTS = {
  { iconX = PLANK_LEFT + PLANK_W * 0.405, left = PLANK_LEFT + 10 },
  { iconX = PLANK_LEFT + PLANK_W * 0.861, left = PLANK_LEFT + PLANK_W * 0.465 + 4 },
}
-- Gap between a patch's icon and the numbers left of it.
local STATS_TEXT_GAP = PLANK_W * 0.06 + 4
-- Times board: rows sized to fill it.
local ROW_TEXT_SIZE, ROW_SPACING, ROW_TOP = 17, 21, 35

function scene:create(event)
  local screenGroup = self.view
  local gameInfo = composer.data.gameInfo or {}
  composer.data.gameInfo = gameInfo
  gameInfo.players = gameInfo.players or {}
  if gameInfo.map == nil then
    gameInfo.map = 1
  end
  local isOnlineGame = gameInfo.gameType ~= nil and gameInfo.gameType ~= 0
  local monsterLoader = require("spine-corona.monsterLoader")
  local monsters = {}
  local timers = {}
  local buttons = {}
  local friends = composer.database.getFriends() or {}
  local otherPlayersId = {}
  local addFriendButtons = {}
  local chatButtons = {}
  local startedClean = false
  local coinEffect

  screen.update()
  local box = screen.designBox(DESIGN_W, DESIGN_H)
  local s = box.scale
  local T, L, R = box.T, box.L, box.R

  local function newText(textParams)
    textParams.size = textParams.size * s
    local text = composer.newText(textParams)
    text.xScale, text.yScale = 1 / s, 1 / s
    return text
  end

  local function sharpenLabel(button)
    local label = button[button.numChildren]
    if label and label.size and label ~= button[1] then
      label.size = label.size * s
      label.xScale, label.yScale = 1 / s, 1 / s
    end
  end

  -- Measured in the parent's units, so it works before or after the text is inserted.
  local function fitWidth(text, maxWidth)
    local width = text.width * math.abs(text.xScale)
    if width > maxWidth then
      local fit = maxWidth / width
      text.xScale, text.yScale = text.xScale * fit, text.yScale * fit
    end
  end

  local function later(delay, listener, iterations)
    local handle = timer.performWithDelay(delay, listener, iterations or 1)
    timers[#timers + 1] = handle
    return handle
  end

  -- Background: stretched to the screen's shape like the original, but only between
  -- 4:3 and 16:9; beyond that it covers the screen (and gets cropped).
  local backgroundPath = THEME_BACKGROUNDS.forest
  local mapId = tonumber(gameInfo.map)
  if mapId and mapId < 1000 then
    local mapData = composer.data.getMapInfo(mapId)
    if mapData and mapData.theme and THEME_BACKGROUNDS[mapData.theme] then
      backgroundPath = THEME_BACKGROUNDS[mapData.theme]
    end
  end
  local W, H = screen.width, screen.height
  local bgAspect = math.min(16 / 9, math.max(4 / 3, W / H))
  local bgWidth, bgHeight = W, W / bgAspect
  if bgHeight < H then
    bgWidth, bgHeight = H * bgAspect, H
  end
  local bgLeft, bgTop = screen.centerX - bgWidth * 0.5, screen.centerY - bgHeight * 0.5
  local background = display.newImageRect(screenGroup, backgroundPath, bgWidth, bgHeight)
  background.x, background.y = screen.centerX, screen.centerY
  -- A point of the 480x320 background art on the screen, and the art's scale.
  local function onBackground(x, y)
    return bgLeft + x / DESIGN_W * bgWidth, bgTop + y / DESIGN_H * bgHeight
  end
  local podiumScale = bgHeight / DESIGN_H

  -- Racers, their league shields, coin bursts and chat bubbles live on the background.
  local podiumGroup = display.newGroup()
  screenGroup:insert(podiumGroup)

  -- The UI on the design box.
  local ui = display.newGroup()
  ui.xScale, ui.yScale = s, s
  ui.x, ui.y = box.left, box.top
  screenGroup:insert(ui)
  local effectGroup = display.newGroup()
  screenGroup:insert(effectGroup)
  local chatBubbleGroup = display.newGroup()
  screenGroup:insert(chatBubbleGroup)

  local function designToScreen(x, y)
    return box.left + x * s, box.top + y * s
  end

  -- The board with the map name and the times.
  local board = display.newImageRect(ui, "images/gui/postgame/windowTimes.png", 182, 131)
  board.x, board.y = R - 96, T + 64
  local mapNameString = ""
  if composer.onboarding.isActive == true then
    mapNameString = composer.onboarding.getMapName()
  else
    if mapId then
      mapNameString = composer.data.getMapName(mapId) or ""
    end
    composer.gamesPlayed = composer.gamesPlayed + 1
  end
  local mapName = newText({ string = mapNameString, size = 22, color = { 1, 1, 1 } })
  mapName.x, mapName.y = board.x, board.y - 44
  fitWidth(mapName, 150)
  ui:insert(mapName)
  local rowsGroup = display.newGroup()
  ui:insert(rowsGroup)

  -- The plank with coins, league rating and gems (Quick Play and the tutorial; a
  -- practice race has no rewards).
  local isPractice = gameInfo.stats and gameInfo.stats.practice
  local plank = display.newImageRect(ui, "images/gui/postgame/windowCurrency.png", PLANK_W, PLANK_H)
  plank.x, plank.y = PLANK_X, PLANK_Y
  plank.isVisible = not isPractice
  local statsGroup = display.newGroup()
  statsGroup.isVisible = not isPractice
  ui:insert(statsGroup)

  -- Buttons: back to the menu in the top left corner, race again in the bottom right.
  local function returnToMenu()
    composer.tcpClient.stopTCPClient()
    composer.gotoScene("lua.scenes.mainMenu")
    composer.removeScene("lua.scenes.postLobby")
  end

  local function stopOnboardingComplete(alertEvent)
    if alertEvent.action == "clicked" and alertEvent.index == 1 and not startedClean then
      composer.onboarding.deactivate()
      composer.gotoScene("lua.scenes.mainMenu")
      composer.removeScene("lua.scenes.postLobby")
    end
  end

  local function stopOnboarding()
    native.showAlert(composer.localized.get("Quit"), composer.localized.get("QuitOnboarding"), {
      composer.localized.get("Yes"),
      composer.localized.get("No")
    }, stopOnboardingComplete)
  end

  local function raceAgain()
    if composer.onboarding.isActive == true then
      composer.onboarding.stepDone()
      return
    elseif gameInfo.ranked or gameInfo.gameType == 1 then
      composer.gotoScene("lua.scenes.lobbyQuickPlay")
    elseif gameInfo.gameType == 3 or gameInfo.gameType == 4 then
      composer.gotoScene("lua.scenes.lobbyCustomPlay")
    else
      composer.gotoScene("lua.scenes.lobbyPractice")
    end
    composer.removeScene("lua.scenes.postLobby")
  end

  local closeButton = composer.newButton({
    image = "images/gui/common/buttonClosePopup.png",
    width = 43,
    height = 38,
    x = L + 22,
    y = T + 22,
    onRelease = composer.onboarding.isActive == true and stopOnboarding or returnToMenu
  })
  ui:insert(closeButton)
  buttons[#buttons + 1] = closeButton
  local replayButton = composer.newButton({
    image = "images/gui/postgame/buttonReplay.png",
    width = 90,
    height = 52,
    x = R - 50,
    y = 294,
    onRelease = raceAgain
  })
  ui:insert(replayButton)
  buttons[#buttons + 1] = replayButton

  -- Offline the bots chat too: what fits their place (CHAT_TEXT: 1 well played,
  -- 2 add me, 3 yaay, 4 #&!?@*!, 5 so unlucky), one bubble per racer at a time.
  local BOT_PHRASES = { { 3, 1, 2 }, { 1, 2, 5 }, { 1, 4, 5 }, { 4, 5, 1 } }
  local chatBusyUntil = {}
  -- While the player has the phrase list open the bots wait.
  local chatListOpen = false
  local function botSay(player)
    local now = system.getTimer()
    if (chatBusyUntil[player.playerId] or 0) > now then
      return false
    end
    if chatListOpen then
      later(1500, function()
        botSay(player)
      end)
      return false
    end
    chatBusyUntil[player.playerId] = now + 4200
    local phrases = BOT_PHRASES[player.pos] or BOT_PHRASES[4]
    addChatBubble(player.playerId, phrases[math.random(#phrases)])
    return true
  end
  local function otherRacers()
    local myId = composer.database.getPlayerInformation().playerId
    local others = {}
    for _, player in ipairs(gameInfo.players or {}) do
      if player.playerId ~= myId and player.pos then
        others[#others + 1] = player
      end
    end
    return others
  end
  -- Now and then one of them answers the player.
  local lastBotAnswer = 0
  local function botAnswer()
    if system.getTimer() - lastBotAnswer < 3000 or math.random() > 0.6 then
      return
    end
    lastBotAnswer = system.getTimer()
    local others = otherRacers()
    if #others > 0 then
      local bot = others[math.random(#others)]
      later(math.random(900, 2200), function()
        botSay(bot)
      end)
    end
  end
  -- In some races a few of them say something by themselves.
  local function botsChatOnTheirOwn()
    if math.random() > 0.55 then
      return
    end
    for _, bot in ipairs(otherRacers()) do
      if math.random() < 0.4 then
        later(math.random(1500, 9000), function()
          botSay(bot)
        end)
      end
    end
  end

  -- Chat phrases to the other racers (offline the bots sometimes answer); friend
  -- requests online only.
  local chatButton, friendsButton, chatList, chatToggle, friendsToggle
  do
    chatToggle = display.newImageRect(ui, "images/gui/postgame/buttonToggle.png", 55, 52)
    chatToggle.x, chatToggle.y = L + 30, 294
    chatToggle.isVisible = false
    friendsToggle = display.newImageRect(ui, "images/gui/postgame/buttonToggle.png", 55, 52)
    friendsToggle.x, friendsToggle.y = L + 90, 294
    friendsToggle.isVisible = false
    chatList = display.newImageRect(ui, "images/gui/postgame/bubbleList.png", 175, 179)
    chatList.x, chatList.y = L + 91, CHAT_LIST_Y
    chatList.isVisible = false

    local function toggleChat()
      local show = not chatList.isVisible
      chatListOpen = show
      chatToggle.isVisible = show
      chatList.isVisible = show
      for _, button in ipairs(chatButtons) do
        button.isVisible = show
      end
    end

    for i = 1, #CHAT_TEXT do
      local chatButtonPhrase = composer.newButton({
        image = i % 2 == 0 and "images/gui/postgame/bubbleListRow1.png" or "images/gui/postgame/bubbleListRow2.png",
        text = { string = composer.localized.get(CHAT_TEXT[i]), x = 0, y = -3, size = 12 },
        width = 156,
        height = 30,
        x = L + 91,
        y = CHAT_LIST_Y + CHAT_ROWS_DY + (i - 3) * CHAT_ROW_SPACING,
        onRelease = function()
          if isOnlineGame then
            composer.comm.postGameChat(i, otherPlayersId)
          end
          local myId = composer.database.getPlayerInformation().playerId
          if (chatBusyUntil[myId] or 0) <= system.getTimer() then
            chatBusyUntil[myId] = system.getTimer() + 4200
            addChatBubble(myId, i)
          end
          toggleChat()
          if not isOnlineGame then
            botAnswer()
          end
        end
      })
      chatButtonPhrase.isVisible = false
      ui:insert(chatButtonPhrase)
      chatButtons[i] = chatButtonPhrase
      buttons[#buttons + 1] = chatButtonPhrase
    end

    chatButton = composer.newButton({
      image = "images/gui/postgame/buttonChat.png",
      width = 55,
      height = 52,
      x = chatToggle.x,
      y = chatToggle.y,
      onRelease = toggleChat
    })
    ui:insert(chatButton)
    buttons[#buttons + 1] = chatButton

  end
  if isOnlineGame then
    friendsButton = composer.newButton({
      image = "images/gui/postgame/buttonFriends.png",
      width = 55,
      height = 52,
      x = friendsToggle.x,
      y = friendsToggle.y,
      onRelease = function()
        local show = not friendsToggle.isVisible
        friendsToggle.isVisible = show
        for _, button in pairs(addFriendButtons) do
          if not button.inviteSent then
            button.isVisible = show
          end
        end
      end
    })
    friendsButton.isVisible = false
    ui:insert(friendsButton)
    buttons[#buttons + 1] = friendsButton
  end

  function addChatBubble(playerId, chatId)
    local racer
    for _, player in ipairs(gameInfo.players) do
      if player.playerId == playerId then
        racer = player
      end
    end
    if not racer or not racer.pos then
      return
    end
    -- Bubbles pointing down for the racers up high, sideways for the lower ones.
    -- (tipX, tipY: where the tail ends, from the bubble's centre at full size.)
    local bubbleImage, offsetX, offsetY, textOffset, tipX, tipY = "images/gui/postgame/bubbleTalk.png", 30, -76, -8, 12, 23.5
    if racer.pos == 2 then
      bubbleImage, offsetX, offsetY, textOffset, tipX, tipY = "images/gui/postgame/bubbleTalk3.png", 42, 10, 6, 0, -23.5
    elseif racer.pos == 4 then
      bubbleImage, offsetX, offsetY, textOffset, tipX, tipY = "images/gui/postgame/bubbleTalk2.png", 38, 10, 6, 0, -23.5
    end
    -- Smaller than the art, shrunk around the tail's tip so it still points at the racer.
    local k = podiumScale * CHAT_BUBBLE_SCALE
    offsetX = offsetX + tipX * (1 - CHAT_BUBBLE_SCALE)
    offsetY = offsetY + tipY * (1 - CHAT_BUBBLE_SCALE)
    textOffset = textOffset * CHAT_BUBBLE_SCALE
    local bubble = display.newImageRect(chatBubbleGroup, bubbleImage, 159 * k, 47 * k)
    bubble.x = racer.x + offsetX * podiumScale
    bubble.y = racer.y + offsetY * podiumScale
    local text = composer.newText({ string = composer.localized.get(CHAT_TEXT[chatId] or ""), size = 14 * k })
    text.x, text.y = bubble.x, bubble.y + textOffset * podiumScale
    chatBubbleGroup:insert(text)
    later(4000, function()
      display.remove(bubble)
      display.remove(text)
    end)
  end

  -- Coins and league rating count up on the plank.

  local function countUp(slotIndex, iconPath, total, delta, options)
    options = options or {}
    local slot = STATS_SLOTS[slotIndex]
    local icon = display.newImageRect(statsGroup, iconPath, options.iconSize or 15, options.iconSize or 15)
    icon.x, icon.y = slot.iconX, STATS_Y
    local totalText = newText({ string = tostring(total - delta), size = 13, color = { 1, 1, 1 }, ax = 1 })
    totalText.x, totalText.y = slot.iconX - STATS_TEXT_GAP, STATS_Y
    statsGroup:insert(totalText)
    local gainText = newText({ string = "", size = 10, color = delta < 0 and { 1, 0.45, 0.4 } or { 0.6, 1, 0.45 }, ax = 1 })
    gainText.x, gainText.y = totalText.x, STATS_GAIN_Y
    statsGroup:insert(gainText)
    local function showGain(value)
      gainText.text = (value < 0 and "- " or "+ ") .. math.abs(value)
      gainText.xScale, gainText.yScale = 1 / s, 1 / s
      fitWidth(gainText, gainText.x - slot.left)
    end
    local function showTotal(value)
      totalText.text = tostring(value)
      totalText.xScale, totalText.yScale = 1 / s, 1 / s
      fitWidth(totalText, totalText.x - slot.left)
    end
    showTotal(total - delta)
    if delta == 0 then
      later(options.delay or 650, function()
        showGain(0)
      end)
      return icon
    end
    local ticks = math.min(math.abs(delta), 30)
    local tick = 0
    later(options.delay or 650, function()
      if options.sound then
        composer.audio.play(options.sound, { channel = cointickloopChannel, loops = -1, fadein = 500 })
      end
      later(options.tickTime or 50, function()
        tick = tick + 1
        local shown = math.floor(delta * tick / ticks + 0.5)
        showGain(shown)
        showTotal(total - delta + shown)
        if tick == ticks then
          composer.audio.stop(cointickloopChannel)
          if options.endSound then
            composer.audio.play(options.endSound, { channel = cointickloopChannel })
          end
        end
      end, ticks)
    end)
    return icon
  end

  local statsShown = false
  local function showStats(podiumPlace)
    if statsShown or isPractice then
      return
    end
    statsShown = true
    local stats = gameInfo.stats or {}
    local coinsWon = stats.g or 0
    local money = stats.h or composer.database.getMoney()
    if stats.h then
      composer.database.setMoney(money)
    end
    local coinIcon = countUp(1, "images/gui/postgame/iconCoin.png", money, coinsWon,
      { sound = "coins", endSound = "coins_end", delay = 650, iconSize = 17 })
    if coinsWon > 0 and podiumPlace then
      local feet = PODIUM_FEET[podiumPlace] or PODIUM_FEET[#PODIUM_FEET]
      local startX, startY = onBackground(feet[1], feet[2] - 40)
      local targetX, targetY = designToScreen(coinIcon.x, coinIcon.y)
      local burst = coinsWon
      if stats.fa then
        burst = math.floor(burst / 2)
      end
      coinEffect = coinRewardModule.createCoinReward(money, burst, { x = startX, y = startY }, true, targetX + 7 * s, targetY - 7 * s)
      coinEffect.animateCoins()
      effectGroup:insert(coinEffect)
    end
    local tier = stats.league or offlineLeague.getTier()
    local rating = stats.a or offlineLeague.getRating()
    local ratingDelta = stats.r or 0
    countUp(2, "images/gui/ranking/league/tierS_" .. tier .. ".png", rating, ratingDelta,
      { sound = "rating", endSound = "rating_end", delay = 2000 + coinsWon * 10, tickTime = 40, iconSize = 18 })
  end

  -- A racer on the podium, with their league shield.
  local function placeRacer(indexInList, place)
    local player = gameInfo.players[indexInList]
    if not player then
      return
    end
    local feet = PODIUM_FEET[place] or PODIUM_FEET[#PODIUM_FEET]
    local networkFormat = isOnlineGame
    local monster = monsterLoader.new(player.avatar, networkFormat)
    monsters[#monsters + 1] = monster
    local monsterGroup = monster.getGroup()
    monsterGroup.xScale, monsterGroup.yScale = 0.5 * podiumScale, 0.5 * podiumScale
    monsterGroup.x, monsterGroup.y = onBackground(feet[1], feet[2])
    podiumGroup:insert(monsterGroup)
    local centerX, centerY = onBackground(feet[1], feet[2] - 40)
    player.pos = place
    player.x, player.y = centerX, centerY

    local isSelf = player.playerId == composer.database.getPlayerInformation().playerId
    local tier = player.league
    if isSelf then
      tier = (gameInfo.stats and gameInfo.stats.league) or offlineLeague.getTier()
    elseif tier == nil then
      tier = offlineLeague.tierForRacer(player.username)
    end
    local badgeCorner = PODIUM_BADGES[place] or PODIUM_BADGES[#PODIUM_BADGES]
    local badge = display.newImageRect(podiumGroup, "images/gui/ranking/league/tierS_" .. tier .. ".png", 26 * podiumScale, 26 * podiumScale)
    badge.anchorX, badge.anchorY = 1, 0
    badge.x, badge.y = onBackground(badgeCorner[1], badgeCorner[2])
    badge.isVisible = not isPractice and place < 4

    if isSelf then
      if place == 1 and networkFormat then
        composer.database.updateWinsForAvatar()
      end
      showStats(place)
    else
      otherPlayersId[#otherPlayersId + 1] = player.playerId
      local isFriend = false
      for _, friend in ipairs(friends) do
        if friend.p == player.playerId then
          isFriend = true
        end
      end
      if isOnlineGame and not isFriend then
        local addFriend = composer.newButton({
          image = "images/gui/postgame/buttonFriendsAdd.png",
          width = 30 * podiumScale,
          height = 30 * podiumScale,
          x = centerX - 15 * podiumScale,
          y = centerY + 30 * podiumScale,
          onRelease = function()
            addFriendButtons[place].isVisible = false
            addFriendButtons[place].inviteSent = true
            composer.comm.addFriend(player.playerId, false)
          end
        })
        addFriend.isVisible = false
        podiumGroup:insert(addFriend)
        addFriendButtons[place] = addFriend
        buttons[#buttons + 1] = addFriend
        if friendsButton then
          friendsButton.isVisible = true
        end
      end
    end
  end

  -- Times with two decimals: "31.50".
  local function formatSeconds(seconds)
    return string.format("%.2f", seconds)
  end

  -- The times on the board, and the racers on the podium in finishing order.
  local function showRanking(rankingTable)
    if not rankingTable or #rankingTable == 0 then
      local errorText = newText({ string = composer.localized.get("ErrorNoPlayers"), size = 18, color = { 1, 1, 1 } })
      errorText.x, errorText.y = 240, T + 110
      ui:insert(errorText)
      return
    end
    table.sort(rankingTable, function(a, b)
      return a.goalTime < b.goalTime
    end)
    -- Equal times still get distinct places.
    for i = 1, #rankingTable - 1 do
      if rankingTable[i].goalTime >= rankingTable[i + 1].goalTime then
        rankingTable[i + 1].goalTime = rankingTable[i].goalTime + 10
      end
    end
    local fastest = math.round(rankingTable[1].goalTime) / 1000
    for i, entry in ipairs(rankingTable) do
      local seconds = math.round(entry.goalTime) / 1000
      local timeString
      if i == 1 then
        timeString = formatSeconds(seconds) .. " s"
      elseif seconds > 999999 then
        timeString = composer.localized.get("PlayerDisconnected")
      else
        timeString = "+ " .. formatSeconds(seconds - fastest) .. " s"
      end
      local rowY = T + ROW_TOP + (i - 1) * ROW_SPACING
      local nameText = newText({ string = i .. ". " .. tostring(entry.username), size = ROW_TEXT_SIZE, color = { 1, 1, 1 }, ax = 0, ay = 0 })
      nameText.x, nameText.y = board.x - 81.6, rowY
      rowsGroup:insert(nameText)
      local timeText = newText({ string = timeString, size = ROW_TEXT_SIZE, color = { 1, 1, 1 }, ax = 1, ay = 0 })
      timeText.x, timeText.y = board.x + 83.5, rowY
      rowsGroup:insert(timeText)
      fitWidth(nameText, 165 - timeText.width * timeText.xScale - 6)
      -- A new personal best (Quick Play): the player's row flashes "New Best Time".
      local racer = gameInfo.players[entry.index or i]
      local myId = (composer.database.getPlayerInformation() or {}).playerId
      if gameInfo.stats and gameInfo.stats.newBestTime and racer and racer.playerId == myId then
        local nameString = nameText.text
        local bestString = i .. ". " .. composer.localized.get("New Best Time")
        local maxWidth = 165 - timeText.width * timeText.xScale - 6
        local showingBest = false
        later(900, function()
          showingBest = not showingBest
          nameText.text = showingBest and bestString or nameString
          nameText.xScale, nameText.yScale = 1 / s, 1 / s
          fitWidth(nameText, maxWidth)
          nameText:setFillColor(1, showingBest and 0.85 or 1, showingBest and 0.2 or 1)
        end, 0)
      end
      placeRacer(entry.index or i, i)
    end
  end

  function clean()
    startedClean = true
    for _, handle in ipairs(timers) do
      timer.cancel(handle)
    end
    composer.audio.stop(cointickloopChannel)
    for _, button in ipairs(buttons) do
      display.remove(button)
    end
    for _, monster in ipairs(monsters) do
      monster.clean()
    end
    if coinEffect and coinEffect.clean then
      coinEffect.clean()
    end
  end

  if composer.config.showPostLobby then
    gameInfo.quickPlayerRankingTable = {
      { username = "gunnar", goalTime = 10000, index = 1 },
      { username = "per", goalTime = 13000, index = 2 },
      { username = "arne", goalTime = 40000, index = 3 },
      { username = "ole", goalTime = 20000, index = 4 }
    }
    gameInfo.stats = { a = 15, h = 26, g = 30, r = 5 }
  end

  if #gameInfo.players == 0 then
    local avatar = composer.database.getAvatarData()
    for i = 1, 4 do
      gameInfo.players[i] = { username = "Player " .. i, avatar = avatar, playerId = i }
    end
  end
  showRanking(gameInfo.quickPlayerRankingTable)
  -- In case the player wasn't among the racers, still count up the rewards.
  showStats(nil)

  if not isOnlineGame and composer.onboarding.isActive ~= true then
    botsChatOnTheirOwn()
  end

  if composer.onboarding.isActive == true then
    composer.onboarding.addGuiReference("postlobby_exit", closeButton)
    composer.onboarding.addGuiReference("postlobby_times", board)
    composer.onboarding.addGuiReference("postlobby_times", rowsGroup)
    composer.onboarding.addGuiReference("postlobby_mapName", mapName)
    if friendsButton then
      composer.onboarding.addGuiReference("postlobby_addFriends", friendsButton)
    end
    if chatButton then
      composer.onboarding.addGuiReference("postlobby_chat", chatButton)
    end
    composer.onboarding.updateDisplayGroups(nil, screenGroup)
  end

  scene.setPostLobbyButtonsVisible = function(isVisible)
    if chatButton then
      chatButton.isVisible = isVisible
    end
    if friendsButton then
      friendsButton.isVisible = isVisible and next(addFriendButtons) ~= nil
    end
  end
  scene.setPostLobbyPlaceholdersVisible = function()
  end
end

function scene:show(event)
  if event.phase == "will" then
    return
  end
  local startedClean = false
  local tcpFormat = require("lua.network.tcpMessageFormat")
  local androidLogic = require("lua.modules.androidBackButton")
  androidLogic.addBackButton("lua.scenes.mainMenu", "lua.scenes.postLobby")

  local function receiveUpdateFromNetworkGamePlay(data)
    if startedClean then
      return
    end
    local messageType = composer.gameConfig.getMessageTypeForID(data[1])
    if messageType == "UNLOCKED_AWARD" then
      dropDownModule.showAchivement({ 0, data[2], data[3], data[4] })
    end
  end

  composer.tcpClient.setReceiveFunction(receiveUpdateFromNetworkGamePlay)
  composer.comm.setCallback(function(data)
    if not startedClean and data and data.m == tcpFormat.postGameChat() and addChatBubble then
      addChatBubble(data.a, data.b)
    end
  end)

  -- A league promotion is announced once the rewards have counted up (if the player
  -- leaves sooner, the main menu announces it).
  local promotionTimer
  if composer.league then
    promotionTimer = timer.performWithDelay(3200, function()
      promotionTimer = nil
      local promotion = composer.league
      if not startedClean and promotion and not composer.getSceneName("overlay") then
        composer.league = nil
        composer.showOverlay("lua.overlays.leaguePromotion", { isModal = true, params = promotion })
      end
    end)
  end

  local botTimer = timer.performWithDelay(2000, function()
    if isSimulator and composer.config.bot then
      composer.gotoScene("lua.scenes.mainMenu")
      composer.removeScene("lua.scenes.postLobby")
    end
  end)

  function cleanEnter()
    startedClean = true
    androidLogic.removeBackButton()
    timer.cancel(botTimer)
    if promotionTimer then
      timer.cancel(promotionTimer)
      promotionTimer = nil
    end
    local gameType = composer.data.gameInfo.gameType
    if gameType == 1 or gameType == 4 then
      composer.tcpClient.stopTCPClient()
    end
  end
end

function scene:hide(event)
  if event.phase == "will" then
    if cleanEnter then
      cleanEnter()
      cleanEnter = nil
    end
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
