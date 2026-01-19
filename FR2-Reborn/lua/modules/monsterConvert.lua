local M = {}
local composer = require("composer")

function M.toServerFormat(avatarData)
  local data = {}
  data.a = avatarData[1]
  data.b = avatarData[2]
  data.c = avatarData[3]
  data.d = avatarData[4]
  data.e = avatarData[5]
  data.f = avatarData[6]
  data.g = avatarData[7]
  return data
end

function M.fromServerFormat(data)
  local avatarData = {}
  avatarData[1] = data.a
  avatarData[2] = data.b
  avatarData[3] = data.c
  avatarData[4] = data.d
  avatarData[5] = data.e
  avatarData[6] = data.f
  avatarData[7] = data.g
  return avatarData
end

composer.monsterConverter = M
