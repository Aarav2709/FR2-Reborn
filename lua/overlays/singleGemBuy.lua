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
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2
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
  L7_2 = display
  L7_2 = L7_2.newGroup
  L7_2 = L7_2()
  L8_2 = nil
  L9_2 = nil
  L10_2 = nil
  L11_2 = nil
  L12_2 = nil
  L13_2 = L0_1
  L13_2 = L13_2.storeConfig
  L13_2 = L13_2.getGemPrices
  L13_2 = L13_2()
  L14_2 = nil
  L15_2 = display
  L15_2 = L15_2.newRect
  L16_2 = 0
  L17_2 = 0
  L18_2 = display
  L18_2 = L18_2.contentWidth
  L19_2 = display
  L19_2 = L19_2.contentHeight
  L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2)
  L15_2.anchorX = 0
  L15_2.anchorY = 0
  L17_2 = L15_2
  L16_2 = L15_2.setFillColor
  L18_2 = 0
  L19_2 = 0
  L20_2 = 0
  L21_2 = 0.7843137254901961
  L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
  L15_2.x = 0
  L15_2.y = 0
  L15_2.isVisible = false
  L16_2 = display
  L16_2 = L16_2.newGroup
  L16_2 = L16_2()
  L17_2 = display
  L17_2 = L17_2.newImageRect
  L18_2 = "images/gui/common/black.png"
  L19_2 = 480
  L20_2 = 320
  L17_2 = L17_2(L18_2, L19_2, L20_2)
  L18_2 = display
  L18_2 = L18_2.contentWidth
  L18_2 = L18_2 * 0.5
  L17_2.x = L18_2
  L18_2 = display
  L18_2 = L18_2.contentHeight
  L18_2 = L18_2 * 0.5
  L17_2.y = L18_2
  L18_2 = display
  L18_2 = L18_2.newImageRect
  L19_2 = "images/gui/market/gemsBuySingle.png"
  L20_2 = 211
  L21_2 = 236
  L18_2 = L18_2(L19_2, L20_2, L21_2)
  L18_2.anchorY = 0
  L19_2 = display
  L19_2 = L19_2.contentWidth
  L19_2 = L19_2 * 0.5
  L18_2.x = L19_2
  L18_2.y = 0
  L19_2 = L0_1
  L19_2 = L19_2.newText
  L20_2 = {}
  L21_2 = L0_1
  L21_2 = L21_2.localized
  L21_2 = L21_2.get
  L22_2 = "Buy missing Gems"
  L21_2 = L21_2(L22_2)
  L20_2.string = L21_2
  L21_2 = L18_2.x
  L20_2.x = L21_2
  L21_2 = L18_2.y
  L21_2 = L21_2 + 68
  L20_2.y = L21_2
  L20_2.size = 20
  L21_2 = {}
  L22_2 = 1
  L23_2 = 1
  L24_2 = 1
  L21_2[1] = L22_2
  L21_2[2] = L23_2
  L21_2[3] = L24_2
  L20_2.color = L21_2
  L19_2 = L19_2(L20_2)
  L20_2 = L0_1
  L20_2 = L20_2.newText
  L21_2 = {}
  L21_2.string = ""
  L22_2 = L18_2.x
  L21_2.x = L22_2
  L22_2 = L18_2.y
  L22_2 = L22_2 + 220
  L21_2.y = L22_2
  L21_2.size = 12
  L21_2.width = 200
  L21_2.align = "center"
  L20_2 = L20_2(L21_2)
  L21_2 = L0_1
  L21_2 = L21_2.newText
  L22_2 = {}
  L22_2.string = ""
  L23_2 = L18_2.x
  L22_2.x = L23_2
  L23_2 = L18_2.y
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
  L24_2 = L18_2.x
  L23_2.x = L24_2
  L24_2 = L18_2.y
  L24_2 = L24_2 + 94
  L23_2.y = L24_2
  L23_2.size = 12
  L22_2 = L22_2(L23_2)
  
  function L23_2()
    local L0_3, L1_3
    L0_3 = L8_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L8_2
      L0_3(L1_3)
      L0_3 = nil
      L8_2 = L0_3
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
    L0_3 = L15_2
    L0_3.isVisible = false
    L0_3 = L21_2
    L0_3.text = ""
  end
  
  function L26_2()
    local L0_3, L1_3, L2_3
    L0_3 = L21_2
    L0_3.text = ""
    L0_3 = L20_2
    L1_3 = L0_1
    L1_3 = L1_3.localized
    L1_3 = L1_3.get
    L2_3 = "timeout"
    L1_3 = L1_3(L2_3)
    L0_3.text = L1_3
    L0_3 = L25_2
    L0_3()
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
    L0_3 = L15_2
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
  
  function L29_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = A1_2
    L0_3 = L0_3.params
    L0_3 = L0_3.oldItem
    L0_3 = L0_3.supporterLevel
    if L0_3 then
      L0_3 = {}
      L0_3.isModal = true
      L1_3 = {}
      L2_3 = A1_2
      L2_3 = L2_3.params
      L2_3 = L2_3.oldItem
      L1_3.clanSupporterLevelData = L2_3
      L0_3.params = L1_3
      L1_3 = L0_1
      L1_3 = L1_3.showOverlay
      L2_3 = "lua.modules.clans.clanSupporterPurchaseOverlay"
      L3_3 = L0_3
      L1_3(L2_3, L3_3)
      return
    end
    L0_3 = {}
    L0_3.isModal = true
    L1_3 = {}
    L2_3 = A1_2
    L2_3 = L2_3.params
    L2_3 = L2_3.oldItem
    L1_3.item = L2_3
    L0_3.params = L1_3
    L1_3 = L0_1
    L1_3 = L1_3.showOverlay
    L2_3 = "lua.overlays.marketBuy"
    L3_3 = L0_3
    L1_3(L2_3, L3_3)
  end
  
  function L30_2(A0_3)
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
          goto lbl_64
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
      L5_3 = L14_2
      L4_3 = L4_3 .. L5_3
      L3_3.event_id = L4_3
      L4_3 = L14_2
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
      L1_3 = L29_2
      L1_3()
      L1_3 = Runtime
      L2_3 = L1_3
      L1_3 = L1_3.dispatchEvent
      L3_3 = {}
      L3_3.name = "updateMoneyLabel"
      L1_3(L2_3, L3_3)
    end
    ::lbl_64::
  end
  
  function L31_2(A0_3)
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
  
  function L32_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = print
    L2_3 = "buyTier "
    L3_3 = A0_3
    L1_3(L2_3, L3_3)
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.iapCallActive
    if not L1_3 then
      L14_2 = A0_3
      L1_3 = L21_2
      L1_3.text = "contacting store"
      L1_3 = L27_2
      L1_3()
      L1_3 = L0_1
      L1_3 = L1_3.analytics
      L1_3 = L1_3.IAPdata
      L1_3.cartType = "buyGemsSingle"
      L1_3 = L5_2
      L1_3 = L1_3.buyThis
      L2_3 = A0_3
      L1_3(L2_3)
    else
      L1_3 = L20_2
      L1_3.text = "iap in progress"
    end
  end
  
  function L33_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    L1_3 = L13_2
    L1_3 = #L1_3
    if 0 < L1_3 then
      L1_3 = A0_3
      L2_3 = 132
      L3_3 = 123
      L4_3 = "images/gui/market/gemsTier"
      L5_3 = L1_3
      L6_3 = ".png"
      L4_3 = L4_3 .. L5_3 .. L6_3
      L5_3 = L18_2
      L5_3 = L5_3.x
      L6_3 = L18_2
      L6_3 = L6_3.y
      L6_3 = L6_3 + 150
      L7_3 = L0_1
      L7_3 = L7_3.newText
      L8_3 = {}
      L9_3 = L13_2
      L9_3 = L9_3[L1_3]
      L9_3 = L9_3.gems
      L8_3.string = L9_3
      L8_3.x = L5_3
      L9_3 = L6_3 - 44
      L8_3.y = L9_3
      L8_3.size = 20
      L9_3 = {}
      L10_3 = 0
      L11_3 = 0
      L12_3 = 0
      L9_3[1] = L10_3
      L9_3[2] = L11_3
      L9_3[3] = L12_3
      L8_3.color = L9_3
      L7_3 = L7_3(L8_3)
      L11_2 = L7_3
      L7_3 = L0_1
      L7_3 = L7_3.newText
      L8_3 = {}
      L9_3 = L5_2
      L9_3 = L9_3.getLocalizedPrice
      L10_3 = L1_3
      L9_3 = L9_3(L10_3)
      L8_3.string = L9_3
      L8_3.x = L5_3
      L9_3 = L6_3 + 44
      L8_3.y = L9_3
      L8_3.size = 18
      L9_3 = {}
      L10_3 = 1
      L11_3 = 1
      L12_3 = 1
      L9_3[1] = L10_3
      L9_3[2] = L11_3
      L9_3[3] = L12_3
      L8_3.color = L9_3
      L7_3 = L7_3(L8_3)
      L10_2 = L7_3
      L7_3 = L0_1
      L7_3 = L7_3.newButton
      L8_3 = {}
      L8_3.image = L4_3
      L8_3.width = L2_3
      L8_3.height = L3_3
      
      function L9_3()
        local L0_4, L1_4
        L0_4 = L32_2
        L1_4 = L1_3
        L0_4(L1_4)
      end
      
      L8_3.onRelease = L9_3
      L8_3.x = L5_3
      L8_3.y = L6_3
      L7_3 = L7_3(L8_3)
      L9_2 = L7_3
      L7_3 = display
      L7_3 = L7_3.newImageRect
      L8_3 = "images/gui/common/gem.png"
      L9_3 = 15
      L10_3 = 15
      L7_3 = L7_3(L8_3, L9_3, L10_3)
      L12_2 = L7_3
      L7_3 = L12_2
      L8_3 = L11_2
      L8_3 = L8_3.x
      L9_3 = L11_2
      L9_3 = L9_3.width
      L9_3 = L9_3 / 2
      L8_3 = L8_3 - L9_3
      L8_3 = L8_3 - 5
      L7_3.x = L8_3
      L7_3 = L12_2
      L8_3 = L11_2
      L8_3 = L8_3.y
      L7_3.y = L8_3
    else
    end
  end
  
  function L34_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = A1_2
    L0_3 = L0_3.params
    L0_3 = L0_3.price
    L1_3 = L0_1
    L1_3 = L1_3.database
    L1_3 = L1_3.getGem
    L1_3 = L1_3()
    L1_3 = L0_3 - L1_3
    L2_3 = 1
    L3_3 = L13_2
    L3_3 = #L3_3
    L4_3 = 1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = L13_2
      L6_3 = L6_3[L5_3]
      L6_3 = L6_3.gems
      if L1_3 <= L6_3 then
        L6_3 = L33_2
        L7_3 = L5_3
        L6_3(L7_3)
        return
      end
    end
    L2_3 = L33_2
    L3_3 = L13_2
    L3_3 = #L3_3
    L2_3(L3_3)
  end
  
  function L35_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
    L0_3 = L29_2
    L0_3()
  end
  
  L36_2 = L0_1
  L36_2 = L36_2.newButton
  L37_2 = {}
  L37_2.image = "images/gui/common/buttonClosePopupBrown.png"
  L37_2.onRelease = L35_2
  L37_2.width = 43
  L37_2.height = 38
  L38_2 = L18_2.x
  L38_2 = L38_2 + 90
  L37_2.x = L38_2
  L38_2 = L18_2.y
  L38_2 = L38_2 + 84
  L37_2.y = L38_2
  L36_2 = L36_2(L37_2)
  
  function L37_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L17_2
    L0_3(L1_3, L2_3)
    L0_3 = L16_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L18_2
    L0_3(L1_3, L2_3)
    L0_3 = L16_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L36_2
    L0_3(L1_3, L2_3)
    L0_3 = L16_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L20_2
    L0_3(L1_3, L2_3)
    L0_3 = L16_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L19_2
    L0_3(L1_3, L2_3)
    L0_3 = L16_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L22_2
    L0_3(L1_3, L2_3)
    L0_3 = L16_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L0_3(L1_3, L2_3)
    L0_3 = L9_2
    if L0_3 then
      L0_3 = L16_2
      L1_3 = L0_3
      L0_3 = L0_3.insert
      L2_3 = L9_2
      L0_3(L1_3, L2_3)
    end
    L0_3 = L10_2
    if L0_3 then
      L0_3 = L16_2
      L1_3 = L0_3
      L0_3 = L0_3.insert
      L2_3 = L10_2
      L0_3(L1_3, L2_3)
    end
    L0_3 = L11_2
    if L0_3 then
      L0_3 = L16_2
      L1_3 = L0_3
      L0_3 = L0_3.insert
      L2_3 = L11_2
      L0_3(L1_3, L2_3)
    end
    L0_3 = L12_2
    if L0_3 then
      L0_3 = L16_2
      L1_3 = L0_3
      L0_3 = L0_3.insert
      L2_3 = L12_2
      L0_3(L1_3, L2_3)
    end
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L16_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L21_2
    L0_3(L1_3, L2_3)
  end
  
  function L38_2(A0_3)
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
  
  function L39_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
    end
    L1_3 = true
    return L1_3
  end
  
  function L40_2()
    local L0_3, L1_3
    L0_3 = L23_2
    L0_3()
  end
  
  function L41_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L15_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L39_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L17_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L38_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L18_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L39_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "iapDone"
    L3_3 = L40_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L42_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L36_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L9_2
    L0_3(L1_3)
    L0_3 = L24_2
    L0_3()
    L0_3 = L15_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L39_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L17_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L38_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L18_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L39_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "iapDone"
    L3_3 = L40_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L42_2
  L42_2 = L34_2
  L42_2()
  L42_2 = L37_2
  L42_2()
  L42_2 = L41_2
  L42_2()
  L42_2 = L0_1
  L42_2 = L42_2.commHttps
  L42_2 = L42_2.setCallback
  L43_2 = L30_2
  L42_2(L43_2)
  L42_2 = L5_2.setInAppPurchaseCallback
  L43_2 = L28_2
  L42_2(L43_2)
  L42_2 = L0_1
  L42_2 = L42_2.bouncer
  L42_2 = L42_2.down
  L43_2 = L16_2
  L42_2(L43_2)
  L42_2 = timer
  L42_2 = L42_2.performWithDelay
  L43_2 = 5000
  L44_2 = L40_2
  L42_2 = L42_2(L43_2, L44_2)
  L8_2 = L42_2
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
