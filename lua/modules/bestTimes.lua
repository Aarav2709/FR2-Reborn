-- The player's best finishing time on each map (Quick Play races), shown under the
-- map name at the start of a race and celebrated on the results screen.
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

-- Best time in milliseconds, or nil.
function M.get(mapId)
  return tonumber(load()[tostring(mapId)])
end

-- Records a finish; returns true when it is a new personal best.
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

-- "31.66 s"
function M.format(milliseconds)
  return string.format("%.2f s", milliseconds / 1000)
end

return M
