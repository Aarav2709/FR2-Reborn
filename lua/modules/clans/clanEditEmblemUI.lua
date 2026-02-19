local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  L2_2 = display
  L2_2 = L2_2.newGroup
  L2_2 = L2_2()
  L3_2 = require
  L4_2 = "lua.modules.uiElements.optionPicker"
  L3_2 = L3_2(L4_2)
  L4_2 = require
  L5_2 = "lua.modules.clans.clanEmblem"
  L4_2 = L4_2(L5_2)
  L5_2 = false
  L6_2 = A0_2.emblem
  if not L6_2 then
    L6_2 = L1_1
    L6_2 = L6_2.clanUtils
    L6_2 = L6_2.getDefaultClanEmblem
    L6_2 = L6_2()
  end
  L7_2 = L1_1
  L7_2 = L7_2.debugger
  L7_2 = L7_2.debugTable
  L8_2 = "clans"
  L9_2 = "current emblem:  "
  L10_2 = L6_2
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = display
  L7_2 = L7_2.newRect
  L8_2 = 0
  L9_2 = 0
  L10_2 = 40
  L11_2 = 30
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
  L7_2.strokeWidth = 1
  L9_2 = L7_2
  L8_2 = L7_2.setStrokeColor
  L10_2 = 0
  L11_2 = 0
  L12_2 = 0
  L8_2(L9_2, L10_2, L11_2, L12_2)
  L8_2 = display
  L8_2 = L8_2.newRect
  L9_2 = 0
  L10_2 = 0
  L11_2 = 40
  L12_2 = 30
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
  L8_2.strokeWidth = 1
  L10_2 = L8_2
  L9_2 = L8_2.setStrokeColor
  L11_2 = 0
  L12_2 = 0
  L13_2 = 0
  L9_2(L10_2, L11_2, L12_2, L13_2)
  L9_2 = display
  L9_2 = L9_2.newRect
  L10_2 = 0
  L11_2 = 0
  L12_2 = 40
  L13_2 = 30
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
  L9_2.strokeWidth = 1
  L11_2 = L9_2
  L10_2 = L9_2.setStrokeColor
  L12_2 = 0
  L13_2 = 0
  L14_2 = 0
  L10_2(L11_2, L12_2, L13_2, L14_2)
  L10_2 = display
  L10_2 = L10_2.newSprite
  L11_2 = L1_1
  L11_2 = L11_2.clanEmblemShapeSheet
  L12_2 = L4_2.shapeImageSequence
  L10_2 = L10_2(L11_2, L12_2)
  L10_2.y = -8
  L11_2 = display
  L11_2 = L11_2.newSprite
  L12_2 = L1_1
  L12_2 = L12_2.clanEmblemIconsSheet
  L13_2 = L4_2.iconImageSequence
  L11_2 = L11_2(L12_2, L13_2)
  L11_2.y = -8
  L12_2 = {}
  L13_2 = nil
  L15_2 = L10_2
  L14_2 = L10_2.scale
  L16_2 = 0.25
  L17_2 = 0.25
  L14_2(L15_2, L16_2, L17_2)
  L15_2 = L11_2
  L14_2 = L11_2.scale
  L16_2 = 0.25
  L17_2 = 0.25
  L14_2(L15_2, L16_2, L17_2)
  
  function L14_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.setFillColor
    L2_3 = L4_2
    L2_3 = L2_3.getColorValues
    L3_3 = L6_2
    L3_3 = L3_3.a
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
    L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.setFillColor
    L2_3 = L4_2
    L2_3 = L2_3.getColorValues
    L3_3 = L6_2
    L3_3 = L3_3.b
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
    L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.setFillColor
    L2_3 = L4_2
    L2_3 = L2_3.getColorValues
    L3_3 = L6_2
    L3_3 = L3_3.b
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
    L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.setFillColor
    L2_3 = L4_2
    L2_3 = L2_3.getColorValues
    L3_3 = L6_2
    L3_3 = L3_3.c
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
    L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.setFillColor
    L2_3 = L4_2
    L2_3 = L2_3.getColorValues
    L3_3 = L6_2
    L3_3 = L3_3.c
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
    L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.setFrame
    L2_3 = L1_1
    L2_3 = L2_3.clanEmblemShapeSheetInfo
    L3_3 = L2_3
    L2_3 = L2_3.getFrameIndex
    L4_3 = "shape"
    L5_3 = L6_2
    L5_3 = L5_3.d
    L4_3 = L4_3 .. L5_3
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3, L4_3)
    L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.setFrame
    L2_3 = L1_1
    L2_3 = L2_3.clanEmblemIconsSheetInfo
    L3_3 = L2_3
    L2_3 = L2_3.getFrameIndex
    L4_3 = "icon"
    L5_3 = L6_2
    L5_3 = L5_3.e
    L4_3 = L4_3 .. L5_3
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3, L4_3)
    L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
    L0_3 = 1
    L1_3 = 3
    L2_3 = 1
    for L3_3 = L0_3, L1_3, L2_3 do
      L4_3 = L12_2
      L4_3 = L4_3[L3_3]
      L4_3 = L4_3.updateEmblem
      L5_3 = L6_2
      L4_3(L5_3)
    end
  end
  
  function L15_2(A0_3, A1_3, A2_3, A3_3)
    local L4_3, L5_3
    L4_3 = L6_2
    L5_3 = A3_3 or L5_3
    if not A3_3 then
      L5_3 = 1
    end
    L4_3[A1_3] = L5_3
    
    function L4_3(A0_4, A1_4)
      local L2_4, L3_4, L4_4, L5_4
      L2_4 = L6_2
      L3_4 = A1_3
      L2_4 = L2_4[L3_4]
      L2_4 = L2_4 + A0_4
      if L2_4 < 1 then
        L2_4 = A2_3
      else
        L3_4 = A2_3
        if L2_4 > L3_4 then
          L2_4 = 1
        end
      end
      
      function L3_4(A0_5)
        local L1_5, L2_5, L3_5, L4_5, L5_5
        L1_5 = 1
        L2_5 = A1_4
        L2_5 = #L2_5
        L3_5 = 1
        for L4_5 = L1_5, L2_5, L3_5 do
          L5_5 = A1_4
          L5_5 = L5_5[L4_5]
          if A0_5 == L5_5 then
            L5_5 = true
            return L5_5
          end
        end
        L1_5 = false
        return L1_5
      end
      
      if A1_4 then
        while true do
          L4_4 = L3_4
          L5_4 = L2_4
          L4_4 = L4_4(L5_4)
          if not L4_4 then
            break
          end
          L2_4 = L2_4 + A0_4
        end
      end
      L4_4 = L6_2
      L5_4 = A1_3
      L4_4[L5_4] = L2_4
      L4_4 = L14_2
      L4_4()
    end
    
    A0_3.updateSelectedOption = L4_3
  end
  
  function L16_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L0_3 = display
    L0_3 = L0_3.newGroup
    L0_3 = L0_3()
    L1_3 = display
    L1_3 = L1_3.newImageRect
    L2_3 = "images/gui/clan_v2/emblem/paperPreview.png"
    L3_3 = 168
    L4_3 = 145
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    L3_3 = L0_3
    L2_3 = L0_3.insert
    L4_3 = L1_3
    L2_3(L3_3, L4_3)
    L2_3 = L1_1
    L2_3 = L2_3.newText
    L3_3 = {}
    L4_3 = L1_1
    L4_3 = L4_3.localized
    L4_3 = L4_3.get
    L5_3 = "Preview"
    L4_3 = L4_3(L5_3)
    L3_3.string = L4_3
    L3_3.fontSize = 14
    L4_3 = {}
    L5_3 = 0.35
    L6_3 = 0.35
    L7_3 = 0.35
    L4_3[1] = L5_3
    L4_3[2] = L6_3
    L4_3[3] = L7_3
    L3_3.color = L4_3
    L2_3 = L2_3(L3_3)
    L4_3 = L0_3
    L3_3 = L0_3.insert
    L5_3 = L2_3
    L3_3(L4_3, L5_3)
    L2_3.y = -60
    L3_3 = {}
    L4_3 = "large"
    L5_3 = "medium"
    L6_3 = "small"
    L3_3[1] = L4_3
    L3_3[2] = L5_3
    L3_3[3] = L6_3
    L4_3 = L4_2
    L4_3 = L4_3.create
    L5_3 = L6_2
    L4_3 = L4_3(L5_3)
    L4_3.x = -44
    L5_3 = L1_3.y
    L5_3 = L5_3 - 28
    L4_3.y = L5_3
    L5_3 = L4_3.setEmblemSize
    L6_3 = L3_3[3]
    L5_3(L6_3)
    L5_3 = L12_2
    L5_3[1] = L4_3
    L6_3 = L0_3
    L5_3 = L0_3.insert
    L7_3 = L4_3
    L5_3(L6_3, L7_3)
    L5_3 = L4_2
    L5_3 = L5_3.create
    L6_3 = L6_2
    L5_3 = L5_3(L6_3)
    L5_3.x = -44
    L6_3 = L1_3.y
    L6_3 = L6_3 + 24
    L5_3.y = L6_3
    L6_3 = L5_3.setEmblemSize
    L7_3 = L3_3[2]
    L6_3(L7_3)
    L6_3 = L12_2
    L6_3[2] = L5_3
    L7_3 = L0_3
    L6_3 = L0_3.insert
    L8_3 = L5_3
    L6_3(L7_3, L8_3)
    L6_3 = L4_2
    L6_3 = L6_3.create
    L7_3 = L6_2
    L6_3 = L6_3(L7_3)
    L6_3.x = 34
    L7_3 = L1_3.y
    L6_3.y = L7_3
    L7_3 = L6_3.setEmblemSize
    L8_3 = L3_3[1]
    L7_3(L8_3)
    L7_3 = L12_2
    L7_3[3] = L6_3
    L8_3 = L0_3
    L7_3 = L0_3.insert
    L9_3 = L6_3
    L7_3(L8_3, L9_3)
    return L0_3
  end
  
  function L17_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L2_3 = L1_1
    L2_3 = L2_3.newButton
    L3_3 = {}
    L3_3.image = "images/gui/clan_v2/emblem/browseLeft.png"
    L3_3.width = 32
    L3_3.height = 29
    
    function L4_3()
      local L0_4, L1_4, L2_4
      L0_4 = A0_3
      L0_4 = L0_4.updateSelectedOption
      L1_4 = -1
      L2_4 = A1_3
      L0_4(L1_4, L2_4)
    end
    
    L3_3.onRelease = L4_3
    L4_3 = A0_3.x
    L4_3 = L4_3 - 45
    L3_3.x = L4_3
    L3_3.y = 0
    L2_3 = L2_3(L3_3)
    L3_3 = L1_1
    L3_3 = L3_3.newButton
    L4_3 = {}
    L4_3.image = "images/gui/clan_v2/emblem/browseRight.png"
    L4_3.width = 32
    L4_3.height = 29
    
    function L5_3()
      local L0_4, L1_4, L2_4
      L0_4 = A0_3
      L0_4 = L0_4.updateSelectedOption
      L1_4 = 1
      L2_4 = A1_3
      L0_4(L1_4, L2_4)
    end
    
    L4_3.onRelease = L5_3
    L5_3 = A0_3.x
    L5_3 = L5_3 + 45
    L4_3.x = L5_3
    L4_3.y = 0
    L3_3 = L3_3(L4_3)
    L4_3 = display
    L4_3 = L4_3.newGroup
    L4_3 = L4_3()
    L6_3 = L4_3
    L5_3 = L4_3.insert
    L7_3 = L2_3
    L5_3(L6_3, L7_3)
    L6_3 = L4_3
    L5_3 = L4_3.insert
    L7_3 = L3_3
    L5_3(L6_3, L7_3)
    L6_3 = L4_3
    L5_3 = L4_3.insert
    L7_3 = A0_3
    L5_3(L6_3, L7_3)
    return L4_3
  end
  
  L18_2 = L15_2
  L19_2 = L7_2
  L20_2 = "a"
  L21_2 = L4_2.getNumberOfAvailableColors
  L21_2 = L21_2()
  L22_2 = L6_2.a
  L18_2(L19_2, L20_2, L21_2, L22_2)
  L18_2 = L15_2
  L19_2 = L8_2
  L20_2 = "b"
  L21_2 = L4_2.getNumberOfAvailableColors
  L21_2 = L21_2()
  L22_2 = L6_2.b
  L18_2(L19_2, L20_2, L21_2, L22_2)
  L18_2 = L15_2
  L19_2 = L9_2
  L20_2 = "c"
  L21_2 = L4_2.getNumberOfAvailableColors
  L21_2 = L21_2()
  L22_2 = L6_2.c
  L18_2(L19_2, L20_2, L21_2, L22_2)
  L18_2 = L15_2
  L19_2 = L10_2
  L20_2 = "d"
  L21_2 = L4_2.getNumberOfAvailableShapes
  L21_2 = L21_2()
  L22_2 = L6_2.d
  L18_2(L19_2, L20_2, L21_2, L22_2)
  L18_2 = L15_2
  L19_2 = L11_2
  L20_2 = "e"
  L21_2 = L4_2.getNumberOfAvailableIcons
  L21_2 = L21_2()
  L22_2 = L6_2.e
  L18_2(L19_2, L20_2, L21_2, L22_2)
  L18_2 = 16
  L19_2 = L17_2
  L20_2 = L7_2
  L19_2 = L19_2(L20_2)
  L21_2 = L2_2
  L20_2 = L2_2.insert
  L22_2 = L19_2
  L20_2(L21_2, L22_2)
  L19_2.x = L18_2
  L19_2.y = 0
  L20_2 = L17_2
  L21_2 = L10_2
  L20_2 = L20_2(L21_2)
  L22_2 = L2_2
  L21_2 = L2_2.insert
  L23_2 = L20_2
  L21_2(L22_2, L23_2)
  L20_2.x = L18_2
  L20_2.y = 40
  L21_2 = L17_2
  L22_2 = L8_2
  L21_2 = L21_2(L22_2)
  L23_2 = L2_2
  L22_2 = L2_2.insert
  L24_2 = L21_2
  L22_2(L23_2, L24_2)
  L21_2.x = L18_2
  L21_2.y = 80
  L22_2 = L17_2
  L23_2 = L11_2
  L24_2 = {}
  L25_2 = 27
  L24_2[1] = L25_2
  L22_2 = L22_2(L23_2, L24_2)
  L24_2 = L2_2
  L23_2 = L2_2.insert
  L25_2 = L22_2
  L23_2(L24_2, L25_2)
  L22_2.x = L18_2
  L22_2.y = 120
  L23_2 = L17_2
  L24_2 = L9_2
  L23_2 = L23_2(L24_2)
  L25_2 = L2_2
  L24_2 = L2_2.insert
  L26_2 = L23_2
  L24_2(L25_2, L26_2)
  L23_2.x = L18_2
  L23_2.y = 160
  L24_2 = L16_2
  L24_2 = L24_2()
  L26_2 = L2_2
  L25_2 = L2_2.insert
  L27_2 = L24_2
  L25_2(L26_2, L27_2)
  L25_2 = L24_2.width
  L24_2.x = L25_2
  L24_2.y = 60
  
  function L25_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = A1_2
    if L0_3 then
      L0_3 = A0_2
      L1_3 = L6_2
      L0_3.emblem = L1_3
      L0_3 = {}
      L0_3.isModal = true
      L1_3 = {}
      L0_3.params = L1_3
      L1_3 = L0_3.params
      L2_3 = A0_2
      L1_3.clanData = L2_3
      L1_3 = L1_1
      L1_3 = L1_3.showOverlay
      L2_3 = "lua.overlays.clanSettings"
      L3_3 = L0_3
      L1_3(L2_3, L3_3)
    else
      L0_3 = A0_2
      L1_3 = L6_2
      L0_3.emblem = L1_3
      L0_3 = {}
      L0_3.isModal = true
      L1_3 = {}
      L0_3.params = L1_3
      L1_3 = L0_3.params
      L2_3 = A0_2
      L1_3.clanCreateTempData = L2_3
      L1_3 = L1_1
      L1_3 = L1_3.showOverlay
      L2_3 = "lua.overlays.clanCreate"
      L3_3 = L0_3
      L1_3(L2_3, L3_3)
    end
  end
  
  L26_2 = L1_1
  L26_2 = L26_2.newButton
  L27_2 = {}
  L27_2.image = "images/gui/common/buttonTextB.png"
  L28_2 = L1_1
  L28_2 = L28_2.localized
  L28_2 = L28_2.get
  L29_2 = "Accept"
  L28_2 = L28_2(L29_2)
  L27_2.text = L28_2
  L27_2.width = 126
  L27_2.height = 40
  L27_2.onRelease = L25_2
  L28_2 = L24_2.x
  L27_2.x = L28_2
  L28_2 = L24_2.y
  L28_2 = L28_2 + 100
  L27_2.y = L28_2
  L26_2 = L26_2(L27_2)
  L28_2 = L2_2
  L27_2 = L2_2.insert
  L29_2 = L26_2
  L27_2(L28_2, L29_2)
  
  function L27_2()
    local L0_3, L1_3
    L0_3 = L6_2
    return L0_3
  end
  
  L2_2.getEmblemData = L27_2
  
  function L28_2()
    local L0_3, L1_3
    L0_3 = true
    L5_2 = L0_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.removeSelf
    L0_3(L1_3)
  end
  
  L2_2.clean = L28_2
  L29_2 = L14_2
  L29_2()
  return L2_2
end

L0_1.create = L2_1
return L0_1
