local composer = require("composer")
local M = {}
local activePreview = nil

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

-- Show shield preview with breathing scale animation
function M.showShield(itemKey)
  removeCurrentPreview()
  local frameIndex = composer.powerUpImageSheetInfo:getFrameIndex("" .. itemKey)
  local image = display.newImage(composer.powerUpImageSheet, frameIndex)
  local baseScale = 0.8
  image.xScale = baseScale
  image.yScale = baseScale
  image.x = 290
  image.y = 112

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
      xScale = baseScale - 0.05,
      yScale = baseScale + 0.05,
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
  local image = display.newImageRect("images/gui/market/items/sawblade/" .. itemKey .. ".png", 65, 72)
  image.anchorX = 0.5
  image.anchorY = 0.5
  image.x = 290
  image.y = 130
  activePreview = { image = image }
  activePreview.effect = function()
    if activePreview and activePreview.image then
      activePreview.image.rotation = activePreview.image.rotation + 6
    end
  end
  return image
end

-- Show beartrap preview (static)
function M.showBearTrap(itemKey)
  removeCurrentPreview()
  local image = display.newImageRect("images/gui/market/items/beartrap/" .. itemKey .. ".png", 70, 81)
  image.anchorX = 0
  image.anchorY = 0
  image.x = 254
  image.y = 82
  activePreview = { image = image }
  return image
end

-- Show punchbox preview (static)
function M.showPunchbox(itemKey)
  removeCurrentPreview()
  local image = display.newImageRect("images/gui/market/items/punchbox/" .. itemKey .. ".png", 70, 81)
  image.anchorX = 0
  image.anchorY = 0
  image.x = 244
  image.y = 82
  activePreview = { image = image }
  return image
end

-- Show generic powerup item preview (for rocket, balloon, magnet, gun, speed)
function M.showGenericPowerup(itemKey, category)
  removeCurrentPreview()
  local image = display.newImageRect("images/gui/market/items/" .. category .. "/" .. itemKey .. ".png", 70, 81)
  image.anchorX = 0.5
  image.anchorY = 0.5
  image.x = 290
  image.y = 112
  activePreview = { image = image }
  return image
end

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
  elseif category == "beartrap" then
    return M.showBearTrap(itemKey)
  elseif category == "shield" then
    return M.showShield(itemKey)
  elseif category == "punchbox" then
    return M.showPunchbox(itemKey)
  else
    return M.showGenericPowerup(itemKey, category)
  end
end

return M
