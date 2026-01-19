local M = {}
local spineInterface = require("spine-corona.interface")
local composer = require("composer")

local function new(monsterData, networkFormat)
  local monster = {}
  local monsterData = monsterData
  local skeletonData, spineLoader, skeleton, animationHandler, monsterGroup, lastUpdateTime, animationSpeedFactor, runAnimation
  local startedClean = false
  local loadMonsterToMemory, runningType, effectImageSheet, effectImageSheetInfo, effectsSequence, id, skin, hat, facewear, neck, item, boots, path, memoryIndex, imageSheet, imageSheetInfo, characterSequence
  local blinkIndex = 0
  local blinkState = 1
  local paused = false
  
  local function isCustomMonsterImage(attachment)
    -- Attachment name parse et: "c1s0/misc/eyes_normal" gibi
    local i, j = string.find(attachment, path .. "/")
    
    if i == 1 then
      -- path prefix'i var, kaldır
      local restOfPath = string.sub(attachment, j + 1, string.len(attachment))
      
      -- powerups kontrolü
      local powerupCheck = string.find(restOfPath, "powerups/")
      if powerupCheck == 1 then
        return "powerups", string.sub(restOfPath, 10) -- "powerups/" kaldır
      end
      
      return nil, restOfPath
    end
    
    -- powerups direkt kontrolü
    local k, l = string.find(attachment, "powerups/")
    if k == 1 then
      return "powerups", string.sub(attachment, l + 1)
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
  
  local function overrideSkeletonFunctions()
    function skeleton:createImage(attachment)
        composer.debugger.profile("CreateImage")
        
        -- 1. ADIM: Eşleşme sorununu çözmek için ismi temizle
        -- attachment.name genelde "c1s0/head" gelir, bunu "head" yapmalıyız
        local attachmentName = attachment.name
        local prepath, restOfPath = isCustomMonsterImage(attachmentName)
        
        -- Eğer isCustomMonsterImage düzgün ayıklayamazsa manuel temizlik yapalım
        if not restOfPath then
            restOfPath = attachmentName:gsub(".*/", "") 
        end

        local image
        
        -- 2. ADIM: Sadece Region değil, Mesh tipini de kabul etmeliyiz
        -- Senin orijinal kodunda bu kontrol eksik olduğu için gövde yamuk çıkıyor
        if (attachment.type == spine.AttachmentType.region or attachment.type == spine.AttachmentType.mesh) and imageSheetInfo then
            local imagePath = imageSheetInfo:getFrameIndex(restOfPath)
            
            if not imagePath then
                print("ERROR: Frame not found! Character: " .. (path or "N/A") .. ", Looking for: " .. restOfPath)
                return nil
            end
            
            print("SUCCESS: Loading frame: " .. restOfPath .. " = frameIndex " .. imagePath)
            image = display.newSprite(imageSheet, characterSequence)
            image:setFrame(imagePath)
            
            -- 3. ADIM: Hizalama (Yamukluğu giderir)
            image.anchorX = 0.5
            image.anchorY = 0.5

        elseif prepath and prepath == "powerups" and effectImageSheetInfo then
            local imagePath = effectImageSheetInfo:getFrameIndex(restOfPath)
            if imagePath then
                image = display.newSprite(effectImageSheet, effectsSequence)
                image:setFrame(imagePath)
            end
        else
            -- Eğer ImageSheet'te yoksa direkt PNG ara
            print("INFO: Loading direct PNG: " .. attachmentName)
            local path = "images/monsters/" .. attachmentName
            image = display.newImage(path .. ".png")
        end
        
        composer.debugger.profile("CreateImage")
        return image
    end
    
    function skeleton:modifyImage(image, attachment)
        if image and image.setFrame then
            composer.debugger.profile("ModifyImage")
            local attachmentName = attachment.name
            local _, restOfPath = isCustomMonsterImage(attachmentName)
            
            if not restOfPath then restOfPath = attachmentName:gsub(".*/", "") end
            
            local imagePath = imageSheetInfo:getFrameIndex(restOfPath)
            if imagePath then
                image:setFrame(imagePath)
                composer.debugger.profile("ModifyImage")
                return true
            end
        end
        return false
    end
end
  
  local function setIdAndSkinDefault()
    id = 1
    skin = 0
    memoryIndex = tonumber(id .. skin)
    path = "c" .. id .. "s" .. skin
    loadMonsterToMemory()
  end
  
  function loadMonsterToMemory()
    memoryIndex = tonumber(id .. skin)
    path = "c" .. id .. "s" .. skin
    
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
      composer.data.monsterInMemory[memoryIndex].sheet = graphics.newImageSheet("images/monsters/" .. path .. "/monster.png", composer.data.monsterInMemory[memoryIndex].sheetInfo:getSheet())
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
    if not skeleton:findSlot("hat").attachment then
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
    if not skeleton:findSlot("neck").attachment then
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
    if not skeleton:findSlot("facewear").attachment then
      skeleton:setAttachment("facewear", nil)
      if facewear ~= nil and facewear ~= 0 then
        print("WARNING: failed to find facewear in spine, set default")
      end
    end
  end
  
  local function setSkin()
    local function setSkinSafe()
      -- Her karakterin kendi skin'i var! "c1s0", "c2s0" gibi
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
      skeleton:setAttachment("board", boots)
      setRunAnimation(true)
    else
      skeleton:setAttachment("board", nil)
      skeleton:setAttachment("foot_l", boots)
      skeleton:setAttachment("foot_r", boots)
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
    skeleton:setAttachment("bandage_arm_lower", nil)
    skeleton:setAttachment("bandage_arm_upper", nil)
    skeleton:setAttachment("bandage_head_left", nil)
    skeleton:setAttachment("bandage_head_right", nil)
    skeleton:setAttachment("bandage_torso_left", nil)
    skeleton:setAttachment("bandage_torso_right", nil)
    skeleton:setAttachment("bandage_torso_upper", nil)
    skeleton:setAttachment("bandage_eyes", nil)
    if isOn then
      skeleton:setAttachment("bandage_arm_lower", "bandage_arm_lower")
      skeleton:setAttachment("bandage_arm_upper", "bandage_arm_upper")
      skeleton:setAttachment("bandage_head_left", "bandage_head_left")
      skeleton:setAttachment("bandage_head_right", "bandage_head_right")
      skeleton:setAttachment("bandage_torso_left", "bandage_torso_left")
      skeleton:setAttachment("bandage_torso_right", "bandage_torso_right")
      skeleton:setAttachment("bandage_torso_upper", "bandage_torso_upper")
      skeleton:setAttachment("bandage_eyes", "bandage_eyes")
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
    id = monsterData[1]
    skin = tonumber(monsterData[2])
    hat = monsterData[3]
    facewear = monsterData[4]
    neck = monsterData[5]
    item = monsterData[6]
    boots = monsterData[7]
    runningType = composer.storeConfig.getRunningType(monsterData[1])
    if id == nil or skin == nil then
      id = 1
      skin = 0
    else
      if skin ~= 0 and 100 < skin then
        skin = composer.storeConfig.getItem(skin).skinId
        if skin == nil then
          skin = 0
        end
      end
      -- Avatar ID düzeltmesi: Eğer 100'den büyükse -100 yap
      -- Eğer 10'dan küçükse (1-10 arası) olduğu gibi bırak
      if id > 100 then
        id = id - 100
      end
    end
    loadMonsterToMemory()
    characterSequence = {
      start = 1,
      count = #imageSheetInfo:getSheet().frames
    }
    effectImageSheetInfo = composer.characterPowerUpEffectsImageSheetInfo
    effectImageSheet = composer.characterPowerUpEffectsImageSheet
    effectsSequence = {
      start = 1,
      count = #effectImageSheetInfo:getSheet().frames
    }
    spineLoader = spineInterface.newMonster()
    skeleton = spineLoader.getSkeleton()
    skeletonData = spineLoader.getSkeletonData()
    animationHandler = spineLoader.getAnimationState()
    overrideSkeletonFunctions()
    
    -- Skeleton'u setup pose'a ayarla (vücut parçaları doğru pozisyonda)
    skeleton:setToSetupPose()
    skeleton:setSlotsToSetupPose()
    setDefaultSkin()
    skeleton:updateWorldTransform()
    monsterGroup = skeleton.group
    monsterGroup.y = 24
    
    -- Skeleton scale düzeltmesi - karakterlere göre ayarla
    -- Varsayılan scale 1.0, bazı karakterler için ayar gerekebilir
    local scaleX = 1.0
    local scaleY = 1.0
    
    -- Karakter bazlı scale ayarları
    if id == 2 then  -- Character 2 (koyun) biraz büyük
      scaleX = 0.95
      scaleY = 0.95
    elseif id == 3 then  -- Character 3
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
  
  function monster.stopAllAnimation()
    Runtime:removeEventListener("enterFrame", update)
  end
  
  function monster.cleanUseAnimationImages()
    if animationHandler:getCurrent(2) then
      animationHandler:clearTrack(2)
    end
    skeleton:setAttachment("magnet", nil)
    skeleton:setAttachment("rifle", nil)
    skeleton:setAttachment("rifleEffect", nil)
  end
  
  function monster.playUseAnimation(newAnimation)
    monster.cleanUseAnimationImages()
    if newAnimation then
      -- Animasyon kontrolü - playUseAnimation için
      local hasAnimation = false
      if animationHandler and animationHandler.skeletonData then
        local animations = animationHandler.skeletonData:getAnimations()
        for i = 1, #animations do
          if animations[i].name == newAnimation then
            hasAnimation = true
            break
          end
        end
      end
      
      if not hasAnimation then
        print("WARNING: Use animation '" .. newAnimation .. "' not found, skipping...")
        return
      end
      
      animationHandler:setAnimationByName(2, newAnimation, false)
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
      -- Animasyon kontrolü - eğer animasyon yoksa devam etme
      local hasAnimation = false
      if animationHandler and animationHandler.skeletonData then
        local animations = animationHandler.skeletonData:getAnimations()
        for i = 1, #animations do
          if animations[i].name == newAnimation then
            hasAnimation = true
            break
          end
        end
      end
      
      if not hasAnimation then
        print("WARNING: Animation '" .. newAnimation .. "' not found, skipping...")
        return
      end
      
      animationHandler:setAnimationByName(1, newAnimation, loop)
      if newAnimation == "speed_start" then
        animationHandler:addAnimationByName(1, "speed_active", true)
      elseif newAnimation == "speed_end" then
        animationHandler:addAnimationByName(0, "run", true)
      elseif newAnimation == "sacrifice_start" then
        animationHandler:addAnimationByName(1, "sacrifice_active", true)
      elseif newAnimation == "rocket_start" then
        animationHandler:addAnimationByName(1, "rocket_active", true)
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
