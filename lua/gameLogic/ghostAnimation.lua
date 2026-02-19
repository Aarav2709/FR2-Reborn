local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "physics"
L2_1 = L2_1(L3_1)

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L0_2 = math
  L0_2 = L0_2.abs
  L1_2 = math
  L1_2 = L1_2.deg
  L2_2 = math
  L2_2 = L2_2.atan2
  L3_2 = display
  L3_2 = L3_2.newSprite
  L4_2 = L1_1
  L4_2 = L4_2.ghostImageSheet
  L5_2 = L1_1
  L5_2 = L5_2.data
  L5_2 = L5_2.animations
  L5_2 = L5_2.ghost
  L3_2 = L3_2(L4_2, L5_2)
  L3_2.xScale = 0.47
  L3_2.yScale = 0.47
  L3_2.alpha = 0
  L4_2 = L2_1
  L4_2 = L4_2.addBody
  L5_2 = L3_2
  L6_2 = "dynamic"
  L7_2 = {}
  L7_2.density = 1
  L7_2.bounce = 0
  L7_2.isSensor = true
  L7_2.radius = 10
  L7_2.friction = 0
  L4_2(L5_2, L6_2, L7_2)
  L3_2.gravityScale = -0.5
  L3_2.linearDampening = 150
  L4_2 = false
  L5_2 = nil
  L6_2 = false
  L7_2 = 0
  L8_2 = 0
  L9_2 = 200
  L10_2 = 200
  L11_2 = 0
  L12_2 = 0
  L13_2 = 0
  L14_2 = -4
  L15_2 = 0.25
  L16_2 = 0.25
  
  function L17_2(A0_3)
    local L1_3
    if A0_3 < 0 then
      L1_3 = -1
      return L1_3
    else
      L1_3 = 1
      return L1_3
    end
  end
  
  function L18_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3
    L3_3 = L0_2
    L4_3 = A0_3
    L3_3 = L3_3(L4_3)
    L4_3 = L17_2
    L5_3 = A0_3
    L4_3 = L4_3(L5_3)
    L5_3 = A0_3
    if A2_3 < L3_3 then
      L5_3 = A2_3 * L4_3
    end
    if A1_3 > L3_3 then
      L5_3 = A1_3 * L4_3
    end
    return L5_3
  end
  
  function L19_2()
    local L0_3, L1_3
    L0_3 = L3_2
    L0_3.alpha = 0
    L0_3 = false
    L6_2 = L0_3
  end
  
  L3_2.hide = L19_2
  
  function L19_2()
    local L0_3, L1_3
    L0_3 = L3_2
    L0_3 = L0_3.hide
    L0_3()
  end
  
  L3_2.despawn = L19_2
  
  function L19_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3
    
    function L3_3()
      local L0_4, L1_4, L2_4, L3_4
      L0_4 = L5_2
      if L0_4 then
        L0_4 = timer
        L0_4 = L0_4.cancel
        L1_4 = L5_2
        L0_4(L1_4)
        L0_4 = nil
        L5_2 = L0_4
      end
      L0_4 = 0
      L1_4 = -5.333333333333333
      L14_2 = L1_4
      L13_2 = L0_4
      L0_4 = L3_2
      L1_4 = A0_3
      L1_4 = L1_4.x
      L0_4.x = L1_4
      L0_4 = L3_2
      L1_4 = A0_3
      L1_4 = L1_4.y
      L0_4.y = L1_4
      L0_4 = L18_2
      L1_4 = A1_3
      L2_4 = L11_2
      L3_4 = L9_2
      L0_4 = L0_4(L1_4, L2_4, L3_4)
      L7_2 = L0_4
      L0_4 = L18_2
      L1_4 = A2_3
      L2_4 = L12_2
      L3_4 = L10_2
      L0_4 = L0_4(L1_4, L2_4, L3_4)
      L8_2 = L0_4
      L0_4 = L3_2
      L1_4 = L0_4
      L0_4 = L0_4.setLinearVelocity
      L2_4 = L7_2
      L3_4 = L8_2
      L0_4(L1_4, L2_4, L3_4)
      L0_4 = true
      L6_2 = L0_4
      L0_4 = L3_2
      L0_4.alpha = 1
      L0_4 = L3_2
      L1_4 = L0_4
      L0_4 = L0_4.setSequence
      L2_4 = "normal"
      L0_4(L1_4, L2_4)
      L0_4 = L3_2
      L1_4 = L0_4
      L0_4 = L0_4.play
      L0_4(L1_4)
      L0_4 = timer
      L0_4 = L0_4.performWithDelay
      L1_4 = 7500
      L2_4 = L3_2
      L2_4 = L2_4.despawn
      L3_4 = 1
      L0_4 = L0_4(L1_4, L2_4, L3_4)
      L5_2 = L0_4
    end
    
    L4_3 = timer
    L4_3 = L4_3.performWithDelay
    L5_3 = 10
    L6_3 = L3_3
    L7_3 = 1
    L4_3 = L4_3(L5_3, L6_3, L7_3)
    L5_2 = L4_3
  end
  
  L3_2.show = L19_2
  
  function L19_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.getLinearVelocity
    L0_3, L1_3 = L0_3(L1_3)
    L2_3 = L1_2
    L3_3 = L2_2
    L4_3 = L1_3
    L5_3 = L0_3
    L3_3, L4_3, L5_3 = L3_3(L4_3, L5_3)
    L2_3 = L2_3(L3_3, L4_3, L5_3)
    L3_3 = 90 + L2_3
    L4_3 = L3_2
    L4_3.rotation = L3_3
  end
  
  function L20_2(A0_3, A1_3)
    local L2_3
    L2_3 = A0_3 + A1_3
    return L2_3
  end
  
  function L21_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L3_3 = A1_3 - A0_3
    L4_3 = L17_2
    L5_3 = L3_3
    L4_3 = L4_3(L5_3)
    L5_3 = A0_3
    if 0 < L4_3 then
      L6_3 = L20_2
      L7_3 = A0_3
      L8_3 = A2_3
      L6_3 = L6_3(L7_3, L8_3)
      L5_3 = L6_3
    else
      L6_3 = L20_2
      L7_3 = A0_3
      L8_3 = -A2_3
      L6_3 = L6_3(L7_3, L8_3)
      L5_3 = L6_3
    end
    return L5_3
  end
  
  function L22_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L0_2
    L1_3 = L13_2
    L2_3 = L7_2
    L1_3 = L1_3 - L2_3
    L0_3 = L0_3(L1_3)
    L1_3 = L15_2
    L1_3 = L1_3 + 0.001
    if L0_3 < L1_3 then
      L0_3 = L0_2
      L1_3 = L14_2
      L2_3 = L8_2
      L1_3 = L1_3 - L2_3
      L0_3 = L0_3(L1_3)
      L1_3 = L16_2
      L1_3 = L1_3 + 0.001
      if L0_3 < L1_3 then
        L0_3 = L13_2
        L7_2 = L0_3
        L0_3 = L14_2
        L8_2 = L0_3
        L0_3 = L14_2
        if L0_3 < -10 then
          L0_3 = L14_2
          L0_3 = L0_3 * 0.95
          L14_2 = L0_3
        end
        return
      end
    end
    L0_3 = L21_2
    L1_3 = L7_2
    L2_3 = L13_2
    L3_3 = L15_2
    L0_3 = L0_3(L1_3, L2_3, L3_3)
    L1_3 = L21_2
    L2_3 = L8_2
    L3_3 = L14_2
    L4_3 = L16_2
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    L7_2 = L0_3
    L8_2 = L1_3
  end
  
  function L23_2()
    local L0_3, L1_3
    L0_3 = L6_2
    if L0_3 then
      L0_3 = L4_2
      if not L0_3 then
        goto lbl_8
      end
    end
    do return end
    ::lbl_8::
    L0_3 = L19_2
    L0_3()
  end
  
  L3_2.update = L23_2
  
  function L23_2()
    local L0_3, L1_3
    L0_3 = L4_2
    if L0_3 then
      return
    end
    L0_3 = true
    L4_2 = L0_3
    L0_3 = L5_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L5_2
      L0_3(L1_3)
      L0_3 = nil
      L5_2 = L0_3
    end
  end
  
  L3_2.clean = L23_2
  return L3_2
end

L0_1.create = L3_1
return L0_1
