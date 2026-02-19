local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2
  L0_2 = display
  L0_2 = L0_2.newGroup
  L0_2 = L0_2()
  L1_2 = require
  L2_2 = "lua.modules.timeFormat"
  L1_2 = L1_2(L2_2)
  L2_2 = require
  L3_2 = "lua.modules.clans.clanSupporterTabUI"
  L2_2 = L2_2(L3_2)
  L3_2 = require
  L4_2 = "lua.modules.uiElements.informationBubble"
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2.create
  L4_2 = L4_2()
  L5_2 = display
  L5_2 = L5_2.newImageRect
  L6_2 = "images/gui/clan_v2/clan_support/BGplate.png"
  L7_2 = 226
  L8_2 = 53
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L7_2 = L0_2
  L6_2 = L0_2.insert
  L8_2 = L5_2
  L6_2(L7_2, L8_2)
  L6_2 = L1_1
  L6_2 = L6_2.newText
  L7_2 = {}
  L8_2 = L1_1
  L8_2 = L8_2.localized
  L8_2 = L8_2.get
  L9_2 = "Clan Point Bonus"
  L8_2 = L8_2(L9_2)
  L7_2.string = L8_2
  L7_2.size = 14
  L7_2.x = 0
  L8_2 = L5_2.y
  L8_2 = L8_2 - 18
  L7_2.y = L8_2
  L8_2 = L1_1
  L8_2 = L8_2.colors
  L8_2 = L8_2.black
  L7_2.color = L8_2
  L6_2 = L6_2(L7_2)
  L8_2 = L0_2
  L7_2 = L0_2.insert
  L9_2 = L6_2
  L7_2(L8_2, L9_2)
  L7_2 = L1_1
  L7_2 = L7_2.newText
  L8_2 = {}
  L9_2 = L1_1
  L9_2 = L9_2.localized
  L9_2 = L9_2.get
  L10_2 = "Personal Bonus"
  L9_2 = L9_2(L10_2)
  L8_2.string = L9_2
  L8_2.size = 6
  L9_2 = L5_2.x
  L9_2 = L9_2 - 38
  L8_2.x = L9_2
  L9_2 = L5_2.y
  L9_2 = L9_2 - 8
  L8_2.y = L9_2
  L8_2.ax = 1
  L9_2 = L1_1
  L9_2 = L9_2.colors
  L9_2 = L9_2.lightGrey
  L8_2.color = L9_2
  L7_2 = L7_2(L8_2)
  L9_2 = L0_2
  L8_2 = L0_2.insert
  L10_2 = L7_2
  L8_2(L9_2, L10_2)
  L8_2 = L1_1
  L8_2 = L8_2.newText
  L9_2 = {}
  L10_2 = L1_1
  L10_2 = L10_2.localized
  L10_2 = L10_2.get
  L11_2 = "Combined Clan Bonus"
  L10_2 = L10_2(L11_2)
  L9_2.string = L10_2
  L9_2.size = 6
  L10_2 = L5_2.x
  L10_2 = L10_2 - 4
  L9_2.x = L10_2
  L10_2 = L5_2.y
  L10_2 = L10_2 - 8
  L9_2.y = L10_2
  L10_2 = L1_1
  L10_2 = L10_2.colors
  L10_2 = L10_2.lightGrey
  L9_2.color = L10_2
  L8_2 = L8_2(L9_2)
  L10_2 = L0_2
  L9_2 = L0_2.insert
  L11_2 = L8_2
  L9_2(L10_2, L11_2)
  L9_2 = L1_1
  L9_2 = L9_2.newText
  L10_2 = {}
  L11_2 = L1_1
  L11_2 = L11_2.localized
  L11_2 = L11_2.get
  L12_2 = "Total Bonus"
  L11_2 = L11_2(L12_2)
  L10_2.string = L11_2
  L10_2.size = 6
  L11_2 = L5_2.x
  L11_2 = L11_2 + 30
  L10_2.x = L11_2
  L11_2 = L5_2.y
  L11_2 = L11_2 - 8
  L10_2.y = L11_2
  L10_2.ax = 0
  L11_2 = L1_1
  L11_2 = L11_2.colors
  L11_2 = L11_2.lightGrey
  L10_2.color = L11_2
  L9_2 = L9_2(L10_2)
  L11_2 = L0_2
  L10_2 = L0_2.insert
  L12_2 = L9_2
  L10_2(L11_2, L12_2)
  L10_2 = L1_1
  L10_2 = L10_2.newText
  L11_2 = {}
  L12_2 = L1_1
  L12_2 = L12_2.localized
  L12_2 = L12_2.get
  L13_2 = "+ 0%"
  L12_2 = L12_2(L13_2)
  L11_2.string = L12_2
  L11_2.size = 14
  L12_2 = L5_2.x
  L12_2 = L12_2 - 38
  L11_2.x = L12_2
  L12_2 = L5_2.y
  L12_2 = L12_2 + 18
  L11_2.y = L12_2
  L11_2.ax = 1
  L12_2 = L1_1
  L12_2 = L12_2.colors
  L12_2 = L12_2.grey
  L11_2.color = L12_2
  L10_2 = L10_2(L11_2)
  L12_2 = L0_2
  L11_2 = L0_2.insert
  L13_2 = L10_2
  L11_2(L12_2, L13_2)
  L11_2 = L1_1
  L11_2 = L11_2.newText
  L12_2 = {}
  L13_2 = L1_1
  L13_2 = L13_2.localized
  L13_2 = L13_2.get
  L14_2 = "+ 0%"
  L13_2 = L13_2(L14_2)
  L12_2.string = L13_2
  L12_2.size = 14
  L13_2 = L5_2.x
  L13_2 = L13_2 - 4
  L12_2.x = L13_2
  L13_2 = L5_2.y
  L13_2 = L13_2 + 18
  L12_2.y = L13_2
  L13_2 = L1_1
  L13_2 = L13_2.colors
  L13_2 = L13_2.grey
  L12_2.color = L13_2
  L11_2 = L11_2(L12_2)
  L13_2 = L0_2
  L12_2 = L0_2.insert
  L14_2 = L11_2
  L12_2(L13_2, L14_2)
  L12_2 = L1_1
  L12_2 = L12_2.newText
  L13_2 = {}
  L14_2 = L1_1
  L14_2 = L14_2.localized
  L14_2 = L14_2.get
  L15_2 = "+ 0%"
  L14_2 = L14_2(L15_2)
  L13_2.string = L14_2
  L13_2.size = 14
  L14_2 = L5_2.x
  L14_2 = L14_2 + 34
  L13_2.x = L14_2
  L14_2 = L5_2.y
  L14_2 = L14_2 + 18
  L13_2.y = L14_2
  L13_2.ax = 0
  L14_2 = L1_1
  L14_2 = L14_2.colors
  L14_2 = L14_2.grey
  L13_2.color = L14_2
  L12_2 = L12_2(L13_2)
  L14_2 = L0_2
  L13_2 = L0_2.insert
  L15_2 = L12_2
  L13_2(L14_2, L15_2)
  L13_2 = display
  L13_2 = L13_2.newImageRect
  L14_2 = "images/gui/clan_v2/clan_support/clanpointPersonal.png"
  L15_2 = 16
  L16_2 = 14
  L13_2 = L13_2(L14_2, L15_2, L16_2)
  L14_2 = L10_2.x
  L14_2 = L14_2 - 12
  L13_2.x = L14_2
  L14_2 = L10_2.y
  L14_2 = L14_2 - 14
  L13_2.y = L14_2
  
  function L14_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = A1_3.phase
    if L2_3 == "began" then
      L2_3 = L4_2
      if L2_3 then
        L2_3 = L4_2
        L3_3 = L2_3
        L2_3 = L2_3.toFront
        L2_3(L3_3)
        L2_3 = L4_2
        L2_3 = L2_3.interact
        L3_3 = {}
        L3_3.text = "Your clan bonus based on your status."
        L4_3 = A1_3.x
        L4_3 = L4_3 - 114
        L3_3.x = L4_3
        L4_3 = A1_3.y
        L4_3 = L4_3 - 120
        L3_3.y = L4_3
        L3_3.arrowVertical = "top"
        L3_3.arrowHorizontal = "left"
        L2_3(L3_3)
      end
    end
  end
  
  L13_2.touch = L14_2
  L15_2 = L13_2
  L14_2 = L13_2.addEventListener
  L16_2 = "touch"
  L17_2 = L13_2
  L14_2(L15_2, L16_2, L17_2)
  L15_2 = L0_2
  L14_2 = L0_2.insert
  L16_2 = L13_2
  L14_2(L15_2, L16_2)
  L14_2 = display
  L14_2 = L14_2.newImageRect
  L15_2 = "images/gui/clan_v2/clan_support/clanpointCombined.png"
  L16_2 = 28
  L17_2 = 14
  L14_2 = L14_2(L15_2, L16_2, L17_2)
  L15_2 = L11_2.x
  L15_2 = L15_2 + 4
  L14_2.x = L15_2
  L15_2 = L11_2.y
  L15_2 = L15_2 - 14
  L14_2.y = L15_2
  
  function L15_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = A1_3.phase
    if L2_3 == "began" then
      L2_3 = L4_2
      if L2_3 then
        L2_3 = L4_2
        L3_3 = L2_3
        L2_3 = L2_3.toFront
        L2_3(L3_3)
        L2_3 = L4_2
        L2_3 = L2_3.interact
        L3_3 = {}
        L3_3.text = "Each member with contributor status or above adds their clan bonus. All members benefit from this bonus."
        L4_3 = A1_3.x
        L4_3 = L4_3 - 114
        L3_3.x = L4_3
        L4_3 = A1_3.y
        L4_3 = L4_3 - 120
        L3_3.y = L4_3
        L3_3.arrowVertical = "top"
        L3_3.arrowHorizontal = "left"
        L2_3(L3_3)
      end
    end
  end
  
  L14_2.touch = L15_2
  L16_2 = L14_2
  L15_2 = L14_2.addEventListener
  L17_2 = "touch"
  L18_2 = L14_2
  L15_2(L16_2, L17_2, L18_2)
  L16_2 = L0_2
  L15_2 = L0_2.insert
  L17_2 = L14_2
  L15_2(L16_2, L17_2)
  L15_2 = display
  L15_2 = L15_2.newImageRect
  L16_2 = "images/gui/clan_v2/clan_support/clanpoint.png"
  L17_2 = 14
  L18_2 = 14
  L15_2 = L15_2(L16_2, L17_2, L18_2)
  L16_2 = L12_2.x
  L16_2 = L16_2 + 12
  L15_2.x = L16_2
  L16_2 = L12_2.y
  L16_2 = L16_2 - 14
  L15_2.y = L16_2
  
  function L16_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = A1_3.phase
    if L2_3 == "began" then
      L2_3 = L4_2
      if L2_3 then
        L2_3 = L4_2
        L3_3 = L2_3
        L2_3 = L2_3.toFront
        L2_3(L3_3)
        L2_3 = L4_2
        L2_3 = L2_3.interact
        L3_3 = {}
        L3_3.text = "Your personal and clan bonus combined. This number is used to calculate how many extra points you get per game."
        L4_3 = A1_3.x
        L4_3 = L4_3 - 114
        L3_3.x = L4_3
        L4_3 = A1_3.y
        L4_3 = L4_3 - 120
        L3_3.y = L4_3
        L3_3.arrowVertical = "top"
        L3_3.arrowHorizontal = "left"
        L2_3(L3_3)
      end
    end
  end
  
  L15_2.touch = L16_2
  L17_2 = L15_2
  L16_2 = L15_2.addEventListener
  L18_2 = "touch"
  L19_2 = L15_2
  L16_2(L17_2, L18_2, L19_2)
  L17_2 = L0_2
  L16_2 = L0_2.insert
  L18_2 = L15_2
  L16_2(L17_2, L18_2)
  
  function L16_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    if not A0_3 then
      A0_3 = 0
    end
    if not A1_3 then
      A1_3 = 0
    end
    L2_3 = L10_2
    L3_3 = "+ "
    L4_3 = A0_3
    L5_3 = "%"
    L3_3 = L3_3 .. L4_3 .. L5_3
    L2_3.text = L3_3
    L2_3 = L11_2
    L3_3 = "+ "
    L4_3 = A1_3
    L5_3 = "%"
    L3_3 = L3_3 .. L4_3 .. L5_3
    L2_3.text = L3_3
    L2_3 = L12_2
    L3_3 = "+ "
    L4_3 = A0_3 + A1_3
    L5_3 = "%"
    L3_3 = L3_3 .. L4_3 .. L5_3
    L2_3.text = L3_3
  end
  
  L0_2.setSummaryValues = L16_2
  L16_2 = display
  L16_2 = L16_2.newImageRect
  L17_2 = "images/gui/clan_v2/clan_support/tab0.png"
  L18_2 = 44
  L19_2 = 50
  L16_2 = L16_2(L17_2, L18_2, L19_2)
  L16_2.anchorX = 0
  L16_2.anchorY = 0
  L17_2 = L5_2.x
  L18_2 = L5_2.width
  L18_2 = L18_2 * 0.5
  L17_2 = L17_2 - L18_2
  L17_2 = L17_2 + 1
  L16_2.x = L17_2
  L17_2 = L5_2.y
  L18_2 = L5_2.height
  L18_2 = L18_2 * 0.5
  L17_2 = L17_2 + L18_2
  L17_2 = L17_2 + 2
  L16_2.y = L17_2
  L18_2 = L0_2
  L17_2 = L0_2.insert
  L19_2 = L16_2
  L17_2(L18_2, L19_2)
  L17_2 = display
  L17_2 = L17_2.newImageRect
  L18_2 = "images/gui/clan_v2/clan_support/clanpointPersonal.png"
  L19_2 = 16
  L20_2 = 14
  L17_2 = L17_2(L18_2, L19_2, L20_2)
  L18_2 = L16_2.x
  L19_2 = L16_2.width
  L19_2 = L19_2 * 0.5
  L18_2 = L18_2 + L19_2
  L17_2.x = L18_2
  L18_2 = L16_2.y
  L19_2 = L16_2.height
  L19_2 = L19_2 * 0.5
  L18_2 = L18_2 + L19_2
  L18_2 = L18_2 - 4
  L17_2.y = L18_2
  L19_2 = L0_2
  L18_2 = L0_2.insert
  L20_2 = L17_2
  L18_2(L19_2, L20_2)
  L18_2 = display
  L18_2 = L18_2.newImageRect
  L19_2 = "images/gui/clan_v2/clan_support/clanpointCombined.png"
  L20_2 = 28
  L21_2 = 14
  L18_2 = L18_2(L19_2, L20_2, L21_2)
  L19_2 = L16_2.x
  L20_2 = L16_2.width
  L20_2 = L20_2 * 0.5
  L19_2 = L19_2 + L20_2
  L18_2.x = L19_2
  L19_2 = L16_2.y
  L20_2 = L16_2.height
  L20_2 = L20_2 * 0.5
  L19_2 = L19_2 + L20_2
  L19_2 = L19_2 + 16
  L18_2.y = L19_2
  L20_2 = L0_2
  L19_2 = L0_2.insert
  L21_2 = L18_2
  L19_2(L20_2, L21_2)
  L19_2 = L1_1
  L19_2 = L19_2.newText
  L20_2 = {}
  L21_2 = L1_1
  L21_2 = L21_2.localized
  L21_2 = L21_2.get
  L22_2 = "Your Status:"
  L21_2 = L21_2(L22_2)
  L20_2.string = L21_2
  L20_2.size = 8
  L21_2 = L17_2.x
  L20_2.x = L21_2
  L21_2 = L17_2.y
  L21_2 = L21_2 - 16
  L20_2.y = L21_2
  L21_2 = L1_1
  L21_2 = L21_2.colors
  L21_2 = L21_2.black
  L20_2.color = L21_2
  L19_2 = L19_2(L20_2)
  L21_2 = L0_2
  L20_2 = L0_2.insert
  L22_2 = L19_2
  L20_2(L21_2, L22_2)
  L20_2 = display
  L20_2 = L20_2.newImageRect
  L21_2 = "images/gui/clan_v2/clan_support/reset.png"
  L22_2 = 47
  L23_2 = 12
  L20_2 = L20_2(L21_2, L22_2, L23_2)
  L21_2 = L18_2.x
  L20_2.x = L21_2
  L21_2 = L18_2.y
  L21_2 = L21_2 + 14
  L20_2.y = L21_2
  L22_2 = L0_2
  L21_2 = L0_2.insert
  L23_2 = L20_2
  L21_2(L22_2, L23_2)
  L21_2 = L1_1
  L21_2 = L21_2.newText
  L22_2 = {}
  L23_2 = L1_1
  L23_2 = L23_2.localized
  L23_2 = L23_2.get
  L24_2 = "Reset: 0"
  L23_2 = L23_2(L24_2)
  L22_2.string = L23_2
  L22_2.size = 6
  L23_2 = L20_2.x
  L22_2.x = L23_2
  L23_2 = L20_2.y
  L22_2.y = L23_2
  L23_2 = L1_1
  L23_2 = L23_2.colors
  L23_2 = L23_2.white
  L22_2.color = L23_2
  L21_2 = L21_2(L22_2)
  L23_2 = L0_2
  L22_2 = L0_2.insert
  L24_2 = L21_2
  L22_2(L23_2, L24_2)
  L22_2 = nil
  L23_2 = 60
  L24_2 = nil
  L25_2 = false
  
  function L26_2()
    local L0_3, L1_3
    L0_3 = L20_2
    L0_3.isVisible = false
    L0_3 = L21_2
    L0_3.isVisible = false
  end
  
  function L27_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    if A0_3 <= 0 then
      L1_3 = L24_2
      if L1_3 then
        L1_3 = timer
        L1_3 = L1_3.cancel
        L2_3 = L24_2
        L1_3(L2_3)
        L1_3 = nil
        L24_2 = L1_3
      end
      L1_3 = L26_2
      L1_3()
    else
      L1_3 = L20_2
      L1_3.isVisible = true
      L1_3 = L21_2
      L1_3.isVisible = true
      L22_2 = A0_3
      
      function L1_3()
        local L0_4, L1_4, L2_4, L3_4
        L0_4 = L22_2
        L1_4 = L23_2
        L0_4 = L0_4 - L1_4
        L22_2 = L0_4
        L0_4 = L22_2
        if L0_4 <= 0 then
          L0_4 = L26_2
          L0_4()
          L0_4 = L24_2
          if L0_4 then
            L0_4 = timer
            L0_4 = L0_4.cancel
            L1_4 = L24_2
            L0_4(L1_4)
            L0_4 = nil
            L24_2 = L0_4
          end
        else
          L0_4 = L21_2
          L1_4 = "Reset: "
          L2_4 = L1_2
          L2_4 = L2_4.leagueTimeRemainingFormat
          L3_4 = L22_2
          L2_4 = L2_4(L3_4)
          L1_4 = L1_4 .. L2_4
          if not L1_4 then
            L1_4 = 0
          end
          L0_4.text = L1_4
        end
      end
      
      L2_3 = L24_2
      if L2_3 then
        L2_3 = timer
        L2_3 = L2_3.cancel
        L3_3 = L24_2
        L2_3(L3_3)
        L2_3 = nil
        L24_2 = L2_3
      end
      L2_3 = timer
      L2_3 = L2_3.performWithDelay
      L3_3 = L23_2
      L3_3 = L3_3 * 1000
      L4_3 = L1_3
      L5_3 = 0
      L2_3 = L2_3(L3_3, L4_3, L5_3)
      L24_2 = L2_3
      L2_3 = L21_2
      L3_3 = "Reset: "
      L4_3 = L1_2
      L4_3 = L4_3.leagueTimeRemainingFormat
      L5_3 = A0_3
      L4_3 = L4_3(L5_3)
      L3_3 = L3_3 .. L4_3
      if not L3_3 then
        L3_3 = 0
      end
      L2_3.text = L3_3
    end
  end
  
  L0_2.setResetTime = L27_2
  L27_2 = L2_2.create
  L28_2 = 1
  L29_2 = 33
  L30_2 = 54
  L31_2 = L0_2
  L32_2 = {}
  L32_2.title = "Basic"
  L32_2.gemPrice = 0
  L27_2 = L27_2(L28_2, L29_2, L30_2, L31_2, L32_2)
  L28_2 = L1_1
  L28_2 = L28_2.storeConfig
  L28_2 = L28_2.getClanSupporterData
  L29_2 = 2201
  L28_2 = L28_2(L29_2)
  L29_2 = L1_1
  L29_2 = L29_2.storeConfig
  L29_2 = L29_2.getClanSupporterData
  L30_2 = 2202
  L29_2 = L29_2(L30_2)
  L30_2 = L1_1
  L30_2 = L30_2.storeConfig
  L30_2 = L30_2.getClanSupporterData
  L31_2 = 2203
  L30_2 = L30_2(L31_2)
  L31_2 = L2_2.create
  L32_2 = 2
  L33_2 = 58
  L34_2 = 54
  L35_2 = L0_2
  L36_2 = L28_2
  L31_2 = L31_2(L32_2, L33_2, L34_2, L35_2, L36_2)
  L32_2 = L2_2.create
  L33_2 = 2
  L34_2 = 58
  L35_2 = 54
  L36_2 = L0_2
  L37_2 = L29_2
  L32_2 = L32_2(L33_2, L34_2, L35_2, L36_2, L37_2)
  L33_2 = L2_2.create
  L34_2 = 3
  L35_2 = 54
  L36_2 = 54
  L37_2 = L0_2
  L38_2 = L30_2
  L33_2 = L33_2(L34_2, L35_2, L36_2, L37_2, L38_2)
  L34_2 = L27_2.setNext
  L35_2 = L31_2
  L34_2(L35_2)
  L34_2 = L31_2.setPrev
  L35_2 = L27_2
  L34_2(L35_2)
  L34_2 = L31_2.setNext
  L35_2 = L32_2
  L34_2(L35_2)
  L34_2 = L32_2.setPrev
  L35_2 = L31_2
  L34_2(L35_2)
  L34_2 = L32_2.setNext
  L35_2 = L33_2
  L34_2(L35_2)
  L34_2 = L33_2.setPrev
  L35_2 = L32_2
  L34_2(L35_2)
  L34_2 = L16_2.y
  L34_2 = L34_2 - 4
  L35_2 = L27_2.setPosition
  L36_2 = L16_2.x
  L37_2 = L16_2.width
  L36_2 = L36_2 + L37_2
  L36_2 = L36_2 + 2
  L37_2 = L34_2
  L35_2(L36_2, L37_2)
  L35_2 = L31_2.setPosition
  L36_2 = L16_2.x
  L36_2 = L36_2 + 71
  L37_2 = L34_2
  L35_2(L36_2, L37_2)
  L35_2 = L32_2.setPosition
  L36_2 = L16_2.x
  L36_2 = L36_2 + 121
  L37_2 = L34_2
  L35_2(L36_2, L37_2)
  L35_2 = L33_2.setPosition
  L36_2 = L16_2.x
  L36_2 = L36_2 + 171
  L37_2 = L34_2
  L35_2(L36_2, L37_2)
  
  function L35_2()
    local L0_3, L1_3
    L0_3 = L1_1
    L0_3 = L0_3.clanUtils
    L0_3 = L0_3.getPlayerSupporterStatusLevel
    L0_3 = L0_3()
    if L0_3 == 0 then
      L1_3 = L27_2
      L1_3 = L1_3.setActive
      L1_3()
    elseif L0_3 == 1 then
      L1_3 = L31_2
      L1_3 = L1_3.setActive
      L1_3()
    elseif L0_3 == 2 then
      L1_3 = L32_2
      L1_3 = L1_3.setActive
      L1_3()
    elseif L0_3 == 3 then
      L1_3 = L33_2
      L1_3 = L1_3.setActive
      L1_3()
    end
  end
  
  L0_2.updateTabs = L35_2
  
  function L35_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L25_2
    if L0_3 then
      return
    end
    L0_3 = true
    L25_2 = L0_3
    L0_3 = L13_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L13_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L14_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L15_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L15_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L4_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = L24_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L24_2
      L0_3(L1_3)
      L0_3 = nil
      L24_2 = L0_3
    end
  end
  
  L0_2.clean = L35_2
  L36_2 = L0_2
  L35_2 = L0_2.insert
  L37_2 = L4_2
  L35_2(L36_2, L37_2)
  L35_2 = L26_2
  L35_2()
  L35_2 = L0_2.updateTabs
  L35_2()
  return L0_2
end

L0_1.create = L2_1
return L0_1
