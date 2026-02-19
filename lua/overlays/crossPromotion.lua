local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L2_2 = false
  L3_2 = A0_2.view
  L4_2 = display
  L4_2 = L4_2.newGroup
  L4_2 = L4_2()
  L5_2 = display
  L5_2 = L5_2.newImageRect
  L6_2 = "images/gui/common/black.png"
  L7_2 = 480
  L8_2 = 320
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = display
  L6_2 = L6_2.contentWidth
  L6_2 = L6_2 * 0.5
  L5_2.x = L6_2
  L6_2 = display
  L6_2 = L6_2.contentHeight
  L6_2 = L6_2 * 0.5
  L5_2.y = L6_2
  L6_2 = display
  L6_2 = L6_2.newImageRect
  L7_2 = "images/gui/mainMenu/FRAcrosspromo.png"
  L8_2 = 454
  L9_2 = 266
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L6_2.anchorY = 0
  L7_2 = display
  L7_2 = L7_2.contentWidth
  L7_2 = L7_2 * 0.5
  L6_2.x = L7_2
  L7_2 = L0_1
  L7_2 = L7_2.newText
  L8_2 = {}
  L9_2 = L0_1
  L9_2 = L9_2.localized
  L9_2 = L9_2.get
  L10_2 = "NewGame"
  L9_2 = L9_2(L10_2)
  L8_2.string = L9_2
  L9_2 = L6_2.x
  L8_2.x = L9_2
  L9_2 = L6_2.y
  L9_2 = L9_2 + 16
  L8_2.y = L9_2
  L8_2.size = 28
  L9_2 = {}
  L10_2 = 1
  L11_2 = 1
  L12_2 = 1
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L8_2.color = L9_2
  L7_2 = L7_2(L8_2)
  L8_2 = display
  L8_2 = L8_2.newRect
  L9_2 = 0
  L10_2 = 0
  L11_2 = 410
  L12_2 = 205
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
  L8_2.isVisible = false
  L8_2.isHitTestable = true
  L9_2 = display
  L9_2 = L9_2.contentWidth
  L9_2 = L9_2 * 0.5
  L8_2.x = L9_2
  L9_2 = display
  L9_2 = L9_2.contentHeight
  L9_2 = L9_2 * 0.5
  L9_2 = L9_2 + 20
  L8_2.y = L9_2
  L9_2 = nil
  
  function L10_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
    L0_3 = true
    return L0_3
  end
  
  L11_2 = L0_1
  L11_2 = L11_2.newButton
  L12_2 = {}
  L12_2.image = "images/gui/common/buttonClosePopupBrown.png"
  L12_2.onRelease = L10_2
  L12_2.width = 43
  L12_2.height = 38
  L13_2 = L6_2.x
  L13_2 = L13_2 + 212
  L12_2.x = L13_2
  L13_2 = L6_2.y
  L13_2 = L13_2 + 30
  L12_2.y = L13_2
  L11_2 = L11_2(L12_2)
  
  function L12_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = L0_1
      L1_3 = L1_3.hideOverlay
      L1_3()
      L1_3 = native
      L1_3 = L1_3.setKeyboardFocus
      L2_3 = nil
      L1_3(L2_3)
    end
    L1_3 = true
    return L1_3
  end
  
  function L13_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = native
      L1_3 = L1_3.setKeyboardFocus
      L2_3 = nil
      L1_3(L2_3)
    end
    L1_3 = true
    return L1_3
  end
  
  function L14_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = require
      L2_3 = "lua.modules.platformStoreButtonFunction"
      L1_3 = L1_3(L2_3)
      L2_3 = L1_3.toPlatformStoreCrossPromotion
      L3_3 = A0_3
      L2_3(L3_3)
    end
    L1_3 = true
    return L1_3
  end
  
  L15_2 = L0_1
  L15_2 = L15_2.newButton
  L16_2 = {}
  L16_2.image = "images/gui/mainMenu/buttonFRAcrosspromo.png"
  L16_2.onRelease = L14_2
  L16_2.width = 126.36363636363636
  L16_2.height = 49.54545454545454
  L17_2 = L6_2.x
  L16_2.x = L17_2
  L17_2 = L8_2.y
  L16_2.y = L17_2
  L15_2 = L15_2(L16_2)
  
  function L16_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L12_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L13_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L14_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L17_2()
    local L0_3, L1_3, L2_3
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L5_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L6_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L11_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L4_2
    L0_3(L1_3, L2_3)
  end
  
  function L18_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L2_2
    if L0_3 then
      return
    end
    L0_3 = true
    L2_2 = L0_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L11_2
    L0_3(L1_3)
    L0_3 = native
    L0_3 = L0_3.setKeyboardFocus
    L1_3 = nil
    L0_3(L1_3)
    L0_3 = L9_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L9_2
      L0_3(L1_3)
      L0_3 = nil
      L9_2 = L0_3
    end
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L12_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L13_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L14_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = transition
    L0_3 = L0_3.cancel
    L1_3 = trans
    L0_3(L1_3)
  end
  
  L2_1 = L18_2
  L18_2 = L17_2
  L18_2()
  L18_2 = timer
  L18_2 = L18_2.performWithDelay
  L19_2 = 500
  L20_2 = L16_2
  L21_2 = 1
  L18_2 = L18_2(L19_2, L20_2, L21_2)
  L9_2 = L18_2
  L18_2 = L0_1
  L18_2 = L18_2.bouncer
  L18_2 = L18_2.down
  L19_2 = L4_2
  L18_2(L19_2)
end

L1_1.create = L4_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A1_2.phase
  if L2_2 == "will" then
    return
  end
  L3_2 = require
  L4_2 = "lua.modules.androidBackButton"
  L3_2 = L3_2(L4_2)
  L4_2 = L0_1
  L4_2 = L4_2.database
  L4_2 = L4_2.setSeenCrossPromotion
  L4_2()
  
  function L4_2()
    local L0_3, L1_3
    L0_3 = L3_2
    L0_3 = L0_3.isOverlay
    L1_3 = false
    L0_3(L1_3)
  end
  
  L3_1 = L4_2
  L4_2 = L3_2.isOverlay
  L5_2 = true
  L4_2(L5_2)
end

L1_1.show = L4_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2.view
  L3_2 = A1_2.phase
  if L3_2 == "will" then
    L4_2 = L3_1
    L4_2()
  elseif L3_2 == "did" then
    L4_2 = A1_2.parent
    if L4_2 then
      L4_2 = A1_2.parent
      L4_2 = L4_2.overlayEnded
      if L4_2 then
        L4_2 = A1_2.parent
        L5_2 = L4_2
        L4_2 = L4_2.overlayEnded
        L4_2(L5_2)
      end
    end
    return
  end
end

L1_1.hide = L4_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A0_2.view
  L3_2 = L2_1
  L3_2()
end

L1_1.destroy = L4_1
L5_1 = L1_1
L4_1 = L1_1.addEventListener
L6_1 = "create"
L7_1 = L1_1
L4_1(L5_1, L6_1, L7_1)
L5_1 = L1_1
L4_1 = L1_1.addEventListener
L6_1 = "show"
L7_1 = L1_1
L4_1(L5_1, L6_1, L7_1)
L5_1 = L1_1
L4_1 = L1_1.addEventListener
L6_1 = "hide"
L7_1 = L1_1
L4_1(L5_1, L6_1, L7_1)
L5_1 = L1_1
L4_1 = L1_1.addEventListener
L6_1 = "destroy"
L7_1 = L1_1
L4_1(L5_1, L6_1, L7_1)
return L1_1
