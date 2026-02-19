local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = unpack
L1_1 = pairs
L2_1 = ipairs
L3_1 = {}

function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  L4_2 = {}
  L4_2.pe_fixture_id = ""
  L4_2.density = 2
  L4_2.friction = 0
  L4_2.bounce = 0
  L5_2 = {}
  L5_2.categoryBits = 1
  L5_2.maskBits = 65535
  L5_2.groupIndex = 0
  L4_2.filter = L5_2
  L5_2 = {}
  L6_2 = -30
  L7_2 = -40
  L8_2 = 40
  L9_2 = -40
  L10_2 = 80
  L11_2 = -6
  L12_2 = 40
  L13_2 = 70
  L14_2 = -30
  L15_2 = 70
  L16_2 = -80
  L17_2 = 0
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L5_2[6] = L11_2
  L5_2[7] = L12_2
  L5_2[8] = L13_2
  L5_2[9] = L14_2
  L5_2[10] = L15_2
  L5_2[11] = L16_2
  L5_2[12] = L17_2
  L4_2.shape = L5_2
  L3_2[1] = L4_2
  L2_2.floatingBladeTrap = L3_2
  L3_2 = {}
  L4_2 = {}
  L4_2.pe_fixture_id = ""
  L4_2.density = 2
  L4_2.friction = 0
  L4_2.bounce = 0
  L5_2 = {}
  L5_2.categoryBits = 1
  L5_2.maskBits = 65535
  L5_2.groupIndex = 0
  L4_2.filter = L5_2
  L4_2.radius = 38.013
  L3_2[1] = L4_2
  L2_2.bladeTrap = L3_2
  L3_2 = {}
  L4_2 = {}
  L4_2.pe_fixture_id = ""
  L4_2.density = 2
  L4_2.friction = 0
  L4_2.bounce = 0
  L5_2 = {}
  L5_2.categoryBits = 1
  L5_2.maskBits = 65535
  L5_2.groupIndex = 0
  L4_2.filter = L5_2
  L5_2 = {}
  L6_2 = 71
  L7_2 = -16.5
  L8_2 = -69
  L9_2 = -18.5
  L10_2 = -27
  L11_2 = -35.5
  L12_2 = 36
  L13_2 = -35.5
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L5_2[6] = L11_2
  L5_2[7] = L12_2
  L5_2[8] = L13_2
  L4_2.shape = L5_2
  L3_2[1] = L4_2
  L2_2.small_bounce1 = L3_2
  L1_2.data = L2_2
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = 1
  end
  L3_2 = L1_1
  L4_2 = L1_2.data
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = L2_1
    L9_2 = L7_2
    L8_2, L9_2, L10_2 = L8_2(L9_2)
    for L11_2, L12_2 in L8_2, L9_2, L10_2 do
      L13_2 = L12_2.shape
      if L13_2 then
        L13_2 = L2_1
        L14_2 = L12_2.shape
        L13_2, L14_2, L15_2 = L13_2(L14_2)
        for L16_2, L17_2 in L13_2, L14_2, L15_2 do
          L18_2 = L12_2.shape
          L19_2 = L2_2 * L17_2
          L18_2[L16_2] = L19_2
        end
      else
        L13_2 = L12_2.radius
        L13_2 = L2_2 * L13_2
        L12_2.radius = L13_2
      end
    end
  end
  
  function L3_2(A0_3, A1_3)
    local L2_3, L3_3
    L2_3 = L0_1
    L3_3 = A0_3.data
    L3_3 = L3_3[A1_3]
    return L2_3(L3_3)
  end
  
  L1_2.get = L3_2
  
  function L3_2(A0_3, A1_3, A2_3)
    local L3_3
    L3_3 = A0_3.data
    L3_3 = L3_3[A1_3]
    L3_3 = L3_3[A2_3]
    L3_3 = L3_3.pe_fixture_id
    return L3_3
  end
  
  L1_2.getFixtureId = L3_2
  return L1_2
end

L3_1.physicsData = L4_1
return L3_1
