-- a text box for names and addresses, drawn in the game's style
local composer = require("composer")
local M = {}

local TEXT_COLOR = { 0.29, 0.16, 0.06 }
local PLACEHOLDER_COLOR = { 0.29, 0.16, 0.06, 0.4 }
local CARET_BLINK = 500

M.focused = nil

local NAMED_KEYS = {
  space = " ", period = ".", comma = ",", minus = "-", numberSign = "#", ["#"] = "#",
  numPadPeriod = ".", ["numPad."] = ".", numPadDecimal = ".", numPadSubtract = "-"
}
local SHIFTED_DIGITS = { ["1"] = "!", ["2"] = "@", ["3"] = "#", ["4"] = "$", ["5"] = "%", ["6"] = "^",
  ["7"] = "&", ["8"] = "*", ["9"] = "(", ["0"] = ")" }

local function characterFor(event)
  local key = event.keyName or ""
  if #key == 1 then
    if key:match("%a") then
      return event.isShiftDown and key:upper() or key
    end
    if key:match("%d") and event.isShiftDown then
      return SHIFTED_DIGITS[key]
    end
    return key
  end
  local digit = key:match("^numPad(%d)$")
  if digit then
    return digit
  end
  return NAMED_KEYS[key]
end

function M.new(params)
  local box = {}
  local parent = params.parent
  local width, height = params.width, params.height
  local maxLength = params.maxLength or 20
  local allowed = params.allowed
  local size = params.size or 16
  local text = params.text or ""
  local group = display.newGroup()
  parent:insert(group)
  group.x, group.y = params.x, params.y
  local plank = display.newRoundedRect(group, 0, 0, width, height, 7)
  plank:setFillColor(0.98, 0.93, 0.8)
  plank:setStrokeColor(0.36, 0.22, 0.12)
  plank.strokeWidth = 2
  local field, label, caret, blinkTimer, keyListener

  local function filter(value)
    local out = {}
    for character in tostring(value or ""):gmatch(".") do
      if not allowed or character:match(allowed) then
        out[#out + 1] = character
      end
    end
    return table.concat(out):sub(1, maxLength)
  end

  local isPC = require("lua.modules.pcMode").isPC or params.drawn
  if not isPC and native.newTextField then
    local x0, y0 = plank:localToContent(-width * 0.5, -height * 0.5)
    local x1, y1 = plank:localToContent(width * 0.5, height * 0.5)
    local ok, created = pcall(native.newTextField, (x0 + x1) * 0.5, (y0 + y1) * 0.5, (x1 - x0) - 16, (y1 - y0) - 4)
    if ok and created then
      field = created
      field.hasBackground = false
      field.align = "center"
      field.text = text
      field.placeholder = params.placeholder
      if params.inputType then
        field.inputType = params.inputType
      end
      local scale = (x1 - x0) / width
      pcall(function()
        field.font = native.newFont(composer.data.font or native.systemFontBold, size * scale)
        field:setTextColor(TEXT_COLOR[1], TEXT_COLOR[2], TEXT_COLOR[3])
      end)
      field:addEventListener("userInput", function(event)
        local clean = filter(event.target.text)
        if clean ~= event.target.text then
          event.target.text = clean
        end
        text = clean
        if params.onChange then
          params.onChange(text)
        end
        if event.phase == "submitted" then
          native.setKeyboardFocus(nil)
          if params.onSubmit then
            params.onSubmit(text)
          end
        end
      end)
    end
  end

  if not field then
    label = display.newText({ parent = group, text = "", font = composer.data.font or native.systemFontBold, fontSize = size })
    caret = display.newRect(group, 0, 0, 2, size * 0.95)
    caret:setFillColor(TEXT_COLOR[1], TEXT_COLOR[2], TEXT_COLOR[3])
    caret.isVisible = false

    local function redraw()
      if not label or not label.parent then
        return
      end
      if text == "" and params.placeholder and M.focused ~= box then
        label.text = params.placeholder
        label:setFillColor(unpack(PLACEHOLDER_COLOR))
      else
        label.text = text
        label:setFillColor(TEXT_COLOR[1], TEXT_COLOR[2], TEXT_COLOR[3])
      end
      local fit = math.min(1, (width - 16) / math.max(1, label.width))
      label.xScale, label.yScale = fit, fit
      label.x, label.y = 0, 1
      caret.x = (text == "" and 0 or label.width * fit * 0.5 + 2)
      caret.y = 0
    end
    box.redraw = redraw

    function keyListener(event)
      if M.focused ~= box or event.phase ~= "down" then
        return false
      end
      local key = event.keyName
      if key == "deleteBack" then
        text = text:sub(1, -2)
      elseif key == "enter" or key == "numPadEnter" then
        if params.onSubmit then
          params.onSubmit(text)
        end
        return true
      elseif key == "escape" then
        box.blur()
        return true
      else
        local character = characterFor(event)
        if not character then
          return false
        end
        local added = filter(text .. character)
        if added == text then
          return true
        end
        text = added
      end
      redraw()
      if params.onChange then
        params.onChange(text)
      end
      return true
    end
    Runtime:addEventListener("key", keyListener)
    plank:addEventListener("tap", function()
      box.focus()
      return true
    end)
    redraw()
  end

  function box.getText()
    if field then
      return filter(field.text)
    end
    return text
  end

  function box.setText(value)
    text = filter(value)
    if field then
      field.text = text
    elseif box.redraw then
      box.redraw()
    end
  end

  function box.focus()
    if field then
      native.setKeyboardFocus(field)
      return
    end
    M.focused = box
    caret.isVisible = true
    if blinkTimer then
      timer.cancel(blinkTimer)
    end
    blinkTimer = timer.performWithDelay(CARET_BLINK, function()
      if caret and caret.parent then
        caret.isVisible = not caret.isVisible
      end
    end, 0)
    box.redraw()
  end

  function box.blur()
    if field then
      native.setKeyboardFocus(nil)
      return
    end
    if M.focused == box then
      M.focused = nil
    end
    if blinkTimer then
      timer.cancel(blinkTimer)
      blinkTimer = nil
    end
    if caret and caret.parent then
      caret.isVisible = false
    end
    if box.redraw then
      box.redraw()
    end
  end

  function box.remove()
    box.blur()
    if keyListener then
      Runtime:removeEventListener("key", keyListener)
      keyListener = nil
    end
    if field then
      field:removeSelf()
      field = nil
    end
    display.remove(group)
  end

  box.group = group
  box.isDrawn = field == nil
  return box
end

return M
