local L0_1, L1_1
L0_1 = {}

function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2)
  local L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L8_2 = require
  L9_2 = "lua.modules.dataTableListView"
  L8_2 = L8_2(L9_2)
  L9_2 = nil
  
  function L10_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L1_3 = A0_3.row
    L2_3 = A0_3.params
    L3_3 = require
    L4_3 = "lua.modules.clans.clanHubPlayerEntry"
    L3_3 = L3_3(L4_3)
    L4_3 = display
    L4_3 = L4_3.newRect
    L5_3 = 0
    L6_3 = 0
    L7_3 = L1_3.contentWidth
    L8_3 = L1_3.contentHeight
    L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3)
    L5_3 = {}
    L6_3 = 0.9568627450980393
    L7_3 = 0.8862745098039215
    L8_3 = 0.7725490196078432
    L5_3[1] = L6_3
    L5_3[2] = L7_3
    L5_3[3] = L8_3
    L6_3 = L1_3.index
    L6_3 = L6_3 % 2
    if L6_3 == 1 then
      L6_3 = {}
      L7_3 = 0.8745098039215686
      L8_3 = 0.792156862745098
      L9_3 = 0.6627450980392157
      L6_3[1] = L7_3
      L6_3[2] = L8_3
      L6_3[3] = L9_3
      L5_3 = L6_3
    end
    L6_3 = {}
    L7_3 = 0.6235294117647059
    L8_3 = 0.8784313725490196
    L9_3 = 0.5215686274509804
    L6_3[1] = L7_3
    L6_3[2] = L8_3
    L6_3[3] = L9_3
    L7_3 = L4_3.setFillColor
    if L7_3 then
      L8_3 = L4_3
      L7_3 = L4_3.setFillColor
      L9_3 = unpack
      L10_3 = L5_3
      L9_3, L10_3, L11_3 = L9_3(L10_3)
      L7_3(L8_3, L9_3, L10_3, L11_3)
    end
    L4_3.anchorX = 0
    L4_3.anchorY = 0
    L8_3 = L1_3
    L7_3 = L1_3.insert
    L9_3 = L4_3
    L7_3(L8_3, L9_3)
    L4_3.x = 0
    L4_3.y = -8
    L7_3 = L3_3.create
    L8_3 = L2_3
    L7_3 = L7_3(L8_3)
    L9_3 = L1_3
    L8_3 = L1_3.insert
    L10_3 = L7_3
    L8_3(L9_3, L10_3)
    
    function L8_3()
      local L0_4, L1_4
      L0_4 = L2_3
      L0_4 = L0_4.playerId
      return L0_4
    end
    
    L1_3.getPlayerId = L8_3
    
    function L9_3()
      local L0_4, L1_4, L2_4, L3_4
      L0_4 = L4_3
      L0_4 = L0_4.setFillColor
      if L0_4 then
        L0_4 = L4_3
        L1_4 = L0_4
        L0_4 = L0_4.setFillColor
        L2_4 = unpack
        L3_4 = L5_3
        L2_4, L3_4 = L2_4(L3_4)
        L0_4(L1_4, L2_4, L3_4)
      end
      L0_4 = L7_3
      L0_4 = L0_4.deSelect
      L0_4()
    end
    
    L1_3.deSelect = L9_3
    
    function L10_3()
      local L0_4, L1_4, L2_4, L3_4
      L0_4 = L9_2
      if L0_4 then
        L0_4 = L9_2
        L0_4 = L0_4.deSelect
        L0_4()
      end
      L0_4 = L4_3
      L0_4 = L0_4.setFillColor
      if L0_4 then
        L0_4 = L4_3
        L1_4 = L0_4
        L0_4 = L0_4.setFillColor
        L2_4 = unpack
        L3_4 = L6_3
        L2_4, L3_4 = L2_4(L3_4)
        L0_4(L1_4, L2_4, L3_4)
      end
      L0_4 = L7_3
      L0_4 = L0_4.setSelected
      L0_4()
      L0_4 = L1_3
      L9_2 = L0_4
    end
    
    L1_3.setSelected = L10_3
    L11_3 = L2_3.selected
    if L11_3 then
      L11_3 = L10_3
      L11_3()
    else
      L11_3 = L9_3
      L11_3()
    end
  end
  
  function L11_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = A0_3.event
    L2_3 = A0_3.row
    L3_3 = A0_3.callback
    if L3_3 then
      L4_3 = L2_3.getPlayerId
      if L4_3 then
        L4_3 = L3_3
        L5_3 = L2_3.getPlayerId
        L5_3 = L5_3()
        L6_3 = L2_3
        L4_3(L5_3, L6_3)
      end
    end
  end
  
  L12_2 = L8_2.create
  L13_2 = A0_2
  L14_2 = A1_2
  L15_2 = A2_2
  L16_2 = A3_2
  L17_2 = A4_2
  L18_2 = A5_2
  L19_2 = A6_2
  L20_2 = A7_2
  L21_2 = L10_2
  L22_2 = L11_2
  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
  return L12_2
end

L0_1.create = L1_1
return L0_1
