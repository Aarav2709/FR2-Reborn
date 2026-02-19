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
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2
  L2_2 = A0_2.view
  L3_2 = require
  L4_2 = "lua.network.tcpMessageFormat"
  L3_2 = L3_2(L4_2)
  L4_2 = require
  L5_2 = "lua.network.httpsMessageFormat"
  L4_2 = L4_2(L5_2)
  L5_2 = require
  L6_2 = "lua.iap.inAppPurchase"
  L5_2 = L5_2(L6_2)
  L6_2 = nil
  L7_2 = nil
  L8_2 = display
  L8_2 = L8_2.newGroup
  L8_2 = L8_2()
  L9_2 = nil
  L10_2 = {}
  L11_2 = L0_1
  L11_2 = L11_2.storeConfig
  L11_2 = L11_2.getGemPrices
  L11_2 = L11_2()
  L12_2 = nil
  L13_2 = display
  L13_2 = L13_2.newRect
  L14_2 = 0
  L15_2 = 0
  L16_2 = display
  L16_2 = L16_2.contentWidth
  L17_2 = display
  L17_2 = L17_2.contentHeight
  L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
  L13_2.anchorX = 0
  L13_2.anchorY = 0
  L15_2 = L13_2
  L14_2 = L13_2.setFillColor
  L16_2 = 0
  L17_2 = 0
  L18_2 = 0
  L19_2 = 0.7843137254901961
  L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
  L13_2.x = 0
  L13_2.y = 0
  L13_2.isVisible = false
  L14_2 = display
  L14_2 = L14_2.newGroup
  L14_2 = L14_2()
  L15_2 = display
  L15_2 = L15_2.newImageRect
  L16_2 = "images/gui/common/black.png"
  L17_2 = 480
  L18_2 = 320
  L15_2 = L15_2(L16_2, L17_2, L18_2)
  L16_2 = display
  L16_2 = L16_2.contentWidth
  L16_2 = L16_2 * 0.5
  L15_2.x = L16_2
  L16_2 = display
  L16_2 = L16_2.contentHeight
  L16_2 = L16_2 * 0.5
  L15_2.y = L16_2
  L16_2 = display
  L16_2 = L16_2.newImageRect
  L17_2 = "images/gui/market/gemsBuyTiers.png"
  L18_2 = 448
  L19_2 = 315
  L16_2 = L16_2(L17_2, L18_2, L19_2)
  L16_2.anchorY = 0
  L17_2 = display
  L17_2 = L17_2.contentWidth
  L17_2 = L17_2 * 0.5
  L16_2.x = L17_2
  L16_2.y = 0
  L17_2 = display
  L17_2 = L17_2.newImageRect
  L18_2 = "images/gui/market/gemsBear.png"
  L19_2 = 165
  L20_2 = 156
  L17_2 = L17_2(L18_2, L19_2, L20_2)
  L17_2.anchorX = 0
  L17_2.anchorY = 0
  L17_2.x = 320
  L17_2.y = 172
  L18_2 = L0_1
  L18_2 = L18_2.newText
  L19_2 = {}
  L20_2 = L0_1
  L20_2 = L20_2.localized
  L20_2 = L20_2.get
  L21_2 = "IAPADINFO"
  L20_2 = L20_2(L21_2)
  L19_2.string = L20_2
  L19_2.x = 380
  L19_2.y = 210
  L19_2.width = 120
  L19_2.size = 13
  L20_2 = {}
  L21_2 = 0
  L22_2 = 0
  L23_2 = 0
  L20_2[1] = L21_2
  L20_2[2] = L22_2
  L20_2[3] = L23_2
  L19_2.color = L20_2
  L19_2.align = "center"
  L18_2 = L18_2(L19_2)
  L19_2 = L0_1
  L19_2 = L19_2.newText
  L20_2 = {}
  L21_2 = L0_1
  L21_2 = L21_2.localized
  L21_2 = L21_2.get
  L22_2 = "Buy Gems"
  L21_2 = L21_2(L22_2)
  L20_2.string = L21_2
  L21_2 = L16_2.x
  L20_2.x = L21_2
  L21_2 = L16_2.y
  L21_2 = L21_2 + 28
  L20_2.y = L21_2
  L20_2.size = 22
  L21_2 = {}
  L22_2 = 1
  L23_2 = 1
  L24_2 = 1
  L21_2[1] = L22_2
  L21_2[2] = L23_2
  L21_2[3] = L24_2
  L20_2.color = L21_2
  L19_2 = L19_2(L20_2)
  L19_2.isVisible = false
  L20_2 = L0_1
  L20_2 = L20_2.newText
  L21_2 = {}
  L21_2.string = ""
  L22_2 = L16_2.x
  L21_2.x = L22_2
  L22_2 = L16_2.y
  L22_2 = L22_2 + 300
  L21_2.y = L22_2
  L21_2.size = 12
  L21_2.width = 300
  L21_2.align = "center"
  L20_2 = L20_2(L21_2)
  L21_2 = L0_1
  L21_2 = L21_2.newText
  L22_2 = {}
  L22_2.string = ""
  L23_2 = L16_2.x
  L22_2.x = L23_2
  L23_2 = L16_2.y
  L23_2 = L23_2 + 210
  L22_2.y = L23_2
  L22_2.size = 20
  L22_2.width = 300
  L23_2 = {}
  L24_2 = 1
  L25_2 = 1
  L26_2 = 1
  L23_2[1] = L24_2
  L23_2[2] = L25_2
  L23_2[3] = L26_2
  L22_2.color = L23_2
  L22_2.align = "center"
  L21_2 = L21_2(L22_2)
  L22_2 = L0_1
  L22_2 = L22_2.newText
  L23_2 = {}
  L23_2.string = ""
  L24_2 = L16_2.x
  L23_2.x = L24_2
  L24_2 = L16_2.y
  L24_2 = L24_2 + 94
  L23_2.y = L24_2
  L23_2.size = 12
  L22_2 = L22_2(L23_2)
  
  function L23_2()
    local L0_3, L1_3
    L0_3 = L9_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L9_2
      L0_3(L1_3)
      L0_3 = nil
      L9_2 = L0_3
    end
  end
  
  function L24_2()
    local L0_3, L1_3
    L0_3 = L6_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L6_2
      L0_3(L1_3)
      L0_3 = nil
      L6_2 = L0_3
    end
    L0_3 = L23_2
    L0_3()
  end
  
  function L25_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.data
    L0_3.iapOverlayActive = false
    L0_3 = L24_2
    L0_3()
    L0_3 = L13_2
    L0_3.isVisible = false
    L0_3 = L21_2
    L0_3.text = ""
  end
  
  function L26_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = L21_2
    L0_3.text = ""
    L0_3 = L0_1
    L0_3 = L0_3.database
    L0_3 = L0_3.getReceipts
    L0_3 = L0_3()
    if L0_3 then
      L1_3 = #L0_3
      if 0 < L1_3 then
        L1_3 = L25_2
        L1_3()
        L1_3 = L0_1
        L1_3 = L1_3.hideOverlay
        L1_3()
        
        function L1_3()
          local L0_4, L1_4
          L0_4 = L0_1
          L0_4 = L0_4.gotoScene
          L1_4 = "lua.scenes.mainMenu"
          L0_4(L1_4)
          L0_4 = L0_1
          L0_4 = L0_4.removeScene
          L1_4 = "lua.scenes.marketplace"
          L0_4(L1_4)
        end
        
        L2_3 = {}
        L2_3.message = [[
Network connection error
Click OK and we'll restore your purchase]]
        L2_3.fontSize = 15
        L2_3.onCloseCallback = L1_3
        L3_3 = L0_1
        L3_3 = L3_3.createCustomOverlay
        L4_3 = 56
        L5_3 = nil
        L6_3 = L2_3
        L3_3(L4_3, L5_3, L6_3)
    end
    else
      L1_3 = L20_2
      L1_3.text = ""
      L1_3 = L25_2
      L1_3()
    end
  end
  
  function L27_2()
    local L0_3, L1_3, L2_3
    L0_3 = L0_1
    L0_3 = L0_3.data
    L0_3.iapOverlayActive = true
    L0_3 = L24_2
    L0_3()
    L0_3 = timer
    L0_3 = L0_3.performWithDelay
    L1_3 = 12000
    L2_3 = L26_2
    L0_3 = L0_3(L1_3, L2_3)
    L6_2 = L0_3
    L0_3 = L13_2
    L0_3.isVisible = true
  end
  
  function L28_2(A0_3, A1_3)
    local L2_3, L3_3
    L2_3 = type
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    if L2_3 == "string" then
      if A1_3 then
        L2_3 = L20_2
        L2_3.text = A0_3
        L2_3 = L25_2
        L2_3()
      else
        L2_3 = L21_2
        L2_3.text = A0_3
      end
    end
  end
  
  function L29_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = A0_3.m
    L2_3 = L4_2
    L2_3 = L2_3.buyCrystalIOS
    L2_3 = L2_3()
    if L1_3 ~= L2_3 then
      L1_3 = A0_3.m
      L2_3 = L4_2
      L2_3 = L2_3.buyCrystalGoogle
      L2_3 = L2_3()
      if L1_3 ~= L2_3 then
        L1_3 = A0_3.m
        L2_3 = L4_2
        L2_3 = L2_3.buyCrystalAmazon
        L2_3 = L2_3()
        if L1_3 ~= L2_3 then
          goto lbl_62
        end
      end
    end
    L1_3 = L25_2
    L1_3()
    L1_3 = A0_3.r
    if L1_3 then
      L1_3 = L20_2
      L2_3 = L0_1
      L2_3 = L2_3.localized
      L2_3 = L2_3.get
      L3_3 = "Invalid purchase"
      L2_3 = L2_3(L3_3)
      L1_3.text = L2_3
    else
      L1_3 = L0_1
      L1_3 = L1_3.analytics
      L1_3 = L1_3.newEvent
      L2_3 = "design"
      L3_3 = {}
      L4_3 = "market:cashPurchase:purchaseComplete:t"
      L5_3 = L12_2
      L4_3 = L4_3 .. L5_3
      L3_3.event_id = L4_3
      L4_3 = L12_2
      L3_3.value = L4_3
      L4_3 = L0_1
      L4_3 = L4_3.config
      L4_3 = L4_3.fullVersion
      L3_3.area = L4_3
      L1_3(L2_3, L3_3)
      L1_3 = L0_1
      L1_3 = L1_3.audio
      L1_3 = L1_3.play
      L2_3 = "buy_item"
      L1_3(L2_3)
      L4_1 = A0_3
      L1_3 = L0_1
      L1_3 = L1_3.hideOverlay
      L1_3()
      L1_3 = Runtime
      L2_3 = L1_3
      L1_3 = L1_3.dispatchEvent
      L3_3 = {}
      L3_3.name = "updateMoneyLabel"
      L1_3(L2_3, L3_3)
    end
    ::lbl_62::
  end
  
  function L30_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_3.m
    L2_3 = L3_2
    L2_3 = L2_3.purchaseItem
    L2_3 = L2_3()
    if L1_3 == L2_3 then
      L1_3 = A0_3.r
      if L1_3 then
        L1_3 = A0_3.r
        if L1_3 == 61 then
          L1_3 = L20_2
          L2_3 = L0_1
          L2_3 = L2_3.localized
          L2_3 = L2_3.get
          L3_3 = "Not enough coins"
          L2_3 = L2_3(L3_3)
          L1_3.text = L2_3
        else
          L1_3 = A0_3.r
          if L1_3 == 25 then
            L1_3 = L20_2
            L2_3 = L0_1
            L2_3 = L2_3.localized
            L2_3 = L2_3.get
            L3_3 = "You already own this"
            L2_3 = L2_3(L3_3)
            L1_3.text = L2_3
          else
            L1_3 = A0_3.r
            if L1_3 == 73 then
              L1_3 = L20_2
              L2_3 = L0_1
              L2_3 = L2_3.localized
              L2_3 = L2_3.get
              L3_3 = "Item not unlocked"
              L2_3 = L2_3(L3_3)
              L1_3.text = L2_3
            else
              L1_3 = L20_2
              L2_3 = L0_1
              L2_3 = L2_3.localized
              L2_3 = L2_3.get
              L3_3 = "Invalid purchase"
              L2_3 = L2_3(L3_3)
              L1_3.text = L2_3
            end
          end
        end
      else
        L1_3 = L0_1
        L1_3 = L1_3.audio
        L1_3 = L1_3.play
        L2_3 = "buy_item"
        L1_3(L2_3)
        L4_1 = A0_3
        L1_3 = L0_1
        L1_3 = L1_3.hideOverlay
        L1_3()
      end
    end
  end
  
  function L31_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = print
    L2_3 = "buyTier "
    L3_3 = A0_3
    L1_3(L2_3, L3_3)
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.iapCallActive
    if not L1_3 then
      L12_2 = A0_3
      L1_3 = L21_2
      L1_3.text = "contacting store"
      L1_3 = L27_2
      L1_3()
      L1_3 = L0_1
      L1_3 = L1_3.analytics
      L1_3 = L1_3.IAPdata
      L1_3.cartType = "buyGems"
      L1_3 = L5_2
      L1_3 = L1_3.buyThis
      L2_3 = A0_3
      L1_3(L2_3)
    else
      L1_3 = L20_2
      L1_3.text = "iap in progress"
    end
  end
  
  function L32_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3
    L0_3 = L11_2
    L0_3 = #L0_3
    if 0 < L0_3 then
      L0_3 = 1
      L1_3 = 5
      L2_3 = 1
      for L3_3 = L0_3, L1_3, L2_3 do
        L4_3 = display
        L4_3 = L4_3.newGroup
        L4_3 = L4_3()
        L5_3 = 132
        L6_3 = 123
        L7_3 = 10
        L8_3 = 90
        L9_3 = "images/gui/market/gemsTier"
        L10_3 = L3_3
        L11_3 = ".png"
        L9_3 = L9_3 .. L10_3 .. L11_3
        L10_3 = L7_3 * L3_3
        L10_3 = L8_3 + L10_3
        L11_3 = L3_3 - 1
        L11_3 = L5_3 * L11_3
        L10_3 = L10_3 + L11_3
        L11_3 = 106
        if 3 < L3_3 then
          L11_3 = 234
          L12_3 = L3_3 - 3
          L12_3 = L7_3 * L12_3
          L12_3 = L8_3 + L12_3
          L13_3 = L3_3 - 4
          L13_3 = L5_3 * L13_3
          L10_3 = L12_3 + L13_3
        end
        L12_3 = L0_1
        L12_3 = L12_3.newText
        L13_3 = {}
        L14_3 = L11_2
        L14_3 = L14_3[L3_3]
        L14_3 = L14_3.gems
        L13_3.string = L14_3
        L13_3.x = L10_3
        L14_3 = L11_3 - 44
        L13_3.y = L14_3
        L13_3.size = 20
        L14_3 = {}
        L15_3 = 0
        L16_3 = 0
        L17_3 = 0
        L14_3[1] = L15_3
        L14_3[2] = L16_3
        L14_3[3] = L17_3
        L13_3.color = L14_3
        L12_3 = L12_3(L13_3)
        L13_3 = L0_1
        L13_3 = L13_3.newText
        L14_3 = {}
        L15_3 = L5_2
        L15_3 = L15_3.getLocalizedPrice
        L16_3 = L3_3
        L15_3 = L15_3(L16_3)
        L14_3.string = L15_3
        L14_3.x = L10_3
        L15_3 = L11_3 + 44
        L14_3.y = L15_3
        L14_3.size = 18
        L15_3 = {}
        L16_3 = 1
        L17_3 = 1
        L18_3 = 1
        L15_3[1] = L16_3
        L15_3[2] = L17_3
        L15_3[3] = L18_3
        L14_3.color = L15_3
        L13_3 = L13_3(L14_3)
        L14_3 = L0_1
        L14_3 = L14_3.newButton
        L15_3 = {}
        L15_3.image = L9_3
        L15_3.width = L5_3
        L15_3.height = L6_3
        
        function L16_3()
          local L0_4, L1_4
          L0_4 = L31_2
          L1_4 = L3_3
          L0_4(L1_4)
        end
        
        L15_3.onRelease = L16_3
        L15_3.x = L10_3
        L15_3.y = L11_3
        L14_3 = L14_3(L15_3)
        L15_3 = display
        L15_3 = L15_3.newImageRect
        L16_3 = "images/gui/common/gem_small.png"
        L17_3 = 15
        L18_3 = 15
        L15_3 = L15_3(L16_3, L17_3, L18_3)
        L16_3 = L12_3.x
        L17_3 = L12_3.width
        L17_3 = L17_3 / 2
        L16_3 = L16_3 - L17_3
        L16_3 = L16_3 - 5
        L15_3.x = L16_3
        L16_3 = L12_3.y
        L15_3.y = L16_3
        L17_3 = L4_3
        L16_3 = L4_3.insert
        L18_3 = L14_3
        L16_3(L17_3, L18_3)
        L17_3 = L4_3
        L16_3 = L4_3.insert
        L18_3 = L12_3
        L16_3(L17_3, L18_3)
        L17_3 = L4_3
        L16_3 = L4_3.insert
        L18_3 = L13_3
        L16_3(L17_3, L18_3)
        L17_3 = L4_3
        L16_3 = L4_3.insert
        L18_3 = L15_3
        L16_3(L17_3, L18_3)
        L16_3 = L10_2
        L17_3 = L10_2
        L17_3 = #L17_3
        L17_3 = L17_3 + 1
        L16_3[L17_3] = L4_3
      end
    else
    end
  end
  
  L33_2 = L32_2
  L33_2()
  
  function L33_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  L34_2 = L0_1
  L34_2 = L34_2.newButton
  L35_2 = {}
  L35_2.image = "images/gui/common/buttonClosePopupBrown.png"
  L35_2.onRelease = L33_2
  L35_2.width = 43
  L35_2.height = 38
  L36_2 = L16_2.x
  L36_2 = L36_2 + 210
  L35_2.x = L36_2
  L36_2 = L16_2.y
  L36_2 = L36_2 + 30
  L35_2.y = L36_2
  L34_2 = L34_2(L35_2)
  
  function L35_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L16_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L34_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L20_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L19_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L22_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
    L0_3 = 1
    L1_3 = 5
    L2_3 = 1
    for L3_3 = L0_3, L1_3, L2_3 do
      L4_3 = L10_2
      L4_3 = L4_3[L3_3]
      if L4_3 then
        L4_3 = L14_2
        L5_3 = L4_3
        L4_3 = L4_3.insert
        L6_3 = L10_2
        L6_3 = L6_3[L3_3]
        L4_3(L5_3, L6_3)
      end
    end
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L17_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L18_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L14_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L13_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L21_2
    L0_3(L1_3, L2_3)
  end
  
  function L36_2(A0_3)
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
  
  function L37_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
    end
    L1_3 = true
    return L1_3
  end
  
  function L38_2()
    local L0_3, L1_3
    L0_3 = L23_2
    L0_3()
  end
  
  function L39_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L13_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L37_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L15_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L36_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L16_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L37_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "iapDone"
    L3_3 = L38_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L40_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L34_2
    L0_3(L1_3)
    L0_3 = transition
    L0_3 = L0_3.cancel
    L1_3 = L17_2
    L0_3(L1_3)
    L0_3 = L7_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L7_2
      L0_3(L1_3)
    end
    L0_3 = 1
    L1_3 = 5
    L2_3 = 1
    for L3_3 = L0_3, L1_3, L2_3 do
      L4_3 = display
      L4_3 = L4_3.remove
      L5_3 = L10_2
      L5_3 = L5_3[L3_3]
      L4_3(L5_3)
    end
    L0_3 = L24_2
    L0_3()
    L0_3 = L13_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L37_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L15_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L36_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L16_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L37_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "iapDone"
    L3_3 = L38_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L40_2
  L40_2 = L35_2
  L40_2()
  L40_2 = L39_2
  L40_2()
  L40_2 = L0_1
  L40_2 = L40_2.commHttps
  L40_2 = L40_2.setCallback
  L41_2 = L29_2
  L40_2(L41_2)
  L40_2 = L5_2.setInAppPurchaseCallback
  L41_2 = L28_2
  L40_2(L41_2)
  L40_2 = L0_1
  L40_2 = L40_2.bouncer
  L40_2 = L40_2.down
  L41_2 = L14_2
  L40_2(L41_2)
  L40_2 = timer
  L40_2 = L40_2.performWithDelay
  L41_2 = 5000
  L42_2 = L38_2
  L40_2 = L40_2(L41_2, L42_2)
  L9_2 = L40_2
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
