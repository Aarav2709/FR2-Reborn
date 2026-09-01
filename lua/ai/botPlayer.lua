local composer = require("composer")

local M = {}

-- Bot names (Fun Run style)
M.botNames = {
  "Speedy",
  "Bouncer",
  "Dash",
  "Flash",
  "Runner",
  "Chaser",
  "Jumper",
  "Swift",
  "Turbo",
  "Blitz"
}

-- Bot avatar IDs (Fun Run 2 characters)
M.botAvatars = {
  1, -- Character 1
  2, -- Character 2
  3  -- Character 3
}

-- Bot colors
M.botSkins = {
  0,
  0,
  0
}

-- Create 3 bot players with exact same speed as player
function M.createBots(difficulty)
  local bots = {}
  local speedMultiplier = 1.0 -- 100% exact player speed

  for i = 1, 3 do
    local bot = {}
    local nameIndex = math.random(1, #M.botNames)
    bot.username = M.botNames[nameIndex]
    local avatarId = M.botAvatars[i] or 1

    bot.playerId = 100 + i
    bot.avatar = {
      character = avatarId,
      skin = 0,
      hat = 0,
      facewear = 0,
      neck = 0,
      boots = 0,
      item = 0
    }
    bot.isBot = true
    bot.difficulty = difficulty or 2
    bot.speedMultiplier = speedMultiplier
    bot.reactionTime = 0.2
    bot.powerupChance = 0.3

    table.insert(bots, bot)
  end

  return bots
end

function M.shouldUsePowerup(bot, playerPosition, enemyNearby)
  if enemyNearby or math.random() < bot.powerupChance then
    return true
  end
  return false
end

function M.updateBotMovement(bot, deltaTime)
  local baseSpeed = 200
  return baseSpeed * bot.speedMultiplier
end

function M.getReactionDelay(bot)
  local delay = bot.reactionTime + (math.random() * 0.2 - 0.1)
  return math.max(0, delay)
end

function M.getBotInfo(bot)
  return {
    name = bot.username,
    difficulty = bot.difficulty,
    speed = bot.speedMultiplier
  }
end

return M
