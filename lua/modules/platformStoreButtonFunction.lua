local L0_1, L1_1, L2_1, L3_1
L0_1 = {}

function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = isAndroid
  if L0_2 then
    L0_2 = "market://details?id=com.dirtybit.funrun2"
    L1_2 = system
    L1_2 = L1_2.getInfo
    L2_2 = "targetAppStore"
    L1_2 = L1_2(L2_2)
    if L1_2 == "amazon" then
      L0_2 = "amzn://apps/android?p=com.dirtybit.funrun2"
    end
    return L0_2
  else
    L0_2 = "https://itunes.apple.com/us/app/fun-run-2-multiplayer-race/id920482331?l=nb&ls=1&mt=8"
    return L0_2
  end
end

L0_1.getStoreLink = L1_1

function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = isAndroid
  if L1_2 then
    L1_2 = "market://details?id=com.dirtybit.funrun2"
    L2_2 = system
    L2_2 = L2_2.getInfo
    L3_2 = "targetAppStore"
    L2_2 = L2_2(L3_2)
    if L2_2 == "amazon" then
      L1_2 = "amzn://apps/android?p=com.dirtybit.funrun2"
    end
    L2_2 = system
    L2_2 = L2_2.openURL
    L3_2 = L1_2
    L2_2(L3_2)
  else
    L1_2 = system
    L1_2 = L1_2.openURL
    L2_2 = "https://itunes.apple.com/us/app/fun-run-2-multiplayer-race/id920482331?l=nb&ls=1&mt=8"
    L1_2(L2_2)
  end
end

L0_1.toPlatformStoreButton = L2_1

function L3_1()
  local L0_2, L1_2, L2_2
  L0_2 = isAndroid
  if L0_2 then
    L0_2 = "market://details?id=com.dirtybit.fra"
    L1_2 = system
    L1_2 = L1_2.getInfo
    L2_2 = "targetAppStore"
    L1_2 = L1_2(L2_2)
    if L1_2 == "amazon" then
      L0_2 = "amzn://apps/android?p=com.dirtybit.fra"
    end
    L1_2 = system
    L1_2 = L1_2.openURL
    L2_2 = L0_2
    L1_2(L2_2)
  else
    L0_2 = system
    L0_2 = L0_2.openURL
    L1_2 = "https://itunes.apple.com/no/app/fun-run-arena-multiplayer/id1118878857?ls=1&mt=8"
    L0_2(L1_2)
  end
end

L0_1.toPlatformStoreCrossPromotion = L3_1
return L0_1
