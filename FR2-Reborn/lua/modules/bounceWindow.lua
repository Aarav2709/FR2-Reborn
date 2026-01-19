local M = {}
local composer = require("composer")

function M.down(group)
  group.y = -200
  transition.to(group, {
    time = 600,
    y = 0,
    transition = easing.outBounce
  })
  composer.audio.play("dropdown_menu")
end

composer.bouncer = M
