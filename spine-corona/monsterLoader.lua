local M = {}
local spineInterface = require("spine-corona.interface")
local composer = require("composer")

local function new(monsterData, networkFormat)
  local monster = {}
  local monsterData = monsterData
  local skeletonData, spineLoader, skeleton, animationHandler, monsterGroup, lastUpdateTime, animationSpeedFactor, runAnimation
  local startedClean = false
  local loadMonsterToMemory, runningType, effectImageSheet, effectImageSheetInfo, effectsSequence, effectImageSheetSpeed, effectImageSheetSpeedInfo, effectsSpeedSequence, id, skin, hat, facewear, neck, item, boots, path, memoryIndex, imageSheet, imageSheetInfo, characterSequence
  local rocketPowerupId, sacrificePowerupId, magnetPowerupId, markPowerupId, speedPowerupId = 1401, 1601, 1701, 1801, 1901
  local blinkIndex = 0
  local blinkState = 1
  local paused = false

  local function setPowerupAnimationIds(powerupSet)
    rocketPowerupId, sacrificePowerupId, magnetPowerupId, markPowerupId, speedPowerupId = 1401, 1601, 1701, 1801, 1901
    if type(powerupSet) ~= "table" then
      return
    end
    for i = 1, #powerupSet do
      local itemId = tonumber(powerupSet[i])
      if itemId and composer.storeConfig.canDrawItem(itemId) then
        local category = composer.storeConfig.getItemCategory(itemId)
        if category == "rocket" then
          rocketPowerupId = itemId
        elseif category == "balloon" then
          sacrificePowerupId = itemId
        elseif category == "magnet" then
          magnetPowerupId = itemId
        elseif category == "gun" then
          markPowerupId = itemId
        elseif category == "speed" then
          speedPowerupId = itemId
        end
      end
    end
  end

  local function splitFirstSegment(value)
    if not value then
      return nil, nil
    end
    local firstStart, firstEnd = string.find(value, "[%w_]+/")
    if firstStart and firstStart == 1 then
      local prefix = string.sub(value, firstStart, firstEnd - 1)
      local rest = string.sub(value, firstEnd + 1)
      return prefix, rest
    end
    return nil, value
  end

  local function isCustomMonsterImage(attachment)
    local firstSegment, rest = splitFirstSegment(attachment)
    if firstSegment == path then
      if rest and string.find(rest, "powerups/") == 1 then
        return "powerups", string.sub(rest, 10)
      end
      return nil, rest
    end
    if firstSegment == "powerups" then
      return "powerups", rest
    end
    if firstSegment == "neck" then
      return "neck", rest
    end
    if string.find(attachment, "powerups/") == 1 then
      return "powerups", string.sub(attachment, 10)
    end
    return false
  end

  local function setRunAnimation(board)
    if board then
      runAnimation = "run_board"
    elseif runningType == 1 then
      runAnimation = "run"
    elseif runningType == 2 then
      runAnimation = "run2"
    elseif runningType == 3 then
      runAnimation = "run3"
    end
  end

  local function splitPathSegments(pathValue)
    local segments = {}
    if not pathValue then
      return segments
    end
    for part in string.gmatch(pathValue, "[^/]+") do
      segments[#segments + 1] = part
    end
    return segments
  end

  local function splitPrefixAndFrame(pathValue)
    if not pathValue then
      return nil, nil
    end
    local i, j = string.find(pathValue, "[%w_]+/")
    if not i or not j then
      return pathValue, nil
    end
    local prefix = string.sub(pathValue, i, j - 1)
    local rest = string.sub(pathValue, j + 1)
    return prefix, rest
  end

  local function getPowerupFrameCandidates(restOfPath)
    local candidates = {}
    if not restOfPath then
      return candidates
    end

    local function pushCandidate(value)
      if value and value ~= "" then
        for i = 1, #candidates do
          if candidates[i] == value then
            return
          end
        end
        candidates[#candidates + 1] = value
      end
    end

    pushCandidate(restOfPath)

    local segments = splitPathSegments(restOfPath)
    local count = #segments
    if count >= 2 then
      pushCandidate(table.concat(segments, "/", 2, count))
      pushCandidate(segments[count])
      pushCandidate(segments[1] .. "/" .. segments[count])
    end
    if count >= 3 then
      pushCandidate(segments[count - 1] .. "/" .. segments[count])
      pushCandidate(segments[2] .. "/" .. segments[3])
    end

    return candidates
  end

  local function findFrameInSheet(sheetInfo, candidates)
    if not sheetInfo or not candidates then
      return nil
    end
    for i = 1, #candidates do
      local frameIndex = sheetInfo:getFrameIndex(candidates[i])
      if frameIndex then
        return frameIndex
      end
    end
    return nil
  end

  local function resolvePowerupFrame(sheetInfo, restOfPath, frameKey)
    if not sheetInfo then
      return nil
    end

    local candidates = {}
    local function addCandidate(value)
      if value and value ~= "" then
        for i = 1, #candidates do
          if candidates[i] == value then
            return
          end
        end
        candidates[#candidates + 1] = value
      end
    end

    addCandidate(frameKey)
    addCandidate(restOfPath)

    local fromRest = getPowerupFrameCandidates(restOfPath)
    for i = 1, #fromRest do
      addCandidate(fromRest[i])
    end

    local fromFrame = getPowerupFrameCandidates(frameKey)
    for i = 1, #fromFrame do
      addCandidate(fromFrame[i])
    end

    return findFrameInSheet(sheetInfo, candidates)
  end

  local function overrideSkeletonFunctions()
    function skeleton:createImage(attachment)
      composer.debugger.profile("CreateImage")

      local attachmentName = attachment.name or attachment.path
      local prepath, restOfPath = isCustomMonsterImage(attachmentName)

      -- Determine if this is a character body part (starts with cXsY/)
      local isCharacterPart = (restOfPath ~= nil and prepath ~= "powerups")

      -- If isCustomMonsterImage failed but it looks like a character path, try regex
      if not restOfPath and attachmentName:match("^c%d+s%d+/") then
        restOfPath = attachmentName:gsub("^c%d+s%d+/", "")
        isCharacterPart = true
      end

      local image

      -- Case 1: Character body part - use character imagesheet
      if isCharacterPart and imageSheetInfo and restOfPath then
        local imagePath = imageSheetInfo:getFrameIndex(restOfPath)

        if imagePath then
          image = display.newSprite(imageSheet, characterSequence)
          image:setFrame(imagePath)
          image.anchorX = 0.5
          image.anchorY = 0.5
        else
          -- Frame not found in character sheet - log details for debugging
          print("WARNING: Frame '" .. restOfPath .. "' not found in character sheet for " .. (path or "N/A"))
          print("  -> Attachment: " .. tostring(attachmentName))
          print("  -> Available frames: " .. tostring(#imageSheetInfo:getSheet().frames))
                end

      elseif prepath == "powerups" and restOfPath then
        local powerupPrefix, frameKey = splitPrefixAndFrame(restOfPath)
        local imagePath

        if powerupPrefix == "speed" and effectImageSheetSpeedInfo and effectImageSheetSpeed and effectsSpeedSequence then
          imagePath = resolvePowerupFrame(effectImageSheetSpeedInfo, restOfPath, frameKey)
          if imagePath then
            image = display.newSprite(effectImageSheetSpeed, effectsSpeedSequence)
            image:setFrame(imagePath)
          end
        end

        if not image and effectImageSheetInfo and effectImageSheet and effectsSequence then
          imagePath = resolvePowerupFrame(effectImageSheetInfo, restOfPath, frameKey)
          if imagePath then
            image = display.newSprite(effectImageSheet, effectsSequence)
            image:setFrame(imagePath)
          end
        end
      end

      -- Case 3: Not in any imagesheet (accessories, hats, etc.) - load PNG directly
      if not image and prepath ~= "powerups" then
        local allowFallback = true
        local segment, _ = splitFirstSegment(attachmentName)
        if segment and string.match(segment, "^c%d+s%d+$") then
          allowFallback = false
        end
        if allowFallback then
          local pngPath = "images/monsters/" .. attachmentName .. ".png"
          image = display.newImage(pngPath)
          if not image then
            print("WARNING: Failed to load PNG: " .. pngPath)
          end
        end
      end

      composer.debugger.profile("CreateImage")
      return image
    end

    function skeleton:modifyImage(image, attachment)
      if image and image.setFrame then
        composer.debugger.profile("ModifyImage")
        local attachmentName = attachment.name or attachment.path
        local prepath, restOfPath = isCustomMonsterImage(attachmentName)

        -- If isCustomMonsterImage failed, try regex for character paths
        if not restOfPath and attachmentName:match("^c%d+s%d+/") then
          restOfPath = attachmentName:gsub("^c%d+s%d+/", "")
        end

        if prepath == "powerups" and restOfPath then
          local powerupPrefix, frameKey = splitPrefixAndFrame(restOfPath)
          local imagePath
          if powerupPrefix == "speed" and effectImageSheetSpeedInfo then
            imagePath = resolvePowerupFrame(effectImageSheetSpeedInfo, restOfPath, frameKey)
          elseif effectImageSheetInfo then
            imagePath = resolvePowerupFrame(effectImageSheetInfo, restOfPath, frameKey)
          end
          if imagePath then
            image:setFrame(imagePath)
            composer.debugger.profile("ModifyImage")
            return true
          end
        end

        if restOfPath and prepath ~= "powerups" and imageSheetInfo then
          local imagePath = imageSheetInfo:getFrameIndex(restOfPath)
          if imagePath then
            image:setFrame(imagePath)
            composer.debugger.profile("ModifyImage")
            return true
          end
        end
      end
      return false
    end
  end

  local function setIdAndSkinDefault()
    id = 1
    skin = 0
    path = "c" .. id .. "s" .. skin
    memoryIndex = path
    loadMonsterToMemory()
  end

  function loadMonsterToMemory()
    path = "c" .. id .. "s" .. skin
    memoryIndex = path

    print("=== LOADING CHARACTER: " .. path .. " (id=" .. id .. ", skin=" .. skin .. ") ===")

    local function safeLoad()
      composer.data.monsterInMemory[memoryIndex].sheetInfo = require("lua.monsters." .. path)
    end

    if not composer.data.monsterInMemory[memoryIndex] then
      composer.data.monsterInMemory[memoryIndex] = {}
      local sucess = pcall(safeLoad)
      if not sucess then
        print("ERROR: Failed to load " .. path .. " lua file! Using default c1s0")
        composer.data.monsterInMemory[memoryIndex] = nil
        setIdAndSkinDefault()
        return
      end
      print("SUCCESS: Loaded lua sheet: lua/monsters/" .. path .. ".lua")
      composer.data.monsterInMemory[memoryIndex].sheet = graphics.newImageSheet(
        "images/monsters/" .. path .. "/monster.png", composer.data.monsterInMemory[memoryIndex].sheetInfo:getSheet())
      print("SUCCESS: Loaded PNG: images/monsters/" .. path .. "/monster.png")
    else
      print("INFO: Character " .. path .. " already in memory, reusing")
    end
    imageSheetInfo = composer.data.monsterInMemory[memoryIndex].sheetInfo
    imageSheet = composer.data.monsterInMemory[memoryIndex].sheet
  end

  function monster.resetBones()
    skeleton:setBonesToSetupPose()
  end

  local function setHat()
    if hat == nil or hat == 0 then
      skeleton:setAttachment("hat", nil)
      skeleton:setAttachment("hair", "hair")
    else
      skeleton:setAttachment("hat", hat)
      skeleton:setAttachment("hair", nil)
    end
    local hatSlot = skeleton:findSlot("hat")
    if not hatSlot or not hatSlot.attachment then
      skeleton:setAttachment("hat", nil)
      skeleton:setAttachment("hair", "hair")
      if hat ~= nil and hat ~= 0 then
        print("WARNING: failed to find hat in spine, set default")
      end
    end
  end

  local function setNeck()
    if neck == nil or neck == 0 then
      skeleton:setAttachment("neck", nil)
    else
      skeleton:setAttachment("neck", neck)
    end
    local neckSlot = skeleton:findSlot("neck")
    if not neckSlot or not neckSlot.attachment then
      skeleton:setAttachment("neck", nil)
      if neck ~= nil and neck ~= 0 then
        print("WARNING: failed to find neck in spine, set default")
      end
    end
  end

  local function setEyeware()
    if facewear == nil or facewear == 0 then
      skeleton:setAttachment("facewear", nil)
    else
      skeleton:setAttachment("facewear", facewear)
    end
    local facewearSlot = skeleton:findSlot("facewear")
    if not facewearSlot or not facewearSlot.attachment then
      skeleton:setAttachment("facewear", nil)
      if facewear ~= nil and facewear ~= 0 then
        print("WARNING: failed to find facewear in spine, set default")
      end
    end
  end

  local function setSkin()
    local function setSkinSafe()
      -- Each character has its own skin, e.g. "c1s0", "c2s0"
      skeleton:setSkin(path)
      print("INFO: Skin set to '" .. path .. "'")
    end

    local sucess = pcall(setSkinSafe)
    if not sucess then
      print("ERROR: Skin '" .. path .. "' not found! Trying fallback...")
      setIdAndSkinDefault()
      pcall(function() skeleton:setSkin("c1s0") end)
    end
  end

  local function setFeet()
    if boots == nil or boots == 0 then
      skeleton:setAttachment("board", nil)
      skeleton:setAttachment("foot_l", "0")
      skeleton:setAttachment("foot_r", "0")
      setRunAnimation(false)
    elseif composer.storeConfig.isBoard(boots) then
      skeleton:setAttachment("foot_l", nil)
      skeleton:setAttachment("foot_r", nil)
      -- Boards use "shoes/XXX" attachment name format
      skeleton:setAttachment("board", "shoes/" .. boots)
      setRunAnimation(true)
    else
      -- Shoe attachments use "shoes/XXXl" and "shoes/XXXr" format
      skeleton:setAttachment("board", nil)
      skeleton:setAttachment("foot_l", "shoes/" .. boots .. "l")
      skeleton:setAttachment("foot_r", "shoes/" .. boots .. "r")
      setRunAnimation(false)
    end
    local setBasic = true
    if skeleton:findSlot("board").attachment then
      setBasic = false
    end
    if skeleton:findSlot("foot_l").attachment and skeleton:findSlot("foot_r").attachment then
      setBasic = false
    end
    if setBasic then
      skeleton:setAttachment("board", nil)
      skeleton:setAttachment("foot_l", "0")
      skeleton:setAttachment("foot_r", "0")
      setRunAnimation(false)
      print("WARNING: failed to find foot or board in spine, set default")
    end
  end

  function monster.setBandage(isOn)
    local bandageParts = {
      { slot = "bandage_arm_lower", att = "misc/bandage_arm_lower" },
      { slot = "bandage_arm_upper", att = "misc/bandage_arm_upper" },
      { slot = "bandage_head_left", att = "misc/bandage_head_left" },
      { slot = "bandage_head_right", att = "misc/bandage_head_right" },
      { slot = "bandage_torso_left", att = "misc/bandage_torso_left" },
      { slot = "bandage_torso_right", att = "misc/bandage_torso_right" },
      { slot = "bandage_torso_upper", att = "misc/bandage_torso_upper" },
      { slot = "bandage_eyes", att = "misc/bandage_eyes" }
    }
    for _, part in ipairs(bandageParts) do
      pcall(function()
        if isOn then
          skeleton:setAttachment(part.slot, part.att)
        else
          skeleton:setAttachment(part.slot, nil)
        end
      end)
    end
  end

  local function setDefaultSkin()
    setSkin()
    setHat()
    setNeck()
    setEyeware()
    setFeet()
    monster.setBandage(nil)
  end

  local function blinkEyes()
    blinkIndex = blinkIndex + 1
    local openEyesTime = math.random(4, 6)
    local closeEyesTime = math.random(110, 160)
    if blinkState == 1 and closeEyesTime < blinkIndex then
      blinkState = 0
      blinkIndex = 0
      skeleton:setAttachment("eyes", "eyes_closed")
      blinkIndex = 0
    elseif blinkState == 0 and openEyesTime < blinkIndex then
      blinkState = 1
      blinkIndex = 0
      skeleton:setAttachment("eyes", "eyes_normal")
    end
  end

  local function changeIdleAnimation()
    local changeIdleAnimation = math.random(1, 100)
    if 95 < changeIdleAnimation then
      monster.setAnimation("idle_var1", true, nil)
    elseif 90 < changeIdleAnimation then
      monster.setAnimation("idle_var2", true, nil)
    end
  end

  local function update()
    if startedClean then
      return
    end
    composer.debugger.profile("monsterUpdate")
    local currentTime = system.getTimer() / 1000
    local delta = currentTime - lastUpdateTime
    lastUpdateTime = currentTime
    local animationFactor = animationSpeedFactor
    if not paused then
      animationHandler:update(delta)
    end
    local useTrack = animationHandler:getCurrent(2)
    if useTrack and not useTrack.loop then
      if useTrack.endTime and useTrack.time >= useTrack.endTime then
        monster.cleanUseAnimationImages()
      end
    end
    if animationHandler:getCurrent(0) then
      animationHandler:getCurrent(0).timeScale = animationFactor
    end
    animationHandler:apply(skeleton)
    skeleton:updateWorldTransform()
    composer.debugger.profile("monsterUpdate")
    blinkEyes()
  end

  local function init()
    composer.debugger.debugTable("spine", "monsterData :", monsterData)
    local rawMonsterData = monsterData
    if networkFormat then
      monsterData = composer.monsterConverter.fromServerFormat(monsterData)
    end
    if monsterData == nil or type(monsterData) ~= "table" then
      monsterData = {
        1,
        0,
        0,
        0,
        0,
        0,
        0
      }
    end
    id = tonumber(monsterData[1]) or monsterData[1]
    skin = tonumber(monsterData[2])
    hat = monsterData[3]
    facewear = monsterData[4]
    neck = monsterData[5]
    item = monsterData[6]
    boots = monsterData[7]
    runningType = composer.storeConfig.getRunningType(monsterData[1])
    if type(id) ~= "number" or skin == nil then
      id = 1
      skin = 0
    else
      if skin ~= 0 and 100 < skin then
        local skinItem = composer.storeConfig.getItem(skin)
        if type(skinItem) == "table" and skinItem.skinId then
          skin = skinItem.skinId
        else
          skin = 0
        end
      end
      -- Avatar ID fix: if greater than 100, subtract 100
      -- If below 10 (1-10), keep as is
      if id > 100 then
        id = id - 100
      end
    end

    local powerupSet = nil
    if type(monsterData) == "table" and type(monsterData[8]) == "table" then
      powerupSet = monsterData[8]
    elseif type(rawMonsterData) == "table" then
      for _, value in pairs(rawMonsterData) do
        if type(value) == "table" and #value > 0 then
          powerupSet = value
          break
        end
      end
    end
    setPowerupAnimationIds(powerupSet)

    loadMonsterToMemory()
    characterSequence = {
      start = 1,
      count = #imageSheetInfo:getSheet().frames
    }
    effectImageSheetInfo = composer.characterPowerUpEffectsImageSheetInfo
    effectImageSheet = composer.characterPowerUpEffectsImageSheet
    effectImageSheetSpeedInfo = composer.characterPowerUpEffectsSpeedImageSheetInfo
    effectImageSheetSpeed = composer.characterPowerUpEffectsSpeedImageSheet
    if effectImageSheetInfo and effectImageSheet then
      effectsSequence = {
        start = 1,
        count = #effectImageSheetInfo:getSheet().frames
      }
    else
      effectsSequence = nil
    end
    if effectImageSheetSpeedInfo and effectImageSheetSpeed then
      effectsSpeedSequence = {
        start = 1,
        count = #effectImageSheetSpeedInfo:getSheet().frames
      }
    else
      effectsSpeedSequence = nil
    end
    spineLoader = spineInterface.newMonster()
    skeleton = spineLoader.getSkeleton()
    skeletonData = spineLoader.getSkeletonData()
    animationHandler = spineLoader.getAnimationState()
    overrideSkeletonFunctions()

    -- Set the skeleton to the setup pose (correct part positions)
    skeleton:setToSetupPose()
    skeleton:setSlotsToSetupPose()
    setDefaultSkin()
    skeleton:updateWorldTransform()
    monsterGroup = skeleton.group
    monsterGroup.y = 24

    -- Skeleton scale adjustments by character
    -- Default scale is 1.0, some characters need tweaks
    local scaleX = 1.0
    local scaleY = 1.0

    -- Character-specific scale adjustments
    if id == 2 then -- Character 2 (sheep) is slightly large
      scaleX = 0.95
      scaleY = 0.95
    elseif id == 3 then -- Character 3
      scaleX = 1.0
      scaleY = 1.0
    end

    monsterGroup.xScale = scaleX
    monsterGroup.yScale = scaleY

    lastUpdateTime = system.getTimer() / 1000
    animationSpeedFactor = 1
    animationHandler:addAnimationByName(0, "idle", true, nil)
    animationHandler:getCurrent(0).time = math.random(0, 150)
    Runtime:addEventListener("enterFrame", update)
  end

  function monster.updateSpeed(newFactor)
    if newFactor < 0.1 then
      newFactor = 0.1
    elseif 1 < newFactor then
      newFactor = 1
    end
    animationSpeedFactor = newFactor
  end

  local function hasCurrentAnimationCompleted()
    local track = animationHandler:getCurrent(0)
    if track then
      return track.endTime <= track.time
    end
    return true
  end

  local function isLockedAnimation()
    do return false end
    local currentAnimation = animationHandler:getCurrent(0).animation.name
    if currentAnimation == "jump_start" or currentAnimation == "rocket_start" or currentAnimation == "rocket_end" then
      return true
    elseif currentAnimation == "speed_start" or currentAnimation == "speed_active" or currentAnimation == "speed_end" then
      return true
    end
    return false
  end

  local function isAnimationPlaying(newAnimation)
    if animationHandler:getCurrent(0) and animationHandler:getCurrent(0).animation.name == newAnimation then
      return true
    end
    return false
  end

  local function getAnimationList()
    if animationHandler and animationHandler.data and animationHandler.data.skeletonData then
      return animationHandler.data.skeletonData.animations
    end
    return nil
  end

  local function animationExists(animationName)
    local animations = getAnimationList()
    if not animations or not animationName then
      return false
    end
    for _, animation in pairs(animations) do
      if animation and animation.name == animationName then
        return true
      end
    end
    return false
  end

  local function resolveAnimationName(requestedAnimation)
    if not requestedAnimation then
      return nil
    end
    if animationExists(requestedAnimation) then
      return requestedAnimation
    end
    local animations = getAnimationList()
    if not animations then
      return nil
    end
    local prefix = requestedAnimation .. "_"
    local fallbackAnimation
    for _, animation in pairs(animations) do
      local candidateName = animation and animation.name
      if candidateName and string.sub(candidateName, 1, #prefix) == prefix then
        if not fallbackAnimation or candidateName < fallbackAnimation then
          fallbackAnimation = candidateName
        end
      end
    end
    return fallbackAnimation
  end

  local function getResolvedFollowupAnimation(baseAnimation, resolvedAnimation)
    if not baseAnimation or not resolvedAnimation then
      return resolveAnimationName(baseAnimation)
    end
    local suffixPrefix = baseAnimation .. "_"
    if string.sub(resolvedAnimation, 1, #suffixPrefix) == suffixPrefix then
      local suffix = string.sub(resolvedAnimation, #suffixPrefix + 1)
      local suffixedTarget = baseAnimation .. "_" .. suffix
      if animationExists(suffixedTarget) then
        return suffixedTarget
      end
    end
    return resolveAnimationName(baseAnimation)
  end

  local function getPowerupSuffixedAnimation(animationName)
    if animationName == "mark_active" then
      return animationName .. "_" .. markPowerupId
    elseif animationName == "magnet_start" then
      return animationName .. "_" .. magnetPowerupId
    elseif animationName == "speed_start" then
      return animationName .. "_" .. speedPowerupId
    elseif animationName == "speed_active" then
      return animationName .. "_" .. speedPowerupId
    elseif animationName == "sacrifice_start" then
      return animationName .. "_" .. sacrificePowerupId
    elseif animationName == "sacrifice_active" then
      return animationName .. "_" .. sacrificePowerupId
    elseif animationName == "sacrifice_end" then
      return animationName .. "_" .. sacrificePowerupId
    elseif animationName == "rocket_start" then
      return animationName .. "_" .. rocketPowerupId
    elseif animationName == "rocket_active" then
      return animationName .. "_" .. rocketPowerupId
    elseif animationName == "rocket_end" then
      return animationName .. "_" .. rocketPowerupId
    end
    return animationName
  end

  function monster.stopAllAnimation()
    Runtime:removeEventListener("enterFrame", update)
  end

  function monster.cleanUseAnimationImages()
    if animationHandler:getCurrent(2) then
      animationHandler:clearTrack(2)
    end
    pcall(function() skeleton:setAttachment("magnet", nil) end)
    pcall(function() skeleton:setAttachment("rifle", nil) end)
    pcall(function() skeleton:setAttachment("rifleEffect", nil) end)
  end

  function monster.playUseAnimation(newAnimation)
    monster.cleanUseAnimationImages()
    if newAnimation then
      local animationToPlay = getPowerupSuffixedAnimation(newAnimation)
      if not animationExists(animationToPlay) then
        local resolvedAnimation = resolveAnimationName(newAnimation)
        animationToPlay = resolvedAnimation or newAnimation
      end
      local ok = pcall(function()
        animationHandler:setAnimationByName(2, animationToPlay, false)
      end)
      if not ok then
        print("WARNING: Use animation '" .. newAnimation .. "' not found, skipping...")
        return
      end
    end
  end

  function monster.cleanBuffAnimationImages()
    if animationHandler:getCurrent(1) then
      animationHandler:clearTrack(1)
    end
    skeleton:setAttachment("fire", nil)
    skeleton:setAttachment("fireStart", nil)
    skeleton:setAttachment("headSkull", nil)
    skeleton:setAttachment("poof", nil)
    skeleton:setAttachment("sacrificeLine", nil)
    skeleton:setAttachment("sacrificeBalloon", nil)
    skeleton:setAttachment("PU_rocket", nil)
    skeleton:setAttachment("PU_rocketFire", nil)
  end

  function monster.playBuffAnimation(newAnimation, loop)
    monster.cleanBuffAnimationImages()
    if newAnimation then
      local animationToPlay = getPowerupSuffixedAnimation(newAnimation)
      if not animationExists(animationToPlay) then
        local resolvedAnimation = resolveAnimationName(newAnimation)
        animationToPlay = resolvedAnimation or newAnimation
      end
      local ok = pcall(function()
        animationHandler:setAnimationByName(1, animationToPlay, loop)
      end)
      if not ok then
        print("WARNING: Animation '" .. newAnimation .. "' not found, skipping...")
        return
      end
      if newAnimation == "speed_start" then
        local speedActiveAnimation = getPowerupSuffixedAnimation("speed_active")
        if not animationExists(speedActiveAnimation) then
          speedActiveAnimation = getResolvedFollowupAnimation("speed_active", animationToPlay)
        end
        if speedActiveAnimation then
          animationHandler:addAnimationByName(1, speedActiveAnimation, true)
        end
      elseif newAnimation == "speed_end" then
        animationHandler:addAnimationByName(0, "run", true)
      elseif newAnimation == "sacrifice_start" then
        local sacrificeActiveAnimation = getPowerupSuffixedAnimation("sacrifice_active")
        if not animationExists(sacrificeActiveAnimation) then
          sacrificeActiveAnimation = getResolvedFollowupAnimation("sacrifice_active", animationToPlay)
        end
        if sacrificeActiveAnimation then
          animationHandler:addAnimationByName(1, sacrificeActiveAnimation, true)
        end
      elseif newAnimation == "rocket_start" then
        local rocketActiveAnimation = getPowerupSuffixedAnimation("rocket_active")
        if not animationExists(rocketActiveAnimation) then
          rocketActiveAnimation = getResolvedFollowupAnimation("rocket_active", animationToPlay)
        end
        if rocketActiveAnimation then
          animationHandler:addAnimationByName(1, rocketActiveAnimation, true)
        end
      end
    end
  end

  function monster.cleanAnimationImages()
    monster.playBuffAnimation(nil)
    monster.playUseAnimation(nil)
  end

  function monster.setAnimation(newAnimation, loop, hard)
    if newAnimation == "run" then
      newAnimation = runAnimation
    end
    if newAnimation and not isAnimationPlaying(newAnimation) then
      if hard then
        animationHandler:setAnimationByName(0, newAnimation, loop, nil)
      else
        animationHandler:addAnimationByName(0, newAnimation, loop, nil)
      end
      if newAnimation == "idle_var1" then
        animationHandler:addAnimationByName(0, "idle", true, nil)
      elseif newAnimation == "idle_var2" then
        animationHandler:addAnimationByName(0, "idle", true, nil)
      elseif newAnimation == "jump_start" then
        animationHandler:addAnimationByName(0, "jump_fall", true, nil)
      end
    end
  end

  function monster.getHead()
    local monsterHead = display.newGroup()
    local partsToRender = {
      "head",
      "eyes",
      "head_lower",
      "hair",
      "hat",
      "facewear"
    }
    for i in pairs(partsToRender) do
      local slot = skeleton:findSlot(partsToRender[i])
      local attachment
      if slot then
        attachment = slot.attachment
      end
      if attachment then
        local image = skeleton:createImage(attachment)
        if image then
          local x, y, rotation
          x = slot.bone.worldX + attachment.x * slot.bone.m00 + attachment.y * slot.bone.m01
          y = -(slot.bone.worldY + attachment.x * slot.bone.m10 + attachment.y * slot.bone.m11)
          rotation = -(slot.bone.worldRotation + attachment.rotation)
          local xScale = attachment.scaleX
          local yScale = attachment.scaleY
          image.x = x
          image.y = y
          image.xScale = xScale
          image.yScale = yScale
          image.rotation = rotation
          monsterHead:insert(image)
        end
      end
    end
    monsterHead.xScale = 0.17
    monsterHead.yScale = 0.17
    return monsterHead
  end

  function monster.getMemoryIndex()
    return memoryIndex
  end

  function monster.clean()
    if startedClean then
      return
    end
    startedClean = true
    Runtime:removeEventListener("enterFrame", update)
    monsterGroup:removeSelf()
    monsterGroup = nil
  end

  function monster.getGroup()
    return monsterGroup
  end

  function monster.setPaused(isPaused)
    paused = isPaused
  end

  init()
  return monster
end

M.new = new
return M
