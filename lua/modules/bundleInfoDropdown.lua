local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = display
  L0_2 = L0_2.newGroup
  L0_2 = L0_2()
  L1_2 = require
  L2_2 = "lua.iap.inAppPurchase"
  L1_2 = L1_2(L2_2)
  L2_2 = nil
  L3_2 = 0
  
  function L4_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3
    L2_3 = L2_2
    if L2_3 then
      L2_3 = L2_2
      L3_3 = L2_3
      L2_3 = L2_3.removeSelf
      L2_3(L3_3)
      L2_3 = nil
      L2_2 = L2_3
    end
    L2_3 = A0_3.items
    L3_3 = display
    L3_3 = L3_3.newGroup
    L3_3 = L3_3()
    L2_2 = L3_3
    L3_3 = nil
    L4_3 = 1
    L5_3 = #L2_3
    L6_3 = 1
    for L7_3 = L4_3, L5_3, L6_3 do
      L8_3 = L2_3[L7_3]
      L9_3 = L1_1
      L9_3 = L9_3.storeConfig
      L9_3 = L9_3.getItemCategory
      L10_3 = L2_3[L7_3]
      L10_3 = L10_3.key
      L9_3 = L9_3(L10_3)
      L10_3 = "images/gui/market/items/"
      L11_3 = L9_3
      L12_3 = "/"
      L13_3 = L2_3[L7_3]
      L13_3 = L13_3.key
      L14_3 = ".png"
      L10_3 = L10_3 .. L11_3 .. L12_3 .. L13_3 .. L14_3
      L8_3.imagePath = L10_3
      
      function L10_3()
        local L0_4, L1_4
        L0_4 = L1_1
        L0_4 = L0_4.createCustomOverlay
        L1_4 = 28
        L0_4(L1_4)
      end
      
      L11_3 = L7_3 - 1
      L3_3 = L11_3 * 56
      L11_3 = display
      L11_3 = L11_3.newImageRect
      L12_3 = "images/gui/market/bundleItem.png"
      L13_3 = 75
      L14_3 = 58
      L11_3 = L11_3(L12_3, L13_3, L14_3)
      L11_3.anchorY = 0
      L11_3.x = 0
      L11_3.y = L3_3
      L12_3 = display
      L12_3 = L12_3.newImageRect
      L13_3 = L8_3.imagePath
      L14_3 = 52
      L15_3 = 58
      L12_3 = L12_3(L13_3, L14_3, L15_3)
      L12_3.anchorY = 0
      L14_3 = L12_3
      L13_3 = L12_3.scale
      L15_3 = 0.6
      L16_3 = 0.6
      L13_3(L14_3, L15_3, L16_3)
      L12_3.x = -18
      L13_3 = L3_3 + 15
      L12_3.y = L13_3
      L13_3 = L1_1
      L13_3 = L13_3.fitTextFontSize
      L14_3 = L8_3.title
      L15_3 = 6
      L16_3 = 10
      L17_3 = 64
      L18_3 = 8
      L13_3 = L13_3(L14_3, L15_3, L16_3, L17_3, L18_3)
      L14_3 = L1_1
      L14_3 = L14_3.newText
      L15_3 = {}
      L16_3 = L8_3.title
      L15_3.string = L16_3
      L15_3.size = L13_3
      L16_3 = L12_3.y
      L16_3 = L16_3 + 2
      L15_3.y = L16_3
      L15_3.x = 12
      L15_3.ax = 0.5
      L15_3.ay = 0
      L16_3 = L1_1
      L16_3 = L16_3.colors
      L16_3 = L16_3.grey
      L15_3.color = L16_3
      L15_3.align = "center"
      L15_3.width = 38
      L14_3 = L14_3(L15_3)
      if L9_3 == "facewear" then
        L15_3 = L12_3.y
        L15_3 = L15_3 - 10
        L12_3.y = L15_3
      elseif L9_3 == "hat" then
        L15_3 = L12_3.y
        L15_3 = L15_3 - 5
        L12_3.y = L15_3
      end
      L15_3 = L2_2
      L16_3 = L15_3
      L15_3 = L15_3.insert
      L17_3 = 1
      L18_3 = L11_3
      L15_3(L16_3, L17_3, L18_3)
      L15_3 = L2_2
      L16_3 = L15_3
      L15_3 = L15_3.insert
      L17_3 = L12_3
      L15_3(L16_3, L17_3)
      L15_3 = L2_2
      L16_3 = L15_3
      L15_3 = L15_3.insert
      L17_3 = L14_3
      L15_3(L16_3, L17_3)
      L15_3 = L8_3.owned
      if not L15_3 then
        L15_3 = L1_1
        L15_3 = L15_3.storeConfig
        L15_3 = L15_3.ownsItem
        L16_3 = L8_3.key
        L15_3 = L15_3(L16_3)
        if not L15_3 then
          goto lbl_141
        end
      end
      L15_3 = display
      L15_3 = L15_3.newImageRect
      L16_3 = "images/gui/market/preOwned.png"
      L17_3 = 28
      L18_3 = 22
      L15_3 = L15_3(L16_3, L17_3, L18_3)
      L15_3.x = 16
      L16_3 = L3_3 + 40
      L15_3.y = L16_3
      L15_3.tap = L10_3
      L17_3 = L15_3
      L16_3 = L15_3.addEventListener
      L18_3 = "tap"
      L19_3 = L15_3
      L16_3(L17_3, L18_3, L19_3)
      L16_3 = L2_2
      L17_3 = L16_3
      L16_3 = L16_3.insert
      L18_3 = L15_3
      L16_3(L17_3, L18_3)
      goto lbl_177
      ::lbl_141::
      L15_3 = display
      L15_3 = L15_3.newImageRect
      L16_3 = "images/gui/common/gem_small.png"
      L17_3 = 15
      L18_3 = 15
      L15_3 = L15_3(L16_3, L17_3, L18_3)
      L15_3.x = 25
      L16_3 = L3_3 + 40
      L15_3.y = L16_3
      L16_3 = L2_2
      L17_3 = L16_3
      L16_3 = L16_3.insert
      L18_3 = L15_3
      L16_3(L17_3, L18_3)
      L16_3 = L1_1
      L16_3 = L16_3.newText
      L17_3 = {}
      L18_3 = L8_3.gemPrice
      L17_3.string = L18_3
      L17_3.size = 10
      L18_3 = L15_3.y
      L17_3.y = L18_3
      L18_3 = L15_3.x
      L18_3 = L18_3 - 8
      L17_3.x = L18_3
      L17_3.ax = 1
      L17_3.ay = 0.5
      L18_3 = L1_1
      L18_3 = L18_3.colors
      L18_3 = L18_3.grey
      L17_3.color = L18_3
      L17_3.align = "center"
      L16_3 = L16_3(L17_3)
      L17_3 = L2_2
      L18_3 = L17_3
      L17_3 = L17_3.insert
      L19_3 = L16_3
      L17_3(L18_3, L19_3)
      ::lbl_177::
    end
    L4_3 = L3_3 + 56
    L5_3 = display
    L5_3 = L5_3.newImageRect
    L6_3 = "images/gui/market/bundlePrice.png"
    L7_3 = 63
    L8_3 = 37
    L5_3 = L5_3(L6_3, L7_3, L8_3)
    L5_3.anchorY = 0
    L5_3.x = 0
    L5_3.y = L4_3
    
    function L6_3()
      local L0_4, L1_4
      L0_4 = A1_3
      if L0_4 then
        L0_4 = A1_3
        L0_4()
      end
    end
    
    L5_3.tap = L6_3
    L7_3 = L5_3
    L6_3 = L5_3.addEventListener
    L8_3 = "tap"
    L9_3 = L5_3
    L6_3(L7_3, L8_3, L9_3)
    L6_3 = L2_2
    L7_3 = L6_3
    L6_3 = L6_3.insert
    L8_3 = 1
    L9_3 = L5_3
    L6_3(L7_3, L8_3, L9_3)
    L6_3 = 0
    L7_3 = nil
    L8_3 = nil
    L9_3 = ""
    
    function L10_3()
      local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4
      L0_4 = 0
      L1_4 = 1
      L2_4 = A0_3
      L2_4 = L2_4.items
      L2_4 = #L2_4
      L3_4 = 1
      for L4_4 = L1_4, L2_4, L3_4 do
        L5_4 = A0_3
        L5_4 = L5_4.items
        L5_4 = L5_4[L4_4]
        L6_4 = L1_1
        L6_4 = L6_4.storeConfig
        L6_4 = L6_4.getGemPrice
        L7_4 = L5_4.key
        L6_4 = L6_4(L7_4)
        if L6_4 then
          L7_4 = L5_4.owned
          if not L7_4 then
            L0_4 = L0_4 + L6_4
          end
        end
      end
      return L0_4
    end
    
    function L11_3()
      local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4
      L0_4 = 0
      L1_4 = 1
      L2_4 = A0_3
      L2_4 = L2_4.items
      L2_4 = #L2_4
      L3_4 = 1
      for L4_4 = L1_4, L2_4, L3_4 do
        L5_4 = L1_2
        L5_4 = L5_4.getPrice
        L6_4 = A0_3
        L6_4 = L6_4.items
        L6_4 = L6_4[L4_4]
        L6_4 = L6_4.tier
        L7_4 = A0_3
        L7_4 = L7_4.items
        L7_4 = L7_4[L4_4]
        L7_4 = L7_4.key
        L5_4 = L5_4(L6_4, L7_4)
        L0_4 = L0_4 + L5_4
      end
      return L0_4
    end
    
    L12_3 = A0_3.salePrice
    if L12_3 then
      L6_3 = A0_3.price
      L7_3 = A0_3.salePrice
      L8_3 = "images/gui/common/coin_small.png"
    else
      L12_3 = A0_3.saleGem
      if L12_3 then
        L6_3 = A0_3.playerValue
        L7_3 = A0_3.saleGem
        L8_3 = "images/gui/common/gem_small.png"
      else
        L12_3 = A0_3.saleTier
        if L12_3 then
          L12_3 = L11_3
          L12_3 = L12_3()
          L6_3 = L12_3
          L12_3 = L1_2
          L12_3 = L12_3.getPrice
          L13_3 = A0_3.saleTier
          L14_3 = A0_3.key
          L12_3 = L12_3(L13_3, L14_3)
          L7_3 = L12_3
          L12_3 = L1_2
          L12_3 = L12_3.getCurrency
          L13_3 = L1_2
          L13_3 = L13_3.getLocalizedPrice
          L14_3 = L2_3[1]
          L14_3 = L14_3.tier
          L15_3 = L2_3[1]
          L15_3 = L15_3.key
          L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L13_3(L14_3, L15_3)
          L12_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
          L9_3 = L12_3
        end
      end
    end
    L12_3 = {}
    L13_3 = 1
    L14_3 = 1
    L15_3 = 1
    L16_3 = 0.8
    L12_3[1] = L13_3
    L12_3[2] = L14_3
    L12_3[3] = L15_3
    L12_3[4] = L16_3
    L13_3 = L1_1
    L13_3 = L13_3.newText
    L14_3 = {}
    L15_3 = L9_3
    L16_3 = " "
    L17_3 = L6_3
    L15_3 = L15_3 .. L16_3 .. L17_3
    L14_3.string = L15_3
    L14_3.size = 10
    L14_3.color = L12_3
    L13_3 = L13_3(L14_3)
    L13_3.x = 0
    L14_3 = L4_3 + 14
    L13_3.y = L14_3
    L14_3 = L1_1
    L14_3 = L14_3.newText
    L15_3 = {}
    L16_3 = L9_3
    L17_3 = " "
    L18_3 = L7_3
    L16_3 = L16_3 .. L17_3 .. L18_3
    L15_3.string = L16_3
    L15_3.size = 18
    L16_3 = {}
    L17_3 = 1
    L18_3 = 1
    L19_3 = 1
    L16_3[1] = L17_3
    L16_3[2] = L18_3
    L16_3[3] = L19_3
    L15_3.color = L16_3
    L14_3 = L14_3(L15_3)
    L14_3.x = -5
    L15_3 = L4_3 + 26
    L14_3.y = L15_3
    if L8_3 then
      L15_3 = display
      L15_3 = L15_3.newImageRect
      L16_3 = L8_3
      L17_3 = 15
      L18_3 = 15
      L15_3 = L15_3(L16_3, L17_3, L18_3)
      L16_3 = L14_3.x
      L17_3 = L14_3.width
      L17_3 = L17_3 * 0.5
      L16_3 = L16_3 + L17_3
      L16_3 = L16_3 + 7
      L15_3.x = L16_3
      L16_3 = L14_3.y
      L15_3.y = L16_3
      L16_3 = L2_2
      L17_3 = L16_3
      L16_3 = L16_3.insert
      L18_3 = L15_3
      L16_3(L17_3, L18_3)
    end
    L15_3 = L2_2
    L16_3 = L15_3
    L15_3 = L15_3.insert
    L17_3 = L13_3
    L15_3(L16_3, L17_3)
    L15_3 = L2_2
    L16_3 = L15_3
    L15_3 = L15_3.insert
    L17_3 = L14_3
    L15_3(L16_3, L17_3)
    L15_3 = display
    L15_3 = L15_3.newLine
    L16_3 = L2_2
    L17_3 = L13_3.x
    L18_3 = L13_3.width
    L18_3 = L18_3 / 2
    L17_3 = L17_3 - L18_3
    L18_3 = L13_3.y
    L19_3 = L13_3.x
    L20_3 = L13_3.width
    L20_3 = L20_3 / 2
    L19_3 = L19_3 + L20_3
    L20_3 = L13_3.y
    L15_3 = L15_3(L16_3, L17_3, L18_3, L19_3, L20_3)
    L17_3 = L15_3
    L16_3 = L15_3.setStrokeColor
    L18_3 = unpack
    L19_3 = L12_3
    L18_3, L19_3, L20_3 = L18_3(L19_3)
    L16_3(L17_3, L18_3, L19_3, L20_3)
    L15_3.strokeWidth = 1
    L16_3 = #L2_3
    L16_3 = L16_3 + 1
    L16_3 = 58 * L16_3
    L16_3 = L16_3 + 10
    L3_2 = L16_3
    L16_3 = L2_2
    L17_3 = L3_2
    L17_3 = -L17_3
    L16_3.y = L17_3
    L16_3 = L0_2
    L17_3 = L16_3
    L16_3 = L16_3.insert
    L18_3 = L2_2
    L16_3(L17_3, L18_3)
    L16_3 = L0_2
    L16_3 = L16_3.dropIn
    L16_3()
  end
  
  L0_2.createBundleInfo = L4_2
  
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L2_2
    if L0_3 then
      L0_3 = transition
      L0_3 = L0_3.to
      L1_3 = L2_2
      L2_3 = {}
      L2_3.time = 500
      L2_3.y = 0
      L3_3 = easing
      L3_3 = L3_3.outBounce
      L2_3.transition = L3_3
      L0_3(L1_3, L2_3)
    end
  end
  
  L0_2.dropIn = L5_2
  
  function L5_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = L2_2
    if L1_3 then
      L1_3 = transition
      L1_3 = L1_3.to
      L2_3 = L2_2
      L3_3 = {}
      L3_3.time = 200
      L4_3 = L3_2
      L4_3 = -L4_3
      L3_3.y = L4_3
      L3_3.onComplete = A0_3
      L1_3(L2_3, L3_3)
    elseif A0_3 then
      L1_3 = A0_3
      L1_3()
    end
  end
  
  L0_2.pullUp = L5_2
  
  function L5_2()
    local L0_3, L1_3
    L0_3 = L2_2
    if L0_3 then
      L0_3 = transition
      L0_3 = L0_3.cancel
      L1_3 = L2_2
      L0_3(L1_3)
    end
  end
  
  L0_2.cancelTransitions = L5_2
  
  function L5_2(A0_3)
    local L1_3
    L1_3 = true
    return L1_3
  end
  
  L0_2.touch = L5_2
  
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L0_3 = L0_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L0_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L2_2
    if L0_3 then
      L0_3 = 1
      L1_3 = L2_2
      L1_3 = L1_3.numChildren
      L2_3 = 1
      for L3_3 = L0_3, L1_3, L2_3 do
        L4_3 = L2_2
        L4_3 = L4_3[L3_3]
        L6_3 = L4_3
        L5_3 = L4_3.removeEventListener
        L7_3 = "tap"
        L8_3 = L4_3
        L5_3(L6_3, L7_3, L8_3)
      end
      L0_3 = transition
      L0_3 = L0_3.cancel
      L1_3 = L2_2
      L0_3(L1_3)
    end
    L0_3 = L0_2
    if L0_3 then
      L0_3 = L0_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L0_2 = L0_3
    end
  end
  
  L0_2.clean = L5_2
  L7_2 = L0_2
  L6_2 = L0_2.addEventListener
  L8_2 = "touch"
  L9_2 = L0_2
  L6_2(L7_2, L8_2, L9_2)
  return L0_2
end

L0_1.new = L2_1
return L0_1
