local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2
  L2_2 = A0_2.view
  L3_2 = A1_2.params
  if not L3_2 then
    L3_2 = {}
    A1_2.params = L3_2
  end
  L3_2 = display
  L3_2 = L3_2.newGroup
  L3_2 = L3_2()
  L4_2 = display
  L4_2 = L4_2.newGroup
  L4_2 = L4_2()
  L5_2 = require
  L6_2 = "lua.network.tcpMessageFormat"
  L5_2 = L5_2(L6_2)
  L6_2 = require
  L7_2 = "lua.modules.tableHelper"
  L6_2 = L6_2(L7_2)
  L7_2 = require
  L8_2 = "lua.modules.clans.clanStatOverview"
  L7_2 = L7_2(L8_2)
  L8_2 = display
  L8_2 = L8_2.newGroup
  L8_2 = L8_2()
  L9_2 = nil
  L10_2 = true
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
  L13_2 = "images/gui/clan_v2/create_clan/createWindow.png"
  L14_2 = 321
  L15_2 = 262
  L12_2 = L12_2(L13_2, L14_2, L15_2)
  L13_2 = display
  L13_2 = L13_2.contentWidth
  L13_2 = L13_2 * 0.5
  L12_2.x = L13_2
  L12_2.anchorY = 0
  L12_2.y = 0
  L13_2 = display
  L13_2 = L13_2.newImageRect
  L14_2 = "images/gui/clan_v2/create_clan/InfoBG.png"
  L15_2 = 268
  L16_2 = 178
  L13_2 = L13_2(L14_2, L15_2, L16_2)
  L14_2 = L12_2.x
  L13_2.x = L14_2
  L14_2 = L12_2.y
  L15_2 = L12_2.height
  L15_2 = L15_2 * 0.5
  L14_2 = L14_2 + L15_2
  L13_2.y = L14_2
  L14_2 = L0_1
  L14_2 = L14_2.newText
  L15_2 = {}
  L16_2 = L0_1
  L16_2 = L16_2.localized
  L16_2 = L16_2.get
  L17_2 = "clanInfoSocial"
  L16_2 = L16_2(L17_2)
  L15_2.string = L16_2
  L16_2 = L13_2.x
  L16_2 = L16_2 - 70
  L15_2.x = L16_2
  L16_2 = L13_2.y
  L16_2 = L16_2 - 50
  L15_2.y = L16_2
  L15_2.ax = 0
  L15_2.size = 13
  L16_2 = {}
  L17_2 = 0
  L18_2 = 0
  L19_2 = 0
  L16_2[1] = L17_2
  L16_2[2] = L18_2
  L16_2[3] = L19_2
  L15_2.color = L16_2
  L15_2.width = 165
  L14_2 = L14_2(L15_2)
  L15_2 = L0_1
  L15_2 = L15_2.newText
  L16_2 = {}
  L17_2 = L0_1
  L17_2 = L17_2.localized
  L17_2 = L17_2.get
  L18_2 = "clanInfoRewards"
  L17_2 = L17_2(L18_2)
  L16_2.string = L17_2
  L17_2 = L13_2.x
  L17_2 = L17_2 - 70
  L16_2.x = L17_2
  L17_2 = L13_2.y
  L17_2 = L17_2 - 4
  L16_2.y = L17_2
  L16_2.ax = 0
  L16_2.size = 13
  L17_2 = {}
  L18_2 = 0
  L19_2 = 0
  L20_2 = 0
  L17_2[1] = L18_2
  L17_2[2] = L19_2
  L17_2[3] = L20_2
  L16_2.color = L17_2
  L16_2.width = 165
  L15_2 = L15_2(L16_2)
  L16_2 = L0_1
  L16_2 = L16_2.newText
  L17_2 = {}
  L18_2 = L0_1
  L18_2 = L18_2.localized
  L18_2 = L18_2.get
  L19_2 = "clanInfo2v2"
  L18_2 = L18_2(L19_2)
  L17_2.string = L18_2
  L18_2 = L13_2.x
  L18_2 = L18_2 - 70
  L17_2.x = L18_2
  L18_2 = L13_2.y
  L18_2 = L18_2 + 42
  L17_2.y = L18_2
  L17_2.ax = 0
  L17_2.size = 13
  L18_2 = {}
  L19_2 = 0
  L20_2 = 0
  L21_2 = 0
  L18_2[1] = L19_2
  L18_2[2] = L20_2
  L18_2[3] = L21_2
  L17_2.color = L18_2
  L17_2.width = 165
  L16_2 = L16_2(L17_2)
  L3_2.isVisible = false
  L17_2 = L0_1
  L17_2 = L17_2.newText
  L18_2 = {}
  L19_2 = L0_1
  L19_2 = L19_2.localized
  L19_2 = L19_2.get
  L20_2 = "Clans"
  L19_2 = L19_2(L20_2)
  L18_2.string = L19_2
  L19_2 = L12_2.x
  L18_2.x = L19_2
  L19_2 = L12_2.y
  L19_2 = L19_2 + 18
  L18_2.y = L19_2
  L18_2.size = 25
  L19_2 = {}
  L20_2 = 1
  L21_2 = 1
  L22_2 = 1
  L19_2[1] = L20_2
  L19_2[2] = L21_2
  L19_2[3] = L22_2
  L18_2.color = L19_2
  L18_2.align = "center"
  L17_2 = L17_2(L18_2)
  L18_2 = 270
  L19_2 = 163
  L20_2 = display
  L20_2 = L20_2.newRect
  L21_2 = L12_2.x
  L22_2 = 0.5 * L18_2
  L21_2 = L21_2 - L22_2
  L22_2 = 52
  L23_2 = L18_2
  L24_2 = L19_2 - 1
  L20_2 = L20_2(L21_2, L22_2, L23_2, L24_2)
  L20_2.anchorX = 0
  L20_2.anchorY = 0
  L22_2 = L20_2
  L21_2 = L20_2.setFillColor
  L23_2 = 0.9568627450980393
  L24_2 = 0.8862745098039215
  L25_2 = 0.7725490196078432
  L21_2(L22_2, L23_2, L24_2, L25_2)
  L21_2 = 256
  L22_2 = display
  L22_2 = L22_2.newGroup
  L22_2 = L22_2()
  L22_2.anchorX = 0
  L23_2 = L20_2.x
  L24_2 = L18_2 - L21_2
  L24_2 = L24_2 * 0.5
  L23_2 = L23_2 + L24_2
  L22_2.x = L23_2
  L23_2 = L20_2.y
  L23_2 = L23_2 + 3
  L22_2.y = L23_2
  L23_2 = display
  L23_2 = L23_2.newImageRect
  L24_2 = "images/gui/clan_v2/member_list/topBar.png"
  L25_2 = L21_2
  L26_2 = 16
  L23_2 = L23_2(L24_2, L25_2, L26_2)
  L23_2.anchorX = 0
  L23_2.anchorY = 0
  L25_2 = L22_2
  L24_2 = L22_2.insert
  L26_2 = L23_2
  L24_2(L25_2, L26_2)
  L24_2 = L0_1
  L24_2 = L24_2.newText
  L25_2 = {}
  L26_2 = L0_1
  L26_2 = L26_2.localized
  L26_2 = L26_2.get
  L27_2 = "Clan Name"
  L26_2 = L26_2(L27_2)
  L25_2.string = L26_2
  L26_2 = L22_2.x
  L26_2 = L26_2 - 96
  L25_2.x = L26_2
  L25_2.y = 2
  L25_2.size = 8
  L26_2 = {}
  L27_2 = 0.48627450980392156
  L28_2 = 0.4470588235294118
  L29_2 = 0.3843137254901961
  L26_2[1] = L27_2
  L26_2[2] = L28_2
  L26_2[3] = L29_2
  L25_2.color = L26_2
  L25_2.align = "center"
  L25_2.ax = 0
  L25_2.ay = 0
  L24_2 = L24_2(L25_2)
  L26_2 = L22_2
  L25_2 = L22_2.insert
  L27_2 = L24_2
  L25_2(L26_2, L27_2)
  L25_2 = L0_1
  L25_2 = L25_2.newText
  L26_2 = {}
  L27_2 = L0_1
  L27_2 = L27_2.localized
  L27_2 = L27_2.get
  L28_2 = "Members"
  L27_2 = L27_2(L28_2)
  L26_2.string = L27_2
  L27_2 = L22_2.x
  L26_2.x = L27_2
  L26_2.y = 2
  L26_2.size = 8
  L27_2 = {}
  L28_2 = 0.48627450980392156
  L29_2 = 0.4470588235294118
  L30_2 = 0.3843137254901961
  L27_2[1] = L28_2
  L27_2[2] = L29_2
  L27_2[3] = L30_2
  L26_2.color = L27_2
  L26_2.align = "center"
  L26_2.ax = 0
  L26_2.ay = 0
  L25_2 = L25_2(L26_2)
  L27_2 = L22_2
  L26_2 = L22_2.insert
  L28_2 = L25_2
  L26_2(L27_2, L28_2)
  L26_2 = L0_1
  L26_2 = L26_2.newText
  L27_2 = {}
  L28_2 = L0_1
  L28_2 = L28_2.localized
  L28_2 = L28_2.get
  L29_2 = "Type"
  L28_2 = L28_2(L29_2)
  L27_2.string = L28_2
  L28_2 = L22_2.x
  L28_2 = L28_2 + 40
  L27_2.x = L28_2
  L27_2.y = 2
  L27_2.size = 8
  L28_2 = {}
  L29_2 = 0.48627450980392156
  L30_2 = 0.4470588235294118
  L31_2 = 0.3843137254901961
  L28_2[1] = L29_2
  L28_2[2] = L30_2
  L28_2[3] = L31_2
  L27_2.color = L28_2
  L27_2.align = "center"
  L27_2.ax = 0
  L27_2.ay = 0
  L26_2 = L26_2(L27_2)
  L28_2 = L22_2
  L27_2 = L22_2.insert
  L29_2 = L26_2
  L27_2(L28_2, L29_2)
  L27_2 = L0_1
  L27_2 = L27_2.newText
  L28_2 = {}
  L29_2 = L0_1
  L29_2 = L29_2.localized
  L29_2 = L29_2.get
  L30_2 = "Info"
  L29_2 = L29_2(L30_2)
  L28_2.string = L29_2
  L29_2 = L22_2.x
  L29_2 = L29_2 + 120
  L28_2.x = L29_2
  L28_2.y = 2
  L28_2.size = 8
  L29_2 = {}
  L30_2 = 0.48627450980392156
  L31_2 = 0.4470588235294118
  L32_2 = 0.3843137254901961
  L29_2[1] = L30_2
  L29_2[2] = L31_2
  L29_2[3] = L32_2
  L28_2.color = L29_2
  L28_2.align = "center"
  L28_2.ax = 0
  L28_2.ay = 0
  L27_2 = L27_2(L28_2)
  L29_2 = L22_2
  L28_2 = L22_2.insert
  L30_2 = L27_2
  L28_2(L29_2, L30_2)
  L28_2 = display
  L28_2 = L28_2.newImageRect
  L29_2 = "images/gui/clan_v2/create_clan/openClanBorder.png"
  L30_2 = L18_2 + 1
  L31_2 = L19_2 + 1
  L28_2 = L28_2(L29_2, L30_2, L31_2)
  L28_2.anchorX = 0
  L28_2.anchorY = 0
  L29_2 = L20_2.x
  L28_2.x = L29_2
  L29_2 = L20_2.y
  L28_2.y = L29_2
  L29_2 = L0_1
  L29_2 = L29_2.newText
  L30_2 = {}
  L31_2 = L0_1
  L31_2 = L31_2.localized
  L31_2 = L31_2.get
  L32_2 = "Join an Open Clan"
  L31_2 = L31_2(L32_2)
  L30_2.string = L31_2
  L31_2 = L12_2.x
  L30_2.x = L31_2
  L31_2 = L20_2.y
  L31_2 = L31_2 - 7
  L30_2.y = L31_2
  L30_2.size = 14
  L31_2 = {}
  L32_2 = 1
  L33_2 = 1
  L34_2 = 1
  L31_2[1] = L32_2
  L31_2[2] = L33_2
  L31_2[3] = L34_2
  L30_2.color = L31_2
  L30_2.align = "center"
  L29_2 = L29_2(L30_2)
  L30_2 = L0_1
  L30_2 = L30_2.newText
  L31_2 = {}
  L32_2 = L0_1
  L32_2 = L32_2.localized
  L32_2 = L32_2.get
  L33_2 = "or"
  L32_2 = L32_2(L33_2)
  L31_2.string = L32_2
  L32_2 = L12_2.x
  L31_2.x = L32_2
  L32_2 = L20_2.y
  L32_2 = L32_2 + L19_2
  L32_2 = L32_2 + 10
  L31_2.y = L32_2
  L31_2.size = 14
  L32_2 = {}
  L33_2 = 1
  L34_2 = 1
  L35_2 = 1
  L32_2[1] = L33_2
  L32_2[2] = L34_2
  L32_2[3] = L35_2
  L31_2.color = L32_2
  L31_2.align = "center"
  L30_2 = L30_2(L31_2)
  
  function L31_2(A0_3)
    local L1_3, L2_3
    L1_3 = L0_1
    L1_3 = L1_3.comm
    L1_3 = L1_3.getClanInfo
    L2_3 = A0_3
    L1_3(L2_3)
  end
  
  L32_2 = L6_2.new
  L33_2 = L20_2.x
  L34_2 = L20_2.y
  L35_2 = L20_2.width
  L36_2 = L20_2.height
  L37_2 = 30
  L38_2 = nil
  L39_2 = "openClans"
  L40_2 = L31_2
  L41_2 = 22
  L42_2 = nil
  L43_2 = 20
  L32_2 = L32_2(L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2)
  L33_2 = L32_2.createTable
  L34_2 = {}
  L35_2 = L4_2
  L33_2(L34_2, L35_2)
  L33_2 = L7_2.create
  L34_2 = false
  L33_2 = L33_2(L34_2)
  L34_2 = L33_2.hide
  L34_2()
  
  function L34_2()
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
  
  function L35_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = {}
    L0_3.isModal = true
    L1_3 = {}
    L0_3.params = L1_3
    L1_3 = L0_1
    L1_3 = L1_3.showOverlay
    L2_3 = "lua.overlays.clanCreate"
    L3_3 = L0_3
    L1_3(L2_3, L3_3)
  end
  
  function L36_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.comm
    L0_3 = L0_3.getOpenClans
    L0_3()
  end
  
  function L37_2()
    local L0_3, L1_3
    L0_3 = L3_2
    L0_3 = L0_3.isVisible
    if L0_3 then
      L0_3 = L3_2
      L0_3.isVisible = false
      L0_3 = L4_2
      L0_3.isVisible = true
    else
      L0_3 = L3_2
      L0_3.isVisible = true
      L0_3 = L4_2
      L0_3.isVisible = false
    end
  end
  
  L38_2 = L0_1
  L38_2 = L38_2.newButton
  L39_2 = {}
  L40_2 = L12_2.x
  L39_2.x = L40_2
  L39_2.y = 262
  L39_2.width = 126
  L39_2.height = 40
  L40_2 = {}
  L41_2 = L0_1
  L41_2 = L41_2.localized
  L41_2 = L41_2.get
  L42_2 = "Create New Clan"
  L41_2 = L41_2(L42_2)
  L40_2.string = L41_2
  L40_2.size = 14
  L39_2.text = L40_2
  L39_2.image = "images/gui/common/buttonTextB.png"
  L39_2.onRelease = L35_2
  L38_2 = L38_2(L39_2)
  L39_2 = L0_1
  L39_2 = L39_2.newButton
  L40_2 = {}
  L41_2 = L12_2.x
  L41_2 = L41_2 - 150
  L40_2.x = L41_2
  L41_2 = L12_2.y
  L41_2 = L41_2 + 22
  L40_2.y = L41_2
  L40_2.width = 38
  L40_2.height = 40
  L40_2.image = "images/gui/clan_v2/create_clan/buttonRefresh.png"
  L40_2.onRelease = L36_2
  L39_2 = L39_2(L40_2)
  L40_2 = L0_1
  L40_2 = L40_2.newButton
  L41_2 = {}
  L42_2 = L12_2.x
  L42_2 = L42_2 + 68
  L41_2.x = L42_2
  L42_2 = L12_2.y
  L42_2 = L42_2 + 18
  L41_2.y = L42_2
  L41_2.width = 25
  L41_2.height = 25
  L41_2.image = "images/gui/clan_v2/create_clan/buttonInfo.png"
  L41_2.onRelease = L37_2
  L40_2 = L40_2(L41_2)
  L41_2 = L0_1
  L41_2 = L41_2.newButton
  L42_2 = {}
  L43_2 = L12_2.x
  L42_2.x = L43_2
  L43_2 = L12_2.y
  L44_2 = L12_2.height
  L43_2 = L43_2 + L44_2
  L43_2 = L43_2 - 35
  L42_2.y = L43_2
  L43_2 = L0_1
  L43_2 = L43_2.localized
  L43_2 = L43_2.get
  L44_2 = "OK"
  L43_2 = L43_2(L44_2)
  L42_2.text = L43_2
  L42_2.width = 62
  L42_2.height = 37
  L42_2.image = "images/gui/ranking/promotion/buttonOk.png"
  L42_2.onRelease = L37_2
  L41_2 = L41_2(L42_2)
  
  function L42_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L1_3 = {}
    L2_3 = 1
    L3_3 = #A0_3
    L4_3 = 1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = A0_3[L5_3]
      L7_3 = {}
      L8_3 = L6_3._id
      if L8_3 == nil then
        L8_3 = string
        L8_3 = L8_3.gsub
        L9_3 = L6_3.a
        L9_3 = L9_3.b
        L10_3 = " "
        L11_3 = ""
        L8_3 = L8_3(L9_3, L10_3, L11_3)
        L7_3.name = L8_3
        L8_3 = L6_3.a
        L8_3 = L8_3._id
        L7_3.id = L8_3
        L8_3 = L6_3.a
        L8_3 = L8_3.c
        L7_3.emblemData = L8_3
        L8_3 = L0_1
        L8_3 = L8_3.clanUtils
        L8_3 = L8_3.getAttitudeString
        L9_3 = L6_3.b
        L9_3 = L9_3 + 1
        L8_3 = L8_3(L9_3)
        L7_3.attitude = L8_3
        L8_3 = L6_3.c
        L7_3.members = L8_3
      else
        L8_3 = string
        L8_3 = L8_3.gsub
        L9_3 = L6_3.b
        L10_3 = " "
        L11_3 = ""
        L8_3 = L8_3(L9_3, L10_3, L11_3)
        L7_3.name = L8_3
        L8_3 = L6_3._id
        L7_3.id = L8_3
        L8_3 = L6_3.c
        L7_3.emblemData = L8_3
      end
      L8_3 = #L1_3
      L8_3 = L8_3 + 1
      L1_3[L8_3] = L7_3
    end
    return L1_3
  end
  
  function L43_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = A0_3.m
    L2_3 = L5_2
    L2_3 = L2_3.getOpenClans
    L2_3 = L2_3()
    if L1_3 == L2_3 then
      L1_3 = A0_3.a
      if L1_3 then
        L2_3 = L32_2
        L2_3 = L2_3.refreshTable
        L3_3 = L42_2
        L4_3 = L1_3
        L3_3 = L3_3(L4_3)
        L4_3 = L4_2
        L2_3(L3_3, L4_3)
        L2_3 = L22_2
        L3_3 = L2_3
        L2_3 = L2_3.toFront
        L2_3(L3_3)
        L2_3 = L28_2
        L3_3 = L2_3
        L2_3 = L2_3.toFront
        L2_3(L3_3)
      end
    else
      L1_3 = A0_3.m
      L2_3 = L5_2
      L2_3 = L2_3.getClanInfo
      L2_3 = L2_3()
      if L1_3 == L2_3 then
        L1_3 = L33_2
        L1_3 = L1_3.updateClanId
        L2_3 = A0_3.a
        L2_3 = L2_3.a
        L2_3 = L2_3._id
        L1_3(L2_3)
        L1_3 = L33_2
        L1_3 = L1_3.updateClanName
        L2_3 = A0_3.a
        L2_3 = L2_3.a
        L2_3 = L2_3.b
        L1_3(L2_3)
        L1_3 = L33_2
        L1_3 = L1_3.updateClanEmblem
        L2_3 = A0_3.a
        L2_3 = L2_3.a
        L2_3 = L2_3.c
        L1_3(L2_3)
        L1_3 = L33_2
        L1_3 = L1_3.updateClanLevel
        L2_3 = A0_3.a
        L2_3 = L2_3.i
        L3_3 = A0_3.a
        L3_3 = L3_3.h
        L1_3(L2_3, L3_3)
        L1_3 = L33_2
        L1_3 = L1_3.updateClanLeagueData
        L2_3 = A0_3.b
        L1_3(L2_3)
        L1_3 = L33_2
        L1_3 = L1_3.updateClanStats
        L2_3 = A0_3.a
        L1_3(L2_3)
        L1_3 = L33_2
        L1_3 = L1_3.updateClanRating
        L2_3 = A0_3.a
        L2_3 = L2_3.g
        L1_3(L2_3)
        L1_3 = L33_2
        L1_3 = L1_3.updateClanAttitude
        L2_3 = tonumber
        L3_3 = A0_3.a
        L3_3 = L3_3.r
        L2_3 = L2_3(L3_3)
        if not L2_3 then
          L2_3 = 0
        end
        L2_3 = L2_3 + 1
        L1_3(L2_3)
        L1_3 = L2_2
        L2_3 = L1_3
        L1_3 = L1_3.insert
        L3_3 = L33_2
        L1_3(L2_3, L3_3)
        L1_3 = L33_2
        L1_3 = L1_3.show
        L1_3()
        L1_3 = A0_3.c
        if L1_3 then
          L1_3 = 5
          L2_3 = L0_1
          L2_3 = L2_3.currentLeague
          if L2_3 then
            L2_3 = tonumber
            L3_3 = L0_1
            L3_3 = L3_3.currentLeague
            L2_3 = L2_3(L3_3)
            L1_3 = L2_3
          end
          L2_3 = L33_2
          L2_3 = L2_3.setJoinClanButtonVisible
          L3_3 = tonumber
          L4_3 = A0_3.c
          L3_3 = L3_3(L4_3)
          L3_3 = L1_3 <= L3_3
          L2_3(L3_3)
          L2_3 = L0_1
          L2_3 = L2_3.awards
          L2_3 = L2_3.getLeagueNameText
          L3_3 = A0_3.c
          L3_3 = L3_3 + 1
          L2_3 = L2_3(L3_3)
          L3_3 = L33_2
          L3_3 = L3_3.setRequiresText
          L4_3 = "(MUST BE "
          L5_3 = L2_3
          L6_3 = " TO JOIN)"
          L4_3 = L4_3 .. L5_3 .. L6_3
          L3_3(L4_3)
        else
          L1_3 = L33_2
          L1_3 = L1_3.setJoinClanButtonVisible
          L2_3 = true
          L1_3(L2_3)
          L1_3 = L33_2
          L1_3 = L1_3.setRequiresText
          L2_3 = ""
          L1_3(L2_3)
        end
      else
        L1_3 = A0_3.m
        L2_3 = L5_2
        L2_3 = L2_3.joinOpenClan
        L2_3 = L2_3()
        if L1_3 == L2_3 then
          L1_3 = A0_3.r
          if L1_3 then
            return
          end
          L1_3 = L0_1
          L1_3 = L1_3.gotoScene
          L2_3 = "lua.scenes.clanScene"
          L1_3(L2_3)
          L1_3 = L0_1
          L1_3 = L1_3.hideOverlay
          L1_3()
        end
      end
    end
  end
  
  function L44_2()
    local L0_3, L1_3
    L0_3 = true
    L10_2 = L0_3
  end
  
  function L45_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
    L0_3 = true
    return L0_3
  end
  
  L46_2 = L0_1
  L46_2 = L46_2.newButton
  L47_2 = {}
  L47_2.image = "images/gui/common/buttonClosePopupBrown.png"
  L47_2.onRelease = L45_2
  L47_2.width = 43
  L47_2.height = 38
  L48_2 = L12_2.x
  L48_2 = L48_2 + 220
  L47_2.x = L48_2
  L48_2 = L12_2.y
  L48_2 = L48_2 + -108
  L47_2.y = L48_2
  L46_2 = L46_2(L47_2)
  
  function L47_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = L0_1
      L1_3 = L1_3.hideOverlay
      L1_3()
      L1_3 = native
      L1_3 = L1_3.setKeyboardFocus
      L2_3 = nil
      L1_3(L2_3)
    end
    L1_3 = true
    return L1_3
  end
  
  function L48_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = native
      L1_3 = L1_3.setKeyboardFocus
      L2_3 = nil
      L1_3(L2_3)
    end
    L1_3 = true
    return L1_3
  end
  
  function L49_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L47_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L12_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L48_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L50_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
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
    L2_3 = L17_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L46_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L13_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L14_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L16_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L41_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L20_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L28_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L29_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L22_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L30_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L39_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L40_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L38_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L3_2
    L0_3(L1_3, L2_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L4_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
  end
  
  function L51_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L46_2
    L0_3(L1_3)
    L0_3 = native
    L0_3 = L0_3.setKeyboardFocus
    L1_3 = nil
    L0_3(L1_3)
    L0_3 = L34_2
    L0_3()
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L47_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L12_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L48_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L51_2
  L51_2 = L50_2
  L51_2()
  L51_2 = L49_2
  L51_2()
  L51_2 = L0_1
  L51_2 = L51_2.comm
  L51_2 = L51_2.setCallback
  L52_2 = L43_2
  L51_2(L52_2)
  L51_2 = A1_2.params
  L51_2 = L51_2.doDropdownEffect
  if L51_2 == false then
  else
    L51_2 = L0_1
    L51_2 = L51_2.bouncer
    L51_2 = L51_2.down
    L52_2 = L8_2
    L51_2(L52_2)
  end
  L51_2 = L0_1
  L51_2 = L51_2.database
  L51_2 = L51_2.shouldShowClanInfo
  L51_2 = L51_2()
  if L51_2 then
    L51_2 = L0_1
    L51_2 = L51_2.database
    L51_2 = L51_2.didShowClanInfo
    L51_2()
    L51_2 = L37_2
    L51_2()
  end
  L51_2 = L0_1
  L51_2 = L51_2.comm
  L51_2 = L51_2.getOpenClans
  L51_2()
end

L1_1.create = L4_1

function L4_1(A0_2, A1_2)
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

L1_1.show = L4_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
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
        L4_2(L5_2)
      end
    end
    return
  end
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
