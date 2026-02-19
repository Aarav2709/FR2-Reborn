local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = system
  L0_2 = L0_2.getTimer
  L0_2 = L0_2()
  L1_2 = display
  L1_2 = L1_2.newGroup
  L1_2 = L1_2()
  L2_2 = nil
  L3_2 = nil
  L4_2 = nil
  L5_2 = nil
  L6_2 = nil
  
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = system
      L1_3 = L1_3.getTimer
      L1_3 = L1_3()
      L2_3 = L0_2
      L2_3 = L2_3 + 200
      if not (L1_3 < L2_3) then
        goto lbl_12
      end
    end
    do return end
    ::lbl_12::
    L1_3 = L1_1
    L1_3 = L1_3.comm
    L1_3 = L1_3.isOnline
    L1_3 = L1_3()
    if L1_3 then
      L1_3 = L1_1
      L1_3 = L1_3.analytics
      L1_3 = L1_3.newEvent
      L2_3 = "design"
      L3_3 = {}
      L3_3.event_id = "marketButton:promotion"
      L4_3 = L1_1
      L4_3 = L4_3.database
      L4_3 = L4_3.getMoney
      L4_3 = L4_3()
      L3_3.value = L4_3
      L3_3.area = "mainMenu"
      L1_3(L2_3, L3_3)
      L1_3 = {}
      L2_3 = {}
      L3_3 = L3_2
      L2_3.highlightItemId = L3_3
      L1_3.params = L2_3
      L2_3 = L1_1
      L2_3 = L2_3.gotoScene
      L3_3 = "lua.scenes.marketplace"
      L4_3 = L1_3
      L2_3(L3_3, L4_3)
    else
      L1_3 = L1_1
      L1_3 = L1_3.createCustomOverlay
      L2_3 = 1
      L1_3(L2_3)
    end
  end
  
  function L8_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    if A0_3 then
      L1_3 = math
      L1_3 = L1_3.floor
      L2_3 = A0_3 / 60
      L1_3 = L1_3(L2_3)
      L2_3 = math
      L2_3 = L2_3.floor
      L3_3 = L1_3 / 60
      L2_3 = L2_3(L3_3)
      L3_3 = math
      L3_3 = L3_3.floor
      L4_3 = L2_3 / 24
      L3_3 = L3_3(L4_3)
      L4_3 = L2_3 * 60
      L1_3 = L1_3 - L4_3
      L4_3 = L3_3 * 24
      L2_3 = L2_3 - L4_3
      L4_3 = L3_3
      L5_3 = "d "
      L6_3 = L2_3
      L7_3 = "h "
      L8_3 = L1_3
      L9_3 = "m"
      L4_3 = L4_3 .. L5_3 .. L6_3 .. L7_3 .. L8_3 .. L9_3
      return L4_3
    end
    L1_3 = ""
    return L1_3
  end
  
  function L9_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L1_3 = L1_1
    L1_3 = L1_3.storeConfig
    L1_3 = L1_3.getSaleItems
    L1_3 = L1_3()
    L2_3 = L1_1
    L2_3 = L2_3.tableUtils
    L2_3 = L2_3.deepCopy
    L3_3 = L1_3
    L2_3 = L2_3(L3_3)
    L3_3 = #L2_3
    L4_3 = 1
    L5_3 = -1
    for L6_3 = L3_3, L4_3, L5_3 do
      L7_3 = L2_3[L6_3]
      L7_3 = L7_3.bundle
      if L7_3 then
        L7_3 = table
        L7_3 = L7_3.remove
        L8_3 = L2_3
        L9_3 = L6_3
        L7_3(L8_3, L9_3)
      end
    end
    L3_3 = #L2_3
    if L3_3 < 1 then
      L3_3 = nil
      return L3_3
    end
    L3_3 = math
    L3_3 = L3_3.random
    L4_3 = 1
    L5_3 = #L2_3
    L3_3 = L3_3(L4_3, L5_3)
    L0_3 = L2_3[L3_3]
    return L0_3
  end
  
  function L10_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L1_3 = L2_2
    if L1_3 then
      L1_3 = L2_2
      L2_3 = L1_3
      L1_3 = L1_3.removeSelf
      L1_3(L2_3)
      L1_3 = nil
      L2_2 = L1_3
    end
    L1_3 = L4_2
    if L1_3 then
      L1_3 = L4_2
      L2_3 = L1_3
      L1_3 = L1_3.removeSelf
      L1_3(L2_3)
      L1_3 = nil
      L4_2 = L1_3
    end
    L1_3 = L5_2
    if L1_3 then
      L1_3 = L5_2
      L2_3 = L1_3
      L1_3 = L1_3.removeSelf
      L1_3(L2_3)
      L1_3 = nil
      L5_2 = L1_3
    end
    L1_3 = L6_2
    if L1_3 then
      L1_3 = L6_2
      L2_3 = L1_3
      L1_3 = L1_3.removeSelf
      L1_3(L2_3)
      L1_3 = nil
      L6_2 = L1_3
    end
    L1_3 = A0_3 or L1_3
    if not A0_3 then
      L1_3 = L9_2
      L1_3 = L1_3()
    end
    L2_3 = 0
    if L1_3 then
      L3_3 = L1_3.key
      L3_2 = L3_3
      L3_3 = display
      L3_3 = L3_3.newImage
      L4_3 = L1_3.imagePath
      L3_3 = L3_3(L4_3)
      L4_3 = display
      L4_3 = L4_3.newImageRect
      L5_3 = L1_3.imagePath
      L6_3 = L3_3.contentWidth
      L6_3 = L6_3 / 2
      L7_3 = L3_3.contentHeight
      L7_3 = L7_3 / 2
      L4_3 = L4_3(L5_3, L6_3, L7_3)
      L2_2 = L4_3
      L4_3 = display
      L4_3 = L4_3.remove
      L5_3 = L3_3
      L4_3(L5_3)
      L4_3 = L2_2
      L5_3 = L4_3
      L4_3 = L4_3.scale
      L6_3 = 0.45
      L7_3 = 0.45
      L4_3(L5_3, L6_3, L7_3)
      L4_3 = L1_1
      L4_3 = L4_3.storeConfig
      L4_3 = L4_3.getItemCategory
      L5_3 = L1_3.key
      L4_3 = L4_3(L5_3)
      if L4_3 == "facewear" then
        L2_3 = -4
      elseif L4_3 == "avatars" or L4_3 == "skins" then
        L2_3 = 2
      elseif L4_3 == "neck" then
        L2_3 = 4
      end
    else
      L3_3 = display
      L3_3 = L3_3.newImageRect
      L4_3 = "images/gui/mainMenu/3.png"
      L5_3 = 50
      L6_3 = 32
      L3_3 = L3_3(L4_3, L5_3, L6_3)
      L2_2 = L3_3
      L2_3 = 4
    end
    L3_3 = display
    L3_3 = L3_3.newImageRect
    L4_3 = "images/gui/mainMenu/specialCorner.png"
    L5_3 = 81
    L6_3 = 47
    L3_3 = L3_3(L4_3, L5_3, L6_3)
    L4_2 = L3_3
    L3_3 = L4_2
    L3_3.anchorX = 1
    L3_3 = L4_2
    L3_3.anchorY = 1
    L3_3 = L4_2
    L3_3.x = 470
    L3_3 = L4_2
    L4_3 = display
    L4_3 = L4_3.contentHeight
    L4_3 = L4_3 - 48
    L3_3.y = L4_3
    L3_3 = L2_2
    L3_3.anchorX = 0.5
    L3_3 = L2_2
    L3_3.anchorY = 0.5
    L3_3 = L2_2
    L4_3 = L4_2
    L4_3 = L4_3.x
    L4_3 = L4_3 - 22
    L3_3.x = L4_3
    L3_3 = L2_2
    L4_3 = L4_2
    L4_3 = L4_3.y
    L4_3 = L4_3 - 30
    L4_3 = L4_3 + L2_3
    L3_3.y = L4_3
    L3_3 = L1_1
    L3_3 = L3_3.newText
    L4_3 = {}
    L5_3 = L1_1
    L5_3 = L5_3.localized
    L5_3 = L5_3.get
    L6_3 = "sale"
    L5_3 = L5_3(L6_3)
    L4_3.string = L5_3
    L4_3.size = 11
    L5_3 = L4_2
    L5_3 = L5_3.x
    L5_3 = L5_3 - 54
    L4_3.x = L5_3
    L5_3 = L4_2
    L5_3 = L5_3.y
    L5_3 = L5_3 - 32
    L4_3.y = L5_3
    L4_3.ax = 0.5
    L3_3 = L3_3(L4_3)
    L5_2 = L3_3
    L3_3 = L1_1
    L3_3 = L3_3.newText
    L4_3 = {}
    L4_3.string = ""
    L4_3.size = 10
    L5_3 = L4_2
    L5_3 = L5_3.x
    L5_3 = L5_3 - 54
    L4_3.x = L5_3
    L5_3 = L4_2
    L5_3 = L5_3.y
    L5_3 = L5_3 - 22
    L4_3.y = L5_3
    L4_3.ax = 0.5
    L5_3 = {}
    L6_3 = 0.47058823529411764
    L7_3 = 0.47058823529411764
    L8_3 = 0.47058823529411764
    L5_3[1] = L6_3
    L5_3[2] = L7_3
    L5_3[3] = L8_3
    L4_3.color = L5_3
    L3_3 = L3_3(L4_3)
    L6_2 = L3_3
    L3_3 = L6_2
    L4_3 = L8_2
    L5_3 = L1_1
    L5_3 = L5_3.database
    L5_3 = L5_3.promoSale
    L5_3 = L5_3.b
    L4_3 = L4_3(L5_3)
    L3_3.text = L4_3
    L3_3 = L1_2
    L4_3 = L3_3
    L3_3 = L3_3.insert
    L5_3 = L4_2
    L3_3(L4_3, L5_3)
    L3_3 = L1_2
    L4_3 = L3_3
    L3_3 = L3_3.insert
    L5_3 = L2_2
    L3_3(L4_3, L5_3)
    L3_3 = L1_2
    L4_3 = L3_3
    L3_3 = L3_3.insert
    L5_3 = L5_2
    L3_3(L4_3, L5_3)
    L3_3 = L1_2
    L4_3 = L3_3
    L3_3 = L3_3.insert
    L5_3 = L6_2
    L3_3(L4_3, L5_3)
  end
  
  L1_2.setPromotionImage = L10_2
  L12_2 = L1_2
  L11_2 = L1_2.addEventListener
  L13_2 = "touch"
  L14_2 = L7_2
  L11_2(L12_2, L13_2, L14_2)
  
  function L11_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L7_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L1_2
    if L0_3 then
      L0_3 = L1_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L1_2 = L0_3
    end
  end
  
  L1_2.clean = L11_2
  return L1_2
end

L0_1.create = L2_1
return L0_1
