local M = {}

local function doesFileExist(fname, path)
  local results = false
  local filePath = system.pathForFile(fname, path)
  filePath = filePath and io.open(filePath, "r")
  if filePath then
    filePath:close()
    results = true
  end
  return results
end

M.doesFileExist = doesFileExist
return M
