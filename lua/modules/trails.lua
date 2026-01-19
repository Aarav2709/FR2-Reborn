local M = {}

function M.createTrail(id, x, y, group, inGame)
  if id == 0 then
    return
  end
  local basePath = "images/monsters/trails/" .. id .. "_"
  local imagePath = basePath .. math.random(1, 3) .. ".png"
  local trail = display.newImageRect(imagePath, 27, 27)
  local distance = -100 + math.random(0, 40)
  local trailTime = 500
  
  local function removeTrail(obj)
    if obj and obj.removeSelf then
      obj:removeSelf()
      obj = nil
    end
  end
  
  local yDiff = math.random(-20, 20)
  trail.x = x
  trail.y = y + yDiff
  if inGame then
    trail.xScale = 0.7
    trail.yScale = 0.7
    distance = -20
  end
  local scaleFactor = math.random(1, 2) * 0.5
  trail.xScale = trail.xScale * scaleFactor
  trail.yScale = trail.yScale * scaleFactor
  if 0 < yDiff then
    trail.xScale = trail.xScale * -1
  end
  trail.rotation = math.random(-30, 30)
  group:insert(trail)
  transition.to(trail, {
    tag = "trails",
    time = trailTime * 0.3,
    delay = trailTime * 0.6,
    alpha = 0.2
  })
  transition.to(trail, {
    tag = "trails",
    time = trailTime,
    x = trail.x + distance,
    onComplete = removeTrail
  })
end

return M
