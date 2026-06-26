local M = {}

local function scaledChance(chance)
  if chance == nil then
    return nil
  end
  return chance * 10
end

function M.buildChanceState(input)
  local state = {
    vungle = scaledChance(input.vungle),
    admob = scaledChance(input.admob),
    chartboost = scaledChance(input.chartboost),
    nativeX = scaledChance(input.nativeX),
    adrally = scaledChance(input.adrally),
    total = 0
  }

  for _, key in ipairs({"vungle", "admob", "chartboost", "nativeX", "adrally"}) do
    if state[key] then
      state.total = state.total + state[key]
    end
  end

  return state
end

function M.appendReadyVideo(readyVideos, module, chance, isReady)
  if module and chance and 0 < chance and isReady(module) then
    readyVideos[#readyVideos + 1] = {
      chance = chance,
      ad = module
    }
    return true
  end

  return false
end

function M.selectReadyVideo(readyVideos, randomNumber)
  local counter = 0

  for i = 1, #readyVideos do
    if randomNumber < readyVideos[i].chance + counter then
      return readyVideos[i], i
    end
    counter = counter + readyVideos[i].chance
  end

  return nil
end

return M
