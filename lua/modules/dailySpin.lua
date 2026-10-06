-- the prize wheel offline
local composer = require("composer")
local M = {}

local SPIN_INTERVAL = 24 * 60 * 60
local LAST_SPIN_KEY = "lastFreeSpin"
local MYSTERY_LISTS = { "getAllHatsSortedOnPrice", "getAllFacewearSortedOnPrice", "getAllNecksSortedOnPrice",
  "getAllFeetSortedOnPrice", "getAllTrailsSortedOnPrice", "getAllBackwearSortedOnPrice" }

local function lastSpinTime()
  return tonumber(composer.database.getValue(LAST_SPIN_KEY)) or 0
end

function M.hasFreeSpin()
  return os.time() - lastSpinTime() >= SPIN_INTERVAL
end

function M.secondsUntilFreeSpin()
  return math.max(0, SPIN_INTERVAL - (os.time() - lastSpinTime()))
end

function M.timeUntilFreeSpinText()
  local seconds = M.secondsUntilFreeSpin()
  local hours = math.floor(seconds / 3600)
  local minutes = math.floor(seconds % 3600 / 60)
  if hours > 0 then
    return string.format("%dh %dm", hours, minutes)
  end
  return string.format("%dm", math.max(1, minutes))
end

function M.useFreeSpin()
  composer.database.setValue(LAST_SPIN_KEY, os.time())
end

function M.pickMysteryItem()
  local owned = {}
  for key in pairs(composer.database.getItems() or {}) do
    owned[tostring(key)] = true
  end
  local candidates = {}
  for _, listName in ipairs(MYSTERY_LISTS) do
    local list = composer.storeConfig[listName] and composer.storeConfig[listName]() or {}
    for _, item in ipairs(list) do
      if item.key and tonumber(item.key) and tonumber(item.key) > 0 and item.price and not owned[tostring(item.key)] then
        candidates[#candidates + 1] = tonumber(item.key)
      end
    end
  end
  if #candidates == 0 then
    return nil
  end
  return candidates[math.random(1, #candidates)]
end

local JACKPOT_COINS = 100000
local JACKPOT_WEIGHT_FACTOR = 0.08

local function prizeWeight(reward)
  local weight = reward.weight or 1
  if reward.type == "coins" and (tonumber(reward.value) or 0) >= JACKPOT_COINS then
    weight = weight * JACKPOT_WEIGHT_FACTOR
  end
  return weight
end

function M.rollPrize(rewards)
  local total = 0
  for _, reward in ipairs(rewards) do
    total = total + prizeWeight(reward)
  end
  local pick = math.random() * total
  local chosen = rewards[#rewards]
  for _, reward in ipairs(rewards) do
    pick = pick - prizeWeight(reward)
    if pick <= 0 then
      chosen = reward
      break
    end
  end
  if chosen.type == "mystery" then
    local itemId = M.pickMysteryItem()
    if itemId then
      return chosen, itemId
    end
    for _, reward in ipairs(rewards) do
      if reward.type == "coins" then
        return reward, tonumber(reward.value)
      end
    end
  end
  return chosen, tonumber(chosen.value)
end

return M
