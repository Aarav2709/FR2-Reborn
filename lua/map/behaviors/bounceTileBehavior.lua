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
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L1_2 = A0_2.displayGroup
  L2_2 = A0_2.animatedBlockSheet
  L3_2 = A0_2.tileId
  L4_2 = A0_2.image
  L4_2 = L4_2.xScale
  L4_2 = L4_2 < 0
  L5_2 = ""
  L6_2 = 1
  L7_2 = 0
  L8_2 = 0
  if L3_2 == 68 then
    L5_2 = "small_bounce1"
    L7_2 = 0
    L8_2 = -24
  elseif L3_2 == 69 then
    if not L4_2 then
      return
    end
    L5_2 = "big_bounce1"
    L7_2 = -42
    L8_2 = -14
  elseif L3_2 == 70 then
    if L4_2 then
      return
    end
    L5_2 = "big_bounce1"
    L7_2 = -42
    L8_2 = -14
  end
  L9_2 = 4
  L10_2 = A0_2.animatedBlockSheetFile
  L11_2 = L10_2
  L10_2 = L10_2.getFrameIndex
  L12_2 = L5_2
  L10_2 = L10_2(L11_2, L12_2)
  if not L10_2 then
    return
  end
  L11_2 = 350
  local L25_2 = L1_1 and L1_1.data and L1_1.data.currentLevelTheme
  if not L25_2 then
    L25_2 = A0_2.theme
  end
  if not L25_2 then
    L25_2 = "forest"
  end
  L12_2 = L1_1
  L12_2 = L12_2.data
  L12_2 = L12_2.currentLevelTheme
  L12_2 = L25_2
  if L12_2 == "space" then
    L9_2 = 8
    L8_2 = -45
    L11_2 = 200
  end
  L12_2 = {}
  L13_2 = 1
  L14_2 = L9_2
  L15_2 = 1
  for L16_2 = L13_2, L14_2, L15_2 do
    L17_2 = L16_2 - 1
    L17_2 = L10_2 + L17_2
    L12_2[L16_2] = L17_2
  end
  L13_2 = L9_2 + 1
  L12_2[L13_2] = L10_2
  L13_2 = {}
  L13_2.name = "collisionAnimation"
  L13_2.frames = L12_2
  L13_2.time = L11_2
  L13_2.loopCount = 1
  L13_2.loopDirection = "forward"
  L14_2 = L1_1
  L14_2 = L14_2.data
  L14_2 = L14_2.currentLevelTheme
  L14_2 = L25_2
  if L14_2 == "tropical" then
    L8_2 = L8_2 + 6
    L14_2 = A0_2.animatedBlockSheetFile
    L15_2 = L14_2
    L14_2 = L14_2.getFrameIndex
    L16_2 = L5_2
    L14_2 = L14_2(L15_2, L16_2)
    L10_2 = L14_2
    if not L10_2 then
      return
    end
    L14_2 = {}
    L14_2.name = "collisionAnimation"
    L15_2 = {}
    L16_2 = L10_2
    L17_2 = L10_2 + 1
    L18_2 = L10_2 + 2
    L19_2 = L10_2 + 3
    L20_2 = L10_2 + 4
    L21_2 = L10_2 + 5
    L22_2 = L10_2
    L15_2[1] = L16_2
    L15_2[2] = L17_2
    L15_2[3] = L18_2
    L15_2[4] = L19_2
    L15_2[5] = L20_2
    L15_2[6] = L21_2
    L15_2[7] = L22_2
    L14_2.frames = L15_2
    L14_2.time = L11_2
    L14_2.loopCount = 1
    L14_2.loopDirection = "forward"
    L13_2 = L14_2
  end
  L14_2 = display
  L14_2 = L14_2.newSprite
  L15_2 = L2_2
  L16_2 = L13_2
  L14_2 = L14_2(L15_2, L16_2)
  L15_2 = A0_2.x
  L15_2 = L15_2 + L7_2
  L14_2.x = L15_2
  L15_2 = A0_2.y
  L15_2 = L15_2 + L8_2
  L14_2.y = L15_2
  L15_2 = L1_1
  L15_2 = L15_2.data
  L15_2 = L15_2.currentLevelTheme
  L15_2 = L25_2
  if L15_2 == "tropical" then
    L16_2 = L14_2
    L15_2 = L14_2.scale
    L17_2 = A0_2.scale
    L17_2 = L17_2 * 0.75
    L18_2 = A0_2.scale
    L18_2 = L18_2 * 0.75
    L15_2(L16_2, L17_2, L18_2)
  else
    L16_2 = L14_2
    L15_2 = L14_2.scale
    L17_2 = A0_2.scale
    L18_2 = A0_2.scale
    L15_2(L16_2, L17_2, L18_2)
  end
  L16_2 = L1_2
  L15_2 = L1_2.insert
  L17_2 = L14_2
  L15_2(L16_2, L17_2)
  L15_2 = "lua.map.assets.physics."
  L16_2 = L1_1
  L16_2 = L16_2.data
  L16_2 = L16_2.currentLevelTheme
  L16_2 = L25_2
  L17_2 = "_special"
  L15_2 = L15_2 .. L16_2 .. L17_2
  L16_2 = require
  L17_2 = L15_2
  L16_2 = L16_2(L17_2)
  L16_2 = L16_2.physicsData
  L17_2 = A0_2.scale
  L16_2 = L16_2(L17_2)
  L17_2 = {}
  L19_2 = L16_2
  L18_2 = L16_2.get
  L20_2 = L5_2
  L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L18_2(L19_2, L20_2)
  L17_2[1] = L18_2
  L17_2[2] = L19_2
  L17_2[3] = L20_2
  L17_2[4] = L21_2
  L17_2[5] = L22_2
  L17_2[6] = L23_2
  L17_2[7] = L24_2
  L18_2 = ipairs
  L19_2 = L17_2
  L18_2, L19_2, L20_2 = L18_2(L19_2)
  for L21_2, L22_2 in L18_2, L19_2, L20_2 do
    L23_2 = obstacleFilter
    L22_2.filter = L23_2
  end
  L18_2 = L2_1
  L18_2 = L18_2.addBody
  L19_2 = L14_2
  L20_2 = unpack
  L21_2 = L17_2
  L20_2, L21_2, L22_2, L23_2, L24_2 = L20_2(L21_2)
  L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
  L14_2.bodyType = "static"
  L14_2.mapElement = true
  L14_2.bounce = true
  L18_2 = L1_1
  L18_2 = L18_2.culler
  L18_2 = L18_2.addAnimatedTile
  L19_2 = A0_2.x
  L20_2 = L14_2
  L18_2(L19_2, L20_2)
  L14_2.isVisible = false

  function L18_2()
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

  function L19_2()
    local L0_3, L1_3
    L0_3 = L14_2
    if L0_3 then
      L0_3 = L14_2
      L1_3 = L0_3
      L0_3 = L0_3.pause
      L0_3(L1_3)
    end
  end

  function L20_2()
    local L0_3, L1_3, L2_3
    L0_3 = L14_2
    if L0_3 then
      L0_3 = L18_2
      L0_3 = L0_3()
      if L0_3 then
        L0_3 = L14_2
        L1_3 = L0_3
        L0_3 = L0_3.setSequence
        L2_3 = "collisionAnimation"
        L0_3(L1_3, L2_3)
        L0_3 = L14_2
        L1_3 = L0_3
        L0_3 = L0_3.play
        L0_3(L1_3)
      end
    end
  end

  function L21_2()
    local L0_3, L1_3
    L0_3 = L20_2
    L0_3()
  end

  function L22_2()
    local L0_3, L1_3
    L0_3 = L14_2
    if L0_3 then
      L0_3 = L14_2
      L0_3 = L0_3.removeSelf
      if L0_3 then
        L0_3 = L14_2
        L1_3 = L0_3
        L0_3 = L0_3.removeSelf
        L0_3(L1_3)
        L0_3 = nil
        L14_2 = L0_3
      end
    end
  end

  L23_2 = A0_2.behaviors
  L24_2 = {}
  L23_2.bounceTile = L24_2
  L23_2 = A0_2.behaviors
  L23_2 = L23_2.bounceTile
  L23_2.clean = L22_2
  L14_2.onCollision = L21_2
end

L0_1.addBehavior = L3_1
return L0_1

---------------------------------------
