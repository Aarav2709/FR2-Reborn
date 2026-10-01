-- This build collects no analytics. The game still reports events through
-- composer.analytics.newEvent, so the API stays in place and does nothing.
local M = {}

function M.newEvent(category, params)
end

function M.setNewBuildVersion(version)
end

return M
