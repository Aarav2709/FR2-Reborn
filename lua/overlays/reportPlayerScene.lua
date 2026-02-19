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
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2
  L2_2 = A0_2.view
  L3_2 = require
  L4_2 = "lua.modules.reportingModule"
  L3_2 = L3_2(L4_2)
  L4_2 = require
  L5_2 = "lua.modules.timeFormat"
  L4_2 = L4_2(L5_2)
  L5_2 = nil
  L6_2 = nil
  L7_2 = {}
  L8_1 = L7_2
  L7_2 = A1_2.params
  L7_2 = L7_2.playerToReport
  L8_2 = L8_1
  L9_2 = A1_2.params
  L9_2 = L9_2.position
  if not L9_2 then
    L9_2 = -1
  end
  L8_2.position = L9_2
  L8_2 = A1_2.params
  L8_2 = L8_2.chatLog
  if not L8_2 then
    L8_2 = nil
  end
  L9_2 = ""
  L10_2 = A1_2.params
  L10_2 = L10_2.playerName
  if L10_2 then
    L10_2 = A1_2.params
    L9_2 = L10_2.playerName
  end
  L10_2 = L3_2.createReport
  L11_2 = L7_2
  L12_2 = nil
  L10_2 = L10_2(L11_2, L12_2)
  L11_2 = L10_2.setReasonById
  L12_2 = 1
  L11_2(L12_2)
  L10_2.chatLog = L8_2
  L11_2 = display
  L11_2 = L11_2.newRect
  L12_2 = 0
  L13_2 = 0
  L14_2 = display
  L14_2 = L14_2.contentWidth
  L15_2 = display
  L15_2 = L15_2.contentHeight
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
  L11_2.anchorX = 0
  L11_2.anchorY = 0
  L13_2 = L11_2
  L12_2 = L11_2.setFillColor
  L14_2 = 0
  L15_2 = 0
  L16_2 = 0
  L17_2 = 0.5882352941176471
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
  L11_2.x = 0
  L11_2.y = 0
  L12_2 = display
  L12_2 = L12_2.newImageRect
  L13_2 = "images/gui/postgame/report/window.png"
  L14_2 = 240
  L15_2 = 167
  L12_2 = L12_2(L13_2, L14_2, L15_2)
  L12_2.anchorX = 0.5
  L12_2.anchorY = 0
  L12_2.x = 240
  L12_2.y = 40
  L13_2 = L0_1
  L13_2 = L13_2.newText
  L14_2 = {}
  L15_2 = L0_1
  L15_2 = L15_2.localized
  L15_2 = L15_2.get
  L16_2 = "Report Player"
  L15_2 = L15_2(L16_2)
  L14_2.string = L15_2
  L14_2.size = 24
  L15_2 = {}
  L16_2 = 1
  L17_2 = 1
  L18_2 = 1
  L15_2[1] = L16_2
  L15_2[2] = L17_2
  L15_2[3] = L18_2
  L14_2.color = L15_2
  L14_2.ax = 0.5
  L13_2 = L13_2(L14_2)
  L13_2.x = 240
  L14_2 = L12_2.y
  L14_2 = L14_2 + 15
  L13_2.y = L14_2
  L14_2 = L0_1
  L14_2 = L14_2.newText
  L15_2 = {}
  L16_2 = L0_1
  L16_2 = L16_2.localized
  L16_2 = L16_2.get
  L17_2 = "Reason for report"
  L16_2 = L16_2(L17_2)
  L17_2 = ":"
  L16_2 = L16_2 .. L17_2
  L15_2.string = L16_2
  L15_2.size = 15
  L16_2 = {}
  L17_2 = 1
  L18_2 = 1
  L19_2 = 1
  L16_2[1] = L17_2
  L16_2[2] = L18_2
  L16_2[3] = L19_2
  L15_2.color = L16_2
  L15_2.ax = 0.5
  L14_2 = L14_2(L15_2)
  L14_2.x = 240
  L15_2 = L12_2.y
  L15_2 = L15_2 + 84
  L14_2.y = L15_2
  L15_2 = L0_1
  L15_2 = L15_2.newText
  L16_2 = {}
  L16_2.string = ""
  L16_2.size = 20
  L17_2 = {}
  L18_2 = 1
  L19_2 = 1
  L20_2 = 1
  L17_2[1] = L18_2
  L17_2[2] = L19_2
  L17_2[3] = L20_2
  L16_2.color = L17_2
  L16_2.ax = 0.5
  L15_2 = L15_2(L16_2)
  L15_2.x = 240
  L16_2 = L12_2.y
  L16_2 = L16_2 + 106
  L15_2.y = L16_2
  L16_2 = L0_1
  L16_2 = L16_2.localized
  L16_2 = L16_2.get
  L17_2 = L10_2.reason
  L16_2 = L16_2(L17_2)
  L15_2.text = L16_2
  L16_2 = L0_1
  L16_2 = L16_2.newText
  L17_2 = {}
  L17_2.string = ""
  L17_2.size = 10
  L18_2 = {}
  L19_2 = 1
  L20_2 = 1
  L21_2 = 1
  L18_2[1] = L19_2
  L18_2[2] = L20_2
  L18_2[3] = L21_2
  L17_2.color = L18_2
  L17_2.ax = 0.5
  L16_2 = L16_2(L17_2)
  L16_2.x = 220
  L17_2 = L12_2.y
  L17_2 = L17_2 + 138
  L16_2.y = L17_2
  L17_2 = L0_1
  L17_2 = L17_2.localized
  L17_2 = L17_2.get
  L18_2 = "Include chatlog:"
  L17_2 = L17_2(L18_2)
  L16_2.text = L17_2
  L17_2 = nil
  L18_2 = true
  L19_2 = nil
  L20_2 = nil
  
  function L21_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = L18_2
      L1_3 = not L1_3
      L18_2 = L1_3
      L1_3 = L20_2
      L1_3()
      L1_3 = L18_2
      if L1_3 then
        L1_3 = L10_2
        L1_3.chatLog = true
      else
        L1_3 = L10_2
        L1_3.chatLog = false
      end
    end
  end
  
  function L20_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = L16_2
    L0_3 = L0_3.x
    L0_3 = L0_3 + 54
    L1_3 = "images/gui/settings/toggleOn.png"
    L2_3 = L0_1
    L2_3 = L2_3.localized
    L2_3 = L2_3.get
    L3_3 = "Yes"
    L2_3 = L2_3(L3_3)
    L3_3 = L19_2
    if L3_3 then
      L3_3 = L19_2
      L4_3 = L3_3
      L3_3 = L3_3.removeSelf
      L3_3(L4_3)
      L3_3 = nil
      L19_2 = L3_3
    end
    L3_3 = L17_2
    if L3_3 then
      L3_3 = L17_2
      L4_3 = L3_3
      L3_3 = L3_3.removeEventListener
      L5_3 = "touch"
      L6_3 = L21_2
      L3_3(L4_3, L5_3, L6_3)
      L3_3 = L17_2
      L4_3 = L3_3
      L3_3 = L3_3.removeSelf
      L3_3(L4_3)
      L3_3 = nil
      L17_2 = L3_3
    end
    L3_3 = L0_1
    L3_3 = L3_3.newText
    L4_3 = {}
    L4_3.string = L2_3
    L4_3.size = 9
    L4_3.ax = 0
    L4_3.ay = 0.5
    L3_3 = L3_3(L4_3)
    L19_2 = L3_3
    L3_3 = L19_2
    L4_3 = L0_3 + 2
    L3_3.x = L4_3
    L3_3 = L19_2
    L4_3 = L16_2
    L4_3 = L4_3.y
    L3_3.y = L4_3
    L3_3 = L18_2
    if not L3_3 then
      L1_3 = "images/gui/settings/toggleOff.png"
      L3_3 = L19_2
      L4_3 = L0_1
      L4_3 = L4_3.localized
      L4_3 = L4_3.get
      L5_3 = "No"
      L4_3 = L4_3(L5_3)
      L3_3.text = L4_3
      L3_3 = L19_2
      L4_3 = L0_3 - 12
      L3_3.x = L4_3
      L3_3 = L19_2
      L4_3 = L3_3
      L3_3 = L3_3.setFillColor
      L5_3 = 1
      L6_3 = 1
      L7_3 = 1
      L3_3(L4_3, L5_3, L6_3, L7_3)
    end
    L3_3 = display
    L3_3 = L3_3.newImageRect
    L4_3 = L1_3
    L5_3 = 62
    L6_3 = 34
    L3_3 = L3_3(L4_3, L5_3, L6_3)
    L17_2 = L3_3
    L3_3 = L17_2
    L4_3 = L3_3
    L3_3 = L3_3.scale
    L5_3 = 0.6
    L6_3 = 0.6
    L3_3(L4_3, L5_3, L6_3)
    L3_3 = L17_2
    L3_3.anchorX = 0.5
    L3_3 = L17_2
    L3_3.anchorY = 0
    L3_3 = L17_2
    L3_3.x = L0_3
    L3_3 = L17_2
    L4_3 = L16_2
    L4_3 = L4_3.y
    L4_3 = L4_3 - 10
    L3_3.y = L4_3
    L3_3 = L17_2
    L4_3 = L3_3
    L3_3 = L3_3.addEventListener
    L5_3 = "touch"
    L6_3 = L21_2
    L3_3(L4_3, L5_3, L6_3)
    L3_3 = L2_2
    L4_3 = L3_3
    L3_3 = L3_3.insert
    L5_3 = L17_2
    L3_3(L4_3, L5_3)
    L3_3 = L2_2
    L4_3 = L3_3
    L3_3 = L3_3.insert
    L5_3 = L19_2
    L3_3(L4_3, L5_3)
  end
  
  L22_2 = L20_2
  L22_2()
  if not L8_2 then
    L18_2 = false
    L16_2.isVisible = false
    L17_2.isVisible = false
    L19_2.isVisible = false
  end
  L22_2 = L0_1
  L22_2 = L22_2.newText
  L23_2 = {}
  L23_2.string = ""
  L23_2.size = 15
  L24_2 = {}
  L25_2 = 1
  L26_2 = 1
  L27_2 = 1
  L24_2[1] = L25_2
  L24_2[2] = L26_2
  L24_2[3] = L27_2
  L23_2.color = L24_2
  L23_2.ax = 0.5
  L22_2 = L22_2(L23_2)
  L22_2.x = 240
  L23_2 = L12_2.y
  L23_2 = L23_2 + 45
  L22_2.y = L23_2
  L23_2 = L0_1
  L23_2 = L23_2.localized
  L23_2 = L23_2.get
  L24_2 = "Getting report status..."
  L23_2 = L23_2(L24_2)
  L22_2.text = L23_2
  L23_2 = L0_1
  L23_2 = L23_2.newText
  L24_2 = {}
  L25_2 = L0_1
  L25_2 = L25_2.localized
  L25_2 = L25_2.get
  L26_2 = "Report player: "
  L25_2 = L25_2(L26_2)
  L26_2 = L9_2
  L25_2 = L25_2 .. L26_2
  L24_2.string = L25_2
  L24_2.size = 15
  L25_2 = {}
  L26_2 = 1
  L27_2 = 1
  L28_2 = 1
  L25_2[1] = L26_2
  L25_2[2] = L27_2
  L25_2[3] = L28_2
  L24_2.color = L25_2
  L24_2.ax = 0.5
  L23_2 = L23_2(L24_2)
  L23_2.x = 240
  L24_2 = L12_2.y
  L24_2 = L24_2 + 65
  L23_2.y = L24_2
  
  function L24_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  function L25_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L4_1
    if L0_3 then
      L0_3 = L4_1
      if 0 < L0_3 then
        L0_3 = L22_2
        L1_3 = L0_1
        L1_3 = L1_3.localized
        L1_3 = L1_3.get
        L2_3 = "NumberOfRemainingReports"
        L1_3 = L1_3(L2_3)
        L2_3 = " : "
        L3_3 = L4_1
        L1_3 = L1_3 .. L2_3 .. L3_3
        L0_3.text = L1_3
        L0_3 = L7_1
        L0_3()
    end
    else
      L0_3 = L5_1
      if L0_3 then
        L0_3 = L22_2
        L1_3 = L0_1
        L1_3 = L1_3.localized
        L1_3 = L1_3.get
        L2_3 = "TimeToNextReport"
        L1_3 = L1_3(L2_3)
        L2_3 = " : "
        L3_3 = math
        L3_3 = L3_3.ceil
        L4_3 = L4_2
        L4_3 = L4_3.millisToHours
        L5_3 = L5_1
        L4_3, L5_3 = L4_3(L5_3)
        L3_3 = L3_3(L4_3, L5_3)
        L4_3 = "h"
        L1_3 = L1_3 .. L2_3 .. L3_3 .. L4_3
        L0_3.text = L1_3
      else
        L0_3 = L22_2
        L1_3 = L0_1
        L1_3 = L1_3.localized
        L1_3 = L1_3.get
        L2_3 = "Could not get report status"
        L1_3 = L1_3(L2_3)
        L0_3.text = L1_3
        L0_3 = timer
        L0_3 = L0_3.performWithDelay
        L1_3 = 2000
        L2_3 = L24_2
        L3_3 = 1
        L0_3 = L0_3(L1_3, L2_3, L3_3)
        L6_2 = L0_3
      end
    end
  end
  
  L6_1 = L25_2
  
  function L25_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = L10_2
    L1_3 = L1_3.reasonId
    L1_3 = L1_3 + A0_3
    if L1_3 < 1 then
      L2_3 = L3_2
      L2_3 = L2_3.getReasons
      L2_3 = L2_3()
      L1_3 = #L2_3
    else
      L2_3 = L3_2
      L2_3 = L2_3.getReasons
      L2_3 = L2_3()
      L2_3 = #L2_3
      if L1_3 > L2_3 then
        L1_3 = 1
      end
    end
    L2_3 = L10_2
    L2_3 = L2_3.setReasonById
    L3_3 = L1_3
    L2_3(L3_3)
    L2_3 = L15_2
    L3_3 = L0_1
    L3_3 = L3_3.localized
    L3_3 = L3_3.get
    L4_3 = L10_2
    L4_3 = L4_3.reason
    L3_3 = L3_3(L4_3)
    L2_3.text = L3_3
  end
  
  function L26_2()
    local L0_3, L1_3
    L0_3 = L25_2
    L1_3 = -1
    L0_3(L1_3)
  end
  
  function L27_2()
    local L0_3, L1_3
    L0_3 = L25_2
    L1_3 = 1
    L0_3(L1_3)
  end
  
  L28_2 = L0_1
  L28_2 = L28_2.newButton
  L29_2 = {}
  L29_2.image = "images/gui/practice/right.png"
  L29_2.width = 45
  L29_2.height = 45
  L29_2.onRelease = L27_2
  L29_2.x = 358
  L30_2 = L15_2.y
  L30_2 = L30_2 + 4
  L29_2.y = L30_2
  L28_2 = L28_2(L29_2)
  L29_2 = L0_1
  L29_2 = L29_2.newButton
  L30_2 = {}
  L30_2.image = "images/gui/practice/left.png"
  L30_2.width = 45
  L30_2.height = 45
  L30_2.onRelease = L26_2
  L30_2.x = 124
  L31_2 = L15_2.y
  L31_2 = L31_2 + 4
  L30_2.y = L31_2
  L29_2 = L29_2(L30_2)
  
  function L30_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L10_2
    L0_3 = L0_3.chatLog
    if L0_3 then
      L0_3 = print
      L1_3 = "Include chat log. Send via game server"
      L0_3(L1_3)
      L0_3 = require
      L1_3 = "lua.network.tcpClient"
      L0_3 = L0_3(L1_3)
      L1_3 = L0_3.sendPlayerReportMessage
      L2_3 = L10_2
      L2_3 = L2_3.playerToReport
      L3_3 = L10_2
      L3_3 = L3_3.reasonId
      L1_3(L2_3, L3_3)
    else
      L0_3 = print
      L1_3 = "No chat log. Send normally."
      L0_3(L1_3)
      L0_3 = L0_1
      L0_3 = L0_3.comm
      L0_3 = L0_3.sendReportPlayer
      L1_3 = L10_2
      L1_3 = L1_3.playerToReport
      L2_3 = L10_2
      L2_3 = L2_3.gameId
      L3_3 = L10_2
      L3_3 = L3_3.reasonId
      L0_3(L1_3, L2_3, L3_3)
    end
    L0_3 = L8_1
    L0_3.reportSent = true
    L0_3 = L14_2
    L1_3 = L0_1
    L1_3 = L1_3.localized
    L1_3 = L1_3.get
    L2_3 = "Report Sent!"
    L1_3 = L1_3(L2_3)
    L0_3.text = L1_3
    L0_3 = L7_1
    L0_3()
    L0_3 = timer
    L0_3 = L0_3.performWithDelay
    L1_3 = 1000
    L2_3 = L24_2
    L3_3 = 1
    L0_3 = L0_3(L1_3, L2_3, L3_3)
    L6_2 = L0_3
  end
  
  L31_2 = L0_1
  L31_2 = L31_2.newButton
  L32_2 = {}
  L32_2.image = "images/gui/common/buttonTextB.png"
  L32_2.width = 126
  L32_2.height = 40
  L33_2 = L0_1
  L33_2 = L33_2.localized
  L33_2 = L33_2.get
  L34_2 = "Send report"
  L33_2 = L33_2(L34_2)
  L32_2.text = L33_2
  L32_2.onRelease = L30_2
  L32_2.x = 240
  L33_2 = L12_2.y
  L33_2 = L33_2 + 170
  L32_2.y = L33_2
  L31_2 = L31_2(L32_2)
  L5_2 = L31_2
  
  function L31_2()
    local L0_3, L1_3
    L0_3 = L5_2
    L1_3 = L5_2
    L1_3 = L1_3.isVisible
    L1_3 = not L1_3
    L0_3.isVisible = L1_3
    L0_3 = L29_2
    L1_3 = L29_2
    L1_3 = L1_3.isVisible
    L1_3 = not L1_3
    L0_3.isVisible = L1_3
    L0_3 = L28_2
    L1_3 = L28_2
    L1_3 = L1_3.isVisible
    L1_3 = not L1_3
    L0_3.isVisible = L1_3
  end
  
  L7_1 = L31_2
  L31_2 = L7_1
  L31_2()
  
  function L31_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  function L32_2(A0_3)
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
  
  function L33_2(A0_3)
    local L1_3
    L1_3 = true
    return L1_3
  end
  
  L34_2 = L0_1
  L34_2 = L34_2.newButton
  L35_2 = {}
  L35_2.x = 342
  L36_2 = L12_2.y
  L36_2 = L36_2 + 30
  L35_2.y = L36_2
  L35_2.width = 43
  L35_2.height = 38
  L35_2.image = "images/gui/common/buttonClosePopup.png"
  L35_2.onRelease = L31_2
  L34_2 = L34_2(L35_2)
  
  function L35_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L32_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L12_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L33_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L36_2()
    local L0_3, L1_3, L2_3, L3_3
    L4_1 = L0_3
    L0_3 = nil
    L5_1 = L0_3
    L0_3 = nil
    L8_1 = L0_3
    L0_3 = L6_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L6_2
      L0_3(L1_3)
      L0_3 = nil
      L6_2 = L0_3
    end
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L32_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L12_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L33_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L36_2
  
  function L36_2()
    local L0_3, L1_3, L2_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L11_2
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
    L2_3 = L14_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L22_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L23_2
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
    L2_3 = L17_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L19_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L29_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L28_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L5_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L34_2
    L0_3(L1_3, L2_3)
  end
  
  L37_2 = L35_2
  L37_2()
  L37_2 = L36_2
  L37_2()
end

L1_1.create = L9_1

function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A1_2.phase
  if L2_2 == "will" then
    return
  end
  L3_2 = false
  L4_2 = require
  L5_2 = "lua.modules.androidBackButton"
  L4_2 = L4_2(L5_2)
  L5_2 = require
  L6_2 = "lua.network.tcpMessageFormat"
  L5_2 = L5_2(L6_2)
  
  function L6_2(A0_3)
    local L1_3, L2_3
    L1_3 = L3_2
    if L1_3 then
      return
    end
    if A0_3 then
      L1_3 = A0_3.m
      L2_3 = L5_2
      L2_3 = L2_3.getReportStatus
      L2_3 = L2_3()
      if L1_3 == L2_3 then
        L1_3 = A0_3.s
        if L1_3 then
          L1_3 = A0_3.s
          L1_3 = L1_3.r
          L4_1 = L1_3
          L1_3 = A0_3.s
          L1_3 = L1_3.t
          L5_1 = L1_3
        end
        L1_3 = L6_1
        L1_3()
      end
    end
  end
  
  L7_2 = L0_1
  L7_2 = L7_2.comm
  L7_2 = L7_2.setCallback
  L8_2 = L6_2
  L7_2(L8_2)
  L7_2 = L0_1
  L7_2 = L7_2.comm
  L7_2 = L7_2.getReportStatus
  L7_2()
  
  function L7_2()
    local L0_3, L1_3
    L0_3 = true
    L3_2 = L0_3
    L0_3 = nil
    L4_1 = L0_3
    L0_3 = nil
    L5_1 = L0_3
    L0_3 = L4_2
    L0_3 = L0_3.isOverlay
    L1_3 = false
    L0_3(L1_3)
  end
  
  L3_1 = L7_2
  L7_2 = L4_2.isOverlay
  L8_2 = true
  L7_2(L8_2)
end

L1_1.show = L9_1

function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
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
        L5_2 = L8_1
        L3_2(L4_2, L5_2)
        L3_2 = nil
        L8_1 = L3_2
      end
    end
    return
  end
  L3_2 = L3_1
  L3_2()
end

L1_1.hide = L9_1

function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2.view
  L3_2 = A1_2.parent
  if L3_2 then
    L3_2 = A1_2.parent
    L3_2 = L3_2.overlayEnded
    if L3_2 then
      L3_2 = A1_2.parent
      L4_2 = L3_2
      L3_2 = L3_2.overlayEnded
      L5_2 = L8_1
      L3_2(L4_2, L5_2)
      L3_2 = nil
      L8_1 = L3_2
    end
  end
  L3_2 = L2_1
  return L3_2()
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
