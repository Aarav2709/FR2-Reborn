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
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2
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
  L8_2 = nil
  L9_2 = nil
  L10_2 = L0_1
  L10_2 = L10_2.storeConfig
  L10_2 = L10_2.getGemPrices
  L10_2 = L10_2()
  L11_2 = nil
  L12_2 = A1_2.params
  L12_2 = L12_2.cartType
  if not L12_2 then
    L12_2 = "missing"
  end
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
  L15_2 = L15_2.newGroup
  L15_2 = L15_2()
  L16_2 = display
  L16_2 = L16_2.newImageRect
  L17_2 = "images/gui/common/black.png"
  L18_2 = 480
  L19_2 = 320
  L16_2 = L16_2(L17_2, L18_2, L19_2)
  L17_2 = display
  L17_2 = L17_2.contentWidth
  L17_2 = L17_2 * 0.5
  L16_2.x = L17_2
  L17_2 = display
  L17_2 = L17_2.contentHeight
  L17_2 = L17_2 * 0.5
  L16_2.y = L17_2
  L17_2 = display
  L17_2 = L17_2.newImageRect
  L18_2 = "images/gui/postgame/starterpack.png"
  L19_2 = 373
  L20_2 = 253
  L17_2 = L17_2(L18_2, L19_2, L20_2)
  L17_2.anchorY = 0
  L18_2 = display
  L18_2 = L18_2.contentWidth
  L18_2 = L18_2 * 0.5
  L18_2 = L18_2 - 20
  L17_2.x = L18_2
  L17_2.y = 0
  L18_2 = display
  L18_2 = L18_2.newImageRect
  L19_2 = "images/gui/common/headerSingle.png"
  L20_2 = 153
  L21_2 = 33
  L18_2 = L18_2(L19_2, L20_2, L21_2)
  L19_2 = display
  L19_2 = L19_2.contentWidth
  L19_2 = L19_2 * 0.5
  L18_2.x = L19_2
  L18_2.y = 69
  L19_2 = display
  L19_2 = L19_2.newImageRect
  L20_2 = "images/gui/postgame/starterpackValue.png"
  L21_2 = 74
  L22_2 = 45
  L19_2 = L19_2(L20_2, L21_2, L22_2)
  L20_2 = display
  L20_2 = L20_2.contentWidth
  L20_2 = L20_2 * 0.5
  L20_2 = L20_2 + 120
  L19_2.x = L20_2
  L19_2.y = 140
  L20_2 = L0_1
  L20_2 = L20_2.newText
  L21_2 = {}
  L22_2 = L0_1
  L22_2 = L22_2.localized
  L22_2 = L22_2.get
  L23_2 = "OR"
  L22_2 = L22_2(L23_2)
  L21_2.string = L22_2
  L22_2 = display
  L22_2 = L22_2.contentWidth
  L22_2 = L22_2 * 0.5
  L22_2 = L22_2 + 12
  L21_2.x = L22_2
  L22_2 = display
  L22_2 = L22_2.contentHeight
  L22_2 = L22_2 * 0.5
  L22_2 = L22_2 + 21
  L21_2.y = L22_2
  L21_2.size = 18
  L22_2 = {}
  L23_2 = 0.4470588235294118
  L24_2 = 0.26666666666666666
  L25_2 = 0.18823529411764706
  L22_2[1] = L23_2
  L22_2[2] = L24_2
  L22_2[3] = L25_2
  L21_2.color = L22_2
  L21_2.ax = 0.5
  L20_2 = L20_2(L21_2)
  L21_2 = L0_1
  L21_2 = L21_2.localized
  L21_2 = L21_2.get
  L22_2 = "StarterPack"
  L21_2 = L21_2(L22_2)
  L22_2 = L0_1
  L22_2 = L22_2.newText
  L23_2 = {}
  L23_2.string = L21_2
  L24_2 = display
  L24_2 = L24_2.contentWidth
  L24_2 = L24_2 * 0.5
  L24_2 = L24_2 + 12
  L23_2.x = L24_2
  L24_2 = L17_2.y
  L24_2 = L24_2 + 102
  L23_2.y = L24_2
  L23_2.size = 12
  L23_2.width = 250
  L23_2.align = "center"
  L24_2 = {}
  L25_2 = 0.4470588235294118
  L26_2 = 0.26666666666666666
  L27_2 = 0.18823529411764706
  L24_2[1] = L25_2
  L24_2[2] = L26_2
  L24_2[3] = L27_2
  L23_2.color = L24_2
  L23_2.ax = 0.5
  L22_2 = L22_2(L23_2)
  L23_2 = L0_1
  L23_2 = L23_2.newText
  L24_2 = {}
  L25_2 = L0_1
  L25_2 = L25_2.localized
  L25_2 = L25_2.get
  L26_2 = "Booster Pack"
  L25_2 = L25_2(L26_2)
  L24_2.string = L25_2
  L25_2 = L17_2.x
  L25_2 = L25_2 + 20
  L24_2.x = L25_2
  L25_2 = L17_2.y
  L25_2 = L25_2 + 68
  L24_2.y = L25_2
  L24_2.size = 20
  L25_2 = {}
  L26_2 = 1
  L27_2 = 1
  L28_2 = 1
  L25_2[1] = L26_2
  L25_2[2] = L27_2
  L25_2[3] = L28_2
  L24_2.color = L25_2
  L23_2 = L23_2(L24_2)
  L24_2 = L0_1
  L24_2 = L24_2.newText
  L25_2 = {}
  L25_2.string = ""
  L26_2 = L17_2.x
  L25_2.x = L26_2
  L26_2 = L17_2.y
  L26_2 = L26_2 + 220
  L25_2.y = L26_2
  L25_2.size = 12
  L25_2.width = 200
  L25_2.align = "center"
  L24_2 = L24_2(L25_2)
  L25_2 = L0_1
  L25_2 = L25_2.newText
  L26_2 = {}
  L26_2.string = ""
  L27_2 = L17_2.x
  L26_2.x = L27_2
  L27_2 = L17_2.y
  L27_2 = L27_2 + 210
  L26_2.y = L27_2
  L26_2.size = 20
  L26_2.width = 300
  L27_2 = {}
  L28_2 = 1
  L29_2 = 1
  L30_2 = 1
  L27_2[1] = L28_2
  L27_2[2] = L29_2
  L27_2[3] = L30_2
  L26_2.color = L27_2
  L26_2.align = "center"
  L25_2 = L25_2(L26_2)
  L26_2 = L0_1
  L26_2 = L26_2.newText
  L27_2 = {}
  L27_2.string = ""
  L28_2 = L17_2.x
  L27_2.x = L28_2
  L28_2 = L17_2.y
  L28_2 = L28_2 + 94
  L27_2.y = L28_2
  L27_2.size = 12
  L26_2 = L26_2(L27_2)
  
  function L27_2()
    local L0_3, L1_3
    L0_3 = L7_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L7_2
      L0_3(L1_3)
      L0_3 = nil
      L7_2 = L0_3
    end
  end
  
  function L28_2()
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
    L0_3 = L27_2
    L0_3()
  end
  
  function L29_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.data
    L0_3.iapOverlayActive = false
    L0_3 = L28_2
    L0_3()
    L0_3 = L13_2
    L0_3.isVisible = false
    L0_3 = L25_2
    L0_3.text = ""
  end
  
  function L30_2()
    local L0_3, L1_3, L2_3
    L0_3 = L25_2
    L0_3.text = ""
    L0_3 = L24_2
    L1_3 = L0_1
    L1_3 = L1_3.localized
    L1_3 = L1_3.get
    L2_3 = "timeout"
    L1_3 = L1_3(L2_3)
    L0_3.text = L1_3
    L0_3 = L29_2
    L0_3()
  end
  
  function L31_2()
    local L0_3, L1_3, L2_3
    L0_3 = L0_1
    L0_3 = L0_3.data
    L0_3.iapOverlayActive = true
    L0_3 = L28_2
    L0_3()
    L0_3 = timer
    L0_3 = L0_3.performWithDelay
    L1_3 = 12000
    L2_3 = L30_2
    L0_3 = L0_3(L1_3, L2_3)
    L6_2 = L0_3
    L0_3 = L13_2
    L0_3.isVisible = true
  end
  
  function L32_2(A0_3, A1_3)
    local L2_3, L3_3
    L2_3 = type
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    if L2_3 == "string" then
      if A1_3 then
        L2_3 = L24_2
        L2_3.text = A0_3
        L2_3 = L29_2
        L2_3()
      else
        L2_3 = L25_2
        L2_3.text = A0_3
      end
    end
  end
  
  function L33_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = A0_3.m
    L2_3 = L4_2
    L2_3 = L2_3.buyProductIOS
    L2_3 = L2_3()
    if L1_3 ~= L2_3 then
      L1_3 = A0_3.m
      L2_3 = L4_2
      L2_3 = L2_3.buyProductGoogle
      L2_3 = L2_3()
      if L1_3 ~= L2_3 then
        L1_3 = A0_3.m
        L2_3 = L4_2
        L2_3 = L2_3.buyProductOldGoogle
        L2_3 = L2_3()
        if L1_3 ~= L2_3 then
          L1_3 = A0_3.m
          L2_3 = L4_2
          L2_3 = L2_3.buyProductAmazon
          L2_3 = L2_3()
          if L1_3 ~= L2_3 then
            goto lbl_71
          end
        end
      end
    end
    L1_3 = L29_2
    L1_3()
    L1_3 = A0_3.r
    if L1_3 then
      L1_3 = L24_2
      L2_3 = L0_1
      L2_3 = L2_3.localized
      L2_3 = L2_3.get
      L3_3 = "Invalid purchase"
      L2_3 = L2_3(L3_3)
      L1_3.text = L2_3
    else
      L1_3 = A0_3.x
      if L1_3 then
        L1_3 = L0_1
        L1_3 = L1_3.analytics
        L1_3 = L1_3.newEvent
        L2_3 = "design"
        L3_3 = {}
        L4_3 = "starterPack:cashPurchase:purchaseComplete:"
        L5_3 = A0_3.x
        L4_3 = L4_3 .. L5_3
        L3_3.event_id = L4_3
        L4_3 = A0_3.x
        L3_3.value = L4_3
        L4_3 = L0_1
        L4_3 = L4_3.config
        L4_3 = L4_3.fullVersion
        L3_3.area = L4_3
        L1_3(L2_3, L3_3)
      end
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
      L3_3.name = "boughtStarterPack"
      L1_3(L2_3, L3_3)
    end
    ::lbl_71::
  end
  
  function L34_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = print
    L2_3 = "buy "
    L3_3 = A0_3
    L1_3(L2_3, L3_3)
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.iapCallActive
    if not L1_3 then
      L1_3 = L25_2
      L1_3.text = "contacting store"
      L1_3 = L31_2
      L1_3()
      L1_3 = L0_1
      L1_3 = L1_3.analytics
      L1_3 = L1_3.IAPdata
      L2_3 = L12_2
      L1_3.cartType = L2_3
      L1_3 = L5_2
      L1_3 = L1_3.buyProduct
      L2_3 = A0_3
      L1_3(L2_3)
    else
      L1_3 = L24_2
      L1_3.text = "iap in progress"
    end
  end
  
  function L35_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    L1_3 = 62
    L2_3 = 37
    L3_3 = "images/gui/ranking/promotion/buttonOk.png"
    L4_3 = L17_2
    L4_3 = L4_3.x
    L5_3 = L17_2
    L5_3 = L5_3.y
    L5_3 = L5_3 + 255
    L6_3 = L5_2
    L6_3 = L6_3.getLocalizedPriceForProductId
    L7_3 = A0_3
    L6_3 = L6_3(L7_3)
    L7_3 = L0_1
    L7_3 = L7_3.fitTextFontSize
    L8_3 = L6_3
    L9_3 = 12
    L10_3 = 18
    L11_3 = 46
    L7_3 = L7_3(L8_3, L9_3, L10_3, L11_3)
    L8_3 = L0_1
    L8_3 = L8_3.newText
    L9_3 = {}
    L9_3.string = L6_3
    L9_3.x = L4_3
    L10_3 = L5_3 - 1
    L9_3.y = L10_3
    L9_3.size = L7_3
    L10_3 = {}
    L11_3 = 0.1450980392156863
    L12_3 = 0.08235294117647059
    L13_3 = 0.06274509803921569
    L10_3[1] = L11_3
    L10_3[2] = L12_3
    L10_3[3] = L13_3
    L9_3.color = L10_3
    L8_3 = L8_3(L9_3)
    L9_3 = L0_1
    L9_3 = L9_3.newButton
    L10_3 = {}
    L10_3.image = L3_3
    L10_3.width = L1_3
    L10_3.height = L2_3
    
    function L11_3()
      local L0_4, L1_4
      L0_4 = L34_2
      L1_4 = A0_3
      L0_4(L1_4)
    end
    
    L10_3.onRelease = L11_3
    L10_3.x = L4_3
    L10_3.y = L5_3
    L9_3 = L9_3(L10_3)
    L11_3 = L9_3
    L10_3 = L9_3.insert
    L12_3 = L8_3
    L10_3(L11_3, L12_3)
    return L9_3
  end
  
  function L36_2()
    local L0_3, L1_3
    L0_3 = L35_2
    L1_3 = 1001
    L0_3 = L0_3(L1_3)
    L8_2 = L0_3
    L0_3 = L8_2
    L1_3 = L8_2
    L1_3 = L1_3.x
    L1_3 = L1_3 - 45
    L0_3.x = L1_3
    L0_3 = L35_2
    L1_3 = 1003
    L0_3 = L0_3(L1_3)
    L9_2 = L0_3
    L0_3 = L9_2
    L1_3 = L9_2
    L1_3 = L1_3.x
    L1_3 = L1_3 + 110
    L0_3.x = L1_3
  end
  
  function L37_2(A0_3, A1_3, A2_3, A3_3, A4_3)
    local L5_3, L6_3, L7_3, L8_3
    L5_3 = display
    L5_3 = L5_3.newImageRect
    L6_3 = A0_3
    L7_3 = A1_3
    L8_3 = A2_3
    L5_3 = L5_3(L6_3, L7_3, L8_3)
    L5_3.x = A3_3
    L5_3.y = A4_3
    return L5_3
  end
  
  function L38_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3
    L0_3 = L0_1
    L0_3 = L0_3.storeConfig
    L0_3 = L0_3.getStarterPackContents
    L0_3 = L0_3()
    if L0_3 then
      L1_3 = print
      L2_3 = "number of starter pack contents"
      L3_3 = #L0_3
      L1_3(L2_3, L3_3)
      L1_3 = "images/gui/postgame/starterpackRays.png"
      L2_3 = 302
      L3_3 = 165
      L4_3 = true
      L5_3 = 1
      L6_3 = #L0_3
      L7_3 = 1
      for L8_3 = L5_3, L6_3, L7_3 do
        L9_3 = L0_3[L8_3]
        L10_3 = nil
        L11_3 = 40
        L12_3 = 40
        L13_3 = nil
        L14_3 = -12
        L15_3 = L9_3.type
        if L15_3 == 901 then
          L10_3 = "images/gui/common/coin.png"
          L11_3 = 27
          L12_3 = 27
          L13_3 = L9_3.count
          L14_3 = -7
        else
          L15_3 = L9_3.type
          if L15_3 == 902 then
            L10_3 = "images/gui/common/gem.png"
            L11_3 = 27
            L12_3 = 27
            L13_3 = L9_3.count
            L14_3 = -7
          else
            L15_3 = L9_3.type
            if L15_3 == 1001 then
              L10_3 = "images/gui/market/items/boosts/1001.png"
              L13_3 = "DOUBLE COINS"
            else
              L15_3 = L9_3.type
              if L15_3 == 1002 then
                L10_3 = "images/gui/market/items/boosts/1002.png"
                L13_3 = "MYSTERY GIFT"
              end
            end
          end
        end
        if L10_3 then
          L15_3 = L37_2
          L16_3 = L1_3
          L17_3 = 71
          L18_3 = 38
          L19_3 = L2_3
          L20_3 = L3_3 + L14_3
          L20_3 = L20_3 - 6
          L15_3 = L15_3(L16_3, L17_3, L18_3, L19_3, L20_3)
          L15_3.xScale = 0.85
          L15_3.yScale = 0.85
          L16_3 = L15_2
          L17_3 = L16_3
          L16_3 = L16_3.insert
          L18_3 = L15_3
          L16_3(L17_3, L18_3)
          L16_3 = L15_2
          L17_3 = L16_3
          L16_3 = L16_3.insert
          L18_3 = L37_2
          L19_3 = L10_3
          L20_3 = L11_3
          L21_3 = L12_3
          L22_3 = L2_3
          L23_3 = L3_3 + L14_3
          L18_3, L19_3, L20_3, L21_3, L22_3, L23_3 = L18_3(L19_3, L20_3, L21_3, L22_3, L23_3)
          L16_3(L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3)
          if L13_3 then
            L16_3 = L0_1
            L16_3 = L16_3.newText
            L17_3 = {}
            L17_3.string = L13_3
            L17_3.x = L2_3
            L18_3 = L3_3 + 13
            L17_3.y = L18_3
            L17_3.size = 10
            L18_3 = {}
            L19_3 = 0.43529411764705883
            L20_3 = 0.3843137254901961
            L21_3 = 0.3254901960784314
            L18_3[1] = L19_3
            L18_3[2] = L20_3
            L18_3[3] = L21_3
            L17_3.color = L18_3
            L17_3.ax = 0.5
            L16_3 = L16_3(L17_3)
            L17_3 = L15_2
            L18_3 = L17_3
            L17_3 = L17_3.insert
            L19_3 = L16_3
            L17_3(L18_3, L19_3)
          end
          if L4_3 then
            L4_3 = false
            L2_3 = L2_3 + 61
          else
            L4_3 = true
            L2_3 = L2_3 - 61
            L3_3 = L3_3 + 50
          end
        end
      end
    else
      L1_3 = print
      L2_3 = "config does not contain starter pack contents"
      L1_3(L2_3)
      L1_3 = L0_1
      L1_3 = L1_3.hideOverlay
      L1_3()
    end
  end
  
  function L39_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    L0_3 = "images/gui/postgame/starterpackRays.png"
    L1_3 = "images/gui/market/items/boosts/1001.png"
    L2_3 = 172
    L3_3 = 183
    L4_3 = L37_2
    L5_3 = L0_3
    L6_3 = 71
    L7_3 = 38
    L8_3 = L2_3
    L9_3 = L3_3 - 18
    L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3)
    L4_3.xScale = 0.85
    L4_3.yScale = 0.85
    L5_3 = L15_2
    L6_3 = L5_3
    L5_3 = L5_3.insert
    L7_3 = L4_3
    L5_3(L6_3, L7_3)
    L5_3 = L15_2
    L6_3 = L5_3
    L5_3 = L5_3.insert
    L7_3 = L37_2
    L8_3 = L1_3
    L9_3 = 40
    L10_3 = 40
    L11_3 = L2_3
    L12_3 = L3_3 - 12
    L7_3, L8_3, L9_3, L10_3, L11_3, L12_3 = L7_3(L8_3, L9_3, L10_3, L11_3, L12_3)
    L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
    L5_3 = "DOUBLE COINS"
    L6_3 = L0_1
    L6_3 = L6_3.newText
    L7_3 = {}
    L7_3.string = L5_3
    L7_3.x = L2_3
    L8_3 = L3_3 + 13
    L7_3.y = L8_3
    L7_3.size = 10
    L8_3 = {}
    L9_3 = 0.43529411764705883
    L10_3 = 0.3843137254901961
    L11_3 = 0.3254901960784314
    L8_3[1] = L9_3
    L8_3[2] = L10_3
    L8_3[3] = L11_3
    L7_3.color = L8_3
    L7_3.ax = 0.5
    L6_3 = L6_3(L7_3)
    L7_3 = L15_2
    L8_3 = L7_3
    L7_3 = L7_3.insert
    L9_3 = L6_3
    L7_3(L8_3, L9_3)
  end
  
  function L40_2()
    local L0_3, L1_3
    L0_3 = L39_2
    L0_3()
    L0_3 = L38_2
    L0_3()
  end
  
  function L41_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  L42_2 = L0_1
  L42_2 = L42_2.newButton
  L43_2 = {}
  L43_2.image = "images/gui/common/buttonClosePopupBrown.png"
  L43_2.onRelease = L41_2
  L43_2.width = 43
  L43_2.height = 38
  L44_2 = L17_2.x
  L44_2 = L44_2 + 173
  L43_2.x = L44_2
  L44_2 = L17_2.y
  L44_2 = L44_2 + 80
  L43_2.y = L44_2
  L42_2 = L42_2(L43_2)
  
  function L43_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L16_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L17_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L20_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L22_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L18_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L42_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L24_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L23_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L26_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L19_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    if L0_3 then
      L0_3 = L14_2
      L1_3 = L0_3
      L0_3 = L0_3.insert
      L2_3 = L8_2
      L0_3(L1_3, L2_3)
    end
    L0_3 = L9_2
    if L0_3 then
      L0_3 = L14_2
      L1_3 = L0_3
      L0_3 = L0_3.insert
      L2_3 = L9_2
      L0_3(L1_3, L2_3)
    end
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
    L2_3 = L25_2
    L0_3(L1_3, L2_3)
  end
  
  function L44_2(A0_3)
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
  
  function L45_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
    end
    L1_3 = true
    return L1_3
  end
  
  function L46_2()
    local L0_3, L1_3
    L0_3 = L27_2
    L0_3()
  end
  
  function L47_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L13_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L45_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L16_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L44_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L17_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L45_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "iapDone"
    L3_3 = L46_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L48_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L42_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L8_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L9_2
    L0_3(L1_3)
    L0_3 = L28_2
    L0_3()
    L0_3 = L13_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L45_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L16_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L44_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L17_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L45_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "iapDone"
    L3_3 = L46_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L48_2
  L48_2 = L40_2
  L48_2()
  L48_2 = L36_2
  L48_2()
  L48_2 = L43_2
  L48_2()
  L48_2 = L47_2
  L48_2()
  L48_2 = L0_1
  L48_2 = L48_2.commHttps
  L48_2 = L48_2.setCallback
  L49_2 = L33_2
  L48_2(L49_2)
  L48_2 = L5_2.setInAppPurchaseCallback
  L49_2 = L32_2
  L48_2(L49_2)
  L48_2 = L0_1
  L48_2 = L48_2.bouncer
  L48_2 = L48_2.down
  L49_2 = L14_2
  L48_2(L49_2)
  L48_2 = timer
  L48_2 = L48_2.performWithDelay
  L49_2 = 5000
  L50_2 = L46_2
  L48_2 = L48_2(L49_2, L50_2)
  L7_2 = L48_2
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
