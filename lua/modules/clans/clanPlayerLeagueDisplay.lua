local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = display
  L0_2 = L0_2.newGroup
  L0_2 = L0_2()
  L1_2 = {}
  
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3
    if not A0_3 then
      return
    end
    L1_3 = 1
    L2_3 = 5
    L3_3 = 1
    for L4_3 = L1_3, L2_3, L3_3 do
      L5_3 = 6 - L4_3
      L5_3 = A0_3[L5_3]
      if not L5_3 then
        L5_3 = L4_3 + 1
        L5_3 = 6 - L5_3
        L6_3 = ""
        L5_3 = L5_3 .. L6_3
        L5_3 = A0_3[L5_3]
        if not L5_3 then
          L5_3 = "0"
        end
      end
      L6_3 = L1_2
      L6_3 = L6_3[L4_3]
      if L6_3 then
        L6_3 = L1_2
        L6_3 = L6_3[L4_3]
        L6_3.text = L5_3
      else
        L6_3 = L4_3 - 1
        L6_3 = L6_3 * 32
        L7_3 = 0
        if L4_3 == 1 then
          L7_3 = 2
        elseif L4_3 == 2 then
          L7_3 = 0.5
        elseif L4_3 == 3 then
          L7_3 = 0.25
        elseif L4_3 == 4 then
          L7_3 = -0.75
        elseif L4_3 == 5 then
          L7_3 = 0
        end
        L8_3 = L1_2
        L9_3 = L1_1
        L9_3 = L9_3.newText
        L10_3 = {}
        L10_3.string = L5_3
        L10_3.size = 12
        L11_3 = L6_3 + L7_3
        L10_3.x = L11_3
        L10_3.y = 0
        L11_3 = {}
        L12_3 = 1
        L13_3 = 1
        L14_3 = 1
        L11_3[1] = L12_3
        L11_3[2] = L13_3
        L11_3[3] = L14_3
        L10_3.color = L11_3
        L9_3 = L9_3(L10_3)
        L8_3[L4_3] = L9_3
        L8_3 = L0_2
        L9_3 = L8_3
        L8_3 = L8_3.insert
        L10_3 = L1_2
        L10_3 = L10_3[L4_3]
        L8_3(L9_3, L10_3)
      end
    end
  end
  
  L0_2.updateLeagueMemberCounterTexts = L2_2
  
  function L3_2()
    local L0_3, L1_3
  end
  
  return L0_2
end

L0_1.create = L2_1
return L0_1
