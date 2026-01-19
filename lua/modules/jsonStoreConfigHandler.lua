local M = {}
local configInput
local jsonParser = require("lua.modules.jsonParser")
local composer = require("composer")

function M.readFromFile()
  configInput = jsonParser.getJsonFromFile("config/storeConfig.json")
end

function M.isFileCorrupt()
  if configInput == nil then
    return true
  end
  return false
end

local function reloadConfigIfNil()
  if M.isFileCorrupt() then
    print("WARNING: Reloading storeConfig File.")
    M.readFromFile()
  end
end

local function getProductMap(item)
  reloadConfigIfNil()
  local hashmap
  if item < 200 then
    hashmap = configInput.characters
  elseif item < 300 then
    hashmap = configInput.skins
  elseif item < 400 then
    hashmap = configInput.hats
  elseif item < 500 then
    hashmap = configInput.facewear
  elseif item < 600 then
    hashmap = configInput.necks
  elseif item < 700 then
    hashmap = configInput.trails
  elseif item < 800 then
    hashmap = configInput.feet
  elseif 1000 < item and item < 1100 then
    hashmap = configInput.boosts
  else
    print("ERROR: No hashmap for id", item)
    return nil
  end
  return hashmap
end

function M.getItemCategory(item)
  if item < 300 then
    return "avatars"
  elseif item < 400 then
    return "hat"
  elseif item < 500 then
    return "facewear"
  elseif item < 600 then
    return "neck"
  elseif item < 700 then
    return "trail"
  elseif item < 800 then
    return "shoes"
  elseif 1000 < item and item < 1100 then
    return "boosts"
  else
    print("ERROR: No category for id", item)
    return nil
  end
end

local function sortOnPrice(newList)
  local function sortFunction(a, b)
    if a.price and b.price then
      return a.price < b.price
    else
      return false
    end
  end
  
  table.sort(newList, sortFunction)
  return newList
end

local function shouldAddItem(item)
  if item then
    if item.hidden then
      return false
    elseif item.minBuild and tonumber(item.minBuild) > tonumber(composer.config.serverVersion) then
      return false
    end
  else
    return false
  end
  return true
end

local function addSalesInfo(item)
  local currentTime = system.getTimer() / 1000
  if item and composer.database.salesItem then
    for key, value in pairs(composer.database.salesItem) do
      if type(value) == "table" and tonumber(value.i) == tonumber(item.key) then
        local timeLeft = value.y - currentTime
        if 0 < timeLeft then
          item.saleKey = value._id
          item.salePrice = value.p
          item.saleTier = value.t
          item.saleTime = timeLeft
        else
          item.saleKey = nil
          item.salePrice = nil
          item.saleTier = nil
          item.saleTime = nil
        end
      end
    end
  end
end

local function addSeasonalInfo(item)
  local currentTime = system.getTimer() / 1000
  if item and composer.database.seasonalItem then
    for key, value in pairs(composer.database.seasonalItem) do
      if type(value) == "table" and tonumber(value.i) == tonumber(item.key) then
        local timeLeft = value.y - currentTime
        if 0 < timeLeft then
          item.seasonalActive = true
          item.saleTime = timeLeft
        else
          item.seasonalActive = nil
        end
      end
    end
  end
end

local function addNoneItem(list)
  list[1] = {}
  list[1].price = 0
  list[1].preOwned = true
  list[1].key = 0
  list[1].title = "none"
  list[1].plate = 1
end

local function addBoostItem(list)
  local boostList = {}
  if configInput.boosts then
    for key, value in pairs(configInput.boosts) do
      if shouldAddItem(value) then
        boostList[#boostList + 1] = value
        boostList[#boostList].key = key
        boostList[#boostList].imagePath = "images/gui/market/items/boosts/" .. key .. ".png"
        addSalesInfo(boostList[#boostList])
        addSeasonalInfo(boostList[#boostList])
      end
    end
  end
  boostList = sortOnPrice(boostList)
  for i = 1, #boostList do
    list[#list + 1] = boostList[i]
  end
end

M.addBoostItem = addBoostItem

function M.getSaleItems(otherList)
  reloadConfigIfNil()
  local currentTime = system.getTimer() / 1000
  local list = {}
  if otherList then
    list = otherList
  end
  local boughtItems = composer.database.getItems()
  if composer.database.salesItem then
    for key, value in pairs(composer.database.salesItem) do
      local item = M.getItem(value.i)
      if shouldAddItem(item) then
        local timeLeft = value.y - currentTime
        if M.getItemCategory(value.i) == "boosts" then
        elseif item and 0 < timeLeft and not boughtItems[tostring(value.i)] then
          item.saleKey = value._id
          item.salePrice = value.p
          item.saleTier = value.t
          item.saleTime = timeLeft
          item.key = value.i
          local itemType = M.getItemCategory(value.i)
          item.imagePath = "images/gui/market/items/" .. itemType .. "/" .. value.i .. ".png"
          if itemType == "avatars" then
            item.itemType = 1
          elseif itemType == "skins" then
            item.itemType = 2
          elseif itemType == "hat" then
            item.itemType = 3
          elseif itemType == "facewear" then
            item.itemType = 4
          elseif itemType == "neck" then
            item.itemType = 5
          elseif itemType == "trail" then
            item.itemType = 6
          elseif itemType == "shoes" then
            item.itemType = 7
          end
          list[#list + 1] = item
        end
      end
    end
  end
  return list
end

function M.getPreloadProductsForIAP()
  reloadConfigIfNil()
  local list = {}
  
  local function isIAPItem(value)
    if shouldAddItem(value) and value.price == nil and value.tier then
      return true
    end
    return false
  end
  
  for key, value in pairs(configInput.characters) do
    if isIAPItem(value) then
      list[#list + 1] = value
      list[#list].key = key
    end
  end
  for key, value in pairs(configInput.skins) do
    if isIAPItem(value) then
      list[#list + 1] = value
      list[#list].key = key
    end
  end
  for key, value in pairs(configInput.hats) do
    if isIAPItem(value) then
      list[#list + 1] = value
      list[#list].key = key
    end
  end
  for key, value in pairs(configInput.facewear) do
    if isIAPItem(value) then
      list[#list + 1] = value
      list[#list].key = key
    end
  end
  for key, value in pairs(configInput.necks) do
    if isIAPItem(value) then
      list[#list + 1] = value
      list[#list].key = key
    end
  end
  for key, value in pairs(configInput.trails) do
    if isIAPItem(value) then
      list[#list + 1] = value
      list[#list].key = key
    end
  end
  for key, value in pairs(configInput.feet) do
    if isIAPItem(value) then
      list[#list + 1] = value
      list[#list].key = key
    end
  end
  if configInput.boosts then
    for key, value in pairs(configInput.boosts) do
      if isIAPItem(value) then
        list[#list + 1] = value
        list[#list].key = key
      end
    end
  end
  return list
end

function M.getAllSaleItemSortedOnPrice()
  reloadConfigIfNil()
  local currentTime = system.getTimer() / 1000
  local list = {}
  addNoneItem(list)
  M.getSaleItems(list)
  list = sortOnPrice(list)
  addBoostItem(list)
  return list
end

function M.getAllCharactersSortedOnPrice()
  reloadConfigIfNil()
  local list = {}
  for key, value in pairs(configInput.characters) do
    if shouldAddItem(value) then
      list[#list + 1] = value
      list[#list].key = key
      list[#list].imagePath = "images/gui/market/items/avatars/" .. key .. ".png"
      addSalesInfo(list[#list])
      addSeasonalInfo(list[#list])
    end
  end
  return sortOnPrice(list)
end

function M.getAllSkinsSortedOnPrice(charKey)
  local list = {}
  charKey = tonumber(charKey)
  for key, value in pairs(configInput.skins) do
    if tonumber(value.characterId) == tonumber(charKey) and shouldAddItem(value) then
      list[#list + 1] = value
      list[#list].key = key
      list[#list].imagePath = "images/gui/market/items/avatars/" .. key .. ".png"
      addSalesInfo(list[#list])
      addSeasonalInfo(list[#list])
    end
  end
  list = sortOnPrice(list)
  local baseSkin = M.getItem(charKey)
  baseSkin.key = charKey
  baseSkin.imagePath = "images/gui/market/items/avatars/" .. charKey .. ".png"
  baseSkin.skinId = 0
  table.insert(list, 1, baseSkin)
  return list
end

function M.getAllHatsSortedOnPrice()
  reloadConfigIfNil()
  local list = {}
  addNoneItem(list)
  for key, value in pairs(configInput.hats) do
    if shouldAddItem(value) then
      list[#list + 1] = value
      list[#list].key = key
      list[#list].imagePath = "images/gui/market/items/hat/" .. key .. ".png"
      addSalesInfo(list[#list])
      addSeasonalInfo(list[#list])
    end
  end
  return sortOnPrice(list)
end

function M.getAllFacewearSortedOnPrice()
  reloadConfigIfNil()
  local list = {}
  addNoneItem(list)
  for key, value in pairs(configInput.facewear) do
    if shouldAddItem(value) then
      list[#list + 1] = value
      list[#list].key = key
      list[#list].imagePath = "images/gui/market/items/facewear/" .. key .. ".png"
      addSalesInfo(list[#list])
      addSeasonalInfo(list[#list])
    end
  end
  return sortOnPrice(list)
end

function M.getAllNecksSortedOnPrice()
  reloadConfigIfNil()
  local list = {}
  addNoneItem(list)
  for key, value in pairs(configInput.necks) do
    if shouldAddItem(value) then
      list[#list + 1] = value
      list[#list].key = key
      list[#list].imagePath = "images/gui/market/items/neck/" .. key .. ".png"
      addSalesInfo(list[#list])
      addSeasonalInfo(list[#list])
    end
  end
  return sortOnPrice(list)
end

function M.getAllTrailsSortedOnPrice()
  reloadConfigIfNil()
  local list = {}
  addNoneItem(list)
  for key, value in pairs(configInput.trails) do
    if shouldAddItem(value) then
      list[#list + 1] = value
      list[#list].key = key
      list[#list].imagePath = "images/gui/market/items/trail/" .. key .. ".png"
      addSalesInfo(list[#list])
      addSeasonalInfo(list[#list])
    end
  end
  return sortOnPrice(list)
end

function M.getAllFeetSortedOnPrice()
  reloadConfigIfNil()
  local list = {}
  addNoneItem(list)
  for key, value in pairs(configInput.feet) do
    if shouldAddItem(value) then
      list[#list + 1] = value
      list[#list].key = key
      list[#list].imagePath = "images/gui/market/items/shoes/" .. key .. ".png"
      addSalesInfo(list[#list])
      addSeasonalInfo(list[#list])
    end
  end
  return sortOnPrice(list)
end

function M.getAllHats()
  reloadConfigIfNil()
  return configInput.hats
end

function M.getItem(itemId)
  reloadConfigIfNil()
  local hashmap = getProductMap(itemId)
  if hashmap then
    for key, value in pairs(hashmap) do
      if tonumber(key) == tonumber(itemId) and value then
        return value
      end
    end
  end
  return false
end

function M.getPlateId(monsterData)
  local monsterId = monsterData.a
  local skinId = monsterData.b
  if 0 < skinId then
    local skin = M.getItem(skinId)
    if skin then
      return skin.plate
    end
  else
    local monster = M.getItem(monsterId)
    if monster then
      return monster.plate
    end
  end
  return 1
end

function M.getCoinPrice(itemId)
  reloadConfigIfNil()
  if composer.database.salesItem then
    for key, value in pairs(composer.database.salesItem) do
      if type(value) == "table" and tonumber(value.i) == tonumber(itemId) then
        return value.p
      end
    end
  end
  local item = M.getItem(itemId)
  if item and item.price then
    return item.price
  end
  return false
end

function M.getTier(itemId)
  reloadConfigIfNil()
  local item = M.getItem(itemId)
  if item and item.tier then
    return item.tier
  end
  return false
end

function M.isBoard(itemId)
  reloadConfigIfNil()
  local item = M.getItem(tonumber(itemId))
  if item and item.board then
    return true
  end
  return false
end

function M.getUsernameChangePrice()
  reloadConfigIfNil()
  if configInput and configInput.name then
    return configInput.name.price
  end
  return 1000
end

function M.getRunningType(monsterId)
  reloadConfigIfNil()
  if monsterId then
    local item = M.getItem(tonumber(monsterId))
    if item and item.runType then
      return item.runType
    end
  end
  return 1
end

function M.isThereNewItems(itemType)
  reloadConfigIfNil()
  local lastSeenVersion = composer.database.getMarketItemId()
  if itemType then
    local hashmap = getProductMap(itemType)
    if hashmap then
      for key, value in pairs(hashmap) do
        if value and value.minBuild and lastSeenVersion < value.minBuild then
          print("found new item in ", itemType)
          return true
        end
      end
    end
  end
  return false
end

return M
