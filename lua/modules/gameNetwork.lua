local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "json"
L2_1 = L2_1(L3_1)
L3_1 = require
L4_1 = "lua.modules.jsonParser"
L3_1 = L3_1(L4_1)
L0_1.invalid = false
L0_1.doingWork = false

function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = A0_2.isError
  if L1_2 then
    L1_2 = A0_2.errorMessage
    if L1_2 then
    end
    L1_2 = A0_2.errorCode
    if L1_2 then
    end
    return
  end
  L1_2 = A0_2.achievements
  if L1_2 then
    L2_2 = 1
    L3_2 = #L1_2
    L4_2 = 1
    for L5_2 = L2_2, L3_2, L4_2 do
      L6_2 = L1_2[L5_2]
    end
  else
  end
end

function L5_1(A0_2)
  local L1_2
  L1_2 = A0_2.isError
  if L1_2 then
    L1_2 = A0_2.errorMessage
    if L1_2 then
    end
    L1_2 = A0_2.errorCode
    if L1_2 then
    end
    return
  end
end

function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = A0_2.type
  if L1_2 == "unlockAchievement" then
    L1_2 = L1_1
    L1_2 = L1_2.debugger
    L1_2 = L1_2.debugTable
    L2_2 = "network"
    L3_2 = "appleRequestCallback :"
    L4_2 = A0_2
    L1_2(L2_2, L3_2, L4_2)
  else
    L1_2 = A0_2.type
    if L1_2 == "loadAchievements" then
      L1_2 = A0_2.data
      if L1_2 then
        L2_2 = 1
        L3_2 = #L1_2
        L4_2 = 1
        for L5_2 = L2_2, L3_2, L4_2 do
          L6_2 = L1_2[L5_2]
        end
      else
      end
    end
  end
end

function L7_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L0_1
  L0_2 = L0_2.isGameServicesActive
  L0_2 = L0_2()
  if L0_2 then
    L0_2 = isAndroid
    if L0_2 then
      L0_2 = L0_1
      L0_2 = L0_2.gpgs
      L0_2 = L0_2.achievements
      L0_2 = L0_2.load
      L1_2 = {}
      L1_2.forceReload = false
      L2_2 = L4_1
      L1_2.listener = L2_2
      L0_2(L1_2)
    else
      L0_2 = isIOS
      if L0_2 then
        L0_2 = L0_1
        L0_2 = L0_2.native
        L0_2 = L0_2.request
        L1_2 = "loadAchievements"
        L2_2 = {}
        L3_2 = L6_1
        L2_2.listener = L3_2
        L0_2(L1_2, L2_2)
      end
    end
  end
end

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  if A1_2 < 1 then
    return
  end
  L2_2 = L0_1
  L2_2 = L2_2.isGameServicesActive
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = isAndroid
    if L2_2 then
      L2_2 = A0_2.googleAchievementId
      if L2_2 then
        L2_2 = L0_1
        L2_2 = L2_2.gpgs
        L2_2 = L2_2.achievements
        L2_2 = L2_2.unlock
        L3_2 = {}
        L4_2 = A0_2.googleAchievementId
        L3_2.achievementId = L4_2
        L4_2 = L5_1
        L3_2.listener = L4_2
        L2_2(L3_2)
      else
      end
    else
      L2_2 = isIOS
      if L2_2 then
        L2_2 = A0_2.appleAchievementId
        if L2_2 then
          L2_2 = L0_1
          L2_2 = L2_2.native
          L2_2 = L2_2.request
          L3_2 = "unlockAchievement"
          L4_2 = {}
          L5_2 = {}
          L6_2 = A0_2.appleAchievementId
          L5_2.identifier = L6_2
          L5_2.percentComplete = 100
          L5_2.showsCompletionBanner = false
          L4_2.achievement = L5_2
          L5_2 = L6_1
          L4_2.listener = L5_2
          L2_2(L3_2, L4_2)
        else
        end
      end
    end
  end
end

function L9_1(A0_2)
  local L1_2, L2_2
  L1_2 = L0_1
  L1_2 = L1_2.isGameServicesActive
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = isAndroid
    if L1_2 then
      L1_2 = L0_1
      L1_2 = L1_2.isConnected
      L1_2 = L1_2()
      if L1_2 then
        L1_2 = L0_1
        L1_2 = L1_2.gpgs
        L1_2 = L1_2.achievements
        L1_2 = L1_2.show
        L2_2 = A0_2
        L1_2(L2_2)
    end
    else
      L1_2 = isIOS
      if L1_2 then
        L1_2 = L0_1
        L1_2 = L1_2.native
        L1_2 = L1_2.show
        L2_2 = "achievements"
        L1_2(L2_2)
      end
    end
  end
end

function L10_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L1_1
  L1_2 = L1_2.debugger
  L1_2 = L1_2.debugTable
  L2_2 = "gameNetwork"
  L3_2 = "Login Event: "
  L4_2 = A0_2
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = A0_2.isError
  if L1_2 then
    L1_2 = print
    L2_2 = "GPGS login error"
    L3_2 = A0_2.errorCode
    L4_2 = A0_2.errorMessage
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = L0_1
    L1_2 = L1_2.failsGetLocalPlayerCallback
    if L1_2 then
      L1_2 = L0_1
      L1_2 = L1_2.failsGetLocalPlayerCallback
      L1_2()
      L1_2 = L0_1
      L1_2.failsGetLocalPlayerCallback = nil
    end
    return
  end
  L1_2 = A0_2.phase
  if L1_2 == "logged in" then
    L1_2 = L0_1
    L1_2.successfullyLoadedPlayer = true
    L1_2 = L0_1
    L1_2 = L1_2.succesfullyGetLocalPlayerCallback
    if L1_2 then
      L1_2 = L0_1
      L1_2 = L1_2.succesfullyGetLocalPlayerCallback
      L1_2()
      L1_2 = L0_1
      L1_2.succesfullyGetLocalPlayerCallback = nil
    end
    L1_2 = L1_1
    L1_2 = L1_2.database
    L1_2 = L1_2.setGameServiceState
    L2_2 = 1
    L1_2(L2_2)
  else
    L1_2 = A0_2.phase
    if L1_2 == "logged out" then
      L1_2 = L0_1
      L1_2.successfullyLoadedPlayer = false
      L1_2 = L1_1
      L1_2 = L1_2.database
      L1_2 = L1_2.setGooglePlayServicesId
      L2_2 = nil
      L1_2(L2_2)
      L1_2 = L1_1
      L1_2 = L1_2.database
      L1_2 = L1_2.setGameServiceState
      L2_2 = 2
      L1_2(L2_2)
      L1_2 = L0_1
      L1_2 = L1_2.logoutCallback
      if L1_2 then
        L1_2 = L0_1
        L1_2 = L1_2.logoutCallback
        L1_2()
        L1_2 = L0_1
        L1_2.logoutCallback = nil
      end
    end
  end
end

function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = A0_2.isError
  if L1_2 then
    L1_2 = print
    L2_2 = "GPGS init error"
    L3_2 = A0_2.errorCode
    L4_2 = A0_2.errorMessage
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = L0_1
    L1_2 = L1_2.failsGetLocalPlayerCallback
    if L1_2 then
      L1_2 = L0_1
      L1_2 = L1_2.failsGetLocalPlayerCallback
      L1_2()
      L1_2 = L0_1
      L1_2.failsGetLocalPlayerCallback = nil
    end
    return
  end
  L1_2 = L0_1
  L1_2.successfullyInit = true
  L1_2 = {}
  L1_2.userInitiated = true
  L2_2 = L10_1
  L1_2.listener = L2_2
  L2_2 = L0_1
  L2_2 = L2_2.gpgs
  L2_2 = L2_2.login
  L3_2 = L1_2
  L2_2(L3_2)
end

function L12_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = print
  L2_2 = "Loading Local Player Apple"
  L1_2(L2_2)
  L1_2 = A0_2.isError
  if L1_2 then
    L1_2 = L1_1
    L1_2 = L1_2.debugger
    L1_2 = L1_2.debugTable
    L2_2 = "network"
    L3_2 = "appleLoginCallback :"
    L4_2 = A0_2
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = L0_1
    L1_2 = L1_2.failsGetLocalPlayerCallback
    if L1_2 then
      L1_2 = L0_1
      L1_2 = L1_2.failsGetLocalPlayerCallback
      L1_2()
      L1_2 = L0_1
      L1_2.failsGetLocalPlayerCallback = nil
    end
    return
  end
  L1_2 = A0_2.data
  if L1_2 then
    L1_2 = L0_1
    L2_2 = ""
    L3_2 = A0_2.data
    L3_2 = L3_2.playerID
    L2_2 = L2_2 .. L3_2
    L1_2.localPlayerId = L2_2
    L1_2 = L0_1
    L2_2 = A0_2.data
    L2_2 = L2_2.alias
    L1_2.localPlayerAlias = L2_2
    L1_2 = L0_1
    L2_2 = L0_1
    L2_2 = L2_2.localPlayerId
    L1_2.appleGameCenterPlayerId = L2_2
    L1_2 = L0_1
    L1_2 = L1_2.backEndApplePlayerId
    if L1_2 then
      L1_2 = L0_1
      L1_2 = L1_2.backEndApplePlayerId
      L2_2 = L0_1
      L2_2 = L2_2.localPlayerId
      if L1_2 == L2_2 then
        L1_2 = L0_1
        L1_2.successfullyLoadedPlayer = true
        L1_2 = L0_1
        L1_2 = L1_2.succesfullyGetLocalPlayerCallback
        if L1_2 then
          L1_2 = L0_1
          L1_2 = L1_2.succesfullyGetLocalPlayerCallback
          L1_2()
          L1_2 = L0_1
          L1_2.succesfullyGetLocalPlayerCallback = nil
        end
      else
        L1_2 = L0_1
        L1_2.successfullyLoadedPlayer = false
        L1_2 = L0_1
        L1_2 = L1_2.failsGetLocalPlayerCallback
        if L1_2 then
          L1_2 = L0_1
          L1_2 = L1_2.failsGetLocalPlayerCallback
          L1_2()
          L1_2 = L0_1
          L1_2.failsGetLocalPlayerCallback = nil
        end
      end
    else
      L1_2 = L0_1
      L1_2.successfullyLoadedPlayer = true
      L1_2 = L0_1
      L1_2 = L1_2.succesfullyGetLocalPlayerCallback
      if L1_2 then
        L1_2 = L0_1
        L1_2 = L1_2.succesfullyGetLocalPlayerCallback
        L1_2()
        L1_2 = L0_1
        L1_2.succesfullyGetLocalPlayerCallback = nil
      end
    end
  end
end

function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L1_1
  L1_2 = L1_2.debugger
  L1_2 = L1_2.debugTable
  L2_2 = "network"
  L3_2 = "iOSInitCallback :"
  L4_2 = A0_2
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = A0_2.type
  if L1_2 == "showSignIn" then
  else
    L1_2 = A0_2.data
    if L1_2 then
      L1_2 = L0_1
      L1_2.successfullyInit = true
      L1_2 = L0_1
      L1_2 = L1_2.native
      L1_2 = L1_2.request
      L2_2 = "loadLocalPlayer"
      L3_2 = {}
      L4_2 = L12_1
      L3_2.listener = L4_2
      L1_2(L2_2, L3_2)
    else
      L1_2 = L0_1
      L1_2 = L1_2.failsGetLocalPlayerCallback
      if L1_2 then
        L1_2 = L0_1
        L1_2 = L1_2.failsGetLocalPlayerCallback
        L1_2()
        L1_2 = L0_1
        L1_2.failsGetLocalPlayerCallback = nil
      end
    end
  end
end

function L14_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  
  function L0_2()
    local L0_3, L1_3, L2_3
    L0_3 = isAndroid
    if L0_3 then
      L0_3 = L0_1
      L1_3 = require
      L2_3 = "plugin.gpgs"
      L1_3 = L1_3(L2_3)
      L0_3.gpgs = L1_3
      L0_3 = L0_1
      L0_3 = L0_3.gpgs
      L0_3 = L0_3.init
      L1_3 = L11_1
      L0_3(L1_3)
    else
      L0_3 = isIOS
      if L0_3 then
        L0_3 = L0_1
        L1_3 = require
        L2_3 = "gameNetwork"
        L1_3 = L1_3(L2_3)
        L0_3.native = L1_3
        L0_3 = L0_1
        L0_3 = L0_3.native
        L0_3 = L0_3.init
        L1_3 = "gamecenter"
        L2_3 = L13_1
        L0_3(L1_3, L2_3)
      else
        L0_3 = L0_1
        L0_3 = L0_3.failsGetLocalPlayerCallback
        if L0_3 then
          L0_3 = L0_1
          L0_3 = L0_3.failsGetLocalPlayerCallback
          L0_3()
          L0_3 = L0_1
          L0_3.failsGetLocalPlayerCallback = nil
        end
        L0_3 = L0_1
        L0_3.successfullyInit = false
      end
    end
  end
  
  function L1_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_3.isError
    if L1_3 then
      L1_3 = print
      L2_3 = "Checking Back End for Game Network status, error HTTP GET!"
      L1_3(L2_3)
      L1_3 = L0_1
      L1_3 = L1_3.failsGetLocalPlayerCallback
      if L1_3 then
        L1_3 = L0_1
        L1_3 = L1_3.failsGetLocalPlayerCallback
        L1_3()
        L1_3 = L0_1
        L1_3.failsGetLocalPlayerCallback = nil
      end
      L1_3 = L0_1
      L1_3.successfullyInit = false
    else
      L1_3 = A0_3.phase
      if L1_3 == "ended" then
        L1_3 = L3_1
        L1_3 = L1_3.getJsonFromFile
        L2_3 = "version.json"
        L1_3 = L1_3(L2_3)
        if L1_3 ~= nil then
          L2_3 = L1_3.disableGameNetwork
          if L2_3 == nil then
            goto lbl_47
          end
          L2_3 = L1_3.disableGameNetwork
          if L2_3 ~= true then
            goto lbl_47
          end
        end
        L2_3 = print
        L3_3 = "Back End says: no game center allowed!"
        L2_3(L3_3)
        L2_3 = L0_1
        L2_3 = L2_3.failsGetLocalPlayerCallback
        if L2_3 then
          L2_3 = L0_1
          L2_3 = L2_3.failsGetLocalPlayerCallback
          L2_3()
          L2_3 = L0_1
          L2_3.failsGetLocalPlayerCallback = nil
          goto lbl_52
          ::lbl_47::
          L2_3 = print
          L3_3 = "Back End says: game center allowed!"
          L2_3(L3_3)
          L2_3 = L0_2
          L2_3()
        end
      end
    end
    ::lbl_52::
  end
  
  L2_2 = {}
  L2_2.progress = true
  L2_2.timeout = 10
  L3_2 = network
  L3_2 = L3_2.download
  L4_2 = L1_1
  L4_2 = L4_2.config
  L4_2 = L4_2.jsonVersionConfig
  L5_2 = "GET"
  L6_2 = L1_2
  L7_2 = L2_2
  L8_2 = "version.json"
  L9_2 = system
  L9_2 = L9_2.CachesDirectory
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
end

function L15_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L0_1
  L0_2 = L0_2.successfullyInit
  if L0_2 then
    L0_2 = L0_1
    L0_2 = L0_2.successfullyInit
    if L0_2 == true then
      L0_2 = L0_1
      L0_2 = L0_2.successfullyLoadedPlayer
      if L0_2 then
        L0_2 = L0_1
        L0_2 = L0_2.successfullyLoadedPlayer
        if L0_2 == true then
          L0_2 = L0_1
          L0_2 = L0_2.succesfullyGetLocalPlayerCallback
          if L0_2 then
            L0_2 = L0_1
            L0_2 = L0_2.succesfullyGetLocalPlayerCallback
            L0_2()
            L0_2 = L0_1
            L0_2.succesfullyGetLocalPlayerCallback = nil
          end
        end
      end
      return
  end
  else
    L0_2 = print
    L1_2 = "Game Services: Not already init'd, going to try that now!"
    L0_2(L1_2)
  end
  L0_2 = isAndroid
  if L0_2 then
    L0_2 = system
    L0_2 = L0_2.getInfo
    L1_2 = "targetAppStore"
    L0_2 = L0_2(L1_2)
    if L0_2 ~= "amazon" then
      L0_2 = L14_1
      L0_2()
  end
  else
    L0_2 = isIOS
    if L0_2 then
      L0_2 = L14_1
      L0_2()
    else
      L0_2 = isSimulator
      if L0_2 then
        L0_2 = L14_1
        L0_2()
        L0_2 = L0_1
        L0_2 = L0_2.failsGetLocalPlayerCallback
        if L0_2 then
          L0_2 = L0_1
          L0_2 = L0_2.failsGetLocalPlayerCallback
          L0_2()
          L0_2 = L0_1
          L0_2.failsGetLocalPlayerCallback = nil
        end
        L0_2 = L0_1
        L0_2.successfullyInit = false
      else
        L0_2 = print
        L1_2 = "Did not find any Game Network for "
        L2_2 = system
        L2_2 = L2_2.getInfo
        L3_2 = "platformName"
        L2_2 = L2_2(L3_2)
        L1_2 = L1_2 .. L2_2
        L0_2(L1_2)
        L0_2 = L0_1
        L0_2 = L0_2.failsGetLocalPlayerCallback
        if L0_2 then
          L0_2 = L0_1
          L0_2 = L0_2.failsGetLocalPlayerCallback
          L0_2()
          L0_2 = L0_1
          L0_2.failsGetLocalPlayerCallback = nil
        end
        L0_2 = L0_1
        L0_2.successfullyInit = false
      end
    end
  end
end

function L16_1(A0_2)
  local L1_2
  L1_2 = L0_1
  L1_2.externalListener = A0_2
end

function L17_1(A0_2)
  local L1_2
  L1_2 = L0_1
  L1_2.backEndGooglePlayerId = A0_2
end

function L18_1(A0_2)
  local L1_2
  L1_2 = L0_1
  L1_2.backEndApplePlayerId = A0_2
end

function L19_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L0_2 = L0_2.backEndGooglePlayerId
  return L0_2
end

function L20_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L0_2 = L0_2.backEndApplePlayerId
  return L0_2
end

function L21_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L0_2 = L0_2.successfullyInit
  if L0_2 then
    L0_2 = L0_1
    L0_2 = L0_2.successfullyInit
    L0_2 = L0_2 == true
  end
  return L0_2
end

function L22_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L0_2 = L0_2.successfullyLoadedPlayer
  if L0_2 then
    L0_2 = L0_1
    L0_2 = L0_2.successfullyLoadedPlayer
    L0_2 = L0_1
    L0_2 = L0_2.invalid
    L0_2 = L0_2 == true and L0_2
  end
  return L0_2
end

function L23_1()
  local L0_2, L1_2
  L0_2 = print
  L1_2 = "Invalidating Game Services"
  L0_2(L1_2)
  L0_2 = L0_1
  L0_2.invalid = true
end

function L24_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L0_2 = L0_2.invalid
  if L0_2 then
    L0_2 = L0_1
    L0_2 = L0_2.invalid
    L0_2 = L0_2 == true
  end
  return L0_2
end

function L25_1()
  local L0_2, L1_2
  L0_2 = L24_1
  L0_2 = L0_2()
  if not L0_2 then
    L0_2 = L1_1
    L0_2 = L0_2.database
    L0_2 = L0_2.getGameServiceState
    L0_2 = L0_2()
    L0_2 = L0_2 == 2
  end
  return L0_2
end

function L26_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L0_2 = L0_2.successfullyLoadedPlayer
  if L0_2 then
    L0_2 = L1_1
    L0_2 = L0_2.database
    L0_2 = L0_2.getGooglePlayServicesId
    L0_2 = L0_2()
    if L0_2 ~= nil then
      L1_2 = L0_1
      L1_2 = L1_2.backEndGooglePlayerId
      if L0_2 == L1_2 then
        L1_2 = L0_1
        L1_2.invalid = false
    end
    else
      L1_2 = L0_1
      L1_2.invalid = true
    end
  end
end

function L27_1(A0_2)
  local L1_2
  L1_2 = L0_1
  L1_2.succesfullyGetLocalPlayerCallback = A0_2
end

function L28_1(A0_2)
  local L1_2
  L1_2 = L0_1
  L1_2.failsGetLocalPlayerCallback = A0_2
end

function L29_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L0_2 = L0_2.localPlayerAlias
  return L0_2
end

function L30_1()
  local L0_2, L1_2
  L0_2 = isAndroid
  if L0_2 then
    L0_2 = L1_1
    L0_2 = L0_2.database
    L0_2 = L0_2.getGooglePlayServicesId
    return L0_2()
  else
    L0_2 = L0_1
    L0_2 = L0_2.localPlayerId
    return L0_2
  end
end

function L31_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L0_2 = L0_2.localPlayerEmail
  return L0_2
end

function L32_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L0_2 = L0_2.appleGameCenterPlayerId
  return L0_2
end

function L33_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L0_1
  L1_2 = L1_2.gpgs
  if L1_2 == nil or A0_2 == nil then
    L1_2 = print
    L2_2 = "Google Play Game Services not required, or callback nil"
    L3_2 = L0_1
    L3_2 = L3_2.gpgs
    L4_2 = A0_2
    L1_2(L2_2, L3_2, L4_2)
    return
  end
  L1_2 = {}
  L1_2.serverId = "183455917667-r9kj2hu9onj1vptotntm9ripgj9te232.apps.googleusercontent.com"
  L1_2.listener = A0_2
  L2_2 = L0_1
  L2_2 = L2_2.gpgs
  L2_2 = L2_2.getServerAuthCode
  L3_2 = L1_2
  L2_2(L3_2)
end

function L34_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L1_2 = system
  L1_2 = L1_2.getTimer
  L1_2 = L1_2()
  L0_2.suspendTimer = L1_2
end

function L35_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L0_2 = L0_2.suspendTimer
  if L0_2 == nil then
    L0_2 = true
    return L0_2
  else
    L0_2 = system
    L0_2 = L0_2.getTimer
    L0_2 = L0_2()
    L1_2 = L0_1
    L1_2 = L1_2.suspendTimer
    L0_2 = L0_2 - L1_2
    L0_2 = 30 < L0_2
    return L0_2
  end
end

function L36_1(A0_2)
  local L1_2, L2_2
  L1_2 = L0_1
  L1_2 = L1_2.gpgs
  if not L1_2 then
    L1_2 = print
    L2_2 = "Plugin not loaded."
    L1_2(L2_2)
    return
  end
  L1_2 = L0_1
  L1_2 = L1_2.gpgs
  L1_2 = L1_2.logout
  L1_2()
  L1_2 = L0_1
  L1_2.successfullyLoadedPlayer = false
  L1_2 = L0_1
  L1_2.logoutCallback = A0_2
end

function L37_1()
  local L0_2, L1_2, L2_2
  L0_2 = L0_1
  L0_2 = L0_2.gpgs
  if not L0_2 then
    L0_2 = print
    L1_2 = "Plugin not loaded."
    L0_2(L1_2)
    return
  end
  L0_2 = {}
  L0_2.userInitiated = true
  L1_2 = L10_1
  L0_2.listener = L1_2
  L1_2 = L0_1
  L1_2.invalid = false
  L1_2 = L0_1
  L1_2 = L1_2.gpgs
  L1_2 = L1_2.login
  L2_2 = L0_2
  L1_2(L2_2)
end

function L38_1()
  local L0_2, L1_2
  L0_2 = isAndroid
  if L0_2 then
    L0_2 = L0_1
    L0_2 = L0_2.gpgs
    if not L0_2 then
      L0_2 = print
      L1_2 = "Plugin not loaded."
      L0_2(L1_2)
      L0_2 = false
      return L0_2
    end
    L0_2 = L0_1
    L0_2 = L0_2.gpgs
    L0_2 = L0_2.isConnected
    return L0_2()
  end
  L0_2 = false
  return L0_2
end

function L39_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L0_2 = L0_2.doingWork
  return L0_2
end

function L40_1(A0_2)
  local L1_2
  L1_2 = L0_1
  L1_2.doingWork = A0_2
end

L0_1.init = L15_1
L0_1.getPlayerId = L30_1
L0_1.getAlias = L29_1
L0_1.getEmail = L31_1
L0_1.isGameServicesInvalidated = L24_1
L0_1.shouldHideGameServicesOnStart = L25_1
L0_1.isConnected = L38_1
L0_1.isDoingGameNetworkWork = L39_1
L0_1.setGameNetworkDoingWork = L40_1
L0_1.setSuccesfullyGetLocalPlayerCallback = L27_1
L0_1.setFailsGetLocalPlayerCallback = L28_1
L0_1.isGameServicesInit = L21_1
L0_1.isGameServicesActive = L22_1
L0_1.invalidateGameServices = L23_1
L0_1.revalidateGooglePlayServices = L26_1
L0_1.setBackEndGooglePlayerId = L17_1
L0_1.setBackEndApplePlayerId = L18_1
L0_1.getBackEndGooglePlayerId = L19_1
L0_1.getBackEndApplePlayerId = L20_1
L0_1.getAppleGameCenterPlayerId = L32_1
L0_1.getPlayServicesRefreshToken = L33_1
L0_1.refreshSuspendTimer = L34_1
L0_1.canRetryStartGameNetwork = L35_1
L0_1.playServicesLogout = L36_1
L0_1.playServicesLogin = L37_1
L0_1.loadAchievements = L7_1
L0_1.unlockAchievementLevelProgression = L8_1
L0_1.showAchievements = L9_1
return L0_1
