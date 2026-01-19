local M = {}

local function deepCopy(tab)
  if type(tab) ~= "table" then
    return tab
  end
  local metatab = getmetatable(tab)
  local res = {}
  for key, value in pairs(tab) do
    if type(value) == "table" then
      value = deepCopy(value)
    end
    res[key] = value
  end
  setmetatable(res, metatab)
  return res
end

M.deepCopy = deepCopy
return M
