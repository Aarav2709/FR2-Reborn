local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "lua.network.tcpClient"
L2_1 = L2_1(L3_1)
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = nil
L7_1 = nil
L8_1 = nil
L9_1 = nil
L10_1 = nil
L11_1 = nil
L12_1 = nil
L13_1 = nil
L14_1 = 1
L15_1 = 1
L16_1 = nil
L17_1 = nil
L18_1 = nil
L19_1 = 0
L20_1 = nil
L21_1 = nil
L22_1 = nil
L23_1 = 294
L24_1 = 200

function L25_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L13_1
  if L1_2 then
    L1_2 = L13_1
    L2_2 = L1_2
    L1_2 = L1_2.removeSelf
    L1_2(L2_2)
    L1_2 = nil
    L13_1 = L1_2
  end
  L1_2 = "images/gui/lobby/preview/skinSet"
  L2_2 = A0_2
  L3_2 = ".png"
  L1_2 = L1_2 .. L2_2 .. L3_2
  L2_2 = display
  L2_2 = L2_2.newImageRect
  L3_2 = L1_2
  L4_2 = 102
  L5_2 = 58
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L13_1 = L2_2
  L2_2 = L13_1
  if L2_2 then
    L2_2 = L13_1
    L2_2.anchorY = 0.5
    L2_2 = L13_1
    L2_2.anchorX = 0.5
    L2_2 = L13_1
    L3_2 = L23_1
    L2_2.x = L3_2
    L2_2 = L13_1
    L3_2 = L24_1
    L2_2.y = L3_2
    L2_2 = L3_1
    L3_2 = L2_2
    L2_2 = L2_2.insert
    L4_2 = 1
    L5_2 = L13_1
    L2_2(L3_2, L4_2, L5_2)
  end
end

function L26_1()
  local L0_2, L1_2
  L0_2 = L16_1
  if L0_2 then
    L0_2 = timer
    L0_2 = L0_2.cancel
    L1_2 = L16_1
    L0_2(L1_2)
    L0_2 = nil
    L16_1 = L0_2
  end
end

function L27_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = system
  L1_2 = L1_2.getTimer
  L1_2 = L1_2()
  L2_2 = L20_1
  L2_2 = L1_2 - L2_2
  if L2_2 < 500 then
    L3_2 = 500 - L2_2
    if 50 < L3_2 then
      function L4_2()
        local L0_3, L1_3
        
        L0_3 = L0_1
        L0_3 = L0_3.showSkinType
        L1_3 = A0_2
        L0_3(L1_3)
      end
      
      L5_2 = timer
      L5_2 = L5_2.performWithDelay
      L6_2 = L3_2
      L7_2 = L4_2
      L5_2 = L5_2(L6_2, L7_2)
      L21_1 = L5_2
      return
    end
  end
  L3_2 = display
  L3_2 = L3_2.newImageRect
  L4_2 = "images/gui/lobby/preview/buttonSkin"
  L5_2 = A0_2
  L6_2 = ".png"
  L4_2 = L4_2 .. L5_2 .. L6_2
  L5_2 = 61
  L6_2 = 47
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L5_1 = L3_2
  L3_2 = L5_1
  if L3_2 == nil then
    L3_2 = display
    L3_2 = L3_2.newImageRect
    L4_2 = "images/gui/lobby/preview/buttonSkin1.png"
    L5_2 = 61
    L6_2 = 47
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L5_1 = L3_2
  end
  L3_2 = L25_1
  L4_2 = A0_2
  L3_2(L4_2)
  L3_2 = L5_1
  L4_2 = L23_1
  L3_2.x = L4_2
  L3_2 = L5_1
  L4_2 = L24_1
  L3_2.y = L4_2
  L3_2 = L3_1
  L4_2 = L3_2
  L3_2 = L3_2.insert
  L5_2 = L5_1
  L3_2(L4_2, L5_2)
  L3_2 = L8_1
  L4_2 = L3_2
  L3_2 = L3_2.setSequence
  L5_2 = "end"
  L3_2(L4_2, L5_2)
  L3_2 = L8_1
  L4_2 = L3_2
  L3_2 = L3_2.play
  L3_2(L4_2)
  L3_2 = 3
  L19_1 = L3_2
  L3_2 = L8_1
  if L3_2 then
    L3_2 = L3_1
    L4_2 = L3_2
    L3_2 = L3_2.insert
    L5_2 = L8_1
    L3_2(L4_2, L5_2)
  end
  L3_2 = L22_1
  if L3_2 then
    L3_2 = L22_1
    L3_2 = L3_2.refreshMoney
    L3_2()
  end
end

L0_1.showSkinType = L27_1

function L27_1()
  local L0_2, L1_2
  L0_2 = L15_1
  L0_2 = L0_2 + 1
  L15_1 = L0_2
  L0_2 = L15_1
  L1_2 = L14_1
  if L0_2 > L1_2 then
    L0_2 = 1
    L15_1 = L0_2
  end
  L0_2 = L25_1
  L1_2 = L15_1
  L0_2(L1_2)
end

function L28_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L8_1
  if L1_2 then
    L1_2 = A0_2.phase
    if L1_2 == "ended" then
      L1_2 = L19_1
      if L1_2 == 1 then
        L1_2 = L8_1
        L2_2 = L1_2
        L1_2 = L1_2.setSequence
        L3_2 = "loop"
        L1_2(L2_2, L3_2)
        L1_2 = L8_1
        L2_2 = L1_2
        L1_2 = L1_2.play
        L1_2(L2_2)
        L1_2 = 2
        L19_1 = L1_2
      end
    end
  end
end

function L29_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L11_1
  if L1_2 then
    return
  end
  if A0_2 == 1 then
    L1_2 = L1_1
    L1_2 = L1_2.storeConfig
    L1_2 = L1_2.getPowerUpTryCost
    L2_2 = 1
    L1_2 = L1_2(L2_2)
    L2_2 = L1_1
    L2_2 = L2_2.database
    L2_2 = L2_2.getMoney
    L2_2 = L2_2()
    if L1_2 > L2_2 then
      L1_2 = L22_1
      L1_2 = L1_2.giveCoinFeedback
      L1_2()
      return
    end
  else
    L1_2 = L1_1
    L1_2 = L1_2.storeConfig
    L1_2 = L1_2.getPowerUpTryCost
    L1_2 = L1_2()
    L2_2 = L1_1
    L2_2 = L2_2.database
    L2_2 = L2_2.getGem
    L2_2 = L2_2()
    if L1_2 > L2_2 then
      L1_2 = L22_1
      L1_2 = L1_2.giveGemFeedback
      L1_2()
      return
    end
  end
  L1_2 = display
  L1_2 = L1_2.newSprite
  L2_2 = L1_1
  L2_2 = L2_2.powerUpEffectImageSheet
  L3_2 = L1_1
  L3_2 = L3_2.data
  L3_2 = L3_2.animations
  L3_2 = L3_2.poff
  L1_2 = L1_2(L2_2, L3_2)
  L8_1 = L1_2
  L1_2 = L8_1
  L2_2 = L23_1
  L1_2.x = L2_2
  L1_2 = L8_1
  L2_2 = L24_1
  L1_2.y = L2_2
  L1_2 = L8_1
  L1_2.xScale = 0.8
  L1_2 = L8_1
  L1_2.yScale = 0.8
  L1_2 = L26_1
  L1_2()
  L1_2 = L4_1
  if L1_2 then
    L1_2 = display
    L1_2 = L1_2.remove
    L2_2 = L4_1
    L1_2(L2_2)
    L1_2 = nil
    L4_1 = L1_2
  end
  L1_2 = L13_1
  if L1_2 then
    L1_2 = L13_1
    L2_2 = L1_2
    L1_2 = L1_2.removeSelf
    L1_2(L2_2)
    L1_2 = nil
    L13_1 = L1_2
  end
  L1_2 = L18_1
  if L1_2 then
    L1_2 = L18_1
    L2_2 = L1_2
    L1_2 = L1_2.removeSelf
    L1_2(L2_2)
    L1_2 = nil
    L18_1 = L1_2
  end
  L1_2 = L3_1
  L2_2 = L1_2
  L1_2 = L1_2.insert
  L3_2 = L8_1
  L1_2(L2_2, L3_2)
  L1_2 = L8_1
  L2_2 = L1_2
  L1_2 = L1_2.addEventListener
  L3_2 = "sprite"
  L4_2 = L28_1
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L8_1
  L2_2 = L1_2
  L1_2 = L1_2.setSequence
  L3_2 = "normal"
  L1_2(L2_2, L3_2)
  L1_2 = L8_1
  L2_2 = L1_2
  L1_2 = L1_2.play
  L1_2(L2_2)
  L1_2 = 1
  L19_1 = L1_2
  L1_2 = system
  L1_2 = L1_2.getTimer
  L1_2 = L1_2()
  L20_1 = L1_2
  L1_2 = true
  L11_1 = L1_2
  if A0_2 == 1 then
    L1_2 = L1_1
    L1_2 = L1_2.analytics
    L1_2 = L1_2.addResourceEvent
    L2_2 = "Sink"
    L3_2 = "coin"
    L4_2 = L1_1
    L4_2 = L4_2.storeConfig
    L4_2 = L4_2.getPowerUpTryCost
    L5_2 = 1
    L4_2 = L4_2(L5_2)
    L5_2 = "misc"
    L6_2 = "poweruptry"
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  else
    L1_2 = L1_1
    L1_2 = L1_2.analytics
    L1_2 = L1_2.addResourceEvent
    L2_2 = "Sink"
    L3_2 = "gem"
    L4_2 = L1_1
    L4_2 = L4_2.storeConfig
    L4_2 = L4_2.getPowerUpTryCost
    L4_2 = L4_2()
    L5_2 = "misc"
    L6_2 = "poweruptry"
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  end
  L1_2 = L2_1
  L1_2 = L1_2.sendPurchasePowerUpForSingleGame
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = L9_1
  if L1_2 then
    L1_2 = L9_1
    L1_2.isVisible = false
  end
end

function L30_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = L12_1
  if L1_2 then
    return
  end
  L1_2 = true
  L12_1 = L1_2
  L1_2 = 0
  L19_1 = L1_2
  L1_2 = L1_1
  L1_2 = L1_2.storeConfig
  L1_2 = L1_2.getNumberOfPuSets
  L1_2 = L1_2()
  L14_1 = L1_2
  L1_2 = display
  L1_2 = L1_2.newGroup
  L1_2 = L1_2()
  L9_1 = L1_2
  L1_2 = display
  L1_2 = L1_2.newGroup
  L1_2 = L1_2()
  L3_1 = L1_2
  L1_2 = false
  L11_1 = L1_2
  L1_2 = require
  L2_2 = "lua.modules.currencyDisplay"
  L1_2 = L1_2(L2_2)
  L1_2 = L1_2.create
  L1_2 = L1_2()
  L22_1 = L1_2
  L1_2 = L3_1
  L2_2 = L1_2
  L1_2 = L1_2.insert
  L3_2 = L22_1
  L1_2(L2_2, L3_2)
  L1_2 = "images/gui/lobby/preview/buttonDefault.png"
  if A0_2 == 1 then
    L1_2 = "images/gui/lobby/preview/buttonDefaultCoin.png"
  end
  L2_2 = L1_1
  L2_2 = L2_2.newButton
  L3_2 = {}
  L3_2.image = L1_2
  L3_2.width = 61
  L3_2.height = 47
  
  function L4_2()
    local L0_3, L1_3
    L0_3 = L29_1
    L1_3 = A0_2
    L0_3(L1_3)
  end
  
  L3_2.onPress = L4_2
  L4_2 = L23_1
  L3_2.x = L4_2
  L4_2 = L24_1
  L3_2.y = L4_2
  L2_2 = L2_2(L3_2)
  L4_1 = L2_2
  L2_2 = L27_1
  L2_2()
  L2_2 = L3_1
  L3_2 = L2_2
  L2_2 = L2_2.insert
  L4_2 = L4_1
  L2_2(L3_2, L4_2)
  L2_2 = timer
  L2_2 = L2_2.performWithDelay
  L3_2 = 400
  L4_2 = L27_1
  L5_2 = 0
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L16_1 = L2_2
  L2_2 = display
  L2_2 = L2_2.newImageRect
  L3_2 = "images/gui/lobby/preview/bubble.png"
  L4_2 = 170
  L5_2 = 40
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L2_2.anchorY = 0.5
  L2_2.anchorX = 0.5
  L2_2.x = 0
  L2_2.y = 0
  L2_2.alpha = 0
  L3_2 = L1_1
  L3_2 = L3_2.newText
  L4_2 = {}
  L4_2.string = "Try a powerup set for 1 game"
  L4_2.size = 14
  L5_2 = L2_2.x
  L5_2 = L5_2 - 78
  L4_2.x = L5_2
  L5_2 = L2_2.y
  L5_2 = L5_2 - 4
  L4_2.y = L5_2
  L4_2.ax = 0
  L5_2 = {}
  L6_2 = 0
  L7_2 = 0
  L8_2 = 0
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L4_2.color = L5_2
  L3_2 = L3_2(L4_2)
  L3_2.alpha = 0
  L4_2 = L1_1
  L4_2 = L4_2.data
  L4_2 = L4_2.showPuSkinInfo
  if L4_2 then
    L4_2 = L1_1
    L4_2 = L4_2.data
    L4_2.showPuSkinInfo = false
  else
    L4_2 = L9_1
    L4_2.isVisible = false
  end
  L4_2 = L1_1
  L4_2 = L4_2.newText
  L5_2 = {}
  L6_2 = L1_1
  L6_2 = L6_2.storeConfig
  L6_2 = L6_2.getPowerUpTryCost
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  L5_2.string = L6_2
  L5_2.size = 12
  L6_2 = L23_1
  L6_2 = L6_2 + 4
  L5_2.x = L6_2
  L6_2 = L24_1
  L6_2 = L6_2 + 15
  L5_2.y = L6_2
  L5_2.ax = 1
  L6_2 = {}
  L7_2 = 1
  L8_2 = 1
  L9_2 = 1
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L5_2.color = L6_2
  L4_2 = L4_2(L5_2)
  L18_1 = L4_2
  L4_2 = L3_1
  L5_2 = L4_2
  L4_2 = L4_2.insert
  L6_2 = L18_1
  L4_2(L5_2, L6_2)
  
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L2_2
    L0_3.alpha = 1
    L0_3 = L3_2
    L0_3.alpha = 1
    L0_3 = transition
    L0_3 = L0_3.to
    L1_3 = L9_1
    L2_3 = {}
    L2_3.time = 1000
    L2_3.xScale = 1
    L2_3.yScale = 1
    L3_3 = easing
    L3_3 = L3_3.outElastic
    L2_3.transition = L3_3
    L0_3 = L0_3(L1_3, L2_3)
    L7_1 = L0_3
  end
  
  L5_2 = L9_1
  L6_2 = L23_1
  L6_2 = L6_2 - 4
  L5_2.x = L6_2
  L5_2 = L9_1
  L6_2 = L24_1
  L6_2 = L6_2 - 50
  L5_2.y = L6_2
  L5_2 = L9_1
  L5_2.xScale = 0.1
  L5_2 = L9_1
  L5_2.yScale = 0.1
  L5_2 = L9_1
  L6_2 = L5_2
  L5_2 = L5_2.insert
  L7_2 = L2_2
  L5_2(L6_2, L7_2)
  L5_2 = L9_1
  L6_2 = L5_2
  L5_2 = L5_2.insert
  L7_2 = L3_2
  L5_2(L6_2, L7_2)
  L5_2 = L3_1
  L6_2 = L5_2
  L5_2 = L5_2.insert
  L7_2 = L9_1
  L5_2(L6_2, L7_2)
  L5_2 = timer
  L5_2 = L5_2.performWithDelay
  L6_2 = 400
  L7_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2)
  L17_1 = L5_2
end

L0_1.showButton = L30_1

function L30_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L3_1
  if L1_2 and A0_2 < 2 then
    L1_2 = L11_1
    if not L1_2 then
      L1_2 = transition
      L1_2 = L1_2.to
      L2_2 = L3_1
      L3_2 = {}
      L3_2.time = 150
      L3_2.alpha = 0
      L1_2 = L1_2(L2_2, L3_2)
      L10_1 = L1_2
    end
  end
end

L0_1.timeLeft = L30_1

function L30_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L26_1
  L0_2()
  L0_2 = L17_1
  if L0_2 then
    L0_2 = timer
    L0_2 = L0_2.cancel
    L1_2 = L17_1
    L0_2(L1_2)
    L0_2 = nil
    L17_1 = L0_2
  end
  L0_2 = L4_1
  if L0_2 then
    L0_2 = display
    L0_2 = L0_2.remove
    L1_2 = L4_1
    L0_2(L1_2)
    L0_2 = nil
    L4_1 = L0_2
  end
  L0_2 = L6_1
  if L0_2 then
    L0_2 = transition
    L0_2 = L0_2.cancel
    L1_2 = L6_1
    L0_2(L1_2)
    L0_2 = nil
    L6_1 = L0_2
  end
  L0_2 = L10_1
  if L0_2 then
    L0_2 = transition
    L0_2 = L0_2.cancel
    L1_2 = L10_1
    L0_2(L1_2)
    L0_2 = nil
    L10_1 = L0_2
  end
  L0_2 = L7_1
  if L0_2 then
    L0_2 = transition
    L0_2 = L0_2.cancel
    L1_2 = L7_1
    L0_2(L1_2)
    L0_2 = nil
    L7_1 = L0_2
  end
  L0_2 = L3_1
  if L0_2 then
    L0_2 = L3_1
    L1_2 = L0_2
    L0_2 = L0_2.removeSelf
    L0_2(L1_2)
    L0_2 = nil
    L3_1 = L0_2
  end
  L0_2 = L8_1
  if L0_2 then
    L0_2 = L8_1
    L1_2 = L0_2
    L0_2 = L0_2.removeEventListener
    L2_2 = "sprite"
    L3_2 = L28_1
    L0_2(L1_2, L2_2, L3_2)
    L0_2 = nil
    L8_1 = L0_2
  end
  L0_2 = L21_1
  if L0_2 then
    L0_2 = timer
    L0_2 = L0_2.cancel
    L1_2 = L21_1
    L0_2(L1_2)
    L0_2 = nil
    L21_1 = L0_2
  end
  L0_2 = nil
  L5_1 = L0_2
  L0_2 = nil
  L9_1 = L0_2
  L0_2 = nil
  L11_1 = L0_2
  L0_2 = nil
  L12_1 = L0_2
  L0_2 = nil
  L13_1 = L0_2
  L0_2 = nil
  L18_1 = L0_2
end

L0_1.clean = L30_1
return L0_1
