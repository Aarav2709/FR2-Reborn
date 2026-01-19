local M = {}
local spine = require("spine-corona.spine")
local composer = require("composer")
local showLoadingTime, basicMonsterList, fullMonsterList, monsterList, numberOfMonsters

local function addSpineDataToList(jsonObject)
  local skeletonData, hasMonster
  hasMonster, skeletonData = pcall(function()
    return jsonObject:readSkeletonDataFile("animations/monsters/monsters.json")
  end)
  if hasMonster then
    fullMonsterList = {}
    fullMonsterList.skeletonData = skeletonData
    fullMonsterList.animationStateData = spine.AnimationStateData.new(skeletonData)
    fullMonsterList.animationStateData.defaultMix = 0
    composer.debugPrint("spine", "added monster to table")
  else
    print("ERROR: NO MONSTER WITH THAT ID: ", skeletonData)
  end
end

function M.loadBasicSpine()
  local timeToLoad = system.getTimer()
  local jsonObject = spine.SkeletonJson.new()
  addSpineDataToList(jsonObject)
  composer.debugPrint("loadingTime", "SPINE basic timeToLoad  " .. system.getTimer() - timeToLoad)
end

function M.newMonster()
  local spineLoader = {}
  local skeletonData, animationData, skeleton, animator
  if fullMonsterList == nil then
    M.loadBasicSpine()
  end
  
  local function addMixToRunAnimations(mixType, otherAnimation, mix)
    if mixType == 1 then
      animationData:setMix("run", otherAnimation, mix)
      animationData:setMix("run2", otherAnimation, mix)
      animationData:setMix("run2", otherAnimation, mix)
    else
      animationData:setMix(otherAnimation, "run", mix)
      animationData:setMix(otherAnimation, "run2", mix)
      animationData:setMix(otherAnimation, "run3", mix)
    end
  end
  
  local function setMixToAnimations()
    -- FIXED: Optimized animation mixing for smoother transitions
    -- Run animations
    addMixToRunAnimations(1, "jump_start", 0.05)  -- Faster jump start
    addMixToRunAnimations(1, "slide", 0.1)        -- Faster slide
    addMixToRunAnimations(1, "idle", 0.15)
    addMixToRunAnimations(1, "idle_var1", 0.15)
    addMixToRunAnimations(1, "idle_var2", 0.15)
    addMixToRunAnimations(1, "happy", 0.15)
    addMixToRunAnimations(1, "sad", 0.15)
    addMixToRunAnimations(1, "jump_fall", 0.05)
    
    -- Run board animations
    animationData:setMix("run_board", "jump_start", 0.05)
    animationData:setMix("run_board", "slide", 0.1)
    animationData:setMix("run_board", "idle", 0.15)
    animationData:setMix("run_board", "idle_var1", 0.15)
    animationData:setMix("run_board", "idle_var2", 0.15)
    animationData:setMix("run_board", "happy", 0.15)
    animationData:setMix("run_board", "sad", 0.15)
    animationData:setMix("run_board", "jump_fall", 0.05)
    
    -- Jump transitions - smoother
    animationData:setMix("jump_start", "jump_fall", 0.1)
    addMixToRunAnimations(2, "jump_start", 0.1)
    animationData:setMix("jump_start", "run_board", 0.1)
    addMixToRunAnimations(2, "jump_fall", 0.05)
    animationData:setMix("jump_fall", "run_board", 0.05)
    
    -- Idle transitions
    animationData:setMix("slide", "idle", 0.15)
    animationData:setMix("slide", "idle_var1", 0.15)
    animationData:setMix("slide", "idle_var2", 0.15)
    animationData:setMix("idle", "happy", 0.15)
    addMixToRunAnimations(2, "idle", 0.15)
    animationData:setMix("idle", "run_board", 0.15)
    animationData:setMix("idle", "jump_start", 0.1)
    animationData:setMix("idle", "sad", 0.15)
    
    animationData:setMix("idle_var1", "happy", 0.15)
    addMixToRunAnimations(2, "idle_var1", 0.15)
    animationData:setMix("idle_var1", "run_board", 0.15)
    animationData:setMix("idle_var1", "jump_start", 0.1)
    animationData:setMix("idle_var1", "sad", 0.15)
    animationData:setMix("idle_var1", "idle", 0.1)
    
    animationData:setMix("idle_var2", "happy", 0.15)
    addMixToRunAnimations(2, "idle_var2", 0.15)
    animationData:setMix("idle_var2", "run_board", 0.15)
    animationData:setMix("idle_var2", "jump_start", 0.1)
    animationData:setMix("idle_var2", "sad", 0.15)
    animationData:setMix("idle_var2", "idle", 0.1)
    
    -- Emotion transitions
    animationData:setMix("sad", "happy", 0.15)
    animationData:setMix("sad", "idle_var1", 0.15)
    animationData:setMix("sad", "idle_var2", 0.15)
    animationData:setMix("sad", "idle", 0.15)
    addMixToRunAnimations(2, "sad", 0.15)
    animationData:setMix("sad", "run_board", 0.15)
    
    animationData:setMix("happy", "sad", 0.15)
    animationData:setMix("happy", "idle", 0.15)
    animationData:setMix("happy", "idle_var1", 0.15)
    animationData:setMix("happy", "idle_var2", 0.15)
    addMixToRunAnimations(2, "happy", 0.15)
    animationData:setMix("happy", "run_board", 0.15)
  end
  
  local function setup()
    skeletonData = fullMonsterList.skeletonData
    animationData = fullMonsterList.animationStateData
    setMixToAnimations()
    skeleton = spine.Skeleton.new(skeletonData)
    animator = spine.AnimationState.new(animationData)
    skeleton:setToSetupPose()
    skeleton.debug = false
  end
  
  local function getSkeleton()
    return skeleton
  end
  
  local function getSkeletonData()
    return skeletonData
  end
  
  local function getAnimationState()
    return animator
  end
  
  setup()
  spineLoader.getSkeletonData = getSkeletonData
  spineLoader.getSkeleton = getSkeleton
  spineLoader.getAnimationState = getAnimationState
  return spineLoader
end

function M.init()
  showLoadingTime = true
  numberOfMonsters = composer.config.numberOfMonsters
end

function M.createMonster(i, data)
end

return M
