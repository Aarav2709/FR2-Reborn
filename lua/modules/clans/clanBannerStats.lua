local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = display
  L0_2 = L0_2.newGroup
  L0_2 = L0_2()
  L1_2 = false
  L2_2 = require
  L3_2 = "lua.modules.timeFormat"
  L2_2 = L2_2(L3_2)
  L3_2 = 8
  L4_2 = {}
  L5_2 = 0
  L6_2 = 0
  L7_2 = 0
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L5_2 = {}
  L6_2 = 0.3215686274509804
  L7_2 = 0.21568627450980393
  L8_2 = 0.1568627450980392
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L6_2 = nil
  L7_2 = nil
  L8_2 = nil
  L9_2 = nil
  L10_2 = nil
  L11_2 = nil
  L12_2 = L1_1
  L12_2 = L12_2.newText
  L13_2 = {}
  L14_2 = L1_1
  L14_2 = L14_2.localized
  L14_2 = L14_2.get
  L15_2 = "Current Rating: "
  L14_2 = L14_2(L15_2)
  L13_2.string = L14_2
  L13_2.size = L3_2
  L13_2.x = 0
  L13_2.y = 0
  L13_2.ax = 0
  L13_2.color = L5_2
  L12_2 = L12_2(L13_2)
  L6_2 = L12_2
  L12_2 = L1_1
  L12_2 = L12_2.newText
  L13_2 = {}
  L13_2.string = "?"
  L13_2.size = L3_2
  L13_2.x = 100
  L14_2 = L6_2.y
  L13_2.y = L14_2
  L13_2.ax = 1
  L13_2.color = L4_2
  L12_2 = L12_2(L13_2)
  L7_2 = L12_2
  L12_2 = L1_1
  L12_2 = L12_2.newText
  L13_2 = {}
  L14_2 = L1_1
  L14_2 = L14_2.localized
  L14_2 = L14_2.get
  L15_2 = "ClanType"
  L14_2 = L14_2(L15_2)
  L13_2.string = L14_2
  L13_2.size = L3_2
  L13_2.x = 0
  L13_2.y = 14
  L13_2.ax = 0
  L13_2.color = L5_2
  L12_2 = L12_2(L13_2)
  L8_2 = L12_2
  L12_2 = L1_1
  L12_2 = L12_2.newText
  L13_2 = {}
  L13_2.string = "?"
  L13_2.size = L3_2
  L13_2.x = 100
  L14_2 = L8_2.y
  L13_2.y = L14_2
  L13_2.ax = 1
  L13_2.color = L4_2
  L12_2 = L12_2(L13_2)
  L9_2 = L12_2
  L12_2 = L1_1
  L12_2 = L12_2.newText
  L13_2 = {}
  L14_2 = L1_1
  L14_2 = L14_2.localized
  L14_2 = L14_2.get
  L15_2 = "Rewards in: "
  L14_2 = L14_2(L15_2)
  L13_2.string = L14_2
  L13_2.size = L3_2
  L13_2.x = 0
  L13_2.y = 7
  L13_2.ax = 0
  L13_2.color = L5_2
  L12_2 = L12_2(L13_2)
  L10_2 = L12_2
  L12_2 = L1_1
  L12_2 = L12_2.newText
  L13_2 = {}
  L13_2.string = "?"
  L13_2.size = L3_2
  L13_2.x = 100
  L14_2 = L10_2.y
  L13_2.y = L14_2
  L13_2.ax = 1
  L13_2.color = L4_2
  L12_2 = L12_2(L13_2)
  L11_2 = L12_2
  L13_2 = L0_2
  L12_2 = L0_2.insert
  L14_2 = L8_2
  L12_2(L13_2, L14_2)
  L13_2 = L0_2
  L12_2 = L0_2.insert
  L14_2 = L9_2
  L12_2(L13_2, L14_2)
  L13_2 = L0_2
  L12_2 = L0_2.insert
  L14_2 = L10_2
  L12_2(L13_2, L14_2)
  L13_2 = L0_2
  L12_2 = L0_2.insert
  L14_2 = L11_2
  L12_2(L13_2, L14_2)
  L13_2 = L0_2
  L12_2 = L0_2.insert
  L14_2 = L6_2
  L12_2(L13_2, L14_2)
  L13_2 = L0_2
  L12_2 = L0_2.insert
  L14_2 = L7_2
  L12_2(L13_2, L14_2)
  
  function L12_2(A0_3)
    local L1_3, L2_3
    L1_3 = L7_2
    L1_3.text = A0_3
    L1_3 = L1_1
    L1_3 = L1_3.formatTextKilo
    L2_3 = L7_2
    L1_3(L2_3)
  end
  
  L0_2.setWeeklyRating = L12_2
  
  function L13_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L11_2
    L2_3 = L2_2
    L2_3 = L2_3.leagueTimeRemainingFormat
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    L1_3.text = L2_3
  end
  
  L0_2.setWeeklyTimeRemaining = L13_2
  
  function L14_2(A0_3)
    local L1_3, L2_3, L3_3
    if A0_3 then
      L1_3 = L9_2
      L2_3 = L1_1
      L2_3 = L2_3.localized
      L2_3 = L2_3.get
      L3_3 = "public"
      L2_3 = L2_3(L3_3)
      L1_3.text = L2_3
    else
      L1_3 = L9_2
      L2_3 = L1_1
      L2_3 = L2_3.localized
      L2_3 = L2_3.get
      L3_3 = "invite only"
      L2_3 = L2_3(L3_3)
      L1_3.text = L2_3
    end
  end
  
  L0_2.setClanType = L14_2
  
  function L15_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L7_2
    L2_3 = A0_3.weeklyRating
    L1_3.text = L2_3
    L1_3 = L9_2
    L2_3 = A0_3.clanType
    L1_3.text = L2_3
    L1_3 = L11_2
    L2_3 = L2_2
    L2_3 = L2_3.leagueTimeRemainingFormat
    L3_3 = A0_3.weeklyResetRemaining
    L2_3 = L2_3(L3_3)
    L1_3.text = L2_3
  end
  
  L0_2.setStats = L15_2
  
  function L16_2()
    local L0_3, L1_3
    L0_3 = true
    L1_2 = L0_3
  end
  
  L0_2.clean = L16_2
  return L0_2
end

L0_1.create = L2_1
return L0_1
