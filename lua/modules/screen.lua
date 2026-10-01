-- Screen metrics for laying out UI on any aspect ratio.
-- config.lua sizes the content area to the whole display, so the screen spans
-- left..right / top..bottom below. The "safe" edges keep buttons clear of notches,
-- rounded corners and camera cut-outs.
local M = {}

function M.update()
  M.left = display.screenOriginX
  M.top = display.screenOriginY
  M.width = display.actualContentWidth
  M.height = display.actualContentHeight
  M.right = M.left + M.width
  M.bottom = M.top + M.height
  M.centerX = M.left + M.width * 0.5
  M.centerY = M.top + M.height * 0.5
  M.safeLeft = math.max(M.left, display.safeScreenOriginX)
  M.safeTop = math.max(M.top, display.safeScreenOriginY)
  M.safeRight = math.min(M.right, display.safeScreenOriginX + display.safeActualContentWidth)
  M.safeBottom = math.min(M.bottom, display.safeScreenOriginY + display.safeActualContentHeight)
  M.safeWidth = M.safeRight - M.safeLeft
  M.safeHeight = M.safeBottom - M.safeTop
  -- Tablets and 3:2 phones have spare height rather than spare width.
  M.isTall = M.width / M.height < 1.7
  return M
end

-- Scales an image to cover the whole screen, keeping its aspect ratio, and centers it.
function M.cover(object)
  if not object or not object.width then
    return
  end
  object.xScale, object.yScale = 1, 1
  local scale = math.max(M.width / object.width, M.height / object.height)
  object.xScale, object.yScale = scale, scale
  object.x, object.y = M.centerX, M.centerY
end

-- Uniform scale that fits a box of the given size inside the safe area (never above maxScale).
function M.fitScale(boxWidth, boxHeight, maxScale)
  local scale = math.min(M.safeWidth / boxWidth, M.safeHeight / boxHeight)
  if maxScale and scale > maxScale then
    scale = maxScale
  end
  return scale
end

-- Fits a fixed-size design (e.g. the original 480x320 screens) to the screen with
-- one uniform scale, centred horizontally and resting on the bottom edge. Fills
-- `box` (or a new table) with the scale, the box origin in content units, and the
-- screen / safe-area edges converted to design units:
--   L, R, T      screen left, right and top
--   SL, SR       safe-area left and right
-- A group holding design-unit objects takes scale = box.scale, x = box.left, y = box.top.
function M.designBox(designWidth, designHeight, box)
  M.update()
  box = box or {}
  local s = math.min(M.width / designWidth, M.height / designHeight)
  box.scale = s
  box.left = M.centerX - designWidth * s * 0.5
  box.top = M.bottom - designHeight * s
  box.L = (M.left - box.left) / s
  box.R = (M.right - box.left) / s
  box.T = (M.top - box.top) / s
  box.SL = (M.safeLeft - box.left) / s
  box.SR = (M.safeRight - box.left) / s
  return box
end

M.update()
return M
