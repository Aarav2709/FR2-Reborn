-- The weekly leagues, played offline.
--
-- Fun Run 2 put every player in a weekly group of 50 in one of six leagues (0 Elite,
-- 1 Diamond, 2 Gold, 3 Silver, 4 Bronze, 5 Wood). Races move the league rating, the
-- place in the group decides the division (I-V) and so the prize at the end of the
-- week, and reaching a league's rating limit promotes you at once. Offline, the other
-- 49 players of a group are made up from the week and league, so a group stays the
-- same all week, and they collect rating over the week like real players would.
--
-- Rating per race: +15 for a win, +5 for 2nd, -5 for 3rd and -15 for 4th.
-- Promotion: Wood 20, Bronze 200, Silver 4000, Gold 10000 rating (config/awards.json
-- leagueThresholds); Diamond players finishing the week in division I go Elite.
-- Demotion: Silver, Gold and Diamond players finishing the week below 40th drop a league.
local composer = require("composer")
local M = {}

local STATE_KEY = "league"
local GROUP_SIZE = 50
local DAY = 24 * 60 * 60
local WEEK = 7 * DAY
-- 1970-01-01 was a Thursday, so weeks (starting Monday) begin 4 days after the epoch.
local WEEK_OFFSET = 4 * DAY
local PLACE_RATING = { 15, 5, -5, -15 }
-- First place of divisions I-V in a group.
local DIVISION_STARTS = { 1, 3, 7, 14, 25 }
local HISTORY_LENGTH = 6
-- How the other 49 players' ratings spread around the rating you joined the group with
-- (see groupMembers): range below and above, how steeply it falls off by rank, and the
-- share of the range the better players gain over the week.
local GROUP_SPREAD_BELOW = 120
local GROUP_SPREAD_ABOVE = 450
local GROUP_SPREAD_CURVE = 2.2
local GROUP_WEEK_GAIN = 0.35

M.ELITE = 0
M.DIAMOND = 1
M.WOOD = 5
M.GROUP_SIZE = GROUP_SIZE

-- Promotion types for the league popup (lua/overlays/leaguePromotion.lua).
M.PROMOTED = 0
M.DEMOTED = 1
M.PLACED = 2

local LEAGUE_NAMES = { [0] = "Elite League", "Diamond League", "Gold League", "Silver League", "Bronze League", "Wood League" }
-- Rating needed to leave each league upwards (as in awards.json).
local DEFAULT_THRESHOLDS = { [1] = 0, [2] = 10000, [3] = 4000, [4] = 200, [5] = 20 }
local DEFAULT_DEMOTION_PLACE = { [0] = 0, [1] = 40, [2] = 40, [3] = 40, [4] = 0, [5] = 0 }

local NAME_STARTS = { "Fox", "Bunny", "Bear", "Speedy", "Shadow", "Turbo", "Lucky", "Ninja", "Pixel", "Rocket",
  "Frosty", "Blaze", "Mighty", "Sneaky", "Happy", "Crazy", "Tiny", "Super", "Dark", "Golden", "Wild", "Fluffy",
  "Silent", "Jolly", "Cosmic", "Swift", "Brave", "Sly", "Fuzzy", "Epic", "Mega", "Little", "Royal", "Iron" }
local NAME_ENDS = { "Runner", "Paws", "Tail", "Dash", "Jumper", "Racer", "Hopper", "King", "Queen", "Master",
  "Legend", "Star", "Bolt", "Zoom", "Kid", "Pro", "Fang", "Claw", "Ears", "Feet", "Storm", "Flash", "Ace", "Boss" }

-- A small seeded random generator, so groups are the same every time they are built
-- without disturbing math.random.
local function newRandom(seed)
  local state = math.floor(math.abs(seed)) % 2147483646 + 1
  return function(low, high)
    state = state * 16807 % 2147483647
    local fraction = (state - 1) / 2147483646
    if low then
      if not high then
        low, high = 1, low
      end
      return low + math.floor(fraction * (high - low + 1))
    end
    return fraction
  end
end

local function stringSeed(text)
  local seed = 7
  for i = 1, #text do
    seed = (seed * 31 + text:byte(i)) % 2147483647
  end
  return seed
end

-- (Shared with the racer profiles, so a racer always looks and plays the same.)
M.newRandom = newRandom
M.stringSeed = stringSeed

local function awardsConfig()
  local awards = composer.awards
  if awards and awards.getConfig then
    return awards.getConfig() or {}
  end
  return {}
end

-- Seconds between local time and UTC, so weeks start on the player's Monday.
local function utcOffset(time)
  local localTable = os.date("*t", time)
  local utcTable = os.date("!*t", time)
  localTable.isdst = false
  return os.time(localTable) - os.time(utcTable)
end

function M.weekIndex(time)
  time = time or os.time()
  return math.floor((time + utcOffset(time) - WEEK_OFFSET) / WEEK)
end

-- When a week starts and ends, in os.time() seconds.
function M.weekStart(week)
  local approx = week * WEEK + WEEK_OFFSET
  return approx - utcOffset(approx)
end

function M.weekEnd(week)
  return M.weekStart(week + 1)
end

function M.secondsLeftInWeek()
  local now = os.time()
  return math.max(0, M.weekEnd(M.weekIndex(now)) - now)
end

-- "3d 4h 12m", as the original's league timer.
function M.timeLeftText()
  local seconds = M.secondsLeftInWeek()
  local minutes = math.floor(seconds / 60)
  local hours = math.floor(minutes / 60)
  local days = math.floor(hours / 24)
  return string.format("%dd %dh %dm", days, hours - days * 24, minutes - hours * 60)
end

function M.leagueName(tier)
  return LEAGUE_NAMES[tier] or LEAGUE_NAMES[M.WOOD]
end

-- Rating needed to be promoted out of a league (nil for Elite and Diamond).
function M.promotionRating(tier)
  if tier == nil or tier < 2 then
    return nil
  end
  local thresholds = awardsConfig().leagueThresholds
  local entry = thresholds and thresholds[tostring(tier)]
  return entry and tonumber(entry[1]) or DEFAULT_THRESHOLDS[tier]
end

-- Places below this one are demoted at the end of the week (0: nobody is).
function M.demotionPlace(tier)
  local places = awardsConfig().leagueDemotionPositionThresholds
  local place = places and tonumber(places[tostring(tier)])
  if place == nil then
    place = DEFAULT_DEMOTION_PLACE[tier] or 0
  end
  return place
end

-- "Reach 200 rating to advance to the next league" / "Finish in division I to advance".
function M.advancementText(tier)
  if tier == M.DIAMOND then
    return "Finish the week in division I to reach the Elite League"
  end
  local rating = M.promotionRating(tier)
  if rating then
    return "Reach " .. rating .. " rating to advance to the next league"
  end
  return nil
end

-- Division (1-5) of a place in the group.
function M.divisionForPlace(place)
  local division = 1
  for i = 1, #DIVISION_STARTS do
    if place >= DIVISION_STARTS[i] then
      division = i
    end
  end
  return division
end

function M.divisionStarts()
  return DIVISION_STARTS
end

-- The prizes of a league division: { {type = "SOFT_CURRENCY"|"HARD_CURRENCY"|"ITEM", amount, itemId}, ... }
function M.prizes(tier, division)
  local leaguePrizes = awardsConfig().leaguePrizes
  local tierPrizes = leaguePrizes and leaguePrizes[tostring(tier)]
  return tierPrizes and tierPrizes[division] or {}
end

local function defaultState()
  return {
    rating = 0,
    tier = M.WOOD,
    week = M.weekIndex(),
    placed = false,
    everPlaced = false,
    groupRating = 0,
    joined = os.time(),
    races = 0,
    wins = 0,
    history = {}
  }
end

local function load()
  local state = composer.database.getTable(STATE_KEY)
  if type(state) ~= "table" then
    state = defaultState()
  end
  state.rating = tonumber(state.rating) or 0
  state.tier = tonumber(state.tier) or M.WOOD
  state.week = tonumber(state.week) or M.weekIndex()
  state.groupRating = tonumber(state.groupRating) or state.rating
  state.joined = tonumber(state.joined) or os.time()
  state.races = tonumber(state.races) or 0
  state.wins = tonumber(state.wins) or 0
  state.history = state.history or {}
  return state
end

local function save(state)
  composer.database.setTable(STATE_KEY, state)
end

-- Lowest and highest rating a player of a league can have.
local function ratingBand(tier)
  local low = 0
  if tier < M.WOOD then
    low = M.promotionRating(tier + 1) or 0
  end
  local high = M.promotionRating(tier)
  if high then
    high = high - 1
  else
    high = math.huge
  end
  return low, high
end

-- The other 49 players of the group: names and how their rating moves over the week.
local function groupMembers(state)
  local random = newRandom(state.week * 7919 + state.tier * 104729 + stringSeed(tostring(state.joined)))
  local low, high = ratingBand(state.tier)
  local used = {}
  local members = {}
  for i = 1, GROUP_SIZE - 1 do
    local name
    repeat
      name = NAME_STARTS[random(#NAME_STARTS)] .. NAME_ENDS[random(#NAME_ENDS)]
      if random() < 0.45 then
        name = name .. random(1, 99)
      end
    until not used[name]
    used[name] = true
    members[i] = { username = name, low = low, high = high }
  end
  -- Ratings by rank, like a real group: a few players well ahead (division I), the
  -- gaps closing further down and many players near the bottom, so climbing a division
  -- takes a run of wins. The spread reaches from a little below the rating you joined
  -- with to a good way above it, kept inside the league's band.
  local spreadLow = math.max(low, state.groupRating - GROUP_SPREAD_BELOW)
  local spreadHigh = math.min(high - 1, state.groupRating + GROUP_SPREAD_ABOVE)
  if high == math.huge then
    spreadHigh = state.groupRating + GROUP_SPREAD_ABOVE
  end
  spreadHigh = math.max(spreadHigh, spreadLow)
  local spread = spreadHigh - spreadLow
  -- Room is left for the week's gains, so the best don't all end up at the league's limit.
  local startSpread = spread / (1 + GROUP_WEEK_GAIN * 1.3)
  for i, member in ipairs(members) do
    local rank = (i - 0.5 + (random() - 0.5) * 0.8) / #members
    local share = (1 - math.max(0, math.min(1, rank))) ^ GROUP_SPREAD_CURVE
    member.start = spreadLow + startSpread * share
    -- Over the week the better players gain more; a few drop a little.
    member.gain = startSpread * GROUP_WEEK_GAIN * (share + 0.15) * (random() * 1.2 - 0.15)
    member.spread = spread
  end
  return members
end

local function weekProgress(state)
  local finish = M.weekEnd(state.week)
  local total = math.max(1, finish - state.joined)
  return math.min(1, math.max(0, (os.time() - state.joined) / total))
end

-- On top of the week's trend each player's rating swings up and down (like real players
-- winning and losing races), changing every few minutes.
local SWING_STEP = 300
local function ratingSwing(member)
  local seed = stringSeed(member.username)
  local now = os.time()
  local minutes = now / 60
  local period = 25 + seed % 70
  -- Small next to the group's spread, so players move a little but keep their division.
  local spread = math.max(20, member.spread or 200)
  local swing = spread * (0.008 + seed % 25 / 1000)
  local wave = math.sin(minutes / period * 2 * math.pi + seed % 628 / 100) * swing
  local step = math.floor(now / SWING_STEP)
  local stepRandom = newRandom(seed * 31 + step)
  -- (Nearby seeds start out alike; a few draws spread them apart.)
  stepRandom()
  stepRandom()
  stepRandom()
  return wave + (stepRandom() - 0.5) * spread * 0.02
end

local function memberRating(member, progress)
  local rating = math.floor(member.start + member.gain * progress + ratingSwing(member) + 0.5)
  return math.max(member.low, math.min(member.high, math.max(0, rating)))
end

-- The group list, best first: { {username, rating, isPlayer}, ... } and the player's place.
local function buildGroup(state, progress)
  local members = groupMembers(state)
  local list = {}
  for i = 1, #members do
    list[i] = { username = members[i].username, rating = memberRating(members[i], progress), order = i }
  end
  local playerInfo = composer.database.getPlayerInformation() or {}
  list[#list + 1] = { username = playerInfo.username or "You", rating = state.rating, isPlayer = true, order = 0 }
  table.sort(list, function(a, b)
    if a.rating ~= b.rating then
      return a.rating > b.rating
    end
    return a.order < b.order
  end)
  local place = 1
  for i = 1, #list do
    if list[i].isPlayer then
      place = i
    end
  end
  return list, place
end

local function addHistory(state, place)
  table.insert(state.history, 1, { week = state.week, tier = state.tier, place = place })
  while #state.history > HISTORY_LENGTH do
    table.remove(state.history)
  end
end

local function joinGroup(state)
  state.groupRating = state.rating
  state.joined = os.time()
end

-- Ends the weeks that are over: prizes, demotion and promotion to Elite. Results are
-- queued for the main menu (see M.takePendingPopups).
local function settleWeeks(state)
  local currentWeek = M.weekIndex()
  if state.week >= currentWeek then
    return false
  end
  if state.placed then
    local _, place = buildGroup(state, 1)
    local division = M.divisionForPlace(place)
    local prizes = M.prizes(state.tier, division)
    addHistory(state, place)
    if #prizes > 0 then
      state.pendingPrize = { tier = state.tier, place = place, division = division, prizes = prizes }
      M.givePrizes(prizes)
    end
    local newTier = state.tier
    local demotionPlace = M.demotionPlace(state.tier)
    if demotionPlace > 0 and place > demotionPlace and state.tier < M.WOOD then
      newTier = state.tier + 1
      state.pendingPromotion = { league = newTier, promotionType = M.DEMOTED }
    elseif state.tier == M.DIAMOND and division == 1 then
      newTier = M.ELITE
      state.pendingPromotion = { league = newTier, promotionType = M.PROMOTED }
    end
    state.tier = newTier
  end
  state.week = currentWeek
  state.placed = false
  state.races = 0
  state.wins = 0
  joinGroup(state)
  return true
end

-- Pays out league prizes (coins, gems and items).
function M.givePrizes(prizes)
  for _, prize in ipairs(prizes or {}) do
    local amount = tonumber(prize.amount) or 0
    if prize.type == "SOFT_CURRENCY" then
      composer.database.increaseMoney(amount)
    elseif prize.type == "HARD_CURRENCY" then
      composer.database.increaseGems(amount)
    elseif prize.type == "ITEM" and prize.itemId then
      local owned = composer.database.getItems() or {}
      if not owned[tostring(prize.itemId)] then
        composer.database.addItem(prize.itemId)
      end
    end
  end
end

-- The league state for screens, after settling finished weeks.
function M.getState()
  local state = load()
  if settleWeeks(state) then
    save(state)
  end
  return state
end

function M.getTier()
  return M.getState().tier
end

function M.getRating()
  return M.getState().rating
end

function M.isPlaced()
  return M.getState().placed
end

function M.hasEverPlayed()
  return M.getState().everPlaced == true
end

-- The group as shown in the league screen, and the player's place in it.
function M.getGroup()
  local state = M.getState()
  return buildGroup(state, weekProgress(state))
end

-- A race result: moves the rating and promotes the player when they pass their
-- league's limit. Returns the new rating, the change, the league and, when the
-- league changed, a popup for the results screen.
function M.recordRace(place)
  local state = M.getState()
  local delta = PLACE_RATING[place] or PLACE_RATING[#PLACE_RATING]
  local oldRating = state.rating
  state.rating = math.max(0, state.rating + delta)
  delta = state.rating - oldRating
  if not state.placed then
    state.placed = true
    joinGroup(state)
    state.groupRating = oldRating
  end
  state.everPlaced = true
  state.races = state.races + 1
  if place == 1 then
    state.wins = state.wins + 1
  end
  local popup
  local limit = M.promotionRating(state.tier)
  while limit and state.rating >= limit and state.tier > M.DIAMOND do
    state.tier = state.tier - 1
    popup = { league = state.tier, promotionType = M.PROMOTED }
    limit = M.promotionRating(state.tier)
  end
  if popup then
    -- A new league means a new group, of players around your rating now.
    joinGroup(state)
  end
  save(state)
  return { rating = state.rating, delta = delta, tier = state.tier, popup = popup }
end

-- Weekly prize and league change popups waiting for the main menu (each is handed
-- out once).
function M.takePendingPopups()
  local state = M.getState()
  local prize, promotion = state.pendingPrize, state.pendingPromotion
  if prize or promotion then
    state.pendingPrize = nil
    state.pendingPromotion = nil
    save(state)
  end
  return prize, promotion
end

-- Leaving a Quick Play race before the finish costs league rating.
local LEAVE_PENALTY = 10
local RACE_IN_PROGRESS_KEY = "rankedRaceInProgress"

function M.applyLeavePenalty()
  local state = M.getState()
  local oldRating = state.rating
  state.rating = math.max(0, state.rating - LEAVE_PENALTY)
  save(state)
  return state.rating - oldRating
end

-- A Quick Play race is marked while it runs, so quitting the app mid-race is caught
-- (and costs the same as leaving) the next time the game starts.
function M.startRankedRace()
  composer.database.setValue(RACE_IN_PROGRESS_KEY, 1)
end

function M.endRankedRace()
  composer.database.setValue(RACE_IN_PROGRESS_KEY, 0)
end

-- Penalises a race that was abandoned by closing the app; returns the rating change.
function M.settleAbandonedRace()
  if tonumber(composer.database.getValue(RACE_IN_PROGRESS_KEY)) == 1 then
    M.endRankedRace()
    return M.applyLeavePenalty()
  end
  return 0
end

-- A made up player name ("FoxDash27") for bots and group members.
function M.randomName(random)
  random = random or math.random
  local name = NAME_STARTS[random(#NAME_STARTS)] .. NAME_ENDS[random(#NAME_ENDS)]
  if random() < 0.45 then
    name = name .. random(1, 99)
  end
  return name
end

function M.reset()
  save(defaultState())
end

return M
