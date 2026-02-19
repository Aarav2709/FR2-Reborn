local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = display
  L1_2 = L1_2.newGroup
  L1_2 = L1_2()
  L2_2 = A0_2.textSpace
  if not L2_2 then
    A0_2.textSpace = 75
  end
  L2_2 = A0_2.defaultSelected
  if not L2_2 then
    L2_2 = 1
  end
  L3_2 = true
  L4_2 = nil
  L5_2 = A0_2.isText
  if L5_2 then
    L5_2 = L1_1
    L5_2 = L5_2.newText
    L6_2 = {}
    L7_2 = L1_1
    L7_2 = L7_2.localized
    L7_2 = L7_2.get
    L8_2 = "-"
    L7_2 = L7_2(L8_2)
    L6_2.string = L7_2
    L6_2.x = 0
    L6_2.y = 0
    L7_2 = {}
    L8_2 = 1
    L9_2 = 1
    L10_2 = 1
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L7_2[3] = L10_2
    L6_2.color = L7_2
    L5_2 = L5_2(L6_2)
    L4_2 = L5_2
  else
    L5_2 = A0_2.isImage
    if L5_2 then
      L5_2 = display
      L5_2 = L5_2.newImageRect
      L6_2 = A0_2.imagePath
      L7_2 = A0_2.optionsList
      L7_2 = L7_2[1]
      L8_2 = ".png"
      L6_2 = L6_2 .. L7_2 .. L8_2
      L7_2 = A0_2.width
      L8_2 = A0_2.height
      L5_2 = L5_2(L6_2, L7_2, L8_2)
      L4_2 = L5_2
    end
  end
  
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = A0_2
    L0_3 = L0_3.isText
    if L0_3 then
      L0_3 = L4_2
      L1_3 = A0_2
      L1_3 = L1_3.optionsList
      L2_3 = L2_2
      L1_3 = L1_3[L2_3]
      L0_3.text = L1_3
    else
      L0_3 = A0_2
      L0_3 = L0_3.isImage
      if L0_3 then
        L0_3 = L4_2
        if L0_3 then
          L0_3 = L4_2
          L1_3 = L0_3
          L0_3 = L0_3.removeSelf
          L0_3(L1_3)
          L0_3 = nil
          L4_2 = L0_3
        end
        L0_3 = display
        L0_3 = L0_3.newImageRect
        L1_3 = A0_2
        L1_3 = L1_3.imagePath
        L2_3 = A0_2
        L2_3 = L2_3.optionsList
        L3_3 = L2_2
        L2_3 = L2_3[L3_3]
        L3_3 = ".png"
        L1_3 = L1_3 .. L2_3 .. L3_3
        L2_3 = A0_2
        L2_3 = L2_3.width
        L3_3 = A0_2
        L3_3 = L3_3.height
        L0_3 = L0_3(L1_3, L2_3, L3_3)
        L4_2 = L0_3
        L0_3 = L1_2
        L1_3 = L0_3
        L0_3 = L0_3.insert
        L2_3 = L4_2
        L0_3(L1_3, L2_3)
      end
    end
  end
  
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L2_2
    L1_3 = L1_3 + A0_3
    L2_3 = A0_2
    L2_3 = L2_3.optionsList
    L2_3 = #L2_3
    if L1_3 > L2_3 then
      L1_3 = 1
    elseif L1_3 < 1 then
      L2_3 = A0_2
      L2_3 = L2_3.optionsList
      L1_3 = #L2_3
    end
    L2_2 = L1_3
    L2_3 = L5_2
    L2_3()
    L2_3 = A0_2
    L2_3 = L2_3.callback
    if L2_3 then
      L2_3 = A0_2
      L2_3 = L2_3.callback
      L3_3 = L2_2
      L2_3(L3_3)
    end
  end
  
  function L7_2()
    local L0_3, L1_3
    L0_3 = L3_2
    if not L0_3 then
      return
    end
    L0_3 = L6_2
    L1_3 = -1
    L0_3(L1_3)
  end
  
  function L8_2()
    local L0_3, L1_3
    L0_3 = L3_2
    if not L0_3 then
      return
    end
    L0_3 = L6_2
    L1_3 = 1
    L0_3(L1_3)
  end
  
  L9_2 = L1_1
  L9_2 = L9_2.newButton
  L10_2 = {}
  L10_2.onRelease = L7_2
  L10_2.image = "images/gui/practice/left.png"
  L10_2.width = 40
  L10_2.height = 40
  L11_2 = L4_2.x
  L12_2 = A0_2.textSpace
  L11_2 = L11_2 - L12_2
  L10_2.x = L11_2
  L10_2.y = 0
  L9_2 = L9_2(L10_2)
  L10_2 = L1_1
  L10_2 = L10_2.newButton
  L11_2 = {}
  L11_2.onRelease = L8_2
  L11_2.image = "images/gui/practice/right.png"
  L11_2.width = 40
  L11_2.height = 40
  L12_2 = L4_2.x
  L13_2 = A0_2.textSpace
  L12_2 = L12_2 + L13_2
  L11_2.x = L12_2
  L11_2.y = 0
  L10_2 = L10_2(L11_2)
  L12_2 = L1_2
  L11_2 = L1_2.insert
  L13_2 = L4_2
  L11_2(L12_2, L13_2)
  L12_2 = L1_2
  L11_2 = L1_2.insert
  L13_2 = L9_2
  L11_2(L12_2, L13_2)
  L12_2 = L1_2
  L11_2 = L1_2.insert
  L13_2 = L10_2
  L11_2(L12_2, L13_2)
  
  function L11_2()
    local L0_3, L1_3
    L0_3 = L2_2
    return L0_3
  end
  
  L1_2.getSelectedOption = L11_2
  
  function L12_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L3_2 = A0_3
    L1_3 = L10_2
    L1_3 = L1_3.setInteractable
    L2_3 = A0_3
    L1_3(L2_3)
    L1_3 = L9_2
    L1_3 = L1_3.setInteractable
    L2_3 = A0_3
    L1_3(L2_3)
    if A0_3 then
      L1_3 = L4_2
      L2_3 = L1_3
      L1_3 = L1_3.setFillColor
      L3_3 = 1
      L4_3 = 1
      L5_3 = 1
      L1_3(L2_3, L3_3, L4_3, L5_3)
    else
      L1_3 = L4_2
      L2_3 = L1_3
      L1_3 = L1_3.setFillColor
      L3_3 = 0.5
      L4_3 = 0.5
      L5_3 = 0.5
      L1_3(L2_3, L3_3, L4_3, L5_3)
    end
  end
  
  L1_2.setInteractable = L12_2
  L13_2 = L6_2
  L14_2 = 0
  L13_2(L14_2)
  return L1_2
end

L0_1.create = L2_1
return L0_1
