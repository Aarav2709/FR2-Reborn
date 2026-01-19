local json = require("json")
local composer = require("composer")
local Network = {}
local url = composer.config.httpsClient
local receiveInfoFunction

local function networkListener(event)
  local jsonObject = event.response
  if event.isError then
    jsonObject = "{\"e\":\"Could not connect to server\"}"
  end
  print("rec: ", jsonObject)
  if jsonObject and string.len(jsonObject) > 0 then
    local table = json.decode(jsonObject)
    receiveInfoFunction(table)
  end
end

function Network.send(data)
  local jsonObject = json.encode(data)
  composer.debugger.debugPrint("network", jsonObject)
  local params = {body = jsonObject}
  network.request(url, "POST", networkListener, params)
end

function Network.setCallback(receiveFunction)
  receiveInfoFunction = receiveFunction
end

local function initWithReceiveFunction(receiveFunction)
  receiveInfoFunction = receiveFunction
end

Network.initWithReceiveFunction = initWithReceiveFunction

local function getPlatformName()
  local platform = system.getInfo("platformName")
  if platform == "iPhone OS" then
    return 1
  elseif platform == "Android" then
    return 2
  else
    return 0
  end
end

Network.getPlatformName = getPlatformName

local function createUser(email, username, password)
  local platform = getPlatformName()
  local action = "action=createUser&"
  local postData = action .. "username=" .. username .. "&email=" .. email .. "&password=" .. password .. "&platform=" .. platform
  local params = {}
  params.body = postData
  network.request(url, "POST", networkListener, params)
end

Network.createUser = createUser

local function createFacebookUser(username, facebookId, facebookToken)
  local platform = getPlatformName()
  local action = "action=createFacebookUser&"
  local postData = action .. "username=" .. username .. "&facebookId=" .. facebookId .. "&facebookToken=" .. facebookToken .. "&platform=" .. platform
  local params = {}
  params.body = postData
  network.request(url, "POST", networkListener, params)
end

Network.createFacebookUser = createFacebookUser

local function addUserInformation(playerId, token, email, password)
  local action = "action=addUserInformation&"
  local postData = action .. "playerId=" .. playerId .. "&token=" .. token .. "&email=" .. email .. "&password=" .. password
  local params = {}
  params.body = postData
  network.request(url, "POST", networkListener, params)
end

Network.addUserInformation = addUserInformation

local function loginUser(username, password)
  local action = "action=loginUser&"
  local postData = action .. "username=" .. username .. "&password=" .. password
  local params = {}
  params.body = postData
  network.request(url, "POST", networkListener, params)
end

Network.loginUser = loginUser

local function addFacebookInformation(token, playerId, facebookId, facebookToken)
  local action = "action=addFacebookInformation&"
  local postData = action .. "facebookId=" .. facebookId .. "&facebookToken=" .. facebookToken .. "&token=" .. token .. "&playerId=" .. playerId
  local params = {}
  params.body = postData
  network.request(url, "POST", networkListener, params)
end

Network.addFacebookInformation = addFacebookInformation

local function loginFacebookUser(facebookId, facebookToken)
  local action = "action=loginFacebookUser&"
  local postData = action .. "facebookId=" .. facebookId .. "&facebookToken=" .. facebookToken
  local params = {}
  params.body = postData
  network.request(url, "POST", networkListener, params)
end

Network.loginFacebookUser = loginFacebookUser

local function forgotPassword(username)
  local action = "action=forgotPassword&"
  local postData = action .. "username=" .. username
  local params = {}
  params.body = postData
  network.request(url, "POST", networkListener, params)
end

Network.forgotPassword = forgotPassword
return Network
