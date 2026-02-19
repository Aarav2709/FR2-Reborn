local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil
L4_1 = nil

function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L2_2 = A0_2.view
  L3_2 = require
  L4_2 = "lua.network.tcpMessageFormat"
  L3_2 = L3_2(L4_2)
  L4_2 = A1_2.params
  L4_2 = L4_2.item
  L5_2 = A1_2.params
  L5_2 = L5_2.missingCoins
  L6_2 = A1_2.params
  L6_2 = L6_2.toConvert
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
  L13_2 = 0.7843137254901961
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L7_2.x = 0
  L7_2.y = 0
  L7_2.isVisible = false
  L8_2 = display
  L8_2 = L8_2.newGroup
  L8_2 = L8_2()
  L9_2 = display
  L9_2 = L9_2.newImageRect
  L10_2 = "images/gui/common/black.png"
  L11_2 = 480
  L12_2 = 320
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L10_2 = display
  L10_2 = L10_2.contentWidth
  L10_2 = L10_2 * 0.5
  L9_2.x = L10_2
  L10_2 = display
  L10_2 = L10_2.contentHeight
  L10_2 = L10_2 * 0.5
  L9_2.y = L10_2
  L10_2 = display
  L10_2 = L10_2.newImageRect
  L11_2 = "images/gui/market/popup/window.png"
  L12_2 = 276
  L13_2 = 253
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L10_2.anchorY = 0
  L11_2 = display
  L11_2 = L11_2.contentWidth
  L11_2 = L11_2 * 0.5
  L10_2.x = L11_2
  L10_2.y = 0
  
  function L11_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = A0_3.m
    L2_3 = L3_2
    L2_3 = L2_3.purchaseItem
    L2_3 = L2_3()
    if L1_3 == L2_3 then
      L1_3 = L0_1
      L1_3 = L1_3.audio
      L1_3 = L1_3.play
      L2_3 = "buy_item"
      L1_3(L2_3)
      L4_1 = A0_3
      L1_3 = L0_1
      L1_3 = L1_3.hideOverlay
      L1_3()
      L1_3 = L0_1
      L1_3 = L1_3.analytics
      L1_3 = L1_3.newEvent
      L2_3 = "design"
      L3_3 = {}
      L4_3 = "market:coinPurchase:purchaseComplete:"
      L5_3 = L4_2
      L5_3 = L5_3.key
      L4_3 = L4_3 .. L5_3
      L3_3.event_id = L4_3
      L4_3 = moneyValue
      L3_3.value = L4_3
      L4_3 = L0_1
      L4_3 = L4_3.config
      L4_3 = L4_3.fullVersion
      L3_3.area = L4_3
      L1_3(L2_3, L3_3)
    end
  end
  
  function L12_2()
    local L0_3, L1_3, L2_3
    L0_3 = print
    L1_3 = "Trying to buy"
    L2_3 = L4_2
    L2_3 = L2_3.key
    L0_3(L1_3, L2_3)
    L0_3 = L0_1
    L0_3 = L0_3.comm
    L0_3 = L0_3.setCallback
    L1_3 = L11_2
    L0_3(L1_3)
    L0_3 = L0_1
    L0_3 = L0_3.comm
    L0_3 = L0_3.purchaseItem
    L1_3 = L4_2
    L1_3 = L1_3.key
    L0_3(L1_3)
  end
  
  L13_2 = L0_1
  L13_2 = L13_2.newButton
  L14_2 = {}
  L14_2.onRelease = L12_2
  L14_2.image = "images/gui/market/popup/buttonGems.png"
  L15_2 = {}
  L15_2.string = L6_2
  L15_2.x = 1
  L15_2.y = 10
  L15_2.ax = 0.5
  L15_2.size = 14
  L14_2.text = L15_2
  L14_2.width = 77
  L14_2.height = 50
  L15_2 = L10_2.x
  L15_2 = L15_2 + 0
  L14_2.x = L15_2
  L15_2 = L10_2.y
  L15_2 = L15_2 + 250
  L14_2.y = L15_2
  L13_2 = L13_2(L14_2)
  
  function L14_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  L15_2 = L0_1
  L15_2 = L15_2.newButton
  L16_2 = {}
  L16_2.x = 360
  L16_2.y = 70
  L16_2.width = 33
  L16_2.height = 28
  L16_2.image = "images/gui/common/buttonClosePopup.png"
  L16_2.onRelease = L14_2
  L15_2 = L15_2(L16_2)
  L16_2 = L0_1
  L16_2 = L16_2.newText
  L17_2 = {}
  L18_2 = "Buy the missing "
  L19_2 = L5_2
  L20_2 = " coins?"
  L18_2 = L18_2 .. L19_2 .. L20_2
  L17_2.string = L18_2
  L17_2.size = 16
  L17_2.x = 250
  L17_2.y = 170
  L17_2.ax = 0.5
  L18_2 = {}
  L19_2 = 0
  L20_2 = 0
  L21_2 = 0
  L18_2[1] = L19_2
  L18_2[2] = L20_2
  L18_2[3] = L21_2
  L17_2.color = L18_2
  L16_2 = L16_2(L17_2)
  
  function L17_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L9_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L10_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L13_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L16_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L0_3(L1_3, L2_3)
  end
  
  function L18_2(A0_3)
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
  
  function L19_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
    end
    L1_3 = true
    return L1_3
  end
  
  function L20_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L19_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L18_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L19_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L21_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = btnDecline
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L13_2
    L0_3(L1_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L19_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L18_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L19_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L21_2
  L21_2 = L17_2
  L21_2()
  L21_2 = L20_2
  L21_2()
  L21_2 = L0_1
  L21_2 = L21_2.bouncer
  L21_2 = L21_2.down
  L22_2 = L8_2
  L21_2(L22_2)
end

L1_1.create = L5_1

function L5_1(A0_2, A1_2)
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

L1_1.show = L5_1

function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
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
        L6_2 = L4_1
        L4_2(L5_2, L6_2)
        L4_2 = nil
        L4_1 = L4_2
      end
    end
  end
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
