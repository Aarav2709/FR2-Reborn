local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2, L60_2, L61_2, L62_2, L63_2, L64_2, L65_2, L66_2, L67_2, L68_2, L69_2, L70_2, L71_2, L72_2, L73_2, L74_2, L75_2, L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2, L85_2, L86_2, L87_2, L88_2, L89_2, L90_2, L91_2, L92_2, L93_2, L94_2, L95_2, L96_2, L97_2, L98_2, L99_2, L100_2, L101_2, L102_2, L103_2, L104_2, L105_2, L106_2, L107_2, L108_2, L109_2, L110_2, L111_2, L112_2, L113_2, L114_2, L115_2, L116_2, L117_2, L118_2, L119_2, L120_2, L121_2, L122_2, L123_2, L124_2, L125_2, L126_2, L127_2, L128_2, L129_2, L130_2, L131_2, L132_2, L133_2, L134_2, L135_2, L136_2, L137_2, L138_2, L139_2, L140_2, L141_2, L142_2, L143_2
  L2_2 = A0_2.view
  L3_2 = display
  L3_2 = L3_2.newGroup
  L3_2 = L3_2()
  L4_2 = display
  L4_2 = L4_2.newGroup
  L4_2 = L4_2()
  L5_2 = display
  L5_2 = L5_2.newGroup
  L5_2 = L5_2()
  L6_2 = display
  L6_2 = L6_2.newGroup
  L6_2 = L6_2()
  L7_2 = require
  L8_2 = "lua.modules.tableHelper"
  L7_2 = L7_2(L8_2)
  L8_2 = require
  L9_2 = "lua.network.tcpMessageFormat"
  L8_2 = L8_2(L9_2)
  L9_2 = require
  L10_2 = "lua.modules.playerProfile"
  L9_2 = L9_2(L10_2)
  L10_2 = require
  L11_2 = "lua.modules.clans.clanRanking"
  L10_2 = L10_2(L11_2)
  L11_2 = require
  L12_2 = "lua.modules.clans.clanStats"
  L11_2 = L11_2(L12_2)
  L12_2 = require
  L13_2 = "lua.modules.clans.clanRankingHistory"
  L12_2 = L12_2(L13_2)
  L13_2 = require
  L14_2 = "lua.modules.uiElements.informationBubble"
  L13_2 = L13_2(L14_2)
  L14_2 = L13_2.create
  L14_2 = L14_2()
  L15_2 = 1
  L16_2 = false
  L17_2 = L9_2.new
  L18_2 = L4_2
  L19_2 = L5_2
  L17_2 = L17_2(L18_2, L19_2)
  L18_2 = false
  L19_2 = nil
  L20_2 = false
  L21_2 = L0_1
  L21_2 = L21_2.database
  L21_2 = L21_2.getLocalLeagueData
  L21_2 = L21_2()
  L21_2 = L21_2 == 0
  L22_2 = {}
  L23_2 = {}
  L24_2 = {}
  L25_2 = {}
  L26_2 = {}
  L27_2 = 1
  L28_2 = nil
  L29_2 = nil
  L30_2 = {}
  L31_2 = 0
  L32_2 = 0
  L33_2 = false
  L34_2 = 0
  L35_2 = nil
  L36_2 = nil
  L37_2 = {}
  L38_2 = nil
  L39_2 = nil
  L40_2 = nil
  L41_2 = nil
  L42_2 = nil
  L43_2 = nil
  L44_2 = nil
  L45_2 = nil
  L46_2 = nil
  L47_2 = nil
  L48_2 = nil
  L49_2 = nil
  L50_2 = nil
  L51_2 = L0_1
  L51_2 = L51_2.awards
  L51_2 = L51_2.getLeagueDemotionThreshold
  L52_2 = 0
  L51_2, L52_2 = L51_2(L52_2)
  L53_2 = nil
  L54_2 = nil
  L55_2 = nil
  L56_2 = nil
  L57_2 = L12_2.create
  L58_2 = L2_2
  L57_2 = L57_2(L58_2)
  L57_2.x = 133
  L57_2.y = 247
  L58_2 = false
  L59_2 = A1_2.params
  if L59_2 then
    L59_2 = A1_2.params
    L59_2 = L59_2.openGlobal
    if L59_2 then
      L58_2 = true
    end
  end
  L59_2 = "?d ?h ?m"
  L60_2 = "?d ?h ?m"
  L61_2 = L0_1
  L61_2 = L61_2.newText
  L62_2 = {}
  L62_2.string = "?d ?h ?m"
  L62_2.size = 12
  L62_2.x = 312
  L62_2.y = 312
  L63_2 = {}
  L64_2 = 1
  L65_2 = 1
  L66_2 = 1
  L63_2[1] = L64_2
  L63_2[2] = L65_2
  L63_2[3] = L66_2
  L62_2.color = L63_2
  L61_2 = L61_2(L62_2)
  L62_2 = L0_1
  L62_2.overlayWithNetwork = true
  L62_2 = display
  L62_2 = L62_2.newRect
  L63_2 = 0
  L64_2 = 0
  L65_2 = display
  L65_2 = L65_2.contentWidth
  L66_2 = display
  L66_2 = L66_2.contentHeight
  L62_2 = L62_2(L63_2, L64_2, L65_2, L66_2)
  L62_2.anchorX = 0
  L62_2.anchorY = 0
  L64_2 = L62_2
  L63_2 = L62_2.setFillColor
  L65_2 = 0
  L66_2 = 0
  L67_2 = 0
  L68_2 = 0.5882352941176471
  L63_2(L64_2, L65_2, L66_2, L67_2, L68_2)
  L62_2.x = 0
  L62_2.y = 0
  L63_2 = display
  L63_2 = L63_2.newImageRect
  L64_2 = "images/gui/ranking/mainOverlay.png"
  L65_2 = 409.5
  L66_2 = 320
  L63_2 = L63_2(L64_2, L65_2, L66_2)
  L63_2.anchorX = 0.5
  L63_2.anchorY = 0
  L63_2.x = 240
  L63_2.y = 0
  L64_2 = display
  L64_2 = L64_2.newRect
  L65_2 = L63_2.x
  L66_2 = L63_2.y
  L67_2 = L63_2.width
  L67_2 = L67_2 + 10
  L68_2 = L63_2.height
  L64_2 = L64_2(L65_2, L66_2, L67_2, L68_2)
  L64_2.anchorX = 0.5
  L64_2.anchorY = 0
  L64_2.isHitTestable = true
  L66_2 = L64_2
  L65_2 = L64_2.setFillColor
  L67_2 = 0
  L68_2 = 0
  L69_2 = 0
  L70_2 = 0
  L65_2(L66_2, L67_2, L68_2, L69_2, L70_2)
  L65_2 = display
  L65_2 = L65_2.newImageRect
  L66_2 = "images/gui/ranking/mainOverlayBG.png"
  L67_2 = 212.5
  L68_2 = 272.5
  L65_2 = L65_2(L66_2, L67_2, L68_2)
  L65_2.anchorX = 0.5
  L65_2.anchorY = 0
  L65_2.x = 310
  L65_2.y = 50
  L66_2 = display
  L66_2 = L66_2.newImageRect
  L67_2 = "images/gui/ranking/dynamicTop.png"
  L68_2 = 211
  L69_2 = 44
  L66_2 = L66_2(L67_2, L68_2, L69_2)
  L66_2.anchorX = 0.5
  L66_2.anchorY = 0
  L66_2.x = 307
  L66_2.y = 47
  L67_2 = display
  L67_2 = L67_2.newImageRect
  L68_2 = "images/gui/ranking/friendsToggle2.png"
  L69_2 = 43
  L70_2 = 39
  L67_2 = L67_2(L68_2, L69_2, L70_2)
  L67_2.anchorX = 0.5
  L67_2.anchorY = 0.5
  L67_2.x = 416
  L67_2.y = 80
  L67_2.isVisible = false
  L68_2 = L10_2.createRankingPanel
  L68_2 = L68_2()
  L69_2 = L11_2.create
  L69_2 = L69_2()
  L69_2.x = 71
  L69_2.y = 274
  L70_2 = display
  L70_2 = L70_2.newImageRect
  L71_2 = "images/gui/ranking/dynamicBot.png"
  L72_2 = 223
  L73_2 = 17
  L70_2 = L70_2(L71_2, L72_2, L73_2)
  L70_2.anchorX = 0.5
  L70_2.anchorY = 0
  L70_2.x = 309
  L70_2.y = 303
  L71_2 = display
  L71_2 = L71_2.newImageRect
  L72_2 = "images/gui/ranking/avatarBG.png"
  L73_2 = 130
  L74_2 = 176.5
  L71_2 = L71_2(L72_2, L73_2, L74_2)
  L71_2.x = 131
  L71_2.y = 135
  L72_2 = display
  L72_2 = L72_2.newImageRect
  L73_2 = "images/gui/ranking/league/historyBG.png"
  L74_2 = 136
  L75_2 = 31
  L72_2 = L72_2(L73_2, L74_2, L75_2)
  L72_2.x = 133
  L72_2.y = 247
  L73_2 = L0_1
  L73_2 = L73_2.newText
  L74_2 = {}
  L75_2 = L0_1
  L75_2 = L75_2.localized
  L75_2 = L75_2.get
  L76_2 = "No League History"
  L75_2 = L75_2(L76_2)
  L74_2.string = L75_2
  L74_2.size = 10
  L74_2.x = 133
  L74_2.y = 249
  L75_2 = {}
  L76_2 = 0
  L77_2 = 0
  L78_2 = 0
  L75_2[1] = L76_2
  L75_2[2] = L77_2
  L75_2[3] = L78_2
  L74_2.color = L75_2
  L73_2 = L73_2(L74_2)
  L73_2.isVisible = false
  L74_2 = graphics
  L74_2 = L74_2.newMask
  L75_2 = "images/gui/ranking/league/historyMask.png"
  L74_2 = L74_2(L75_2)
  L76_2 = L6_2
  L75_2 = L6_2.setMask
  L77_2 = L74_2
  L75_2(L76_2, L77_2)
  L6_2.maskScaleX = 0.5
  L6_2.maskScaleY = 0.5
  L6_2.maskX = 133
  L6_2.maskY = 247
  L75_2 = ""
  L76_2 = L0_1
  L76_2 = L76_2.newText
  L77_2 = {}
  L77_2.string = L75_2
  L77_2.size = 30
  L77_2.x = 240
  L77_2.y = 16
  L78_2 = {}
  L79_2 = 1
  L80_2 = 1
  L81_2 = 1
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L77_2.color = L78_2
  L76_2 = L76_2(L77_2)
  L77_2 = L0_1
  L77_2 = L77_2.newText
  L78_2 = {}
  L78_2.string = ""
  L78_2.size = 16
  L78_2.x = 230
  L78_2.y = 61
  L78_2.ax = 0
  L77_2 = L77_2(L78_2)
  L77_2.isVisible = false
  L78_2 = L0_1
  L78_2 = L78_2.newText
  L79_2 = {}
  L79_2.string = ""
  L79_2.size = 16
  L79_2.x = 395
  L79_2.y = 61
  L79_2.ax = 1
  L78_2 = L78_2(L79_2)
  L78_2.isVisible = false
  L79_2 = L0_1
  L79_2 = L79_2.newText
  L80_2 = {}
  L80_2.string = ""
  L80_2.size = 16
  L80_2.x = 215
  L80_2.y = 61
  L80_2.ax = 0
  L79_2 = L79_2(L80_2)
  L79_2.isVisible = false
  L80_2 = display
  L80_2 = L80_2.newImageRect
  L81_2 = "images/gui/ranking/globalSelf.png"
  L82_2 = 204
  L83_2 = 24
  L80_2 = L80_2(L81_2, L82_2, L83_2)
  L80_2.isVisible = false
  L80_2.x = 306
  L80_2.y = 62
  L81_2 = nil
  L83_2 = L3_2
  L82_2 = L3_2.insert
  L84_2 = L80_2
  L82_2(L83_2, L84_2)
  L83_2 = L3_2
  L82_2 = L3_2.insert
  L84_2 = L77_2
  L82_2(L83_2, L84_2)
  L83_2 = L3_2
  L82_2 = L3_2.insert
  L84_2 = L78_2
  L82_2(L83_2, L84_2)
  L83_2 = L3_2
  L82_2 = L3_2.insert
  L84_2 = L79_2
  L82_2(L83_2, L84_2)
  L82_2 = display
  L82_2 = L82_2.newImageRect
  L83_2 = "images/gui/ranking/leagueIntro.png"
  L84_2 = 216
  L85_2 = 276
  L82_2 = L82_2(L83_2, L84_2, L85_2)
  L82_2.x = 310
  L82_2.y = 203
  L83_2 = L21_2 or L83_2
  if not L21_2 then
    L83_2 = L20_2
  end
  L82_2.isVisible = L83_2
  L83_2 = L0_1
  L83_2 = L83_2.newText
  L84_2 = {}
  L85_2 = L0_1
  L85_2 = L85_2.localized
  L85_2 = L85_2.get
  L86_2 = "Race your way to the top to get better rewards!"
  L85_2 = L85_2(L86_2)
  L84_2.string = L85_2
  L84_2.size = 13
  L84_2.ax = 0.5
  L84_2.align = "center"
  L84_2.width = 200
  L85_2 = {}
  L86_2 = 0.5647058823529412
  L87_2 = 0.5058823529411764
  L88_2 = 0.43137254901960786
  L85_2[1] = L86_2
  L85_2[2] = L87_2
  L85_2[3] = L88_2
  L84_2.color = L85_2
  L83_2 = L83_2(L84_2)
  L83_2.x = 315
  L83_2.y = 132
  L84_2 = L21_2 or L84_2
  if not L21_2 then
    L84_2 = L20_2
  end
  L83_2.isVisible = L84_2
  L84_2 = L0_1
  L84_2 = L84_2.newText
  L85_2 = {}
  L86_2 = L0_1
  L86_2 = L86_2.localized
  L86_2 = L86_2.get
  L87_2 = "Play a race to be placed!"
  L86_2 = L86_2(L87_2)
  L85_2.string = L86_2
  L85_2.size = 13
  L85_2.ax = 0.5
  L85_2.align = "center"
  L85_2.width = 200
  L86_2 = {}
  L87_2 = 0.5647058823529412
  L88_2 = 0.5058823529411764
  L89_2 = 0.43137254901960786
  L86_2[1] = L87_2
  L86_2[2] = L88_2
  L86_2[3] = L89_2
  L85_2.color = L86_2
  L84_2 = L84_2(L85_2)
  L84_2.x = 315
  L84_2.y = 225
  L85_2 = L21_2 or L85_2
  if not L21_2 then
    L85_2 = L20_2
  end
  L84_2.isVisible = L85_2
  L85_2 = L0_1
  L85_2 = L85_2.newText
  L86_2 = {}
  L87_2 = L0_1
  L87_2 = L87_2.localized
  L87_2 = L87_2.get
  L88_2 = "Every week the league is reset and you are rewarded a prize."
  L87_2 = L87_2(L88_2)
  L86_2.string = L87_2
  L86_2.size = 10
  L86_2.ax = 0.5
  L86_2.align = "center"
  L86_2.width = 140
  L87_2 = L0_1
  L87_2 = L87_2.colors
  L87_2 = L87_2.white
  L86_2.color = L87_2
  L85_2 = L85_2(L86_2)
  L85_2.x = 274
  L85_2.y = 60
  L85_2.isVisible = false
  L86_2 = nil
  
  function L87_2()
    local L0_3, L1_3
    L0_3 = false
    L21_2 = L0_3
    L0_3 = L82_2
    L0_3.isVisible = false
    L0_3 = L83_2
    L0_3.isVisible = false
    L0_3 = L84_2
    L0_3.isVisible = false
    L0_3 = L86_2
    L0_3.isVisible = false
    L0_3 = L0_1
    L0_3 = L0_3.database
    L0_3 = L0_3.setLocalLeagueData
    L1_3 = 1
    L0_3(L1_3)
    L0_3 = L38_2
    L1_3 = L54_2
    L1_3 = L18_2
    L1_3 = L1_3 ~= nil and L1_3
    L0_3.isVisible = L1_3
    L0_3 = L41_2
    L1_3 = L15_2
    L1_3 = L1_3 == 3
    L0_3.isVisible = L1_3
    L0_3 = L67_2
    L1_3 = L27_2
    L1_3 = L1_3 == 6
    L0_3.isVisible = L1_3
    L0_3 = L39_2
    L1_3 = L54_2
    L1_3 = L1_3 ~= nil
    L0_3.isVisible = L1_3
  end
  
  L88_2 = L0_1
  L88_2 = L88_2.newButton
  L89_2 = {}
  L90_2 = L83_2.x
  L89_2.x = L90_2
  L89_2.y = 250
  L89_2.width = 126
  L89_2.height = 40
  L90_2 = {}
  L91_2 = L0_1
  L91_2 = L91_2.localized
  L91_2 = L91_2.get
  L92_2 = "Got it!"
  L91_2 = L91_2(L92_2)
  L90_2.string = L91_2
  L90_2.size = 14
  L89_2.text = L90_2
  L89_2.image = "images/gui/common/buttonTextB.png"
  L89_2.onRelease = L87_2
  L88_2 = L88_2(L89_2)
  L86_2 = L88_2
  L86_2.isVisible = false
  
  function L88_2()
    local L0_3, L1_3
    L0_3 = L22_2
    L0_3 = L0_3[5]
    if L0_3 then
      L0_3 = L22_2
      L0_3 = L0_3[5]
      L0_3 = L0_3.getTable
      L0_3 = L0_3()
      L0_3.isVisible = false
    end
  end
  
  function L89_2(A0_3, A1_3, A2_3, A3_3, A4_3, A5_3, A6_3, A7_3, A8_3)
    local L9_3, L10_3
    L9_3 = L0_1
    L9_3 = L9_3.newButton
    L10_3 = {}
    L10_3.x = A0_3
    L10_3.y = A1_3
    L10_3.width = A2_3
    L10_3.height = A3_3
    L10_3.image = A4_3
    L10_3.onRelease = A5_3
    L10_3.noFill = A6_3
    L10_3.text = A8_3
    L9_3 = L9_3(L10_3)
    L9_3.isVisible = A7_3
    return L9_3
  end
  
  function L90_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L30_2
    if L0_3 then
      L0_3 = 1
      L1_3 = L30_2
      L1_3 = #L1_3
      L2_3 = 1
      for L3_3 = L0_3, L1_3, L2_3 do
        L4_3 = L30_2
        L4_3 = L4_3[L3_3]
        if L4_3 then
          L4_3 = L30_2
          L4_3 = L4_3[L3_3]
          L4_3 = L4_3.leagueIcon
          if L4_3 then
            L4_3 = L30_2
            L4_3 = L4_3[L3_3]
            L4_3 = L4_3.leagueIcon
            L4_3 = L4_3.removeSelf
            if L4_3 then
              L4_3 = L30_2
              L4_3 = L4_3[L3_3]
              L4_3 = L4_3.leagueIcon
              L5_3 = L4_3
              L4_3 = L4_3.removeSelf
              L4_3(L5_3)
              L4_3 = L30_2
              L4_3 = L4_3[L3_3]
              L4_3 = L4_3.placementPlate
              if L4_3 then
                L4_3 = L30_2
                L4_3 = L4_3[L3_3]
                L4_3 = L4_3.placementPlate
                L5_3 = L4_3
                L4_3 = L4_3.removeSelf
                L4_3(L5_3)
              end
              L4_3 = L30_2
              L4_3 = L4_3[L3_3]
              L4_3 = L4_3.placementText
              if L4_3 then
                L4_3 = L30_2
                L4_3 = L4_3[L3_3]
                L4_3 = L4_3.placementText
                L5_3 = L4_3
                L4_3 = L4_3.removeSelf
                L4_3(L5_3)
              end
            end
          end
        end
      end
    end
    L0_3 = {}
    L30_2 = L0_3
    L0_3 = L73_2
    L0_3.isVisible = false
  end
  
  function L91_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = L22_2
    L1_3 = L27_2
    L0_3 = L0_3[L1_3]
    if not L0_3 then
      return
    end
    L1_3 = L0_3.rankingList
    if L1_3 then
      L2_3 = 1
      L3_3 = #L1_3
      L4_3 = 1
      for L5_3 = L2_3, L3_3, L4_3 do
        L6_3 = L1_3[L5_3]
        L6_3.isSelected = false
      end
      L2_3 = L0_3.refreshTable
      if L2_3 then
        L2_3 = L0_3.refreshTable
        L2_3()
      end
    end
  end
  
  function L92_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3
    L2_3 = L22_2
    L2_3 = L2_3[A1_3]
    L3_3 = L2_3.rankingList
    if not L3_3 then
      L3_3 = false
      return L3_3
    end
    if L2_3 then
      L3_3 = L2_3.selectedRowIndex
      if L3_3 == nil then
        L3_3 = false
        return L3_3
      end
    end
    L3_3 = L2_3.rankingList
    L4_3 = L2_3.getTable
    L4_3 = L4_3()
    if L4_3 == nil then
      L4_3 = false
      return L4_3
    end
    L4_3 = L2_3.getTable
    L4_3 = L4_3()
    L5_3 = L4_3
    L4_3 = L4_3.getRowAtIndex
    L6_3 = L2_3.selectedRowIndex
    L4_3 = L4_3(L5_3, L6_3)
    L5_3 = L2_3.selectedRowIndex
    L5_3 = L3_3[L5_3]
    if L5_3 then
      L5_3 = L2_3.selectedRowIndex
      L5_3 = L3_3[L5_3]
      L5_3.isSelected = false
    end
    if L4_3 then
      L5_3 = L4_3.setSelected
      if L5_3 then
        L5_3 = L4_3.setSelected
        L6_3 = false
        L5_3(L6_3)
      end
    end
    L5_3 = L2_3.selectedRowIndex
    L5_3 = L5_3 == A0_3
    return L5_3
  end
  
  function L93_2()
    local L0_3, L1_3
    L0_3 = L29_2
    if L0_3 then
      L0_3 = L29_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L29_2 = L0_3
    end
  end
  
  function L94_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = L93_2
    L1_3()
    L1_3 = "images/gui/ranking/league/tierB_"
    L2_3 = A0_3
    L3_3 = ".png"
    L1_3 = L1_3 .. L2_3 .. L3_3
    L2_3 = display
    L2_3 = L2_3.newImageRect
    L3_3 = L1_3
    L4_3 = 83
    L5_3 = 81
    L2_3 = L2_3(L3_3, L4_3, L5_3)
    L29_2 = L2_3
    L2_3 = L29_2
    L2_3.x = 308
    L2_3 = L29_2
    L2_3.y = 68
    L2_3 = L2_2
    L3_3 = L2_3
    L2_3 = L2_3.insert
    L4_3 = L29_2
    L2_3(L3_3, L4_3)
  end
  
  function L95_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    L2_3 = 1
    L3_3 = #A0_3
    L4_3 = 1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = A0_3[L5_3]
      if L6_3 then
        L7_3 = L6_3.tier
        if not L7_3 then
          L7_3 = 5
          L8_3 = L6_3.fh
          if L8_3 then
            L8_3 = tonumber
            L9_3 = L6_3.fh
            L9_3 = L9_3.l
            L8_3 = L8_3(L9_3)
            L7_3 = L8_3
          end
          if A1_3 == L7_3 then
            L8_3 = {}
            L8_3.tier = true
            L8_3.linearScale = true
            L9_3 = "images/gui/ranking/league/tierB_"
            L10_3 = A1_3
            L11_3 = ".png"
            L9_3 = L9_3 .. L10_3 .. L11_3
            L8_3.imagePath = L9_3
            L9_3 = table
            L9_3 = L9_3.insert
            L10_3 = A0_3
            L11_3 = L5_3
            L12_3 = L8_3
            L9_3(L10_3, L11_3, L12_3)
            return
          end
        end
      end
    end
  end
  
  function L96_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = 0
    L2_3 = 5
    L3_3 = 1
    for L4_3 = L1_3, L2_3, L3_3 do
      L5_3 = L95_2
      L6_3 = A0_3
      L7_3 = L4_3
      L5_3(L6_3, L7_3)
    end
  end
  
  function L97_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L2_3 = L22_2
    L2_3 = L2_3[A1_3]
    if A0_3 then
      L3_3 = L2_3.rankingList
      if L3_3 then
        goto lbl_9
      end
    end
    do return end
    ::lbl_9::
    L3_3 = L2_3.rankingList
    L4_3 = {}
    L4_3.tier = true
    L5_3 = "images/gui/ranking/league/"
    L6_3 = A0_3
    L7_3 = "1.png"
    L5_3 = L5_3 .. L6_3 .. L7_3
    L4_3.imagePath = L5_3
    L5_3 = table
    L5_3 = L5_3.insert
    L6_3 = L3_3
    L7_3 = 1
    L8_3 = L4_3
    L5_3(L6_3, L7_3, L8_3)
    L5_3 = #L3_3
    if 2 < L5_3 then
      L5_3 = {}
      L5_3.tier = true
      L6_3 = "images/gui/ranking/league/"
      L7_3 = A0_3
      L8_3 = "2.png"
      L6_3 = L6_3 .. L7_3 .. L8_3
      L5_3.imagePath = L6_3
      L6_3 = table
      L6_3 = L6_3.insert
      L7_3 = L3_3
      L8_3 = 3
      L9_3 = L5_3
      L6_3(L7_3, L8_3, L9_3)
    end
    L5_3 = #L3_3
    if 6 < L5_3 then
      L5_3 = {}
      L5_3.tier = true
      L6_3 = "images/gui/ranking/league/"
      L7_3 = A0_3
      L8_3 = "3.png"
      L6_3 = L6_3 .. L7_3 .. L8_3
      L5_3.imagePath = L6_3
      L6_3 = table
      L6_3 = L6_3.insert
      L7_3 = L3_3
      L8_3 = 7
      L9_3 = L5_3
      L6_3(L7_3, L8_3, L9_3)
    end
    L5_3 = #L3_3
    if 13 < L5_3 then
      L5_3 = {}
      L5_3.tier = true
      L6_3 = "images/gui/ranking/league/"
      L7_3 = A0_3
      L8_3 = "4.png"
      L6_3 = L6_3 .. L7_3 .. L8_3
      L5_3.imagePath = L6_3
      L6_3 = table
      L6_3 = L6_3.insert
      L7_3 = L3_3
      L8_3 = 14
      L9_3 = L5_3
      L6_3(L7_3, L8_3, L9_3)
    end
    L5_3 = #L3_3
    if 24 < L5_3 then
      L5_3 = {}
      L5_3.tier = true
      L6_3 = "images/gui/ranking/league/"
      L7_3 = A0_3
      L8_3 = "5.png"
      L6_3 = L6_3 .. L7_3 .. L8_3
      L5_3.imagePath = L6_3
      L6_3 = table
      L6_3 = L6_3.insert
      L7_3 = L3_3
      L8_3 = 25
      L9_3 = L5_3
      L6_3(L7_3, L8_3, L9_3)
    end
    L5_3 = L0_1
    L5_3 = L5_3.awards
    L5_3 = L5_3.getLeagueDemotionThreshold
    L6_3 = A0_3
    L5_3, L6_3 = L5_3(L6_3)
    L52_2 = L6_3
    L51_2 = L5_3
    L5_3 = L51_2
    if L5_3 ~= 0 then
      L5_3 = L52_2
      if L5_3 == "position" then
        L5_3 = #L3_3
        L6_3 = L51_2
        L6_3 = L6_3 + 5
        if L5_3 > L6_3 then
          L5_3 = {}
          L5_3.demotion = true
          L5_3.imagePath = "images/gui/ranking/league/demote_line.png"
          L6_3 = table
          L6_3 = L6_3.insert
          L7_3 = L3_3
          L8_3 = L51_2
          L8_3 = L8_3 + 6
          L9_3 = L5_3
          L6_3(L7_3, L8_3, L9_3)
        end
      end
    end
    if 0 < A0_3 then
      L5_3 = {}
      L5_3.nextLeauge = true
      L6_3 = "images/gui/ranking/league/nextLeague_"
      L7_3 = A0_3 - 1
      L8_3 = ".png"
      L6_3 = L6_3 .. L7_3 .. L8_3
      L5_3.imagePath = L6_3
      L6_3 = table
      L6_3 = L6_3.insert
      L7_3 = L3_3
      L8_3 = 1
      L9_3 = L5_3
      L6_3(L7_3, L8_3, L9_3)
    end
  end
  
  function L98_2(A0_3)
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
  
  function L99_2(A0_3, A1_3)
    local L2_3, L3_3
    if A0_3 then
      L2_3 = A0_3.a
      L2_3 = L2_3._id
      if L2_3 then
        if A1_3 then
          L2_3 = L26_2
          L3_3 = A0_3.a
          L3_3 = L3_3._id
          L2_3[L3_3] = A0_3
        else
          L2_3 = L25_2
          L3_3 = A0_3.a
          L3_3 = L3_3._id
          L2_3[L3_3] = A0_3
        end
      end
    end
  end
  
  function L100_2(A0_3, A1_3)
    local L2_3
    if A0_3 then
      if A1_3 then
        L2_3 = L26_2
        L2_3 = L2_3[A0_3]
        return L2_3
      else
        L2_3 = L25_2
        L2_3 = L2_3[A0_3]
        return L2_3
      end
    end
    L2_3 = nil
    return L2_3
  end
  
  function L101_2(A0_3, A1_3)
    local L2_3, L3_3
    if A0_3 then
      L2_3 = A0_3.i
      if L2_3 then
        if A1_3 then
          L2_3 = L24_2
          L3_3 = A0_3.i
          L2_3[L3_3] = A0_3
        else
          L2_3 = L23_2
          L3_3 = A0_3.i
          L2_3[L3_3] = A0_3
        end
      end
    end
  end
  
  function L102_2(A0_3, A1_3)
    local L2_3
    if A0_3 then
      if A1_3 then
        L2_3 = L24_2
        L2_3 = L2_3[A0_3]
        return L2_3
      else
        L2_3 = L23_2
        L2_3 = L2_3[A0_3]
        return L2_3
      end
    end
    L2_3 = nil
    return L2_3
  end
  
  function L103_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
    L2_3 = L22_2
    L3_3 = L27_2
    L2_3 = L2_3[L3_3]
    if L2_3 then
      L3_3 = L2_3.rankingList
      if L3_3 then
        L3_3 = L2_3.rankingList
        L4_3 = L22_2
        L4_3 = L4_3[A0_3]
        L4_3 = L4_3.getTable
        L4_3 = L4_3()
        L5_3 = false
        L6_3 = 1
        L7_3 = L22_2
        L7_3 = L7_3[A0_3]
        L7_3 = L7_3.rankingList
        L7_3 = #L7_3
        L8_3 = 1
        for L9_3 = L6_3, L7_3, L8_3 do
          L10_3 = L22_2
          L10_3 = L10_3[A0_3]
          L10_3 = L10_3.rankingList
          L10_3 = L10_3[L9_3]
          L11_3 = L10_3._id
          L12_3 = L10_3.rowIndex
          L13_3 = L10_3.tier
          L13_3 = L10_3.nextLeauge
          L13_3 = not L13_3 and L13_3
          if L12_3 and L13_3 then
            if not L5_3 then
              L14_3 = L22_2
              L14_3 = L14_3[A0_3]
              L14_3.selectedRowIndex = L12_3
              L5_3 = true
              L10_3.isSelected = true
              L15_3 = L4_3
              L14_3 = L4_3.scrollToY
              L16_3 = {}
              L16_3.y = 20
              L16_3.time = 0
              L14_3(L15_3, L16_3)
              if A1_3 then
                L14_3 = L102_2
                L15_3 = L11_3
                L16_3 = A0_3 == 4
                L14_3 = L14_3(L15_3, L16_3)
                if L14_3 then
                  L15_3 = L17_2
                  L15_3 = L15_3.updateStats
                  L16_3 = L14_3
                  L15_3(L16_3)
                  L15_3 = L17_2
                  L15_3 = L15_3.createMonsterModules
                  L16_3 = L14_3.fa
                  L17_3 = L14_3.p
                  L15_3(L16_3, L17_3)
                  L15_3 = L90_2
                  L15_3()
                  L15_3 = L14_3.fi
                  L30_2 = L15_3
                  L15_3 = L45_2
                  L15_3()
                end
              end
            else
              L10_3.isSelected = false
            end
          end
        end
        L6_3 = L2_3.refreshTable
        L6_3()
      end
    end
  end
  
  function L104_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
    L3_3 = L22_2
    L4_3 = L27_2
    L3_3 = L3_3[L4_3]
    if L3_3 then
      L4_3 = L3_3.rankingList
      if L4_3 then
        L4_3 = L3_3.rankingList
        L5_3 = L22_2
        L5_3 = L5_3[A0_3]
        L5_3 = L5_3.getTable
        L5_3 = L5_3()
        L6_3 = 0
        L7_3 = 1
        L8_3 = L22_2
        L8_3 = L8_3[A0_3]
        L8_3 = L8_3.rankingList
        L8_3 = #L8_3
        L9_3 = 1
        for L10_3 = L7_3, L8_3, L9_3 do
          L11_3 = L22_2
          L11_3 = L11_3[A0_3]
          L11_3 = L11_3.rankingList
          L11_3 = L11_3[L10_3]
          L12_3 = L11_3._id
          L13_3 = L11_3.rowIndex
          if L12_3 == A1_3 then
            L14_3 = L22_2
            L14_3 = L14_3[A0_3]
            L14_3 = L14_3.rankingList
            L14_3 = L14_3[L10_3]
            L14_3.isSelected = true
            L14_3 = L22_2
            L14_3 = L14_3[A0_3]
            L14_3.selectedRowIndex = L13_3
            L14_3 = L6_3 - 118
            L6_3 = L14_3 + 15
            if L6_3 < 60 then
              L6_3 = 60
            end
            L15_3 = L5_3
            L14_3 = L5_3.scrollToY
            L16_3 = {}
            L17_3 = -L6_3
            L16_3.y = L17_3
            L16_3.time = 0
            L14_3(L15_3, L16_3)
            if A2_3 then
              L14_3 = L102_2
              L15_3 = A1_3
              L16_3 = A0_3 == 4
              L14_3 = L14_3(L15_3, L16_3)
              if L14_3 then
                L15_3 = L17_2
                L15_3 = L15_3.updateStats
                L16_3 = L14_3
                L15_3(L16_3)
                L15_3 = L17_2
                L15_3 = L15_3.createMonsterModules
                L16_3 = L14_3.fa
                L17_3 = L14_3.p
                L15_3(L16_3, L17_3)
                L15_3 = L90_2
                L15_3()
                L15_3 = L14_3.fi
                L30_2 = L15_3
                L15_3 = L45_2
                L15_3()
              end
            end
          else
            L14_3 = L22_2
            L14_3 = L14_3[A0_3]
            L14_3 = L14_3.rankingList
            L14_3 = L14_3[L10_3]
            L14_3.isSelected = false
            L14_3 = 30
            L15_3 = L11_3.tier
            if L15_3 then
              L14_3 = 30
            else
              L15_3 = L11_3.nextLeauge
              if L15_3 then
                L14_3 = 78
              end
            end
            L6_3 = L6_3 + L14_3
          end
        end
        L7_3 = L3_3.refreshTable
        L7_3()
      end
    end
  end
  
  function L105_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = 1
    L1_3 = 10
    L2_3 = 1
    for L3_3 = L0_3, L1_3, L2_3 do
      L4_3 = L22_2
      L4_3 = L4_3[L3_3]
      if L4_3 then
        L4_3 = L22_2
        L4_3 = L4_3[L3_3]
        L4_3 = L4_3.getTable
        if L4_3 then
          L4_3 = L22_2
          L4_3 = L4_3[L3_3]
          L4_3 = L4_3.getTable
          L4_3 = L4_3()
          if L4_3 then
            L5_3 = L4_3.isVisible
            if L5_3 then
              L4_3.isVisible = false
            end
          end
        end
      end
    end
  end
  
  function L106_2(A0_3)
    local L1_3
    L1_3 = L22_2
    L1_3 = L1_3[A0_3]
    if L1_3 then
      L1_3 = L22_2
      L1_3 = L1_3[A0_3]
      L1_3 = L1_3.getTable
      if L1_3 then
        L1_3 = L22_2
        L1_3 = L1_3[A0_3]
        L1_3 = L1_3.getTable
        L1_3 = L1_3()
        if L1_3 then
          L1_3.isVisible = true
        end
      end
    end
  end
  
  function L107_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L77_2
    L0_3.isSelected = false
    L0_3 = L77_2
    L1_3 = L0_3
    L0_3 = L0_3.setFillColor
    L2_3 = 0
    L3_3 = 0
    L4_3 = 0
    L0_3(L1_3, L2_3, L3_3, L4_3)
    L0_3 = L78_2
    L1_3 = L0_3
    L0_3 = L0_3.setFillColor
    L2_3 = 0
    L3_3 = 0
    L4_3 = 0
    L0_3(L1_3, L2_3, L3_3, L4_3)
    L0_3 = L79_2
    L1_3 = L0_3
    L0_3 = L0_3.setFillColor
    L2_3 = 0
    L3_3 = 0
    L4_3 = 0
    L0_3(L1_3, L2_3, L3_3, L4_3)
  end
  
  function L108_2(A0_3)
    local L1_3
    L1_3 = L81_2
    if L1_3 then
      L1_3 = L81_2
      L1_3.isVisible = A0_3
    end
  end
  
  function L109_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = L81_2
    if L1_3 then
      L1_3 = L81_2
      L2_3 = L1_3
      L1_3 = L1_3.removeSelf
      L1_3(L2_3)
      L1_3 = nil
      L81_2 = L1_3
    end
    if not A0_3 then
      return
    end
    L1_3 = display
    L1_3 = L1_3.newImageRect
    L2_3 = "images/gui/ranking/league/tierS_"
    L3_3 = A0_3
    L4_3 = ".png"
    L2_3 = L2_3 .. L3_3 .. L4_3
    L3_3 = 20
    L4_3 = 20
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    L81_2 = L1_3
    L1_3 = L81_2
    L1_3.anchorX = 0.5
    L1_3 = L81_2
    L1_3.anchorY = 0.5
    L1_3 = L81_2
    L1_3.x = 218
    L1_3 = L81_2
    L1_3.y = 60
    L1_3 = L3_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L81_2
    L1_3(L2_3, L3_3)
  end
  
  function L110_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L3_3 = L77_2
    if L3_3 ~= nil then
      L3_3 = L78_2
      if L3_3 ~= nil then
        goto lbl_20
      end
    end
    L3_3 = print
    L4_3 = "WARNING: selfName is "
    L5_3 = L77_2
    L3_3(L4_3, L5_3)
    L3_3 = print
    L4_3 = "WARNING: selfRating is "
    L5_3 = L78_2
    L3_3(L4_3, L5_3)
    L3_3 = print
    L4_3 = "WARNING: selfPosition is "
    L5_3 = L79_2
    L3_3(L4_3, L5_3)
    do return end
    ::lbl_20::
    L3_3 = L27_2
    if L3_3 ~= 7 then
      L3_3 = L27_2
      if L3_3 ~= 8 then
        goto lbl_30
      end
    end
    L3_3 = L108_2
    L4_3 = false
    L3_3(L4_3)
    goto lbl_32
    ::lbl_30::
    L3_3 = L79_2
    L3_3.text = ""
    ::lbl_32::
    L3_3 = string
    L3_3 = L3_3.len
    L4_3 = L79_2
    L4_3 = L4_3.text
    L3_3 = L3_3(L4_3)
    if 0 < L3_3 then
      L3_3 = L79_2
      L4_3 = L79_2
      L4_3 = L4_3.text
      L5_3 = "."
      L4_3 = L4_3 .. L5_3
      L3_3.text = L4_3
    end
    L3_3 = L79_2
    L3_3.isSelected = A1_3
    L3_3 = L79_2
    L3_3.isVisible = A2_3
    L3_3 = L77_2
    L4_3 = L79_2
    L4_3 = L4_3.x
    L5_3 = L79_2
    L5_3 = L5_3.contentWidth
    L4_3 = L4_3 + L5_3
    L4_3 = L4_3 + 5
    L3_3.x = L4_3
    L3_3 = L77_2
    L3_3 = L3_3.x
    L3_3 = 240 - L3_3
    L3_3 = L3_3 + 120
    L4_3 = L0_1
    L4_3 = L4_3.fitText
    L5_3 = A0_3
    L6_3 = 16
    L7_3 = L3_3
    L4_3 = L4_3(L5_3, L6_3, L7_3)
    L5_3 = L77_2
    L6_3 = string
    L6_3 = L6_3.upper
    L7_3 = L4_3
    L6_3 = L6_3(L7_3)
    L5_3.text = L6_3
    L5_3 = L77_2
    L5_3.isSelected = A1_3
    L5_3 = L77_2
    L5_3.isVisible = A2_3
    L5_3 = L78_2
    L5_3.isVisible = A2_3
    L5_3 = L40_2
    L5_3.isVisible = A2_3
    L5_3 = L80_2
    L5_3.isVisible = A2_3
    L5_3 = L108_2
    L6_3 = A2_3
    L5_3(L6_3)
    if A1_3 then
      L5_3 = L77_2
      L6_3 = L5_3
      L5_3 = L5_3.setFillColor
      L7_3 = 0.2
      L8_3 = 0.432
      L9_3 = 0.12
      L5_3(L6_3, L7_3, L8_3, L9_3)
      L5_3 = L78_2
      L6_3 = L5_3
      L5_3 = L5_3.setFillColor
      L7_3 = 0.2
      L8_3 = 0.432
      L9_3 = 0.12
      L5_3(L6_3, L7_3, L8_3, L9_3)
      L5_3 = L79_2
      L6_3 = L5_3
      L5_3 = L5_3.setFillColor
      L7_3 = 0.2
      L8_3 = 0.432
      L9_3 = 0.12
      L5_3(L6_3, L7_3, L8_3, L9_3)
    else
      L5_3 = L77_2
      L6_3 = L5_3
      L5_3 = L5_3.setFillColor
      L7_3 = 0
      L8_3 = 0
      L9_3 = 0
      L5_3(L6_3, L7_3, L8_3, L9_3)
      L5_3 = L78_2
      L6_3 = L5_3
      L5_3 = L5_3.setFillColor
      L7_3 = 0
      L8_3 = 0
      L9_3 = 0
      L5_3(L6_3, L7_3, L8_3, L9_3)
      L5_3 = L79_2
      L6_3 = L5_3
      L5_3 = L5_3.setFillColor
      L7_3 = 0
      L8_3 = 0
      L9_3 = 0
      L5_3(L6_3, L7_3, L8_3, L9_3)
    end
  end
  
  function L111_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3
    L2_3 = L0_1
    L2_3 = L2_3.database
    L2_3 = L2_3.getPlayerInformation
    L2_3 = L2_3()
    L2_3 = L2_3.username
    L3_3 = L0_1
    L3_3 = L3_3.data
    L3_3 = L3_3.clans
    if L3_3 then
      L3_3 = L0_1
      L3_3 = L3_3.data
      L3_3 = L3_3.clans
      L3_3 = L3_3.tag
      if L3_3 then
        L3_3 = L0_1
        L3_3 = L3_3.data
        L3_3 = L3_3.clans
        L3_3 = L3_3.tag
        L4_3 = "."
        L5_3 = L2_3
        L2_3 = L3_3 .. L4_3 .. L5_3
      end
    end
    L3_3 = L110_2
    L4_3 = L2_3
    L5_3 = A0_3
    L6_3 = A1_3
    L3_3(L4_3, L5_3, L6_3)
  end
  
  function L112_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3
    if A0_3 then
      L3_3 = L0_1
      L3_3 = L3_3.data
      L3_3 = L3_3.clans
      L3_3 = L3_3.inClan
      if L3_3 then
        L3_3 = A0_3.a
        if L3_3 then
          L3_3 = A0_3.a
          L3_3 = L3_3._id
          L4_3 = L0_1
          L4_3 = L4_3.data
          L4_3 = L4_3.clans
          L4_3 = L4_3.clanId
          if L3_3 == L4_3 then
            L3_3 = L27_2
            if L3_3 ~= 7 then
              L3_3 = L27_2
            end
            if L3_3 == 8 and A2_3 then
              L3_3 = L78_2
              L4_3 = A0_3.g
              L3_3.text = L4_3
              L3_3 = L79_2
              L4_3 = A0_3.placement
              if not L4_3 then
                L4_3 = ""
              end
              L3_3.text = L4_3
            end
            L3_3 = L110_2
            L4_3 = L0_1
            L4_3 = L4_3.data
            L4_3 = L4_3.clans
            L4_3 = L4_3.name
            L5_3 = A1_3
            L6_3 = A2_3
            L3_3(L4_3, L5_3, L6_3)
        end
      end
    end
    else
      L3_3 = L110_2
      L4_3 = ""
      L5_3 = false
      L6_3 = false
      L3_3(L4_3, L5_3, L6_3)
    end
  end
  
  function L49_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L0_1
    L0_3 = L0_3.database
    L0_3 = L0_3.getPlayerInformation
    L0_3 = L0_3()
    L0_3 = L0_3.username
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.clans
    if L1_3 then
      L1_3 = L0_1
      L1_3 = L1_3.data
      L1_3 = L1_3.clans
      L1_3 = L1_3.tag
      if L1_3 then
        L1_3 = L0_1
        L1_3 = L1_3.data
        L1_3 = L1_3.clans
        L1_3 = L1_3.tag
        L2_3 = "."
        L3_3 = L0_3
        L0_3 = L1_3 .. L2_3 .. L3_3
      end
    end
    L1_3 = {}
    L1_3.u = L0_3
    L2_3 = L17_2
    L2_3 = L2_3.updateStats
    L3_3 = L1_3
    L2_3(L3_3)
    L2_3 = L17_2
    L2_3 = L2_3.createMonsterModules
    L3_3 = L0_1
    L3_3 = L3_3.monsterConverter
    L3_3 = L3_3.toServerFormat
    L4_3 = L0_1
    L4_3 = L4_3.database
    L4_3 = L4_3.getAvatarData
    L4_3 = L4_3()
    L3_3 = L3_3(L4_3)
    L4_3 = L0_1
    L4_3 = L4_3.data
    L4_3 = L4_3.playerInfo
    L4_3 = L4_3.showcase
    L2_3(L3_3, L4_3)
    L2_3 = L90_2
    L2_3()
    L2_3 = L45_2
    L2_3()
  end
  
  function L113_2(A0_3)
    local L1_3, L2_3
    L1_3 = L17_2
    L1_3 = L1_3.updateClanInfo
    L2_3 = A0_3
    L1_3(L2_3)
  end
  
  function L48_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L17_2
    L1_3 = L1_3.updateStats
    L2_3 = A0_3.p
    L1_3(L2_3)
    L1_3 = L17_2
    L1_3 = L1_3.createMonsterModules
    L2_3 = A0_3.p
    L2_3 = L2_3.fa
    L3_3 = A0_3.p
    L3_3 = L3_3.p
    L1_3(L2_3, L3_3)
    L1_3 = L90_2
    L1_3()
    L1_3 = A0_3.p
    L1_3 = L1_3.fi
    L30_2 = L1_3
    L1_3 = L45_2
    L1_3()
  end
  
  function L50_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L68_2
    L1_3 = L1_3.updateClanInfo
    L2_3 = A0_3
    L1_3(L2_3)
    L1_3 = L57_2
    L1_3 = L1_3.setClanLeagueHistory
    L2_3 = A0_3.j
    L1_3(L2_3)
    L1_3 = A0_3.j
    if L1_3 then
      L1_3 = L73_2
      L2_3 = A0_3.j
      L2_3 = #L2_3
      L2_3 = L2_3 <= 0
      L1_3.isVisible = L2_3
    else
      L1_3 = L73_2
      L1_3.isVisible = true
    end
    L1_3 = {}
    L2_3 = A0_3.e
    L1_3.games = L2_3
    L2_3 = A0_3.f
    L1_3.wins = L2_3
    L2_3 = A0_3.c
    L1_3.deaths = L2_3
    L2_3 = A0_3.b
    L1_3.kills = L2_3
    L2_3 = A0_3.m
    L1_3.members = L2_3
    L2_3 = A0_3.q
    L1_3.topPlacement = L2_3
    L2_3 = A0_3.a
    L2_3 = L2_3.a
    L1_3.tag = L2_3
    L2_3 = L69_2
    L2_3 = L2_3.setStats
    L3_3 = L1_3
    L2_3(L3_3)
  end
  
  function L114_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L1_3 = L15_2
    if L1_3 == 3 then
      L0_3 = L54_2
    else
      L1_3 = L15_2
      if L1_3 == 4 then
        L0_3 = L53_2
      else
        L1_3 = L15_2
        if L1_3 == 2 then
          L1_3 = L27_2
          if L1_3 == 7 then
            L0_3 = L55_2
          else
            L1_3 = L27_2
            if L1_3 == 8 then
              L0_3 = L56_2
            end
          end
          if L0_3 then
            L1_3 = L112_2
            L2_3 = L0_3
            L3_3 = true
            L4_3 = true
            L1_3(L2_3, L3_3, L4_3)
            L1_3 = L50_2
            L2_3 = L0_3
            L1_3(L2_3)
          end
          L1_3 = L91_2
          L1_3()
          return
        end
      end
    end
    L1_3 = L91_2
    L1_3()
    if L0_3 then
      L1_3 = L111_2
      L2_3 = true
      L3_3 = true
      L1_3(L2_3, L3_3)
      L1_3 = L48_2
      L2_3 = L0_3
      L1_3(L2_3)
      L1_3 = L0_3.p
      L1_3 = L1_3.fh
      if L1_3 then
        L1_3 = L0_3.p
        L1_3 = L1_3.fh
        L1_3 = L1_3.l
        if L1_3 then
          L1_3 = L109_2
          L2_3 = L0_3.p
          L2_3 = L2_3.fh
          L2_3 = L2_3.l
          L1_3(L2_3)
      end
      else
        L1_3 = L109_2
        L2_3 = nil
        L1_3(L2_3)
      end
    end
  end
  
  function L115_2(A0_3)
    local L1_3, L2_3
    L1_3 = L16_2
    if L1_3 then
      L1_3 = false
      return L1_3
    end
    L1_3 = L15_2
    if A0_3 == L1_3 then
      L1_3 = false
      return L1_3
    end
    L1_3 = nil
    L28_2 = L1_3
    L1_3 = L105_2
    L1_3()
    L1_3 = L38_2
    L2_3 = L54_2
    if L2_3 then
      L2_3 = L18_2
      L2_3 = L21_2
      L2_3 = A0_3 == 1 and L2_3
    end
    L1_3.isVisible = L2_3
    L1_3 = L39_2
    L2_3 = L54_2
    if L2_3 then
      L2_3 = L21_2
      L2_3 = A0_3 == 1 and L2_3
    end
    L1_3.isVisible = L2_3
    L1_3 = L82_2
    L2_3 = L20_2
    L2_3 = A0_3 == 1 and (L2_3 or L2_3)
    L1_3.isVisible = L2_3
    L1_3 = L83_2
    L2_3 = L20_2
    L2_3 = A0_3 == 1 and (L2_3 or L2_3)
    L1_3.isVisible = L2_3
    L1_3 = L84_2
    L2_3 = L20_2
    L2_3 = A0_3 == 1 and L2_3 and L2_3
    L1_3.isVisible = L2_3
    L1_3 = L86_2
    L2_3 = L20_2
    L2_3 = A0_3 == 1 and L2_3
    L1_3.isVisible = L2_3
    L1_3 = L6_2
    L2_3 = A0_3 ~= 2
    L1_3.isVisible = L2_3
    L1_3 = L41_2
    L2_3 = A0_3 == 3
    L1_3.isVisible = L2_3
    L1_3 = L67_2
    L2_3 = L15_2
    L2_3 = 6 == L2_3
    L1_3.isVisible = L2_3
    L1_3 = L37_2
    L2_3 = L15_2
    L1_3 = L1_3[L2_3]
    L1_3 = L1_3[1]
    L1_3.isVisible = false
    L1_3 = L37_2
    L2_3 = L15_2
    L1_3 = L1_3[L2_3]
    L1_3 = L1_3[2]
    L1_3.isVisible = true
    L15_2 = A0_3
    L1_3 = L37_2
    L2_3 = L15_2
    L1_3 = L1_3[L2_3]
    L1_3 = L1_3[1]
    L1_3.isVisible = true
    L1_3 = L37_2
    L2_3 = L15_2
    L1_3 = L1_3[L2_3]
    L1_3 = L1_3[2]
    L1_3.isVisible = false
    L1_3 = true
    return L1_3
  end
  
  function L116_2(A0_3)
    local L1_3
    L1_3 = L68_2
    L1_3.isVisible = A0_3
    L1_3 = L69_2
    L1_3.isVisible = A0_3
    L1_3 = L42_2
    L1_3.isVisible = A0_3
    L1_3 = L57_2
    L1_3.isVisible = A0_3
  end
  
  function L117_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L115_2
    L1_3 = 1
    L0_3 = L0_3(L1_3)
    if L0_3 then
      L1_3 = L22_2
      L1_3 = L1_3[1]
      if not L1_3 then
        L1_3 = L0_1
        L1_3 = L1_3.comm
        L1_3 = L1_3.getMyLeagueMessage
        L1_3()
      end
      L1_3 = L73_2
      L2_3 = L0_1
      L2_3 = L2_3.localized
      L2_3 = L2_3.get
      L3_3 = "No League History"
      L2_3 = L2_3(L3_3)
      L1_3.text = L2_3
      L1_3 = L38_2
      L1_3 = L1_3.changeText
      L2_3 = L0_1
      L2_3 = L2_3.localized
      L2_3 = L2_3.get
      L3_3 = "Top 50"
      L2_3, L3_3, L4_3 = L2_3(L3_3)
      L1_3(L2_3, L3_3, L4_3)
      L1_3 = L106_2
      L2_3 = 1
      L1_3(L2_3)
      L1_3 = 1
      L27_2 = L1_3
      L1_3 = L46_2
      L2_3 = true
      L1_3(L2_3)
      L1_3 = L104_2
      L2_3 = 1
      L3_3 = L0_1
      L3_3 = L3_3.database
      L3_3 = L3_3.getPlayerInformation
      L3_3 = L3_3()
      L3_3 = L3_3.playerId
      L4_3 = true
      L1_3(L2_3, L3_3, L4_3)
      L1_3 = L66_2
      L1_3.isVisible = true
      L1_3 = L70_2
      L1_3.isVisible = true
      L1_3 = L17_2
      L1_3 = L1_3.show
      L1_3()
      L1_3 = L116_2
      L2_3 = false
      L1_3(L2_3)
      L1_3 = L61_2
      L2_3 = L70_2
      L2_3 = L2_3.isVisible
      L1_3.isVisible = L2_3
      L1_3 = L61_2
      L2_3 = L60_2
      L1_3.text = L2_3
      L1_3 = L111_2
      L2_3 = false
      L3_3 = false
      L1_3(L2_3, L3_3)
      L1_3 = L54_2
      if L1_3 then
        L1_3 = L54_2
        L1_3 = L1_3.p
        if L1_3 then
          L1_3 = L54_2
          L1_3 = L1_3.p
          L1_3 = L1_3.fh
          if L1_3 then
            L1_3 = L39_2
            L1_3 = L1_3.changeText
            L2_3 = L0_1
            L2_3 = L2_3.localized
            L2_3 = L2_3.get
            L3_3 = "Prizes"
            L2_3, L3_3, L4_3 = L2_3(L3_3)
            L1_3(L2_3, L3_3, L4_3)
        end
      end
      else
        L1_3 = L76_2
        L2_3 = L0_1
        L2_3 = L2_3.localized
        L2_3 = L2_3.get
        L3_3 = "My League"
        L2_3 = L2_3(L3_3)
        L1_3.text = L2_3
      end
      L1_3 = L88_2
      L1_3()
    end
    L1_3 = L85_2
    L1_3.isVisible = false
  end
  
  function L118_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = 7
    L27_2 = L0_3
    L0_3 = L106_2
    L1_3 = 7
    L0_3(L1_3)
    L0_3 = L112_2
    L1_3 = L55_2
    L2_3 = true
    L3_3 = true
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L76_2
    L1_3 = L0_1
    L1_3 = L1_3.localized
    L1_3 = L1_3.get
    L2_3 = "Clans"
    L1_3 = L1_3(L2_3)
    L0_3.text = L1_3
    L0_3 = L46_2
    L1_3 = false
    L0_3(L1_3)
  end
  
  function L119_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L115_2
    L1_3 = 2
    L0_3 = L0_3(L1_3)
    L1_3 = L85_2
    L1_3.isVisible = false
    if L0_3 then
      L1_3 = L22_2
      L1_3 = L1_3[7]
      if not L1_3 then
        L1_3 = L0_1
        L1_3 = L1_3.comm
        L1_3 = L1_3.clanLeague
        L1_3()
      end
      L1_3 = L93_2
      L1_3()
      L1_3 = L73_2
      L2_3 = L0_1
      L2_3 = L2_3.localized
      L2_3 = L2_3.get
      L3_3 = "No Clan History"
      L2_3 = L2_3(L3_3)
      L1_3.text = L2_3
      L1_3 = L17_2
      L1_3 = L1_3.hide
      L1_3()
      L1_3 = L66_2
      L1_3.isVisible = true
      L1_3 = L70_2
      L1_3.isVisible = true
      L1_3 = L116_2
      L2_3 = true
      L1_3(L2_3)
      L1_3 = L61_2
      L2_3 = L70_2
      L2_3 = L2_3.isVisible
      L1_3.isVisible = L2_3
      L1_3 = L61_2
      L2_3 = L59_2
      L1_3.text = L2_3
      L1_3 = L118_2
      L1_3()
    end
  end
  
  function L120_2()
    local L0_3, L1_3, L2_3
    L0_3 = 3
    L27_2 = L0_3
    L0_3 = L106_2
    L1_3 = 3
    L0_3(L1_3)
    L0_3 = L35_2
    if L0_3 then
      L0_3 = L78_2
      L1_3 = L35_2
      L0_3.text = L1_3
    else
      L0_3 = L78_2
      L0_3.text = "0"
    end
    L0_3 = L76_2
    L1_3 = L0_1
    L1_3 = L1_3.localized
    L1_3 = L1_3.get
    L2_3 = "Friends"
    L1_3 = L1_3(L2_3)
    L0_3.text = L1_3
    L0_3 = L46_2
    L1_3 = false
    L0_3(L1_3)
    L0_3 = L111_2
    L1_3 = true
    L2_3 = true
    L0_3(L1_3, L2_3)
    L0_3 = L114_2
    L0_3()
  end
  
  function L121_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L115_2
    L1_3 = 3
    L0_3 = L0_3(L1_3)
    L1_3 = L85_2
    L1_3.isVisible = false
    if L0_3 then
      L1_3 = L73_2
      L2_3 = L0_1
      L2_3 = L2_3.localized
      L2_3 = L2_3.get
      L3_3 = "No League History"
      L2_3 = L2_3(L3_3)
      L1_3.text = L2_3
      L1_3 = L17_2
      L1_3 = L1_3.show
      L1_3()
      L1_3 = L116_2
      L2_3 = false
      L1_3(L2_3)
      L1_3 = L66_2
      L1_3.isVisible = true
      L1_3 = L70_2
      L1_3.isVisible = true
      L1_3 = L61_2
      L2_3 = L70_2
      L2_3 = L2_3.isVisible
      L1_3.isVisible = L2_3
      L1_3 = L61_2
      L2_3 = L60_2
      L1_3.text = L2_3
      L1_3 = L22_2
      L1_3 = L1_3[3]
      if not L1_3 then
        L1_3 = L0_1
        L1_3 = L1_3.comm
        L1_3 = L1_3.getFriendLeague
        L1_3()
      else
        L1_3 = L120_2
        L1_3()
      end
    end
  end
  
  function L122_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L115_2
    L1_3 = 4
    L0_3 = L0_3(L1_3)
    L1_3 = L85_2
    L1_3.isVisible = false
    if L0_3 then
      L1_3 = L22_2
      L1_3 = L1_3[4]
      if not L1_3 then
        L1_3 = L0_1
        L1_3 = L1_3.comm
        L1_3 = L1_3.getHallOfFameLeague
        L1_3()
      else
        L1_3 = 4
        L27_2 = L1_3
        L1_3 = L106_2
        L2_3 = 4
        L1_3(L2_3)
        L1_3 = L53_2
        if L1_3 then
          L1_3 = L53_2
          L1_3 = L1_3.p
          if L1_3 then
            L1_3 = L53_2
            L1_3 = L1_3.p
            L1_3 = L1_3.r
            if L1_3 then
              L1_3 = L78_2
              L2_3 = L53_2
              L2_3 = L2_3.p
              L2_3 = L2_3.r
              L1_3.text = L2_3
            end
          end
        end
        L1_3 = L111_2
        L2_3 = true
        L3_3 = true
        L1_3(L2_3, L3_3)
        L1_3 = L73_2
        L2_3 = L0_1
        L2_3 = L2_3.localized
        L2_3 = L2_3.get
        L3_3 = "No League History"
        L2_3 = L2_3(L3_3)
        L1_3.text = L2_3
        L1_3 = L76_2
        L2_3 = L0_1
        L2_3 = L2_3.localized
        L2_3 = L2_3.get
        L3_3 = "Hall of Fame"
        L2_3 = L2_3(L3_3)
        L1_3.text = L2_3
        L1_3 = L46_2
        L2_3 = false
        L1_3(L2_3)
        L1_3 = L114_2
        L1_3()
      end
      L1_3 = L17_2
      L1_3 = L1_3.show
      L1_3()
      L1_3 = L116_2
      L2_3 = false
      L1_3(L2_3)
      L1_3 = L66_2
      L1_3.isVisible = true
      L1_3 = L70_2
      L1_3.isVisible = false
      L1_3 = L61_2
      L2_3 = L70_2
      L2_3 = L2_3.isVisible
      L1_3.isVisible = L2_3
      L1_3 = L61_2
      L2_3 = L60_2
      L1_3.text = L2_3
    end
  end
  
  function L123_2()
    local L0_3, L1_3
  end
  
  function L124_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    L0_3 = L54_2
    if not L0_3 then
      return
    end
    L0_3 = L22_2
    L0_3 = L0_3[5]
    if L0_3 then
      L0_3 = L22_2
      L0_3 = L0_3[5]
      L0_3 = L0_3.getTable
      L0_3 = L0_3()
      L0_3 = L0_3.isVisible
      if L0_3 then
        L0_3 = L38_2
        L0_3 = L0_3.changeText
        L1_3 = L0_1
        L1_3 = L1_3.localized
        L1_3 = L1_3.get
        L2_3 = "Top 50"
        L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3 = L1_3(L2_3)
        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
        L0_3 = L106_2
        L1_3 = 1
        L0_3(L1_3)
        L0_3 = 1
        L27_2 = L0_3
        L0_3 = L46_2
        L1_3 = true
        L0_3(L1_3)
        L0_3 = L104_2
        L1_3 = 1
        L2_3 = L0_1
        L2_3 = L2_3.database
        L2_3 = L2_3.getPlayerInformation
        L2_3 = L2_3()
        L2_3 = L2_3.playerId
        L3_3 = true
        L0_3(L1_3, L2_3, L3_3)
        L0_3 = L66_2
        L0_3.isVisible = true
        L0_3 = L70_2
        L0_3.isVisible = true
        L0_3 = L61_2
        L1_3 = L70_2
        L1_3 = L1_3.isVisible
        L0_3.isVisible = L1_3
        L0_3 = L61_2
        L1_3 = L60_2
        L0_3.text = L1_3
        L0_3 = L111_2
        L1_3 = false
        L2_3 = false
        L0_3(L1_3, L2_3)
        L0_3 = L18_2
        if not L0_3 then
          L0_3 = L38_2
          L0_3.isVisible = true
        end
        L0_3 = L39_2
        L0_3 = L0_3.changeText
        L1_3 = L0_1
        L1_3 = L1_3.localized
        L1_3 = L1_3.get
        L2_3 = "Prizes"
        L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3 = L1_3(L2_3)
        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
        L0_3 = L85_2
        L0_3.isVisible = false
        L0_3 = L22_2
        L0_3 = L0_3[5]
        L0_3 = L0_3.getTable
        L0_3 = L0_3()
        L0_3.isVisible = false
        return
      end
    end
    L0_3 = L22_2
    L0_3 = L0_3[5]
    if not L0_3 then
      L0_3 = L22_2
      L1_3 = L7_2
      L1_3 = L1_3.new
      L2_3 = 205
      L3_3 = 85
      L4_3 = 205
      L5_3 = 236
      L6_3 = 30
      L7_3 = nil
      L8_3 = "rankingPrizes"
      L9_3 = L44_2
      L10_3 = 10
      L11_3 = nil
      L12_3 = 50
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
      L0_3[5] = L1_3
      L0_3 = L22_2
      L0_3 = L0_3[5]
      L0_3.tableIndex = 5
    else
      L0_3 = L22_2
      L0_3 = L0_3[5]
      L0_3 = L0_3.getTable
      L0_3 = L0_3()
      L0_3.isVisible = true
    end
    L0_3 = {}
    L1_3 = 0
    L2_3 = 4
    L3_3 = 1
    for L4_3 = L1_3, L2_3, L3_3 do
      L5_3 = L4_3 + 1
      L6_3 = {}
      L0_3[L5_3] = L6_3
      L5_3 = nil
      if L4_3 == 0 then
        L5_3 = 168
      else
        L5_3 = 141
      end
      L6_3 = L4_3 + 1
      L6_3 = L0_3[L6_3]
      L6_3.rowHeight = L5_3
      L6_3 = L4_3 + 1
      L6_3 = L0_3[L6_3]
      L7_3 = L0_1
      L7_3 = L7_3.currentLeague
      L6_3.myLeague = L7_3
      L6_3 = L4_3 + 1
      L6_3 = L0_3[L6_3]
      L7_3 = L19_2
      L6_3.myTier = L7_3
    end
    L1_3 = L22_2
    L1_3 = L1_3[5]
    L1_3 = L1_3.createTable
    L2_3 = L0_3
    L3_3 = L2_2
    L1_3(L2_3, L3_3)
    L1_3 = L47_2
    L2_3 = L22_2
    L2_3 = L2_3[5]
    L1_3(L2_3)
    L1_3 = L54_2
    if L1_3 then
      L1_3 = L22_2
      L1_3 = L1_3[5]
      L1_3 = L1_3.getTable
      L1_3 = L1_3()
      if L1_3 then
        L2_3 = L1_3.getContentPosition
        if L2_3 then
          L2_3 = L1_3.scrollToY
          if L2_3 then
            L2_3 = tonumber
            L3_3 = L54_2
            L3_3 = L3_3.p
            L3_3 = L3_3.fh
            L3_3 = L3_3.l
            L2_3 = L2_3(L3_3)
            if 0 < L2_3 then
              L2_3 = tonumber
              L3_3 = L54_2
              L3_3 = L3_3.p
              L3_3 = L3_3.fh
              L3_3 = L3_3.l
              L2_3 = L2_3(L3_3)
              L2_3 = L2_3 - 1
              if 3 < L2_3 then
                L2_3 = 3
              end
              L2_3 = L2_3 - 0.25
              L3_3 = L2_3 * 141
              L3_3 = 168 + L3_3
              L5_3 = L1_3
              L4_3 = L1_3.scrollToY
              L6_3 = {}
              L7_3 = -L3_3
              L6_3.y = L7_3
              L6_3.time = 0
              L4_3(L5_3, L6_3)
            end
          end
        end
      end
    end
    L1_3 = L38_2
    L1_3.isVisible = false
    L1_3 = L85_2
    L1_3.isVisible = true
    L1_3 = L39_2
    L1_3 = L1_3.changeText
    L2_3 = L0_1
    L2_3 = L2_3.localized
    L2_3 = L2_3.get
    L3_3 = "Back"
    L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3 = L2_3(L3_3)
    L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
  end
  
  L125_2 = {}
  L37_2[1] = L125_2
  L125_2 = L37_2[1]
  L126_2 = L89_2
  L127_2 = 35
  L128_2 = 80
  L129_2 = 62
  L130_2 = 62
  L131_2 = "images/gui/ranking/tab_myleague.png"
  L132_2 = L123_2
  L133_2 = true
  L134_2 = true
  L126_2 = L126_2(L127_2, L128_2, L129_2, L130_2, L131_2, L132_2, L133_2, L134_2)
  L125_2[1] = L126_2
  L125_2 = L37_2[1]
  L126_2 = L89_2
  L127_2 = 35
  L128_2 = 80
  L129_2 = 62
  L130_2 = 62
  L131_2 = "images/gui/ranking/tab_myleagueInactive.png"
  L132_2 = L117_2
  L133_2 = true
  L134_2 = false
  L126_2 = L126_2(L127_2, L128_2, L129_2, L130_2, L131_2, L132_2, L133_2, L134_2)
  L125_2[2] = L126_2
  L125_2 = {}
  L37_2[2] = L125_2
  L125_2 = L37_2[2]
  L126_2 = L89_2
  L127_2 = 35
  L128_2 = 145
  L129_2 = 62
  L130_2 = 62
  L131_2 = "images/gui/ranking/tab_clans.png"
  L132_2 = L123_2
  L133_2 = true
  L134_2 = false
  L126_2 = L126_2(L127_2, L128_2, L129_2, L130_2, L131_2, L132_2, L133_2, L134_2)
  L125_2[1] = L126_2
  L125_2 = L37_2[2]
  L126_2 = L89_2
  L127_2 = 35
  L128_2 = 145
  L129_2 = 62
  L130_2 = 62
  L131_2 = "images/gui/ranking/tab_clansInactive.png"
  L132_2 = L119_2
  L133_2 = true
  L134_2 = true
  L126_2 = L126_2(L127_2, L128_2, L129_2, L130_2, L131_2, L132_2, L133_2, L134_2)
  L125_2[2] = L126_2
  L125_2 = {}
  L37_2[3] = L125_2
  L125_2 = L37_2[3]
  L126_2 = L89_2
  L127_2 = 35
  L128_2 = 210
  L129_2 = 62
  L130_2 = 62
  L131_2 = "images/gui/ranking/tab_friends.png"
  L132_2 = L123_2
  L133_2 = true
  L134_2 = false
  L126_2 = L126_2(L127_2, L128_2, L129_2, L130_2, L131_2, L132_2, L133_2, L134_2)
  L125_2[1] = L126_2
  L125_2 = L37_2[3]
  L126_2 = L89_2
  L127_2 = 35
  L128_2 = 210
  L129_2 = 62
  L130_2 = 62
  L131_2 = "images/gui/ranking/tab_friendsInactive.png"
  L132_2 = L121_2
  L133_2 = true
  L134_2 = true
  L126_2 = L126_2(L127_2, L128_2, L129_2, L130_2, L131_2, L132_2, L133_2, L134_2)
  L125_2[2] = L126_2
  L125_2 = {}
  L37_2[4] = L125_2
  L125_2 = L37_2[4]
  L126_2 = L89_2
  L127_2 = 35
  L128_2 = 275
  L129_2 = 62
  L130_2 = 62
  L131_2 = "images/gui/ranking/tab_hof.png"
  L132_2 = L123_2
  L133_2 = true
  L134_2 = false
  L126_2 = L126_2(L127_2, L128_2, L129_2, L130_2, L131_2, L132_2, L133_2, L134_2)
  L125_2[1] = L126_2
  L125_2 = L37_2[4]
  L126_2 = L89_2
  L127_2 = 35
  L128_2 = 275
  L129_2 = 62
  L130_2 = 62
  L131_2 = "images/gui/ranking/tab_hofInactive.png"
  L132_2 = L122_2
  L133_2 = true
  L134_2 = true
  L126_2 = L126_2(L127_2, L128_2, L129_2, L130_2, L131_2, L132_2, L133_2, L134_2)
  L125_2[2] = L126_2
  
  function L125_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3
    L1_3 = 80
    L2_3 = 80
    L3_3 = 246
    L4_3 = nil
    L5_3 = #A0_3
    if 5 < L5_3 then
      L5_3 = #A0_3
      L5_3 = L5_3 - 5
      L5_3 = 25 * L5_3
      L1_3 = L1_3 - L5_3
      L2_3 = L1_3
    end
    L5_3 = 1
    L6_3 = #A0_3
    L7_3 = 1
    for L8_3 = L5_3, L6_3, L7_3 do
      L4_3 = A0_3[L8_3]
      if L4_3 then
        L9_3 = L4_3.l
        L10_3 = display
        L10_3 = L10_3.newImageRect
        L11_3 = "images/gui/ranking/league/tierS_"
        L12_3 = L9_3
        L13_3 = ".png"
        L11_3 = L11_3 .. L12_3 .. L13_3
        L12_3 = 27
        L13_3 = 26
        L10_3 = L10_3(L11_3, L12_3, L13_3)
        L10_3.x = L1_3
        L10_3.y = L3_3
        L11_3 = L6_2
        L12_3 = L11_3
        L11_3 = L11_3.insert
        L13_3 = L10_3
        L11_3(L12_3, L13_3)
        L4_3.leagueIcon = L10_3
        L11_3 = L4_3.leagueIcon
        L12_3 = L10_3.x
        L11_3.orgX = L12_3
        L11_3 = L4_3.leagueIcon
        L11_3.startX = L2_3
        L11_3 = L4_3.p
        if L11_3 then
          L12_3 = display
          L12_3 = L12_3.newImageRect
          L13_3 = "images/gui/ranking/league/historySeason.png"
          L14_3 = 16
          L15_3 = 8
          L12_3 = L12_3(L13_3, L14_3, L15_3)
          L12_3.x = L1_3
          L13_3 = L3_3 + 9
          L12_3.y = L13_3
          L4_3.placementPlate = L12_3
          L13_3 = L6_2
          L14_3 = L13_3
          L13_3 = L13_3.insert
          L15_3 = L12_3
          L13_3(L14_3, L15_3)
          L13_3 = L0_1
          L13_3 = L13_3.newText
          L14_3 = {}
          L14_3.string = L11_3
          L14_3.size = 7
          L15_3 = L12_3.x
          L14_3.x = L15_3
          L15_3 = L12_3.y
          L14_3.y = L15_3
          L14_3.align = "center"
          L15_3 = {}
          L16_3 = 1
          L17_3 = 1
          L18_3 = 1
          L19_3 = 0.8
          L15_3[1] = L16_3
          L15_3[2] = L17_3
          L15_3[3] = L18_3
          L15_3[4] = L19_3
          L14_3.color = L15_3
          L13_3 = L13_3(L14_3)
          L14_3 = L6_2
          L15_3 = L14_3
          L14_3 = L14_3.insert
          L16_3 = L13_3
          L14_3(L15_3, L16_3)
          L4_3.placementText = L13_3
        end
        L1_3 = L1_3 + 25
      end
    end
    L5_3 = L73_2
    L6_3 = #A0_3
    L6_3 = L6_3 <= 0
    L5_3.isVisible = L6_3
  end
  
  function L47_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L62_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L64_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L71_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L72_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L73_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L65_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L5_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L6_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L57_2
    L1_3(L2_3, L3_3)
    if A0_3 then
      L1_3 = L2_2
      L2_3 = L1_3
      L1_3 = L1_3.insert
      L3_3 = A0_3.getTable
      L3_3, L4_3, L5_3, L6_3, L7_3 = L3_3()
      L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)
    end
    L1_3 = 1
    L2_3 = L37_2
    L2_3 = #L2_3
    L3_3 = 1
    for L4_3 = L1_3, L2_3, L3_3 do
      L5_3 = L2_2
      L6_3 = L5_3
      L5_3 = L5_3.insert
      L7_3 = L37_2
      L7_3 = L7_3[L4_3]
      L7_3 = L7_3[2]
      L5_3(L6_3, L7_3)
    end
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L63_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L66_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L70_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L76_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L4_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L40_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L3_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L68_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L69_2
    L1_3(L2_3, L3_3)
    L1_3 = 1
    L2_3 = L37_2
    L2_3 = #L2_3
    L3_3 = 1
    for L4_3 = L1_3, L2_3, L3_3 do
      L5_3 = L2_2
      L6_3 = L5_3
      L5_3 = L5_3.insert
      L7_3 = L37_2
      L7_3 = L7_3[L4_3]
      L7_3 = L7_3[1]
      L5_3(L6_3, L7_3)
    end
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L36_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L61_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L38_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L41_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L42_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L67_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L39_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L85_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L82_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L83_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L84_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L86_2
    L1_3(L2_3, L3_3)
    L1_3 = L2_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L14_2
    L1_3(L2_3, L3_3)
    if A0_3 then
      L1_3 = L15_2
      if L1_3 == 1 then
        L1_3 = A0_3.tableIndex
        if L1_3 ~= 1 then
          L1_3 = A0_3.tableIndex
          if L1_3 ~= 2 then
            goto lbl_170
          end
        end
        L1_3 = L94_2
        L2_3 = A0_3.leagueType
        L1_3(L2_3)
      end
    end
    ::lbl_170::
  end
  
  function L126_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3
    L3_3 = A2_3 == 8
    L4_3 = L100_2
    L5_3 = A0_3._id
    L6_3 = L3_3
    L4_3 = L4_3(L5_3, L6_3)
    if not L4_3 then
      if L3_3 then
        L5_3 = L0_1
        L5_3 = L5_3.comm
        L5_3 = L5_3.clanHallOfFameDetails
        L6_3 = A0_3._id
        L5_3(L6_3)
      else
        L5_3 = L0_1
        L5_3 = L5_3.comm
        L5_3 = L5_3.getClanLeagueDetails
        L6_3 = A0_3._id
        L5_3(L6_3)
      end
    else
      L5_3 = L106_2
      L6_3 = A2_3
      L5_3(L6_3)
      L5_3 = L50_2
      L6_3 = L4_3
      L5_3(L6_3)
    end
  end
  
  function L44_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L3_3 = L22_2
    L3_3 = L3_3[A2_3]
    if not L3_3 then
      L4_3 = print
      L5_3 = "No valid ranking table"
      L4_3(L5_3)
      return
    end
    L4_3 = L3_3.rankingList
    if not L4_3 then
      L5_3 = print
      L6_3 = "No valid ranking list"
      L5_3(L6_3)
      return
    end
    L5_3 = A0_3._id
    L28_2 = L5_3
    L5_3 = L92_2
    L6_3 = A1_3
    L7_3 = A2_3
    L5_3 = L5_3(L6_3, L7_3)
    if not L5_3 then
      if A2_3 == 7 or A2_3 == 8 then
        L6_3 = L126_2
        L7_3 = A0_3
        L8_3 = A1_3
        L9_3 = A2_3
        L6_3(L7_3, L8_3, L9_3)
      else
        L6_3 = false
        if A2_3 == 4 or A2_3 == 6 then
          L6_3 = true
        end
        L7_3 = L102_2
        L8_3 = A0_3._id
        L9_3 = L6_3
        L7_3 = L7_3(L8_3, L9_3)
        if not L7_3 then
          if A2_3 == 4 or A2_3 == 6 then
            L8_3 = L0_1
            L8_3 = L8_3.comm
            L8_3 = L8_3.getPlayerHallOfFameDetailsMessage
            L9_3 = A0_3._id
            L8_3(L9_3)
          else
            L8_3 = L0_1
            L8_3 = L8_3.comm
            L8_3 = L8_3.getPlayerLeagueDetailsMessage
            L9_3 = A0_3._id
            L8_3(L9_3)
          end
        else
          L8_3 = L17_2
          L8_3 = L8_3.updateStats
          L9_3 = L7_3
          L8_3(L9_3)
          L8_3 = L17_2
          L8_3 = L8_3.createMonsterModules
          L9_3 = L7_3.fa
          L10_3 = L7_3.p
          L8_3(L9_3, L10_3)
          L8_3 = L90_2
          L8_3()
          L8_3 = L7_3.fi
          L30_2 = L8_3
          L8_3 = L45_2
          L8_3()
        end
      end
    else
    end
    if A1_3 then
      L3_3.selectedRowIndex = A1_3
      L6_3 = L3_3.selectedRowIndex
      L6_3 = L4_3[L6_3]
      L6_3.isSelected = true
    end
    L6_3 = L77_2
    L6_3 = L6_3.isSelected
    if L6_3 then
      L6_3 = L107_2
      L6_3()
    end
  end
  
  function L127_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  function L46_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = L22_2
    L2_3 = L27_2
    L1_3 = L1_3[L2_3]
    if L1_3 and A0_3 then
      L2_3 = L76_2
      L3_3 = L0_1
      L3_3 = L3_3.awards
      L3_3 = L3_3.getLeagueNameText
      L4_3 = L1_3.leagueType
      L4_3 = L4_3 + 1
      L3_3 = L3_3(L4_3)
      L2_3.text = L3_3
    end
    L2_3 = L91_2
    L2_3()
    L2_3 = L47_2
    L3_3 = L1_3
    L2_3(L3_3)
  end
  
  function L128_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L105_2
    L0_3()
    L0_3 = L22_2
    L1_3 = L27_2
    L0_3 = L0_3[L1_3]
    L1_3 = L27_2
    if L1_3 == 1 then
      L1_3 = 2
      L27_2 = L1_3
      L1_3 = L22_2
      L1_3 = L1_3[2]
      if not L1_3 then
        L1_3 = L0_1
        L1_3 = L1_3.comm
        L1_3 = L1_3.getEliteLeague
        L1_3()
      else
        L1_3 = L106_2
        L2_3 = 2
        L1_3(L2_3)
        L1_3 = L46_2
        L2_3 = true
        L1_3(L2_3)
        L1_3 = L103_2
        L2_3 = 2
        L3_3 = true
        L1_3(L2_3, L3_3)
      end
      L1_3 = L38_2
      L1_3 = L1_3.changeText
      L2_3 = L0_1
      L2_3 = L2_3.localized
      L2_3 = L2_3.get
      L3_3 = "My League"
      L2_3, L3_3, L4_3 = L2_3(L3_3)
      L1_3(L2_3, L3_3, L4_3)
    else
      L1_3 = L27_2
      if L1_3 == 2 then
        L1_3 = 1
        L27_2 = L1_3
        L1_3 = L106_2
        L2_3 = 1
        L1_3(L2_3)
        L1_3 = L46_2
        L2_3 = true
        L1_3(L2_3)
        L1_3 = L104_2
        L2_3 = 1
        L3_3 = L0_1
        L3_3 = L3_3.database
        L3_3 = L3_3.getPlayerInformation
        L3_3 = L3_3()
        L3_3 = L3_3.playerId
        L4_3 = true
        L1_3(L2_3, L3_3, L4_3)
        L1_3 = L38_2
        L1_3 = L1_3.changeText
        L2_3 = L0_1
        L2_3 = L2_3.localized
        L2_3 = L2_3.get
        L3_3 = "Top 50"
        L2_3, L3_3, L4_3 = L2_3(L3_3)
        L1_3(L2_3, L3_3, L4_3)
      end
    end
  end
  
  function L129_2()
    local L0_3, L1_3, L2_3
    L0_3 = L105_2
    L0_3()
    L0_3 = L27_2
    if L0_3 == 3 then
      L0_3 = 6
      L27_2 = L0_3
      L0_3 = L22_2
      L0_3 = L0_3[6]
      if not L0_3 then
        L0_3 = L0_1
        L0_3 = L0_3.comm
        L0_3 = L0_3.getFriendHallOfFame
        L0_3()
      else
        L0_3 = L106_2
        L1_3 = 6
        L0_3(L1_3)
        L0_3 = L53_2
        if L0_3 then
          L0_3 = L53_2
          L0_3 = L0_3.p
          if L0_3 then
            L0_3 = L53_2
            L0_3 = L0_3.p
            L0_3 = L0_3.r
            if L0_3 then
              L0_3 = L78_2
              L1_3 = L53_2
              L1_3 = L1_3.p
              L1_3 = L1_3.r
              L0_3.text = L1_3
            end
          end
        end
        L0_3 = L111_2
        L1_3 = true
        L2_3 = true
        L0_3(L1_3, L2_3)
        L0_3 = L46_2
        L1_3 = false
        L0_3(L1_3)
        L0_3 = L114_2
        L0_3()
        L0_3 = L76_2
        L1_3 = L0_1
        L1_3 = L1_3.localized
        L1_3 = L1_3.get
        L2_3 = "Hall of Fame - Friends"
        L1_3 = L1_3(L2_3)
        L0_3.text = L1_3
      end
      L0_3 = L67_2
      L0_3.isVisible = true
      L0_3 = L70_2
      L0_3.isVisible = false
      L0_3 = L61_2
      L1_3 = L70_2
      L1_3 = L1_3.isVisible
      L0_3.isVisible = L1_3
      L0_3 = L61_2
      L1_3 = L60_2
      L0_3.text = L1_3
    else
      L0_3 = L120_2
      L0_3()
      L0_3 = L67_2
      L0_3.isVisible = false
      L0_3 = L70_2
      L0_3.isVisible = true
      L0_3 = L61_2
      L1_3 = L70_2
      L1_3 = L1_3.isVisible
      L0_3.isVisible = L1_3
      L0_3 = L61_2
      L1_3 = L60_2
      L0_3.text = L1_3
    end
  end
  
  function L130_2()
    local L0_3, L1_3, L2_3
    L0_3 = L53_2
    if L0_3 then
      L0_3 = L78_2
      L1_3 = L53_2
      L1_3 = L1_3.p
      L1_3 = L1_3.r
      L0_3.text = L1_3
      L0_3 = L111_2
      L1_3 = false
      L2_3 = true
      L0_3(L1_3, L2_3)
    end
  end
  
  function L131_2()
    local L0_3, L1_3, L2_3
    L0_3 = L35_2
    if L0_3 then
      L0_3 = L78_2
      L1_3 = L35_2
      L0_3.text = L1_3
      L0_3 = L111_2
      L1_3 = false
      L2_3 = true
      L0_3(L1_3, L2_3)
    end
  end
  
  function L132_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L105_2
    L0_3()
    L0_3 = L27_2
    if L0_3 == 7 then
      L0_3 = 8
      L27_2 = L0_3
      L0_3 = L22_2
      L0_3 = L0_3[8]
      if not L0_3 then
        L0_3 = L0_1
        L0_3 = L0_3.comm
        L0_3 = L0_3.clanHallOfFame
        L0_3()
      else
        L0_3 = L106_2
        L1_3 = 8
        L0_3(L1_3)
        L0_3 = L76_2
        L1_3 = L0_1
        L1_3 = L1_3.localized
        L1_3 = L1_3.get
        L2_3 = "Hall of Fame - Clans"
        L1_3 = L1_3(L2_3)
        L0_3.text = L1_3
        L0_3 = L112_2
        L1_3 = L56_2
        L2_3 = true
        L3_3 = true
        L0_3(L1_3, L2_3, L3_3)
        L0_3 = L46_2
        L1_3 = false
        L0_3(L1_3)
      end
      L0_3 = L42_2
      L0_3 = L0_3.changeButtonImage
      L1_3 = "images/gui/ranking/friendsToggle2.png"
      L0_3(L1_3)
      L0_3 = L70_2
      L0_3.isVisible = false
      L0_3 = L61_2
      L1_3 = L70_2
      L1_3 = L1_3.isVisible
      L0_3.isVisible = L1_3
      L0_3 = L61_2
      L1_3 = L59_2
      L0_3.text = L1_3
      L0_3 = L68_2
      L0_3 = L0_3.showTopPlayers
      L1_3 = false
      L0_3(L1_3)
    else
      L0_3 = L118_2
      L0_3()
      L0_3 = L42_2
      L0_3 = L0_3.changeButtonImage
      L1_3 = "images/gui/ranking/friendsToggle.png"
      L0_3(L1_3)
      L0_3 = L70_2
      L0_3.isVisible = true
      L0_3 = L61_2
      L1_3 = L70_2
      L1_3 = L1_3.isVisible
      L0_3.isVisible = L1_3
      L0_3 = L61_2
      L1_3 = L59_2
      L0_3.text = L1_3
      L0_3 = L68_2
      L0_3 = L0_3.showTopPlayers
      L1_3 = true
      L0_3(L1_3)
    end
  end
  
  function L133_2(A0_3)
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
  
  function L134_2(A0_3)
    local L1_3
    L1_3 = true
    return L1_3
  end
  
  L135_2 = L0_1
  L135_2 = L135_2.newButton
  L136_2 = {}
  L136_2.x = 408
  L136_2.y = 16
  L136_2.width = 43
  L136_2.height = 38
  L136_2.image = "images/gui/common/buttonClosePopupRed.png"
  L136_2.onRelease = L127_2
  L135_2 = L135_2(L136_2)
  L36_2 = L135_2
  L135_2 = L0_1
  L135_2 = L135_2.newButton
  L136_2 = {}
  L136_2.x = 234
  L136_2.y = 62
  L136_2.width = 60
  L136_2.height = 35
  L137_2 = {}
  L138_2 = L0_1
  L138_2 = L138_2.localized
  L138_2 = L138_2.get
  L139_2 = "Top 50"
  L138_2 = L138_2(L139_2)
  L137_2.string = L138_2
  L137_2.size = 14
  L136_2.text = L137_2
  L136_2.image = "images/gui/ranking/button.png"
  L136_2.onRelease = L128_2
  L135_2 = L135_2(L136_2)
  L38_2 = L135_2
  L38_2.isVisible = false
  L135_2 = L0_1
  L135_2 = L135_2.newButton
  L136_2 = {}
  L136_2.x = 416
  L136_2.y = 80
  L136_2.width = 43
  L136_2.height = 39
  L136_2.image = "images/gui/ranking/friendsToggle.png"
  L136_2.onRelease = L129_2
  L135_2 = L135_2(L136_2)
  L41_2 = L135_2
  L41_2.isVisible = false
  L135_2 = L0_1
  L135_2 = L135_2.newButton
  L136_2 = {}
  L136_2.x = 416
  L136_2.y = 80
  L136_2.width = 43
  L136_2.height = 39
  L136_2.image = "images/gui/ranking/friendsToggle.png"
  L136_2.onRelease = L132_2
  L135_2 = L135_2(L136_2)
  L42_2 = L135_2
  L42_2.isVisible = false
  L135_2 = L0_1
  L135_2 = L135_2.newButton
  L136_2 = {}
  L137_2 = L80_2.x
  L136_2.x = L137_2
  L137_2 = L80_2.y
  L136_2.y = L137_2
  L137_2 = L80_2.width
  L136_2.width = L137_2
  L137_2 = L80_2.height
  L136_2.height = L137_2
  L136_2.onRelease = L114_2
  L135_2 = L135_2(L136_2)
  L40_2 = L135_2
  L40_2.isVisible = false
  L135_2 = L0_1
  L135_2 = L135_2.newButton
  L136_2 = {}
  L136_2.x = 382
  L136_2.y = 62
  L136_2.width = 60
  L136_2.height = 35
  L137_2 = {}
  L138_2 = L0_1
  L138_2 = L138_2.localized
  L138_2 = L138_2.get
  L139_2 = "Prizes"
  L138_2 = L138_2(L139_2)
  L137_2.string = L138_2
  L137_2.size = 14
  L136_2.text = L137_2
  L136_2.image = "images/gui/ranking/button.png"
  L136_2.onRelease = L124_2
  L135_2 = L135_2(L136_2)
  L39_2 = L135_2
  L39_2.isVisible = false
  
  function L135_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = 1
    L2_3 = #A0_3
    L3_3 = 1
    for L4_3 = L1_3, L2_3, L3_3 do
      L5_3 = A0_3[L4_3]
      L5_3.index = L4_3
    end
  end
  
  function L43_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3
    L3_3 = L22_2
    L3_3 = L3_3[A1_3]
    if not L3_3 then
      L3_3 = L22_2
      L4_3 = L7_2
      L4_3 = L4_3.new
      L5_3 = 206
      L6_3 = 85
      L7_3 = 200
      L8_3 = 236
      L9_3 = 30
      L10_3 = nil
      L11_3 = "ranking"
      L12_3 = L44_2
      L13_3 = 0
      L14_3 = nil
      L15_3 = 50
      L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)
      L3_3[A1_3] = L4_3
    end
    L3_3 = L22_2
    L3_3 = L3_3[A1_3]
    L3_3.leagueType = A2_3
    L3_3.tableIndex = A1_3
    L27_2 = A1_3
    if A0_3 then
      L3_3.rankingList = A0_3
      L4_3 = L3_3.rankingList
      L4_3.leagueType = A2_3
      L4_3 = L3_3.rankingList
      L4_3.tableIndex = A1_3
      if A1_3 == 1 or A1_3 == 2 then
        L4_3 = L97_2
        L5_3 = L3_3.rankingList
        L5_3 = L5_3.leagueType
        L6_3 = A1_3
        L4_3(L5_3, L6_3)
      elseif A1_3 == 3 then
        L4_3 = L96_2
        L5_3 = L3_3.rankingList
        L4_3(L5_3)
      end
    end
    L4_3 = L91_2
    L4_3()
    L4_3 = L3_3.createTable
    L5_3 = L3_3.rankingList
    L6_3 = L2_2
    L4_3(L5_3, L6_3)
    L4_3 = L47_2
    L5_3 = L3_3
    L4_3(L5_3)
  end
  
  function L45_2()
    local L0_3, L1_3
    L0_3 = L30_2
    if not L0_3 then
      L0_3 = {}
      L30_2 = L0_3
    end
    L0_3 = 0
    L31_2 = L0_3
    L0_3 = L30_2
    L0_3 = #L0_3
    L0_3 = L0_3 * 25
    L0_3 = -L0_3
    L32_2 = L0_3
    L0_3 = L30_2
    L0_3 = #L0_3
    L0_3 = 5 < L0_3
    L33_2 = L0_3
    L0_3 = L30_2
    L0_3 = #L0_3
    L0_3 = L0_3 * 25
    L0_3 = L0_3 - 125
    L34_2 = L0_3
    L0_3 = L125_2
    L1_3 = L30_2
    L0_3(L1_3)
  end
  
  function L136_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L2_3 = A1_3.phase
    if L2_3 == "began" then
      A0_3.delta = 0
      L2_3 = A1_3.x
      A0_3.markX = L2_3
      L2_3 = A1_3.y
      A0_3.markY = L2_3
      L2_3 = A1_3.x
      A0_3.startXPos = L2_3
    else
      L2_3 = A1_3.phase
      if L2_3 == "moved" then
        L2_3 = A0_3.markX
        if not L2_3 then
          L2_3 = A1_3.x
          A0_3.markX = L2_3
          L2_3 = A1_3.y
          A0_3.markY = L2_3
        end
        L2_3 = A1_3.x
        L3_3 = A0_3.markX
        L2_3 = L2_3 - L3_3
        A0_3.delta = L2_3
        L2_3 = L33_2
        if L2_3 then
          L2_3 = L31_2
          L3_3 = A0_3.delta
          L2_3 = L2_3 + L3_3
          L31_2 = L2_3
          L2_3 = L31_2
          if L2_3 < 0 then
            A0_3.delta = 0
            L2_3 = 0
            L31_2 = L2_3
          else
            L2_3 = L31_2
            L3_3 = L34_2
            if L2_3 > L3_3 then
              A0_3.delta = 0
              L2_3 = L34_2
              L31_2 = L2_3
            else
              L2_3 = L30_2
              L2_3 = L2_3[1]
              L2_3 = L2_3.leagueIcon
              L2_3 = L2_3.x
              L3_3 = L30_2
              L3_3 = L3_3[1]
              L3_3 = L3_3.leagueIcon
              L3_3 = L3_3.startX
              if L2_3 < L3_3 then
                L2_3 = A0_3.delta
                if L2_3 < 0 then
              end
              else
                L2_3 = L30_2
                L3_3 = L30_2
                L3_3 = #L3_3
                L2_3 = L2_3[L3_3]
                L2_3 = L2_3.leagueIcon
                L2_3 = L2_3.x
                if 205 < L2_3 then
                  L2_3 = A0_3.delta
                  if 0 < L2_3 then
                end
                else
                  L2_3 = 1
                  L3_3 = L30_2
                  L3_3 = #L3_3
                  L4_3 = 1
                  for L5_3 = L2_3, L3_3, L4_3 do
                    L6_3 = L30_2
                    L6_3 = L6_3[L5_3]
                    L6_3 = L6_3.leagueIcon
                    L7_3 = L30_2
                    L7_3 = L7_3[L5_3]
                    L7_3 = L7_3.leagueIcon
                    L7_3 = L7_3.x
                    L8_3 = A0_3.delta
                    L7_3 = L7_3 + L8_3
                    L6_3.x = L7_3
                    L6_3 = L30_2
                    L6_3 = L6_3[L5_3]
                    L6_3 = L6_3.placementPlate
                    L7_3 = L30_2
                    L7_3 = L7_3[L5_3]
                    L7_3 = L7_3.leagueIcon
                    L7_3 = L7_3.x
                    L6_3.x = L7_3
                    L6_3 = L30_2
                    L6_3 = L6_3[L5_3]
                    L6_3 = L6_3.placementText
                    L7_3 = L30_2
                    L7_3 = L7_3[L5_3]
                    L7_3 = L7_3.leagueIcon
                    L7_3 = L7_3.x
                    L6_3.x = L7_3
                  end
                end
              end
            end
          end
          L2_3 = A1_3.x
          A0_3.markX = L2_3
        end
      else
        L2_3 = A1_3.phase
        if L2_3 == "ended" then
          L2_3 = math
          L2_3 = L2_3.abs
          L3_3 = A0_3.startXPos
          L4_3 = A1_3.x
          L3_3 = L3_3 - L4_3
          L2_3 = L2_3(L3_3)
          if L2_3 < 3 then
            L2_3 = L14_2
            if L2_3 then
              L2_3 = L14_2
              L2_3 = L2_3.interact
              L3_3 = {}
              L3_3.text = "This is the players league placement history. Newest entries are to the right."
              L4_3 = A1_3.x
              L4_3 = L4_3 + 66
              L3_3.x = L4_3
              L4_3 = A1_3.y
              L4_3 = L4_3 - 38
              L3_3.y = L4_3
              L3_3.arrowHorizontal = "left"
              L3_3.arrowVertical = "bottom"
              L2_3(L3_3)
            end
          end
        end
      end
    end
    L2_3 = true
    return L2_3
  end
  
  L6_2.touch = L136_2
  
  function L136_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = L0_1
    L1_3 = L1_3.database
    L1_3 = L1_3.getPlayerInformation
    L1_3 = L1_3()
    L1_3 = L1_3.playerId
    L2_3 = 1
    L3_3 = #A0_3
    L4_3 = 1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = A0_3[L5_3]
      L6_3 = L6_3._id
      if L6_3 == L1_3 then
        if L5_3 == 1 then
          L6_3 = 1
          return L6_3
        elseif L5_3 < 5 then
          L6_3 = 2
          return L6_3
        elseif L5_3 < 11 then
          L6_3 = 3
          return L6_3
        elseif L5_3 < 21 then
          L6_3 = 4
          return L6_3
        else
          L6_3 = 5
          return L6_3
        end
      end
    end
    L2_3 = 5
    return L2_3
  end
  
  function L137_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L2_3 = L0_1
    L2_3 = L2_3.database
    L2_3 = L2_3.getPlayerInformation
    L2_3 = L2_3()
    L2_3 = L2_3.playerId
    L3_3 = 1
    L4_3 = #A0_3
    L5_3 = 1
    for L6_3 = L3_3, L4_3, L5_3 do
      L7_3 = A0_3[L6_3]
      L7_3 = L7_3._id
      if L7_3 == L2_3 then
        L7_3 = A0_3[L6_3]
        L7_3.demotionStatus = A1_3
        return
      end
    end
  end
  
  function L138_2(A0_3)
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
  
  function L139_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = L16_2
    if L1_3 then
      return
    end
    L1_3 = A0_3.m
    L2_3 = L8_2
    L2_3 = L2_3.getMyLeagueMessage
    L2_3 = L2_3()
    if L1_3 == L2_3 then
      L1_3 = A0_3.r
      if L1_3 then
        L1_3 = A0_3.r
        if L1_3 == 81 then
          L1_3 = print
          L2_3 = "Never placed in league"
          L1_3(L2_3)
        else
          L1_3 = A0_3.r
          if L1_3 == 82 then
            L1_3 = print
            L2_3 = "Not placed in league this week"
            L1_3(L2_3)
          end
        end
        L1_3 = true
        L20_2 = L1_3
        L1_3 = L15_2
        if L1_3 == 1 then
          L1_3 = L82_2
          L1_3.isVisible = true
          L1_3 = L83_2
          L1_3.isVisible = true
          L1_3 = L84_2
          L1_3.isVisible = true
          L1_3 = L86_2
          L1_3.isVisible = false
          L1_3 = L76_2
          L2_3 = L0_1
          L2_3 = L2_3.localized
          L2_3 = L2_3.get
          L3_3 = "My League"
          L2_3 = L2_3(L3_3)
          L1_3.text = L2_3
        end
        L1_3 = L49_2
        L1_3()
        return
      end
      L1_3 = A0_3.p
      if L1_3 then
        L1_3 = A0_3.p
        L1_3 = L1_3.fh
        if L1_3 then
          goto lbl_61
        end
      end
      L1_3 = print
      L2_3 = "No player entry"
      L1_3(L2_3)
      do return end
      ::lbl_61::
      L1_3 = A0_3.s
      if L1_3 == nil then
        L1_3 = print
        L2_3 = "WARNING: Player is not in a league"
        L1_3(L2_3)
        return
      end
      L1_3 = tonumber
      L2_3 = A0_3.s
      L2_3 = L2_3.l
      L1_3 = L1_3(L2_3)
      L2_3 = L0_1
      L2_3.currentLeague = L1_3
      L2_3 = L1_3 == 0
      L18_2 = L2_3
      L2_3 = A0_3.l
      L3_3 = A0_3.d
      if L3_3 then
        L3_3 = L137_2
        L4_3 = L2_3
        L5_3 = A0_3.d
        L3_3(L4_3, L5_3)
      else
        L3_3 = L137_2
        L4_3 = L2_3
        L5_3 = 1
        L3_3(L4_3, L5_3)
      end
      L3_3 = A0_3.t
      if L3_3 then
        L3_3 = L138_2
        L4_3 = A0_3.t
        L3_3 = L3_3(L4_3)
        L60_2 = L3_3
        L3_3 = L61_2
        L4_3 = L60_2
        L3_3.text = L4_3
      end
      L3_3 = A0_3.p
      L4_3 = A0_3.h
      L3_3.l = L4_3
      L3_3 = A0_3.p
      L3_3 = L3_3.fh
      L4_3 = L136_2
      L5_3 = L2_3
      L4_3 = L4_3(L5_3)
      L3_3.t = L4_3
      L3_3 = A0_3.p
      L3_3 = L3_3.fh
      L3_3 = L3_3.t
      L19_2 = L3_3
      L3_3 = L135_2
      L4_3 = L2_3
      L3_3(L4_3)
      L3_3 = L43_2
      L4_3 = L2_3
      L5_3 = 1
      L6_3 = L1_3
      L3_3(L4_3, L5_3, L6_3)
      L3_3 = L76_2
      L4_3 = L0_1
      L4_3 = L4_3.awards
      L4_3 = L4_3.getLeagueNameText
      L5_3 = L1_3 + 1
      L4_3 = L4_3(L5_3)
      L3_3.text = L4_3
      L3_3 = L104_2
      L4_3 = 1
      L5_3 = A0_3.p
      L5_3 = L5_3.i
      L3_3(L4_3, L5_3)
      L54_2 = A0_3
      L3_3 = L78_2
      L4_3 = L54_2
      L4_3 = L4_3.p
      L4_3 = L4_3.r
      L3_3.text = L4_3
      L3_3 = L54_2
      L3_3 = L3_3.p
      L3_3 = L3_3.r
      L35_2 = L3_3
      L3_3 = L101_2
      L4_3 = A0_3.p
      L5_3 = false
      L3_3(L4_3, L5_3)
      L3_3 = L15_2
      if L3_3 == 1 then
        L3_3 = L48_2
        L4_3 = A0_3
        L3_3(L4_3)
        L3_3 = L21_2
        if not L3_3 then
          L3_3 = L39_2
          L3_3.isVisible = true
          L3_3 = L18_2
          if not L3_3 then
            L3_3 = L38_2
            L3_3.isVisible = true
          end
        end
      end
      L3_3 = L86_2
      L4_3 = L21_2
      if L4_3 then
        L4_3 = L20_2
        L4_3 = not L4_3
      end
      L3_3.isVisible = L4_3
      L3_3 = L84_2
      L4_3 = L21_2
      if L4_3 then
        L4_3 = L20_2
      end
      L3_3.isVisible = L4_3
    else
      L1_3 = A0_3.m
      L2_3 = L8_2
      L2_3 = L2_3.getPlayerLeagueDetailsMessage
      L2_3 = L2_3()
      if L1_3 == L2_3 then
        L1_3 = L101_2
        L2_3 = A0_3.p
        L3_3 = false
        L1_3(L2_3, L3_3)
        L1_3 = A0_3.p
        L1_3 = L1_3.i
        L2_3 = L28_2
        if L1_3 == L2_3 then
          L1_3 = L48_2
          L2_3 = A0_3
          L1_3(L2_3)
        end
      else
        L1_3 = A0_3.m
        L2_3 = L8_2
        L2_3 = L2_3.getClanLeagueDetails
        L2_3 = L2_3()
        if L1_3 == L2_3 then
          L1_3 = L99_2
          L2_3 = A0_3.a
          L3_3 = false
          L1_3(L2_3, L3_3)
          L1_3 = A0_3.a
          L1_3 = L1_3.a
          L1_3 = L1_3._id
          L2_3 = L28_2
          if L1_3 == L2_3 then
            L1_3 = L50_2
            L2_3 = A0_3.a
            L1_3(L2_3)
          end
        else
          L1_3 = A0_3.m
          L2_3 = L8_2
          L2_3 = L2_3.clanHallOfFameDetails
          L2_3 = L2_3()
          if L1_3 == L2_3 then
            L1_3 = L99_2
            L2_3 = A0_3.a
            L3_3 = true
            L1_3(L2_3, L3_3)
            L1_3 = A0_3.a
            L1_3 = L1_3.a
            L1_3 = L1_3._id
            L2_3 = L28_2
            if L1_3 == L2_3 then
              L1_3 = L50_2
              L2_3 = A0_3.a
              L1_3(L2_3)
            end
          else
            L1_3 = A0_3.m
            L2_3 = L8_2
            L2_3 = L2_3.getPlayerHallOfFameDetailsMessage
            L2_3 = L2_3()
            if L1_3 == L2_3 then
              L1_3 = L101_2
              L2_3 = A0_3.p
              L3_3 = true
              L1_3(L2_3, L3_3)
              L1_3 = A0_3.p
              L1_3 = L1_3.i
              L2_3 = L28_2
              if L1_3 == L2_3 then
                L1_3 = L48_2
                L2_3 = A0_3
                L1_3(L2_3)
              end
            else
              L1_3 = A0_3.m
              L2_3 = L8_2
              L2_3 = L2_3.getEliteLeagueMessage
              L2_3 = L2_3()
              if L1_3 == L2_3 then
                L1_3 = A0_3.p
                if L1_3 then
                  L1_3 = A0_3.p
                  L1_3 = L1_3.fh
                  if L1_3 then
                    goto lbl_274
                  end
                end
                L1_3 = print
                L2_3 = "No selected elite player entry"
                L1_3(L2_3)
                do return end
                ::lbl_274::
                L1_3 = A0_3.s
                if L1_3 == nil then
                  L1_3 = print
                  L2_3 = "WARNING: selected elite player is not in a league"
                  L1_3(L2_3)
                  return
                end
                L1_3 = tonumber
                L2_3 = A0_3.s
                L2_3 = L2_3.l
                L1_3 = L1_3(L2_3)
                L2_3 = A0_3.l
                L3_3 = L135_2
                L4_3 = L2_3
                L3_3(L4_3)
                L3_3 = L43_2
                L4_3 = L2_3
                L5_3 = 2
                L6_3 = L1_3
                L3_3(L4_3, L5_3, L6_3)
                L3_3 = L76_2
                L4_3 = L0_1
                L4_3 = L4_3.awards
                L4_3 = L4_3.getLeagueNameText
                L5_3 = L1_3 + 1
                L4_3 = L4_3(L5_3)
                L3_3.text = L4_3
                L3_3 = L103_2
                L4_3 = 2
                L5_3 = true
                L3_3(L4_3, L5_3)
                L3_3 = A0_3.p
                L4_3 = A0_3.h
                L3_3.l = L4_3
                L3_3 = L101_2
                L4_3 = A0_3.p
                L5_3 = false
                L3_3(L4_3, L5_3)
                L3_3 = L48_2
                L4_3 = A0_3
                L3_3(L4_3)
              else
                L1_3 = A0_3.m
                L2_3 = L8_2
                L2_3 = L2_3.clanLeague
                L2_3 = L2_3()
                if L1_3 == L2_3 then
                  L1_3 = A0_3.a
                  if not L1_3 then
                    L1_3 = print
                    L2_3 = "No clan list to generate high score with"
                    L1_3(L2_3)
                    return
                  end
                  L1_3 = A0_3.a
                  L2_3 = L135_2
                  L3_3 = L1_3
                  L2_3(L3_3)
                  L2_3 = L43_2
                  L3_3 = L1_3
                  L4_3 = 7
                  L5_3 = nil
                  L2_3(L3_3, L4_3, L5_3)
                  L2_3 = L27_2
                  if L2_3 == 7 then
                    L2_3 = L76_2
                    L3_3 = L0_1
                    L3_3 = L3_3.localized
                    L3_3 = L3_3.get
                    L4_3 = "Clans"
                    L3_3 = L3_3(L4_3)
                    L2_3.text = L3_3
                    L2_3 = A0_3.b
                    if L2_3 then
                      L2_3 = A0_3.b
                      L55_2 = L2_3
                      L2_3 = L55_2
                      L3_3 = A0_3.d
                      L2_3.placement = L3_3
                      L2_3 = L50_2
                      L3_3 = A0_3.b
                      L2_3(L3_3)
                      L2_3 = L112_2
                      L3_3 = L55_2
                      L4_3 = true
                      L5_3 = true
                      L2_3(L3_3, L4_3, L5_3)
                    end
                  end
                  L2_3 = A0_3.c
                  if L2_3 then
                    L2_3 = L138_2
                    L3_3 = A0_3.c
                    L2_3 = L2_3(L3_3)
                    L59_2 = L2_3
                    L2_3 = L61_2
                    L3_3 = L59_2
                    L2_3.text = L3_3
                  end
                else
                  L1_3 = A0_3.m
                  L2_3 = L8_2
                  L2_3 = L2_3.getFriendLeagueMessage
                  L2_3 = L2_3()
                  if L1_3 == L2_3 then
                    L1_3 = A0_3.l
                    if not L1_3 then
                      L1_3 = print
                      L2_3 = "No friend list to generate high score with"
                      L1_3(L2_3)
                      return
                    end
                    L1_3 = A0_3.l
                    L2_3 = L135_2
                    L3_3 = L1_3
                    L2_3(L3_3)
                    L2_3 = L43_2
                    L3_3 = L1_3
                    L4_3 = 3
                    L5_3 = leagueType
                    L2_3(L3_3, L4_3, L5_3)
                    L2_3 = L15_2
                    if L2_3 == 3 then
                      L2_3 = L76_2
                      L3_3 = L0_1
                      L3_3 = L3_3.localized
                      L3_3 = L3_3.get
                      L4_3 = "Friends"
                      L3_3 = L3_3(L4_3)
                      L2_3.text = L3_3
                      L2_3 = L114_2
                      L2_3()
                      L2_3 = L41_2
                      L2_3.isVisible = true
                    end
                    L2_3 = A0_3.p
                    if L2_3 then
                      L2_3 = A0_3.p
                      L3_3 = A0_3.h
                      L2_3.l = L3_3
                      L2_3 = L101_2
                      L3_3 = A0_3.p
                      L4_3 = false
                      L2_3(L3_3, L4_3)
                      L2_3 = L15_2
                      if L2_3 == 3 then
                        L2_3 = L48_2
                        L3_3 = A0_3
                        L2_3(L3_3)
                      end
                      L2_3 = A0_3.p
                      L2_3 = L2_3.r
                      if L2_3 then
                        L2_3 = A0_3.p
                        L2_3 = L2_3.r
                        L35_2 = L2_3
                        L2_3 = L78_2
                        L3_3 = A0_3.p
                        L3_3 = L3_3.r
                        L2_3.text = L3_3
                      end
                      L2_3 = L111_2
                      L3_3 = true
                      L4_3 = true
                      L2_3(L3_3, L4_3)
                    else
                      L2_3 = L49_2
                      L2_3()
                      L2_3 = L111_2
                      L3_3 = true
                      L4_3 = true
                      L2_3(L3_3, L4_3)
                    end
                    L2_3 = A0_3.t
                    if L2_3 then
                      L2_3 = L138_2
                      L3_3 = A0_3.t
                      L2_3 = L2_3(L3_3)
                      L60_2 = L2_3
                      L2_3 = L61_2
                      L3_3 = L60_2
                      L2_3.text = L3_3
                    end
                  else
                    L1_3 = A0_3.m
                    L2_3 = L8_2
                    L2_3 = L2_3.getHallOfFameMessage
                    L2_3 = L2_3()
                    if L1_3 == L2_3 then
                      L1_3 = A0_3.l
                      if not L1_3 then
                        L1_3 = print
                        L2_3 = "No friend list to generate high score with"
                        L1_3(L2_3)
                        return
                      end
                      L1_3 = A0_3.l
                      L2_3 = L135_2
                      L3_3 = L1_3
                      L2_3(L3_3)
                      L2_3 = L43_2
                      L3_3 = L1_3
                      L4_3 = 4
                      L5_3 = leagueType
                      L2_3(L3_3, L4_3, L5_3)
                      L2_3 = L15_2
                      if L2_3 == 4 then
                        L2_3 = L76_2
                        L3_3 = L0_1
                        L3_3 = L3_3.localized
                        L3_3 = L3_3.get
                        L4_3 = "Hall of Fame"
                        L3_3 = L3_3(L4_3)
                        L2_3.text = L3_3
                      end
                      L53_2 = A0_3
                      L2_3 = A0_3.p
                      if L2_3 then
                        L2_3 = A0_3.p
                        L3_3 = A0_3.h
                        L2_3.l = L3_3
                        L2_3 = L101_2
                        L3_3 = A0_3.p
                        L4_3 = true
                        L2_3(L3_3, L4_3)
                        L2_3 = L53_2
                        if L2_3 then
                          L2_3 = L53_2
                          L2_3 = L2_3.p
                          if L2_3 then
                            L2_3 = L53_2
                            L2_3 = L2_3.p
                            L2_3 = L2_3.r
                            if L2_3 then
                              L2_3 = L78_2
                              L3_3 = L53_2
                              L3_3 = L3_3.p
                              L3_3 = L3_3.r
                              L2_3.text = L3_3
                            end
                          end
                        end
                        L2_3 = L114_2
                        L2_3()
                      else
                        L2_3 = L49_2
                        L2_3()
                        L2_3 = L111_2
                        L3_3 = true
                        L4_3 = true
                        L2_3(L3_3, L4_3)
                      end
                    else
                      L1_3 = A0_3.m
                      L2_3 = L8_2
                      L2_3 = L2_3.getFriendHallOfFame
                      L2_3 = L2_3()
                      if L1_3 == L2_3 then
                        L1_3 = A0_3.l
                        if not L1_3 then
                          L1_3 = print
                          L2_3 = "No friend list to generate high score with"
                          L1_3(L2_3)
                          return
                        end
                        L1_3 = A0_3.l
                        L2_3 = L135_2
                        L3_3 = L1_3
                        L2_3(L3_3)
                        L2_3 = L43_2
                        L3_3 = L1_3
                        L4_3 = 6
                        L5_3 = leagueType
                        L2_3(L3_3, L4_3, L5_3)
                        L2_3 = L27_2
                        if L2_3 == 6 then
                          L2_3 = L76_2
                          L3_3 = L0_1
                          L3_3 = L3_3.localized
                          L3_3 = L3_3.get
                          L4_3 = "Hall of fame - Friends"
                          L3_3 = L3_3(L4_3)
                          L2_3.text = L3_3
                        end
                        L53_2 = A0_3
                        L2_3 = A0_3.p
                        if L2_3 then
                          L2_3 = A0_3.p
                          L3_3 = A0_3.h
                          L2_3.l = L3_3
                          L2_3 = L101_2
                          L3_3 = A0_3.p
                          L4_3 = true
                          L2_3(L3_3, L4_3)
                          L2_3 = L53_2
                          if L2_3 then
                            L2_3 = L53_2
                            L2_3 = L2_3.p
                            if L2_3 then
                              L2_3 = L53_2
                              L2_3 = L2_3.p
                              L2_3 = L2_3.r
                              if L2_3 then
                                L2_3 = L78_2
                                L3_3 = L53_2
                                L3_3 = L3_3.p
                                L3_3 = L3_3.r
                                L2_3.text = L3_3
                              end
                            end
                          end
                          L2_3 = L114_2
                          L2_3()
                        else
                          L2_3 = L49_2
                          L2_3()
                          L2_3 = L111_2
                          L3_3 = true
                          L4_3 = true
                          L2_3(L3_3, L4_3)
                        end
                      else
                        L1_3 = A0_3.m
                        L2_3 = L8_2
                        L2_3 = L2_3.clanHallOfFame
                        L2_3 = L2_3()
                        if L1_3 == L2_3 then
                          L1_3 = A0_3.a
                          if not L1_3 then
                            L1_3 = print
                            L2_3 = "No clan list to generate high score with"
                            L1_3(L2_3)
                            return
                          end
                          L1_3 = A0_3.a
                          L2_3 = L135_2
                          L3_3 = L1_3
                          L2_3(L3_3)
                          L2_3 = L43_2
                          L3_3 = L1_3
                          L4_3 = 8
                          L5_3 = nil
                          L2_3(L3_3, L4_3, L5_3)
                          L2_3 = L27_2
                          if L2_3 == 8 then
                            L2_3 = L76_2
                            L3_3 = L0_1
                            L3_3 = L3_3.localized
                            L3_3 = L3_3.get
                            L4_3 = "Hall of fame - Clans"
                            L3_3 = L3_3(L4_3)
                            L2_3.text = L3_3
                            L2_3 = A0_3.b
                            if L2_3 then
                              L2_3 = A0_3.b
                              L56_2 = L2_3
                              L2_3 = L56_2
                              L3_3 = A0_3.d
                              L2_3.placement = L3_3
                              L2_3 = L50_2
                              L3_3 = A0_3.b
                              L2_3(L3_3)
                              L2_3 = L112_2
                              L3_3 = L56_2
                              L4_3 = true
                              L5_3 = true
                              L2_3(L3_3, L4_3, L5_3)
                            end
                          end
                        else
                          L1_3 = A0_3.m
                          L2_3 = L8_2
                          L2_3 = L2_3.getClanInfo
                          L2_3 = L2_3()
                          if L1_3 == L2_3 then
                            L1_3 = L113_2
                            L2_3 = A0_3
                            L1_3(L2_3)
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  
  function L140_2(A0_3)
    local L1_3
    L1_3 = true
    return L1_3
  end
  
  function L141_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L64_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L140_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L62_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L133_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L6_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L142_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = true
    L16_2 = L0_3
    L0_3 = L17_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = L14_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = L68_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = 1
    L1_3 = 10
    L2_3 = 1
    for L3_3 = L0_3, L1_3, L2_3 do
      L4_3 = L22_2
      L4_3 = L4_3[L3_3]
      if L4_3 then
        L4_3 = L22_2
        L4_3 = L4_3[L3_3]
        L4_3 = L4_3.cleanTable
        if L4_3 then
          L4_3 = L22_2
          L4_3 = L4_3[L3_3]
          L4_3 = L4_3.cleanTable
          L4_3()
        end
      end
    end
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L38_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L41_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L39_2
    L0_3(L1_3)
    L0_3 = 1
    L1_3 = L37_2
    L1_3 = #L1_3
    L2_3 = 1
    for L3_3 = L0_3, L1_3, L2_3 do
      L4_3 = display
      L4_3 = L4_3.remove
      L5_3 = L37_2
      L5_3 = L5_3[L3_3]
      L5_3 = L5_3[1]
      L4_3(L5_3)
      L4_3 = display
      L4_3 = L4_3.remove
      L5_3 = L37_2
      L5_3 = L5_3[L3_3]
      L5_3 = L5_3[2]
      L4_3(L5_3)
    end
    L0_3 = L64_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L140_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L62_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L133_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L6_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L0_1
    L0_3.overlayWithNetwork = false
  end
  
  L2_1 = L142_2
  L142_2 = L141_2
  L142_2()
  L142_2 = L0_1
  L142_2 = L142_2.comm
  L142_2 = L142_2.setCallback
  L143_2 = L139_2
  L142_2(L143_2)
  L142_2 = L116_2
  L143_2 = false
  L142_2(L143_2)
  if L58_2 then
    L142_2 = L122_2
    L142_2()
  else
    L142_2 = L0_1
    L142_2 = L142_2.comm
    L142_2 = L142_2.getMyLeagueMessage
    L142_2()
  end
  L142_2 = L47_2
  L142_2()
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
  local L2_2, L3_2, L4_2
  L2_2 = A1_2.phase
  if L2_2 == "did" then
    L3_2 = A1_2.parent
    if L3_2 then
      L3_2 = A1_2.parent
      L3_2 = L3_2.overlayEnded
      if L3_2 then
        L3_2 = A1_2.parent
        L4_2 = L3_2
        L3_2 = L3_2.overlayEnded
        L3_2(L4_2)
      end
    end
    return
  end
  L3_2 = L3_1
  L3_2()
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
