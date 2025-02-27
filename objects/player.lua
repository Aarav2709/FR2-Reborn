-- objects/player.lua
local Player = {}

function Player.new()
    local player = display.newImageRect("assets/graphics/characters/default.png", 50, 50)
    
    physics.addBody(player, "dynamic", {
        density = 1.0,
        friction = 0.3,
        bounce = 0.2
    })
    
    function player:jump()
        -- Jump mechanics similar to Fun Run 2
        self:applyLinearImpulse(0, -0.15) -- Adjust value based on original game
    end
    
    -- Add other player methods (animations, power-ups, etc.)
    
    return player
end

return Player