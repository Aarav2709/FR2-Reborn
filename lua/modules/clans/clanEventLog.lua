local L0_1, L1_1
L0_1 = {}

function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = display
  L0_2 = L0_2.newGroup
  L0_2 = L0_2()
  L1_2 = require
  L2_2 = "lua.modules.tableHelper"
  L1_2 = L1_2(L2_2)
  L2_2 = require
  L3_2 = "lua.modules.clans.clanEventParser"
  L2_2 = L2_2(L3_2)
  L3_2 = 12
  L4_2 = 140
  L5_2 = L1_2.new
  L6_2 = 0
  L7_2 = 0
  L8_2 = L4_2
  L9_2 = 86
  L10_2 = nil
  L11_2 = nil
  L12_2 = "clanChat"
  
  function L13_2()
    local L0_3, L1_3
  end
  
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L6_2 = L5_2.createTable
  L7_2 = {}
  L8_2 = L0_2
  L6_2(L7_2, L8_2)
  
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3
    L1_3 = L5_2
    L1_3 = L1_3.getTable
    L1_3 = L1_3()
    if not L1_3 then
      return
    end
    L3_3 = L1_3
    L2_3 = L1_3.deleteAllRows
    L2_3(L3_3)
    L2_3 = 1
    L3_3 = #A0_3
    L4_3 = 1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = A0_3[L5_3]
      L7_3 = L3_2
      L6_3.textSize = L7_3
      L6_3 = A0_3[L5_3]
      L7_3 = L4_2
      L6_3.textWidth = L7_3
      L6_3 = L2_2
      L6_3 = L6_3.parseEvent
      L7_3 = A0_3[L5_3]
      L6_3 = L6_3(L7_3)
      L7_3 = math
      L7_3 = L7_3.ceil
      L8_3 = L6_3.contentHeight
      L7_3 = L7_3(L8_3)
      L7_3 = L7_3 + 6
      if L1_3 then
        L9_3 = L1_3
        L8_3 = L1_3.insertRow
        L10_3 = {}
        L10_3.rowHeight = L7_3
        L11_3 = {}
        L12_3 = {}
        L13_3 = 1
        L14_3 = 1
        L15_3 = 1
        L16_3 = 0
        L12_3[1] = L13_3
        L12_3[2] = L14_3
        L12_3[3] = L15_3
        L12_3[4] = L16_3
        L11_3.default = L12_3
        L10_3.rowColor = L11_3
        L11_3 = {}
        L12_3 = 0.8627450980392157
        L13_3 = 0.8627450980392157
        L14_3 = 0.8627450980392157
        L11_3[1] = L12_3
        L11_3[2] = L13_3
        L11_3[3] = L14_3
        L10_3.lineColor = L11_3
        L11_3 = A0_3[L5_3]
        L10_3.params = L11_3
        L8_3(L9_3, L10_3)
      end
      L9_3 = L6_3
      L8_3 = L6_3.removeSelf
      L8_3(L9_3)
      L6_3 = nil
    end
    L2_3 = #A0_3
    if 0 < L2_3 then
      L3_3 = L1_3
      L2_3 = L1_3.scrollToIndex
      L5_3 = L1_3
      L4_3 = L1_3.getNumRows
      L4_3 = L4_3(L5_3)
      L5_3 = 200
      
      function L6_3()
        local L0_4, L1_4
      end
      
      L2_3(L3_3, L4_3, L5_3, L6_3)
    end
  end
  
  L0_2.updateEventLog = L6_2
  
  function L7_2()
    local L0_3, L1_3
    L0_3 = L5_2
    L0_3 = L0_3.cleanTable
    L0_3()
  end
  
  L0_2.clean = L7_2
  return L0_2
end

L0_1.create = L1_1
return L0_1
