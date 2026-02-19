local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)
L2_1 = {}
L3_1 = {}
L4_1 = 0.9372549019607843
L5_1 = 0.1450980392156863
L6_1 = 0.1450980392156863
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.red = L3_1
L3_1 = {}
L4_1 = 1
L5_1 = 0.4470588235294118
L6_1 = 0
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.orange = L3_1
L3_1 = {}
L4_1 = 0.9882352941176471
L5_1 = 0.8313725490196079
L6_1 = 0.20784313725490197
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.yellow = L3_1
L3_1 = {}
L4_1 = 0.3215686274509804
L5_1 = 0.7137254901960784
L6_1 = 0.24313725490196078
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.green = L3_1
L3_1 = {}
L4_1 = 0.20392156862745098
L5_1 = 0.7607843137254902
L6_1 = 0.6901960784313725
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.cyan = L3_1
L3_1 = {}
L4_1 = 0.3254901960784314
L5_1 = 0.5568627450980392
L6_1 = 0.9411764705882353
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.blue = L3_1
L3_1 = {}
L4_1 = 0.6
L5_1 = 0.2784313725490196
L6_1 = 0.9019607843137255
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.purple = L3_1
L3_1 = {}
L4_1 = 0.9490196078431372
L5_1 = 0.4980392156862745
L6_1 = 0.9333333333333333
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.pink = L3_1
L3_1 = {}
L4_1 = 0.9450980392156862
L5_1 = 0.9450980392156862
L6_1 = 0.9450980392156862
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.white = L3_1
L3_1 = {}
L4_1 = 0.20784313725490197
L5_1 = 0.20784313725490197
L6_1 = 0.20784313725490197
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1.black = L3_1
L0_1.colors = L2_1
L3_1 = {}
L3_1[1] = "red"
L3_1[2] = "orange"
L3_1[3] = "yellow"
L3_1[4] = "green"
L3_1[5] = "cyan"
L3_1[6] = "blue"
L3_1[7] = "purple"
L3_1[8] = "pink"
L3_1[9] = "white"
L3_1[10] = "black"
L0_1.idToColorMap = L3_1
L4_1 = L1_1.clanEmblemShapeSheetInfo
L5_1 = L4_1
L4_1 = L4_1.getSheet
L4_1 = L4_1(L5_1)
L4_1 = L4_1.frames
L4_1 = #L4_1
L4_1 = L4_1 / 2
L5_1 = L1_1.clanEmblemIconsSheetInfo
L6_1 = L5_1
L5_1 = L5_1.getSheet
L5_1 = L5_1(L6_1)
L5_1 = L5_1.frames
L5_1 = #L5_1
L5_1 = L5_1 / 2
L6_1 = {}
L6_1.start = 1
L7_1 = L4_1 * 2
L6_1.count = L7_1
L0_1.shapeImageSequence = L6_1
L6_1 = {}
L6_1.start = 1
L7_1 = L5_1 * 2
L6_1.count = L7_1
L0_1.iconImageSequence = L6_1
L6_1 = {}
L6_1.start = 1
L7_1 = L1_1.clanEmblemBordersSheetInfo
L8_1 = L7_1
L7_1 = L7_1.getSheet
L7_1 = L7_1(L8_1)
L7_1 = L7_1.frames
L7_1 = #L7_1
L6_1.count = L7_1
L0_1.borderImageSequence = L6_1

function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = display
  L2_2 = L2_2.newGroup
  L2_2 = L2_2()
  L3_2 = false
  L4_2 = 132
  L5_2 = 134
  if A1_2 then
    L4_2 = 58
    L5_2 = 58
  end
  L6_2 = display
  L6_2 = L6_2.newImageRect
  L7_2 = "images/gui/clan_v2/emblem/bg.png"
  L8_2 = L4_2
  L9_2 = L5_2
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = display
  L7_2 = L7_2.newSprite
  L8_2 = L1_1
  L8_2 = L8_2.clanEmblemBordersSheet
  L9_2 = L0_1
  L9_2 = L9_2.borderImageSequence
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = display
  L8_2 = L8_2.newSprite
  L9_2 = L1_1
  L9_2 = L9_2.clanEmblemBordersSheet
  L10_2 = L0_1
  L10_2 = L10_2.borderImageSequence
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = display
  L9_2 = L9_2.newSprite
  L10_2 = L1_1
  L10_2 = L10_2.clanEmblemShapeSheet
  L11_2 = L0_1
  L11_2 = L11_2.shapeImageSequence
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = display
  L10_2 = L10_2.newSprite
  L11_2 = L1_1
  L11_2 = L11_2.clanEmblemIconsSheet
  L12_2 = L0_1
  L12_2 = L12_2.iconImageSequence
  L10_2 = L10_2(L11_2, L12_2)
  
  function L11_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L0_3 = display
    L0_3 = L0_3.newGroup
    L0_3 = L0_3()
    L1_3 = A1_2
    if L1_3 then
      return L0_3
    end
    L1_3 = 116
    L2_3 = display
    L2_3 = L2_3.newImageRect
    L3_3 = "images/gui/clan_v2/clanLevel_bg.png"
    L4_3 = 119
    L5_3 = 48
    L2_3 = L2_3(L3_3, L4_3, L5_3)
    L3_3 = display
    L3_3 = L3_3.newRect
    L4_3 = 0
    L5_3 = 0
    L6_3 = 0
    L7_3 = 48
    L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)
    L5_3 = L3_3
    L4_3 = L3_3.setFillColor
    L6_3 = 0
    L7_3 = 0
    L8_3 = 0
    L9_3 = 0.5
    L4_3(L5_3, L6_3, L7_3, L8_3, L9_3)
    L3_3.anchorX = 0
    L4_3 = -L1_3
    L4_3 = L4_3 / 2
    L3_3.x = L4_3
    L4_3 = display
    L4_3 = L4_3.newImageRect
    L5_3 = "images/gui/clan_v2/clanLevel_fg.png"
    L6_3 = 119
    L7_3 = 48
    L4_3 = L4_3(L5_3, L6_3, L7_3)
    L5_3 = L1_1
    L5_3 = L5_3.newText
    L6_3 = {}
    L6_3.string = "1"
    L6_3.size = 32
    L7_3 = {}
    L8_3 = 1
    L9_3 = 1
    L10_3 = 1
    L7_3[1] = L8_3
    L7_3[2] = L9_3
    L7_3[3] = L10_3
    L6_3.color = L7_3
    L5_3 = L5_3(L6_3)
    L7_3 = L0_3
    L6_3 = L0_3.insert
    L8_3 = L2_3
    L6_3(L7_3, L8_3)
    L7_3 = L0_3
    L6_3 = L0_3.insert
    L8_3 = L3_3
    L6_3(L7_3, L8_3)
    L7_3 = L0_3
    L6_3 = L0_3.insert
    L8_3 = L5_3
    L6_3(L7_3, L8_3)
    L7_3 = L0_3
    L6_3 = L0_3.insert
    L8_3 = L4_3
    L6_3(L7_3, L8_3)
    
    function L6_3(A0_4, A1_4)
      local L2_4, L3_4
      if not A1_4 then
        A1_4 = 0
      end
      if 1 < A1_4 then
        A1_4 = 1
      end
      if A1_4 < 0 then
        A1_4 = 0
      end
      L2_4 = L5_3
      L2_4.text = A0_4
      L2_4 = L3_3
      L3_4 = L1_3
      L3_4 = L3_4 * A1_4
      L2_4.width = L3_4
    end
    
    L0_3.update = L6_3
    return L0_3
  end
  
  L12_2 = L11_2
  L12_2 = L12_2()
  L12_2.y = 60
  L12_2.isVisible = false
  if not A1_2 then
    L14_2 = L7_2
    L13_2 = L7_2.scale
    L15_2 = 0.5
    L16_2 = 0.5
    L13_2(L14_2, L15_2, L16_2)
    L14_2 = L8_2
    L13_2 = L8_2.scale
    L15_2 = 0.5
    L16_2 = 0.5
    L13_2(L14_2, L15_2, L16_2)
    L14_2 = L9_2
    L13_2 = L9_2.scale
    L15_2 = 0.5
    L16_2 = 0.5
    L13_2(L14_2, L15_2, L16_2)
    L14_2 = L10_2
    L13_2 = L10_2.scale
    L15_2 = 0.5
    L16_2 = 0.5
    L13_2(L14_2, L15_2, L16_2)
    L14_2 = L12_2
    L13_2 = L12_2.scale
    L15_2 = 0.6
    L16_2 = 0.6
    L13_2(L14_2, L15_2, L16_2)
  end
  L13_2 = L7_2.contentWidth
  L2_2.contentWidth = L13_2
  L13_2 = L7_2.contentHeight
  L2_2.contentHeight = L13_2
  L14_2 = L2_2
  L13_2 = L2_2.insert
  L15_2 = L6_2
  L13_2(L14_2, L15_2)
  L14_2 = L2_2
  L13_2 = L2_2.insert
  L15_2 = L9_2
  L13_2(L14_2, L15_2)
  L14_2 = L2_2
  L13_2 = L2_2.insert
  L15_2 = L10_2
  L13_2(L14_2, L15_2)
  L14_2 = L2_2
  L13_2 = L2_2.insert
  L15_2 = L8_2
  L13_2(L14_2, L15_2)
  L14_2 = L2_2
  L13_2 = L2_2.insert
  L15_2 = L7_2
  L13_2(L14_2, L15_2)
  L14_2 = L2_2
  L13_2 = L2_2.insert
  L15_2 = L12_2
  L13_2(L14_2, L15_2)
  
  function L13_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
    L1_3 = 10
    L2_3 = 9
    L3_3 = 8
    L4_3 = 1
    L5_3 = 1
    L6_3 = 1
    L7_3 = 0
    if A0_3 then
      L8_3 = A0_3.a
      L1_3 = L8_3 or L1_3
      if not L8_3 then
        L1_3 = 10
      end
      L8_3 = A0_3.b
      L2_3 = L8_3 or L2_3
      if not L8_3 then
        L2_3 = 9
      end
      L8_3 = A0_3.c
      L3_3 = L8_3 or L3_3
      if not L8_3 then
        L3_3 = 8
      end
      L8_3 = A0_3.d
      L4_3 = L8_3 or L4_3
      if not L8_3 then
        L4_3 = 1
      end
      L8_3 = A0_3.e
      L5_3 = L8_3 or L5_3
      if not L8_3 then
        L5_3 = 1
      end
      L8_3 = A0_3.f
      L8_3 = L8_3 - 1
      L7_3 = L8_3 or L7_3
      if not L8_3 then
        L7_3 = 0
      end
      L8_3 = tonumber
      L9_3 = A0_3.h
      L8_3 = L8_3(L9_3)
      if L8_3 == 1 then
        L6_3 = 3
      elseif 7 < L7_3 then
        L6_3 = 2
      end
    end
    L8_3 = ""
    L9_3 = A1_2
    if L9_3 then
      L8_3 = "_l"
    end
    L9_3 = L1_1
    L9_3 = L9_3.clanEmblemShapeSheetInfo
    L10_3 = L9_3
    L9_3 = L9_3.getFrameIndex
    L11_3 = "shape"
    L12_3 = L4_3
    L13_3 = L8_3
    L11_3 = L11_3 .. L12_3 .. L13_3
    L9_3 = L9_3(L10_3, L11_3)
    L10_3 = L1_1
    L10_3 = L10_3.clanEmblemIconsSheetInfo
    L11_3 = L10_3
    L10_3 = L10_3.getFrameIndex
    L12_3 = "icon"
    L13_3 = L5_3
    L14_3 = L8_3
    L12_3 = L12_3 .. L13_3 .. L14_3
    L10_3 = L10_3(L11_3, L12_3)
    L11_3 = L1_1
    L11_3 = L11_3.clanEmblemBordersSheetInfo
    L12_3 = L11_3
    L11_3 = L11_3.getFrameIndex
    L13_3 = "ring"
    L14_3 = L6_3
    L15_3 = L8_3
    L13_3 = L13_3 .. L14_3 .. L15_3
    L11_3 = L11_3(L12_3, L13_3)
    L12_3 = L1_1
    L12_3 = L12_3.clanEmblemBordersSheetInfo
    L13_3 = L12_3
    L12_3 = L12_3.getFrameIndex
    L14_3 = "wing"
    L15_3 = L7_3
    L16_3 = L8_3
    L14_3 = L14_3 .. L15_3 .. L16_3
    L12_3 = L12_3(L13_3, L14_3)
    if L9_3 then
      L13_3 = L10_2
      if L13_3 then
        L13_3 = L7_2
        if L13_3 then
          L13_3 = L9_2
          L14_3 = L13_3
          L13_3 = L13_3.setFrame
          L15_3 = L9_3
          L13_3(L14_3, L15_3)
          L13_3 = L9_2
          L14_3 = L13_3
          L13_3 = L13_3.setFillColor
          L15_3 = unpack
          L16_3 = L2_1
          L17_3 = L3_1
          L17_3 = L17_3[L2_3]
          L16_3 = L16_3[L17_3]
          L15_3, L16_3, L17_3 = L15_3(L16_3)
          L13_3(L14_3, L15_3, L16_3, L17_3)
          L13_3 = L10_2
          L14_3 = L13_3
          L13_3 = L13_3.setFrame
          L15_3 = L10_3
          L13_3(L14_3, L15_3)
          L13_3 = L10_2
          L14_3 = L13_3
          L13_3 = L13_3.setFillColor
          L15_3 = unpack
          L16_3 = L2_1
          L17_3 = L3_1
          L17_3 = L17_3[L3_3]
          L16_3 = L16_3[L17_3]
          L15_3, L16_3, L17_3 = L15_3(L16_3)
          L13_3(L14_3, L15_3, L16_3, L17_3)
          L13_3 = L7_2
          L14_3 = L13_3
          L13_3 = L13_3.setFrame
          L15_3 = L11_3
          L13_3(L14_3, L15_3)
          if 0 < L7_3 then
            L13_3 = L8_2
            L14_3 = L13_3
            L13_3 = L13_3.setFrame
            L15_3 = L12_3
            L13_3(L14_3, L15_3)
            L13_3 = L8_2
            L13_3.isVisible = true
          else
            L13_3 = L8_2
            if L13_3 then
              L13_3 = L8_2
              L13_3.isVisible = false
            end
          end
          L13_3 = L6_2
          L14_3 = L13_3
          L13_3 = L13_3.setFillColor
          L15_3 = unpack
          L16_3 = L2_1
          L17_3 = L3_1
          L17_3 = L17_3[L1_3]
          L16_3 = L16_3[L17_3]
          L15_3, L16_3, L17_3 = L15_3(L16_3)
          L13_3(L14_3, L15_3, L16_3, L17_3)
        end
      end
    end
  end
  
  L2_2.updateEmblem = L13_2
  
  function L14_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = 0.75
    L2_3 = type
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    if L2_3 == "number" then
      L1_3 = A0_3
    elseif A0_3 == "small" then
      L1_3 = 0.25
    elseif A0_3 == "medium" then
      L1_3 = 0.5
    elseif A0_3 == "large" then
      L1_3 = 0.75
    end
    L2_3 = L2_2
    L3_3 = L2_2
    L4_3 = L1_3
    L3_3.yScale = L1_3
    L2_3.xScale = L4_3
    L2_3 = L2_2
    L3_3 = L2_2
    L3_3 = L3_3.contentWidth
    L3_3 = L3_3 * L1_3
    L2_3.contentWidth = L3_3
    L2_3 = L2_2
    L3_3 = L2_2
    L3_3 = L3_3.contentHeight
    L3_3 = L3_3 * L1_3
    L2_3.contentHeight = L3_3
  end
  
  L2_2.setEmblemSize = L14_2
  
  function L15_2()
    local L0_3, L1_3
    L0_3 = L12_2
    L0_3.isVisible = true
  end
  
  L2_2.showLevel = L15_2
  
  function L16_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = L12_2
    L2_3 = L2_3.update
    L3_3 = A0_3
    L4_3 = A1_3
    L2_3(L3_3, L4_3)
  end
  
  L2_2.updateLevelData = L16_2
  
  function L17_2()
    local L0_3, L1_3
    L0_3 = L3_2
    if L0_3 then
      return
    end
    L0_3 = true
    L3_2 = L0_3
    L0_3 = L2_2
    if L0_3 then
      L0_3 = L2_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L2_2 = L0_3
    end
  end
  
  L2_2.clean = L17_2
  L18_2 = L13_2
  L19_2 = A0_2
  L18_2(L19_2)
  L18_2 = L14_2
  L19_2 = "medium"
  L18_2(L19_2)
  return L2_2
end

L0_1.create = L6_1

function L7_1()
  local L0_2, L1_2
  L0_2 = L3_1
  L0_2 = #L0_2
  return L0_2
end

L0_1.getNumberOfAvailableColors = L7_1

function L8_1()
  local L0_2, L1_2
  L0_2 = L4_1
  return L0_2
end

L0_1.getNumberOfAvailableShapes = L8_1

function L9_1()
  local L0_2, L1_2
  L0_2 = L5_1
  return L0_2
end

L0_1.getNumberOfAvailableIcons = L9_1

function L10_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = unpack
  L2_2 = L2_1
  L3_2 = L3_1
  L3_2 = L3_2[A0_2]
  L2_2 = L2_2[L3_2]
  return L1_2(L2_2)
end

L0_1.getColorValues = L10_1
return L0_1
