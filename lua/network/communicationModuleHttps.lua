local composer = require("composer")
local httpsFormat = require("lua.network.httpsMessageFormat")
local httpsClient = require("lua.network.httpsClient")
local base64 = require("lua.iap.base64")
local validatePurchase = require("lua.iap.validatePurchase")
local tempTable
local C = {}

function C.callback()
  print("WARNING: Https callback not sat")
end

function C.setCallback(callback)
  C.callback = callback
end

local function httpsReceiveFunction(data)
  if data.r then
    print("WARNING: got error in commHttps type: ", data.r)
  end
  if data.m == httpsFormat.register() then
    if data.r then
      composer.cleanOldOverlay()
      if C.callback then
        C.callback(data)
      end
      return
    end
    composer.database.setPlayerInformation(data.u, data.t, data.p, data.a)
    composer.database.setAvatarData()
    composer.database.setOnboardingPartDone(1)
    if isSimulator and composer.config.bot then
    elseif data.ab then
      composer.config.abTest = data.ab
      if composer.config.abTest == "A" then
      else
      end
      if composer.analytics.setNewBuildVersion then
        composer.analytics.setNewBuildVersion(composer.config.fullVersion .. composer.config.abTest)
      end
    end
    composer.hideOverlay()
    composer.gotoScene("lua.scenes.loadingScene")
  elseif data.m == httpsFormat.forgotPassword() then
    if C.callback then
      C.callback(data)
    end
  elseif data.m == httpsFormat.maintenance() then
    if data.a then
      composer.createCustomOverlay(98, nil, data.a)
    end
  elseif data.m == httpsFormat.changeUsername() then
    if data.r then
      if data.r == 14 then
        composer.createCustomOverlay(10)
        composer.analytics.newEvent("design", {
          event_id = "rename:invalidUsername",
          area = composer.config.fullVersion
        })
      elseif data.r == 15 then
        composer.createCustomOverlay(21)
        composer.analytics.newEvent("design", {
          event_id = "rename:sameUsername",
          area = composer.config.fullVersion
        })
      elseif data.r == 16 then
        composer.createCustomOverlay(22)
        composer.analytics.newEvent("design", {
          event_id = "rename:cantAfford",
          area = composer.config.fullVersion
        })
      elseif data.r == 70 then
        composer.createCustomOverlay(21)
        composer.analytics.newEvent("design", {
          event_id = "rename:bannedName",
          area = composer.config.fullVersion
        })
      end
      return
    end
    if data.u and data.t then
      composer.database.updatePlayerInfo(data.u, data.t)
    end
    local newMoney = composer.database.getMoney() - composer.storeConfig.getUsernameChangePrice()
    composer.database.setMoney(newMoney)
    composer.analytics.newEvent("design", {
      event_id = "rename:success",
      area = composer.config.fullVersion
    })
    if C.callback then
      C.callback(data)
    end
  elseif data.m == httpsFormat.changeEmail() then
    if C.callback then
      C.callback(data)
    end
  elseif data.m == httpsFormat.loginWithEmail() then
    if data.r then
      if C.callback then
        C.callback(data)
      end
      return
    end
    composer.database.setPlayerIdAndToken(data.p, data.a)
    composer.cleanLogin = true
    composer.analytics.newEvent("design", {
      event_id = "continueLogin:success",
      area = composer.config.fullVersion
    })
    composer.config.loginMessage = true
    composer.gotoScene("lua.scenes.loadingScene")
    composer.database.setOnboardingPartDone(1)
  elseif data.m == httpsFormat.getUserOnDeviceId() then
    if data.r then
      return
    end
    if data.u then
      local options = {
        isModal = true,
        params = {
          username = data.u
        }
      }
      composer.showOverlay("lua.overlays.loginUserWithDeviceId", options)
    end
  elseif data.m == httpsFormat.loginWithDeviceId() then
    if data.r then
      if C.callback then
        C.callback(data)
      end
      return
    end
    composer.database.setPlayerIdAndToken(data.p, data.a)
    composer.config.loginMessage = true
    composer.gotoScene("lua.scenes.loadingScene")
    composer.database.setOnboardingPartDone(1)
  elseif data.m == httpsFormat.loginWithFacebook() then
    if data.r then
      if C.callback then
        C.callback(data)
      end
      return
    end
    composer.database.setPlayerIdAndToken(data.p, data.a)
    composer.facebookLogin = true
    composer.config.loginMessage = true
    composer.gotoScene("lua.scenes.loadingScene")
    composer.database.setOnboardingPartDone(1)
  elseif data.m == httpsFormat.registerFacebook() then
    if data.r then
      if data.r == 20 then
        composer.createCustomOverlay(10)
      elseif data.r == 21 then
        composer.createCustomOverlay(26)
      elseif data.r == 22 then
        composer.createCustomOverlay(16)
      elseif data.r == 23 then
        composer.createCustomOverlay(27)
      end
      return
    end
    composer.database.setFacebookId(data.f)
    composer.facebook.getFacebookFriends()
    if C.callback then
      C.callback(data)
    end
  elseif data.m == httpsFormat.buyCrystalIOS() or data.m == httpsFormat.buyCrystalGoogle() or data.m == httpsFormat.buyCrystalAmazon() then
    if data.r then
      print("WARNING: buy item failed ", data.x)
      if C.callback then
        C.callback(data)
      end
      return
    end
    if data.x then
      composer.debugger.debugPrint("network", "purchaseItem with cash ", data.x)
      if tonumber(data.x) ~= 1002 then
        composer.database.addItem(data.x)
      end
    end
    if C.callback then
      C.callback(data)
    end
    if composer.data.trackIAP then
      composer.analytics.newEvent("business", composer.data.trackIAP)
      composer.data.trackIAP = nil
    end
  else
    C.callback(data)
  end
  if data.token then
    composer.playerInfo = composer.database.getPlayerInformation()
    C.callback(data)
  end
  tempTable = nil
end

function C.sendRegisterMessage(username)
  local data = {}
  data.m = httpsFormat.register()
  data.d = system.getInfo("deviceID")
  data.p = composer.config.platform
  data.i = system.getInfo("model")
  data.a = system.getInfo("architectureInfo")
  data.u = username
  data.l = composer.localized.language
  data.v = composer.config.fullVersion
  httpsClient.send(data)
end

function C.changeUsername(username)
  local playerInfo = composer.database.getPlayerInformation()
  local data = {}
  data.m = httpsFormat.changeUsername()
  data.a = playerInfo.token
  data.p = playerInfo.playerId
  data.u = username
  httpsClient.send(data)
end

function C.changeEmail(newEmail, newPassword)
  local playerInfo = composer.database.getPlayerInformation()
  local data = {}
  data.m = httpsFormat.changeEmail()
  data.e = newEmail
  data.w = newPassword
  data.a = playerInfo.token
  data.p = playerInfo.playerId
  httpsClient.send(data)
end

function C.loginWithEmail(email, password)
  local data = {}
  data.m = httpsFormat.loginWithEmail()
  data.e = email
  data.w = password
  data.d = system.getInfo("deviceID")
  httpsClient.send(data)
end

function C.forgotPassword(email)
  local data = {}
  data.m = httpsFormat.forgotPassword()
  data.e = email
  data.d = system.getInfo("deviceID")
  httpsClient.send(data)
end

function C.getUserOnDeviceId()
  local data = {}
  data.m = httpsFormat.getUserOnDeviceId()
  data.d = system.getInfo("deviceID")
  httpsClient.send(data)
end

function C.loginWithDeviceId()
  local data = {}
  data.m = httpsFormat.loginWithDeviceId()
  data.d = system.getInfo("deviceID")
  httpsClient.send(data)
end

function C.loginWithFacebook(token, id)
  local data = {}
  data.m = httpsFormat.loginWithFacebook()
  data.t = token
  data.f = id
  data.d = system.getInfo("deviceID")
  httpsClient.send(data)
end

function C.registerFacebook(token, id)
  local playerInfo = composer.database.getPlayerInformation()
  local data = {}
  data.m = httpsFormat.registerFacebook()
  data.a = playerInfo.token
  data.p = playerInfo.playerId
  data.t = token
  data.f = id
  httpsClient.send(data)
end

local function prepareAppleReceipt(receipt)
  receipt = receipt:sub(2, -2)
  receipt = receipt:gsub(" ", "")
  local ascii = ""
  local l = receipt:len()
  for i = 1, l, 2 do
    local hex = receipt:sub(i, i + 1)
    local dec = tonumber(hex, 16)
    if dec then
      local char = string.char(dec)
      ascii = ascii .. char
    end
  end
  local b64encode = base64.encode(ascii)
  return b64encode
end

function C.validateReceipt(transactionData, storeType)
  if storeType == 1 then
    validatePurchase.validateApple({
      encodedReceipt = transactionData.receipt,
      productId = transactionData.productId,
      listener = httpsReceiveFunction,
      testing = false,
      itemId = transactionData.itemId
    })
  elseif storeType == 2 then
    validatePurchase.validateGoogle({
      receipt = transactionData.receipt,
      productId = transactionData.productId,
      encodedSignature = transactionData.encodedSignature,
      listener = httpsReceiveFunction,
      testing = false,
      itemId = transactionData.itemId
    })
  elseif storeType == 3 then
    validatePurchase.validateAmazon({
      receipt = transactionData.receipt,
      productId = transactionData.productId,
      amazonUser = transactionData.amazonUser,
      listener = httpsReceiveFunction,
      testing = false,
      itemId = transactionData.itemId
    })
  elseif storeType == 4 then
    validatePurchase.validateOldGoogle({
      receipt = transactionData.receipt,
      productId = transactionData.productId,
      encodedSignature = transactionData.encodedSignature,
      listener = httpsReceiveFunction,
      testing = false,
      itemId = transactionData.itemId
    })
  end
end

function C.buyItem(transaction, storeType, itemId)
  local transactionData = {}
  if storeType == 1 then
    local encodedReceipt = prepareAppleReceipt(transaction.receipt)
    transactionData.receipt = encodedReceipt
    transactionData.productId = transaction.productIdentifier
    transactionData.itemId = itemId
  elseif storeType == 2 then
    local encodedSignature = base64.encode(transaction.signature)
    transactionData.receipt = transaction.originalJson
    transactionData.productId = transaction.productIdentifier
    transactionData.encodedSignature = encodedSignature
    transactionData.itemId = itemId
  elseif storeType == 3 then
    transactionData.receipt = transaction.receipt
    transactionData.productId = transaction.productIdentifier
    transactionData.amazonUser = transaction.userId
    transactionData.itemId = itemId
  elseif storeType == 4 then
    local encodedSignature = base64.encode(transaction.signature)
    transactionData.receipt = transaction.receipt
    transactionData.productIdentifier = transaction.productIdentifier
    transactionData.encodedSignature = encodedSignature
    transactionData.itemId = itemId
  end
  composer.database.addReceipt(transactionData, storeType)
  C.validateReceipt(transactionData, storeType)
end

httpsClient.setCallback(httpsReceiveFunction)
composer.commHttps = C
