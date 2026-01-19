local M = {}
local videoModule = require("lua.ads.videoModule")
local composer = require("composer")

local function init(chestActive, group, gamesPlayed)
  local C = {}
  local animations = composer.data.animations
  local idleTimer, dropTimer, chest
  if not composer.adBoostImageSheetInfo then
    composer.adBoostImageSheetInfo = require("images.gui.postgame.adCoins.adCoins")
    composer.adBoostImageSheet = graphics.newImageSheet("images/gui/postgame/adCoins/adCoins.png", composer.adBoostImageSheetInfo:getSheet())
    local dropStartIndex = composer.adBoostImageSheetInfo:getFrameIndex("chestFall1")
    local idleStartIndex = composer.adBoostImageSheetInfo:getFrameIndex("chestIdle1")
    local dropSequenceData = {
      {
        name = "drop",
        start = dropStartIndex,
        count = 8,
        time = 600,
        loopCount = 1
      },
      {
        name = "idle",
        start = idleStartIndex,
        count = 6,
        time = 350,
        loopCount = 1
      }
    }
    animations.adCoinsDrop = dropSequenceData
  end
  
  local function createChest(number)
    local path = "images/gui/postgame/adCoins/chestOpen" .. number .. ".png"
    chest = display.newImageRect(path, 102, 78)
    if chest then
      chest.x = 400
      chest.y = 216
      group:insert(chest)
      if number < 4 then
        local function touchListener(self, event)
          if event.phase == "began" then
            composer.audio.play("button_press")
            
            local remMatches = 4 - number
            local text = "You will get double coins the next " .. remMatches .. " matches"
            if remMatches == 1 then
              text = "You will get double coins the next match"
            end
            composer.createCustomOverlay(98, nil, text)
          end
        end
        
        chest.touch = touchListener
        chest:addEventListener("touch", chest)
      end
    end
  end
  
  local function disableChest()
    if chest then
      if idleTimer then
        timer.cancel(idleTimer)
        idleTimer = nil
      end
      chest:removeSelf()
      chest:removeEventListener("touch", chest)
      Runtime:removeEventListener("seenVideoAdEvent", disableChest)
      createChest(1)
      composer.adBoostPrevGame = composer.gamesPlayed
      composer.adBoostDrop = false
    end
  end
  
  local function dropChest()
    if videoModule.isVideoReady() and composer.adsTable.postGameVideo then
      chest = display.newSprite(composer.adBoostImageSheet, composer.data.animations.adCoinsDrop)
      chest.y = 156
      chest.x = 400
      chest.xScale = 0.5
      chest.yScale = 0.5
      chest.alpha = 0
      group:insert(chest)
      
      local function playIdle()
        if chest and chest.setSequence then
          chest:setSequence("idle")
          chest:play()
        end
      end
      
      local function drop()
        chest.alpha = 1
        chest:setSequence("drop")
        chest:play()
        idleTimer = timer.performWithDelay(2800, playIdle, 0)
      end
      
      local function touchListener(self, event)
        if event.phase == "began" then
          composer.audio.play("button_press")
          local options = {isModal = true}
          composer.showOverlay("lua.overlays.boostVideo", options)
        end
      end
      
      chest.touch = touchListener
      chest:addEventListener("touch", chest)
      Runtime:addEventListener("seenVideoAdEvent", disableChest)
      dropTimer = timer.performWithDelay(1500, drop)
    end
  end
  
  local function getNumberOfGamesRequired(boostRemaining)
    if boostRemaining == 3 then
      return 5 + math.random(-3, 3)
    elseif boostRemaining == 2 then
      return 25 + math.random(-10, 10)
    elseif boostRemaining == 1 then
      return 75 + math.random(-25, 25)
    else
      return 99999
    end
  end
  
  local function clean()
    if idleTimer then
      timer.cancel(idleTimer)
      idleTimer = nil
    end
    if dropTimer then
      timer.cancel(dropTimer)
      dropTimer = nil
    end
    if chest then
      chest:removeEventListener("touch", chest)
      chest = nil
    end
    Runtime:removeEventListener("seenVideoAdEvent", disableChest)
  end
  
  C.clean = clean
  local randomNum = math.random(1, 3)
  if not composer.adsTable.postGameVideo or not composer.adBoostPrevGame then
  elseif chestActive then
    createChest(4 - chestActive)
  elseif composer.adBoostsLeft > 0 then
    if not composer.adBoostDrop then
      local numberOfGamesRequired = getNumberOfGamesRequired(composer.adBoostsLeft)
      local totalNumberOfGamesRequired = composer.adBoostPrevGame + numberOfGamesRequired
      composer.adBoostDrop = gamesPlayed >= totalNumberOfGamesRequired
    else
    end
    if composer.adBoostDrop then
      dropChest()
    end
  end
  return C
end

M.init = init
return M
