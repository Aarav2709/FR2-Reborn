-- clans, played offline
local composer = require("composer")
local league = require("lua.modules.offlineLeague")
local M = {}

local STATE_KEY = "clan"
local DAY = 24 * 60 * 60

M.WOOD, M.ELITE = 1, 6
M.MAX_MEMBERS = 10
M.LEAGUE_SIZE = 10
M.PROMOTE_PLACES = 3
M.DEMOTE_PLACES = 3
M.OFFER_COUNT = 6

local TIER_NAMES = { "Wood", "Bronze", "Silver", "Gold", "Diamond", "Elite" }

local RACE_POINTS = { 30, 20, 12, 6 }
local TEAM_POINTS = { win = 20, draw = 12, loss = 8 }
local MEMBER_DAILY_MIN, MEMBER_DAILY_MAX = 25, 110
local TIER_BONUS = 0.12
local PLAYER_DAILY = 80
local CHEST_GOAL = { 2600, 3000, 3400, 3900, 4400, 5000 }
local CHEST_COINS = { 300, 450, 600, 750, 900, 1100 }
local CHEST_GEMS = { 1, 1, 2, 2, 3, 3 }
local TIER_REWARDS = { [5] = { 2101, 2102 }, [6] = { 2103 } }
local STARTING_RECRUITS = 4
local LEAVE_CHANCE = 0.15
local JOIN_CHANCE = 0.5
local MIN_CLANMATES = 5
local MAX_CATCH_UP_DAYS = 60
local NEWS_NAMES = 6

local CLAN_FIRST = { "Forest", "Turbo", "Shadow", "Golden", "Frosty", "Thunder", "Lucky", "Wild", "Midnight",
  "Rocket", "Fluffy", "Iron", "Cosmic", "Silent", "Royal", "Crazy", "Mighty", "Swift", "Sneaky", "Jolly" }
local CLAN_SECOND = { "Runners", "Paws", "Foxes", "Rabbits", "Bears", "Hoppers", "Racers", "Tails", "Legends",
  "Raiders", "Dashers", "Kings", "Claws", "Stars", "Wolves", "Jumpers", "Squad", "Crew", "Bandits", "Rockets" }

M.now = os.time

-- seeded random numbers that don't disturb math.random. (the first numbers of
-- neighbouring seeds are alike, so a few are skipped.)
local function seeded(...)
  local seed = 17
  for _, part in ipairs({ ... }) do
    seed = (seed * 131 + math.floor(tonumber(part) or 0)) % 2147483647
  end
  local random = league.newRandom(seed)
  random()
  random()
  random()
  return random
end

function M.tierName(tier)
  return TIER_NAMES[tier] or TIER_NAMES[1]
end

function M.clanName(random)
  random = random or math.random
  return CLAN_FIRST[random(#CLAN_FIRST)] .. " " .. CLAN_SECOND[random(#CLAN_SECOND)]
end

function M.chestGoal(tier)
  return CHEST_GOAL[tier] or CHEST_GOAL[1]
end

function M.chestPrize(tier)
  return { coins = CHEST_COINS[tier] or CHEST_COINS[1], gems = CHEST_GEMS[tier] or CHEST_GEMS[1] }
end

function M.tierRewards(tier)
  return TIER_REWARDS[tier] or {}
end

local function load()
  local state = composer.database.getTable(STATE_KEY)
  if type(state) ~= "table" then
    state = {}
  end
  state.notices = state.notices or {}
  state.rewarded = state.rewarded or {}
  return state
end

local function save(state)
  composer.database.setTable(STATE_KEY, state)
end

local function playerName()
  local info = composer.database.getPlayerInformation() or {}
  return tostring(info.username or "")
end

local function newMember(clanSeed, index, taken)
  local random = seeded(clanSeed, index, 7)
  local name
  repeat
    name = league.randomName(random)
  until not taken[name]
  taken[name] = true
  return {
    name = name,
    seed = (clanSeed * 7 + index * 977) % 2147483647,
    activity = 0.35 + random() * 0.6,
    skill = MEMBER_DAILY_MIN + random() * (MEMBER_DAILY_MAX - MEMBER_DAILY_MIN)
  }
end

local function newMembers(clanSeed, count)
  local taken = { [playerName()] = true }
  local members = {}
  for i = 1, count do
    members[i] = newMember(clanSeed, i, taken)
  end
  local order = {}
  for i = 1, #members do
    order[i] = members[i]
  end
  table.sort(order, function(a, b)
    return a.activity * a.skill > b.activity * b.skill
  end)
  for rank, member in ipairs(order) do
    member.role = rank == 1 and "Leader" or (rank <= 3 and "Elder" or "Member")
  end
  return members
end

local function tierFactor(tier)
  return 1 + TIER_BONUS * ((tier or 1) - 1)
end

local function memberPoints(member, week, tier, untilTime)
  local elapsed = math.max(0, math.min(7 * DAY, untilTime - league.weekStart(week))) / DAY
  local total = 0
  local day = 0
  while day < elapsed do
    local random = seeded(member.seed, week, day)
    if random() < member.activity then
      total = total + member.skill * tierFactor(tier) * (0.5 + random()) * math.min(1, elapsed - day)
    end
    day = day + 1
  end
  return math.floor(total)
end

local function expectedDaily(members, tier)
  local daily = PLAYER_DAILY
  for _, member in ipairs(members) do
    daily = daily + member.activity * member.skill * tierFactor(tier)
  end
  return daily
end

local function rivalClans(clan, week)
  local random = seeded(clan.seed, week, clan.tier, 3)
  local daily = expectedDaily(clan.members, clan.tier)
  local rivals = {}
  local taken = { [clan.name] = true }
  for i = 1, M.LEAGUE_SIZE - 1 do
    local name
    repeat
      name = M.clanName(random)
    until not taken[name]
    taken[name] = true
    rivals[i] = { name = name, seed = random(1, 2147483646), daily = daily * (0.65 + random() * 0.6) }
  end
  return rivals
end

local function rivalPoints(rival, week, untilTime)
  local elapsed = math.max(0, math.min(7 * DAY, untilTime - league.weekStart(week))) / DAY
  local total = 0
  local day = 0
  while day < elapsed do
    local random = seeded(rival.seed, week, day)
    total = total + rival.daily * (0.7 + random() * 0.6) * math.min(1, elapsed - day)
    day = day + 1
  end
  return math.floor(total)
end

local function memberWeekPoints(member, week, tier, untilTime)
  local points = memberPoints(member, week, tier, untilTime)
  local joined = tonumber(member.joinedAt)
  if joined and joined > league.weekStart(week) then
    points = points - memberPoints(member, week, tier, math.min(joined, untilTime))
  end
  return math.max(0, points)
end

local function clanWeekPoints(clan, week, untilTime, playerPoints)
  local total = playerPoints or 0
  for _, member in ipairs(clan.members) do
    total = total + memberWeekPoints(member, week, clan.tier, untilTime)
  end
  return total
end

local function dayIndex(time)
  return math.floor(time / DAY)
end

local function churn(clan, day)
  local random = seeded(clan.seed, day, 5)
  local others = clan.members
  local full = M.MAX_MEMBERS - 1
  local joined, left = {}, {}
  if clan.filling and #others >= full then
    clan.filling = nil
  end
  local leaveRoll = random()
  if not clan.filling and #others >= MIN_CLANMATES and leaveRoll < LEAVE_CHANCE then
    local pick, lowest
    for i, member in ipairs(others) do
      if member.role ~= "Leader" then
        local keenness = member.activity * (0.5 + random())
        if not lowest or keenness < lowest then
          lowest, pick = keenness, i
        end
      end
    end
    if pick then
      left[#left + 1] = table.remove(others, pick).name
    end
  end
  local joinRoll = random()
  if #others < full and (clan.filling or joinRoll < JOIN_CHANCE) then
    local taken = { [playerName()] = true }
    for _, member in ipairs(others) do
      taken[member.name] = true
    end
    clan.nextMember = clan.nextMember or (#others + 1)
    local member = newMember(clan.seed, clan.nextMember, taken)
    clan.nextMember = clan.nextMember + 1
    member.role = "Member"
    member.joinedAt = day * DAY
    others[#others + 1] = member
    joined[#joined + 1] = member.name
  end
  return joined, left
end

local function addNews(state, joined, left)
  local news = state.memberNews or { joined = {}, left = {} }
  for _, name in ipairs(joined) do
    news.joined[#news.joined + 1] = name
  end
  for _, name in ipairs(left) do
    news.left[#news.left + 1] = name
  end
  while #news.joined > NEWS_NAMES do
    table.remove(news.joined, 1)
  end
  while #news.left > NEWS_NAMES do
    table.remove(news.left, 1)
  end
  state.memberNews = news
end

local function standings(clan, week, untilTime, playerPoints)
  local list = { { name = clan.name, points = clanWeekPoints(clan, week, untilTime, playerPoints), own = true } }
  for _, rival in ipairs(rivalClans(clan, week)) do
    list[#list + 1] = { name = rival.name, points = rivalPoints(rival, week, untilTime) }
  end
  table.sort(list, function(a, b)
    if a.points ~= b.points then
      return a.points > b.points
    end
    return a.name < b.name
  end)
  local place
  for i, entry in ipairs(list) do
    entry.place = i
    if entry.own then
      place = i
    end
  end
  return list, place
end

local function grantItems(state, items, names)
  local owned = composer.database.getItems() or {}
  for _, itemId in ipairs(items) do
    if not state.rewarded[tostring(itemId)] then
      state.rewarded[tostring(itemId)] = true
      if not owned[tostring(itemId)] then
        composer.database.addItem(itemId)
        local item = composer.storeConfig and composer.storeConfig.getItem and composer.storeConfig.getItem(itemId)
        names[#names + 1] = item and item.title or tostring(itemId)
      end
    end
  end
end

local function payChest(clan)
  local prize = M.chestPrize(clan.tier)
  composer.database.increaseMoney(prize.coins)
  composer.database.increaseGems(prize.gems)
  return prize
end

local function settle(state, now)
  local clan = state.clan
  if not clan then
    return false
  end
  local current = league.weekIndex(now)
  if clan.week >= current then
    return false
  end
  while clan.week < current do
    local week = clan.week
    local untilTime = league.weekEnd(week)
    local playerPoints = clan.playerWeekPoints or 0
    local _, place = standings(clan, week, untilTime, playerPoints)
    local points = clanWeekPoints(clan, week, untilTime, playerPoints)
    local oldTier = clan.tier
    if place <= M.PROMOTE_PLACES and clan.tier < M.ELITE then
      clan.tier = clan.tier + 1
    elseif place > M.LEAGUE_SIZE - M.DEMOTE_PLACES and clan.tier > M.WOOD then
      clan.tier = clan.tier - 1
    end
    local notice = { kind = "week", place = place, points = points, oldTier = oldTier, tier = clan.tier }
    if points >= M.chestGoal(oldTier) and not clan.chestClaimed then
      local prize = M.chestPrize(oldTier)
      composer.database.increaseMoney(prize.coins)
      composer.database.increaseGems(prize.gems)
      notice.chest = prize
    end
    local items = {}
    for tier = M.WOOD, clan.tier do
      grantItems(state, M.tierRewards(tier), items)
    end
    if #items > 0 then
      notice.items = items
    end
    state.notices[#state.notices + 1] = notice
    clan.lastWeek = { place = place, points = points, tier = oldTier }
    clan.playerWeekPoints = 0
    clan.playerWeekRaces = 0
    clan.chestClaimed = false
    clan.week = week + 1
  end
  while #state.notices > 3 do
    table.remove(state.notices, 1)
  end
  return true
end

local function advance(state, now)
  local clan = state.clan
  if not clan then
    return false
  end
  local changed = false
  local today = dayIndex(now)
  clan.churnDay = math.max(clan.churnDay or today, today - MAX_CATCH_UP_DAYS)
  while clan.churnDay < today do
    local day = clan.churnDay + 1
    if settle(state, day * DAY) then
      changed = true
    end
    local joined, left = churn(clan, day)
    if #joined > 0 or #left > 0 then
      addNews(state, joined, left)
    end
    clan.churnDay = day
    changed = true
  end
  if settle(state, now) then
    changed = true
  end
  return changed
end

function M.getState()
  local state = load()
  if advance(state, M.now()) then
    save(state)
  end
  return state
end

function M.inClan()
  return M.getState().clan ~= nil
end

function M.offers()
  local week = league.weekIndex(M.now())
  local random = seeded(week, 11)
  local offers = {}
  local taken = {}
  for i = 1, M.OFFER_COUNT do
    local name
    repeat
      name = M.clanName(random)
    until not taken[name]
    taken[name] = true
    local seed = random(1, 2147483646)
    local tier = random(M.WOOD, M.WOOD + 2)
    local size = random(6, M.MAX_MEMBERS - 1)
    local offer = { name = name, seed = seed, tier = tier, size = size }
    local members = newMembers(seed, size)
    offer.points = clanWeekPoints({ members = members, tier = tier }, week, M.now(), 0)
    offers[i] = offer
  end
  return offers
end

local function newClan(name, seed, tier, size, created)
  local now = M.now()
  local clan = {
    name = name,
    seed = seed,
    tier = tier,
    members = newMembers(seed, size),
    nextMember = size + 1,
    churnDay = dayIndex(now),
    week = league.weekIndex(now),
    joinedAt = now,
    playerWeekPoints = 0,
    playerWeekRaces = 0,
    playerTotal = 0,
    chestClaimed = false
  }
  if created then
    clan.createdAt = now
    clan.filling = true
    clan.playerRole = "Leader"
    for _, member in ipairs(clan.members) do
      member.role = "Member"
    end
  else
    clan.playerRole = "Member"
  end
  return clan
end

function M.join(offer)
  local state = load()
  state.memberNews = nil
  state.clan = newClan(offer.name, offer.seed, offer.tier, offer.size, false)
  save(state)
  return state.clan
end

function M.create(name)
  local state = load()
  state.memberNews = nil
  local seed = league.stringSeed(name .. tostring(M.now()))
  state.clan = newClan(name, seed, M.WOOD, STARTING_RECRUITS, true)
  save(state)
  return state.clan
end

function M.leave()
  local state = load()
  state.clan = nil
  state.memberNews = nil
  save(state)
end

function M.members()
  local state = M.getState()
  local clan = state.clan
  if not clan then
    return {}
  end
  local now = M.now()
  local list = { { name = playerName(), points = clan.playerWeekPoints or 0, role = clan.playerRole or "Member",
    isPlayer = true, total = clan.playerTotal or 0, races = clan.playerWeekRaces or 0 } }
  for _, member in ipairs(clan.members) do
    list[#list + 1] = { name = member.name, points = memberWeekPoints(member, clan.week, clan.tier, now),
      role = member.role, activity = member.activity }
  end
  table.sort(list, function(a, b)
    if a.points ~= b.points then
      return a.points > b.points
    end
    return a.isPlayer == true and b.isPlayer ~= true
  end)
  return list
end

function M.clanLeague()
  local state = M.getState()
  local clan = state.clan
  if not clan then
    return {}, nil
  end
  return standings(clan, clan.week, M.now(), clan.playerWeekPoints or 0)
end

function M.weekPoints()
  local state = M.getState()
  local clan = state.clan
  if not clan then
    return 0
  end
  return clanWeekPoints(clan, clan.week, M.now(), clan.playerWeekPoints or 0)
end

function M.canClaimChest()
  local state = M.getState()
  local clan = state.clan
  return clan ~= nil and not clan.chestClaimed and M.weekPoints() >= M.chestGoal(clan.tier)
end

function M.claimChest()
  if not M.canClaimChest() then
    return nil
  end
  local state = M.getState()
  local prize = payChest(state.clan)
  state.clan.chestClaimed = true
  save(state)
  return prize
end

function M.recordRace(place, teamResult)
  local state = M.getState()
  local clan = state.clan
  if not clan then
    return 0
  end
  local points
  if teamResult ~= nil then
    if teamResult == true then
      teamResult = "win"
    elseif teamResult == false then
      teamResult = "loss"
    end
    points = TEAM_POINTS[teamResult] or TEAM_POINTS.loss
  else
    points = RACE_POINTS[place] or RACE_POINTS[#RACE_POINTS]
  end
  clan.playerWeekPoints = (clan.playerWeekPoints or 0) + points
  clan.playerWeekRaces = (clan.playerWeekRaces or 0) + 1
  clan.playerTotal = (clan.playerTotal or 0) + points
  save(state)
  return points
end

function M.takeNotices()
  local state = M.getState()
  local notices = state.notices
  local news = state.memberNews
  if news and (#news.joined > 0 or #news.left > 0) then
    notices[#notices + 1] = { kind = "members", joined = news.joined, left = news.left }
  end
  if #notices > 0 then
    state.notices = {}
    state.memberNews = nil
    save(state)
  end
  return notices
end

function M.timeLeftText()
  return league.timeLeftText()
end

return M
