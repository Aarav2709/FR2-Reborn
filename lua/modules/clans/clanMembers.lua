local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)
L2_1 = 0
L3_1 = 0
L4_1 = os
L4_1 = L4_1.time
L4_1 = L4_1()
L5_1 = {}
L5_1[1] = "Contributive"
L5_1[2] = "Supportive"
L5_1[3] = "Sponsorial"
L6_1 = {}
L7_1 = "Competitive"
L8_1 = "Social"
L9_1 = "Casual"
L6_1[1] = L7_1
L6_1[2] = L8_1
L6_1[3] = L9_1
L0_1.clanAttitudeTypes = L6_1
L7_1 = {}
L8_1 = "none"
L9_1 = "wood"
L10_1 = "bronze"
L11_1 = "silver"
L12_1 = "gold"
L13_1 = "diamond"
L14_1 = "elite"
L7_1[1] = L8_1
L7_1[2] = L9_1
L7_1[3] = L10_1
L7_1[4] = L11_1
L7_1[5] = L12_1
L7_1[6] = L13_1
L7_1[7] = L14_1
L0_1.clanRewardTiers = L7_1
L8_1 = {}
L8_1.create = 1
L8_1.join = 2
L8_1.leave = 3
L8_1.kick = 4
L8_1.promote = 5
L8_1.demote = 6
L8_1.levelup = 7
L8_1.motd = 8
L8_1.change_state = 9
L8_1.item_unlocked = 10
L8_1.challenge = 11
L0_1.eventTypes = L8_1

function L9_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L1_2 = {}
  L2_2 = 0
  L3_2 = 0
  L4_2 = 0
  L5_2 = 0
  L6_2 = 0
  L7_2 = 0
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L1_2[6] = L7_2
  L0_2.memberLeagues = L1_2
  L0_2 = 1
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2 = L1_2.members
  L1_2 = #L1_2
  L2_2 = 1
  for L3_2 = L0_2, L1_2, L2_2 do
    L4_2 = L1_1
    L4_2 = L4_2.data
    L4_2 = L4_2.clans
    L4_2 = L4_2.members
    L4_2 = L4_2[L3_2]
    L4_2 = L4_2.league
    if L4_2 then
      L4_2 = L1_1
      L4_2 = L4_2.data
      L4_2 = L4_2.clans
      L4_2 = L4_2.memberLeagues
      L5_2 = L1_1
      L5_2 = L5_2.data
      L5_2 = L5_2.clans
      L5_2 = L5_2.members
      L5_2 = L5_2[L3_2]
      L5_2 = L5_2.league
      L5_2 = L5_2 + 1
      L6_2 = L1_1
      L6_2 = L6_2.data
      L6_2 = L6_2.clans
      L6_2 = L6_2.memberLeagues
      L7_2 = L1_1
      L7_2 = L7_2.data
      L7_2 = L7_2.clans
      L7_2 = L7_2.members
      L7_2 = L7_2[L3_2]
      L7_2 = L7_2.league
      L7_2 = L7_2 + 1
      L6_2 = L6_2[L7_2]
      L6_2 = L6_2 + 1
      L4_2[L5_2] = L6_2
    end
  end
end

function L10_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = 0
  L1_2 = 1
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L2_2 = L2_2.members
  L2_2 = #L2_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L1_1
    L5_2 = L5_2.data
    L5_2 = L5_2.clans
    L5_2 = L5_2.members
    L5_2 = L5_2[L4_2]
    L5_2 = L5_2.supporterLevel
    if L5_2 then
      L6_2 = L1_1
      L6_2 = L6_2.storeConfig
      if L6_2 then
        L6_2 = L1_1
        L6_2 = L6_2.storeConfig
        L6_2 = L6_2.getClanSupporterClanMemberBonus
        L7_2 = L5_2
        L6_2 = L6_2(L7_2)
        L0_2 = L0_2 + L6_2
      end
    end
  end
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2.combinedClanPointBoost = L0_2
  return L0_2
end

L0_1.calculateCombinedClanSupporterBoost = L10_1

function L10_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = {}
  L1_2.p = A0_2
  L1_2.r = 0
  L1_2.i = 0
  L1_2.j = 0
  L1_2.k = 0
  L1_2.l = 0
  L1_2.m = 0
  L2_2 = {}
  L1_2.lg = L2_2
  L2_2 = L1_2.lg
  L3_2 = league
  if not L3_2 then
    L3_2 = 5
  end
  L2_2.l = L3_2
  L1_2.cr = 0
  return L1_2
end

function L11_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  if A1_2 then
    L3_2 = A1_2.p
    A0_2.playerId = L3_2
    L3_2 = tonumber
    L4_2 = A1_2.r
    L3_2 = L3_2(L4_2)
    A0_2.rating = L3_2
    L3_2 = tonumber
    L4_2 = A1_2.i
    L3_2 = L3_2(L4_2)
    A0_2.kills = L3_2
    L3_2 = tonumber
    L4_2 = A1_2.j
    L3_2 = L3_2(L4_2)
    A0_2.deaths = L3_2
    L3_2 = tonumber
    L4_2 = A1_2.k
    L3_2 = L3_2(L4_2)
    A0_2.suicides = L3_2
    L3_2 = tonumber
    L4_2 = A1_2.l
    L3_2 = L3_2(L4_2)
    A0_2.games = L3_2
    L3_2 = tonumber
    L4_2 = A1_2.m
    L3_2 = L3_2(L4_2)
    A0_2.wins = L3_2
    L3_2 = tonumber
    L4_2 = A1_2.lg
    L4_2 = L4_2.l
    L3_2 = L3_2(L4_2)
    A0_2.league = L3_2
    L3_2 = tonumber
    L4_2 = A1_2.cr
    L3_2 = L3_2(L4_2)
    A0_2.rank = L3_2
    L3_2 = tonumber
    L4_2 = A1_2.sl
    L3_2 = L3_2(L4_2)
    A0_2.supporterLevel = L3_2
    L3_2 = tonumber
    L4_2 = A1_2.z
    L3_2 = L3_2(L4_2)
    A0_2.clanPoints = L3_2
    L3_2 = tonumber
    L4_2 = A1_2.at
    L3_2 = L3_2(L4_2)
    A0_2.active = L3_2
    L3_2 = tonumber
    L4_2 = A1_2.jt
    L3_2 = L3_2(L4_2)
    A0_2.joined = L3_2
  end
  if A2_2 then
    L3_2 = A2_2.n2
    if not L3_2 then
      L3_2 = A2_2.n
    end
    A0_2.name = L3_2
    L3_2 = A2_2.p
    A0_2.playerId = L3_2
    L3_2 = A2_2.t
    A0_2.tag = L3_2
  end
  A0_2.clanMember = true
  L3_2 = L1_1
  L3_2 = L3_2.database
  L3_2 = L3_2.getPlayerInformation
  L3_2 = L3_2()
  L4_2 = A0_2.playerId
  L5_2 = L3_2.playerId
  if L4_2 == L5_2 then
    A0_2.onlineStatus = 1
    A0_2.active = 0
  end
end

function L12_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = {}
  L3_2 = L11_1
  L4_2 = L2_2
  L5_2 = A0_2
  L6_2 = A1_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = L1_1
  L3_2 = L3_2.data
  L3_2 = L3_2.clans
  L3_2 = L3_2.members
  if not L3_2 then
    return
  end
  L4_2 = #L3_2
  L4_2 = L4_2 + 1
  L3_2[L4_2] = L2_2
  L4_2 = L1_1
  L4_2 = L4_2.data
  L4_2 = L4_2.clans
  L5_2 = #L3_2
  L4_2.numberOfMembers = L5_2
end

function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2 = L1_2.members
  if not L1_2 then
    return
  end
  L2_2 = 1
  L3_2 = #L1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L1_2[L5_2]
    L6_2 = L6_2.playerId
    if L6_2 == A0_2 then
      L6_2 = table
      L6_2 = L6_2.remove
      L7_2 = L1_2
      L8_2 = L5_2
      L6_2(L7_2, L8_2)
      L6_2 = L1_1
      L6_2 = L6_2.data
      L6_2 = L6_2.clans
      L7_2 = #L1_2
      L6_2.numberOfMembers = L7_2
      L6_2 = true
      return L6_2
    end
  end
  L2_2 = false
  return L2_2
end

function L14_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = L1_1
  L0_2 = L0_2.database
  L0_2 = L0_2.getClanMembers
  L0_2 = L0_2()
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2 = L1_2.memberDetails
  if not L0_2 and not L1_2 then
    L2_2 = L1_1
    L2_2 = L2_2.data
    L2_2 = L2_2.clans
    L2_2 = L2_2.members
    return L2_2
  end
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L2_2 = L2_2.members
  L3_2 = L1_1
  L3_2 = L3_2.debugger
  L3_2 = L3_2.debugTable
  L4_2 = "clans"
  L5_2 = "Members before: "
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
  if L0_2 then
    L3_2 = 1
    L4_2 = #L0_2
    L5_2 = 1
    for L6_2 = L3_2, L4_2, L5_2 do
      L7_2 = L0_1
      L7_2 = L7_2.getClanMember
      L8_2 = L0_2[L6_2]
      L8_2 = L8_2.p
      L7_2 = L7_2(L8_2)
      if L7_2 then
        L8_2 = L11_1
        L9_2 = L7_2
        L10_2 = nil
        L11_2 = L0_2[L6_2]
        L8_2(L9_2, L10_2, L11_2)
      else
        L8_2 = L12_1
        L9_2 = L10_1
        L10_2 = L0_2[L6_2]
        L10_2 = L10_2.p
        L9_2 = L9_2(L10_2)
        L10_2 = L0_2[L6_2]
        L8_2(L9_2, L10_2)
      end
    end
  end
  if L1_2 then
    L3_2 = 1
    L4_2 = #L1_2
    L5_2 = 1
    for L6_2 = L3_2, L4_2, L5_2 do
      L7_2 = L0_1
      L7_2 = L7_2.getClanMember
      L8_2 = L1_2[L6_2]
      L8_2 = L8_2.p
      L7_2 = L7_2(L8_2)
      if L7_2 then
        L8_2 = L11_1
        L9_2 = L7_2
        L10_2 = L1_2[L6_2]
        L11_2 = nil
        L8_2(L9_2, L10_2, L11_2)
      else
        L8_2 = L12_1
        L9_2 = L1_2[L6_2]
        L10_2 = nil
        L8_2(L9_2, L10_2)
      end
    end
  end
  L3_2 = L0_1
  L3_2 = L3_2.setClanMembersOnlineStatus
  L4_2 = L1_1
  L4_2 = L4_2.data
  L4_2 = L4_2.previousPlayersOnline
  L3_2(L4_2)
  L3_2 = L9_1
  L3_2()
  L3_2 = L1_1
  L3_2 = L3_2.debugger
  L3_2 = L3_2.debugTable
  L4_2 = "clans"
  L5_2 = "Members after: "
  L6_2 = L1_1
  L6_2 = L6_2.data
  L6_2 = L6_2.clans
  L6_2 = L6_2.members
  L3_2(L4_2, L5_2, L6_2)
  return L2_2
end

L0_1.updateClanMembersTable = L14_1

function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2 = L1_2.memberDetails
  if not L1_2 then
    return
  end
  L2_2 = 1
  L3_2 = #L1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = A0_2.p
    L7_2 = L1_2[L5_2]
    L7_2 = L7_2.p
    if L6_2 == L7_2 then
      return
    end
  end
  L2_2 = #L1_2
  L2_2 = L2_2 + 1
  L1_2[L2_2] = A0_2
end

L0_1.addClanMemberDetails = L14_1

function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2 = L1_2.memberDetails
  if not L1_2 then
    return
  end
  L2_2 = 1
  L3_2 = #L1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L1_2[L5_2]
    L6_2 = L6_2.p
    if A0_2 == L6_2 then
      L6_2 = table
      L6_2 = L6_2.remove
      L7_2 = L1_2
      L8_2 = L5_2
      L6_2(L7_2, L8_2)
      L6_2 = true
      return L6_2
    end
  end
  L2_2 = false
  return L2_2
end

L0_1.removeClanMemberDetails = L14_1

function L14_1(A0_2)
  local L1_2, L2_2
  L1_2 = L0_1
  L1_2 = L1_2.setClanState
  L2_2 = A0_2.a
  L1_2(L2_2)
  L1_2 = L1_1
  L1_2 = L1_2.database
  L1_2 = L1_2.setClanMembers
  L2_2 = A0_2.b
  L1_2(L2_2)
  L1_2 = L0_1
  L1_2 = L1_2.setMyClanRank
  L2_2 = A0_2.c
  L1_2(L2_2)
end

L0_1.setClanSync = L14_1

function L14_1(A0_2)
  local L1_2, L2_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2.inClan = true
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = A0_2._id
  L1_2.clanId = L2_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = A0_2.a
  L1_2.tag = L2_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = A0_2.b
  L1_2.name = L2_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = A0_2.c
  L1_2.emblem = L2_2
end

L0_1.setClanState = L14_1

function L14_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L0_2 = L0_2.tableUtils
  L0_2 = L0_2.deepCopy
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2 = L1_2.emblem
  return L0_2(L1_2)
end

L0_1.getEmblemDataCopy = L14_1

function L14_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2.inClan = true
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = A0_2.b
  L1_2.name = L2_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = A0_2.r
  L1_2.totalRating = L2_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = A0_2.p
  L1_2.open = L2_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2 = L1_2.motd
  L2_2 = A0_2.o
  L2_2 = L2_2.a
  L1_2.message = L2_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2 = L1_2.motd
  L2_2 = A0_2.o
  L2_2 = L2_2.b
  L1_2.author = L2_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = tonumber
  L3_2 = A0_2.y
  L2_2 = L2_2(L3_2)
  L1_2.requirement = L2_2
  L1_2 = L0_1
  L1_2 = L1_2.setClanEventLog
  L2_2 = A0_2.q
  L1_2(L2_2)
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = A0_2.g
  L1_2.experience = L2_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = A0_2.h
  L1_2.level = L2_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = tonumber
  L3_2 = A0_2.aa
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = 0
  end
  L2_2 = L2_2 + 1
  L1_2.attitude = L2_2
end

L0_1.setClanDetails = L14_1

function L14_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = A0_2.a
  L1_2.open = L2_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = tonumber
  L3_2 = A0_2.b
  L2_2 = L2_2(L3_2)
  L1_2.requirement = L2_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = tonumber
  L3_2 = A0_2.c
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = 0
  end
  L2_2 = L2_2 + 1
  L1_2.attitude = L2_2
  L1_2 = A0_2.d
  if L1_2 then
    L1_2 = L1_1
    L1_2 = L1_2.data
    L1_2 = L1_2.clans
    L2_2 = A0_2.d
    L1_2.emblem = L2_2
  end
end

L0_1.setEditableClanState = L14_1

function L14_1()
  local L0_2, L1_2
  L0_2 = {}
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2 = L1_2.requirement
  L0_2.leagueRequirement = L1_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2 = L1_2.open
  if L1_2 then
    L1_2 = 1
    if L1_2 then
      goto lbl_17
    end
  end
  L1_2 = 2
  ::lbl_17::
  L0_2.openness = L1_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2 = L1_2.attitude
  L0_2.attitude = L1_2
  L1_2 = L1_1
  L1_2 = L1_2.clanUtils
  L1_2 = L1_2.getEmblemDataCopy
  L1_2 = L1_2()
  L0_2.emblem = L1_2
  return L0_2
end

L0_1.getClanStateEditData = L14_1

function L14_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = {}
  L2_2 = A0_2.e
  L1_2.games = L2_2
  L2_2 = A0_2.f
  L1_2.wins = L2_2
  L2_2 = A0_2.c
  L1_2.deaths = L2_2
  L2_2 = A0_2.b
  L1_2.kills = L2_2
  L2_2 = A0_2.m
  L1_2.members = L2_2
  L2_2 = A0_2.q
  L1_2.topPlacement = L2_2
  L2_2 = A0_2.a
  L2_2 = L2_2.a
  L1_2.tag = L2_2
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L3_2 = L1_2.games
  L2_2.games = L3_2
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L3_2 = L1_2.wins
  L2_2.wins = L3_2
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L3_2 = L1_2.deaths
  L2_2.deaths = L3_2
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L3_2 = L1_2.kills
  L2_2.kills = L3_2
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L3_2 = L1_2.members
  L2_2.numberOfMembers = L3_2
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L3_2 = L1_2.topPlacement
  L2_2.topPlacement = L3_2
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L3_2 = L1_2.tag
  L2_2.tag = L3_2
end

L0_1.setClanStats = L14_1

function L14_1(A0_2)
  local L1_2, L2_2
  L1_2 = {}
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L2_2 = L2_2.games
  L1_2.games = L2_2
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L2_2 = L2_2.wins
  L1_2.wins = L2_2
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L2_2 = L2_2.deaths
  L1_2.deaths = L2_2
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L2_2 = L2_2.kills
  L1_2.kills = L2_2
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L2_2 = L2_2.numberOfMembers
  L1_2.members = L2_2
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L2_2 = L2_2.topPlacement
  L1_2.topPlacement = L2_2
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L2_2 = L2_2.tag
  L1_2.tag = L2_2
  return L1_2
end

L0_1.getClanStats = L14_1

function L14_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = tonumber
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2.myRank = L2_2
end

L0_1.setMyClanRank = L14_1

function L14_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L0_2 = L0_2.myRank
  return L0_2
end

L0_1.getMyClanRank = L14_1

function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L0_1
  L2_2 = L2_2.getClanMember
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = print
    L4_2 = "Can't set rank. Member not found!"
    L3_2(L4_2)
    return
  end
  L3_2 = tonumber
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  L2_2.rank = L3_2
  L4_2 = L1_1
  L4_2 = L4_2.database
  L4_2 = L4_2.getPlayerInformation
  L4_2 = L4_2()
  L5_2 = L4_2.playerId
  if A0_2 == L5_2 then
    L5_2 = L0_1
    L5_2 = L5_2.setMyClanRank
    L6_2 = A1_2
    L5_2(L6_2)
  end
end

L0_1.setPlayerRank = L14_1

function L14_1(A0_2)
  local L1_2, L2_2
  L1_2 = L1_1
  L1_2 = L1_2.clanUtils
  L1_2 = L1_2.getClanMember
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = L1_2.rank
    return L2_2
  end
  L2_2 = nil
  return L2_2
end

L0_1.getPlayerRank = L14_1

function L14_1()
  local L0_2, L1_2, L2_2
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L0_2 = L0_2.members
  L1_2 = L1_1
  L1_2 = L1_2.tableUtils
  L1_2 = L1_2.sortTableOnRating
  L2_2 = L0_2
  L1_2(L2_2)
  return L0_2
end

L0_1.getClanMembersSorted = L14_1

function L14_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = {}
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2 = L1_2.members
  if not L1_2 then
    L2_2 = {}
    return L2_2
  end
  L2_2 = 1
  L3_2 = #L1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L1_1
    L6_2 = L6_2.database
    L6_2 = L6_2.getFriend
    L7_2 = L1_2[L5_2]
    L7_2 = L7_2.playerId
    L6_2 = L6_2(L7_2)
    if not L6_2 then
      L7_2 = #L0_2
      L7_2 = L7_2 + 1
      L8_2 = L1_2[L5_2]
      L0_2[L7_2] = L8_2
    end
  end
  return L0_2
end

L0_1.getClanMembersThatAreNotFriends = L14_1

function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2 = L1_2.members
  if L1_2 == nil then
    L2_2 = nil
    return L2_2
  end
  L2_2 = 1
  L3_2 = #L1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L1_2[L5_2]
    L6_2 = L6_2.playerId
    if L6_2 == A0_2 then
      L6_2 = L1_2[L5_2]
      return L6_2
    end
  end
  L2_2 = nil
  return L2_2
end

L0_1.getClanMember = L14_1

function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = 1
  L2_2 = #A0_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L0_1
    L5_2 = L5_2.changeClanMemberOnlineState
    L6_2 = A0_2[L4_2]
    L6_2 = L6_2.p
    L7_2 = A0_2[L4_2]
    L7_2 = L7_2.s
    L5_2(L6_2, L7_2)
  end
end

L0_1.setClanMembersOnlineStatus = L14_1

function L14_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L0_1
  L2_2 = L2_2.getClanMember
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2.onlineStatus = A1_2
  end
end

L0_1.changeClanMemberOnlineState = L14_1

function L14_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = {}
  L4_2.p = A0_2
  L4_2.n = A1_2
  L4_2.t = A2_2
  L5_2 = L1_1
  L5_2 = L5_2.database
  L5_2 = L5_2.addClanMember
  L6_2 = L4_2
  L5_2(L6_2)
  L5_2 = L10_1
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L6_2 = L0_1
  L6_2 = L6_2.addClanMemberDetails
  L7_2 = L5_2
  L6_2(L7_2)
  L6_2 = L0_1
  L6_2 = L6_2.updateClanMembersTable
  L6_2()
  L6_2 = L0_1
  L6_2 = L6_2.changeClanMemberOnlineState
  L7_2 = A0_2
  L8_2 = 1
  L6_2(L7_2, L8_2)
end

function L15_1()
  local L0_2, L1_2, L2_2
  L0_2 = L1_1
  L0_2 = L0_2.getSceneName
  L1_2 = "current"
  L0_2 = L0_2(L1_2)
  if L0_2 == "lua.scenes.clanScene" or L0_2 == "lua.overlays.clanChat" or L0_2 == "lua.overlays.sendClanInvite" then
    L1_2 = L1_1
    L1_2 = L1_2.gotoScene
    L2_2 = "lua.scenes.mainMenu"
    L1_2(L2_2)
    L1_2 = L1_1
    L1_2 = L1_2.purgeScene
    L2_2 = L0_2
    L1_2(L2_2)
  end
end

L0_1.goToMainMenuIfInClanScenes = L15_1

function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = "You were kicked from the clan by "
  L2_2 = A0_2
  L1_2 = L1_2 .. L2_2
  L2_2 = {}
  L2_2.message = L1_2
  
  function L3_2()
    local L0_3, L1_3
    L0_3 = L1_1
    L0_3 = L0_3.data
    L0_3 = L0_3.clans
    L0_3 = L0_3.clanRewardToClaim
    if L0_3 then
      L0_3 = L1_1
      L0_3 = L0_3.comm
      L0_3 = L0_3.claimClanReward
      L0_3()
    end
    L0_3 = L0_1
    L0_3 = L0_3.clearClanData
    L0_3()
    L0_3 = L1_1
    L0_3 = L0_3.comm
    L0_3 = L0_3.clearKickState
    L0_3()
    L0_3 = L0_1
    L0_3 = L0_3.goToMainMenuIfInClanScenes
    L0_3()
  end
  
  L2_2.onCloseCallback = L3_2
  L3_2 = L1_1
  L3_2 = L3_2.createCustomOverlay
  L4_2 = 56
  L5_2 = nil
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
end

L0_1.showSelfKickedMessage = L15_1

function L15_1(A0_2)
  local L1_2, L2_2
  L1_2 = L1_1
  L1_2 = L1_2.database
  L1_2 = L1_2.removeClanMember
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = L0_1
  L1_2 = L1_2.removeClanMemberDetails
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = L13_1
  L2_2 = A0_2
  L1_2(L2_2)
end

function L16_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L0_2 = L0_2.unreadMessages
  if not L0_2 then
    L0_2 = L1_1
    L0_2 = L0_2.data
    L0_2 = L0_2.clans
    L0_2.unreadMessages = 0
  end
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2 = L1_2.unreadMessages
  L1_2 = L1_2 + 1
  L0_2.unreadMessages = L1_2
end

function L17_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L0_2 = L0_2.unreadEvents
  if not L0_2 then
    L0_2 = L1_1
    L0_2 = L0_2.data
    L0_2 = L0_2.clans
    L0_2.unreadEvents = 0
  end
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2 = L1_2.unreadEvents
  L1_2 = L1_2 + 1
  L0_2.unreadEvents = L1_2
end

function L18_1(A0_2, A1_2)
  local L2_2
  if not A1_2 then
    return
  end
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = A1_2
  end
  if A1_2 < L2_2 then
    L2_2 = A1_2
  end
  A1_2 = A1_2 - L2_2
  return A1_2
end

function L19_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = L18_1
  L3_2 = A0_2
  L4_2 = L1_1
  L4_2 = L4_2.data
  L4_2 = L4_2.clans
  L4_2 = L4_2.unreadMessages
  L2_2 = L2_2(L3_2, L4_2)
  L1_2.unreadMessages = L2_2
end

L0_1.clearUnreadMessages = L19_1

function L19_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = L18_1
  L3_2 = A0_2
  L4_2 = L1_1
  L4_2 = L4_2.data
  L4_2 = L4_2.clans
  L4_2 = L4_2.unreadEvents
  L2_2 = L2_2(L3_2, L4_2)
  L1_2.unreadEvents = L2_2
end

L0_1.clearUnreadEvents = L19_1

function L19_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L0_2 = L0_2.unreadMessages
  if not L0_2 then
    L0_2 = 0
  end
  return L0_2
end

L0_1.getNumberOfUnreadMessages = L19_1

function L19_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L0_2 = L0_2.unreadEvents
  if not L0_2 then
    L0_2 = 0
  end
  return L0_2
end

L0_1.getNumberOfUnreadEvents = L19_1

function L19_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L1_1
  L1_2 = L1_2.getSceneName
  L2_2 = "current"
  L1_2 = L1_2(L2_2)
  if L1_2 ~= "lua.scenes.gamePlay" then
    L2_2 = L1_1
    L2_2 = L2_2.createCustomOverlay
    L3_2 = 98
    L4_2 = nil
    L5_2 = A0_2
    L2_2(L3_2, L4_2, L5_2)
  end
end

function L20_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = tonumber
  L2_2 = A0_2.e
  L1_2 = L1_2(L2_2)
  L2_2 = L8_1
  L2_2 = L2_2.create
  if L1_2 == L2_2 then
  else
    L2_2 = L8_1
    L2_2 = L2_2.join
    if L1_2 == L2_2 then
      L2_2 = A0_2.a
      L2_2 = L2_2[1]
      L3_2 = A0_2.a
      L3_2 = L3_2[2]
      L4_2 = tonumber
      L5_2 = A0_2.a
      L5_2 = L5_2[3]
      L4_2 = L4_2(L5_2)
      L5_2 = tonumber
      L6_2 = A0_2.a
      L6_2 = L6_2[4]
      L5_2 = L5_2(L6_2)
      L6_2 = L14_1
      L7_2 = L2_2
      L8_2 = L3_2
      L9_2 = L4_2
      L10_2 = L5_2
      L6_2(L7_2, L8_2, L9_2, L10_2)
    else
      L2_2 = L8_1
      L2_2 = L2_2.leave
      if L1_2 == L2_2 then
        L2_2 = A0_2.a
        L2_2 = L2_2[1]
        L3_2 = L15_1
        L4_2 = L2_2
        L3_2(L4_2)
      else
        L2_2 = L8_1
        L2_2 = L2_2.kick
        if L1_2 == L2_2 then
          L2_2 = L1_1
          L2_2 = L2_2.comm
          L2_2 = L2_2.requestClanRewardToClaim
          L2_2()
          L2_2 = A0_2.a
          L2_2 = L2_2[2]
          L3_2 = A0_2.a
          L3_2 = L3_2[3]
          L4_2 = L1_1
          L4_2 = L4_2.database
          L4_2 = L4_2.getPlayerInformation
          L4_2 = L4_2()
          L4_2 = L4_2.playerId
          if L2_2 == L4_2 then
            L4_2 = L0_1
            L4_2 = L4_2.showSelfKickedMessage
            L5_2 = L3_2
            L4_2(L5_2)
          else
            L4_2 = L15_1
            L5_2 = L2_2
            L4_2(L5_2)
          end
        else
          L2_2 = L8_1
          L2_2 = L2_2.promote
          if L1_2 == L2_2 then
            L2_2 = A0_2.a
            L2_2 = L2_2[1]
            L3_2 = A0_2.a
            L3_2 = L3_2[3]
            L4_2 = L0_1
            L4_2 = L4_2.setPlayerRank
            L5_2 = L2_2
            L6_2 = L3_2
            L4_2(L5_2, L6_2)
            L4_2 = L1_1
            L4_2 = L4_2.database
            L4_2 = L4_2.getPlayerInformation
            L4_2 = L4_2()
            L4_2 = L4_2.playerId
            if L2_2 == L4_2 then
              L4_2 = A0_2.a
              L4_2 = L4_2[4]
              L5_2 = "You were promoted by "
              L6_2 = L4_2
              L5_2 = L5_2 .. L6_2
              L6_2 = L19_1
              L7_2 = L5_2
              L6_2(L7_2)
            end
          else
            L2_2 = L8_1
            L2_2 = L2_2.demote
            if L1_2 == L2_2 then
              L2_2 = A0_2.a
              L2_2 = L2_2[1]
              L3_2 = A0_2.a
              L3_2 = L3_2[3]
              L4_2 = L0_1
              L4_2 = L4_2.setPlayerRank
              L5_2 = L2_2
              L6_2 = L3_2
              L4_2(L5_2, L6_2)
              L4_2 = L1_1
              L4_2 = L4_2.database
              L4_2 = L4_2.getPlayerInformation
              L4_2 = L4_2()
              L4_2 = L4_2.playerId
              if L2_2 == L4_2 then
                L4_2 = A0_2.a
                L4_2 = L4_2[4]
                L5_2 = "You were demoted by "
                L6_2 = L4_2
                L5_2 = L5_2 .. L6_2
                L6_2 = L19_1
                L7_2 = L5_2
                L6_2(L7_2)
              end
            else
              L2_2 = L8_1
              L2_2 = L2_2.levelup
              if L1_2 == L2_2 then
                L2_2 = A0_2.a
                if L2_2 then
                  L2_2 = A0_2.a
                  L2_2 = L2_2[1]
                  if L2_2 then
                    L2_2 = L1_1
                    L2_2 = L2_2.data
                    L2_2 = L2_2.clans
                    L3_2 = tonumber
                    L4_2 = A0_2.a
                    L4_2 = L4_2[1]
                    L3_2 = L3_2(L4_2)
                    L2_2.level = L3_2
                    L2_2 = L1_1
                    L2_2 = L2_2.data
                    L2_2 = L2_2.clans
                    L2_2.experience = 0
                  end
                end
              else
                L2_2 = L8_1
                L2_2 = L2_2.motd
                if L1_2 == L2_2 then
                  L2_2 = A0_2.a
                  if L2_2 then
                    L2_2 = A0_2.a
                    L2_2 = L2_2[1]
                    if L2_2 then
                      L2_2 = A0_2.a
                      L2_2 = L2_2[2]
                      if L2_2 then
                        L2_2 = string
                        L2_2 = L2_2.len
                        L3_2 = A0_2.a
                        L3_2 = L3_2[1]
                        L2_2 = L2_2(L3_2)
                        if 0 < L2_2 then
                          L2_2 = L1_1
                          L2_2 = L2_2.data
                          L2_2 = L2_2.clans
                          L2_2 = L2_2.motd
                          L3_2 = A0_2.a
                          L3_2 = L3_2[1]
                          L2_2.message = L3_2
                          L2_2 = L1_1
                          L2_2 = L2_2.data
                          L2_2 = L2_2.clans
                          L2_2 = L2_2.motd
                          L3_2 = A0_2.a
                          L3_2 = L3_2[2]
                          L2_2.author = L3_2
                      end
                    end
                  end
                  else
                    L2_2 = L1_1
                    L2_2 = L2_2.data
                    L2_2 = L2_2.clans
                    L2_2 = L2_2.motd
                    L2_2.message = "No message."
                    L2_2 = L1_1
                    L2_2 = L2_2.data
                    L2_2 = L2_2.clans
                    L2_2 = L2_2.motd
                    L2_2.author = "?"
                  end
                else
                  L2_2 = L8_1
                  L2_2 = L2_2.change_state
                  if L1_2 == L2_2 then
                  else
                    L2_2 = L8_1
                    L2_2 = L2_2.item_unlocked
                    if L1_2 == L2_2 then
                      L2_2 = L1_1
                      L2_2 = L2_2.comm
                      L2_2 = L2_2.requestClanRewardToClaim
                      L2_2()
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

function L21_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = {}
  L2_2 = A0_2.t
  L1_2.timestamp = L2_2
  L2_2 = tonumber
  L3_2 = A0_2.m
  L2_2 = L2_2(L3_2)
  if L2_2 == 1 then
    L2_2 = A0_2.a
    L2_2 = L2_2[1]
    L1_2.playerId = L2_2
    L2_2 = A0_2.a
    L2_2 = L2_2[2]
    L1_2.playerName = L2_2
    L2_2 = A0_2.a
    L2_2 = L2_2[3]
    L1_2.message = L2_2
  else
    L1_2.event = true
    L2_2 = tonumber
    L3_2 = A0_2.e
    L2_2 = L2_2(L3_2)
    L3_2 = L8_1
    L3_2 = L3_2.create
    if L2_2 == L3_2 then
      L1_2.message = "Clan was created!"
    else
      L3_2 = L8_1
      L3_2 = L3_2.join
      if L2_2 == L3_2 then
        L3_2 = A0_2.a
        L3_2 = L3_2[2]
        L1_2.playerName = L3_2
        L4_2 = L3_2
        L5_2 = " joined the clan."
        L4_2 = L4_2 .. L5_2
        L1_2.message = L4_2
      else
        L3_2 = L8_1
        L3_2 = L3_2.leave
        if L2_2 == L3_2 then
          L3_2 = A0_2.a
          L3_2 = L3_2[2]
          L1_2.playerName = L3_2
          L4_2 = L3_2
          L5_2 = " left the clan."
          L4_2 = L4_2 .. L5_2
          L1_2.message = L4_2
        else
          L3_2 = L8_1
          L3_2 = L3_2.kick
          if L2_2 == L3_2 then
            L3_2 = A0_2.a
            L3_2 = L3_2[1]
            L4_2 = A0_2.a
            L4_2 = L4_2[3]
            L1_2.playerName = L3_2
            L5_2 = L3_2
            L6_2 = " was kicked by "
            L7_2 = L4_2
            L8_2 = "."
            L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2
            L1_2.message = L5_2
          else
            L3_2 = L8_1
            L3_2 = L3_2.promote
            if L2_2 == L3_2 then
              L3_2 = A0_2.a
              L3_2 = L3_2[2]
              L4_2 = A0_2.a
              L4_2 = L4_2[4]
              L1_2.playerName = L3_2
              L5_2 = L3_2
              L6_2 = " was promoted by "
              L7_2 = L4_2
              L8_2 = "."
              L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2
              L1_2.message = L5_2
            else
              L3_2 = L8_1
              L3_2 = L3_2.demote
              if L2_2 == L3_2 then
                L3_2 = A0_2.a
                L3_2 = L3_2[2]
                L4_2 = A0_2.a
                L4_2 = L4_2[4]
                L1_2.playerName = L3_2
                L5_2 = L3_2
                L6_2 = " was demoted by "
                L7_2 = L4_2
                L8_2 = "."
                L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2
                L1_2.message = L5_2
              else
                L3_2 = L8_1
                L3_2 = L3_2.levelup
                if L2_2 == L3_2 then
                  L3_2 = A0_2.a
                  L3_2 = L3_2[1]
                  if not L3_2 then
                    L3_2 = 1
                  end
                  L4_2 = "Clan reached level "
                  L5_2 = L3_2
                  L6_2 = "!"
                  L4_2 = L4_2 .. L5_2 .. L6_2
                  L1_2.message = L4_2
                else
                  L3_2 = L8_1
                  L3_2 = L3_2.motd
                  if L2_2 == L3_2 then
                    L3_2 = "New clan message.\n"
                    L4_2 = A0_2.a
                    L4_2 = L4_2[1]
                    if not L4_2 then
                      L4_2 = ""
                    end
                    L3_2 = L3_2 .. L4_2
                    L1_2.message = L3_2
                  else
                    L3_2 = L8_1
                    L3_2 = L3_2.change_state
                    if L2_2 == L3_2 then
                      L3_2 = A0_2.a
                      L3_2 = L3_2[1]
                      L4_2 = A0_2.a
                      L4_2 = L4_2[2]
                      L5_2 = ""
                      if L3_2 == "true" then
                        L5_2 = "public"
                      elseif L3_2 == "false" then
                        L5_2 = "invite only"
                      end
                      L1_2.playerName = L4_2
                      L6_2 = L4_2
                      L7_2 = " set clan "
                      L8_2 = L5_2
                      L9_2 = "."
                      L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2
                      L1_2.message = L6_2
                    else
                      L3_2 = L8_1
                      L3_2 = L3_2.item_unlocked
                      if L2_2 == L3_2 then
                        L1_2.message = "Clan Reward available!"
                      else
                        L3_2 = L8_1
                        L3_2 = L3_2.challenge
                        if L2_2 == L3_2 then
                          L3_2 = tonumber
                          L4_2 = A0_2.a
                          L4_2 = L4_2[1]
                          L3_2 = L3_2(L4_2)
                          L3_2 = L3_2 + 1
                          L4_2 = L7_1
                          L4_2 = L4_2[L3_2]
                          L5_2 = L4_2
                          L6_2 = " challenge complete!"
                          L5_2 = L5_2 .. L6_2
                          L1_2.message = L5_2
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L2_2 = L1_2.message
  if not L2_2 then
    L2_2 = nil
    return L2_2
  end
  return L1_2
end

function L22_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = A0_2.event
  if L1_2 then
    L1_2 = L1_1
    L1_2 = L1_2.data
    L1_2 = L1_2.clans
    L1_2 = L1_2.eventLog
    if not L1_2 then
      L1_2 = L1_1
      L1_2 = L1_2.data
      L1_2 = L1_2.clans
      L2_2 = {}
      L1_2.eventLog = L2_2
    end
    L1_2 = L1_1
    L1_2 = L1_2.data
    L1_2 = L1_2.clans
    L1_2 = L1_2.eventLog
    L2_2 = L1_1
    L2_2 = L2_2.data
    L2_2 = L2_2.clans
    L2_2 = L2_2.eventLog
    L2_2 = #L2_2
    L2_2 = L2_2 + 1
    L1_2[L2_2] = A0_2
    L1_2 = L1_1
    L1_2 = L1_2.data
    L1_2 = L1_2.clans
    L1_2 = L1_2.eventLog
    L1_2 = #L1_2
    if 3 < L1_2 then
      L1_2 = table
      L1_2 = L1_2.remove
      L2_2 = L1_1
      L2_2 = L2_2.data
      L2_2 = L2_2.clans
      L2_2 = L2_2.eventLog
      L3_2 = 1
      L1_2(L2_2, L3_2)
    end
  end
end

function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2 = L1_2.inClan
  if not L1_2 then
    return
  end
  L1_2 = L21_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L2_2 = tonumber
  L3_2 = A0_2.m
  L2_2 = L2_2(L3_2)
  if L2_2 == 2 then
    L2_2 = L20_1
    L3_2 = A0_2
    L2_2(L3_2)
    L2_2 = L17_1
    L2_2()
  else
    L2_2 = L16_1
    L2_2()
  end
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L2_2 = L2_2.messagelog
  L3_2 = L1_1
  L3_2 = L3_2.data
  L3_2 = L3_2.clans
  L3_2 = L3_2.messagelog
  L3_2 = #L3_2
  L3_2 = L3_2 + 1
  L2_2[L3_2] = L1_2
  L2_2 = L22_1
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = L1_1
  L2_2 = L2_2.data
  L2_2 = L2_2.clans
  L2_2 = L2_2.messagelog
  L2_2 = #L2_2
  L3_2 = L1_1
  L3_2 = L3_2.gameConfig
  L3_2 = L3_2.getMaxClanLogLength
  L3_2 = L3_2()
  if L2_2 > L3_2 then
    L2_2 = table
    L2_2 = L2_2.remove
    L3_2 = L1_1
    L3_2 = L3_2.data
    L3_2 = L3_2.clans
    L3_2 = L3_2.messagelog
    L4_2 = 1
    L2_2(L3_2, L4_2)
  end
end

L0_1.handleMessage = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = {}
  L1_2.messagelog = L2_2
  if A0_2 then
    L1_2 = 1
    L2_2 = #A0_2
    L3_2 = 1
    for L4_2 = L1_2, L2_2, L3_2 do
      L5_2 = L21_1
      L6_2 = A0_2[L4_2]
      L5_2 = L5_2(L6_2)
      if L5_2 then
        L6_2 = L1_1
        L6_2 = L6_2.data
        L6_2 = L6_2.clans
        L6_2 = L6_2.messagelog
        L7_2 = L1_1
        L7_2 = L7_2.data
        L7_2 = L7_2.clans
        L7_2 = L7_2.messagelog
        L7_2 = #L7_2
        L7_2 = L7_2 + 1
        L6_2[L7_2] = L5_2
      end
    end
  end
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2.hasUpdatedClanLog = true
end

L0_1.setClanMessageLog = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L2_2 = {}
  L1_2.eventLog = L2_2
  L1_2 = 1
  L2_2 = #A0_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L21_1
    L6_2 = A0_2[L4_2]
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L6_2 = L22_1
      L7_2 = L5_2
      L6_2(L7_2)
    end
  end
end

L0_1.setClanEventLog = L23_1

function L23_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L0_2 = L0_2.eventLog
  if not L0_2 then
    L0_2 = {}
  end
  return L0_2
end

L0_1.getClanEventLog = L23_1

function L23_1(A0_2)
  local L1_2
  L1_2 = L1_1
  L1_2 = L1_2.data
  L1_2 = L1_2.clans
  L1_2.clanReward = A0_2
end

L0_1.setClanReward = L23_1

function L23_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L0_2 = L0_2.refreshTimestamp
  if not L0_2 then
    L0_2 = 0
  end
  L1_2 = os
  L1_2 = L1_2.time
  L1_2 = L1_2()
  L1_2 = L1_2 - L0_2
  L2_2 = L1_1
  L2_2 = L2_2.gameConfig
  L2_2 = L2_2.getClanRefreshTime
  L2_2 = L2_2()
  if L1_2 > L2_2 then
    L2_2 = L1_1
    L2_2 = L2_2.data
    L2_2 = L2_2.clans
    L3_2 = os
    L3_2 = L3_2.time
    L3_2 = L3_2()
    L2_2.refreshTimestamp = L3_2
    L2_2 = true
    return L2_2
  end
  L2_2 = false
  return L2_2
end

L0_1.shouldRefreshClanScene = L23_1

function L23_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L0_2.clanReward = nil
end

L0_1.clearClanReward = L23_1

function L23_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L0_2 = L0_2.data
  L1_2 = {}
  L0_2.clans = L1_2
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L1_2 = {}
  L0_2.members = L1_2
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L1_2 = {}
  L0_2.motd = L1_2
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L1_2 = {}
  L0_2.messagelog = L1_2
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L1_2 = {}
  L0_2.eventLog = L1_2
  L0_2 = L1_1
  L0_2 = L0_2.database
  L0_2 = L0_2.clearClanData
  L0_2()
  L0_2 = L1_1
  L0_2 = L0_2.data
  L0_2 = L0_2.clans
  L1_2 = {}
  L0_2.memberLeagues = L1_2
end

L0_1.clearClanData = L23_1

function L23_1(A0_2)
  local L1_2
  if A0_2 <= 100 then
    return A0_2
  elseif A0_2 <= 250 then
    L1_2 = "100+"
    return L1_2
  elseif A0_2 <= 500 then
    L1_2 = "250+"
    return L1_2
  elseif A0_2 <= 1000 then
    L1_2 = "500+"
    return L1_2
  elseif A0_2 <= 2500 then
    L1_2 = "1000+"
    return L1_2
  elseif A0_2 <= 5000 then
    L1_2 = "2500+"
    return L1_2
  else
    L1_2 = "5000+"
    return L1_2
  end
end

L0_1.formatClanRankingHistoryText = L23_1

function L23_1(A0_2)
  local L1_2, L2_2
  L1_2 = tonumber
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = L6_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L2_2 = "Competitive"
    return L2_2
  end
  return L1_2
end

L0_1.getAttitudeString = L23_1

function L23_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = tonumber
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L2_1 = L2_2
  L3_1 = A1_2
  L2_2 = os
  L2_2 = L2_2.time
  L2_2 = L2_2()
  L4_1 = L2_2
end

L0_1.setPlayerSupporterStatus = L23_1

function L23_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L0_2 = L0_2.getPlayerSupporterStatusTimeLeft
  L0_2 = L0_2()
  if 0 < L0_2 then
    L0_2 = L2_1
    return L0_2
  end
  L0_2 = 0
  return L0_2
end

L0_1.getPlayerSupporterStatusLevel = L23_1

function L23_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L0_2 = L0_2.storeConfig
  L0_2 = L0_2.getPersonalSupporterClanPointBonus
  L1_2 = L0_1
  L1_2 = L1_2.getPlayerSupporterStatusLevel
  L1_2 = L1_2()
  return L0_2(L1_2)
end

L0_1.getPersonalSupporterBonus = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L5_1
  L2_2 = tonumber
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L1_2[L2_2]
  if not L1_2 then
    L2_2 = ""
    return L2_2
  end
  L2_2 = L1_1
  L2_2 = L2_2.localized
  L2_2 = L2_2.get
  L3_2 = L1_2
  return L2_2(L3_2)
end

L0_1.getSupporterAdjective = L23_1

function L23_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = os
  L0_2 = L0_2.time
  L0_2 = L0_2()
  L1_2 = L4_1
  L1_2 = L0_2 - L1_2
  L2_2 = L3_1
  L2_2 = L2_2 - L1_2
  if L2_2 < 0 then
    L3_2 = 0
    return L3_2
  end
  return L2_2
end

L0_1.getPlayerSupporterStatusTimeLeft = L23_1

function L23_1()
  local L0_2, L1_2
  L0_2 = {}
  L0_2.a = 10
  L0_2.b = 9
  L0_2.c = 8
  L0_2.d = 1
  L0_2.e = 1
  L0_2.f = 0
  return L0_2
end

L0_1.getDefaultClanEmblem = L23_1
L1_1.clanUtils = L0_1
