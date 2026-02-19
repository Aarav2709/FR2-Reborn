local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2)
  local L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L8_2 = require
  L9_2 = "lua.modules.dataTableListView"
  L8_2 = L8_2(L9_2)
  
  function L9_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    L1_3 = A0_3.row
    L2_3 = A0_3.params
    L3_3 = display
    L3_3 = L3_3.newImageRect
    L4_3 = "images/gui/ranking/cell.png"
    L5_3 = L1_3.contentWidth
    L6_3 = L1_3.contentHeight
    L3_3 = L3_3(L4_3, L5_3, L6_3)
    L3_3.anchorX = 0
    L3_3.anchorY = 0
    L5_3 = L1_3
    L4_3 = L1_3.insert
    L6_3 = L3_3
    L4_3(L5_3, L6_3)
    L3_3.x = 0
    L3_3.y = 0
    L4_3 = L2_3.title
    if L4_3 then
      L4_3 = L1_1
      L4_3 = L4_3.newText
      L5_3 = {}
      L6_3 = L2_3.title
      L5_3.string = L6_3
      L5_3.size = 20
      L5_3.x = 20
      L5_3.y = 20
      L5_3.ax = 0
      L6_3 = {}
      L7_3 = 0
      L8_3 = 0
      L9_3 = 0
      L10_3 = 0.5
      L6_3[1] = L7_3
      L6_3[2] = L8_3
      L6_3[3] = L9_3
      L6_3[4] = L10_3
      L5_3.color = L6_3
      L4_3 = L4_3(L5_3)
      L6_3 = L1_3
      L5_3 = L1_3.insert
      L7_3 = L4_3
      L5_3(L6_3, L7_3)
      return
    end
    L4_3 = L2_3.image
    if L4_3 then
      L4_3 = display
      L4_3 = L4_3.newImageRect
      L5_3 = L2_3.image
      L6_3 = 60
      L7_3 = 60
      L4_3 = L4_3(L5_3, L6_3, L7_3)
      L4_3.anchorX = 0
      L4_3.anchorY = 0
      L6_3 = L1_3
      L5_3 = L1_3.insert
      L7_3 = L4_3
      L5_3(L6_3, L7_3)
      L4_3.x = 5
      L4_3.y = 20
    end
    L4_3 = nil
    L5_3 = nil
    L6_3 = L2_3.n2
    if L6_3 then
      L5_3 = L2_3.n2
    else
      L6_3 = L2_3.n
      if L6_3 then
        L5_3 = L2_3.n
      else
        L6_3 = L2_3.name
        if L6_3 then
          L5_3 = L2_3.name
        end
      end
    end
    if L5_3 then
      L6_3 = L1_1
      L6_3 = L6_3.newText
      L7_3 = {}
      L7_3.string = L5_3
      L7_3.size = 20
      L7_3.x = 20
      L7_3.y = 20
      L7_3.ax = 0
      L6_3 = L6_3(L7_3)
      L4_3 = L6_3
      L7_3 = L1_3
      L6_3 = L1_3.insert
      L8_3 = L4_3
      L6_3(L7_3, L8_3)
    end
    L6_3 = nil
    L7_3 = nil
    L8_3 = L2_3.facebookName
    if L8_3 then
      L8_3 = L1_1
      L8_3 = L8_3.newText
      L9_3 = {}
      L10_3 = L2_3.facebookName
      L9_3.string = L10_3
      L9_3.size = 20
      L9_3.x = 20
      L9_3.y = 20
      L9_3.ax = 0
      L8_3 = L8_3(L9_3)
      L7_3 = L8_3
      L9_3 = L1_3
      L8_3 = L1_3.insert
      L10_3 = L7_3
      L8_3(L9_3, L10_3)
      L7_3.isVisible = false
      L6_3 = "images/gui/friends/fb.png"
    end
    L8_3 = L2_3.clanMember
    if L8_3 then
      L6_3 = "images/gui/friends/messageIconClan.png"
    end
    if L6_3 then
      L8_3 = display
      L8_3 = L8_3.newImageRect
      L9_3 = L6_3
      L10_3 = 18
      L11_3 = 18
      L8_3 = L8_3(L9_3, L10_3, L11_3)
      L8_3.anchorX = 0
      L8_3.anchorY = 0
      L10_3 = L1_3
      L9_3 = L1_3.insert
      L11_3 = L8_3
      L9_3(L10_3, L11_3)
      L8_3.x = 0
      L8_3.y = 12
    end
    L8_3 = display
    L8_3 = L8_3.newImageRect
    L9_3 = "images/gui/friends/roundAdd.png"
    L10_3 = 36
    L11_3 = 36
    L8_3 = L8_3(L9_3, L10_3, L11_3)
    L8_3.anchorX = 0
    L8_3.anchorY = 0
    L10_3 = L1_3
    L9_3 = L1_3.insert
    L11_3 = L8_3
    L9_3(L10_3, L11_3)
    L8_3.x = 130
    L8_3.y = 2
    L9_3 = display
    L9_3 = L9_3.newImageRect
    L10_3 = "images/gui/customplay/roundSent.png"
    L11_3 = 36
    L12_3 = 36
    L9_3 = L9_3(L10_3, L11_3, L12_3)
    L9_3.anchorX = 0
    L9_3.anchorY = 0
    L11_3 = L1_3
    L10_3 = L1_3.insert
    L12_3 = L9_3
    L10_3(L11_3, L12_3)
    L10_3 = L8_3.x
    L9_3.x = L10_3
    L10_3 = L8_3.y
    L9_3.y = L10_3
    L9_3.isVisible = false
    L10_3 = L2_3.autoSend
    if L10_3 then
      L9_3.isVisible = true
    end
    
    function L10_3()
      local L0_4, L1_4
      L0_4 = L7_3
      if L0_4 then
        L0_4 = L4_3
        if L0_4 then
          L0_4 = L7_3
          L0_4 = L0_4.isVisible
          if L0_4 then
            L0_4 = L7_3
            L0_4.isVisible = false
            L0_4 = L4_3
            L0_4.isVisible = true
          else
            L0_4 = L7_3
            L0_4.isVisible = true
            L0_4 = L4_3
            L0_4.isVisible = false
          end
        end
      end
    end
    
    function L11_3()
      local L0_4, L1_4
      L0_4 = L9_3
      L0_4.isVisible = true
      L0_4 = L2_3
      L0_4 = L0_4.p
      if not L0_4 then
        L0_4 = L2_3
        L0_4 = L0_4.playerId
      end
      return L0_4
    end
    
    L1_3.getId = L11_3
    L1_3.toggleName = L10_3
  end
  
  function L10_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = A0_3.event
    L2_3 = A0_3.row
    L3_3 = A0_3.callback
    L4_3 = L1_3.x
    if 420 < L4_3 then
      L4_3 = L2_3.getId
      if L4_3 then
        L4_3 = L3_3
        L5_3 = L2_3.getId
        L5_3 = L5_3()
        L4_3(L5_3)
    end
    else
      L4_3 = L2_3.toggleName
      if L4_3 then
        L4_3 = L2_3.toggleName
        L4_3()
      end
    end
  end
  
  L11_2 = L8_2.create
  L12_2 = A0_2
  L13_2 = A1_2
  L14_2 = A2_2
  L15_2 = A3_2
  L16_2 = A4_2
  L17_2 = A5_2
  L18_2 = A6_2
  L19_2 = A7_2
  L20_2 = L9_2
  L21_2 = L10_2
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  return L11_2
end

L0_1.create = L2_1
return L0_1
