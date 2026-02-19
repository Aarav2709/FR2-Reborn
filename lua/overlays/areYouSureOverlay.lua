local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "lua.modules.androidBackButton"
L2_1 = L2_1(L3_1)

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L1_2 = display
  L1_2 = L1_2.newGroup
  L1_2 = L1_2()
  L2_2 = nil
  L3_2 = nil
  L4_2 = nil
  L5_2 = false
  L6_2 = nil
  L7_2 = false
  L8_2 = nil
  L9_2 = display
  L9_2 = L9_2.newImageRect
  L10_2 = "images/gui/common/generalPopup.png"
  L11_2 = 248
  L12_2 = 105
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L2_2 = L9_2
  L2_2.anchorX = 0.5
  L2_2.anchorY = 0.5
  L9_2 = display
  L9_2 = L9_2.contentWidth
  L9_2 = L9_2 * 0.5
  L2_2.x = L9_2
  L9_2 = display
  L9_2 = L9_2.contentHeight
  L9_2 = L9_2 * 0.5
  L2_2.y = L9_2
  L9_2 = display
  L9_2 = L9_2.newRect
  L10_2 = 0
  L11_2 = 0
  L12_2 = display
  L12_2 = L12_2.contentWidth
  L13_2 = display
  L13_2 = L13_2.contentHeight
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
  L3_2 = L9_2
  L3_2.anchorX = 0
  L3_2.anchorY = 0
  L10_2 = L3_2
  L9_2 = L3_2.setFillColor
  L11_2 = 0
  L12_2 = 0
  L13_2 = 0
  L14_2 = 0.5882352941176471
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
  L3_2.x = 0
  L3_2.y = 0
  L9_2 = 16
  L10_2 = A0_2.textSize
  if L10_2 then
    L9_2 = A0_2.textSize
  end
  L10_2 = L1_1
  L10_2 = L10_2.newText
  L11_2 = {}
  L12_2 = L1_1
  L12_2 = L12_2.localized
  L12_2 = L12_2.get
  L13_2 = "AreYouSure"
  L12_2 = L12_2(L13_2)
  L11_2.string = L12_2
  L11_2.size = 18
  L11_2.x = 240
  L11_2.y = 170
  L11_2.width = 220
  L11_2.align = "center"
  L11_2.ay = 0.5
  L12_2 = {}
  L13_2 = 1
  L14_2 = 1
  L15_2 = 1
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L12_2[3] = L15_2
  L11_2.color = L12_2
  L10_2 = L10_2(L11_2)
  L8_2 = L10_2
  L10_2 = L1_1
  L10_2 = L10_2.newText
  L11_2 = {}
  L12_2 = A0_2.text
  L11_2.string = L12_2
  L11_2.size = L9_2
  L11_2.x = 240
  L11_2.y = 140
  L11_2.width = 240
  L11_2.align = "center"
  L11_2.ay = 0.5
  L12_2 = A0_2.color
  if not L12_2 then
    L12_2 = {}
    L13_2 = 1
    L14_2 = 1
    L15_2 = 1
    L12_2[1] = L13_2
    L12_2[2] = L14_2
    L12_2[3] = L15_2
  end
  L11_2.color = L12_2
  L10_2 = L10_2(L11_2)
  L4_2 = L10_2
  
  function L10_2()
    local L0_3, L1_3
    L0_3 = L5_2
    if not L0_3 then
      return
    end
    L0_3 = A0_2
    L0_3 = L0_3.noEvent
    if L0_3 then
      L0_3 = A0_2
      L0_3 = L0_3.noEvent
      L0_3()
    end
    L0_3 = L1_2
    L0_3 = L0_3.clean
    L0_3()
  end
  
  function L11_2()
    local L0_3, L1_3
    L0_3 = true
    L5_2 = L0_3
    L0_3 = L2_1
    L0_3 = L0_3.isCustomOverlay
    L1_3 = L10_2
    L0_3(L1_3)
  end
  
  function L12_2()
    local L0_3, L1_3
    L0_3 = L5_2
    if not L0_3 then
      return
    end
    L0_3 = A0_2
    L0_3 = L0_3.yesEvent
    if L0_3 then
      L0_3 = A0_2
      L0_3 = L0_3.yesEvent
      L0_3()
    end
    L0_3 = L1_2
    L0_3 = L0_3.clean
    L0_3()
  end
  
  L13_2 = L1_1
  L13_2 = L13_2.newButton
  L14_2 = {}
  L15_2 = L2_2.x
  L15_2 = L15_2 - 70
  L14_2.x = L15_2
  L15_2 = L2_2.y
  L16_2 = L2_2.height
  L16_2 = L16_2 * 0.5
  L15_2 = L15_2 + L16_2
  L15_2 = L15_2 - 5
  L14_2.y = L15_2
  L14_2.width = 126
  L14_2.height = 40
  L15_2 = L1_1
  L15_2 = L15_2.localized
  L15_2 = L15_2.get
  L16_2 = "Yes"
  L15_2 = L15_2(L16_2)
  L14_2.text = L15_2
  L14_2.image = "images/gui/common/buttonTextA.png"
  L14_2.onRelease = L12_2
  L13_2 = L13_2(L14_2)
  
  function L14_2()
    local L0_3, L1_3
    L0_3 = L10_2
    L0_3()
  end
  
  L15_2 = L1_1
  L15_2 = L15_2.newButton
  L16_2 = {}
  L17_2 = L2_2.x
  L17_2 = L17_2 + 70
  L16_2.x = L17_2
  L17_2 = L2_2.y
  L18_2 = L2_2.height
  L18_2 = L18_2 * 0.5
  L17_2 = L17_2 + L18_2
  L17_2 = L17_2 - 5
  L16_2.y = L17_2
  L16_2.width = 126
  L16_2.height = 40
  L17_2 = L1_1
  L17_2 = L17_2.localized
  L17_2 = L17_2.get
  L18_2 = "No"
  L17_2 = L17_2(L18_2)
  L16_2.text = L17_2
  L16_2.image = "images/gui/common/buttonTextB.png"
  L16_2.onRelease = L14_2
  L15_2 = L15_2(L16_2)
  
  function L16_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = L10_2
      L1_3()
    end
    L1_3 = true
    return L1_3
  end
  
  function L17_2(A0_3)
    local L1_3
    L1_3 = true
    return L1_3
  end
  
  function L18_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L16_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L17_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L19_2()
    local L0_3, L1_3, L2_3
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L3_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L2_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L4_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L13_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
  end
  
  function L20_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L7_2
    if L0_3 then
      return
    end
    L0_3 = true
    L7_2 = L0_3
    L0_3 = L6_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L6_2
      L0_3(L1_3)
      L0_3 = nil
      L6_2 = L0_3
    end
    L0_3 = L2_1
    L0_3 = L0_3.isCustomOverlay
    L1_3 = nil
    L0_3(L1_3)
    L0_3 = L2_2
    if L0_3 then
      L0_3 = L2_2
      L1_3 = L0_3
      L0_3 = L0_3.removeEventListener
      L2_3 = "touch"
      L3_3 = L17_2
      L0_3(L1_3, L2_3, L3_3)
      L0_3 = L2_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L2_2 = L0_3
    end
    L0_3 = L3_2
    if L0_3 then
      L0_3 = L3_2
      L1_3 = L0_3
      L0_3 = L0_3.removeEventListener
      L2_3 = "touch"
      L3_3 = L16_2
      L0_3(L1_3, L2_3, L3_3)
      L0_3 = L3_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L3_2 = L0_3
    end
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L13_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L15_2
    L0_3(L1_3)
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
  
  L1_2.clean = L20_2
  L21_2 = L19_2
  L21_2()
  L21_2 = L18_2
  L21_2()
  L21_2 = timer
  L21_2 = L21_2.performWithDelay
  L22_2 = 500
  L23_2 = L11_2
  L24_2 = 1
  L21_2 = L21_2(L22_2, L23_2, L24_2)
  L6_2 = L21_2
  return L1_2
end

L0_1.create = L3_1
return L0_1
