-- Bot AI system
-- AI opponents for offline practice mode

local M = {}

-- Bot names
M.botNames = {
  "SpeedyFox",
  "RacerBear",
  "FastPanda",
  "QuickWolf",
  "RushCat",
  "BoltRabbit",
  "DashDog",
  "SwiftLion",
  "FlashTiger",
  "ZoomMonkey"
}

-- Bot avatar IDs (Fun Run 2 characters)
-- Expected format: c1, c2, c3, ... c10
M.botAvatars = {
  1, -- Character 1 (c1s0)
  2, -- Character 2 (c2s0)
  3  -- Character 3 (c3s0)
}

-- Bot colors (skin IDs)
-- Only default skins (0 = default)
M.botSkins = {
  0, -- Default skin (safest)
  0,
  0
}

-- Create 3 bot players
function M.createBots(difficulty)
  local bots = {}
  local speedMultiplier = 1.0

  -- Adjust speed by difficulty
  if difficulty == 1 then
    speedMultiplier = 0.7 -- Easy
  elseif difficulty == 2 then
    speedMultiplier = 1.0 -- Medium
  elseif difficulty == 3 then
    speedMultiplier = 1.3 -- Hard
  end

  -- Create 3 bots
  for i = 1, 3 do
    local bot = {}

    -- Pick a random name
    local nameIndex = math.random(1, #M.botNames)
    bot.username = M.botNames[nameIndex]

    -- Use a fixed avatar to avoid mixing
    -- Different character per bot with the same default skin
    local avatarId = M.botAvatars[i] or 101 -- Avatar by index (1=101, 2=104, 3=105)

    bot.avatar = {
      avatarId, -- Avatar ID (101, 104, or 105)
      0,        -- Skin ID = 0 (default)
      0,        -- hat
      0,        -- face
      0,        -- neck
      0,        -- item
      0         -- boots
    }

    -- Bot ID
    bot.playerId = "BOT_" .. i
    bot.isBot = true
    bot.difficulty = difficulty
    bot.speedMultiplier = speedMultiplier

    -- Bot behavior parameters
    bot.jumpChance = 0.8    -- 80% chance to jump over an obstacle
    bot.powerupChance = 0.6 -- 60% chance to use a powerup
    bot.reactionTime = 0.3  -- 0.3s reaction time

    -- Difficulty-based adjustments
    if difficulty == 1 then -- Easy
      bot.jumpChance = 0.6
      bot.powerupChance = 0.4
      bot.reactionTime = 0.5
    elseif difficulty == 3 then -- Hard
      bot.jumpChance = 0.95
      bot.powerupChance = 0.85
      bot.reactionTime = 0.1
    end

    bots[i] = bot
  end

  return bots
end

-- Bot jump decision
function M.shouldBotJump(bot, obstacleDistance)
  -- Jump if an obstacle is close and the random chance hits
  if obstacleDistance < 100 and math.random() < bot.jumpChance then
    return true
  end
  return false
end

-- Bot powerup decision
function M.shouldBotUsePowerup(bot, hasPowerup, enemyNearby)
  if not hasPowerup then
    return false
  end

  -- Use if an enemy is nearby or by random chance
  if enemyNearby or math.random() < bot.powerupChance then
    return true
  end

  return false
end

-- Bot movement update
function M.updateBotMovement(bot, deltaTime)
  -- Bots always move forward
  -- Speed multiplier is set by difficulty
  local baseSpeed = 200 -- Base speed
  local botSpeed = baseSpeed * bot.speedMultiplier

  return botSpeed
end

-- Random delay for more natural behavior
function M.getReactionDelay(bot)
  local delay = bot.reactionTime
  -- Add random variation
  delay = delay + (math.random() * 0.2 - 0.1)
  return math.max(0, delay)
end

-- Debug info
function M.getBotInfo(bot)
  return {
    name = bot.username,
    difficulty = bot.difficulty,
    speed = bot.speedMultiplier,
    jumpChance = bot.jumpChance,
    powerupChance = bot.powerupChance
  }
end

return M
