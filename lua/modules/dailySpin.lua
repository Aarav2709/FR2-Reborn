-- The prize wheel offline: one free spin every 24 hours, prizes drawn from
-- config/spin.json by their weights.
local composer = require("composer")
local M = {}

local SPIN_INTERVAL = 24 * 60 * 60
local LAST_SPIN_KEY = "lastFreeSpin"
-- Categories a mystery prize can come from.
local MYSTERY_LISTS = { "getAllHatsSortedOnPrice", "getAllFacewearSortedOnPrice", "getAllNecksSortedOnPrice",
  "getAllFeetSortedOnPrice", "getAllTrailsSortedOnPrice" }

local function lastSpinTime()
  return tonumber(composer.database.getValue(LAST_SPIN_KEY)) or 0
end

function M.hasFreeSpin()
  return os.time() - lastSpinTime() >= SPIN_INTERVAL
end

function M.secondsUntilFreeSpin()
  return math.max(0, SPIN_INTERVAL - (os.time() - lastSpinTime()))
end

-- "5h 12m" / "12m" until the next free spin.
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

-- A shop item the player doesn't own yet, for a mystery prize (nil when they own
-- everything).
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

-- The wheel's slots all have the same weight in config/spin.json (the server used to
-- pick the prize); offline the coin jackpot is kept rare.
local JACKPOT_COINS = 100000
local JACKPOT_WEIGHT_FACTOR = 0.08

local function prizeWeight(reward)
  local weight = reward.weight or 1
  if reward.type == "coins" and (tonumber(reward.value) or 0) >= JACKPOT_COINS then
    weight = weight * JACKPOT_WEIGHT_FACTOR
  end
  return weight
end

-- Draws a prize from the wheel's rewards by weight; returns the reward and the value
-- won (the item id for a mystery prize, or coins instead when nothing is left).
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
