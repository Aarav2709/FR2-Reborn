local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = {}
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = 0.11
L5_1 = 0.8
L6_1 = 0.11
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.primary = L3_1
L3_1 = {}
L4_1 = 0.47
L5_1 = 0.92
L6_1 = 0.47
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.secondary = L3_1
L1_1[1] = L2_1
L2_1 = {}
L3_1 = {}
L4_1 = 1
L5_1 = 0.34
L6_1 = 0.51
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.primary = L3_1
L3_1 = {}
L4_1 = 1
L5_1 = 0.64
L6_1 = 0.69
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.secondary = L3_1
L1_1[2] = L2_1
L2_1 = {}
L3_1 = {}
L4_1 = 0.52
L5_1 = 0.52
L6_1 = 1
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.primary = L3_1
L3_1 = {}
L4_1 = 0.71
L5_1 = 0.71
L6_1 = 1
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.secondary = L3_1
L1_1[3] = L2_1
L2_1 = {}
L3_1 = {}
L4_1 = 0.83
L5_1 = 0.3
L6_1 = 1
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.primary = L3_1
L3_1 = {}
L4_1 = 0.89
L5_1 = 0.54
L6_1 = 1
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.secondary = L3_1
L1_1[4] = L2_1
L2_1 = {}
L3_1 = {}
L4_1 = 0.27
L5_1 = 0.87
L6_1 = 1
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.primary = L3_1
L3_1 = {}
L4_1 = 0.68
L5_1 = 0.94
L6_1 = 1
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.secondary = L3_1
L1_1[5] = L2_1

function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L5_2 = display
  L5_2 = L5_2.newGroup
  L5_2 = L5_2()
  L6_2 = nil
  L7_2 = {}
  L8_2 = 0
  L9_2 = L1_1
  L10_2 = math
  L10_2 = L10_2.random
  L11_2 = 1
  L12_2 = L1_1
  L12_2 = #L12_2
  L10_2 = L10_2(L11_2, L12_2)
  L9_2 = L9_2[L10_2]
  
  function L10_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L0_3 = display
    L0_3 = L0_3.newImageRect
    L1_3 = "images/game/fireworks/spark4.png"
    L2_3 = 50
    L3_3 = 101
    L0_3 = L0_3(L1_3, L2_3, L3_3)
    L1_3 = A0_2
    L0_3.x = L1_3
    L1_3 = A1_2
    L0_3.y = L1_3
    L0_3.alpha = 0.8
    L2_3 = L0_3
    L1_3 = L0_3.scale
    L3_3 = 0.15
    L4_3 = 0.15
    L1_3(L2_3, L3_3, L4_3)
    L2_3 = L0_3
    L1_3 = L0_3.setFillColor
    L3_3 = L9_2
    L3_3 = L3_3.primary
    L3_3 = L3_3[1]
    L4_3 = L9_2
    L4_3 = L4_3.primary
    L4_3 = L4_3[2]
    L5_3 = L9_2
    L5_3 = L5_3.primary
    L5_3 = L5_3[3]
    L1_3(L2_3, L3_3, L4_3, L5_3)
    L1_3 = L5_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L0_3
    L1_3(L2_3, L3_3)
    
    function L1_3()
      local L0_4, L1_4
      L0_4 = L0_3
      if L0_4 then
        L0_4 = L0_3
        L0_4 = L0_4.removeSelf
        if L0_4 then
          L0_4 = transition
          L0_4 = L0_4.cancel
          L1_4 = L0_3
          L0_4(L1_4)
          L0_4 = L0_3
          L1_4 = L0_4
          L0_4 = L0_4.removeSelf
          L0_4(L1_4)
          L0_4 = nil
          L0_3 = L0_4
        end
      end
    end
    
    L2_3 = math
    L2_3 = L2_3.random
    L3_3 = 360
    L2_3 = L2_3(L3_3)
    L3_3 = A3_2
    if L3_3 then
      L3_3 = A4_2
      if not L3_3 then
        L3_3 = math
        L3_3 = L3_3.random
        L4_3 = 135
        L5_3 = 225
        L3_3 = L3_3(L4_3, L5_3)
        L2_3 = L3_3
      end
    end
    L3_3 = 180 - L2_3
    L0_3.rotation = L3_3
    L3_3 = L2_3 * 3.14
    L3_3 = L3_3 / 180
    L4_3 = math
    L4_3 = L4_3.random
    L5_3 = 25
    L6_3 = 30
    L4_3 = L4_3(L5_3, L6_3)
    L5_3 = A3_2
    if L5_3 then
      L5_3 = A4_2
      if not L5_3 then
        L4_3 = L4_3 * 2
      end
    end
    L5_3 = math
    L5_3 = L5_3.sin
    L6_3 = L3_3
    L5_3 = L5_3(L6_3)
    L5_3 = L5_3 * L4_3
    L6_3 = math
    L6_3 = L6_3.cos
    L7_3 = L3_3
    L6_3 = L6_3(L7_3)
    L6_3 = L6_3 * L4_3
    L7_3 = transition
    L7_3 = L7_3.to
    L8_3 = L0_3
    L9_3 = {}
    L9_3.time = 1000
    L9_3.delta = true
    L9_3.xScale = 0.1
    L9_3.yScale = 0.1
    L9_3.x = L5_3
    L9_3.y = L6_3
    L9_3.tag = "fireworksParticles"
    L10_3 = easing
    L10_3 = L10_3.outCubic
    L9_3.transition = L10_3
    L9_3.onComplete = L1_3
    L7_3(L8_3, L9_3)
    L7_3 = transition
    L7_3 = L7_3.to
    L8_3 = L0_3
    L9_3 = {}
    L9_3.time = 900
    L9_3.alpha = 0
    L9_3.tag = "fireworksParticles"
    L10_3 = easing
    L10_3 = L10_3.inBack
    L9_3.transition = L10_3
    L7_3(L8_3, L9_3)
    L7_3 = L7_2
    L8_3 = L7_2
    L8_3 = #L8_3
    L8_3 = L8_3 + 1
    L7_3[L8_3] = L0_3
    L7_3 = L8_2
    L7_3 = L7_3 + 1
    L8_2 = L7_3
  end
  
  function L11_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L0_3 = display
    L0_3 = L0_3.newImageRect
    L1_3 = "images/game/fireworks/spark1.png"
    L2_3 = 67
    L3_3 = 69
    L0_3 = L0_3(L1_3, L2_3, L3_3)
    L1_3 = A0_2
    L0_3.x = L1_3
    L1_3 = A1_2
    L0_3.y = L1_3
    L2_3 = L0_3
    L1_3 = L0_3.scale
    L3_3 = 0.5
    L4_3 = 0.5
    L1_3(L2_3, L3_3, L4_3)
    L2_3 = L0_3
    L1_3 = L0_3.setFillColor
    L3_3 = L9_2
    L3_3 = L3_3.secondary
    L3_3 = L3_3[1]
    L4_3 = L9_2
    L4_3 = L4_3.secondary
    L4_3 = L4_3[2]
    L5_3 = L9_2
    L5_3 = L5_3.secondary
    L5_3 = L5_3[3]
    L1_3(L2_3, L3_3, L4_3, L5_3)
    L1_3 = L5_2
    L2_3 = L1_3
    L1_3 = L1_3.insert
    L3_3 = L0_3
    L1_3(L2_3, L3_3)
    
    function L1_3()
      local L0_4, L1_4
      L0_4 = L0_3
      if L0_4 then
        L0_4 = L0_3
        L0_4 = L0_4.removeSelf
        if L0_4 then
          L0_4 = transition
          L0_4 = L0_4.cancel
          L1_4 = L0_3
          L0_4(L1_4)
          L0_4 = L0_3
          L1_4 = L0_4
          L0_4 = L0_4.removeSelf
          L0_4(L1_4)
          L0_4 = nil
          L0_3 = L0_4
        end
      end
    end
    
    L2_3 = math
    L2_3 = L2_3.random
    L3_3 = 360
    L2_3 = L2_3(L3_3)
    L3_3 = A3_2
    if L3_3 then
      L3_3 = A4_2
      if not L3_3 then
        L3_3 = math
        L3_3 = L3_3.random
        L4_3 = 135
        L5_3 = 225
        L3_3 = L3_3(L4_3, L5_3)
        L2_3 = L3_3
      end
    end
    L0_3.rotation = L2_3
    L3_3 = L2_3 * 3.14
    L3_3 = L3_3 / 180
    L4_3 = 10
    L5_3 = A3_2
    if L5_3 then
      L5_3 = A4_2
      if not L5_3 then
        L5_3 = math
        L5_3 = L5_3.random
        L6_3 = 20
        L7_3 = 25
        L5_3 = L5_3(L6_3, L7_3)
        L4_3 = L5_3 * 2
      end
    end
    L5_3 = math
    L5_3 = L5_3.sin
    L6_3 = L3_3
    L5_3 = L5_3(L6_3)
    L5_3 = L5_3 * L4_3
    L6_3 = math
    L6_3 = L6_3.cos
    L7_3 = L3_3
    L6_3 = L6_3(L7_3)
    L6_3 = L6_3 * L4_3
    L7_3 = transition
    L7_3 = L7_3.to
    L8_3 = L0_3
    L9_3 = {}
    L9_3.time = 1500
    L9_3.delta = true
    L9_3.alpha = -0.9
    L9_3.xScale = -0.2
    L9_3.yScale = -0.2
    L9_3.x = L5_3
    L9_3.y = L6_3
    L9_3.tag = "fireworksParticles"
    L10_3 = easing
    L10_3 = L10_3.outCubic
    L9_3.transition = L10_3
    L9_3.onComplete = L1_3
    L7_3(L8_3, L9_3)
    L7_3 = L7_2
    L8_3 = L7_2
    L8_3 = #L8_3
    L8_3 = L8_3 + 1
    L7_3[L8_3] = L0_3
    L7_3 = L8_2
    L7_3 = L7_3 + 1
    L8_2 = L7_3
  end
  
  function L12_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = 1
    L1_3 = A2_2
    L2_3 = 1
    for L3_3 = L0_3, L1_3, L2_3 do
      L4_3 = L10_2
      L4_3()
      if L3_3 < 25 then
        L4_3 = L11_2
        L4_3()
      end
    end
  end
  
  function L13_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L7_2
    if L0_3 then
      L0_3 = 1
      L1_3 = L8_2
      L2_3 = 1
      for L3_3 = L0_3, L1_3, L2_3 do
        L4_3 = L7_2
        L4_3 = L4_3[L3_3]
        if L4_3 then
          L4_3 = L7_2
          L4_3 = L4_3[L3_3]
          L4_3 = L4_3.removeSelf
          if L4_3 then
            L4_3 = transition
            L4_3 = L4_3.cancel
            L5_3 = L7_2
            L5_3 = L5_3[L3_3]
            L4_3(L5_3)
            L4_3 = L7_2
            L4_3 = L4_3[L3_3]
            L5_3 = L4_3
            L4_3 = L4_3.removeSelf
            L4_3(L5_3)
            L4_3 = L7_2
            L4_3[L3_3] = nil
          end
        end
      end
      L0_3 = nil
      L7_2 = L0_3
      L0_3 = 0
      L8_2 = L0_3
    end
    L0_3 = L5_2
    if L0_3 then
      L0_3 = L5_2
      L0_3 = L0_3.removeSelf
      if L0_3 then
        L0_3 = L5_2
        L1_3 = L0_3
        L0_3 = L0_3.removeSelf
        L0_3(L1_3)
        L0_3 = nil
        L5_2 = L0_3
      end
    end
  end
  
  L5_2.clean = L13_2
  L14_2 = L12_2
  L14_2()
  return L5_2
end

L0_1.create = L2_1
return L0_1
