local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = require
L2_1 = "json"
L1_1 = L1_1(L2_1)
L2_1 = {}
L2_1.inited = false
L2_1.hasMadeLoginRequest = false
L2_1.loginCallback = nil
L2_1.fetchFriendsCallback = nil
L3_1 = 0
L4_1 = nil
L5_1 = isSimulator
if not L5_1 then
  L5_1 = isWindows
  if not L5_1 then
    goto lbl_27
  end
end
L5_1 = setmetatable
L6_1 = L2_1
L7_1 = {}

function L8_1(A0_2, A1_2)
  local L2_2
  
  function L2_2()
    local L0_3, L1_3
  end
  
  return L2_2
end

L7_1.__index = L8_1
L5_1(L6_1, L7_1)
do return L2_1 end
::lbl_27::
L5_1 = require
L6_1 = "plugin.facebook.v4a"
L5_1 = L5_1(L6_1)

function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L2_2 = A0_2
  L1_2 = A0_2.match
  L3_2 = "[%z\001-\127\194-\244][\128-\191]*"
  return L1_2(L2_2, L3_2)
end

function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = ipairs
  L2_2 = A0_2
  L1_2, L2_2, L3_2 = L1_2(L2_2)
  for L4_2, L5_2 in L1_2, L2_2, L3_2 do
    L6_2 = {}
    L7_2 = L5_2.name
    L8_2 = L7_2
    L7_2 = L7_2.split
    L9_2 = " "
    L10_2 = L6_2
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = L6_2[1]
    L8_2 = 2
    L9_2 = #L6_2
    L10_2 = 1
    for L11_2 = L8_2, L9_2, L10_2 do
      L12_2 = L7_2
      L13_2 = " "
      L14_2 = L6_1
      L15_2 = L6_2[L11_2]
      L14_2 = L14_2(L15_2)
      L15_2 = "."
      L7_2 = L12_2 .. L13_2 .. L14_2 .. L15_2
    end
    L5_2.name = L7_2
  end
  return A0_2
end

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  
  function L1_2(A0_3, A1_3)
    local L2_3, L3_3
    L2_3 = A0_3.name
    L3_3 = A1_3.name
    L2_3 = L2_3 < L3_3
    return L2_3
  end
  
  L2_2 = table
  L2_2 = L2_2.sort
  L3_2 = A0_2
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
  return A0_2
end

function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = L0_1
  L1_2 = L1_2.database
  L1_2 = L1_2.getFriends
  L1_2 = L1_2()
  L2_2 = 1
  L3_2 = #A0_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = false
    L7_2 = 1
    L8_2 = #L1_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = L1_2[L10_2]
      L11_2 = L11_2.f
      if L11_2 then
        L11_2 = tonumber
        L12_2 = L1_2[L10_2]
        L12_2 = L12_2.f
        L11_2 = L11_2(L12_2)
        L12_2 = tonumber
        L13_2 = A0_2[L5_2]
        L13_2 = L13_2.id
        L12_2 = L12_2(L13_2)
        if L11_2 == L12_2 then
          L6_2 = true
          L11_2 = L1_2[L10_2]
          L12_2 = A0_2[L5_2]
          L12_2 = L12_2.name
          L11_2.facebookName = L12_2
        end
      end
    end
    if not L6_2 then
      L7_2 = L0_1
      L7_2 = L7_2.comm
      L7_2 = L7_2.addFacebookFriend
      L8_2 = A0_2[L5_2]
      L8_2 = L8_2.id
      L7_2(L8_2)
    end
  end
  L2_2 = L0_1
  L2_2 = L2_2.debugger
  L2_2 = L2_2.debugTable
  L3_2 = "facebook"
  L4_2 = "friends matched"
  L5_2 = L1_2
  L2_2(L3_2, L4_2, L5_2)
end

function L10_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = L5_1
  L1_2 = L1_2.setFBConnectListener
  
  function L2_2()
    local L0_3, L1_3
  end
  
  L1_2(L2_2)
  L1_2 = L1_1
  L1_2 = L1_2.decode
  L2_2 = A0_2.response
  L1_2 = L1_2(L2_2)
  L2_2 = A0_2.isError
  if L2_2 then
    L2_2 = L0_1
    L2_2 = L2_2.debugger
    L2_2 = L2_2.debugPrint
    L3_2 = "facebook"
    L4_2 = "List Friends - Error, details: "
    L5_2 = L1_2.error
    L5_2 = L5_2.message
    L4_2 = L4_2 .. L5_2
    L2_2(L3_2, L4_2)
  elseif L1_2 then
    L2_2 = L1_2.data
    if L2_2 then
      L2_2 = L1_2.data
      L3_2 = L0_1
      L3_2 = L3_2.debugger
      L3_2 = L3_2.debugPrint
      L4_2 = "facebook"
      L5_2 = "Facebook friends Length: "
      L6_2 = #L2_2
      L5_2 = L5_2 .. L6_2
      L3_2(L4_2, L5_2)
      L3_2 = L8_1
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
      L3_2 = L7_1
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = ipairs
      L6_2 = L2_2
      L5_2, L6_2, L7_2 = L5_2(L6_2)
      for L8_2, L9_2 in L5_2, L6_2, L7_2 do
        L10_2 = L9_2.installed
        if L10_2 then
          L10_2 = #L3_2
          L10_2 = L10_2 + 1
          L11_2 = {}
          L12_2 = L9_2.id
          L11_2.id = L12_2
          L12_2 = L9_2.name
          L11_2.name = L12_2
          L11_2.installed = true
          L3_2[L10_2] = L11_2
        else
          L10_2 = #L4_2
          L10_2 = L10_2 + 1
          L11_2 = {}
          L12_2 = L9_2.id
          L11_2.id = L12_2
          L12_2 = L9_2.name
          L11_2.name = L12_2
          L11_2.installed = false
          L4_2[L10_2] = L11_2
        end
      end
      L5_2 = L9_1
      L6_2 = L3_2
      L5_2(L6_2)
      L5_2 = L0_1
      L5_2 = L5_2.debugger
      L5_2 = L5_2.debugPrint
      L6_2 = "facebook"
      L7_2 = "Sorted facebook friends name"
      L5_2(L6_2, L7_2)
      L5_2 = L0_1
      L5_2 = L5_2.database
      L5_2 = L5_2.setFacebookFriends
      L6_2 = L3_2
      L5_2(L6_2)
      L5_2 = L0_1
      L5_2 = L5_2.database
      L5_2 = L5_2.setFacebookFriendsNotInstalled
      L6_2 = L4_2
      L5_2(L6_2)
    end
  end
end

function L11_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L0_1
  L0_2 = L0_2.debugger
  L0_2 = L0_2.debugPrint
  L1_2 = "facebook"
  L2_2 = "getFacebookFriends"
  L0_2(L1_2, L2_2)
  L0_2 = L5_1
  L0_2 = L0_2.setFBConnectListener
  L1_2 = L10_1
  L0_2(L1_2)
  L0_2 = L5_1
  L0_2 = L0_2.request
  L1_2 = "me/friends"
  L2_2 = "GET"
  L3_2 = {}
  L3_2.fields = "name,installed"
  L0_2(L1_2, L2_2, L3_2)
end

L2_1.getFacebookFriends = L11_1

function L12_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L5_1
  L1_2 = L1_2.setFBConnectListener
  
  function L2_2()
    local L0_3, L1_3
  end
  
  L1_2(L2_2)
  L1_2 = A0_2.name
  if L1_2 == "fbconnect" then
    L1_2 = A0_2.type
    if L1_2 == "request" then
      L1_2 = L0_1
      L1_2 = L1_2.debugger
      L1_2 = L1_2.debugTable
      L2_2 = "facebook"
      L3_2 = "getFacebookId - Got request response."
      L4_2 = A0_2
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = A0_2.isError
      if L1_2 then
        L1_2 = print
        L2_2 = "Get facebook id request error."
        L1_2(L2_2)
        return
      end
      L1_2 = L1_1
      L1_2 = L1_2.decode
      L2_2 = A0_2.response
      L1_2 = L1_2(L2_2)
      responseJson = L1_2
      L1_2 = responseJson
      if L1_2 then
        L1_2 = responseJson
        L1_2 = L1_2.id
        if L1_2 then
          L1_2 = L0_1
          L1_2 = L1_2.debugger
          L1_2 = L1_2.debugPrint
          L2_2 = "facebook"
          L3_2 = "Set Facebook id: "
          L4_2 = responseJson
          L4_2 = L4_2.id
          L3_2 = L3_2 .. L4_2
          L1_2(L2_2, L3_2)
          L1_2 = L0_1
          L1_2 = L1_2.config
          L1_2 = L1_2.loginMessage
          if L1_2 then
            L1_2 = L0_1
            L1_2 = L1_2.debugger
            L1_2 = L1_2.debugPrint
            L2_2 = "facebook"
            L3_2 = "getFacebookId - Try login with facebook."
            L1_2(L2_2, L3_2)
            L1_2 = L0_1
            L1_2 = L1_2.commHttps
            L1_2 = L1_2.loginWithFacebook
            L2_2 = L5_1
            L2_2 = L2_2.getCurrentAccessToken
            L2_2 = L2_2()
            L2_2 = L2_2.token
            L3_2 = responseJson
            L3_2 = L3_2.id
            L1_2(L2_2, L3_2)
          else
            L1_2 = L0_1
            L1_2 = L1_2.database
            L1_2 = L1_2.getFacebookId
            L1_2 = L1_2()
            if L1_2 then
              L1_2 = tonumber
              L2_2 = L0_1
              L2_2 = L2_2.database
              L2_2 = L2_2.getFacebookId
              L2_2, L3_2, L4_2, L5_2 = L2_2()
              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
              L2_2 = tonumber
              L3_2 = responseJson
              L3_2 = L3_2.id
              L2_2 = L2_2(L3_2)
              if L1_2 == L2_2 then
                L1_2 = L0_1
                L1_2 = L1_2.config
                L1_2.facebookMissmatch = false
                L1_2 = L0_1
                L1_2 = L1_2.config
                L1_2 = L1_2.authenticate
                if L1_2 then
                  L1_2 = L0_1
                  L1_2 = L1_2.debugger
                  L1_2 = L1_2.debugPrint
                  L2_2 = "facebook"
                  L3_2 = "getFacebookId - Is logged in so get friends."
                  L1_2(L2_2, L3_2)
                  L1_2 = L11_1
                  L1_2()
                else
                  L1_2 = L3_1
                  if L1_2 < 5 then
                    function L1_2()
                      local L0_3, L1_3, L2_3
                      
                      L0_3 = A0_2
                      L1_3 = L12_1
                      L2_3 = L0_3
                      L1_3(L2_3)
                    end
                    
                    L2_2 = print
                    L3_2 = "WARNING: delayed facebook friend check"
                    L2_2(L3_2)
                    L2_2 = timer
                    L2_2 = L2_2.performWithDelay
                    L3_2 = 2000
                    L4_2 = L1_2
                    L5_2 = 1
                    L2_2 = L2_2(L3_2, L4_2, L5_2)
                    L4_1 = L2_2
                    L2_2 = L3_1
                    L2_2 = L2_2 + 1
                    L3_1 = L2_2
                  end
                end
              else
                L1_2 = L0_1
                L1_2 = L1_2.config
                L1_2.facebookMissmatch = true
              end
            else
              L1_2 = L0_1
              L1_2 = L1_2.database
              L1_2 = L1_2.getPlayerInformation
              L1_2 = L1_2()
              if L1_2 then
                L2_2 = L0_1
                L2_2 = L2_2.debugger
                L2_2 = L2_2.debugPrint
                L3_2 = "facebook"
                L4_2 = "getFacebookId - Link account."
                L2_2(L3_2, L4_2)
                L2_2 = L0_1
                L2_2 = L2_2.commHttps
                L2_2 = L2_2.registerFacebook
                L3_2 = L5_1
                L3_2 = L3_2.getCurrentAccessToken
                L3_2 = L3_2()
                L3_2 = L3_2.token
                L4_2 = responseJson
                L4_2 = L4_2.id
                L2_2(L3_2, L4_2)
              end
            end
          end
        end
      end
    end
  end
end

function L13_1(A0_2)
  local L1_2, L2_2
  L1_2 = L5_1
  L1_2 = L1_2.setFBConnectListener
  
  function L2_2()
    local L0_3, L1_3
  end
  
  L1_2(L2_2)
  L1_2 = A0_2.name
  if L1_2 == "fbconnect" then
    L1_2 = A0_2.type
    if L1_2 == "request" then
      L1_2 = A0_2.isError
      if L1_2 then
        L1_2 = print
        L2_2 = "Get facebook friends request error."
        L1_2(L2_2)
        return
      end
      L1_2 = A0_2.response
      if L1_2 then
        L1_2 = A0_2.response
        L1_2 = L1_2.id
        if L1_2 then
          L1_2 = L2_1
          L1_2 = L1_2.fetchFriendsCallback
          if L1_2 then
            L1_2 = L2_1
            L1_2 = L1_2.fetchFriendsCallback
            L2_2 = A0_2
            L1_2(L2_2)
            L1_2 = L2_1
            L1_2.fetchFriendsCallback = nil
          end
        end
      end
    end
  end
end

function L14_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = require
  L1_2 = "lua.network.httpsMessageFormat"
  L0_2 = L0_2(L1_2)
  L1_2 = {}
  L2_2 = L0_2.loginWithFacebook
  L2_2 = L2_2()
  L1_2.m = L2_2
  L1_2.r = 19
  L2_2 = L0_1
  L2_2 = L2_2.commHttps
  L2_2 = L2_2.httpsReceiveFunction
  L3_2 = L1_2
  L2_2(L3_2)
end

function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L5_1
  L1_2 = L1_2.setFBConnectListener
  
  function L2_2()
    local L0_3, L1_3
  end
  
  L1_2(L2_2)
  L1_2 = A0_2.name
  if L1_2 == "fbconnect" then
    L1_2 = A0_2.isError
    if L1_2 then
      L1_2 = L0_1
      L1_2 = L1_2.getSceneName
      L2_2 = "overlay"
      L1_2 = L1_2(L2_2)
      if L1_2 == "lua.overlay.loginUser" then
        L1_2 = L14_1
        L1_2()
      else
        L1_2 = L0_1
        L1_2 = L1_2.createCustomOverlay
        L2_2 = 4
        L1_2(L2_2)
      end
      L1_2 = L0_1
      L1_2 = L1_2.debugger
      L1_2 = L1_2.debugPrint
      L2_2 = "facebook"
      L3_2 = "Facebook login error - details: "
      L4_2 = A0_2.response
      L4_2 = L4_2.error
      L4_2 = L4_2.message
      L3_2 = L3_2 .. L4_2
      L1_2(L2_2, L3_2)
      L1_2 = print
      L2_2 = "Login Facebook Error"
      L3_2 = A0_2.phase
      L1_2(L2_2, L3_2)
      L1_2 = L2_1
      L1_2 = L1_2.loginCallback
      if L1_2 then
        L1_2 = L2_1
        L1_2 = L1_2.loginCallback
        L2_2 = A0_2
        L1_2(L2_2)
        L1_2 = L2_1
        L1_2.loginCallback = nil
      end
      return
    end
    L1_2 = A0_2.type
    if L1_2 == "session" then
      L1_2 = A0_2.phase
      if L1_2 == "login" then
        L1_2 = L0_1
        L1_2 = L1_2.debugger
        L1_2 = L1_2.debugPrint
        L2_2 = "facebook"
        L3_2 = "Login success. Do GetMe request."
        L1_2(L2_2, L3_2)
        L1_2 = L2_1
        L1_2.loggedIn = true
        L1_2 = L5_1
        L1_2 = L1_2.setFBConnectListener
        L2_2 = L12_1
        L1_2(L2_2)
        L1_2 = L5_1
        L1_2 = L1_2.request
        L2_2 = "me"
        L3_2 = "GET"
        L4_2 = {}
        L4_2.fields = "id,name"
        L1_2(L2_2, L3_2, L4_2)
        L1_2 = L2_1
        L1_2 = L1_2.loginCallback
        if L1_2 then
          L1_2 = L2_1
          L1_2 = L1_2.loginCallback
          L2_2 = A0_2
          L1_2(L2_2)
          L1_2 = L2_1
          L1_2.loginCallback = nil
        end
      else
        L1_2 = A0_2.phase
        if L1_2 == "loginFailed" then
          L1_2 = L0_1
          L1_2 = L1_2.debugger
          L1_2 = L1_2.debugPrint
          L2_2 = "facebook"
          L3_2 = "Login failed."
          L1_2(L2_2, L3_2)
          L1_2 = L2_1
          L1_2 = L1_2.loginCallback
          if L1_2 then
            L1_2 = L2_1
            L1_2 = L1_2.loginCallback
            L2_2 = A0_2
            L1_2(L2_2)
            L1_2 = L2_1
            L1_2.loginCallback = nil
          end
        else
          L1_2 = A0_2.phase
          if L1_2 == "loginCancelled" then
            L1_2 = L0_1
            L1_2 = L1_2.debugger
            L1_2 = L1_2.debugPrint
            L2_2 = "facebook"
            L3_2 = "Login cancelled."
            L1_2(L2_2, L3_2)
            L1_2 = L2_1
            L1_2 = L1_2.loginCallback
            if L1_2 then
              L1_2 = L2_1
              L1_2 = L1_2.loginCallback
              L2_2 = A0_2
              L1_2(L2_2)
              L1_2 = L2_1
              L1_2.loginCallback = nil
            end
          else
            L1_2 = A0_2.phase
            if L1_2 == "logout" then
              L1_2 = L2_1
              L1_2.loggedIn = false
            end
          end
        end
      end
    end
  end
end

function L16_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L5_1
  L1_2 = L1_2.setFBConnectListener
  
  function L2_2()
    local L0_3, L1_3
  end
  
  L1_2(L2_2)
  L1_2 = A0_2.name
  if L1_2 == "fbinit" then
    L1_2 = L0_1
    L1_2 = L1_2.debugger
    L1_2 = L1_2.debugPrint
    L2_2 = "facebook"
    L3_2 = "FACEBOOK INITED."
    L1_2(L2_2, L3_2)
    L1_2 = L2_1
    L1_2.inited = true
    L1_2 = L2_1
    L1_2 = L1_2.hasMadeLoginRequest
    if L1_2 then
      L1_2 = L0_1
      L1_2 = L1_2.debugger
      L1_2 = L1_2.debugPrint
      L2_2 = "facebook"
      L3_2 = "Init complete. Do delayed login attempt."
      L1_2(L2_2, L3_2)
      L1_2 = L0_1
      L1_2 = L1_2.tableUtils
      L1_2 = L1_2.deepCopy
      L2_2 = L2_1
      L2_2 = L2_2.hasMadeLoginRequest
      L1_2 = L1_2(L2_2)
      L2_2 = L2_1
      L2_2.hasMadeLoginRequest = nil
      L2_2 = L2_1
      L2_2 = L2_2.login
      L3_2 = L1_2.permissions
      L4_2 = L1_2.callback
      L2_2(L3_2, L4_2)
    end
  else
    L1_2 = A0_2.name
    if L1_2 == "fbconnect" then
      L1_2 = A0_2.type
      if L1_2 == "request" then
      end
    end
  end
end

function L17_1()
  local L0_2, L1_2
  L0_2 = L5_1
  L0_2 = L0_2.init
  L1_2 = L16_1
  L0_2(L1_2)
end

L2_1.init = L17_1

function L17_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L0_1
  L2_2 = L2_2.debugger
  L2_2 = L2_2.debugPrint
  L3_2 = "facebook"
  L4_2 = "Try login."
  L2_2(L3_2, L4_2)
  L2_2 = L2_1
  L2_2 = L2_2.inited
  if not L2_2 then
    L2_2 = L0_1
    L2_2 = L2_2.debugger
    L2_2 = L2_2.debugPrint
    L3_2 = "facebook"
    L4_2 = "Wait with login until init is done."
    L2_2(L3_2, L4_2)
    L2_2 = L2_1
    L3_2 = {}
    L3_2.permissions = A0_2
    L3_2.callback = A1_2
    L2_2.hasMadeLoginRequest = L3_2
    return
  end
  if not A0_2 then
    L2_2 = {}
    A0_2 = L2_2
  end
  L2_2 = 0
  L3_1 = L2_2
  L2_2 = L2_1
  L2_2.loginCallback = A1_2
  L2_2 = L5_1
  L2_2 = L2_2.getCurrentAccessToken
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = {}
    L2_2.name = "fbconnect"
    L2_2.type = "session"
    L2_2.phase = "login"
    L3_2 = L15_1
    L4_2 = L2_2
    L3_2(L4_2)
  else
    L2_2 = L5_1
    L2_2 = L2_2.login
    L3_2 = L15_1
    L4_2 = A0_2
    L2_2(L3_2, L4_2)
  end
end

L2_1.login = L17_1

function L17_1()
  local L0_2, L1_2
  L0_2 = L5_1
  L0_2 = L0_2.setFBConnectListener
  L1_2 = L15_1
  L0_2(L1_2)
  L0_2 = L5_1
  L0_2 = L0_2.logout
  L0_2()
end

L2_1.logout = L17_1

function L17_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L2_1
  L0_2 = L0_2.loggedIn
  if L0_2 then
    L0_2 = L5_1
    L0_2 = L0_2.setFBConnectListener
    L1_2 = L13_1
    L0_2(L1_2)
    L0_2 = L5_1
    L0_2 = L0_2.request
    L1_2 = "me/friends"
    L2_2 = "GET"
    L3_2 = {}
    L3_2.fields = "name,installed"
    L0_2(L1_2, L2_2, L3_2)
  else
    L0_2 = L2_1
    L1_2 = L2_1
    L1_2 = L1_2.fetchFriends
    L0_2.loginCallback = L1_2
    L0_2 = L2_1
    L0_2 = L0_2.login
    L0_2()
  end
end

L2_1.fetchFriends = L17_1

function L17_1()
  local L0_2, L1_2
  L0_2 = L2_1
  L0_2 = L0_2.loggedIn
  return L0_2
end

L2_1.isLoggedIn = L17_1

function L17_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L2_1
  L0_2 = L0_2.loggedIn
  if L0_2 then
    L0_2 = require
    L1_2 = "lua.modules.platformStoreButtonFunction"
    L0_2 = L0_2(L1_2)
    L0_2 = L0_2.getStoreLink
    L0_2 = L0_2()
    L1_2 = L5_1
    L1_2 = L1_2.showDialog
    L2_2 = "link"
    L3_2 = {}
    L3_2.link = L0_2
    L3_2.title = "Fun Run 2"
    L3_2.description = "Get this game and play me!"
    L1_2(L2_2, L3_2)
  end
end

L2_1.invitePlayerToDownloadApp = L17_1

function L17_1()
  local L0_2, L1_2
end

L2_1.stopDelayedTimer = L17_1
return L2_1
