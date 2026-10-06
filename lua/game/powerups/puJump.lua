local M = {}

local STEP = 1 / 30

local function new(id, playerList)
  local jump = {1}
  jump.x = 1
  jump.y = 1
  local player = playerList[id]
  if player then
    player.playPowerUpJumpEffect()
    local vx, vy = player:getLinearVelocity()
    local upForce = -300
    if vy < -140 then
      upForce = -250
    elseif 100 < vy then
      upForce = -400
    end
    player:applyLinearImpulse(100 * STEP, upForce * STEP, player.x, player.y)
  end
  return jump
end

M.new = new
return M
