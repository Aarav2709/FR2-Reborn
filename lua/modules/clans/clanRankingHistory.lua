local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = display
  L1_2 = L1_2.newGroup
  L1_2 = L1_2()
  L1_2.anchorX = 1
  L2_2 = display
  L2_2 = L2_2.newGroup
  L2_2 = L2_2()
  L3_2 = graphics
  L3_2 = L3_2.newMask
  L4_2 = "images/gui/ranking/league/historyMask.png"
  L3_2 = L3_2(L4_2)
  L5_2 = L2_2
  L4_2 = L2_2.setMask
  L6_2 = L3_2
  L4_2(L5_2, L6_2)
  L2_2.maskScaleX = 0.5
  L2_2.maskScaleY = 0.5
  L4_2 = {}
  L5_2 = require
  L6_2 = "lua.modules.uiElements.informationBubble"
  L5_2 = L5_2(L6_2)
  L6_2 = L5_2.create
  L6_2 = L6_2()
  L8_2 = A0_2
  L7_2 = A0_2.insert
  L9_2 = L6_2
  L7_2(L8_2, L9_2)
  
  function L7_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = A1_3.phase
    if L2_3 == "began" then
      A0_3.delta = 0
      L2_3 = A1_3.x
      A0_3.markX = L2_3
      L2_3 = A1_3.y
      A0_3.markY = L2_3
      L2_3 = A1_3.x
      A0_3.startXPos = L2_3
    else
      L2_3 = A1_3.phase
      if L2_3 == "moved" then
        L2_3 = A0_3.markX
        if not L2_3 then
          L2_3 = A1_3.x
          A0_3.markX = L2_3
          L2_3 = A1_3.y
          A0_3.markY = L2_3
        end
        L2_3 = A1_3.x
        L3_3 = A0_3.markX
        L2_3 = L2_3 - L3_3
        A0_3.delta = L2_3
        L2_3 = A0_3.x
        L3_3 = A0_3.delta
        L2_3 = L2_3 + L3_3
        if not (0 < L2_3) then
          L3_3 = L4_2
          L3_3 = #L3_3
          L3_3 = L3_3 * 32
          L3_3 = 128 - L3_3
          if not (L2_3 < L3_3) then
            goto lbl_38
          end
        end
        L2_3 = A0_3.x
        ::lbl_38::
        A0_3.x = L2_3
        L3_3 = A1_3.x
        A0_3.markX = L3_3
      else
        L2_3 = A1_3.phase
        if L2_3 ~= "ended" then
          L2_3 = A1_3.phase
          if L2_3 ~= "cancelled" then
            goto lbl_78
          end
        end
        A0_3.markX = nil
        A0_3.markX = nil
        A0_3.markY = nil
        L2_3 = math
        L2_3 = L2_3.abs
        L3_3 = A0_3.startXPos
        L4_3 = A1_3.x
        L3_3 = L3_3 - L4_3
        L2_3 = L2_3(L3_3)
        if L2_3 < 3 then
          L2_3 = L6_2
          if L2_3 then
            L2_3 = L6_2
            L3_3 = L2_3
            L2_3 = L2_3.toFront
            L2_3(L3_3)
            L2_3 = L6_2
            L2_3 = L2_3.interact
            L3_3 = {}
            L3_3.text = "This is the clan placement history. Newest entries are to the right."
            L4_3 = A1_3.x
            L4_3 = L4_3 + 66
            L3_3.x = L4_3
            L4_3 = A1_3.y
            L4_3 = L4_3 - 38
            L3_3.y = L4_3
            L3_3.arrowHorizontal = "left"
            L3_3.arrowVertical = "bottom"
            L2_3(L3_3)
          end
        end
      end
    end
    ::lbl_78::
    L2_3 = true
    return L2_3
  end
  
  L1_2.touch = L7_2
  
  function L7_2(A0_3)
    local L1_3
    if A0_3 < 2 then
      L1_3 = "gold"
      return L1_3
    elseif A0_3 < 11 then
      L1_3 = "silver"
      return L1_3
    elseif A0_3 < 51 then
      L1_3 = "bronze"
      return L1_3
    end
    L1_3 = nil
    return L1_3
  end
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    if A0_3 then
      L3_3 = A0_3
      L2_3 = A0_3.removeSelf
      L2_3(L3_3)
      A0_3 = nil
    end
    L2_3 = L7_2
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    if L2_3 then
      L3_3 = "_"
      L4_3 = L2_3
      L3_3 = L3_3 .. L4_3
      if L3_3 then
        goto lbl_17
      end
    end
    L3_3 = ""
    ::lbl_17::
    L4_3 = display
    L4_3 = L4_3.newImageRect
    L5_3 = "images/gui/ranking/clans_history"
    L6_3 = L3_3
    L7_3 = ".png"
    L5_3 = L5_3 .. L6_3 .. L7_3
    L6_3 = 30
    L7_3 = 19
    return L4_3(L5_3, L6_3, L7_3)
  end
  
  function L9_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = {}
    L2_3 = 1
    L3_3 = 1
    L4_3 = 1
    L1_3[1] = L2_3
    L1_3[2] = L3_3
    L1_3[3] = L4_3
    L2_3 = L7_2
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    if L2_3 then
      L2_3 = {}
      L3_3 = 0.078
      L4_3 = 0.075
      L5_3 = 0.008
      L2_3[1] = L3_3
      L2_3[2] = L4_3
      L2_3[3] = L5_3
      L1_3 = L2_3
    end
    return L1_3
  end
  
  function L10_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L1_3 = display
    L1_3 = L1_3.newGroup
    L1_3 = L1_3()
    L2_3 = tonumber
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    A0_3 = L2_3
    L2_3 = L9_2
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    L3_3 = L8_2
    L4_3 = nil
    L5_3 = A0_3
    L3_3 = L3_3(L4_3, L5_3)
    L5_3 = L1_3
    L4_3 = L1_3.insert
    L6_3 = L3_3
    L4_3(L5_3, L6_3)
    L4_3 = 12
    if 1000 < A0_3 then
      L4_3 = 11
    end
    L5_3 = L1_1
    L5_3 = L5_3.newText
    L6_3 = {}
    L7_3 = L1_1
    L7_3 = L7_3.clanUtils
    L7_3 = L7_3.formatClanRankingHistoryText
    L8_3 = A0_3
    L7_3 = L7_3(L8_3)
    L6_3.string = L7_3
    L6_3.size = L4_3
    L6_3.color = L2_3
    L5_3 = L5_3(L6_3)
    L7_3 = L1_3
    L6_3 = L1_3.insert
    L8_3 = L5_3
    L6_3(L7_3, L8_3)
    
    function L6_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4
      L1_4 = L5_3
      L2_4 = L1_1
      L2_4 = L2_4.clanUtils
      L2_4 = L2_4.formatClanRankingHistoryText
      L3_4 = A0_4
      L2_4 = L2_4(L3_4)
      L1_4.text = L2_4
      L1_4 = L5_3
      L2_4 = L1_4
      L1_4 = L1_4.setFillColor
      L3_4 = unpack
      L4_4 = L9_2
      L5_4 = A0_4
      L4_4, L5_4 = L4_4(L5_4)
      L3_4, L4_4, L5_4 = L3_4(L4_4, L5_4)
      L1_4(L2_4, L3_4, L4_4, L5_4)
      L1_4 = L8_2
      L2_4 = L3_3
      L3_4 = A0_4
      L1_4 = L1_4(L2_4, L3_4)
      L3_3 = L1_4
      L1_4 = L1_3
      L2_4 = L1_4
      L1_4 = L1_4.insert
      L3_4 = L3_3
      L1_4(L2_4, L3_4)
      L1_4 = L1_3
      L2_4 = L1_4
      L1_4 = L1_4.insert
      L3_4 = L5_3
      L1_4(L2_4, L3_4)
    end
    
    L1_3.updatePlacement = L6_3
    return L1_3
  end
  
  function L11_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = 1
    L1_3 = L4_2
    L1_3 = #L1_3
    L2_3 = 1
    for L3_3 = L0_3, L1_3, L2_3 do
      L4_3 = L4_2
      L4_3 = L4_3[L3_3]
      if L4_3 then
        L5_3 = L4_3.removeSelf
        if L5_3 then
          L5_3 = L4_3.removeSelf
          L5_3()
        end
      end
    end
    L0_3 = {}
    L4_2 = L0_3
  end
  
  L2_2.clearClanLeagueHistory = L11_2
  
  function L12_2()
    local L0_3, L1_3, L2_3
    L0_3 = L4_2
    L0_3 = #L0_3
    L1_3 = L1_2
    L2_3 = L0_3 * 32
    L2_3 = 128 - L2_3
    L1_3.x = L2_3
  end
  
  function L13_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L1_3 = 0
    if A0_3 then
      L1_3 = #A0_3
    end
    L2_3 = 1
    L3_3 = L1_3
    L4_3 = 1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = L4_2
      L6_3 = L6_3[L5_3]
      if L6_3 then
        L6_3 = L4_2
        L6_3 = L6_3[L5_3]
        L6_3 = L6_3.updatePlacement
        L7_3 = A0_3[L5_3]
        L6_3(L7_3)
      else
        L6_3 = L4_2
        L7_3 = L10_2
        L8_3 = A0_3[L5_3]
        L7_3 = L7_3(L8_3)
        L6_3[L5_3] = L7_3
        L6_3 = L4_2
        L6_3 = L6_3[L5_3]
        L7_3 = L5_3 * 32
        L7_3 = -80 + L7_3
        L6_3.x = L7_3
        L6_3 = L1_2
        L7_3 = L6_3
        L6_3 = L6_3.insert
        L8_3 = L4_2
        L8_3 = L8_3[L5_3]
        L6_3(L7_3, L8_3)
      end
    end
    L2_3 = L1_3 + 1
    L3_3 = L4_2
    L3_3 = #L3_3
    L4_3 = 1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = L4_2
      L6_3 = L6_3[L5_3]
      if L6_3 then
        L6_3 = L4_2
        L6_3 = L6_3[L5_3]
        L6_3 = L6_3.removeSelf
        if L6_3 then
          L6_3 = L4_2
          L6_3 = L6_3[L5_3]
          L7_3 = L6_3
          L6_3 = L6_3.removeSelf
          L6_3(L7_3)
          L6_3 = L4_2
          L6_3[L5_3] = nil
        end
      end
    end
    L2_3 = L12_2
    L2_3()
  end
  
  L2_2.setClanLeagueHistory = L13_2
  
  function L14_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L1_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L6_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = nil
    L4_2 = L0_3
    L0_3 = L1_2
    if L0_3 then
      L0_3 = L1_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L1_2 = L0_3
    end
  end
  
  L2_2.clean = L14_2
  L16_2 = L1_2
  L15_2 = L1_2.addEventListener
  L17_2 = "touch"
  L18_2 = L1_2
  L15_2(L16_2, L17_2, L18_2)
  L16_2 = L2_2
  L15_2 = L2_2.insert
  L17_2 = L1_2
  L15_2(L16_2, L17_2)
  return L2_2
end

L0_1.create = L2_1
return L0_1
