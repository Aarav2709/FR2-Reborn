-- Seasonal menu art, as in Fun Run 2: around Halloween, Christmas and Valentine's
-- Day the menus switch to themed backgrounds, picked from the device's date.
local composer = require("composer")
local M = {}

local SEASONS = {
  {
    name = "halloween",
    month = 10, firstDay = 1, lastDay = 31,
    background = "images/gui/common/bgMain_halloween.png",
    blurredBackground = "images/gui/common/bgMain_halloween_blur.png"
  },
  {
    name = "christmas",
    month = 12, firstDay = 1, lastDay = 31,
    background = "images/gui/common/bgMain_winter.png",
    blurredBackground = "images/gui/common/bgMain_winter_blur.png"
  },
  {
    name = "valentine",
    month = 2, firstDay = 7, lastDay = 15,
    background = "images/gui/common/bgMain_valentine.png",
    blurredBackground = "images/gui/common/bgMain_valentine_blur.png"
  }
}

local DEFAULT_BACKGROUND = "images/gui/common/bgBlur.png"
local DEFAULT_BLURRED_BACKGROUND = "images/gui/common/bgMain_blur.png"

-- The season for a date (today when omitted), or nil outside the seasons.
function M.getActiveSeason(date)
  date = date or os.date("*t")
  for _, season in ipairs(SEASONS) do
    if date.month == season.month and date.day >= season.firstDay and date.day <= season.lastDay then
      return season
    end
  end
  return nil
end

-- Landscape behind the menus.
function M.menuBackground()
  local season = M.getActiveSeason()
  return season and season.background or DEFAULT_BACKGROUND
end

-- Blurred landscape behind loading screens and the shop.
function M.blurredBackground()
  local season = M.getActiveSeason()
  return season and season.blurredBackground or DEFAULT_BLURRED_BACKGROUND
end

composer.seasonal = M
return M
