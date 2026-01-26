local M = {}
local composer = require("composer")
local red = {
  1,
  0,
  0
}
local white = {
  1,
  1,
  1
}

local function createCoinReward(totalGold, gold, position, isCoins, targetX, targetY)
  local function getCoinStartPosition()

    local x, y

    if position == 1 then
      x = 254
      y = 176
    elseif position == 2 then
      x = 94
      y = 236
    elseif position == 3 then
      x = 412
      y = 250
    elseif position == 4 then
      x = 576
      y = 310
    end
    return x, y
  end

  local coinRewardGroup = display.newGroup()
  local tickTimer, tickEffectTimer
  local startedClean = false
  local transitionReferences = {}

  local function getSignText(number)
    local signString
    if 0 <= number then
      signString = "+ " .. number
    else
      signString = "- " .. math.abs(number)
    end
    return signString
  end

  totalGold = totalGold or 0
  gold = gold or 0

  local function spawnSparkle(x, y, startScale)
    if startedClean then
      return
    end
    local sparkle = display.newImageRect("images/gui/common/shine.png", 39.5, 39)
    sparkle.anchorX = 0.5
    sparkle.anchorY = 0.5
    sparkle:scale(startScale, startScale)
    sparkle.x = x
    sparkle.y = y
    sparkle.rotation = math.random(360)
    coinRewardGroup:insert(sparkle)
    sparkle:toBack()

    local function removeSparkle()
      if sparkle and sparkle.removeSelf then
        sparkle:removeSelf()
        sparkle = nil
      end
    end

    transitionReferences[#transitionReferences + 1] = transition.to(sparkle, {
      time = 600,
      transition = easing.easeInOutElastic,
      delta = true,
      alpha = -0.5,
      xScale = -sparkle.xScale + 0.1,
      yScale = -sparkle.yScale + 0.1,
      onComplete = removeSparkle,
      onCancel = removeSparkle
    })
  end

  local function coinTickEffect()
    if startedClean then
      return
    end
    local image
    if isCoins then
      image = display.newImageRect("images/gui/common/coin.png", 14, 14)
    else
      local colorToChoose = white
      local text = "+1"
      if gold < 0 then
        colorToChoose = red
        text = "-1"
      end
      image = composer.newText({
        string = text,
        size = 20,
        color = colorToChoose
      })
    end

    local function removeCoin()
      if image and image.removeSelf then
        spawnSparkle(image.x - 7, image.y + 7, 0.7)
        image:removeSelf()
        image = nil
      end
    end

    local finalTargetX = targetX or 355
    local finalTargetY = targetY or 39
    if not isCoins and not targetX then
      finalTargetX = 499
    end
    image.anchorX = 1
    image.anchorY = 0
    local startScale = 0.5
    image:scale(startScale, startScale)
    local startX, startY = getCoinStartPosition()
    local randomXAdd = math.random(-20, 10)
    image.x = startX + randomXAdd
    image.y = startY
    local targetScale = math.random(0.7, 1)
    local transitionTime = 700
    if not isCoins then
      transitionTime = 1200
    end
    local easingFuncY = easing.linear
    local easingFuncX = easing.outInCubic
    if randomXAdd < 0 then
      easingFuncX = easing.inOutCubic
    end
    coinRewardGroup:insert(image)
    spawnSparkle(image.x, image.y, 1)
    transitionReferences[#transitionReferences + 1] = transition.to(image, {
      time = transitionTime,
      xScale = targetScale,
      yScale = targetScale,
      transition = easing.outBack
    })
    transitionReferences[#transitionReferences + 1] = transition.to(image, {
      time = transitionTime,
      y = finalTargetY,
      transition = easingFuncY,
      onComplete = removeCoin,
      onCancel = removeCoin
    })
    transitionReferences[#transitionReferences + 1] = transition.to(image, {
      time = transitionTime,
      x = finalTargetX,
      transition = easingFuncX
    })
  end

  local function animateCoins(onComplete)
    if gold == 0 then
      if onComplete then
        onComplete()
      end
      return
    end
    local timePerTick = 50
    local numberOfTicksGold = 30
    if numberOfTicksGold > gold then
      numberOfTicksGold = gold
    end
    tickEffectTimer = timer.performWithDelay(timePerTick, coinTickEffect, numberOfTicksGold)
  end

  coinRewardGroup.animateCoins = animateCoins

  local function clean()
    startedClean = true
    if tickTimer then
      timer.cancel(tickTimer)
      tickTimer = nil
    end
    if tickEffectTimer then
      timer.cancel(tickEffectTimer)
      tickEffectTimer = nil
    end
    for i = 1, #transitionReferences do
      if transitionReferences[i] then
        transition.cancel(transitionReferences[i])
      end
    end
    transitionReferences = nil
  end

  coinRewardGroup.clean = clean
  return coinRewardGroup
end

M.createCoinReward = createCoinReward
return M
