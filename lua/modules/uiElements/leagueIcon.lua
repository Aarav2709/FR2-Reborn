local L0_1, L1_1
L0_1 = {}

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if not A0_2 then
    A0_2 = 5
  end
  L2_2 = display
  L2_2 = L2_2.newImageRect
  L3_2 = "images/gui/ranking/league/tierS_"
  L4_2 = A0_2
  L5_2 = ".png"
  L3_2 = L3_2 .. L4_2 .. L5_2
  L4_2 = 20
  L5_2 = 20
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L1_2 = L2_2
  L1_2.anchorX = 0.5
  L1_2.anchorY = 0.5
  return L1_2
end

L0_1.create = L1_1
return L0_1
