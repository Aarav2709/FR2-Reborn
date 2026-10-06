-- 2 vs 2 races
local M = {}

M.PLAYER_TEAM = 1
M.RIVAL_TEAM = 2

M.OWN_COLOR = { 0.45, 0.75, 1 }
M.RIVAL_COLOR = { 1, 0.45, 0.42 }

M.REWARDS = {
  win = { coins = 45, xp = 30 },
  draw = { coins = 30, xp = 20 },
  loss = { coins = 20, xp = 15 }
}

function M.colorFor(team, myTeam)
  local color = (team ~= nil and team == myTeam) and M.OWN_COLOR or M.RIVAL_COLOR
  return { color[1], color[2], color[3] }
end

function M.pointsFor(place, count)
  return math.max(0, count - place + 1)
end

function M.standings(racers)
  local order = {}
  for i = 1, #racers do
    order[i] = i
  end
  local function finished(racer)
    return not racer.out and racer.finishTime ~= nil and racer.finishTime > 0
  end
  table.sort(order, function(a, b)
    local ra, rb = racers[a], racers[b]
    local fa, fb = finished(ra), finished(rb)
    if fa ~= fb then
      return fa
    end
    if fa and ra.finishTime ~= rb.finishTime then
      return ra.finishTime < rb.finishTime
    end
    if not fa and (ra.out or false) ~= (rb.out or false) then
      return not ra.out
    end
    if not fa and (ra.x or 0) ~= (rb.x or 0) then
      return (ra.x or 0) > (rb.x or 0)
    end
    return a < b
  end)
  local places, points = {}, { 0, 0 }
  for place, index in ipairs(order) do
    places[index] = place
    local racer = racers[index]
    if racer.team and points[racer.team] then
      if not racer.out then
        points[racer.team] = points[racer.team] + M.pointsFor(place, #racers)
      end
    end
  end
  local winner
  if points[1] ~= points[2] then
    winner = points[1] > points[2] and 1 or 2
  end
  return { places = places, points = points, winner = winner }
end

function M.resultFor(stats, myTeam)
  if not stats or not myTeam or not stats.teamPoints then
    return nil
  end
  if stats.teamWinner == nil then
    return "draw"
  end
  return stats.teamWinner == myTeam and "win" or "loss"
end

function M.assignTeams(me, bots)
  me.team = M.PLAYER_TEAM
  for i = 1, #bots do
    bots[i].team = i == 1 and M.PLAYER_TEAM or M.RIVAL_TEAM
  end
end

return M
