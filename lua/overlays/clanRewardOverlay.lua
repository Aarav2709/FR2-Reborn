local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = false

function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2
  L2_2 = A1_2.params
  if not L2_2 then
    L2_2 = {}
    A1_2.params = L2_2
  end
  L2_2 = require
  L3_2 = "lua.modules.itemRevealHelper"
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.itemRevealHelper
  L2_2 = L2_2()
  L3_2 = L0_1
  L3_2 = L3_2.data
  L3_2 = L3_2.clans
  L3_2 = L3_2.clanReward
  if not L3_2 then
    L3_2 = L0_1
    L3_2 = L3_2.data
    L3_2 = L3_2.clans
    L4_2 = {}
    L3_2.clanReward = L4_2
  end
  L3_2 = A1_2.params
  L3_2 = L3_2.itemReward
  if not L3_2 then
    L3_2 = L0_1
    L3_2 = L3_2.data
    L3_2 = L3_2.clans
    L3_2 = L3_2.clanReward
    L3_2 = L3_2.a
  end
  L4_2 = A1_2.params
  L4_2 = L4_2.coinReward
  if not L4_2 then
    L4_2 = L0_1
    L4_2 = L4_2.data
    L4_2 = L4_2.clans
    L4_2 = L4_2.clanReward
    L4_2 = L4_2.b
  end
  L5_2 = A0_2.view
  L6_2 = display
  L6_2 = L6_2.newGroup
  L6_2 = L6_2()
  L7_2 = display
  L7_2 = L7_2.newGroup
  L7_2 = L7_2()
  L7_2.anchorChildren = true
  L7_2.anchorX = 0.5
  L7_2.anchorY = 0.5
  L7_2.x = 240
  L7_2.y = 188
  L8_2 = display
  L8_2 = L8_2.newImageRect
  L9_2 = "images/gui/common/black.png"
  L10_2 = 480
  L11_2 = 320
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L9_2 = display
  L9_2 = L9_2.contentWidth
  L9_2 = L9_2 * 0.5
  L8_2.x = L9_2
  L9_2 = display
  L9_2 = L9_2.contentHeight
  L9_2 = L9_2 * 0.5
  L8_2.y = L9_2
  L9_2 = display
  L9_2 = L9_2.newImageRect
  L10_2 = "images/gui/ranking/promotion/window.png"
  L11_2 = 430
  L12_2 = 256
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L9_2.anchorY = 0
  L10_2 = display
  L10_2 = L10_2.contentWidth
  L10_2 = L10_2 * 0.5
  L9_2.x = L10_2
  L9_2.y = 0
  L10_2 = display
  L10_2 = L10_2.newImageRect
  L11_2 = "images/gui/clan_v2/clan_reward/whiteLine2.png"
  L12_2 = 270
  L13_2 = 99
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L10_2.anchorY = 0
  L11_2 = display
  L11_2 = L11_2.contentWidth
  L11_2 = L11_2 * 0.5
  L10_2.x = L11_2
  L10_2.y = 115
  L11_2 = display
  L11_2 = L11_2.newImageRect
  L12_2 = "images/gui/common/headerSingle.png"
  L13_2 = 153
  L14_2 = 33
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L12_2 = display
  L12_2 = L12_2.contentWidth
  L12_2 = L12_2 * 0.5
  L11_2.x = L12_2
  L12_2 = display
  L12_2 = L12_2.contentHeight
  L12_2 = L12_2 * 0.24
  L11_2.y = L12_2
  L12_2 = L0_1
  L12_2 = L12_2.localized
  L12_2 = L12_2.get
  L13_2 = "UnlockClanReward"
  L12_2 = L12_2(L13_2)
  L13_2 = L0_1
  L13_2 = L13_2.localized
  L13_2 = L13_2.get
  L14_2 = "Congratulations!"
  L13_2 = L13_2(L14_2)
  L14_2 = L0_1
  L14_2 = L14_2.localized
  L14_2 = L14_2.get
  L15_2 = "TheItemBelowHasBeenUnlocked"
  L14_2 = L14_2(L15_2)
  L15_2 = L0_1
  L15_2 = L15_2.newText
  L16_2 = {}
  L16_2.string = L12_2
  L16_2.size = 22
  L16_2.x = 240
  L17_2 = L11_2.y
  L16_2.y = L17_2
  L16_2.ax = 0.5
  L17_2 = {}
  L18_2 = 1
  L19_2 = 1
  L20_2 = 1
  L17_2[1] = L18_2
  L17_2[2] = L19_2
  L17_2[3] = L20_2
  L16_2.color = L17_2
  L15_2 = L15_2(L16_2)
  L16_2 = L0_1
  L16_2 = L16_2.newText
  L17_2 = {}
  L17_2.string = L13_2
  L17_2.size = 16
  L17_2.x = 240
  L18_2 = L10_2.y
  L18_2 = L18_2 + 8
  L17_2.y = L18_2
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
  L17_2 = L0_1
  L17_2 = L17_2.newText
  L18_2 = {}
  L18_2.string = L14_2
  L18_2.size = 9
  L18_2.x = 240
  L19_2 = L10_2.y
  L19_2 = L19_2 + 20
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
  L18_2 = require
  L19_2 = "lua.game.effects.fireworksHandler"
  L18_2 = L18_2(L19_2)
  L19_2 = L18_2.startFireWorks
  L20_2 = 0
  L21_2 = 320
  L22_2 = L5_2
  L23_2 = 0
  L24_2 = true
  L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
  L19_2 = display
  L19_2 = L19_2.newGroup
  L19_2 = L19_2()
  L19_2.anchorChildren = true
  L19_2.anchorX = 0.5
  L19_2.anchorY = 1
  L19_2.x = 240
  L19_2.y = 210
  L20_2 = nil
  L21_2 = nil
  L22_2 = nil
  L23_2 = nil
  L24_2 = nil
  if L4_2 and 0 < L4_2 then
    L25_2 = display
    L25_2 = L25_2.newImageRect
    L26_2 = "images/gui/common/coin.png"
    L27_2 = 36
    L28_2 = 36
    L25_2 = L25_2(L26_2, L27_2, L28_2)
    L20_2 = L25_2
    L20_2.x = 0
    L20_2.y = -10
    L20_2.isVisible = false
    L26_2 = L19_2
    L25_2 = L19_2.insert
    L27_2 = L20_2
    L25_2(L26_2, L27_2)
    L25_2 = L0_1
    L25_2 = L25_2.newText
    L26_2 = {}
    L27_2 = "+"
    L28_2 = L4_2
    L27_2 = L27_2 .. L28_2
    L26_2.string = L27_2
    L26_2.size = 10
    L26_2.x = 0
    L26_2.y = 20
    L26_2.ax = 0.5
    L27_2 = {}
    L28_2 = 0
    L29_2 = 0
    L30_2 = 0
    L27_2[1] = L28_2
    L27_2[2] = L29_2
    L27_2[3] = L30_2
    L26_2.color = L27_2
    L25_2 = L25_2(L26_2)
    L21_2 = L25_2
    L21_2.isVisible = false
    L26_2 = L19_2
    L25_2 = L19_2.insert
    L27_2 = L21_2
    L25_2(L26_2, L27_2)
  end
  if L3_2 ~= nil then
    L25_2 = L0_1
    L25_2 = L25_2.storeConfig
    L25_2 = L25_2.getItem
    L26_2 = L3_2
    L25_2 = L25_2(L26_2)
    L26_2 = 45
    L27_2 = L0_1
    L27_2 = L27_2.storeConfig
    L27_2 = L27_2.getItemCategory
    L28_2 = L3_2
    L27_2 = L27_2(L28_2)
    L28_2 = nil
    L29_2 = L0_1
    L29_2 = L29_2.localized
    L29_2 = L29_2.get
    L30_2 = "Update app to see item!"
    L29_2 = L29_2(L30_2)
    L30_2 = false
    L6_1 = L30_2
    L30_2 = L0_1
    L30_2 = L30_2.storeConfig
    L30_2 = L30_2.canDrawItem
    L31_2 = L3_2
    L30_2 = L30_2(L31_2)
    if L30_2 then
      L30_2 = true
      L6_1 = L30_2
      L29_2 = L25_2.title
      L30_2 = "images/gui/market/items/"
      L31_2 = L27_2
      L32_2 = "/"
      L33_2 = L3_2
      L34_2 = ".png"
      L28_2 = L30_2 .. L31_2 .. L32_2 .. L33_2 .. L34_2
    else
      L30_2 = L0_1
      L30_2 = L30_2.newText
      L31_2 = {}
      L31_2.string = "?"
      L31_2.size = 40
      L31_2.x = 0
      L31_2.y = -10
      L31_2.ax = 0.5
      L32_2 = {}
      L33_2 = 0
      L34_2 = 0
      L35_2 = 0
      L32_2[1] = L33_2
      L32_2[2] = L34_2
      L32_2[3] = L35_2
      L31_2.color = L32_2
      L30_2 = L30_2(L31_2)
      L32_2 = L19_2
      L31_2 = L19_2.insert
      L33_2 = L30_2
      L31_2(L32_2, L33_2)
      if L20_2 then
        L30_2.x = L26_2
      end
    end
    L30_2 = L0_1
    L30_2 = L30_2.newText
    L31_2 = {}
    L31_2.string = L29_2
    L31_2.size = 10
    L31_2.x = 0
    L31_2.y = 20
    L31_2.ax = 0.5
    L32_2 = {}
    L33_2 = 0
    L34_2 = 0
    L35_2 = 0
    L32_2[1] = L33_2
    L32_2[2] = L34_2
    L32_2[3] = L35_2
    L31_2.color = L32_2
    L30_2 = L30_2(L31_2)
    L24_2 = L30_2
    L24_2.isVisible = false
    L31_2 = L19_2
    L30_2 = L19_2.insert
    L32_2 = L24_2
    L30_2(L31_2, L32_2)
    if L20_2 then
      L30_2 = -L26_2
      L20_2.x = L30_2
      L30_2 = -L26_2
      L21_2.x = L30_2
      L24_2.x = L26_2
    end
    if L28_2 then
      L30_2 = display
      L30_2 = L30_2.newImageRect
      L31_2 = L28_2
      L32_2 = 60
      L33_2 = 60
      L30_2 = L30_2(L31_2, L32_2, L33_2)
      L22_2 = L30_2
      L22_2.x = 0
      L22_2.y = -28
      L22_2.isVisible = false
      if L20_2 then
        L22_2.x = L26_2
      end
      L30_2 = display
      L30_2 = L30_2.newImageRect
      L31_2 = "images/gui/market/items/plate/clan"
      L32_2 = L25_2.clanTier
      L33_2 = ".png"
      L31_2 = L31_2 .. L32_2 .. L33_2
      L32_2 = 35
      L33_2 = 15
      L30_2 = L30_2(L31_2, L32_2, L33_2)
      L23_2 = L30_2
      L30_2 = L22_2.x
      L23_2.x = L30_2
      L30_2 = L22_2.y
      L30_2 = L30_2 + 34
      L23_2.y = L30_2
      L23_2.isVisible = false
      L31_2 = L19_2
      L30_2 = L19_2.insert
      L32_2 = L23_2
      L30_2(L31_2, L32_2)
      L31_2 = L19_2
      L30_2 = L19_2.insert
      L32_2 = L22_2
      L30_2(L31_2, L32_2)
    end
  end
  
  function L25_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  function L26_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
    L0_3 = {}
    L1_3 = {}
    L0_3.params = L1_3
    L1_3 = L0_3.params
    L2_3 = L3_2
    L1_3.highlightItemId = L2_3
    L1_3 = L0_1
    L1_3 = L1_3.gotoScene
    L2_3 = "lua.scenes.marketplace"
    L3_3 = L0_3
    L1_3(L2_3, L3_3)
  end
  
  L27_2 = L0_1
  L27_2 = L27_2.newButton
  L28_2 = {}
  L29_2 = display
  L29_2 = L29_2.contentWidth
  L29_2 = L29_2 * 0.5
  L29_2 = L29_2 - 30
  L28_2.x = L29_2
  L29_2 = display
  L29_2 = L29_2.contentHeight
  L29_2 = L29_2 * 0.5
  L29_2 = L29_2 + 95
  L28_2.y = L29_2
  L28_2.width = 62
  L28_2.height = 37
  L29_2 = L0_1
  L29_2 = L29_2.localized
  L29_2 = L29_2.get
  L30_2 = "OK"
  L29_2 = L29_2(L30_2)
  L28_2.text = L29_2
  L28_2.image = "images/gui/ranking/promotion/buttonOk.png"
  L28_2.onRelease = L25_2
  L27_2 = L27_2(L28_2)
  L27_2.isVisible = false
  L28_2 = L0_1
  L28_2 = L28_2.newButton
  L29_2 = {}
  L30_2 = display
  L30_2 = L30_2.contentWidth
  L30_2 = L30_2 * 0.5
  L30_2 = L30_2 + 30
  L29_2.x = L30_2
  L30_2 = display
  L30_2 = L30_2.contentHeight
  L30_2 = L30_2 * 0.5
  L30_2 = L30_2 + 95
  L29_2.y = L30_2
  L29_2.width = 48
  L29_2.height = 37
  L29_2.image = "images/gui/ranking/promotion/buttonShop.png"
  L29_2.onRelease = L26_2
  L28_2 = L28_2(L29_2)
  L28_2.isVisible = false
  
  function L29_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L0_3 = L0_3.bounce
    L1_3 = L20_2
    L0_3(L1_3)
    L0_3 = L2_2
    L0_3 = L0_3.bounce
    L1_3 = L21_2
    L2_3 = 200
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L0_3 = L0_3.bounce
    L1_3 = L22_2
    L2_3 = 600
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L0_3 = L0_3.bounce
    L1_3 = L23_2
    L2_3 = 800
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L0_3 = L0_3.bounce
    L1_3 = L24_2
    L2_3 = 1000
    L0_3(L1_3, L2_3)
    L0_3 = L27_2
    L0_3.isVisible = true
    L0_3 = L28_2
    L0_3.isVisible = true
  end
  
  function L30_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.showSocialPopup
    L1_3 = L1_1
    L0_3(L1_3)
  end
  
  L31_2 = L0_1
  L31_2 = L31_2.newButton
  L32_2 = {}
  L32_2.image = "images/gui/postgame/photo.png"
  L32_2.width = 30
  L32_2.height = 30
  L32_2.onRelease = L30_2
  L33_2 = display
  L33_2 = L33_2.contentWidth
  L33_2 = L33_2 * 0.5
  L33_2 = L33_2 - 150
  L32_2.x = L33_2
  L32_2.y = 80
  L31_2 = L31_2(L32_2)
  
  function L32_2()
    local L0_3, L1_3, L2_3
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L9_2
    L0_3(L1_3, L2_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L10_2
    L0_3(L1_3, L2_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L11_2
    L0_3(L1_3, L2_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L16_2
    L0_3(L1_3, L2_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L17_2
    L0_3(L1_3, L2_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L27_2
    L0_3(L1_3, L2_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L28_2
    L0_3(L1_3, L2_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L31_2
    L0_3(L1_3, L2_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L19_2
    L0_3(L1_3, L2_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L6_2
    L0_3(L1_3, L2_3)
  end
  
  function L33_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = L27_2
      L1_3 = L1_3.isVisible
      if L1_3 then
        L1_3 = L0_1
        L1_3 = L1_3.hideOverlay
        L1_3()
      end
    end
    L1_3 = true
    return L1_3
  end
  
  function L34_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = L2_2
      L1_3 = L1_3.instant
      L2_3 = L20_2
      L1_3(L2_3)
      L1_3 = L2_2
      L1_3 = L1_3.instant
      L2_3 = L21_2
      L1_3(L2_3)
      L1_3 = L2_2
      L1_3 = L1_3.instant
      L2_3 = L22_2
      L1_3(L2_3)
      L1_3 = L2_2
      L1_3 = L1_3.instant
      L2_3 = L23_2
      L1_3(L2_3)
      L1_3 = L2_2
      L1_3 = L1_3.instant
      L2_3 = L24_2
      L1_3(L2_3)
    end
    L1_3 = true
    return L1_3
  end
  
  function L35_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L33_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L34_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L36_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L2_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L31_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L27_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L28_2
    L0_3(L1_3)
    L0_3 = false
    L6_1 = L0_3
    L0_3 = L18_2
    if L0_3 then
      L0_3 = L18_2
      L0_3 = L0_3.clean
      L0_3()
      L0_3 = nil
      L18_2 = L0_3
    end
    L0_3 = transition
    L0_3 = L0_3.cancel
    L1_3 = "clanRewardTransition"
    L0_3(L1_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L33_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L34_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L36_2
  L36_2 = L32_2
  L36_2()
  L36_2 = L35_2
  L36_2()
  
  function L36_2()
    local L0_3, L1_3
    L0_3 = L29_2
    L0_3()
  end
  
  L37_2 = L0_1
  L37_2 = L37_2.bouncer
  L37_2 = L37_2.down
  L38_2 = L6_2
  L39_2 = L36_2
  L37_2(L38_2, L39_2)
end

L1_1.create = L7_1

function L7_1(A0_2, A1_2)
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
  L4_2 = L6_1
  if L4_2 then
    L4_2 = L0_1
    L4_2 = L4_2.clanUtils
    L4_2 = L4_2.clearClanReward
    L4_2()
    L4_2 = L0_1
    L4_2 = L4_2.comm
    L4_2 = L4_2.clearClanReward
    L4_2()
  end
  L4_2 = L3_2.isOverlay
  L5_2 = true
  L4_2(L5_2)
end

L1_1.show = L7_1

function L7_1(A0_2, A1_2)
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

L1_1.hide = L7_1

function L7_1(A0_2, A1_2)
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

L1_1.destroy = L7_1
L8_1 = L1_1
L7_1 = L1_1.addEventListener
L9_1 = "create"
L10_1 = L1_1
L7_1(L8_1, L9_1, L10_1)
L8_1 = L1_1
L7_1 = L1_1.addEventListener
L9_1 = "show"
L10_1 = L1_1
L7_1(L8_1, L9_1, L10_1)
L8_1 = L1_1
L7_1 = L1_1.addEventListener
L9_1 = "hide"
L10_1 = L1_1
L7_1(L8_1, L9_1, L10_1)
L8_1 = L1_1
L7_1 = L1_1.addEventListener
L9_1 = "destroy"
L10_1 = L1_1
L7_1(L8_1, L9_1, L10_1)
return L1_1
