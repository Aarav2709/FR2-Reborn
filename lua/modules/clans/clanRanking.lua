local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  L0_2 = require
  L1_2 = "lua.modules.clans.clanEmblem"
  L0_2 = L0_2(L1_2)
  L1_2 = require
  L2_2 = "lua.modules.timeFormat"
  L1_2 = L1_2(L2_2)
  L2_2 = require
  L3_2 = "lua.modules.uiElements.informationBubble"
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2.create
  L3_2 = L3_2()
  L4_2 = display
  L4_2 = L4_2.newGroup
  L4_2 = L4_2()
  L4_2.isVisible = false
  L5_2 = display
  L5_2 = L5_2.newGroup
  L5_2 = L5_2()
  L6_2 = display
  L6_2 = L6_2.newGroup
  L6_2 = L6_2()
  L7_2 = L1_1
  L7_2 = L7_2.newText
  L8_2 = {}
  L9_2 = L1_1
  L9_2 = L9_2.localized
  L9_2 = L9_2.get
  L10_2 = "CreatedBy"
  L9_2 = L9_2(L10_2)
  L8_2.string = L9_2
  L8_2.size = 16
  L8_2.x = 0
  L8_2.y = 35
  L9_2 = {}
  L10_2 = 0.5
  L11_2 = 0.5
  L12_2 = 0.5
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L8_2.color = L9_2
  L7_2 = L7_2(L8_2)
  L8_2 = L1_1
  L8_2 = L8_2.newText
  L9_2 = {}
  L9_2.string = ""
  L9_2.size = 14
  L9_2.x = 0
  L9_2.y = 50
  L10_2 = {}
  L11_2 = 0.3
  L12_2 = 0.3
  L13_2 = 0.3
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L9_2.color = L10_2
  L8_2 = L8_2(L9_2)
  L9_2 = L1_1
  L9_2 = L9_2.newText
  L10_2 = {}
  L10_2.string = ""
  L10_2.size = 14
  L10_2.x = 0
  L10_2.y = 65
  L11_2 = {}
  L12_2 = 0.5
  L13_2 = 0.5
  L14_2 = 0.5
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L11_2[3] = L14_2
  L10_2.color = L11_2
  L9_2 = L9_2(L10_2)
  L11_2 = L6_2
  L10_2 = L6_2.insert
  L12_2 = L7_2
  L10_2(L11_2, L12_2)
  L11_2 = L6_2
  L10_2 = L6_2.insert
  L12_2 = L8_2
  L10_2(L11_2, L12_2)
  L11_2 = L6_2
  L10_2 = L6_2.insert
  L12_2 = L9_2
  L10_2(L11_2, L12_2)
  L10_2 = {}
  L11_2 = {}
  L12_2 = {}
  L13_2 = {}
  L14_2 = {}
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  L11_2 = display
  L11_2 = L11_2.newImageRect
  L12_2 = "images/gui/ranking/clans_panel.png"
  L13_2 = 136
  L14_2 = 188
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L13_2 = L4_2
  L12_2 = L4_2.insert
  L14_2 = L11_2
  L12_2(L13_2, L14_2)
  L4_2.x = 134
  L4_2.y = 138
  L12_2 = L1_1
  L12_2 = L12_2.newText
  L13_2 = {}
  L13_2.string = "???"
  L13_2.size = 20
  L13_2.x = 0
  L13_2.y = 0
  L14_2 = {}
  L15_2 = 1
  L16_2 = 1
  L17_2 = 1
  L14_2[1] = L15_2
  L14_2[2] = L16_2
  L14_2[3] = L17_2
  L13_2.color = L14_2
  L12_2 = L12_2(L13_2)
  L14_2 = L4_2
  L13_2 = L4_2.insert
  L15_2 = L12_2
  L13_2(L14_2, L15_2)
  L13_2 = nil
  L14_2 = L1_1
  L14_2 = L14_2.newText
  L15_2 = {}
  L15_2.string = ""
  L15_2.size = 10
  L15_2.x = 0
  L15_2.y = 15
  L16_2 = {}
  L17_2 = 0
  L18_2 = 0
  L19_2 = 0
  L16_2[1] = L17_2
  L16_2[2] = L18_2
  L16_2[3] = L19_2
  L15_2.color = L16_2
  L14_2 = L14_2(L15_2)
  L16_2 = L4_2
  L15_2 = L4_2.insert
  L17_2 = L14_2
  L15_2(L16_2, L17_2)
  L15_2 = L0_2.create
  L15_2 = L15_2()
  L16_2 = L15_2.setEmblemSize
  L17_2 = "large"
  L16_2(L17_2)
  L15_2.y = -70
  L16_2 = L15_2.showLevel
  L16_2()
  L17_2 = L4_2
  L16_2 = L4_2.insert
  L18_2 = L15_2
  L16_2(L17_2, L18_2)
  L16_2 = L1_1
  L16_2 = L16_2.newText
  L17_2 = {}
  L17_2.string = "Leader: "
  L17_2.size = 14
  L18_2 = L11_2.width
  L18_2 = -L18_2
  L18_2 = L18_2 * 0.5
  L18_2 = L18_2 + 4
  L17_2.x = L18_2
  L17_2.y = 30
  L17_2.ax = 0
  L18_2 = {}
  L19_2 = 0.5
  L20_2 = 0.5
  L21_2 = 0.5
  L18_2[1] = L19_2
  L18_2[2] = L20_2
  L18_2[3] = L21_2
  L17_2.color = L18_2
  L16_2 = L16_2(L17_2)
  L18_2 = L5_2
  L17_2 = L5_2.insert
  L19_2 = L16_2
  L17_2(L18_2, L19_2)
  L17_2 = L1_1
  L17_2 = L17_2.newText
  L18_2 = {}
  L18_2.string = ""
  L18_2.size = 14
  L19_2 = L11_2.width
  L19_2 = -L19_2
  L19_2 = L19_2 * 0.5
  L19_2 = L19_2 + 4
  L18_2.x = L19_2
  L18_2.y = 50
  L18_2.ax = 0
  L19_2 = {}
  L20_2 = 0
  L21_2 = 0
  L22_2 = 0
  L19_2[1] = L20_2
  L19_2[2] = L21_2
  L19_2[3] = L22_2
  L18_2.color = L19_2
  L17_2 = L17_2(L18_2)
  L19_2 = L5_2
  L18_2 = L5_2.insert
  L20_2 = L17_2
  L18_2(L19_2, L20_2)
  L18_2 = L10_2[1]
  L18_2.name = L17_2
  L18_2 = L1_1
  L18_2 = L18_2.newText
  L19_2 = {}
  L19_2.string = ""
  L19_2.size = 14
  L20_2 = L11_2.width
  L20_2 = -L20_2
  L20_2 = L20_2 * 0.5
  L20_2 = L20_2 + 4
  L19_2.x = L20_2
  L19_2.y = 65
  L19_2.ax = 0
  L20_2 = {}
  L21_2 = 0
  L22_2 = 0
  L23_2 = 0
  L20_2[1] = L21_2
  L20_2[2] = L22_2
  L20_2[3] = L23_2
  L19_2.color = L20_2
  L18_2 = L18_2(L19_2)
  L20_2 = L5_2
  L19_2 = L5_2.insert
  L21_2 = L18_2
  L19_2(L20_2, L21_2)
  L19_2 = L10_2[2]
  L19_2.name = L18_2
  L19_2 = L1_1
  L19_2 = L19_2.newText
  L20_2 = {}
  L20_2.string = ""
  L20_2.size = 14
  L21_2 = L11_2.width
  L21_2 = -L21_2
  L21_2 = L21_2 * 0.5
  L21_2 = L21_2 + 4
  L20_2.x = L21_2
  L20_2.y = 80
  L20_2.ax = 0
  L21_2 = {}
  L22_2 = 0
  L23_2 = 0
  L24_2 = 0
  L21_2[1] = L22_2
  L21_2[2] = L23_2
  L21_2[3] = L24_2
  L20_2.color = L21_2
  L19_2 = L19_2(L20_2)
  L21_2 = L5_2
  L20_2 = L5_2.insert
  L22_2 = L19_2
  L20_2(L21_2, L22_2)
  L20_2 = L10_2[3]
  L20_2.name = L19_2
  L20_2 = L1_1
  L20_2 = L20_2.newText
  L21_2 = {}
  L21_2.string = ""
  L21_2.size = 14
  L22_2 = L11_2.width
  L22_2 = L22_2 * 0.5
  L22_2 = L22_2 - 6
  L21_2.x = L22_2
  L21_2.y = 50
  L21_2.ax = 1
  L22_2 = {}
  L23_2 = 0
  L24_2 = 0
  L25_2 = 0
  L22_2[1] = L23_2
  L22_2[2] = L24_2
  L22_2[3] = L25_2
  L21_2.color = L22_2
  L20_2 = L20_2(L21_2)
  L22_2 = L5_2
  L21_2 = L5_2.insert
  L23_2 = L20_2
  L21_2(L22_2, L23_2)
  L21_2 = L10_2[1]
  L21_2.rating = L20_2
  L21_2 = L1_1
  L21_2 = L21_2.newText
  L22_2 = {}
  L22_2.string = ""
  L22_2.size = 14
  L23_2 = L11_2.width
  L23_2 = L23_2 * 0.5
  L23_2 = L23_2 - 6
  L22_2.x = L23_2
  L22_2.y = 65
  L22_2.ax = 1
  L23_2 = {}
  L24_2 = 0
  L25_2 = 0
  L26_2 = 0
  L23_2[1] = L24_2
  L23_2[2] = L25_2
  L23_2[3] = L26_2
  L22_2.color = L23_2
  L21_2 = L21_2(L22_2)
  L23_2 = L5_2
  L22_2 = L5_2.insert
  L24_2 = L21_2
  L22_2(L23_2, L24_2)
  L22_2 = L10_2[2]
  L22_2.rating = L21_2
  L22_2 = L1_1
  L22_2 = L22_2.newText
  L23_2 = {}
  L23_2.string = ""
  L23_2.size = 14
  L24_2 = L11_2.width
  L24_2 = L24_2 * 0.5
  L24_2 = L24_2 - 6
  L23_2.x = L24_2
  L23_2.y = 80
  L23_2.ax = 1
  L24_2 = {}
  L25_2 = 0
  L26_2 = 0
  L27_2 = 0
  L24_2[1] = L25_2
  L24_2[2] = L26_2
  L24_2[3] = L27_2
  L23_2.color = L24_2
  L22_2 = L22_2(L23_2)
  L24_2 = L5_2
  L23_2 = L5_2.insert
  L25_2 = L22_2
  L23_2(L24_2, L25_2)
  L23_2 = L10_2[3]
  L23_2.rating = L22_2
  
  function L23_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    if not A0_3 then
      return
    end
    L1_3 = 1
    L2_3 = 3
    L3_3 = 1
    for L4_3 = L1_3, L2_3, L3_3 do
      L5_3 = A0_3[L4_3]
      if L5_3 then
        L5_3 = L10_2
        L5_3 = L5_3[L4_3]
        L5_3 = L5_3.rating
        L6_3 = A0_3[L4_3]
        L6_3 = L6_3.r
        L5_3.text = L6_3
        L5_3 = L10_2
        L5_3 = L5_3[L4_3]
        L5_3 = L5_3.rating
        L5_3 = L5_3.contentWidth
        L6_3 = L1_1
        L6_3 = L6_3.fitText
        L7_3 = L4_3
        L8_3 = ". "
        L9_3 = A0_3[L4_3]
        L9_3 = L9_3.u
        L7_3 = L7_3 .. L8_3 .. L9_3
        L8_3 = 14
        L9_3 = 120 - L5_3
        L6_3 = L6_3(L7_3, L8_3, L9_3)
        L7_3 = L10_2
        L7_3 = L7_3[L4_3]
        L7_3 = L7_3.name
        L7_3.text = L6_3
      else
        L5_3 = L10_2
        L5_3 = L5_3[L4_3]
        L5_3 = L5_3.rating
        L5_3.text = ""
        L5_3 = L10_2
        L5_3 = L5_3[L4_3]
        L5_3 = L5_3.name
        L5_3.text = ""
      end
    end
  end
  
  L4_2.fillTopClanPlayerNames = L23_2
  
  function L24_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = string
    L1_3 = L1_3.upper
    L2_3 = A0_3.a
    L2_3 = L2_3.b
    L1_3 = L1_3(L2_3)
    L2_3 = L13_2
    if L2_3 then
      L2_3 = L13_2
      L3_3 = L2_3
      L2_3 = L2_3.removeSelf
      L2_3(L3_3)
      L2_3 = nil
      L13_2 = L2_3
    end
    L2_3 = L14_2
    L2_3.isVisible = false
    L2_3 = A0_3.p
    if L2_3 then
      L2_3 = tonumber
      L3_3 = A0_3.p
      L2_3 = L2_3(L3_3)
      if 0 < L2_3 then
        L2_3 = tonumber
        L3_3 = A0_3.p
        L2_3 = L2_3(L3_3)
        if 5 < L2_3 then
          L2_3 = 5
        end
        L3_3 = display
        L3_3 = L3_3.newImageRect
        L4_3 = "images/gui/ranking/stars"
        L5_3 = L2_3
        L6_3 = ".png"
        L4_3 = L4_3 .. L5_3 .. L6_3
        L5_3 = 48
        L6_3 = 18
        L3_3 = L3_3(L4_3, L5_3, L6_3)
        L13_2 = L3_3
        L3_3 = L13_2
        L3_3.y = 14
        L3_3 = L4_2
        L4_3 = L3_3
        L3_3 = L3_3.insert
        L5_3 = L13_2
        L3_3(L4_3, L5_3)
        L3_3 = tonumber
        L4_3 = A0_3.p
        L3_3 = L3_3(L4_3)
        if 5 < L3_3 then
          L3_3 = L1_1
          L3_3 = L3_3.fitTextFontSize
          L4_3 = A0_3.p
          L5_3 = 6
          L6_3 = 10
          L7_3 = 10
          L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)
          L4_3 = L14_2
          L5_3 = A0_3.p
          L4_3.text = L5_3
          L4_3 = L14_2
          L4_3.size = L3_3
          L4_3 = L4_2
          L5_3 = L4_3
          L4_3 = L4_3.insert
          L6_3 = L14_2
          L4_3(L5_3, L6_3)
        end
        L3_3 = L13_2
        L3_3.isVisible = true
        L3_3 = L13_2
        
        function L4_3(A0_4, A1_4)
          local L2_4, L3_4, L4_4
          L2_4 = A1_4.phase
          if L2_4 == "began" then
            L2_4 = L3_2
            if L2_4 then
              L2_4 = L3_2
              L3_4 = L2_4
              L2_4 = L2_4.toFront
              L2_4(L3_4)
              L2_4 = L3_2
              L2_4 = L2_4.interact
              L3_4 = {}
              L3_4.text = "Shows how many times this clan has finished in first place."
              L4_4 = A1_4.x
              L4_4 = L4_4 - 68
              L3_4.x = L4_4
              L4_4 = A1_4.y
              L4_4 = L4_4 - 100
              L3_4.y = L4_4
              L3_4.arrowVertical = "top"
              L3_4.arrowHorizontal = "left"
              L2_4(L3_4)
            end
          end
        end
        
        L3_3.touch = L4_3
        L3_3 = L13_2
        L4_3 = L3_3
        L3_3 = L3_3.addEventListener
        L5_3 = "touch"
        L6_3 = L13_2
        L3_3(L4_3, L5_3, L6_3)
        L3_3 = L14_2
        L3_3.isVisible = true
      end
    end
    L2_3 = L1_1
    L2_3 = L2_3.fitTextFontSize
    L3_3 = L1_3
    L4_3 = 10
    L5_3 = 20
    L6_3 = 115
    L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3)
    L3_3 = L12_2
    L3_3.text = L1_3
    L3_3 = L12_2
    L3_3.size = L2_3
    L3_3 = L15_2
    L3_3 = L3_3.updateEmblem
    L4_3 = A0_3.a
    L4_3 = L4_3.c
    L3_3(L4_3)
    L3_3 = L15_2
    L3_3 = L3_3.updateLevelData
    L4_3 = A0_3.i
    L5_3 = A0_3.h
    L3_3(L4_3, L5_3)
    L3_3 = A0_3.n
    if L3_3 then
      L3_3 = A0_3.o
      if L3_3 then
        L3_3 = L8_2
        L4_3 = A0_3.o
        L3_3.text = L4_3
        L3_3 = L9_2
        L4_3 = math
        L4_3 = L4_3.floor
        L5_3 = L1_2
        L5_3 = L5_3.daysSince
        L6_3 = A0_3.n
        L5_3, L6_3, L7_3 = L5_3(L6_3)
        L4_3 = L4_3(L5_3, L6_3, L7_3)
        L5_3 = " "
        L6_3 = L1_1
        L6_3 = L6_3.localized
        L6_3 = L6_3.get
        L7_3 = "DAYS AGO"
        L6_3 = L6_3(L7_3)
        L4_3 = L4_3 .. L5_3 .. L6_3
        L3_3.text = L4_3
    end
    else
      L3_3 = L1_1
      L3_3 = L3_3.localized
      L3_3 = L3_3.get
      L4_3 = "Leader"
      L3_3 = L3_3(L4_3)
      L4_3 = ": "
      L5_3 = A0_3.k
      if not L5_3 then
        L5_3 = ""
      end
      L3_3 = L3_3 .. L4_3 .. L5_3
      L4_3 = L1_1
      L4_3 = L4_3.fitText
      L5_3 = L3_3
      L6_3 = 14
      L7_3 = 130
      L4_3 = L4_3(L5_3, L6_3, L7_3)
      L3_3 = L4_3
      L4_3 = L16_2
      L4_3.text = L3_3
      L4_3 = L23_2
      L5_3 = A0_3.l
      L4_3(L5_3)
    end
  end
  
  L4_2.updateClanInfo = L24_2
  
  function L25_2(A0_3)
    local L1_3, L2_3
    L1_3 = L5_2
    L1_3.isVisible = A0_3
    L1_3 = L6_2
    L2_3 = not A0_3
    L1_3.isVisible = L2_3
  end
  
  L4_2.showTopPlayers = L25_2
  L26_2 = L25_2
  L27_2 = true
  L26_2(L27_2)
  L27_2 = L4_2
  L26_2 = L4_2.insert
  L28_2 = L5_2
  L26_2(L27_2, L28_2)
  L27_2 = L4_2
  L26_2 = L4_2.insert
  L28_2 = L6_2
  L26_2(L27_2, L28_2)
  L27_2 = L4_2
  L26_2 = L4_2.insert
  L28_2 = L3_2
  L26_2(L27_2, L28_2)
  
  function L26_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L13_2
    if L0_3 then
      L0_3 = L13_2
      L1_3 = L0_3
      L0_3 = L0_3.removeEventListener
      L2_3 = "touch"
      L3_3 = L13_2
      L0_3(L1_3, L2_3, L3_3)
    end
  end
  
  L4_2.clean = L26_2
  return L4_2
end

L0_1.createRankingPanel = L2_1
return L0_1
