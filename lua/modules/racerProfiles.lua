-- Profiles for the league screen: the player's race stats (Quick Play races), and
-- made up but stable looks, league history and stats for the other racers.
local composer = require("composer")
local league = require("lua.modules.offlineLeague")
local quickPlayBots = require("lua.modules.quickPlayBots")
local M = {}

local STATS_KEY = "playerStats"
local STAT_NAMES = { "games", "wins", "kills", "deaths", "suicides" }
local HISTORY_WEEKS = 4
local GROUP_SIZE = 50

local function loadStats()
  local stats = composer.database.getTable(STATS_KEY)
  if type(stats) ~= "table" then
    stats = {}
  end
  for _, name in ipairs(STAT_NAMES) do
    stats[name] = tonumber(stats[name]) or 0
  end
  return stats
end

-- One finished race: place 1 is a win; kills, deaths and suicides as counted in the race.
function M.recordRace(place, kills, deaths, suicides)
  local stats = loadStats()
  stats.games = stats.games + 1
  if place == 1 then
    stats.wins = stats.wins + 1
  end
  stats.kills = stats.kills + (kills or 0)
  stats.deaths = stats.deaths + (deaths or 0)
  stats.suicides = stats.suicides + (suicides or 0)
  composer.database.setTable(STATS_KEY, stats)
end

function M.playerStats()
  return loadStats()
end

local function racerRandom(username, salt)
  return league.newRandom(league.stringSeed(tostring(username)) * 13 + salt)
end

-- Another racer's stats: the higher their league and rating, the more they have raced.
function M.racerStats(username, rating, tier)
  local random = racerRandom(username, 1)
  local experience = league.WOOD - (tier or league.WOOD)
  local games = math.floor((rating or 0) / 5) + random(25, 250) + experience * random(40, 160)
  local winRate = math.min(0.7, 0.12 + random() * 0.3 + experience * 0.025)
  return {
    games = games,
    wins = math.floor(games * winRate + 0.5),
    kills = math.floor(games * (0.4 + random() * 1.6) + 0.5),
    deaths = math.floor(games * (0.6 + random() * 1.3) + 0.5),
    suicides = math.floor(games * (0.04 + random() * 0.3) + 0.5)
  }
end

function M.racerAvatar(username)
  return quickPlayBots.randomAvatar(racerRandom(username, 2))
end

-- The last weeks of another racer, newest first, around the league they are in now.
function M.racerHistory(username, tier)
  local random = racerRandom(username, 3)
  local history = {}
  local weekTier = tier or league.WOOD
  for i = 1, random(0, HISTORY_WEEKS) do
    history[i] = { tier = weekTier, place = random(1, GROUP_SIZE) }
    local move = random(1, 6)
    if move == 1 and weekTier > league.ELITE then
      weekTier = weekTier - 1
    elseif move <= 3 and weekTier < league.WOOD then
      weekTier = weekTier + 1
    end
  end
  return history
end

-- "1234", "12.3k", "1.2M" (as the original's profile).
function M.formatCount(number)
  number = tonumber(number) or 0
  if number >= 1000000 then
    return (string.format("%.1f", number / 1000000):gsub("%.0$", "")) .. "M"
  elseif number >= 10000 then
    return (string.format("%.1f", number / 1000):gsub("%.0$", "")) .. "k"
  end
  return tostring(math.floor(number))
end

-- Share of races won: "52.3%".
function M.formatWinRate(stats)
  if not stats or (stats.games or 0) <= 0 then
    return "0%"
  end
  local percent = string.format("%.1f", stats.wins / stats.games * 100):gsub("%.0$", "")
  return percent .. "%"
end

return M
