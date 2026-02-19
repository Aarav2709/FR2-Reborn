local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = nil
L7_1 = nil
L8_1 = nil
L9_1 = nil
L10_1 = nil
L11_1 = nil

function L12_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2, L60_2, L61_2, L62_2, L63_2, L64_2, L65_2, L66_2, L67_2, L68_2, L69_2, L70_2, L71_2, L72_2, L73_2, L74_2, L75_2, L76_2
  L2_2 = A0_2.view
  L3_2 = false
  L4_2 = require
  L5_2 = "lua.modules.clans.clanStats"
  L4_2 = L4_2(L5_2)
  L5_2 = require
  L6_2 = "lua.modules.clans.clanPlayerStats"
  L5_2 = L5_2(L6_2)
  L6_2 = require
  L7_2 = "lua.modules.clans.clanEmblem"
  L6_2 = L6_2(L7_2)
  L7_2 = require
  L8_2 = "lua.modules.clans.clanMessageOfTheDay"
  L7_2 = L7_2(L8_2)
  L8_2 = require
  L9_2 = "lua.modules.clans.clanPlayerListMenu"
  L8_2 = L8_2(L9_2)
  L9_2 = require
  L10_2 = "lua.modules.clans.clanEventLog"
  L9_2 = L9_2(L10_2)
  L10_2 = require
  L11_2 = "lua.modules.clans.clanPlayerLeagueDisplay"
  L10_2 = L10_2(L11_2)
  L11_2 = require
  L12_2 = "lua.modules.clans.clanStatOverview"
  L11_2 = L11_2(L12_2)
  L12_2 = require
  L13_2 = "lua.modules.clanMemberListView"
  L12_2 = L12_2(L13_2)
  L13_2 = require
  L14_2 = "lua.modules.clans.clanRewardBarUI"
  L13_2 = L13_2(L14_2)
  L14_2 = require
  L15_2 = "lua.modules.clans.clanSupporterUI"
  L14_2 = L14_2(L15_2)
  L15_2 = 16
  L16_2 = {}
  L17_2 = 1
  L18_2 = 1
  L19_2 = 1
  L16_2[1] = L17_2
  L16_2[2] = L18_2
  L16_2[3] = L19_2
  L17_2 = {}
  L18_2 = 0.2980392156862745
  L19_2 = 0.21176470588235294
  L20_2 = 0.11372549019607843
  L17_2[1] = L18_2
  L17_2[2] = L19_2
  L17_2[3] = L20_2
  L18_2 = nil
  L19_2 = nil
  L20_2 = false
  L21_2 = display
  L21_2 = L21_2.newGroup
  L21_2 = L21_2()
  L22_2 = display
  L22_2 = L22_2.newGroup
  L22_2 = L22_2()
  L23_2 = display
  L23_2 = L23_2.newGroup
  L23_2 = L23_2()
  L24_2 = L0_1
  L24_2 = L24_2.backgrounds
  L24_2 = L24_2.getBackground
  L24_2 = L24_2()
  L25_2 = display
  L25_2 = L25_2.contentWidth
  L25_2 = L25_2 * 0.5
  L24_2.x = L25_2
  L25_2 = display
  L25_2 = L25_2.contentHeight
  L25_2 = L25_2 * 0.5
  L24_2.y = L25_2
  L25_2 = display
  L25_2 = L25_2.newImageRect
  L26_2 = "images/gui/clan_v2/hub.png"
  L27_2 = 429
  L28_2 = 254
  L25_2 = L25_2(L26_2, L27_2, L28_2)
  L25_2.anchorY = 0
  L26_2 = display
  L26_2 = L26_2.contentWidth
  L26_2 = L26_2 * 0.5
  L26_2 = L26_2 + 20
  L25_2.x = L26_2
  L25_2.y = 8
  L27_2 = L21_2
  L26_2 = L21_2.insert
  L28_2 = L25_2
  L26_2(L27_2, L28_2)
  L26_2 = L0_1
  L26_2 = L26_2.newText
  L27_2 = {}
  L27_2.string = "???"
  L27_2.size = L15_2
  L27_2.x = 0
  L27_2.y = 0
  L27_2.ax = 0
  L27_2.color = L16_2
  L26_2 = L26_2(L27_2)
  L27_2 = L25_2.x
  L27_2 = L27_2 - 90
  L26_2.x = L27_2
  L27_2 = L25_2.y
  L27_2 = L27_2 + 12
  L26_2.y = L27_2
  L28_2 = L21_2
  L27_2 = L21_2.insert
  L29_2 = L26_2
  L27_2(L28_2, L29_2)
  L27_2 = L0_1
  L27_2 = L27_2.newText
  L28_2 = {}
  L29_2 = L0_1
  L29_2 = L29_2.localized
  L29_2 = L29_2.get
  L30_2 = "Clan Rating"
  L29_2 = L29_2(L30_2)
  L28_2.string = L29_2
  L28_2.size = 12
  L29_2 = L25_2.x
  L29_2 = L29_2 - 46
  L28_2.x = L29_2
  L29_2 = L25_2.y
  L29_2 = L29_2 + 35
  L28_2.y = L29_2
  L28_2.color = L17_2
  L27_2 = L27_2(L28_2)
  L29_2 = L21_2
  L28_2 = L21_2.insert
  L30_2 = L27_2
  L28_2(L29_2, L30_2)
  L28_2 = L0_1
  L28_2 = L28_2.newText
  L29_2 = {}
  L29_2.string = "?"
  L29_2.size = 20
  L30_2 = L25_2.x
  L30_2 = L30_2 - 46
  L29_2.x = L30_2
  L30_2 = L25_2.y
  L30_2 = L30_2 + 15
  L29_2.y = L30_2
  L29_2.color = L16_2
  L28_2 = L28_2(L29_2)
  L30_2 = L21_2
  L29_2 = L21_2.insert
  L31_2 = L28_2
  L29_2(L30_2, L31_2)
  L29_2 = L0_1
  L29_2 = L29_2.newText
  L30_2 = {}
  L31_2 = L0_1
  L31_2 = L31_2.localized
  L31_2 = L31_2.get
  L32_2 = "???"
  L31_2 = L31_2(L32_2)
  L30_2.string = L31_2
  L30_2.size = L15_2
  L30_2.x = 70
  L31_2 = L25_2.y
  L31_2 = L31_2 + 35
  L30_2.y = L31_2
  L30_2.ax = 0
  L30_2.color = L17_2
  L29_2 = L29_2(L30_2)
  L31_2 = L21_2
  L30_2 = L21_2.insert
  L32_2 = L29_2
  L30_2(L31_2, L32_2)
  L30_2 = L0_1
  L30_2 = L30_2.newText
  L31_2 = {}
  L32_2 = L0_1
  L32_2 = L32_2.localized
  L32_2 = L32_2.get
  L33_2 = "Member Leagues"
  L32_2 = L32_2(L33_2)
  L31_2.string = L32_2
  L31_2.size = 12
  L32_2 = L25_2.x
  L32_2 = L32_2 + 168
  L31_2.x = L32_2
  L32_2 = L25_2.y
  L32_2 = L32_2 + 116
  L31_2.y = L32_2
  L31_2.ax = 1
  L31_2.color = L17_2
  L30_2 = L30_2(L31_2)
  L32_2 = L23_2
  L31_2 = L23_2.insert
  L33_2 = L30_2
  L31_2(L32_2, L33_2)
  L31_2 = L6_2.create
  L31_2 = L31_2()
  L31_2.x = 36
  L32_2 = L25_2.y
  L32_2 = L32_2 + 20
  L31_2.y = L32_2
  L32_2 = L31_2.showLevel
  L32_2()
  L33_2 = L21_2
  L32_2 = L21_2.insert
  L34_2 = L31_2
  L32_2(L33_2, L34_2)
  L32_2 = nil
  L33_2 = nil
  
  function L34_2(A0_3)
    local L1_3, L2_3
    L1_3 = L22_2
    L1_3.isVisible = A0_3
    L1_3 = L32_2
    L1_3 = L1_3.setVisible
    L2_3 = A0_3
    L1_3(L2_3)
  end
  
  L35_2 = L4_2.create
  L35_2 = L35_2()
  L11_1 = L35_2
  L35_2 = L11_1
  L36_2 = L25_2.x
  L36_2 = L36_2 + 74
  L35_2.x = L36_2
  L35_2 = L11_1
  L36_2 = L25_2.y
  L36_2 = L36_2 + 64
  L35_2.y = L36_2
  L36_2 = L23_2
  L35_2 = L23_2.insert
  L37_2 = L11_1
  L35_2(L36_2, L37_2)
  L35_2 = L0_1
  L35_2 = L35_2.clanUtils
  L35_2 = L35_2.getMyClanRank
  L35_2 = L35_2()
  L35_2 = L35_2 == 3
  L36_2 = L7_2.create
  L37_2 = L35_2
  L36_2 = L36_2(L37_2)
  L37_2 = L25_2.x
  L37_2 = L37_2 + 106
  L36_2.x = L37_2
  L37_2 = L25_2.y
  L37_2 = L37_2 + 20
  L36_2.y = L37_2
  L38_2 = L21_2
  L37_2 = L21_2.insert
  L39_2 = L36_2
  L37_2(L38_2, L39_2)
  L37_2 = true
  
  function L38_2()
    local L0_3, L1_3
    L0_3 = true
    L37_2 = L0_3
    L0_3 = L32_2
    L0_3 = L0_3.setData
    L1_3 = L0_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getClanMembersSorted
    L1_3 = L1_3()
    L0_3(L1_3)
    L0_3 = L33_2
    L1_3 = L0_3
    L0_3 = L0_3.toFront
    L0_3(L1_3)
    L0_3 = L34_2
    L1_3 = L20_2
    L0_3(L1_3)
  end
  
  L39_2 = L9_2.create
  L39_2 = L39_2()
  L41_2 = L23_2
  L40_2 = L23_2.insert
  L42_2 = L39_2
  L40_2(L41_2, L42_2)
  L40_2 = L25_2.x
  L40_2 = L40_2 + 68
  L39_2.x = L40_2
  L39_2.y = 166
  L40_2 = nil
  L41_2 = {}
  
  function L42_2()
    local L0_3, L1_3
  end
  
  L41_2.deSelect = L42_2
  
  function L42_2()
    local L0_3, L1_3
  end
  
  L41_2.getPlayerId = L42_2
  
  function L42_2()
    local L0_3, L1_3
  end
  
  L41_2.setSelected = L42_2
  L42_2 = {}
  L43_2 = L10_2.create
  L43_2 = L43_2()
  L44_2 = L43_2.updateLeagueMemberCounterTexts
  L45_2 = L0_1
  L45_2 = L45_2.data
  L45_2 = L45_2.clans
  L45_2 = L45_2.memberLeagues
  L44_2(L45_2)
  L45_2 = L23_2
  L44_2 = L23_2.insert
  L46_2 = L43_2
  L44_2(L45_2, L46_2)
  L44_2 = L25_2.x
  L44_2 = L44_2 + 68
  L43_2.x = L44_2
  L43_2.y = 144
  L44_2 = display
  L44_2 = L44_2.newImageRect
  L45_2 = "images/gui/clan_v2/buttonTabMembers.png"
  L46_2 = 55
  L47_2 = 57
  L44_2 = L44_2(L45_2, L46_2, L47_2)
  L45_2 = L25_2.x
  L45_2 = L45_2 - 230
  L44_2.x = L45_2
  L45_2 = L25_2.y
  L45_2 = L45_2 + 160
  L44_2.y = L45_2
  L45_2 = display
  L45_2 = L45_2.newImageRect
  L46_2 = "images/gui/clan_v2/buttonTabInfo.png"
  L47_2 = 55
  L48_2 = 57
  L45_2 = L45_2(L46_2, L47_2, L48_2)
  L46_2 = L25_2.x
  L46_2 = L46_2 - 230
  L45_2.x = L46_2
  L46_2 = L25_2.y
  L46_2 = L46_2 + 100
  L45_2.y = L46_2
  
  function L46_2()
    local L0_3, L1_3
    L0_3 = true
    L20_2 = L0_3
    L0_3 = L44_2
    L0_3.isVisible = true
    L0_3 = L45_2
    L0_3.isVisible = false
    L0_3 = L23_2
    L0_3.isVisible = false
    L0_3 = L34_2
    L1_3 = true
    L0_3(L1_3)
  end
  
  function L47_2()
    local L0_3, L1_3
    L0_3 = false
    L20_2 = L0_3
    L0_3 = L44_2
    L0_3.isVisible = false
    L0_3 = L45_2
    L0_3.isVisible = true
    L0_3 = L23_2
    L0_3.isVisible = true
    L0_3 = L34_2
    L1_3 = false
    L0_3(L1_3)
  end
  
  L48_2 = L0_1
  L48_2 = L48_2.newButton
  L49_2 = {}
  L49_2.image = "images/gui/clan_v2/buttonTabMembers_dark.png"
  L49_2.width = 55
  L49_2.height = 57
  L49_2.onRelease = L46_2
  L50_2 = L25_2.x
  L50_2 = L50_2 - 230
  L49_2.x = L50_2
  L50_2 = L25_2.y
  L50_2 = L50_2 + 160
  L49_2.y = L50_2
  L48_2 = L48_2(L49_2)
  L50_2 = L21_2
  L49_2 = L21_2.insert
  L51_2 = L48_2
  L49_2(L50_2, L51_2)
  L50_2 = L21_2
  L49_2 = L21_2.insert
  L51_2 = L44_2
  L49_2(L50_2, L51_2)
  L49_2 = L0_1
  L49_2 = L49_2.newButton
  L50_2 = {}
  L50_2.image = "images/gui/clan_v2/buttonTabInfo_dark.png"
  L50_2.width = 55
  L50_2.height = 57
  L50_2.onRelease = L47_2
  L51_2 = L25_2.x
  L51_2 = L51_2 - 230
  L50_2.x = L51_2
  L51_2 = L25_2.y
  L51_2 = L51_2 + 100
  L50_2.y = L51_2
  L49_2 = L49_2(L50_2)
  L51_2 = L21_2
  L50_2 = L21_2.insert
  L52_2 = L49_2
  L50_2(L51_2, L52_2)
  L51_2 = L21_2
  L50_2 = L21_2.insert
  L52_2 = L45_2
  L50_2(L51_2, L52_2)
  L50_2 = nil
  L51_2 = nil
  L52_2 = L5_2.create
  L52_2 = L52_2()
  L53_2 = L25_2.x
  L53_2 = L53_2 + 75
  L52_2.x = L53_2
  L53_2 = L25_2.y
  L53_2 = L53_2 + 64
  L52_2.y = L53_2
  L54_2 = L22_2
  L53_2 = L22_2.insert
  L55_2 = L52_2
  L53_2(L54_2, L55_2)
  L53_2 = require
  L54_2 = "lua.modules.clans.playerProfile"
  L53_2 = L53_2(L54_2)
  L54_2 = L53_2.new
  L54_2 = L54_2()
  L55_2 = L25_2.x
  L55_2 = L55_2 + 134
  L54_2.x = L55_2
  L54_2.y = 188
  L56_2 = L22_2
  L55_2 = L22_2.insert
  L57_2 = L54_2.group
  L55_2(L56_2, L57_2)
  L55_2 = L8_2.create
  L55_2 = L55_2()
  L56_2 = L54_2.x
  L56_2 = L56_2 + 48
  L55_2.x = L56_2
  L56_2 = L54_2.y
  L56_2 = L56_2 - 48
  L55_2.y = L56_2
  L57_2 = L22_2
  L56_2 = L22_2.insert
  L58_2 = L55_2
  L56_2(L57_2, L58_2)
  
  function L56_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L2_3 = print
    L3_3 = "Update Player Profile "
    L4_3 = A0_3
    L2_3(L3_3, L4_3)
    L2_3 = L42_2
    L2_3 = L2_3[A0_3]
    if not L2_3 and A1_3 then
      L2_3 = L42_2
      L2_3[A0_3] = A1_3
    end
    L2_3 = L40_2
    if L2_3 == A0_3 then
      L2_3 = L42_2
      L2_3 = L2_3[A0_3]
      L3_3 = L0_1
      L3_3 = L3_3.clanUtils
      L3_3 = L3_3.getClanMember
      L4_3 = A0_3
      L3_3 = L3_3(L4_3)
      L4_3 = print
      L5_3 = "Set Player Profile "
      L6_3 = L3_3.playerId
      L4_3(L5_3, L6_3)
      if L2_3 then
        L4_3 = L54_2
        L4_3 = L4_3.createMonsterModules
        L5_3 = A1_3.p
        L5_3 = L5_3.fa
        L6_3 = A1_3.p
        L6_3 = L6_3.p
        L7_3 = L0_1
        L7_3 = L7_3.data
        L7_3 = L7_3.clans
        L7_3 = L7_3.emblem
        L4_3(L5_3, L6_3, L7_3)
        L4_3 = {}
        L5_3 = L2_3.p
        L5_3 = L5_3.z
        L4_3.kills = L5_3
        L5_3 = L2_3.p
        L5_3 = L5_3.aa
        L4_3.deaths = L5_3
        L5_3 = L2_3.p
        L5_3 = L5_3.wr
        L4_3.wins = L5_3
        L5_3 = L2_3.p
        L5_3 = L5_3.ae
        L4_3.games = L5_3
        L5_3 = L3_3.supporterLevel
        L4_3.supporter = L5_3
        L5_3 = L3_3.rank
        L4_3.rank = L5_3
        L5_3 = L3_3.active
        L4_3.active = L5_3
        L5_3 = L3_3.joined
        L4_3.joined = L5_3
        L5_3 = L52_2
        L5_3 = L5_3.setStats
        L6_3 = L4_3
        L5_3(L6_3)
      end
      L4_3 = L54_2
      L4_3 = L4_3.setName
      L5_3 = L3_3.name
      L4_3(L5_3)
      L4_3 = L55_2
      L4_3 = L4_3.refreshButtons
      L5_3 = L3_3.playerId
      L4_3(L5_3)
    end
  end
  
  L9_1 = L56_2
  
  function L56_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    if A1_3 then
      L2_3 = A1_3.setSelected
      L2_3()
    end
    L40_2 = A0_3
    L41_2 = A1_3
    L2_3 = L42_2
    L2_3 = L2_3[A0_3]
    L3_3 = L42_2
    L3_3 = L3_3[A0_3]
    if L3_3 then
      L3_3 = L9_1
      L4_3 = A0_3
      L5_3 = L2_3
      L3_3(L4_3, L5_3)
    else
      L3_3 = L9_1
      L4_3 = A0_3
      L5_3 = L2_3
      L3_3(L4_3, L5_3)
      L3_3 = L0_1
      L3_3 = L3_3.comm
      L3_3 = L3_3.getPlayerLeagueDetailsMessage
      L4_3 = A0_3
      L3_3(L4_3)
    end
  end
  
  L57_2 = L12_2.create
  L58_2 = 63
  L59_2 = 75
  L60_2 = 239
  L61_2 = 178
  L62_2 = 29
  L63_2 = L56_2
  L64_2 = 10
  L57_2 = L57_2(L58_2, L59_2, L60_2, L61_2, L62_2, L63_2, L64_2)
  L32_2 = L57_2
  L57_2 = L32_2.createTable
  L58_2 = {}
  L59_2 = L22_2
  L57_2(L58_2, L59_2)
  L57_2 = require
  L58_2 = "lua.modules.clans.clanPlayerListHeaderUI"
  L57_2 = L57_2(L58_2)
  L57_2 = L57_2.create
  L57_2 = L57_2()
  L33_2 = L57_2
  L33_2.x = 182
  L33_2.y = 71
  L58_2 = L22_2
  L57_2 = L22_2.insert
  L59_2 = L33_2
  L57_2(L58_2, L59_2)
  L57_2 = L14_2.create
  L57_2 = L57_2()
  L57_2.x = 182
  L57_2.y = 162
  L59_2 = L23_2
  L58_2 = L23_2.insert
  L60_2 = L57_2
  L58_2(L59_2, L60_2)
  L58_2 = L13_2.create
  L58_2 = L58_2()
  L58_2.x = 178
  L58_2.y = 102
  L60_2 = L23_2
  L59_2 = L23_2.insert
  L61_2 = L58_2
  L59_2(L60_2, L61_2)
  L59_2 = L11_2.create
  L60_2 = true
  L59_2 = L59_2(L60_2)
  L60_2 = L59_2.hide
  L60_2()
  
  function L60_2()
    local L0_3, L1_3
    L0_3 = L18_2
    if L0_3 then
      L0_3 = L18_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L18_2 = L0_3
    end
  end
  
  L61_2 = L59_2.setOnHideFunction
  L62_2 = L60_2
  L61_2(L62_2)
  
  function L61_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = print
    L1_3 = "Settings button"
    L0_3(L1_3)
    L0_3 = {}
    L0_3.isModal = true
    L1_3 = {}
    L0_3.params = L1_3
    L1_3 = L0_3.params
    L1_3.openFromClanHub = true
    L1_3 = L0_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getClanStateEditData
    L1_3 = L1_3()
    L2_3 = L0_3.params
    L2_3.clanData = L1_3
    L2_3 = L0_1
    L2_3 = L2_3.showOverlay
    L3_3 = "lua.overlays.clanSettings"
    L4_3 = L0_3
    L2_3(L3_3, L4_3)
  end
  
  L62_2 = nil
  L63_2 = L0_1
  L63_2 = L63_2.clanUtils
  L63_2 = L63_2.getMyClanRank
  L63_2 = L63_2()
  if 3 <= L63_2 then
    L63_2 = L0_1
    L63_2 = L63_2.newButton
    L64_2 = {}
    L64_2.image = "images/gui/mainMenu/buttonSettings.png"
    L64_2.width = 57
    L64_2.height = 58
    L64_2.onRelease = L61_2
    L64_2.x = 200
    L64_2.y = 292
    L63_2 = L63_2(L64_2)
    L62_2 = L63_2
  end
  
  function L63_2()
    local L0_3, L1_3, L2_3
    L0_3 = L60_2
    L0_3()
    L0_3 = display
    L0_3 = L0_3.capture
    L1_3 = L2_2
    L0_3 = L0_3(L1_3)
    L18_2 = L0_3
    L0_3 = L18_2
    L0_3 = L0_3.fill
    L0_3.effect = "filter.blurGaussian"
    L0_3 = L18_2
    L0_3 = L0_3.fill
    L0_3 = L0_3.effect
    L0_3 = L0_3.horizontal
    L0_3.blurSize = 28
    L0_3 = L18_2
    L0_3 = L0_3.fill
    L0_3 = L0_3.effect
    L0_3 = L0_3.horizontal
    L0_3.sigma = 5
    L0_3 = L18_2
    L0_3 = L0_3.fill
    L0_3 = L0_3.effect
    L0_3 = L0_3.vertical
    L0_3.blurSize = 28
    L0_3 = L18_2
    L0_3 = L0_3.fill
    L0_3 = L0_3.effect
    L0_3 = L0_3.vertical
    L0_3.sigma = 5
    L0_3 = L18_2
    L1_3 = display
    L1_3 = L1_3.contentWidth
    L1_3 = L1_3 / 2
    L0_3.x = L1_3
    L0_3 = L18_2
    L1_3 = display
    L1_3 = L1_3.contentHeight
    L1_3 = L1_3 / 2
    L0_3.y = L1_3
    L0_3 = L18_2
    L1_3 = L0_3
    L0_3 = L0_3.removeSelf
    L0_3(L1_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L18_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L59_2
    L0_3(L1_3, L2_3)
    L0_3 = L59_2
    L0_3 = L0_3.show
    L0_3()
  end
  
  L64_2 = L0_1
  L64_2 = L64_2.newButton
  L65_2 = {}
  L65_2.image = "images/gui/clan_v2/smallShare.png"
  L65_2.width = 57
  L65_2.height = 58
  L65_2.onRelease = L63_2
  L65_2.x = 260
  L65_2.y = 292
  L64_2 = L64_2(L65_2)
  
  function L65_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.clanUtils
    L0_3 = L0_3.getMyClanRank
    L0_3 = L0_3()
    if 1 <= L0_3 then
      L0_3 = L0_1
      L0_3 = L0_3.showOverlay
      L1_3 = "lua.overlays.sendClanInvite"
      L0_3(L1_3)
    else
      L0_3 = L0_1
      L0_3 = L0_3.createCustomOverlay
      L1_3 = 54
      L0_3(L1_3)
    end
  end
  
  L66_2 = L0_1
  L66_2 = L66_2.newButton
  L67_2 = {}
  L67_2.image = "images/gui/clan_v2/smallRanks.png"
  L67_2.width = 57
  L67_2.height = 58
  L67_2.onRelease = L65_2
  L67_2.x = 320
  L67_2.y = 292
  L66_2 = L66_2(L67_2)
  
  function L67_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.showOverlay
    L1_3 = "lua.overlays.clanChat"
    L0_3(L1_3)
  end
  
  L68_2 = L0_1
  L68_2 = L68_2.newButton
  L69_2 = {}
  L69_2.image = "images/gui/clan_v2/smallChat.png"
  L69_2.width = 57
  L69_2.height = 58
  L69_2.onRelease = L67_2
  L69_2.x = 380
  L69_2.y = 292
  L68_2 = L68_2(L69_2)
  
  function L69_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.comm
    L0_3 = L0_3.isOnline
    L0_3 = L0_3()
    if L0_3 then
      L0_3 = L0_1
      L1_3 = {}
      L0_3.gameHostData = L1_3
      L0_3 = L0_1
      L0_3 = L0_3.data
      L0_3 = L0_3.gameInfo
      L0_3.gameType = 5
      L0_3 = L0_1
      L0_3 = L0_3.gotoScene
      L1_3 = "lua.scenes.lobby2v2Play"
      L0_3(L1_3)
    else
      L0_3 = L0_1
      L0_3 = L0_3.createCustomOverlay
      L1_3 = 1
      L0_3(L1_3)
    end
  end
  
  L70_2 = L0_1
  L70_2 = L70_2.newButton
  L71_2 = {}
  L71_2.image = "images/gui/clan_v2/smallPlay.png"
  L71_2.width = 57
  L71_2.height = 58
  L71_2.onRelease = L69_2
  L71_2.x = 440
  L71_2.y = 292
  L70_2 = L70_2(L71_2)
  
  function L71_2()
    local L0_3, L1_3
    L0_3 = L50_2
    if L0_3 then
      L0_3 = L50_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L50_2 = L0_3
    end
    L0_3 = L51_2
    if L0_3 then
      L0_3 = L51_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L51_2 = L0_3
    end
  end
  
  function L72_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = L3_2
    if L1_3 then
      return
    end
    L1_3 = A0_3
    L2_3 = L71_2
    L2_3()
    if 0 < L1_3 then
      if 99 < L1_3 then
        L1_3 = 99
      end
      L2_3 = display
      L2_3 = L2_3.newImageRect
      L3_3 = "images/gui/mainMenu/alert.png"
      L4_3 = 20
      L5_3 = 20
      L2_3 = L2_3(L3_3, L4_3, L5_3)
      L50_2 = L2_3
      L2_3 = L50_2
      L3_3 = L68_2
      L3_3 = L3_3.getX
      L3_3 = L3_3()
      L3_3 = L3_3 + 23
      L2_3.x = L3_3
      L2_3 = L50_2
      L3_3 = L68_2
      L3_3 = L3_3.getY
      L3_3 = L3_3()
      L3_3 = L3_3 - 20
      L2_3.y = L3_3
      L2_3 = L2_2
      L3_3 = L2_3
      L2_3 = L2_3.insert
      L4_3 = L50_2
      L2_3(L3_3, L4_3)
      L2_3 = L0_1
      L2_3 = L2_3.newText
      L3_3 = {}
      L3_3.string = L1_3
      L4_3 = L50_2
      L4_3 = L4_3.x
      L3_3.x = L4_3
      L4_3 = L50_2
      L4_3 = L4_3.y
      L3_3.y = L4_3
      L3_3.size = 20
      L4_3 = {}
      L5_3 = 1
      L6_3 = 1
      L7_3 = 1
      L4_3[1] = L5_3
      L4_3[2] = L6_3
      L4_3[3] = L7_3
      L3_3.color = L4_3
      L2_3 = L2_3(L3_3)
      L51_2 = L2_3
      L2_3 = L2_2
      L3_3 = L2_3
      L2_3 = L2_3.insert
      L4_3 = L51_2
      L2_3(L3_3, L4_3)
    end
  end
  
  L10_1 = L72_2
  
  function L72_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.gotoScene
    L1_3 = "lua.scenes.mainMenu"
    L0_3(L1_3)
  end
  
  L73_2 = L0_1
  L73_2 = L73_2.newButton
  L74_2 = {}
  L74_2.image = "images/gui/common/buttonHome.png"
  L74_2.width = 90
  L74_2.height = 57
  L74_2.onRelease = L72_2
  L74_2.x = 50
  L74_2.y = 292
  L73_2 = L73_2(L74_2)
  
  function L74_2()
    local L0_3, L1_3, L2_3
    L0_3 = L21_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L22_2
    L0_3(L1_3, L2_3)
    L0_3 = L21_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L23_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L24_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L21_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L73_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L64_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L66_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L68_2
    L0_3(L1_3, L2_3)
    L0_3 = L62_2
    if L0_3 then
      L0_3 = L2_2
      L1_3 = L0_3
      L0_3 = L0_3.insert
      L2_3 = L62_2
      L0_3(L1_3, L2_3)
    end
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L70_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L59_2
    L0_3(L1_3, L2_3)
  end
  
  function L75_2()
    local L0_3, L1_3, L2_3
    L0_3 = L3_2
    if not L0_3 then
      L0_3 = L0_1
      L0_3 = L0_3.data
      L0_3 = L0_3.clans
      L0_3 = L0_3.inClan
      if L0_3 then
        goto lbl_11
      end
    end
    do return end
    ::lbl_11::
    L0_3 = L36_2
    L0_3 = L0_3.setMessageOfTheDay
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.clans
    L1_3 = L1_3.motd
    L1_3 = L1_3.message
    L2_3 = L0_1
    L2_3 = L2_3.data
    L2_3 = L2_3.clans
    L2_3 = L2_3.motd
    L2_3 = L2_3.author
    L0_3(L1_3, L2_3)
  end
  
  L7_1 = L75_2
  
  function L75_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L3_2
    if not L0_3 then
      L0_3 = L0_1
      L0_3 = L0_3.data
      L0_3 = L0_3.clans
      L0_3 = L0_3.inClan
      if L0_3 then
        goto lbl_11
      end
    end
    do return end
    ::lbl_11::
    L0_3 = L0_1
    L0_3 = L0_3.fitTextFontSize
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.clans
    L1_3 = L1_3.name
    L2_3 = 10
    L3_3 = L15_2
    L4_3 = 112
    L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
    L1_3 = L26_2
    L2_3 = L0_1
    L2_3 = L2_3.data
    L2_3 = L2_3.clans
    L2_3 = L2_3.name
    L1_3.text = L2_3
    L1_3 = L26_2
    L1_3.size = L0_3
    L1_3 = L29_2
    L2_3 = L0_1
    L2_3 = L2_3.clanUtils
    L2_3 = L2_3.getAttitudeString
    L3_3 = L0_1
    L3_3 = L3_3.data
    L3_3 = L3_3.clans
    L3_3 = L3_3.attitude
    L2_3 = L2_3(L3_3)
    L1_3.text = L2_3
    L1_3 = L39_2
    L1_3 = L1_3.updateEventLog
    L2_3 = L0_1
    L2_3 = L2_3.clanUtils
    L2_3 = L2_3.getClanEventLog
    L2_3, L3_3, L4_3 = L2_3()
    L1_3(L2_3, L3_3, L4_3)
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.clans
    L1_3 = L1_3.emblem
    if L1_3 then
      L1_3 = L0_1
      L1_3 = L1_3.data
      L1_3 = L1_3.clans
      L1_3 = L1_3.emblem
      L1_3 = L1_3.f
      if L1_3 then
        goto lbl_60
      end
    end
    L1_3 = -1
    ::lbl_60::
    if L1_3 == 1 then
      L2_3 = L26_2
      L2_3.x = 70
    else
      L2_3 = L26_2
      L2_3.x = 74
    end
    L2_3 = L31_2
    L2_3 = L2_3.updateEmblem
    L3_3 = L0_1
    L3_3 = L3_3.data
    L3_3 = L3_3.clans
    L3_3 = L3_3.emblem
    L2_3(L3_3)
    L2_3 = L31_2
    L2_3 = L2_3.updateLevelData
    L3_3 = L0_1
    L3_3 = L3_3.data
    L3_3 = L3_3.clans
    L3_3 = L3_3.level
    L4_3 = L0_1
    L4_3 = L4_3.data
    L4_3 = L4_3.clans
    L4_3 = L4_3.experience
    L2_3(L3_3, L4_3)
    L2_3 = L59_2
    L2_3 = L2_3.updateClanName
    L3_3 = L0_1
    L3_3 = L3_3.data
    L3_3 = L3_3.clans
    L3_3 = L3_3.name
    L2_3(L3_3)
    L2_3 = L59_2
    L2_3 = L2_3.updateClanEmblem
    L3_3 = L0_1
    L3_3 = L3_3.data
    L3_3 = L3_3.clans
    L3_3 = L3_3.emblem
    L2_3(L3_3)
    L2_3 = L59_2
    L2_3 = L2_3.updateClanLevel
    L3_3 = L0_1
    L3_3 = L3_3.data
    L3_3 = L3_3.clans
    L3_3 = L3_3.level
    L4_3 = L0_1
    L4_3 = L4_3.data
    L4_3 = L4_3.clans
    L4_3 = L4_3.experience
    L2_3(L3_3, L4_3)
    L2_3 = L59_2
    L2_3 = L2_3.updateClanAttitude
    L3_3 = L0_1
    L3_3 = L3_3.data
    L3_3 = L3_3.clans
    L3_3 = L3_3.attitude
    L2_3(L3_3)
  end
  
  L4_1 = L75_2
  
  function L75_2()
    local L0_3, L1_3
    L0_3 = L3_2
    if not L0_3 then
      L0_3 = L0_1
      L0_3 = L0_3.data
      L0_3 = L0_3.clans
      L0_3 = L0_3.inClan
      if L0_3 then
        goto lbl_11
      end
    end
    do return end
    ::lbl_11::
    L0_3 = L11_1
    L0_3 = L0_3.setStats
    L1_3 = L0_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getClanStats
    L1_3 = L1_3()
    L0_3(L1_3)
  end
  
  L5_1 = L75_2
  
  function L75_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = L3_2
    if not L0_3 then
      L0_3 = L0_1
      L0_3 = L0_3.data
      L0_3 = L0_3.clans
      L0_3 = L0_3.inClan
      if L0_3 then
        goto lbl_11
      end
    end
    do return end
    ::lbl_11::
    L0_3 = L37_2
    if L0_3 then
      L0_3 = L0_1
      L0_3 = L0_3.clanUtils
      L0_3 = L0_3.getClanMembersSorted
      L0_3 = L0_3()
      L1_3 = L40_2
      if not L1_3 then
        L1_3 = 1
        L2_3 = #L0_3
        L3_3 = 1
        for L4_3 = L1_3, L2_3, L3_3 do
          L5_3 = L0_3[L4_3]
          L5_3.selected = false
        end
        L1_3 = L0_3[1]
        L1_3.selected = true
        L1_3 = L0_3[1]
        L1_3 = L1_3.playerId
        L40_2 = L1_3
      else
        L1_3 = 1
        L2_3 = #L0_3
        L3_3 = 1
        for L4_3 = L1_3, L2_3, L3_3 do
          L5_3 = L0_3[L4_3]
          L5_3.selected = false
          L5_3 = L0_3[L4_3]
          L5_3 = L5_3.playerId
          L6_3 = L40_2
          if L5_3 == L6_3 then
            L5_3 = L0_3[L4_3]
            L5_3.selected = true
          end
        end
      end
      L1_3 = L32_2
      L1_3 = L1_3.setData
      L2_3 = L0_3
      L1_3(L2_3)
      L1_3 = L33_2
      L2_3 = L1_3
      L1_3 = L1_3.toFront
      L1_3(L2_3)
      L1_3 = L34_2
      L2_3 = L20_2
      L1_3(L2_3)
    end
    L0_3 = L43_2
    L0_3 = L0_3.updateLeagueMemberCounterTexts
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.clans
    L1_3 = L1_3.memberLeagues
    L0_3(L1_3)
    L0_3 = L11_1
    L0_3 = L0_3.setStats
    L1_3 = L0_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getClanStats
    L1_3, L2_3, L3_3, L4_3, L5_3, L6_3 = L1_3()
    L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3)
    L0_3 = L58_2
    L0_3 = L0_3.setTimeLeft
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.clans
    L1_3 = L1_3.weeklyResetRemaining
    if not L1_3 then
      L1_3 = 0
    end
    L0_3(L1_3)
    L0_3 = L58_2
    L0_3 = L0_3.setClanPoints
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.clans
    L1_3 = L1_3.weeklyClanPoints
    if not L1_3 then
      L1_3 = 0
    end
    L0_3(L1_3)
    L0_3 = L57_2
    L0_3 = L0_3.setSummaryValues
    L1_3 = L0_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getPersonalSupporterBonus
    L1_3 = L1_3()
    L2_3 = L0_1
    L2_3 = L2_3.clanUtils
    L2_3 = L2_3.calculateCombinedClanSupporterBoost
    L2_3, L3_3, L4_3, L5_3, L6_3 = L2_3()
    L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3)
    L0_3 = L57_2
    L0_3 = L0_3.updateTabs
    L0_3()
    L0_3 = L57_2
    L0_3 = L0_3.setResetTime
    L1_3 = L0_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getPlayerSupporterStatusTimeLeft
    L1_3, L2_3, L3_3, L4_3, L5_3, L6_3 = L1_3()
    L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3)
    L0_3 = L36_2
    L0_3 = L0_3.updateEditPrivelege
    L1_3 = L0_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getMyClanRank
    L1_3 = L1_3()
    L1_3 = L1_3 == 3
    L0_3(L1_3)
    L0_3 = L59_2
    L0_3 = L0_3.updateClanLeagueData
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.clans
    L1_3 = L1_3.memberLeagues
    L0_3(L1_3)
    L0_3 = L59_2
    L0_3 = L0_3.updateClanStats
    L1_3 = L0_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getClanStats
    L1_3, L2_3, L3_3, L4_3, L5_3, L6_3 = L1_3()
    L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3)
    L0_3 = L59_2
    L0_3 = L0_3.updateClanRating
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.clans
    L1_3 = L1_3.weeklyRating
    L0_3(L1_3)
    L0_3 = L28_2
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.clans
    L1_3 = L1_3.weeklyRating
    if not L1_3 then
      L1_3 = "?"
    end
    L0_3.text = L1_3
  end
  
  L6_1 = L75_2
  
  function L75_2()
    local L0_3, L1_3
    L0_3 = L58_2
    L0_3 = L0_3.setTimeLeft
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.clans
    L1_3 = L1_3.weeklyResetRemaining
    if not L1_3 then
      L1_3 = 0
    end
    L0_3(L1_3)
    L0_3 = L58_2
    L0_3 = L0_3.setClanPoints
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.clans
    L1_3 = L1_3.weeklyClanPoints
    if not L1_3 then
      L1_3 = 0
    end
    L0_3(L1_3)
  end
  
  L8_1 = L75_2
  
  function L75_2()
    local L0_3, L1_3
    L0_3 = L3_2
    if L0_3 then
      return
    end
    L0_3 = true
    L3_2 = L0_3
    L0_3 = native
    L0_3 = L0_3.setKeyboardFocus
    L1_3 = nil
    L0_3(L1_3)
    L0_3 = L19_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L19_2
      L0_3(L1_3)
      L0_3 = nil
      L19_2 = L0_3
    end
    L0_3 = L54_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = L59_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = L32_2
    L0_3 = L0_3.cleanTable
    L0_3()
    L0_3 = L39_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = L55_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = L36_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = L58_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = L71_2
    L0_3()
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L73_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L66_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L68_2
    L0_3(L1_3)
    L0_3 = L24_2
    L1_3 = L0_3
    L0_3 = L0_3.removeSelf
    L0_3(L1_3)
    L0_3 = L0_1
    L0_3 = L0_3.clanUtils
    L0_3 = L0_3.clearUnreadEvents
    L1_3 = 3
    L0_3(L1_3)
  end
  
  L2_1 = L75_2
  L75_2 = L74_2
  L75_2()
  L75_2 = L57_2.setResetTime
  L76_2 = L0_1
  L76_2 = L76_2.clanUtils
  L76_2 = L76_2.getPlayerSupporterStatusTimeLeft
  L76_2 = L76_2()
  L75_2(L76_2)
  L75_2 = L47_2
  L75_2()
end

L1_1.create = L12_1

function L12_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = A1_2.phase
  L3_2 = A0_2.view
  if L2_2 == "will" then
    return
  end
  L4_2 = isAndroid
  if L4_2 then
    L4_2 = native
    L4_2 = L4_2.setProperty
    L5_2 = "androidSystemUiVisibility"
    L6_2 = "immersiveSticky"
    L4_2(L5_2, L6_2)
  end
  L4_2 = require
  L5_2 = "lua.modules.androidBackButton"
  L4_2 = L4_2(L5_2)
  L5_2 = require
  L6_2 = "lua.network.tcpMessageFormat"
  L5_2 = L5_2(L6_2)
  
  function L6_2()
    local L0_3, L1_3
    L0_3 = L4_2
    L0_3 = L0_3.removeBackButton
    L0_3()
    L0_3 = L0_1
    L0_3 = L0_3.clanUtils
    L0_3 = L0_3.clearUnreadEvents
    L1_3 = 3
    L0_3(L1_3)
  end
  
  L3_1 = L6_2
  
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = A0_3.m
    L2_3 = L5_2
    L2_3 = L2_3.getClanDetails
    L2_3 = L2_3()
    if L1_3 == L2_3 then
      L1_3 = A0_3.r
      if L1_3 then
        return
      end
      L1_3 = print
      L2_3 = "Received clan details. Update scene."
      L1_3(L2_3)
      L1_3 = L4_1
      L1_3()
      L1_3 = L7_1
      L1_3()
    else
      L1_3 = A0_3.m
      L2_3 = L5_2
      L2_3 = L2_3.getClanLeagueDetails
      L2_3 = L2_3()
      if L1_3 == L2_3 then
        L1_3 = A0_3.r
        if L1_3 then
          return
        end
        L1_3 = print
        L2_3 = "Received clan stats. Update scene."
        L1_3(L2_3)
        L1_3 = L0_1
        L1_3 = L1_3.clanUtils
        L1_3 = L1_3.setClanStats
        L2_3 = A0_3.a
        L1_3(L2_3)
        L1_3 = L5_1
        L1_3()
      else
        L1_3 = A0_3.m
        L2_3 = L5_2
        L2_3 = L2_3.getClanMembers
        L2_3 = L2_3()
        if L1_3 ~= L2_3 then
          L1_3 = A0_3.m
          L2_3 = L5_2
          L2_3 = L2_3.playerStateUpdate
          L2_3 = L2_3()
          if L1_3 ~= L2_3 then
            goto lbl_62
          end
        end
        L1_3 = A0_3.r
        if L1_3 then
          return
        end
        L1_3 = print
        L2_3 = "Received clan players. Update scene."
        L1_3(L2_3)
        L1_3 = L6_1
        L1_3()
        goto lbl_158
        ::lbl_62::
        L1_3 = A0_3.m
        L2_3 = L5_2
        L2_3 = L2_3.receiveClanMessage
        L2_3 = L2_3()
        if L1_3 == L2_3 then
          L1_3 = L10_1
          L2_3 = L0_1
          L2_3 = L2_3.clanUtils
          L2_3 = L2_3.getNumberOfUnreadMessages
          L2_3, L3_3, L4_3 = L2_3()
          L1_3(L2_3, L3_3, L4_3)
          L1_3 = A0_3.a
          if L1_3 then
            L1_3 = A0_3.a
            L1_3 = L1_3.e
            if L1_3 then
              L1_3 = tonumber
              L2_3 = A0_3.a
              L2_3 = L2_3.e
              L1_3 = L1_3(L2_3)
              if L1_3 == 9 then
                L1_3 = A0_3.a
                L1_3 = L1_3.a
                L1_3 = L1_3[1]
                L2_3 = L0_1
                L2_3 = L2_3.data
                L2_3 = L2_3.clans
                L3_3 = L1_3 == "true"
                L2_3.open = L3_3
                L2_3 = L4_1
                L2_3()
              end
            end
          end
          L1_3 = tonumber
          L2_3 = A0_3.a
          L2_3 = L2_3.m
          L1_3 = L1_3(L2_3)
          if L1_3 == 2 then
            L1_3 = tonumber
            L2_3 = A0_3.a
            L2_3 = L2_3.e
            L1_3 = L1_3(L2_3)
            if L1_3 == 8 then
              L1_3 = L7_1
              L1_3()
              L1_3 = L4_1
              L1_3()
            else
              L1_3 = L6_1
              L1_3()
              L1_3 = L4_1
              L1_3()
            end
          end
        else
          L1_3 = A0_3.m
          L2_3 = L5_2
          L2_3 = L2_3.claimClanReward
          L2_3 = L2_3()
          if L1_3 == L2_3 then
            L1_3 = A0_3.r
            if L1_3 then
              L1_3 = print
              L2_3 = "Error claiming clan reward."
              L3_3 = A0_3.r
              L1_3(L2_3, L3_3)
              return
            end
          else
            L1_3 = A0_3.m
            L2_3 = L5_2
            L2_3 = L2_3.requestClanRewardToClaim
            L2_3 = L2_3()
            if L1_3 == L2_3 then
              L1_3 = L8_1
              L1_3()
            else
              L1_3 = A0_3.m
              L2_3 = L5_2
              L2_3 = L2_3.getPlayerLeagueDetailsMessage
              L2_3 = L2_3()
              if L1_3 == L2_3 then
                L1_3 = A0_3
                L2_3 = L9_1
                L3_3 = L1_3.p
                L3_3 = L3_3.i
                L4_3 = L1_3
                L2_3(L3_3, L4_3)
              end
            end
          end
        end
      end
    end
    ::lbl_158::
  end
  
  L7_2 = L0_1
  L7_2 = L7_2.comm
  L7_2 = L7_2.setCallback
  L8_2 = L6_2
  L7_2(L8_2)
  L7_2 = L1_1
  
  function L8_2(A0_3)
    local L1_3, L2_3
    L1_3 = L0_1
    L1_3 = L1_3.comm
    L1_3 = L1_3.setCallback
    L2_3 = L6_2
    L1_3(L2_3)
    L1_3 = L6_1
    L1_3()
    L1_3 = L4_1
    L1_3()
    L1_3 = L7_1
    L1_3()
    L1_3 = L10_1
    L2_3 = L0_1
    L2_3 = L2_3.clanUtils
    L2_3 = L2_3.getNumberOfUnreadMessages
    L2_3 = L2_3()
    L1_3(L2_3)
  end
  
  L7_2.overlayEnded = L8_2
  L7_2 = L4_2.addBackButton
  L8_2 = "lua.scenes.mainMenu"
  L9_2 = "lua.scenes.clanScene"
  L7_2(L8_2, L9_2)
  L7_2 = L0_1
  L7_2 = L7_2.clanUtils
  L7_2 = L7_2.clearUnreadEvents
  L8_2 = 3
  L7_2(L8_2)
  L7_2 = L10_1
  L8_2 = L0_1
  L8_2 = L8_2.clanUtils
  L8_2 = L8_2.getNumberOfUnreadMessages
  L8_2 = L8_2()
  L9_2 = L0_1
  L9_2 = L9_2.clanUtils
  L9_2 = L9_2.getNumberOfUnreadEvents
  L9_2 = L9_2()
  L8_2 = L8_2 + L9_2
  L7_2(L8_2)
  L7_2 = L6_1
  L7_2()
  L7_2 = L4_1
  L7_2()
  L7_2 = L5_1
  L7_2()
  L7_2 = L7_1
  L7_2()
  L7_2 = L0_1
  L7_2 = L7_2.clanUtils
  L7_2 = L7_2.shouldRefreshClanScene
  L7_2 = L7_2()
  if L7_2 then
    L7_2 = L0_1
    L7_2 = L7_2.comm
    L7_2 = L7_2.getClanDetails
    L7_2()
    L7_2 = L0_1
    L7_2 = L7_2.comm
    L7_2 = L7_2.getClanLeagueDetails
    L8_2 = L0_1
    L8_2 = L8_2.data
    L8_2 = L8_2.clans
    L8_2 = L8_2.clanId
    L7_2(L8_2)
    L7_2 = L0_1
    L7_2 = L7_2.comm
    L7_2 = L7_2.getClanMembers
    L7_2()
  end
end

L1_1.show = L12_1

function L12_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2.phase
  if L2_2 == "will" then
    L3_2 = L3_1
    if L3_2 then
      L3_2 = L3_1
      L3_2()
      L3_2 = nil
      L3_1 = L3_2
    end
  elseif L2_2 == "did" then
    L3_2 = L0_1
    L3_2 = L3_2.removeScene
    L4_2 = "lua.scenes.clanScene"
    L3_2(L4_2)
  end
end

L1_1.hide = L12_1

function L12_1(A0_2, A1_2)
  local L2_2
  L2_2 = L2_1
  if L2_2 then
    L2_2 = L2_1
    L2_2()
    L2_2 = nil
    L2_1 = L2_2
  end
end

L1_1.destroy = L12_1
L13_1 = L1_1
L12_1 = L1_1.addEventListener
L14_1 = "create"
L15_1 = L1_1
L12_1(L13_1, L14_1, L15_1)
L13_1 = L1_1
L12_1 = L1_1.addEventListener
L14_1 = "show"
L15_1 = L1_1
L12_1(L13_1, L14_1, L15_1)
L13_1 = L1_1
L12_1 = L1_1.addEventListener
L14_1 = "hide"
L15_1 = L1_1
L12_1(L13_1, L14_1, L15_1)
L13_1 = L1_1
L12_1 = L1_1.addEventListener
L14_1 = "destroy"
L15_1 = L1_1
L12_1(L13_1, L14_1, L15_1)
return L1_1
