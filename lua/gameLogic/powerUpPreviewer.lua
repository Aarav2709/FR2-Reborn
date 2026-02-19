local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = {}
L1_1 = require
L2_1 = "lua.gameLogic.powerUps"
L1_1 = L1_1(L2_1)
L2_1 = nil
L3_1 = nil

function L4_1()
  local L0_2, L1_2
  L0_2 = L2_1
  if L0_2 then
    L0_2 = L2_1
    L0_2 = L0_2.effect
    if L0_2 then
      L0_2 = L2_1
      L0_2 = L0_2.effect
      L0_2()
    end
  end
end

function L5_1()
  local L0_2, L1_2
end

function L6_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L0_1
  L0_2 = L0_2.clean
  L0_2()
  L0_2 = nil
  L2_1 = L0_2
  L0_2 = Runtime
  L1_2 = L0_2
  L0_2 = L0_2.addEventListener
  L2_2 = "enterFrame"
  L3_2 = L4_1
  L0_2(L1_2, L2_2, L3_2)
end

L0_1.init = L6_1

function L6_1()
  local L0_2, L1_2
  L0_2 = L2_1
  if L0_2 then
    L0_2 = L2_1
    L0_2 = L0_2.transition
    if L0_2 then
      L0_2 = transition
      L0_2 = L0_2.cancel
      L1_2 = L2_1
      L1_2 = L1_2.transition
      L0_2(L1_2)
    end
    L0_2 = L2_1
    L0_2 = L0_2.image
    if L0_2 then
      L0_2 = L2_1
      L0_2 = L0_2.image
      L1_2 = L0_2
      L0_2 = L0_2.removeSelf
      L0_2(L1_2)
      L0_2 = L2_1
      L0_2.image = nil
    end
    L0_2 = nil
    L2_1 = L0_2
  end
end

function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L6_1
  L1_2()
  L1_2 = composer
  L1_2 = L1_2.powerUpImageSheetInfo
  L2_2 = L1_2
  L1_2 = L1_2.getFrameIndex
  L3_2 = ""
  L4_2 = A0_2
  L3_2 = L3_2 .. L4_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = display
  L2_2 = L2_2.newImage
  L3_2 = composer
  L3_2 = L3_2.powerUpImageSheet
  L4_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = 0.8
  L2_2.xScale = L3_2
  L2_2.yScale = L3_2
  L2_2.x = 290
  L2_2.y = 112
  L4_2 = nil
  L5_2 = nil
  
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = transition
    L0_3 = L0_3.to
    L1_3 = L2_2
    L2_3 = {}
    L2_3.time = 200
    L3_3 = L3_2
    L2_3.xScale = L3_3
    L3_3 = L3_2
    L2_3.yScale = L3_3
    L3_3 = L5_2
    L2_3.onComplete = L3_3
    L0_3(L1_3, L2_3)
  end
  
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = transition
    L0_3 = L0_3.to
    L1_3 = L2_2
    L2_3 = {}
    L2_3.time = 200
    L3_3 = L3_2
    L3_3 = L3_3 - 0.05
    L2_3.xScale = L3_3
    L3_3 = L3_2
    L3_3 = L3_3 + 0.05
    L2_3.yScale = L3_3
    L3_3 = L4_2
    L2_3.onComplete = L3_3
    L0_3(L1_3, L2_3)
  end
  
  L6_2 = L5_2
  L6_2()
  L6_2 = {}
  L2_1 = L6_2
  L6_2 = L2_1
  L6_2.image = L2_2
  L6_2 = L2_1
  L6_2.transition = L2_2
  return L2_2
end

L0_1.showShield = L7_1

function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L6_1
  L1_2()
  L1_2 = display
  L1_2 = L1_2.newImageRect
  L2_2 = "images/gui/market/items/sawblade/"
  L3_2 = A0_2
  L4_2 = ".png"
  L2_2 = L2_2 .. L3_2 .. L4_2
  L3_2 = 65
  L4_2 = 72
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L1_2.anchorX = 0.5
  L1_2.anchorY = 0.5
  L1_2.x = 290
  L1_2.y = 130
  L2_2 = {}
  L2_1 = L2_2
  L2_2 = L2_1
  L2_2.image = L1_2
  L2_2 = L2_1
  
  function L3_2()
    local L0_3, L1_3
    L0_3 = L2_1
    L0_3 = L0_3.image
    L1_3 = L2_1
    L1_3 = L1_3.image
    L1_3 = L1_3.rotation
    L1_3 = L1_3 + 6
    L0_3.rotation = L1_3
  end
  
  L2_2.effect = L3_2
  return L1_2
end

L0_1.showSawblade = L7_1

function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L6_1
  L1_2()
  L1_2 = display
  L1_2 = L1_2.newImageRect
  L2_2 = "images/gui/market/items/beartrap/"
  L3_2 = A0_2
  L4_2 = ".png"
  L2_2 = L2_2 .. L3_2 .. L4_2
  L3_2 = 70
  L4_2 = 81
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L1_2.anchorX = 0
  L1_2.anchorY = 0
  L1_2.x = 254
  L1_2.y = 82
  return L1_2
end

L0_1.showBearTrap = L7_1

function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L6_1
  L1_2()
  L1_2 = display
  L1_2 = L1_2.newImageRect
  L2_2 = "images/gui/market/items/punchbox/"
  L3_2 = A0_2
  L4_2 = ".png"
  L2_2 = L2_2 .. L3_2 .. L4_2
  L3_2 = 70
  L4_2 = 81
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L1_2.anchorX = 0
  L1_2.anchorY = 0
  L1_2.x = 244
  L1_2.y = 82
  return L1_2
end

L0_1.showPunchbox = L7_1

function L7_1()
  local L0_2, L1_2
  L0_2 = L6_1
  L0_2()
end

L0_1.softClean = L7_1

function L7_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L6_1
  L0_2()
  L0_2 = Runtime
  L1_2 = L0_2
  L0_2 = L0_2.removeEventListener
  L2_2 = "enterFrame"
  L3_2 = L4_1
  L0_2(L1_2, L2_2, L3_2)
end

L0_1.clean = L7_1
return L0_1
