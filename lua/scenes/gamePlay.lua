local composer = require("composer")
local dropDownModule = require("lua.modules.dropdownHelper")
local screen = require("lua.modules.screen")
local offlineLeague = require("lua.modules.offlineLeague")
local scene = composer.newScene()
local powerUpButton, powerUpButtonFX, jumpButton, homeButton, shineEffect, jumpButtonGroup, powerUpButtonGroup, UIgroup, cameraGroup, cameraGroupForeground, countdownField, countdownImg, positionNumber, positionTexts, lagIndicator, jumpButtonImage, powerupButtonImage, selfHuntersMark, selfArrowImage, clean, cleanEnter, layoutHud
local cameraAnchorX, cameraAnchorY
local worldGroup, viewScale, viewWidth, viewHeight
-- Where the local runner sits in the original 480x320 view (Fun Run 2 v4.6).
local CAMERA_ANCHOR_BASE_X = 150
local CAMERA_ANCHOR_BASE_Y = 204
local POSITION_TOP_BASE_Y = 20
-- The race is framed like the original game: the world view covers at least its
-- 480x320 units, scaled uniformly; wider screens see further ahead and taller ones
-- (tablets) see more sky.
local VIEW_WIDTH, VIEW_HEIGHT = 480, 320

function scene:create(event)
  local screenGroup = self.view
  screen.update()
  viewScale = math.min(screen.height / VIEW_HEIGHT, screen.width / VIEW_WIDTH)
  viewWidth = screen.width / viewScale
  viewHeight = screen.height / viewScale
  composer.gameViewport = { width = viewWidth, height = viewHeight, scale = viewScale }
  -- HUD sizes come from the original 480x320 layout, scaled like the world.
  local hud = viewScale

  local function relativeY(value)
    return value * viewScale
  end

  -- Camera anchor in world units: where the local player sits in the view (the same
  -- distance from the left and bottom edges as in the original).
  cameraAnchorX = CAMERA_ANCHOR_BASE_X
  cameraAnchorY = viewHeight - (VIEW_HEIGHT - CAMERA_ANCHOR_BASE_Y)
  local textColor = {
    1,
    1,
    1,
    1
  }
  composer.data.gameInfo.stats = {}
  if composer.onboarding.isActive == true then
    composer.data.gameInfo.ranked = false
  end
  -- A full power-up set (owned, or tried in Quick Play) gets its own themed buttons.
  local hudSet = false
  local myInfo = composer.database.getPlayerInformation() or {}
  for _, racer in ipairs(composer.data.gameInfo.players or {}) do
    if racer.playerId == myInfo.playerId then
      hudSet = composer.storeConfig.isThisAPowerupSet(racer.customPowerUps)
    end
  end
  -- (Sets 1 to 7 all have their own button art.)
  local hudSetId = tonumber(hudSet)
  local hudSuffix = (hudSetId and hudSetId >= 1 and hudSetId <= 7) and tostring(hudSetId) or ""
  -- As in Fun Run 2 your set colours every head on the progress bar, not the others' sets.
  composer.data.gameInfo.hudSuffix = hudSuffix
  worldGroup = display.newGroup()
  worldGroup.xScale, worldGroup.yScale = viewScale, viewScale
  worldGroup.x, worldGroup.y = screen.left, screen.top
  screenGroup:insert(worldGroup)
  cameraGroup = display.newGroup()
  worldGroup:insert(cameraGroup)
  cameraGroupForeground = display.newGroup()
  worldGroup:insert(cameraGroupForeground)
  UIgroup = display.newGroup()
  screenGroup:insert(UIgroup)
  jumpButtonGroup = display.newGroup()
  UIgroup:insert(jumpButtonGroup)
  powerUpButtonGroup = display.newGroup()
  UIgroup:insert(powerUpButtonGroup)
  countdownField = composer.newText({
    string = "",
    x = display.contentWidth * 0.5,
    y = display.contentHeight * 0.44,
    size = 40 * hud,
    color = {
      1,
      1,
      1
    }
  })
  UIgroup:insert(countdownField)
  -- Marker above the local player's head (drawn in screen space over the world).
  selfArrowImage = display.newImageRect("images/game/selfArrow.png", 15 * hud, 15 * hud)
  UIgroup:insert(selfArrowImage)
  selfHuntersMark = display.newImageRect("images/game/markIcon.png", 37 * hud, 34 * hud)
  selfHuntersMark.alpha = 0
  UIgroup:insert(selfHuntersMark)
  homeButton = display.newImageRect("images/gui/common/buttonClosePopup.png", 35 * hud, 35 * hud)
  UIgroup:insert(homeButton)
  positionNumber = composer.newText({
    string = "22",
    x = display.contentWidth * 0.5,
    y = relativeY(POSITION_TOP_BASE_Y),
    size = 40 * hud,
    color = {
      1,
      1,
      1
    }
  })
  positionNumber.anchorX = 0.5
  positionNumber.anchorY = 0.5
  UIgroup:insert(positionNumber)
  -- Jump and powerup buttons, each with a large invisible touch zone in its corner.
  jumpButton = display.newImageRect("images/transparent.png", 150 * hud, 150 * hud)
  jumpButtonGroup:insert(jumpButton)
  jumpButtonImage = display.newImageRect("images/game/buttonJump" .. hudSuffix .. ".png", 68 * hud, 63 * hud)
  jumpButtonGroup:insert(jumpButtonImage)
  powerUpButton = display.newImageRect("images/transparent.png", 150 * hud, 150 * hud)
  powerUpButtonGroup:insert(powerUpButton)
  powerupButtonImage = display.newImageRect("images/game/buttonPowerup" .. hudSuffix .. ".png", 68 * hud, 63 * hud)
  powerUpButtonGroup:insert(powerupButtonImage)
  -- The box on the power-up button takes the set's colours too.
  powerUpButtonFX = display.newSprite(composer.powerUpFXImageSheet,
    require("lua.modules.assetLoader").getButtonAnimation(hudSuffix ~= "" and hudSuffix or 0))
  powerUpButtonFX.xScale = 0.5 * hud
  powerUpButtonFX.yScale = 0.5 * hud
  powerUpButtonGroup:insert(powerUpButtonFX)
  shineEffect = display.newSprite(composer.powerUpFXImageSheet, composer.data.animations.shineEffect)
  shineEffect.xScale = 0.5 * hud
  shineEffect.yScale = 0.5 * hud
  shineEffect.alpha = 0
  powerUpButtonGroup:insert(shineEffect)
  lagIndicator = display.newImageRect("images/game/networkAlert.png", 25 * hud, 25 * hud)
  UIgroup:insert(lagIndicator)
  lagIndicator.alpha = 0

  -- HUD placement for any screen shape. The jump and power-up buttons sit in the
  -- bottom corners of the screen, as in Fun Run 2; the home button and texts stay
  -- inside the safe area (notches, camera cut-outs).
  function layoutHud()
    screen.update()
    countdownField.x = screen.centerX
    countdownField.y = screen.top + screen.height * 0.44
    selfArrowImage.x = worldGroup.x + cameraAnchorX * viewScale
    selfArrowImage.y = worldGroup.y + (cameraAnchorY - 44) * viewScale
    selfHuntersMark.x = selfArrowImage.x
    selfHuntersMark.y = selfArrowImage.y
    homeButton.x = screen.safeLeft + homeButton.width * 0.5 + 8
    homeButton.y = screen.safeTop + homeButton.height * 0.5 + 8
    lagIndicator.x = homeButton.x + homeButton.width + 3
    lagIndicator.y = homeButton.y
    positionNumber.x = screen.centerX
    positionNumber.y = screen.safeTop + relativeY(POSITION_TOP_BASE_Y)
    jumpButton.x = screen.right - jumpButton.width * 0.5
    jumpButton.y = screen.bottom - jumpButton.height * 0.5
    jumpButtonImage.x = screen.right - jumpButtonImage.width * 0.5
    jumpButtonImage.y = screen.bottom - jumpButtonImage.height * 0.5
    powerUpButton.x = screen.left + powerUpButton.width * 0.5
    powerUpButton.y = screen.bottom - powerUpButton.height * 0.5
    powerupButtonImage.x = screen.left + powerupButtonImage.width * 0.5
    powerupButtonImage.y = screen.bottom - powerupButtonImage.height * 0.5
    powerUpButtonFX.x = powerupButtonImage.x - 5 * hud
    powerUpButtonFX.y = powerupButtonImage.y + 3 * hud
    shineEffect.x = powerUpButtonFX.x
    shineEffect.y = powerUpButtonFX.y
  end
  layoutHud()
  positionTexts = {}
  positionTexts[1] = composer.localized.get("1st")
  positionTexts[2] = composer.localized.get("2nd")
  positionTexts[3] = composer.localized.get("3rd")
  positionTexts[4] = composer.localized.get("4th")
  audio.reserveChannels(21)
  -- Practice races are against the three animal bots (Quick Play brings its own).
  if composer.data.gameInfo.gameType == 0 and not composer.data.gameInfo.ranked then
    if composer.onboarding.isActive == true then
      composer.onboarding.setBotCharacters()
    else
      composer.data.gameInfo.players[2] = {
        username = "Sheep",
        avatar = {
          105,
          0,
          0,
          0,
          0,
          0,
          0
        },
        playerId = 1
      }
      composer.data.gameInfo.players[3] = {
        username = "Wolf",
        avatar = {
          105,
          214,
          0,
          0,
          0,
          0,
          0
        },
        playerId = 2
      }
      composer.data.gameInfo.players[4] = {
        username = "Tiger",
        avatar = {
          104,
          0,
          0,
          0,
          0,
          0,
          0
        },
        playerId = 3
      }
    end
  end
  if composer.onboarding.isActive == true then
    composer.onboarding.addGuiReference("jump", jumpButton)
    composer.onboarding.addGuiReference("jump", jumpButtonImage)
    composer.onboarding.addGuiReference("powerUp", powerUpButtonGroup)
    -- Registered last: the tutorial arrow points at the button image itself (the
    -- group's bounds also hold the power-up icon and its effects).
    composer.onboarding.addGuiReference("powerUp", powerupButtonImage)
    composer.onboarding.addGuiReference("position", positionNumber)
    composer.onboarding.addGuiReference("countdown", countdownField)
    composer.onboarding.addGuiReference("selfArrow", selfArrowImage)
    composer.onboarding.addGuiReference("exit", homeButton)
  end

  function clean()
    if homeButton then
      homeButton:removeEventListener("touch", homeButton)
      homeButton = nil
    end
  end
end

function scene:show(event)
  local phase = event.phase
  if phase == "will" then
    return
  end
  local screenGroup = self.view
  local killMessagesGroup = display.newGroup()
  killMessagesGroup.xScale, killMessagesGroup.yScale = viewScale, viewScale
  local mapInterface = require("lua.map.interface")
  local physics = require("physics")
  local powerUps = require("lua.gameLogic.powerUps")
  local basicPlayer = require("lua.gameLogic.player")
  local fireworksHandler = require("lua.game.effects.fireworksHandler")
  local gameRunning = false
  local networkGame = true
  local runOnce = true
  local startedClean = false
  local canPressButton = false
  local backButtonPushed = false
  local powerUpImageReady = false
  local allInGoal = false
  local countdownMessage = 3
  local lastUpdateFormServer = -1
  local disconnectTime = 12000
  local systemStartTime = 0
  local playerPosition = 0
  local playersDisconnected = 0
  local oldX = 0
  local textColor = {
    1,
    1,
    1,
    1
  }
  local bottomBarList = {}
  -- Left edge of the view at the start (world units): no further back than this.
  local START_VIEW_BACK = 110
  local startViewLeft
  -- The progress bar of player heads runs between the powerup and jump buttons; the
  -- heads (40 wide, centred) stay clear of both buttons at the start and the finish.
  local HEAD_HALF_WIDTH, BAR_MARGIN = 20, 6
  local bottomBarStartX, bottomBarLength2
  local function computeBottomBar()
    local startX = powerupButtonImage.x + powerupButtonImage.width * 0.5 + (HEAD_HALF_WIDTH + BAR_MARGIN) * viewScale
    local endX = jumpButtonImage.x - jumpButtonImage.width * 0.5 - (HEAD_HALF_WIDTH + BAR_MARGIN) * viewScale
    bottomBarStartX = math.min(startX, endX)
    bottomBarLength2 = math.max(1, math.abs(endX - startX))
  end
  computeBottomBar()
  local function layoutKillFeedGroup()
    killMessagesGroup.x = screen.safeRight - 6
    killMessagesGroup.y = screen.safeTop + 4
  end
  layoutKillFeedGroup()
  local playerList = {}
  local killTextMessages = {}
  local playerSelf, quitAlert, disconnectAlert, sendTimer, playerTimer, localCountdownTimer, puImageShufflerTimer, playerStartedTimer, antiStuckTimer, antiStuckCounter, botStuckTimer, startTimer, send, powerUpImage
  local myPlayerId = composer.database.getPlayerInformation().playerId
  local stopSend = false
  local btnPowerUpPress, changeSceneTimer, shineTimer
  system.activate("multitouch")

  local function playSound(soundType, channelIndex)
    if composer.database.getSound() == 1 then
      if channelIndex then
        composer.audio.play(soundType, { channel = channelIndex })
      else
        composer.audio.play(soundType)
      end
    end
  end

  local soundLevelOnScreen = 0.9
  local soundLevelClose = 0.7
  local soundLevelFar = 0.4
  local soundLevelOff = 0
  -- World distances (the original game's 480-unit screen width), not screen sizes.
  local distanceThreshold1 = 480
  local distanceThreshold2 = 480 * 2
  local distanceThreshold3 = 480 * 4

  local function determineVolume(x1, x2)
    local distance = math.abs(x1 - x2)
    if distance < distanceThreshold1 then
      return soundLevelOnScreen
    end
    if distance < distanceThreshold2 then
      return soundLevelClose
    end
    if distance < distanceThreshold3 then
      return soundLevelFar
    end
    return soundLevelOff
  end

  local function initPlayers(startXPos, startYPos)
    composer.mainPlayer = nil
    local list = composer.data.gameInfo.players
    for i = 1, #list do
      if list[i].playerId ~= "" then
        local mainPlayer = false
        if list[i].playerId == myPlayerId then
          mainPlayer = true
        end
        local powerUp = math.random(1, 10)
        if powerUp == 2 then
          powerUp = 1
        elseif powerUp == 8 then
          powerUp = 6
        end
        playerList[i] = basicPlayer.new(i, list[i].username, list[i].avatar, powerUp, mainPlayer, playerList,
          startXPos + (i - 1) * 40, startYPos, list[i].customPowerUps)
        playerList[i].addPlaySoundFunction(playSound)
        playerList[i].playerId = list[i].playerId
        if mainPlayer then
          composer.mainPlayer = playerList[i]
        end
        cameraGroup:insert(playerList[i].getBodyPartsGroup())
        cameraGroup:insert(playerList[i])
        cameraGroup:insert(playerList[i].getGhostGroup())
        screenGroup:insert(playerList[i].getScreenGroup())
      end
    end
    if composer.data.gameInfo.gameType == 0 then
      networkGame = false
    end
  end

  local function getPuIcon(puType, size)
    local powerUpImage
    if puType == 0 then
      powerUpImage = display.newImageRect("images/transparent.png", size, size)
    elseif puType == 1 then
      powerUpImage = display.newImageRect("images/game/powerups/icons/sawblade.png", size, size)
    elseif puType == 2 then
      powerUpImage = display.newImageRect("images/game/powerups/icons/beartrap.png", size, size)
    elseif puType == 3 then
      powerUpImage = display.newImageRect("images/game/powerups/icons/lightning.png", size, size)
    elseif puType == 4 then
      powerUpImage = display.newImageRect("images/game/powerups/icons/speed.png", size, size)
    elseif puType == 5 then
      powerUpImage = display.newImageRect("images/game/powerups/icons/shield.png", size, size)
    elseif puType == 6 then
      powerUpImage = display.newImageRect("images/game/powerups/icons/sacrifice.png", size, size)
    elseif puType == 7 then
      powerUpImage = display.newImageRect("images/game/powerups/icons/magnet.png", size, size)
    elseif puType == 8 then
      powerUpImage = display.newImageRect("images/game/powerups/icons/punchbox.png", size, size)
    elseif puType == 9 then
      powerUpImage = display.newImageRect("images/game/powerups/icons/mark.png", size, size)
    elseif puType == 10 then
      powerUpImage = display.newImageRect("images/game/powerups/icons/rocket.png", size, size)
    elseif puType == 11 then
      powerUpImage = display.newImageRect("images/game/powerups/icons/teleport.png", size, size)
    elseif puType == 97 or puType == 98 then
      -- Level hazards (blade traps, icicles).
      powerUpImage = display.newImageRect("images/game/powerups/icons/sawblade.png", size, size)
    elseif puType == 99 then
      powerUpImage = display.newImageRect("images/game/powerups/icons/mapIcon.png", size, size)
    end
    if not powerUpImage then
      powerUpImage = display.newImageRect("images/transparent.png", size, size)
    end
    return powerUpImage
  end

  local function removePowerUpImage()
    if powerUpImage then
      powerUpImage:removeSelf()
      powerUpImage = nil
      powerUpImageReady = false
    end
    powerUpButtonFX.alpha = 1
    powerUpButtonFX:setSequence("close")
    powerUpButtonFX:play()
  end

  local function hidePowerUpButtonFX()
    if powerUpButtonFX and powerUpButtonFX.alpha then
      powerUpButtonFX.alpha = 0
    end
  end

  local function hideShineEffect()
    if shineEffect and shineEffect.alpha then
      shineEffect.alpha = 0
    end
  end

  local function playShineEffect()
    if powerUpButtonFX.alpha == 0 then
      shineEffect.alpha = 1
      shineEffect:setSequence("normal")
      shineEffect:play()
      timer.performWithDelay(200, hideShineEffect)
    end
  end

  local function setPowerUpImage(puType)
    if powerUpImage then
      powerUpImage:removeSelf()
      powerUpImage = nil
    end
    if 50 < puType then
      puType = puType - 50
    end
    powerUpImage = getPuIcon(puType, 60 * viewScale)
    powerUpImage.anchorX = 0.5
    powerUpImage.anchorY = 0.5
    powerUpImage.x = powerupButtonImage.x - 6 * viewScale
    powerUpImage.y = powerupButtonImage.y + 1.5 * viewScale
    powerUpButtonGroup:insert(powerUpImage)
    powerUpImageReady = true
    powerUpButtonFX:setSequence("gotPU")
    powerUpButtonFX:play()
    timer.performWithDelay(80, hidePowerUpButtonFX)
  end

  local function updatePowerUpImage(puType)
    setPowerUpImage(puType)
  end

  -- "This is you": the marker pops up big above the runner, then bounces down onto it.
  local function playSelfArrowIntro()
    if not selfArrowImage then
      return
    end
    local restY = selfArrowImage.y
    selfArrowImage.y = worldGroup.y + 100 * viewScale
    selfArrowImage.alpha = 1
    transition.to(selfArrowImage, { time = 300, xScale = 3, yScale = 3, transition = easing.outBack, tag = "selfArrowTransition" })
    transition.to(selfArrowImage, { time = 300, delay = 400, y = restY, xScale = 1, yScale = 1, transition = easing.outBounce, tag = "selfArrowTransition" })
  end

  local function updateArrow()
    if not playerSelf then
      return
    end
    if playerSelf.ninjaMark then
      selfHuntersMark.alpha = 1
    else
      selfHuntersMark.alpha = 0
    end
  end

  local function updateBottomBar(index)
    local length = mapInterface.getLength() - 10
    if length <= 0 then
      bottomBarList[index].x = bottomBarStartX
      return
    end
    local progress = playerList[index].x / length
    if progress < 0 then
      progress = 0
    elseif progress > 1 then
      progress = 1
    end
    bottomBarList[index].x = progress * bottomBarLength2 + bottomBarStartX
  end

  local function updatePositionNumber(position)
    if position ~= positionNumber.text and positionTexts then
      positionNumber.text = positionTexts[position]
    end
  end

  -- Kill feed (top right): "killer [icon] victim", newest on top, a few entries at most.
  local KILL_FEED_MAX = 4
  local KILL_FEED_TIME = 6000
  local KILL_FEED_ROW = 24

  local function killFeedName(playerIndex)
    if playerIndex == 98 then
      return composer.localized.get("Level")
    end
    local entry = playerList and playerList[playerIndex]
    if entry and entry.getUsername then
      return entry.getUsername() or ""
    end
    return ""
  end

  local function layoutKillFeed()
    for i = 1, #killTextMessages do
      killTextMessages[i].y = (i - 1) * KILL_FEED_ROW
    end
  end

  local function removeKillFeedEntry(entry)
    for i = #killTextMessages, 1, -1 do
      if killTextMessages[i] == entry then
        table.remove(killTextMessages, i)
      end
    end
    display.remove(entry)
    if not startedClean then
      layoutKillFeed()
    end
  end

  -- The player's kills, deaths and suicides this race (for their league profile).
  -- Magnet pulls, bounce traps and finishing also go through the kill feed.
  local raceKills, raceDeaths, raceSuicides = 0, 0, 0
  local function countKill(killerId, puType, killedId)
    if not playerSelf or puType == 7 or puType == 8 or puType == 99 then
      return
    end
    if killedId == playerSelf.id then
      if killerId == playerSelf.id or killerId == 98 then
        raceSuicides = raceSuicides + 1
      else
        raceDeaths = raceDeaths + 1
      end
    elseif killerId == playerSelf.id then
      raceKills = raceKills + 1
    end
  end

  local function createKillText(killerId, puType, killedId)
    if not playerList or startedClean then
      return
    end
    countKill(killerId, puType, killedId)
    local killerName = killFeedName(killerId)
    local killedName = killFeedName(killedId)
    if puType == 7 or puType == 99 then
      killedName = ""
    end
    local entry = display.newGroup()
    local text = composer.newText({ string = killedName, size = 21, color = { 1, 1, 1 } })
    text.anchorX, text.anchorY = 1, 0
    text.x = 0
    entry:insert(text)
    local puIcon = getPuIcon(puType, 26)
    puIcon.anchorX, puIcon.anchorY = 1, 0
    puIcon.x = text.x - text.width
    puIcon.y = 2
    entry:insert(puIcon)
    local text2 = composer.newText({ string = killerName, size = 21, color = { 1, 1, 1 } })
    text2.anchorX, text2.anchorY = 1, 0
    text2.x = puIcon.x - puIcon.width
    entry:insert(text2)
    killMessagesGroup:insert(entry)
    table.insert(killTextMessages, 1, entry)
    while #killTextMessages > KILL_FEED_MAX do
      removeKillFeedEntry(killTextMessages[#killTextMessages])
    end
    layoutKillFeed()
    timer.performWithDelay(KILL_FEED_TIME, function()
      if not startedClean then
        removeKillFeedEntry(entry)
      end
    end, 1)
  end

  function composer.isOnScreen(x, y)
    if not playerSelf then
      return false
    end
    local viewLeft = playerSelf.x - cameraAnchorX
    return x >= viewLeft - 300 and x <= viewLeft + viewWidth + 200
  end

  local function playerInScreen(id)
    return composer.isOnScreen(playerList[id].x, playerList[id].y)
  end

  local function gameController(event)
    composer.debugger.logFPS()
    composer.debugger.logMemUsage()
    composer.debugger.profile("gameLoop")
    if not startedClean and playerSelf then
      local activeCameraX = true
      local activeCameraY = true
      if composer.onboarding.isActive == true and composer.onboarding.disableCameraX(playerSelf.x) then
        activeCameraX = false
      end
      if not activeCameraX and composer.onboarding.shouldSetStartCamera() then
        activeCameraX = true
      end
      if not activeCameraX then
        activeCameraY = not composer.onboarding.disableCameraY(playerSelf.x)
      end
      if activeCameraX then
        -- Near the start the view stops short of the map's left wall (which shows
        -- when the player starts in the first slot); then it follows as usual.
        local viewLeft = playerSelf.x - cameraAnchorX
        if startViewLeft and viewLeft < startViewLeft and composer.onboarding.isActive ~= true then
          viewLeft = startViewLeft
        end
        mapInterface.updateBackgrounds(-(viewLeft + cameraAnchorX), -playerSelf.y)
        cameraGroup.x = -viewLeft
        cameraGroupForeground.x = -viewLeft
        selfArrowImage.x = worldGroup.x + (playerSelf.x - viewLeft) * viewScale
        selfHuntersMark.x = selfArrowImage.x
      end
      if composer.culler then
        composer.culler.update(-cameraGroup.x, viewWidth)
      end
      if activeCameraY then
        cameraGroup.y = -playerSelf.y + cameraAnchorY
        cameraGroupForeground.y = -playerSelf.y + cameraAnchorY
      end
      if gameRunning then
        if composer.onboarding.isActive == true then
          composer.onboarding.ingameUpdate()
        end
        if playerList then
          for i = 1, #playerList do
            if playerInScreen(i) then
              playerList[i].interpolation()
              playerList[i].calculateRotation()
            else
              playerList[i].forcePlayer()
            end
          end
        end
      elseif playerList and composer.onboarding.isActive ~= true then
        -- Waiting at the start: the trails already fly.
        for i = 1, #playerList do
          if playerList[i].updateIdleTrail then
            playerList[i].updateIdleTrail()
          end
        end
      end
    end
    composer.debugger.profile("gameLoop")
  end

  local function goToNextScreen()
    if not startedClean then
      if composer.onboarding.isActive == true then
        composer.onboarding.stepDone()
      else
        -- Offline mode: show the score screen or replay option
        if composer.config.offlineMode then
          -- Go to the score screen
          composer.gotoScene("lua.scenes.postLobby")
          composer.removeScene("lua.scenes.gamePlay")
        else
          composer.gotoScene("lua.scenes.postLobby")
          composer.removeScene("lua.scenes.gamePlay")
        end
      end
    end
  end

  -- The player's place when they crossed the line (later finishers can't change it).
  local selfFinishPlace

  local function awardLocalRewards(placement)
    if composer.data.gameInfo.stats and composer.data.gameInfo.stats.rewardsApplied then
      return
    end
    local ranked = composer.data.gameInfo.ranked == true
    -- Practice races are just for fun: no coins, gems or league rating (the tutorial
    -- still pays its coins).
    if not ranked and composer.onboarding.isActive ~= true then
      composer.data.gameInfo.stats.place = placement
      composer.data.gameInfo.stats.practice = true
      composer.data.gameInfo.stats.rewardsApplied = true
      return
    end
    local rewardTable = {
      [1] = { coins = 60, xp = 40, gems = 1 },
      [2] = { coins = 40, xp = 30, gems = 0 },
      [3] = { coins = 25, xp = 20, gems = 0 },
      [4] = { coins = 15, xp = 15, gems = 0 }
    }
    local reward = rewardTable[placement] or rewardTable[4]
    local coins = reward.coins
    -- The "Double coins" boost (store item 1001) doubles race coins, as in Fun Run 2.
    local ownedItems = composer.database.getItems()
    if ownedItems and ownedItems["1001"] then
      coins = coins * 2
    end
    composer.database.increaseMoney(coins)
    composer.database.increaseXp(reward.xp)
    if reward.gems and reward.gems > 0 then
      composer.database.increaseGems(reward.gems)
    end
    composer.data.gameInfo.stats.g = coins
    composer.data.gameInfo.stats.h = composer.database.getMoney()
    composer.data.gameInfo.stats.xp = reward.xp
    composer.data.gameInfo.stats.xpTotal = composer.database.getXp()
    composer.data.gameInfo.stats.gems = reward.gems
    composer.data.gameInfo.stats.gemsTotal = composer.database.getGems()
    composer.data.gameInfo.stats.place = placement
    -- League rating for the finishing place (Quick Play only); a promotion is
    -- announced on the results screen.
    if ranked then
      offlineLeague.endRankedRace()
      require("lua.modules.racerProfiles").recordRace(placement, raceKills, raceDeaths, raceSuicides)
      local leagueResult = offlineLeague.recordRace(placement)
      composer.data.gameInfo.stats.a = leagueResult.rating
      composer.data.gameInfo.stats.r = leagueResult.delta
      composer.data.gameInfo.stats.league = leagueResult.tier
      -- (A promotion not announced yet stays queued until a screen shows it.)
      composer.league = leagueResult.popup or composer.league
    end
    composer.data.gameInfo.stats.rewardsApplied = true
  end

  -- Bots can get stuck (e.g. dying on the same blade over and over). Once the
  -- local runner is home, give them a while and then bring the stragglers in
  -- behind the runner, as the tutorial races do.
  local BOT_FINISH_GRACE = 15000
  local botFinishTimer

  local function bringBotsHome()
    botFinishTimer = nil
    if startedClean or allInGoal or not playerList then
      return
    end
    local runnerTime = playerSelf.getPlayerGoalTime()
    for i = 1, #playerList do
      local racer = playerList[i]
      if racer ~= playerSelf and racer.forceInGoal and racer.getPlayerGoalTime() < 1 then
        racer.forceInGoal(runnerTime + math.random(1005, 10243))
      end
    end
  end

  local function endGame(playerInGoal)
    if not startedClean and not allInGoal then
      local playersInGoal = 0
      local thisPlayerPosition = 1
      local rankingTable = {}
      for i = 1, #playerList do
        local playerTime = playerList[i].getPlayerGoalTime()
        if playerTime == -2 then
          playerTime = 9999999999
        end
        local playerUsername = playerList[i].getUsername()
        rankingTable[i] = {
          username = playerUsername,
          goalTime = playerTime,
          index = i
        }
        if 0 < playerTime then
          playersInGoal = playersInGoal + 1
          if playerTime < playerSelf.getPlayerGoalTime() then
            thisPlayerPosition = thisPlayerPosition + 1
          end
        end
      end
      composer.data.gameInfo.quickPlayerRankingTable = rankingTable
      if playerInGoal == playerSelf.id then
        selfFinishPlace = thisPlayerPosition
        updatePositionNumber(thisPlayerPosition)
        -- Quick Play keeps the player's best time on each map.
        if composer.data.gameInfo.ranked then
          local bestTimes = require("lua.modules.bestTimes")
          if bestTimes.record(composer.data.gameInfo.map, playerSelf.getPlayerGoalTime()) then
            composer.data.gameInfo.stats.newBestTime = true
          end
        end
        -- Fireworks over the finish line, livelier for better placings. Purely
        -- cosmetic, so a failure here must not stop the race from ending.
        local goalX = mapInterface.getGoal()
        pcall(fireworksHandler.startFireWorks, goalX, playerSelf.y, cameraGroup, thisPlayerPosition)
      end
      if playersInGoal == #playerList and not allInGoal then
        awardLocalRewards(thisPlayerPosition)
        if composer.data.gameInfo.gameType == 0 then
          allInGoal = true
          timer.performWithDelay(2000, goToNextScreen, 1)
        end
      elseif composer.data.gameInfo.gameType == 0 and playerInGoal == playerSelf.id
          and composer.onboarding.isActive ~= true and not botFinishTimer then
        botFinishTimer = timer.performWithDelay(BOT_FINISH_GRACE, bringBotsHome, 1)
      elseif composer.onboarding.isActive == true and playerInGoal == playerSelf.id then
        if homeButton then
          homeButton.isVisible = false
        end
        local livePlayerFinishTime = playerList[1].getPlayerGoalTime()
        for i = 2, #playerList do
          local playerTime = playerList[i].getPlayerGoalTime()
          if playerTime < 1 then
            playerList[i].forceInGoal(livePlayerFinishTime + math.random(1005, 10243))
          end
        end
      end
    end
  end

  local function gameOver()
    playerSelf.setCurrentGameTime(system.getTimer() - systemStartTime)
    if gameRunning and networkGame then
      send(nil)
    end
    powerUpButton:removeEventListener("touch", powerUpButton)
    jumpButton:removeEventListener("touch", jumpButton)
    if composer.data.gameInfo.gameType == 0 then
      local currentGameTimeForPlayerSelf = playerSelf.getCurrentGameTime()
      playerSelf.setPlayerGoalTime(currentGameTimeForPlayerSelf)
      createKillText(playerSelf.id, 99, playerSelf.id)
      endGame(playerSelf.id)
    end
  end

  local function updatePlayers()
    if not playerSelf or not mapInterface then
      return
    end
    if gameRunning and not startedClean then
      playerPosition = 1
      for i = 1, #playerList do
        if playerInScreen(i) or composer.data.gameInfo.gameType == 0 then
          if mapInterface.isInGoal(playerList[i].x) then
            playerList[i].stopPlayer()
            if runOnce and mapInterface.isInGoal(playerSelf.x) then
              composer.audio.play("crowd_cheer")
              runOnce = false
              gameOver()
              if antiStuckTimer then
                timer.cancel(antiStuckTimer)
                antiStuckTimer = nil
              end
            end
          else
            playerList[i].accelerate()
          end
        else
          playerList[i].pauseSprite()
        end
        if playerList[i].x > playerSelf.x then
          playerPosition = playerPosition + 1
        end
        updateBottomBar(i)
      end
      updateArrow()
      if not mapInterface.isInGoal(playerSelf.x) then
        updatePositionNumber(playerPosition)
        playerSelf.setPlayerPosition(playerPosition, #playerList - playersDisconnected)
      end
    end
  end

  local function fadecountdownField()
    transition.to(countdownField, { time = 400, alpha = 1 })
    transition.to(countdownField, {
      time = 400,
      delay = 500,
      alpha = 0
    })
  end

  local function quitGameClean()
    if startedClean then
      return
    end
    startedClean = true
    physics.pause()
    for i = 1, #playerList do
      playerList[i].pauseSprite()
    end
    if playerSelf.getPlayerGoalTime() < 0 then
      powerUpButton:removeEventListener("touch", powerUpButton)
      jumpButton:removeEventListener("touch", jumpButton)
    end
    if networkGame then
      composer.tcpClient.stopTCPClient()
    end
  end

  local function createCountdownImage(imageText)
    if countdownImg then
      countdownImg:removeSelf()
      countdownImg = nil
    end
    if imageText == "GO!" then
      countdownImg = display.newImageRect("images/game/countdownGo.png", 129 * viewScale, 70 * viewScale)
    else
      if string.len(imageText) > 1 then
        imageText = imageText:sub(1, 1)
      end
      countdownImg = display.newImageRect("images/game/countdown" .. imageText .. ".png", 129 * viewScale, 70 * viewScale)
    end
    if countdownImg then
      countdownImg.x = display.contentWidth * 0.5
      countdownImg.y = display.contentHeight * 0.3
      UIgroup:insert(countdownImg)
    end
  end

  local function fadecountdownImage()
    transition.to(countdownImg, { time = 400, alpha = 1 })
    transition.to(countdownImg, {
      time = 400,
      delay = 500,
      alpha = 0
    })
  end

  local function goToNextScene()
    composer.gotoScene("lua.scenes.mainMenu")
    composer.removeScene("lua.scenes.gamePlay")
  end

  local function disconnectAlertComplete(event)
    if "clicked" == event.action then
      quitGameClean()
      timer.performWithDelay(200, goToNextScene, 1)
    end
  end

  -- Leaving a Quick Play race: before the finish it costs league rating; after it the
  -- result counts as it stands.
  local function leaveRankedRace()
    if not composer.data.gameInfo.ranked or (composer.data.gameInfo.stats and composer.data.gameInfo.stats.rewardsApplied) then
      return
    end
    if selfFinishPlace then
      awardLocalRewards(selfFinishPlace)
    else
      offlineLeague.endRankedRace()
      offlineLeague.applyLeavePenalty()
    end
  end

  local function quitAlertComplete(event)
    if "clicked" == event.action then
      local i = event.index
      if 1 == i then
        if startedClean then
          return
        end
        leaveRankedRace()
        quitGameClean()
        if composer.onboarding.isActive == true then
          composer.onboarding.deactivate(true)
        end
        timer.performWithDelay(200, goToNextScene, 1)
      elseif 2 == i then
      end
    end
  end

  local function quitAlertCompleteIOS(event)
    if "clicked" == event.action then
      local i = event.index
      if 1 == i then
      elseif 2 == i then
        if startedClean then
          return
        end
        leaveRankedRace()
        quitGameClean()
        if composer.onboarding.isActive == true then
          composer.onboarding.deactivate(true)
        end
        timer.performWithDelay(200, goToNextScene, 1)
      end
    end
  end

  local function showDisconnectAlert(allOtherPlayers)
    if 1 < #playerList and not disconnectAlert then
      quitGameClean()
      if isSimulator and composer.config.bot then
        timer.performWithDelay(200, goToNextScene, 1)
      else
        disconnectAlert = native.showAlert(composer.localized.get("Disconnected"),
          composer.localized.get("LostConnection"), {
            composer.localized.get("Ok")
          }, disconnectAlertComplete)
        composer.analytics.newEvent("design", {
          event_id = "gamePlay:lost connection",
          area = composer.config.fullVersion
        })
      end
    end
  end

  local function showQuitAlert()
    local message = composer.localized.get("QuitGame")
    if composer.data.gameInfo.ranked and playerSelf and playerSelf.getPlayerGoalTime() <= 0 then
      message = composer.localized.get("QuitGameWithWarning")
    elseif networkGame then
      message = composer.localized.get("QuitGameWithWarning")
      if playerSelf.getPlayerGoalTime() > 0 then
        message = composer.localized.get("QuitGame")
      end
    end
    if composer.onboarding.isActive == true then
      message = composer.localized.get("QuitOnboarding")
    end
    if isAndroid then
      quitAlert = native.showAlert(composer.localized.get("Quit"), message, {
        composer.localized.get("Yes"),
        composer.localized.get("No")
      }, quitAlertComplete)
    else
      quitAlert = native.showAlert(composer.localized.get("Quit"), message, {
        composer.localized.get("No"),
        composer.localized.get("Yes")
      }, quitAlertCompleteIOS)
    end
  end

  local function checkForAntiStuck()
    if playerSelf then
      if math.abs(playerSelf.x - oldX) < 50 then
        antiStuckCounter = antiStuckCounter + 1
      else
        antiStuckCounter = 0
      end
      if antiStuckCounter == 3 then
        composer.tcpClient.stopTCPClient()
        disconnectAlert = native.showAlert(composer.localized.get("Disconnected"), composer.localized.get("DidNotMove"),
          {
            composer.localized.get("Ok")
          }, disconnectAlertComplete)
      end
      oldX = playerSelf.x
    end
  end

  local function receiveUpdateFromNetworkGamePlay(data)
    if startedClean then
      return
    end
    local messageID = data[1]
    local messageType = composer.gameConfig.getMessageTypeForID(messageID)
    lastUpdateFormServer = system.getTimer()
    if lagIndicator.alpha == 1 then
      lagIndicator.alpha = 0
    end
    if messageType == "HEARTBEAT" then
    elseif messageType == "START_RACE" then
      gameRunning = true
      systemStartTime = system.getTimer()
      if isSimulator and composer.config.bot then
        playerSelf.setBotModuleFunction(send, systemStartTime, btnPowerUpPress)
      end
      antiStuckTimer = timer.performWithDelay(5000, checkForAntiStuck, 0)
      playSound("start")
    elseif messageType == "REMOVE_OBJECT" then
      playerList[data[2]].setPlayerGoalTime(-2)
      playerList[data[2]].setDisconnected()
      endGame(data[2])
    elseif messageType == "PLAYER_JUMPED" then
      playerList[data[2]].corrigateOtherPlayers(data[4], data[5], data[6], data[7])
      playerList[data[2]].jump()
    elseif messageType == "PLAYER_USED_POWERUP" then
      if playerList[data[2]] == nil then
        return
      elseif playerList[data[2]].mainPlayer then
        return
      end
      powerUps.usePowerUp(data[4], data[2], myPlayerId, nil, data[5], data[6], cameraGroup, screenGroup, playerList)
    elseif messageType == "SET_PLAYER_DEAD" then
      playerList[data[2]].playHitAnimation(data[5], data[7], data[4])
    elseif messageType == "PLAYER_FINISHED" then
      playerList[data[2]].setPlayerGoalTime(data[4])
      createKillText(data[2], 99, data[2])
      endGame(data[2])
      if isSimulator and composer.config.bot and playerList[data[2]].mainPlayer then
        goToNextScene()
      end
    elseif messageType == "RACE_FINISHED" then
      composer.debugger.debugTable("network", "Finished Race Data: ", data[2])
      composer.data.gameInfo.stats = data[2]
      changeSceneTimer = timer.performWithDelay(1000, goToNextScreen)
    elseif messageType == "CORRIGATE_POSITION" then
      if playerList[data[2]] == nil then
        return
      elseif playerList[data[2]].mainPlayer then
        return
      end
      playerList[data[2]].corrigateOtherPlayers(data[3], data[4], data[5], data[6])
      playerList[data[2]].connected = true
      local volume = determineVolume(playerSelf.x, data[3])
      playerList[data[2]].setSoundVolume(volume)
    elseif messageType == "UNLOCKED_AWARD" then
      local formatedData = {}
      formatedData[1] = 0
      formatedData[2] = data[2]
      formatedData[3] = data[3]
      formatedData[4] = data[4]
      dropDownModule.showAchivement(formatedData)
    elseif messageType then
      print("ERROR NETWORK: Uncaught messagetype: ", messageType)
    elseif messageID then
      print("ERROR NETWORK: Uncaught messageid: ", messageID)
    else
      print("ERROR NETWORK: Got this stuff, dunno what to do: ", data)
    end
  end

  local function sendPing()
    local msgID = composer.gameConfig.getClientMessageTypeForName("HEARTBEAT")
    local msg = "[" .. msgID .. "]"
    composer.tcpClient.sendMinimizedMessage(msg)
  end

  local function checkForDisconnect()
    if networkGame and 1 < #playerList then
      local currentTime = system.getTimer()
      if currentTime - lastUpdateFormServer > disconnectTime * 0.2 and not allInGoal then
        sendPing()
      end
      if currentTime - lastUpdateFormServer > disconnectTime * 0.4 and not allInGoal and lagIndicator.alpha == 0 then
        lagIndicator.alpha = 1
      end
      if currentTime - lastUpdateFormServer > disconnectTime and not allInGoal then
        composer.tcpClient.stopTCPClient()
        showDisconnectAlert()
      end
      local otherPlayerDisconnected = 0
      for i = 1, #playerList do
        if playerList[i].getPlayerGoalTime() == -2 then
          otherPlayerDisconnected = otherPlayerDisconnected + 1
        end
      end
      if otherPlayerDisconnected ~= playersDisconnected then
        playersDisconnected = otherPlayerDisconnected
      end
    end
  end

  local function countdownCompleted()
    gameRunning = true
    systemStartTime = system.getTimer()
    for i = 1, #playerList do
      playerList[i].playNinjaEffect()
      if composer.data.gameInfo.gameType == 0 then
        playerList[i].setBotModuleFunction(receiveUpdateFromNetworkGamePlay, systemStartTime)
      end
    end
    if composer.data.gameInfo.gameType == 0 then
      playSound("start")
    end
  end

  local function localCountdown(event)
    if not startedClean then
      if countdownMessage ~= composer.localized.get("Go") and 5 < countdownMessage then
        return
      end
      createCountdownImage(countdownMessage)
      fadecountdownImage()
      if countdownMessage == composer.localized.get("Go") then
        countdownCompleted()
        timer.cancel(event.source)
      else
        playSound("countdown")
        countdownMessage = countdownMessage - 1
        if countdownMessage == 0 then
          countdownMessage = composer.localized.get("Go")
        end
      end
    end
  end

  function send(powerUp, jump)
    if not playerSelf then
      return
    end
    if networkGame and not startedClean and not stopSend then
      checkForDisconnect()
      if gameRunning then
        playerSelf.setCurrentGameTime(system.getTimer() - systemStartTime)
        local ps = playerSelf.getPlayerStatus()
        if jump then
          composer.tcpClient.sendJumpMessage(ps.x, ps.y, ps.vX, ps.vY)
        elseif powerUp then
          composer.tcpClient.sendPowerUpMessage(powerUp.t, powerUp.x, powerUp.y, 0, 0, 0)
        else
          composer.tcpClient.sendCorrigateMessage(ps.x, ps.y, ps.vX, ps.vY)
        end
      end
    end
  end

  local function sendClosure(event)
    return send(nil, nil)
  end

  local function btnJumpPress(self, event)
    if event.phase == "began" and gameRunning then
      if composer.onboarding.isActive == true then
        composer.onboarding.jumpButtonPressed()
      end
      local tutorialJump = false
      if playerSelf.canJump() or tutorialJump then
        send(false, true)
        playerSelf.jump()
        timer.performWithDelay(10, sendClosure, 1)
      end
      return true
    end
  end

  local function trimNumber(number)
    number = number * 100
    number = math.floor(number)
    number = number * 0.01
    return number
  end

  local function powerUpDelay(powerUpId)
    local xPos, yPos = powerUps.usePowerUp(powerUpId, playerSelf.id, myPlayerId, playerSelf, 0, 0, cameraGroup,
      screenGroup, playerList)
    local trimmedX = trimNumber(xPos)
    local trimmedY = trimNumber(yPos)
    local list = {
      t = powerUpId,
      x = trimmedX,
      y = trimmedY
    }
    send(list)
  end

  function btnPowerUpPress(self, event)
    if event.phase == "began" and gameRunning then
      local tutorialPU = false
      if composer.onboarding.isActive == true then
        composer.onboarding.startPhysics()
      end
      local powerUpId = playerSelf.getPowerUp()
      if 0 < powerUpId and powerUpImageReady or tutorialPU then
        playerSelf.usedPowerUp()
        local xPos, yPos = powerUps.usePowerUp(powerUpId, playerSelf.id, myPlayerId, playerSelf, 0, 0, cameraGroup,
          screenGroup, playerList)
        local list = {
          t = powerUpId,
          x = xPos,
          y = yPos
        }
        send(list)
        if 50 < powerUpId then
          local function myclosure(event)
            return powerUpDelay(powerUpId - 50)
          end

          timer.performWithDelay(200, myclosure, 1)
        end
        removePowerUpImage()
      elseif not playerSelf.isDead() then
        powerUpButtonFX.alpha = 1
        powerUpButtonFX:setSequence("click")
        powerUpButtonFX:play()
        timer.performWithDelay(300, hidePowerUpButtonFX)
        composer.audio.play("no_powerup")
      end
      return true
    end
  end

  local function homeButtonPress(self, event)
    if event.phase == "began" then
      showQuitAlert()
    end
  end

  local function checkIfAllPlayersStarted()
    local numberThatDisconnected = 0
    for i = 1, #playerList do
      if playerList[i].connected == false and not playerList[i].mobileUser then
        playerList[i].setPlayerGoalTime(-2)
        playerList[i].setDisconnected()
        numberThatDisconnected = numberThatDisconnected + 1
      end
    end
  end

  local function stopTimers()
    if playerTimer then
      timer.cancel(playerTimer)
      playerTimer = nil
    end
    if botFinishTimer then
      timer.cancel(botFinishTimer)
      botFinishTimer = nil
    end
    if startTimer then
      timer.cancel(startTimer)
      startTimer = nil
    end
    if puImageShufflerTimer then
      timer.cancel(puImageShufflerTimer)
      puImageShufflerTimer = nil
    end
    if playerStartedTimer then
      timer.cancel(playerStartedTimer)
      playerStartedTimer = nil
    end
    if networkGame then
      if sendTimer then
        timer.cancel(sendTimer)
        sendTimer = nil
      end
    elseif localCountdownTimer then
      timer.cancel(localCountdownTimer)
      localCountdownTimer = nil
    end
    if antiStuckTimer then
      timer.cancel(antiStuckTimer)
      antiStuckTimer = nil
    end
    if changeSceneTimer then
      timer.cancel(changeSceneTimer)
      changeSceneTimer = nil
    end
    if shineTimer then
      timer.cancel(shineTimer)
      shineTimer = nil
    end
    if botStuckTimer then
      timer.cancel(botStuckTimer)
      botStuckTimer = nil
    end
  end

  local function removeAlerts()
    if disconnectAlert then
      native.cancelAlert(disconnectAlert)
      disconnectAlert = nil
    end
    if quitAlert then
      native.cancelAlert(quitAlert)
      quitAlert = nil
    end
  end

  local function activateBackbutton(event)
    if not composer.onboarding.isActive == true then
      canPressButton = true
    end
  end

  local function showPUButton()
    powerupButtonImage.alpha = 1
  end

  local function showJumpButton()
    jumpButton.alpha = 1
    jumpButtonImage.alpha = 1
  end

  local function addListeners()
    if composer.getSceneName("current") == "lua.scenes.gamePlay" then
      jumpButton.touch = btnJumpPress
      powerUpButton.touch = btnPowerUpPress
      homeButton.touch = homeButtonPress
      powerUpButton:addEventListener("touch", powerUpButton)
      jumpButton:addEventListener("touch", jumpButton)
      homeButton:addEventListener("touch", homeButton)
      activateBackbutton()
    end
  end

  local function updateLayers()
    if UIgroup and homeButton then UIgroup:insert(homeButton) end
    if UIgroup and positionNumber then UIgroup:insert(positionNumber) end
    if UIgroup and killMessagesGroup then UIgroup:insert(killMessagesGroup) end
    if jumpButtonGroup and jumpButton then jumpButtonGroup:insert(jumpButton) end
    if jumpButtonGroup and jumpButtonImage then jumpButtonGroup:insert(jumpButtonImage) end
    if powerUpButtonGroup and powerupButtonImage then powerUpButtonGroup:insert(powerupButtonImage) end
    if powerUpButtonGroup and powerUpButtonFX then powerUpButtonGroup:insert(powerUpButtonFX) end
    if powerUpButtonGroup and powerUpImage then powerUpButtonGroup:insert(powerUpImage) end
    if powerUpButtonGroup and shineEffect then powerUpButtonGroup:insert(shineEffect) end
    if screenGroup and UIgroup then screenGroup:insert(UIgroup) end
  end

  local function updateDisplayGroup()
    if startedClean then
      return
    end
    for i = 1, #playerList do
      if playerList[i] then
        cameraGroup:insert(playerList[i].getBodyPartsGroup())
      end
    end
    for i = 1, #playerList do
      if playerList[i] then
        cameraGroup:insert(playerList[i])
      end
    end
  end

  local function hideUI()
    if UIgroup then
      UIgroup.isVisible = false
      UIgroup.isHitTestable = true
    end
  end

  local function androidButtonListener(event)
    if backButtonPushed == true then
      backButtonPushed = false
      showQuitAlert()
    end
  end

  local function androidKeyEvent(event)
    local phase = event.phase
    local keyName = event.keyName
    if phase == "down" and not event.isRepeat then
      if keyName == "space" or keyName == "spacebar" then
        btnJumpPress(nil, { phase = "began" })
        return true
      elseif keyName == "x" then
        btnPowerUpPress(nil, { phase = "began" })
        return true
      end
    end
    if phase == "up" and keyName == "back" then
      if canPressButton then
        backButtonPushed = true
      end
      return true
    end
    return false
  end

  -- Rotating between the two landscape orientations moves the safe area.
  local function hudResizeListener()
    if startedClean then
      return
    end
    layoutHud()
    computeBottomBar()
    layoutKillFeedGroup()
    if powerUpImage and powerupButtonImage then
      powerUpImage.x = powerupButtonImage.x - 6 * viewScale
      powerUpImage.y = powerupButtonImage.y + 1.5 * viewScale
    end
    for i = 1, #bottomBarList do
      if bottomBarList[i] then
        bottomBarList[i].y = screen.bottom
      end
    end
  end

  function cleanEnter()
    startedClean = true
    Runtime:removeEventListener("resize", hudResizeListener)
    if gameController then
      Runtime:removeEventListener("enterFrame", gameController)
      gameController = nil
    end
    if androidKeyEvent then
      Runtime:removeEventListener("key", androidKeyEvent)
      androidKeyEvent = nil
    end
    if androidButtonListener then
      Runtime:removeEventListener("enterFrame", androidButtonListener)
      androidButtonListener = nil
    end
    system.deactivate("multitouch")
    removeAlerts()
    stopTimers()
    fireworksHandler.clean()
    powerUps.clean()
    for i = 1, #playerList do
      playerList[i].clean()
    end
    playerList = nil
    mapInterface.clean()
    countdownImg = nil
    physics.stop()
    Runtime:removeEventListener("mapDone", updateDisplayGroup)
    composer.comm.playerStateUpdate(1)
    composer.debugger.clean()
    if composer.onboarding.isActive == true then
      composer.onboarding.clean()
    end
  end

  local function startNetworkCountdown()
    if not composer.data.gameInfo.timeToStartGame then
      localCountdownTimer = timer.performWithDelay(1000, localCountdown, 7)
      return
    end
    local timeToStartGame = composer.data.gameInfo.timeToStartGame - system.getTimer()
    local restTime = timeToStartGame % 1000
    local ticks = math.floor((timeToStartGame - restTime) / 1000)

    local function startLocalCountdown()
      if 0 < ticks then
        countdownMessage = ticks - 1
        localCountdownTimer = timer.performWithDelay(1000, localCountdown, ticks)
      end
    end

    if 0 < restTime then
      localCountdownTimer = timer.performWithDelay(restTime, startLocalCountdown)
    else
      startLocalCountdown()
    end
  end

  local function setUpGame()
    composer.debugger.clean()
    physics.setVelocityIterations(3)
    physics.setPositionIterations(8)
    physics.start()
    physics.setGravity(0, 20)
    composer.powerUpPositions = {}
    Runtime:addEventListener("mapDone", updateDisplayGroup)
    mapInterface.generateMap(composer.data.gameInfo.map, cameraGroup, cameraGroupForeground)
    local screenGroup = self.view
    worldGroup:insert(1, mapInterface.getDisplayGroup())
    local startXPos, startYPos = mapInterface.getStartPos()
    startViewLeft = startXPos - START_VIEW_BACK
    initPlayers(startXPos, startYPos)
    for i = 1, #playerList do
      if playerList[i].playerId == myPlayerId then
        playerSelf = playerList[i]
        playerPosition = #playerList - i + 1
        playerSelf.setUpdatePowerUpImageFunction(updatePowerUpImage)
        playerSelf.mobileUser = true
        gameController()
        mapInterface.addmapNameText(cameraGroupForeground, playerList[i].x, playerList[i].y)
      end
      playerList[i].connected = false
      playerList[i].setKillMessageFunction(createKillText)
    end
    if not playerSelf and #playerList > 0 then
      playerSelf = playerList[1]
      playerPosition = #playerList
      playerSelf.setUpdatePowerUpImageFunction(updatePowerUpImage)
      playerSelf.mobileUser = true
    end
    powerUps.init()
    powerUps.addPlaySoundFunction(playSound)
    if playerSelf then
      updatePowerUpImage(playerSelf.getPowerUp())
    end
    for i = 1, #playerList do
      bottomBarList[i] = playerList[i].getPlayerHead()
      bottomBarList[i].xScale, bottomBarList[i].yScale = viewScale, viewScale
      local length = mapInterface.getLength() - 10
      if length <= 0 then
        bottomBarList[i].x = bottomBarStartX
      else
        local progress = playerList[i].x / length
        if progress < 0 then
          progress = 0
        elseif progress > 1 then
          progress = 1
        end
        bottomBarList[i].x = progress * bottomBarLength2 + bottomBarStartX
      end
      bottomBarList[i].y = display.contentHeight
      UIgroup:insert(bottomBarList[i])
    end
    if playerSelf then
      UIgroup:insert(bottomBarList[playerSelf.id])
      updatePositionNumber(playerPosition)
    end
    if layoutHud then
      layoutHud()
    end
    playerTimer = timer.performWithDelay(100, updatePlayers, 0)
    shineTimer = timer.performWithDelay(4000, playShineEffect, 0)
    if networkGame then
      lastUpdateFormServer = system.getTimer()
      composer.tcpClient.setReceiveFunction(receiveUpdateFromNetworkGamePlay)
      sendTimer = timer.performWithDelay(500, sendClosure, 0)
      playerStartedTimer = timer.performWithDelay(18000, checkIfAllPlayersStarted, 1)
      startNetworkCountdown()
    elseif composer.onboarding.isActive == true and composer.onboarding.overrideCountdown() then
      if composer.onboarding.manualStart() then
        composer.onboarding.setManualStart(countdownCompleted)
      else
        localCountdownTimer = timer.performWithDelay(2000, countdownCompleted, 1)
      end
    else
      localCountdownTimer = timer.performWithDelay(1000, localCountdown, 7)
    end
    updateLayers()
    Runtime:addEventListener("enterFrame", gameController)
    startTimer = timer.performWithDelay(500, addListeners, 1)
    composer.comm.playerStateUpdate(2)
    if isSimulator and composer.config.bot then
      botStuckTimer = timer.performWithDelay(100000, goToNextScene)
    end
    if composer.config.hideUI then
      hideUI()
    end
    Runtime:addEventListener("key", androidKeyEvent)
    Runtime:addEventListener("enterFrame", androidButtonListener)
    Runtime:addEventListener("resize", hudResizeListener)
    playSelfArrowIntro()
  end

  setUpGame()
  if composer.onboarding.isActive == true then
    composer.onboarding.addGuiReference("killMessages", killMessagesGroup)
    composer.onboarding.addGuiReference("countdown", countdownImg)
    for i = 1, #playerList do
      composer.onboarding.addGuiReference("bottomBar", bottomBarList[i])
    end
    composer.onboarding.onSetupGameComplete(playerList, cameraGroup, screenGroup, physics, cameraGroupForeground)
    composer.onboarding.setGameCleanFunction(cleanEnter)
  end
end

function scene:hide(event)
  local phase = event.phase
  if phase == "did" then
    return
  end
  if cleanEnter then
    cleanEnter()
    cleanEnter = nil
  end
end

function scene:destroy(event)
  if clean then
    clean()
    clean = nil
  end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
