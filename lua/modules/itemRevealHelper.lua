local L0_1, L1_1
L0_1 = {}

function L1_1()
  local L0_2, L1_2
  L0_2 = {}
  L1_2 = {}
  L0_2.transitionList = L1_2
  
  function L1_2(A0_3)
    local L1_3, L2_3
    if not A0_3 then
      return
    end
    L1_3 = L0_2
    L1_3 = L1_3.transitionList
    L1_3 = L1_3[A0_3]
    if L1_3 then
      L1_3 = transition
      L1_3 = L1_3.cancel
      L2_3 = L0_2
      L2_3 = L2_3.transitionList
      L2_3 = L2_3[A0_3]
      L1_3(L2_3)
    end
    A0_3.xScale = 1
    A0_3.yScale = 1
    A0_3.isVisible = true
  end
  
  L0_2.instant = L1_2
  
  function L1_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    if not A0_3 then
      return
    end
    
    function L2_3(A0_4)
      local L1_4
      if not A0_4 then
        return
      end
      A0_4.xScale = 1
      A0_4.yScale = 1
    end
    
    function L3_3(A0_4)
      local L1_4
      if not A0_4 then
        return
      end
      A0_4.isVisible = true
    end
    
    L5_3 = A0_3
    L4_3 = A0_3.scale
    L6_3 = 0.2
    L7_3 = 0.2
    L4_3(L5_3, L6_3, L7_3)
    L4_3 = L0_2
    L4_3 = L4_3.transitionList
    L5_3 = transition
    L5_3 = L5_3.to
    L6_3 = A0_3
    L7_3 = {}
    L7_3.time = 500
    L8_3 = A1_3 or L8_3
    if not A1_3 then
      L8_3 = 0
    end
    L7_3.delay = L8_3
    L7_3.xScale = 1
    L7_3.yScale = 1
    L8_3 = easing
    L8_3 = L8_3.outBounce
    L7_3.transition = L8_3
    L7_3.onStart = L3_3
    L7_3.onCancel = L2_3
    L7_3.tag = "revealTransition"
    L5_3 = L5_3(L6_3, L7_3)
    L4_3[A0_3] = L5_3
  end
  
  L0_2.bounce = L1_2
  
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = pairs
    L1_3 = L0_2
    L1_3 = L1_3.transitionList
    L0_3, L1_3, L2_3 = L0_3(L1_3)
    for L3_3, L4_3 in L0_3, L1_3, L2_3 do
      if L4_3 then
        L5_3 = transition
        L5_3 = L5_3.cancel
        L6_3 = L4_3
        L5_3(L6_3)
      end
    end
  end
  
  L0_2.clean = L1_2
  return L0_2
end

L0_1.itemRevealHelper = L1_1
return L0_1
