local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  L2_2 = A0_2.view
  L3_2 = display
  L3_2 = L3_2.newGroup
  L3_2 = L3_2()
  L4_2 = display
  L4_2 = L4_2.contentWidth
  L4_2 = L4_2 * 0.5
  L5_2 = display
  L5_2 = L5_2.contentHeight
  L5_2 = L5_2 * 0.5
  L6_2 = display
  L6_2 = L6_2.newImageRect
  L7_2 = "images/gui/common/black.png"
  L8_2 = 480
  L9_2 = 320
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L6_2.x = L4_2
  L6_2.y = L5_2
  L7_2 = display
  L7_2 = L7_2.newImageRect
  L8_2 = "images/gui/newsfeed/frame.png"
  L9_2 = 332
  L10_2 = 320
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L7_2.x = L4_2
  L7_2.y = L5_2
  L8_2 = display
  L8_2 = L8_2.newImageRect
  L9_2 = "images/gui/newsfeed/spinner.png"
  L10_2 = 24
  L11_2 = 24
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L8_2.x = L4_2
  L8_2.y = L5_2
  L8_2.isVisible = false
  L9_2 = nil
  L10_2 = nil
  L11_2 = native
  L11_2 = L11_2.newWebView
  L12_2 = L4_2 + 1
  L13_2 = L5_2 + 19
  L14_2 = 242
  L15_2 = 283
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
  L11_2.isVisible = false
  L12_2 = isIOS
  if L12_2 then
    L11_2.hasBackground = false
  end
  L12_2 = L0_1
  L12_2 = L12_2.newText
  L13_2 = {}
  L14_2 = L0_1
  L14_2 = L14_2.localized
  L14_2 = L14_2.get
  L15_2 = "News!"
  L14_2 = L14_2(L15_2)
  L13_2.string = L14_2
  L14_2 = L7_2.x
  L14_2 = L14_2 - 5
  L13_2.x = L14_2
  L14_2 = L7_2.y
  L14_2 = L14_2 - 145
  L13_2.y = L14_2
  L13_2.size = 25
  L14_2 = {}
  L15_2 = 1
  L16_2 = 1
  L17_2 = 1
  L14_2[1] = L15_2
  L14_2[2] = L16_2
  L14_2[3] = L17_2
  L13_2.color = L14_2
  L12_2 = L12_2(L13_2)
  L13_2 = L0_1
  L13_2 = L13_2.newText
  L14_2 = {}
  L15_2 = L0_1
  L15_2 = L15_2.localized
  L15_2 = L15_2.get
  L16_2 = "There doesn't seem to be anything here."
  L15_2 = L15_2(L16_2)
  L14_2.string = L15_2
  L14_2.x = L4_2
  L14_2.y = L5_2
  L14_2.width = 150
  L14_2.align = "center"
  L14_2.size = 14
  L15_2 = {}
  L16_2 = 0.1
  L17_2 = 0.1
  L18_2 = 0.1
  L15_2[1] = L16_2
  L15_2[2] = L17_2
  L15_2[3] = L18_2
  L14_2.color = L15_2
  L13_2 = L13_2(L14_2)
  L13_2.isVisible = false
  L14_2 = nil
  L15_2 = 15000
  
  function L16_2()
    local L0_3, L1_3
    L0_3 = L13_2
    L0_3.isVisible = true
    L0_3 = L8_2
    L0_3.isVisible = false
  end
  
  function L17_2()
    local L0_3, L1_3
    L0_3 = L8_2
    L0_3.isVisible = true
    
    function L0_3()
      local L0_4, L1_4, L2_4, L3_4
      L0_4 = transition
      L0_4 = L0_4.to
      L1_4 = L8_2
      L2_4 = {}
      L2_4.time = 250
      L2_4.delta = true
      L2_4.rotation = 10
      L3_4 = L0_3
      L2_4.onComplete = L3_4
      L0_4 = L0_4(L1_4, L2_4)
      L9_2 = L0_4
    end
    
    L1_3 = L0_3
    L1_3()
  end
  
  function L18_2()
    local L0_3, L1_3
    L0_3 = L9_2
    if L0_3 then
      L0_3 = transition
      L0_3 = L0_3.cancel
      L1_3 = L9_2
      L0_3(L1_3)
      L0_3 = nil
      L9_2 = L0_3
    end
    L0_3 = L8_2
    L0_3.isVisible = false
  end
  
  function L19_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = L17_2
    L1_3()
    L1_3 = L0_1
    L1_3 = L1_3.config
    L1_3 = L1_3.newsfeedUrl
    if A0_3 then
      L1_3 = A0_3
    end
    L2_3 = print
    L3_3 = "Request url: "
    L4_3 = L1_3
    L2_3(L3_3, L4_3)
    L2_3 = L11_2
    L3_3 = L2_3
    L2_3 = L2_3.request
    L4_3 = L1_3
    L2_3(L3_3, L4_3)
    L2_3 = timer
    L2_3 = L2_3.performWithDelay
    L3_3 = L15_2
    L4_3 = L16_2
    L5_3 = 1
    L2_3 = L2_3(L3_3, L4_3, L5_3)
    L14_2 = L2_3
  end
  
  function L20_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = string
    L1_3 = L1_3.starts
    L2_3 = A0_3
    L3_3 = "http://minttu-news-"
    L1_3 = L1_3(L2_3, L3_3)
    if not L1_3 then
      L1_3 = string
      L1_3 = L1_3.starts
      L2_3 = A0_3
      L3_3 = "https://minttu-news-"
      L1_3 = L1_3(L2_3, L3_3)
    end
    return L1_3
  end
  
  function L21_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_3.url
    if L1_3 then
      L1_3 = print
      L2_3 = "Checking out url: "
      L3_3 = A0_3.url
      L2_3 = L2_3 .. L3_3
      L1_3(L2_3)
      L1_3 = print
      L2_3 = "Event type "
      L3_3 = A0_3.type
      L1_3(L2_3, L3_3)
    end
    L1_3 = L10_2
    L2_3 = L11_2
    L2_3 = L2_3.canGoBack
    L1_3.isVisible = L2_3
    L1_3 = A0_3.errorCode
    if L1_3 then
      L1_3 = print
      L2_3 = "Web error: "
      L3_3 = A0_3.errorCode
      L2_3 = L2_3 .. L3_3
      L1_3(L2_3)
      L1_3 = A0_3.errorMessage
      if L1_3 then
        L1_3 = print
        L2_3 = "Web error message: "
        L3_3 = A0_3.errorMessage
        L2_3 = L2_3 .. L3_3
        L1_3(L2_3)
      end
    end
    L1_3 = A0_3.type
    if L1_3 then
      L1_3 = L20_2
      L2_3 = A0_3.url
      L1_3 = L1_3(L2_3)
      if not L1_3 then
        L1_3 = isAndroid
        if L1_3 then
          L1_3 = A0_3.type
          if L1_3 == "other" then
            L1_3 = system
            L1_3 = L1_3.openURL
            L2_3 = A0_3.url
            L1_3(L2_3)
            return
          else
            L1_3 = A0_3.type
            if L1_3 == "loaded" then
            end
          end
        end
      end
      L1_3 = A0_3.type
      if L1_3 == "loaded" then
        L1_3 = L11_2
        L1_3.isVisible = true
        L1_3 = L18_2
        L1_3()
        L1_3 = L14_2
        if L1_3 then
          L1_3 = timer
          L1_3 = L1_3.cancel
          L2_3 = L14_2
          L1_3(L2_3)
          L1_3 = nil
          L14_2 = L1_3
        end
      end
    end
  end
  
  function L22_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
    L0_3 = true
    return L0_3
  end
  
  function L23_2()
    local L0_3, L1_3
    L0_3 = L11_2
    L0_3 = L0_3.canGoBack
    if L0_3 then
      L0_3 = L11_2
      L1_3 = L0_3
      L0_3 = L0_3.back
      L0_3(L1_3)
    end
  end
  
  L24_2 = L0_1
  L24_2 = L24_2.newButton
  L25_2 = {}
  L25_2.image = "images/gui/friends/back.png"
  L25_2.onRelease = L23_2
  L25_2.width = 32
  L25_2.height = 32
  L26_2 = L7_2.x
  L26_2 = L26_2 - 130
  L25_2.x = L26_2
  L26_2 = L7_2.y
  L26_2 = L26_2 - 142
  L25_2.y = L26_2
  L24_2 = L24_2(L25_2)
  L10_2 = L24_2
  L10_2.isVisible = false
  L24_2 = L0_1
  L24_2 = L24_2.newButton
  L25_2 = {}
  L25_2.image = "images/gui/common/buttonClosePopupRed.png"
  L25_2.onRelease = L22_2
  L25_2.width = 43
  L25_2.height = 38
  L26_2 = L7_2.x
  L26_2 = L26_2 + 130
  L25_2.x = L26_2
  L26_2 = L7_2.y
  L26_2 = L26_2 + -142
  L25_2.y = L26_2
  L24_2 = L24_2(L25_2)
  
  function L25_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = L0_1
      L1_3 = L1_3.hideOverlay
      L1_3()
      L1_3 = native
      L1_3 = L1_3.setKeyboardFocus
      L2_3 = nil
      L1_3(L2_3)
    end
    L1_3 = true
    return L1_3
  end
  
  function L26_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = native
      L1_3 = L1_3.setKeyboardFocus
      L2_3 = nil
      L1_3(L2_3)
    end
    L1_3 = true
    return L1_3
  end
  
  function L27_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L25_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L26_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "urlRequest"
    L3_3 = L21_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L28_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L6_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L12_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L13_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L24_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L11_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L3_2
    L0_3(L1_3, L2_3)
  end
  
  function L29_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L18_2
    L0_3()
    L0_3 = L14_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L14_2
      L0_3(L1_3)
      L0_3 = nil
      L14_2 = L0_3
    end
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "urlRequest"
    L3_3 = L21_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.removeSelf
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L24_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L10_2
    L0_3(L1_3)
    L0_3 = native
    L0_3 = L0_3.setKeyboardFocus
    L1_3 = nil
    L0_3(L1_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L25_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L26_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L29_2
  L29_2 = L28_2
  L29_2()
  L29_2 = L27_2
  L29_2()
  L29_2 = L19_2
  L29_2()
end

L1_1.create = L4_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A1_2.phase
  if L2_2 == "will" then
    return
  end
  L3_2 = require
  L4_2 = "lua.modules.androidBackButton"
  L3_2 = L3_2(L4_2)
  
  function L4_2()
    local L0_3, L1_3
    L0_3 = L3_2
    L0_3 = L0_3.isOverlay
    L1_3 = false
    L0_3(L1_3)
  end
  
  L3_1 = L4_2
  L4_2 = L3_2.isOverlay
  L5_2 = true
  L4_2(L5_2)
end

L1_1.show = L4_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2.view
  L3_2 = A1_2.phase
  if L3_2 == "will" then
    L4_2 = L3_1
    L4_2()
  elseif L3_2 == "did" then
    L4_2 = A1_2.parent
    if L4_2 then
      L4_2 = A1_2.parent
      L4_2 = L4_2.overlayEnded
      if L4_2 then
        L4_2 = A1_2.parent
        L5_2 = L4_2
        L4_2 = L4_2.overlayEnded
        L4_2(L5_2)
      end
    end
    return
  end
end

L1_1.hide = L4_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A0_2.view
  L3_2 = L2_1
  L3_2()
end

L1_1.destroy = L4_1
L5_1 = L1_1
L4_1 = L1_1.addEventListener
L6_1 = "create"
L7_1 = L1_1
L4_1(L5_1, L6_1, L7_1)
L5_1 = L1_1
L4_1 = L1_1.addEventListener
L6_1 = "show"
L7_1 = L1_1
L4_1(L5_1, L6_1, L7_1)
L5_1 = L1_1
L4_1 = L1_1.addEventListener
L6_1 = "hide"
L7_1 = L1_1
L4_1(L5_1, L6_1, L7_1)
L5_1 = L1_1
L4_1 = L1_1.addEventListener
L6_1 = "destroy"
L7_1 = L1_1
L4_1(L5_1, L6_1, L7_1)
return L1_1
