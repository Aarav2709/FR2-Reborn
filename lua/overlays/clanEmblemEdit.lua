local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = A1_2.params
  if not L2_2 then
    L2_2 = {}
    A1_2.params = L2_2
  end
  L2_2 = A0_2.view
  L3_2 = display
  L3_2 = L3_2.newGroup
  L3_2 = L3_2()
  L4_2 = display
  L4_2 = L4_2.newGroup
  L4_2 = L4_2()
  L5_2 = nil
  L6_2 = display
  L6_2 = L6_2.newImageRect
  L7_2 = "images/gui/common/black.png"
  L8_2 = 480
  L9_2 = 320
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = display
  L7_2 = L7_2.contentWidth
  L7_2 = L7_2 * 0.5
  L6_2.x = L7_2
  L7_2 = display
  L7_2 = L7_2.contentHeight
  L7_2 = L7_2 * 0.5
  L6_2.y = L7_2
  L7_2 = display
  L7_2 = L7_2.newImageRect
  L8_2 = "images/gui/clan_v2/create_clan/createWindow.png"
  L9_2 = 321
  L10_2 = 262
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = display
  L8_2 = L8_2.contentWidth
  L8_2 = L8_2 * 0.5
  L7_2.x = L8_2
  L7_2.anchorY = 0
  L7_2.y = 0
  L8_2 = A1_2.params
  L8_2 = L8_2.edit
  if not L8_2 then
    L8_2 = false
  end
  L9_2 = require
  L10_2 = "lua.modules.clans.clanEditEmblemUI"
  L9_2 = L9_2(L10_2)
  L10_2 = L9_2.create
  L11_2 = A1_2.params
  L11_2 = L11_2.clanCreateTempData
  L12_2 = L8_2
  L10_2 = L10_2(L11_2, L12_2)
  L11_2 = L7_2.x
  L11_2 = L11_2 - 100
  L10_2.x = L11_2
  L11_2 = L7_2.y
  L11_2 = L11_2 + 70
  L10_2.y = L11_2
  L11_2 = L0_1
  L11_2 = L11_2.newText
  L12_2 = {}
  L13_2 = L0_1
  L13_2 = L13_2.localized
  L13_2 = L13_2.get
  L14_2 = "Clan Emblem"
  L13_2 = L13_2(L14_2)
  L12_2.string = L13_2
  L13_2 = L7_2.x
  L12_2.x = L13_2
  L13_2 = L7_2.y
  L13_2 = L13_2 + 18
  L12_2.y = L13_2
  L12_2.size = 25
  L13_2 = {}
  L14_2 = 1
  L15_2 = 1
  L16_2 = 1
  L13_2[1] = L14_2
  L13_2[2] = L15_2
  L13_2[3] = L16_2
  L12_2.color = L13_2
  L12_2.align = "center"
  L11_2 = L11_2(L12_2)
  
  function L12_2()
    local L0_3, L1_3
    L0_3 = L5_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L5_2
      L0_3(L1_3)
      L0_3 = nil
      L5_2 = L0_3
    end
  end
  
  function L13_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
    L0_3 = true
    return L0_3
  end
  
  L14_2 = L0_1
  L14_2 = L14_2.newButton
  L15_2 = {}
  L15_2.image = "images/gui/common/buttonClosePopupBrown.png"
  L15_2.onRelease = L13_2
  L15_2.width = 43
  L15_2.height = 38
  L16_2 = L7_2.x
  L16_2 = L16_2 + 220
  L15_2.x = L16_2
  L16_2 = L7_2.y
  L16_2 = L16_2 + -108
  L15_2.y = L16_2
  L14_2 = L14_2(L15_2)
  
  function L15_2(A0_3)
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
  
  function L16_2(A0_3)
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
  
  function L17_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L15_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L16_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L18_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L6_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L11_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L14_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L10_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L3_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L4_2
    L0_3(L1_3, L2_3)
  end
  
  function L19_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L10_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L14_2
    L0_3(L1_3)
    L0_3 = native
    L0_3 = L0_3.setKeyboardFocus
    L1_3 = nil
    L0_3(L1_3)
    L0_3 = L12_2
    L0_3()
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L15_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L16_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L19_2
  L19_2 = L18_2
  L19_2()
  L19_2 = L17_2
  L19_2()
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
