local L0_1, L1_1
L0_1 = {}

function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L0_2 = display
  L0_2 = L0_2.newGroup
  L0_2 = L0_2()
  L1_2 = require
  L2_2 = "lua.modules.coinReward"
  L1_2 = L1_2(L2_2)
  L2_2 = display
  L2_2 = L2_2.newImageRect
  L3_2 = "images/gui/market/currentCoins.png"
  L4_2 = 70
  L5_2 = 81
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L2_2.anchorX = 0
  L2_2.anchorY = 0
  L2_2.x = 400
  L2_2.y = 0
  L3_2 = composer
  L3_2 = L3_2.database
  L3_2 = L3_2.getMoney
  L3_2 = L3_2()
  L4_2 = composer
  L4_2 = L4_2.database
  L4_2 = L4_2.getGem
  L4_2 = L4_2()
  L5_2 = composer
  L5_2 = L5_2.newText
  L6_2 = {}
  L6_2.string = L3_2
  L6_2.size = 14
  L6_2.x = 424
  L6_2.y = 69
  L6_2.ax = 0
  L7_2 = {}
  L8_2 = 1
  L9_2 = 1
  L10_2 = 1
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L6_2.color = L7_2
  L5_2 = L5_2(L6_2)
  L6_2 = composer
  L6_2 = L6_2.newText
  L7_2 = {}
  L7_2.string = L3_2
  L7_2.size = 14
  L7_2.x = 424
  L7_2.y = 69
  L7_2.ax = 0
  L8_2 = {}
  L9_2 = 1
  L10_2 = 0
  L11_2 = 0
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L7_2.color = L8_2
  L6_2 = L6_2(L7_2)
  L6_2.alpha = 0
  L7_2 = composer
  L7_2 = L7_2.newText
  L8_2 = {}
  L8_2.string = L4_2
  L8_2.size = 14
  L8_2.x = 424
  L8_2.y = 41
  L8_2.ax = 0
  L9_2 = {}
  L10_2 = 1
  L11_2 = 1
  L12_2 = 1
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L8_2.color = L9_2
  L7_2 = L7_2(L8_2)
  L8_2 = composer
  L8_2 = L8_2.newText
  L9_2 = {}
  L9_2.string = L4_2
  L9_2.size = 14
  L9_2.x = 424
  L9_2.y = 41
  L9_2.ax = 0
  L10_2 = {}
  L11_2 = 1
  L12_2 = 0
  L13_2 = 0
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L9_2.color = L10_2
  L8_2 = L8_2(L9_2)
  L8_2.alpha = 0
  L10_2 = L0_2
  L9_2 = L0_2.insert
  L11_2 = L2_2
  L9_2(L10_2, L11_2)
  L10_2 = L0_2
  L9_2 = L0_2.insert
  L11_2 = L5_2
  L9_2(L10_2, L11_2)
  L10_2 = L0_2
  L9_2 = L0_2.insert
  L11_2 = L6_2
  L9_2(L10_2, L11_2)
  L10_2 = L0_2
  L9_2 = L0_2.insert
  L11_2 = L7_2
  L9_2(L10_2, L11_2)
  L10_2 = L0_2
  L9_2 = L0_2.insert
  L11_2 = L8_2
  L9_2(L10_2, L11_2)
  
  function L9_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = 1.2
    L1_3 = 100
    L2_3 = 200
    L3_3 = transition
    L3_3 = L3_3.to
    L4_3 = L7_2
    L5_3 = {}
    L5_3.time = L1_3
    L5_3.xScale = L0_3
    L5_3.yScale = L0_3
    L5_3.tag = "currencyTransition"
    L3_3(L4_3, L5_3)
    L3_3 = transition
    L3_3 = L3_3.to
    L4_3 = L7_2
    L5_3 = {}
    L5_3.time = L1_3
    L5_3.delay = L2_3
    L5_3.xScale = 1
    L5_3.yScale = 1
    L5_3.tag = "currencyTransition"
    L3_3(L4_3, L5_3)
    L3_3 = transition
    L3_3 = L3_3.to
    L4_3 = L8_2
    L5_3 = {}
    L5_3.time = L1_3
    L5_3.xScale = L0_3
    L5_3.yScale = L0_3
    L5_3.alpha = 1
    L5_3.tag = "currencyTransition"
    L3_3(L4_3, L5_3)
    L3_3 = transition
    L3_3 = L3_3.to
    L4_3 = L8_2
    L5_3 = {}
    L5_3.time = L1_3
    L5_3.delay = L2_3
    L5_3.xScale = 1
    L5_3.yScale = 1
    L5_3.alpha = 0
    L5_3.tag = "currencyTransition"
    L3_3(L4_3, L5_3)
  end
  
  L0_2.giveGemFeedback = L9_2
  
  function L10_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = 1.2
    L1_3 = 100
    L2_3 = 200
    L3_3 = transition
    L3_3 = L3_3.to
    L4_3 = L5_2
    L5_3 = {}
    L5_3.time = L1_3
    L5_3.xScale = L0_3
    L5_3.yScale = L0_3
    L5_3.tag = "currencyTransition"
    L3_3(L4_3, L5_3)
    L3_3 = transition
    L3_3 = L3_3.to
    L4_3 = L5_2
    L5_3 = {}
    L5_3.time = L1_3
    L5_3.delay = L2_3
    L5_3.xScale = 1
    L5_3.yScale = 1
    L5_3.tag = "currencyTransition"
    L3_3(L4_3, L5_3)
    L3_3 = transition
    L3_3 = L3_3.to
    L4_3 = L6_2
    L5_3 = {}
    L5_3.time = L1_3
    L5_3.xScale = L0_3
    L5_3.yScale = L0_3
    L5_3.alpha = 1
    L5_3.tag = "currencyTransition"
    L3_3(L4_3, L5_3)
    L3_3 = transition
    L3_3 = L3_3.to
    L4_3 = L6_2
    L5_3 = {}
    L5_3.time = L1_3
    L5_3.delay = L2_3
    L5_3.xScale = 1
    L5_3.yScale = 1
    L5_3.alpha = 0
    L5_3.tag = "currencyTransition"
    L3_3(L4_3, L5_3)
  end
  
  L0_2.giveCoinFeedback = L10_2
  
  function L11_2(A0_3, A1_3)
    local L2_3
    L2_3 = L5_2
    L2_3.text = A0_3
    L2_3 = L7_2
    L2_3.text = A1_3
  end
  
  L0_2.updateMoneyText = L11_2
  L12_2 = nil
  
  function L13_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3
    L3_3 = {}
    L3_3.radial = 50
    L3_3.value = A1_3
    L3_3.targetX = 0
    L3_3.targetY = 0
    L3_3.imageName = A0_3
    L3_3.transitionTime = 300
    L4_3 = L12_2
    if L4_3 then
      L4_3 = L12_2
      L4_3 = L4_3.clean
      L4_3()
      L4_3 = L12_2
      L5_3 = L4_3
      L4_3 = L4_3.removeSelf
      L4_3(L5_3)
      L4_3 = nil
      L12_2 = L4_3
    end
    L4_3 = L1_2
    L4_3 = L4_3.createCoinReward
    L5_3 = L3_3
    L4_3 = L4_3(L5_3)
    L12_2 = L4_3
    L4_3 = L0_2
    L5_3 = L4_3
    L4_3 = L4_3.insert
    L6_3 = L12_2
    L4_3(L5_3, L6_3)
    L4_3 = L12_2
    L4_3.x = 418
    L4_3 = L12_2
    L5_3 = 62 + A2_3
    L4_3.y = L5_3
    L4_3 = L12_2
    L4_3 = L4_3.animateCoins
    L4_3()
  end
  
  function L14_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L1_3 = composer
    L1_3 = L1_3.database
    L1_3 = L1_3.getMoney
    L1_3 = L1_3()
    L2_3 = composer
    L2_3 = L2_3.database
    L2_3 = L2_3.getGem
    L2_3 = L2_3()
    L3_3 = 0
    
    function L4_3()
      local L0_4, L1_4, L2_4
      L0_4 = L11_2
      L1_4 = L1_3
      L2_4 = L2_3
      L0_4(L1_4, L2_4)
      L0_4 = L3_3
      L0_4 = L0_4 - 1
      L3_3 = L0_4
      L0_4 = L3_3
      if L0_4 == 0 then
        L0_4 = A0_3
        if L0_4 then
          L0_4 = A0_3
          L0_4()
        end
      end
    end
    
    L5_3 = L3_2
    if L1_3 > L5_3 then
      L5_3 = transition
      L5_3 = L5_3.to
      L6_3 = L5_2
      L7_3 = {}
      L7_3.time = 100
      L7_3.delay = 700
      L7_3.xScale = 1.2
      L7_3.yScale = 1.2
      L7_3.tag = "currencyTransition"
      L7_3.onComplete = L4_3
      L5_3(L6_3, L7_3)
      L5_3 = transition
      L5_3 = L5_3.to
      L6_3 = L5_2
      L7_3 = {}
      L7_3.time = 100
      L7_3.delay = 900
      L7_3.xScale = 1
      L7_3.yScale = 1
      L7_3.tag = "currencyTransition"
      L7_3.onComplete = L4_3
      L5_3(L6_3, L7_3)
      L3_3 = L3_3 + 2
      L5_3 = L3_2
      L5_3 = L1_3 - L5_3
      if 0 < L5_3 and L5_3 < 3 then
        L5_3 = 3
      elseif 20 < L5_3 then
        L5_3 = 20
      end
      L6_3 = L13_2
      L7_3 = nil
      L8_3 = L5_3
      L9_3 = 0
      L6_3(L7_3, L8_3, L9_3)
    end
    L5_3 = L4_2
    if L2_3 > L5_3 then
      L5_3 = transition
      L5_3 = L5_3.to
      L6_3 = L7_2
      L7_3 = {}
      L7_3.time = 100
      L7_3.delay = 700
      L7_3.xScale = 1.2
      L7_3.yScale = 1.2
      L7_3.tag = "currencyTransition"
      L7_3.onComplete = L4_3
      L5_3(L6_3, L7_3)
      L5_3 = transition
      L5_3 = L5_3.to
      L6_3 = L7_2
      L7_3 = {}
      L7_3.time = 100
      L7_3.delay = 900
      L7_3.xScale = 1
      L7_3.yScale = 1
      L7_3.tag = "currencyTransition"
      L7_3.onComplete = L4_3
      L5_3(L6_3, L7_3)
      L3_3 = L3_3 + 2
      L5_3 = L4_2
      L5_3 = L2_3 - L5_3
      if 0 < L5_3 and L5_3 < 3 then
        L5_3 = 3
      elseif 20 < L5_3 then
        L5_3 = 20
      end
      L6_3 = L13_2
      L7_3 = "gem_small"
      L8_3 = L5_3
      L9_3 = -28
      L6_3(L7_3, L8_3, L9_3)
    end
    if L3_3 == 0 and A0_3 then
      L5_3 = A0_3
      L5_3()
    end
    L3_2 = L1_3
    L4_2 = L2_3
  end
  
  L0_2.refreshMoney = L14_2
  
  function L15_2()
    local L0_3, L1_3
    L0_3 = L12_2
    if L0_3 then
      L0_3 = L12_2
      L0_3 = L0_3.clean
      L0_3()
    end
    L0_3 = transition
    L0_3 = L0_3.cancel
    L1_3 = "currencyTransition"
    L0_3(L1_3)
  end
  
  L0_2.clean = L15_2
  return L0_2
end

L0_1.create = L1_1
return L0_1
