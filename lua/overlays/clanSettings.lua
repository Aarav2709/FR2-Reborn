local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2
  L2_2 = require
  L3_2 = "lua.network.tcpMessageFormat"
  L2_2 = L2_2(L3_2)
  L3_2 = A0_2.view
  L4_2 = A1_2.params
  L4_2 = L4_2.clanData
  if not L4_2 then
    L4_2 = {}
  end
  L5_2 = L0_1
  L5_2 = L5_2.clanUtils
  L5_2 = L5_2.getClanStateEditData
  L5_2 = L5_2()
  L6_2 = false
  L7_2 = display
  L7_2 = L7_2.newGroup
  L7_2 = L7_2()
  L8_2 = display
  L8_2 = L8_2.newImageRect
  L9_2 = "images/gui/clan_v2/create_clan/editWindow.png"
  L10_2 = 320
  L11_2 = 262
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L8_2.anchorX = 0.5
  L8_2.anchorY = 0
  L9_2 = display
  L9_2 = L9_2.contentWidth
  L9_2 = L9_2 * 0.5
  L8_2.x = L9_2
  L8_2.y = 0
  L9_2 = display
  L9_2 = L9_2.newRect
  L10_2 = 0
  L11_2 = 0
  L12_2 = display
  L12_2 = L12_2.contentWidth
  L13_2 = display
  L13_2 = L13_2.contentHeight
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
  L9_2.anchorX = 0
  L9_2.anchorY = 0
  L11_2 = L9_2
  L10_2 = L9_2.setFillColor
  L12_2 = 0
  L13_2 = 0
  L14_2 = 0
  L15_2 = 0.5882352941176471
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
  L9_2.x = 0
  L9_2.y = 0
  L10_2 = L0_1
  L10_2 = L10_2.newText
  L11_2 = {}
  L12_2 = L0_1
  L12_2 = L12_2.localized
  L12_2 = L12_2.get
  L13_2 = "Clan Settings"
  L12_2 = L12_2(L13_2)
  L11_2.string = L12_2
  L12_2 = L8_2.x
  L11_2.x = L12_2
  L12_2 = L8_2.y
  L12_2 = L12_2 + 78
  L11_2.y = L12_2
  L11_2.size = 20
  L12_2 = {}
  L13_2 = 1
  L14_2 = 1
  L15_2 = 1
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L12_2[3] = L15_2
  L11_2.color = L12_2
  L11_2.align = "center"
  L10_2 = L10_2(L11_2)
  L11_2 = L0_1
  L11_2 = L11_2.newText
  L12_2 = {}
  L13_2 = L0_1
  L13_2 = L13_2.localized
  L13_2 = L13_2.get
  L14_2 = "Emblem"
  L13_2 = L13_2(L14_2)
  L12_2.string = L13_2
  L13_2 = L8_2.x
  L13_2 = L13_2 + 100
  L12_2.x = L13_2
  L13_2 = L8_2.y
  L14_2 = L8_2.height
  L14_2 = L14_2 * 0.5
  L13_2 = L13_2 + L14_2
  L13_2 = L13_2 - 26
  L12_2.y = L13_2
  L13_2 = {}
  L14_2 = 0.30980392156862746
  L15_2 = 0.19607843137254902
  L16_2 = 0.13725490196078433
  L13_2[1] = L14_2
  L13_2[2] = L15_2
  L13_2[3] = L16_2
  L12_2.color = L13_2
  L11_2 = L11_2(L12_2)
  L12_2 = L0_1
  L12_2 = L12_2.newText
  L13_2 = {}
  L14_2 = L0_1
  L14_2 = L14_2.localized
  L14_2 = L14_2.get
  L15_2 = "Tap to edit"
  L14_2 = L14_2(L15_2)
  L13_2.string = L14_2
  L14_2 = L11_2.x
  L13_2.x = L14_2
  L14_2 = L11_2.y
  L14_2 = L14_2 + 100
  L13_2.y = L14_2
  L14_2 = {}
  L15_2 = 0.30980392156862746
  L16_2 = 0.19607843137254902
  L17_2 = 0.13725490196078433
  L14_2[1] = L15_2
  L14_2[2] = L16_2
  L14_2[3] = L17_2
  L13_2.color = L14_2
  L12_2 = L12_2(L13_2)
  L13_2 = L0_1
  L13_2 = L13_2.newText
  L14_2 = {}
  L14_2.string = ""
  L15_2 = L8_2.x
  L14_2.x = L15_2
  L15_2 = L8_2.y
  L16_2 = L8_2.height
  L15_2 = L15_2 + L16_2
  L15_2 = L15_2 - 40
  L14_2.y = L15_2
  L14_2.size = 10
  L15_2 = {}
  L16_2 = 0.30980392156862746
  L17_2 = 0.19607843137254902
  L18_2 = 0.13725490196078433
  L15_2[1] = L16_2
  L15_2[2] = L17_2
  L15_2[3] = L18_2
  L14_2.color = L15_2
  L13_2 = L13_2(L14_2)
  L14_2 = require
  L15_2 = "lua.modules.clans.clanEmblem"
  L14_2 = L14_2(L15_2)
  L15_2 = L14_2.create
  L16_2 = L4_2.emblem
  L15_2 = L15_2(L16_2)
  L16_2 = L15_2.setEmblemSize
  L17_2 = "large"
  L16_2(L17_2)
  L16_2 = L11_2.x
  L15_2.x = L16_2
  L16_2 = L11_2.y
  L16_2 = L16_2 + 40
  L15_2.y = L16_2
  
  function L16_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_3.m
    L2_3 = L2_2
    L2_3 = L2_3.setClanState
    L2_3 = L2_3()
    if L1_3 == L2_3 then
      L1_3 = A0_3.r
      if L1_3 then
        L1_3 = tonumber
        L2_3 = A0_3.r
        L1_3 = L1_3(L2_3)
        if L1_3 == 24 then
          L1_3 = L13_2
          L2_3 = L0_1
          L2_3 = L2_3.localized
          L2_3 = L2_3.get
          L3_3 = "Not enough gems."
          L2_3 = L2_3(L3_3)
          L1_3.text = L2_3
        else
          L1_3 = L13_2
          L2_3 = L0_1
          L2_3 = L2_3.localized
          L2_3 = L2_3.get
          L3_3 = "Something went wrong."
          L2_3 = L2_3(L3_3)
          L1_3.text = L2_3
        end
      else
        L1_3 = L0_1
        L1_3 = L1_3.hideOverlay
        L1_3()
      end
    end
    L1_3 = true
    L6_2 = L1_3
  end
  
  L17_2 = require
  L18_2 = "lua.modules.clans.clanEditableSettingsUI"
  L17_2 = L17_2(L18_2)
  L18_2 = L17_2.create
  L19_2 = L4_2
  L18_2 = L18_2(L19_2)
  L19_2 = L8_2.x
  L18_2.x = L19_2
  L19_2 = L8_2.y
  L20_2 = L8_2.height
  L20_2 = L20_2 * 0.5
  L19_2 = L19_2 + L20_2
  L19_2 = L19_2 - 16
  L18_2.y = L19_2
  
  function L19_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L6_2
    if not L0_3 then
      return
    end
    L0_3 = L4_2
    L1_3 = L18_2
    L1_3 = L1_3.getSelectedAttitude
    L1_3 = L1_3()
    L0_3.attitude = L1_3
    L0_3 = L4_2
    L1_3 = L18_2
    L1_3 = L1_3.getSelectedJoinRequirement
    L1_3 = L1_3()
    L0_3.openness = L1_3
    L0_3 = L4_2
    L1_3 = L18_2
    L1_3 = L1_3.getSelectedLeagueRequirement
    L1_3 = L1_3()
    L0_3.leagueRequirement = L1_3
    L0_3 = {}
    L0_3.isModal = true
    L1_3 = {}
    L0_3.params = L1_3
    L1_3 = L0_3.params
    L1_3.edit = true
    L1_3 = L0_3.params
    L2_3 = L4_2
    L1_3.clanCreateTempData = L2_3
    L1_3 = L0_1
    L1_3 = L1_3.showOverlay
    L2_3 = "lua.overlays.clanEmblemEdit"
    L3_3 = L0_3
    L1_3(L2_3, L3_3)
  end
  
  L15_2.touch = L19_2
  
  function L20_2()
    local L0_3, L1_3
    L0_3 = L4_2
    L0_3 = L0_3.emblem
    L0_3 = L0_3.a
    L1_3 = L5_2
    L1_3 = L1_3.emblem
    L1_3 = L1_3.a
    L0_3 = L0_3 ~= L1_3
    return L0_3
  end
  
  function L21_2()
    local L0_3, L1_3
    L0_3 = L4_2
    L1_3 = L18_2
    L1_3 = L1_3.getSelectedAttitude
    L1_3 = L1_3()
    L0_3.attitude = L1_3
    L0_3 = L4_2
    L1_3 = L18_2
    L1_3 = L1_3.getSelectedJoinRequirement
    L1_3 = L1_3()
    L0_3.openness = L1_3
    L0_3 = L4_2
    L1_3 = L18_2
    L1_3 = L1_3.getSelectedLeagueRequirement
    L1_3 = L1_3()
    L0_3.leagueRequirement = L1_3
    L0_3 = L20_2
    L0_3 = L0_3()
    if not L0_3 then
      L0_3 = L4_2
      L0_3 = L0_3.leagueRequirement
      L1_3 = L5_2
      L1_3 = L1_3.leagueRequirement
      L0_3 = L0_3 ~= L1_3
    end
    return L0_3
  end
  
  function L22_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  function L23_2(A0_3)
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
  
  function L24_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
    end
    L1_3 = true
    return L1_3
  end
  
  L25_2 = L0_1
  L25_2 = L25_2.newButton
  L26_2 = {}
  L26_2.x = 382
  L26_2.y = 90
  L26_2.width = 43
  L26_2.height = 38
  L26_2.image = "images/gui/common/buttonClosePopupBrown.png"
  L26_2.onRelease = L22_2
  L25_2 = L25_2(L26_2)
  
  function L26_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L0_3 = L21_2
    L0_3 = L0_3()
    if L0_3 then
      L0_3 = L20_2
      L0_3 = L0_3()
      if L0_3 then
        L0_3 = L0_1
        L0_3 = L0_3.database
        L0_3 = L0_3.getGem
        L0_3 = L0_3()
        L1_3 = L0_1
        L1_3 = L1_3.storeConfig
        L1_3 = L1_3.getChangeClanEmblemPrice
        L1_3 = L1_3()
        if L0_3 < L1_3 then
          L2_3 = L13_2
          L3_3 = L0_1
          L3_3 = L3_3.localized
          L3_3 = L3_3.get
          L4_3 = "Not enough gems."
          L3_3 = L3_3(L4_3)
          L2_3.text = L3_3
          return
        end
        L2_3 = L0_1
        L2_3 = L2_3.analytics
        L2_3 = L2_3.addResourceEvent
        L3_3 = "Sink"
        L4_3 = "gem"
        L5_3 = L1_3
        L6_3 = "misc"
        L7_3 = "clanEmblem"
        L2_3(L3_3, L4_3, L5_3, L6_3, L7_3)
      end
      L0_3 = L18_2
      L0_3 = L0_3.getSelectedJoinRequirement
      L0_3 = L0_3()
      L0_3 = L0_3 == 1
      L1_3 = L18_2
      L1_3 = L1_3.getSelectedLeagueRequirement
      L1_3 = L1_3()
      L2_3 = L18_2
      L2_3 = L2_3.getSelectedAttitude
      L2_3 = L2_3()
      L3_3 = L4_2
      L3_3 = L3_3.emblem
      L4_3 = false
      L6_2 = L4_3
      L4_3 = L13_2
      L5_3 = L0_1
      L5_3 = L5_3.localized
      L5_3 = L5_3.get
      L6_3 = "Please wait."
      L5_3 = L5_3(L6_3)
      L4_3.text = L5_3
      L4_3 = L0_1
      L4_3 = L4_3.comm
      L4_3 = L4_3.setClanState
      L5_3 = L0_3
      L6_3 = L1_3
      L7_3 = L2_3
      L8_3 = L3_3
      L4_3(L5_3, L6_3, L7_3, L8_3)
      L4_3 = L0_1
      L4_3 = L4_3.data
      L4_3 = L4_3.clans
      L4_3.requirement = L1_3
    else
      L0_3 = L13_2
      L1_3 = L0_1
      L1_3 = L1_3.localized
      L1_3 = L1_3.get
      L2_3 = "No changes made."
      L1_3 = L1_3(L2_3)
      L0_3.text = L1_3
    end
  end
  
  L27_2 = L0_1
  L27_2 = L27_2.newButton
  L28_2 = {}
  L29_2 = L8_2.x
  L28_2.x = L29_2
  L29_2 = L8_2.y
  L30_2 = L8_2.height
  L29_2 = L29_2 + L30_2
  L29_2 = L29_2 - 10
  L28_2.y = L29_2
  L28_2.width = 126
  L28_2.height = 40
  L29_2 = {}
  L30_2 = L0_1
  L30_2 = L30_2.localized
  L30_2 = L30_2.get
  L31_2 = "Save"
  L30_2 = L30_2(L31_2)
  L29_2.string = L30_2
  L29_2.size = 14
  L28_2.text = L29_2
  L28_2.image = "images/gui/common/buttonTextB.png"
  L28_2.onRelease = L26_2
  L27_2 = L27_2(L28_2)
  L28_2 = L0_1
  L28_2 = L28_2.newButton
  L29_2 = {}
  L30_2 = L8_2.x
  L29_2.x = L30_2
  L30_2 = L8_2.y
  L31_2 = L8_2.height
  L30_2 = L30_2 + L31_2
  L30_2 = L30_2 - 10
  L29_2.y = L30_2
  L29_2.width = 77
  L29_2.height = 50
  L30_2 = {}
  L31_2 = L0_1
  L31_2 = L31_2.storeConfig
  L31_2 = L31_2.getChangeClanEmblemPrice
  L31_2 = L31_2()
  L30_2.string = L31_2
  L30_2.size = 14
  L30_2.x = 0
  L30_2.y = 8
  L29_2.text = L30_2
  L29_2.image = "images/gui/market/popup/buttonGems.png"
  L29_2.onRelease = L26_2
  L28_2 = L28_2(L29_2)
  L28_2.isVisible = false
  
  function L29_2()
    local L0_3, L1_3, L2_3
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L9_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L25_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L10_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L27_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L28_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L13_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L11_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L12_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L18_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L0_3(L1_3, L2_3)
  end
  
  function L30_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = true
    L6_2 = L0_3
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L23_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L24_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L15_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L15_2
    L3_3 = L3_3.touch
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L31_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L25_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L27_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L28_2
    L0_3(L1_3)
    L0_3 = L15_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L15_2
    L3_3 = L3_3.touch
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L9_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L23_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L8_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L24_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L31_2
  L31_2 = L29_2
  L31_2()
  L31_2 = L30_2
  L31_2()
  L31_2 = A1_2.params
  L31_2 = L31_2.openFromClanHub
  if L31_2 then
    L31_2 = L0_1
    L31_2 = L31_2.bouncer
    L31_2 = L31_2.down
    L32_2 = L7_2
    L31_2(L32_2)
  end
  L31_2 = L20_2
  L31_2 = L31_2()
  if L31_2 then
    L28_2.isVisible = true
    L27_2.isVisible = false
  end
  L31_2 = L0_1
  L31_2 = L31_2.comm
  L31_2 = L31_2.setCallback
  L32_2 = L16_2
  L31_2(L32_2)
end

L1_1.create = L4_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2.phase
  if L2_2 == "will" then
    return
  end
  L3_2 = A0_2.view
  L4_2 = require
  L5_2 = "lua.modules.androidBackButton"
  L4_2 = L4_2(L5_2)
  
  function L5_2()
    local L0_3, L1_3
    L0_3 = L4_2
    L0_3 = L0_3.isOverlay
    L1_3 = false
    L0_3(L1_3)
  end
  
  L3_1 = L5_2
  L5_2 = L4_2.isOverlay
  L6_2 = true
  L5_2(L6_2)
end

L1_1.show = L4_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2.phase
  if L2_2 == "did" then
    L3_2 = A1_2.parent
    if L3_2 then
      L3_2 = A1_2.parent
      L3_2 = L3_2.overlayEnded
      if L3_2 then
        L3_2 = A1_2.parent
        L4_2 = L3_2
        L3_2 = L3_2.overlayEnded
        L3_2(L4_2)
      end
    end
    return
  end
  L3_2 = A0_2.view
  L4_2 = L3_1
  L4_2()
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
