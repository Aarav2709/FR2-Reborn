local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = require
L2_1 = "lua.network.tcpClient"
L1_1 = L1_1(L2_1)
L2_1 = L0_1.newScene
L2_1 = L2_1()
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = nil
L7_1 = nil
L8_1 = nil
L9_1 = nil
L10_1 = nil
L11_1 = nil
L12_1 = nil
L13_1 = nil
L14_1 = nil
L15_1 = {}
L16_1 = {}
L17_1 = 0
L18_1 = 0
L19_1 = 0
L20_1 = 0.3
L16_1[1] = L17_1
L16_1[2] = L18_1
L16_1[3] = L19_1
L16_1[4] = L20_1
L17_1 = {}
L18_1 = 1
L19_1 = 1
L20_1 = 1
L21_1 = 0.5
L17_1[1] = L18_1
L17_1[2] = L19_1
L17_1[3] = L20_1
L17_1[4] = L21_1
L18_1 = {}
L19_1 = 1
L20_1 = 1
L21_1 = 1
L22_1 = 1
L18_1[1] = L19_1
L18_1[2] = L20_1
L18_1[3] = L21_1
L18_1[4] = L22_1
L19_1 = {}
L20_1 = 0
L21_1 = 0
L22_1 = 0
L23_1 = 1
L19_1[1] = L20_1
L19_1[2] = L21_1
L19_1[3] = L22_1
L19_1[4] = L23_1

function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2
  L2_2 = A0_2.view
  L3_2 = true
  L4_2 = require
  L5_2 = "lua.modules.lobbyFriendListView"
  L4_2 = L4_2(L5_2)
  L5_2 = {}
  L6_2 = nil
  L7_2 = nil
  L8_2 = display
  L8_2 = L8_2.newGroup
  L8_2 = L8_2()
  L9_2 = {}
  L10_2 = 1
  L11_2 = 1
  L12_2 = 1
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L8_2.isVisible = false
  L10_2 = {}
  L5_1 = L10_2
  L10_2 = {}
  L6_1 = L10_2
  L10_2 = false
  L12_1 = L10_2
  L10_2 = {}
  L11_1 = L10_2
  L10_2 = A1_2.params
  if L10_2 then
    L10_2 = A1_2.params
    L10_2 = L10_2.autoSendInvite
    if L10_2 then
      L10_2 = A1_2.params
      L10_2 = L10_2.autoSendInvite
      L14_1 = L10_2
    end
  end
  L10_2 = L0_1
  L10_2 = L10_2.backgrounds
  L10_2 = L10_2.getBlurredBackground
  L10_2 = L10_2()
  L11_2 = display
  L11_2 = L11_2.newImageRect
  L12_2 = "images/gui/customplay/bg_list.png"
  L13_2 = 211
  L14_2 = 320
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L11_2.anchorX = 1
  L12_2 = display
  L12_2 = L12_2.contentWidth
  L11_2.x = L12_2
  L12_2 = display
  L12_2 = L12_2.contentHeight
  L12_2 = L12_2 * 0.5
  L11_2.y = L12_2
  L12_2 = display
  L12_2 = L12_2.newImageRect
  L13_2 = "images/gui/customplay/bg_upper.png"
  L14_2 = 222
  L15_2 = 33
  L12_2 = L12_2(L13_2, L14_2, L15_2)
  L12_2.anchorY = 0
  L13_2 = display
  L13_2 = L13_2.contentWidth
  L13_2 = L13_2 * 0.5
  L13_2 = L13_2 - 80
  L12_2.x = L13_2
  L12_2.y = 0
  L13_2 = display
  L13_2 = L13_2.newImageRect
  L14_2 = "images/gui/ranking/cell.png"
  L15_2 = 180
  L16_2 = 320
  L13_2 = L13_2(L14_2, L15_2, L16_2)
  L13_2.anchorX = 1
  L14_2 = display
  L14_2 = L14_2.contentWidth
  L13_2.x = L14_2
  L14_2 = display
  L14_2 = L14_2.contentHeight
  L14_2 = L14_2 * 0.5
  L13_2.y = L14_2
  L14_2 = display
  L14_2 = L14_2.newImageRect
  L15_2 = "images/gui/customplay/info_bubble_large.png"
  L16_2 = 228
  L17_2 = 125
  L14_2 = L14_2(L15_2, L16_2, L17_2)
  L15_2 = display
  L15_2 = L15_2.contentWidth
  L15_2 = L15_2 * 0.53
  L14_2.x = L15_2
  L15_2 = display
  L15_2 = L15_2.contentHeight
  L15_2 = L15_2 * 0.3
  L14_2.y = L15_2
  L15_2 = L0_1
  L15_2 = L15_2.newText
  L16_2 = {}
  L17_2 = L0_1
  L17_2 = L17_2.localized
  L17_2 = L17_2.get
  L18_2 = "info2v2play"
  L17_2 = L17_2(L18_2)
  L16_2.string = L17_2
  L16_2.size = 12
  L17_2 = L14_2.x
  L16_2.x = L17_2
  L17_2 = L14_2.y
  L17_2 = L17_2 - 40
  L16_2.y = L17_2
  L16_2.ax = 0.5
  L16_2.ay = 0
  L16_2.align = "center"
  L17_2 = {}
  L18_2 = 0
  L19_2 = 0
  L20_2 = 0
  L21_2 = 0.5
  L17_2[1] = L18_2
  L17_2[2] = L19_2
  L17_2[3] = L20_2
  L17_2[4] = L21_2
  L16_2.color = L17_2
  L16_2.width = 200
  L16_2.height = 200
  L15_2 = L15_2(L16_2)
  L16_2 = L0_1
  L16_2 = L16_2.newText
  L17_2 = {}
  L18_2 = L0_1
  L18_2 = L18_2.localized
  L18_2 = L18_2.get
  L19_2 = "InviteFriends"
  L18_2 = L18_2(L19_2)
  L17_2.string = L18_2
  L17_2.size = 24
  L17_2.x = 310
  L17_2.y = 16
  L17_2.ax = 0
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
  L19_2 = L0_1
  L19_2 = L19_2.localized
  L19_2 = L19_2.get
  L20_2 = "2 vs 2"
  L19_2 = L19_2(L20_2)
  L18_2.string = L19_2
  L18_2.size = 24
  L18_2.x = 150
  L18_2.y = 12
  L19_2 = {}
  L20_2 = 1
  L21_2 = 1
  L22_2 = 1
  L19_2[1] = L20_2
  L19_2[2] = L21_2
  L19_2[3] = L22_2
  L18_2.color = L19_2
  L17_2 = L17_2(L18_2)
  L8_1 = L17_2
  L17_2 = 1
  L18_2 = 2
  L19_2 = 1
  for L20_2 = L17_2, L18_2, L19_2 do
    L21_2 = L11_1
    L22_2 = display
    L22_2 = L22_2.newGroup
    L22_2 = L22_2()
    L21_2[L20_2] = L22_2
  end
  L17_2 = L0_1
  L17_2 = L17_2.localized
  L17_2 = L17_2.get
  L18_2 = "NotConnected"
  L17_2 = L17_2(L18_2)
  L18_2 = L0_1
  L18_2 = L18_2.newText
  L19_2 = {}
  L20_2 = L0_1
  L20_2 = L20_2.localized
  L20_2 = L20_2.get
  L21_2 = "LoadingGame"
  L20_2 = L20_2(L21_2)
  L19_2.string = L20_2
  L20_2 = display
  L20_2 = L20_2.contentWidth
  L20_2 = L20_2 * 0.5
  L19_2.x = L20_2
  L20_2 = display
  L20_2 = L20_2.contentHeight
  L20_2 = L20_2 * 0.5
  L19_2.y = L20_2
  L19_2.size = 27
  L18_2 = L18_2(L19_2)
  L19_2 = L15_1
  L20_2 = display
  L20_2 = L20_2.newImageRect
  L21_2 = "images/gui/lobby/6.png"
  L22_2 = 81
  L23_2 = 28
  L20_2 = L20_2(L21_2, L22_2, L23_2)
  L19_2[1] = L20_2
  L19_2 = L15_1
  L19_2 = L19_2[1]
  L19_2.x = 0
  L19_2 = L15_1
  L19_2 = L19_2[1]
  L19_2.y = 32
  L19_2 = L11_1
  L19_2 = L19_2[1]
  L20_2 = L19_2
  L19_2 = L19_2.insert
  L21_2 = L15_1
  L21_2 = L21_2[1]
  L19_2(L20_2, L21_2)
  L19_2 = L5_1
  L20_2 = L0_1
  L20_2 = L20_2.newText
  L21_2 = {}
  L21_2.string = L17_2
  L22_2 = display
  L22_2 = L22_2.contentWidth
  L22_2 = L22_2 * 0.14
  L21_2.x = L22_2
  L22_2 = display
  L22_2 = L22_2.contentHeight
  L22_2 = L22_2 * 0.7
  L21_2.y = L22_2
  L21_2.size = 14
  L21_2.ay = 0
  L21_2.color = L9_2
  L20_2 = L20_2(L21_2)
  L19_2[1] = L20_2
  L19_2 = L15_1
  L20_2 = display
  L20_2 = L20_2.newImageRect
  L21_2 = "images/gui/lobby/6.png"
  L22_2 = 81
  L23_2 = 28
  L20_2 = L20_2(L21_2, L22_2, L23_2)
  L19_2[2] = L20_2
  L19_2 = L15_1
  L19_2 = L19_2[2]
  L19_2.x = 0
  L19_2 = L15_1
  L19_2 = L19_2[2]
  L19_2.y = 32
  L19_2 = L11_1
  L19_2 = L19_2[2]
  L20_2 = L19_2
  L19_2 = L19_2.insert
  L21_2 = L15_1
  L21_2 = L21_2[2]
  L19_2(L20_2, L21_2)
  L19_2 = L5_1
  L20_2 = L0_1
  L20_2 = L20_2.newText
  L21_2 = {}
  L21_2.string = L17_2
  L22_2 = display
  L22_2 = L22_2.contentWidth
  L22_2 = L22_2 * 0.4
  L21_2.x = L22_2
  L22_2 = display
  L22_2 = L22_2.contentHeight
  L22_2 = L22_2 * 0.7
  L21_2.y = L22_2
  L21_2.size = 14
  L21_2.ay = 0
  L21_2.color = L9_2
  L20_2 = L20_2(L21_2)
  L19_2[2] = L20_2
  L19_2 = L11_1
  L19_2 = L19_2[1]
  L20_2 = display
  L20_2 = L20_2.contentWidth
  L20_2 = L20_2 * 0.14
  L19_2.x = L20_2
  L19_2 = L11_1
  L19_2 = L19_2[1]
  L20_2 = display
  L20_2 = L20_2.contentHeight
  L20_2 = L20_2 * 0.5
  L19_2.y = L20_2
  L19_2 = L11_1
  L19_2 = L19_2[2]
  L20_2 = display
  L20_2 = L20_2.contentWidth
  L20_2 = L20_2 * 0.4
  L19_2.x = L20_2
  L19_2 = L11_1
  L19_2 = L19_2[2]
  L20_2 = display
  L20_2 = L20_2.contentHeight
  L20_2 = L20_2 * 0.5
  L19_2.y = L20_2
  L19_2 = L6_1
  L20_2 = display
  L20_2 = L20_2.newRect
  L21_2 = L5_1
  L21_2 = L21_2[1]
  L21_2 = L21_2.x
  L22_2 = L5_1
  L22_2 = L22_2[1]
  L22_2 = L22_2.y
  L22_2 = L22_2 + 10
  L23_2 = 100
  L24_2 = 15
  L20_2 = L20_2(L21_2, L22_2, L23_2, L24_2)
  L19_2[1] = L20_2
  L19_2 = L6_1
  L19_2 = L19_2[1]
  L19_2.anchorX = 0.5
  L19_2 = L6_1
  L19_2 = L19_2[1]
  L19_2.anchorY = 0.5
  L19_2 = L6_1
  L19_2 = L19_2[1]
  L20_2 = L19_2
  L19_2 = L19_2.setFillColor
  L21_2 = 0
  L22_2 = 0
  L23_2 = 0
  L24_2 = 0
  L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
  L19_2 = L6_1
  L20_2 = display
  L20_2 = L20_2.newRect
  L21_2 = L5_1
  L21_2 = L21_2[2]
  L21_2 = L21_2.x
  L22_2 = L5_1
  L22_2 = L22_2[2]
  L22_2 = L22_2.y
  L22_2 = L22_2 + 10
  L23_2 = 100
  L24_2 = 15
  L20_2 = L20_2(L21_2, L22_2, L23_2, L24_2)
  L19_2[2] = L20_2
  L19_2 = L6_1
  L19_2 = L19_2[2]
  L19_2.anchorX = 0.5
  L19_2 = L6_1
  L19_2 = L19_2[2]
  L19_2.anchorY = 0.5
  L19_2 = L6_1
  L19_2 = L19_2[2]
  L20_2 = L19_2
  L19_2 = L19_2.setFillColor
  L21_2 = 0
  L22_2 = 0
  L23_2 = 0
  L24_2 = 0
  L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
  
  function L19_2(A0_3, A1_3)
  end
  
  function L20_2(A0_3)
    local L1_3, L2_3
    L1_3 = L12_1
    if not L1_3 then
      L1_3 = L8_2
      L1_3 = L1_3.isVisible
      if L1_3 then
        L1_3 = L0_1
        L1_3 = L1_3.gotoScene
        L2_3 = "lua.scenes.mainMenu"
        L1_3(L2_3)
      end
    end
  end
  
  function L21_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = L12_1
    if not L1_3 then
      L1_3 = L8_2
      L1_3 = L1_3.isVisible
      if L1_3 then
        L1_3 = true
        L13_1 = L1_3
        L1_3 = {}
        L1_3.isModal = true
        L2_3 = L0_1
        L2_3 = L2_3.showOverlay
        L3_3 = "lua.overlays.chat"
        L4_3 = L1_3
        L2_3(L3_3, L4_3)
      end
    end
  end
  
  function L22_2(A0_3)
    local L1_3
    L1_3 = L12_1
    if not L1_3 then
      L1_3 = L8_2
      L1_3 = L1_3.isVisible
      if L1_3 then
        L1_3 = L1_1
        L1_3 = L1_3.sendStartGame
        L1_3()
      end
    end
  end
  
  function L23_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L8_2
    L0_3 = L0_3.isVisible
    if L0_3 then
      L0_3 = {}
      L0_3.isModal = true
      L1_3 = L0_1
      L1_3 = L1_3.showOverlay
      L2_3 = "lua.overlays.sendFriendRequest"
      L3_3 = L0_3
      L1_3(L2_3, L3_3)
    end
  end
  
  function L24_2()
    local L0_3, L1_3
    L0_3 = L15_2
    L0_3.isVisible = false
    L0_3 = L14_2
    L0_3.isVisible = false
  end
  
  L25_2 = L24_2
  L25_2()
  
  function L25_2()
    local L0_3, L1_3, L2_3
    L0_3 = L15_2
    L0_3.isVisible = true
    L0_3 = L14_2
    L0_3.isVisible = true
    L0_3 = L7_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L7_2
      L0_3(L1_3)
      L0_3 = nil
      L7_2 = L0_3
    end
    L0_3 = timer
    L0_3 = L0_3.performWithDelay
    L1_3 = 5000
    L2_3 = L24_2
    L0_3 = L0_3(L1_3, L2_3)
    L7_2 = L0_3
  end
  
  L26_2 = L0_1
  L26_2 = L26_2.newButton
  L27_2 = {}
  L27_2.image = "images/gui/common/buttonHome.png"
  L27_2.width = 90
  L27_2.height = 57
  L27_2.onRelease = L20_2
  L27_2.x = 50
  L27_2.y = 292
  L26_2 = L26_2(L27_2)
  L27_2 = L0_1
  L27_2 = L27_2.newButton
  L28_2 = {}
  L28_2.image = "images/gui/customplay/buttonChat.png"
  L28_2.width = 60
  L28_2.height = 60
  L28_2.onRelease = L21_2
  L28_2.x = 262
  L28_2.y = 290
  L27_2 = L27_2(L28_2)
  L28_2 = L0_1
  L28_2 = L28_2.newButton
  L29_2 = {}
  L29_2.x = 259
  L29_2.y = 20
  L29_2.width = 53
  L29_2.height = 45
  L29_2.image = "images/gui/customplay/button_info.png"
  L29_2.onRelease = L25_2
  L28_2 = L28_2(L29_2)
  L29_2 = L0_1
  L29_2 = L29_2.newButton
  L30_2 = {}
  L30_2.x = 460
  L30_2.y = 18
  L30_2.width = 43
  L30_2.height = 38
  L30_2.image = "images/gui/friends/add.png"
  L30_2.onRelease = L23_2
  L29_2 = L29_2(L30_2)
  L30_2 = L0_1
  L30_2 = L30_2.newButton
  L31_2 = {}
  L31_2.image = "images/gui/customplay/buttonStart.png"
  L31_2.width = 80
  L31_2.height = 57
  L31_2.onRelease = L22_2
  L31_2.x = 138
  L31_2.y = 292
  L30_2 = L30_2(L31_2)
  L30_2.alpha = 0
  L31_2 = L0_1
  L31_2 = L31_2.database
  L31_2 = L31_2.getChat
  L31_2 = L31_2()
  if L31_2 == 0 then
    L27_2.isVisible = false
    L30_2.x = 56
  end
  
  function L31_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    L0_3 = L0_1
    L0_3 = L0_3.database
    L0_3 = L0_3.getFriends
    L0_3 = L0_3()
    L1_3 = L0_1
    L1_3 = L1_3.database
    L1_3 = L1_3.getClanMembers
    L1_3 = L1_3()
    L2_3 = {}
    L3_3 = {}
    L4_3 = {}
    L5_3 = {}
    L6_3 = {}
    L3_3[1] = L6_3
    L6_3 = L3_3[1]
    L7_3 = L0_1
    L7_3 = L7_3.localized
    L7_3 = L7_3.get
    L8_3 = "Online"
    L7_3 = L7_3(L8_3)
    L6_3.title = L7_3
    L6_3 = {}
    L4_3[1] = L6_3
    L6_3 = L4_3[1]
    L7_3 = L0_1
    L7_3 = L7_3.localized
    L7_3 = L7_3.get
    L8_3 = "InGame"
    L7_3 = L7_3(L8_3)
    L6_3.title = L7_3
    L6_3 = {}
    L5_3[1] = L6_3
    L6_3 = L5_3[1]
    L7_3 = L0_1
    L7_3 = L7_3.localized
    L7_3 = L7_3.get
    L8_3 = "Offline"
    L7_3 = L7_3(L8_3)
    L6_3.title = L7_3
    L6_3 = 1
    L7_3 = #L1_3
    L8_3 = 1
    for L9_3 = L6_3, L7_3, L8_3 do
      L10_3 = L0_1
      L10_3 = L10_3.clanUtils
      L10_3 = L10_3.getClanMember
      L11_3 = L1_3[L9_3]
      L11_3 = L11_3.p
      L10_3 = L10_3(L11_3)
      if L10_3 then
        L11_3 = L10_3.playerId
        L12_3 = L0_1
        L12_3 = L12_3.database
        L12_3 = L12_3.getPlayerInformation
        L12_3 = L12_3()
        L12_3 = L12_3.playerId
        if L11_3 ~= L12_3 then
          L11_3 = tonumber
          L12_3 = L10_3.onlineStatus
          L11_3 = L11_3(L12_3)
          if L11_3 == 1 then
            L11_3 = #L3_3
            L11_3 = L11_3 + 1
            L3_3[L11_3] = L10_3
          else
            L11_3 = tonumber
            L12_3 = L10_3.onlineStatus
            L11_3 = L11_3(L12_3)
            if L11_3 == 2 then
              L11_3 = #L4_3
              L11_3 = L11_3 + 1
              L4_3[L11_3] = L10_3
            else
              L11_3 = #L5_3
              L11_3 = L11_3 + 1
              L5_3[L11_3] = L10_3
            end
          end
        end
      end
    end
    L6_3 = 1
    L7_3 = #L0_3
    L8_3 = 1
    for L9_3 = L6_3, L7_3, L8_3 do
      L10_3 = L0_1
      L10_3 = L10_3.database
      L10_3 = L10_3.isPlayerClanMember
      L11_3 = L0_3[L9_3]
      L11_3 = L11_3.p
      L10_3 = L10_3(L11_3)
      if not L10_3 then
        L10_3 = tonumber
        L11_3 = L0_3[L9_3]
        L11_3 = L11_3.state
        L10_3 = L10_3(L11_3)
        if L10_3 == 1 then
          L10_3 = #L3_3
          L10_3 = L10_3 + 1
          L11_3 = L0_3[L9_3]
          L3_3[L10_3] = L11_3
        else
          L10_3 = tonumber
          L11_3 = L0_3[L9_3]
          L11_3 = L11_3.state
          L10_3 = L10_3(L11_3)
          if L10_3 == 2 then
            L10_3 = #L4_3
            L10_3 = L10_3 + 1
            L11_3 = L0_3[L9_3]
            L4_3[L10_3] = L11_3
          else
            L10_3 = #L5_3
            L10_3 = L10_3 + 1
            L11_3 = L0_3[L9_3]
            L5_3[L10_3] = L11_3
          end
        end
      end
    end
    L6_3 = L0_1
    L6_3 = L6_3.tableUtils
    L6_3 = L6_3.sortPlayerTableAlphabetically
    L7_3 = L3_3
    L6_3(L7_3)
    L6_3 = L0_1
    L6_3 = L6_3.tableUtils
    L6_3 = L6_3.sortPlayerTableAlphabetically
    L7_3 = L4_3
    L6_3(L7_3)
    L6_3 = L0_1
    L6_3 = L6_3.tableUtils
    L6_3 = L6_3.sortPlayerTableAlphabetically
    L7_3 = L5_3
    L6_3(L7_3)
    L6_3 = #L3_3
    if 1 < L6_3 then
      L6_3 = 1
      L7_3 = #L3_3
      L8_3 = 1
      for L9_3 = L6_3, L7_3, L8_3 do
        L10_3 = #L2_3
        L10_3 = L10_3 + 1
        L11_3 = L3_3[L9_3]
        L2_3[L10_3] = L11_3
      end
    end
    L6_3 = #L4_3
    if 1 < L6_3 then
      L6_3 = 1
      L7_3 = #L4_3
      L8_3 = 1
      for L9_3 = L6_3, L7_3, L8_3 do
        L10_3 = #L2_3
        L10_3 = L10_3 + 1
        L11_3 = L4_3[L9_3]
        L2_3[L10_3] = L11_3
      end
    end
    L6_3 = #L5_3
    if 1 < L6_3 then
      L6_3 = 1
      L7_3 = #L5_3
      L8_3 = 1
      for L9_3 = L6_3, L7_3, L8_3 do
        L10_3 = #L2_3
        L10_3 = L10_3 + 1
        L11_3 = L5_3[L9_3]
        L2_3[L10_3] = L11_3
      end
    end
    L6_3 = L14_1
    if L6_3 then
      L6_3 = 1
      L7_3 = #L2_3
      L8_3 = 1
      for L9_3 = L6_3, L7_3, L8_3 do
        L10_3 = L14_1
        L11_3 = L2_3[L9_3]
        L11_3 = L11_3.p
        if L10_3 == L11_3 then
          L10_3 = L2_3[L9_3]
          L10_3.autoSend = true
        end
      end
    end
    return L2_3
  end
  
  function L32_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = 2
    L2_3 = 1
    L3_3 = L15_1
    L3_3 = #L3_3
    L4_3 = 1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = L15_1
      L6_3 = L6_3[L5_3]
      L6_3 = L6_3.player
      if L6_3 then
        L1_3 = L1_3 - 1
      end
    end
    if L1_3 == 0 then
    elseif A0_3 then
      L2_3 = L0_1
      L2_3 = L2_3.gameHostData
      L2_3 = L2_3.sessionId
      if L2_3 then
        L2_3 = L0_1
        L2_3 = L2_3.gameHostData
        L2_3 = L2_3.serverAddress
        if L2_3 then
          L2_3 = L5_2
          L2_3 = L2_3[A0_3]
          if L2_3 then
            L2_3 = os
            L2_3 = L2_3.time
            L2_3 = L2_3()
            L3_3 = L5_2
            L3_3 = L3_3[A0_3]
            L3_3 = L3_3 + 5
            if L2_3 < L3_3 then
              return
            end
          end
          L2_3 = L5_2
          L3_3 = os
          L3_3 = L3_3.time
          L3_3 = L3_3()
          L2_3[A0_3] = L3_3
          L2_3 = L0_1
          L2_3 = L2_3.comm
          L2_3 = L2_3.inviteFriendTo2v2Game
          L3_3 = A0_3
          L4_3 = L0_1
          L4_3 = L4_3.gameHostData
          L4_3 = L4_3.sessionId
          L5_3 = L0_1
          L5_3 = L5_3.gameHostData
          L5_3 = L5_3.serverAddress
          L2_3(L3_3, L4_3, L5_3)
          L2_3 = L0_1
          L2_3 = L2_3.analytics
          L2_3 = L2_3.newEvent
          L3_3 = "design"
          L4_3 = {}
          L4_3.event_id = "invite2v2:"
          L5_3 = L0_1
          L5_3 = L5_3.config
          L5_3 = L5_3.fullVersion
          L4_3.area = L5_3
          L2_3(L3_3, L4_3)
        end
      end
    end
  end
  
  function L33_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = L4_2
    L0_3 = L0_3.create
    L1_3 = 306
    L2_3 = 44
    L3_3 = 180
    L4_3 = 276
    L5_3 = 40
    L6_3 = L32_2
    L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3)
    L6_2 = L0_3
    L0_3 = L6_2
    L0_3 = L0_3.createTable
    L1_3 = L31_2
    L1_3 = L1_3()
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
  end
  
  function L34_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L10_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L18_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L13_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L6_2
    L2_3 = L2_3.getTable
    L2_3, L3_3, L4_3, L5_3, L6_3 = L2_3()
    L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L11_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L12_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L26_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L27_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L30_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L16_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_1
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L29_2
    L0_3(L1_3, L2_3)
    L0_3 = 1
    L1_3 = L5_1
    L1_3 = #L1_3
    L2_3 = 1
    for L3_3 = L0_3, L1_3, L2_3 do
      L4_3 = L8_2
      L5_3 = L4_3
      L4_3 = L4_3.insert
      L6_3 = L11_1
      L6_3 = L6_3[L3_3]
      L4_3(L5_3, L6_3)
      L4_3 = L8_2
      L5_3 = L4_3
      L4_3 = L4_3.insert
      L6_3 = L6_1
      L6_3 = L6_3[L3_3]
      L4_3(L5_3, L6_3)
      L4_3 = L8_2
      L5_3 = L4_3
      L4_3 = L4_3.insert
      L6_3 = L5_1
      L6_3 = L6_3[L3_3]
      L4_3(L5_3, L6_3)
    end
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L28_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L14_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
  end
  
  function L35_2()
    local L0_3, L1_3
    L0_3 = L6_2
    if L0_3 then
      L0_3 = L6_2
      L0_3 = L0_3.setData
      L1_3 = L31_2
      L1_3 = L1_3()
      L0_3(L1_3)
    end
  end
  
  L7_1 = L35_2
  
  function L35_2()
    local L0_3, L1_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L26_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L27_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L30_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L28_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L29_2
    L0_3(L1_3)
    L0_3 = L6_2
    if L0_3 then
      L0_3 = L6_2
      L0_3 = L0_3.cleanTable
      L0_3()
      L0_3 = nil
      L6_2 = L0_3
    end
    L0_3 = L7_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L7_2
      L0_3(L1_3)
      L0_3 = nil
      L7_2 = L0_3
    end
    L0_3 = L0_1
    L0_3 = L0_3.mapHandler
    L0_3 = L0_3.setNonMapActive
    L0_3()
  end
  
  L3_1 = L35_2
  
  function L35_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L0_3 = L3_2
    if L0_3 then
      L0_3 = false
      L3_2 = L0_3
      L0_3 = L18_2
      L0_3.isVisible = false
      L0_3 = L8_2
      L0_3.isVisible = true
      L0_3 = 1
      L1_3 = 2
      L2_3 = 1
      for L3_3 = L0_3, L1_3, L2_3 do
        L4_3 = L6_1
        L4_3 = L4_3[L3_3]
        L5_3 = L4_3
        L4_3 = L4_3.setFillColor
        L6_3 = unpack
        L7_3 = L16_1
        L6_3, L7_3, L8_3 = L6_3(L7_3)
        L4_3(L5_3, L6_3, L7_3, L8_3)
        L4_3 = L6_1
        L4_3 = L4_3[L3_3]
        L4_3.strokeWidth = 1
        L4_3 = L6_1
        L4_3 = L4_3[L3_3]
        L5_3 = L4_3
        L4_3 = L4_3.setStrokeColor
        L6_3 = 0
        L7_3 = 0
        L8_3 = 0
        L4_3(L5_3, L6_3, L7_3, L8_3)
      end
      L0_3 = L0_1
      L0_3 = L0_3.data
      L0_3 = L0_3.gameInfo
      L0_3 = L0_3.gameType
      if L0_3 == 5 then
        L0_3 = L30_2
        L0_3.alpha = 1
      end
    end
  end
  
  L10_1 = L35_2
  L35_2 = L33_2
  L35_2()
  L35_2 = L34_2
  L35_2()
end

L2_1.create = L20_1

function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2
  L2_2 = A1_2.phase
  if L2_2 == "will" then
    return
  end
  L3_2 = A0_2.view
  L4_2 = false
  L5_2 = false
  L6_2 = false
  L13_1 = L6_2
  L6_2 = nil
  L7_2 = system
  L7_2 = L7_2.getTimer
  L7_2 = L7_2()
  L8_2 = nil
  L9_2 = nil
  L10_2 = nil
  L11_2 = nil
  L12_2 = {}
  L13_2 = 0
  L14_2 = 0
  L15_2 = 0
  L16_2 = 0
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L12_2[3] = L15_2
  L12_2[4] = L16_2
  L13_2 = nil
  L14_2 = false
  L15_2 = {}
  L16_2 = require
  L17_2 = "spine-corona.monsterLoader"
  L16_2 = L16_2(L17_2)
  L17_2 = require
  L18_2 = "lua.modules.androidBackButton"
  L17_2 = L17_2(L18_2)
  L18_2 = require
  L19_2 = "lua.network.tcpMessageFormat"
  L18_2 = L18_2(L19_2)
  L19_2 = require
  L20_2 = "lua.network.chatMessageFormat"
  L19_2 = L19_2(L20_2)
  L20_2 = nil
  L21_2 = nil
  L22_2 = 0
  L23_2 = nil
  L24_2 = nil
  L25_2 = {}
  L26_2 = {}
  L27_2 = L0_1
  L27_2 = L27_2.data
  L28_2 = {}
  L27_2.chatLog = L28_2
  L27_2 = L17_2.addBackButton
  L28_2 = "lua.scenes.playMenu"
  L29_2 = "lua.scenes.lobby2v2Play"
  L27_2(L28_2, L29_2)
  L27_2 = L0_1
  L27_2 = L27_2.data
  L27_2 = L27_2.gameInfo
  L27_2.crazyModeActive = false
  L27_2 = L0_1
  L27_2 = L27_2.data
  L27_2 = L27_2.gameInfo
  L27_2.crazyMode = 0
  
  function L27_2(A0_3)
    local L1_3, L2_3
    L1_3 = L25_2
    L1_3 = L1_3[A0_3]
    if L1_3 then
      L1_3 = L25_2
      L1_3 = L1_3[A0_3]
      L2_3 = L1_3
      L1_3 = L1_3.removeSelf
      L1_3(L2_3)
      L1_3 = L25_2
      L1_3[A0_3] = nil
    end
  end
  
  function L28_2(A0_3)
    local L1_3, L2_3
    L1_3 = L26_2
    L1_3 = L1_3[A0_3]
    if L1_3 then
      L1_3 = L26_2
      L1_3 = L1_3[A0_3]
      L2_3 = L1_3
      L1_3 = L1_3.removeSelf
      L1_3(L2_3)
      L1_3 = L26_2
      L1_3[A0_3] = nil
    end
  end
  
  function L29_2(A0_3)
    local L1_3, L2_3
    L1_3 = L15_2
    L1_3 = L1_3[A0_3]
    if L1_3 then
      L1_3 = L15_2
      L1_3 = L1_3[A0_3]
      L1_3 = L1_3.clean
      L1_3()
      L1_3 = L15_2
      L1_3[A0_3] = nil
    end
    L1_3 = L15_1
    L1_3 = L1_3[A0_3]
    if L1_3 then
      L1_3 = L15_1
      L1_3 = L1_3[A0_3]
      L2_3 = L1_3
      L1_3 = L1_3.removeSelf
      L1_3(L2_3)
      L1_3 = L15_1
      L1_3[A0_3] = nil
    end
    L1_3 = L27_2
    L2_3 = A0_3
    L1_3(L2_3)
    L1_3 = L28_2
    L2_3 = A0_3
    L1_3(L2_3)
  end
  
  function L30_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = L28_2
    L2_3 = A0_3
    L1_3(L2_3)
    
    function L1_3(A0_4)
      local L1_4, L2_4
      L1_4 = L1_1
      L1_4 = L1_4.sendKickPlayer
      L2_4 = A0_3
      L1_4(L2_4)
    end
    
    L2_3 = L15_1
    L2_3 = L2_3[A0_3]
    if L2_3 then
      L2_3 = L26_2
      L3_3 = L0_1
      L3_3 = L3_3.newButton
      L4_3 = {}
      L5_3 = L15_1
      L5_3 = L5_3[A0_3]
      L5_3 = L5_3.x
      L5_3 = L5_3 - 28
      L4_3.x = L5_3
      L5_3 = L15_1
      L5_3 = L5_3[A0_3]
      L5_3 = L5_3.y
      L5_3 = L5_3 - 76
      L4_3.y = L5_3
      L4_3.width = 43
      L4_3.height = 38
      L4_3.image = "images/gui/common/buttonClosePopup.png"
      L4_3.onRelease = L1_3
      L3_3 = L3_3(L4_3)
      L2_3[A0_3] = L3_3
      L2_3 = L11_1
      L2_3 = L2_3[A0_3]
      L3_3 = L2_3
      L2_3 = L2_3.insert
      L4_3 = L26_2
      L4_3 = L4_3[A0_3]
      L2_3(L3_3, L4_3)
    end
  end
  
  function L31_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = L27_2
    L2_3 = A0_3
    L1_3(L2_3)
    L1_3 = L15_1
    L1_3 = L1_3[A0_3]
    if L1_3 then
      L1_3 = L25_2
      L2_3 = display
      L2_3 = L2_3.newSprite
      L3_3 = L0_1
      L3_3 = L3_3.powerUpEffectImageSheet
      L4_3 = L0_1
      L4_3 = L4_3.data
      L4_3 = L4_3.animations
      L4_3 = L4_3.chat
      L2_3 = L2_3(L3_3, L4_3)
      L1_3[A0_3] = L2_3
      L1_3 = L25_2
      L1_3 = L1_3[A0_3]
      L1_3.xScale = 0.5
      L1_3 = L25_2
      L1_3 = L1_3[A0_3]
      L1_3.yScale = 0.5
      L1_3 = L25_2
      L1_3 = L1_3[A0_3]
      L2_3 = L15_1
      L2_3 = L2_3[A0_3]
      L2_3 = L2_3.x
      L2_3 = L2_3 + 34
      L1_3.x = L2_3
      L1_3 = L25_2
      L1_3 = L1_3[A0_3]
      L2_3 = L15_1
      L2_3 = L2_3[A0_3]
      L2_3 = L2_3.y
      L2_3 = L2_3 - 72
      L1_3.y = L2_3
      L1_3 = L25_2
      L1_3 = L1_3[A0_3]
      L2_3 = L1_3
      L1_3 = L1_3.setSequence
      L3_3 = "normal"
      L1_3(L2_3, L3_3)
      L1_3 = L25_2
      L1_3 = L1_3[A0_3]
      L2_3 = L1_3
      L1_3 = L1_3.play
      L1_3(L2_3)
      L1_3 = L11_1
      L1_3 = L1_3[A0_3]
      L2_3 = L1_3
      L1_3 = L1_3.insert
      L3_3 = L25_2
      L3_3 = L3_3[A0_3]
      L1_3(L2_3, L3_3)
    end
  end
  
  function L32_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L2_3 = "images/gui/lobby/6.png"
    if A1_3 then
      L3_3 = L0_1
      L3_3 = L3_3.storeConfig
      L3_3 = L3_3.getPlateId
      L4_3 = A1_3
      L3_3 = L3_3(L4_3)
      L4_3 = "images/gui/lobby/"
      L5_3 = L3_3
      L6_3 = ".png"
      L2_3 = L4_3 .. L5_3 .. L6_3
    end
    L3_3 = L15_1
    L4_3 = display
    L4_3 = L4_3.newImageRect
    L5_3 = L2_3
    L6_3 = 81
    L7_3 = 28
    L4_3 = L4_3(L5_3, L6_3, L7_3)
    L3_3[A0_3] = L4_3
    L3_3 = L15_1
    L3_3 = L3_3[A0_3]
    L3_3.x = 0
    L3_3 = L15_1
    L3_3 = L3_3[A0_3]
    L3_3.y = 32
    L3_3 = L11_1
    L3_3 = L3_3[A0_3]
    L4_3 = L3_3
    L3_3 = L3_3.insert
    L5_3 = L15_1
    L5_3 = L5_3[A0_3]
    L3_3(L4_3, L5_3)
    if A1_3 then
      L3_3 = L15_1
      L3_3 = L3_3[A0_3]
      L3_3.player = true
    end
  end
  
  function L33_2(A0_3, A1_3, A2_3, A3_3, A4_3)
    local L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    if A2_3 then
      L5_3 = L15_2
      L5_3 = L5_3[A0_3]
      if L5_3 then
        L5_3 = L15_2
        L5_3 = L5_3[A0_3]
        L5_3 = L5_3.playerId
        if L5_3 == A4_3 then
          return
        end
      end
      L5_3 = L29_2
      L6_3 = A0_3
      L5_3(L6_3)
      L5_3 = L32_2
      L6_3 = A0_3
      L7_3 = A1_3
      L5_3(L6_3, L7_3)
      L5_3 = L0_1
      L5_3 = L5_3.data
      L5_3 = L5_3.gameInfo
      L5_3 = L5_3.players
      L5_3 = L5_3[A0_3]
      L5_3 = L5_3.clanState
      if L5_3 then
        L5_3 = L0_1
        L5_3 = L5_3.data
        L5_3 = L5_3.gameInfo
        L5_3 = L5_3.players
        L5_3 = L5_3[A0_3]
        L5_3 = L5_3.clanState
        L5_3 = L5_3.c
      end
      L6_3 = L15_2
      L7_3 = L16_2
      L7_3 = L7_3.new
      L8_3 = A1_3
      L9_3 = true
      L10_3 = nil
      L11_3 = L5_3
      L7_3 = L7_3(L8_3, L9_3, L10_3, L11_3)
      L6_3[A0_3] = L7_3
      L6_3 = L15_2
      L6_3 = L6_3[A0_3]
      L6_3 = L6_3.stopAllAnimation
      L6_3()
      L6_3 = L15_2
      L6_3 = L6_3[A0_3]
      L6_3.playerId = A4_3
      L6_3 = L15_2
      L6_3 = L6_3[A0_3]
      L6_3 = L6_3.getGroup
      L6_3 = L6_3()
      L6_3.xScale = 0.36
      L6_3.yScale = 0.36
      L7_3 = L11_1
      L7_3 = L7_3[A0_3]
      L8_3 = L7_3
      L7_3 = L7_3.insert
      L9_3 = L6_3
      L7_3(L8_3, L9_3)
      L7_3 = L0_1
      L7_3 = L7_3.database
      L7_3 = L7_3.getPlayerInformation
      L7_3 = L7_3()
      L7_3 = L7_3.playerId
      if A4_3 ~= L7_3 then
        L7_3 = L0_1
        L7_3 = L7_3.data
        L7_3 = L7_3.gameInfo
        L7_3 = L7_3.gameType
        if L7_3 == 5 then
          L7_3 = L30_2
          L8_3 = A0_3
          L7_3(L8_3)
        end
      end
    else
      L5_3 = L29_2
      L6_3 = A0_3
      L5_3(L6_3)
      L5_3 = L32_2
      L6_3 = A0_3
      L5_3(L6_3)
    end
    L5_3 = L5_1
    L5_3 = L5_3[A0_3]
    L5_3.text = A3_3
    L5_3 = L0_1
    L5_3 = L5_3.database
    L5_3 = L5_3.getPlayerInformation
    L5_3 = L5_3()
    L5_3 = L5_3.playerId
    if A4_3 == L5_3 then
      L5_3 = L6_1
      L5_3 = L5_3[A0_3]
      L6_3 = L5_3
      L5_3 = L5_3.setFillColor
      L7_3 = unpack
      L8_3 = L17_1
      L7_3, L8_3, L9_3, L10_3, L11_3 = L7_3(L8_3)
      L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
      L5_3 = L5_1
      L5_3 = L5_3[A0_3]
      L6_3 = L5_3
      L5_3 = L5_3.setFillColor
      L7_3 = unpack
      L8_3 = L19_1
      L7_3, L8_3, L9_3, L10_3, L11_3 = L7_3(L8_3)
      L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
    else
      L5_3 = L6_1
      L5_3 = L5_3[A0_3]
      L6_3 = L5_3
      L5_3 = L5_3.setFillColor
      L7_3 = unpack
      L8_3 = L16_1
      L7_3, L8_3, L9_3, L10_3, L11_3 = L7_3(L8_3)
      L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
      L5_3 = L5_1
      L5_3 = L5_3[A0_3]
      L6_3 = L5_3
      L5_3 = L5_3.setFillColor
      L7_3 = unpack
      L8_3 = L18_1
      L7_3, L8_3, L9_3, L10_3, L11_3 = L7_3(L8_3)
      L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
    end
  end
  
  function L34_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = L11_2
    if L1_3 then
      L1_3 = L11_2
      L2_3 = L1_3
      L1_3 = L1_3.removeSelf
      L1_3(L2_3)
      L1_3 = nil
      L11_2 = L1_3
    end
    L1_3 = display
    L1_3 = L1_3.newImageRect
    L2_3 = A0_3
    L3_3 = 80
    L4_3 = 104
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    L11_2 = L1_3
    L1_3 = L11_2
    L1_3.x = 50
    L1_3 = L11_2
    L2_3 = display
    L2_3 = L2_3.contentHeight
    L2_3 = L2_3 * 0.5
    L1_3.y = L2_3
    L1_3 = L3_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L11_2
    L1_3(L2_3, L3_3)
  end
  
  function L35_2()
    local L0_3, L1_3, L2_3
    L0_3 = L0_1
    L0_3 = L0_3.getSceneName
    L1_3 = "overlay"
    L0_3 = L0_3(L1_3)
    L1_3 = L0_1
    L1_3 = L1_3.gotoScene
    L2_3 = "lua.scenes.mainMenu"
    L1_3(L2_3)
    if L0_3 == "lua.overlays.chatScene" then
      L1_3 = L0_1
      L1_3 = L1_3.hideOverlay
      L1_3()
      L1_3 = false
      L13_1 = L1_3
    end
  end
  
  function L36_2(A0_3)
    local L1_3
    L1_3 = A0_3.action
    if "clicked" == L1_3 then
      L1_3 = nil
      L8_2 = L1_3
      L1_3 = L0_1
      L1_3 = L1_3.suspendAlert
      if L1_3 then
        return
      end
      L1_3 = L35_2
      L1_3()
    end
  end
  
  function L37_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L0_1
    L0_3 = L0_3.suspendAlert
    if L0_3 then
      return
    end
    L0_3 = native
    L0_3 = L0_3.showAlert
    L1_3 = L0_1
    L1_3 = L1_3.localized
    L1_3 = L1_3.get
    L2_3 = "Disconnected"
    L1_3 = L1_3(L2_3)
    L2_3 = L0_1
    L2_3 = L2_3.localized
    L2_3 = L2_3.get
    L3_3 = "LostConnection"
    L2_3 = L2_3(L3_3)
    L3_3 = {}
    L4_3 = L0_1
    L4_3 = L4_3.localized
    L4_3 = L4_3.get
    L5_3 = "OK"
    L4_3, L5_3 = L4_3(L5_3)
    L3_3[1] = L4_3
    L3_3[2] = L5_3
    L4_3 = L36_2
    L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
    L8_2 = L0_3
  end
  
  function L38_2()
    local L0_3, L1_3
    L0_3 = L4_2
    if L0_3 then
      L0_3 = L1_1
      L0_3 = L0_3.isOnline
      L0_3 = L0_3()
      if L0_3 == false then
        L0_3 = L13_2
        L1_3 = 1
        L0_3(L1_3)
      end
    end
  end
  
  function L39_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.suspendAlert
    if L0_3 then
      return
    end
    L0_3 = L4_2
    if not L0_3 then
      L0_3 = L5_2
      if not L0_3 then
        L0_3 = L35_2
        L0_3()
        L0_3 = L0_1
        L0_3 = L0_3.createCustomOverlay
        L1_3 = 39
        L0_3(L1_3)
      end
    end
  end
  
  function L13_2(A0_3)
    local L1_3
    L1_3 = L0_1
    L1_3 = L1_3.suspendAlert
    if L1_3 then
      return
    end
    L1_3 = L5_2
    if not L1_3 then
      L1_3 = true
      L5_2 = L1_3
      if A0_3 == 1 then
        L1_3 = L37_2
        L1_3()
      end
    end
  end
  
  L40_2 = 0
  L9_1 = L40_2
  
  function L40_2()
    local L0_3, L1_3
    L0_3 = L23_2
    if L0_3 then
      L0_3 = L23_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L23_2 = L0_3
    end
    L0_3 = L24_2
    if L0_3 then
      L0_3 = L24_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L24_2 = L0_3
    end
  end
  
  function L41_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L40_2
    L0_3()
    L0_3 = L9_1
    if 0 < L0_3 then
      L0_3 = L9_1
      if 99 < L0_3 then
        L0_3 = 99
        L9_1 = L0_3
      end
      L0_3 = display
      L0_3 = L0_3.newImageRect
      L1_3 = "images/gui/mainMenu/alert.png"
      L2_3 = 20
      L3_3 = 20
      L0_3 = L0_3(L1_3, L2_3, L3_3)
      L23_2 = L0_3
      L0_3 = L23_2
      L0_3.x = 280
      L0_3 = L23_2
      L0_3.y = 272
      L0_3 = L3_2
      L1_3 = L0_3
      L0_3 = L0_3.insert
      L2_3 = L23_2
      L0_3(L1_3, L2_3)
      L0_3 = L0_1
      L0_3 = L0_3.newText
      L1_3 = {}
      L2_3 = L9_1
      L1_3.string = L2_3
      L2_3 = L23_2
      L2_3 = L2_3.x
      L1_3.x = L2_3
      L2_3 = L23_2
      L2_3 = L2_3.y
      L1_3.y = L2_3
      L1_3.size = 15
      L2_3 = {}
      L3_3 = 1
      L4_3 = 1
      L5_3 = 1
      L2_3[1] = L3_3
      L2_3[2] = L4_3
      L2_3[3] = L5_3
      L1_3.color = L2_3
      L0_3 = L0_3(L1_3)
      L24_2 = L0_3
      L0_3 = L3_2
      L1_3 = L0_3
      L0_3 = L0_3.insert
      L2_3 = L24_2
      L0_3(L1_3, L2_3)
      L0_3 = L0_1
      L0_3 = L0_3.getCurrentSceneName
      L0_3 = L0_3()
      if L0_3 == "lua.scenes.lobby2v2Play" then
        L0_3 = L0_1
        L0_3 = L0_3.audio
        L0_3 = L0_3.play
        L1_3 = "message_received"
        L0_3(L1_3)
      end
    end
  end
  
  L42_2 = L41_2
  L42_2()
  
  function L42_2(A0_3)
    local L1_3, L2_3
    L1_3 = L0_1
    L2_3 = A0_3 / 1000000
    L1_3.syncedClock = L2_3
    L1_3 = L0_1
    L2_3 = system
    L2_3 = L2_3.getTimer
    L2_3 = L2_3()
    L1_3.serverSyncTime = L2_3
    L1_3 = L0_1
    
    function L2_3()
      local L0_4, L1_4, L2_4, L3_4
      L0_4 = math
      L0_4 = L0_4.round
      L1_4 = L0_1
      L1_4 = L1_4.syncedClock
      L2_4 = system
      L2_4 = L2_4.getTimer
      L2_4 = L2_4()
      L3_4 = L0_1
      L3_4 = L3_4.serverSyncTime
      L2_4 = L2_4 - L3_4
      L1_4 = L1_4 + L2_4
      return L0_4(L1_4)
    end
    
    L1_3.serverClock = L2_3
  end
  
  function L43_2()
    local L0_3, L1_3
    L0_3 = L1_1
    L0_3 = L0_3.stopTCPClient
    L0_3()
    L0_3 = L0_1
    L0_3 = L0_3.gotoScene
    L1_3 = "lua.scenes.playMenu"
    L0_3(L1_3)
  end
  
  function L44_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.gameInfo
    L2_3 = {}
    L1_3.players = L2_3
    L1_3 = A0_3[2]
    L1_3 = L1_3.p
    L1_3 = #L1_3
    L2_3 = 1
    L3_3 = 2
    L4_3 = 1
    for L5_3 = L2_3, L3_3, L4_3 do
      if L5_3 <= L1_3 then
        L6_3 = A0_3[2]
        L6_3 = L6_3.p
        L6_3 = L6_3[L5_3]
        L7_3 = L0_1
        L7_3 = L7_3.data
        L7_3 = L7_3.gameInfo
        L7_3 = L7_3.players
        L8_3 = {}
        L7_3[L5_3] = L8_3
        L7_3 = L0_1
        L7_3 = L7_3.data
        L7_3 = L7_3.gameInfo
        L7_3 = L7_3.players
        L7_3 = L7_3[L5_3]
        L8_3 = L6_3.a
        L7_3.avatar = L8_3
        L7_3 = L0_1
        L7_3 = L7_3.data
        L7_3 = L7_3.gameInfo
        L7_3 = L7_3.players
        L7_3 = L7_3[L5_3]
        L8_3 = L6_3.n
        L7_3.username = L8_3
        L7_3 = L0_1
        L7_3 = L7_3.data
        L7_3 = L7_3.gameInfo
        L7_3 = L7_3.players
        L7_3 = L7_3[L5_3]
        L8_3 = L6_3.p
        L7_3.playerId = L8_3
        L7_3 = L0_1
        L7_3 = L7_3.data
        L7_3 = L7_3.gameInfo
        L7_3 = L7_3.players
        L7_3 = L7_3[L5_3]
        L8_3 = L6_3.c
        L7_3.customPowerUps = L8_3
        L7_3 = L0_1
        L7_3 = L7_3.data
        L7_3 = L7_3.gameInfo
        L7_3 = L7_3.players
        L7_3 = L7_3[L5_3]
        L8_3 = L6_3.b
        L7_3.clanState = L8_3
        L7_3 = L12_2
        L8_3 = tonumber
        L9_3 = L6_3.v
        L8_3 = L8_3(L9_3)
        L7_3[L5_3] = L8_3
        L7_3 = L6_3.n
        L8_3 = L6_3.b
        if L8_3 then
          L8_3 = L6_3.b
          L8_3 = L8_3.a
          L9_3 = "."
          L10_3 = L7_3
          L7_3 = L8_3 .. L9_3 .. L10_3
        end
        L8_3 = L0_1
        L8_3 = L8_3.fitText
        L9_3 = L7_3
        L10_3 = 14
        L11_3 = 95
        L8_3 = L8_3(L9_3, L10_3, L11_3)
        L7_3 = L8_3
        L8_3 = L33_2
        L9_3 = L5_3
        L10_3 = L6_3.a
        L11_3 = true
        L12_3 = L7_3
        L13_3 = L6_3.p
        L8_3(L9_3, L10_3, L11_3, L12_3, L13_3)
      else
        L6_3 = L12_2
        L6_3[L5_3] = 0
        L6_3 = L33_2
        L7_3 = L5_3
        L8_3 = nil
        L9_3 = false
        L10_3 = L0_1
        L10_3 = L10_3.localized
        L10_3 = L10_3.get
        L11_3 = "NotConnected"
        L10_3, L11_3, L12_3, L13_3 = L10_3(L11_3)
        L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
      end
    end
  end
  
  function L45_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L0_1
    L0_3 = L0_3.data
    L0_3 = L0_3.gameInfo
    L0_3 = L0_3.players
    L0_3 = #L0_3
    if L0_3 < 2 then
      return
    end
    L0_3 = 1
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.gameInfo
    L1_3 = L1_3.players
    L1_3 = #L1_3
    L2_3 = 1
    for L3_3 = L0_3, L1_3, L2_3 do
      L4_3 = L0_1
      L4_3 = L4_3.data
      L4_3 = L4_3.gameInfo
      L4_3 = L4_3.players
      L4_3 = L4_3[L3_3]
      L4_3 = L4_3.playerId
      L5_3 = L0_1
      L5_3 = L5_3.database
      L5_3 = L5_3.getPlayerInformation
      L5_3 = L5_3()
      L5_3 = L5_3.playerId
      if L4_3 ~= L5_3 then
        L4_3 = L0_1
        L4_3 = L4_3.data
        L5_3 = L0_1
        L5_3 = L5_3.data
        L5_3 = L5_3.gameInfo
        L5_3 = L5_3.players
        L5_3 = L5_3[L3_3]
        L5_3 = L5_3.playerId
        L4_3.teamMateId = L5_3
        return
      end
    end
  end
  
  function L46_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = L14_2
    if L1_3 then
      return
    end
    L1_3 = A0_3[1]
    L2_3 = L0_1
    L2_3 = L2_3.gameConfig
    L2_3 = L2_3.getMessageTypeForID
    L3_3 = L1_3
    L2_3 = L2_3(L3_3)
    L3_3 = system
    L3_3 = L3_3.getTimer
    L3_3 = L3_3()
    L7_2 = L3_3
    L3_3 = true
    L4_2 = L3_3
    if L2_3 == "CUSTOM_GAME_READY" then
      L3_3 = true
      L12_1 = L3_3
      L3_3 = L1_1
      L3_3 = L3_3.pauseReadFromBuffer
      L3_3()
      L3_3 = {}
      L3_3.effect = "crossFade"
      L3_3.time = 400
      L4_3 = {}
      L5_3 = L20_2
      L4_3.gameInfo = L5_3
      L5_3 = L21_2
      L4_3.showChest = L5_3
      L5_3 = L22_2
      L4_3.powerupTryCurrencyType = L5_3
      L3_3.params = L4_3
      L4_3 = L45_2
      L4_3()
      L4_3 = L0_1
      L4_3 = L4_3.gotoScene
      L5_3 = "lua.scenes.lobbyQuickPlay"
      L6_3 = L3_3
      L4_3(L5_3, L6_3)
    elseif L2_3 == "START_COUNTDOWN" then
    elseif L2_3 == "CREATE_OBJECT" then
      L3_3 = L10_1
      L3_3()
      A0_3[3] = nil
      L20_2 = A0_3
      L3_3 = L44_2
      L4_3 = A0_3
      L3_3(L4_3)
    elseif L2_3 == "CUSTOM_GAME_SESSION_ID" then
      L3_3 = L0_1
      L3_3 = L3_3.gameHostData
      L4_3 = A0_3[2]
      L3_3.sessionId = L4_3
      L3_3 = L14_1
      if L3_3 then
        L3_3 = L0_1
        L3_3 = L3_3.comm
        L3_3 = L3_3.inviteFriendToGame
        L4_3 = L14_1
        L5_3 = L0_1
        L5_3 = L5_3.gameHostData
        L5_3 = L5_3.sessionId
        L6_3 = L0_1
        L6_3 = L6_3.gameHostData
        L6_3 = L6_3.serverAddress
        L3_3(L4_3, L5_3, L6_3)
      end
    elseif L2_3 == "TOGGLE_RANDOM_PLAYERS" then
    elseif L2_3 == "CHAT_START_TYPING" then
      L3_3 = L0_1
      L3_3 = L3_3.database
      L3_3 = L3_3.getChat
      L3_3 = L3_3()
      if L3_3 == 0 then
        return
      end
      L3_3 = L31_2
      L4_3 = A0_3[2]
      L3_3(L4_3)
    elseif L2_3 == "CHAT_STOP_TYPING" then
      L3_3 = L0_1
      L3_3 = L3_3.database
      L3_3 = L3_3.getChat
      L3_3 = L3_3()
      if L3_3 == 0 then
        return
      end
      L3_3 = L27_2
      L4_3 = A0_3[2]
      L3_3(L4_3)
    elseif L2_3 == "CHAT" then
      L3_3 = L0_1
      L3_3 = L3_3.database
      L3_3 = L3_3.getChat
      L3_3 = L3_3()
      if L3_3 == 0 then
        return
      end
      L3_3 = A0_3[2]
      L4_3 = L0_1
      L4_3 = L4_3.chatListener
      if L4_3 then
        L4_3 = L0_1
        L4_3 = L4_3.data
        L4_3 = L4_3.chatLog
        L5_3 = L0_1
        L5_3 = L5_3.data
        L5_3 = L5_3.chatLog
        L5_3 = #L5_3
        L5_3 = L5_3 + 1
        L4_3[L5_3] = A0_3
        L4_3 = L0_1
        L4_3 = L4_3.chatListener
        L5_3 = A0_3
        L4_3(L5_3)
        L4_3 = 0
        L9_1 = L4_3
      else
        L4_3 = L0_1
        L4_3 = L4_3.data
        L4_3 = L4_3.chatLog
        L5_3 = L0_1
        L5_3 = L5_3.data
        L5_3 = L5_3.chatLog
        L5_3 = #L5_3
        L5_3 = L5_3 + 1
        L4_3[L5_3] = A0_3
        L4_3 = L19_2
        L4_3 = L4_3.playerMessage
        L4_3 = L4_3()
        if L3_3 == L4_3 then
          L4_3 = L0_1
          L4_3 = L4_3.audio
          L4_3 = L4_3.play
          L5_3 = "message_received"
          L4_3(L5_3)
          L4_3 = L9_1
          L4_3 = L4_3 + 1
          L9_1 = L4_3
        end
      end
      L4_3 = L41_2
      L4_3()
    elseif L2_3 == "SET_CLOCK" then
      L3_3 = A0_3[2]
      L4_3 = L42_2
      L5_3 = L3_3
      L4_3(L5_3)
    elseif L2_3 == "HOST_LEFT_GAME" then
      L3_3 = L43_2
      L3_3()
      L3_3 = L0_1
      L3_3 = L3_3.createCustomOverlay
      L4_3 = 7
      L3_3(L4_3)
    elseif L2_3 == "KICKED" then
      L3_3 = L43_2
      L3_3()
      L3_3 = L0_1
      L3_3 = L3_3.createCustomOverlay
      L4_3 = 8
      L3_3(L4_3)
    elseif L2_3 == "CUSTOM_GAME_UNAVAILABLE" then
      L3_3 = L43_2
      L3_3()
      L3_3 = L0_1
      L3_3 = L3_3.createCustomOverlay
      L4_3 = 6
      L3_3(L4_3)
    elseif L2_3 == "CUSTOM_GAME_ALREADY_STARTED" then
      L3_3 = L43_2
      L3_3()
      L3_3 = L0_1
      L3_3 = L3_3.createCustomOverlay
      L4_3 = 34
      L3_3(L4_3)
    elseif L2_3 == "CUSTOM_GAME_FULL" then
      L3_3 = L43_2
      L3_3()
      L3_3 = L0_1
      L3_3 = L3_3.createCustomOverlay
      L4_3 = 33
      L3_3(L4_3)
    elseif L2_3 == "PING" then
    elseif L2_3 == "HANDSHAKE" then
    elseif L2_3 == "POWER_UP_UPGRADE_OFFER" then
      L3_3 = true
      L21_2 = L3_3
      L3_3 = A0_3[2]
      if not L3_3 then
        L3_3 = 0
      end
      L22_2 = L3_3
    elseif L2_3 then
      L3_3 = print
      L4_3 = "ERROR NETWORK: Uncaught messagetype: "
      L5_3 = L2_3
      L3_3(L4_3, L5_3)
    elseif L1_3 then
      L3_3 = print
      L4_3 = "ERROR NETWORK: Uncaught messageid: "
      L5_3 = L1_3
      L3_3(L4_3, L5_3)
    else
      L3_3 = print
      L4_3 = "ERROR NETWORK: Got this stuff, dunno what to do: "
      L5_3 = A0_3
      L3_3(L4_3, L5_3)
    end
  end
  
  function L47_2(A0_3)
    local L1_3, L2_3
    L1_3 = L14_2
    if L1_3 then
      return
    end
    L1_3 = A0_3.m
    L2_3 = L18_2
    L2_3 = L2_3.hostGame
    L2_3 = L2_3()
    if L1_3 == L2_3 then
      L1_3 = A0_3.r
      if L1_3 then
        L1_3 = L1_1
        L1_3 = L1_3.stopTCPClient
        L1_3()
        L1_3 = L0_1
        L1_3 = L1_3.gotoScene
        L2_3 = "lua.scenes.playMenu"
        L1_3(L2_3)
        return
      end
      L1_3 = L0_1
      L1_3 = L1_3.gameHostData
      L2_3 = A0_3.a
      L1_3.serverAddress = L2_3
      L1_3 = L0_1
      L1_3 = L1_3.config
      L2_3 = A0_3.a
      L1_3.tcpClient = L2_3
      L1_3 = L1_1
      L1_3 = L1_3.startTCP
      L2_3 = L46_2
      L1_3(L2_3)
    else
      L1_3 = A0_3.m
      L2_3 = L18_2
      L2_3 = L2_3.playerStateUpdate
      L2_3 = L2_3()
      if L1_3 == L2_3 then
        L1_3 = L7_1
        L1_3()
      else
        L1_3 = A0_3.m
        L2_3 = L18_2
        L2_3 = L2_3.addFacebookFriend
        L2_3 = L2_3()
        if L1_3 == L2_3 then
          L1_3 = L7_1
          L1_3()
        else
          L1_3 = A0_3.m
          L2_3 = L18_2
          L2_3 = L2_3.recieveDeletedFriend
          L2_3 = L2_3()
          if L1_3 == L2_3 then
            L1_3 = L7_1
            L1_3()
          else
            L1_3 = A0_3.m
            L2_3 = L18_2
            L2_3 = L2_3.recieveAcceptedFriendRequest
            L2_3 = L2_3()
            if L1_3 == L2_3 then
              L1_3 = L7_1
              L1_3()
            end
          end
        end
      end
    end
  end
  
  L48_2 = L2_1
  
  function L49_2(A0_3)
    local L1_3, L2_3
    L1_3 = L0_1
    L1_3 = L1_3.comm
    L1_3 = L1_3.setCallback
    L2_3 = L47_2
    L1_3(L2_3)
    L1_3 = L7_1
    if L1_3 then
      L1_3 = L7_1
      L1_3()
    end
  end
  
  L48_2.overlayEnded = L49_2
  
  function L48_2()
    local L0_3, L1_3, L2_3
    L0_3 = L0_1
    L0_3 = L0_3.comm
    L0_3 = L0_3.setCallback
    L1_3 = L47_2
    L0_3(L1_3)
    L0_3 = L0_1
    L0_3 = L0_3.data
    L0_3 = L0_3.gameInfo
    L0_3 = L0_3.gameType
    if L0_3 == 5 then
      L0_3 = L0_1
      L0_3 = L0_3.gameHostData
      L0_3 = L0_3.serverAddress
      if L0_3 then
        L0_3 = L0_1
        L0_3 = L0_3.gameHostData
        L1_3 = L0_1
        L1_3 = L1_3.config
        L1_3 = L1_3.tcpClient
        L0_3.serverAddress = L1_3
        L0_3 = L1_1
        L0_3 = L0_3.setReceiveFunction
        L1_3 = L46_2
        L0_3(L1_3)
        L0_3 = L1_1
        L0_3 = L0_3.sendRejoinGame
        L0_3()
      else
        L0_3 = L0_1
        L0_3 = L0_3.comm
        L0_3 = L0_3.hostGame
        L1_3 = 1
        L0_3(L1_3)
      end
    else
      L0_3 = L0_1
      L0_3 = L0_3.data
      L0_3 = L0_3.gameInfo
      L0_3 = L0_3.gameType
      if L0_3 == 6 then
        L0_3 = L1_1
        L0_3 = L0_3.startTCP
        L1_3 = L46_2
        L0_3(L1_3)
      else
        L0_3 = print
        L1_3 = "WARNING: gameType is "
        L2_3 = L0_1
        L2_3 = L2_3.data
        L2_3 = L2_3.gameInfo
        L2_3 = L2_3.gameType
        L0_3(L1_3, L2_3)
      end
    end
  end
  
  L49_2 = timer
  L49_2 = L49_2.performWithDelay
  L50_2 = 8000
  L51_2 = L39_2
  L52_2 = 1
  L49_2 = L49_2(L50_2, L51_2, L52_2)
  L6_2 = L49_2
  L49_2 = timer
  L49_2 = L49_2.performWithDelay
  L50_2 = 6000
  L51_2 = L38_2
  L52_2 = 0
  L49_2 = L49_2(L50_2, L51_2, L52_2)
  
  function L50_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = true
    L14_2 = L0_3
    L0_3 = L12_1
    if not L0_3 then
      L0_3 = L1_1
      L0_3 = L0_3.stopTCPClient
      L0_3()
    end
    L0_3 = L17_2
    L0_3 = L0_3.removeBackButton
    L0_3()
    L0_3 = pairs
    L1_3 = L15_2
    L0_3, L1_3, L2_3 = L0_3(L1_3)
    for L3_3, L4_3 in L0_3, L1_3, L2_3 do
      L5_3 = L4_3.clean
      L5_3()
    end
    L0_3 = L6_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L6_2
      L0_3(L1_3)
      L0_3 = nil
      L6_2 = L0_3
    end
    L0_3 = L49_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L49_2
      L0_3(L1_3)
      L0_3 = nil
      L49_2 = L0_3
    end
    L0_3 = L40_2
    L0_3()
  end
  
  L4_1 = L50_2
  L50_2 = L48_2
  L50_2()
end

L2_1.show = L20_1

function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2.phase
  if L2_2 == "did" then
    L3_2 = L0_1
    L3_2 = L3_2.removeScene
    L4_2 = "lua.scenes.lobby2v2Play"
    L3_2(L4_2)
    return
  end
  L3_2 = L4_1
  if L3_2 then
    L3_2 = L4_1
    L3_2()
    L3_2 = nil
    L4_1 = L3_2
  end
end

L2_1.hide = L20_1

function L20_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L3_1
  if L2_2 then
    L2_2 = L3_1
    L2_2()
    L2_2 = nil
    L3_1 = L2_2
  end
  L2_2 = L13_1
  if L2_2 then
    L2_2 = native
    L2_2 = L2_2.setKeyboardFocus
    L3_2 = nil
    L2_2(L3_2)
  end
  L2_2 = nil
  L10_1 = L2_2
  L2_2 = nil
  L11_1 = L2_2
  L2_2 = nil
  L12_1 = L2_2
  L2_2 = nil
  L14_1 = L2_2
end

L2_1.destroy = L20_1
L21_1 = L2_1
L20_1 = L2_1.addEventListener
L22_1 = "create"
L23_1 = L2_1
L20_1(L21_1, L22_1, L23_1)
L21_1 = L2_1
L20_1 = L2_1.addEventListener
L22_1 = "show"
L23_1 = L2_1
L20_1(L21_1, L22_1, L23_1)
L21_1 = L2_1
L20_1 = L2_1.addEventListener
L22_1 = "hide"
L23_1 = L2_1
L20_1(L21_1, L22_1, L23_1)
L21_1 = L2_1
L20_1 = L2_1.addEventListener
L22_1 = "destroy"
L23_1 = L2_1
L20_1(L21_1, L22_1, L23_1)
return L2_1
