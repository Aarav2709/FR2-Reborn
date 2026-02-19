local L0_1, L1_1, L2_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = {}
L2_1 = L0_1.clientStatReporting
L2_1 = L2_1.shouldReportLatency
if not L2_1 then
  L2_1 = false
end
L1_1.shouldReport = L2_1
L2_1 = L0_1.clientStatReporting
L2_1 = L2_1.latencyThreshold
if not L2_1 then
  L2_1 = 100000
end
L1_1.reportThreshold = L2_1
L2_1 = L0_1.clientStatReporting
L2_1 = L2_1.maxReports
if not L2_1 then
  L2_1 = 0
end
L1_1.maxReports = L2_1
L2_1 = {}
L1_1.latencyReports = L2_1
L1_1.serverAddress = ""
L1_1.connectionType = "unknown"
L1_1.lastPackage = nil
L1_1.hasSentReport = false

function L2_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L1_1
  L0_2 = L0_2.shouldReport
  if not L0_2 then
    return
  end
  L0_2 = system
  L0_2 = L0_2.getTimer
  L0_2 = L0_2()
  L1_2 = L1_1
  L1_2 = L1_2.lastPackage
  if L1_2 == nil then
    L1_2 = L1_1
    L1_2.lastPackage = L0_2
  end
  L1_2 = math
  L1_2 = L1_2.floor
  L2_2 = L1_1
  L2_2 = L2_2.lastPackage
  L2_2 = L0_2 - L2_2
  L1_2 = L1_2(L2_2)
  L2_2 = L1_1
  L2_2 = L2_2.reportThreshold
  if L1_2 > L2_2 then
    L2_2 = L1_1
    L2_2 = L2_2.addLatencyReport
    L3_2 = L1_2
    L2_2(L3_2)
  end
  L2_2 = L1_1
  L2_2.lastPackage = L0_2
end

L1_1.updateLatencyLog = L2_1

function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = L1_1
  L1_2 = L1_2.latencyReports
  L1_2 = #L1_2
  L2_2 = L1_1
  L2_2 = L2_2.maxReports
  if L1_2 < L2_2 then
    L1_2 = L1_1
    L1_2 = L1_2.latencyReports
    L2_2 = L1_1
    L2_2 = L2_2.latencyReports
    L2_2 = #L2_2
    L2_2 = L2_2 + 1
    L1_2[L2_2] = A0_2
  end
end

L1_1.addLatencyReport = L2_1

function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L1_1
  L2_2 = L2_2.updateLatencyLog
  L2_2()
  L2_2 = L1_1
  L2_2 = L2_2.latencyReports
  L2_2 = #L2_2
  if 0 < L2_2 then
    L2_2 = L1_1
    L2_2 = L2_2.shouldReport
    if L2_2 then
      L2_2 = L1_1
      L2_2 = L2_2.hasSentReport
      if not L2_2 then
        L2_2 = L0_1
        L2_2 = L2_2.comm
        L2_2 = L2_2.sendClientStatReport
        L3_2 = L1_1
        L3_2 = L3_2.latencyReports
        L4_2 = L0_1
        L4_2 = L4_2.config
        L4_2 = L4_2.tcpClient
        L5_2 = L1_1
        L5_2 = L5_2.connectionType
        L6_2 = A0_2
        L7_2 = A1_2
        L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
        L2_2 = L1_1
        L2_2.hasSentReport = true
      end
    end
  end
end

L1_1.sendReportToServer = L2_1

function L2_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L1_2 = {}
  L0_2.latencyReports = L1_2
  L0_2 = L1_1
  L0_2.lastPackage = nil
  L0_2 = L1_1
  L0_2.serverAddress = ""
  L0_2 = L1_1
  L0_2.connectionType = "unknown"
  L0_2 = L1_1
  L0_2.hasSentReport = false
end

L1_1.reset = L2_1
return L1_1
