---@meta

---@class DisplayObject
---@field x number
---@field y number
---@field width number
---@field height number
---@field xScale number
---@field yScale number
---@field rotation number
---@field alpha number
---@field isVisible boolean
---@field anchorX number
---@field anchorY number
---@field removeSelf fun(self: DisplayObject)
---@field toFront fun(self: DisplayObject)
---@field toBack fun(self: DisplayObject)
---@field insert fun(self: DisplayObject, child: DisplayObject)
---@field setFillColor fun(self: DisplayObject, ...)

---@class DisplayGroup: DisplayObject

---@class Display
---@field contentWidth number
---@field contentHeight number
---@field actualContentWidth number
---@field actualContentHeight number
---@field screenOriginX number
---@field screenOriginY number
---@field viewableContentWidth number
---@field viewableContentHeight number
---@field HiddenStatusBar number
---@field newImageRect fun(...): DisplayObject
---@field newImage fun(...): DisplayObject
---@field newGroup fun(): DisplayGroup
---@field newRect fun(...): DisplayObject
---@field loadRemoteImage fun(...)
---@field remove fun(obj: DisplayObject|nil)
---@field setStatusBar fun(mode: number)

---@type Display
display = display or {}

---@class RuntimeClass
---@field addEventListener fun(self: RuntimeClass, eventName: string, listener: function)
---@field removeEventListener fun(self: RuntimeClass, eventName: string, listener: function)
---@type RuntimeClass
Runtime = Runtime or {}

system = system or {
  getInfo = function(...) end,
  openURL = function(...) end,
  pathForFile = function(...) end,
  setIdleTimer = function(...) end
}

timer = timer or {
  performWithDelay = function(...) end,
  cancel = function(...) end
}

transition = transition or {
  to = function(...) end,
  cancel = function(...) end
}

audio = audio or {
  loadSound = function(...) end,
  play = function(...) end,
  setSessionProperty = function(...) end,
  supportsSessionProperty = false,
  MixMode = 0,
  AmbientMixMode = 0
}

native = native or {
  showAlert = function(...) end,
  cancelAlert = function(...) end,
  setProperty = function(...) end,
  newWebView = function(...) end,
  requestExit = function(...) end
}

network = network or {
  request = function(...) end
}

physics = physics or {
  start = function(...) end,
  stop = function(...) end,
  addBody = function(...) end,
  removeBody = function(...) end
}

graphics = graphics or {}

easing = easing or {}

widget = widget or {}

composer = composer or {
  newScene = function(...) end,
  gotoScene = function(...) end,
  showOverlay = function(...) end,
  removeScene = function(...) end,
  getSceneName = function(...) end,
  getScene = function(...) end,
  setVariable = function(...) end,
  getVariable = function(...) end,
  data = {}
}

json = json or {}

---@class sqlite3_db
---@field exec fun(self: sqlite3_db, sql: string): any
---@field nrows fun(self: sqlite3_db, sql: string): fun(): table
---@field close fun(self: sqlite3_db)

---@class sqlite3
---@field open fun(path: string): sqlite3_db
sqlite3 = sqlite3 or {}

lfs = lfs or {}

crypto = crypto or {}

mime = mime or {}

ltn12 = ltn12 or {}

socket = socket or {}

CoronaEnvironment = CoronaEnvironment or {}

application = application or {}

---@class PluginNotifications
---@field scheduleNotification fun(time: number, options: table): any
---@field cancelNotification fun(id: any)
---@field cancelAllNotifications fun()
---@field registerForPushNotifications fun()
plugin = plugin or {}
plugin.notifications = plugin.notifications or {}

---@class Store
store = store or {}

facebook = facebook or {}
