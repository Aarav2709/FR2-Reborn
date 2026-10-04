local composer = require("composer")
local widget = require("widget")
local screen = require("lua.modules.screen")
local league = require("lua.modules.offlineLeague")
local racerProfiles = require("lua.modules.racerProfiles")
local scene = composer.newScene()
local clean, cleanEnter

-- The league board, laid out like Fun Run 2's (original 480x320 design units): the
-- player on the left, the weekly group of 50 on the right with the division plates
-- between the places, the next league on top and the time left in the week below.
local DESIGN_W, DESIGN_H = 480, 320
local LIST_LEFT, LIST_TOP, LIST_W, LIST_H = 206, 88, 200, 215
local ROW_H, NEXT_LEAGUE_ROW_H = 30, 66
local BLACK = { 0, 0, 0 }
local WHITE = { 1, 1, 1 }
local BROWN = { 0.29, 0.16, 0.06 }
local OWN_ROW_COLOR = { 0.2, 0.432, 0.12 }
local INTRO_COLOR = { 0.565, 0.506, 0.431 }
local STAT_LABEL_COLOR = { 0.4, 0.4, 0.4 }
-- The profile's stats, as the original: label position, value offset and row.
local STAT_ROWS = {
  { "Games", 72, 28, 274 },
  { "Wins", 72, 28, 287 },
  { "Kills", 72, 28, 300 },
  { "Deaths", 134, 35, 274 },
  { "Suicides", 134, 35, 287 }
}

function scene:create(event)
  local group = self.view
  local params = event.params or {}
  screen.update()
  local box = screen.designBox(DESIGN_W, DESIGN_H)
  local s = box.scale
  local designX = screen.centerX - DESIGN_W * 0.5 * s
  local designY = screen.centerY - DESIGN_H * 0.5 * s
  local state = league.getState()
  local tier = state.tier
  local monster, timeTimer
  local buttons = {}

  local function newText(textParams)
    textParams.size = (textParams.size or 14) * s
    local text = composer.newText(textParams)
    text.xScale, text.yScale = 1 / s, 1 / s
    return text
  end

  -- Shrinks a text to `maxWidth` design units (measured in its parent's units).
  local function fitWidth(text, maxWidth)
    local width = text.width * math.abs(text.xScale)
    if width > maxWidth then
      local fit = maxWidth / width
      text.xScale, text.yScale = text.xScale * fit, text.yScale * fit
    end
  end

  -- Button labels are drawn at screen resolution too.
  local function sharpenLabel(button)
    local label = button[button.numChildren]
    if label and label.size and label ~= button[1] then
      label.size = label.size * s
      label.xScale, label.yScale = 1 / s, 1 / s
    end
  end

  local function newDesignGroup()
    local designGroup = display.newGroup()
    designGroup.xScale, designGroup.yScale = s, s
    designGroup.x, designGroup.y = designX, designY
    group:insert(designGroup)
    return designGroup
  end

  local dim = display.newRect(group, screen.centerX, screen.centerY, screen.width + 4, screen.height + 4)
  dim:setFillColor(0, 0, 0, 0.59)

  -- Behind the frame: the panes' backgrounds, the player and the group list.
  local back = newDesignGroup()
  local listBackground = display.newImageRect(back, "images/gui/ranking/mainOverlayBG.png", 212.5, 272.5)
  listBackground.anchorY = 0
  listBackground.x, listBackground.y = 310, 50
  local avatarBackground = display.newImageRect(back, "images/gui/ranking/avatarBG.png", 130, 176.5)
  avatarBackground.x, avatarBackground.y = 131, 135
  local historyBackground = display.newImageRect(back, "images/gui/ranking/league/historyBG.png", 136, 31)
  historyBackground.x, historyBackground.y = 133, 247

  local showProfile

  local function newScrollView()
    local scrollView = widget.newScrollView({
      left = designX + LIST_LEFT * s,
      top = designY + LIST_TOP * s,
      width = LIST_W * s,
      height = LIST_H * s,
      hideBackground = true,
      horizontalScrollDisabled = true,
      hideScrollBar = true
    })
    group:insert(scrollView)
    local content = display.newGroup()
    content.xScale, content.yScale = s, s
    scrollView:insert(content)
    return scrollView, content
  end

  -- The weekly group: next league, then the places with the division plates (and the
  -- demotion line) between them.
  local listView, listContent = newScrollView()
  local groupList, place = league.getGroup()
  local ownRowY = 0
  local y = 0
  if tier > league.ELITE then
    -- The next league's shield and what it takes to get there.
    -- A plain plank with the shield drawn inside it (the art with the shield baked in
    -- has it sticking out of the wood).
    local plankW, plankH = 176, 48
    local nextLeague = display.newImageRect(listContent, "images/gui/ranking/league/nextLeague.png", plankW, plankH)
    nextLeague.x, nextLeague.y = LIST_W * 0.5, y + NEXT_LEAGUE_ROW_H * 0.5
    local plankLeft = nextLeague.x - plankW * 0.5
    local shield = display.newImageRect(listContent, "images/gui/ranking/league/tierB_" .. (tier - 1) .. ".png", 38, 37)
    shield.x, shield.y = plankLeft + 25, nextLeague.y
    local advancement = league.advancementText(tier)
    if advancement then
      local textLeft = plankLeft + 48
      local textW = plankLeft + plankW - 8 - textLeft
      local advancementText = newText({ string = composer.localized.get(advancement), size = 9, width = textW * s,
        align = "center", color = WHITE })
      advancementText.x, advancementText.y = textLeft + textW * 0.5, nextLeague.y
      listContent:insert(advancementText)
    end
    y = y + NEXT_LEAGUE_ROW_H
  end
  local divisionStarts = league.divisionStarts()
  local nextDivision = 1
  local demotionPlace = league.demotionPlace(tier)
  local tierForPlates = math.min(tier, league.WOOD)
  for i, entry in ipairs(groupList) do
    if divisionStarts[nextDivision] == i then
      local plank = display.newImageRect(listContent, "images/gui/ranking/league/plank.png", 113, 12)
      plank.x, plank.y = LIST_W * 0.5, y + 16
      local plate = display.newImageRect(listContent, "images/gui/ranking/league/" .. tierForPlates .. nextDivision .. ".png", 35, 19)
      plate.x, plate.y = LIST_W * 0.5, y + 16
      y = y + ROW_H
      nextDivision = nextDivision + 1
    end
    if entry.isPlayer then
      local highlight = display.newImageRect(listContent, "images/gui/ranking/cell.png", LIST_W, ROW_H)
      highlight.anchorX, highlight.anchorY = 0, 0
      highlight.x, highlight.y = 0, y
      ownRowY = y
    end
    -- Tap a racer to see them on the left.
    local rowY = y
    local hitArea = display.newRect(listContent, LIST_W * 0.5, y + ROW_H * 0.5, LIST_W, ROW_H)
    hitArea.isVisible = false
    hitArea.isHitTestable = true
    hitArea:addEventListener("tap", function()
      if showProfile then
        showProfile(entry, rowY)
      end
      return true
    end)
    local color = entry.isPlayer and OWN_ROW_COLOR or BLACK
    local rating = newText({ string = tostring(entry.rating), size = 16, color = color, ax = 1 })
    rating.x, rating.y = 190, y + ROW_H * 0.5
    listContent:insert(rating)
    local maxNameWidth = 165 - rating.width * rating.xScale
    local name = newText({ string = i .. ". " .. tostring(entry.username), size = 16, color = color, ax = 0 })
    fitWidth(name, maxNameWidth)
    name.x, name.y = 15, y + ROW_H * 0.5
    listContent:insert(name)
    y = y + ROW_H
    if demotionPlace > 0 and i == demotionPlace and i < #groupList then
      local line = display.newImageRect(listContent, "images/gui/ranking/league/demote_line.png", 200, 19)
      line.x, line.y = LIST_W * 0.5, y + 15
      y = y + ROW_H
    end
  end
  listView:setScrollHeight(y * s)
  -- Open on the player's own place.
  local scrollTo = math.max(0, math.min(y - LIST_H, ownRowY - LIST_H * 0.5 + ROW_H * 0.5))
  listView:scrollToPosition({ y = -scrollTo * s, time = 0 })

  -- Shop icon of a prize item (skins, ids from 5000, have their own folder).
  local function itemIconPath(itemId)
    local category = composer.storeConfig.getItemCategory(itemId)
    if not category and tonumber(itemId) and tonumber(itemId) >= 5000 then
      category = "skins"
    end
    local path = category and ("images/gui/market/items/" .. category .. "/" .. itemId .. ".png")
    if path and system.pathForFile(path, system.ResourceDirectory) then
      return path
    end
  end

  -- The prizes of every league, one sign each (Elite's has room for its items).
  local prizesView, prizesContent = newScrollView()
  prizesView.isVisible = false
  local prizeY = 4
  local ownPrizeY = 0
  local STRIP_Y = { 14.5, 33.3, 52, 70.5, 89.5 }
  local ELITE_STRIP_Y = { 30, 64.5, 83, 102, 120.5 }
  for prizeTier = league.ELITE, league.WOOD - 1 do
    local isElite = prizeTier == league.ELITE
    local height = isElite and 138 or 111
    local panel = display.newGroup()
    prizesContent:insert(panel)
    panel.xScale, panel.yScale = 0.96, 0.96
    panel.x, panel.y = LIST_W * 0.5 - 104 * 0.96, prizeY
    local sign = display.newImageRect(panel, isElite and "images/gui/ranking/prizes2.png" or "images/gui/ranking/prizes1.png", 208, height)
    sign.anchorX, sign.anchorY = 0, 0
    -- The league's name centred above its shield, in the sign's free left column.
    local leagueName = newText({ string = composer.localized.get(league.leagueName(prizeTier)), size = 10, color = WHITE })
    -- (Elite's strips reach further left, so its column is narrower.)
    local columnX = isElite and 39 or 48
    leagueName.x, leagueName.y = columnX, isElite and 22 or 17
    fitWidth(leagueName, isElite and 72 or 82)
    panel:insert(leagueName)
    local badgeW = isElite and 46 or 50
    local badge = display.newImageRect(panel, "images/gui/ranking/league/tierB_" .. prizeTier .. ".png", badgeW, badgeW * 0.98)
    badge.x, badge.y = columnX, isElite and 72 or 64
    for division = 1, 5 do
      local prizes = league.prizes(prizeTier, division)
      local bigBox = isElite and division == 1
      local stripY = (isElite and ELITE_STRIP_Y or STRIP_Y)[division]
      if bigBox then
        stripY = 16
      end
      local stripLeft = (isElite and division > 1) and 74 or ((not isElite and division == 1) and 100 or 88)
      if bigBox then
        stripLeft = 94
      end
      -- Elite's strips are thinner than the other signs' (11 against 12.5 units), so
      -- their plates, numbers and icons are a size smaller to sit inside them.
      local rowScale = (isElite and not bigBox) and 0.86 or 1
      local plate = display.newImageRect(panel, "images/gui/ranking/league/" .. prizeTier .. division .. ".png", 21 * rowScale, 11.4 * rowScale)
      plate.x, plate.y = stripLeft + 8, stripY
      -- Currency on the right of the strip; items after it (in Elite's big box, below).
      local x = 172
      local items = {}
      for _, prize in ipairs(prizes) do
        if prize.type == "ITEM" then
          items[#items + 1] = prize
        end
      end
      for _, prize in ipairs(prizes) do
        if prize.type ~= "ITEM" then
          local isGems = prize.type == "HARD_CURRENCY"
          local icon = display.newImageRect(panel, isGems and "images/gui/common/gem_small.png" or "images/gui/common/coin_small.png", 10 * rowScale, 10 * rowScale)
          icon.anchorX = 1
          icon.x, icon.y = (#items > 0 and not bigBox) and 158 or 172, stripY
          local amount = newText({ string = tostring(prize.amount), size = 11 * rowScale, color = BROWN, ax = 1 })
          amount.x, amount.y = icon.x - 12 * rowScale, stripY
          panel:insert(amount)
        end
      end
      for i, prize in ipairs(items) do
        local path = itemIconPath(prize.itemId)
        if path then
          local size = bigBox and 30 or 13 * rowScale
          local icon = display.newImageRect(panel, path, size * 65 / 72, size)
          if bigBox then
            icon.x, icon.y = 135 + (i - (#items + 1) * 0.5) * 32, 38
          else
            icon.anchorX = 1
            icon.x, icon.y = 172, stripY
          end
        end
      end
    end
    if prizeTier == tier then
      ownPrizeY = prizeY
    end
    prizeY = prizeY + height * 0.96 + 8
  end
  local woodNote = newText({ string = composer.localized.get("Wood League has no prizes. Race to reach Bronze!"),
    size = 11, color = BROWN, width = 180 * s, align = "center" })
  woodNote.x, woodNote.y = LIST_W * 0.5, prizeY + 14
  prizesContent:insert(woodNote)
  prizeY = prizeY + 34
  prizesView:setScrollHeight(prizeY * s)
  prizesView:scrollToPosition({ y = -math.max(0, math.min(prizeY - LIST_H, ownPrizeY)) * s, time = 0 })

  -- The frame and everything on it.
  local front = newDesignGroup()
  local frame = display.newImageRect(front, "images/gui/ranking/mainOverlay.png", 409.5, 320)
  frame.anchorY = 0
  frame.x, frame.y = 240, 0
  -- The league intro (before the first race of the week) goes under the header.
  local intro = display.newGroup()
  front:insert(intro)
  local header = display.newImageRect(front, "images/gui/ranking/dynamicTop.png", 211, 44)
  header.anchorY = 0
  header.x, header.y = 307, 47
  local footer = display.newImageRect(front, "images/gui/ranking/dynamicBot.png", 223, 17)
  footer.anchorY = 0
  footer.x, footer.y = 309, 303

  local title = newText({ string = composer.localized.get(league.leagueName(tier)), size = 30, color = WHITE })
  title.x, title.y = 240, 16
  front:insert(title)

  local badge = display.newImageRect(front, "images/gui/ranking/league/tierS_" .. tier .. ".png", 20, 20)
  badge.x, badge.y = 222, 64
  local placeText = newText({ string = "", size = 16, color = WHITE, ax = 0 })
  placeText.x, placeText.y = 236, 64
  front:insert(placeText)
  if state.placed then
    placeText.text = composer.localized.get("Place") .. " " .. place
  else
    placeText.text = composer.localized.get("Not placed")
  end

  -- Time left in the week on the footer's tab (as the original: just "3d 4h 12m").
  local timeText = newText({ string = "", size = 12, color = WHITE })
  timeText.x, timeText.y = 310, 312.5
  front:insert(timeText)
  local function updateTime()
    timeText.text = league.timeLeftText()
  end
  updateTime()
  timeTimer = timer.performWithDelay(30000, updateTime, 0)

  -- The racer on the left: the player, or whoever was tapped in the list. Their look
  -- on the red sign, the last weeks under it and their stats at the bottom.
  local monsterLoader = require("spine-corona.monsterLoader")
  local profileBack = display.newGroup()
  back:insert(profileBack)
  local profileFront = display.newGroup()
  front:insert(profileFront)
  local selection = display.newImageRect(listContent, "images/gui/ranking/cell.png", LIST_W, ROW_H)
  selection.anchorX, selection.anchorY = 0, 0
  selection.alpha = 0.45
  selection.isVisible = false
  selection:toBack()
  local playerInfo = composer.database.getPlayerInformation() or {}
  local shownRacer

  local function cleanMonster()
    if monster and monster.clean then
      monster.clean()
    end
    monster = nil
  end

  function showProfile(entry, rowY)
    local isPlayer = entry == nil or entry.isPlayer
    local racerName = isPlayer and tostring(playerInfo.username or "") or tostring(entry.username)
    if shownRacer == racerName then
      return
    end
    shownRacer = racerName
    selection.isVisible = not isPlayer and rowY ~= nil
    if rowY then
      selection.y = rowY
    end
    cleanMonster()
    display.remove(profileBack)
    display.remove(profileFront)
    profileBack = display.newGroup()
    back:insert(profileBack)
    profileFront = display.newGroup()
    front:insert(profileFront)

    local avatar, history, stats
    if isPlayer then
      avatar = composer.database.getAvatarData()
      history = state.history or {}
      stats = racerProfiles.playerStats()
    else
      avatar = racerProfiles.racerAvatar(racerName)
      history = racerProfiles.racerHistory(racerName, tier)
      stats = racerProfiles.racerStats(racerName, entry.rating, tier)
    end
    if avatar then
      monster = monsterLoader.new(avatar, false, nil,
        isPlayer and composer.database.getBackwear and composer.database.getBackwear() or 0)
      if monster and monster.getGroup then
        local monsterGroup = monster.getGroup()
        monsterGroup.xScale, monsterGroup.yScale = 0.45, 0.45
        monsterGroup.x, monsterGroup.y = 128, 194
        profileBack:insert(monsterGroup)
      end
    end

    local username = newText({ string = racerName, size = 15, color = WHITE })
    username.x, username.y = 131, 216
    fitWidth(username, 108)
    profileFront:insert(username)

    if #history == 0 then
      local noHistory = newText({ string = composer.localized.get("No League History"), size = 10, color = BLACK })
      noHistory.x, noHistory.y = 133, 249
      profileFront:insert(noHistory)
    else
      -- The last weeks, newest first: league badge and place.
      for i = 1, math.min(4, #history) do
        local week = history[i]
        local x = 78 + (i - 1) * 32
        local weekBadge = display.newImageRect(profileFront, "images/gui/ranking/league/tierS_" .. (week.tier or league.WOOD) .. ".png", 14, 14)
        weekBadge.x, weekBadge.y = x, 247
        local weekPlace = newText({ string = tostring(week.place or ""), size = 10, color = BLACK, ax = 0 })
        weekPlace.x, weekPlace.y = x + 9, 248
        profileFront:insert(weekPlace)
      end
    end

    local values = {
      racerProfiles.formatCount(stats.games),
      racerProfiles.formatWinRate(stats),
      racerProfiles.formatCount(stats.kills),
      racerProfiles.formatCount(stats.deaths),
      racerProfiles.formatCount(stats.suicides)
    }
    for i, row in ipairs(STAT_ROWS) do
      local label = newText({ string = composer.localized.get(row[1]), size = 11, color = STAT_LABEL_COLOR, ax = 0 })
      label.x, label.y = row[2], row[4]
      profileFront:insert(label)
      local value = newText({ string = values[i], size = 11, color = BLACK, ax = 0 })
      value.x, value.y = row[2] + row[3], row[4]
      profileFront:insert(value)
    end
  end

  showProfile(nil)

  -- Before the first race of the week the list is replaced by the league intro.
  if state.placed then
    display.remove(intro)
    intro = nil
  else
    local introImage = display.newImageRect(intro, "images/gui/ranking/leagueIntro.png", 216, 276)
    introImage.x, introImage.y = 310, 203
    local introText = newText({ string = composer.localized.get("Race your way to the top to get better rewards!"),
      size = 12, width = 190 * s, align = "center", color = INTRO_COLOR })
    introText.x, introText.y = 312, 128
    intro:insert(introText)
    local placeHint = newText({ string = composer.localized.get("Play a race to be placed!"), size = 13,
      width = 200 * s, align = "center", color = INTRO_COLOR })
    placeHint.x, placeHint.y = 315, 225
    intro:insert(placeHint)
    local weeklyHint = newText({ string = composer.localized.get("Every week the league is reset and you are rewarded a prize."),
      size = 11, width = 180 * s, align = "center", color = WHITE })
    weeklyHint.x, weeklyHint.y = 312, 272
    intro:insert(weeklyHint)
    listView.isVisible = false
  end

  local prizesButton
  local showingPrizes = false
  local function togglePrizes()
    showingPrizes = not showingPrizes
    prizesView.isVisible = showingPrizes
    listView.isVisible = not showingPrizes and state.placed
    if intro then
      intro.isVisible = not showingPrizes
    end
    local label = showingPrizes and composer.localized.get("League") or composer.localized.get("Prizes")
    if prizesButton then
      prizesButton.changeText(label)
    end
  end

  prizesButton = composer.newButton({
    image = "images/gui/ranking/button.png",
    width = 60,
    height = 35,
    x = 382,
    y = 64,
    text = { string = composer.localized.get("Prizes"), size = 14 },
    onRelease = togglePrizes
  })
  sharpenLabel(prizesButton)
  front:insert(prizesButton)
  buttons[#buttons + 1] = prizesButton

  local closeButton = composer.newButton({
    image = "images/gui/common/buttonClosePopupRed.png",
    width = 43,
    height = 38,
    x = 408,
    y = 16,
    onRelease = function()
      composer.hideOverlay()
    end
  })
  front:insert(closeButton)
  buttons[#buttons + 1] = closeButton

  local function swallowTouch()
    return true
  end

  dim:addEventListener("touch", swallowTouch)
  if params.openPrizes then
    togglePrizes()
  end
  composer.audio.play("dropdown_menu")

  function clean()
    dim:removeEventListener("touch", swallowTouch)
    if timeTimer then
      timer.cancel(timeTimer)
      timeTimer = nil
    end
    for _, button in ipairs(buttons) do
      display.remove(button)
    end
    cleanMonster()
  end
end

function scene:show(event)
  if event.phase == "will" then
    return
  end
  local androidLogic = require("lua.modules.androidBackButton")

  function cleanEnter()
    androidLogic.isOverlay(false)
  end

  androidLogic.isOverlay(true)
end

function scene:hide(event)
  if event.phase == "will" then
    if cleanEnter then
      cleanEnter()
      cleanEnter = nil
    end
  elseif event.phase == "did" and event.parent and event.parent.overlayEnded then
    event.parent:overlayEnded()
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
