local M = {}
local json = require("json")
local url = require("socket.url")
M.FB_App_ID = "_UNDEFINED_"
M.FB_Access_Token = nil
M.isDebug = false
local dbgPrefix = "[Facebook]"

local function dbg(...)
  if M.isDebug then
    print(dbgPrefix .. " " .. unpack(arg))
  end
end

local function dbgf(...)
  if M.isDebug then
    dbg(string.format(unpack(arg)))
  end
end

local function dbgTable(t, label, level)
  if M.isDebug then
    if label then
      dbg(label)
    end
    level = level or 0
    if t then
      for k, v in pairs(t) do
        local prefix = ""
        for i = 1, level do
          prefix = prefix .. "    "
        end
        dbg(prefix .. "[" .. tostring(k) .. "] = " .. tostring(v))
        if type(v) == "table" then
          dbg(prefix .. "{")
          dbgTable(v, nil, level + 1)
          dbg(prefix .. "}")
        end
      end
    end
  end
end

local function dbgDumpFacebookRequestResponse(request, event)
  if M.isDebug then
    dbg("----- Begin response -----")
    if request then
      if request.path == "login" then
        dbgf("Request: login")
        for i = 1, #request.params do
          dbgf("Request permission: %s", request.params[i])
        end
      else
        if request.method then
          dbgf("Request: %s %s", request.method, request.path)
        else
          dbgf("Request: %s", request.path)
        end
        if request.params then
          for key, value in pairs(request.params) do
            dbgf("Request parameter - %s: %s", key, value)
          end
        end
      end
    end
    if event then
      dbg("Response - event.name: " .. event.name)
      dbg("Response - event.type: " .. event.type)
      if event.phase then
        dbg("Response - event.phase: " .. event.phase)
      end
      if event.token then
        dbg("Response - access token: " .. tostring(event.token))
      end
      if event.type == "dialog" then
        dbg("Response - dialog 'didComplete' was: " .. tostring(event.didComplete))
      end
      if event.isError then
        dbg("Response reports 'isError'")
      end
      if event.response then
        if type(event.response) == "table" then
          dbgTable(event.response, "Response body table:")
        else
          local errorMsg = tostring(event.response)
          if errorMsg and errorMsg:len() > 0 then
            dbg("Response body (" .. type(event.response) .. "): " .. errorMsg)
          end
        end
      end
    end
    dbg("----- End response -----")
  end
end

local fbLoggedIn = false
local fbNextRequest

local function setNextRequest(path, httpMethod, params, onRequestComplete)
  fbNextRequest = {
    path = path,
    method = httpMethod,
    params = params,
    listener = onRequestComplete
  }
end

local function fbListener(event)
  if event.isError then
    local error_message = "Unknown Error"
    if event.response and type(event.response) == "string" and event.response:len() > 0 then
      error_message = event.response
    end
    local error_response = {}
    error_response.message = error_message
    error_response.type = "CallError"
    error_response.code = -1
    event.response_raw = event.response
    event.response = {}
    event.response.error = error_response
  else
    if event.response and event.response:len() > 0 then
      event.response_raw = event.response
      if event.response_raw:sub(1, 1) == "{" then
        event.response = json.decode(event.response_raw)
      end
      if event.response.error then
        event.isError = true
      end
    end
    if not event.isError and event.type == "session" then
      if event.phase == "login" then
        fbLoggedIn = true
      elseif event.phase == "logout" then
        fbLoggedIn = false
      end
    end
  end
  dbgDumpFacebookRequestResponse(fbNextRequest, event)
  if fbNextRequest == nil then
    print("Facebook request completed, but no pending request state was available")
  else
    event.request = fbNextRequest
    fbNextRequest = nil
    event.request.listener(event)
  end
end

local isSimulator = "simulator" == system.getInfo("environment")

local function simulatorLogin()
  local fbEvent = {}
  fbEvent.name = "fbconnect"
  fbEvent.type = "session"
  fbEvent.phase = "login"
  fbEvent.token = M.FB_Access_Token
  fbListener(fbEvent)
end

local function simulatorRequest(path, httpMethod, params)
  local params = params or {}
  if M.FB_Access_Token then
    params.access_token = M.FB_Access_Token
  else
    print("Facebook functionality in the simulator requires that FB_Access_Token be set in lib_facebook.lua")
  end
  local queryString
  for k, v in pairs(params) do
    if queryString then
      queryString = queryString .. "&"
    else
      queryString = "?"
    end
    queryString = queryString .. k .. "=" .. url.escape(v)
  end
  local url = "https://graph.facebook.com/" .. path .. queryString
  dbg("Simulator Facebook request: " .. url)
  
  local function onRequestComplete(event)
    local fbEvent = {}
    fbEvent.name = "fbconnect"
    fbEvent.type = "request"
    fbEvent.isError = event.isError
    fbEvent.response = event.response
    fbListener(fbEvent)
  end
  
  network.request(url, httpMethod, onRequestComplete)
end

local function simulatorLogout()
  local fbEvent = {}
  fbEvent.name = "fbconnect"
  fbEvent.type = "session"
  fbEvent.phase = "logout"
  fbListener(fbEvent)
end

function M.isLoggedIn()
  return fbLoggedIn
end

function M.login(permissions, onLoginComplete)
  dbg("Preparing to log in")
  assert(M.FB_App_ID and M.FB_App_ID:len() > 0 and M.FB_App_ID ~= "_UNDEFINED_", "Facebook FB_App_ID not defined by caller")
  setNextRequest("login", nil, permissions, onLoginComplete)
  if isSimulator then
    simulatorLogin()
  else
    facebook.login(M.FB_App_ID, fbListener, permissions)
  end
end

function M.request(path, httpMethod, params, onRequestComplete)
  dbg("Preparing to send request: " .. httpMethod .. " " .. path)
  if fbNextRequest ~= nil then
    print("Error processing Facebook request: " .. httpMethod .. " " .. path .. ", a previous request is still being processed")
  else
    setNextRequest(path, httpMethod, params, onRequestComplete)
  end
  if not fbLoggedIn then
    print("Error processing Facebook request: " .. httpMethod .. " " .. path .. ", not currently logged in")
  elseif isSimulator then
    simulatorRequest(path, httpMethod, params)
  else
    facebook.request(path, httpMethod, params)
  end
end

function M.showDialog(params, onDialogComplete)
  dbg("Preparing to show dialog")
  if fbNextRequest ~= nil then
    print("Error processing Facebook show dialog, a previous request is still being processed")
  else
    setNextRequest("showdialog", nil, params, onDialogComplete)
  end
  if not fbLoggedIn then
    print("Error processing Facebook show dialog, not currently logged in")
  elseif isSimulator then
    print("Facebook showDialog not supported in simulator")
  else
    facebook.showDialog("apprequests", params)
  end
end

function M.logout(onLogoutComplete)
  dbg("Preparing to log out")
  if fbNextRequest ~= nil then
    print("Error processing Facebook logout, a previous request is still being processed")
  else
    setNextRequest("logout", nil, nil, onLogoutComplete)
  end
  if not fbLoggedIn then
    print("Error processing Facebook logout, not currently logged in")
  elseif isSimulator then
    simulatorLogout()
  else
    facebook.logout()
  end
end

return M
