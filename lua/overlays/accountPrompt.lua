local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L2_2 = A0_2.view
  L3_2 = L0_1
  L3_2 = L3_2.database
  L3_2 = L3_2.didShowAccountCreationPrompt
  L3_2()
  L3_2 = display
  L3_2 = L3_2.newGroup
  L3_2 = L3_2()
  L4_2 = display
  L4_2 = L4_2.newImageRect
  L5_2 = "images/gui/common/generalPopupAccount.png"
  L6_2 = 307
  L7_2 = 114
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L4_2.anchorX = 0.5
  L4_2.anchorY = 0
  L4_2.x = 220
  L4_2.y = 80
  L5_2 = display
  L5_2 = L5_2.newRect
  L6_2 = 0
  L7_2 = 0
  L8_2 = display
  L8_2 = L8_2.contentWidth
  L9_2 = display
  L9_2 = L9_2.contentHeight
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2.anchorX = 0
  L5_2.anchorY = 0
  L7_2 = L5_2
  L6_2 = L5_2.setFillColor
  L8_2 = 0
  L9_2 = 0
  L10_2 = 0
  L11_2 = 0.5882352941176471
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  L5_2.x = 0
  L5_2.y = 0
  L6_2 = L0_1
  L6_2 = L6_2.newText
  L7_2 = {}
  L8_2 = L0_1
  L8_2 = L8_2.localized
  L8_2 = L8_2.get
  L9_2 = "AccountPrompt"
  L8_2 = L8_2(L9_2)
  L7_2.string = L8_2
  L7_2.size = 14
  L7_2.align = "center"
  L7_2.width = 200
  L7_2.ax = 0.5
  L7_2.ay = 0.5
  L8_2 = {}
  L9_2 = 1
  L10_2 = 1
  L11_2 = 1
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L7_2.color = L8_2
  L6_2 = L6_2(L7_2)
  L6_2.x = 265
  L7_2 = L4_2.y
  L8_2 = L4_2.height
  L8_2 = L8_2 / 2
  L7_2 = L7_2 + L8_2
  L7_2 = L7_2 - 10
  L6_2.y = L7_2
  
  function L7_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  function L8_2(A0_3)
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
  
  function L9_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
    end
    L1_3 = true
    return L1_3
  end
  
  L10_2 = L0_1
  L10_2 = L10_2.newButton
  L11_2 = {}
  L11_2.x = 355
  L11_2.y = 105
  L11_2.width = 43
  L11_2.height = 38
  L11_2.image = "images/gui/common/buttonClosePopupBrown.png"
  L11_2.onRelease = L7_2
  L10_2 = L10_2(L11_2)
  
  function L11_2()
    local L0_3, L1_3, L2_3
    L0_3 = L0_1
    L0_3 = L0_3.showOverlay
    L1_3 = "lua.overlays.editAccountData"
    L2_3 = {}
    L2_3.isModal = true
    L0_3(L1_3, L2_3)
  end
  
  L12_2 = L0_1
  L12_2 = L12_2.newButton
  L13_2 = {}
  L13_2.x = 180
  L14_2 = L4_2.y
  L15_2 = L4_2.height
  L14_2 = L14_2 + L15_2
  L14_2 = L14_2 - 10
  L13_2.y = L14_2
  L13_2.text = "email"
  L13_2.width = 126
  L13_2.height = 40
  L13_2.image = "images/gui/common/buttonTextB.png"
  L13_2.onRelease = L11_2
  L12_2 = L12_2(L13_2)
  
  function L13_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L0_1
    L0_3 = L0_3.database
    L0_3 = L0_3.getFacebookId
    L0_3 = L0_3()
    if not L0_3 then
      L0_3 = L0_1
      L0_3 = L0_3.analytics
      L0_3 = L0_3.newEvent
      L1_3 = "design"
      L2_3 = {}
      L2_3.event_id = "facebookLogin:attempt:prompt"
      L3_3 = L0_1
      L3_3 = L3_3.config
      L3_3 = L3_3.fullVersion
      L2_3.area = L3_3
      L0_3(L1_3, L2_3)
      L0_3 = L0_1
      L0_3 = L0_3.facebook
      L0_3 = L0_3.login
      L1_3 = {}
      L2_3 = "user_friends"
      L1_3[1] = L2_3
      L0_3(L1_3)
    end
  end
  
  L14_2 = L0_1
  L14_2 = L14_2.newButton
  L15_2 = {}
  L15_2.x = 320
  L16_2 = L4_2.y
  L17_2 = L4_2.height
  L16_2 = L16_2 + L17_2
  L16_2 = L16_2 - 10
  L15_2.y = L16_2
  L16_2 = {}
  L16_2.string = "connect"
  L17_2 = {}
  L18_2 = 1
  L19_2 = 1
  L20_2 = 1
  L17_2[1] = L18_2
  L17_2[2] = L19_2
  L17_2[3] = L20_2
  L16_2.color = L17_2
  L15_2.text = L16_2
  L15_2.width = 126
  L15_2.height = 40
  L15_2.image = "images/gui/common/buttonFacebook.png"
  L15_2.onRelease = L13_2
  L14_2 = L14_2(L15_2)
  
  function L15_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L5_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L4_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L6_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L10_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L12_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L14_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L3_2
    L0_3(L1_3, L2_3)
  end
  
  function L16_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L8_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L9_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L17_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L10_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L12_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L14_2
    L0_3(L1_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L8_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L9_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L17_2
  L17_2 = L15_2
  L17_2()
  L17_2 = L16_2
  L17_2()
  L17_2 = L0_1
  L17_2 = L17_2.bouncer
  L17_2 = L17_2.down
  L18_2 = L3_2
  L17_2(L18_2)
end

L1_1.create = L4_1

function L4_1(A0_2, A1_2)
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

L1_1.show = L4_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
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
        L3_2(L4_2)
      end
    end
    return
  end
  L3_2 = A0_2.view
  L4_2 = L3_1
  L4_2()
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
