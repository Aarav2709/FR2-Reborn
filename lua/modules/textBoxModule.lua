local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L4_2 = display
  L4_2 = L4_2.newGroup
  L4_2 = L4_2()
  L5_2 = false
  L6_2 = {}
  L7_2 = 0
  L8_2 = 0
  L9_2 = 0
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L7_2 = 11
  L8_2 = 100
  L9_2 = nil
  L10_2 = nil
  L11_2 = nil
  L12_2 = nil
  
  function L13_2(A0_3)
    local L1_3
    L12_2 = A0_3
  end
  
  L4_2.setDoneCallback = L13_2
  
  function L14_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = L4_2
    L1_3.isVisible = true
    L1_3 = L10_2
    L1_3.isVisible = true
    L1_3 = native
    L1_3 = L1_3.setKeyboardFocus
    L2_3 = L10_2
    L1_3(L2_3)
    if A0_3 then
      L1_3 = L10_2
      L1_3.text = A0_3
      L1_3 = L9_2
      L2_3 = string
      L2_3 = L2_3.len
      L3_3 = A0_3
      L2_3 = L2_3(L3_3)
      L3_3 = "/"
      L4_3 = L8_2
      L2_3 = L2_3 .. L3_3 .. L4_3
      L1_3.text = L2_3
    end
  end
  
  L4_2.show = L14_2
  
  function L15_2()
    local L0_3, L1_3
    L0_3 = L4_2
    L0_3.isVisible = false
    L0_3 = L10_2
    L0_3.isVisible = false
  end
  
  L4_2.hide = L15_2
  
  function L16_2()
    local L0_3, L1_3, L2_3
    L0_3 = L9_2
    L1_3 = "0/"
    L2_3 = L8_2
    L1_3 = L1_3 .. L2_3
    L0_3.text = L1_3
    L0_3 = L10_2
    L0_3.text = ""
    L0_3 = native
    L0_3 = L0_3.setKeyboardFocus
    L1_3 = nil
    L0_3(L1_3)
    L0_3 = isAndroid
    if L0_3 then
      L0_3 = native
      L0_3 = L0_3.setProperty
      L1_3 = "androidSystemUiVisibility"
      L2_3 = "immersiveSticky"
      L0_3(L1_3, L2_3)
    end
    L0_3 = L15_2
    L0_3()
  end
  
  function L17_2()
    local L0_3, L1_3
    L0_3 = L12_2
    if L0_3 then
      L0_3 = L12_2
      L1_3 = L10_2
      L1_3 = L1_3.text
      L0_3(L1_3)
    end
    L0_3 = L16_2
    L0_3()
  end
  
  L18_2 = L1_1
  L18_2 = L18_2.newButton
  L19_2 = {}
  L19_2.image = "images/gui/friends/roundAccept.png"
  L19_2.width = 20
  L19_2.height = 20
  L19_2.onRelease = L17_2
  L20_2 = A2_2 * 0.5
  L20_2 = A0_2 + L20_2
  L20_2 = L20_2 + 12
  L19_2.x = L20_2
  L20_2 = A3_2 * 0.5
  L20_2 = A1_2 + L20_2
  L20_2 = L20_2 - 8
  L19_2.y = L20_2
  L18_2 = L18_2(L19_2)
  L11_2 = L18_2
  L11_2.isVisible = true
  L19_2 = L4_2
  L18_2 = L4_2.insert
  L20_2 = L11_2
  L18_2(L19_2, L20_2)
  
  function L18_2(A0_3)
    local L1_3
    
    function L1_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4
      L1_4 = A0_4.text
      if L1_4 then
        L1_4 = string
        L1_4 = L1_4.len
        L2_4 = A0_4.text
        L1_4 = L1_4(L2_4)
        L2_4 = A0_3
        if L1_4 >= L2_4 then
          L1_4 = A0_4.target
          L2_4 = A0_4.text
          L3_4 = L2_4
          L2_4 = L2_4.sub
          L4_4 = 1
          L5_4 = A0_3
          L2_4 = L2_4(L3_4, L4_4, L5_4)
          L1_4.text = L2_4
          L1_4 = A0_4.target
          L1_4 = L1_4.text
          A0_4.text = L1_4
        end
      end
      L1_4 = A0_4.phase
      if "began" == L1_4 then
      else
        L1_4 = A0_4.phase
        if "ended" == L1_4 then
        else
          L1_4 = A0_4.phase
          if "editing" == L1_4 then
            L1_4 = L9_2
            L2_4 = string
            L2_4 = L2_4.len
            L3_4 = A0_4.text
            L2_4 = L2_4(L3_4)
            L3_4 = "/"
            L4_4 = A0_3
            L2_4 = L2_4 .. L3_4 .. L4_4
            L1_4.text = L2_4
          else
            L1_4 = A0_4.phase
            if "submitted" == L1_4 then
              L1_4 = native
              L1_4 = L1_4.setKeyboardFocus
              L2_4 = nil
              L1_4(L2_4)
              L1_4 = isAndroid
              if L1_4 then
                L1_4 = native
                L1_4 = L1_4.setProperty
                L2_4 = "androidSystemUiVisibility"
                L3_4 = "immersiveSticky"
                L1_4(L2_4, L3_4)
              end
            end
          end
        end
      end
    end
    
    return L1_3
  end
  
  L19_2 = native
  L19_2 = L19_2.newTextBox
  L20_2 = 0
  L21_2 = -500
  L22_2 = A2_2
  L23_2 = A3_2
  L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2)
  L10_2 = L19_2
  L10_2.isEditable = true
  L10_2.isVisible = false
  L10_2.x = A0_2
  L10_2.y = A1_2
  L10_2.anchorY = 0
  L20_2 = L4_2
  L19_2 = L4_2.insert
  L21_2 = L10_2
  L19_2(L20_2, L21_2)
  L19_2 = L18_2
  L20_2 = L8_2
  L19_2 = L19_2(L20_2)
  L10_2.userInput = L19_2
  L20_2 = L10_2
  L19_2 = L10_2.addEventListener
  L21_2 = "userInput"
  L22_2 = L10_2.userInput
  L19_2(L20_2, L21_2, L22_2)
  L19_2 = L1_1
  L19_2 = L19_2.newText
  L20_2 = {}
  L21_2 = "0/"
  L22_2 = L8_2
  L21_2 = L21_2 .. L22_2
  L20_2.string = L21_2
  L20_2.size = L7_2
  L21_2 = A2_2 * 0.5
  L20_2.x = L21_2
  L21_2 = A3_2 * 0.5
  L21_2 = L21_2 + 30
  L20_2.y = L21_2
  L20_2.color = L6_2
  L20_2.width = 245
  L20_2.height = 34
  L19_2 = L19_2(L20_2)
  L9_2 = L19_2
  L20_2 = L4_2
  L19_2 = L4_2.insert
  L21_2 = L9_2
  L19_2(L20_2, L21_2)
  
  function L19_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = true
    L5_2 = L0_3
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "userInput"
    L3_3 = L10_2
    L3_3 = L3_3.userInput
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.removeSelf
    L0_3(L1_3)
    L0_3 = nil
    L10_2 = L0_3
  end
  
  L4_2.clean = L19_2
  return L4_2
end

L0_1.create = L2_1
return L0_1
