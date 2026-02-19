local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = require
L2_1 = "lua.network.tcpClient"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "lua.network.tcpMessageFormat"
L2_1 = L2_1(L3_1)
L3_1 = require
L4_1 = "json"
L3_1 = L3_1(L4_1)
L4_1 = L0_1.newScene
L4_1 = L4_1()
L5_1 = nil
L6_1 = nil
L7_1 = nil
L8_1 = nil
L9_1 = nil
L10_1 = nil
L11_1 = nil
L12_1 = nil

function L13_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2
  L2_2 = A0_2.view
  L3_2 = require
  L4_2 = "lua.modules.tableHelper"
  L3_2 = L3_2(L4_2)
  L4_2 = require
  L5_2 = "lua.network.chatMessageFormat"
  L4_2 = L4_2(L5_2)
  L5_2 = require
  L6_2 = "lua.modules.clans.clanEventParser"
  L5_2 = L5_2(L6_2)
  L6_2 = nil
  L7_2 = 0
  L8_2 = nil
  L9_2 = nil
  L10_2 = nil
  L11_2 = nil
  L12_2 = false
  L13_2 = false
  L14_2 = 25
  L15_2 = 160
  L16_2 = 0
  L17_2 = ""
  L18_2 = nil
  L19_2 = nil
  L20_2 = nil
  L21_2 = nil
  L22_2 = display
  L22_2 = L22_2.newGroup
  L22_2 = L22_2()
  L22_2.x = 75
  L23_2 = nil
  
  function L24_2(A0_3)
    local L1_3
    if not A0_3 then
      A0_3 = 1000
    end
    
    function L1_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4
      L1_4 = A0_4.text
      if L1_4 then
        L1_4 = string
        L1_4 = L1_4.len
        L2_4 = A0_4.text
        L1_4 = L1_4(L2_4)
        L2_4 = A0_3
        if L1_4 > L2_4 then
          L1_4 = A0_4.target
          L2_4 = A0_4.text
          L3_4 = L2_4
          L2_4 = L2_4.sub
          L4_4 = 1
          L5_4 = A0_3
          L2_4 = L2_4(L3_4, L4_4, L5_4)
          L1_4.text = L2_4
        end
      end
      L1_4 = A0_4.phase
      if "began" == L1_4 then
        L1_4 = L8_1
        L2_4 = true
        L1_4(L2_4)
      else
        L1_4 = A0_4.phase
        if "ended" == L1_4 then
          L1_4 = L8_1
          L2_4 = false
          L1_4(L2_4)
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
            L1_4 = L8_1
            L2_4 = false
            L1_4(L2_4)
            
            function L1_4()
              local L0_5, L1_5
              L0_5 = L21_2
              L0_5()
            end
            
            L2_4 = timer
            L2_4 = L2_4.performWithDelay
            L3_4 = 10
            L4_4 = L1_4
            L5_4 = 1
            L2_4 = L2_4(L3_4, L4_4, L5_4)
            L20_2 = L2_4
          end
        end
      end
    end
    
    return L1_3
  end
  
  L25_2 = 25
  L26_2 = isAndroid
  if L26_2 then
    L25_2 = 35
  end
  L26_2 = display
  L26_2 = L26_2.newRect
  L27_2 = 0
  L28_2 = 0
  L29_2 = display
  L29_2 = L29_2.contentWidth
  L30_2 = display
  L30_2 = L30_2.contentHeight
  L26_2 = L26_2(L27_2, L28_2, L29_2, L30_2)
  L26_2.anchorX = 0
  L26_2.anchorY = 0
  L28_2 = L26_2
  L27_2 = L26_2.setFillColor
  L29_2 = 0
  L30_2 = 0
  L31_2 = 0
  L32_2 = 0.5882352941176471
  L27_2(L28_2, L29_2, L30_2, L31_2, L32_2)
  L26_2.x = 0
  L26_2.y = 0
  L27_2 = display
  L27_2 = L27_2.newImageRect
  L28_2 = "images/gui/customplay/chatWindow.png"
  L29_2 = 287
  L30_2 = 320
  L27_2 = L27_2(L28_2, L29_2, L30_2)
  L27_2.anchorX = 0.5
  L27_2.anchorY = 0
  L27_2.x = 240
  L27_2.y = 0
  L28_2 = native
  L28_2 = L28_2.newTextField
  L29_2 = display
  L29_2 = L29_2.contentWidth
  L29_2 = L29_2 * 3
  L30_2 = display
  L30_2 = L30_2.contentHeight
  L30_2 = L30_2 * 0.2
  L31_2 = 220
  L32_2 = L25_2
  L28_2 = L28_2(L29_2, L30_2, L31_2, L32_2)
  L7_1 = L28_2
  L28_2 = L7_1
  L28_2.anchorX = 0.5
  L28_2 = L7_1
  L28_2.anchorY = 0.5
  L28_2 = L7_1
  L28_2.x = 210
  L28_2 = L7_1
  L28_2.y = 300
  L28_2 = L7_1
  L29_2 = L24_2
  L30_2 = 300
  L29_2 = L29_2(L30_2)
  L28_2.userInput = L29_2
  L28_2 = L7_1
  L29_2 = L28_2
  L28_2 = L28_2.addEventListener
  L30_2 = "userInput"
  L31_2 = L7_1
  L31_2 = L31_2.userInput
  L28_2(L29_2, L30_2, L31_2)
  L28_2 = display
  L28_2 = L28_2.newImageRect
  L29_2 = "images/gui/customplay/chatBar.png"
  L30_2 = 327
  L31_2 = 44
  L28_2 = L28_2(L29_2, L30_2, L31_2)
  L28_2.anchorX = 0.5
  L28_2.anchorY = 1
  L28_2.x = 240
  L28_2.y = 320
  L29_2 = display
  L29_2 = L29_2.newRect
  L30_2 = 0
  L31_2 = 0
  L32_2 = 130
  L33_2 = 320
  L29_2 = L29_2(L30_2, L31_2, L32_2, L33_2)
  L29_2.anchorX = 0
  L29_2.anchorY = 0
  L31_2 = L29_2
  L30_2 = L29_2.setFillColor
  L32_2 = 0.8666666666666667
  L33_2 = 0.796078431372549
  L34_2 = 0.6823529411764706
  L30_2(L31_2, L32_2, L33_2, L34_2)
  L30_2 = display
  L30_2 = L30_2.newImageRect
  L31_2 = "images/gui/clan_v2/chat/table.png"
  L32_2 = 158
  L33_2 = 320
  L30_2 = L30_2(L31_2, L32_2, L33_2)
  L30_2.anchorX = 0
  L30_2.x = 0
  L31_2 = display
  L31_2 = L31_2.contentHeight
  L31_2 = L31_2 * 0.5
  L30_2.y = L31_2
  
  function L31_2()
    local L0_3, L1_3, L2_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
    L0_3 = native
    L0_3 = L0_3.setKeyboardFocus
    L1_3 = nil
    L0_3(L1_3)
    L0_3 = isAndroid
    if L0_3 then
      L0_3 = native
      L0_3 = L0_3.setProperty
      L1_3 = "androidSystemUiVisibility"
      L2_3 = "immersiveSticky"
      L0_3(L1_3, L2_3)
    end
  end
  
  L32_2 = L0_1
  L32_2 = L32_2.newButton
  L33_2 = {}
  L33_2.x = 353
  L33_2.y = 15
  L33_2.width = 43
  L33_2.height = 38
  L33_2.image = "images/gui/common/buttonClosePopupBrown.png"
  L33_2.onRelease = L31_2
  L32_2 = L32_2(L33_2)
  
  function L33_2()
    local L0_3, L1_3
  end
  
  function L34_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = tonumber
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    L2_3 = L0_1
    L2_3 = L2_3.localized
    L2_3 = L2_3.get
    L3_3 = "HostSelect"
    L2_3 = L2_3(L3_3)
    L3_3 = "some map"
    L2_3 = L2_3 .. L3_3
    return L2_3
  end
  
  L35_2 = L3_2.new
  L36_2 = 130
  L37_2 = 0
  L38_2 = 220
  L39_2 = 270
  L40_2 = 138
  L41_2 = nil
  L42_2 = "clanChat"
  L43_2 = L33_2
  L35_2 = L35_2(L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2)
  L6_2 = L35_2
  
  function L35_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L6_2
    L0_3 = L0_3.getTable
    L0_3 = L0_3()
    if L0_3 then
      L1_3 = L7_2
      L2_3 = L16_2
      L2_3 = 270 - L2_3
      if L1_3 > L2_3 then
        L2_3 = L0_3
        L1_3 = L0_3.scrollToIndex
        L4_3 = L0_3
        L3_3 = L0_3.getNumRows
        L3_3 = L3_3(L4_3)
        L4_3 = 200
        L1_3(L2_3, L3_3, L4_3)
      end
    end
  end
  
  L11_1 = L35_2
  
  function L35_2()
    local L0_3, L1_3, L2_3
    L0_3 = L6_2
    L0_3 = L0_3.getTable
    L0_3 = L0_3()
    if L0_3 then
      L2_3 = L0_3
      L1_3 = L0_3.deleteAllRows
      L1_3(L2_3)
    end
  end
  
  L12_1 = L35_2
  
  function L35_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    L1_3 = L6_2
    L1_3 = L1_3.getTable
    L1_3 = L1_3()
    L2_3 = L5_2
    L2_3 = L2_3.parseEvent
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    L3_3 = math
    L3_3 = L3_3.ceil
    L4_3 = L2_3.height
    L3_3 = L3_3(L4_3)
    L3_3 = L3_3 + 6
    L4_3 = L7_2
    L4_3 = L4_3 + L3_3
    L7_2 = L4_3
    if L1_3 then
      L5_3 = L1_3
      L4_3 = L1_3.insertRow
      L6_3 = {}
      L6_3.rowHeight = L3_3
      L7_3 = {}
      L8_3 = {}
      L9_3 = 1
      L10_3 = 1
      L11_3 = 1
      L12_3 = 0
      L8_3[1] = L9_3
      L8_3[2] = L10_3
      L8_3[3] = L11_3
      L8_3[4] = L12_3
      L7_3.default = L8_3
      L6_3.rowColor = L7_3
      L7_3 = {}
      L8_3 = 0.8627450980392157
      L9_3 = 0.8627450980392157
      L10_3 = 0.8627450980392157
      L7_3[1] = L8_3
      L7_3[2] = L9_3
      L7_3[3] = L10_3
      L6_3.lineColor = L7_3
      L6_3.params = A0_3
      L4_3(L5_3, L6_3)
    end
    L4_3 = L7_2
    L6_3 = L1_3
    L5_3 = L1_3.getContentPosition
    L5_3 = L5_3(L6_3)
    L4_3 = L4_3 + L5_3
    L5_3 = L12_2
    if L5_3 then
      L5_3 = L16_2
      L4_3 = L4_3 - L5_3
    end
    L5_3 = L7_1
    L5_3 = L5_3.y
    L6_3 = L14_2
    L5_3 = L5_3 - L6_3
    L5_3 = L4_3 - L5_3
    L6_3 = L3_3 * 2
    L5_3 = L5_3 < L6_3
    if L5_3 then
      L6_3 = L11_1
      L6_3()
    end
    L7_3 = L2_3
    L6_3 = L2_3.removeSelf
    L6_3(L7_3)
    L2_3 = nil
  end
  
  function L36_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L0_1
    L1_3 = L1_3.tableUtils
    L1_3 = L1_3.deepCopy
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    L1_3.header = true
    L2_3 = L35_2
    L3_3 = L1_3
    L2_3(L3_3)
  end
  
  function L37_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = L13_2
    if L2_3 then
      return
    end
    L2_3 = L17_2
    if L2_3 then
      L2_3 = A0_3.playerId
      if L2_3 then
        L2_3 = L17_2
        L3_3 = A0_3.playerId
        if L2_3 ~= L3_3 then
          L2_3 = L36_2
          L3_3 = A0_3
          L2_3(L3_3)
        end
        L2_3 = A0_3.playerId
        L17_2 = L2_3
    end
    else
      L2_3 = ""
      L17_2 = L2_3
    end
    L2_3 = L35_2
    L3_3 = A0_3
    L4_3 = A1_3
    L2_3(L3_3, L4_3)
  end
  
  L9_1 = L37_2
  
  function L37_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = L0_1
      L1_3 = L1_3.hideOverlay
      L1_3()
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
  
  function L38_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L12_2
    if L1_3 then
      L1_3 = L8_1
      L2_3 = false
      L1_3(L2_3)
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
  
  function L21_2()
    local L0_3, L1_3, L2_3
    L0_3 = L7_1
    L0_3 = L0_3.text
    L1_3 = isSimulator
    if L1_3 then
    end
    if L0_3 then
      L1_3 = string
      L1_3 = L1_3.len
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      if 0 < L1_3 then
        L1_3 = L0_1
        L1_3 = L1_3.comm
        L1_3 = L1_3.sendClanMessage
        L2_3 = L0_3
        L1_3(L2_3)
        L1_3 = L7_1
        L1_3.text = ""
      end
    end
    L1_3 = true
    return L1_3
  end
  
  L39_2 = L0_1
  L39_2 = L39_2.newButton
  L40_2 = {}
  L40_2.x = 360
  L40_2.y = 298
  L40_2.width = 75
  L40_2.height = 44
  L40_2.image = "images/gui/customplay/buttonSendmsg.png"
  L40_2.onRelease = L21_2
  L39_2 = L39_2(L40_2)
  
  function L40_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = L13_2
    if L1_3 then
      return
    end
    L1_3 = L6_2
    L1_3 = L1_3.getTable
    L1_3 = L1_3()
    L12_2 = A0_3
    if A0_3 then
      L2_3 = L39_2
      L3_3 = L8_2
      L4_3 = L15_2
      L3_3 = L3_3 - L4_3
      L2_3.y = L3_3
      L2_3 = L7_1
      L3_3 = L10_2
      L4_3 = L15_2
      L3_3 = L3_3 - L4_3
      L2_3.y = L3_3
      L2_3 = L28_2
      L3_3 = L11_2
      L4_3 = L15_2
      L3_3 = L3_3 - L4_3
      L2_3.y = L3_3
      L2_3 = L7_2
      L4_3 = L1_3
      L3_3 = L1_3.getContentPosition
      L3_3 = L3_3(L4_3)
      L2_3 = L2_3 + L3_3
      L3_3 = L7_1
      L3_3 = L3_3.y
      L4_3 = L14_2
      L3_3 = L3_3 - L4_3
      if L2_3 > L3_3 then
        L3_3 = L7_1
        L3_3 = L3_3.y
        L4_3 = L14_2
        L3_3 = L3_3 - L4_3
        L3_3 = L2_3 - L3_3
        L4_3 = L15_2
        if L3_3 > L4_3 then
          L3_3 = L15_2
        end
        L16_2 = L3_3
        L4_3 = L9_2
        L4_3 = L4_3 - L3_3
        L1_3.y = L4_3
      end
      L3_3 = L1_1
      L3_3 = L3_3.sendStartTyping
      L3_3()
    else
      L2_3 = L39_2
      L3_3 = L8_2
      L2_3.y = L3_3
      L2_3 = L9_2
      L1_3.y = L2_3
      L2_3 = L7_1
      L3_3 = L10_2
      L2_3.y = L3_3
      L2_3 = L28_2
      L3_3 = L11_2
      L2_3.y = L3_3
      L2_3 = 0
      L16_2 = L2_3
      L2_3 = L1_1
      L2_3 = L2_3.sendStopTyping
      L2_3()
    end
  end
  
  L8_1 = L40_2
  
  function L40_2()
    local L0_3, L1_3
  end
  
  function L41_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L0_3 = L0_1
    L0_3 = L0_3.data
    L0_3 = L0_3.clans
    L0_3 = L0_3.members
    L1_3 = {}
    L2_3 = {}
    L3_3 = {}
    L4_3 = {}
    L5_3 = {}
    L2_3[1] = L5_3
    L5_3 = L2_3[1]
    L6_3 = L0_1
    L6_3 = L6_3.localized
    L6_3 = L6_3.get
    L7_3 = "Online"
    L6_3 = L6_3(L7_3)
    L5_3.title = L6_3
    L5_3 = {}
    L3_3[1] = L5_3
    L5_3 = L3_3[1]
    L6_3 = L0_1
    L6_3 = L6_3.localized
    L6_3 = L6_3.get
    L7_3 = "InGame"
    L6_3 = L6_3(L7_3)
    L5_3.title = L6_3
    L5_3 = {}
    L4_3[1] = L5_3
    L5_3 = L4_3[1]
    L6_3 = L0_1
    L6_3 = L6_3.localized
    L6_3 = L6_3.get
    L7_3 = "Offline"
    L6_3 = L6_3(L7_3)
    L5_3.title = L6_3
    L5_3 = 1
    L6_3 = #L0_3
    L7_3 = 1
    for L8_3 = L5_3, L6_3, L7_3 do
      L9_3 = L0_3[L8_3]
      L10_3 = tonumber
      L11_3 = L9_3.onlineStatus
      L10_3 = L10_3(L11_3)
      if L10_3 == 1 then
        L11_3 = #L2_3
        L11_3 = L11_3 + 1
        L2_3[L11_3] = L9_3
      elseif L10_3 == 2 then
        L11_3 = #L3_3
        L11_3 = L11_3 + 1
        L3_3[L11_3] = L9_3
      elseif L10_3 == 3 then
        L11_3 = #L4_3
        L11_3 = L11_3 + 1
        L4_3[L11_3] = L9_3
      end
    end
    L5_3 = #L2_3
    if 1 < L5_3 then
      L5_3 = 1
      L6_3 = #L2_3
      L7_3 = 1
      for L8_3 = L5_3, L6_3, L7_3 do
        L9_3 = #L1_3
        L9_3 = L9_3 + 1
        L10_3 = L2_3[L8_3]
        L1_3[L9_3] = L10_3
      end
    end
    L5_3 = #L3_3
    if 1 < L5_3 then
      L5_3 = 1
      L6_3 = #L3_3
      L7_3 = 1
      for L8_3 = L5_3, L6_3, L7_3 do
        L9_3 = #L1_3
        L9_3 = L9_3 + 1
        L10_3 = L3_3[L8_3]
        L1_3[L9_3] = L10_3
      end
    end
    L5_3 = #L4_3
    if 1 < L5_3 then
      L5_3 = 1
      L6_3 = #L4_3
      L7_3 = 1
      for L8_3 = L5_3, L6_3, L7_3 do
        L9_3 = #L1_3
        L9_3 = L9_3 + 1
        L10_3 = L4_3[L8_3]
        L1_3[L9_3] = L10_3
      end
    end
    return L1_3
  end
  
  L42_2 = L3_2.new
  L43_2 = 0
  L44_2 = 45
  L45_2 = 130
  L46_2 = 280
  L47_2 = 25
  L48_2 = nil
  L49_2 = "clanChatMemberList"
  L50_2 = L40_2
  L51_2 = 10
  L42_2 = L42_2(L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2)
  L23_2 = L42_2
  
  function L42_2()
    local L0_3, L1_3, L2_3
    L0_3 = L23_2
    L0_3 = L0_3.refreshTable
    L1_3 = L41_2
    L1_3 = L1_3()
    L2_3 = L2_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L30_2
    L0_3(L1_3, L2_3)
  end
  
  L10_1 = L42_2
  
  function L42_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L26_2
    L0_3(L1_3, L2_3)
    L0_3 = L22_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L27_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L29_2
    L0_3(L1_3, L2_3)
    L0_3 = L22_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L32_2
    L0_3(L1_3, L2_3)
  end
  
  function L43_2()
    local L0_3, L1_3, L2_3
    L0_3 = L22_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L28_2
    L0_3(L1_3, L2_3)
    L0_3 = L22_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L32_2
    L0_3(L1_3, L2_3)
    L0_3 = L22_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_1
    L0_3(L1_3, L2_3)
    L0_3 = L22_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L39_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L22_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L30_2
    L0_3(L1_3, L2_3)
  end
  
  function L44_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L13_2
    if not L0_3 then
      L0_3 = L26_2
      L1_3 = L0_3
      L0_3 = L0_3.addEventListener
      L2_3 = "touch"
      L3_3 = L37_2
      L0_3(L1_3, L2_3, L3_3)
      L0_3 = L27_2
      L1_3 = L0_3
      L0_3 = L0_3.addEventListener
      L2_3 = "touch"
      L3_3 = L38_2
      L0_3(L1_3, L2_3, L3_3)
      L0_3 = L27_2
      L1_3 = L0_3
      L0_3 = L0_3.addEventListener
      L2_3 = "tap"
      L3_3 = L38_2
      L0_3(L1_3, L2_3, L3_3)
    end
  end
  
  function L45_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L13_2
    if L0_3 then
      return
    end
    L0_3 = true
    L13_2 = L0_3
    
    function L0_3(A0_4)
      local L1_4
    end
    
    L8_1 = L0_3
    L0_3 = L1_1
    L0_3 = L0_3.sendStopTyping
    L0_3()
    L0_3 = L0_1
    L0_3.chatListener = nil
    L0_3 = native
    L0_3 = L0_3.setKeyboardFocus
    L1_3 = nil
    L0_3(L1_3)
    L0_3 = isAndroid
    if L0_3 then
      L0_3 = native
      L0_3 = L0_3.setProperty
      L1_3 = "androidSystemUiVisibility"
      L2_3 = "immersiveSticky"
      L0_3(L1_3, L2_3)
    end
    L0_3 = L19_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L19_2
      L0_3(L1_3)
      L0_3 = nil
      L19_2 = L0_3
    end
    L0_3 = L20_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L20_2
      L0_3(L1_3)
      L0_3 = nil
      L20_2 = L0_3
    end
    L0_3 = L7_1
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "userInput"
    L3_3 = L7_1
    L3_3 = L3_3.userInput
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L18_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L18_2
      L0_3(L1_3)
      L0_3 = nil
      L18_2 = L0_3
    end
    L0_3 = L6_2
    if L0_3 then
      L0_3 = L6_2
      L0_3 = L0_3.cleanTable
      L0_3()
      L0_3 = nil
      L6_2 = L0_3
    end
    L0_3 = L23_2
    if L0_3 then
      L0_3 = L23_2
      L0_3 = L0_3.cleanTable
      L0_3()
      L0_3 = nil
      L23_2 = L0_3
    end
    L0_3 = L0_1
    L0_3 = L0_3.clanUtils
    L0_3 = L0_3.clearUnreadMessages
    L0_3()
    L0_3 = L0_1
    L0_3 = L0_3.clanUtils
    L0_3 = L0_3.clearUnreadEvents
    L0_3()
    L0_3 = L26_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L37_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L27_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L38_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L27_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "tap"
    L3_3 = L38_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L5_1 = L45_2
  L45_2 = L42_2
  L45_2()
  L45_2 = L6_2.createTable
  L46_2 = {}
  L47_2 = L22_2
  L45_2(L46_2, L47_2)
  L45_2 = L23_2.createTable
  L46_2 = L41_2
  L46_2 = L46_2()
  L47_2 = L2_2
  L45_2(L46_2, L47_2)
  L45_2 = L43_2
  L45_2()
  L45_2 = timer
  L45_2 = L45_2.performWithDelay
  L46_2 = 200
  L47_2 = L44_2
  L45_2 = L45_2(L46_2, L47_2)
  L19_2 = L45_2
  L45_2 = 1
  L46_2 = L0_1
  L46_2 = L46_2.data
  L46_2 = L46_2.clans
  L46_2 = L46_2.messagelog
  L46_2 = #L46_2
  L47_2 = 1
  for L48_2 = L45_2, L46_2, L47_2 do
    L49_2 = L9_1
    L50_2 = L0_1
    L50_2 = L50_2.data
    L50_2 = L50_2.clans
    L50_2 = L50_2.messagelog
    L50_2 = L50_2[L48_2]
    L49_2(L50_2)
  end
  L45_2 = L0_1
  L45_2 = L45_2.data
  L45_2 = L45_2.clans
  L45_2 = L45_2.hasUpdatedClanLog
  if L45_2 then
    L45_2 = L11_1
    L45_2()
  end
  L8_2 = L39_2.y
  L45_2 = L6_2.getTable
  L45_2 = L45_2()
  L9_2 = L45_2.y
  L45_2 = L7_1
  L10_2 = L45_2.y
  L11_2 = L28_2.y
end

L4_1.create = L13_1

function L13_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = A0_2.view
  L3_2 = false
  L4_2 = A1_2.phase
  if L4_2 == "will" then
    return
  end
  L5_2 = os
  L5_2 = L5_2.time
  L5_2 = L5_2()
  L6_2 = require
  L7_2 = "lua.modules.androidBackButton"
  L6_2 = L6_2(L7_2)
  L7_2 = isAndroid
  if not L7_2 then
    L7_2 = isSimulator
    if not L7_2 then
      L7_2 = L8_1
      L8_2 = true
      L7_2(L8_2)
      L7_2 = native
      L7_2 = L7_2.setKeyboardFocus
      L8_2 = L7_1
      L7_2(L8_2)
    end
  end
  
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = L3_2
    if L1_3 then
      return
    end
    L1_3 = A0_3.m
    L2_3 = L2_1
    L2_3 = L2_3.getClanMessageLog
    L2_3 = L2_3()
    if L1_3 == L2_3 then
      L1_3 = A0_3.r
      if L1_3 then
        return
      end
      L1_3 = L12_1
      L1_3()
      L1_3 = 1
      L2_3 = L0_1
      L2_3 = L2_3.data
      L2_3 = L2_3.clans
      L2_3 = L2_3.messagelog
      L2_3 = #L2_3
      L3_3 = 1
      for L4_3 = L1_3, L2_3, L3_3 do
        L5_3 = L9_1
        L6_3 = L0_1
        L6_3 = L6_3.data
        L6_3 = L6_3.clans
        L6_3 = L6_3.messagelog
        L6_3 = L6_3[L4_3]
        L5_3(L6_3)
      end
      L1_3 = {}
      L1_3.message = "Never share your account information!"
      L2_3 = {}
      L3_3 = 0.6
      L4_3 = 0.2
      L5_3 = 0.3
      L2_3[1] = L3_3
      L2_3[2] = L4_3
      L2_3[3] = L5_3
      L1_3.color = L2_3
      L2_3 = L9_1
      L3_3 = L1_3
      L2_3(L3_3)
      L2_3 = L11_1
      L2_3()
    else
      L1_3 = A0_3.m
      L2_3 = L2_1
      L2_3 = L2_3.receiveClanMessage
      L2_3 = L2_3()
      if L1_3 == L2_3 then
        L1_3 = A0_3.r
        if L1_3 then
          return
        end
        L1_3 = tonumber
        L2_3 = A0_3.a
        L2_3 = L2_3.e
        L1_3 = L1_3(L2_3)
        if L1_3 == 9 then
          L2_3 = A0_3.a
          L2_3 = L2_3.a
          L2_3 = L2_3[1]
          if L2_3 == "true" then
            L3_3 = L0_1
            L3_3 = L3_3.data
            L3_3 = L3_3.clans
            L3_3.open = true
          elseif L2_3 == "false" then
            L3_3 = L0_1
            L3_3 = L3_3.data
            L3_3 = L3_3.clans
            L3_3.open = false
          end
        end
        L2_3 = L9_1
        L3_3 = L0_1
        L3_3 = L3_3.data
        L3_3 = L3_3.clans
        L3_3 = L3_3.messagelog
        L4_3 = L0_1
        L4_3 = L4_3.data
        L4_3 = L4_3.clans
        L4_3 = L4_3.messagelog
        L4_3 = #L4_3
        L3_3 = L3_3[L4_3]
        L2_3(L3_3)
        L2_3 = L0_1
        L2_3 = L2_3.clanUtils
        L2_3 = L2_3.eventTypes
        L2_3 = L2_3.join
        if L1_3 ~= L2_3 then
          L2_3 = L0_1
          L2_3 = L2_3.clanUtils
          L2_3 = L2_3.eventTypes
          L2_3 = L2_3.leave
          if L1_3 ~= L2_3 then
            L2_3 = L0_1
            L2_3 = L2_3.clanUtils
            L2_3 = L2_3.eventTypes
            L2_3 = L2_3.kick
            if L1_3 ~= L2_3 then
              goto lbl_111
            end
          end
        end
        L2_3 = L10_1
        L2_3()
      end
    end
    ::lbl_111::
  end
  
  L8_2 = L0_1
  L8_2 = L8_2.comm
  L8_2 = L8_2.setCallback
  L9_2 = L7_2
  L8_2(L9_2)
  
  function L8_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = true
    L3_2 = L0_3
    L0_3 = L6_2
    L0_3 = L0_3.isOverlay
    L1_3 = false
    L0_3(L1_3)
    L0_3 = L0_1
    L0_3 = L0_3.clanUtils
    L0_3 = L0_3.clearUnreadMessages
    L0_3()
    L0_3 = L0_1
    L0_3 = L0_3.clanUtils
    L0_3 = L0_3.clearUnreadEvents
    L0_3()
    L0_3 = os
    L0_3 = L0_3.time
    L0_3 = L0_3()
    L1_3 = L5_2
    L0_3 = L0_3 - L1_3
    L1_3 = L0_1
    L1_3 = L1_3.analytics
    L1_3 = L1_3.newEvent
    L2_3 = "design"
    L3_3 = {}
    L3_3.event_id = "clans:timeInChat"
    L4_3 = L0_1
    L4_3 = L4_3.config
    L4_3 = L4_3.fullVersion
    L3_3.area = L4_3
    L4_3 = L0_3 or L4_3
    if not L0_3 then
      L4_3 = -1
    end
    L3_3.value = L4_3
    L1_3(L2_3, L3_3)
  end
  
  L6_1 = L8_2
  L8_2 = L0_1
  L8_2 = L8_2.data
  L8_2 = L8_2.clans
  L8_2 = L8_2.hasUpdatedClanLog
  if not L8_2 then
    L8_2 = L0_1
    L8_2 = L8_2.comm
    L8_2 = L8_2.getClanMessageLog
    L8_2()
  end
  L8_2 = L0_1
  L8_2 = L8_2.clanUtils
  L8_2 = L8_2.clearUnreadMessages
  L8_2()
  L8_2 = L0_1
  L8_2 = L8_2.clanUtils
  L8_2 = L8_2.clearUnreadEvents
  L8_2()
  L8_2 = L6_2.isOverlay
  L9_2 = true
  L8_2(L9_2)
end

L4_1.show = L13_1

function L13_1(A0_2, A1_2)
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
  L3_2 = L6_1
  if L3_2 then
    L3_2 = L6_1
    L3_2()
    L3_2 = nil
    L6_1 = L3_2
  end
end

L4_1.hide = L13_1

function L13_1(A0_2, A1_2)
  local L2_2
  L2_2 = L5_1
  if L2_2 then
    L2_2 = L5_1
    L2_2()
    L2_2 = nil
    L5_1 = L2_2
  end
end

L4_1.destroy = L13_1
L14_1 = L4_1
L13_1 = L4_1.addEventListener
L15_1 = "create"
L16_1 = L4_1
L13_1(L14_1, L15_1, L16_1)
L14_1 = L4_1
L13_1 = L4_1.addEventListener
L15_1 = "show"
L16_1 = L4_1
L13_1(L14_1, L15_1, L16_1)
L14_1 = L4_1
L13_1 = L4_1.addEventListener
L15_1 = "hide"
L16_1 = L4_1
L13_1(L14_1, L15_1, L16_1)
L14_1 = L4_1
L13_1 = L4_1.addEventListener
L15_1 = "destroy"
L16_1 = L4_1
L13_1(L14_1, L15_1, L16_1)
return L4_1
