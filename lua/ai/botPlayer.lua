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

function M.createBots()
  local bots = {}

  for i = 1, 3 do
    local bot = {}
    local nameIndex = math.random(1, #M.botNames)
    bot.username = M.botNames[nameIndex]
    local avatarId = M.botAvatars[i] or 1

    bot.playerId = 100 + i
    bot.avatar = { 100 + avatarId, 0, 0, 0, 0, 0, 0 }
    bot.isBot = true
    bot.speedMultiplier = 1
    bot.powerupChance = 1

    table.insert(bots, bot)
  end

  return bots
end

function M.shouldUsePowerup(bot, playerPosition, enemyNearby)
  return enemyNearby or bot.powerupChance == 1
end

function M.updateBotMovement(bot, deltaTime)
  local baseSpeed = 200
  return baseSpeed * bot.speedMultiplier
end

function M.getReactionDelay(bot)
  return 0
end

function M.getBotInfo(bot)
  return {
    name = bot.username,
    speed = bot.speedMultiplier
  }
end

return M
