-- overlayScaler.lua
-- Utility to fix overlay coordinate scaling from the old 480×320 system
-- to the current 1920×1080 adaptive system.
--
-- The original game used config width=320, height=480 with zoomStretch,
-- giving landscape coordinates of 480×320. Many decompiled overlay files
-- still use these old coordinates. This module provides scaling helpers.

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

-- Apply scaling to a display group so that old 480×320 coordinates
-- map correctly to the current content area.
-- Elements positioned at old (240, 160) will appear at screen center.
function M.scaleGroup(group)
  if group then
    group.xScale = display.contentWidth / OLD_WIDTH
    group.yScale = display.contentHeight / OLD_HEIGHT
  end
end

-- Convert a single old X coordinate to new coordinate space
function M.x(oldX)
  return display.contentWidth * (oldX / OLD_WIDTH)
end

-- Convert a single old Y coordinate to new coordinate space
function M.y(oldY)
  return display.contentHeight * (oldY / OLD_HEIGHT)
end

-- Convert old width to new width
function M.w(oldW)
  return display.contentWidth * (oldW / OLD_WIDTH)
end

-- Convert old height to new height
function M.h(oldH)
  return display.contentHeight * (oldH / OLD_HEIGHT)
end

return M
