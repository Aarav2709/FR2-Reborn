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
  print("")
  print("buyThis storeType ", storeType)
  print("productId ", productId)
  if storeType == 0 then
    if inAppCallback then
      inAppCallback(composer.localized.get("Store not available"), true)
    end
  elseif store.isActive == false then
    if inAppCallback then
      inAppCallback(composer.localized.get("Store not available"), true)
    end
  elseif store.canMakePurchases == false then
  elseif productId then
    composer.data.iapCallActive = true
    currentItemId = itemId
    currentTier = itemTier
    if storeType == 1 then
      store.purchase({productId})
    elseif storeType == 2 then
      print("Google v3")
      print(store)
      print(store.purchase)
      print("")
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
  composer.debugger.debugTable("iap", "loadProductsCallback :", event)
  if event and event.products then
    for i = 1, #event.products do
      validProductsOnKeys[event.products[i].productIdentifier] = event.products[i]
    end
    composer.debugger.debugTable("iap", "validProducts from store:", validProductsOnKeys)
  end
  local iapDone = {name = "iapDone"}
  Runtime:dispatchEvent(iapDone)
end

local function loadSpecificProduct(key)
  local productKey = keyPrefix .. key
  if validProductsOnKeys[productKey] then
    return 2
  elseif isSimulator or store.isActive then
    if not isSimulator and store.canLoadProducts then
      composer.debugger.debugPrint("iap", "canLoadProducts")
      store.loadProducts({productKey}, loadProductsCallback)
      return 1
    else
      composer.debugger.debugPrint("iap", "cantLoadProducts")
    end
  else
    print("WARNING: iap not supported on this device")
  end
  return 0
end

local function loadProducts()
  composer.debugger.debugPrint("iap", "loadProducts")
  if isSimulator or store.isActive then
    if not isSimulator and store.canLoadProducts then
      composer.debugger.debugPrint("iap", "canLoadProducts")
      store.loadProducts(preloadProductList, loadProductsCallback)
    else
      composer.debugger.debugPrint("iap", "cantLoadProducts")
      loadProductsCallback()
    end
  else
    print("WARNING: iap not supported on this device")
  end
end

local function initInAppPurchase()
  local function transactionCallback(event)
    local infoString
    
    local failed = true
    composer.debugger.debugTable("iap", "transactionCallback :", event)
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
          print("WARNING: state = ", state)
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
        print("WARNING: state = ", state)
        infoString = composer.localized.get("PurchaseFailed")
        composer.data.iapCallActive = false
      end
    elseif event.transaction.state == "cancelled" then
      infoString = ""
      composer.data.iapCallActive = false
    elseif event.transaction.state == "failed" then
      if storeType == 2 and buyingProductId and event.transaction.errorType == 7 then
        print("WARNING: already owns item, try to use it ", buyingProductId)
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
    store.finishTransaction(event.transaction)
  end
  
  store = require("store")
  if store.availableStores.apple then
    composer.debugger.debugPrint("iap", "Use Apple store")
    store.init("apple", transactionCallback)
    storeType = 1
  elseif system.getInfo("targetAppStore") == "amazon" then
    composer.debugger.debugPrint("iap", "Use Amazon store")
    store = require("plugin.amazon.iap")
    store.init(transactionCallback)
    storeType = 3
  elseif store.availableStores.google then
    composer.debugger.debugPrint("iap", "Use Google store")
    store = require("plugin.google.iap.v3")
    store.init("google", transactionCallback)
    print("Using Google's Android In-App Billing system.")
    storeType = 2
    if not store.isActive then
      composer.debugger.debugPrint("iap", "Use old Google store")
      store = require("store")
      store.init("google", transactionCallback)
      storeType = 4
    end
  else
    print("WARNING: iap no store supported on this device")
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
