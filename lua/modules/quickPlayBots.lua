-- racers for offline quick play
local composer = require("composer")
local league = require("lua.modules.offlineLeague")
local M = {}

local ITEM_CHANCES = {
  hat = 0.6,
  facewear = 0.45,
  neck = 0.4,
  trail = 0.3,
  feet = 0.4
}
local SKIN_CHANCE = 0.5
local BACKWEAR_CHANCE = 0.25
local POWERUP_SET_CHANCE = 0.15
local POWERUP_SET_COUNT = 7
local POWERUP_CATEGORIES = { "sawblade", "beartrap", "rocket", "shield", "balloon", "magnet", "gun", "speed", "punchbox" }

local function pick(list, random)
  if not list or #list == 0 then
    return nil
  end
  return list[random(#list)]
end

local function randomItem(list, chance, random)
  if random() > chance then
    return 0
  end
  local item = pick(list, random)
  return item and tonumber(item.key) or 0
end

function M.randomAvatar(random)
  random = random or math.random
  local store = composer.storeConfig
  local character = pick(store.getAllCharactersSortedOnPrice(), random)
  local characterId = character and tonumber(character.key) or 101
  local skin = 0
  local skins = store.getAllSkinsSortedOnPrice(characterId) or {}
  if random() < SKIN_CHANCE and #skins > 1 then
    skin = tonumber(skins[random(2, #skins)].key) or 0
  end
  return {
    characterId,
    skin,
    randomItem(store.getAllHatsSortedOnPrice(), ITEM_CHANCES.hat, random),
    randomItem(store.getAllFacewearSortedOnPrice(), ITEM_CHANCES.facewear, random),
    randomItem(store.getAllNecksSortedOnPrice(), ITEM_CHANCES.neck, random),
    randomItem(store.getAllTrailsSortedOnPrice(), ITEM_CHANCES.trail, random),
    randomItem(store.getAllFeetSortedOnPrice(), ITEM_CHANCES.feet, random)
  }
end

function M.randomBackwear(random)
  random = random or math.random
  if random() > BACKWEAR_CHANCE then
    return 0
  end
  local list = composer.storeConfig.getAllBackwearSortedOnPrice and composer.storeConfig.getAllBackwearSortedOnPrice() or {}
  local items = {}
  for _, item in ipairs(list) do
    if tonumber(item.key) and tonumber(item.key) > 0 then
      items[#items + 1] = tonumber(item.key)
    end
  end
  if #items == 0 then
    return 0
  end
  return items[random(#items)]
end

function M.powerupSet(setId)
  local skins = {}
  for _, category in ipairs(POWERUP_CATEGORIES) do
    for _, item in ipairs(composer.storeConfig.getAllPowerupsOfTypeSortedOnPrice(category) or {}) do
      local fullItem = composer.storeConfig.getItem(tonumber(item.key))
      if fullItem and tonumber(fullItem.set) == setId then
        skins[#skins + 1] = tonumber(item.key)
        break
      end
    end
  end
  return skins
end

function M.randomPowerupSetId()
  return math.random(1, POWERUP_SET_COUNT)
end

function M.plateFor(avatar)
  local store = composer.storeConfig
  local skin = tonumber(avatar and avatar[2]) or 0
  local item = store.getItem(skin > 0 and skin or (tonumber(avatar and avatar[1]) or 101))
  return math.max(1, math.min(5, tonumber(item and item.plate) or 1))
end

function M.createBots()
  local bots = {}
  local used = {}
  local playerLeague = league.getTier()
  local playerName = (composer.database.getPlayerInformation() or {}).username
  if playerName then
    used[playerName] = true
  end
  for i = 1, 3 do
    local name
    repeat
      name = league.randomName()
    until not used[name]
    used[name] = true
    local bot = {
      username = name,
      avatar = M.randomAvatar(),
      backwear = M.randomBackwear(),
      playerId = 200 + i,
      isBot = true,
      league = playerLeague
    }
    if math.random() < POWERUP_SET_CHANCE then
      bot.customPowerUps = M.powerupSet(M.randomPowerupSetId())
    end
    bots[i] = bot
  end
  return bots
end

return M
