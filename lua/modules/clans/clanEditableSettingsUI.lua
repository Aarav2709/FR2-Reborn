local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L1_2 = display
  L1_2 = L1_2.newGroup
  L1_2 = L1_2()
  L2_2 = require
  L3_2 = "lua.modules.uiElements.optionPicker"
  L2_2 = L2_2(L3_2)
  L3_2 = {}
  L3_2.isText = true
  L4_2 = L1_1
  L4_2 = L4_2.clanUtils
  L4_2 = L4_2.clanAttitudeTypes
  L3_2.optionsList = L4_2
  L4_2 = A0_2.attitude
  L3_2.defaultSelected = L4_2
  L3_2.middleSpace = 60
  L4_2 = L2_2.create
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L4_2.x = -50
  L4_2.y = 0
  L5_2 = {}
  L5_2.isImage = true
  L6_2 = {}
  L7_2 = 1
  L8_2 = 2
  L9_2 = 3
  L10_2 = 4
  L11_2 = 5
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L6_2[4] = L10_2
  L6_2[5] = L11_2
  L5_2.optionsList = L6_2
  L6_2 = A0_2.leagueRequirement
  if not L6_2 then
    L6_2 = 5
  end
  L5_2.defaultSelected = L6_2
  L5_2.imagePath = "images/gui/ranking/league/tierB_"
  L5_2.width = 41.5
  L5_2.height = 40.5
  L5_2.middleSpace = 60
  L6_2 = L2_2.create
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L6_2.x = -50
  L6_2.y = 80
  L7_2 = {}
  L8_2 = "Open"
  L9_2 = "Invite Only"
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  
  function L8_2(A0_3)
    local L1_3, L2_3
    if A0_3 == 1 then
      L1_3 = L6_2
      L1_3 = L1_3.setInteractable
      L2_3 = true
      L1_3(L2_3)
    else
      L1_3 = L6_2
      L1_3 = L1_3.setInteractable
      L2_3 = false
      L1_3(L2_3)
    end
  end
  
  L9_2 = {}
  L9_2.isText = true
  L9_2.optionsList = L7_2
  L10_2 = A0_2.openness
  L9_2.defaultSelected = L10_2
  L9_2.middleSpace = 60
  L9_2.callback = L8_2
  L10_2 = L2_2.create
  L11_2 = L9_2
  L10_2 = L10_2(L11_2)
  L10_2.x = -50
  L10_2.y = 40
  
  function L11_2()
    local L0_3, L1_3
    L0_3 = L4_2
    L0_3 = L0_3.getSelectedOption
    return L0_3()
  end
  
  L1_2.getSelectedAttitude = L11_2
  
  function L11_2()
    local L0_3, L1_3
    L0_3 = L6_2
    L0_3 = L0_3.getSelectedOption
    return L0_3()
  end
  
  L1_2.getSelectedLeagueRequirement = L11_2
  
  function L11_2()
    local L0_3, L1_3
    L0_3 = L10_2
    L0_3 = L0_3.getSelectedOption
    return L0_3()
  end
  
  L1_2.getSelectedJoinRequirement = L11_2
  L12_2 = L1_2
  L11_2 = L1_2.insert
  L13_2 = L4_2
  L11_2(L12_2, L13_2)
  L12_2 = L1_2
  L11_2 = L1_2.insert
  L13_2 = L6_2
  L11_2(L12_2, L13_2)
  L12_2 = L1_2
  L11_2 = L1_2.insert
  L13_2 = L10_2
  L11_2(L12_2, L13_2)
  L11_2 = require
  L12_2 = "lua.modules.uiElements.informationBubble"
  L11_2 = L11_2(L12_2)
  L12_2 = L11_2.create
  L12_2 = L12_2()
  
  function L13_2()
    local L0_3, L1_3, L2_3
    L0_3 = L12_2
    L0_3 = L0_3.interact
    L1_3 = {}
    L1_3.text = "Lets potential members see what kind of players are wanted in the clan"
    L2_3 = L4_2
    L2_3 = L2_3.x
    L1_3.x = L2_3
    L2_3 = L4_2
    L2_3 = L2_3.y
    L2_3 = L2_3 + 40
    L1_3.y = L2_3
    L0_3(L1_3)
  end
  
  function L14_2()
    local L0_3, L1_3, L2_3
    L0_3 = L12_2
    L0_3 = L0_3.interact
    L1_3 = {}
    L1_3.text = [[
Open - Anyone can join
Invite Only - Members must be invited]]
    L2_3 = L10_2
    L2_3 = L2_3.x
    L1_3.x = L2_3
    L2_3 = L10_2
    L2_3 = L2_3.y
    L2_3 = L2_3 + 40
    L1_3.y = L2_3
    L0_3(L1_3)
  end
  
  function L15_2()
    local L0_3, L1_3, L2_3
    L0_3 = L12_2
    L0_3 = L0_3.interact
    L1_3 = {}
    L1_3.text = "Open Clans can set a minimum league requirement for members that can join"
    L2_3 = L6_2
    L2_3 = L2_3.x
    L1_3.x = L2_3
    L2_3 = L6_2
    L2_3 = L2_3.y
    L2_3 = L2_3 + 40
    L1_3.y = L2_3
    L0_3(L1_3)
  end
  
  L16_2 = L1_1
  L16_2 = L16_2.newButton
  L17_2 = {}
  L18_2 = L4_2.x
  L18_2 = L18_2 - 110
  L17_2.x = L18_2
  L18_2 = L4_2.y
  L17_2.y = L18_2
  L17_2.width = 25
  L17_2.height = 25
  L17_2.image = "images/gui/clan_v2/create_clan/buttonInfo.png"
  L17_2.onRelease = L13_2
  L16_2 = L16_2(L17_2)
  L17_2 = L1_1
  L17_2 = L17_2.newButton
  L18_2 = {}
  L19_2 = L10_2.x
  L19_2 = L19_2 - 110
  L18_2.x = L19_2
  L19_2 = L10_2.y
  L18_2.y = L19_2
  L18_2.width = 25
  L18_2.height = 25
  L18_2.image = "images/gui/clan_v2/create_clan/buttonInfo.png"
  L18_2.onRelease = L14_2
  L17_2 = L17_2(L18_2)
  L18_2 = L1_1
  L18_2 = L18_2.newButton
  L19_2 = {}
  L20_2 = L6_2.x
  L20_2 = L20_2 - 110
  L19_2.x = L20_2
  L20_2 = L6_2.y
  L19_2.y = L20_2
  L19_2.width = 25
  L19_2.height = 25
  L19_2.image = "images/gui/clan_v2/create_clan/buttonInfo.png"
  L19_2.onRelease = L15_2
  L18_2 = L18_2(L19_2)
  L20_2 = L1_2
  L19_2 = L1_2.insert
  L21_2 = L12_2
  L19_2(L20_2, L21_2)
  L20_2 = L1_2
  L19_2 = L1_2.insert
  L21_2 = L16_2
  L19_2(L20_2, L21_2)
  L20_2 = L1_2
  L19_2 = L1_2.insert
  L21_2 = L17_2
  L19_2(L20_2, L21_2)
  L20_2 = L1_2
  L19_2 = L1_2.insert
  L21_2 = L18_2
  L19_2(L20_2, L21_2)
  return L1_2
end

L0_1.create = L2_1
return L0_1
