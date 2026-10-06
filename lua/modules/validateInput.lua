local composer = require("composer")
local M = {}

local function validateUsername(text)
  if text then
    text = string.gsub(text, "%s", "")
    if string.len(text) < 1 then
      return nil, composer.localized.get("EnterUsername")
    elseif string.len(text) < 2 then
      return nil, composer.localized.get("UsernameTooShort")
    elseif string.len(text) > 15 then
      return nil, composer.localized.get("Username too long. ")
    elseif string.gsub(text, "[^%a%d]", "") ~= text then
      return nil, composer.localized.get("ValidCharacterMessage")
    else
      return text
    end
  else
    return nil, composer.localized.get("Enter Username")
  end
end

local function validateUsernameWithTag(text)
  if not text then
    return nil, composer.localized.get("EnterUsername")
  end
  text = string.gsub(text, "%s", "")
  local name, tag = text:match("^([^#]*)#(.*)$")
  if not name then
    name = text
  end
  local validName, nameError = validateUsername(name)
  if not validName then
    if nameError == composer.localized.get("ValidCharacterMessage") then
      nameError = composer.localized.get("Use letters and numbers, with a #tag if you like (Aarav#2709)")
    end
    return nil, nameError
  end
  if tag then
    if not tag:match("^%d%d?%d?%d?$") then
      return nil, composer.localized.get("The tag after # is 1 to 4 numbers (Aarav#2709)")
    end
    return validName, tonumber(tag)
  end
  return validName, nil
end

local function validateUsernameSearch(text)
  if text then
    text = string.gsub(text, "%s", "")
    if string.len(text) < 2 then
      return nil, composer.localized.get("Username too short, minimum 2 characters")
    elseif string.len(text) > 15 then
      return nil, composer.localized.get("Username too long, max 15 characters")
    elseif text:match("[A-Za-z0-9]+#[0-9]") then
      local usernameTable = {}
      text:split("#", usernameTable)
      return usernameTable
    elseif string.gsub(text, "[^%a%d]", "") == text then
      return {text, nil}
    else
      return nil, composer.localized.get("Username can only contain letters, numbers and #")
    end
  else
  end
end

local function validateEmail(text)
  if text then
    text = string.gsub(text, "%s", "")
    if string.len(text) <= 5 then
      return nil, composer.localized.get("Invalid email")
    elseif text:match("[A-Za-z0-9%.%%%+%-]+@[A-Za-z0-9%.%%%+%-]+%.%w%w%w?%w?") then
      return text
    else
      return nil, composer.localized.get("Invalid email")
    end
  else
    return nil, composer.localized.get("Enter Email")
  end
end

local function validatePassword(text)
  if text then
    if string.len(text) <= 2 then
      return nil, composer.localized.get("Password too short")
    else
      return text
    end
  else
    return nil, composer.localized.get("Enter Password")
  end
end

local function validateMonsterName(text)
  if text then
    text = string.gsub(text, "%s", "")
    if string.len(text) < 3 then
      return nil, composer.localized.get("Too short, minimum 3 characters")
    elseif string.len(text) > 15 then
      return nil, composer.localized.get("Too long, max 15 characters")
    elseif string.gsub(text, "[^%a%d]", "") ~= text then
      return nil, composer.localized.get("Only letters and numbers")
    else
      return text
    end
  else
    return nil, composer.localized.get("Enter Name")
  end
end

local function limitTextField(length)
  length = length or 1000
  return function(event)
    if event.text and string.len(event.text) > length then
      event.target.text = event.text:sub(1, length)
    end
    if "ended" == event.phase then
    elseif "submitted" == event.phase then
      native.setKeyboardFocus(nil)
    end
  end
end

local function stripUsernameCode(fullUsername)
  if not fullUsername then
    return ""
  end

  local nameOnly = fullUsername:gsub("#%d+$", "")
  return nameOnly
end

M.validateUsername = validateUsername
M.validateUsernameWithTag = validateUsernameWithTag
M.validateEmail = validateEmail
M.validatePassword = validatePassword
M.validateMonsterName = validateMonsterName
M.limitTextField = limitTextField
M.validateUsernameSearch = validateUsernameSearch
M.stripUsernameCode = stripUsernameCode
composer.validateInput = M
