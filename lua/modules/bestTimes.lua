-- the player's best finishing time on each map (quick play)
local composer = require("composer")
local M = {}

local KEY = "bestTimes"

local function load()
  local times = composer.database.getTable(KEY)
  if type(times) ~= "table" then
    times = {}
  end
  return times
end

function M.get(mapId)
  return tonumber(load()[tostring(mapId)])
end

function M.record(mapId, milliseconds)
  milliseconds = tonumber(milliseconds)
  if not mapId or not milliseconds or milliseconds <= 0 then
    return false
  end
  local times = load()
  local key = tostring(mapId)
  local previous = tonumber(times[key])
  if previous and previous <= milliseconds then
    return false
  end
  times[key] = math.floor(milliseconds)
  composer.database.setTable(KEY, times)
  return true
end

function M.format(milliseconds)
  return string.format("%.2f s", milliseconds / 1000)
end

return M
