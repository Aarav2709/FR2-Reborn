local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L1_1 = require
L2_1 = "lua.modules.timeFormat"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "composer"
L2_1 = L2_1(L3_1)

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = L1_1
  L1_2 = L1_2.timestampToClock
  L2_2 = A0_2.timestamp
  L1_2 = L1_2(L2_2)
  L2_2 = A0_2.textSize
  if not L2_2 then
    L2_2 = 14
  end
  L3_2 = A0_2.textWidth
  if not L3_2 then
    L3_2 = 220
  end
  L4_2 = nil
  L5_2 = A0_2.header
  if L5_2 then
    L5_2 = L2_1
    L5_2 = L5_2.newText
    L6_2 = {}
    L7_2 = A0_2.playerName
    L6_2.string = L7_2
    L6_2.size = L2_2
    L6_2.width = L3_2
    L6_2.height = 0
    L6_2.ax = 0
    L6_2.ay = 0
    L5_2 = L5_2(L6_2)
    L4_2 = L5_2
    L4_2.x = 0
    L4_2.y = 0
    L5_2 = 0
    L6_2 = 1
    L7_2 = string
    L7_2 = L7_2.len
    L8_2 = A0_2.playerName
    L7_2 = L7_2(L8_2)
    L8_2 = 1
    for L9_2 = L6_2, L7_2, L8_2 do
      L10_2 = string
      L10_2 = L10_2.byte
      L11_2 = A0_2.playerName
      L12_2 = L11_2
      L11_2 = L11_2.sub
      L13_2 = L9_2
      L14_2 = L9_2
      L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2, L13_2, L14_2)
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
      L5_2 = L5_2 + L10_2
    end
    L6_2 = L5_2 % 4
    if L6_2 == 0 then
      L8_2 = L4_2
      L7_2 = L4_2.setFillColor
      L9_2 = 0.8666666666666667
      L10_2 = 0.15294117647058825
      L11_2 = 0.15294117647058825
      L7_2(L8_2, L9_2, L10_2, L11_2)
    elseif L6_2 == 1 then
      L8_2 = L4_2
      L7_2 = L4_2.setFillColor
      L9_2 = 0.08235294117647059
      L10_2 = 0.38823529411764707
      L11_2 = 0.050980392156862744
      L7_2(L8_2, L9_2, L10_2, L11_2)
    elseif L6_2 == 2 then
      L8_2 = L4_2
      L7_2 = L4_2.setFillColor
      L9_2 = 0.14901960784313725
      L10_2 = 0.25098039215686274
      L11_2 = 0.7686274509803922
      L7_2(L8_2, L9_2, L10_2, L11_2)
    elseif L6_2 == 3 then
      L8_2 = L4_2
      L7_2 = L4_2.setFillColor
      L9_2 = 0.8313725490196079
      L10_2 = 0.3803921568627451
      L11_2 = 0.0784313725490196
      L7_2(L8_2, L9_2, L10_2, L11_2)
    end
  else
    L5_2 = A0_2.event
    if L5_2 then
      L5_2 = L2_1
      L5_2 = L5_2.newText
      L6_2 = {}
      L7_2 = L1_2 or L7_2
      if not L1_2 then
        L7_2 = "unknown time"
      end
      L8_2 = " - "
      L9_2 = A0_2.message
      L7_2 = L7_2 .. L8_2 .. L9_2
      L6_2.string = L7_2
      L6_2.size = L2_2
      L6_2.width = L3_2
      L6_2.height = 0
      L6_2.ax = 0
      L6_2.ay = 0
      L5_2 = L5_2(L6_2)
      L4_2 = L5_2
      L4_2.x = 0
      L4_2.y = 0
      L6_2 = L4_2
      L5_2 = L4_2.setFillColor
      L7_2 = 0.5
      L5_2(L6_2, L7_2)
    else
      L5_2 = A0_2.message
      if L5_2 then
        L5_2 = L2_1
        L5_2 = L5_2.newText
        L6_2 = {}
        L7_2 = A0_2.message
        L6_2.string = L7_2
        L6_2.size = L2_2
        L6_2.width = L3_2
        L6_2.height = 0
        L6_2.ax = 0
        L6_2.ay = 0
        L5_2 = L5_2(L6_2)
        L4_2 = L5_2
        L4_2.x = 0
        L4_2.y = 0
      end
    end
  end
  L5_2 = A0_2.color
  if L5_2 then
    L6_2 = L4_2
    L5_2 = L4_2.setFillColor
    L7_2 = A0_2.color
    L7_2 = L7_2[1]
    L8_2 = A0_2.color
    L8_2 = L8_2[3]
    L9_2 = A0_2.color
    L9_2 = L9_2[3]
    L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  return L4_2
end

L0_1.parseEvent = L3_1
return L0_1
