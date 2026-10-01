local composer = require("composer")
local screen = require("lua.modules.screen")
local league = require("lua.modules.offlineLeague")
local fireworksHandler = require("lua.game.effects.fireworksHandler")
local scene = composer.newScene()
local clean, cleanEnter

-- "You reached ..." on the hanging sign between the two runners, with the
-- new league's shield bouncing in (original 480x320 design units).
local DESIGN_W, DESIGN_H = 480, 320
local PROMOTION_TEXT = {
  [league.PROMOTED] = "You reached",
  [league.DEMOTED] = "You've been demoted to",
  [league.PLACED] = "You've been placed in"
}

function scene:create(event)
  local group = self.view
  local params = event.params or {}
  local tier = tonumber(params.league) or league.WOOD
  local promotionType = tonumber(params.promotionType) or league.PROMOTED
  local box = screen.designBox(DESIGN_W, DESIGN_H)
  local s = box.scale
  local top = box.T
  local buttons = {}

  local function newText(textParams)
    textParams.size = textParams.size * s
    local text = composer.newText(textParams)
    text.xScale, text.yScale = 1 / s, 1 / s
    return text
  end

  local dim = display.newImageRect(group, "images/gui/common/black.png", screen.width + 4, screen.height + 4)
  dim.x, dim.y = screen.centerX, screen.centerY
  local design = display.newGroup()
  design.xScale, design.yScale = s, s
  design.x, design.y = box.left, box.top
  group:insert(design)

  local window = display.newImageRect(design, "images/gui/ranking/promotion/window.png", 430, 256)
  window.anchorY = 0
  window.x, window.y = 240, top
  local shield = display.newImageRect(design, "images/gui/ranking/promotion/tierP_" .. tier .. ".png", 180, 178)
  -- The shield sits on the sign above the plate (a little smaller than full size so
  -- the two don't overlap).
  local SHIELD_SCALE = 0.7
  shield.x, shield.y = 240, top + 98
  shield.xScale, shield.yScale = 0.2, 0.2
  transition.to(shield, { delay = 100, time = 1000, xScale = SHIELD_SCALE, yScale = SHIELD_SCALE, transition = easing.outBounce })

  local plateY = top + 197
  local platePath = "images/gui/ranking/promotion/plate_" .. tier .. ".png"
  if system.pathForFile(platePath, system.ResourceDirectory) then
    local plate = display.newImageRect(design, platePath, 182, 70)
    plate.x, plate.y = 240, plateY
    plate.xScale, plate.yScale = 0.85, 0.85
  end
  local heading = newText({ string = composer.localized.get(PROMOTION_TEXT[promotionType] or PROMOTION_TEXT[league.PROMOTED]),
    size = 10, color = { 1, 1, 1 }, align = "center" })
  heading.x, heading.y = 240, plateY - 12
  design:insert(heading)
  local leagueName = newText({ string = composer.localized.get(league.leagueName(tier)), size = 17, color = { 1, 1, 1 },
    align = "center" })
  leagueName.x, leagueName.y = 240, plateY + 1
  design:insert(leagueName)
  local playerInfo = composer.database.getPlayerInformation() or {}
  local username = tostring(playerInfo.username or "")
  if playerInfo.usernameCode and not username:find("#", 1, true) then
    username = username .. "#" .. playerInfo.usernameCode
  end
  local nameText = newText({ string = username, size = 8, color = { 0, 0, 0, 0.4 }, align = "center" })
  nameText.x, nameText.y = 240, plateY + 13
  design:insert(nameText)

  if promotionType ~= league.DEMOTED then
    fireworksHandler.startFireWorks(0, top + 320, design, 0, true)
    composer.audio.play("rating_end")
  end

  local function close()
    composer.hideOverlay()
  end

  local function openLeague()
    composer.hideOverlay()
    timer.performWithDelay(10, function()
      composer.showOverlay("lua.overlays.league", { isModal = true })
    end)
  end

  local okButton = composer.newButton({
    image = "images/gui/ranking/promotion/buttonOk.png",
    width = 62,
    height = 37,
    x = 210,
    y = top + 255,
    text = { string = composer.localized.get("OK"), size = 14 },
    onRelease = close
  })
  design:insert(okButton)
  buttons[#buttons + 1] = okButton
  local leagueButton = composer.newButton({
    image = "images/gui/ranking/promotion/buttonRanking.png",
    width = 48,
    height = 37,
    x = 270,
    y = top + 255,
    onRelease = openLeague
  })
  design:insert(leagueButton)
  buttons[#buttons + 1] = leagueButton

  local function swallowTouch()
    return true
  end

  dim:addEventListener("touch", swallowTouch)

  function clean()
    dim:removeEventListener("touch", swallowTouch)
    fireworksHandler.clean()
    transition.cancel(shield)
    for _, button in ipairs(buttons) do
      display.remove(button)
    end
  end
end

function scene:show(event)
  if event.phase == "will" then
    return
  end
  local androidLogic = require("lua.modules.androidBackButton")

  function cleanEnter()
    androidLogic.isOverlay(false)
  end

  androidLogic.isOverlay(true)
end

function scene:hide(event)
  if event.phase == "will" then
    if cleanEnter then
      cleanEnter()
      cleanEnter = nil
    end
  elseif event.phase == "did" and event.parent and event.parent.overlayEnded then
    event.parent:overlayEnded()
  end
end

function scene:destroy(event)
  if clean then
    clean()
    clean = nil
  end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
