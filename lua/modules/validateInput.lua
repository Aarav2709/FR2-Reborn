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

M.validateUsername = validateUsername
M.validateEmail = validateEmail
M.validatePassword = validatePassword
M.validateMonsterName = validateMonsterName
M.limitTextField = limitTextField
M.validateUsernameSearch = validateUsernameSearch
composer.validateInput = M
