local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = display
  L0_2 = L0_2.newGroup
  L0_2 = L0_2()
  L1_2 = display
  L1_2 = L1_2.newImageRect
  L2_2 = "images/gui/clan_v2/member_list/topBar.png"
  L3_2 = 239
  L4_2 = 15
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L3_2 = L0_2
  L2_2 = L0_2.insert
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
  L2_2 = L1_1
  L2_2 = L2_2.newText
  L3_2 = {}
  L4_2 = L1_1
  L4_2 = L4_2.localized
  L4_2 = L4_2.get
  L5_2 = "League"
  L4_2 = L4_2(L5_2)
  L3_2.string = L4_2
  L3_2.size = 9
  L3_2.x = -95
  L3_2.y = 0
  L4_2 = L1_1
  L4_2 = L4_2.colors
  L4_2 = L4_2.lightGrey
  L3_2.color = L4_2
  L2_2 = L2_2(L3_2)
  L4_2 = L0_2
  L3_2 = L0_2.insert
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  L3_2 = L1_1
  L3_2 = L3_2.newText
  L4_2 = {}
  L5_2 = L1_1
  L5_2 = L5_2.localized
  L5_2 = L5_2.get
  L6_2 = "Name"
  L5_2 = L5_2(L6_2)
  L4_2.string = L5_2
  L4_2.size = 9
  L4_2.x = -64
  L4_2.y = 0
  L5_2 = L1_1
  L5_2 = L5_2.colors
  L5_2 = L5_2.lightGrey
  L4_2.color = L5_2
  L3_2 = L3_2(L4_2)
  L5_2 = L0_2
  L4_2 = L0_2.insert
  L6_2 = L3_2
  L4_2(L5_2, L6_2)
  L4_2 = L1_1
  L4_2 = L4_2.newText
  L5_2 = {}
  L6_2 = L1_1
  L6_2 = L6_2.localized
  L6_2 = L6_2.get
  L7_2 = "Clan Points"
  L6_2 = L6_2(L7_2)
  L5_2.string = L6_2
  L5_2.size = 9
  L5_2.x = 36
  L5_2.y = 0
  L6_2 = L1_1
  L6_2 = L6_2.colors
  L6_2 = L6_2.lightGrey
  L5_2.color = L6_2
  L4_2 = L4_2(L5_2)
  L6_2 = L0_2
  L5_2 = L0_2.insert
  L7_2 = L4_2
  L5_2(L6_2, L7_2)
  L5_2 = L1_1
  L5_2 = L5_2.newText
  L6_2 = {}
  L7_2 = L1_1
  L7_2 = L7_2.localized
  L7_2 = L7_2.get
  L8_2 = "Clan Rating"
  L7_2 = L7_2(L8_2)
  L6_2.string = L7_2
  L6_2.size = 9
  L6_2.x = 98
  L6_2.y = 0
  L7_2 = L1_1
  L7_2 = L7_2.colors
  L7_2 = L7_2.lightGrey
  L6_2.color = L7_2
  L5_2 = L5_2(L6_2)
  L7_2 = L0_2
  L6_2 = L0_2.insert
  L8_2 = L5_2
  L6_2(L7_2, L8_2)
  return L0_2
end

L0_1.create = L2_1
return L0_1
