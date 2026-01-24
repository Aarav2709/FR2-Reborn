local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter, httpsCallback
local background, layoutSettings, resizeListener

function scene:create(event)
    local group = self.view
    local httpsFormat = require("lua.network.httpsMessageFormat")
    local tableHelper = require("lua.modules.tableHelper")
    local settingsTable, settingsList, creditsTable, infoTable
    local creditsTableData = {}
    local infoTableData = {}
    local buttonsGroup
    local useButtonsGroup = true
    local startedClean = false
    local scrollTimer
    background = display.newImageRect("images/gui/settings/main.png", 911, 412)
    background.anchorX = 0
    background.anchorY = 0
    background.x = -1
    background.y = -2
    layoutSettings = function()
        group.x = 0
        group.y = 0
        if background then
            background.xScale = 1
            background.yScale = 1
            background.x = -1
            background.y = -2
        end
        if tableBackground then
            tableBackground.x = 331
            tableBackground.y = 169
        end
    end
    local username = composer.newText({
        string = "",
        size = 35,
        color = {
            1,
            1,
            1
        }
    })
    username.anchorX = 0.5
    username.anchorY = 0.5
    username.x = 180
    username.y = 26
    local usernameTag = composer.newText({
        string = "",
        size = 35,
        color = {
            1,
            1,
            1
        }
    })
    usernameTag.anchorX = 0
    usernameTag.anchorY = 0.5
    usernameTag.x = 220
    usernameTag.y = 26
    local tableTitleText = composer.newText({
        string = composer.localized.get("Settings"),
        size = 30,
        color = {
            1,
            1,
            1
        }
    })
    tableTitleText.x = 783
    tableTitleText.y = 16
    local tableBackground = display.newImageRect("images/gui/ranking/cell.png", 960, 640)
    tableBackground.x = 331
    tableBackground.y = 169

    local function updateUsername()
        local playerInfo = composer.database.getPlayerInformation()
        if playerInfo.usernameCode then
            local name = playerInfo.username or ""
            local code = tostring(playerInfo.usernameCode)
            local suffix = "#" .. code
            if #name >= #suffix and name:sub(-#suffix) == suffix then
                name = name:sub(1, #name - #suffix)
                if name:sub(-1) == " " then
                    name = name:sub(1, -2)
                end
            end
            username.text = name
            usernameTag.text = suffix
        else
            username.text = ""
            usernameTag.text = ""
        end
        usernameTag.x = 220
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
        x = 120,
        y = 385
    })

    local function editNameButtonEvent()
        composer.showOverlay("lua.overlays.editUsername", { isModal = true })
    end

    local editNameButton = composer.newButton({
        x = 350,
        y = 26,
        width = 45,
        height = 42,
        image = "images/gui/settings/buttonRename.png",
        onRelease = editNameButtonEvent
    })

    buttonsGroup = display.newGroup()
    buttonsGroup.x = 730
    buttonsGroup.y = 100

    local function setButtonsGrouped(isGrouped)
        useButtonsGroup = not not isGrouped
    end

    local function updateDisplayGroup()
        group:insert(1, tableBackground)
        group:insert(2, background)
        if settingsTable and settingsTable.getTable then
            local settingsTableView = settingsTable.getTable()
            if useButtonsGroup then
                if settingsTableView and settingsTableView.parent ~= buttonsGroup then
                    buttonsGroup:insert(settingsTableView)
                end
                group:insert(buttonsGroup)
            else
                group:insert(settingsTableView)
            end
        end
        if creditsTable and creditsTable.getTable then
            group:insert(creditsTable.getTable())
        end
        if infoTable and infoTable.getTable then
            group:insert(infoTable.getTable())
        end
        group:insert(username)
        group:insert(usernameTag)
        if useButtonsGroup then
            group:insert(buttonsGroup)
        end
        group:insert(homeButton)
        group:insert(editNameButton)
        group:insert(tableTitleText)
        if creditsTable and creditsTable.getTable then
            creditsTable.getTable():toFront()
        end
        if infoTable and infoTable.getTable then
            infoTable.getTable():toFront()
        end
        if useButtonsGroup and buttonsGroup then
            buttonsGroup:toFront()
        end
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

    settingsTable = tableHelper.new(0, 0, 150, 283, 38, "images/scenes/market/table.png", "settings", tableCallback)

    local function updateSettingsList()
        if composer.data.playerInfo.email then
            settingsList = {
                { sound = true, onClick = onSoundClick },
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
                { sound = true, onClick = onSoundClick },
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
        local targetGroup = group
        if useButtonsGroup and buttonsGroup then
            targetGroup = buttonsGroup
        end
        settingsTable.refreshTable(settingsList, targetGroup, 1)
        updateDisplayGroup()
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
        creditsTableData[#creditsTableData + 1] = { creditInfo = name }
        if specialSize then
            creditsTableData[#creditsTableData].size = specialSize
        end
    end

    local headerFontSize = 20
    local itemFontSize = 15
    addToCredits("")
    addToCredits("FR2-Reborn V: " .. composer.config.fullVersion, headerFontSize)
    addToCredits("")
    addToCredits(composer.localized.get("Credits"), headerFontSize)
    addToCredits("Malik Johnson", itemFontSize)
    addToCredits("Aarav Gupta", itemFontSize)
    addToCredits("UncBuddy", itemFontSize)

    local function creditsTableCallback()
    end

    local function scrollCredits()
        if startedClean then
            return
        end
    end

    local function createCredits()
        creditsTable = tableHelper.new(10, 80, 300, 283, 22, nil, "credits", creditsTableCallback)
        creditsTable.createTable(creditsTableData, group)
    end

    local function createInfoTable()
        infoTable = tableHelper.new(240, 102, 300, 283, 22, nil, "credits", creditsTableCallback)
        infoTable.createTable(infoTableData, group)
    end

    function clean()
        startedClean = true
        display.remove(buttonsGroup)
        display.remove(homeButton)
        display.remove(editNameButton)
        if scrollTimer then
            timer.cancel(scrollTimer)
            scrollTimer = nil
        end
        if creditsTable then
            creditsTable.cleanTable()
        end
        if infoTable then
            infoTable.cleanTable()
        end
        if settingsTable then
            settingsTable.cleanTable()
        end
    end

    updateSettingsList()
    checkForFacebook()
    checkForLogout()
    infoTableData[#infoTableData + 1] = { creditInfo = "NOTES", size = headerFontSize }
    infoTableData[#infoTableData + 1] = { creditInfo = "" }
    infoTableData[#infoTableData + 1] = { creditInfo = "Made for Fun Run 2 lovers" }
    infoTableData[#infoTableData + 1] = { creditInfo = "Who wanted to feel a bit of" }
    infoTableData[#infoTableData + 1] = { creditInfo = "nostalgia." }
    infoTableData[#infoTableData + 1] = { creditInfo = "" }
    infoTableData[#infoTableData + 1] = { creditInfo = "You asked for it, you got it." }
    createCredits()
    createInfoTable()
    composer.comm.setCallback(tcpCallback)
    composer.commHttps.setCallback(httpsCallback)
    settingsTable.createTable(settingsList, group)
    updateDisplayGroup()
    updateUsername()
    scrollTimer = timer.performWithDelay(2000, scrollCredits, 1)
    if layoutSettings then
        layoutSettings()
    end
    scene.setButtonsGrouped = setButtonsGrouped
end

function scene:show(event)
    local phase = event.phase
    if phase == "will" then
        return
    end
    local group = self.view
    local androidLogic = require("lua.modules.androidBackButton")

    resizeListener = function()
        if layoutSettings then
            layoutSettings()
        end
    end
    Runtime:addEventListener("resize", resizeListener)
    resizeListener()

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
    if resizeListener then
        Runtime:removeEventListener("resize", resizeListener)
        resizeListener = nil
    end
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
