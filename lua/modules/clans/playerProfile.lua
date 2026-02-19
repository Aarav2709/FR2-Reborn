local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = {}
  L1_2 = display
  L1_2 = L1_2.newGroup
  L1_2 = L1_2()
  L2_2 = setmetatable
  L3_2 = L0_2
  L4_2 = {}
  
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = rawget
    L3_3 = A0_3
    L4_3 = A1_3
    L2_3 = L2_3(L3_3, L4_3)
    if L2_3 ~= nil then
      L2_3 = rawget
      L3_3 = A0_3
      L4_3 = A1_3
      return L2_3(L3_3, L4_3)
    end
    if A1_3 == "group" then
      L2_3 = L1_2
      return L2_3
    end
    L2_3 = L1_2
    L2_3 = L2_3[A1_3]
    return L2_3
  end
  
  L4_2.__index = L5_2
  
  function L5_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3
    L3_3 = L1_2
    L3_3 = L3_3[A1_3]
    if L3_3 then
      L3_3 = L1_2
      L3_3[A1_3] = A2_3
    else
      L3_3 = rawset
      L4_3 = A0_3
      L5_3 = A1_3
      L6_3 = A2_3
      L3_3(L4_3, L5_3, L6_3)
    end
  end
  
  L4_2.__newindex = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = require
  L3_2 = "lua.modules.trails"
  L2_2 = L2_2(L3_2)
  L3_2 = require
  L4_2 = "spine-corona.monsterLoader"
  L3_2 = L3_2(L4_2)
  L4_2 = display
  L4_2 = L4_2.newContainer
  L5_2 = 98
  L6_2 = 112
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = display
  L5_2 = L5_2.newImageRect
  L6_2 = "images/gui/clan_v2/member_list/portrait_bg.png"
  L7_2 = 155
  L8_2 = 135
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L7_2 = L1_2
  L6_2 = L1_2.insert
  L8_2 = L5_2
  L6_2(L7_2, L8_2)
  L7_2 = L1_2
  L6_2 = L1_2.insert
  L8_2 = L4_2
  L6_2(L7_2, L8_2)
  L6_2 = display
  L6_2 = L6_2.newImageRect
  L7_2 = "images/gui/clan_v2/member_list/portrait_border.png"
  L8_2 = 156
  L9_2 = 135
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L8_2 = L1_2
  L7_2 = L1_2.insert
  L9_2 = L6_2
  L7_2(L8_2, L9_2)
  L7_2 = nil
  L8_2 = nil
  L9_2 = nil
  L10_2 = nil
  L11_2 = nil
  
  function L12_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L1_1
    L0_3 = L0_3.newText
    L1_3 = {}
    L1_3.string = ""
    L1_3.size = 15
    L1_3.x = -28
    L1_3.y = 56
    L1_3.ax = 0.5
    L2_3 = {}
    L3_3 = 1
    L4_3 = 1
    L5_3 = 1
    L2_3[1] = L3_3
    L2_3[2] = L4_3
    L2_3[3] = L5_3
    L1_3.color = L2_3
    L0_3 = L0_3(L1_3)
    L10_2 = L0_3
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L10_2
    L0_3(L1_3, L2_3)
  end
  
  function L13_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = ""
    L2_3 = A0_3
    A0_3 = L1_3 .. L2_3
    L1_3 = string
    L1_3 = L1_3.find
    L2_3 = A0_3
    L3_3 = "%."
    L1_3 = L1_3(L2_3, L3_3)
    if L1_3 then
      L2_3 = L1_3 + 2
      L3_3 = string
      L3_3 = L3_3.len
      L4_3 = A0_3
      L3_3 = L3_3(L4_3)
      if L2_3 < L3_3 then
        L3_3 = A0_3
        L2_3 = A0_3.sub
        L4_3 = L1_3 + 1
        L5_3 = L1_3 + 2
        L2_3 = L2_3(L3_3, L4_3, L5_3)
        if L2_3 == "00" then
          L4_3 = A0_3
          L3_3 = A0_3.sub
          L5_3 = 1
          L6_3 = L1_3 - 1
          L3_3 = L3_3(L4_3, L5_3, L6_3)
          L4_3 = ""
          L5_3 = L3_3
          A0_3 = L4_3 .. L5_3
        else
          L4_3 = A0_3
          L3_3 = A0_3.sub
          L5_3 = 1
          L6_3 = L1_3 + 2
          L3_3 = L3_3(L4_3, L5_3, L6_3)
          L4_3 = ""
          L5_3 = L3_3
          A0_3 = L4_3 .. L5_3
        end
      else
        L2_3 = L1_3 + 2
        L3_3 = string
        L3_3 = L3_3.len
        L4_3 = A0_3
        L3_3 = L3_3(L4_3)
        if L2_3 == L3_3 then
        else
          L2_3 = L1_3 + 1
          L3_3 = string
          L3_3 = L3_3.len
          L4_3 = A0_3
          L3_3 = L3_3(L4_3)
          if L2_3 == L3_3 then
          else
            L2_3 = string
            L2_3 = L2_3.len
            L3_3 = A0_3
            L2_3 = L2_3(L3_3)
            if L1_3 == L2_3 then
            else
            end
          end
        end
      end
    end
    return A0_3
  end
  
  function L14_2()
    local L0_3, L1_3
    L0_3 = L5_2
    L0_3.isVisible = false
    L0_3 = L4_2
    L0_3.isVisible = false
    L0_3 = L6_2
    L0_3.isVisible = false
    L0_3 = L10_2
    L0_3.isVisible = false
  end
  
  L0_2.hide = L14_2
  
  function L14_2()
    local L0_3, L1_3
    L0_3 = L5_2
    L0_3.isVisible = true
    L0_3 = L4_2
    L0_3.isVisible = true
    L0_3 = L6_2
    L0_3.isVisible = true
    L0_3 = L10_2
    L0_3.isVisible = true
  end
  
  L0_2.show = L14_2
  
  function L14_2()
    local L0_3, L1_3
    L0_3 = L7_2
    if L0_3 then
      L0_3 = L7_2
      L0_3 = L0_3.clean
      L0_3()
      L0_3 = nil
      L7_2 = L0_3
    end
    L0_3 = L8_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L8_2
      L0_3(L1_3)
      L0_3 = nil
      L8_2 = L0_3
    end
  end
  
  function L15_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L2_2
    L0_3 = L0_3.createTrail
    L1_3 = L9_2
    L2_3 = L7_2
    L2_3 = L2_3.getGroup
    L2_3 = L2_3()
    L2_3 = L2_3.x
    L2_3 = L2_3 - 5
    L3_3 = L7_2
    L3_3 = L3_3.getGroup
    L3_3 = L3_3()
    L3_3 = L3_3.y
    L3_3 = L3_3 - 50
    L4_3 = L4_2
    L0_3(L1_3, L2_3, L3_3, L4_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L2_3 = L2_3.getGroup
    L2_3, L3_3, L4_3 = L2_3()
    L0_3(L1_3, L2_3, L3_3, L4_3)
  end
  
  function L16_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    if A0_3 == nil then
      return
    end
    L3_3 = L14_2
    L3_3()
    L3_3 = L1_1
    L3_3 = L3_3.monsterConverter
    L3_3 = L3_3.fromServerFormat
    L4_3 = A0_3
    L3_3 = L3_3(L4_3)
    L4_3 = tonumber
    L5_3 = L3_3[6]
    L4_3 = L4_3(L5_3)
    L9_2 = L4_3
    L4_3 = L3_2
    L4_3 = L4_3.new
    L5_3 = L3_3
    L6_3 = nil
    L7_3 = {}
    L8_3 = A1_3
    L7_3[1] = L8_3
    L8_3 = A2_3
    L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3)
    L7_2 = L4_3
    L4_3 = L7_2
    L4_3 = L4_3.getGroup
    L4_3 = L4_3()
    L4_3.xScale = 0.4
    L4_3.yScale = 0.4
    L4_3.x = 0
    L4_3.y = 50
    L5_3 = L4_2
    L5_3.anchorX = 0
    L5_3 = L4_2
    L5_3.anchorY = 0
    L5_3 = L4_2
    L5_3.x = -76
    L5_3 = L4_2
    L5_3.y = -66
    if A1_3 then
      L5_3 = L1_1
      L5_3 = L5_3.storeConfig
      L5_3 = L5_3.getItemCategory
      L6_3 = A1_3
      L5_3 = L5_3(L6_3)
      if L5_3 == "balloon" then
        L6_3 = L7_2
        L6_3 = L6_3.playBuffAnimation
        L7_3 = "sacrifice_active"
        L8_3 = true
        L6_3(L7_3, L8_3)
      elseif L5_3 == "magnet" then
        L6_3 = L7_2
        L6_3 = L6_3.playUseAnimation
        L7_3 = "magnet_start"
        L8_3 = 4000
        L6_3(L7_3, L8_3)
      elseif L5_3 == "speed" then
        L6_3 = L7_2
        L6_3 = L6_3.setAnimation
        L7_3 = "run"
        L8_3 = true
        L9_3 = false
        L6_3(L7_3, L8_3, L9_3)
        L6_3 = L7_2
        L6_3 = L6_3.playBuffAnimation
        L7_3 = "speed_start"
        L8_3 = false
        L6_3(L7_3, L8_3)
      elseif L5_3 == "gun" then
        L6_3 = L7_2
        L6_3 = L6_3.playUseAnimation
        L7_3 = "mark_active"
        L8_3 = 4000
        L6_3(L7_3, L8_3)
      elseif L5_3 == "rocket" then
        L6_3 = L7_2
        L6_3 = L6_3.setAnimation
        L7_3 = "rocket_active"
        L8_3 = true
        L9_3 = true
        L6_3(L7_3, L8_3, L9_3)
        L4_3.x = -12
        L4_3.y = 28
      end
    end
    L5_3 = L9_2
    if L5_3 then
      L5_3 = L9_2
      if 0 < L5_3 then
        L5_3 = timer
        L5_3 = L5_3.performWithDelay
        L6_3 = 200
        L7_3 = L15_2
        L8_3 = 0
        L5_3 = L5_3(L6_3, L7_3, L8_3)
        L8_2 = L5_3
      end
    end
    L5_3 = L4_2
    L6_3 = L5_3
    L5_3 = L5_3.insert
    L7_3 = L4_3
    L5_3(L6_3, L7_3)
  end
  
  L0_2.createMonsterModules = L16_2
  
  function L16_2(A0_3)
    local L1_3
    L1_3 = L10_2
    L1_3.text = A0_3
  end
  
  L0_2.setName = L16_2
  
  function L16_2()
    local L0_3, L1_3
    L0_3 = L14_2
    L0_3()
  end
  
  L0_2.clean = L16_2
  L16_2 = L12_2
  L16_2()
  return L0_2
end

L0_1.new = L2_1
return L0_1
