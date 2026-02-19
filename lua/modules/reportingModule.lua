local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
L1_1 = {}
L1_1[1] = "Cheating"
L1_1[2] = "Offensive Language"
L1_1[3] = "Scamming"
L1_1[4] = "Harassment"

function L2_1()
  local L0_2, L1_2
  L0_2 = L1_1
  return L0_2
end

L0_1.getReasons = L2_1

function L3_1(A0_2)
  local L1_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  return L1_2
end

L0_1.getReasonOnKey = L3_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = {}
  L2_2.reason = nil
  L2_2.reasonId = nil
  L2_2.playerToReport = A0_2
  L3_2 = A1_2 or L3_2
  if not A1_2 then
    L3_2 = 1
  end
  L2_2.gameId = L3_2
  L2_2.chatLog = nil
  
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = L2_2
    L1_3.reason = A0_3
    L1_3 = 1
    L2_3 = L1_1
    L2_3 = #L2_3
    L3_3 = 1
    for L4_3 = L1_3, L2_3, L3_3 do
      L5_3 = L1_1
      L5_3 = L5_3[L4_3]
      if L5_3 == A0_3 then
        L5_3 = L2_2
        L5_3.reasonId = L4_3
      end
    end
  end
  
  L2_2.setReason = L3_2
  
  function L4_2(A0_3)
    local L1_3, L2_3
    L1_3 = L2_2
    L2_3 = L1_1
    L2_3 = L2_3[A0_3]
    L1_3.reason = L2_3
    L1_3 = L2_2
    L1_3.reasonId = A0_3
  end
  
  L2_2.setReasonById = L4_2
  
  function L5_2(A0_3)
    local L1_3
    L1_3 = L2_2
    L1_3.playerToReport = A0_3
  end
  
  L2_2.setReportedPlayer = L5_2
  return L2_2
end

L0_1.createReport = L4_1
return L0_1
