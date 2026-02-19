local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "lua.game.effects.fireworks"
L2_1 = L2_1(L3_1)
L3_1 = nil
L4_1 = false
L5_1 = nil

function L6_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2
  L5_2 = L4_1
  if L5_2 then
    return
  end
  L5_2 = {}
  L5_1 = L5_2
  L5_2 = math
  L5_2 = L5_2.random
  L6_2 = true
  L4_1 = L6_2
  L6_2 = true
  
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L0_3 = L3_1
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L3_1
      L0_3(L1_3)
      L0_3 = nil
      L3_1 = L0_3
    end
    L0_3 = 0
    L1_3 = 0
    L2_3 = A4_2
    if L2_3 then
      L2_3 = L5_2
      L3_3 = 50
      L4_3 = 430
      L2_3 = L2_3(L3_3, L4_3)
      L0_3 = 480 - L2_3
      if 170 < L0_3 and L0_3 < 350 then
        L2_3 = L5_2
        L3_3 = 0
        L4_3 = 1
        L2_3 = L2_3(L3_3, L4_3)
        if L2_3 == 1 then
          L2_3 = L5_2
          L3_3 = 20
          L4_3 = 100
          L2_3 = L2_3(L3_3, L4_3)
          L1_3 = L2_3
        else
          L2_3 = L5_2
          L3_3 = 270
          L4_3 = 300
          L2_3 = L2_3(L3_3, L4_3)
          L1_3 = L2_3
        end
      else
        L2_3 = L5_2
        L3_3 = 0
        L4_3 = 320
        L2_3 = L2_3(L3_3, L4_3)
        L1_3 = L2_3
      end
    else
      L2_3 = L6_2
      if not L2_3 then
        L2_3 = L5_2
        L3_3 = -20
        L4_3 = 400
        L2_3 = L2_3(L3_3, L4_3)
        L0_3 = L2_3
        L2_3 = L5_2
        L3_3 = 100
        L4_3 = 200
        L2_3 = L2_3(L3_3, L4_3)
        L1_3 = L2_3
      end
    end
    L2_3 = 25
    L3_3 = L6_2
    if L3_3 then
      L2_3 = 35
    end
    L3_3 = L2_1
    L3_3 = L3_3.create
    L4_3 = A0_2
    L4_3 = L4_3 + L0_3
    L5_3 = A1_2
    L5_3 = L5_3 - L1_3
    L6_3 = L2_3
    L7_3 = L6_2
    L8_3 = A4_2
    L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3)
    L4_3 = L5_1
    L5_3 = L5_1
    L5_3 = #L5_3
    L5_3 = L5_3 + 1
    L4_3[L5_3] = L3_3
    L4_3 = A2_2
    L4_3 = L4_3.numChildren
    if L4_3 < 7 then
      L4_3 = A2_2
      L5_3 = L4_3
      L4_3 = L4_3.insert
      L6_3 = L3_3
      L4_3(L5_3, L6_3)
    else
      L4_3 = A2_2
      L5_3 = L4_3
      L4_3 = L4_3.insert
      L6_3 = 7
      L7_3 = L3_3
      L4_3(L5_3, L6_3, L7_3)
    end
    L4_3 = A3_2
    L4_3 = L4_3 - 1
    L4_3 = 50 * L4_3
    L4_3 = 300 + L4_3
    L5_3 = A3_2
    L5_3 = L5_3 - 1
    L5_3 = 50 * L5_3
    L5_3 = 800 + L5_3
    L6_3 = false
    L6_2 = L6_3
    L6_3 = timer
    L6_3 = L6_3.performWithDelay
    L7_3 = L5_2
    L8_3 = L4_3
    L9_3 = L5_3
    L7_3 = L7_3(L8_3, L9_3)
    L8_3 = L7_2
    L9_3 = 1
    L6_3 = L6_3(L7_3, L8_3, L9_3)
    L3_1 = L6_3
  end
  
  L8_2 = L7_2
  L8_2()
end

L0_1.startFireWorks = L6_1

function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = false
  L4_1 = L0_2
  L0_2 = transition
  L0_2 = L0_2.cancel
  L1_2 = "fireworksParticles"
  L0_2(L1_2)
  L0_2 = L3_1
  if L0_2 then
    L0_2 = timer
    L0_2 = L0_2.cancel
    L1_2 = L3_1
    L0_2(L1_2)
    L0_2 = nil
    L3_1 = L0_2
  end
  L0_2 = L5_1
  if L0_2 then
    L0_2 = 1
    L1_2 = L5_1
    L1_2 = #L1_2
    L2_2 = 1
    for L3_2 = L0_2, L1_2, L2_2 do
      L4_2 = L5_1
      L4_2 = L4_2[L3_2]
      if L4_2 then
        L4_2 = L5_1
        L4_2 = L4_2[L3_2]
        L4_2 = L4_2.clean
        L4_2()
        L4_2 = L5_1
        L4_2[L3_2] = nil
      end
    end
    L0_2 = {}
    L5_1 = L0_2
  end
end

L0_1.clean = L7_1
return L0_1
