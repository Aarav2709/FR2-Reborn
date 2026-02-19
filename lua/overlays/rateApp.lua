local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L2_2 = A0_2.view
  L3_2 = display
  L3_2 = L3_2.newGroup
  L3_2 = L3_2()
  L3_2.x = -29
  L4_2 = true
  L5_2 = 1
  if A1_2 then
    L6_2 = A1_2.params
    if L6_2 then
      L6_2 = A1_2.params
      L6_2 = L6_2.location
      if L6_2 then
        L6_2 = A1_2.params
        L5_2 = L6_2.location
      end
    end
  end
  L6_2 = display
  L6_2 = L6_2.newImageRect
  L7_2 = "images/gui/common/black.png"
  L8_2 = 480
  L9_2 = 320
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = display
  L7_2 = L7_2.contentWidth
  L7_2 = L7_2 * 0.5
  L6_2.x = L7_2
  L7_2 = display
  L7_2 = L7_2.contentHeight
  L7_2 = L7_2 * 0.5
  L6_2.y = L7_2
  L7_2 = display
  L7_2 = L7_2.newImageRect
  L8_2 = "images/gui/postgame/ratePopup.png"
  L9_2 = 304
  L10_2 = 112
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = display
  L8_2 = L8_2.contentWidth
  L8_2 = L8_2 * 0.5
  L7_2.x = L8_2
  L7_2.y = 66
  L8_2 = L0_1
  L8_2 = L8_2.newText
  L9_2 = {}
  L10_2 = L0_1
  L10_2 = L10_2.localized
  L10_2 = L10_2.get
  L11_2 = "Do you love Fun Run 2?"
  L10_2 = L10_2(L11_2)
  L9_2.string = L10_2
  L10_2 = L7_2.x
  L10_2 = L10_2 + 10
  L9_2.x = L10_2
  L10_2 = L7_2.y
  L10_2 = L10_2 - 36
  L9_2.y = L10_2
  L9_2.size = 16
  L10_2 = {}
  L11_2 = 0
  L12_2 = 0
  L13_2 = 0
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L9_2.color = L10_2
  L8_2 = L8_2(L9_2)
  L9_2 = L0_1
  L9_2 = L9_2.newText
  L10_2 = {}
  L10_2.string = "Would you like to rate the game?"
  L11_2 = L7_2.x
  L11_2 = L11_2 + 30
  L10_2.x = L11_2
  L11_2 = L7_2.y
  L11_2 = L11_2 + 14
  L10_2.y = L11_2
  L10_2.size = 16
  L11_2 = {}
  L12_2 = 1
  L13_2 = 1
  L14_2 = 1
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L11_2[3] = L14_2
  L10_2.color = L11_2
  L9_2 = L9_2(L10_2)
  
  function L10_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L0_3 = false
    L1_3 = isIOS
    if L1_3 then
      L1_3 = system
      L1_3 = L1_3.getInfo
      L2_3 = "platformVersion"
      L1_3 = L1_3(L2_3)
      L2_3 = string
      L2_3 = L2_3.find
      L3_3 = L1_3
      L4_3 = "."
      L5_3 = 1
      L6_3 = true
      L2_3, L3_3 = L2_3(L3_3, L4_3, L5_3, L6_3)
      if L2_3 ~= nil then
        L4_3 = string
        L4_3 = L4_3.sub
        L5_3 = L1_3
        L6_3 = 1
        L7_3 = L2_3 - 1
        L4_3 = L4_3(L5_3, L6_3, L7_3)
        L5_3 = string
        L5_3 = L5_3.sub
        L6_3 = L1_3
        L7_3 = L2_3 + 1
        L8_3 = L2_3 + 1
        L5_3 = L5_3(L6_3, L7_3, L8_3)
        L6_3 = tonumber
        L7_3 = L4_3
        L6_3 = L6_3(L7_3)
        if L6_3 then
          L6_3 = tonumber
          L7_3 = L5_3
          L6_3 = L6_3(L7_3)
          if L6_3 then
            L6_3 = tonumber
            L7_3 = L4_3
            L6_3 = L6_3(L7_3)
            if L6_3 == 10 then
              L6_3 = tonumber
              L7_3 = L5_3
              L6_3 = L6_3(L7_3)
              if 3 <= L6_3 then
                goto lbl_55
              end
            end
            L6_3 = tonumber
            L7_3 = L4_3
            L6_3 = L6_3(L7_3)
            ::lbl_55::
            if 11 <= L6_3 then
              L6_3 = require
              L7_3 = "plugin.reviewPopUp"
              L6_3 = L6_3(L7_3)
              L7_3 = L6_3.show
              L7_3()
              L0_3 = true
            end
          end
        end
      end
    end
    L1_3 = L0_1
    L1_3 = L1_3.comm
    L1_3 = L1_3.rateApp
    L2_3 = L5_2
    L1_3(L2_3)
    if not L0_3 then
      L1_3 = require
      L2_3 = "lua.modules.platformStoreButtonFunction"
      L1_3 = L1_3(L2_3)
      L2_3 = L1_3.toPlatformStoreButton
      L2_3()
    end
    L1_3 = L0_1
    L1_3 = L1_3.hideOverlay
    L1_3()
  end
  
  L11_2 = L0_1
  L11_2 = L11_2.newButton
  L12_2 = {}
  L12_2.image = "images/gui/ranking/promotion/buttonOk.png"
  L13_2 = L0_1
  L13_2 = L13_2.localized
  L13_2 = L13_2.get
  L14_2 = "Yes!"
  L13_2 = L13_2(L14_2)
  L12_2.text = L13_2
  L12_2.onRelease = L10_2
  L12_2.width = 62
  L12_2.height = 37
  L13_2 = L7_2.x
  L13_2 = L13_2 - 30
  L12_2.x = L13_2
  L13_2 = L7_2.y
  L13_2 = L13_2 + 50
  L12_2.y = L13_2
  L11_2 = L11_2(L12_2)
  
  function L12_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.database
    L0_3 = L0_3.ratedNO
    L0_3()
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  L13_2 = L0_1
  L13_2 = L13_2.newButton
  L14_2 = {}
  L14_2.image = "images/gui/ranking/promotion/buttonOkFlip.png"
  L15_2 = L0_1
  L15_2 = L15_2.localized
  L15_2 = L15_2.get
  L16_2 = "No"
  L15_2 = L15_2(L16_2)
  L14_2.text = L15_2
  L14_2.onRelease = L12_2
  L14_2.width = 62
  L14_2.height = 37
  L15_2 = L7_2.x
  L15_2 = L15_2 + 33
  L14_2.x = L15_2
  L15_2 = L7_2.y
  L15_2 = L15_2 + 50
  L14_2.y = L15_2
  L13_2 = L13_2(L14_2)
  
  function L14_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.comm
    L0_3 = L0_3.rateApp
    L1_3 = 2
    L0_3(L1_3)
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  L15_2 = L0_1
  L15_2 = L15_2.newButton
  L16_2 = {}
  L16_2.image = "images/gui/ranking/promotion/buttonOk.png"
  L17_2 = L0_1
  L17_2 = L17_2.localized
  L17_2 = L17_2.get
  L18_2 = "Never"
  L17_2 = L17_2(L18_2)
  L16_2.text = L17_2
  L16_2.onRelease = L14_2
  L16_2.width = 62
  L16_2.height = 37
  L17_2 = L7_2.x
  L17_2 = L17_2 + 96
  L16_2.x = L17_2
  L17_2 = L7_2.y
  L17_2 = L17_2 + 50
  L16_2.y = L17_2
  L15_2 = L15_2(L16_2)
  
  function L16_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = L0_1
      L1_3 = L1_3.hideOverlay
      L1_3()
    end
    L1_3 = true
    return L1_3
  end
  
  function L17_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
    end
    L1_3 = true
    return L1_3
  end
  
  function L18_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L16_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L17_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L19_2()
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
    L2_3 = L11_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L13_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L9_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L3_2
    L0_3(L1_3, L2_3)
  end
  
  function L20_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L11_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L13_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L15_2
    L0_3(L1_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L16_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L17_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L20_2
  L20_2 = L19_2
  L20_2()
  L20_2 = L18_2
  L20_2()
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
  local L2_2, L3_2, L4_2
  L2_2 = A0_2.view
  L3_2 = A1_2.phase
  if L3_2 == "will" then
    L4_2 = L3_1
    L4_2()
  elseif L3_2 == "did" then
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
