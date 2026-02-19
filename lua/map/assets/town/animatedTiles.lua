--------------------------------------- 
local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = {}
L1_1 = {}
L2_1 = {}
L3_1 = {}
L3_1.x = 4
L3_1.y = 4
L3_1.width = 336
L3_1.height = 206
L3_1.sourceX = 124
L3_1.sourceY = 0
L3_1.sourceWidth = 480
L3_1.sourceHeight = 300
L4_1 = {}
L4_1.x = 132
L4_1.y = 216
L4_1.width = 58
L4_1.height = 60
L4_1.sourceX = 54
L4_1.sourceY = 20
L4_1.sourceWidth = 160
L4_1.sourceHeight = 100
L5_1 = {}
L5_1.x = 132
L5_1.y = 282
L5_1.width = 58
L5_1.height = 60
L5_1.sourceX = 54
L5_1.sourceY = 20
L5_1.sourceWidth = 160
L5_1.sourceHeight = 100
L6_1 = {}
L6_1.x = 132
L6_1.y = 348
L6_1.width = 58
L6_1.height = 60
L6_1.sourceX = 54
L6_1.sourceY = 20
L6_1.sourceWidth = 160
L6_1.sourceHeight = 100
L7_1 = {}
L7_1.x = 132
L7_1.y = 414
L7_1.width = 58
L7_1.height = 60
L7_1.sourceX = 54
L7_1.sourceY = 20
L7_1.sourceWidth = 160
L7_1.sourceHeight = 100
L8_1 = {}
L8_1.x = 196
L8_1.y = 216
L8_1.width = 58
L8_1.height = 60
L8_1.sourceX = 54
L8_1.sourceY = 20
L8_1.sourceWidth = 160
L8_1.sourceHeight = 100
L9_1 = {}
L9_1.x = 346
L9_1.y = 4
L9_1.width = 130
L9_1.height = 100
L9_1.sourceX = 12
L9_1.sourceY = 0
L9_1.sourceWidth = 160
L9_1.sourceHeight = 100
L10_1 = {}
L10_1.x = 346
L10_1.y = 110
L10_1.width = 130
L10_1.height = 100
L10_1.sourceX = 12
L10_1.sourceY = 0
L10_1.sourceWidth = 160
L10_1.sourceHeight = 100
L11_1 = {}
L11_1.x = 4
L11_1.y = 216
L11_1.width = 122
L11_1.height = 112
L11_1.sourceX = 0
L11_1.sourceY = 0
L11_1.sourceWidth = 122
L11_1.sourceHeight = 111
L12_1 = {}
L12_1.x = 4
L12_1.y = 334
L12_1.width = 122
L12_1.height = 112
L12_1.sourceX = 0
L12_1.sourceY = 0
L12_1.sourceWidth = 122
L12_1.sourceHeight = 111
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L2_1[8] = L10_1
L2_1[9] = L11_1
L2_1[10] = L12_1
L1_1.frames = L2_1
L1_1.sheetContentWidth = 512
L1_1.sheetContentHeight = 512
L0_1.sheet = L1_1
L1_1 = {}
L1_1.cannon1 = 1
L1_1.powerupBox0 = 2
L1_1.powerupBox1 = 3
L1_1.powerupBox2 = 4
L1_1.powerupBox3 = 5
L1_1.powerupBox4 = 6
L1_1.speedFlat1 = 7
L1_1.speedFlat2 = 8
L1_1.speedHill1 = 9
L1_1.speedHill2 = 10
L0_1.frameIndex = L1_1

function L1_1(A0_2)
  local L1_2
  L1_2 = A0_2.sheet
  return L1_2
end

L0_1.getSheet = L1_1

function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.frameIndex
  L2_2 = L2_2[A1_2]
  return L2_2
end

L0_1.getFrameIndex = L1_1
return L0_1
 
---------------------------------------
