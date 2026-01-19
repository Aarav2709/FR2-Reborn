local M = {}
local json = require("json")
local fileUtils = require("lua.modules.fileUtils")
local composer = require("composer")

function string:split(inSplitPattern, outResults)
  outResults = outResults or {}
  local theStart = 1
  local theSplitStart, theSplitEnd = string.find(self, inSplitPattern, theStart)
  while theSplitStart do
    table.insert(outResults, string.sub(self, theStart, theSplitStart - 1))
    theStart = theSplitEnd + 1
    theSplitStart, theSplitEnd = string.find(self, inSplitPattern, theStart)
  end
  table.insert(outResults, string.sub(self, theStart))
  return outResults
end

local function getCorrectPath(path)
  local absolutePath
  if fileUtils.doesFileExist(path, system.CachesDirectory) and not composer.config.ignoreJsonConfig then
    absolutePath = system.pathForFile(path, system.CachesDirectory)
  else
    absolutePath = system.pathForFile(path, system.ResourceDirectory)
  end
  return absolutePath
end

local function getFile(path)
  local absolutePath = getCorrectPath(path)
  if absolutePath then
    local file = io.open(absolutePath, "r")
    local readFile = file:read("*a")
    io.close(file)
    composer.debugger.debugPrint("filesystem", "getFile", readFile)
    return readFile
  else
    return nil
  end
end

local function getJsonFromFile(path)
  local jsonFile = getFile(path)
  if jsonFile then
    local decodedJson = json.decode(jsonFile)
    composer.debugger.debugTable("filesystem", "getJsonFromFile", decodedJson)
    if decodedJson == nil and composer.analytics then
      print("WARNING: failed to find file ", path)
      composer.analytics.newEvent("design", {
        event_id = "json:decodeFailed",
        area = composer.config.fullVersion
      })
    end
    return decodedJson
  else
    return nil
  end
end

local function isValidJson(path)
  local jsonFile = getFile(path)
  if jsonFile then
    local decoded = json.decode(jsonFile)
    if decoded then
      return true
    end
  end
  return false
end

local function getMapInfoFromFile(path)
  local absolutePath = getCorrectPath(path)
  if absolutePath == nil then
    return -1
  end
  local file = io.open(absolutePath, "r")
  local line
  local jsonString = ""
  
  local function fastRead()
    local whileBreaker = 2000
    while 0 < whileBreaker do
      line = file:read("*l")
      if line == " \"properties\":" then
        break
      end
      whileBreaker = whileBreaker - 1
    end
    if whileBreaker == 0 then
      return false
    end
    whileBreaker = 2000
    while 0 < whileBreaker do
      line = file:read("*l")
      jsonString = jsonString .. line
      if line == "    }," then
        break
      end
      whileBreaker = whileBreaker - 1
    end
    if whileBreaker == 0 then
      return false
    end
    return true
  end
  
  local noSyntaxError, noFileError = pcall(fastRead)
  if noSyntaxError and noFileError and jsonString then
    io.close(file)
    local decodedJson = json.decode(jsonString)
    composer.debugger.debugPrint("filesystem", "getMapInfoFromFile json", decodedJson)
    return decodedJson
  else
    composer.debugger.debugPrint("filesystem", "getMapInfoFromFile file", file)
    io.close(file)
    return -1
  end
end

local function writeJsonToFile(path, object, callback)
  local function writeJson()
    composer.debugger.debugPrint("filesystem", "writeJsonToFile: " .. path, object)
    
    local absolutePath = system.pathForFile(path, system.CachesDirectory)
    local file = io.open(absolutePath, "w")
    file:write(object)
    io.close(file)
    file = nil
    if callback then
      callback()
    end
  end
  
  if not fileUtils.doesFileExist(path, system.CachesDirectory) then
    local lfs = require("lfs")
    local docs_path = system.pathForFile("", system.CachesDirectory)
    local success = lfs.chdir(docs_path)
    local folders = path:split("/")
    local success = lfs.chdir(docs_path)
    if success then
      local newFilePath = folders[1]
      lfs.mkdir(newFilePath)
      for i = 2, #folders - 1 do
        newFilePath = newFilePath .. "/" .. folders[i]
        lfs.mkdir(newFilePath)
      end
    end
  end
  writeJson()
end

local function ensureNeededDirectoriesExist(filepath)
  if not fileUtils.doesFileExist(filepath, system.CachesDirectory) then
    local lfs = require("lfs")
    local docs_path = system.pathForFile("", system.CachesDirectory)
    local folders = filepath:split("/")
    local success = lfs.chdir(docs_path)
    for i = 1, #folders - 1 do
      success = lfs.chdir(folders[i])
      if not success then
        break
      end
    end
    if success then
      return
    end
    local success = lfs.chdir(docs_path)
    if success then
      local newFilePath = folders[1]
      lfs.mkdir(newFilePath)
      for i = 2, #folders - 1 do
        newFilePath = newFilePath .. "/" .. folders[i]
        lfs.mkdir(newFilePath)
      end
    end
  end
end

M.getJsonFromFile = getJsonFromFile
M.writeJsonToFile = writeJsonToFile
M.getFile = getFile
M.isValidJson = isValidJson
M.ensureNeededDirectoriesExist = ensureNeededDirectoriesExist
M.getMapInfoFromFile = getMapInfoFromFile
return M
