local composer = require("composer")
local layoutGroup = require("lua.modules.layoutGroup")
local scene = composer.newScene()
local clean, cleanEnter
local backgroundImage, buttonStickBottom, window, buttonStickTop
local btnNextZone, btnPrevZone, btnBack, mapIconsGroup
local layoutLobbyPractice, resizeListener
local uiGroup, updateUiGroup
local UI_BASE_W, UI_BASE_H

function scene:create(event)
  local screenGroup = self.view
  UI_BASE_W = display.contentWidth
  UI_BASE_H = display.contentHeight
  uiGroup, updateUiGroup = layoutGroup.new(screenGroup, UI_BASE_W, UI_BASE_H)
    local startedClean = false
    mapIconsGroup = display.newGroup()
    local practiceButtons = {}
    local practiceButtonsText = {}
    local iconsPerPage = 6
    local iconWidth = 88
    local iconHeight = 90
    local lookingAtZone = 1
    local numberOfMaps = composer.mapHandler.getNumberOfMaps()
    local maksZones = math.ceil(numberOfMaps / iconsPerPage)
    backgroundImage = display.newImageRect("images/gui/common/bgBlur.png", 1920, 1080)
    buttonStickBottom = display.newImageRect("images/gui/practice/bottom.png", 42, 45)
    window = display.newImageRect("images/gui/practice/window.png", 440, 240)
    buttonStickTop = display.newImageRect("images/gui/practice/top.png", 22, 14)

    local function startGameOnId(id)
        composer.data.gameInfo.players[1] = {
            username = composer.database.getPlayerInformation().username,
            avatar = composer.database.getAvatarData(),
            playerId = composer.database.getPlayerInformation().playerId
        }

        local botAI = require("lua.ai.botPlayer")
        local difficulty = composer.data.gameInfo.difficulty or 2
        local bots = botAI.createBots(difficulty)

        for i = 1, #bots do
            composer.data.gameInfo.players[i + 1] = bots[i]
        end

        composer.data.gameInfo.gameType = 0
        composer.data.gameInfo.map = id
        composer.gotoScene("lua.scenes.gamePlay")
    end

    local function addMapIcons()
        local iconPositions = {
            [1] = { x = 335, y = 215 }, -- STUMPY SLOPES
            [2] = { x = 480, y = 215 }, -- BOUNCY FOREST
            [3] = { x = 625, y = 215 }, -- THORNY SCRUB
            [4] = { x = 335, y = 315 }, -- SPEED MEADOW
            [5] = { x = 480, y = 315 }, -- HASTY HILLS
            [6] = { x = 625, y = 315 } -- FOREST FALL
        }
        local textPositions = {
            [1] = { x = 335, y = 250 }, -- STUMPY SLOPES
            [2] = { x = 480, y = 250 }, -- BOUNCY FOREST
            [3] = { x = 625, y = 250 }, -- THORNY SCRUB
            [4] = { x = 335, y = 350 }, -- SPEED MEADOW
            [5] = { x = 480, y = 350 }, -- HASTY HILLS
            [6] = { x = 625, y = 350 } -- FOREST FALL
        }
        for i = 1, numberOfMaps do
            local baseZone = math.ceil(i / iconsPerPage)
            local basePos = i % iconsPerPage
            if basePos == 0 then
                basePos = iconsPerPage
            end
            local mapData = composer.data.getMapInfo(i)
            if not mapData then
                print("WARNING: NO DATA FOR MAP NR: ", i)
                return
            end

            local function startGame()
                startGameOnId(i)
            end

            local imagePath = "images/gui/practice/icon" .. i .. ".png"
            local testImage = display.newImage(imagePath)
            if not testImage then
                local mapTheme = mapData.theme
                imagePath = "images/gui/practice/default" .. mapTheme .. ".png"
            else
                testImage:removeSelf()
                testImage = nil
            end
            practiceButtons[i] = composer.newButton({
                image = imagePath,
                width = iconWidth,
                height = iconHeight,
                onRelease = startGame,
                x = -100,
                y = -100
            })
            if mapData.name then
                practiceButtonsText[i] = composer.newText({
                    string = mapData.name,
                    size = 14,
                    x = -100,
                    y = -100
                })
            end
            local iconPos = iconPositions[basePos]
            local textPos = textPositions[basePos]
            if iconPos then
                local padding = (baseZone - 1) * UI_BASE_W
                practiceButtons[i].x = iconPos.x + padding
                practiceButtons[i].y = iconPos.y
                if practiceButtonsText[i] and textPos then
                    practiceButtonsText[i].x = textPos.x + padding
                    practiceButtonsText[i].y = textPos.y
                end
            end
            mapIconsGroup:insert(practiceButtons[i])
            mapIconsGroup:insert(practiceButtonsText[i])
        end
        for i = 1, numberOfMaps do
            if practiceButtonsText[i] then
                practiceButtonsText[i]:toFront()
            end
        end
    end

    local function btnPrevZoneRelease()
        lookingAtZone = lookingAtZone - 1
        if lookingAtZone == 1 then
            btnPrevZone.isVisible = false
        end
        if lookingAtZone < maksZones then
            btnNextZone.isVisible = true
        end
        local newXPos = -1 * (lookingAtZone - 1) * UI_BASE_W
        transition.to(mapIconsGroup, { time = 200, x = newXPos })
    end

    btnPrevZone = composer.newButton({
        image = "images/gui/practice/left.png",
        width = 45,
        height = 45,
        onRelease = btnPrevZoneRelease,
        x = 0,
        y = 0
    })

    local function btnNextZoneRelease()
        lookingAtZone = lookingAtZone + 1
        if 1 < lookingAtZone then
            btnPrevZone.isVisible = true
        end
        if lookingAtZone >= maksZones then
            btnNextZone.isVisible = false
        end
        local newXPos = -1 * (lookingAtZone - 1) * UI_BASE_W
        transition.to(mapIconsGroup, { time = 200, x = newXPos })
    end

    btnNextZone = composer.newButton({
        image = "images/gui/practice/right.png",
        width = 45,
        height = 45,
        onRelease = btnNextZoneRelease,
        x = 0,
        y = 0
    })

    local function btnBackRelease()
        composer.gotoScene("lua.scenes.mainMenu")
        composer.removeScene("lua.scenes.lobbyPractice")
    end

    btnBack = composer.newButton({
        image = "images/gui/common/buttonHome.png",
        width = 90,
        height = 57,
        onRelease = btnBackRelease,
        x = 0,
        y = 0
    })

    layoutLobbyPractice = function()
        local screenLeft = display.screenOriginX
        local screenTop = display.screenOriginY
        local screenWidth = display.actualContentWidth
        local screenHeight = display.actualContentHeight
        local screenCenterX = screenLeft + screenWidth * 0.5
        local screenCenterY = screenTop + screenHeight * 0.5

        local contentLeft = 0
        local contentTop = 0
        local contentWidth = UI_BASE_W
        local contentHeight = UI_BASE_H
        local centerX = UI_BASE_W * 0.5

        if backgroundImage then
            backgroundImage.x = screenCenterX
            backgroundImage.y = screenCenterY
            backgroundImage.xScale = 1
            backgroundImage.yScale = 1
            local scale = math.max(screenWidth / backgroundImage.width, screenHeight / backgroundImage.height)
            backgroundImage.xScale = scale
            backgroundImage.yScale = scale
        end
        if buttonStickBottom then
            buttonStickBottom.x = centerX
            buttonStickBottom.y = contentTop + contentHeight * 0.8
        end
        if window and buttonStickBottom then
            window.x = buttonStickBottom.x
            window.y = buttonStickBottom.y - window.height * 0.55
        end
        if buttonStickTop and window then
            buttonStickTop.x = window.x
            buttonStickTop.y = window.y - window.height * 0.51
        end
        if mapIconsGroup then
            mapIconsGroup.x = 0
            mapIconsGroup.y = 0
        end
        if btnPrevZone then
            btnPrevZone.x = contentLeft + contentWidth * (116 / 480)
            btnPrevZone.y = contentTop + contentHeight * (140 / 320)
        end
        if btnNextZone then
            btnNextZone.x = contentLeft + contentWidth * (364 / 480)
            btnNextZone.y = contentTop + contentHeight * (140 / 320)
        end
        if btnBack then
            btnBack.x = 120
            btnBack.y = 385
        end
    end

    local function updateDisplay()
        screenGroup:insert(1, backgroundImage)
        uiGroup:insert(buttonStickBottom)
        uiGroup:insert(buttonStickTop)
        uiGroup:insert(window)
        uiGroup:insert(mapIconsGroup)
        uiGroup:insert(btnNextZone)
        uiGroup:insert(btnPrevZone)
        uiGroup:insert(btnBack)
    end

    function clean()
        startedClean = true
        display.remove(btnBack)
        display.remove(btnNextZone)
        display.remove(btnPrevZone)
        for i = 1, #practiceButtons do
            display.remove(practiceButtons[i])
        end
    end

    updateDisplay()
    addMapIcons()
    if lookingAtZone == 1 then
        btnPrevZone.isVisible = false
    end
    if maksZones == lookingAtZone then
        btnNextZone.isVisible = false
    end
    if layoutLobbyPractice then
        layoutLobbyPractice()
    end
end

function scene:show(event)
    local phase = event.phase
    local screenGroup = self.view
    if phase == "will" then
        return
    end
    local androidLogic = require("lua.modules.androidBackButton")

    function cleanEnter()
        androidLogic.removeBackButton()
    end

  resizeListener = function()
    if updateUiGroup then
      updateUiGroup()
    end
        if layoutLobbyPractice then
            layoutLobbyPractice()
        end
    end
    Runtime:addEventListener("resize", resizeListener)
    resizeListener()

    androidLogic.addBackButton("lua.scenes.playMenu", "lua.scenes.lobbyPractice")
end

function scene:hide(event)
    local phase = event.phase
    if phase == "will" then
        if cleanEnter then
            cleanEnter()
            cleanEnter = nil
        end
    elseif phase == "did" then
        if resizeListener then
            Runtime:removeEventListener("resize", resizeListener)
            resizeListener = nil
        end
    end
end

function scene:destroy(event)
    if clean then
        clean()
        clean = nil
    end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
