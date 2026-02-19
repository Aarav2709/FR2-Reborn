local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L1_2 = require
  L2_2 = "lua.modules.uiElements.leagueIcon"
  L1_2 = L1_2(L2_2)
  L2_2 = display
  L2_2 = L2_2.newGroup
  L2_2 = L2_2()
  L3_2 = A0_2.name
  if not L3_2 then
    L3_2 = "PlayerName"
  end
  L4_2 = A0_2.rating
  if not L4_2 then
    L4_2 = "0"
  end
  L5_2 = A0_2.clanPoints
  if not L5_2 then
    L5_2 = "0"
  end
  L6_2 = tonumber
  L7_2 = A0_2.supporterLevel
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = 0
  end
  L7_2 = "1."
  L8_2 = A0_2.rowIndex
  if L8_2 then
    L8_2 = A0_2.rowIndex
    L9_2 = "."
    L7_2 = L8_2 .. L9_2
  end
  L8_2 = ""
  L9_2 = tonumber
  L10_2 = A0_2.rank
  L9_2 = L9_2(L10_2)
  if L9_2 == 3 then
    L9_2 = L1_1
    L9_2 = L9_2.localized
    L9_2 = L9_2.get
    L10_2 = "Leader"
    L9_2 = L9_2(L10_2)
    L8_2 = L9_2
  else
    L9_2 = tonumber
    L10_2 = A0_2.rank
    L9_2 = L9_2(L10_2)
    if L9_2 == 2 then
      L9_2 = L1_1
      L9_2 = L9_2.localized
      L9_2 = L9_2.get
      L10_2 = "Officer"
      L9_2 = L9_2(L10_2)
      L8_2 = L9_2
    else
      L9_2 = tonumber
      L10_2 = A0_2.rank
      L9_2 = L9_2(L10_2)
      if L9_2 == 1 then
        L9_2 = L1_1
        L9_2 = L9_2.localized
        L9_2 = L9_2.get
        L10_2 = "Recruiter"
        L9_2 = L9_2(L10_2)
        L8_2 = L9_2
      end
    end
  end
  L9_2 = L1_1
  L9_2 = L9_2.colors
  L9_2 = L9_2.black
  if L6_2 == 1 then
    L10_2 = L1_1
    L10_2 = L10_2.colors
    L9_2 = L10_2.blue
  elseif L6_2 == 2 then
    L10_2 = L1_1
    L10_2 = L10_2.colors
    L9_2 = L10_2.purple
  elseif L6_2 == 3 then
    L10_2 = L1_1
    L10_2 = L10_2.colors
    L9_2 = L10_2.orange
  end
  L10_2 = tonumber
  L11_2 = A0_2.onlineStatus
  L10_2 = L10_2(L11_2)
  if not L10_2 then
    L10_2 = 3
  end
  L11_2 = L1_1
  L11_2 = L11_2.newText
  L12_2 = {}
  L12_2.string = L3_2
  L12_2.size = 13
  L12_2.x = 35
  L12_2.y = 0
  L12_2.ax = 0
  L13_2 = L1_1
  L13_2 = L13_2.colors
  L13_2 = L13_2.black
  L12_2.color = L13_2
  L11_2 = L11_2(L12_2)
  L13_2 = L2_2
  L12_2 = L2_2.insert
  L14_2 = L11_2
  L12_2(L13_2, L14_2)
  L12_2 = L1_1
  L12_2 = L12_2.newText
  L13_2 = {}
  L14_2 = L1_1
  L14_2 = L14_2.formatTextKilo
  L15_2 = L4_2
  L14_2 = L14_2(L15_2)
  L13_2.string = L14_2
  L13_2.size = 13
  L13_2.x = 234
  L13_2.y = 6
  L13_2.ax = 1
  L14_2 = L1_1
  L14_2 = L14_2.colors
  L14_2 = L14_2.black
  L13_2.color = L14_2
  L12_2 = L12_2(L13_2)
  L14_2 = L2_2
  L13_2 = L2_2.insert
  L15_2 = L12_2
  L13_2(L14_2, L15_2)
  L13_2 = L1_1
  L13_2 = L13_2.newText
  L14_2 = {}
  L15_2 = L1_1
  L15_2 = L15_2.formatTextKilo
  L16_2 = L5_2
  L15_2 = L15_2(L16_2)
  L14_2.string = L15_2
  L14_2.size = 13
  L14_2.x = 170
  L14_2.y = 6
  L14_2.ax = 1
  L14_2.color = L9_2
  L13_2 = L13_2(L14_2)
  L15_2 = L2_2
  L14_2 = L2_2.insert
  L16_2 = L13_2
  L14_2(L15_2, L16_2)
  L14_2 = L1_1
  L14_2 = L14_2.storeConfig
  L14_2 = L14_2.getClanSupporterDataBySupporterLevel
  L15_2 = L6_2
  L14_2 = L14_2(L15_2)
  if L14_2 then
    L15_2 = "images/gui/clan_v2/clan_support/icon_"
    L16_2 = L14_2.title
    L17_2 = L16_2
    L16_2 = L16_2.lower
    L16_2 = L16_2(L17_2)
    L17_2 = ".png"
    L15_2 = L15_2 .. L16_2 .. L17_2
    L16_2 = display
    L16_2 = L16_2.newImageRect
    L17_2 = L15_2
    L18_2 = 9
    L19_2 = 14
    L16_2 = L16_2(L17_2, L18_2, L19_2)
    L17_2 = L13_2.x
    L17_2 = L17_2 + 5
    L16_2.x = L17_2
    L17_2 = L13_2.y
    L16_2.y = L17_2
    L18_2 = L2_2
    L17_2 = L2_2.insert
    L19_2 = L16_2
    L17_2(L18_2, L19_2)
  end
  L15_2 = 20
  L16_2 = A0_2.rowIndex
  if 10 <= L16_2 then
    L15_2 = 15
  end
  L16_2 = L1_1
  L16_2 = L16_2.newText
  L17_2 = {}
  L17_2.string = L7_2
  L17_2.size = L15_2
  L17_2.x = 4
  L17_2.y = 5
  L17_2.ax = 0
  L18_2 = L1_1
  L18_2 = L18_2.colors
  L18_2 = L18_2.black
  L17_2.color = L18_2
  L16_2 = L16_2(L17_2)
  L18_2 = L2_2
  L17_2 = L2_2.insert
  L19_2 = L16_2
  L17_2(L18_2, L19_2)
  L17_2 = L1_1
  L17_2 = L17_2.newText
  L18_2 = {}
  L18_2.string = L8_2
  L18_2.size = 10
  L18_2.x = 45
  L18_2.y = 10
  L18_2.ax = 0
  L19_2 = L1_1
  L19_2 = L19_2.colors
  L19_2 = L19_2.lightGrey
  L18_2.color = L19_2
  L17_2 = L17_2(L18_2)
  L19_2 = L2_2
  L18_2 = L2_2.insert
  L20_2 = L17_2
  L18_2(L19_2, L20_2)
  L18_2 = "images/gui/clan_v2/status_offline.png"
  if L10_2 == 1 or L10_2 == 2 then
    L18_2 = "images/gui/clan_v2/status_online.png"
  end
  L19_2 = display
  L19_2 = L19_2.newImageRect
  L20_2 = L18_2
  L21_2 = 8
  L22_2 = 8
  L19_2 = L19_2(L20_2, L21_2, L22_2)
  L19_2.anchorX = 0
  L19_2.x = 35
  L19_2.y = 10
  L21_2 = L2_2
  L20_2 = L2_2.insert
  L22_2 = L19_2
  L20_2(L21_2, L22_2)
  L20_2 = L1_2.create
  L21_2 = A0_2.league
  L20_2 = L20_2(L21_2)
  L20_2.anchorX = 0
  L20_2.x = 15
  L20_2.y = 5
  L22_2 = L2_2
  L21_2 = L2_2.insert
  L23_2 = L20_2
  L21_2(L22_2, L23_2)
  
  function L21_2()
    local L0_3, L1_3
  end
  
  L2_2.setSelected = L21_2
  
  function L21_2()
    local L0_3, L1_3
  end
  
  L2_2.deSelect = L21_2
  return L2_2
end

L0_1.create = L2_1
return L0_1
