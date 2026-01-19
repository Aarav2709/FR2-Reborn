local M = {}

local function new(id, playerList)
  local jump = {1}
  jump.x = 1
  jump.y = 1
  local player = playerList[id]
  if player then
    player.playPowerUpJumpEffect()
    local vx, vy = player:getLinearVelocity()
    if vy < -140 then
      player:applyForce(100, -250, player.x, player.y)
    elseif 100 < vy then
      player:applyForce(100, -400, player.x, player.y)
    else
      player:applyForce(100, -300, player.x, player.y)
    end
  end
  return jump
end

M.new = new
return M
