local composer = require("composer")
local screen = require("lua.modules.screen")
local seasonal = require("lua.modules.seasonalModule")
local scene = composer.newScene()
local clean, cleanEnter, httpsCallback
local layoutSettings, resizeListener

local ART_W, ART_H = 480, 320
local art = { sx = 1, sy = 1, ui = 1 }

local function updateArt()
  screen.update()
  art.sx = screen.width / ART_W
  art.sy = screen.height / ART_H
  art.ui = math.min(art.sx, art.sy)
end

local function artX(x)
  return screen.left + x * art.sx
end

local function artY(y)
  return screen.top + y * art.sy
end

local BOARD_FILL_X, BOARD_FILL_Y, BOARD_FILL_W, BOARD_FILL_H = 45, 85, 260, 145
local BOARD_LEFT, BOARD_SPLIT, BOARD_RIGHT = 50, 176, 300
local BOARD_TOP, BOARD_BOTTOM = 92, 226
local TEXT_ROW_H = 19
local PANEL_LEFT = 352
local BUTTON_W, BUTTON_ROW_H = 120, 38

function scene:create(event)
  local group = self.view
  local httpsFormat = require("lua.network.httpsMessageFormat")
  local tableHelper = require("lua.modules.tableHelper")
  local settingsTable, settingsList, creditsTable
  local creditsTableData = {}
  local startedClean = false
  local offline = composer.config.offlineMode
  local runningFps = display.fps == 30 and 30 or 60
  local savedFps = tonumber(system.getPreference("app", "preferredFps", "number"))
  local currentFps = (savedFps == 30 or savedFps == 60) and savedFps or runningFps
  local onFpsClick, updateSettingsList

  local function fpsText()
    local text = currentFps .. " " .. composer.localized.get("FPS")
    if currentFps ~= runningFps then
      text = text .. " (" .. composer.localized.get("Restart") .. ")"
    end
    return text
  end
  updateArt()
  local textUi = art.ui

  local scenery = display.newImageRect(group, seasonal.blurredBackground(), 1920, 1080)
  local boardFill = display.newImageRect(group, "images/gui/ranking/cell.png", BOARD_FILL_W, BOARD_FILL_H)
  boardFill.anchorX, boardFill.anchorY = 0, 0
  local background = display.newImageRect(group, "images/gui/settings/main.png", ART_W, ART_H)
  background.anchorX, background.anchorY = 0, 0

  local username = composer.newText({ string = "", size = 25 * textUi, color = { 1, 1, 1 } })
  username.anchorX, username.anchorY = 0, 0.5
  group:insert(username)
  local usernameTag = composer.newText({ string = "", size = 25 * textUi, color = { 1, 1, 1 } })
  usernameTag.anchorX, usernameTag.anchorY = 0, 0.5
  group:insert(usernameTag)
  local tableTitleText = composer.newText({
    string = composer.localized.get("Settings"),
    size = 30 * textUi,
    color = { 1, 1, 1 }
  })
  group:insert(tableTitleText)

  local tablesGroup = display.newGroup()
  group:insert(tablesGroup)

  local function homeButtonEvent()
    composer.gotoScene("lua.scenes.mainMenu")
  end

  local homeButton = composer.newButton({
    image = "images/gui/common/buttonHome.png",
    width = 90,
    height = 57,
    onRelease = homeButtonEvent,
    x = 0,
    y = 0
  })
  group:insert(homeButton)

  local function editNameButtonEvent()
    composer.showOverlay("lua.overlays.editUsername", { isModal = true })
  end

  local editNameButton = composer.newButton({
    x = 0,
    y = 0,
    width = 45,
    height = 42,
    image = "images/gui/settings/buttonRename.png",
    onRelease = editNameButtonEvent
  })
  group:insert(editNameButton)

  local function layoutUsername()
    local ui = art.ui
    local left = artX(62)
    local right = editNameButton.x - 26 * ui
    local nameWidth = username.width
    local total = nameWidth + usernameTag.width
    local scale = ui / textUi
    if total * scale > right - left and total > 0 then
      scale = (right - left) / total
    end
    username.xScale, username.yScale = scale, scale
    usernameTag.xScale, usernameTag.yScale = scale, scale
    local startX = (left + right) * 0.5 - total * scale * 0.5
    username.x, username.y = startX, artY(21)
    usernameTag.x, usernameTag.y = startX + nameWidth * scale, artY(21)
  end

  local function updateUsername()
    local playerInfo = composer.database.getPlayerInformation()
    local name, suffix = "", ""
    if playerInfo.usernameCode then
      name = playerInfo.username or ""
      suffix = "#" .. tostring(playerInfo.usernameCode)
      if #name >= #suffix and name:sub(-#suffix) == suffix then
        name = name:sub(1, #name - #suffix)
        if name:sub(-1) == " " then
          name = name:sub(1, -2)
        end
      end
    end
    username.text = name
    usernameTag.text = suffix
    layoutUsername()
  end

  local function tableCallback(data)
  end

  local function onTutorialClick()
    composer.onboarding.init()
    composer.onboarding.activate()
    composer.onboarding.settingsOverride = true
    composer.onboarding.setStep("1")
    composer.onboarding.activateStep()
  end

  local function onSoundClick()
    if composer.database.getSound() == 1 then
      composer.database.setSound(0)
      composer.analytics.newEvent("design", {
        event_id = "sound:deactivate",
        area = composer.config.fullVersion
      })
    else
      composer.database.setSound(1)
      composer.analytics.newEvent("design", {
        event_id = "sound:activate",
        area = composer.config.fullVersion
      })
    end
    settingsTable.refreshTable()
  end

  local function onFacebookClick()
    if not composer.database.getFacebookId() then
      composer.analytics.newEvent("design", {
        event_id = "facebookLogin:attempt",
        area = composer.config.fullVersion
      })
      composer.facebook.login({ "user_friends" })
    end
    settingsTable.refreshTable()
  end

  local function onAccountClick()
    composer.showOverlay("lua.overlays.editAccountData", { isModal = true })
  end

  local function onEmailClick()
    composer.showOverlay("lua.overlays.editEmail", { isModal = true })
  end

  local function onPasswordClick()
    composer.showOverlay("lua.overlays.editPassword", { isModal = true })
  end

  local function onLogoutClick()
    composer.showOverlay("lua.overlays.logout", { isModal = true })
  end

  local function onPushClick()
    composer.showOverlay("lua.overlays.editNotificationSettings", { isModal = true })
  end

  local function pcRows()
    local pcSettings = require("lua.modules.pcSettings")
    local function refresh()
      updateSettingsList()
      settingsTable.refreshTable(settingsList, tablesGroup)
    end
    local function bindKey(action)
      return function()
        composer.capturingKey = function(key)
          if key ~= "escape" then
            pcSettings.setKey(action, key)
          end
          refresh()
        end
        refresh()
      end
    end
    local function keyRow(action, label)
      local text = label .. ": " .. pcSettings.keyLabel(action)
      if composer.capturingKey then
        text = label .. ": ..."
      end
      return { pcKey = true, text = text, onClick = bindKey(action) }
    end
    return {
      { pcDisplay = true, text = pcSettings.isFullscreen() and "Fullscreen" or "Windowed", onClick = function()
        pcSettings.toggleFullscreen()
        refresh()
      end },
      { pcSize = true, text = "Window " .. pcSettings.sizeLabel(), onClick = function()
        pcSettings.cycleSize()
        refresh()
      end },
      { pcVolume = true, text = "Volume " .. pcSettings.volumePercent() .. "%", onClick = function()
        pcSettings.cycleVolume()
        refresh()
      end },
      keyRow("jump", "Jump"),
      keyRow("power", "Power up")
    }
  end

  updateSettingsList = function()
    if offline then
      settingsList = {
        { sound = true, onClick = onSoundClick },
        { fps = true, text = fpsText(), onClick = onFpsClick },
        {
          tutorial = true,
          onClick = onTutorialClick,
          text = composer.localized.get("Tutorial")
        }
      }
      if require("lua.modules.pcMode").isPC then
        for i, row in ipairs(pcRows()) do
          table.insert(settingsList, 2 + i, row)
        end
      end
      return
    end
    settingsList = {
      { sound = true, onClick = onSoundClick },
      { fps = true, text = fpsText(), onClick = onFpsClick },
      {
        tutorial = true,
        onClick = onTutorialClick,
        text = composer.localized.get("Tutorial")
      },
      {
        facebook = true,
        onClick = onFacebookClick,
        text = composer.localized.get("Connect")
      }
    }
    if composer.data.playerInfo.email then
      settingsList[#settingsList + 1] = { email = true, onClick = onEmailClick, text = composer.localized.get("EditEmail") }
      settingsList[#settingsList + 1] = { password = true, onClick = onPasswordClick, text = composer.localized.get("EditPassword") }
    else
      settingsList[#settingsList + 1] = { account = true, onClick = onAccountClick, text = composer.localized.get("AccountInfo") }
    end
    settingsList[#settingsList + 1] = { push = true, onClick = onPushClick, text = composer.localized.get("Notifications") }
    settingsList[#settingsList + 1] = { logout = true, onClick = onLogoutClick, text = composer.localized.get("Logout") }
    if composer.database.getFacebookId() then
      for i = #settingsList, 1, -1 do
        if settingsList[i].facebook then
          table.remove(settingsList, i)
        end
      end
    end
    if not composer.data.playerInfo.email and not composer.database.getFacebookId() then
      for i = #settingsList, 1, -1 do
        if settingsList[i].logout then
          table.remove(settingsList, i)
        end
      end
    end
  end

  onFpsClick = function()
    local previousFps = currentFps
    currentFps = currentFps == 60 and 30 or 60
    local ok, saved = pcall(system.setPreferences, "app", { preferredFps = currentFps })
    if not ok or not saved then
      currentFps = previousFps
      native.showAlert(composer.localized.get("Frame rate"), composer.localized.get("Could not save the frame rate."),
        { composer.localized.get("Ok") })
      return
    end
    updateSettingsList()
    settingsTable.refreshTable(settingsList, tablesGroup)
    if currentFps == runningFps then
      return
    end
    local message = composer.localized.get("The game runs at") .. " " .. currentFps .. " " ..
      composer.localized.get("FPS from the next start.")
    local canClose = system.getInfo("platform") == "android" or system.getInfo("platform") == "win32"
    if canClose and not isSimulator then
      native.showAlert(composer.localized.get("Frame rate"), message,
        { composer.localized.get("Later"), composer.localized.get("Close game") }, function(event)
          if event.action == "clicked" and event.index == 2 then
            require("lua.modules.saveData").backup()
            native.requestExit()
          end
        end)
    else
      native.showAlert(composer.localized.get("Frame rate"), message, { composer.localized.get("Ok") })
    end
  end

  local headerFontSize = 16
  local itemFontSize = 12

  local function addToCredits(name, size, detail)
    creditsTableData[#creditsTableData + 1] = { creditInfo = name, size = size or itemFontSize, x = 4, detail = detail }
  end

  addToCredits("FR2: Reborn", headerFontSize, "v1.1.0")
  addToCredits("")
  addToCredits("Developers", headerFontSize)
  addToCredits("Aarav Gupta", itemFontSize, "Creator & Frontend")
  addToCredits("Malik Johnson", itemFontSize, "Backend")
  addToCredits("Rambo", itemFontSize, "Decompilation")
  addToCredits("Rocxteady", itemFontSize, "iOS Support")
  addToCredits("")
  addToCredits("Testers", headerFontSize)
  for _, tester in ipairs({ "Fop", "ProtogenX3", "Graves737", "abe", "chucho", "ElkerMage", "LionBot" }) do
    addToCredits(tester)
  end

  local NOTES_TITLE = "Notes"
  local NOTES_TEXT = "Made by Fun Run 2 fans, for Fun Run 2 fans.\n\n"
    .. "You asked for it, you got it!\n\n"
    .. "A fan made project, not affiliated with Dirtybit."
  local notesGroup

  local function creditsTableCallback()
  end

  local function panelCenterX()
    local right = math.min(screen.right, screen.safeRight) - 4
    return (artX(PANEL_LEFT) + right) * 0.5
  end

  local function buildTables()
    local ui = art.ui
    if settingsTable then
      settingsTable.cleanTable()
    end
    if creditsTable then
      creditsTable.cleanTable()
    end
    display.remove(notesGroup)
    local top = artY(BOARD_TOP)
    local height = artY(BOARD_BOTTOM) - top
    creditsTable = tableHelper.new(artX(BOARD_LEFT), top, artX(BOARD_SPLIT) - artX(BOARD_LEFT), height,
      TEXT_ROW_H * ui, nil, "credits", creditsTableCallback, nil, ui)
    creditsTable.createTable(creditsTableData, tablesGroup)
    notesGroup = display.newGroup()
    tablesGroup:insert(notesGroup)
    local notesLeft = artX(BOARD_SPLIT) + 4 * ui
    local notesWidth = artX(BOARD_RIGHT) - notesLeft - 6 * ui
    local title = composer.newText({ string = NOTES_TITLE, size = headerFontSize * ui, ax = 0, ay = 0.5 })
    title.x, title.y = notesLeft, top + TEXT_ROW_H * ui * 0.5
    notesGroup:insert(title)
    local body = composer.newText({ string = NOTES_TEXT, size = itemFontSize * ui, width = notesWidth, ax = 0, ay = 0 })
    body.x, body.y = notesLeft, top + TEXT_ROW_H * ui + 2 * ui
    notesGroup:insert(body)
    local room = top + height - body.y - 4 * ui
    if body.height > room then
      body.xScale, body.yScale = room / body.height, room / body.height
    end
    local buttonsTop = artY(40)
    settingsTable = tableHelper.new(panelCenterX() - BUTTON_W * 0.5 * ui, buttonsTop, (BUTTON_W + 2) * ui,
      screen.bottom - buttonsTop, BUTTON_ROW_H * ui, nil, "settings", tableCallback, 10 * ui, ui)
    settingsTable.createTable(settingsList, tablesGroup)
  end

  layoutSettings = function()
    updateArt()
    local ui = art.ui
    screen.cover(scenery)
    background.x, background.y = screen.left, screen.top
    background.xScale, background.yScale = art.sx, art.sy
    boardFill.x, boardFill.y = artX(BOARD_FILL_X), artY(BOARD_FILL_Y)
    boardFill.xScale, boardFill.yScale = art.sx, art.sy
    local titleScale = ui / textUi
    local bannerWidth = (ART_W - 340) * art.sx
    if tableTitleText.width * titleScale > bannerWidth then
      titleScale = bannerWidth / tableTitleText.width
    end
    tableTitleText.xScale, tableTitleText.yScale = titleScale, titleScale
    tableTitleText.x = (artX(340) + math.min(screen.right, screen.safeRight)) * 0.5
    tableTitleText.y = artY(17)
    editNameButton.xScale, editNameButton.yScale = ui, ui
    editNameButton.x, editNameButton.y = artX(262) - 22 * ui, artY(22)
    homeButton.xScale, homeButton.yScale = ui, ui
    homeButton.x = screen.safeLeft + 50 * ui
    homeButton.y = screen.bottom - 30 * ui
    layoutUsername()
    buildTables()
  end

  function scene:overlayEnded(data)
    updateSettingsList()
    updateUsername()
    buildTables()
  end

  function httpsCallback(data)
    if data.m == httpsFormat.changeUsername() then
      updateUsername()
    elseif data.m == httpsFormat.registerFacebook() then
      updateSettingsList()
      buildTables()
    end
  end

  local function tcpCallback(data)
  end

  function clean()
    startedClean = true
    display.remove(homeButton)
    display.remove(editNameButton)
    if creditsTable then
      creditsTable.cleanTable()
    end
    display.remove(notesGroup)
    if settingsTable then
      settingsTable.cleanTable()
    end
  end

  updateSettingsList()
  composer.comm.setCallback(tcpCallback)
  composer.commHttps.setCallback(httpsCallback)
  layoutSettings()
  updateUsername()
end

function scene:show(event)
  if event.phase == "will" then
    return
  end
  local androidLogic = require("lua.modules.androidBackButton")
  if not resizeListener then
    resizeListener = function()
      if layoutSettings then
        layoutSettings()
      end
    end
    Runtime:addEventListener("resize", resizeListener)
  end

  function cleanEnter()
    androidLogic.removeBackButton()
  end

  androidLogic.addBackButton("lua.scenes.mainMenu", "lua.scenes.settings")
end

function scene:hide(event)
  if event.phase == "will" then
    if resizeListener then
      Runtime:removeEventListener("resize", resizeListener)
      resizeListener = nil
    end
    if cleanEnter then
      cleanEnter()
    end
  elseif event.phase == "did" then
    composer.removeScene("lua.scenes.settings")
  end
end

function scene:destroy(event)
  if resizeListener then
    Runtime:removeEventListener("resize", resizeListener)
    resizeListener = nil
  end
  if clean then
    clean()
  end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
