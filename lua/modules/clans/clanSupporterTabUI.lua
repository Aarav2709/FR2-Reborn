local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L5_2 = {}
  L6_2 = nil
  L7_2 = nil
  if not A4_2 then
    L8_2 = {}
    A4_2 = L8_2
  end
  L8_2 = A4_2.title
  if not L8_2 then
    L8_2 = ""
  end
  L9_2 = A4_2.personalBonus
  if not L9_2 then
    L9_2 = ""
  end
  L10_2 = A4_2.clanMemberBonus
  if not L10_2 then
    L10_2 = ""
  end
  L11_2 = A4_2.supporterLevel
  if not L11_2 then
    L11_2 = 0
  end
  L5_2.x = 0
  L5_2.y = 0
  L5_2.width = A1_2
  L5_2.height = A2_2
  L12_2 = "images/gui/clan_v2/clan_support/tab"
  L13_2 = display
  L13_2 = L13_2.newImageRect
  L14_2 = L12_2
  L15_2 = A0_2
  L16_2 = "_dark.png"
  L14_2 = L14_2 .. L15_2 .. L16_2
  L15_2 = A1_2
  L16_2 = A2_2
  L13_2 = L13_2(L14_2, L15_2, L16_2)
  if L13_2 then
    L13_2.anchorX = 0
    L13_2.anchorY = 0
    L15_2 = A3_2
    L14_2 = A3_2.insert
    L16_2 = L13_2
    L14_2(L15_2, L16_2)
  else
    L14_2 = {}
    L13_2 = L14_2
  end
  L14_2 = display
  L14_2 = L14_2.newImageRect
  L15_2 = L12_2
  L16_2 = A0_2
  L17_2 = "_medium.png"
  L15_2 = L15_2 .. L16_2 .. L17_2
  L16_2 = A1_2
  L17_2 = A2_2
  L14_2 = L14_2(L15_2, L16_2, L17_2)
  L14_2.anchorX = 0
  L14_2.anchorY = 0
  L16_2 = A3_2
  L15_2 = A3_2.insert
  L17_2 = L14_2
  L15_2(L16_2, L17_2)
  L15_2 = display
  L15_2 = L15_2.newImageRect
  L16_2 = L12_2
  L17_2 = A0_2
  L18_2 = "_light.png"
  L16_2 = L16_2 .. L17_2 .. L18_2
  L17_2 = A1_2
  L18_2 = A2_2
  L15_2 = L15_2(L16_2, L17_2, L18_2)
  L15_2.anchorX = 0
  L15_2.anchorY = 0
  L17_2 = A3_2
  L16_2 = A3_2.insert
  L18_2 = L15_2
  L16_2(L17_2, L18_2)
  L16_2 = L1_1
  L16_2 = L16_2.newText
  L17_2 = {}
  L18_2 = L1_1
  L18_2 = L18_2.localized
  L18_2 = L18_2.get
  L19_2 = L8_2 or L19_2
  if not L8_2 then
    L19_2 = ""
  end
  L18_2 = L18_2(L19_2)
  L17_2.string = L18_2
  L17_2.size = 8
  L17_2.x = 0
  L17_2.y = 0
  L18_2 = L1_1
  L18_2 = L18_2.colors
  L18_2 = L18_2.black
  L17_2.color = L18_2
  L16_2 = L16_2(L17_2)
  L18_2 = A3_2
  L17_2 = A3_2.insert
  L19_2 = L16_2
  L17_2(L18_2, L19_2)
  L17_2 = L1_1
  L17_2 = L17_2.newText
  L18_2 = {}
  L19_2 = L1_1
  L19_2 = L19_2.localized
  L19_2 = L19_2.get
  L20_2 = "-%"
  L19_2 = L19_2(L20_2)
  L18_2.string = L19_2
  L18_2.size = 12
  L18_2.x = 0
  L18_2.y = 0
  L19_2 = L1_1
  L19_2 = L19_2.colors
  L19_2 = L19_2.black
  L18_2.color = L19_2
  L17_2 = L17_2(L18_2)
  L19_2 = A3_2
  L18_2 = A3_2.insert
  L20_2 = L17_2
  L18_2(L19_2, L20_2)
  L18_2 = L1_1
  L18_2 = L18_2.newText
  L19_2 = {}
  L20_2 = L1_1
  L20_2 = L20_2.localized
  L20_2 = L20_2.get
  L21_2 = "-%"
  L20_2 = L20_2(L21_2)
  L19_2.string = L20_2
  L19_2.size = 12
  L19_2.x = 0
  L19_2.y = 0
  L20_2 = L1_1
  L20_2 = L20_2.colors
  L20_2 = L20_2.black
  L19_2.color = L20_2
  L18_2 = L18_2(L19_2)
  L20_2 = A3_2
  L19_2 = A3_2.insert
  L21_2 = L18_2
  L19_2(L20_2, L21_2)
  L19_2 = nil
  if 1 < A0_2 and A0_2 < 4 and L8_2 ~= "" then
    L20_2 = "images/gui/clan_v2/clan_support/icon_"
    L22_2 = L8_2
    L21_2 = L8_2.lower
    L21_2 = L21_2(L22_2)
    L22_2 = ".png"
    L20_2 = L20_2 .. L21_2 .. L22_2
    L21_2 = display
    L21_2 = L21_2.newImageRect
    L22_2 = L20_2
    L23_2 = 9
    L24_2 = 14
    L21_2 = L21_2(L22_2, L23_2, L24_2)
    L19_2 = L21_2
    L22_2 = A3_2
    L21_2 = A3_2.insert
    L23_2 = L19_2
    L21_2(L22_2, L23_2)
  else
    L20_2 = {}
    L19_2 = L20_2
  end
  
  function L20_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = {}
    L0_3.isModal = true
    L1_3 = {}
    L0_3.params = L1_3
    L1_3 = L0_3.params
    L2_3 = A4_2
    L1_3.clanSupporterLevelData = L2_3
    L1_3 = L1_1
    L1_3 = L1_3.showOverlay
    L2_3 = "lua.modules.clans.clanSupporterPurchaseOverlay"
    L3_3 = L0_3
    L1_3(L2_3, L3_3)
  end
  
  L21_2 = L1_1
  L21_2 = L21_2.newButton
  L22_2 = {}
  L22_2.image = "images/gui/clan_v2/clan_support/upgrade.png"
  L22_2.width = 40
  L22_2.height = 16
  L23_2 = {}
  L24_2 = A4_2.gemPrice
  L23_2.string = L24_2
  L23_2.size = 12
  L23_2.x = -2
  L23_2.y = 2
  L24_2 = L1_1
  L24_2 = L24_2.colors
  L24_2 = L24_2.white
  L23_2.color = L24_2
  L22_2.text = L23_2
  L22_2.onRelease = L20_2
  L22_2.x = 0
  L22_2.y = 2
  L21_2 = L21_2(L22_2)
  L23_2 = A3_2
  L22_2 = A3_2.insert
  L24_2 = L21_2
  L22_2(L23_2, L24_2)
  L21_2.isVisible = false
  
  function L22_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = L5_2
    L2_3.x = A0_3
    L2_3 = L5_2
    L2_3.x = A1_3
    L2_3 = L13_2
    L2_3.x = A0_3
    L2_3 = L14_2
    L2_3.x = A0_3
    L2_3 = L15_2
    L2_3.x = A0_3
    L2_3 = L13_2
    L2_3.y = A1_3
    L2_3 = L14_2
    L2_3.y = A1_3
    L2_3 = L15_2
    L2_3.y = A1_3
    L2_3 = L16_2
    L3_3 = A1_2
    L3_3 = L3_3 * 0.5
    L3_3 = A0_3 + L3_3
    L3_3 = L3_3 - 6
    L2_3.x = L3_3
    L2_3 = L16_2
    L3_3 = A1_3 + 10
    L2_3.y = L3_3
    L2_3 = L17_2
    L3_3 = A1_2
    L3_3 = L3_3 * 0.5
    L3_3 = A0_3 + L3_3
    L2_3.x = L3_3
    L2_3 = L18_2
    L3_3 = A1_2
    L3_3 = L3_3 * 0.5
    L3_3 = A0_3 + L3_3
    L2_3.x = L3_3
    L2_3 = L17_2
    L3_3 = A1_3 + 26
    L2_3.y = L3_3
    L2_3 = L18_2
    L3_3 = A1_3 + 44
    L2_3.y = L3_3
    L2_3 = L19_2
    L3_3 = L16_2
    L3_3 = L3_3.x
    L4_3 = L16_2
    L4_3 = L4_3.width
    L4_3 = L4_3 * 0.5
    L3_3 = L3_3 + L4_3
    L3_3 = L3_3 + 4
    L2_3.x = L3_3
    L2_3 = L19_2
    L3_3 = L16_2
    L3_3 = L3_3.y
    L2_3.y = L3_3
    L2_3 = L21_2
    L3_3 = L18_2
    L3_3 = L3_3.x
    L2_3.x = L3_3
    L2_3 = L21_2
    L3_3 = L18_2
    L3_3 = L3_3.y
    L3_3 = L3_3 + 10
    L2_3.y = L3_3
  end
  
  L5_2.setPosition = L22_2
  
  function L22_2(A0_3)
    local L1_3
    L6_2 = A0_3
  end
  
  L5_2.setPrev = L22_2
  
  function L22_2(A0_3)
    local L1_3
    L7_2 = A0_3
  end
  
  L5_2.setNext = L22_2
  
  function L22_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = L13_2
    L1_3.isVisible = true
    L1_3 = L14_2
    L1_3.isVisible = false
    L1_3 = L15_2
    L1_3.isVisible = false
    L1_3 = L5_2
    L1_3 = L1_3.setUpgradable
    L2_3 = false
    L1_3(L2_3)
    L1_3 = L7_2
    if L1_3 then
      L1_3 = L7_2
      L1_3 = L1_3.setDark
      L1_3()
    end
    L1_3 = L1_1
    L1_3 = L1_3.colors
    L1_3 = L1_3.darkGrey
    if A0_3 then
      L2_3 = L1_1
      L2_3 = L2_3.colors
      L1_3 = L2_3.almostWhite
    end
    L2_3 = L17_2
    L3_3 = L2_3
    L2_3 = L2_3.setFillColor
    L4_3 = L1_1
    L4_3 = L4_3.colors
    L4_3 = L4_3.colorAsArgumentList
    L5_3 = L1_3
    L4_3, L5_3 = L4_3(L5_3)
    L2_3(L3_3, L4_3, L5_3)
    L2_3 = L18_2
    L3_3 = L2_3
    L2_3 = L2_3.setFillColor
    L4_3 = L1_1
    L4_3 = L4_3.colors
    L4_3 = L4_3.colorAsArgumentList
    L5_3 = L1_3
    L4_3, L5_3 = L4_3(L5_3)
    L2_3(L3_3, L4_3, L5_3)
  end
  
  L5_2.setDark = L22_2
  
  function L22_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L13_2
    L0_3.isVisible = false
    L0_3 = L14_2
    L0_3.isVisible = true
    L0_3 = L15_2
    L0_3.isVisible = false
    L0_3 = L5_2
    L0_3 = L0_3.setUpgradable
    L1_3 = false
    L0_3(L1_3)
    L0_3 = L6_2
    if L0_3 then
      L0_3 = L6_2
      L0_3 = L0_3.setMedium
      L0_3()
    end
    L0_3 = L17_2
    L1_3 = L0_3
    L0_3 = L0_3.setFillColor
    L2_3 = L1_1
    L2_3 = L2_3.colors
    L2_3 = L2_3.colorAsArgumentList
    L3_3 = L1_1
    L3_3 = L3_3.colors
    L3_3 = L3_3.grey
    L2_3, L3_3 = L2_3(L3_3)
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L18_2
    L1_3 = L0_3
    L0_3 = L0_3.setFillColor
    L2_3 = L1_1
    L2_3 = L2_3.colors
    L2_3 = L2_3.colorAsArgumentList
    L3_3 = L1_1
    L3_3 = L3_3.colors
    L3_3 = L3_3.grey
    L2_3, L3_3 = L2_3(L3_3)
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L5_2.setMedium = L22_2
  
  function L22_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L13_2
    L0_3.isVisible = false
    L0_3 = L14_2
    L0_3.isVisible = false
    L0_3 = L15_2
    L0_3.isVisible = true
    L0_3 = L5_2
    L0_3 = L0_3.setUpgradable
    L1_3 = false
    L0_3(L1_3)
    L0_3 = L6_2
    if L0_3 then
      L0_3 = L6_2
      L0_3 = L0_3.setMedium
      L0_3()
    end
    L0_3 = L7_2
    if L0_3 then
      L0_3 = L7_2
      L0_3 = L0_3.setDark
      L1_3 = true
      L0_3(L1_3)
    end
    L0_3 = L17_2
    L1_3 = L0_3
    L0_3 = L0_3.setFillColor
    L2_3 = L1_1
    L2_3 = L2_3.colors
    L2_3 = L2_3.colorAsArgumentList
    L3_3 = L1_1
    L3_3 = L3_3.colors
    L3_3 = L3_3.black
    L2_3, L3_3 = L2_3(L3_3)
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L18_2
    L1_3 = L0_3
    L0_3 = L0_3.setFillColor
    L2_3 = L1_1
    L2_3 = L2_3.colors
    L2_3 = L2_3.colorAsArgumentList
    L3_3 = L1_1
    L3_3 = L3_3.colors
    L3_3 = L3_3.black
    L2_3, L3_3 = L2_3(L3_3)
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L5_2.setLight = L22_2
  
  function L22_2()
    local L0_3, L1_3
    L0_3 = L5_2
    L0_3 = L0_3.setLight
    L0_3()
    L0_3 = L7_2
    if L0_3 then
      L0_3 = L7_2
      L0_3 = L0_3.setUpgradable
      L1_3 = true
      L0_3(L1_3)
    else
      L0_3 = L5_2
      L0_3 = L0_3.setUpgradable
      L1_3 = true
      L0_3(L1_3)
    end
  end
  
  L5_2.setActive = L22_2
  
  function L22_2(A0_3)
    local L1_3, L2_3
    L1_3 = L21_2
    L1_3.isVisible = A0_3
    L1_3 = L21_2
    L2_3 = L1_3
    L1_3 = L1_3.toFront
    L1_3(L2_3)
  end
  
  L5_2.setUpgradable = L22_2
  if L9_2 then
    L22_2 = "+ "
    L23_2 = L9_2
    L24_2 = "%"
    L22_2 = L22_2 .. L23_2 .. L24_2
    L17_2.text = L22_2
  end
  if L10_2 then
    L22_2 = "+ "
    L23_2 = L10_2
    L24_2 = "%"
    L22_2 = L22_2 .. L23_2 .. L24_2
    L18_2.text = L22_2
  end
  return L5_2
end

L0_1.create = L2_1
return L0_1
