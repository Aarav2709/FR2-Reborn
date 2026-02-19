local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L0_2 = {}
  L1_2 = nil
  L2_2 = L1_1
  L2_2 = L2_2.database
  L2_2 = L2_2.clearCurrentChestRewardData
  L2_2()
  L0_2.currentChestIndex = 0
  L2_2 = nil
  
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = L0_2
    L1_3 = L1_3.getChestRewardData
    L1_3 = L1_3()
    if L1_3 == nil then
      L2_3 = 0
      return L2_3
    end
    L2_3 = L1_3.type
    if L2_3 == "soft" then
      L3_3 = A0_3 or L3_3
      if not A0_3 then
        L3_3 = 0
      end
      return L3_3
    else
      L3_3 = math
      L3_3 = L3_3.random
      L4_3 = L1_3.min
      L5_3 = L1_3.max
      return L3_3(L4_3, L5_3)
    end
  end
  
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = L1_1
    L1_3 = L1_3.rewardedVideoTypePool
    L1_3 = L1_3[A0_3]
    L2_3 = table
    L2_3 = L2_3.remove
    L3_3 = L1_3
    L4_3 = 1
    L2_3 = L2_3(L3_3, L4_3)
    L3_3 = L1_1
    L3_3 = L3_3.debugger
    L3_3 = L3_3.debugPrint
    L4_3 = "rewardedChests"
    L5_3 = "Removed "
    L6_3 = L2_3 or L6_3
    if not L2_3 then
      L6_3 = -1
    end
    L5_3 = L5_3 .. L6_3
    L3_3(L4_3, L5_3)
    return L2_3
  end
  
  function L5_2(A0_3)
    local L1_3
    L1_3 = L1_1
    L1_3 = L1_3.rewardedVideoTypePool
    L1_3 = L1_3[A0_3]
    L1_3 = L1_3[1]
    return L1_3
  end
  
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = {}
    L1_3 = 0
    L2_3 = 1
    L3_3 = L1_1
    L3_3 = L3_3.rewardedVideoTypePool
    L3_3 = #L3_3
    L4_3 = 1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = #L0_3
      L6_3 = L6_3 + 1
      L7_3 = L1_1
      L7_3 = L7_3.rewardedVideoTypePool
      L7_3 = L7_3[L5_3]
      L7_3 = #L7_3
      L7_3 = L1_3 + L7_3
      L0_3[L6_3] = L7_3
      L6_3 = L1_1
      L6_3 = L6_3.rewardedVideoTypePool
      L6_3 = L6_3[L5_3]
      L6_3 = #L6_3
      L1_3 = L1_3 + L6_3
    end
    L2_3 = L0_3
    L3_3 = L1_3
    return L2_3, L3_3
  end
  
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    L1_3 = {}
    L2_3 = {}
    L3_3 = "gem"
    L2_3[1] = L3_3
    L3_3 = {}
    L4_3 = "x3"
    L5_3 = "x4"
    L6_3 = "x5"
    L3_3[1] = L4_3
    L3_3[2] = L5_3
    L3_3[3] = L6_3
    L4_3 = {}
    L5_3 = "spin"
    L4_3[1] = L5_3
    L1_3[1] = L2_3
    L1_3[2] = L3_3
    L1_3[3] = L4_3
    L2_3 = 1
    L3_3 = #L1_3
    L4_3 = 1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = A0_3[L5_3]
      L7_3 = 1
      L8_3 = L6_3
      L9_3 = 1
      for L10_3 = L7_3, L8_3, L9_3 do
        L11_3 = L1_3[L5_3]
        L11_3 = #L11_3
        if 0 < L11_3 then
          L11_3 = table
          L11_3 = L11_3.remove
          L12_3 = L1_3[L5_3]
          L13_3 = 1
          L11_3(L12_3, L13_3)
        end
      end
    end
    L2_3 = L1_1
    L2_3 = L2_3.debugger
    L2_3 = L2_3.debugTable
    L3_3 = "rewardedChests"
    L4_3 = "Video Pool data: "
    L5_3 = A0_3
    L2_3(L3_3, L4_3, L5_3)
    return L1_3
  end
  
  function L8_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = 0
    L1_3 = 1
    L2_3 = L1_1
    L2_3 = L2_3.rewardedVideoTypePool
    L2_3 = #L2_3
    L3_3 = 1
    for L4_3 = L1_3, L2_3, L3_3 do
      L5_3 = L1_1
      L5_3 = L5_3.rewardedVideoTypePool
      L5_3 = L5_3[L4_3]
      L5_3 = #L5_3
      L0_3 = L0_3 + L5_3
    end
    return L0_3
  end
  
  function L9_2()
    local L0_3, L1_3, L2_3
    L0_3 = L1_1
    L0_3 = L0_3.rewardedVideoTypePool
    if L0_3 then
      L0_3 = L8_2
      L0_3 = L0_3()
      if L0_3 ~= 0 then
        goto lbl_33
      end
    end
    L0_3 = L1_1
    L1_3 = L7_2
    L2_3 = L1_1
    L2_3 = L2_3.database
    L2_3 = L2_3.getRewardedChestPoolData
    L2_3 = L2_3()
    L1_3 = L1_3(L2_3)
    L0_3.rewardedVideoTypePool = L1_3
    L0_3 = L8_2
    L0_3 = L0_3()
    if L0_3 == 0 then
      L0_3 = L1_1
      L0_3 = L0_3.database
      L0_3 = L0_3.resetRewardedChestPoolData
      L0_3()
      L0_3 = L1_1
      L1_3 = L7_2
      L2_3 = L1_1
      L2_3 = L2_3.database
      L2_3 = L2_3.getRewardedChestPoolData
      L2_3 = L2_3()
      L1_3 = L1_3(L2_3)
      L0_3.rewardedVideoTypePool = L1_3
    end
    ::lbl_33::
  end
  
  function L10_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    L1_3 = L9_2
    L1_3()
    L1_3 = L1_1
    L1_3 = L1_3.rewardedVideoTypePool
    if L1_3 then
      L1_3 = L1_1
      L1_3 = L1_3.rewardedVideoTypePool
      L1_3 = #L1_3
      if 0 < L1_3 then
        L1_3 = L1_1
        L1_3 = L1_3.debugger
        L1_3 = L1_3.debugTable
        L2_3 = "rewardedChests"
        L3_3 = "Available Pool: "
        L4_3 = L1_1
        L4_3 = L4_3.rewardedVideoTypePool
        L1_3(L2_3, L3_3, L4_3)
        L1_3 = L6_2
        L1_3, L2_3 = L1_3()
        if L2_3 < 1 then
          L3_3 = nil
          return L3_3
        end
        L3_3 = math
        L3_3 = L3_3.random
        L4_3 = 0
        L5_3 = L2_3 - 1
        L3_3 = L3_3(L4_3, L5_3)
        L4_3 = L1_1
        L4_3 = L4_3.debugger
        L4_3 = L4_3.debugPrint
        L5_3 = "rewardedChests"
        L6_3 = "Random Roll: "
        L7_3 = L3_3
        L6_3 = L6_3 .. L7_3
        L4_3(L5_3, L6_3)
        L4_3 = 1
        L5_3 = #L1_3
        L6_3 = 1
        for L7_3 = L4_3, L5_3, L6_3 do
          L8_3 = L1_3[L7_3]
          if L3_3 < L8_3 then
            L9_3 = L0_2
            L9_3.currentChestIndex = L7_3
            L9_3 = L5_2
            L10_3 = L7_3
            L9_3 = L9_3(L10_3)
            if L9_3 then
              L10_3 = L1_1
              L10_3 = L10_3.debugger
              L10_3 = L10_3.debugPrint
              L11_3 = "rewardedChests"
              L12_3 = "RewardedChest: "
              L13_3 = L9_3
              L12_3 = L12_3 .. L13_3
              L10_3(L11_3, L12_3)
              L10_3 = L1_1
              L10_3 = L10_3.gameConfig
              L10_3 = L10_3.getRandomizedVideoChest
              L11_3 = L9_3
              L10_3 = L10_3(L11_3)
              L0_3 = L10_3
              return L0_3
            end
          end
        end
      end
    end
    return L0_3
  end
  
  function L11_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = L9_2
    L1_3()
    L1_3 = L1_1
    L1_3 = L1_3.rewardedVideoTypePool
    if L1_3 then
      L1_3 = L1_1
      L1_3 = L1_3.rewardedVideoTypePool
      L1_3 = L1_3[1]
      L1_3 = #L1_3
      if 0 < L1_3 then
        L1_3 = L0_2
        L1_3.currentChestIndex = 1
        L1_3 = L5_2
        L2_3 = 1
        L1_3 = L1_3(L2_3)
        if L1_3 then
          L2_3 = L1_1
          L2_3 = L2_3.debugger
          L2_3 = L2_3.debugPrint
          L3_3 = "rewardedChests"
          L4_3 = "RewardedChest for MainMenu: "
          L5_3 = L1_3
          L4_3 = L4_3 .. L5_3
          L2_3(L3_3, L4_3)
          L2_3 = L1_1
          L2_3 = L2_3.gameConfig
          L2_3 = L2_3.getRandomizedVideoChest
          L3_3 = L1_3
          L2_3 = L2_3(L3_3)
          L0_3 = L2_3
        end
      end
    end
    return L0_3
  end
  
  function L12_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L2_3 = L1_1
    L2_3 = L2_3.gameConfig
    L2_3 = L2_3.getGamesBetweenAdBoost
    L2_3 = L2_3()
    L3_3 = L1_1
    L4_3 = L1_1
    L4_3 = L4_3.gamesSinceAdBoost
    if not L4_3 then
      L4_3 = L2_3
    end
    L3_3.gamesSinceAdBoost = L4_3
    if not (L2_3 < 0) then
      L3_3 = L1_1
      L3_3 = L3_3.gamesSinceAdBoost
      if not (L2_3 > L3_3) then
        goto lbl_25
      end
    end
    L3_3 = L1_1
    L4_3 = L1_1
    L4_3 = L4_3.gamesSinceAdBoost
    L4_3 = L4_3 + 1
    L3_3.gamesSinceAdBoost = L4_3
    L3_3 = nil
    do return L3_3 end
    ::lbl_25::
    L3_3 = L1_1
    L3_3 = L3_3.gameConfig
    L3_3 = L3_3.getAdBoostChance
    L4_3 = A0_3
    L3_3 = L3_3(L4_3)
    L4_3 = math
    L4_3 = L4_3.random
    L4_3 = L4_3()
    if L3_3 < L4_3 then
      L4_3 = nil
      return L4_3
    end
    L4_3 = L10_2
    L4_3 = L4_3()
    if L4_3 == nil then
      L5_3 = L1_1
      L5_3 = L5_3.debugger
      L5_3 = L5_3.debugPrint
      L6_3 = "rewardedChests"
      L7_3 = "Randomized Chest Failed. Getting from sequential order."
      L5_3(L6_3, L7_3)
      L5_3 = L1_1
      L5_3 = L5_3.gameConfig
      L5_3 = L5_3.getAdBoostData
      L6_3 = A1_3
      L5_3 = L5_3(L6_3)
      L4_3 = L5_3
    end
    L1_2 = L4_3
    L5_3 = L1_1
    L5_3 = L5_3.database
    L5_3 = L5_3.setCurrentAdChestReward
    L6_3 = L1_2
    L5_3(L6_3)
  end
  
  function L13_2(A0_3)
    local L1_3, L2_3
    if A0_3 == "gem" then
      L1_3 = L11_2
      L1_3 = L1_3()
      L1_2 = L1_3
      L1_3 = L1_1
      L1_3 = L1_3.database
      L1_3 = L1_3.setCurrentAdChestReward
      L2_3 = L1_2
      L1_3(L2_3)
    end
  end
  
  function L14_2()
    local L0_3, L1_3
    L0_3 = L1_2
    if not L0_3 then
      L0_3 = L1_1
      L0_3 = L0_3.database
      L0_3 = L0_3.getCurrentChestRewardData
      L0_3 = L0_3()
      L1_2 = L0_3
    end
    L0_3 = L1_2
    return L0_3
  end
  
  function L15_2()
    local L0_3, L1_3
    L0_3 = L1_2
    if L0_3 then
      L0_3 = L0_2
      L0_3 = L0_3.currentChestIndex
      if 0 < L0_3 then
        L0_3 = L4_2
        L1_3 = L0_2
        L1_3 = L1_3.currentChestIndex
        L0_3(L1_3)
        L0_3 = L1_1
        L0_3 = L0_3.database
        L0_3 = L0_3.updateRewardedChestPoolData
        L1_3 = L0_2
        L1_3 = L1_3.currentChestIndex
        L0_3(L1_3)
      end
    end
    L0_3 = L1_1
    L0_3 = L0_3.database
    L0_3 = L0_3.clearCurrentChestRewardData
    L0_3()
  end
  
  L0_2.rollForChest = L12_2
  L0_2.getChestInfo = L13_2
  L0_2.updateAndClearPoolState = L15_2
  L0_2.findChestRewardValue = L3_2
  L0_2.getChestRewardData = L14_2
  return L0_2
end

L0_1.init = L2_1
return L0_1
