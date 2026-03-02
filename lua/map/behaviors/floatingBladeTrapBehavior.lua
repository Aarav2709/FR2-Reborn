---------------------------------------
local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "physics"
L2_1 = L2_1(L3_1)

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L1_2 = A0_2.displayGroup
  L2_2 = L1_1
  L2_2 = L2_2.powerUpImageSheetInfo
  L3_2 = L2_2
  L2_2 = L2_2.getFrameIndex
  L4_2 = "sawblade"
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = "floatingBladeTrap"
  L4_2 = nil
  L5_2 = display
  L5_2 = L5_2.newGroup
  L5_2 = L5_2()
  L6_2 = display
  L6_2 = L6_2.newImage
  L7_2 = A0_2.animatedBlockSheet
  L8_2 = A0_2.animatedBlockSheetFile
  L9_2 = L8_2
  L8_2 = L8_2.getFrameIndex
  L10_2 = L3_2
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L8_2(L9_2, L10_2)
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L8_2 = L6_2
  L7_2 = L6_2.scale
  L9_2 = A0_2.scale
  L10_2 = A0_2.scale
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = A0_2.x
  L6_2.x = L7_2
  L7_2 = A0_2.y
  L6_2.y = L7_2
  L7_2 = "lua.map.assets.physics."
  L8_2 = L1_1
  L8_2 = L8_2.data
  if L8_2 then
    L8_2 = L8_2.currentLevelTheme
  end
  if not L8_2 then
    L8_2 = A0_2.theme
  end
  if not L8_2 then
    L8_2 = "forest"
  end
  L9_2 = "_special"
  L7_2 = L7_2 .. L8_2 .. L9_2
  L8_2 = require
  L9_2 = L7_2
  L8_2 = L8_2(L9_2)
  L8_2 = L8_2.physicsData
  L9_2 = A0_2.scale
  L8_2 = L8_2(L9_2)
  L9_2 = {}
  L11_2 = L8_2
  L10_2 = L8_2.get
  L12_2 = L3_2
  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L10_2(L11_2, L12_2)
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L9_2[4] = L13_2
  L9_2[5] = L14_2
  L9_2[6] = L15_2
  L9_2[7] = L16_2
  L9_2[8] = L17_2
  L10_2 = ipairs
  L11_2 = L9_2
  L10_2, L11_2, L12_2 = L10_2(L11_2)
  for L13_2, L14_2 in L10_2, L11_2, L12_2 do
    L15_2 = obstacleFilter
    L14_2.filter = L15_2
    L14_2.isSensor = true
  end
  L10_2 = L2_1
  L10_2 = L10_2.addBody
  L11_2 = L6_2
  L12_2 = unpack
  L13_2 = L9_2
  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L12_2(L13_2)
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L6_2.bodyType = "static"
  L6_2.isFixedRotation = true
  L6_2.floatingBladeTrap = true
  L6_2.mapElement = true
  L10_2 = false
  L11_2 = display
  L11_2 = L11_2.newImage
  L12_2 = L1_1
  L12_2 = L12_2.powerUpImageSheet
  L13_2 = L2_2
  L11_2 = L11_2(L12_2, L13_2)
  L11_2.xScale = 0.7
  L11_2.yScale = 0.7
  L12_2 = A0_2.x
  L11_2.x = L12_2
  L12_2 = A0_2.y
  L11_2.y = L12_2
  L13_2 = L5_2
  L12_2 = L5_2.insert
  L14_2 = L11_2
  L12_2(L13_2, L14_2)
  L13_2 = L5_2
  L12_2 = L5_2.insert
  L14_2 = L6_2
  L12_2(L13_2, L14_2)
  L13_2 = L1_2
  L12_2 = L1_2.insert
  L14_2 = L5_2
  L12_2(L13_2, L14_2)
  L12_2 = L1_1
  if L12_2.culler and L12_2.culler.addAnimatedTile then
    L12_2.culler.addAnimatedTile(A0_2.x, L5_2)
  end
  L5_2.isVisible = false

  function L12_2()
    local L0_3, L1_3, L2_3
    L0_3 = L10_2
    if not L0_3 then
      L0_3 = L11_2
      L1_3 = L0_3
      L0_3 = L0_3.rotate
      L2_3 = 30
      L0_3(L1_3, L2_3)
    end
  end

  function L13_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = true
    L10_2 = L0_3
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "enterFrame"
    L3_3 = L12_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L4_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L4_2
      L0_3(L1_3)
      L0_3 = nil
      L4_2 = L0_3
    end
    L0_3 = L5_2
    if L0_3 then
      L0_3 = L5_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L5_2 = L0_3
    end
    L0_3 = L6_2
    if L0_3 then
      L0_3 = L6_2
      L0_3 = L0_3.removeSelf
      if L0_3 then
        L0_3 = L6_2
        L1_3 = L0_3
        L0_3 = L0_3.removeSelf
        L0_3(L1_3)
        L0_3 = nil
        L6_2 = L0_3
      end
    end
  end

  L14_2 = A0_2.behaviors
  L15_2 = {}
  L14_2.floatingBladeTrap = L15_2
  L14_2 = A0_2.behaviors
  L14_2 = L14_2.floatingBladeTrap
  L14_2.clean = L13_2
  L14_2 = Runtime
  L15_2 = L14_2
  L14_2 = L14_2.addEventListener
  L16_2 = "enterFrame"
  L17_2 = L12_2
  L14_2(L15_2, L16_2, L17_2)
end

L0_1.addBehavior = L3_1
return L0_1

---------------------------------------
