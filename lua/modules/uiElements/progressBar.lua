local L0_1, L1_1
L0_1 = {}

function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = A2_2 or nil
  if not A2_2 then
    L3_2 = 500
  end
  L4_2 = display
  L4_2 = L4_2.newRect
  L5_2 = 0
  L6_2 = 0
  L7_2 = 0
  L8_2 = A1_2
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2.anchorX = 0
  L5_2 = nil
  L6_2 = false
  
  function L7_2(A0_3)
    local L1_3
    L1_3 = L4_2
    L1_3.width = A0_3
  end
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = transition
    L2_3 = L2_3.to
    L3_3 = L4_2
    L4_3 = {}
    L4_3.time = A1_3
    L4_3.width = A0_3
    L2_3 = L2_3(L3_3, L4_3)
    L5_2 = L2_3
  end
  
  function L9_2(A0_3)
    local L1_3
    if A0_3 < 0 then
      L1_3 = 0
      return L1_3
    end
    if 1 < A0_3 then
      L1_3 = 1
      return L1_3
    end
    return A0_3
  end
  
  function L10_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = L9_2
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    A0_3 = L1_3
    L1_3 = A0_2
    L1_3 = A0_3 * L1_3
    L2_3 = L8_2
    L3_3 = L1_3
    L4_3 = L3_2
    L2_3(L3_3, L4_3)
  end
  
  L4_2.updateProgression = L10_2
  
  function L10_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L9_2
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    A0_3 = L1_3
    L1_3 = A0_2
    L1_3 = A0_3 * L1_3
    L2_3 = L7_2
    L3_3 = L1_3
    L2_3(L3_3)
  end
  
  L4_2.setProgression = L10_2
  
  function L10_2()
    local L0_3, L1_3
    L0_3 = L6_2
    if L0_3 then
      return
    end
    L0_3 = true
    L6_2 = L0_3
    L0_3 = L5_2
    if L0_3 then
      L0_3 = transition
      L0_3 = L0_3.cancel
      L1_3 = L5_2
      L0_3(L1_3)
      L0_3 = nil
      L5_2 = L0_3
    end
  end
  
  L4_2.clean = L10_2
  return L4_2
end

L0_1.create = L1_1
return L0_1
