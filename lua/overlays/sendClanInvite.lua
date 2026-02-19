local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = nil
L7_1 = nil
L8_1 = nil

function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = A0_2.view
  L3_2 = 30
  L4_2 = nil
  L5_2 = isAndroid
  if L5_2 then
    L3_2 = 40
  end
  L5_2 = display
  L5_2 = L5_2.newRect
  L6_2 = 0
  L7_2 = 0
  L8_2 = display
  L8_2 = L8_2.contentWidth
  L9_2 = display
  L9_2 = L9_2.contentHeight
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2.anchorX = 0
  L5_2.anchorY = 0
  L7_2 = L5_2
  L6_2 = L5_2.setFillColor
  L8_2 = 0
  L9_2 = 0
  L10_2 = 0
  L11_2 = 0.5882352941176471
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  L5_2.x = 0
  L5_2.y = 0
  L6_2 = display
  L6_2 = L6_2.newImageRect
  L7_2 = "images/gui/friends/mainWindow.png"
  L8_2 = 330
  L9_2 = 320
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L6_2.anchorX = 0.5
  L6_2.anchorY = 0
  L6_2.x = 240
  L6_2.y = 0
  L7_2 = display
  L7_2 = L7_2.newImageRect
  L8_2 = "images/gui/friends/header.png"
  L9_2 = 306
  L10_2 = 38
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L7_2.anchorX = 0.5
  L7_2.anchorY = 0
  L7_2.x = 240
  L7_2.y = 0
  L8_2 = L0_1
  L8_2 = L8_2.newText
  L9_2 = {}
  L10_2 = L0_1
  L10_2 = L10_2.localized
  L10_2 = L10_2.get
  L11_2 = "Invite to clan"
  L10_2 = L10_2(L11_2)
  L9_2.string = L10_2
  L9_2.size = 30
  L10_2 = display
  L10_2 = L10_2.contentWidth
  L10_2 = L10_2 * 0.5
  L9_2.x = L10_2
  L9_2.y = 16
  L10_2 = {}
  L11_2 = 1
  L12_2 = 1
  L13_2 = 1
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L9_2.color = L10_2
  L8_2 = L8_2(L9_2)
  L9_2 = native
  L9_2 = L9_2.newTextField
  L10_2 = display
  L10_2 = L10_2.contentWidth
  L10_2 = L10_2 * 3
  L11_2 = display
  L11_2 = L11_2.contentHeight
  L11_2 = L11_2 * 0.2
  L12_2 = 200
  L13_2 = L3_2
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
  L4_1 = L9_2
  L9_2 = L4_1
  L9_2.anchorX = 0.5
  L9_2 = L4_1
  L9_2.anchorY = 0.5
  L9_2 = L4_1
  L10_2 = display
  L10_2 = L10_2.contentWidth
  L10_2 = L10_2 * 0.5
  L9_2.x = L10_2
  L9_2 = L4_1
  L10_2 = display
  L10_2 = L10_2.contentHeight
  L10_2 = L10_2 * 0.25
  L9_2.y = L10_2
  L9_2 = L4_1
  L10_2 = L0_1
  L10_2 = L10_2.validateInput
  L10_2 = L10_2.limitTextField
  L11_2 = 15
  L10_2 = L10_2(L11_2)
  L9_2.userInput = L10_2
  L9_2 = L4_1
  L10_2 = L9_2
  L9_2 = L9_2.addEventListener
  L11_2 = "userInput"
  L12_2 = L4_1
  L12_2 = L12_2.userInput
  L9_2(L10_2, L11_2, L12_2)
  L9_2 = L0_1
  L9_2 = L9_2.newText
  L10_2 = {}
  L10_2.string = ""
  L10_2.size = 20
  L11_2 = display
  L11_2 = L11_2.contentWidth
  L11_2 = L11_2 * 0.5
  L10_2.x = L11_2
  L10_2.y = 140
  L10_2.width = 200
  L11_2 = {}
  L12_2 = 1
  L13_2 = 1
  L14_2 = 1
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L11_2[3] = L14_2
  L10_2.color = L11_2
  L9_2 = L9_2(L10_2)
  L5_1 = L9_2
  L9_2 = display
  L9_2 = L9_2.newImageRect
  L10_2 = "images/gui/friends/searchCover.png"
  L11_2 = 300
  L12_2 = 55
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L10_2 = L4_1
  L10_2 = L10_2.x
  L9_2.x = L10_2
  L10_2 = L4_1
  L10_2 = L10_2.y
  L10_2 = L10_2 + 6
  L9_2.y = L10_2
  
  function L10_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  function L11_2()
    local L0_3, L1_3, L2_3
    L0_3 = L0_1
    L0_3 = L0_3.showOverlay
    L1_3 = "lua.overlays.messages"
    L2_3 = {}
    L2_3.isModal = true
    L0_3(L1_3, L2_3)
  end
  
  function L12_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = false
      if L1_3 then
        L1_3 = native
        L1_3 = L1_3.setKeyboardFocus
        L2_3 = nil
        L1_3(L2_3)
        L1_3 = isAndroid
        if L1_3 then
          L1_3 = native
          L1_3 = L1_3.setProperty
          L2_3 = "androidSystemUiVisibility"
          L3_3 = "immersiveSticky"
          L1_3(L2_3, L3_3)
        end
      else
        L1_3 = L0_1
        L1_3 = L1_3.hideOverlay
        L1_3()
      end
    end
    L1_3 = true
    return L1_3
  end
  
  function L13_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = native
      L1_3 = L1_3.setKeyboardFocus
      L2_3 = nil
      L1_3(L2_3)
      L1_3 = isAndroid
      if L1_3 then
        L1_3 = native
        L1_3 = L1_3.setProperty
        L2_3 = "androidSystemUiVisibility"
        L3_3 = "immersiveSticky"
        L1_3(L2_3, L3_3)
      end
    end
    L1_3 = true
    return L1_3
  end
  
  L14_2 = A1_2.params
  if L14_2 then
    L14_2 = A1_2.params
    L14_2 = L14_2.friendScene
    if L14_2 then
      L14_2 = L0_1
      L14_2 = L14_2.newButton
      L15_2 = {}
      L15_2.x = 116
      L15_2.y = 22
      L15_2.width = 43
      L15_2.height = 38
      L15_2.image = "images/gui/friends/back.png"
      L15_2.onRelease = L11_2
      L14_2 = L14_2(L15_2)
      L4_2 = L14_2
    end
  end
  L14_2 = L0_1
  L14_2 = L14_2.newButton
  L15_2 = {}
  L15_2.x = 370
  L15_2.y = 14
  L15_2.width = 43
  L15_2.height = 38
  L15_2.image = "images/gui/common/buttonClosePopupRed.png"
  L15_2.onRelease = L10_2
  L14_2 = L14_2(L15_2)
  
  function L15_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = native
    L0_3 = L0_3.setKeyboardFocus
    L1_3 = nil
    L0_3(L1_3)
    L0_3 = L0_1
    L0_3 = L0_3.validateInput
    L0_3 = L0_3.validateUsernameSearch
    L1_3 = L4_1
    L1_3 = L1_3.text
    L0_3, L1_3 = L0_3(L1_3)
    if not L0_3 then
      L2_3 = isSimulator
      if L2_3 then
        L2_3 = {}
        L0_3 = L2_3
        L0_3[1] = "hauki"
        L0_3[2] = nil
      end
    end
    if not L0_3 then
      L2_3 = L5_1
      L2_3.text = L1_3
      L2_3 = L0_1
      L2_3 = L2_3.analytics
      L2_3 = L2_3.newEvent
      L3_3 = "design"
      L4_3 = {}
      L4_3.event_id = "search:noUsername"
      L5_3 = L0_1
      L5_3 = L5_3.config
      L5_3 = L5_3.fullVersion
      L4_3.area = L5_3
      L2_3(L3_3, L4_3)
    else
      L2_3 = L0_1
      L2_3 = L2_3.comm
      L2_3 = L2_3.playerSearch
      L3_3 = L0_3[1]
      L4_3 = L0_3[2]
      L2_3(L3_3, L4_3)
      L2_3 = L5_1
      L2_3.text = ""
      L2_3 = L0_1
      L2_3 = L2_3.analytics
      L2_3 = L2_3.newEvent
      L3_3 = "design"
      L4_3 = {}
      L4_3.event_id = "search:username"
      L5_3 = #L0_3
      L4_3.value = L5_3
      L5_3 = L0_1
      L5_3 = L5_3.config
      L5_3 = L5_3.fullVersion
      L4_3.area = L5_3
      L2_3(L3_3, L4_3)
    end
    L2_3 = L6_1
    if L2_3 then
      L2_3 = L6_1
      L2_3 = L2_3.cleanTable
      L2_3()
    end
  end
  
  L16_2 = L0_1
  L16_2 = L16_2.newButton
  L17_2 = {}
  L17_2.x = 360
  L17_2.y = 78
  L17_2.width = 39
  L17_2.height = 39
  L17_2.image = "images/gui/friends/search.png"
  L17_2.onRelease = L15_2
  L16_2 = L16_2(L17_2)
  
  function L17_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L5_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L6_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L9_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L4_1
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L5_1
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L14_2
    L0_3(L1_3, L2_3)
    L0_3 = L4_2
    if L0_3 then
      L0_3 = L2_2
      L1_3 = L0_3
      L0_3 = L0_3.insert
      L2_3 = L4_2
      L0_3(L1_3, L2_3)
    end
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L16_2
    L0_3(L1_3, L2_3)
  end
  
  function L18_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L12_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L13_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L19_2(A0_3)
    local L1_3
    
    function L1_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4
      L1_4 = string
      L1_4 = L1_4.len
      L2_4 = L4_1
      L2_4 = L2_4.text
      L1_4 = L1_4(L2_4)
      if 15 < L1_4 then
        L1_4 = L4_1
        L2_4 = L4_1
        L2_4 = L2_4.text
        L3_4 = L2_4
        L2_4 = L2_4.sub
        L4_4 = 1
        L5_4 = 15
        L2_4 = L2_4(L3_4, L4_4, L5_4)
        L1_4.text = L2_4
      end
      L1_4 = A0_4.phase
      if "ended" == L1_4 then
      else
        L1_4 = A0_4.phase
        if "submitted" == L1_4 then
          L1_4 = native
          L1_4 = L1_4.setKeyboardFocus
          L2_4 = nil
          L1_4(L2_4)
          L1_4 = isAndroid
          if L1_4 then
            L1_4 = native
            L1_4 = L1_4.setProperty
            L2_4 = "androidSystemUiVisibility"
            L3_4 = "immersiveSticky"
            L1_4(L2_4, L3_4)
          end
        end
      end
    end
    
    return L1_3
  end
  
  L7_1 = L19_2
  
  function L19_2(A0_3)
    local L1_3
    if A0_3 then
      L1_3 = L4_1
      L1_3.isVisible = false
      L1_3 = L16_2
      L1_3.isVisible = false
    else
      L1_3 = L4_1
      L1_3.isVisible = true
      L1_3 = L16_2
      L1_3.isVisible = true
    end
  end
  
  L8_1 = L19_2
  
  function L19_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = isAndroid
    if L0_3 then
      L0_3 = native
      L0_3 = L0_3.setProperty
      L1_3 = "androidSystemUiVisibility"
      L2_3 = "immersiveSticky"
      L0_3(L1_3, L2_3)
    end
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L16_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L14_2
    L0_3(L1_3)
    L0_3 = L4_2
    if L0_3 then
      L0_3 = display
      L0_3 = L0_3.remove
      L1_3 = L4_2
      L0_3(L1_3)
    end
    L0_3 = L5_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L12_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L6_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L13_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L19_2
  L19_2 = L17_2
  L19_2()
  L19_2 = L18_2
  L19_2()
end

L1_1.create = L9_1

function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = A0_2.view
  L3_2 = A1_2.phase
  if L3_2 == "will" then
    return
  end
  L4_2 = require
  L5_2 = "lua.modules.tableHelper"
  L4_2 = L4_2(L5_2)
  L5_2 = require
  L6_2 = "lua.network.tcpMessageFormat"
  L5_2 = L5_2(L6_2)
  L6_2 = require
  L7_2 = "lua.modules.androidBackButton"
  L6_2 = L6_2(L7_2)
  L7_2 = display
  L7_2 = L7_2.newGroup
  L7_2 = L7_2()
  L7_2.x = 105
  L7_2.y = 112
  L7_2.isVisible = false
  L8_2 = L0_1
  L8_2 = L8_2.database
  L8_2 = L8_2.getFriendsNotInClan
  L8_2 = L8_2()
  
  function L9_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L0_1
    L1_3 = L1_3.comm
    L1_3 = L1_3.inviteToClan
    L2_3 = A0_3
    L3_3 = true
    L1_3(L2_3, L3_3)
  end
  
  L10_2 = L4_2.new
  L11_2 = 0
  L12_2 = 0
  L13_2 = 270
  L14_2 = 208
  L15_2 = 55
  L16_2 = nil
  L17_2 = "findFriends"
  L18_2 = L9_2
  L19_2 = 10
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L6_1 = L10_2
  L10_2 = L6_1
  L10_2 = L10_2.cleanTable
  L10_2()
  L10_2 = L6_1
  L10_2 = L10_2.createTable
  L11_2 = L8_2
  L12_2 = L7_2
  L10_2(L11_2, L12_2)
  L7_2.isVisible = true
  
  function L10_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_3.r
    if L1_3 then
      L1_3 = A0_3.r
      if L1_3 == 35 then
        L1_3 = L5_1
        L2_3 = L0_1
        L2_3 = L2_3.localized
        L2_3 = L2_3.get
        L3_3 = "CantAddYourself"
        L2_3 = L2_3(L3_3)
        L1_3.text = L2_3
      else
        L1_3 = A0_3.r
        if L1_3 == 36 then
          L1_3 = L0_1
          L1_3 = L1_3.createCustomOverlay
          L2_3 = 41
          L1_3(L2_3)
        else
          L1_3 = A0_3.r
          if L1_3 == 69 then
            L1_3 = L0_1
            L1_3 = L1_3.createCustomOverlay
            L2_3 = 42
            L1_3(L2_3)
          else
            L1_3 = A0_3.r
            if L1_3 == 71 then
              L1_3 = L0_1
              L1_3 = L1_3.createCustomOverlay
              L2_3 = 40
              L1_3(L2_3)
            end
          end
        end
      end
    else
      L1_3 = A0_3.m
      L2_3 = L5_2
      L2_3 = L2_3.playerSearch
      L2_3 = L2_3()
      if L1_3 == L2_3 then
        L1_3 = A0_3.f
        if L1_3 then
          L1_3 = A0_3.f
          L1_3 = #L1_3
          if L1_3 == 0 then
            L1_3 = L5_1
            L2_3 = L0_1
            L2_3 = L2_3.localized
            L2_3 = L2_3.get
            L3_3 = "NoPlayer"
            L2_3 = L2_3(L3_3)
            L1_3.text = L2_3
          else
            L1_3 = L6_1
            L1_3 = L1_3.cleanTable
            L1_3()
            L1_3 = L6_1
            L1_3 = L1_3.createTable
            L2_3 = A0_3.f
            L3_3 = L7_2
            L1_3(L2_3, L3_3)
            L1_3 = L7_2
            L2_3 = L1_3
            L1_3 = L1_3.insert
            L3_3 = L6_1
            L3_3 = L3_3.getTable
            L3_3 = L3_3()
            L1_3(L2_3, L3_3)
            L1_3 = L7_2
            L1_3.isVisible = true
          end
        end
      end
    end
  end
  
  function L11_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L5_1
    L0_3(L1_3, L2_3)
  end
  
  function L12_2()
    local L0_3, L1_3
    L0_3 = L6_1
    if L0_3 then
      L0_3 = L6_1
      L0_3 = L0_3.cleanTable
      L0_3()
      L0_3 = nil
      L6_1 = L0_3
    end
    L0_3 = L6_2
    L0_3 = L0_3.isOverlay
    L1_3 = false
    L0_3(L1_3)
  end
  
  L3_1 = L12_2
  L12_2 = L6_2.isOverlay
  L13_2 = true
  L12_2(L13_2)
  L12_2 = L11_2
  L12_2()
  L12_2 = L0_1
  L12_2 = L12_2.comm
  L12_2 = L12_2.setCallback
  L13_2 = L10_2
  L12_2(L13_2)
  L12_2 = isAndroid
  if not L12_2 then
    L12_2 = native
    L12_2 = L12_2.setKeyboardFocus
    L13_2 = L4_1
    L12_2(L13_2)
  end
end

L1_1.show = L9_1

function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2.view
  L3_2 = A1_2.phase
  if L3_2 == "did" then
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
  L4_2 = L3_1
  L4_2()
end

L1_1.hide = L9_1

function L9_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A0_2.view
  L3_2 = L2_1
  L3_2()
end

L1_1.destroy = L9_1
L10_1 = L1_1
L9_1 = L1_1.addEventListener
L11_1 = "create"
L12_1 = L1_1
L9_1(L10_1, L11_1, L12_1)
L10_1 = L1_1
L9_1 = L1_1.addEventListener
L11_1 = "show"
L12_1 = L1_1
L9_1(L10_1, L11_1, L12_1)
L10_1 = L1_1
L9_1 = L1_1.addEventListener
L11_1 = "hide"
L12_1 = L1_1
L9_1(L10_1, L11_1, L12_1)
L10_1 = L1_1
L9_1 = L1_1.addEventListener
L11_1 = "destroy"
L12_1 = L1_1
L9_1(L10_1, L11_1, L12_1)
return L1_1
