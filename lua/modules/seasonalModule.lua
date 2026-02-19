local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)
L2_1 = os
L2_1 = L2_1.time
L2_1 = L2_1()
L3_1 = {}
L4_1 = {}
L5_1 = {}
L5_1.day = 1
L5_1.month = 10
L4_1.startDate = L5_1
L5_1 = {}
L5_1.day = 31
L5_1.month = 10
L4_1.endDate = L5_1
L4_1.backgroundImagePath = "images/gui/common/bgMain_halloween.png"
L4_1.blurBackgroundImagePath = "images/gui/common/bgMain_halloween_blur.png"
L3_1.halloween = L4_1
L4_1 = {}
L5_1 = {}
L5_1.day = 1
L5_1.month = 12
L4_1.startDate = L5_1
L5_1 = {}
L5_1.day = 31
L5_1.month = 12
L4_1.endDate = L5_1
L4_1.backgroundImagePath = "images/gui/common/bgMain_winter.png"
L4_1.blurBackgroundImagePath = "images/gui/common/bgMain_winter_blur.png"
L3_1.christmas = L4_1
L4_1 = {}
L5_1 = {}
L5_1.day = 7
L5_1.month = 2
L4_1.startDate = L5_1
L5_1 = {}
L5_1.day = 15
L5_1.month = 2
L4_1.endDate = L5_1
L4_1.backgroundImagePath = "images/gui/common/bgMain_valentine.png"
L4_1.blurBackgroundImagePath = "images/gui/common/bgMain_valentine_blur.png"
L3_1.valentine = L4_1

function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = os
  L0_2 = L0_2.date
  L1_2 = "*t"
  L0_2 = L0_2(L1_2)
  L1_2 = L1_1
  L1_2 = L1_2.debugger
  L1_2 = L1_2.debugTable
  L2_2 = "main"
  L3_2 = "Season Current Date: "
  L4_2 = L0_2
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = pairs
  L2_2 = L3_1
  L1_2, L2_2, L3_2 = L1_2(L2_2)
  for L4_2, L5_2 in L1_2, L2_2, L3_2 do
    L6_2 = L1_1
    L6_2 = L6_2.debugger
    L6_2 = L6_2.debugTable
    L7_2 = "main"
    L8_2 = "Check Season Date: "
    L9_2 = L4_2
    L8_2 = L8_2 .. L9_2
    L9_2 = L5_2
    L6_2(L7_2, L8_2, L9_2)
    L6_2 = L0_2.month
    L7_2 = L5_2.startDate
    L7_2 = L7_2.month
    if L6_2 == L7_2 then
      L6_2 = L0_2.day
      L7_2 = L5_2.startDate
      L7_2 = L7_2.day
    end
    L6_2 = L6_2 >= L7_2
    L7_2 = L0_2.month
    L8_2 = L5_2.endDate
    L8_2 = L8_2.month
    if L7_2 == L8_2 then
      L7_2 = L0_2.day
      L8_2 = L5_2.endDate
      L8_2 = L8_2.day
    end
    L7_2 = L7_2 <= L8_2
    L8_2 = L5_2.alwaysActive
    if L8_2 or L6_2 and L7_2 then
      return L5_2
    end
  end
  L1_2 = {}
  return L1_2
end

L0_1.getActiveSeason = L4_1
L1_1.seasonal = L0_1
