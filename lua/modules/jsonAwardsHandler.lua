local M = {}
local configInput
local jsonParser = require("lua.modules.jsonParser")

function M.readFromFile()
  configInput = jsonParser.getJsonFromFile("config/awards.json")
end

function M.isFileCorrupt()
  if configInput == nil then
    return true
  end
  if not configInput.dailyChallenges or not configInput.achievements then
    return true
  end
  return false
end

local function reloadConfigIfNil()
  if M.isFileCorrupt() then
    print("WARNING: Reloading AwardsConfig File.")
    M.readFromFile()
  end
end

function M.getVersion()
  reloadConfigIfNil()
  return configInput.version
end

function M.getAwardText(awardId)
  reloadConfigIfNil()
  local text = ""
  for key, value in pairs(configInput.awards) do
    if tonumber(key) == awardId then
      text = value.text
      return text
    end
  end
  return text
end

function M.getDailyChallengeImage(id)
  reloadConfigIfNil()
  local image = "1"
  for key, value in pairs(configInput.dailyChallenges.challenges) do
    if tonumber(key) == tonumber(id) then
      if value.image then
        return value.image
      else
        return "1"
      end
    end
  end
  print("WARNING: coud not find image for daily challenge ", id)
  return image
end

function M.getDailyChallengeName(id)
  reloadConfigIfNil()
  for i, value in pairs(configInput.dailyChallenges.challenges) do
    if tonumber(i) == tonumber(id) then
      return value.title
    end
  end
  return "Cound not find name E:2"
end

function M.getDailyChallenge(id)
  reloadConfigIfNil()
  for i, value in pairs(configInput.dailyChallenges.challenges) do
    if tonumber(i) == tonumber(id) then
      return value
    end
  end
  return nil
end

local function getNumberOfStages(id)
  reloadConfigIfNil()
  for i, value in pairs(configInput.achievements) do
    if tonumber(i) == tonumber(id) then
      return #value.steps
    end
  end
  return 1
end

function M.getEarnCoins()
  reloadConfigIfNil()
  local earnCoins = {}
  if configInput.earnCoins then
    for i, value in pairs(configInput.earnCoins) do
      if value.hidden then
      else
        local index = #earnCoins + 1
        earnCoins[index] = value
        earnCoins[index].id = tonumber(i)
      end
    end
  end
  return earnCoins
end

function M.getAchievements()
  reloadConfigIfNil()
  local achievements = {}
  for i, value in pairs(configInput.achievements) do
    if value.hidden then
    else
      local index = #achievements + 1
      achievements[index] = value
      achievements[index].id = tonumber(i)
      achievements[index].maxStage = getNumberOfStages(i)
    end
  end
  return achievements
end

function M.getAchievementName(id, stage)
  reloadConfigIfNil()
  for i, value in pairs(configInput.achievements) do
    if tonumber(i) == tonumber(id) and value.title then
      return value.title
    end
  end
  print("WARNING: getAchievementName id", id)
  print("WARNING: getAchievementName stage", stage)
  return "Cound not find name E:1"
end

function M.getAchievementImage(id)
  reloadConfigIfNil()
  for i, value in pairs(configInput.achievements) do
    if tonumber(i) == tonumber(id) and value.image then
      return value.image
    end
  end
  print("WARNING: failed getAchievementImage id", id)
  return "1"
end

function M.isAchievementForStage(id, stage)
  reloadConfigIfNil()
  for i, value in pairs(configInput.achievements) do
    if tonumber(i) == tonumber(id) and value.steps[stage] then
      return true
    end
  end
  return false
end

return M
