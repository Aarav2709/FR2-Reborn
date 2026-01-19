local M = {}

function M.playerMessageName()
  return 0
end

function M.playerMessage()
  return 1
end

function M.joinGame()
  return 2
end

function M.leaveGame()
  return 3
end

function M.playerKicked()
  return 4
end

function M.startGame()
  return 5
end

function M.serverMessage()
  return 6
end

function M.changedMap()
  return 7
end

return M
