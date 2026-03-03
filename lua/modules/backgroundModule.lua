local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)
L2_1 = "images/gui/common/bgMain.png"
L3_1 = "images/gui/common/bgMain_blur.png"

function L4_1(A0_2)
  local img = display.newImageRect(A0_2, display.actualContentWidth, display.actualContentHeight)
  img.x = display.contentCenterX
  img.y = display.contentCenterY
  return img
end

function L5_1()
  local L0_2, L1_2
  L0_2 = L4_1
  L1_2 = L2_1
  return L0_2(L1_2)
end

L0_1.getDefaultBackground = L5_1

function L5_1()
  local L0_2, L1_2, L2_2
  L0_2 = L1_1
  L0_2 = L0_2.seasonal
  L0_2 = L0_2.getActiveSeason
  L0_2 = L0_2()
  L0_2 = L0_2.backgroundImagePath
  if not L0_2 then
    L0_2 = L2_1
  end
  L1_2 = L4_1
  L2_2 = L0_2
  return L1_2(L2_2)
end

L0_1.getBackground = L5_1

function L5_1()
  local L0_2, L1_2
  L0_2 = L4_1
  L1_2 = L3_1
  return L0_2(L1_2)
end

L0_1.getDefaultBlurredBackground = L5_1

function L5_1()
  local L0_2, L1_2, L2_2
  L0_2 = L1_1
  L0_2 = L0_2.seasonal
  L0_2 = L0_2.getActiveSeason
  L0_2 = L0_2()
  L0_2 = L0_2.blurBackgroundImagePath
  if not L0_2 then
    L0_2 = L3_1
  end
  L1_2 = L4_1
  L2_2 = L0_2
  return L1_2(L2_2)
end

L0_1.getBlurredBackground = L5_1
L1_1.backgrounds = L0_1
