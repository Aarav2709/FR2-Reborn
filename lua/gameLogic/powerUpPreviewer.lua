-- Marketplace preview for powerup skins. The caller decides where previews go
-- (setPlacement) and inserts the returned image into its own display group.
local composer = require("composer")
local M = {}
local activePreview = nil

-- Centre point and size multiplier for previews, in the caller's coordinates.
local placement = { x = display.contentWidth * 0.5, y = display.contentHeight * 0.34, scale = 1 }

function M.setPlacement(x, y, scale)
  placement.x = x
  placement.y = y
  placement.scale = scale or 1
end

-- enterFrame listener: runs per-frame effects (e.g. sawblade rotation)
local function onEnterFrame()
  if activePreview and activePreview.effect then
    activePreview.effect()
  end
end

-- Remove current preview image and cancel its transitions
local function removeCurrentPreview()
  if activePreview then
    if activePreview.transition then
      transition.cancel(activePreview.transition)
    end
    if activePreview.image then
      activePreview.image:removeSelf()
      activePreview.image = nil
    end
    activePreview = nil
  end
end

-- Initialize the previewer (call before showing previews)
function M.init()
  M.clean()
  activePreview = nil
  Runtime:addEventListener("enterFrame", onEnterFrame)
end

-- Market icon for any powerup skin; nil when the icon file is missing.
local function newMarketIcon(category, itemKey, width, height)
  local path = "images/gui/market/items/" .. category .. "/" .. itemKey .. ".png"
  return display.newImageRect(path, width * placement.scale, height * placement.scale)
end

-- Show shield preview with breathing scale animation
function M.showShield(itemKey)
  removeCurrentPreview()
  local frameIndex = composer.powerUpImageSheetInfo and composer.powerUpImageSheetInfo:getFrameIndex("" .. itemKey)
  if not frameIndex then
    return M.showGenericPowerup(itemKey, "shield")
  end
  local image = display.newImage(composer.powerUpImageSheet, frameIndex)
  local baseScale = 0.45 * placement.scale
  image.xScale = baseScale
  image.yScale = baseScale
  image.x = placement.x
  image.y = placement.y

  local scaleUp, scaleDown
  function scaleUp()
    transition.to(image, {
      time = 200,
      xScale = baseScale,
      yScale = baseScale,
      onComplete = scaleDown
    })
  end
  function scaleDown()
    transition.to(image, {
      time = 200,
      xScale = baseScale * 0.94,
      yScale = baseScale * 1.06,
      onComplete = scaleUp
    })
  end
  scaleDown()

  activePreview = { image = image, transition = image }
  return image
end

-- Show sawblade preview with rotation effect
function M.showSawblade(itemKey)
  removeCurrentPreview()
  local image = newMarketIcon("sawblade", itemKey, 52, 58)
  if not image then
    return nil
  end
  image.x = placement.x
  image.y = placement.y
  activePreview = { image = image }
  activePreview.effect = function()
    if activePreview and activePreview.image then
      activePreview.image.rotation = activePreview.image.rotation + 6
    end
  end
  return image
end

-- Show generic powerup item preview (beartrap, punchbox, rocket, balloon, magnet, gun, speed)
function M.showGenericPowerup(itemKey, category)
  removeCurrentPreview()
  local image = newMarketIcon(category, itemKey, 56, 64)
  if not image then
    return nil
  end
  image.x = placement.x
  image.y = placement.y
  activePreview = { image = image }
  return image
end

M.showBearTrap = function(itemKey) return M.showGenericPowerup(itemKey, "beartrap") end
M.showPunchbox = function(itemKey) return M.showGenericPowerup(itemKey, "punchbox") end

-- Remove preview but keep enterFrame listener
function M.softClean()
  removeCurrentPreview()
end

-- Full cleanup: remove preview AND enterFrame listener
function M.clean()
  removeCurrentPreview()
  Runtime:removeEventListener("enterFrame", onEnterFrame)
end

-- Show preview for any powerup category
function M.showPreviewForCategory(category, itemKey)
  if category == "sawblade" then
    return M.showSawblade(itemKey)
  elseif category == "shield" then
    return M.showShield(itemKey)
  else
    return M.showGenericPowerup(itemKey, category)
  end
end

return M
