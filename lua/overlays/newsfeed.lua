local composer = require("composer")
local widget = require("widget")
local screen = require("lua.modules.screen")
local newsItems = require("lua.modules.newsItems")
local scene = composer.newScene()
local clean, cleanEnter

local DESIGN_W, DESIGN_H = 480, 320
local FRAME_W, FRAME_H = 332, 320
local PAGE_W = 244
local SEEN_KEY = "newsSeen"
local TEXT_COLOR = { 0.24, 0.14, 0.06 }
local TAG_COLOR = { 0.55, 0.33, 0.12 }

local function newestNewsId()
  local newest = 0
  for _, item in ipairs(newsItems) do
    newest = math.max(newest, item.id or 0)
  end
  return newest
end

function scene.hasUnreadNews()
  return (tonumber(composer.database.getValue(SEEN_KEY)) or 0) < newestNewsId()
end

function scene:create(event)
  local group = self.view
  local box = screen.designBox(DESIGN_W, DESIGN_H)
  local s = box.scale
  local frameTop = (box.T + DESIGN_H) * 0.5 - FRAME_H * 0.5

  local dim = display.newRect(group, screen.centerX, screen.centerY, screen.width + 4, screen.height + 4)
  dim:setFillColor(0, 0, 0, 0.59)

  local design = display.newGroup()
  design.xScale, design.yScale = s, s
  design.x, design.y = box.left, box.top
  group:insert(design)

  local frame = display.newImageRect(design, "images/gui/newsfeed/frame.png", FRAME_W, FRAME_H)
  frame.anchorY = 0
  frame.x, frame.y = DESIGN_W * 0.5, frameTop

  local title = composer.newText({ string = composer.localized.get("News"), size = 22 * s, color = { 1, 1, 1 } })
  title.xScale, title.yScale = 1 / s, 1 / s
  title.x, title.y = DESIGN_W * 0.5, frameTop + 18
  design:insert(title)

  local closeButton = composer.newButton({
    image = "images/gui/common/buttonClosePopupRed.png",
    width = 43,
    height = 38,
    x = DESIGN_W * 0.5 + FRAME_W * 0.5 - 30,
    y = frameTop + 19,
    onRelease = function()
      composer.hideOverlay()
    end
  })
  design:insert(closeButton)

  -- the news scrolls on the cream page between the posts (in screen units: widgets
  -- don't scale with their group).
  local pageTop = frameTop + 42
  local pageHeight = FRAME_H - 46
  local scrollView = widget.newScrollView({
    left = box.left + (DESIGN_W * 0.5 - PAGE_W * 0.5) * s,
    top = box.top + pageTop * s,
    width = PAGE_W * s,
    height = pageHeight * s,
    hideBackground = true,
    horizontalScrollDisabled = true,
    hideScrollBar = false
  })
  group:insert(scrollView)

  local y = 6 * s
  local textWidth = (PAGE_W - 16) * s
  local function addText(string, size, color)
    local text = composer.newText({ string = string, size = size * s, width = textWidth, color = color, ax = 0, ay = 0 })
    text.x, text.y = 8 * s, y
    scrollView:insert(text)
    y = y + text.contentHeight + 4 * s
  end

  for i, item in ipairs(newsItems) do
    if item.tag then
      addText(item.tag, 11, TAG_COLOR)
    end
    addText(item.title or "", 17, TEXT_COLOR)
    addText(item.text or "", 12, TEXT_COLOR)
    if i < #newsItems then
      local line = display.newRect(8 * s, y + 4 * s, textWidth, 2 * s)
      line.anchorX, line.anchorY = 0, 0
      line:setFillColor(TAG_COLOR[1], TAG_COLOR[2], TAG_COLOR[3], 0.5)
      scrollView:insert(line)
      y = y + 14 * s
    end
  end
  scrollView:setScrollHeight(y + 8 * s)

  local function onDimTouch(touchEvent)
    if touchEvent.phase == "ended" then
      composer.hideOverlay()
    end
    return true
  end

  local function swallowTouch()
    return true
  end

  dim:addEventListener("touch", onDimTouch)
  frame:addEventListener("touch", swallowTouch)
  composer.database.setValue(SEEN_KEY, newestNewsId())
  composer.audio.play("dropdown_menu")
  transition.from(design, { time = 600, y = box.top - 200 * s, transition = easing.outBounce })
  transition.from(scrollView, { time = 600, y = scrollView.y - 200 * s, transition = easing.outBounce })

  function clean()
    dim:removeEventListener("touch", onDimTouch)
    frame:removeEventListener("touch", swallowTouch)
    display.remove(closeButton)
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
    end
  elseif event.phase == "did" and event.parent and event.parent.overlayEnded then
    event.parent:overlayEnded()
  end
end

function scene:destroy(event)
  if clean then
    clean()
  end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
