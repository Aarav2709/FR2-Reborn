local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2
  L2_2 = display
  L2_2 = L2_2.newGroup
  L2_2 = L2_2()
  L3_2 = display
  L3_2 = L3_2.newGroup
  L3_2 = L3_2()
  L3_2.isVisible = false
  L4_2 = require
  L5_2 = "lua.modules.clans.clanEmblem"
  L4_2 = L4_2(L5_2)
  L5_2 = require
  L6_2 = "lua.modules.clans.clanEditableSettingsUI"
  L5_2 = L5_2(L6_2)
  L6_2 = false
  L7_2 = nil
  L8_2 = nil
  L9_2 = nil
  L10_2 = nil
  L11_2 = nil
  L12_2 = 5
  L13_2 = 25
  L14_2 = isAndroid
  if L14_2 then
    L13_2 = 25
  end
  L14_2 = L1_1
  L14_2 = L14_2.newText
  L15_2 = {}
  L16_2 = L1_1
  L16_2 = L16_2.localized
  L16_2 = L16_2.get
  L17_2 = "ClanName"
  L16_2 = L16_2(L17_2)
  L15_2.string = L16_2
  L15_2.x = -94
  L15_2.y = -70
  L16_2 = {}
  L17_2 = 1
  L18_2 = 1
  L19_2 = 1
  L16_2[1] = L17_2
  L16_2[2] = L18_2
  L16_2[3] = L19_2
  L15_2.color = L16_2
  L14_2 = L14_2(L15_2)
  L15_2 = L1_1
  L15_2 = L15_2.newText
  L16_2 = {}
  L17_2 = L1_1
  L17_2 = L17_2.localized
  L17_2 = L17_2.get
  L18_2 = "ClanTag"
  L17_2 = L17_2(L18_2)
  L16_2.string = L17_2
  L16_2.x = -94
  L16_2.y = -40
  L17_2 = {}
  L18_2 = 1
  L19_2 = 1
  L20_2 = 1
  L17_2[1] = L18_2
  L17_2[2] = L19_2
  L17_2[3] = L20_2
  L16_2.color = L17_2
  L15_2 = L15_2(L16_2)
  L16_2 = L1_1
  L16_2 = L16_2.newText
  L17_2 = {}
  L18_2 = L1_1
  L18_2 = L18_2.localized
  L18_2 = L18_2.get
  L19_2 = "Emblem"
  L18_2 = L18_2(L19_2)
  L17_2.string = L18_2
  L17_2.x = 100
  L17_2.y = -6
  L18_2 = {}
  L19_2 = 0.30980392156862746
  L20_2 = 0.19607843137254902
  L21_2 = 0.13725490196078433
  L18_2[1] = L19_2
  L18_2[2] = L20_2
  L18_2[3] = L21_2
  L17_2.color = L18_2
  L16_2 = L16_2(L17_2)
  L17_2 = L1_1
  L17_2 = L17_2.newText
  L18_2 = {}
  L19_2 = L1_1
  L19_2 = L19_2.localized
  L19_2 = L19_2.get
  L20_2 = "Tap to edit"
  L19_2 = L19_2(L20_2)
  L18_2.string = L19_2
  L19_2 = L16_2.x
  L18_2.x = L19_2
  L19_2 = L16_2.y
  L19_2 = L19_2 + 100
  L18_2.y = L19_2
  L19_2 = {}
  L20_2 = 0.30980392156862746
  L21_2 = 0.19607843137254902
  L22_2 = 0.13725490196078433
  L19_2[1] = L20_2
  L19_2[2] = L21_2
  L19_2[3] = L22_2
  L18_2.color = L19_2
  L17_2 = L17_2(L18_2)
  L18_2 = nil
  L19_2 = L4_2.create
  L20_2 = A1_2.emblem
  L19_2 = L19_2(L20_2)
  L20_2 = L19_2.setEmblemSize
  L21_2 = "large"
  L20_2(L21_2)
  L20_2 = L16_2.x
  L19_2.x = L20_2
  L20_2 = L16_2.y
  L20_2 = L20_2 + 40
  L19_2.y = L20_2
  L20_2 = L5_2.create
  L21_2 = A1_2
  L20_2 = L20_2(L21_2)
  L21_2 = A0_2.y
  L20_2.y = L21_2
  L21_2 = {}
  L22_2 = 0.30980392156862746
  L23_2 = 0.19607843137254902
  L24_2 = 0.13725490196078433
  L21_2[1] = L22_2
  L21_2[2] = L23_2
  L21_2[3] = L24_2
  L22_2 = L1_1
  L22_2 = L22_2.newText
  L23_2 = {}
  L23_2.string = ""
  L24_2 = L15_2.x
  L24_2 = L24_2 + 100
  L24_2 = L24_2 + 40
  L23_2.x = L24_2
  L24_2 = L15_2.y
  L23_2.y = L24_2
  L23_2.color = L21_2
  L23_2.size = 14
  L23_2.ax = 0
  L23_2.align = "center"
  L22_2 = L22_2(L23_2)
  L23_2 = display
  L23_2 = L23_2.newImageRect
  L24_2 = "images/gui/customplay/info_bubble.png"
  L25_2 = 228
  L26_2 = 53
  L23_2 = L23_2(L24_2, L25_2, L26_2)
  L24_2 = nil
  
  function L25_2()
    local L0_3, L1_3
    L0_3 = L6_2
    if L0_3 then
      return
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
    L0_3 = L24_2
    L0_3.isVisible = false
    L0_3 = L23_2
    L0_3.isVisible = false
  end
  
  function L26_2()
    local L0_3, L1_3, L2_3
    L0_3 = L24_2
    L0_3.isVisible = true
    L0_3 = L23_2
    L0_3.isVisible = true
    L0_3 = L10_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L10_2
      L0_3(L1_3)
      L0_3 = nil
      L10_2 = L0_3
    end
    L0_3 = timer
    L0_3 = L0_3.performWithDelay
    L1_3 = 2500
    L2_3 = L25_2
    L0_3 = L0_3(L1_3, L2_3)
    L10_2 = L0_3
  end
  
  L23_2.x = -100
  L23_2.y = 135
  L27_2 = L1_1
  L27_2 = L27_2.newText
  L28_2 = {}
  L29_2 = L1_1
  L29_2 = L29_2.localized
  L29_2 = L29_2.get
  L30_2 = "infoClanTypePublic"
  L29_2 = L29_2(L30_2)
  L28_2.string = L29_2
  L28_2.size = 13
  L29_2 = L23_2.x
  L28_2.x = L29_2
  L29_2 = L23_2.y
  L29_2 = L29_2 + 4
  L28_2.y = L29_2
  L28_2.ax = 0.5
  L28_2.align = "center"
  L29_2 = {}
  L30_2 = 0
  L31_2 = 0
  L32_2 = 0
  L33_2 = 0.5
  L29_2[1] = L30_2
  L29_2[2] = L31_2
  L29_2[3] = L32_2
  L29_2[4] = L33_2
  L28_2.color = L29_2
  L28_2.width = 200
  L27_2 = L27_2(L28_2)
  L24_2 = L27_2
  L27_2 = L25_2
  L27_2()
  
  function L27_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = A1_2
    L1_3 = L7_2
    L1_3 = L1_3.text
    L0_3.clanName = L1_3
    L0_3 = A1_2
    L1_3 = L8_2
    L1_3 = L1_3.text
    L0_3.clanTag = L1_3
    L0_3 = A1_2
    L1_3 = L20_2
    L1_3 = L1_3.getSelectedAttitude
    L1_3 = L1_3()
    L0_3.attitude = L1_3
    L0_3 = A1_2
    L1_3 = L20_2
    L1_3 = L1_3.getSelectedJoinRequirement
    L1_3 = L1_3()
    L0_3.openness = L1_3
    L0_3 = A1_2
    L1_3 = L20_2
    L1_3 = L1_3.getSelectedLeagueRequirement
    L1_3 = L1_3()
    L0_3.leagueRequirement = L1_3
    L0_3 = {}
    L0_3.isModal = true
    L1_3 = {}
    L0_3.params = L1_3
    L1_3 = L0_3.params
    L2_3 = A1_2
    L1_3.clanCreateTempData = L2_3
    L1_3 = L1_1
    L1_3 = L1_3.showOverlay
    L2_3 = "lua.overlays.clanEmblemEdit"
    L3_3 = L0_3
    L1_3(L2_3, L3_3)
  end
  
  L19_2.touch = L27_2
  
  function L28_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = L1_1
    L1_3 = L1_3.database
    L1_3 = L1_3.getPlayerInformation
    L1_3 = L1_3()
    if A0_3 then
      L2_3 = string
      L2_3 = L2_3.len
      L3_3 = A0_3
      L2_3 = L2_3(L3_3)
      if 0 < L2_3 then
        L2_3 = L22_2
        L3_3 = "( "
        L4_3 = A0_3
        L5_3 = "."
        L6_3 = L1_3.username
        L7_3 = " )"
        L3_3 = L3_3 .. L4_3 .. L5_3 .. L6_3 .. L7_3
        L2_3.text = L3_3
    end
    else
      L2_3 = L22_2
      L3_3 = "( "
      L4_3 = L1_3.username
      L5_3 = " )"
      L3_3 = L3_3 .. L4_3 .. L5_3
      L2_3.text = L3_3
    end
  end
  
  function L29_2(A0_3)
    local L1_3
    if not A0_3 then
      A0_3 = 1000
    end
    
    function L1_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4
      L1_4 = A0_4.text
      L2_4 = A0_4.text
      if L2_4 then
        L2_4 = string
        L2_4 = L2_4.len
        L3_4 = A0_4.text
        L2_4 = L2_4(L3_4)
        L3_4 = A0_3
        if L2_4 > L3_4 then
          L2_4 = A0_4.text
          L3_4 = L2_4
          L2_4 = L2_4.sub
          L4_4 = 1
          L5_4 = A0_3
          L2_4 = L2_4(L3_4, L4_4, L5_4)
          L1_4 = L2_4
          L2_4 = A0_4.target
          L2_4.text = L1_4
        end
      end
      L2_4 = A0_4.phase
      if "ended" == L2_4 then
      else
        L2_4 = A0_4.phase
        if "editing" == L2_4 then
          L2_4 = L28_2
          L3_4 = L1_4
          L2_4(L3_4)
        else
          L2_4 = A0_4.phase
          if "submitted" == L2_4 then
            L2_4 = native
            L2_4 = L2_4.setKeyboardFocus
            L3_4 = nil
            L2_4(L3_4)
            L2_4 = isAndroid
            if L2_4 then
              L2_4 = native
              L2_4 = L2_4.setProperty
              L3_4 = "androidSystemUiVisibility"
              L4_4 = "immersiveSticky"
              L2_4(L3_4, L4_4)
            end
          end
        end
      end
    end
    
    return L1_3
  end
  
  L30_2 = native
  L30_2 = L30_2.newTextField
  L31_2 = display
  L31_2 = L31_2.contentWidth
  L31_2 = L31_2 * 4
  L32_2 = display
  L32_2 = L32_2.contentHeight
  L32_2 = L32_2 * 0.2
  L33_2 = 150
  L34_2 = L13_2
  L30_2 = L30_2(L31_2, L32_2, L33_2, L34_2)
  L7_2 = L30_2
  L7_2.anchorX = 0
  L7_2.anchorY = 0.5
  L30_2 = L14_2.x
  L30_2 = L30_2 + 60
  L7_2.x = L30_2
  L30_2 = L14_2.y
  L7_2.y = L30_2
  L30_2 = L1_1
  L30_2 = L30_2.validateInput
  L30_2 = L30_2.limitTextField
  L31_2 = 15
  L30_2 = L30_2(L31_2)
  L7_2.userInput = L30_2
  L30_2 = A1_2.clanName
  if not L30_2 then
    L30_2 = ""
  end
  L7_2.text = L30_2
  L31_2 = L7_2
  L30_2 = L7_2.addEventListener
  L32_2 = "userInput"
  L33_2 = L7_2.userInput
  L30_2(L31_2, L32_2, L33_2)
  L30_2 = native
  L30_2 = L30_2.newTextField
  L31_2 = display
  L31_2 = L31_2.contentWidth
  L31_2 = L31_2 * 4
  L32_2 = display
  L32_2 = L32_2.contentHeight
  L32_2 = L32_2 * 0.2
  L33_2 = 50
  L34_2 = L13_2
  L30_2 = L30_2(L31_2, L32_2, L33_2, L34_2)
  L8_2 = L30_2
  L8_2.anchorX = 0
  L7_2.anchorY = 0.5
  L30_2 = L15_2.x
  L30_2 = L30_2 + 60
  L8_2.x = L30_2
  L30_2 = L15_2.y
  L8_2.y = L30_2
  L30_2 = L29_2
  L31_2 = 4
  L30_2 = L30_2(L31_2)
  L8_2.userInput = L30_2
  L30_2 = A1_2.clanTag
  if not L30_2 then
    L30_2 = ""
  end
  L8_2.text = L30_2
  L31_2 = L8_2
  L30_2 = L8_2.addEventListener
  L32_2 = "userInput"
  L33_2 = L8_2.userInput
  L30_2(L31_2, L32_2, L33_2)
  L30_2 = L28_2
  L31_2 = L8_2.text
  L30_2(L31_2)
  
  function L30_2(A0_3)
    local L1_3
    L1_3 = L7_2
    L1_3.isVisible = A0_3
    L1_3 = L8_2
    L1_3.isVisible = A0_3
  end
  
  L2_2.showInputFields = L30_2
  
  function L31_2()
    local L0_3, L1_3
    L0_3 = L7_2
    L0_3 = L0_3.text
    return L0_3
  end
  
  L2_2.getClanName = L31_2
  
  function L32_2()
    local L0_3, L1_3
    L0_3 = L8_2
    L0_3 = L0_3.text
    return L0_3
  end
  
  L2_2.getClanTag = L32_2
  
  function L33_2()
    local L0_3, L1_3
    L0_3 = L20_2
    L0_3 = L0_3.getSelectedJoinRequirement
    L0_3 = L0_3()
    L0_3 = L0_3 == 1
    return L0_3
  end
  
  L2_2.getClanOpen = L33_2
  
  function L34_2()
    local L0_3, L1_3
    L0_3 = A1_2
    L0_3 = L0_3.emblem
    return L0_3
  end
  
  L2_2.getEmblem = L34_2
  
  function L35_2()
    local L0_3, L1_3
    L0_3 = L20_2
    L0_3 = L0_3.getSelectedLeagueRequirement
    L0_3 = L0_3()
    return L0_3
  end
  
  L2_2.getRequiredLeague = L35_2
  
  function L36_2()
    local L0_3, L1_3
    L0_3 = L20_2
    L0_3 = L0_3.getSelectedAttitude
    return L0_3()
  end
  
  L2_2.getAttitude = L36_2
  
  function L37_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L19_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L17_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L23_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L24_2
    L0_3(L1_3, L2_3)
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
    L2_3 = L16_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L20_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L22_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L3_2
    L0_3(L1_3, L2_3)
  end
  
  function L38_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = true
    L6_2 = L0_3
    L0_3 = L19_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L19_2
    L3_3 = L3_3.touch
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "userInput"
    L3_3 = L7_2
    L3_3 = L3_3.userInput
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "userInput"
    L3_3 = L8_2
    L3_3 = L3_3.userInput
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L10_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L10_2
      L0_3(L1_3)
      L0_3 = nil
      L10_2 = L0_3
    end
  end
  
  L2_2.clean = L38_2
  L40_2 = L19_2
  L39_2 = L19_2.addEventListener
  L41_2 = "touch"
  L42_2 = L19_2.touch
  L39_2(L40_2, L41_2, L42_2)
  L39_2 = L37_2
  L39_2()
  return L2_2
end

L0_1.create = L2_1
return L0_1
