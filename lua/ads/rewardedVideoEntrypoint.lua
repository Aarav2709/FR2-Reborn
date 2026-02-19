local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L1_1 = require
L2_1 = "lua.ads.videoModule"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "composer"
L2_1 = L2_1(L3_1)

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L1_2 = display
  L1_2 = L1_2.newGroup
  L1_2 = L1_2()
  L2_2 = nil
  L3_2 = require
  L4_2 = "lua.ads.rewardedVideoPoolInfo"
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2.init
  L4_2 = L4_2()
  L5_2 = require
  L6_2 = "lua.modules.currencyDisplay"
  L5_2 = L5_2(L6_2)
  L6_2 = L5_2.create
  L6_2 = L6_2()
  L6_2.y = -150
  L7_2 = nil
  L8_2 = false
  L9_2 = true
  L10_2 = nil
  L11_2 = nil
  L12_2 = false
  
  function L13_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L12_2
    if L1_3 then
      return
    end
    L1_3 = L7_2
    if L1_3 then
      L1_3 = transition
      L1_3 = L1_3.cancel
      L2_3 = L7_2
      L1_3(L2_3)
      L1_3 = nil
      L7_2 = L1_3
    end
    L1_3 = transition
    L1_3 = L1_3.to
    L2_3 = L6_2
    L3_3 = {}
    L3_3.time = 300
    L3_3.y = A0_3
    L1_3 = L1_3(L2_3, L3_3)
    L7_2 = L1_3
  end
  
  function L14_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    
    function L0_3()
      local L0_4, L1_4
      L0_4 = true
      L9_2 = L0_4
    end
    
    L1_3 = L8_2
    if not L1_3 then
      L1_3 = L9_2
      if L1_3 then
        L1_3 = false
        L9_2 = L1_3
        L1_3 = L2_1
        L1_3 = L1_3.analytics
        L1_3 = L1_3.newEvent
        L2_3 = "design"
        L3_3 = {}
        L3_3.event_id = "rewardedChests:mainMenu:open"
        L4_3 = "videos left: "
        L5_3 = L2_1
        L5_3 = L5_3.videosLeft
        if not L5_3 then
          L5_3 = "unknown"
        end
        L4_3 = L4_3 .. L5_3
        L3_3.area = L4_3
        L1_3(L2_3, L3_3)
        L1_3 = L2_1
        L1_3 = L1_3.analytics
        L1_3 = L1_3.ResourceData
        L1_3.itemId = "mainMenuVideo"
        L1_3 = L2_1
        L1_3 = L1_3.adsTable
        L1_3.boostVideoActive = true
        L1_3 = L1_1
        L1_3 = L1_3.showAd
        L1_3 = L1_3()
        L8_2 = L1_3
        L2_3 = timer
        L2_3 = L2_3.performWithDelay
        L3_3 = 1000
        L4_3 = L0_3
        L5_3 = 1
        L2_3 = L2_3(L3_3, L4_3, L5_3)
        L10_2 = L2_3
        L2_3 = L13_2
        L3_3 = 0
        L2_3(L3_3)
      end
    end
  end
  
  L15_2 = L2_1
  L15_2 = L15_2.newButton
  L16_2 = {}
  L16_2.image = "images/gui/mainMenu/buttonVideo_small.png"
  L16_2.width = 55
  L16_2.height = 53
  L16_2.onRelease = L14_2
  L16_2.x = 453
  L16_2.y = 90
  L15_2 = L15_2(L16_2)
  
  function L16_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = true
    L12_2 = L0_3
    L0_3 = L10_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L10_2
      L0_3(L1_3)
      L0_3 = nil
      L10_2 = L0_3
    end
    L0_3 = L11_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L11_2
      L0_3(L1_3)
      L0_3 = nil
      L11_2 = L0_3
    end
    L0_3 = L7_2
    if L0_3 then
      L0_3 = transition
      L0_3 = L0_3.cancel
      L1_3 = L7_2
      L0_3(L1_3)
      L0_3 = nil
      L7_2 = L0_3
    end
    L0_3 = L6_2
    if L0_3 then
      L0_3 = L6_2
      L0_3 = L0_3.clean
      if L0_3 then
        L0_3 = L6_2
        L0_3 = L0_3.clean
        L0_3()
      end
    end
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "seenVideoAdEvent"
    L3_3 = L2_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L15_2
    L0_3(L1_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.removeSelf
    L0_3(L1_3)
    L0_3 = nil
    L1_2 = L0_3
  end
  
  function L17_2()
    local L0_3, L1_3
    L0_3 = L6_2
    L0_3 = L0_3.refreshMoney
    
    function L1_3()
      local L0_4, L1_4, L2_4, L3_4
      L0_4 = timer
      L0_4 = L0_4.performWithDelay
      L1_4 = 750
      
      function L2_4()
        local L0_5, L1_5
        L0_5 = L13_2
        if L0_5 then
          L0_5 = L13_2
          L1_5 = -150
          L0_5(L1_5)
        end
      end
      
      L3_4 = 1
      L0_4(L1_4, L2_4, L3_4)
    end
    
    L0_3(L1_3)
  end
  
  function L18_2()
    local L0_3, L1_3
    L0_3 = L17_2
    L0_3()
  end
  
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "seenVideoAdEvent"
    L3_3 = L2_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L15_2
    L0_3.isVisible = false
    L0_3 = L4_2
    L0_3 = L0_3.getChestRewardData
    L0_3 = L0_3()
    L1_3 = L4_2
    L1_3 = L1_3.updateAndClearPoolState
    L1_3()
    if L0_3 == nil then
      L1_3 = L2_1
      L1_3 = L1_3.analytics
      L1_3 = L1_3.newEvent
      L2_3 = "unhandledError"
      L3_3 = {}
      L3_3.message = "No chest data when done with video. Main Menu"
      L3_3.severity = "warning"
      L1_3(L2_3, L3_3)
      return
    end
    L1_3 = L4_2
    L1_3 = L1_3.findChestRewardValue
    L2_3 = 0
    L1_3 = L1_3(L2_3)
    L2_3 = L0_3.type
    L3_3 = L0_3.multiplier
    L4_3 = timer
    L4_3 = L4_3.performWithDelay
    L5_3 = 500
    
    function L6_3()
      local L0_4, L1_4, L2_4, L3_4
      L0_4 = L2_1
      L0_4 = L0_4.comm
      L0_4 = L0_4.seenBoostVideoSingle
      L1_4 = L1_3
      L2_4 = L2_3
      L3_4 = L3_3
      L0_4(L1_4, L2_4, L3_4)
    end
    
    L7_3 = 1
    L4_3 = L4_3(L5_3, L6_3, L7_3)
    L11_2 = L4_3
  end
  
  function L19_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L4_2
    L0_3 = L0_3.getChestInfo
    L1_3 = A0_2
    L0_3(L1_3)
    L0_3 = L4_2
    L0_3 = L0_3.getChestRewardData
    L0_3 = L0_3()
    if L0_3 then
      L0_3 = L2_1
      L0_3 = L0_3.analytics
      L0_3 = L0_3.newEvent
      L1_3 = "design"
      L2_3 = {}
      L2_3.event_id = "rewardedChests:mainMenu:offer"
      L3_3 = "videos left: "
      L4_3 = L2_1
      L4_3 = L4_3.videosLeft
      if not L4_3 then
        L4_3 = "unknown"
      end
      L3_3 = L3_3 .. L4_3
      L2_3.area = L3_3
      L0_3(L1_3, L2_3)
      L0_3 = L1_2
      L0_3.isVisible = true
      return
    end
    L0_3 = L1_2
    L0_3.isVisible = false
  end
  
  L21_2 = L1_2
  L20_2 = L1_2.insert
  L22_2 = L15_2
  L20_2(L21_2, L22_2)
  L21_2 = L1_2
  L20_2 = L1_2.insert
  L22_2 = L6_2
  L20_2(L21_2, L22_2)
  L20_2 = Runtime
  L21_2 = L20_2
  L20_2 = L20_2.addEventListener
  L22_2 = "seenVideoAdEvent"
  L23_2 = L2_2
  L20_2(L21_2, L22_2, L23_2)
  L20_2 = L19_2
  L20_2()
  L1_2.clean = L16_2
  L1_2.onCommCallback = L18_2
  return L1_2
end

L0_1.init = L3_1
return L0_1
