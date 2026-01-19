local composer = require("composer")
local showDebugPrint = false

function composer.debugPrint(title, text)
  if showDebugPrint then
    print(title, " ", text)
  end
end
