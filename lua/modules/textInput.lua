-- a text box for names and addresses, drawn in the game's style
local composer = require("composer")
local M = {}

local TEXT_COLOR = { 0.29, 0.16, 0.06 }
local PLACEHOLDER_COLOR = { 0.29, 0.16, 0.06, 0.4 }
local CARET_BLINK = 500

M.focused = nil
-- keys a box took on "down": their "up" is the box's too
local keysTaken = {}

-- whether a key event belongs to a text box (other key handlers leave it alone)
function M.ownsKey(event)
  return M.focused ~= nil or (event ~= nil and keysTaken[event.keyName] ~= nil)
end

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
  local field, label, caret, selection, blinkTimer, keyListener
  -- pc: a click selects the text, so typing replaces it
  local selected = false

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
    selection = display.newRect(group, 0, 0, 10, size * 1.1)
    selection:setFillColor(0.45, 0.68, 1, 0.55)
    selection.isVisible = false
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
      selection.isVisible = selected and text ~= "" and M.focused == box
      selection.width = label.width * fit + 4
      selection.x, selection.y = 0, 1
    end
    box.redraw = redraw

    local function isShown()
      local object = group
      while object do
        if object.isVisible == false then
          return false
        end
        object = object.parent
      end
      return group.parent ~= nil
    end

    function keyListener(event)
      local key = event.keyName
      if event.phase == "up" then
        if keysTaken[key] then
          timer.performWithDelay(1, function()
            keysTaken[key] = nil
          end)
          return true
        end
        return false
      end
      if event.phase ~= "down" then
        return false
      end
      -- typeToFocus: typing straight away starts a new text in this box
      if M.focused == nil and params.typeToFocus and isShown() and not composer.getSceneName("overlay") then
        local character = characterFor(event)
        if character and (not allowed or character:match(allowed)) then
          box.focus()
          selected = text ~= ""
        end
      end
      if M.focused ~= box then
        return false
      end
      keysTaken[key] = true
      if key == "deleteBack" then
        if selected then
          text = ""
          selected = false
        else
          text = text:sub(1, -2)
        end
      elseif key == "enter" or key == "numPadEnter" then
        if params.onSubmit then
          params.onSubmit(text)
        end
        return true
      elseif key == "escape" then
        box.blur()
        return true
      elseif key == "right" or key == "end" or key == "home" or key == "left" then
        selected = false
      else
        local character = characterFor(event)
        if not character then
          return false
        end
        local base = selected and "" or text
        local added = filter(base .. character)
        if added == base then
          return true
        end
        selected = false
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
      selected = text ~= ""
      box.redraw()
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
    selected = false
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
    selected = false
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
