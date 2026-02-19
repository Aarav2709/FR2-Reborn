local L0_1, L1_1
L0_1 = {}

function L1_1(A0_2)
  local L1_2
end

L0_1.millisToFormattedTime = L1_1

function L1_1(A0_2)
  local L1_2
  L1_2 = A0_2 / 3600000
  return L1_2
end

L0_1.millisToHours = L1_1

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = math
  L1_2 = L1_2.round
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L1_2 = L1_2 / 1000
  L2_2 = ""
  L3_2 = L1_2
  L1_2 = L2_2 .. L3_2
  L2_2 = string
  L2_2 = L2_2.find
  L3_2 = L1_2
  L4_2 = "%."
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L3_2 = L2_2 + 2
    L4_2 = string
    L4_2 = L4_2.len
    L5_2 = L1_2
    L4_2 = L4_2(L5_2)
    if L3_2 < L4_2 then
      L3_2 = ""
      L5_2 = L1_2
      L4_2 = L1_2.sub
      L6_2 = 1
      L7_2 = L2_2 + 2
      L4_2 = L4_2(L5_2, L6_2, L7_2)
      L1_2 = L3_2 .. L4_2
    else
      L3_2 = L2_2 + 2
      L4_2 = string
      L4_2 = L4_2.len
      L5_2 = L1_2
      L4_2 = L4_2(L5_2)
      if L3_2 == L4_2 then
      else
        L3_2 = L2_2 + 1
        L4_2 = string
        L4_2 = L4_2.len
        L5_2 = L1_2
        L4_2 = L4_2(L5_2)
        if L3_2 == L4_2 then
          L3_2 = L1_2
          L4_2 = "0"
          L1_2 = L3_2 .. L4_2
        else
          L3_2 = string
          L3_2 = L3_2.len
          L4_2 = L1_2
          L3_2 = L3_2(L4_2)
          if L2_2 == L3_2 then
            L3_2 = L1_2
            L4_2 = "00"
            L1_2 = L3_2 .. L4_2
          end
        end
      end
    end
  else
    L3_2 = L1_2
    L4_2 = ".00"
    L1_2 = L3_2 .. L4_2
  end
  L3_2 = L1_2
  L4_2 = " s"
  L3_2 = L3_2 .. L4_2
  return L3_2
end

L0_1.millisToFormatedSeconds = L1_1

function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  if A0_2 then
    L1_2 = os
    L1_2 = L1_2.date
    L2_2 = "%H:%M"
    L3_2 = A0_2 / 1000
    return L1_2(L2_2, L3_2)
  end
  L1_2 = "23:59"
  return L1_2
end

L0_1.timestampToClock = L1_1

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if A0_2 then
    L1_2 = os
    L1_2 = L1_2.time
    L1_2 = L1_2()
    L2_2 = tonumber
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L3_2 = L1_2 - L2_2
    L4_2 = print
    L5_2 = L1_2
    L6_2 = L2_2
    L7_2 = L3_2
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = L3_2 / 86400
    return L4_2
  end
  L1_2 = -1
  return L1_2
end

L0_1.daysSince = L1_1

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 then
    L1_2 = math
    L1_2 = L1_2.floor
    L2_2 = A0_2 / 60
    L1_2 = L1_2(L2_2)
    L2_2 = math
    L2_2 = L2_2.floor
    L3_2 = L1_2 / 60
    L2_2 = L2_2(L3_2)
    L3_2 = math
    L3_2 = L3_2.floor
    L4_2 = L2_2 / 24
    L3_2 = L3_2(L4_2)
    L4_2 = L2_2 * 60
    L1_2 = L1_2 - L4_2
    L4_2 = L3_2 * 24
    L2_2 = L2_2 - L4_2
    L4_2 = L3_2
    L5_2 = "d "
    L6_2 = L2_2
    L7_2 = "h "
    L8_2 = L1_2
    L9_2 = "m"
    L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2
    return L4_2
  end
  L1_2 = ""
  return L1_2
end

L0_1.leagueTimeRemainingFormat = L1_1
return L0_1
