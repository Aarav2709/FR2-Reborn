local M = {}
local json = require("json")
local inAppCallback
local keyPrefix = "com.dirtybit.funrun2."
local preloadProductList = {}
local store
local composer = require("composer")
local storeType
local isSimulator = "simulator" == system.getInfo("environment")
local validProductsOnKeys = {}
local buyingProductId, setUpOldGoogleStore, currentItemId, currentTier

local function findPreloadProducts()
  local itemList = composer.storeConfig.getPreloadProductsForIAP()
  preloadProductList = {}
  for i = 1, #itemList do
    preloadProductList[#preloadProductList + 1] = keyPrefix .. itemList[i].key
  end
end

local function setInAppPurchaseCallback(callback)
  inAppCallback = callback
end

local function getDollarPrice(productTier)
  if productTier <= 50 then
    return productTier - 0.01
  else
    return 49.99 + (productTier - 50) * 5
  end
end

local function getLocalizedPrice(productTier, itemKey)
  if itemKey and validProductsOnKeys[keyPrefix .. itemKey] then
    return validProductsOnKeys[keyPrefix .. itemKey].localizedPrice
  else
    return "$ " .. getDollarPrice(productTier)
  end
end

local function buyThis(itemTier, itemId)
  local productId = keyPrefix .. itemId
  if storeType == 0 or not store then
    if inAppCallback then
      inAppCallback(composer.localized.get("Store not available"), true)
    end
  elseif store.isActive == false then
    if inAppCallback then
      inAppCallback(composer.localized.get("Store not available"), true)
    end
  elseif store.canMakePurchases == false then
    if inAppCallback then
      inAppCallback(composer.localized.get("Store not available"), true)
    end
  elseif productId then
    composer.data.iapCallActive = true
    currentItemId = itemId
    currentTier = itemTier
    if storeType == 1 then
      store.purchase({productId})
    elseif storeType == 2 then
      store.purchase(productId)
      buyingProductId = productId
    elseif storeType == 3 then
      store.purchase(productId)
    elseif storeType == 4 then
      store.purchase({productId})
    end
  end
end

local function restoreReceipts()
  local transactionDataList = composer.database.getReceipts()
  if 0 < #transactionDataList then
    local function validateReceiptWithDelay()
      local transactionDataElement = transactionDataList[#transactionDataList]

      composer.commHttps.validateReceipt(transactionDataElement.transactionData, transactionDataElement.storeType)
      table.remove(transactionDataList, #transactionDataList)
    end

    timer.performWithDelay(500, validateReceiptWithDelay, #transactionDataList)
    return true
  end
  return false
end

local function trackPurchase(storeType, productIdentifier)
  local validTier = false
  local amount = 0
  if validProductsOnKeys[productIdentifier] and currentTier then
    validTier = true
    amount = getDollarPrice(currentTier) * 100
  end
  if validTier and 0 < amount then
    composer.data.trackIAP = {
      event_id = "iap" .. storeType .. ":" .. productIdentifier,
      currency = "USD",
      amount = amount
    }
  end
end

local function loadProductsCallback(event)
  if event and event.products then
    for i = 1, #event.products do
      validProductsOnKeys[event.products[i].productIdentifier] = event.products[i]
    end
  end
  local iapDone = {name = "iapDone"}
  Runtime:dispatchEvent(iapDone)
end

local function loadSpecificProduct(key)
  local productKey = keyPrefix .. key
  if validProductsOnKeys[productKey] then
    return 2
  elseif isSimulator or (store and store.isActive) then
    if not isSimulator and store and store.canLoadProducts then
      store.loadProducts({productKey}, loadProductsCallback)
      return 1
    else
    end
  else
  end
  return 0
end

local function loadProducts()
  if isSimulator or (store and store.isActive) then
    if not isSimulator and store and store.canLoadProducts then
      store.loadProducts(preloadProductList, loadProductsCallback)
    else
      loadProductsCallback()
    end
  else
  end
end

local function initInAppPurchase()
  local function transactionCallback(event)
    local infoString

    local failed = true
    if event.transaction.state == "purchased" then
      infoString = composer.localized.get("VerifyingPurchase")
      failed = false
      if storeType ~= 2 then
        composer.commHttps.buyItem(event.transaction, storeType, currentItemId)
        infoString = composer.localized.get("Purchasing")
        failed = false
        composer.data.iapCallActive = false
        trackPurchase(storeType, event.transaction.productIdentifier)
      elseif storeType == 2 then
        local productId = event.transaction.productIdentifier
        local jsonObject = json.decode(event.transaction.originalJson)
        local state = jsonObject.purchaseState
        if tonumber(state) == 0 then
          store.consumePurchase(productId)
        else
          infoString = composer.localized.get("PurchaseFailed")
          failed = true
          composer.data.iapCallActive = false
        end
      end
    elseif event.transaction.state == "consumed" then
      local jsonObject = json.decode(event.transaction.originalJson)
      local state = jsonObject.purchaseState
      if tonumber(state) == 0 then
        composer.commHttps.buyItem(event.transaction, storeType, currentItemId)
        infoString = composer.localized.get("Purchasing")
        failed = false
        composer.data.iapCallActive = false
        trackPurchase(storeType, event.transaction.productIdentifier)
      else
        infoString = composer.localized.get("PurchaseFailed")
        composer.data.iapCallActive = false
      end
    elseif event.transaction.state == "cancelled" then
      infoString = ""
      composer.data.iapCallActive = false
    elseif event.transaction.state == "failed" then
      if storeType == 2 and buyingProductId and event.transaction.errorType == 7 then
        store.consumePurchase(buyingProductId)
        return
      end
      if storeType == 2 or storeType == 3 then
        if tostring(event.transaction.errorType) == "-1005" and storeType == 2 then
          infoString = ""
        else
          infoString = composer.localized.get("PurchaseFailed") .. tostring(event.transaction.errorString)
        end
      else
        infoString = composer.localized.get("PurchaseFailed") .. tostring(event.transaction.errorType) .. " - " .. tostring(event.transaction.errorString)
      end
      composer.data.iapCallActive = false
    else
      infoString = "UnknownError"
      composer.data.iapCallActive = false
    end
    if inAppCallback then
      inAppCallback(infoString, failed)
    end
    if store and store.finishTransaction then
      store.finishTransaction(event.transaction)
    end
  end

  store = require("store")
  if store.availableStores.apple then
    store.init("apple", transactionCallback)
    storeType = 1
  elseif system.getInfo("targetAppStore") == "amazon" then
    local success, amazonStore = pcall(require, "plugin.amazon.iap")
    if success then
      store = amazonStore
      store.init(transactionCallback)
      storeType = 3
    else
      storeType = 0
    end
  elseif store.availableStores.google then
    local success, googleStore = pcall(require, "plugin.google.iap.v3")
    if success then
      store = googleStore
      store.init("google", transactionCallback)
      storeType = 2
      if not store.isActive then
        store = require("store")
        store.init("google", transactionCallback)
        storeType = 4
      end
    else
      store = require("store")
      store.init("google", transactionCallback)
      storeType = 4
    end
  else
    storeType = 0
  end
  findPreloadProducts()
  loadProducts()
end

local function getStoreType()
  if storeType then
    return storeType
  end
  return 0
end

M.initInAppPurchase = initInAppPurchase
M.setInAppPurchaseCallback = setInAppPurchaseCallback
M.buyThis = buyThis
M.restoreReceipts = restoreReceipts
M.getStoreType = getStoreType
M.getLocalizedPrice = getLocalizedPrice
M.loadSpecificProduct = loadSpecificProduct
return M
