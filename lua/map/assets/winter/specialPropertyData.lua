--------------------------------------- 
local L0_1, L1_1
L0_1 = {}

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
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
  L6_2 = "lua.map.behaviors.iceicleBehavior"
  L5_2[1] = L6_2
  L4_2.behavior = L5_2
  L4_2.noBaseImage = true
  L3_2[1] = L4_2
  L2_2.blocks = L3_2
  L3_2 = {}
  L3_2.special001 = 1
  L3_2.special002 = 1
  L2_2.frames = L3_2
  return L2_2
end

L0_1.init = L1_1
return L0_1
 
---------------------------------------
