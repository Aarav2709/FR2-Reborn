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
  L4_2 = display
  L4_2 = L4_2.newGroup
  L4_2 = L4_2()
  L5_2 = display
  L5_2 = L5_2.newImageRect
  L6_2 = "images/gui/common/black.png"
  L7_2 = 480
  L8_2 = 320
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = display
  L6_2 = L6_2.contentWidth
  L6_2 = L6_2 * 0.5
  L5_2.x = L6_2
  L6_2 = display
  L6_2 = L6_2.contentHeight
  L6_2 = L6_2 * 0.5
  L5_2.y = L6_2
  L6_2 = display
  L6_2 = L6_2.newImageRect
  L7_2 = "images/gui/clan_v2/create_clan/createWindow.png"
  L8_2 = 321
  L9_2 = 262
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = display
  L7_2 = L7_2.contentWidth
  L7_2 = L7_2 * 0.5
  L6_2.x = L7_2
  L6_2.anchorY = 0
  L6_2.y = 0
  L7_2 = display
  L7_2 = L7_2.newImageRect
  L8_2 = "images/gui/play/play_infoBG.png"
  L9_2 = 268
  L10_2 = 178
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = L6_2.x
  L7_2.x = L8_2
  L8_2 = L6_2.y
  L9_2 = L6_2.height
  L9_2 = L9_2 * 0.5
  L8_2 = L8_2 + L9_2
  L7_2.y = L8_2
  L8_2 = L0_1
  L8_2 = L8_2.newText
  L9_2 = {}
  L10_2 = L0_1
  L10_2 = L10_2.localized
  L10_2 = L10_2.get
  L11_2 = "Play against 3 random other players. Earn coins and league rating."
  L10_2 = L10_2(L11_2)
  L9_2.string = L10_2
  L10_2 = L7_2.x
  L10_2 = L10_2 - 66
  L9_2.x = L10_2
  L10_2 = L7_2.y
  L10_2 = L10_2 - 66
  L9_2.y = L10_2
  L9_2.ax = 0
  L9_2.size = 10
  L10_2 = {}
  L11_2 = 0
  L12_2 = 0
  L13_2 = 0
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L9_2.color = L10_2
  L9_2.width = 165
  L8_2 = L8_2(L9_2)
  L9_2 = L0_1
  L9_2 = L9_2.newText
  L10_2 = {}
  L11_2 = L0_1
  L11_2 = L11_2.localized
  L11_2 = L11_2.get
  L12_2 = "Play against friends. Choose a map or join other players. Earn coins."
  L11_2 = L11_2(L12_2)
  L10_2.string = L11_2
  L11_2 = L7_2.x
  L11_2 = L11_2 - 66
  L10_2.x = L11_2
  L11_2 = L7_2.y
  L11_2 = L11_2 - 20
  L10_2.y = L11_2
  L10_2.ax = 0
  L10_2.size = 10
  L11_2 = {}
  L12_2 = 0
  L13_2 = 0
  L14_2 = 0
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L11_2[3] = L14_2
  L10_2.color = L11_2
  L10_2.width = 165
  L9_2 = L9_2(L10_2)
  L10_2 = L0_1
  L10_2 = L10_2.newText
  L11_2 = {}
  L12_2 = L0_1
  L12_2 = L12_2.localized
  L12_2 = L12_2.get
  L13_2 = "Play on a team with another player. Gives bonus clan rating if playing with a clan member."
  L12_2 = L12_2(L13_2)
  L11_2.string = L12_2
  L12_2 = L7_2.x
  L12_2 = L12_2 - 66
  L11_2.x = L12_2
  L12_2 = L7_2.y
  L12_2 = L12_2 + 26
  L11_2.y = L12_2
  L11_2.ax = 0
  L11_2.size = 10
  L12_2 = {}
  L13_2 = 0
  L14_2 = 0
  L15_2 = 0
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L12_2[3] = L15_2
  L11_2.color = L12_2
  L11_2.width = 165
  L10_2 = L10_2(L11_2)
  L11_2 = L0_1
  L11_2 = L11_2.newText
  L12_2 = {}
  L13_2 = L0_1
  L13_2 = L13_2.localized
  L13_2 = L13_2.get
  L14_2 = "Choose a map and practice against bots in an offline race."
  L13_2 = L13_2(L14_2)
  L12_2.string = L13_2
  L13_2 = L7_2.x
  L13_2 = L13_2 - 66
  L12_2.x = L13_2
  L13_2 = L7_2.y
  L13_2 = L13_2 + 66
  L12_2.y = L13_2
  L12_2.ax = 0
  L12_2.size = 10
  L13_2 = {}
  L14_2 = 0
  L15_2 = 0
  L16_2 = 0
  L13_2[1] = L14_2
  L13_2[2] = L15_2
  L13_2[3] = L16_2
  L12_2.color = L13_2
  L12_2.width = 165
  L11_2 = L11_2(L12_2)
  L12_2 = L0_1
  L12_2 = L12_2.newText
  L13_2 = {}
  L14_2 = L0_1
  L14_2 = L14_2.localized
  L14_2 = L14_2.get
  L15_2 = "Game Modes"
  L14_2 = L14_2(L15_2)
  L13_2.string = L14_2
  L14_2 = L6_2.x
  L13_2.x = L14_2
  L14_2 = L6_2.y
  L14_2 = L14_2 + 18
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
  L13_2.align = "center"
  L12_2 = L12_2(L13_2)
  
  function L13_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
    L0_3 = true
    return L0_3
  end
  
  L14_2 = L0_1
  L14_2 = L14_2.newButton
  L15_2 = {}
  L16_2 = L6_2.x
  L15_2.x = L16_2
  L16_2 = L6_2.y
  L17_2 = L6_2.height
  L16_2 = L16_2 + L17_2
  L16_2 = L16_2 - 22
  L15_2.y = L16_2
  L16_2 = L0_1
  L16_2 = L16_2.localized
  L16_2 = L16_2.get
  L17_2 = "OK"
  L16_2 = L16_2(L17_2)
  L15_2.text = L16_2
  L15_2.width = 62
  L15_2.height = 37
  L15_2.image = "images/gui/ranking/promotion/buttonOk.png"
  L15_2.onRelease = L13_2
  L14_2 = L14_2(L15_2)
  
  function L15_2(A0_3)
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
  
  function L16_2(A0_3)
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
  
  function L17_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L15_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L16_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L18_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L5_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L6_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L12_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
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
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L10_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L11_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L3_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L14_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L4_2
    L0_3(L1_3, L2_3)
  end
  
  function L19_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L14_2
    L0_3(L1_3)
    L0_3 = native
    L0_3 = L0_3.setKeyboardFocus
    L1_3 = nil
    L0_3(L1_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L15_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L16_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L19_2
  L19_2 = L18_2
  L19_2()
  L19_2 = L17_2
  L19_2()
  L19_2 = L0_1
  L19_2 = L19_2.bouncer
  L19_2 = L19_2.down
  L20_2 = L4_2
  L19_2(L20_2)
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
