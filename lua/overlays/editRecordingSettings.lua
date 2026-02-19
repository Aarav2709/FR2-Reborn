local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2
  L2_2 = A0_2.view
  L3_2 = {}
  L4_2 = {}
  L5_2 = {}
  L6_2 = {}
  L7_2 = display
  L7_2 = L7_2.newGroup
  L7_2 = L7_2()
  L8_2 = nil
  L9_2 = nil
  L10_2 = L0_1
  L10_2 = L10_2.database
  L10_2 = L10_2.shouldAutoRecord
  L10_2 = L10_2()
  L5_2[1] = L10_2
  L10_2 = L0_1
  L10_2 = L10_2.database
  L10_2 = L10_2.shouldUseMic
  L10_2 = L10_2()
  L5_2[2] = L10_2
  L10_2 = display
  L10_2 = L10_2.newImageRect
  L11_2 = "images/gui/settings/pushWindow.png"
  L12_2 = 330
  L13_2 = 240
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L10_2.anchorX = 0.5
  L10_2.anchorY = 0
  L10_2.x = 240
  L10_2.y = 0
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
  L12_2 = L0_1
  L12_2 = L12_2.newText
  L13_2 = {}
  L14_2 = L0_1
  L14_2 = L14_2.localized
  L14_2 = L14_2.get
  L15_2 = "Record settings"
  L14_2 = L14_2(L15_2)
  L13_2.string = L14_2
  L13_2.x = 240
  L13_2.y = 60
  L13_2.size = 20
  L14_2 = {}
  L15_2 = 1
  L16_2 = 1
  L17_2 = 1
  L14_2[1] = L15_2
  L14_2[2] = L16_2
  L14_2[3] = L17_2
  L13_2.color = L14_2
  L12_2 = L12_2(L13_2)
  L13_2 = L0_1
  L13_2 = L13_2.newText
  L14_2 = {}
  L15_2 = L0_1
  L15_2 = L15_2.localized
  L15_2 = L15_2.get
  L16_2 = "Auto record games"
  L15_2 = L15_2(L16_2)
  L14_2.string = L15_2
  L14_2.ax = 1
  L14_2.x = 280
  L14_2.y = 95
  L14_2.size = 22
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
  L14_2 = L14_2.newText
  L15_2 = {}
  L16_2 = L0_1
  L16_2 = L16_2.localized
  L16_2 = L16_2.get
  L17_2 = "Use microphone"
  L16_2 = L16_2(L17_2)
  L15_2.string = L16_2
  L15_2.ax = 1
  L15_2.x = 280
  L15_2.y = 135
  L15_2.size = 22
  L16_2 = {}
  L17_2 = 1
  L18_2 = 1
  L19_2 = 1
  L16_2[1] = L17_2
  L16_2[2] = L18_2
  L16_2[3] = L19_2
  L15_2.color = L16_2
  L14_2 = L14_2(L15_2)
  L15_2 = L0_1
  L15_2 = L15_2.newText
  L16_2 = {}
  L17_2 = L0_1
  L17_2 = L17_2.localized
  L17_2 = L17_2.get
  L18_2 = ""
  L17_2 = L17_2(L18_2)
  L16_2.string = L17_2
  L16_2.ax = 0.5
  L16_2.x = 240
  L16_2.y = 165
  L16_2.size = 14
  L17_2 = {}
  L18_2 = 1
  L19_2 = 1
  L20_2 = 1
  L17_2[1] = L18_2
  L17_2[2] = L19_2
  L17_2[3] = L20_2
  L16_2.color = L17_2
  L15_2 = L15_2(L16_2)
  L16_2 = L0_1
  L16_2 = L16_2.newText
  L17_2 = {}
  L18_2 = L0_1
  L18_2 = L18_2.localized
  L18_2 = L18_2.get
  L19_2 = "Start recording"
  L18_2 = L18_2(L19_2)
  L17_2.string = L18_2
  L17_2.ax = 0.5
  L17_2.x = 160
  L17_2.y = 227
  L17_2.size = 12
  L18_2 = {}
  L19_2 = 1
  L20_2 = 1
  L21_2 = 1
  L18_2[1] = L19_2
  L18_2[2] = L20_2
  L18_2[3] = L21_2
  L17_2.color = L18_2
  L16_2 = L16_2(L17_2)
  L17_2 = L0_1
  L17_2 = L17_2.newText
  L18_2 = {}
  L19_2 = L0_1
  L19_2 = L19_2.localized
  L19_2 = L19_2.get
  L20_2 = "Start broadcasting"
  L19_2 = L19_2(L20_2)
  L18_2.string = L19_2
  L18_2.ax = 0.5
  L18_2.x = 320
  L18_2.y = 227
  L18_2.size = 12
  L19_2 = {}
  L20_2 = 1
  L21_2 = 1
  L22_2 = 1
  L19_2[1] = L20_2
  L19_2[2] = L21_2
  L19_2[3] = L22_2
  L18_2.color = L19_2
  L17_2 = L17_2(L18_2)
  
  function L18_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = "images/gui/settings/toggleOn.png"
    L2_3 = L0_1
    L2_3 = L2_3.localized
    L2_3 = L2_3.get
    L3_3 = "On"
    L2_3 = L2_3(L3_3)
    L3_3 = L4_2
    L3_3 = L3_3[A0_3]
    if L3_3 then
      L3_3 = L4_2
      L3_3 = L3_3[A0_3]
      L4_3 = L3_3
      L3_3 = L3_3.removeSelf
      L3_3(L4_3)
      L3_3 = L4_2
      L3_3[A0_3] = nil
    end
    L3_3 = L3_2
    L3_3 = L3_3[A0_3]
    if L3_3 then
      L3_3 = L3_2
      L3_3 = L3_3[A0_3]
      L4_3 = L3_3
      L3_3 = L3_3.removeEventListener
      L5_3 = "touch"
      L6_3 = L6_2
      L6_3 = L6_3[A0_3]
      L3_3(L4_3, L5_3, L6_3)
      L3_3 = L3_2
      L3_3 = L3_3[A0_3]
      L4_3 = L3_3
      L3_3 = L3_3.removeSelf
      L3_3(L4_3)
      L3_3 = L3_2
      L3_3[A0_3] = nil
    end
    L3_3 = L4_2
    L4_3 = L0_1
    L4_3 = L4_3.newText
    L5_3 = {}
    L5_3.string = L2_3
    L5_3.size = 14
    L5_3.ax = 0
    L5_3.ay = 0.5
    L4_3 = L4_3(L5_3)
    L3_3[A0_3] = L4_3
    L3_3 = L4_2
    L3_3 = L3_3[A0_3]
    L3_3.x = 348
    L3_3 = L4_2
    L3_3 = L3_3[A0_3]
    L4_3 = A0_3 - 1
    L4_3 = L4_3 * 40
    L4_3 = 95 + L4_3
    L3_3.y = L4_3
    L3_3 = L5_2
    L3_3 = L3_3[A0_3]
    if L3_3 == 0 then
      L1_3 = "images/gui/settings/toggleOff.png"
      L3_3 = L4_2
      L3_3 = L3_3[A0_3]
      L4_3 = L0_1
      L4_3 = L4_3.localized
      L4_3 = L4_3.get
      L5_3 = "Off"
      L4_3 = L4_3(L5_3)
      L3_3.text = L4_3
      L3_3 = L4_2
      L3_3 = L3_3[A0_3]
      L3_3.x = 320
      L3_3 = L4_2
      L3_3 = L3_3[A0_3]
      L4_3 = L3_3
      L3_3 = L3_3.setFillColor
      L5_3 = 1
      L6_3 = 1
      L7_3 = 1
      L3_3(L4_3, L5_3, L6_3, L7_3)
    end
    L3_3 = L3_2
    L4_3 = display
    L4_3 = L4_3.newImageRect
    L5_3 = L1_3
    L6_3 = 62
    L7_3 = 34
    L4_3 = L4_3(L5_3, L6_3, L7_3)
    L3_3[A0_3] = L4_3
    L3_3 = L3_2
    L3_3 = L3_3[A0_3]
    L3_3.anchorX = 0.5
    L3_3 = L3_2
    L3_3 = L3_3[A0_3]
    L3_3.anchorY = 0
    L3_3 = L3_2
    L3_3 = L3_3[A0_3]
    L3_3.x = 340
    L3_3 = L3_2
    L3_3 = L3_3[A0_3]
    L4_3 = A0_3 - 1
    L4_3 = L4_3 * 40
    L4_3 = 79 + L4_3
    L3_3.y = L4_3
    L3_3 = L3_2
    L3_3 = L3_3[A0_3]
    L4_3 = L3_3
    L3_3 = L3_3.addEventListener
    L5_3 = "touch"
    L6_3 = L6_2
    L6_3 = L6_3[A0_3]
    L3_3(L4_3, L5_3, L6_3)
    L3_3 = L2_2
    L4_3 = L3_3
    L3_3 = L3_3.insert
    L5_3 = L3_2
    L5_3 = L5_3[A0_3]
    L3_3(L4_3, L5_3)
    L3_3 = L2_2
    L4_3 = L3_3
    L3_3 = L3_3.insert
    L5_3 = L4_2
    L5_3 = L5_3[A0_3]
    L3_3(L4_3, L5_3)
  end
  
  function L19_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = "off"
    L2_3 = L5_2
    L2_3 = L2_3[A0_3]
    if L2_3 == 1 then
      L2_3 = L5_2
      L2_3[A0_3] = 0
    else
      L1_3 = "on"
      L2_3 = L5_2
      L2_3[A0_3] = 1
    end
    L2_3 = L18_2
    L3_3 = A0_3
    L2_3(L3_3)
    L2_3 = L0_1
    L2_3 = L2_3.database
    L2_3 = L2_3.setAutoRecord
    L3_3 = L5_2
    L3_3 = L3_3[1]
    L2_3(L3_3)
    L2_3 = L0_1
    L2_3 = L2_3.database
    L2_3 = L2_3.setMicUse
    L3_3 = L5_2
    L3_3 = L3_3[2]
    L2_3(L3_3)
  end
  
  function L20_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = L19_2
      L2_3 = 1
      L1_3(L2_3)
    end
    L1_3 = true
    return L1_3
  end
  
  L6_2[1] = L20_2
  
  function L20_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
      L1_3 = L19_2
      L2_3 = 2
      L1_3(L2_3)
    end
    L1_3 = true
    return L1_3
  end
  
  L6_2[2] = L20_2
  
  function L20_2(A0_3)
    local L1_3, L2_3
    if A0_3 then
      L1_3 = L8_2
      L1_3 = L1_3.changeButtonImage
      L2_3 = "images/gui/settings/buttonRecord.png"
      L1_3(L2_3)
      L1_3 = L16_2
      L1_3.text = "Start recording"
    else
      L1_3 = L16_2
      L1_3.text = "Stop recording"
      L1_3 = L8_2
      L1_3 = L1_3.changeButtonImage
      L2_3 = "images/gui/settings/buttonRecordStop.png"
      L1_3(L2_3)
    end
  end
  
  function L21_2(A0_3)
    local L1_3, L2_3
    if A0_3 then
      L1_3 = L17_2
      L1_3.text = "Start broadcasting"
      L1_3 = L9_2
      L1_3 = L1_3.changeButtonImage
      L2_3 = "images/gui/settings/buttonBroadcast.png"
      L1_3(L2_3)
    else
      L1_3 = L17_2
      L1_3.text = "Stop broadcasting"
      L1_3 = L9_2
      L1_3 = L1_3.changeButtonImage
      L2_3 = "images/gui/settings/buttonBroadcastStop.png"
      L1_3(L2_3)
    end
  end
  
  function L22_2(A0_3)
    local L1_3, L2_3
    L1_3 = L20_2
    L2_3 = true
    L1_3(L2_3)
    L1_3 = L15_2
    L1_3.text = ""
  end
  
  function L23_2(A0_3)
    local L1_3, L2_3
    L1_3 = L21_2
    L2_3 = true
    L1_3(L2_3)
    L1_3 = L15_2
    L1_3.text = ""
  end
  
  function L24_2(A0_3)
    local L1_3
    L1_3 = L15_2
    L1_3.text = "Broadcasting now..."
  end
  
  function L25_2(A0_3)
    local L1_3
    L1_3 = L15_2
    L1_3.text = "Recording now..."
  end
  
  function L26_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L0_1
    L0_3 = L0_3.replayKit
    L0_3 = L0_3.waitingForResponseFromPlugin
    L0_3 = L0_3()
    if L0_3 then
      return
    end
    L0_3 = L0_1
    L0_3 = L0_3.replayKit
    L0_3 = L0_3.broadcastingManual
    L0_3 = L0_3()
    if L0_3 then
      L0_3 = native
      L0_3 = L0_3.showAlert
      L1_3 = "Recording"
      L2_3 = "Stop broadcasting before you start recording"
      L3_3 = {}
      L4_3 = "Ok"
      L3_3[1] = L4_3
      L0_3(L1_3, L2_3, L3_3)
      return
    end
    L0_3 = L0_1
    L0_3 = L0_3.replayKit
    L0_3 = L0_3.recordingManual
    L0_3 = L0_3()
    if L0_3 then
      L0_3 = L20_2
      L1_3 = true
      L0_3(L1_3)
      L0_3 = L15_2
      L0_3.text = ""
      L0_3 = L0_1
      L0_3 = L0_3.replayKit
      L0_3 = L0_3.stopRecording
      L0_3()
    else
      L0_3 = L0_1
      L0_3 = L0_3.replayKit
      L0_3 = L0_3.availableToRecord
      L0_3 = L0_3()
      if L0_3 then
        L0_3 = L20_2
        L1_3 = false
        L0_3(L1_3)
        L0_3 = L0_1
        L0_3 = L0_3.replayKit
        L0_3 = L0_3.record
        L0_3()
      else
        L0_3 = native
        L0_3 = L0_3.showAlert
        L1_3 = "Recording"
        L2_3 = "Could not start recording"
        L3_3 = {}
        L4_3 = "Ok"
        L3_3[1] = L4_3
        L0_3(L1_3, L2_3, L3_3)
      end
    end
  end
  
  L27_2 = L0_1
  L27_2 = L27_2.newButton
  L28_2 = {}
  L28_2.image = "images/gui/settings/buttonRecord.png"
  L28_2.width = 88
  L28_2.height = 42
  L28_2.onRelease = L26_2
  L28_2.x = 160
  L28_2.y = 200
  L27_2 = L27_2(L28_2)
  L8_2 = L27_2
  
  function L27_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L0_1
    L0_3 = L0_3.replayKit
    L0_3 = L0_3.waitingForResponseFromPlugin
    L0_3 = L0_3()
    if L0_3 then
      return
    end
    L0_3 = L0_1
    L0_3 = L0_3.replayKit
    L0_3 = L0_3.recordingManual
    L0_3 = L0_3()
    if L0_3 then
      L0_3 = native
      L0_3 = L0_3.showAlert
      L1_3 = "Broadcasting"
      L2_3 = "Stop recording before you start broadcasting"
      L3_3 = {}
      L4_3 = "Ok"
      L3_3[1] = L4_3
      L0_3(L1_3, L2_3, L3_3)
      return
    end
    L0_3 = L0_1
    L0_3 = L0_3.replayKit
    L0_3 = L0_3.broadcastingManual
    L0_3 = L0_3()
    if L0_3 then
      L0_3 = L21_2
      L1_3 = true
      L0_3(L1_3)
      L0_3 = L15_2
      L0_3.text = ""
      L0_3 = L0_1
      L0_3 = L0_3.replayKit
      L0_3 = L0_3.stopBroadcasting
      L0_3()
    else
      L0_3 = L0_1
      L0_3 = L0_3.replayKit
      L0_3 = L0_3.availableToRecord
      L0_3 = L0_3()
      if L0_3 then
        L0_3 = L0_1
        L0_3 = L0_3.replayKit
        L0_3 = L0_3.startBroadcasting
        L0_3()
        L0_3 = L21_2
        L1_3 = false
        L0_3(L1_3)
      else
        L0_3 = native
        L0_3 = L0_3.showAlert
        L1_3 = "Broadcasting"
        L2_3 = "Could not start broadcasting"
        L3_3 = {}
        L4_3 = "Ok"
        L3_3[1] = L4_3
        L0_3(L1_3, L2_3, L3_3)
      end
    end
  end
  
  L28_2 = L0_1
  L28_2 = L28_2.newButton
  L29_2 = {}
  L29_2.image = "images/gui/settings/buttonBroadcast.png"
  L29_2.width = 88
  L29_2.height = 42
  L29_2.onRelease = L27_2
  L29_2.x = 320
  L29_2.y = 200
  L28_2 = L28_2(L29_2)
  L9_2 = L28_2
  
  function L28_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.replayKit
    L0_3 = L0_3.recordingManual
    L0_3 = L0_3()
    if L0_3 then
      L0_3 = L20_2
      L1_3 = false
      L0_3(L1_3)
      L0_3 = L25_2
      L0_3()
    else
      L0_3 = L0_1
      L0_3 = L0_3.replayKit
      L0_3 = L0_3.availableToRecord
      L0_3 = L0_3()
      if L0_3 then
        L0_3 = L20_2
        L1_3 = true
        L0_3(L1_3)
      end
    end
    L0_3 = L0_1
    L0_3 = L0_3.replayKit
    L0_3 = L0_3.broadcastingManual
    L0_3 = L0_3()
    if L0_3 then
      L0_3 = L21_2
      L1_3 = false
      L0_3(L1_3)
      L0_3 = L24_2
      L0_3()
    else
      L0_3 = L0_1
      L0_3 = L0_3.replayKit
      L0_3 = L0_3.availableToRecord
      L0_3 = L0_3()
      if L0_3 then
        L0_3 = L21_2
        L1_3 = true
        L0_3(L1_3)
      end
    end
  end
  
  L29_2 = L28_2
  L29_2()
  
  function L29_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  function L30_2(A0_3)
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
  
  function L31_2(A0_3)
    local L1_3
    L1_3 = true
    return L1_3
  end
  
  L32_2 = L0_1
  L32_2 = L32_2.newButton
  L33_2 = {}
  L33_2.x = 390
  L33_2.y = 70
  L33_2.width = 43
  L33_2.height = 38
  L33_2.image = "images/gui/common/buttonClosePopupBrown.png"
  L33_2.onRelease = L29_2
  L32_2 = L32_2(L33_2)
  
  function L33_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L11_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L10_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L12_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L13_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L14_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L16_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L17_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L15_2
    L0_3(L1_3, L2_3)
    L0_3 = 1
    L1_3 = L3_2
    L1_3 = #L1_3
    L2_3 = 1
    for L3_3 = L0_3, L1_3, L2_3 do
      L4_3 = L7_2
      L5_3 = L4_3
      L4_3 = L4_3.insert
      L6_3 = L3_2
      L6_3 = L6_3[L3_3]
      L4_3(L5_3, L6_3)
      L4_3 = L7_2
      L5_3 = L4_3
      L4_3 = L4_3.insert
      L6_3 = L4_2
      L6_3 = L6_3[L3_3]
      L4_3(L5_3, L6_3)
    end
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L8_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L9_2
    L0_3(L1_3, L2_3)
    L0_3 = L7_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L32_2
    L0_3(L1_3, L2_3)
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L0_3(L1_3, L2_3)
  end
  
  function L34_2(A0_3)
    local L1_3
  end
  
  function L35_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L30_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L31_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "couldNotStartRecording"
    L3_3 = L22_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "couldNotStartBroadcasting"
    L3_3 = L23_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "broadcastingLive"
    L3_3 = L24_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "recordingLive"
    L3_3 = L25_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L36_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L32_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L8_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L9_2
    L0_3(L1_3)
    L0_3 = L11_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L30_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = 1
    L1_3 = L6_2
    L1_3 = #L1_3
    L2_3 = 1
    for L3_3 = L0_3, L1_3, L2_3 do
      L4_3 = L3_2
      L4_3 = L4_3[L3_3]
      L5_3 = L4_3
      L4_3 = L4_3.removeEventListener
      L6_3 = "touch"
      L7_3 = L6_2
      L7_3 = L7_3[L3_3]
      L4_3(L5_3, L6_3, L7_3)
    end
    L0_3 = L10_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L31_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "couldNotStartRecording"
    L3_3 = L22_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "couldNotStartBroadcasting"
    L3_3 = L23_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "broadcastingLive"
    L3_3 = L24_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Runtime
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "recordingLive"
    L3_3 = L25_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L36_2
  L36_2 = 1
  L37_2 = 2
  L38_2 = 1
  for L39_2 = L36_2, L37_2, L38_2 do
    L40_2 = L18_2
    L41_2 = L39_2
    L40_2(L41_2)
  end
  L36_2 = L33_2
  L36_2()
  L36_2 = L35_2
  L36_2()
  L36_2 = L0_1
  L36_2 = L36_2.commHttps
  L36_2 = L36_2.setCallback
  L37_2 = L34_2
  L36_2(L37_2)
  L36_2 = L0_1
  L36_2 = L36_2.bouncer
  L36_2 = L36_2.down
  L37_2 = L7_2
  L36_2(L37_2)
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
