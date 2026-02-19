local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2
  L2_2 = A0_2.view
  L3_2 = display
  L3_2 = L3_2.newGroup
  L3_2 = L3_2()
  L4_2 = require
  L5_2 = "lua.network.tcpMessageFormat"
  L4_2 = L4_2(L5_2)
  L5_2 = require
  L6_2 = "lua.modules.currencyDisplay"
  L5_2 = L5_2(L6_2)
  L6_2 = display
  L6_2 = L6_2.newGroup
  L6_2 = L6_2()
  L7_2 = nil
  L8_2 = true
  L9_2 = A1_2.params
  if not L9_2 then
    L9_2 = {}
    A1_2.params = L9_2
  end
  L9_2 = A1_2.params
  L9_2 = L9_2.clanCreateTempData
  if not L9_2 then
    L9_2 = {}
  end
  L10_2 = L0_1
  L10_2 = L10_2.clanUtils
  L10_2 = L10_2.getDefaultClanEmblem
  L10_2 = L10_2()
  L9_2.emble = L10_2
  L10_2 = L0_1
  L10_2 = L10_2.storeConfig
  L10_2 = L10_2.getCreateClanPrice
  L10_2 = L10_2()
  L11_2 = display
  L11_2 = L11_2.newImageRect
  L12_2 = "images/gui/common/black.png"
  L13_2 = 480
  L14_2 = 320
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L12_2 = display
  L12_2 = L12_2.contentWidth
  L12_2 = L12_2 * 0.5
  L11_2.x = L12_2
  L12_2 = display
  L12_2 = L12_2.contentHeight
  L12_2 = L12_2 * 0.5
  L11_2.y = L12_2
  L12_2 = display
  L12_2 = L12_2.newImageRect
  L13_2 = "images/gui/clan_v2/create_clan/createWindow.png"
  L14_2 = 321
  L15_2 = 262
  L12_2 = L12_2(L13_2, L14_2, L15_2)
  L13_2 = display
  L13_2 = L13_2.contentWidth
  L13_2 = L13_2 * 0.5
  L12_2.x = L13_2
  L12_2.anchorY = 0
  L12_2.y = 0
  L13_2 = L12_2.y
  L14_2 = L12_2.height
  L14_2 = L14_2 * 0.5
  L13_2 = L13_2 + L14_2
  L14_2 = require
  L15_2 = "lua.modules.clans.clanCreateUI"
  L14_2 = L14_2(L15_2)
  L15_2 = L14_2.create
  L16_2 = L12_2
  L17_2 = L9_2
  L15_2 = L15_2(L16_2, L17_2)
  L16_2 = L12_2.x
  L15_2.x = L16_2
  L15_2.y = L13_2
  L16_2 = L5_2.create
  L16_2 = L16_2()
  L16_2.x = 8
  L17_2 = L0_1
  L17_2 = L17_2.newText
  L18_2 = {}
  L19_2 = L0_1
  L19_2 = L19_2.localized
  L19_2 = L19_2.get
  L20_2 = "Create Clan"
  L19_2 = L19_2(L20_2)
  L18_2.string = L19_2
  L19_2 = L12_2.x
  L18_2.x = L19_2
  L19_2 = L12_2.y
  L19_2 = L19_2 + 18
  L18_2.y = L19_2
  L18_2.size = 25
  L19_2 = {}
  L20_2 = 1
  L21_2 = 1
  L22_2 = 1
  L19_2[1] = L20_2
  L19_2[2] = L21_2
  L19_2[3] = L22_2
  L18_2.color = L19_2
  L18_2.align = "center"
  L17_2 = L17_2(L18_2)
  L18_2 = L0_1
  L18_2 = L18_2.newText
  L19_2 = {}
  L19_2.string = ""
  L20_2 = L12_2.x
  L19_2.x = L20_2
  L20_2 = L15_2.y
  L20_2 = L20_2 + 170
  L19_2.y = L20_2
  L20_2 = {}
  L21_2 = 1
  L22_2 = 1
  L23_2 = 1
  L20_2[1] = L21_2
  L20_2[2] = L22_2
  L20_2[3] = L23_2
  L19_2.color = L20_2
  L18_2 = L18_2(L19_2)
  
  function L19_2()
    local L0_3, L1_3
    L0_3 = L7_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L7_2
      L0_3(L1_3)
      L0_3 = nil
      L7_2 = L0_3
    end
  end
  
  function L20_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = {}
    L1_3 = {}
    L1_3.doDropdownEffect = false
    L0_3.params = L1_3
    L0_3.isModal = true
    L1_3 = L0_1
    L1_3 = L1_3.showOverlay
    L2_3 = "lua.overlays.clanIntroduction"
    L3_3 = L0_3
    L1_3(L2_3, L3_3)
  end
  
  L21_2 = L0_1
  L21_2 = L21_2.newButton
  L22_2 = {}
  L23_2 = L12_2.x
  L23_2 = L23_2 - 150
  L22_2.x = L23_2
  L23_2 = L12_2.y
  L23_2 = L23_2 + 22
  L22_2.y = L23_2
  L22_2.width = 43
  L22_2.height = 39
  L22_2.image = "images/gui/ranking/friendsToggle2.png"
  L22_2.onRelease = L20_2
  L21_2 = L21_2(L22_2)
  
  function L22_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_3.m
    L2_3 = L4_2
    L2_3 = L2_3.createClan
    L2_3 = L2_3()
    if L1_3 == L2_3 then
      L1_3 = true
      L8_2 = L1_3
      L1_3 = L19_2
      L1_3()
      L1_3 = A0_3.r
      if L1_3 then
        L1_3 = A0_3.r
        if L1_3 == 84 then
          L1_3 = L18_2
          L2_3 = L0_1
          L2_3 = L2_3.localized
          L2_3 = L2_3.get
          L3_3 = "NameTaken"
          L2_3 = L2_3(L3_3)
          L1_3.text = L2_3
        else
          L1_3 = A0_3.r
          if L1_3 == 85 then
            L1_3 = L18_2
            L2_3 = L0_1
            L2_3 = L2_3.localized
            L2_3 = L2_3.get
            L3_3 = "TagTaken"
            L2_3 = L2_3(L3_3)
            L1_3.text = L2_3
          else
            L1_3 = A0_3.r
            if L1_3 == 86 then
              L1_3 = L18_2
              L2_3 = L0_1
              L2_3 = L2_3.localized
              L2_3 = L2_3.get
              L3_3 = "ErrorTryAgain"
              L2_3 = L2_3(L3_3)
              L1_3.text = L2_3
            else
              L1_3 = A0_3.r
              if L1_3 == 87 then
                L1_3 = L18_2
                L2_3 = L0_1
                L2_3 = L2_3.localized
                L2_3 = L2_3.get
                L3_3 = "InvalidName"
                L2_3 = L2_3(L3_3)
                L1_3.text = L2_3
              else
                L1_3 = A0_3.r
                if L1_3 == 88 then
                  L1_3 = L18_2
                  L2_3 = L0_1
                  L2_3 = L2_3.localized
                  L2_3 = L2_3.get
                  L3_3 = "InvalidTag"
                  L2_3 = L2_3(L3_3)
                  L1_3.text = L2_3
                else
                  L1_3 = A0_3.r
                  if L1_3 == 115 then
                    L1_3 = L18_2
                    L2_3 = L0_1
                    L2_3 = L2_3.localized
                    L2_3 = L2_3.get
                    L3_3 = "NotEnoughCoins"
                    L2_3 = L2_3(L3_3)
                    L1_3.text = L2_3
                  else
                    L1_3 = A0_3.r
                    if L1_3 == 119 then
                      L1_3 = L18_2
                      L2_3 = L0_1
                      L2_3 = L2_3.localized
                      L2_3 = L2_3.get
                      L3_3 = "AlreadyInClan"
                      L2_3 = L2_3(L3_3)
                      L1_3.text = L2_3
                    else
                      L1_3 = L18_2
                      L2_3 = L0_1
                      L2_3 = L2_3.localized
                      L2_3 = L2_3.get
                      L3_3 = "ErrorTryLater"
                      L2_3 = L2_3(L3_3)
                      L1_3.text = L2_3
                    end
                  end
                end
              end
            end
          end
        end
        return
      end
      L1_3 = L0_1
      L1_3 = L1_3.gotoScene
      L2_3 = "lua.scenes.clanScene"
      L1_3(L2_3)
      L1_3 = L0_1
      L1_3 = L1_3.hideOverlay
      L1_3()
    end
  end
  
  function L23_2()
    local L0_3, L1_3, L2_3
    L0_3 = true
    L8_2 = L0_3
    L0_3 = L18_2
    L1_3 = L0_1
    L1_3 = L1_3.localized
    L1_3 = L1_3.get
    L2_3 = "Could not connect to server"
    L1_3 = L1_3(L2_3)
    L0_3.text = L1_3
  end
  
  function L24_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L0_1
    L0_3 = L0_3.database
    L0_3 = L0_3.getMoney
    L0_3 = L0_3()
    L1_3 = L10_2
    if L1_3 then
      L1_3 = L10_2
      if L0_3 >= L1_3 then
        L1_3 = L0_1
        L1_3 = L1_3.analytics
        L1_3 = L1_3.newEvent
        L2_3 = "design"
        L3_3 = {}
        L3_3.event_id = "clans:create:coins"
        L4_3 = L0_1
        L4_3 = L4_3.config
        L4_3 = L4_3.fullVersion
        L3_3.area = L4_3
        L3_3.value = L0_3
        L1_3(L2_3, L3_3)
        L1_3 = true
        return L1_3
    end
    else
      L1_3 = L16_2
      L1_3 = L1_3.giveCoinFeedback
      L1_3()
      L1_3 = L18_2
      L2_3 = L0_1
      L2_3 = L2_3.localized
      L2_3 = L2_3.get
      L3_3 = "NotEnoughCoins"
      L2_3 = L2_3(L3_3)
      L1_3.text = L2_3
      L1_3 = false
      return L1_3
    end
  end
  
  function L25_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3
    L0_3 = L8_2
    if not L0_3 then
      return
    end
    L0_3 = L24_2
    L0_3 = L0_3()
    if not L0_3 then
      return
    end
    L0_3 = L0_1
    L0_3 = L0_3.validateInput
    L0_3 = L0_3.validateClanName
    L1_3 = L15_2
    L1_3 = L1_3.getClanName
    L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3 = L1_3()
    L0_3, L1_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
    L2_3 = L0_1
    L2_3 = L2_3.validateInput
    L2_3 = L2_3.validateClanTag
    L3_3 = L15_2
    L3_3 = L3_3.getClanTag
    L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3 = L3_3()
    L2_3, L3_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
    if not L0_3 then
      L4_3 = isSimulator
      if L4_3 then
        L4_3 = "GuestClan"
        L5_3 = math
        L5_3 = L5_3.random
        L6_3 = 1
        L7_3 = 1000
        L5_3 = L5_3(L6_3, L7_3)
        L0_3 = L4_3 .. L5_3
      end
    end
    if not L2_3 then
      L4_3 = isSimulator
      if L4_3 then
        L4_3 = math
        L4_3 = L4_3.random
        L5_3 = 1
        L6_3 = 9999
        L4_3 = L4_3(L5_3, L6_3)
        L2_3 = L4_3
      end
    end
    if not L0_3 then
      L4_3 = print
      L5_3 = "nameError "
      L6_3 = L1_3
      L4_3(L5_3, L6_3)
      L4_3 = L18_2
      L4_3.text = L1_3
      L4_3 = L0_1
      L4_3 = L4_3.analytics
      L4_3 = L4_3.newEvent
      L5_3 = "design"
      L6_3 = {}
      L6_3.event_id = "createClan:invalidClanname"
      L7_3 = L0_1
      L7_3 = L7_3.config
      L7_3 = L7_3.fullVersion
      L6_3.area = L7_3
      L4_3(L5_3, L6_3)
    elseif not L2_3 then
      L4_3 = print
      L5_3 = "tagError "
      L6_3 = L3_3
      L4_3(L5_3, L6_3)
      L4_3 = L18_2
      L4_3.text = L3_3
      L4_3 = L0_1
      L4_3 = L4_3.analytics
      L4_3 = L4_3.newEvent
      L5_3 = "design"
      L6_3 = {}
      L6_3.event_id = "createClan:invalidClantag"
      L7_3 = L0_1
      L7_3 = L7_3.config
      L7_3 = L7_3.fullVersion
      L6_3.area = L7_3
      L4_3(L5_3, L6_3)
    else
      L4_3 = L15_2
      L4_3 = L4_3.getClanOpen
      L4_3 = L4_3()
      L5_3 = L15_2
      L5_3 = L5_3.getRequiredLeague
      L5_3 = L5_3()
      L6_3 = L15_2
      L6_3 = L6_3.getAttitude
      L6_3 = L6_3()
      L7_3 = L15_2
      L7_3 = L7_3.getEmblem
      L7_3 = L7_3()
      L8_3 = L0_1
      L8_3 = L8_3.comm
      L8_3 = L8_3.createClan
      L9_3 = L0_3
      L10_3 = L2_3
      L11_3 = L7_3
      L12_3 = L4_3
      L13_3 = L5_3
      L14_3 = L6_3
      L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
      L8_3 = L0_1
      L8_3 = L8_3.analytics
      L8_3 = L8_3.newEvent
      L9_3 = "design"
      L10_3 = {}
      L10_3.event_id = "createClan:attempt"
      L11_3 = L0_1
      L11_3 = L11_3.config
      L11_3 = L11_3.fullVersion
      L10_3.area = L11_3
      L8_3(L9_3, L10_3)
      L8_3 = L18_2
      L9_3 = L0_1
      L9_3 = L9_3.localized
      L9_3 = L9_3.get
      L10_3 = "Loading"
      L9_3 = L9_3(L10_3)
      L8_3.text = L9_3
      L8_3 = timer
      L8_3 = L8_3.performWithDelay
      L9_3 = L0_1
      L9_3 = L9_3.config
      L9_3 = L9_3.serverTimeout
      L10_3 = L23_2
      L8_3 = L8_3(L9_3, L10_3)
      L7_2 = L8_3
      L8_3 = false
      L8_2 = L8_3
    end
  end
  
  L26_2 = L0_1
  L26_2 = L26_2.newButton
  L27_2 = {}
  L27_2.image = "images/gui/settings/buttonRenameCoins.png"
  L28_2 = {}
  L28_2.string = L10_2
  L28_2.x = 0
  L28_2.y = 6
  L27_2.text = L28_2
  L27_2.onRelease = L25_2
  L27_2.width = 62
  L27_2.height = 45
  L28_2 = L12_2.x
  L27_2.x = L28_2
  L28_2 = L12_2.y
  L29_2 = L12_2.height
  L28_2 = L28_2 + L29_2
  L27_2.y = L28_2
  L26_2 = L26_2(L27_2)
  if L10_2 == 0 then
    L27_2 = L26_2.changeButtonImage
    L28_2 = "images/gui/login/buttonNext.png"
    L27_2(L28_2)
    L27_2 = L26_2.changeText
    L28_2 = ""
    L27_2(L28_2)
  end
  
  function L27_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
    L0_3 = true
    return L0_3
  end
  
  L28_2 = L0_1
  L28_2 = L28_2.newButton
  L29_2 = {}
  L29_2.image = "images/gui/common/buttonClosePopupBrown.png"
  L29_2.onRelease = L27_2
  L29_2.width = 43
  L29_2.height = 38
  L30_2 = L12_2.x
  L30_2 = L30_2 + 220
  L29_2.x = L30_2
  L30_2 = L12_2.y
  L30_2 = L30_2 + -108
  L29_2.y = L30_2
  L28_2 = L28_2(L29_2)
  
  function L29_2(A0_3)
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
  
  function L30_2(A0_3)
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
  
  function L31_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L29_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L12_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L30_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L32_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L11_2
    L0_3(L1_3, L2_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L12_2
    L0_3(L1_3, L2_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L17_2
    L0_3(L1_3, L2_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L28_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L26_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L18_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L16_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L21_2
    L0_3(L1_3, L2_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L3_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L6_2
    L0_3(L1_3, L2_3)
  end
  
  function L33_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L15_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = L16_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L26_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L28_2
    L0_3(L1_3)
    L0_3 = native
    L0_3 = L0_3.setKeyboardFocus
    L1_3 = nil
    L0_3(L1_3)
    L0_3 = L19_2
    L0_3()
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L29_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L12_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L30_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L33_2
  L33_2 = L32_2
  L33_2()
  L33_2 = L31_2
  L33_2()
  L33_2 = L0_1
  L33_2 = L33_2.comm
  L33_2 = L33_2.setCallback
  L34_2 = L22_2
  L33_2(L34_2)
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
