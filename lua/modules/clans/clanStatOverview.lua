local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "lua.modules.androidBackButton"
L2_1 = L2_1(L3_1)
L3_1 = nil

function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2
  L1_2 = display
  L1_2 = L1_2.newGroup
  L1_2 = L1_2()
  L2_2 = nil
  L3_2 = nil
  L4_2 = 16
  L5_2 = nil
  L6_2 = nil
  L7_2 = {}
  L8_2 = 0.3
  L9_2 = 0.3
  L10_2 = 0.3
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L8_2 = {}
  L9_2 = 0
  L10_2 = 0
  L11_2 = 0
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L9_2 = require
  L10_2 = "lua.modules.clans.clanEmblem"
  L9_2 = L9_2(L10_2)
  L10_2 = require
  L11_2 = "lua.modules.clans.clanStats"
  L10_2 = L10_2(L11_2)
  L11_2 = require
  L12_2 = "lua.modules.clans.clanPlayerLeagueDisplay"
  L11_2 = L11_2(L12_2)
  L12_2 = false
  L13_2 = nil
  L14_2 = false
  L15_2 = nil
  L16_2 = nil
  L17_2 = nil
  L18_2 = nil
  L19_2 = nil
  L20_2 = nil
  L21_2 = display
  L21_2 = L21_2.newImageRect
  L22_2 = "images/gui/clan_v2/window_clanInfo.png"
  L23_2 = 432
  L24_2 = 256
  L21_2 = L21_2(L22_2, L23_2, L24_2)
  L2_2 = L21_2
  L2_2.anchorX = 0.5
  L2_2.anchorY = 0
  L21_2 = display
  L21_2 = L21_2.contentWidth
  L21_2 = L21_2 * 0.5
  L2_2.x = L21_2
  L2_2.y = 0
  L21_2 = display
  L21_2 = L21_2.newRect
  L22_2 = 0
  L23_2 = 0
  L24_2 = display
  L24_2 = L24_2.contentWidth
  L25_2 = display
  L25_2 = L25_2.contentHeight
  L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2)
  L3_2 = L21_2
  L3_2.anchorX = 0
  L3_2.anchorY = 0
  L22_2 = L3_2
  L21_2 = L3_2.setFillColor
  L23_2 = 0
  L24_2 = 0
  L25_2 = 0
  L26_2 = 0.5882352941176471
  L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
  L3_2.x = 0
  L3_2.y = 0
  L21_2 = L9_2.create
  L21_2 = L21_2()
  L22_2 = L21_2.setEmblemSize
  L23_2 = 1
  L22_2(L23_2)
  L22_2 = L21_2.showLevel
  L22_2()
  L22_2 = display
  L22_2 = L22_2.contentWidth
  L22_2 = L22_2 * 0.5
  L21_2.x = L22_2
  L21_2.y = 45
  L22_2 = L10_2.create
  L22_2 = L22_2()
  L22_2.x = 180
  L22_2.y = 170
  L23_2 = L11_2.create
  L23_2 = L23_2()
  L24_2 = L23_2.updateLeagueMemberCounterTexts
  L24_2()
  L23_2.x = 170
  L23_2.y = 230
  L24_2 = L1_1
  L24_2 = L24_2.newText
  L25_2 = {}
  L25_2.string = ""
  L25_2.size = L4_2
  L25_2.x = 240
  L25_2.y = 130
  L25_2.width = 220
  L25_2.align = "center"
  L25_2.ay = 0.5
  L25_2.color = L8_2
  L24_2 = L24_2(L25_2)
  L16_2 = L24_2
  L24_2 = L1_1
  L24_2 = L24_2.newText
  L25_2 = {}
  L26_2 = L1_1
  L26_2 = L26_2.localized
  L26_2 = L26_2.get
  L27_2 = "..."
  L26_2 = L26_2(L27_2)
  L27_2 = "   | "
  L26_2 = L26_2 .. L27_2
  L25_2.string = L26_2
  L26_2 = L4_2 - 4
  L25_2.size = L26_2
  L25_2.x = 244
  L25_2.y = 145
  L25_2.align = "center"
  L25_2.ax = 1
  L25_2.ay = 0.5
  L25_2.color = L7_2
  L24_2 = L24_2(L25_2)
  L19_2 = L24_2
  L24_2 = L1_1
  L24_2 = L24_2.newText
  L25_2 = {}
  L26_2 = L1_1
  L26_2 = L26_2.localized
  L26_2 = L26_2.get
  L27_2 = "Rating"
  L26_2 = L26_2(L27_2)
  L25_2.string = L26_2
  L26_2 = L4_2 - 4
  L25_2.size = L26_2
  L26_2 = L19_2.x
  L26_2 = L26_2 + 5
  L25_2.x = L26_2
  L25_2.y = 145
  L25_2.align = "center"
  L25_2.ax = 0
  L25_2.ay = 0.5
  L25_2.color = L7_2
  L24_2 = L24_2(L25_2)
  L17_2 = L24_2
  L24_2 = L1_1
  L24_2 = L24_2.newText
  L25_2 = {}
  L25_2.string = "..."
  L26_2 = L4_2 - 4
  L25_2.size = L26_2
  L26_2 = L17_2.x
  L27_2 = L17_2.width
  L26_2 = L26_2 + L27_2
  L26_2 = L26_2 + 6
  L25_2.x = L26_2
  L25_2.y = 145
  L25_2.align = "center"
  L25_2.ax = 0
  L25_2.ay = 0.5
  L25_2.color = L8_2
  L24_2 = L24_2(L25_2)
  L18_2 = L24_2
  L24_2 = L1_1
  L24_2 = L24_2.newText
  L25_2 = {}
  L25_2.string = ""
  L25_2.size = 8
  L26_2 = L2_2.x
  L25_2.x = L26_2
  L25_2.y = 208
  L25_2.align = "left"
  L25_2.ax = 0.5
  L25_2.ay = 0.5
  L25_2.color = L8_2
  L24_2 = L24_2(L25_2)
  L20_2 = L24_2
  
  function L24_2()
    local L0_3, L1_3
    L0_3 = L12_2
    if not L0_3 then
      return
    end
    L0_3 = L5_2
    if L0_3 then
      L0_3 = L5_2
      L0_3()
    end
    L0_3 = L1_2
    L0_3 = L0_3.hide
    L0_3()
  end
  
  function L25_2()
    local L0_3, L1_3
    L0_3 = true
    L12_2 = L0_3
    L0_3 = L2_1
    L0_3 = L0_3.isCustomOverlay
    L1_3 = L24_2
    L0_3(L1_3)
  end
  
  function L26_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = L24_2
      L1_3()
    end
    L1_3 = true
    return L1_3
  end
  
  L27_2 = L1_1
  L27_2 = L27_2.newButton
  L28_2 = {}
  L28_2.x = 365
  L28_2.y = 95
  L28_2.width = 43
  L28_2.height = 38
  L28_2.image = "images/gui/common/buttonClosePopup.png"
  L28_2.onRelease = L26_2
  L27_2 = L27_2(L28_2)
  
  function L28_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L0_3 = L27_2
    L0_3.isVisible = false
    L0_3 = L6_2
    L0_3.isVisible = false
    L0_3 = L1_1
    L0_3 = L0_3.showSocialPopup
    L1_3 = "clanScene"
    L2_3 = false
    L3_3 = false
    L4_3 = false
    L5_3 = {}
    L6_3 = L1_1
    L6_3 = L6_3.data
    L6_3 = L6_3.clans
    L6_3 = L6_3.name
    L7_3 = "funrun2"
    L8_3 = "clans"
    L5_3[1] = L6_3
    L5_3[2] = L7_3
    L5_3[3] = L8_3
    L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
    L0_3 = L27_2
    L0_3.isVisible = true
    L0_3 = L6_2
    L0_3.isVisible = true
  end
  
  function L29_2()
    local L0_3, L1_3, L2_3
    L0_3 = L15_2
    if L0_3 then
      L0_3 = print
      L1_3 = "Trying to join open clan "
      L2_3 = L15_2
      L1_3 = L1_3 .. L2_3
      L0_3(L1_3)
      L0_3 = L1_1
      L0_3 = L0_3.comm
      L0_3 = L0_3.joinOpenClan
      L1_3 = L15_2
      L0_3(L1_3)
    else
      L0_3 = print
      L1_3 = "ClanId not set"
      L0_3(L1_3)
    end
  end
  
  L30_2 = L1_1
  L30_2 = L30_2.newButton
  L31_2 = {}
  L31_2.x = 95
  L31_2.y = 80
  L31_2.width = 30
  L31_2.height = 30
  L31_2.image = "images/gui/postgame/photo.png"
  L31_2.onRelease = L28_2
  L30_2 = L30_2(L31_2)
  L6_2 = L30_2
  L30_2 = A0_2 or L30_2
  if not A0_2 then
    L30_2 = false
  end
  L6_2.isVisible = L30_2
  L30_2 = L1_1
  L30_2 = L30_2.newButton
  L31_2 = {}
  L31_2.x = 240
  L31_2.y = 264
  L31_2.width = 126
  L31_2.height = 40
  L32_2 = {}
  L33_2 = L1_1
  L33_2 = L33_2.localized
  L33_2 = L33_2.get
  L34_2 = "Join Open Clan"
  L33_2 = L33_2(L34_2)
  L32_2.string = L33_2
  L32_2.size = 14
  L31_2.text = L32_2
  L31_2.image = "images/gui/common/buttonTextB.png"
  L31_2.onRelease = L29_2
  L30_2 = L30_2(L31_2)
  L3_1 = L30_2
  L30_2 = L3_1
  L30_2.isVisible = false
  
  function L30_2(A0_3)
    local L1_3
    L1_3 = true
    return L1_3
  end
  
  function L31_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L26_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L30_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L32_2(A0_3)
    local L1_3
    L5_2 = A0_3
  end
  
  L1_2.setOnHideFunction = L32_2
  
  function L33_2()
    local L0_3, L1_3
    L0_3 = L1_2
    L0_3.isVisible = false
    L0_3 = L2_1
    L0_3 = L0_3.isCustomOverlay
    L1_3 = false
    L0_3(L1_3)
  end
  
  L1_2.hide = L33_2
  
  function L34_2()
    local L0_3, L1_3
    L0_3 = L1_2
    L0_3.isVisible = true
    L0_3 = L2_1
    L0_3 = L0_3.isCustomOverlay
    L1_3 = L24_2
    L0_3(L1_3)
  end
  
  L1_2.show = L34_2
  
  function L35_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_3
    L2_3 = A0_3.e
    if L2_3 then
      L2_3 = A0_3.f
      if L2_3 then
        L2_3 = {}
        L3_3 = A0_3.e
        L2_3.games = L3_3
        L3_3 = A0_3.f
        L2_3.wins = L3_3
        L3_3 = A0_3.c
        L2_3.deaths = L3_3
        L3_3 = A0_3.b
        L2_3.kills = L3_3
        L3_3 = A0_3.m
        L2_3.members = L3_3
        L3_3 = A0_3.q
        L2_3.bestPlacement = L3_3
        L3_3 = A0_3.a
        L3_3 = L3_3.a
        L2_3.tag = L3_3
        L1_3 = L2_3
      end
    end
    L2_3 = L22_2
    L2_3 = L2_3.setStats
    L3_3 = L1_3
    L2_3(L3_3)
  end
  
  L1_2.updateClanStats = L35_2
  
  function L36_2(A0_3)
    local L1_3
    L15_2 = A0_3
  end
  
  L1_2.updateClanId = L36_2
  
  function L37_2(A0_3)
    local L1_3, L2_3
    L1_3 = L21_2
    L1_3 = L1_3.updateEmblem
    L2_3 = A0_3
    L1_3(L2_3)
  end
  
  L1_2.updateClanEmblem = L37_2
  
  function L38_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = L21_2
    L2_3 = L2_3.updateLevelData
    L3_3 = A0_3
    L4_3 = A1_3
    L2_3(L3_3, L4_3)
  end
  
  L1_2.updateClanLevel = L38_2
  
  function L39_2(A0_3)
    local L1_3
    L1_3 = L16_2
    L1_3.text = A0_3
  end
  
  L1_2.updateClanName = L39_2
  
  function L40_2(A0_3)
    local L1_3
    L1_3 = L18_2
    L1_3.text = A0_3
  end
  
  L1_2.updateClanRating = L40_2
  
  function L41_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = L1_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getAttitudeString
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    L2_3 = L19_2
    L3_3 = L1_3
    L4_3 = "   | "
    L3_3 = L3_3 .. L4_3
    L2_3.text = L3_3
  end
  
  L1_2.updateClanAttitude = L41_2
  
  function L42_2(A0_3)
    local L1_3, L2_3
    L1_3 = L23_2
    L1_3 = L1_3.updateLeagueMemberCounterTexts
    L2_3 = A0_3
    L1_3(L2_3)
  end
  
  L1_2.updateClanLeagueData = L42_2
  
  function L43_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = L21_2
    L0_3 = L0_3.updateEmblem
    L0_3()
    L0_3 = L21_2
    L0_3 = L0_3.updateLevelData
    L1_3 = 1
    L2_3 = 0
    L0_3(L1_3, L2_3)
    L0_3 = L16_2
    L0_3.text = "Waiting for data..."
    L0_3 = L18_2
    L0_3.text = "..."
    L0_3 = L23_2
    L0_3 = L0_3.updateLeagueMemberCounterTexts
    L1_3 = {}
    L2_3 = 0
    L3_3 = 0
    L4_3 = 0
    L5_3 = 0
    L6_3 = 0
    L7_3 = 0
    L1_3[1] = L2_3
    L1_3[2] = L3_3
    L1_3[3] = L4_3
    L1_3[4] = L5_3
    L1_3[5] = L6_3
    L1_3[6] = L7_3
    L0_3(L1_3)
    L0_3 = {}
    L0_3.games = 0
    L0_3.wins = 0
    L0_3.deaths = 0
    L0_3.kills = 0
    L0_3.members = 0
    L0_3.bestPlacement = "NA"
    L0_3.tag = 0
    L1_3 = L22_2
    L1_3 = L1_3.setStats
    L2_3 = L0_3
    L1_3(L2_3)
  end
  
  L1_2.reset = L43_2
  
  function L44_2()
    local L0_3, L1_3, L2_3
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L3_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L2_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L16_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L17_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L18_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L19_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L20_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L21_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L22_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L23_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L27_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L6_2
    L0_3(L1_3, L2_3)
    L0_3 = L1_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L3_1
    L0_3(L1_3, L2_3)
  end
  
  function L45_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L14_2
    if L0_3 then
      return
    end
    L0_3 = true
    L14_2 = L0_3
    L0_3 = L13_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L13_2
      L0_3(L1_3)
      L0_3 = nil
      L13_2 = L0_3
    end
    L0_3 = L2_1
    L0_3 = L0_3.isCustomOverlay
    L1_3 = nil
    L0_3(L1_3)
    L0_3 = L2_2
    if L0_3 then
      L0_3 = L2_2
      L1_3 = L0_3
      L0_3 = L0_3.removeEventListener
      L2_3 = "touch"
      L3_3 = L30_2
      L0_3(L1_3, L2_3, L3_3)
      L0_3 = L2_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L2_2 = L0_3
    end
    L0_3 = L3_2
    if L0_3 then
      L0_3 = L3_2
      L1_3 = L0_3
      L0_3 = L0_3.removeEventListener
      L2_3 = "touch"
      L3_3 = L26_2
      L0_3(L1_3, L2_3, L3_3)
      L0_3 = L3_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L3_2 = L0_3
    end
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L27_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L6_2
    L0_3(L1_3)
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
  
  L1_2.clean = L45_2
  
  function L46_2(A0_3)
    local L1_3
    L1_3 = L3_1
    L1_3.isVisible = A0_3
  end
  
  L1_2.setJoinClanButtonVisible = L46_2
  
  function L47_2(A0_3)
    local L1_3
    L1_3 = L20_2
    L1_3.text = A0_3
  end
  
  L1_2.setRequiresText = L47_2
  L48_2 = L44_2
  L48_2()
  L48_2 = L31_2
  L48_2()
  L48_2 = timer
  L48_2 = L48_2.performWithDelay
  L49_2 = 200
  L50_2 = L25_2
  L51_2 = 1
  L48_2 = L48_2(L49_2, L50_2, L51_2)
  L13_2 = L48_2
  return L1_2
end

L0_1.create = L4_1
return L0_1
