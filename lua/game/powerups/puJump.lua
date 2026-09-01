local M = {}

local function new(id, playerList)
  local jump = {1}
  jump.x = 1
  jump.y = 1
  local player = playerList[id]
  if player then
    player.playPowerUpJumpEffect()
    local vx, vy = player:getLinearVelocity()
    local newVx = math.max(vx + 120, 380)
    local newVy = -750
    if vy < -140 then
      newVy = -850
    end
    player.onGround = false
    player.y = player.y - 4
    player:setLinearVelocity(newVx, newVy)
  end
  return jump
end

M.new = new
return M
