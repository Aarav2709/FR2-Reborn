local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = nil

function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2
  L2_2 = A1_2.params
  if not L2_2 then
    L2_2 = {}
    A1_2.params = L2_2
  end
  L2_2 = A1_2.params
  L2_2 = L2_2.leagueState
  if not L2_2 then
    L2_2 = L0_1
    L2_2 = L2_2.showLeaguePrize
    L2_2 = L2_2.leagueState
  end
  L3_2 = A1_2.params
  L3_2 = L3_2.prizes
  if not L3_2 then
    L3_2 = L0_1
    L3_2 = L3_2.showLeaguePrize
    L3_2 = L3_2.prizes
  end
  L4_2 = A0_2.view
  L5_2 = display
  L5_2 = L5_2.newGroup
  L5_2 = L5_2()
  L6_2 = display
  L6_2 = L6_2.newGroup
  L6_2 = L6_2()
  L7_2 = display
  L7_2 = L7_2.newImageRect
  L8_2 = "images/gui/common/black.png"
  L9_2 = 480
  L10_2 = 320
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = display
  L8_2 = L8_2.contentWidth
  L8_2 = L8_2 * 0.5
  L7_2.x = L8_2
  L8_2 = display
  L8_2 = L8_2.contentHeight
  L8_2 = L8_2 * 0.5
  L7_2.y = L8_2
  L8_2 = display
  L8_2 = L8_2.newImageRect
  L9_2 = "images/gui/ranking/promotion/windowPrizes.png"
  L10_2 = 430
  L11_2 = 256
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L8_2.anchorY = 0
  L9_2 = display
  L9_2 = L9_2.contentWidth
  L9_2 = L9_2 * 0.5
  L8_2.x = L9_2
  L8_2.y = 0
  L9_2 = display
  L9_2 = L9_2.newImageRect
  L10_2 = "images/gui/ranking/league/tierB_"
  L11_2 = L2_2.l
  L12_2 = ".png"
  L10_2 = L10_2 .. L11_2 .. L12_2
  L11_2 = 83
  L12_2 = 81
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L10_2 = display
  L10_2 = L10_2.contentWidth
  L10_2 = L10_2 * 0.5
  L9_2.x = L10_2
  L10_2 = display
  L10_2 = L10_2.contentHeight
  L10_2 = L10_2 * 0.5
  L10_2 = L10_2 - 50
  L9_2.y = L10_2
  L9_2.xScale = 0.6
  L9_2.yScale = 0.6
  L10_2 = display
  L10_2 = L10_2.newGroup
  L10_2 = L10_2()
  L11_2 = display
  L11_2 = L11_2.newImageRect
  L12_2 = "images/gui/ranking/promotion/plate_"
  L13_2 = L2_2.l
  L14_2 = ".png"
  L12_2 = L12_2 .. L13_2 .. L14_2
  L13_2 = 182
  L14_2 = 70
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L12_2 = display
  L12_2 = L12_2.contentWidth
  L12_2 = L12_2 * 0.5
  L11_2.x = L12_2
  L12_2 = display
  L12_2 = L12_2.contentHeight
  L12_2 = L12_2 * 0.27
  L11_2.y = L12_2
  L11_2.yScale = -1
  
  function L12_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L0_3 = L0_3.p
    L0_3 = L0_3 % 10
    L1_3 = L2_2
    L1_3 = L1_3.p
    if 10 < L1_3 then
      L1_3 = L2_2
      L1_3 = L1_3.p
      if L1_3 < 20 then
        L1_3 = L2_2
        L1_3 = L1_3.p
        L2_3 = "th"
        L1_3 = L1_3 .. L2_3
        return L1_3
    end
    elseif L0_3 == 1 then
      L1_3 = L2_2
      L1_3 = L1_3.p
      L2_3 = "st"
      L1_3 = L1_3 .. L2_3
      return L1_3
    elseif L0_3 == 2 then
      L1_3 = L2_2
      L1_3 = L1_3.p
      L2_3 = "nd"
      L1_3 = L1_3 .. L2_3
      return L1_3
    elseif L0_3 == 3 then
      L1_3 = L2_2
      L1_3 = L1_3.p
      L2_3 = "rd"
      L1_3 = L1_3 .. L2_3
      return L1_3
    else
      L1_3 = L2_2
      L1_3 = L1_3.p
      L2_3 = "th"
      L1_3 = L1_3 .. L2_3
      return L1_3
    end
  end
  
  L13_2 = L0_1
  L13_2 = L13_2.localized
  L13_2 = L13_2.get
  L14_2 = "League Prize"
  L13_2 = L13_2(L14_2)
  L14_2 = L0_1
  L14_2 = L14_2.localized
  L14_2 = L14_2.get
  L15_2 = "Congratulations!"
  L14_2 = L14_2(L15_2)
  L15_2 = L0_1
  L15_2 = L15_2.localized
  L15_2 = L15_2.get
  L16_2 = "You placed "
  L15_2 = L15_2(L16_2)
  L16_2 = L12_2
  L16_2 = L16_2()
  L17_2 = L0_1
  L17_2 = L17_2.localized
  L17_2 = L17_2.get
  L18_2 = " in "
  L17_2 = L17_2(L18_2)
  L18_2 = L0_1
  L18_2 = L18_2.awards
  L18_2 = L18_2.getLeagueNameText
  L19_2 = L2_2.l
  L19_2 = L19_2 + 1
  L18_2 = L18_2(L19_2)
  L19_2 = L0_1
  L19_2 = L19_2.localized
  L19_2 = L19_2.get
  L20_2 = " last week! Here's your reward"
  L19_2 = L19_2(L20_2)
  L15_2 = L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2
  L16_2 = L0_1
  L16_2 = L16_2.newText
  L17_2 = {}
  L17_2.string = L13_2
  L17_2.size = 22
  L17_2.x = 240
  L18_2 = L11_2.y
  L18_2 = L18_2 - 10
  L17_2.y = L18_2
  L17_2.ax = 0.5
  L18_2 = {}
  L19_2 = 1
  L20_2 = 1
  L21_2 = 1
  L18_2[1] = L19_2
  L18_2[2] = L20_2
  L18_2[3] = L21_2
  L17_2.color = L18_2
  L16_2 = L16_2(L17_2)
  L17_2 = L0_1
  L17_2 = L17_2.newText
  L18_2 = {}
  L18_2.string = L14_2
  L18_2.size = 17
  L18_2.x = 240
  L19_2 = L11_2.y
  L19_2 = L19_2 + 56
  L18_2.y = L19_2
  L18_2.ax = 0.5
  L19_2 = {}
  L20_2 = 0
  L21_2 = 0
  L22_2 = 0
  L19_2[1] = L20_2
  L19_2[2] = L21_2
  L19_2[3] = L22_2
  L18_2.color = L19_2
  L17_2 = L17_2(L18_2)
  L18_2 = L0_1
  L18_2 = L18_2.newText
  L19_2 = {}
  L19_2.string = L15_2
  L19_2.size = 10
  L19_2.x = 240
  L20_2 = L11_2.y
  L20_2 = L20_2 + 70
  L19_2.y = L20_2
  L19_2.ax = 0.5
  L20_2 = {}
  L21_2 = 0
  L22_2 = 0
  L23_2 = 0
  L20_2[1] = L21_2
  L20_2[2] = L22_2
  L20_2[3] = L23_2
  L19_2.color = L20_2
  L18_2 = L18_2(L19_2)
  L19_2 = nil
  L20_2 = promotionType
  if L20_2 ~= 1 then
    L20_2 = require
    L21_2 = "lua.game.effects.fireworksHandler"
    L20_2 = L20_2(L21_2)
    L19_2 = L20_2
    L20_2 = L19_2.startFireWorks
    L21_2 = 0
    L22_2 = 320
    L23_2 = L4_2
    L24_2 = 0
    L25_2 = true
    L20_2(L21_2, L22_2, L23_2, L24_2, L25_2)
  end
  
  function L20_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  function L21_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
    L0_3 = {}
    L1_3 = {}
    L0_3.params = L1_3
    L1_3 = 1
    L2_3 = L3_2
    L2_3 = #L2_3
    L3_3 = 1
    for L4_3 = L1_3, L2_3, L3_3 do
      L5_3 = L3_2
      L5_3 = L5_3[L4_3]
      L5_3 = L5_3.type
      if L5_3 == "ITEM" then
        L5_3 = L0_3.params
        L6_3 = L3_2
        L6_3 = L6_3[L4_3]
        L6_3 = L6_3.itemId
        L5_3.highlightItemId = L6_3
        break
      end
    end
    L1_3 = L0_1
    L1_3 = L1_3.gotoScene
    L2_3 = "lua.scenes.marketplace"
    L3_3 = L0_3
    L1_3(L2_3, L3_3)
  end
  
  L22_2 = L0_1
  L22_2 = L22_2.newButton
  L23_2 = {}
  L24_2 = display
  L24_2 = L24_2.contentWidth
  L24_2 = L24_2 * 0.5
  L24_2 = L24_2 - 30
  L23_2.x = L24_2
  L24_2 = display
  L24_2 = L24_2.contentHeight
  L24_2 = L24_2 * 0.5
  L24_2 = L24_2 + 95
  L23_2.y = L24_2
  L23_2.width = 62
  L23_2.height = 37
  L24_2 = L0_1
  L24_2 = L24_2.localized
  L24_2 = L24_2.get
  L25_2 = "OK"
  L24_2 = L24_2(L25_2)
  L23_2.text = L24_2
  L23_2.image = "images/gui/ranking/promotion/buttonOk.png"
  L23_2.onRelease = L20_2
  L22_2 = L22_2(L23_2)
  L23_2 = L0_1
  L23_2 = L23_2.newButton
  L24_2 = {}
  L25_2 = display
  L25_2 = L25_2.contentWidth
  L25_2 = L25_2 * 0.5
  L25_2 = L25_2 + 30
  L24_2.x = L25_2
  L25_2 = display
  L25_2 = L25_2.contentHeight
  L25_2 = L25_2 * 0.5
  L25_2 = L25_2 + 95
  L24_2.y = L25_2
  L24_2.width = 48
  L24_2.height = 37
  L24_2.image = "images/gui/ranking/promotion/buttonShop.png"
  L24_2.onRelease = L21_2
  L23_2 = L23_2(L24_2)
  
  function L24_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    L0_3 = 0
    L1_3 = 1
    L2_3 = L3_2
    L2_3 = #L2_3
    L3_3 = 1
    for L4_3 = L1_3, L2_3, L3_3 do
      L5_3 = nil
      L6_3 = L3_2
      L6_3 = L6_3[L4_3]
      L6_3 = L6_3.type
      if L6_3 == "ITEM" then
        L6_3 = "images/gui/market/items/"
        L7_3 = L0_1
        L7_3 = L7_3.storeConfig
        L7_3 = L7_3.getItemCategory
        L8_3 = L3_2
        L8_3 = L8_3[L4_3]
        L8_3 = L8_3.itemId
        L7_3 = L7_3(L8_3)
        L8_3 = "/"
        L9_3 = L3_2
        L9_3 = L9_3[L4_3]
        L9_3 = L9_3.itemId
        L10_3 = ".png"
        L6_3 = L6_3 .. L7_3 .. L8_3 .. L9_3 .. L10_3
        L7_3 = display
        L7_3 = L7_3.newImageRect
        L8_3 = L6_3
        L9_3 = 65
        L10_3 = 72
        L7_3 = L7_3(L8_3, L9_3, L10_3)
        L7_3.x = L0_3
        L7_3.y = 5
        L7_3.xScale = 0.6
        L7_3.yScale = 0.6
        L8_3 = L6_2
        L9_3 = L8_3
        L8_3 = L8_3.insert
        L10_3 = L7_3
        L8_3(L9_3, L10_3)
      else
        L6_3 = L3_2
        L6_3 = L6_3[L4_3]
        L6_3 = L6_3.type
        if L6_3 == "HARD_CURRENCY" then
          L6_3 = L0_1
          L6_3 = L6_3.analytics
          L6_3 = L6_3.addResourceEvent
          L7_3 = "Source"
          L8_3 = "gem"
          L9_3 = L3_2
          L9_3 = L9_3[L4_3]
          L9_3 = L9_3.amount
          L10_3 = "rewards"
          L11_3 = "league"
          L6_3(L7_3, L8_3, L9_3, L10_3, L11_3)
          L5_3 = "images/gui/common/gem.png"
        else
          L6_3 = L3_2
          L6_3 = L6_3[L4_3]
          L6_3 = L6_3.type
          if L6_3 == "SOFT_CURRENCY" then
            L6_3 = L0_1
            L6_3 = L6_3.analytics
            L6_3 = L6_3.addResourceEvent
            L7_3 = "Source"
            L8_3 = "coin"
            L9_3 = L3_2
            L9_3 = L9_3[L4_3]
            L9_3 = L9_3.amount
            L10_3 = "rewards"
            L11_3 = "league"
            L6_3(L7_3, L8_3, L9_3, L10_3, L11_3)
            L5_3 = "images/gui/common/coin.png"
          end
        end
      end
      if L5_3 then
        L6_3 = display
        L6_3 = L6_3.newImageRect
        L7_3 = L5_3
        L8_3 = 60
        L9_3 = 60
        L6_3 = L6_3(L7_3, L8_3, L9_3)
        L6_3.x = L0_3
        L6_3.y = 0
        L6_3.xScale = 0.6
        L6_3.yScale = 0.6
        L7_3 = "+"
        L8_3 = L3_2
        L8_3 = L8_3[L4_3]
        L8_3 = L8_3.amount
        L7_3 = L7_3 .. L8_3
        L8_3 = L0_1
        L8_3 = L8_3.newText
        L9_3 = {}
        L9_3.string = L7_3
        L9_3.size = 14
        L9_3.x = L0_3
        L10_3 = L6_3.y
        L10_3 = L10_3 + 26
        L9_3.y = L10_3
        L9_3.ax = 0.5
        L10_3 = {}
        L11_3 = 0
        L12_3 = 0
        L13_3 = 0
        L10_3[1] = L11_3
        L10_3[2] = L12_3
        L10_3[3] = L13_3
        L9_3.color = L10_3
        L8_3 = L8_3(L9_3)
        L9_3 = L6_2
        L10_3 = L9_3
        L9_3 = L9_3.insert
        L11_3 = L6_3
        L9_3(L10_3, L11_3)
        L9_3 = L6_2
        L10_3 = L9_3
        L9_3 = L9_3.insert
        L11_3 = L8_3
        L9_3(L10_3, L11_3)
      end
      L0_3 = L0_3 + 50
    end
    L1_3 = L6_2
    L1_3.anchorChildren = true
    L1_3 = L6_2
    L1_3.anchorX = 0.5
    L1_3 = L6_2
    L1_3.anchorY = 0.5
    L1_3 = L6_2
    L1_3.x = 240
    L1_3 = L6_2
    L1_3.y = 196
  end
  
  function L25_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.showSocialPopup
    L1_3 = L1_1
    L0_3(L1_3)
  end
  
  L26_2 = L0_1
  L26_2 = L26_2.newButton
  L27_2 = {}
  L27_2.image = "images/gui/postgame/photo.png"
  L27_2.width = 30
  L27_2.height = 30
  L27_2.onRelease = L25_2
  L28_2 = display
  L28_2 = L28_2.contentWidth
  L28_2 = L28_2 * 0.5
  L28_2 = L28_2 - 150
  L27_2.x = L28_2
  L27_2.y = 80
  L26_2 = L26_2(L27_2)
  
  function L27_2()
    local L0_3, L1_3, L2_3
    L0_3 = L4_2
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
    L2_3 = L11_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L16_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L17_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L18_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L9_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L22_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L23_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L26_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L6_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L5_2
    L0_3(L1_3, L2_3)
  end
  
  function L28_2(A0_3)
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
  
  function L29_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
    end
    L1_3 = true
    return L1_3
  end
  
  function L30_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L28_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L29_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L31_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L26_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L22_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L23_2
    L0_3(L1_3)
    L0_3 = L19_2
    if L0_3 then
      L0_3 = L19_2
      L0_3 = L0_3.clean
      L0_3()
      L0_3 = nil
      L19_2 = L0_3
    end
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L28_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L29_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L31_2
  L31_2 = L27_2
  L31_2()
  L31_2 = L30_2
  L31_2()
  L31_2 = L24_2
  L31_2()
  L31_2 = L0_1
  L31_2 = L31_2.bouncer
  L31_2 = L31_2.down
  L32_2 = L5_2
  L31_2(L32_2)
end

L1_1.create = L6_1

function L6_1(A0_2, A1_2)
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
  L4_2 = L0_1
  L4_2.showLeaguePrize = false
  L4_2 = L0_1
  L4_2 = L4_2.comm
  L4_2 = L4_2.clearLeaguePrize
  L4_2()
  L4_2 = L3_2.isOverlay
  L5_2 = true
  L4_2(L5_2)
end

L1_1.show = L6_1

function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A0_2.view
  L3_2 = A1_2.phase
  if L3_2 == "will" then
    L4_2 = L3_1
    if L4_2 then
      L4_2 = L3_1
      L4_2()
      L4_2 = nil
      L3_1 = L4_2
    end
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

L1_1.hide = L6_1

function L6_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L5_1
  if L2_2 then
    L2_2 = L5_1
    L2_2()
    L2_2 = nil
    L5_1 = L2_2
  end
  L2_2 = A0_2.view
  L3_2 = L2_1
  if L3_2 then
    L3_2 = L2_1
    L3_2()
    L3_2 = nil
    L2_1 = L3_2
  end
end

L1_1.destroy = L6_1
L7_1 = L1_1
L6_1 = L1_1.addEventListener
L8_1 = "create"
L9_1 = L1_1
L6_1(L7_1, L8_1, L9_1)
L7_1 = L1_1
L6_1 = L1_1.addEventListener
L8_1 = "show"
L9_1 = L1_1
L6_1(L7_1, L8_1, L9_1)
L7_1 = L1_1
L6_1 = L1_1.addEventListener
L8_1 = "hide"
L9_1 = L1_1
L6_1(L7_1, L8_1, L9_1)
L7_1 = L1_1
L6_1 = L1_1.addEventListener
L8_1 = "destroy"
L9_1 = L1_1
L6_1(L7_1, L8_1, L9_1)
return L1_1
