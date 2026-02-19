local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L2_2 = A0_2.view
  L3_2 = false
  L4_2 = display
  L4_2 = L4_2.newGroup
  L4_2 = L4_2()
  L5_2 = {}
  L6_2 = {}
  L7_2 = 1
  L8_2 = L0_1
  L8_2 = L8_2.mapHandler
  L8_2 = L8_2.getNumberOfMaps
  L8_2 = L8_2()
  L9_2 = 6
  L10_2 = L9_2 / 2
  L11_2 = math
  L11_2 = L11_2.ceil
  L12_2 = L8_2 / L9_2
  L11_2 = L11_2(L12_2)
  L12_2 = nil
  L13_2 = nil
  L14_2 = L0_1
  L14_2 = L14_2.backgrounds
  L14_2 = L14_2.getBackground
  L14_2 = L14_2()
  L15_2 = display
  L15_2 = L15_2.newImageRect
  L16_2 = "images/gui/practice/bottom.png"
  L17_2 = 42
  L18_2 = 45
  L15_2 = L15_2(L16_2, L17_2, L18_2)
  L16_2 = display
  L16_2 = L16_2.contentWidth
  L16_2 = L16_2 * 0.5
  L15_2.x = L16_2
  L16_2 = display
  L16_2 = L16_2.contentHeight
  L16_2 = L16_2 * 0.8
  L15_2.y = L16_2
  L16_2 = display
  L16_2 = L16_2.newImageRect
  L17_2 = "images/gui/practice/window.png"
  L18_2 = 358
  L19_2 = 222
  L16_2 = L16_2(L17_2, L18_2, L19_2)
  L17_2 = L15_2.x
  L16_2.x = L17_2
  L17_2 = L15_2.y
  L18_2 = L16_2.height
  L18_2 = L18_2 * 0.55
  L17_2 = L17_2 - L18_2
  L16_2.y = L17_2
  L17_2 = display
  L17_2 = L17_2.newImageRect
  L18_2 = "images/gui/practice/top.png"
  L19_2 = 22
  L20_2 = 14
  L17_2 = L17_2(L18_2, L19_2, L20_2)
  L18_2 = L16_2.x
  L17_2.x = L18_2
  L18_2 = L16_2.y
  L19_2 = L16_2.height
  L19_2 = L19_2 * 0.51
  L18_2 = L18_2 - L19_2
  L17_2.y = L18_2
  
  function L18_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.gameInfo
    L1_3 = L1_3.players
    L2_3 = {}
    L3_3 = L0_1
    L3_3 = L3_3.database
    L3_3 = L3_3.getPlayerInformation
    L3_3 = L3_3()
    L3_3 = L3_3.username
    L2_3.username = L3_3
    L3_3 = L0_1
    L3_3 = L3_3.database
    L3_3 = L3_3.getAvatarData
    L3_3 = L3_3()
    L2_3.avatar = L3_3
    L3_3 = L0_1
    L3_3 = L3_3.database
    L3_3 = L3_3.getPlayerInformation
    L3_3 = L3_3()
    L3_3 = L3_3.playerId
    L2_3.playerId = L3_3
    L3_3 = L0_1
    L3_3 = L3_3.database
    L3_3 = L3_3.getPowerupSkin
    L3_3 = L3_3()
    L2_3.customPowerUps = L3_3
    L1_3[1] = L2_3
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.gameInfo
    L1_3.gameType = 0
    L1_3 = L0_1
    L1_3 = L1_3.data
    L1_3 = L1_3.gameInfo
    L1_3.map = A0_3
    L1_3 = L0_1
    L1_3 = L1_3.gotoScene
    L2_3 = "lua.scenes.gamePlay"
    L1_3(L2_3)
  end
  
  function L19_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
    L0_3 = 140
    L1_3 = 180
    L2_3 = 1
    L3_3 = L8_2
    L4_3 = 1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = math
      L6_3 = L6_3.ceil
      L7_3 = L9_2
      L7_3 = L5_3 / L7_3
      L6_3 = L6_3(L7_3)
      L7_3 = L5_3 - 1
      L8_3 = L9_2
      L7_3 = L7_3 % L8_3
      L8_3 = 100
      L9_3 = L6_3 - 1
      L9_3 = L9_3 * 480
      L10_3 = L0_1
      L10_3 = L10_3.data
      L10_3 = L10_3.getMapInfo
      L11_3 = L5_3
      L10_3 = L10_3(L11_3)
      if not L10_3 then
        L11_3 = print
        L12_3 = "WARNING: NO DATA FOR MAP NR: "
        L13_3 = L5_3
        L11_3(L12_3, L13_3)
        return
      end
      
      function L11_3()
        local L0_4, L1_4
        L0_4 = L18_2
        L1_4 = L5_3
        L0_4(L1_4)
      end
      
      L12_3 = "images/gui/practice/icon"
      L13_3 = L5_3
      L14_3 = ".png"
      L12_3 = L12_3 .. L13_3 .. L14_3
      L13_3 = display
      L13_3 = L13_3.newImage
      L14_3 = L12_3
      L13_3 = L13_3(L14_3)
      if not L13_3 then
        L14_3 = L10_3.theme
        L15_3 = "images/gui/practice/default"
        L16_3 = L14_3
        L17_3 = ".png"
        L12_3 = L15_3 .. L16_3 .. L17_3
      else
        L15_3 = L13_3
        L14_3 = L13_3.removeSelf
        L14_3(L15_3)
        L13_3 = nil
      end
      L14_3 = L5_2
      L15_3 = L0_1
      L15_3 = L15_3.newButton
      L16_3 = {}
      L16_3.image = L12_3
      L16_3.width = 88
      L16_3.height = 90
      L16_3.onRelease = L11_3
      L16_3.x = -100
      L16_3.y = -100
      L15_3 = L15_3(L16_3)
      L14_3[L5_3] = L15_3
      L14_3 = L5_2
      L14_3 = L14_3[L5_3]
      L15_3 = L10_2
      L15_3 = L7_3 % L15_3
      L15_3 = L15_3 + 1
      L15_3 = L8_3 * L15_3
      L15_3 = L0_3 + L15_3
      L15_3 = L15_3 + L9_3
      L14_3.x = L15_3
      L14_3 = L5_2
      L14_3 = L14_3[L5_3]
      L15_3 = math
      L15_3 = L15_3.floor
      L16_3 = L10_2
      L16_3 = L7_3 / L16_3
      L15_3 = L15_3(L16_3)
      L16_3 = L9_2
      L15_3 = L15_3 % L16_3
      L15_3 = L8_3 * L15_3
      L15_3 = L1_3 + L15_3
      L15_3 = L15_3 + 1
      L14_3.y = L15_3
      L14_3 = L10_3.name
      if L14_3 then
        L14_3 = L6_2
        L15_3 = L0_1
        L15_3 = L15_3.newText
        L16_3 = {}
        L17_3 = L10_3.name
        L16_3.string = L17_3
        L16_3.size = 14
        L17_3 = L5_2
        L17_3 = L17_3[L5_3]
        L17_3 = L17_3.x
        L17_3 = L17_3 - 100
        L16_3.x = L17_3
        L17_3 = L5_2
        L17_3 = L17_3[L5_3]
        L17_3 = L17_3.y
        L17_3 = L17_3 - 72
        L16_3.y = L17_3
        L15_3 = L15_3(L16_3)
        L14_3[L5_3] = L15_3
      end
      L14_3 = L4_2
      L15_3 = L14_3
      L14_3 = L14_3.insert
      L16_3 = L5_2
      L16_3 = L16_3[L5_3]
      L14_3(L15_3, L16_3)
      L14_3 = L4_2
      L15_3 = L14_3
      L14_3 = L14_3.insert
      L16_3 = L6_2
      L16_3 = L16_3[L5_3]
      L14_3(L15_3, L16_3)
    end
  end
  
  function L20_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L7_2
    L0_3 = L0_3 - 1
    L7_2 = L0_3
    L0_3 = L7_2
    if L0_3 == 1 then
      L0_3 = L13_2
      L0_3.isVisible = false
    end
    L0_3 = L7_2
    L1_3 = L11_2
    if L0_3 < L1_3 then
      L0_3 = L12_2
      L0_3.isVisible = true
    end
    L0_3 = L7_2
    L0_3 = L0_3 - 1
    L0_3 = -1 * L0_3
    L0_3 = L0_3 * 480
    L1_3 = transition
    L1_3 = L1_3.to
    L2_3 = L4_2
    L3_3 = {}
    L3_3.time = 200
    L3_3.x = L0_3
    L1_3(L2_3, L3_3)
  end
  
  L21_2 = L0_1
  L21_2 = L21_2.newButton
  L22_2 = {}
  L22_2.image = "images/gui/practice/left.png"
  L22_2.width = 45
  L22_2.height = 45
  L22_2.onRelease = L20_2
  L22_2.x = 73
  L22_2.y = 140
  L21_2 = L21_2(L22_2)
  L13_2 = L21_2
  
  function L21_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L7_2
    L0_3 = L0_3 + 1
    L7_2 = L0_3
    L0_3 = L7_2
    if 1 < L0_3 then
      L0_3 = L13_2
      L0_3.isVisible = true
    end
    L0_3 = L7_2
    L1_3 = L11_2
    if L0_3 >= L1_3 then
      L0_3 = L12_2
      L0_3.isVisible = false
    end
    L0_3 = L7_2
    L0_3 = L0_3 - 1
    L0_3 = -1 * L0_3
    L0_3 = L0_3 * 480
    L1_3 = transition
    L1_3 = L1_3.to
    L2_3 = L4_2
    L3_3 = {}
    L3_3.time = 200
    L3_3.x = L0_3
    L1_3(L2_3, L3_3)
  end
  
  L22_2 = L0_1
  L22_2 = L22_2.newButton
  L23_2 = {}
  L23_2.image = "images/gui/practice/right.png"
  L23_2.width = 45
  L23_2.height = 45
  L23_2.onRelease = L21_2
  L23_2.x = 408
  L23_2.y = 140
  L22_2 = L22_2(L23_2)
  L12_2 = L22_2
  
  function L22_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.gotoScene
    L1_3 = "lua.scenes.mainMenu"
    L0_3(L1_3)
  end
  
  L23_2 = L0_1
  L23_2 = L23_2.newButton
  L24_2 = {}
  L24_2.image = "images/gui/common/buttonHome.png"
  L24_2.width = 90
  L24_2.height = 57
  L24_2.onRelease = L22_2
  L24_2.x = 50
  L24_2.y = 292
  L23_2 = L23_2(L24_2)
  
  function L24_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L14_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L17_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L16_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L4_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L12_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L13_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L23_2
    L0_3(L1_3, L2_3)
  end
  
  function L25_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = true
    L3_2 = L0_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L23_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L12_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L13_2
    L0_3(L1_3)
    L0_3 = 1
    L1_3 = L5_2
    L1_3 = #L1_3
    L2_3 = 1
    for L3_3 = L0_3, L1_3, L2_3 do
      L4_3 = display
      L4_3 = L4_3.remove
      L5_3 = L5_2
      L5_3 = L5_3[L3_3]
      L4_3(L5_3)
    end
  end
  
  L2_1 = L25_2
  L25_2 = L24_2
  L25_2()
  L25_2 = L19_2
  L25_2()
  if L7_2 == 1 then
    L13_2.isVisible = false
  end
  if L11_2 == L7_2 then
    L12_2.isVisible = false
  end
end

L1_1.create = L4_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A1_2.phase
  L3_2 = A0_2.view
  if L2_2 == "will" then
    return
  end
  L4_2 = require
  L5_2 = "lua.modules.androidBackButton"
  L4_2 = L4_2(L5_2)
  
  function L5_2()
    local L0_3, L1_3
    L0_3 = L4_2
    L0_3 = L0_3.removeBackButton
    L0_3()
  end
  
  L3_1 = L5_2
  L5_2 = L4_2.addBackButton
  L6_2 = "lua.scenes.playMenu"
  L7_2 = "lua.scenes.lobbyPractise"
  L5_2(L6_2, L7_2)
  L5_2 = L0_1
  L5_2 = L5_2.data
  L5_2 = L5_2.gameInfo
  L5_2.crazyModeActive = false
  L5_2 = L0_1
  L5_2 = L5_2.data
  L5_2 = L5_2.gameInfo
  L5_2.crazyMode = 0
end

L1_1.show = L4_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2.phase
  if L2_2 == "will" then
    L3_2 = L3_1
    if L3_2 then
      L3_2 = L3_1
      L3_2()
      L3_2 = nil
      L3_1 = L3_2
    end
  elseif L2_2 == "did" then
    L3_2 = L0_1
    L3_2 = L3_2.removeScene
    L4_2 = "lua.scenes.lobbyPractise"
    L3_2(L4_2)
  end
end

L1_1.hide = L4_1

function L4_1(A0_2, A1_2)
  local L2_2
  L2_2 = L2_1
  if L2_2 then
    L2_2 = L2_1
    L2_2()
    L2_2 = nil
    L2_1 = L2_2
  end
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
