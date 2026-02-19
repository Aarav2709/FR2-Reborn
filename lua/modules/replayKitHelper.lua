local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)
L2_1 = isIOS
if not L2_1 then
  L2_1 = {}
  L1_1.replayKit = L2_1
  L2_1 = setmetatable
  L3_1 = L1_1.replayKit
  L4_1 = {}
  
  function L5_1(A0_2, A1_2)
    local L2_2
    
    function L2_2()
      local L0_3, L1_3
    end
    
    return L2_2
  end
  
  L4_1.__index = L5_1
  L2_1(L3_1, L4_1)
  L2_1 = L1_1.replayKit
  return L2_1
end
L2_1 = require
L3_1 = "plugin.replayKit"
L2_1 = L2_1(L3_1)
L3_1 = 0
L4_1 = 0
L5_1 = 1
L6_1 = 0
L7_1 = 0

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = print
  L2_2 = A0_2.response
  L1_2(L2_2)
  L1_2 = 0
  L7_1 = L1_2
  L1_2 = A0_2.response
  if L1_2 == "could not start recording" then
    L1_2 = {}
    L1_2.name = "couldNotStartRecording"
    L2_2 = Runtime
    L3_2 = L2_2
    L2_2 = L2_2.dispatchEvent
    L4_2 = L1_2
    L2_2(L3_2, L4_2)
    L2_2 = native
    L2_2 = L2_2.showAlert
    L3_2 = "Recording"
    L4_2 = "could not start"
    L5_2 = {}
    L6_2 = "Ok"
    L5_2[1] = L6_2
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = 0
    L3_1 = L2_2
  else
    L1_2 = A0_2.response
    if L1_2 == "recording started" then
      L1_2 = {}
      L1_2.name = "recordingLive"
      L2_2 = Runtime
      L3_2 = L2_2
      L2_2 = L2_2.dispatchEvent
      L4_2 = L1_2
      L2_2(L3_2, L4_2)
      L2_2 = 1
      L3_1 = L2_2
    else
      L1_2 = A0_2.response
      if L1_2 == "could not stop" then
        L1_2 = native
        L1_2 = L1_2.showAlert
        L2_2 = "Recording"
        L3_2 = "could not stop"
        L4_2 = {}
        L5_2 = "Ok"
        L4_2[1] = L5_2
        L1_2(L2_2, L3_2, L4_2)
      else
        L1_2 = A0_2.response
        if L1_2 == "sharing video" then
        end
      end
    end
  end
end

function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = print
  L2_2 = A0_2.response
  L1_2(L2_2)
  L1_2 = A0_2.response
  if L1_2 == "could not start recording" then
    L1_2 = 0
    L4_1 = L1_2
  else
    L1_2 = A0_2.response
    if L1_2 == "recording started" then
      L1_2 = 1
      L4_1 = L1_2
    else
      L1_2 = A0_2.response
      if L1_2 == "could not stop" then
      else
        L1_2 = A0_2.response
        if L1_2 == "sharing video" then
        end
      end
    end
  end
  L1_2 = A0_2.response
  if L1_2 == "nothing cached" then
    L1_2 = native
    L1_2 = L1_2.showAlert
    L2_2 = "Recording"
    L3_2 = "Failed to load video"
    L4_2 = {}
    L5_2 = "Ok"
    L4_2[1] = L5_2
    L1_2(L2_2, L3_2, L4_2)
  end
end

function L10_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = print
  L2_2 = A0_2.response
  L1_2(L2_2)
  L1_2 = 0
  L7_1 = L1_2
  L1_2 = A0_2.response
  if L1_2 == "error loading stream" then
    L1_2 = {}
    L1_2.name = "couldNotStartBroadcasting"
    L2_2 = Runtime
    L3_2 = L2_2
    L2_2 = L2_2.dispatchEvent
    L4_2 = L1_2
    L2_2(L3_2, L4_2)
    L2_2 = native
    L2_2 = L2_2.showAlert
    L3_2 = "Broadcasting"
    L4_2 = "Error loading stream"
    L5_2 = {}
    L6_2 = "Ok"
    L5_2[1] = L6_2
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = 0
    L6_1 = L2_2
  else
    L1_2 = A0_2.response
    if L1_2 == "error picking a broadcast service" then
      L1_2 = {}
      L1_2.name = "couldNotStartBroadcasting"
      L2_2 = Runtime
      L3_2 = L2_2
      L2_2 = L2_2.dispatchEvent
      L4_2 = L1_2
      L2_2(L3_2, L4_2)
      L2_2 = native
      L2_2 = L2_2.showAlert
      L3_2 = "Broadcasting"
      L4_2 = "Did not start the stream as no service was choosen"
      L5_2 = {}
      L6_2 = "Ok"
      L5_2[1] = L6_2
      L2_2(L3_2, L4_2, L5_2)
      L2_2 = 0
      L6_1 = L2_2
    else
      L1_2 = A0_2.response
      if L1_2 == "we are live" then
        L1_2 = {}
        L1_2.name = "broadcastingLive"
        L2_2 = 1
        L6_1 = L2_2
        L2_2 = Runtime
        L3_2 = L2_2
        L2_2 = L2_2.dispatchEvent
        L4_2 = L1_2
        L2_2(L3_2, L4_2)
      else
        L1_2 = A0_2.response
        if L1_2 == "error while broadcasting" then
          L1_2 = native
          L1_2 = L1_2.showAlert
          L2_2 = "Broadcasting"
          L3_2 = "Error while broadcasting"
          L4_2 = {}
          L5_2 = "Ok"
          L4_2[1] = L5_2
          L1_2(L2_2, L3_2, L4_2)
          L1_2 = 0
          L6_1 = L1_2
        else
          L1_2 = A0_2.response
          if L1_2 == "unable to show stream picker" then
            L1_2 = native
            L1_2 = L1_2.showAlert
            L2_2 = "Broadcasting"
            L3_2 = "Unable to show stream picker"
            L4_2 = {}
            L5_2 = "Ok"
            L4_2[1] = L5_2
            L1_2(L2_2, L3_2, L4_2)
            L1_2 = 0
            L6_1 = L1_2
          end
        end
      end
    end
  end
end

function L11_1()
  local L0_2, L1_2
  L0_2 = L2_1
  L0_2 = L0_2.recordingScreen
  L0_2 = L0_2()
  if L0_2 then
    L0_2 = L3_1
    L0_2 = L0_2 == 1
  end
  return L0_2
end

L0_1.recordingManual = L11_1

function L11_1()
  local L0_2, L1_2
  L0_2 = L2_1
  L0_2 = L0_2.recordingScreen
  L0_2 = L0_2()
  if L0_2 then
    L0_2 = L6_1
    L0_2 = L0_2 == 1
  end
  return L0_2
end

L0_1.broadcastingManual = L11_1

function L11_1()
  local L0_2, L1_2
  L0_2 = L7_1
  L0_2 = L0_2 == 1
  return L0_2
end

L0_1.waitingForResponseFromPlugin = L11_1

function L11_1()
  local L0_2, L1_2
  L0_2 = L2_1
  L0_2 = L0_2.availableToRecord
  if L0_2 then
    L0_2 = L2_1
    L0_2 = L0_2.availableToRecord
    L0_2 = L0_2()
    if L0_2 then
      L0_2 = true
      return L0_2
    end
  end
  L0_2 = false
  return L0_2
end

L0_1.availableToRecord = L11_1

function L11_1()
  local L0_2, L1_2
  L0_2 = 0
  L3_1 = L0_2
  L0_2 = L2_1
  L0_2 = L0_2.stopRecording
  L1_2 = L8_1
  L0_2(L1_2)
end

L0_1.stopRecording = L11_1

function L11_1()
  local L0_2, L1_2, L2_2
  L0_2 = 1
  L3_1 = L0_2
  L0_2 = 1
  L7_1 = L0_2
  L0_2 = L2_1
  L0_2 = L0_2.record
  L1_2 = L8_1
  L2_2 = L1_1
  L2_2 = L2_2.database
  L2_2 = L2_2.shouldUseMic
  L2_2 = L2_2()
  L2_2 = L2_2 == 1
  L0_2(L1_2, L2_2)
end

L0_1.record = L11_1

function L11_1()
  local L0_2, L1_2, L2_2
  L0_2 = L1_1
  L0_2 = L0_2.database
  L0_2 = L0_2.shouldAutoRecord
  L0_2 = L0_2()
  if L0_2 == 1 then
    L0_2 = L0_1
    L0_2 = L0_2.availableToRecord
    L0_2 = L0_2()
    if L0_2 then
      L0_2 = L3_1
      if L0_2 == 0 then
        L0_2 = L6_1
        if L0_2 == 0 then
          L0_2 = 1
          L4_1 = L0_2
          L0_2 = L2_1
          L0_2 = L0_2.record
          L1_2 = L9_1
          L2_2 = L1_1
          L2_2 = L2_2.database
          L2_2 = L2_2.shouldUseMic
          L2_2 = L2_2()
          L2_2 = L2_2 == 1
          L0_2(L1_2, L2_2)
          L0_2 = 0
          L5_1 = L0_2
        end
      end
    end
  end
end

L0_1.startAutoRecord = L11_1

function L11_1()
  local L0_2, L1_2
  L0_2 = L2_1
  L0_2 = L0_2.recordingScreen
  L0_2 = L0_2()
  if L0_2 then
    L0_2 = L4_1
    if L0_2 == 1 then
      L0_2 = 0
      L4_1 = L0_2
      L0_2 = 1
      L5_1 = L0_2
      L0_2 = L2_1
      L0_2 = L0_2.cacheRecording
      L1_2 = L9_1
      L0_2(L1_2)
    end
  end
end

L0_1.stopAutoRecord = L11_1

function L11_1()
  local L0_2, L1_2
  L0_2 = L2_1
  L0_2 = L0_2.showCacheRecording
  L1_2 = L9_1
  L0_2(L1_2)
end

L0_1.showAutoRecord = L11_1

function L11_1()
  local L0_2, L1_2
  L0_2 = L4_1
  L0_2 = L0_2 == 1
  return L0_2
end

L0_1.haveAutoRecording = L11_1

function L11_1()
  local L0_2, L1_2
  L0_2 = 0
  L6_1 = L0_2
  L0_2 = L2_1
  L0_2 = L0_2.stopBroadcasting
  L1_2 = L10_1
  L0_2(L1_2)
end

L0_1.stopBroadcasting = L11_1

function L11_1()
  local L0_2, L1_2
  L0_2 = 1
  L6_1 = L0_2
  L0_2 = 1
  L7_1 = L0_2
  L0_2 = L2_1
  L0_2 = L0_2.setBroadcastingOptions
  L1_2 = L1_1
  L1_2 = L1_2.database
  L1_2 = L1_2.shouldUseMic
  L1_2 = L1_2()
  L1_2 = L1_2 == 1
  L0_2(L1_2)
  L0_2 = L2_1
  L0_2 = L0_2.startBroadcasting
  L1_2 = L10_1
  L0_2(L1_2)
end

L0_1.startBroadcasting = L11_1
L1_1.replayKit = L0_1
