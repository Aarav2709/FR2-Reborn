local composer = require("composer")
local widget = require("widget")
local screen = require("lua.modules.screen")
local clans = require("lua.modules.clanSimulation")
local racerProfiles = require("lua.modules.racerProfiles")
local scene = composer.newScene()
local clean, cleanEnter

local DESIGN_W, DESIGN_H = 480, 320
local LIST_LEFT, LIST_TOP, LIST_W, LIST_H = 206, 88, 200, 215
local ROW_H = 30
local BLACK = { 0, 0, 0 }
local WHITE = { 1, 1, 1 }
local OWN_ROW_COLOR = { 0.2, 0.432, 0.12 }
local PROMOTE_COLOR = { 0.16, 0.45, 0.1 }
local DEMOTE_COLOR = { 0.62, 0.12, 0.08 }
local LABEL_COLOR = { 0.4, 0.4, 0.4 }
local BROWN = { 0.29, 0.16, 0.06 }
local INTRO_COLOR = { 0.565, 0.506, 0.431 }
local BAR_BACK = { 0.25, 0.16, 0.08 }
local BAR_FILL = { 0.85, 0.6, 0.02 }

local function amountText(amount, one, many)
  return amount .. " " .. composer.localized.get(amount == 1 and one or many)
end

local function ordinal(place)
  local suffix = "th"
  if place % 100 < 11 or place % 100 > 13 then
    suffix = ({ "st", "nd", "rd" })[place % 10] or "th"
  end
  return place .. suffix
end

function scene:create(event)
  local group = self.view
  screen.update()
  local box = screen.designBox(DESIGN_W, DESIGN_H)
  local s = box.scale
  local designX = screen.centerX - DESIGN_W * 0.5 * s
  local designY = screen.centerY - DESIGN_H * 0.5 * s
  local buttons, monsters, scrollViews = {}, {}, {}
  local content
  local showingLeague = false
  local newClanName = clans.clanName()
  local timeTimer
  local build

  local function newText(textParams)
    textParams.size = (textParams.size or 14) * s
    if textParams.width then
      textParams.width = textParams.width * s
    end
    local text = composer.newText(textParams)
    text.xScale, text.yScale = 1 / s, 1 / s
    return text
  end

  local function fitWidth(text, maxWidth)
    local width = text.width * math.abs(text.xScale)
    if width > maxWidth then
      local fit = maxWidth / width
      text.xScale, text.yScale = text.xScale * fit, text.yScale * fit
    end
  end

  local function sharpenLabel(button)
    local label = button[button.numChildren]
    if label and label.size and label ~= button[1] then
      label.size = label.size * s
      label.xScale, label.yScale = 1 / s, 1 / s
    end
  end

  local function newButton(parent, params)
    local button = composer.newButton(params)
    if params.text then
      sharpenLabel(button)
    end
    parent:insert(button)
    buttons[#buttons + 1] = button
    return button
  end

  local function newDesignGroup(parent)
    local designGroup = display.newGroup()
    designGroup.xScale, designGroup.yScale = s, s
    designGroup.x, designGroup.y = designX, designY
    parent:insert(designGroup)
    return designGroup
  end

  local function newScrollView(parent)
    local scrollView = widget.newScrollView({
      left = designX + LIST_LEFT * s,
      top = designY + LIST_TOP * s,
      width = LIST_W * s,
      height = LIST_H * s,
      hideBackground = true,
      horizontalScrollDisabled = true,
      hideScrollBar = true
    })
    parent:insert(scrollView)
    scrollViews[#scrollViews + 1] = scrollView
    local list = display.newGroup()
    list.xScale, list.yScale = s, s
    scrollView:insert(list)
    return scrollView, list
  end

  local dim = display.newRect(group, screen.centerX, screen.centerY, screen.width + 4, screen.height + 4)
  dim:setFillColor(0, 0, 0, 0.59)
  local function swallowTouch()
    return true
  end
  dim:addEventListener("touch", swallowTouch)

  local function cleanContent()
    for _, button in ipairs(buttons) do
      display.remove(button)
    end
    buttons = {}
    for _, monster in ipairs(monsters) do
      if monster.clean then
        monster.clean()
      end
    end
    monsters = {}
    for _, scrollView in ipairs(scrollViews) do
      display.remove(scrollView)
    end
    scrollViews = {}
    if timeTimer then
      timer.cancel(timeTimer)
      timeTimer = nil
    end
    display.remove(content)
    content = nil
  end

  local function addRow(list, y, label, value, color, onTap)
    local valueText = newText({ string = tostring(value), size = 16, color = color, ax = 1 })
    valueText.x, valueText.y = 190, y + ROW_H * 0.5
    list:insert(valueText)
    local name = newText({ string = label, size = 16, color = color, ax = 0 })
    fitWidth(name, 165 - valueText.width * valueText.xScale)
    name.x, name.y = 15, y + ROW_H * 0.5
    list:insert(name)
    if onTap then
      local hitArea = display.newRect(list, LIST_W * 0.5, y + ROW_H * 0.5, LIST_W, ROW_H)
      hitArea.isVisible = false
      hitArea.isHitTestable = true
      hitArea:addEventListener("tap", function()
        onTap(y)
        return true
      end)
    end
  end

  local function showMonster(parent, avatar, backwear)
    local monsterLoader = require("spine-corona.monsterLoader")
    local monster = monsterLoader.new(avatar, false, nil, backwear or 0)
    if monster and monster.getGroup then
      monsters[#monsters + 1] = monster
      local monsterGroup = monster.getGroup()
      monsterGroup.xScale, monsterGroup.yScale = 0.45, 0.45
      monsterGroup.x, monsterGroup.y = 128, 194
      parent:insert(monsterGroup)
    end
  end

  local function buildFrame(back, front, title)
    local listBackground = display.newImageRect(back, "images/gui/ranking/mainOverlayBG.png", 212.5, 272.5)
    listBackground.anchorY = 0
    listBackground.x, listBackground.y = 310, 50
    local avatarBackground = display.newImageRect(back, "images/gui/ranking/avatarBG.png", 130, 176.5)
    avatarBackground.x, avatarBackground.y = 131, 135
    local strip = display.newImageRect(back, "images/gui/ranking/league/historyBG.png", 136, 31)
    strip.x, strip.y = 133, 247
    local frame = display.newImageRect(front, "images/gui/ranking/mainOverlay.png", 409.5, 320)
    frame.anchorY = 0
    frame.x, frame.y = 240, 0
    local header = display.newImageRect(front, "images/gui/ranking/dynamicTop.png", 211, 44)
    header.anchorY = 0
    header.x, header.y = 307, 47
    local footer = display.newImageRect(front, "images/gui/ranking/dynamicBot.png", 223, 17)
    footer.anchorY = 0
    footer.x, footer.y = 309, 303
    local titleText = newText({ string = title, size = 30, color = WHITE })
    titleText.x, titleText.y = 240, 16
    fitWidth(titleText, 300)
    front:insert(titleText)
    newButton(front, {
      image = "images/gui/common/buttonClosePopupRed.png",
      width = 43,
      height = 38,
      x = 408,
      y = 16,
      onRelease = function()
        composer.hideOverlay()
      end
    })
    local timeText = newText({ string = clans.timeLeftText(), size = 12, color = WHITE })
    timeText.x, timeText.y = 310, 312.5
    front:insert(timeText)
    timeTimer = timer.performWithDelay(30000, function()
      timeText.text = clans.timeLeftText()
    end, 0)
  end

  local function buildClan(state)
    local clan = state.clan
    local back = newDesignGroup(content)
    local listsGroup = display.newGroup()
    content:insert(listsGroup)
    local front = newDesignGroup(content)
    buildFrame(back, front, clan.name)
    local league, place = clans.clanLeague()

    local pedestal = display.newImageRect(front, "images/gui/market/items/plate/clan" .. clan.tier .. ".png", 35, 15)
    pedestal.x, pedestal.y = 228, 66
    local placeText = newText({ string = composer.localized.get(clans.tierName(clan.tier)) .. "  " .. ordinal(place or 1),
      size = 16, color = WHITE, ax = 0 })
    placeText.x, placeText.y = 250, 64
    fitWidth(placeText, 100)
    front:insert(placeText)

    local membersView, membersList = newScrollView(listsGroup)
    local members = clans.members()
    local profile = display.newGroup()
    back:insert(profile)
    local profileFront = display.newGroup()
    front:insert(profileFront)
    local selection = display.newImageRect(membersList, "images/gui/ranking/cell.png", LIST_W, ROW_H)
    selection.anchorX, selection.anchorY = 0, 0
    selection.alpha = 0.45
    selection.isVisible = false
    local shown

    local function showMember(member, rowY)
      if shown == member then
        return
      end
      shown = member
      for i = #monsters, 1, -1 do
        monsters[i].clean()
        monsters[i] = nil
      end
      display.remove(profile)
      display.remove(profileFront)
      profile = display.newGroup()
      back:insert(profile)
      profileFront = display.newGroup()
      front:insert(profileFront)
      selection.isVisible = not member.isPlayer
      if rowY then
        selection.y = rowY
      end
      if member.isPlayer then
        showMonster(profile, composer.database.getAvatarData(), composer.database.getBackwear and composer.database.getBackwear() or 0)
      else
        showMonster(profile, racerProfiles.racerAvatar(member.name), 0)
      end
      local name = newText({ string = member.name, size = 15, color = WHITE })
      name.x, name.y = 131, 216
      fitWidth(name, 108)
      profileFront:insert(name)
      local points = newText({ string = composer.localized.get(member.role or "Member") .. ": " .. member.points .. " "
        .. composer.localized.get("pts this week"), size = 11, color = BLACK })
      points.x, points.y = 133, 248
      fitWidth(points, 122)
      profileFront:insert(points)
    end

    local y = 0
    for i, member in ipairs(members) do
      if member.isPlayer then
        local highlight = display.newImageRect(membersList, "images/gui/ranking/cell.png", LIST_W, ROW_H)
        highlight.anchorX, highlight.anchorY = 0, 0
        highlight.x, highlight.y = 0, y
      end
      local rowY = y
      addRow(membersList, y, i .. ". " .. member.name, member.points, member.isPlayer and OWN_ROW_COLOR or BLACK,
        function()
          showMember(member, rowY)
        end)
      y = y + ROW_H
    end
    selection:toBack()
    membersView:setScrollHeight(y * s)
    for _, member in ipairs(members) do
      if member.isPlayer then
        showMember(member)
      end
    end

    local leagueView, leagueList = newScrollView(listsGroup)
    y = 0
    for i, entry in ipairs(league) do
      if entry.own then
        local highlight = display.newImageRect(leagueList, "images/gui/ranking/cell.png", LIST_W, ROW_H)
        highlight.anchorX, highlight.anchorY = 0, 0
        highlight.x, highlight.y = 0, y
      end
      local color = BLACK
      if entry.own then
        color = OWN_ROW_COLOR
      elseif i <= clans.PROMOTE_PLACES and clan.tier < clans.ELITE then
        color = PROMOTE_COLOR
      elseif i > clans.LEAGUE_SIZE - clans.DEMOTE_PLACES and clan.tier > clans.WOOD then
        color = DEMOTE_COLOR
      end
      addRow(leagueList, y, i .. ". " .. entry.name, entry.points, color)
      y = y + ROW_H
      if i == clans.LEAGUE_SIZE - clans.DEMOTE_PLACES and clan.tier > clans.WOOD then
        local line = display.newImageRect(leagueList, "images/gui/ranking/league/demote_line.png", 200, 19)
        line.x, line.y = LIST_W * 0.5, y + 15
        y = y + ROW_H
      end
    end
    leagueView:setScrollHeight(y * s)

    local toggle
    local function showLists()
      membersView.isVisible = not showingLeague
      leagueView.isVisible = showingLeague
      if toggle then
        toggle.changeText(composer.localized.get(showingLeague and "Members" or "Clans"))
      end
    end
    toggle = newButton(front, {
      image = "images/gui/ranking/button.png",
      width = 60,
      height = 35,
      x = 382,
      y = 64,
      text = { string = composer.localized.get("Clans"), size = 14 },
      onRelease = function()
        showingLeague = not showingLeague
        showLists()
      end
    })
    showLists()

    local goal = clans.chestGoal(clan.tier)
    local weekPoints = clans.weekPoints()
    local chestLabel = newText({ string = composer.localized.get("Clan chest"), size = 10, color = LABEL_COLOR })
    chestLabel.x, chestLabel.y = 133, 269
    front:insert(chestLabel)
    local BAR_LEFT, BAR_W = 76, 114
    local barBack = display.newRect(front, BAR_LEFT + BAR_W * 0.5, 281, BAR_W, 10)
    barBack:setFillColor(unpack(BAR_BACK))
    local share = math.min(1, weekPoints / goal)
    if share > 0 then
      local barFill = display.newRect(front, BAR_LEFT, 281, BAR_W * share, 10)
      barFill.anchorX = 0
      barFill:setFillColor(unpack(BAR_FILL))
    end
    local barText = newText({ string = math.min(weekPoints, goal) .. " / " .. goal, size = 8, color = WHITE })
    barText.x, barText.y = BAR_LEFT + BAR_W * 0.5, 281
    front:insert(barText)
    local prize = clans.chestPrize(clan.tier)
    if clans.canClaimChest() then
      newButton(front, {
        image = "images/gui/ranking/button.png",
        width = 64,
        height = 24,
        x = 106,
        y = 300,
        text = { string = composer.localized.get("Open chest"), size = 10 },
        onRelease = function()
          local paid = clans.claimChest()
          if paid then
            composer.audio.play("buy_item")
            native.showAlert(composer.localized.get("Clan chest"), "+" .. amountText(paid.coins, "coin", "coins")
              .. ", +" .. amountText(paid.gems, "gem", "gems"), { composer.localized.get("Ok") })
            build()
          end
        end
      })
    else
      local chestNote = clan.chestClaimed and composer.localized.get("Chest opened this week")
        or (amountText(prize.coins, "coin", "coins") .. " + " .. amountText(prize.gems, "gem", "gems"))
      local note = newText({ string = chestNote, size = 8, color = BLACK })
      note.x, note.y = 106, 300
      fitWidth(note, 68)
      front:insert(note)
    end

    newButton(front, {
      image = "images/gui/ranking/button.png",
      width = 48,
      height = 24,
      x = 168,
      y = 300,
      text = { string = composer.localized.get("Leave"), size = 10 },
      onRelease = function()
        native.showAlert(composer.localized.get("Leave clan"), composer.localized.get("Leave the clan? Its chest and tier stay with it."),
          { composer.localized.get("Leave"), composer.localized.get("Cancel") }, function(alertEvent)
            if alertEvent.action == "clicked" and alertEvent.index == 1 then
              clans.leave()
              showingLeague = false
              build()
            end
          end)
      end
    })
  end

  local function buildOffers()
    local back = newDesignGroup(content)
    local listsGroup = display.newGroup()
    content:insert(listsGroup)
    local front = newDesignGroup(content)
    buildFrame(back, front, composer.localized.get("Clans"))
    local headerText = newText({ string = composer.localized.get("Clans looking for members"), size = 14, color = WHITE })
    headerText.x, headerText.y = 307, 64
    fitWidth(headerText, 190)
    front:insert(headerText)

    local offersView, offersList = newScrollView(listsGroup)
    local y = 0
    for _, offer in ipairs(clans.offers()) do
      local rowH = 44
      local pedestal = display.newImageRect(offersList, "images/gui/market/items/plate/clan" .. offer.tier .. ".png", 35, 15)
      pedestal.x, pedestal.y = 22, y + 14
      local name = newText({ string = offer.name, size = 14, color = BLACK, ax = 0 })
      name.x, name.y = 42, y + 13
      fitWidth(name, 104)
      offersList:insert(name)
      local details = newText({ string = composer.localized.get(clans.tierName(offer.tier)) .. "  " .. offer.size .. "/" .. clans.MAX_MEMBERS
        .. "  " .. offer.points .. " " .. composer.localized.get("pts"), size = 10, color = LABEL_COLOR, ax = 0 })
      details.x, details.y = 12, y + 31
      fitWidth(details, 136)
      offersList:insert(details)
      newButton(offersList, {
        image = "images/gui/ranking/button.png",
        width = 46,
        height = 27,
        x = 175,
        y = y + rowH * 0.5,
        text = { string = composer.localized.get("Join"), size = 11 },
        onRelease = function()
          clans.join(offer)
          composer.audio.play("buy_item")
          build()
        end
      })
      y = y + rowH
    end
    offersView:setScrollHeight(y * s)

    local startLabel = newText({ string = composer.localized.get("Start your own"), size = 13, color = BROWN })
    startLabel.x, startLabel.y = 131, 66
    front:insert(startLabel)
    local emblem = display.newImageRect(back, "images/gui/ranking/tab_clans.png", 78, 80)
    emblem.x, emblem.y = 131, 132
    local nameText = newText({ string = newClanName, size = 15, color = WHITE })
    nameText.x, nameText.y = 131, 216
    fitWidth(nameText, 108)
    front:insert(nameText)
    newButton(front, {
      image = "images/gui/ranking/button.png",
      width = 62,
      height = 24,
      x = 102,
      y = 247,
      text = { string = composer.localized.get("Other name"), size = 9 },
      onRelease = function()
        newClanName = clans.clanName()
        nameText.text = newClanName
        nameText.xScale, nameText.yScale = 1 / s, 1 / s
        fitWidth(nameText, 108)
      end
    })
    newButton(front, {
      image = "images/gui/ranking/button.png",
      width = 54,
      height = 24,
      x = 166,
      y = 247,
      text = { string = composer.localized.get("Create"), size = 10 },
      onRelease = function()
        clans.create(newClanName)
        composer.audio.play("buy_item")
        build()
      end
    })
    local hint = newText({ string = composer.localized.get("Your races score points for the clan chest and the clan league. A new clan starts in Wood and gains a member a day."),
      size = 8, width = 124, align = "center", color = INTRO_COLOR })
    hint.x, hint.y = 133, 287
    front:insert(hint)
  end

  local function noticeText(notice)
    local lines = {}
    if notice.kind == "week" then
      local line = composer.localized.get("Your clan finished") .. " " .. ordinal(notice.place) .. " (" .. notice.points .. " "
        .. composer.localized.get("pts") .. ")"
      if notice.tier > notice.oldTier then
        line = line .. " " .. composer.localized.get("and moved up to") .. " " .. composer.localized.get(clans.tierName(notice.tier))
      elseif notice.tier < notice.oldTier then
        line = line .. " " .. composer.localized.get("and dropped to") .. " " .. composer.localized.get(clans.tierName(notice.tier))
      end
      lines[#lines + 1] = line .. "."
      if notice.chest then
        lines[#lines + 1] = composer.localized.get("Clan chest") .. ": +" .. amountText(notice.chest.coins, "coin", "coins")
          .. ", +" .. amountText(notice.chest.gems, "gem", "gems") .. "."
      end
      if notice.items then
        lines[#lines + 1] = composer.localized.get("Clan reward") .. ": " .. table.concat(notice.items, ", ") .. "!"
      end
    end
    if notice.kind == "members" then
      if #notice.joined > 0 then
        lines[#lines + 1] = composer.localized.get("Joined the clan") .. ": " .. table.concat(notice.joined, ", ")
      end
      if #notice.left > 0 then
        lines[#lines + 1] = composer.localized.get("Left the clan") .. ": " .. table.concat(notice.left, ", ")
      end
    end
    return table.concat(lines, "\n")
  end

  function build()
    cleanContent()
    content = display.newGroup()
    group:insert(content)
    local state = clans.getState()
    if state.clan then
      buildClan(state)
    else
      buildOffers()
    end
  end

  build()
  local notices = clans.takeNotices()
  if #notices > 0 then
    local texts = {}
    for _, notice in ipairs(notices) do
      texts[#texts + 1] = noticeText(notice)
    end
    native.showAlert(composer.localized.get("Clan news"), table.concat(texts, "\n\n"), { composer.localized.get("Ok") })
  end
  composer.audio.play("dropdown_menu")

  function clean()
    dim:removeEventListener("touch", swallowTouch)
    cleanContent()
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
