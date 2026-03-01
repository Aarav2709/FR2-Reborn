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
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = A0_2.displayGroup
  L2_2 = A0_2.animatedBlockSheet
  L3_2 = A0_2.tileId
  L4_2 = A0_2.theme
  L5_2 = "roofSlow1"
  L6_2 = 25
  if L3_2 == 2 then
    L5_2 = "groundSlow1"
    L6_2 = -25
  end
  L7_2 = {}
  L7_2.name = "collisionAnimation"
  L8_2 = A0_2.animatedBlockSheetFile
  L9_2 = L8_2
  L8_2 = L8_2.getFrameIndex
  L10_2 = L5_2
  L8_2 = L8_2(L9_2, L10_2)
  if not L8_2 then
    return
  end
  L7_2.start = L8_2
  L7_2.count = 4
  L7_2.time = 350
  L7_2.loopCount = 1
  L7_2.loopDirection = "bounce"
  L8_2 = display
  L8_2 = L8_2.newSprite
  L9_2 = L2_2
  L10_2 = L7_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = A0_2.x
  L8_2.x = L9_2
  L9_2 = A0_2.y
  L9_2 = L9_2 + L6_2
  L8_2.y = L9_2
  L10_2 = L8_2
  L9_2 = L8_2.scale
  L11_2 = A0_2.scale
  L12_2 = A0_2.scale
  L9_2(L10_2, L11_2, L12_2)
  L10_2 = L1_2
  L9_2 = L1_2.insert
  L11_2 = L8_2
  L9_2(L10_2, L11_2)
  L9_2 = L1_1
  if L9_2.culler and L9_2.culler.addAnimatedTile then
    L9_2.culler.addAnimatedTile(A0_2.x, L8_2)
  end
  L8_2.isVisible = false
  local L19_2 = L1_1 and L1_1.data and L1_1.data.currentLevelTheme
  if not L19_2 then
    L19_2 = A0_2.theme
  end
  if not L19_2 then
    L19_2 = "forest"
  end
  L9_2 = "lua.map.assets.physics."
  L10_2 = L1_1
  L10_2 = L10_2.data
  L10_2 = L10_2.currentLevelTheme
  L10_2 = L19_2
  L11_2 = "_special"
  L9_2 = L9_2 .. L10_2 .. L11_2
  L10_2 = require
  L11_2 = L9_2
  L10_2 = L10_2(L11_2)
  L10_2 = L10_2.physicsData
  L11_2 = A0_2.scale
  L10_2 = L10_2(L11_2)
  L11_2 = {}
  L13_2 = L10_2
  L12_2 = L10_2.get
  L14_2 = L5_2
  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L12_2(L13_2, L14_2)
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L11_2[3] = L14_2
  L11_2[4] = L15_2
  L11_2[5] = L16_2
  L11_2[6] = L17_2
  L11_2[7] = L18_2
  L12_2 = ipairs
  L13_2 = L11_2
  L12_2, L13_2, L14_2 = L12_2(L13_2)
  for L15_2, L16_2 in L12_2, L13_2, L14_2 do
    L17_2 = obstacleFilter
    L16_2.filter = L17_2
    L16_2.isSensor = true
  end
  L12_2 = L2_1
  L12_2 = L12_2.addBody
  L13_2 = L8_2
  L14_2 = unpack
  L15_2 = L11_2
  L14_2, L15_2, L16_2, L17_2, L18_2 = L14_2(L15_2)
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L8_2.bodyType = "static"
  L8_2.mapElement = true
  L8_2.slow = true

  function L12_2()
    local L0_3, L1_3, L2_3
    L0_3 = L1_1
    L0_3 = L0_3.isOnScreen
    L1_3 = A0_2
    L1_3 = L1_3.x
    L2_3 = A0_2
    L2_3 = L2_3.y
    L0_3 = L0_3(L1_3, L2_3)
    if L0_3 then
      L0_3 = true
      return L0_3
    end
    L0_3 = false
    return L0_3
  end

  function L13_2()
    local L0_3, L1_3
    L0_3 = L8_2
    if L0_3 then
      L0_3 = L8_2
      L1_3 = L0_3
      L0_3 = L0_3.pause
      L0_3(L1_3)
    end
  end

  function L14_2()
    local L0_3, L1_3, L2_3
    L0_3 = L8_2
    if L0_3 then
      L0_3 = L12_2
      L0_3 = L0_3()
      if L0_3 then
        L0_3 = L8_2
        L1_3 = L0_3
        L0_3 = L0_3.setSequence
        L2_3 = "collisionAnimation"
        L0_3(L1_3, L2_3)
        L0_3 = L8_2
        L1_3 = L0_3
        L0_3 = L0_3.play
        L0_3(L1_3)
      end
    end
  end

  function L15_2()
    local L0_3, L1_3
    L0_3 = L14_2
    L0_3()
  end

  function L16_2()
    local L0_3, L1_3
    L0_3 = L8_2
    if L0_3 then
      L0_3 = L8_2
      L0_3 = L0_3.removeSelf
      if L0_3 then
        L0_3 = L8_2
        L1_3 = L0_3
        L0_3 = L0_3.removeSelf
        L0_3(L1_3)
        L0_3 = nil
        L8_2 = L0_3
      end
    end
  end

  L17_2 = A0_2.behaviors
  L18_2 = {}
  L17_2.slowTile = L18_2
  L17_2 = A0_2.behaviors
  L17_2 = L17_2.slowTile
  L17_2.clean = L16_2
  L8_2.onCollision = L15_2
end

L0_1.addBehavior = L3_1
return L0_1

---------------------------------------
