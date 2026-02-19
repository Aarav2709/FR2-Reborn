local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  L2_2 = A0_2.view
  L3_2 = require
  L4_2 = "lua.modules.currencyDisplay"
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2.create
  L3_2 = L3_2()
  L4_2 = require
  L5_2 = "lua.network.tcpMessageFormat"
  L4_2 = L4_2(L5_2)
  L5_2 = display
  L5_2 = L5_2.newGroup
  L5_2 = L5_2()
  L6_2 = A1_2.params
  L6_2 = L6_2.giftData
  L7_2 = display
  L7_2 = L7_2.newImageRect
  L8_2 = "images/gui/common/generalPopup.png"
  L9_2 = 248
  L10_2 = 105
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L7_2.anchorX = 0.5
  L7_2.anchorY = 0
  L8_2 = display
  L8_2 = L8_2.contentWidth
  L8_2 = L8_2 * 0.5
  L7_2.x = L8_2
  L7_2.y = 80
  L8_2 = display
  L8_2 = L8_2.newRect
  L9_2 = 0
  L10_2 = 0
  L11_2 = display
  L11_2 = L11_2.contentWidth
  L12_2 = display
  L12_2 = L12_2.contentHeight
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
  L8_2.anchorX = 0
  L8_2.anchorY = 0
  L10_2 = L8_2
  L9_2 = L8_2.setFillColor
  L11_2 = 0
  L12_2 = 0
  L13_2 = 0
  L14_2 = 0.5882352941176471
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
  L8_2.x = 0
  L8_2.y = 0
  L9_2 = L0_1
  L9_2 = L9_2.newText
  L10_2 = {}
  L11_2 = L0_1
  L11_2 = L11_2.localized
  L11_2 = L11_2.get
  L12_2 = "You own all items"
  L11_2 = L11_2(L12_2)
  L10_2.string = L11_2
  L10_2.size = 18
  L11_2 = L7_2.x
  L10_2.x = L11_2
  L11_2 = L7_2.y
  L11_2 = L11_2 + 14
  L10_2.y = L11_2
  L10_2.width = 220
  L10_2.align = "center"
  L10_2.ay = 0.5
  L11_2 = {}
  L12_2 = 1
  L13_2 = 1
  L14_2 = 1
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L11_2[3] = L14_2
  L10_2.color = L11_2
  L9_2 = L9_2(L10_2)
  L10_2 = L0_1
  L10_2 = L10_2.newText
  L11_2 = {}
  L12_2 = L0_1
  L12_2 = L12_2.localized
  L12_2 = L12_2.get
  L13_2 = "Wait for next patch or claim for "
  L14_2 = L0_1
  L14_2 = L14_2.storeConfig
  L14_2 = L14_2.getGiftGemConversion
  L14_2 = L14_2()
  L15_2 = " gems"
  L13_2 = L13_2 .. L14_2 .. L15_2
  L12_2 = L12_2(L13_2)
  L11_2.string = L12_2
  L11_2.size = 12
  L12_2 = L9_2.x
  L11_2.x = L12_2
  L12_2 = L9_2.y
  L12_2 = L12_2 + 26
  L11_2.y = L12_2
  L11_2.width = 240
  L11_2.align = "center"
  L11_2.ay = 0.5
  L12_2 = L0_1
  L12_2 = L12_2.colors
  L12_2 = L12_2.white
  L11_2.color = L12_2
  L10_2 = L10_2(L11_2)
  
  function L11_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  function L12_2(A0_3)
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
  
  function L13_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
    end
    L1_3 = true
    return L1_3
  end
  
  function L14_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = L0_1
    L1_3 = L1_3.comm
    L1_3 = L1_3.claimMysteryBox
    L2_3 = L6_2
    L2_3 = L2_3.i
    L3_3 = L6_2
    L3_3 = L3_3.f
    L4_3 = L6_2
    L4_3 = L4_3._id
    L5_3 = true
    L1_3(L2_3, L3_3, L4_3, L5_3)
    L1_3 = true
    return L1_3
  end
  
  L15_2 = L0_1
  L15_2 = L15_2.newButton
  L16_2 = {}
  L17_2 = L7_2.x
  L17_2 = L17_2 - 58
  L16_2.x = L17_2
  L17_2 = L7_2.y
  L18_2 = L7_2.height
  L18_2 = L18_2 * 0.8
  L17_2 = L17_2 + L18_2
  L16_2.y = L17_2
  L16_2.width = 110
  L16_2.height = 40
  L17_2 = L0_1
  L17_2 = L17_2.localized
  L17_2 = L17_2.get
  L18_2 = "Get Gems!"
  L17_2 = L17_2(L18_2)
  L16_2.text = L17_2
  L16_2.image = "images/gui/common/buttonTextA.png"
  L16_2.onRelease = L14_2
  L15_2 = L15_2(L16_2)
  
  function L16_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
    L0_3 = true
    return L0_3
  end
  
  L17_2 = L0_1
  L17_2 = L17_2.newButton
  L18_2 = {}
  L19_2 = L7_2.x
  L19_2 = L19_2 + 58
  L18_2.x = L19_2
  L19_2 = L7_2.y
  L20_2 = L7_2.height
  L20_2 = L20_2 * 0.8
  L19_2 = L19_2 + L20_2
  L18_2.y = L19_2
  L18_2.width = 110
  L18_2.height = 40
  L19_2 = L0_1
  L19_2 = L19_2.localized
  L19_2 = L19_2.get
  L20_2 = "Wait"
  L19_2 = L19_2(L20_2)
  L18_2.text = L19_2
  L18_2.image = "images/gui/common/buttonTextB.png"
  L18_2.onRelease = L16_2
  L17_2 = L17_2(L18_2)
  
  function L18_2()
    local L0_3, L1_3
    L0_3 = L17_2
    L0_3.isVisible = false
    L0_3 = L15_2
    L0_3.isVisible = false
  end
  
  L19_2 = L0_1
  L19_2 = L19_2.newButton
  L20_2 = {}
  L20_2.x = 345
  L21_2 = L7_2.y
  L21_2 = L21_2 + 14
  L20_2.y = L21_2
  L20_2.width = 43
  L20_2.height = 38
  L20_2.image = "images/gui/common/buttonClosePopupBrown.png"
  L20_2.onRelease = L11_2
  L19_2 = L19_2(L20_2)
  
  function L20_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L10_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L9_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L19_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L17_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L3_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L5_2
    L0_3(L1_3, L2_3)
  end
  
  function L21_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L12_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L13_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L22_2 = nil
  L23_2 = nil
  
  function L24_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L3_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = L22_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L22_2
      L0_3(L1_3)
      L0_3 = nil
      L22_2 = L0_3
    end
    L0_3 = L23_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L23_2
      L0_3(L1_3)
      L0_3 = nil
      L23_2 = L0_3
    end
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L19_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L17_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L15_2
    L0_3(L1_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L12_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L13_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L24_2
  L24_2 = L20_2
  L24_2()
  L24_2 = L21_2
  L24_2()
  
  function L24_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_3.m
    L2_3 = L4_2
    L2_3 = L2_3.claimMysteryBox
    L2_3 = L2_3()
    if L1_3 == L2_3 then
      function L1_3()
        local L0_4, L1_4, L2_4, L3_4
        
        L0_4 = timer
        L0_4 = L0_4.performWithDelay
        L1_4 = 1000
        L2_4 = L11_2
        L3_4 = 1
        L0_4 = L0_4(L1_4, L2_4, L3_4)
        L23_2 = L0_4
      end
      
      L2_3 = L3_2
      L2_3 = L2_3.refreshMoney
      L3_3 = L1_3
      L2_3(L3_3)
      L2_3 = L18_2
      L2_3()
    end
  end
  
  L25_2 = timer
  L25_2 = L25_2.performWithDelay
  L26_2 = 500
  
  function L27_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.comm
    L0_3 = L0_3.setCallback
    L1_3 = L24_2
    L0_3(L1_3)
  end
  
  L28_2 = 1
  L25_2 = L25_2(L26_2, L27_2, L28_2)
  L22_2 = L25_2
  L25_2 = L0_1
  L25_2 = L25_2.bouncer
  L25_2 = L25_2.down
  L26_2 = L5_2
  L25_2(L26_2)
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
