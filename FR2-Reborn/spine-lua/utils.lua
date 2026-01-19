local utils = {}

function tablePrint(tt, indent, done)
  done = done or {}
  for key, value in pairs(tt) do
    local spaces = string.rep(" ", indent)
    if type(value) == "table" and not done[value] then
      done[value] = true
      print(spaces .. "{")
      utils.print(value, indent + 2, done)
      print(spaces .. "}")
    else
      io.write(spaces .. tostring(key) .. " = ")
      utils.print(value, indent + 2, done)
    end
  end
end

function utils.print(value, indent, done)
  indent = indent or 0
  if "nil" == type(value) then
    print(tostring(nil))
  elseif "table" == type(value) then
    local spaces = string.rep(" ", indent)
    print(spaces .. "{")
    tablePrint(value, indent + 2)
    print(spaces .. "}")
  elseif "string" == type(value) then
    print("\"" .. value .. "\"")
  else
    print(tostring(value))
  end
end

function utils.indexOf(haystack, needle)
  for i, value in ipairs(haystack) do
    if value == needle then
      return i
    end
  end
  return nil
end

function utils.copy(from, to)
  to = to or {}
  for k, v in pairs(from) do
    to[k] = v
  end
  return to
end

return utils
