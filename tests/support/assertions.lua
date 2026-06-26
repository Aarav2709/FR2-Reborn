local M = {}

local function fail(message)
  error(message, 2)
end

function M.equal(actual, expected, message)
  if actual ~= expected then
    fail(string.format("%s expected %s, got %s", message or "values differ", tostring(expected), tostring(actual)))
  end
end

function M.truthy(value, message)
  if not value then
    fail(message or "expected value to be truthy")
  end
end

function M.same(actual, expected, message)
  if type(actual) ~= "table" or type(expected) ~= "table" then
    M.equal(actual, expected, message)
    return
  end

  for key, expectedValue in pairs(expected) do
    M.same(actual[key], expectedValue, message and (message .. "." .. tostring(key)) or tostring(key))
  end
  for key in pairs(actual) do
    if expected[key] == nil then
      fail(string.format("%s unexpected key %s", message or "tables differ", tostring(key)))
    end
  end
end

return M
