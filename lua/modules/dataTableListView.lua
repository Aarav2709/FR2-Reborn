local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L1_1 = require
L2_1 = "widget"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "composer"
L2_1 = L2_1(L3_1)

function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2, A8_2, A9_2)
  local L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L11_2 = {}
  L12_2 = nil
  L13_2 = nil
  
  function L14_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = A0_3.row
    L2_3 = L10_2
    L3_3 = L1_3.index
    L2_3 = L2_3[L3_3]
    if not L2_3 then
      return
    end
    L3_3 = L1_3.index
    L2_3.rowIndex = L3_3
    L3_3 = {}
    L3_3.params = L2_3
    L3_3.row = L1_3
    L4_3 = A8_2
    L5_3 = L3_3
    L4_3(L5_3)
  end
  
  function L15_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = A0_3.phase
    L2_3 = A0_3.target
    L3_3 = {}
    L3_3.phase = L1_3
    L3_3.row = L2_3
    L3_3.event = A0_3
    L4_3 = A5_2
    L3_3.callback = L4_3
    if "began" == L1_3 then
      L4_3 = true
      L13_2 = L4_3
    elseif "moved" == L1_3 then
      L4_3 = false
      L13_2 = L4_3
    elseif "ended" == L1_3 then
      L4_3 = L13_2
      if L4_3 then
        L4_3 = A9_2
        L5_3 = L3_3
        L4_3(L5_3)
      end
      L4_3 = false
      L13_2 = L4_3
    end
  end
  
  function L16_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = {}
    L1_3 = {}
    L2_3 = 1
    L3_3 = 1
    L4_3 = 1
    L5_3 = 0
    L1_3[1] = L2_3
    L1_3[2] = L3_3
    L1_3[3] = L4_3
    L1_3[4] = L5_3
    L0_3.default = L1_3
    L1_3 = {}
    L2_3 = 0.8627450980392157
    L3_3 = 0.8627450980392157
    L4_3 = 0.8627450980392157
    L1_3[1] = L2_3
    L1_3[2] = L3_3
    L1_3[3] = L4_3
    L2_3 = L12_2
    L3_3 = L2_3
    L2_3 = L2_3.insertRow
    L4_3 = {}
    L5_3 = A4_2
    L4_3.rowHeight = L5_3
    L4_3.rowColor = L0_3
    L4_3.lineColor = L1_3
    L2_3(L3_3, L4_3)
  end
  
  function L17_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L0_3 = 0
    L1_3 = L10_2
    if L1_3 then
      L1_3 = L10_2
      L0_3 = #L1_3
    end
    L1_3 = L12_2
    L2_3 = L1_3
    L1_3 = L1_3.getNumRows
    L1_3 = L1_3(L2_3)
    L2_3 = L1_3 - L0_3
    if 0 < L2_3 then
      L3_3 = {}
      L4_3 = L1_3
      L5_3 = L0_3
      L6_3 = -1
      for L7_3 = L4_3, L5_3, L6_3 do
        L8_3 = #L3_3
        L3_3[L8_3] = L7_3
      end
      L4_3 = L12_2
      L5_3 = L4_3
      L4_3 = L4_3.deleteRows
      L6_3 = L3_3
      L4_3(L5_3, L6_3)
    elseif L2_3 < 0 then
      L3_3 = L1_3 + 1
      L4_3 = L0_3
      L5_3 = 1
      for L6_3 = L3_3, L4_3, L5_3 do
        L7_3 = L16_2
        L7_3()
      end
    end
  end
  
  function L18_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3
    L10_2 = A0_3
    L2_3 = A6_2
    if not L2_3 then
      L2_3 = 0
    end
    L3_3 = A7_2
    if not L3_3 then
      L3_3 = 0
    end
    L4_3 = L1_1
    L4_3 = L4_3.newTableView
    L5_3 = {}
    L6_3 = A1_2
    L5_3.top = L6_3
    L6_3 = A0_2
    L5_3.left = L6_3
    L6_3 = A2_2
    L5_3.width = L6_3
    L6_3 = A3_2
    L5_3.height = L6_3
    L5_3.hideBackground = true
    L5_3.noLines = true
    L6_3 = L14_2
    L5_3.onRowRender = L6_3
    L6_3 = L15_2
    L5_3.listener = L6_3
    L5_3.hideScrollBar = true
    L5_3.topPadding = L2_3
    L5_3.bottomPadding = L3_3
    L4_3 = L4_3(L5_3)
    L12_2 = L4_3
    L5_3 = A1_3
    L4_3 = A1_3.insert
    L6_3 = L12_2
    L4_3(L5_3, L6_3)
    L4_3 = L17_2
    L4_3()
  end
  
  function L19_2()
    local L0_3, L1_3
    L0_3 = L12_2
    if L0_3 then
      L0_3 = L12_2
      L1_3 = L0_3
      L0_3 = L0_3.deleteAllRows
      L0_3(L1_3)
      L0_3 = L12_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L12_2 = L0_3
    end
  end
  
  function L20_2()
    local L0_3, L1_3
    L0_3 = L12_2
    return L0_3
  end
  
  function L21_2()
    local L0_3, L1_3
    L0_3 = L12_2
    if L0_3 then
      L0_3 = L12_2
      L0_3 = L0_3.reloadData
      if L0_3 then
        L0_3 = L12_2
        L1_3 = L0_3
        L0_3 = L0_3.getNumRows
        L0_3 = L0_3(L1_3)
        if 0 < L0_3 then
          L0_3 = L12_2
          L1_3 = L0_3
          L0_3 = L0_3.reloadData
          L0_3(L1_3)
        end
      end
    end
  end
  
  function L22_2(A0_3)
    local L1_3
    L1_3 = L12_2
    L1_3.isVisible = A0_3
  end
  
  function L23_2(A0_3)
    local L1_3
    L10_2 = A0_3
    L1_3 = L17_2
    L1_3()
    L1_3 = L21_2
    L1_3()
  end
  
  L11_2.createTable = L18_2
  L11_2.cleanTable = L19_2
  L11_2.getTable = L20_2
  L11_2.refreshTable = L21_2
  L11_2.setVisible = L22_2
  L11_2.setData = L23_2
  return L11_2
end

L0_1.create = L3_1
return L0_1
