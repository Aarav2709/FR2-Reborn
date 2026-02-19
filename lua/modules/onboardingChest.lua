local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L1_1 = require
L2_1 = "lua.ads.videoModule"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "composer"
L2_1 = L2_1(L3_1)

function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2
  L11_2 = display
  L11_2 = L11_2.newGroup
  L11_2 = L11_2()
  L12_2 = nil
  L13_2 = nil
  L14_2 = nil
  L15_2 = nil
  L16_2 = nil
  L17_2 = nil
  L18_2 = nil
  L19_2 = nil
  
  function L20_2(A0_3)
    local L1_3
    L1_3 = true
    return L1_3
  end
  
  function L21_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L11_2
    if L0_3 then
      L0_3 = L15_2
      if not L0_3 then
        L0_3 = A5_2
        if L0_3 then
          L0_3 = display
          L0_3 = L0_3.newImageRect
          L1_3 = "images/gui/common/black.png"
          L2_3 = 480
          L3_3 = 320
          L0_3 = L0_3(L1_3, L2_3, L3_3)
          L17_2 = L0_3
          L0_3 = L17_2
          L1_3 = display
          L1_3 = L1_3.contentWidth
          L1_3 = L1_3 * 0.5
          L0_3.x = L1_3
          L0_3 = L17_2
          L1_3 = display
          L1_3 = L1_3.contentHeight
          L1_3 = L1_3 * 0.5
          L0_3.y = L1_3
          L0_3 = L17_2
          L0_3.alpha = 0.001
          L0_3 = L17_2
          L1_3 = L0_3
          L0_3 = L0_3.addEventListener
          L2_3 = "touch"
          L3_3 = L20_2
          L0_3(L1_3, L2_3, L3_3)
          L0_3 = transition
          L0_3 = L0_3.to
          L1_3 = L17_2
          L2_3 = {}
          L2_3.alpha = 1
          L2_3.time = 1500
          L3_3 = easing
          L3_3 = L3_3.linear
          L2_3.transition = L3_3
          L0_3 = L0_3(L1_3, L2_3)
          L19_2 = L0_3
          L0_3 = A0_2
          L1_3 = L0_3
          L0_3 = L0_3.insert
          L2_3 = L17_2
          L0_3(L1_3, L2_3)
        end
      end
    end
  end
  
  function L22_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L11_2
    if L0_3 then
      L0_3 = L15_2
      if not L0_3 then
        L0_3 = L2_1
        L0_3 = L0_3.analytics
        L0_3 = L0_3.newEvent
        L1_3 = "design"
        L2_3 = {}
        L3_3 = "onboardingChest:"
        L4_3 = A2_2
        L5_3 = ":opened"
        L3_3 = L3_3 .. L4_3 .. L5_3
        L2_3.event_id = L3_3
        L3_3 = A1_2
        L2_3.value = L3_3
        L3_3 = "videos left: "
        L4_3 = L2_1
        L4_3 = L4_3.videosLeft
        if not L4_3 then
          L4_3 = "unknown"
        end
        L3_3 = L3_3 .. L4_3
        L2_3.area = L3_3
        L0_3(L1_3, L2_3)
        L0_3 = "images/gui/postgame/adCoins/chestOpen_"
        L1_3 = A2_2
        L2_3 = ".png"
        L0_3 = L0_3 .. L1_3 .. L2_3
        L1_3 = display
        L1_3 = L1_3.newImageRect
        L2_3 = L0_3
        L3_3 = 102
        L4_3 = 78
        L1_3 = L1_3(L2_3, L3_3, L4_3)
        L12_2 = L1_3
        L1_3 = L11_2
        L1_3.x = 400
        L1_3 = L11_2
        L1_3.y = 216
        L1_3 = L11_2
        L1_3.xScale = 1
        L1_3 = L11_2
        L1_3.yScale = 1
        L1_3 = L11_2
        L2_3 = L1_3
        L1_3 = L1_3.insert
        L3_3 = L12_2
        L1_3(L2_3, L3_3)
      end
    end
  end
  
  function L23_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L11_2
    if L0_3 then
      L0_3 = L7_2
      if L0_3 then
        L0_3 = timer
        L0_3 = L0_3.cancel
        L1_3 = L7_2
        L0_3(L1_3)
        L0_3 = nil
        L7_2 = L0_3
      end
      L0_3 = L12_2
      if L0_3 then
        L0_3 = L12_2
        L1_3 = L0_3
        L0_3 = L0_3.removeEventListener
        L2_3 = "touch"
        L3_3 = L12_2
        L0_3(L1_3, L2_3, L3_3)
        L0_3 = L12_2
        L1_3 = L0_3
        L0_3 = L0_3.removeSelf
        L0_3(L1_3)
        L0_3 = nil
        L12_2 = L0_3
      end
      L0_3 = L14_2
      if L0_3 then
        L0_3 = L14_2
        L1_3 = L0_3
        L0_3 = L0_3.removeSelf
        L0_3(L1_3)
        L0_3 = nil
        L14_2 = L0_3
      end
      L0_3 = L13_2
      if L0_3 then
        L0_3 = L13_2
        L1_3 = L0_3
        L0_3 = L0_3.removeSelf
        L0_3(L1_3)
        L0_3 = nil
        L13_2 = L0_3
      end
      L0_3 = L22_2
      L0_3()
      L0_3 = A6_2
      if L0_3 then
        L0_3 = L12_2
        if L0_3 then
          L0_3 = L12_2
          L1_3 = L18_2
          L0_3.touch = L1_3
          L0_3 = L12_2
          L1_3 = L0_3
          L0_3 = L0_3.addEventListener
          L2_3 = "touch"
          L3_3 = L12_2
          L0_3(L1_3, L2_3, L3_3)
        else
        end
      end
    end
  end
  
  function L24_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L0_3 = L2_1
    L0_3 = L0_3.analytics
    L0_3 = L0_3.newEvent
    L1_3 = "design"
    L2_3 = {}
    L3_3 = "onboardingChest:"
    L4_3 = A2_2
    L5_3 = ":offer"
    L3_3 = L3_3 .. L4_3 .. L5_3
    L2_3.event_id = L3_3
    L3_3 = A1_2
    L2_3.value = L3_3
    L3_3 = "videos left: "
    L4_3 = L2_1
    L4_3 = L4_3.videosLeft
    if not L4_3 then
      L4_3 = "unknown"
    end
    L3_3 = L3_3 .. L4_3
    L2_3.area = L3_3
    L0_3(L1_3, L2_3)
    L0_3 = L2_1
    L0_3 = L0_3.adBoostImageSheetInfo
    L1_3 = L0_3
    L0_3 = L0_3.getFrameIndex
    L2_3 = "chestFall"
    L3_3 = A2_2
    L4_3 = "_1"
    L2_3 = L2_3 .. L3_3 .. L4_3
    L0_3 = L0_3(L1_3, L2_3)
    L1_3 = L2_1
    L1_3 = L1_3.adBoostImageSheetInfo
    L2_3 = L1_3
    L1_3 = L1_3.getFrameIndex
    L3_3 = "chestIdle"
    L4_3 = A2_2
    L5_3 = "_1"
    L3_3 = L3_3 .. L4_3 .. L5_3
    L1_3 = L1_3(L2_3, L3_3)
    L2_3 = {}
    L3_3 = {}
    L3_3.name = "drop"
    L3_3.start = L0_3
    L3_3.count = 8
    L3_3.time = 600
    L3_3.loopCount = 1
    L4_3 = {}
    L4_3.name = "idle"
    L4_3.start = L1_3
    L4_3.count = 6
    L4_3.time = 350
    L4_3.loopCount = 1
    L2_3[1] = L3_3
    L2_3[2] = L4_3
    L3_3 = display
    L3_3 = L3_3.newSprite
    L4_3 = L2_1
    L4_3 = L4_3.adBoostImageSheet
    L5_3 = L2_3
    L3_3 = L3_3(L4_3, L5_3)
    L12_2 = L3_3
    L3_3 = L11_2
    L3_3.y = 156
    L3_3 = L11_2
    L3_3.x = 400
    L3_3 = L11_2
    L3_3.xScale = 0.5
    L3_3 = L11_2
    L3_3.yScale = 0.5
    L3_3 = L11_2
    L3_3.alpha = 0
    L3_3 = L11_2
    L4_3 = L3_3
    L3_3 = L3_3.insert
    L5_3 = L12_2
    L3_3(L4_3, L5_3)
    
    function L3_3()
      local L0_4, L1_4, L2_4
      L0_4 = L12_2
      if L0_4 then
        L0_4 = L12_2
        L0_4 = L0_4.setSequence
        if L0_4 then
          L0_4 = L12_2
          L1_4 = L0_4
          L0_4 = L0_4.setSequence
          L2_4 = "idle"
          L0_4(L1_4, L2_4)
          L0_4 = L12_2
          L1_4 = L0_4
          L0_4 = L0_4.play
          L0_4(L1_4)
        end
      end
    end
    
    function L4_3()
      local L0_4, L1_4, L2_4, L3_4, L4_4
      L0_4 = L11_2
      L0_4.alpha = 1
      L0_4 = L12_2
      L1_4 = L0_4
      L0_4 = L0_4.setSequence
      L2_4 = "drop"
      L0_4(L1_4, L2_4)
      L0_4 = L12_2
      L1_4 = L0_4
      L0_4 = L0_4.play
      L0_4(L1_4)
      
      function L0_4()
        local L0_5, L1_5, L2_5, L3_5, L4_5, L5_5, L6_5, L7_5
        L0_5 = 26
        L1_5 = -74
        L2_5 = display
        L2_5 = L2_5.newImageRect
        L3_5 = "images/gui/postgame/bubbleAdchest.png"
        L4_5 = 452
        L5_5 = 104
        L2_5 = L2_5(L3_5, L4_5, L5_5)
        L13_2 = L2_5
        L2_5 = L13_2
        L2_5.y = L0_5
        L2_5 = L13_2
        L2_5.x = L1_5
        L2_5 = L2_1
        L2_5 = L2_5.newText
        L3_5 = {}
        L4_5 = A4_2
        L3_5.string = L4_5
        L3_5.size = 28
        L4_5 = {}
        L5_5 = 0
        L6_5 = 0
        L7_5 = 0
        L4_5[1] = L5_5
        L4_5[2] = L6_5
        L4_5[3] = L7_5
        L3_5.color = L4_5
        L3_5.width = 300
        L3_5.align = "center"
        L2_5 = L2_5(L3_5)
        L14_2 = L2_5
        L2_5 = L14_2
        L3_5 = L0_5 - 10
        L2_5.y = L3_5
        L2_5 = L14_2
        L2_5.x = L1_5
        L2_5 = L11_2
        L3_5 = L2_5
        L2_5 = L2_5.insert
        L4_5 = L13_2
        L2_5(L3_5, L4_5)
        L2_5 = L11_2
        L3_5 = L2_5
        L2_5 = L2_5.insert
        L4_5 = L14_2
        L2_5(L3_5, L4_5)
      end
      
      L1_4 = A4_2
      if L1_4 then
        L1_4 = timer
        L1_4 = L1_4.performWithDelay
        L2_4 = 500
        L3_4 = L0_4
        L4_4 = 1
        L1_4 = L1_4(L2_4, L3_4, L4_4)
        L10_2 = L1_4
      end
      L1_4 = timer
      L1_4 = L1_4.performWithDelay
      L2_4 = 2800
      L3_4 = L3_3
      L4_4 = 0
      L1_4 = L1_4(L2_4, L3_4, L4_4)
      L7_2 = L1_4
    end
    
    function L5_3(A0_4, A1_4)
      local L2_4, L3_4, L4_4, L5_4, L6_4, L7_4
      L2_4 = A1_4.phase
      if L2_4 == "ended" then
        L2_4 = L16_2
        if L2_4 then
          L2_4 = A6_2
          if not L2_4 then
            goto lbl_64
          end
        end
        L2_4 = L2_1
        L2_4 = L2_4.audio
        L2_4 = L2_4.play
        L3_4 = "button_press"
        L2_4(L3_4)
        L2_4 = L2_1
        L2_4 = L2_4.analytics
        L2_4 = L2_4.newEvent
        L3_4 = "design"
        L4_4 = {}
        L5_4 = "onboardingChest:"
        L6_4 = A2_2
        L7_4 = ":open"
        L5_4 = L5_4 .. L6_4 .. L7_4
        L4_4.event_id = L5_4
        L5_4 = A1_2
        L4_4.value = L5_4
        L5_4 = "videos left: "
        L6_4 = L2_1
        L6_4 = L6_4.videosLeft
        if not L6_4 then
          L6_4 = "unknown"
        end
        L5_4 = L5_4 .. L6_4
        L4_4.area = L5_4
        L2_4(L3_4, L4_4)
        L2_4 = A3_2
        if L2_4 then
          L2_4 = A3_2
          L2_4()
        end
        L2_4 = A5_2
        if L2_4 then
          L2_4 = L17_2
          if L2_4 then
            L2_4 = L17_2
            L3_4 = L2_4
            L2_4 = L2_4.removeEventListener
            L4_4 = "touch"
            L5_4 = L20_2
            L2_4(L3_4, L4_4, L5_4)
            L2_4 = L17_2
            L3_4 = L2_4
            L2_4 = L2_4.removeSelf
            L2_4(L3_4)
            L2_4 = nil
            L17_2 = L2_4
          end
        end
        L2_4 = L16_2
        if not L2_4 then
          L2_4 = L23_2
          L2_4()
        end
        L2_4 = true
        L16_2 = L2_4
      end
      ::lbl_64::
    end
    
    L18_2 = L5_3
    L5_3 = L12_2
    L6_3 = L18_2
    L5_3.touch = L6_3
    L5_3 = L12_2
    L6_3 = L5_3
    L5_3 = L5_3.addEventListener
    L7_3 = "touch"
    L8_3 = L12_2
    L5_3(L6_3, L7_3, L8_3)
    L5_3 = timer
    L5_3 = L5_3.performWithDelay
    L6_3 = 1500
    L7_3 = L4_3
    L5_3 = L5_3(L6_3, L7_3)
    L8_2 = L5_3
  end
  
  function L25_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L15_2
    if L0_3 then
      return
    end
    L0_3 = L12_2
    if L0_3 then
      L0_3 = L12_2
      L1_3 = L0_3
      L0_3 = L0_3.removeEventListener
      L2_3 = "touch"
      L3_3 = L12_2
      L0_3(L1_3, L2_3, L3_3)
    end
  end
  
  function L26_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L15_2
    if L0_3 then
      return
    end
    L0_3 = true
    L15_2 = L0_3
    L0_3 = false
    L16_2 = L0_3
    L0_3 = L12_2
    if L0_3 then
      L0_3 = L12_2
      L1_3 = L0_3
      L0_3 = L0_3.removeEventListener
      L2_3 = "touch"
      L3_3 = L12_2
      L0_3(L1_3, L2_3, L3_3)
    end
    L0_3 = L7_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L7_2
      L0_3(L1_3)
      L0_3 = nil
      L7_2 = L0_3
    end
    L0_3 = L8_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L8_2
      L0_3(L1_3)
      L0_3 = nil
      L8_2 = L0_3
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
    L0_3 = L10_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L10_2
      L0_3(L1_3)
      L0_3 = nil
      L10_2 = L0_3
    end
    L0_3 = L19_2
    if L0_3 then
      L0_3 = transition
      L0_3 = L0_3.cancel
      L1_3 = L19_2
      L0_3(L1_3)
      L0_3 = nil
      L19_2 = L0_3
    end
    L0_3 = L11_2
    if L0_3 then
      L0_3 = L11_2
      L1_3 = L0_3
      L0_3 = L0_3.removeSelf
      L0_3(L1_3)
      L0_3 = nil
      L11_2 = L0_3
    end
    L0_3 = L17_2
    if L0_3 then
      L0_3 = L17_2
      L1_3 = L0_3
      L0_3 = L0_3.removeEventListener
      L2_3 = "touch"
      L3_3 = L20_2
      L0_3(L1_3, L2_3, L3_3)
    end
  end
  
  L11_2.clean = L26_2
  L11_2.removeEventListeners = L25_2
  L27_2 = L21_2
  L27_2()
  L27_2 = L24_2
  L27_2()
  return L11_2
end

L0_1.init = L3_1
return L0_1
