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
  L2_2 = A0_2.view
  L3_2 = false
  L4_2 = nil
  L5_2 = display
  L5_2 = L5_2.newGroup
  L5_2 = L5_2()
  L6_2 = A1_2.params
  L6_2 = L6_2.logoutCallback
  L7_2 = display
  L7_2 = L7_2.newRect
  L8_2 = 0
  L9_2 = 0
  L10_2 = display
  L10_2 = L10_2.contentWidth
  L11_2 = display
  L11_2 = L11_2.contentHeight
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
  L7_2.anchorX = 0
  L7_2.anchorY = 0
  L9_2 = L7_2
  L8_2 = L7_2.setFillColor
  L10_2 = 0
  L11_2 = 0
  L12_2 = 0
  L13_2 = 0.5882352941176471
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L7_2.x = 0
  L7_2.y = 0
  L8_2 = display
  L8_2 = L8_2.newImageRect
  L9_2 = "images/gui/login/window.png"
  L10_2 = 350
  L11_2 = 137
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L8_2.anchorX = 0.5
  L8_2.anchorY = 0
  L8_2.x = 240
  L8_2.y = 0
  L9_2 = L0_1
  L9_2 = L9_2.newText
  L10_2 = {}
  L11_2 = L0_1
  L11_2 = L11_2.localized
  L11_2 = L11_2.get
  L12_2 = "Logout?"
  L11_2 = L11_2(L12_2)
  L10_2.string = L11_2
  L10_2.size = 25
  L11_2 = {}
  L12_2 = 1
  L13_2 = 1
  L14_2 = 1
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L11_2[3] = L14_2
  L10_2.color = L11_2
  L9_2 = L9_2(L10_2)
  L9_2.anchorX = 0.5
  L9_2.anchorY = 0.5
  L9_2.x = 240
  L9_2.y = 25
  L10_2 = L0_1
  L10_2 = L10_2.newText
  L11_2 = {}
  L12_2 = L0_1
  L12_2 = L12_2.localized
  L12_2 = L12_2.get
  L13_2 = "GameServiceLogoutMessage"
  L12_2 = L12_2(L13_2)
  L11_2.string = L12_2
  L11_2.size = 15
  L12_2 = {}
  L13_2 = 1
  L14_2 = 1
  L15_2 = 1
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L12_2[3] = L15_2
  L11_2.color = L12_2
  L11_2.width = 350
  L11_2.height = 200
  L11_2.align = "center"
  L10_2 = L10_2(L11_2)
  L10_2.anchorX = 0.5
  L10_2.anchorY = 0
  L10_2.x = 240
  L10_2.y = 45
  
  function L11_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  L12_2 = L0_1
  L12_2 = L12_2.newButton
  L13_2 = {}
  L13_2.x = 398
  L13_2.y = 32
  L13_2.width = 43
  L13_2.height = 38
  L13_2.image = "images/gui/common/buttonClosePopupBrown.png"
  L13_2.onRelease = L11_2
  L12_2 = L12_2(L13_2)
  
  function L13_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.gameNetwork
    L0_3 = L0_3.playServicesLogout
    L1_3 = L6_2
    L0_3(L1_3)
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  L14_2 = L0_1
  L14_2 = L14_2.newButton
  L15_2 = {}
  L15_2.x = 240
  L15_2.y = 112
  L15_2.width = 126
  L15_2.height = 40
  L15_2.image = "images/gui/common/buttonTextA.png"
  L16_2 = {}
  L17_2 = L0_1
  L17_2 = L17_2.localized
  L17_2 = L17_2.get
  L18_2 = "LogOut"
  L17_2 = L17_2(L18_2)
  L16_2.string = L17_2
  L16_2.x = 0
  L16_2.y = 0
  L15_2.text = L16_2
  L15_2.onRelease = L13_2
  L14_2 = L14_2(L15_2)
  
  function L15_2(A0_3)
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
  
  function L16_2(A0_3)
    local L1_3
    L1_3 = true
    return L1_3
  end
  
  function L17_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L9_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L10_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L12_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L14_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L5_2
    L0_3(L1_3, L2_3)
  end
  
  function L18_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L3_2
    if not L0_3 then
      L0_3 = L7_2
      L1_3 = L0_3
      L0_3 = L0_3.addEventListener
      L2_3 = "touch"
      L3_3 = L15_2
      L0_3(L1_3, L2_3, L3_3)
      L0_3 = L8_2
      L1_3 = L0_3
      L0_3 = L0_3.addEventListener
      L2_3 = "touch"
      L3_3 = L16_2
      L0_3(L1_3, L2_3, L3_3)
      L0_3 = L8_2
      L1_3 = L0_3
      L0_3 = L0_3.addEventListener
      L2_3 = "tap"
      L3_3 = L16_2
      L0_3(L1_3, L2_3, L3_3)
    end
  end
  
  function L19_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L3_2
    if L0_3 then
      return
    end
    L0_3 = true
    L3_2 = L0_3
    L0_3 = L4_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L4_2
      L0_3(L1_3)
      L0_3 = nil
      L4_2 = L0_3
    end
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L15_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L16_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "tap"
    L3_3 = L16_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L19_2
  L19_2 = L17_2
  L19_2()
  L19_2 = timer
  L19_2 = L19_2.performWithDelay
  L20_2 = 200
  L21_2 = L18_2
  L19_2 = L19_2(L20_2, L21_2)
  L4_2 = L19_2
  L19_2 = L0_1
  L19_2 = L19_2.bouncer
  L19_2 = L19_2.down
  L20_2 = L5_2
  L19_2(L20_2)
end

L1_1.create = L4_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A0_2.view
  L3_2 = A1_2.phase
  if L3_2 == "will" then
    return
  end
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

L1_1.show = L4_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2.phase
  if L2_2 == "did" then
    return
  end
  L3_2 = L3_1
  if L3_2 then
    L3_2 = L3_1
    L3_2()
  end
  L3_2 = A1_2.parent
  if L3_2 then
    L3_2 = A1_2.parent
    L3_2 = L3_2.overlayEnded
    if L3_2 then
      L3_2 = A1_2.parent
      L4_2 = L3_2
      L3_2 = L3_2.overlayEnded
      L3_2(L4_2)
    end
  end
end

L1_1.hide = L4_1

function L4_1(A0_2, A1_2)
  local L2_2
  L2_2 = L2_1
  if L2_2 then
    L2_2 = L2_1
    L2_2()
  end
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
