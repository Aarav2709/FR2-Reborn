local json = require("json")
local base64 = require("lua.iap.base64")
local composer = require("composer")
local listener

local function offlineMode()
  return composer.config and composer.config.offlineMode
end


local function localListener(event)
  local jsonObject = event.response
  if event.isError then
    jsonObject = "{\"message\":\"Error: Your purchase was successful, but our server is currently down\"}"
  end
  local decoded = json.decode(jsonObject)
  if type(decoded) == "table" and listener then
    listener(decoded)
  end
end

local function validateApple(params)
  if offlineMode() then
    return false
  end
  listener = params.listener
  local testing = params.testing
  local productId = params.productId
  local url = composer.config.httpsClient
  local encodedReceipt = params.encodedReceipt
  local playerId = composer.database.getPlayerInformation().playerId
  local token = composer.database.getPlayerInformation().token
  local itemId = params.itemId
  local postData
  local sandbox = testing and 1 or 0
  if productId and encodedReceipt and playerId and token then
    postData = {
      m = 10,
      r = encodedReceipt,
      i = productId,
      s = sandbox,
      p = playerId,
      a = token,
      x = itemId
    }
  end
  if postData then
    local jsonObject = json.encode(postData)
    network.request(url, "POST", localListener, {body = jsonObject})
  else
    listener({
      message = "Error: Invalid purchase, contact us: purchase@dirtybit.no",
      deleteReceipt = true
    })
  end
end

local function validateGoogle(params)
  if offlineMode() then
    return false
  end
  listener = params.listener
  local testing = params.testing
  local url = composer.config.httpsClient
  local receipt = params.receipt or "<>"
  local productId = params.productId
  local encodedSignature = params.encodedSignature
  local playerId = composer.database.getPlayerInformation().playerId
  local token = composer.database.getPlayerInformation().token
  local postData
  local sandbox = testing and 1 or 0
  local itemId = params.itemId
  if encodedSignature == nil then
    encodedSignature = 0
  end
  if productId and receipt and playerId and token and encodedSignature then
    postData = {
      m = 12,
      r = receipt,
      e = encodedSignature,
      i = productId,
      s = sandbox,
      p = playerId,
      a = token,
      x = itemId
    }
  end
  if postData then
    local jsonObject = json.encode(postData)
    network.request(url, "POST", localListener, {body = jsonObject})
  else
    listener({
      message = "Error: Invalid purchase, contact us: purchase@dirtybit.no",
      deleteReceipt = true
    })
  end
end

local function validateOldGoogle(params)
  if offlineMode() then
    return false
  end
  listener = params.listener
  local testing = params.testing
  local url = composer.config.httpsClient
  local receipt = params.receipt or "<>"
  local productId = params.productId
  local encodedSignature = params.encodedSignature
  local playerId = composer.database.getPlayerInformation().playerId
  local token = composer.database.getPlayerInformation().token
  local postData
  local sandbox = testing and 1 or 0
  local itemId = params.itemId
  if encodedSignature == nil then
    encodedSignature = 0
  end
  if productId and receipt and playerId and token and encodedSignature then
    postData = {
      m = 14,
      r = receipt,
      e = encodedSignature,
      i = productId,
      s = sandbox,
      p = playerId,
      a = token,
      x = itemId
    }
  end
  if postData then
    local jsonObject = json.encode(postData)
    network.request(url, "POST", localListener, {body = jsonObject})
  else
    listener({
      message = "Error: Invalid purchase, contact us: purchase@dirtybit.no",
      deleteReceipt = true
    })
  end
end

local function validateAmazon(params)
  if offlineMode() then
    return false
  end
  listener = params.listener
  local testing = params.testing
  local url = composer.config.httpsClient
  local receipt = params.receipt or "<>"
  local productId = params.productId
  local amazonUser = params.amazonUser
  local playerId = composer.database.getPlayerInformation().playerId
  local token = composer.database.getPlayerInformation().token
  local postData
  local sandbox = testing and 1 or 0
  local itemId = params.itemId
  if productId and receipt and playerId and token and amazonUser then
    postData = {
      m = 13,
      r = receipt,
      z = amazonUser,
      i = productId,
      p = playerId,
      a = token,
      x = itemId
    }
  end
  if postData then
    local jsonObject = json.encode(postData)
    network.request(url, "POST", localListener, {body = jsonObject})
  else
    listener({
      message = "Error: Invalid purchase, contact us: purchase@dirtybit.no",
      deleteReceipt = true
    })
  end
end

return {
  validateApple = validateApple,
  validateGoogle = validateGoogle,
  validateAmazon = validateAmazon,
  validateOldGoogle = validateOldGoogle
}
