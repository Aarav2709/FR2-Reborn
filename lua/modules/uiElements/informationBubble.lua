local L0_1, L1_1
L0_1 = {}

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L5_2 = display
  L5_2 = L5_2.newGroup
  L5_2 = L5_2()
  L6_2 = display
  L6_2 = L6_2.newImageRect
  L7_2 = "images/gui/tutorial/helper/bubble3.png"
  L8_2 = 180
  L9_2 = 41
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L8_2 = L5_2
  L7_2 = L5_2.insert
  L9_2 = L6_2
  L7_2(L8_2, L9_2)
  L7_2 = display
  L7_2 = L7_2.newImageRect
  L8_2 = "images/gui/tutorial/helper/bubble_Arrow2.png"
  L9_2 = 29
  L10_2 = 17
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L9_2 = L5_2
  L8_2 = L5_2.insert
  L10_2 = L7_2
  L8_2(L9_2, L10_2)
  L8_2 = composer
  L8_2 = L8_2.newText
  L9_2 = {}
  L9_2.string = L1_2
  L10_2 = L5_2.x
  L9_2.x = L10_2
  L10_2 = L5_2.y
  L9_2.y = L10_2
  L9_2.size = 10
  L9_2.align = "center"
  L10_2 = {}
  L11_2 = 0
  L12_2 = 0
  L13_2 = 0
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L9_2.color = L10_2
  L9_2.width = 150
  L8_2 = L8_2(L9_2)
  L10_2 = L5_2
  L9_2 = L5_2.insert
  L11_2 = L8_2
  L9_2(L10_2, L11_2)
  L9_2 = nil
  L10_2 = nil
  
  function L11_2(A0_3)
    local L1_3, L2_3, L3_3
    if not A0_3 then
      L1_3 = {}
      A0_3 = L1_3
    end
    L1_3 = A0_3.text
    if not L1_3 then
      L1_3 = ""
    end
    L1_2 = L1_3
    L1_3 = A0_3.hideTime
    if not L1_3 then
      L1_3 = 5000
    end
    L2_2 = L1_3
    L1_3 = A0_3.arrowVertical
    if not L1_3 then
      L1_3 = "top"
    end
    L3_2 = L1_3
    L1_3 = A0_3.arrowHorizontal
    if not L1_3 then
      L1_3 = "center"
    end
    L4_2 = L1_3
    L1_3 = L8_2
    L2_3 = composer
    L2_3 = L2_3.localized
    L2_3 = L2_3.get
    L3_3 = L1_2
    L2_3 = L2_3(L3_3)
    L1_3.text = L2_3
    L1_3 = A0_3.x
    if L1_3 then
      L1_3 = L5_2
      L2_3 = A0_3.x
      L1_3.x = L2_3
    end
    L1_3 = A0_3.y
    if L1_3 then
      L1_3 = L5_2
      L2_3 = A0_3.y
      L1_3.y = L2_3
    end
    L1_3 = L3_2
    if L1_3 == "top" then
      L1_3 = L7_2
      L2_3 = L6_2
      L2_3 = L2_3.y
      L3_3 = L6_2
      L3_3 = L3_3.height
      L3_3 = L3_3 * 0.5
      L2_3 = L2_3 - L3_3
      L2_3 = L2_3 - 5
      L1_3.y = L2_3
      L1_3 = L7_2
      L1_3.yScale = 1
    else
      L1_3 = L7_2
      L2_3 = L6_2
      L2_3 = L2_3.y
      L3_3 = L6_2
      L3_3 = L3_3.height
      L3_3 = L3_3 * 0.5
      L2_3 = L2_3 + L3_3
      L2_3 = L2_3 + 6
      L1_3.y = L2_3
      L1_3 = L7_2
      L1_3.yScale = -1
    end
    L1_3 = L4_2
    if L1_3 == "right" then
      L1_3 = L7_2
      L2_3 = L6_2
      L2_3 = L2_3.x
      L3_3 = L6_2
      L3_3 = L3_3.width
      L3_3 = L3_3 * 0.5
      L2_3 = L2_3 + L3_3
      L2_3 = L2_3 - 24
      L1_3.x = L2_3
    else
      L1_3 = L4_2
      if L1_3 == "left" then
        L1_3 = L7_2
        L2_3 = L6_2
        L2_3 = L2_3.x
        L3_3 = L6_2
        L3_3 = L3_3.width
        L3_3 = L3_3 * 0.5
        L2_3 = L2_3 - L3_3
        L2_3 = L2_3 + 24
        L1_3.x = L2_3
      else
        L1_3 = L7_2
        L2_3 = L6_2
        L2_3 = L2_3.x
        L1_3.x = L2_3
      end
    end
  end
  
  L12_2 = L11_2
  L13_2 = A0_2
  L12_2(L13_2)
  
  function L12_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L5_2
    L0_3 = L0_3.clean
    L0_3()
    
    function L0_3()
      local L0_4, L1_4
      L0_4 = L5_2
      L0_4.isVisible = false
    end
    
    L1_3 = transition
    L1_3 = L1_3.to
    L2_3 = L5_2
    L3_3 = {}
    L3_3.time = 200
    L3_3.xScale = 0.1
    L3_3.yScale = 0.1
    L3_3.onComplete = L0_3
    L3_3.onCancel = L0_3
    L4_3 = easing
    L4_3 = L4_3.inBack
    L3_3.transition = L4_3
    L1_3 = L1_3(L2_3, L3_3)
    L10_2 = L1_3
  end
  
  L5_2.hide = L12_2
  
  function L12_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = L5_2
    L1_3 = L1_3.clean
    L1_3()
    L1_3 = L11_2
    L2_3 = A0_3
    L1_3(L2_3)
    L1_3 = L5_2
    L1_3.isVisible = true
    L1_3 = L5_2
    L1_3.xScale = 0.1
    L1_3 = L5_2
    L1_3.yScale = 0.1
    L1_3 = transition
    L1_3 = L1_3.to
    L2_3 = L5_2
    L3_3 = {}
    L3_3.time = 150
    L3_3.xScale = 1
    L3_3.yScale = 1
    L4_3 = easing
    L4_3 = L4_3.outBack
    L3_3.transition = L4_3
    L1_3 = L1_3(L2_3, L3_3)
    L10_2 = L1_3
    L1_3 = timer
    L1_3 = L1_3.performWithDelay
    L2_3 = L2_2
    L3_3 = L5_2
    L3_3 = L3_3.hide
    L4_3 = 1
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    L9_2 = L1_3
  end
  
  L5_2.show = L12_2
  
  function L12_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L5_2
    L1_3 = L1_3.isVisible
    if L1_3 then
      L1_3 = string
      L1_3 = L1_3.lower
      L2_3 = A0_3.text
      L1_3 = L1_3(L2_3)
      L2_3 = string
      L2_3 = L2_3.lower
      L3_3 = L8_2
      L3_3 = L3_3.text
      L2_3 = L2_3(L3_3)
      if L1_3 == L2_3 then
        L1_3 = L5_2
        L1_3 = L1_3.hide
        L1_3()
    end
    else
      L1_3 = L5_2
      L1_3 = L1_3.show
      L2_3 = A0_3
      L1_3(L2_3)
    end
  end
  
  L5_2.interact = L12_2
  
  function L12_2()
    local L0_3, L1_3
    L0_3 = L10_2
    if L0_3 then
      L0_3 = transition
      L0_3 = L0_3.cancel
      L1_3 = L10_2
      L0_3(L1_3)
      L0_3 = nil
      L10_2 = L0_3
    end
    L0_3 = L9_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L9_2
      L0_3(L1_3)
      L0_3 = nil
      L9_2 = L0_3
    end
  end
  
  L5_2.clean = L12_2
  L5_2.isVisible = false
  return L5_2
end

L0_1.create = L1_1
return L0_1
