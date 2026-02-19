local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil
L4_1 = {}

function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2
  L2_2 = A0_2.view
  L3_2 = 50
  L4_2 = nil
  L5_2 = {}
  L6_2 = {}
  L7_2 = {}
  L8_2 = {}
  L9_2 = display
  L9_2 = L9_2.newGroup
  L9_2 = L9_2()
  L10_2 = {}
  L4_1 = L10_2
  L10_2 = isAndroid
  if L10_2 then
    L3_2 = 60
  end
  L10_2 = A1_2.params
  L10_2 = L10_2.currentFilter
  L11_2 = L10_2 == 1 or L10_2 == 3
  L7_2[1] = L11_2
  L11_2 = L10_2 == 1 or L10_2 == 2
  L7_2[2] = L11_2
  L11_2 = display
  L11_2 = L11_2.newImageRect
  L12_2 = "images/gui/settings/pushWindow.png"
  L13_2 = 330
  L14_2 = 240
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L11_2.anchorX = 0.5
  L11_2.anchorY = 0
  L11_2.x = 240
  L11_2.y = 0
  L12_2 = display
  L12_2 = L12_2.newRect
  L13_2 = 0
  L14_2 = 0
  L15_2 = display
  L15_2 = L15_2.contentWidth
  L16_2 = display
  L16_2 = L16_2.contentHeight
  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
  L12_2.anchorX = 0
  L12_2.anchorY = 0
  L14_2 = L12_2
  L13_2 = L12_2.setFillColor
  L15_2 = 0
  L16_2 = 0
  L17_2 = 0
  L18_2 = 0.5882352941176471
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  L12_2.x = 0
  L12_2.y = 0
  L13_2 = L0_1
  L13_2 = L13_2.newText
  L14_2 = {}
  L15_2 = L0_1
  L15_2 = L15_2.localized
  L15_2 = L15_2.get
  L16_2 = "Filters"
  L15_2 = L15_2(L16_2)
  L14_2.string = L15_2
  L14_2.x = 240
  L14_2.y = 60
  L14_2.size = 25
  L15_2 = {}
  L16_2 = 1
  L17_2 = 1
  L18_2 = 1
  L15_2[1] = L16_2
  L15_2[2] = L17_2
  L15_2[3] = L18_2
  L14_2.color = L15_2
  L13_2 = L13_2(L14_2)
  L14_2 = L0_1
  L14_2 = L14_2.newText
  L15_2 = {}
  L16_2 = L0_1
  L16_2 = L16_2.localized
  L16_2 = L16_2.get
  L17_2 = "Choose which items are visible in the store"
  L16_2 = L16_2(L17_2)
  L15_2.string = L16_2
  L15_2.ax = 0.5
  L16_2 = L11_2.x
  L15_2.x = L16_2
  L15_2.y = 92
  L15_2.size = 14
  L16_2 = L0_1
  L16_2 = L16_2.colors
  L16_2 = L16_2.black
  L15_2.color = L16_2
  L15_2.align = "center"
  L14_2 = L14_2(L15_2)
  L15_2 = L0_1
  L15_2 = L15_2.newText
  L16_2 = {}
  L17_2 = L0_1
  L17_2 = L17_2.localized
  L17_2 = L17_2.get
  L18_2 = "Owned"
  L17_2 = L17_2(L18_2)
  L16_2.string = L17_2
  L16_2.ax = 1
  L16_2.x = 240
  L16_2.y = 120
  L16_2.size = 22
  L17_2 = {}
  L18_2 = 1
  L19_2 = 1
  L20_2 = 1
  L17_2[1] = L18_2
  L17_2[2] = L19_2
  L17_2[3] = L20_2
  L16_2.color = L17_2
  L15_2 = L15_2(L16_2)
  L16_2 = L0_1
  L16_2 = L16_2.newText
  L17_2 = {}
  L18_2 = L0_1
  L18_2 = L18_2.localized
  L18_2 = L18_2.get
  L19_2 = "Not owned"
  L18_2 = L18_2(L19_2)
  L17_2.string = L18_2
  L17_2.ax = 1
  L17_2.x = 240
  L17_2.y = 160
  L17_2.size = 22
  L18_2 = {}
  L19_2 = 1
  L20_2 = 1
  L21_2 = 1
  L18_2[1] = L19_2
  L18_2[2] = L20_2
  L18_2[3] = L21_2
  L17_2.color = L18_2
  L16_2 = L16_2(L17_2)
  L17_2 = L0_1
  L17_2 = L17_2.newText
  L18_2 = {}
  L19_2 = L0_1
  L19_2 = L19_2.localized
  L19_2 = L19_2.get
  L20_2 = "At least one filter must be on"
  L19_2 = L19_2(L20_2)
  L18_2.string = L19_2
  L18_2.ax = 0.5
  L19_2 = L11_2.x
  L18_2.x = L19_2
  L18_2.y = 190
  L18_2.size = 16
  L19_2 = L0_1
  L19_2 = L19_2.colors
  L19_2 = L19_2.almostWhite
  L18_2.color = L19_2
  L18_2.align = "center"
  L17_2 = L17_2(L18_2)
  L17_2.isVisible = false
  L18_2 = nil
  
  function L19_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = "images/gui/settings/toggleOn.png"
    L2_3 = L0_1
    L2_3 = L2_3.localized
    L2_3 = L2_3.get
    L3_3 = "Show"
    L2_3 = L2_3(L3_3)
    L3_3 = L6_2
    L3_3 = L3_3[A0_3]
    if L3_3 then
      L3_3 = L6_2
      L3_3 = L3_3[A0_3]
      L4_3 = L3_3
      L3_3 = L3_3.removeSelf
      L3_3(L4_3)
      L3_3 = L6_2
      L3_3[A0_3] = nil
    end
    L3_3 = L5_2
    L3_3 = L3_3[A0_3]
    if L3_3 then
      L3_3 = L5_2
      L3_3 = L3_3[A0_3]
      L4_3 = L3_3
      L3_3 = L3_3.removeEventListener
      L5_3 = "touch"
      L6_3 = L8_2
      L6_3 = L6_3[A0_3]
      L3_3(L4_3, L5_3, L6_3)
      L3_3 = L5_2
      L3_3 = L3_3[A0_3]
      L4_3 = L3_3
      L3_3 = L3_3.removeSelf
      L3_3(L4_3)
      L3_3 = L5_2
      L3_3[A0_3] = nil
    end
    L3_3 = L6_2
    L4_3 = L0_1
    L4_3 = L4_3.newText
    L5_3 = {}
    L5_3.string = L2_3
    L5_3.size = 12
    L5_3.ax = 0
    L5_3.ay = 0.5
    L4_3 = L4_3(L5_3)
    L3_3[A0_3] = L4_3
    L3_3 = L6_2
    L3_3 = L3_3[A0_3]
    L3_3.x = 302
    L3_3 = L6_2
    L3_3 = L3_3[A0_3]
    L4_3 = A0_3 - 1
    L4_3 = L4_3 * 40
    L4_3 = 120 + L4_3
    L3_3.y = L4_3
    L3_3 = L7_2
    L3_3 = L3_3[A0_3]
    if not L3_3 then
      L1_3 = "images/gui/settings/toggleOff.png"
      L3_3 = L6_2
      L3_3 = L3_3[A0_3]
      L4_3 = L0_1
      L4_3 = L4_3.localized
      L4_3 = L4_3.get
      L5_3 = "Hide"
      L4_3 = L4_3(L5_3)
      L3_3.text = L4_3
      L3_3 = L6_2
      L3_3 = L3_3[A0_3]
      L3_3.x = 278
      L3_3 = L6_2
      L3_3 = L3_3[A0_3]
      L4_3 = L3_3
      L3_3 = L3_3.setFillColor
      L5_3 = 1
      L6_3 = 1
      L7_3 = 1
      L3_3(L4_3, L5_3, L6_3, L7_3)
    end
    L3_3 = L5_2
    L4_3 = display
    L4_3 = L4_3.newImageRect
    L5_3 = L1_3
    L6_3 = 62
    L7_3 = 34
    L4_3 = L4_3(L5_3, L6_3, L7_3)
    L3_3[A0_3] = L4_3
    L3_3 = L5_2
    L3_3 = L3_3[A0_3]
    L3_3.anchorX = 0.5
    L3_3 = L5_2
    L3_3 = L3_3[A0_3]
    L3_3.anchorY = 0
    L3_3 = L5_2
    L3_3 = L3_3[A0_3]
    L3_3.x = 300
    L3_3 = L5_2
    L3_3 = L3_3[A0_3]
    L4_3 = A0_3 - 1
    L4_3 = L4_3 * 40
    L4_3 = 104 + L4_3
    L3_3.y = L4_3
    L3_3 = L5_2
    L3_3 = L3_3[A0_3]
    L4_3 = L3_3
    L3_3 = L3_3.addEventListener
    L5_3 = "touch"
    L6_3 = L8_2
    L6_3 = L6_3[A0_3]
    L3_3(L4_3, L5_3, L6_3)
    L3_3 = L2_2
    L4_3 = L3_3
    L3_3 = L3_3.insert
    L5_3 = L5_2
    L5_3 = L5_3[A0_3]
    L3_3(L4_3, L5_3)
    L3_3 = L2_2
    L4_3 = L3_3
    L3_3 = L3_3.insert
    L5_3 = L6_2
    L5_3 = L5_3[A0_3]
    L3_3(L4_3, L5_3)
  end
  
  function L20_2()
    local L0_3, L1_3
    L0_3 = L7_2
    L0_3 = L0_3[1]
    if L0_3 then
      L0_3 = L7_2
      L0_3 = L0_3[2]
      if L0_3 then
        L0_3 = L4_1
        L0_3.selectedFilter = 1
    end
    else
      L0_3 = L7_2
      L0_3 = L0_3[2]
      if L0_3 then
        L0_3 = L4_1
        L0_3.selectedFilter = 2
      else
        L0_3 = L7_2
        L0_3 = L0_3[1]
        if L0_3 then
          L0_3 = L4_1
          L0_3.selectedFilter = 3
        end
      end
    end
  end
  
  function L21_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = "off"
    L2_3 = L7_2
    L3_3 = L7_2
    L3_3 = L3_3[A0_3]
    L3_3 = not L3_3
    L2_3[A0_3] = L3_3
    L2_3 = L7_2
    L2_3 = L2_3[1]
    if not L2_3 then
      L2_3 = L7_2
      L2_3 = L2_3[2]
      if not L2_3 then
        L2_3 = L17_2
        L2_3.isVisible = true
        L2_3 = L18_2
        if L2_3 then
          L2_3 = L18_2
          L2_3 = L2_3.changeButtonImage
          if L2_3 then
            L2_3 = L18_2
            L2_3 = L2_3.changeButtonImage
            L3_3 = "images/gui/common/buttonTextB_gray.png"
            L2_3(L3_3)
          end
        end
    end
    else
      L2_3 = L18_2
      if L2_3 then
        L2_3 = L17_2
        L2_3 = L2_3.isVisible
        if L2_3 then
          L2_3 = L18_2
          L2_3 = L2_3.changeButtonImage
          if L2_3 then
            L2_3 = L18_2
            L2_3 = L2_3.changeButtonImage
            L3_3 = "images/gui/common/buttonTextB.png"
            L2_3(L3_3)
          end
        end
      end
      L2_3 = L17_2
      L2_3.isVisible = false
    end
    L2_3 = L19_2
    L3_3 = A0_3
    L2_3(L3_3)
  end
  
  function L22_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = L21_2
      L2_3 = 1
      L1_3(L2_3)
    end
    L1_3 = true
    return L1_3
  end
  
  L8_2[1] = L22_2
  
  function L22_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = L21_2
      L2_3 = 2
      L1_3(L2_3)
    end
    L1_3 = true
    return L1_3
  end
  
  L8_2[2] = L22_2
  
  function L22_2(A0_3)
    local L1_3
    L1_3 = L0_1
    L1_3 = L1_3.hideOverlay
    L1_3()
  end
  
  function L23_2(A0_3)
    local L1_3, L2_3
    L1_3 = L17_2
    L1_3 = L1_3.isVisible
    if L1_3 then
      return
    end
    L1_3 = L20_2
    L1_3()
    L1_3 = L22_2
    L2_3 = A0_3
    L1_3(L2_3)
  end
  
  function L24_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = L0_1
      L1_3 = L1_3.hideOverlay
      L1_3()
    end
    L1_3 = true
    return L1_3
  end
  
  function L25_2(A0_3)
    local L1_3
    L1_3 = true
    return L1_3
  end
  
  L26_2 = L0_1
  L26_2 = L26_2.newButton
  L27_2 = {}
  L27_2.x = 390
  L27_2.y = 70
  L27_2.width = 43
  L27_2.height = 38
  L27_2.image = "images/gui/common/buttonClosePopupBrown.png"
  L27_2.onRelease = L22_2
  L26_2 = L26_2(L27_2)
  L27_2 = L0_1
  L27_2 = L27_2.newButton
  L28_2 = {}
  L29_2 = L11_2.x
  L28_2.x = L29_2
  L29_2 = L11_2.y
  L30_2 = L11_2.height
  L29_2 = L29_2 + L30_2
  L28_2.y = L29_2
  L29_2 = L0_1
  L29_2 = L29_2.localized
  L29_2 = L29_2.get
  L30_2 = "Apply"
  L29_2 = L29_2(L30_2)
  L28_2.text = L29_2
  L28_2.width = 126
  L28_2.height = 40
  L28_2.image = "images/gui/common/buttonTextB.png"
  L28_2.onRelease = L23_2
  L27_2 = L27_2(L28_2)
  L18_2 = L27_2
  
  function L27_2()
    local L0_3, L1_3
    L0_3 = L4_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L4_2
      L0_3(L1_3)
      L0_3 = nil
      L4_2 = L0_3
    end
  end
  
  function L28_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L12_2
    L0_3(L1_3, L2_3)
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L11_2
    L0_3(L1_3, L2_3)
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L13_2
    L0_3(L1_3, L2_3)
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L17_2
    L0_3(L1_3, L2_3)
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L14_2
    L0_3(L1_3, L2_3)
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L16_2
    L0_3(L1_3, L2_3)
    L0_3 = 1
    L1_3 = L5_2
    L1_3 = #L1_3
    L2_3 = 1
    for L3_3 = L0_3, L1_3, L2_3 do
      L4_3 = L9_2
      L5_3 = L4_3
      L4_3 = L4_3.insert
      L6_3 = L5_2
      L6_3 = L6_3[L3_3]
      L4_3(L5_3, L6_3)
      L4_3 = L9_2
      L5_3 = L4_3
      L4_3 = L4_3.insert
      L6_3 = L6_2
      L6_3 = L6_3[L3_3]
      L4_3(L5_3, L6_3)
    end
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L26_2
    L0_3(L1_3, L2_3)
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L18_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L9_2
    L0_3(L1_3, L2_3)
  end
  
  function L29_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L12_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L24_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L25_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L30_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L26_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L18_2
    L0_3(L1_3)
    L0_3 = L12_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L24_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = 1
    L1_3 = L8_2
    L1_3 = #L1_3
    L2_3 = 1
    for L3_3 = L0_3, L1_3, L2_3 do
      L4_3 = L5_2
      L4_3 = L4_3[L3_3]
      L5_3 = L4_3
      L4_3 = L4_3.removeEventListener
      L6_3 = "touch"
      L7_3 = L8_2
      L7_3 = L7_3[L3_3]
      L4_3(L5_3, L6_3, L7_3)
    end
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L25_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L27_2
    L0_3()
  end
  
  L2_1 = L30_2
  L30_2 = 1
  L31_2 = 2
  L32_2 = 1
  for L33_2 = L30_2, L31_2, L32_2 do
    L34_2 = L19_2
    L35_2 = L33_2
    L34_2(L35_2)
  end
  L30_2 = L28_2
  L30_2()
  L30_2 = L29_2
  L30_2()
  L30_2 = L0_1
  L30_2 = L30_2.bouncer
  L30_2 = L30_2.down
  L31_2 = L9_2
  L30_2(L31_2)
end

L1_1.create = L5_1

function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2.phase
  if L2_2 == "will" then
    return
  end
  L3_2 = A0_2.view
  L4_2 = require
  L5_2 = "lua.modules.androidBackButton"
  L4_2 = L4_2(L5_2)
  
  function L5_2()
    local L0_3, L1_3
    L0_3 = L4_2
    L0_3 = L0_3.isOverlay
    L1_3 = false
    L0_3(L1_3)
  end
  
  L3_1 = L5_2
  L5_2 = L4_2.isOverlay
  L6_2 = true
  L5_2(L6_2)
end

L1_1.show = L5_1

function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A1_2.phase
  if L2_2 == "did" then
    L3_2 = A1_2.parent
    if L3_2 then
      L3_2 = A1_2.parent
      L3_2 = L3_2.overlayEnded
      if L3_2 then
        L3_2 = A1_2.parent
        L4_2 = L3_2
        L3_2 = L3_2.overlayEnded
        L5_2 = L4_1
        L3_2(L4_2, L5_2)
        L3_2 = nil
        L4_1 = L3_2
      end
    end
    return
  end
  L3_2 = A0_2.view
  L4_2 = L3_1
  L4_2()
end

L1_1.hide = L5_1

function L5_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A0_2.view
  L3_2 = L2_1
  L3_2()
end

L1_1.destroy = L5_1
L6_1 = L1_1
L5_1 = L1_1.addEventListener
L7_1 = "create"
L8_1 = L1_1
L5_1(L6_1, L7_1, L8_1)
L6_1 = L1_1
L5_1 = L1_1.addEventListener
L7_1 = "show"
L8_1 = L1_1
L5_1(L6_1, L7_1, L8_1)
L6_1 = L1_1
L5_1 = L1_1.addEventListener
L7_1 = "hide"
L8_1 = L1_1
L5_1(L6_1, L7_1, L8_1)
L6_1 = L1_1
L5_1 = L1_1.addEventListener
L7_1 = "destroy"
L8_1 = L1_1
L5_1(L6_1, L7_1, L8_1)
return L1_1
