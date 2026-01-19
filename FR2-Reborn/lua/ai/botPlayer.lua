-- Bot AI Sistemi
-- Offline Pratik Mod için yapay zeka rakipler

local M = {}

-- Bot isimleri
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

-- Bot avatar ID'leri (Fun Run 2'deki karakterler)
-- Doğru format: c1, c2, c3, ... c10
M.botAvatars = {
  1,  -- Character 1 (c1s0)
  2,  -- Character 2 (c2s0)
  3   -- Character 3 (c3s0)
}

-- Bot renkleri (skin ID'leri) 
-- Sadece varsayılan skin'ler (0 = default)
M.botSkins = {
  0, -- Varsayılan skin (en güvenli)
  0,
  0
}

-- 3 bot oyuncu oluştur
function M.createBots(difficulty)
  local bots = {}
  local speedMultiplier = 1.0
  
  -- Zorluk seviyesine göre hız ayarla
  if difficulty == 1 then
    speedMultiplier = 0.7 -- Kolay
  elseif difficulty == 2 then
    speedMultiplier = 1.0 -- Orta
  elseif difficulty == 3 then
    speedMultiplier = 1.3 -- Zor
  end
  
  -- 3 bot oluştur
  for i = 1, 3 do
    local bot = {}
    
    -- Random isim seç
    local nameIndex = math.random(1, #M.botNames)
    bot.username = M.botNames[nameIndex]
    
    -- SABİT avatar kullan - karışmaması için
    -- Her bot için farklı karakter ama aynı default skin
    local avatarId = M.botAvatars[i] or 101 -- İ'ye göre avatar (1=101, 2=104, 3=105)
    
    bot.avatar = {
      avatarId,  -- avatar ID (101, 104, veya 105)
      0,         -- skin ID = 0 (default/varsayılan)
      0,         -- hat
      0,         -- face
      0,         -- neck
      0,         -- item
      0          -- boots
    }
    
    -- Bot ID
    bot.playerId = "BOT_" .. i
    bot.isBot = true
    bot.difficulty = difficulty
    bot.speedMultiplier = speedMultiplier
    
    -- Bot davranış parametreleri
    bot.jumpChance = 0.8 -- %80 şans ile engelden zıpla
    bot.powerupChance = 0.6 -- %60 şans ile powerup kullan
    bot.reactionTime = 0.3 -- 0.3 saniye reaksiyon süresi
    
    -- Zorluk bazlı ayarlamalar
    if difficulty == 1 then -- Kolay
      bot.jumpChance = 0.6
      bot.powerupChance = 0.4
      bot.reactionTime = 0.5
    elseif difficulty == 3 then -- Zor
      bot.jumpChance = 0.95
      bot.powerupChance = 0.85
      bot.reactionTime = 0.1
    end
    
    bots[i] = bot
  end
  
  return bots
end

-- Bot zıplama kararı
function M.shouldBotJump(bot, obstacleDistance)
  -- Engel yakınsa ve random şans varsa zıpla
  if obstacleDistance < 100 and math.random() < bot.jumpChance then
    return true
  end
  return false
end

-- Bot powerup kullanma kararı
function M.shouldBotUsePowerup(bot, hasPowerup, enemyNearby)
  if not hasPowerup then
    return false
  end
  
  -- Düşman yakınsa veya random şansla kullan
  if enemyNearby or math.random() < bot.powerupChance then
    return true
  end
  
  return false
end

-- Bot hareket güncelleme
function M.updateBotMovement(bot, deltaTime)
  -- Bot sürekli ileri hareket eder
  -- Hız çarpanı zorluğa göre ayarlanmış
  local baseSpeed = 200 -- Temel hız
  local botSpeed = baseSpeed * bot.speedMultiplier
  
  return botSpeed
end

-- Bot için random gecikme (daha gerçekçi davranış)
function M.getReactionDelay(bot)
  local delay = bot.reactionTime
  -- Random varyasyon ekle
  delay = delay + (math.random() * 0.2 - 0.1)
  return math.max(0, delay)
end

-- Debug bilgisi
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
