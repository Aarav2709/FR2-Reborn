local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter, httpsCallback

function scene:create(event)
  local group = self.view
  local httpsFormat = require("lua.network.httpsMessageFormat")
  local tableHelper = require("lua.modules.tableHelper")
  local settingsTable, settingsList, creditsTable
  local creditsTableData = {}
  local startedClean = false
  local scrollTimer
  local background = display.newImageRect("images/gui/settings/main.png", 480, 320)
  background.anchorX = 0
  background.anchorY = 0
  background.x = 0
  background.y = 0
  local username = composer.newText({
    string = "",
    size = 25,
    color = {
      1,
      1,
      1
    }
  })
  username.anchorX = 0.5
  username.anchorY = 0.5
  username.x = 160
  username.y = 20
  local usernameTag = composer.newText({
    string = "",
    size = 25,
    color = {
      1,
      1,
      1
    }
  })
  usernameTag.anchorX = 0
  usernameTag.anchorY = 0.5
  usernameTag.x = username.x
  usernameTag.y = username.y
  local tableTitleText = composer.newText({
    string = composer.localized.get("Settings"),
    size = 30,
    color = {
      1,
      1,
      1
    }
  })
  tableTitleText.x = 410
  tableTitleText.y = 16
  local tableBackground = display.newImageRect("images/gui/ranking/cell.png", 480, 320)
  tableBackground.x = display.contentWidth * 0.5
  tableBackground.y = display.contentHeight * 0.5
  
  local function updateUsername()
    local playerInfo = composer.database.getPlayerInformation()
    if playerInfo.usernameCode then
      username.text = playerInfo.username
      usernameTag.text = "#" .. playerInfo.usernameCode
    else
      username.text = ""
      usernameTag.text = ""
    end
    usernameTag.x = username.x + username.width * 0.5
  end
  
  local function homeButtonEvent()
    composer.gotoScene("lua.scenes.mainMenu")
    composer.removeScene("lua.scenes.settings")
  end
  
  local homeButton = composer.newButton({
    image = "images/gui/common/buttonHome.png",
    width = 90,
    height = 57,
    onRelease = homeButtonEvent,
    x = 50,
    y = 292
  })
  
  local function editNameButtonEvent()
    composer.showOverlay("lua.overlays.editUsername", {isModal = true})
  end
  
  local editNameButton = composer.newButton({
    x = 75,
    y = 35,
    width = 45,
    height = 42,
    image = "images/gui/settings/buttonRename.png",
    onRelease = editNameButtonEvent
  })
  
  local function updateDisplayGroup()
    group:insert(tableBackground)
    group:insert(creditsTable.getTable())
    group:insert(background)
    group:insert(username)
    group:insert(usernameTag)
    group:insert(editNameButton)
    group:insert(tableTitleText)
    group:insert(homeButton)
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
  
  local function onMusicClick()
    local oldState = composer.database.getSound()
    if oldState == 1 then
      composer.database.setSound(0)
      composer.analytics.newEvent("design", {
        event_id = "music:deactivate",
        area = composer.config.fullVersion
      })
    else
      composer.database.setSound(1)
      composer.analytics.newEvent("design", {
        event_id = "music:activate",
        area = composer.config.fullVersion
      })
    end
    settingsTable.refreshTable()
  end
  
  local function onSoundClick()
    local oldState = composer.database.getSound()
    if oldState == 1 then
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
  
  local function onViolenceClick()
    local oldState = composer.database.getViolence()
    print("Old violence state", oldState)
    if oldState == 1 then
      composer.database.setViolence(0)
      composer.analytics.newEvent("design", {
        event_id = "violence:deactivate",
        area = composer.config.fullVersion
      })
    else
      composer.database.setViolence(1)
      composer.analytics.newEvent("design", {
        event_id = "violence:activate",
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
      composer.facebook.login({
        "user_friends"
      })
    end
    settingsTable.refreshTable()
  end
  
  local function onAccountClick()
    composer.showOverlay("lua.overlays.editAccountData", {isModal = true})
  end
  
  local function onEmailClick()
    composer.showOverlay("lua.overlays.editEmail", {isModal = true})
  end
  
  local function onPasswordClick()
    composer.showOverlay("lua.overlays.editPassword", {isModal = true})
  end
  
  local function onLogoutClick()
    composer.showOverlay("lua.overlays.logout", {isModal = true})
  end
  
  local function onPushClick()
    composer.showOverlay("lua.overlays.editNotificationSettings", {isModal = true})
  end
  
  settingsTable = tableHelper.new(356, 37, 150, 283, 38, "images/scenes/market/table.png", "settings", tableCallback)
  
  local function updateSettingsList()
    if composer.data.playerInfo.email then
      settingsList = {
        {sound = true, onClick = onSoundClick},
        {
          facebook = true,
          onClick = onFacebookClick,
          text = composer.localized.get("Connect")
        },
        {
          tutorial = true,
          onClick = onTutorialClick,
          text = composer.localized.get("Tutorial")
        },
        {
          email = true,
          onClick = onEmailClick,
          text = composer.localized.get("EditEmail")
        },
        {
          password = true,
          onClick = onPasswordClick,
          text = composer.localized.get("EditPassword")
        },
        {
          push = true,
          onClick = onPushClick,
          text = composer.localized.get("Notifications")
        },
        {
          logout = true,
          onClick = onLogoutClick,
          text = composer.localized.get("Logout")
        }
      }
    else
      settingsList = {
        {sound = true, onClick = onSoundClick},
        {
          tutorial = true,
          onClick = onTutorialClick,
          text = composer.localized.get("Tutorial")
        },
        {
          facebook = true,
          onClick = onFacebookClick,
          text = composer.localized.get("Connect")
        },
        {
          account = true,
          onClick = onAccountClick,
          text = composer.localized.get("AccountInfo")
        },
        {
          push = true,
          onClick = onPushClick,
          text = composer.localized.get("Notifications")
        },
        {
          logout = true,
          onClick = onLogoutClick,
          text = composer.localized.get("Logout")
        }
      }
    end
  end
  
  local function checkForFacebook()
    if composer.database.getFacebookId() then
      for i = 1, #settingsList do
        if settingsList[i].facebook then
          table.remove(settingsList, i)
          return
        end
      end
    end
  end
  
  local function checkForLogout()
    if not composer.data.playerInfo.email and not composer.database.getFacebookId() and not isSimulator then
      for i = 1, #settingsList do
        if settingsList[i].logout then
          table.remove(settingsList, i)
          return
        end
      end
    end
  end
  
  function scene:overlayEnded(data)
    updateSettingsList()
    settingsTable.refreshTable(settingsList, group, 1)
  end
  
  function httpsCallback(data)
    print(data.m)
    if data.m == httpsFormat.changeUsername() then
      updateUsername()
    elseif data.m == httpsFormat.registerFacebook() then
      updateSettingsList()
      checkForFacebook()
      settingsTable.refreshTable(settingsList, group, 1)
    end
  end
  
  local function tcpCallback(data)
  end
  
  local function addToCredits(name, specialSize)
    creditsTableData[#creditsTableData + 1] = {creditInfo = name}
    if specialSize then
      creditsTableData[#creditsTableData].size = specialSize
    end
  end
  
  local headerFontSize = 20
  local itemFontSize = 15
  addToCredits("")
  addToCredits("Fun Run 2 V: " .. composer.config.fullVersion, headerFontSize)
  addToCredits("")
  addToCredits("facebook.com/funrungame", itemFontSize)
  addToCredits("@TheFunRun", itemFontSize)
  addToCredits("#funrun2", itemFontSize)
  addToCredits("/r/funrun", itemFontSize)
  addToCredits("")
  addToCredits(composer.localized.get("Credits"), headerFontSize)
  addToCredits("")
  addToCredits("Dirtybit", headerFontSize)
  addToCredits("Erlend B. Haugsdal", itemFontSize)
  addToCredits("Nicolaj B. Petersen", itemFontSize)
  addToCredits("Martin N. Vagstad", itemFontSize)
  addToCredits("Fredrik Fors Hansen", itemFontSize)
  addToCredits("Matthew Guise", itemFontSize)
  addToCredits("Ida Vilhelmiina Oltedal", itemFontSize)
  addToCredits("Aleksander Aa. Elvemo", itemFontSize)
  addToCredits("Aurora K. Berg", itemFontSize)
  addToCredits("Anne Marte Markussen", itemFontSize)
  addToCredits("Maxime Montera", itemFontSize)
  addToCredits("Kasper K. Berg", itemFontSize)
  addToCredits("")
  addToCredits(composer.localized.get("Sound design"), headerFontSize)
  addToCredits("Martin Kvale", itemFontSize)
  addToCredits("")
  addToCredits(composer.localized.get("Character Assets"), headerFontSize)
  addToCredits("Vellko Pajko", itemFontSize)
  addToCredits("")
  addToCredits(composer.localized.get("SpecialThanks"), headerFontSize)
  addToCredits("Helene E. Wiik", itemFontSize)
  addToCredits("Mirna Besirovic", itemFontSize)
  addToCredits("Benedicte H. St\195\184rksen", itemFontSize)
  addToCredits("Torstein Berteig", itemFontSize)
  addToCredits("Silje Valla", itemFontSize)
  addToCredits("James Portnow", itemFontSize)
  addToCredits("")
  addToCredits("")
  addToCredits("")
  addToCredits("")
  addToCredits("Dirtybit.com", headerFontSize)
  addToCredits("")
  addToCredits("")
  addToCredits("")
  addToCredits("")
  addToCredits("")
  addToCredits("")
  addToCredits("")
  addToCredits("")
  
  local function creditsTableCallback()
  end
  
  local function scrollCredits()
    if startedClean then
      return
    end
  end
  
  local function createCredits()
    creditsTable = tableHelper.new(15, 45, 300, 283, 22, nil, "credits", creditsTableCallback)
    creditsTable.createTable(creditsTableData, group)
  end
  
  function clean()
    startedClean = true
    display.remove(homeButton)
    display.remove(editNameButton)
    if scrollTimer then
      timer.cancel(scrollTimer)
      scrollTimer = nil
    end
    if creditsTable then
      creditsTable.cleanTable()
    end
    if settingsTable then
      settingsTable.cleanTable()
    end
  end
  
  updateSettingsList()
  checkForFacebook()
  checkForLogout()
  createCredits()
  updateDisplayGroup()
  composer.comm.setCallback(tcpCallback)
  composer.commHttps.setCallback(httpsCallback)
  settingsTable.createTable(settingsList, group)
  updateUsername()
  scrollTimer = timer.performWithDelay(2000, scrollCredits, 1)
end

function scene:show(event)
  local phase = event.phase
  if phase == "will" then
    return
  end
  local group = self.view
  local androidLogic = require("lua.modules.androidBackButton")
  
  function cleanEnter()
    androidLogic.removeBackButton()
  end
  
  androidLogic.addBackButton("lua.scenes.mainMenu", "lua.scenes.settings")
end

function scene:hide(event)
  local phase = event.phase
  if phase == "did" then
    return
  end
  local group = self.view
  if cleanEnter then
    cleanEnter()
  end
end

function scene:destroy(event)
  local group = self.view
  if clean then
    clean()
  end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
