--------------------------------------- 
local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = require
  L2_2 = "lua.map.assets."
  L3_2 = A0_2
  L4_2 = ".animatedTiles"
  L2_2 = L2_2 .. L3_2 .. L4_2
  L1_2 = L1_2(L2_2)
  L2_2 = {}
  L3_2 = {}
  L4_2 = {}
  L5_2 = {}
  L6_2 = {}
  L6_2.name = "idleAnimation"
  L7_2 = {}
  L9_2 = L1_2
  L8_2 = L1_2.getFrameIndex
  L10_2 = "powerupBox0"
  L8_2 = L8_2(L9_2, L10_2)
  L10_2 = L1_2
  L9_2 = L1_2.getFrameIndex
  L11_2 = "powerupBox1"
  L9_2 = L9_2(L10_2, L11_2)
  L11_2 = L1_2
  L10_2 = L1_2.getFrameIndex
  L12_2 = "powerupBox2"
  L10_2 = L10_2(L11_2, L12_2)
  L12_2 = L1_2
  L11_2 = L1_2.getFrameIndex
  L13_2 = "powerupBox3"
  L11_2 = L11_2(L12_2, L13_2)
  L13_2 = L1_2
  L12_2 = L1_2.getFrameIndex
  L14_2 = "powerupBox4"
  L12_2 = L12_2(L13_2, L14_2)
  L14_2 = L1_2
  L13_2 = L1_2.getFrameIndex
  L15_2 = "powerupBox0"
  L13_2, L14_2, L15_2 = L13_2(L14_2, L15_2)
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  L7_2[5] = L12_2
  L7_2[6] = L13_2
  L7_2[7] = L14_2
  L7_2[8] = L15_2
  L6_2.frames = L7_2
  L6_2.time = 300
  L6_2.loopCount = 1
  L6_2.loopDirection = "forward"
  L5_2.sequenceData = L6_2
  L4_2.animation = L5_2
  L5_2 = {}
  L5_2.powerUp = true
  L5_2.idleAnimationInterval = 1000
  L4_2.properties = L5_2
  L5_2 = {}
  L6_2 = "lua.map.behaviors.idleAnimation"
  L5_2[1] = L6_2
  L4_2.behavior = L5_2
  L5_2 = {}
  L6_2 = {}
  L7_2 = "lua.map.behaviors.bounceTileBehavior"
  L6_2[1] = L7_2
  L5_2.behavior = L6_2
  L6_2 = {}
  L7_2 = {}
  L7_2.boost = true
  L6_2.properties = L7_2
  L7_2 = {}
  L8_2 = "lua.map.behaviors.speedBehavior"
  L7_2[1] = L8_2
  L6_2.behavior = L7_2
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L2_2.blocks = L3_2
  L3_2 = {}
  L3_2.normal001 = 1
  L3_2.normal068 = 2
  L3_2.normal069 = 2
  L3_2.normal070 = 2
  L3_2.normal089 = 3
  L3_2.normal090 = 3
  L2_2.frames = L3_2
  L3_2 = require
  L4_2 = "lua.map.assets."
  L5_2 = A0_2
  L6_2 = ".specialPropertyData"
  L4_2 = L4_2 .. L5_2 .. L6_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2.init
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L1_3 = L2_2
    L1_3 = L1_3.blocks
    L1_3 = #L1_3
    L2_3 = A0_3.frames
    L3_3 = A0_3.blocks
    L4_3 = pairs
    L5_3 = L3_3
    L4_3, L5_3, L6_3 = L4_3(L5_3)
    for L7_3, L8_3 in L4_3, L5_3, L6_3 do
      L9_3 = L2_2
      L9_3 = L9_3.blocks
      L10_3 = L1_3 + L7_3
      L9_3[L10_3] = L8_3
    end
    L4_3 = pairs
    L5_3 = L2_3
    L4_3, L5_3, L6_3 = L4_3(L5_3)
    for L7_3, L8_3 in L4_3, L5_3, L6_3 do
      L9_3 = L2_2
      L9_3 = L9_3.frames
      L10_3 = L8_3 + L1_3
      L9_3[L7_3] = L10_3
    end
    L4_3 = L1_1
    L4_3 = L4_3.debugger
    L4_3 = L4_3.debugTable
    L5_3 = "main"
    L6_3 = "blockmap after adding special"
    L7_3 = L2_2
    L4_3(L5_3, L6_3, L7_3)
  end
  
  L5_2 = L4_2
  L6_2 = L3_2
  L5_2(L6_2)
  
  function L5_2(A0_3)
    local L1_3
    L1_3 = L2_2
    L1_3 = L1_3.frames
    L1_3 = L1_3[A0_3]
    return L1_3
  end
  
  L2_2.getFrameIndex = L5_2
  
  function L5_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L2_2
    L1_3 = L1_3.blocks
    L2_3 = L2_2
    L2_3 = L2_3.getFrameIndex
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    L1_3 = L1_3[L2_3]
    return L1_3
  end
  
  L2_2.getBlock = L5_2
  
  function L5_2(A0_3)
    local L1_3
    if A0_3 == "001" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "009" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "011" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "013" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "061" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "062" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "063" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "064" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "065" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "066" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "067" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "068" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "069" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "070" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "088" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "089" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "090" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "096" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "097" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "098" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "099" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "100" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "101" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "102" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "103" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "104" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "105" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "106" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "107" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "108" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "109" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "110" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "111" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "112" then
      L1_3 = false
      return L1_3
    elseif A0_3 == "113" then
      L1_3 = false
      return L1_3
    else
      L1_3 = true
      return L1_3
    end
  end
  
  L2_2.canTileHaveDecal = L5_2
  return L2_2
end

L0_1.init = L2_1
return L0_1
 
---------------------------------------
