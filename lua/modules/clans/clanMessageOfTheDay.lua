local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L1_2 = display
  L1_2 = L1_2.newGroup
  L1_2 = L1_2()
  L2_2 = require
  L3_2 = "lua.modules.textBoxModule"
  L2_2 = L2_2(L3_2)
  L3_2 = false
  L4_2 = {}
  L5_2 = 0
  L6_2 = 0
  L7_2 = 0
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L5_2 = {}
  L6_2 = 0.3
  L7_2 = 0.3
  L8_2 = 0.3
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L6_2 = 11
  L7_2 = nil
  L8_2 = nil
  L9_2 = nil
  L10_2 = nil
  L11_2 = nil
  L12_2 = A0_2
  L13_2 = display
  L13_2 = L13_2.newImageRect
  L14_2 = "images/gui/clan_v2/motd.png"
  L15_2 = 225
  L16_2 = 48
  L13_2 = L13_2(L14_2, L15_2, L16_2)
  L7_2 = L13_2
  L13_2 = L1_1
  L13_2 = L13_2.newText
  L14_2 = {}
  L15_2 = L1_1
  L15_2 = L15_2.localized
  L15_2 = L15_2.get
  L16_2 = "????"
  L15_2 = L15_2(L16_2)
  L14_2.string = L15_2
  L14_2.size = L6_2
  L14_2.x = 0
  L14_2.y = -24
  L14_2.ay = 0
  L14_2.color = L4_2
  L14_2.width = 200
  L14_2.height = 34
  L13_2 = L13_2(L14_2)
  L8_2 = L13_2
  L13_2 = L1_1
  L13_2 = L13_2.newText
  L14_2 = {}
  L14_2.string = "- ????"
  L14_2.size = L6_2
  L14_2.x = 90
  L14_2.y = 21
  L14_2.ax = 1
  L14_2.ay = 1
  L14_2.color = L5_2
  L13_2 = L13_2(L14_2)
  L9_2 = L13_2
  L14_2 = L1_2
  L13_2 = L1_2.insert
  L15_2 = L7_2
  L13_2(L14_2, L15_2)
  L14_2 = L1_2
  L13_2 = L1_2.insert
  L15_2 = L8_2
  L13_2(L14_2, L15_2)
  L14_2 = L1_2
  L13_2 = L1_2.insert
  L15_2 = L9_2
  L13_2(L14_2, L15_2)
  
  function L13_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = L8_2
    L2_3.text = A0_3
    L2_3 = L9_2
    L3_3 = "- "
    L4_3 = A1_3 or L4_3
    if not A1_3 then
      L4_3 = ""
    end
    L3_3 = L3_3 .. L4_3
    L2_3.text = L3_3
  end
  
  L1_2.setMessageOfTheDay = L13_2
  
  function L14_2(A0_3)
    local L1_3
    L1_3 = L10_2
    L1_3.isVisible = A0_3
  end
  
  L1_2.showEditButton = L14_2
  
  function L15_2()
    local L0_3, L1_3
    L0_3 = L8_2
    L0_3.isVisible = false
    L0_3 = L9_2
    L0_3.isVisible = false
    L0_3 = L14_2
    L1_3 = false
    L0_3(L1_3)
    L0_3 = L11_2
    L0_3 = L0_3.show
    L1_3 = L8_2
    L1_3 = L1_3.text
    L0_3(L1_3)
  end
  
  function L16_2()
    local L0_3, L1_3
    L0_3 = L8_2
    L0_3.isVisible = true
    L0_3 = L9_2
    L0_3.isVisible = true
    L0_3 = L14_2
    L1_3 = L12_2
    L0_3(L1_3)
    L0_3 = L11_2
    L0_3 = L0_3.hide
    L0_3()
  end
  
  function L17_2()
    local L0_3, L1_3
    L0_3 = L15_2
    L0_3()
  end
  
  L18_2 = L1_1
  L18_2 = L18_2.newButton
  L19_2 = {}
  L19_2.image = "images/gui/settings/buttonRename.png"
  L19_2.width = 20
  L19_2.height = 20
  L19_2.onRelease = L17_2
  L20_2 = L7_2.x
  L21_2 = L7_2.width
  L21_2 = L21_2 * 0.5
  L20_2 = L20_2 + L21_2
  L20_2 = L20_2 - 8
  L19_2.x = L20_2
  L20_2 = L7_2.y
  L21_2 = L7_2.height
  L21_2 = L21_2 * 0.5
  L20_2 = L20_2 - L21_2
  L20_2 = L20_2 + 8
  L19_2.y = L20_2
  L18_2 = L18_2(L19_2)
  L10_2 = L18_2
  L10_2.isVisible = L12_2
  L19_2 = L1_2
  L18_2 = L1_2.insert
  L20_2 = L10_2
  L18_2(L19_2, L20_2)
  L18_2 = L2_2.create
  L19_2 = 0
  L20_2 = 0
  L21_2 = 190
  L22_2 = 30
  L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
  L11_2 = L18_2
  L11_2.anchorY = 0
  L11_2.x = -8
  L11_2.y = -22
  L19_2 = L1_2
  L18_2 = L1_2.insert
  L20_2 = L11_2
  L18_2(L19_2, L20_2)
  L18_2 = L11_2.setDoneCallback
  
  function L19_2(A0_3)
    local L1_3, L2_3
    L1_3 = L16_2
    L1_3()
    L1_3 = L1_1
    L1_3 = L1_3.comm
    L1_3 = L1_3.setClanMessageOfTheDay
    L2_3 = A0_3
    L1_3(L2_3)
  end
  
  L18_2(L19_2)
  L18_2 = L11_2.hide
  L18_2()
  
  function L18_2(A0_3)
    local L1_3, L2_3
    if A0_3 then
      L1_3 = L12_2
      if L1_3 then
        return
      end
    end
    L12_2 = A0_3
    L1_3 = L16_2
    L1_3()
    L1_3 = L14_2
    L2_3 = A0_3
    L1_3(L2_3)
  end
  
  L1_2.updateEditPrivelege = L18_2
  
  function L19_2()
    local L0_3, L1_3
    L0_3 = true
    L3_2 = L0_3
    L0_3 = L11_2
    L0_3 = L0_3.clean
    L0_3()
  end
  
  L1_2.clean = L19_2
  return L1_2
end

L0_1.create = L2_1
return L0_1
