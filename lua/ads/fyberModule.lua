local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "lua.ads.videoModule"
L2_1 = L2_1(L3_1)
L3_1 = false
L4_1 = false
L5_1 = false
L6_1 = false
L7_1 = false
L8_1 = true
L9_1 = "41307"
L10_1 = "405a2176357034bc00ecfff342eeb596"
L11_1 = {}
L12_1 = isAndroid
if L12_1 then
  L9_1 = "41065"
  L10_1 = "43229578271bb71b9befc6a078eeb2e7"
end

function L12_1()
  local L0_2, L1_2
  L0_2 = L3_1
  if L0_2 then
    L0_2 = print
    L1_2 = "show Fyber ads"
    L0_2(L1_2)
    L0_2 = L1_1
    L0_2 = L0_2.adsTable
    L0_2.active = true
    L0_2 = false
    L4_1 = L0_2
    L0_2 = L1_1
    L0_2 = L0_2.database
    L0_2 = L0_2.usedAds
    L0_2()
    L0_2 = L11_1
    L0_2 = L0_2.Fyber
    L1_2 = "show_interstitial"
    L0_2(L1_2)
  end
end

L0_1.showAds = L12_1

function L13_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L0_2 = L0_2.adsTable
  L0_2.active = false
end

L0_1.hideAds = L13_1

function L14_1()
  local L0_2, L1_2
  L0_2 = L3_1
  if L0_2 then
    L0_2 = L4_1
    return L0_2
  end
  L0_2 = false
  return L0_2
end

L0_1.isAdReady = L14_1

function L15_1()
  local L0_2, L1_2
  L0_2 = L3_1
  if L0_2 then
    L0_2 = L4_1
    if L0_2 then
      return
    end
    L0_2 = print
    L1_2 = "try to load fyber fullscreen ads"
    L0_2(L1_2)
    L0_2 = L11_1
    L0_2 = L0_2.Fyber
    L1_2 = "load_interstitial"
    L0_2(L1_2)
  end
end

L0_1.preloadAds = L15_1

function L16_1()
  local L0_2, L1_2
  L0_2 = L3_1
  if L0_2 then
    L0_2 = L1_1
    L0_2 = L0_2.adsTable
    L0_2 = L0_2.chances
    L0_2 = L0_2.fyberAdChance
    if L0_2 then
      L0_2 = L1_1
      L0_2 = L0_2.adsTable
      L0_2 = L0_2.chances
      L0_2 = L0_2.fyberAdChance
      return L0_2
    end
    L0_2 = 0
    return L0_2
  else
    L0_2 = 0
    return L0_2
  end
end

L0_1.getChance = L16_1

function L17_1()
  local L0_2, L1_2
  L0_2 = L3_1
  if L0_2 then
    L0_2 = L5_1
    return L0_2
  end
  L0_2 = false
  return L0_2
end

L0_1.isVideoReady = L17_1

function L18_1()
  local L0_2, L1_2
  L0_2 = L17_1
  L0_2 = L0_2()
  if not L0_2 then
    return
  end
  L0_2 = print
  L1_2 = "show Fyber video"
  L0_2(L1_2)
  L0_2 = L1_1
  L0_2 = L0_2.adsTable
  L0_2.active = true
  L0_2 = false
  L5_1 = L0_2
  L0_2 = true
  L6_1 = L0_2
  L0_2 = L11_1
  L0_2 = L0_2.Fyber
  L1_2 = "show_video"
  L0_2(L1_2)
end

L0_1.showVideo = L18_1

function L19_1()
  local L0_2, L1_2
  L0_2 = L3_1
  if L0_2 then
    L0_2 = L17_1
    L0_2 = L0_2()
    if L0_2 then
      return
    end
    L0_2 = print
    L1_2 = "try to load fyber video ads"
    L0_2(L1_2)
    L0_2 = L11_1
    L0_2 = L0_2.Fyber
    L1_2 = "load_video"
    L0_2(L1_2)
  end
end

L0_1.preloadVideo = L19_1

function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = ""
  if A1_2 then
    L3_2 = A1_2
    L4_2 = "    "
    L2_2 = L3_2 .. L4_2
  end
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 == "table" then
    L3_2 = nil
    L4_2 = nil
    L5_2 = pairs
    L6_2 = A0_2
    L5_2, L6_2, L7_2 = L5_2(L6_2)
    for L8_2, L9_2 in L5_2, L6_2, L7_2 do
      L10_2 = L2_2
      L11_2 = "["
      L12_2 = L8_2
      L13_2 = "] => "
      L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2
      L11_2 = type
      L12_2 = L9_2
      L11_2 = L11_2(L12_2)
      if L11_2 == "table" then
        L11_2 = L10_2
        L12_2 = "{"
        L10_2 = L11_2 .. L12_2
        L11_2 = print
        L12_2 = L10_2
        L11_2(L12_2)
        L11_2 = L20_1
        L12_2 = L9_2
        L13_2 = L2_2
        L11_2(L12_2, L13_2)
        L11_2 = print
        L12_2 = L2_2
        L13_2 = "}"
        L12_2 = L12_2 .. L13_2
        L11_2(L12_2)
      else
        L11_2 = L10_2
        L12_2 = tostring
        L13_2 = L9_2
        L12_2 = L12_2(L13_2)
        L10_2 = L11_2 .. L12_2
        L11_2 = print
        L12_2 = L10_2
        L11_2(L12_2)
      end
    end
  else
    L3_2 = print
    L4_2 = L2_2
    L5_2 = tostring
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
    L4_2 = L4_2 .. L5_2
    L3_2(L4_2)
  end
end

function L21_1(A0_2)
  local L1_2, L2_2, L3_2
  if A0_2 then
    L1_2 = A0_2.status
    if L1_2 == "load_interstitial_available" then
      L1_2 = print
      L2_2 = "Found load_interstitial_available"
      L1_2(L2_2)
      L1_2 = true
      L4_1 = L1_2
    end
  end
  L1_2 = print
  L2_2 = "-- InterstitialEvent -----------------------------------------------------"
  L1_2(L2_2)
  L1_2 = L20_1
  L2_2 = A0_2
  L3_2 = "                  "
  L1_2(L2_2, L3_2)
  L1_2 = print
  L2_2 = "--------------------------------------------------------------------------"
  L1_2(L2_2)
end

function L22_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 then
    L1_2 = A0_2.status
    if L1_2 == "load_video_available" then
      L1_2 = print
      L2_2 = "Found load_video_available"
      L1_2(L2_2)
      L1_2 = true
      L5_1 = L1_2
      L1_2 = {}
      L1_2.name = "videoLoadedEvent"
      L2_2 = Runtime
      L3_2 = L2_2
      L2_2 = L2_2.dispatchEvent
      L4_2 = L1_2
      L2_2(L3_2, L4_2)
  end
  elseif A0_2 then
    L1_2 = A0_2.status
    if L1_2 == "show_video_finished" then
      L1_2 = L2_1
      L1_2 = L1_2.onVideoSeen
      L1_2()
    end
  end
  L1_2 = print
  L2_2 = "-- VideoEvent ------------------------------------------------------------"
  L1_2(L2_2)
  L1_2 = L20_1
  L2_2 = A0_2
  L3_2 = "                  "
  L1_2(L2_2, L3_2)
  L1_2 = print
  L2_2 = "--------------------------------------------------------------------------"
  L1_2(L2_2)
end

function L23_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = system
  L0_2 = L0_2.getInfo
  L1_2 = "targetAppStore"
  L0_2 = L0_2(L1_2)
  if L0_2 == "amazon" then
    L0_2 = print
    L1_2 = "Amazon platform: Not starting Fyber"
    L0_2(L1_2)
    return
  end
  L0_2 = L3_1
  if L0_2 then
  else
    L0_2 = isSimulator
    if L0_2 then
      L0_2 = false
      L3_1 = L0_2
      L0_2 = print
      L1_2 = "WARNING: Fyber does not work on the simulator"
      L0_2(L1_2)
    else
      L0_2 = L7_1
      if not L0_2 then
        L0_2 = true
        L7_1 = L0_2
        L0_2 = true
        L3_1 = L0_2
        L0_2 = print
        L1_2 = "started fyber call"
        L0_2(L1_2)
        L0_2 = Runtime
        L1_2 = L0_2
        L0_2 = L0_2.addEventListener
        L2_2 = "InterstitialEvent"
        L3_2 = L21_1
        L0_2(L1_2, L2_2, L3_2)
        L0_2 = Runtime
        L1_2 = L0_2
        L0_2 = L0_2.addEventListener
        L2_2 = "VideoEvent"
        L3_2 = L22_1
        L0_2(L1_2, L2_2, L3_2)
        L0_2 = require
        L1_2 = "fyberLib"
        L0_2 = L0_2(L1_2)
        L11_1 = L0_2
        L0_2 = L11_1
        L0_2 = L0_2.Fyber
        L1_2 = "init"
        L2_2 = L9_1
        L3_2 = L10_1
        L0_2(L1_2, L2_2, L3_2)
      end
    end
  end
end

L0_1.init = L23_1

function L24_1()
  local L0_2, L1_2
  L0_2 = L3_1
  if L0_2 then
    L0_2 = L11_1
    if L0_2 then
      L0_2 = L11_1
      L0_2 = L0_2.Fyber
      L1_2 = "show_integration_status"
      L0_2(L1_2)
  end
  else
    L0_2 = print
    L1_2 = "Fyber not started or module not set."
    L0_2(L1_2)
  end
end

L0_1.showIntegrationStatus = L24_1
return L0_1
