local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = nil

function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2
  L2_2 = A1_2.params
  L2_2 = L2_2.league
  L3_2 = A1_2.params
  L3_2 = L3_2.promotionType
  L4_2 = A0_2.view
  L5_2 = display
  L5_2 = L5_2.newGroup
  L5_2 = L5_2()
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
  L8_2 = "images/gui/ranking/promotion/window.png"
  L9_2 = 430
  L10_2 = 256
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L7_2.anchorY = 0
  L8_2 = display
  L8_2 = L8_2.contentWidth
  L8_2 = L8_2 * 0.5
  L7_2.x = L8_2
  L7_2.y = 0
  L8_2 = display
  L8_2 = L8_2.newImageRect
  L9_2 = "images/gui/ranking/promotion/tierP_"
  L10_2 = L2_2
  L11_2 = ".png"
  L9_2 = L9_2 .. L10_2 .. L11_2
  L10_2 = 180
  L11_2 = 178
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L9_2 = display
  L9_2 = L9_2.contentWidth
  L9_2 = L9_2 * 0.5
  L8_2.x = L9_2
  L9_2 = display
  L9_2 = L9_2.contentHeight
  L9_2 = L9_2 * 0.5
  L9_2 = L9_2 - 60
  L8_2.y = L9_2
  L8_2.xScale = 0.25
  L8_2.yScale = 0.25
  L9_2 = transition
  L9_2 = L9_2.to
  L10_2 = L8_2
  L11_2 = {}
  L11_2.delay = 100
  L11_2.xScale = 1
  L11_2.yScale = 1
  L12_2 = easing
  L12_2 = L12_2.outBounce
  L11_2.transition = L12_2
  L11_2.time = 1000
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = display
  L10_2 = L10_2.newGroup
  L10_2 = L10_2()
  L11_2 = display
  L11_2 = L11_2.newImageRect
  L12_2 = "images/gui/ranking/promotion/plate_"
  L13_2 = L2_2
  L14_2 = ".png"
  L12_2 = L12_2 .. L13_2 .. L14_2
  L13_2 = 182
  L14_2 = 70
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L12_2 = display
  L12_2 = L12_2.contentWidth
  L12_2 = L12_2 * 0.5
  L11_2.x = L12_2
  L12_2 = display
  L12_2 = L12_2.contentHeight
  L12_2 = L12_2 * 0.5
  L12_2 = L12_2 + 40
  L11_2.y = L12_2
  L11_2.xScale = 0.85
  L11_2.yScale = 0.85
  L12_2 = nil
  if L3_2 == 0 then
    L13_2 = L0_1
    L13_2 = L13_2.localized
    L13_2 = L13_2.get
    L14_2 = "You've been promoted to"
    L13_2 = L13_2(L14_2)
    L12_2 = L13_2
  elseif L3_2 == 1 then
    L13_2 = L0_1
    L13_2 = L13_2.localized
    L13_2 = L13_2.get
    L14_2 = "You've been demoted to"
    L13_2 = L13_2(L14_2)
    L12_2 = L13_2
  else
    L13_2 = L0_1
    L13_2 = L13_2.localized
    L13_2 = L13_2.get
    L14_2 = "You've been placed in"
    L13_2 = L13_2(L14_2)
    L12_2 = L13_2
  end
  L13_2 = L0_1
  L13_2 = L13_2.newText
  L14_2 = {}
  L14_2.string = L12_2
  L14_2.size = 10
  L14_2.x = 240
  L15_2 = L11_2.y
  L15_2 = L15_2 - 10
  L14_2.y = L15_2
  L14_2.align = "center"
  L15_2 = {}
  L16_2 = 1
  L17_2 = 1
  L18_2 = 1
  L15_2[1] = L16_2
  L15_2[2] = L17_2
  L15_2[3] = L18_2
  L14_2.color = L15_2
  L13_2 = L13_2(L14_2)
  L14_2 = L0_1
  L14_2 = L14_2.awards
  L14_2 = L14_2.getLeagueNameText
  L15_2 = L2_2 + 1
  L14_2 = L14_2(L15_2)
  L15_2 = L0_1
  L15_2 = L15_2.newText
  L16_2 = {}
  L16_2.string = L14_2
  L16_2.size = 17
  L16_2.x = 240
  L17_2 = L11_2.y
  L17_2 = L17_2 + 2
  L16_2.y = L17_2
  L16_2.align = "center"
  L17_2 = {}
  L18_2 = 1
  L19_2 = 1
  L20_2 = 1
  L17_2[1] = L18_2
  L17_2[2] = L19_2
  L17_2[3] = L20_2
  L16_2.color = L17_2
  L15_2 = L15_2(L16_2)
  L16_2 = ""
  L17_2 = L0_1
  L17_2 = L17_2.database
  L17_2 = L17_2.getPlayerInformation
  L17_2 = L17_2()
  L18_2 = L17_2.username
  if L18_2 then
    L18_2 = L17_2.usernameCode
    if L18_2 then
      L18_2 = L17_2.username
      L19_2 = "#"
      L20_2 = L17_2.usernameCode
      L16_2 = L18_2 .. L19_2 .. L20_2
    end
  end
  L18_2 = L0_1
  L18_2 = L18_2.newText
  L19_2 = {}
  L19_2.string = L16_2
  L19_2.size = 8
  L19_2.x = 240
  L20_2 = L11_2.y
  L20_2 = L20_2 + 14
  L19_2.y = L20_2
  L19_2.align = "center"
  L20_2 = {}
  L21_2 = 0
  L22_2 = 0
  L23_2 = 0
  L24_2 = 0.4
  L20_2[1] = L21_2
  L20_2[2] = L22_2
  L20_2[3] = L23_2
  L20_2[4] = L24_2
  L19_2.color = L20_2
  L18_2 = L18_2(L19_2)
  L19_2 = nil
  if L3_2 ~= 1 then
    L20_2 = require
    L21_2 = "lua.game.effects.fireworksHandler"
    L20_2 = L20_2(L21_2)
    L19_2 = L20_2
    L20_2 = L19_2.startFireWorks
    L21_2 = 0
    L22_2 = 320
    L23_2 = L4_2
    L24_2 = 0
    L25_2 = true
    L20_2(L21_2, L22_2, L23_2, L24_2, L25_2)
  end
  
  function L20_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  function L21_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
    L0_3 = {}
    L0_3.isModal = true
    L1_3 = L0_1
    L1_3 = L1_3.showOverlay
    L2_3 = "lua.overlays.league"
    L3_3 = L0_3
    L1_3(L2_3, L3_3)
  end
  
  L22_2 = L0_1
  L22_2 = L22_2.newButton
  L23_2 = {}
  L24_2 = display
  L24_2 = L24_2.contentWidth
  L24_2 = L24_2 * 0.5
  L24_2 = L24_2 - 30
  L23_2.x = L24_2
  L24_2 = display
  L24_2 = L24_2.contentHeight
  L24_2 = L24_2 * 0.5
  L24_2 = L24_2 + 95
  L23_2.y = L24_2
  L23_2.width = 62
  L23_2.height = 37
  L24_2 = L0_1
  L24_2 = L24_2.localized
  L24_2 = L24_2.get
  L25_2 = "OK"
  L24_2 = L24_2(L25_2)
  L23_2.text = L24_2
  L23_2.image = "images/gui/ranking/promotion/buttonOk.png"
  L23_2.onRelease = L20_2
  L22_2 = L22_2(L23_2)
  L23_2 = L0_1
  L23_2 = L23_2.newButton
  L24_2 = {}
  L25_2 = display
  L25_2 = L25_2.contentWidth
  L25_2 = L25_2 * 0.5
  L25_2 = L25_2 + 30
  L24_2.x = L25_2
  L25_2 = display
  L25_2 = L25_2.contentHeight
  L25_2 = L25_2 * 0.5
  L25_2 = L25_2 + 95
  L24_2.y = L25_2
  L24_2.width = 48
  L24_2.height = 37
  L24_2.image = "images/gui/ranking/promotion/buttonRanking.png"
  L24_2.onRelease = L21_2
  L23_2 = L23_2(L24_2)
  
  function L24_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L0_1
    L0_3 = L0_3.showSocialPopup
    L1_3 = L1_1
    L2_3 = playedAWin
    L3_3 = playedADev
    L4_3 = playedAGoldenFox
    L5_3 = otherNames
    L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
  end
  
  L25_2 = L0_1
  L25_2 = L25_2.newButton
  L26_2 = {}
  L26_2.image = "images/gui/postgame/photo.png"
  L26_2.width = 30
  L26_2.height = 30
  L26_2.onRelease = L24_2
  L27_2 = display
  L27_2 = L27_2.contentWidth
  L27_2 = L27_2 * 0.5
  L27_2 = L27_2 - 150
  L26_2.x = L27_2
  L26_2.y = 80
  L25_2 = L25_2(L26_2)
  
  function L26_2()
    local L0_3, L1_3, L2_3
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L6_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L11_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L13_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L18_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L22_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L23_2
    L0_3(L1_3, L2_3)
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L25_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L5_2
    L0_3(L1_3, L2_3)
  end
  
  function L27_2(A0_3)
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
  
  function L28_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
    end
    L1_3 = true
    return L1_3
  end
  
  function L29_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L27_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L28_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L30_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L19_2
    if L0_3 then
      L0_3 = L19_2
      L0_3 = L0_3.clean
      L0_3()
    end
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L27_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L28_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L30_2
  L30_2 = L26_2
  L30_2()
  L30_2 = L29_2
  L30_2()
  L30_2 = L0_1
  L30_2 = L30_2.bouncer
  L30_2 = L30_2.down
  L31_2 = L5_2
  L30_2(L31_2)
end

L1_1.create = L6_1

function L6_1(A0_2, A1_2)
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

L1_1.show = L6_1

function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A0_2.view
  L3_2 = A1_2.phase
  if L3_2 == "will" then
    L4_2 = L3_1
    if L4_2 then
      L4_2 = L3_1
      L4_2()
      L4_2 = nil
      L3_1 = L4_2
    end
  elseif L3_2 == "did" then
    L4_2 = A1_2.parent
    if L4_2 then
      L4_2 = A1_2.parent
      L4_2 = L4_2.overlayEnded
      if L4_2 then
        L4_2 = A1_2.parent
        L5_2 = L4_2
        L4_2 = L4_2.overlayEnded
        L6_2 = L4_1
        L4_2(L5_2, L6_2)
        L4_2 = nil
        L4_1 = L4_2
      end
    end
  end
end

L1_1.hide = L6_1

function L6_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L5_1
  if L2_2 then
    L2_2 = L5_1
    L2_2()
    L2_2 = nil
    L5_1 = L2_2
  end
  L2_2 = A0_2.view
  L3_2 = L2_1
  if L3_2 then
    L3_2 = L2_1
    L3_2()
    L3_2 = nil
    L2_1 = L3_2
  end
end

L1_1.destroy = L6_1
L7_1 = L1_1
L6_1 = L1_1.addEventListener
L8_1 = "create"
L9_1 = L1_1
L6_1(L7_1, L8_1, L9_1)
L7_1 = L1_1
L6_1 = L1_1.addEventListener
L8_1 = "show"
L9_1 = L1_1
L6_1(L7_1, L8_1, L9_1)
L7_1 = L1_1
L6_1 = L1_1.addEventListener
L8_1 = "hide"
L9_1 = L1_1
L6_1(L7_1, L8_1, L9_1)
L7_1 = L1_1
L6_1 = L1_1.addEventListener
L8_1 = "destroy"
L9_1 = L1_1
L6_1(L7_1, L8_1, L9_1)
return L1_1
