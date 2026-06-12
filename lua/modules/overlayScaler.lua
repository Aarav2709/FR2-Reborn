-- overlayScaler.lua
-- Utility for overlays authored in the game's 480x320 landscape coordinate
-- system. Solar2D scales this base content size to modern iOS and Android
-- screens through config.lua.

local M = {}

local OLD_WIDTH = 480
local OLD_HEIGHT = 320

-- Create a full-screen dimming backdrop that covers the entire display
-- regardless of device aspect ratio.
function M.createBackdrop(group, alpha)
  alpha = alpha or 0.5882352941176471
  local bg = display.newRect(
    display.screenOriginX,
    display.screenOriginY,
    display.actualContentWidth,
    display.actualContentHeight
  )
  bg.anchorX = 0
  bg.anchorY = 0
  bg:setFillColor(0, 0, 0, alpha)
  if group then
    group:insert(bg)
  end
  return bg
end

-- Apply scaling to a display group so that 480x320 coordinates map correctly
-- to the current content area.
function M.scaleGroup(group)
  if group then
    local scale = math.min(display.contentWidth / OLD_WIDTH, display.contentHeight / OLD_HEIGHT)
    group.xScale = scale
    group.yScale = scale
    group.x = (display.contentWidth - OLD_WIDTH * scale) * 0.5
    group.y = (display.contentHeight - OLD_HEIGHT * scale) * 0.5
  end
end

-- Convert a single old X coordinate to new coordinate space.
function M.x(oldX)
  return display.contentWidth * (oldX / OLD_WIDTH)
end

-- Convert a single old Y coordinate to new coordinate space.
function M.y(oldY)
  return display.contentHeight * (oldY / OLD_HEIGHT)
end

-- Convert old width to new width.
function M.w(oldW)
  return display.contentWidth * (oldW / OLD_WIDTH)
end

-- Convert old height to new height.
function M.h(oldH)
  return display.contentHeight * (oldH / OLD_HEIGHT)
end

return M
