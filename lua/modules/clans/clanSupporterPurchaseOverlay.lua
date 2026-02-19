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
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2
  L2_2 = A0_2.view
  L3_2 = require
  L4_2 = "lua.network.tcpMessageFormat"
  L3_2 = L3_2(L4_2)
  L4_2 = A1_2.params
  L4_2 = L4_2.clanSupporterLevelData
  L5_2 = L0_1
  L5_2 = L5_2.database
  L5_2 = L5_2.getGem
  L5_2 = L5_2()
  L6_2 = L4_2.gemPrice
  L7_2 = display
  L7_2 = L7_2.newGroup
  L7_2 = L7_2()
  L8_2 = false
  L9_2 = display
  L9_2 = L9_2.newRect
  L10_2 = 0
  L11_2 = 0
  L12_2 = display
  L12_2 = L12_2.contentWidth
  L13_2 = display
  L13_2 = L13_2.contentHeight
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
  L9_2.anchorX = 0
  L9_2.anchorY = 0
  L11_2 = L9_2
  L10_2 = L9_2.setFillColor
  L12_2 = 0
  L13_2 = 0
  L14_2 = 0
  L15_2 = 0.7843137254901961
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
  L9_2.x = 0
  L9_2.y = 0
  L9_2.isVisible = false
  L10_2 = display
  L10_2 = L10_2.newGroup
  L10_2 = L10_2()
  L11_2 = display
  L11_2 = L11_2.newImageRect
  L12_2 = "images/gui/common/black.png"
  L13_2 = 480
  L14_2 = 320
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L12_2 = display
  L12_2 = L12_2.contentWidth
  L12_2 = L12_2 * 0.5
  L11_2.x = L12_2
  L12_2 = display
  L12_2 = L12_2.contentHeight
  L12_2 = L12_2 * 0.5
  L11_2.y = L12_2
  L12_2 = display
  L12_2 = L12_2.newImageRect
  L13_2 = "images/gui/clan_v2/clan_support/window.png"
  L14_2 = 276
  L15_2 = 253
  L12_2 = L12_2(L13_2, L14_2, L15_2)
  L12_2.anchorY = 0
  L13_2 = display
  L13_2 = L13_2.contentWidth
  L13_2 = L13_2 * 0.5
  L12_2.x = L13_2
  L12_2.y = 0
  L13_2 = L0_1
  L13_2 = L13_2.newText
  L14_2 = {}
  L15_2 = L0_1
  L15_2 = L15_2.localized
  L15_2 = L15_2.get
  L16_2 = "Become a"
  L15_2 = L15_2(L16_2)
  L14_2.string = L15_2
  L15_2 = L12_2.x
  L14_2.x = L15_2
  L15_2 = L12_2.y
  L15_2 = L15_2 + 65
  L14_2.y = L15_2
  L14_2.size = 20
  L15_2 = {}
  L16_2 = 1
  L17_2 = 1
  L18_2 = 1
  L15_2[1] = L16_2
  L15_2[2] = L17_2
  L15_2[3] = L18_2
  L14_2.color = L15_2
  L13_2 = L13_2(L14_2)
  L14_2 = L0_1
  L14_2 = L14_2.newText
  L15_2 = {}
  L16_2 = L4_2.title
  L15_2.string = L16_2
  L16_2 = L12_2.x
  L15_2.x = L16_2
  L16_2 = L12_2.y
  L16_2 = L16_2 + 78
  L15_2.y = L16_2
  L15_2.size = 16
  L16_2 = {}
  L17_2 = 1
  L18_2 = 1
  L19_2 = 1
  L16_2[1] = L17_2
  L16_2[2] = L18_2
  L16_2[3] = L19_2
  L15_2.color = L16_2
  L14_2 = L14_2(L15_2)
  L15_2 = L0_1
  L15_2 = L15_2.newText
  L16_2 = {}
  L16_2.string = ""
  L17_2 = L12_2.x
  L16_2.x = L17_2
  L17_2 = L12_2.y
  L17_2 = L17_2 + 214
  L16_2.y = L17_2
  L16_2.size = 11
  L16_2.width = 200
  L16_2.align = "center"
  L17_2 = {}
  L18_2 = 0.3215686274509804
  L19_2 = 0.1803921568627451
  L20_2 = 0.1411764705882353
  L17_2[1] = L18_2
  L17_2[2] = L19_2
  L17_2[3] = L20_2
  L16_2.color = L17_2
  L15_2 = L15_2(L16_2)
  L16_2 = L0_1
  L16_2 = L16_2.newText
  L17_2 = {}
  L17_2.string = ""
  L18_2 = L12_2.x
  L17_2.x = L18_2
  L18_2 = L12_2.y
  L18_2 = L18_2 + 210
  L17_2.y = L18_2
  L17_2.size = 20
  L17_2.width = 300
  L18_2 = {}
  L19_2 = 1
  L20_2 = 1
  L21_2 = 1
  L18_2[1] = L19_2
  L18_2[2] = L20_2
  L18_2[3] = L21_2
  L17_2.color = L18_2
  L17_2.align = "center"
  L16_2 = L16_2(L17_2)
  L17_2 = display
  L17_2 = L17_2.newImageRect
  L18_2 = "images/gui/clan_v2/clan_support/clanpointPersonal.png"
  L19_2 = 16
  L20_2 = 14
  L17_2 = L17_2(L18_2, L19_2, L20_2)
  L19_2 = L17_2
  L18_2 = L17_2.scale
  L20_2 = 1.1
  L21_2 = 1.1
  L18_2(L19_2, L20_2, L21_2)
  L18_2 = L12_2.x
  L18_2 = L18_2 - 90
  L17_2.x = L18_2
  L18_2 = L12_2.y
  L18_2 = L18_2 + 110
  L17_2.y = L18_2
  L18_2 = display
  L18_2 = L18_2.newImageRect
  L19_2 = "images/gui/clan_v2/clan_support/clanpointCombined.png"
  L20_2 = 28
  L21_2 = 14
  L18_2 = L18_2(L19_2, L20_2, L21_2)
  L20_2 = L18_2
  L19_2 = L18_2.scale
  L21_2 = 1.1
  L22_2 = 1.1
  L19_2(L20_2, L21_2, L22_2)
  L19_2 = L12_2.x
  L19_2 = L19_2 - 88
  L18_2.x = L19_2
  L19_2 = L12_2.y
  L19_2 = L19_2 + 160
  L18_2.y = L19_2
  L19_2 = L0_1
  L19_2 = L19_2.newText
  L20_2 = {}
  L21_2 = L0_1
  L21_2 = L21_2.localized
  L21_2 = L21_2.get
  L22_2 = "You earn +"
  L21_2 = L21_2(L22_2)
  L22_2 = L4_2.personalBonus
  if not L22_2 then
    L22_2 = ""
  end
  L23_2 = L0_1
  L23_2 = L23_2.localized
  L23_2 = L23_2.get
  L24_2 = "% more clan points per game"
  L23_2 = L23_2(L24_2)
  L21_2 = L21_2 .. L22_2 .. L23_2
  L20_2.string = L21_2
  L21_2 = L17_2.x
  L21_2 = L21_2 + 14
  L20_2.x = L21_2
  L21_2 = L17_2.y
  L22_2 = L17_2.height
  L22_2 = L22_2 * 0.5
  L21_2 = L21_2 - L22_2
  L21_2 = L21_2 - 5
  L20_2.y = L21_2
  L20_2.ax = 0
  L20_2.ay = 0
  L20_2.size = 12
  L20_2.width = 170
  L19_2 = L19_2(L20_2)
  L20_2 = L0_1
  L20_2 = L20_2.newText
  L21_2 = {}
  L22_2 = L0_1
  L22_2 = L22_2.localized
  L22_2 = L22_2.get
  L23_2 = "Each clan member earns +"
  L22_2 = L22_2(L23_2)
  L23_2 = L4_2.clanMemberBonus
  if not L23_2 then
    L23_2 = ""
  end
  L24_2 = L0_1
  L24_2 = L24_2.localized
  L24_2 = L24_2.get
  L25_2 = "% more clan points per game"
  L24_2 = L24_2(L25_2)
  L22_2 = L22_2 .. L23_2 .. L24_2
  L21_2.string = L22_2
  L22_2 = L18_2.x
  L22_2 = L22_2 + 16
  L21_2.x = L22_2
  L22_2 = L18_2.y
  L23_2 = L18_2.height
  L23_2 = L23_2 * 0.5
  L22_2 = L22_2 - L23_2
  L22_2 = L22_2 - 5
  L21_2.y = L22_2
  L21_2.ax = 0
  L21_2.ay = 0
  L21_2.size = 12
  L21_2.width = 170
  L20_2 = L20_2(L21_2)
  L21_2 = L0_1
  L21_2 = L21_2.newText
  L22_2 = {}
  L23_2 = L0_1
  L23_2 = L23_2.localized
  L23_2 = L23_2.get
  L24_2 = "Lasts for "
  L23_2 = L23_2(L24_2)
  L24_2 = L4_2.duration
  if not L24_2 then
    L24_2 = 5
  end
  L25_2 = L0_1
  L25_2 = L25_2.localized
  L25_2 = L25_2.get
  L26_2 = " days"
  L25_2 = L25_2(L26_2)
  L23_2 = L23_2 .. L24_2 .. L25_2
  L22_2.string = L23_2
  L23_2 = L12_2.x
  L22_2.x = L23_2
  L23_2 = L20_2.y
  L23_2 = L23_2 + 50
  L22_2.y = L23_2
  L22_2.size = 9
  L22_2.width = 150
  L22_2.align = "center"
  L21_2 = L21_2(L22_2)
  L22_2 = L4_2.supporterLevel
  if L22_2 == 3 then
    L22_2 = L0_1
    L22_2 = L22_2.clanUtils
    L22_2 = L22_2.getPlayerSupporterStatusLevel
    L22_2 = L22_2()
    if L22_2 == 3 then
      L17_2.isVisible = false
      L18_2.isVisible = false
      L19_2.isVisible = false
      L20_2.isVisible = false
      L21_2.size = 11
      L22_2 = L20_2.y
      L21_2.y = L22_2
      L22_2 = L0_1
      L22_2 = L22_2.localized
      L22_2 = L22_2.get
      L23_2 = "This will refresh your "
      L22_2 = L22_2(L23_2)
      L23_2 = L4_2.title
      L24_2 = [[
 bonus

]]
      L25_2 = L0_1
      L25_2 = L25_2.localized
      L25_2 = L25_2.get
      L26_2 = "Time left will be set to "
      L25_2 = L25_2(L26_2)
      L26_2 = L4_2.duration
      if not L26_2 then
        L26_2 = 5
      end
      L27_2 = L0_1
      L27_2 = L27_2.localized
      L27_2 = L27_2.get
      L28_2 = " days"
      L27_2 = L27_2(L28_2)
      L22_2 = L22_2 .. L23_2 .. L24_2 .. L25_2 .. L26_2 .. L27_2
      L21_2.text = L22_2
      L22_2 = L0_1
      L22_2 = L22_2.localized
      L22_2 = L22_2.get
      L23_2 = "Continue as a "
      L22_2 = L22_2(L23_2)
      L13_2.text = L22_2
    end
  end
  L22_2 = require
  L23_2 = "lua.modules.currencyDisplay"
  L22_2 = L22_2(L23_2)
  L22_2 = L22_2.create
  L22_2 = L22_2()
  
  function L23_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_3.m
    L2_3 = L3_2
    L2_3 = L2_3.purchaseClanSupporter
    L2_3 = L2_3()
    if L1_3 == L2_3 then
      L1_3 = false
      L8_2 = L1_3
      L1_3 = A0_3.r
      if L1_3 then
        L1_3 = A0_3.r
        if L1_3 == 61 then
          L1_3 = L15_2
          L2_3 = L0_1
          L2_3 = L2_3.localized
          L2_3 = L2_3.get
          L3_3 = "Not enough coins"
          L2_3 = L2_3(L3_3)
          L1_3.text = L2_3
        else
          L1_3 = A0_3.r
          if L1_3 == 25 then
            L1_3 = L15_2
            L2_3 = L0_1
            L2_3 = L2_3.localized
            L2_3 = L2_3.get
            L3_3 = "You already own this"
            L2_3 = L2_3(L3_3)
            L1_3.text = L2_3
          else
            L1_3 = A0_3.r
            if L1_3 == 73 then
              L1_3 = L15_2
              L2_3 = L0_1
              L2_3 = L2_3.localized
              L2_3 = L2_3.get
              L3_3 = "Item not unlocked"
              L2_3 = L2_3(L3_3)
              L1_3.text = L2_3
            else
              L1_3 = L15_2
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
  
  function L24_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L6_2
    if not L0_3 then
      L0_3 = L15_2
      L1_3 = L0_1
      L1_3 = L1_3.localized
      L1_3 = L1_3.get
      L2_3 = "Nothing to buy. Try later"
      L1_3 = L1_3(L2_3)
      L0_3.text = L1_3
      return
    end
    L0_3 = L5_2
    L1_3 = L6_2
    if L0_3 < L1_3 then
      L0_3 = L0_1
      L0_3 = L0_3.audio
      L0_3 = L0_3.play
      L1_3 = "no_powerup"
      L0_3(L1_3)
      L0_3 = {}
      L0_3.isModal = true
      L1_3 = {}
      L2_3 = L4_2
      L1_3.oldItem = L2_3
      L2_3 = L6_2
      L1_3.price = L2_3
      L0_3.params = L1_3
      L1_3 = L0_1
      L1_3 = L1_3.showOverlay
      L2_3 = "lua.overlays.singleGemBuy"
      L3_3 = L0_3
      L1_3(L2_3, L3_3)
    else
      L0_3 = true
      L8_2 = L0_3
      L0_3 = L15_2
      L1_3 = L0_1
      L1_3 = L1_3.localized
      L1_3 = L1_3.get
      L2_3 = "Purchasing"
      L1_3 = L1_3(L2_3)
      L0_3.text = L1_3
      L0_3 = L0_1
      L0_3 = L0_3.comm
      L0_3 = L0_3.setCallback
      L1_3 = L23_2
      L0_3(L1_3)
      L0_3 = L0_1
      L0_3 = L0_3.analytics
      L0_3 = L0_3.ResourceData
      L1_3 = L4_2
      L1_3 = L1_3.title
      L0_3.itemId = L1_3
      L0_3 = L0_1
      L0_3 = L0_3.analytics
      L0_3 = L0_3.ResourceData
      L0_3.itemType = "clanSupporter"
      L0_3 = L0_1
      L0_3 = L0_3.comm
      L0_3 = L0_3.purchaseClanSupporter
      L1_3 = L4_2
      L1_3 = L1_3.itemId
      L0_3(L1_3)
    end
  end
  
  L25_2 = L0_1
  L25_2 = L25_2.newButton
  L26_2 = {}
  L26_2.image = "images/gui/market/popup/buttonGems.png"
  L26_2.onRelease = L24_2
  L27_2 = {}
  L27_2.string = L6_2
  L27_2.x = 0
  L27_2.y = 10
  L27_2.size = 14
  L26_2.text = L27_2
  L26_2.width = 77
  L26_2.height = 50
  L27_2 = L12_2.x
  L26_2.x = L27_2
  L27_2 = L12_2.y
  L27_2 = L27_2 + 250
  L26_2.y = L27_2
  L25_2 = L25_2(L26_2)
  
  function L26_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  L27_2 = L0_1
  L27_2 = L27_2.newButton
  L28_2 = {}
  L28_2.image = "images/gui/common/buttonClosePopupBrown.png"
  L28_2.onRelease = L26_2
  L28_2.width = 43
  L28_2.height = 38
  L29_2 = L12_2.x
  L29_2 = L29_2 + 120
  L28_2.x = L29_2
  L29_2 = L12_2.y
  L29_2 = L29_2 + 84
  L28_2.y = L29_2
  L27_2 = L27_2(L28_2)
  
  function L28_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L11_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L22_2
    L0_3(L1_3, L2_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L12_2
    L0_3(L1_3, L2_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L25_2
    L0_3(L1_3, L2_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L27_2
    L0_3(L1_3, L2_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L14_2
    L0_3(L1_3, L2_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L13_2
    L0_3(L1_3, L2_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L21_2
    L0_3(L1_3, L2_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L0_3(L1_3, L2_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L17_2
    L0_3(L1_3, L2_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L18_2
    L0_3(L1_3, L2_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L19_2
    L0_3(L1_3, L2_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L20_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L10_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L9_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L16_2
    L0_3(L1_3, L2_3)
  end
  
  function L29_2(A0_3)
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
  
  function L30_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
    end
    L1_3 = true
    return L1_3
  end
  
  function L31_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L30_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L29_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L12_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L30_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L32_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L25_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L27_2
    L0_3(L1_3)
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L30_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L29_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L12_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L30_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L32_2
  L32_2 = L28_2
  L32_2()
  L32_2 = L31_2
  L32_2()
  L32_2 = L0_1
  L32_2 = L32_2.bouncer
  L32_2 = L32_2.down
  L33_2 = L10_2
  L32_2(L33_2)
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
