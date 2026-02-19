local L0_1, L1_1
L0_1 = {}

function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = display
  L0_2 = L0_2.newGroup
  L0_2 = L0_2()
  L1_2 = require
  L2_2 = "lua.modules.trails"
  L1_2 = L1_2(L2_2)
  L2_2 = require
  L3_2 = "spine-corona.monsterLoader"
  L2_2 = L2_2(L3_2)
  L3_2 = nil
  L4_2 = display
  L4_2 = L4_2.newImageRect
  L5_2 = "images/gui/clan_v2/portrait_bg.png"
  L6_2 = 164
  L7_2 = 194
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = display
  L5_2 = L5_2.newImageRect
  L6_2 = "images/gui/clan_v2/portrait_border.png"
  L7_2 = 164
  L8_2 = 194
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = nil
  
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = L1_2
    L1_3 = L1_3.createTrail
    L2_3 = A0_3
    L3_3 = L6_2
    L3_3 = L3_3.getGroup
    L3_3 = L3_3()
    L3_3 = L3_3.x
    L3_3 = L3_3 - 5
    L4_3 = L6_2
    L4_3 = L4_3.getGroup
    L4_3 = L4_3()
    L4_3 = L4_3.y
    L4_3 = L4_3 - 50
    L5_3 = monsterContainer
    L1_3(L2_3, L3_3, L4_3, L5_3)
  end
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    if A0_3 == nil then
      return
    end
    L2_3 = L6_2
    if L2_3 then
      L2_3 = L6_2
      L2_3 = L2_3.clean
      L2_3()
      L2_3 = nil
      L6_2 = L2_3
    end
    L2_3 = composer
    L2_3 = L2_3.monsterConverter
    L2_3 = L2_3.fromServerFormat
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    L3_3 = tonumber
    L4_3 = L2_3[6]
    L3_3 = L3_3(L4_3)
    L4_3 = L2_2
    L4_3 = L4_3.new
    L5_3 = L2_3
    L6_3 = nil
    L7_3 = {}
    L8_3 = A1_3
    L7_3[1] = L8_3
    L4_3 = L4_3(L5_3, L6_3, L7_3)
    L6_2 = L4_3
    L4_3 = monsterShowing
    L4_3 = L4_3.getGroup
    L4_3 = L4_3()
    L4_3.x = -4
    L4_3.y = 50
    if A1_3 then
      L5_3 = composer
      L5_3 = L5_3.storeConfig
      L5_3 = L5_3.getItemCategory
      L6_3 = A1_3
      L5_3 = L5_3(L6_3)
      if L5_3 == "balloon" then
        L6_3 = L6_2
        L6_3 = L6_3.playBuffAnimation
        L7_3 = "sacrifice_active"
        L8_3 = true
        L6_3(L7_3, L8_3)
      elseif L5_3 == "magnet" then
        L6_3 = L6_2
        L6_3 = L6_3.playUseAnimation
        L7_3 = "magnet_start"
        L8_3 = 4000
        L6_3(L7_3, L8_3)
      elseif L5_3 == "speed" then
        L6_3 = L6_2
        L6_3 = L6_3.setAnimation
        L7_3 = "run"
        L8_3 = true
        L9_3 = false
        L6_3(L7_3, L8_3, L9_3)
        L6_3 = L6_2
        L6_3 = L6_3.playBuffAnimation
        L7_3 = "speed_start"
        L8_3 = false
        L6_3(L7_3, L8_3)
      elseif L5_3 == "gun" then
        L6_3 = L6_2
        L6_3 = L6_3.playUseAnimation
        L7_3 = "mark_active"
        L8_3 = 4000
        L6_3(L7_3, L8_3)
      elseif L5_3 == "rocket" then
        L6_3 = L6_2
        L6_3 = L6_3.setAnimation
        L7_3 = "rocket_active"
        L8_3 = true
        L9_3 = true
        L6_3(L7_3, L8_3, L9_3)
        L4_3.x = -12
        L4_3.y = 28
      end
    end
    if L3_3 and 0 < L3_3 then
      L5_3 = timer
      L5_3 = L5_3.performWithDelay
      L6_3 = 200
      
      function L7_3()
        local L0_4, L1_4
        L0_4 = L7_2
        L1_4 = L3_3
        L0_4(L1_4)
      end
      
      L8_3 = 0
      L5_3 = L5_3(L6_3, L7_3, L8_3)
      L3_2 = L5_3
    end
  end
  
  function L9_2()
    local L0_3, L1_3
  end
  
  function L10_2()
    local L0_3, L1_3
  end
  
  return L0_2
end

L0_1.create = L1_1
return L0_1
