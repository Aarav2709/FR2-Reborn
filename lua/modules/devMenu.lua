local composer = require("composer")
local lfs = require("lfs")
local widget = require("widget")

local M = {}

local fontName = native.systemFontBold
local fontSize = 12
local rowHeight = 22
local menuWidth = 220
local paddingX = 8

local colTitleBg = { 0.2, 0.53, 0.86, 1 }
local colMenuBg = { 0.08, 0.08, 0.08, 0.95 }
local colText = { 1, 1, 1, 1 }
local colHeader = { 1, 0.78, 0, 1 }
local colLine = { 0.3, 0.3, 0.3, 1 }
local menuOpen = false
local menuGroup = nil
local scenesExpanded = false
local overlaysExpanded = false
local sceneItems = {}
local overlayItems = {}
local lastSceneName = nil
local placeholdersEnabled = false
local buttonsEnabled = false
local sceneScrollView = nil
local sceneScrollMax = 0
local sceneScrollY = 0
local dragStartX = 0
local dragStartY = 0
local menuPosX = display.contentCenterX - (menuWidth * 0.5)
local menuPosY = display.contentCenterY - 100
local seedOverlayData = false
local hoverRows = {}
local lastMouseX = nil
local lastMouseY = nil

local clickSound = audio.loadSound("sound/sfx_button_press.wav")

local function playClick()
    if clickSound then audio.play(clickSound) end
end

local function refreshSceneList()
    sceneItems = {}
    local scenePath = system.pathForFile("lua/scenes", system.ResourceDirectory)
    if not scenePath then return end
    for file in lfs.dir(scenePath) do
        if file ~= "." and file ~= ".." and file:sub(-4) == ".lua" then
            sceneItems[#sceneItems + 1] = file:sub(1, -5)
        end
    end
    table.sort(sceneItems)
end

local function refreshOverlayList()
    overlayItems = {}
    local overlayPath = system.pathForFile("lua/overlays", system.ResourceDirectory)
    if not overlayPath then return end
    for file in lfs.dir(overlayPath) do
        if file ~= "." and file ~= ".." and file:sub(-4) == ".lua" then
            if file ~= "customOverlay.lua" then
                local fullPath = overlayPath .. "\\" .. file
                local fh = io.open(fullPath, "r")
                if fh then
                    local content = fh:read("*a")
                    fh:close()
                    if content and content:find("composer%.newScene") and content:find("return%s+scene") then
                        overlayItems[#overlayItems + 1] = file:sub(1, -5)
                    end
                end
            end
        end
    end
    table.sort(overlayItems)
end

local function clearMenu()
    if menuGroup then
        display.remove(menuGroup)
        menuGroup = nil
        sceneScrollView = nil
    end
    hoverRows = {}
end

local function addSeparator(group, currentY)
    local lineY = currentY + 2
    local line = display.newLine(group, 0, lineY, menuWidth, lineY)
    line:setStrokeColor(unpack(colLine))
    line.strokeWidth = 1
    return currentY + 5
end

local function addRow(group, currentY, textStr, isHeader, hasArrow, onTap)
    local color = isHeader and colHeader or colText
    local rowGroup = display.newGroup()
    group:insert(rowGroup)

    local t = display.newText({
        parent = rowGroup,
        text = textStr,
        x = paddingX,
        y = currentY + (rowHeight * 0.5),
        font = fontName,
        fontSize = fontSize
    })
    t.anchorX, t.anchorY = 0, 0.5
    t:setFillColor(unpack(color))

    if hasArrow then
        local arrowSize = 4
        local arrowX = menuWidth - paddingX - arrowSize
        local arrowY = currentY + (rowHeight * 0.5)
        local rotation = scenesExpanded and 90 or 0
        local arrow = display.newPolygon(rowGroup, arrowX, arrowY, { 0,-arrowSize, arrowSize,0, 0,arrowSize })
        arrow:setFillColor(1, 1, 1)
        arrow.rotation = rotation
    end

    if onTap then
        local hit = display.newRect(rowGroup, menuWidth * 0.5, currentY + (rowHeight * 0.5), menuWidth, rowHeight)
        hit.isVisible = false
        hit.isHitTestable = true
        hit:addEventListener("tap", function()
            playClick()
            onTap()
            return true
        end)
    end

    return currentY + rowHeight
end

local function buildSceneList(parent, startY)
    local listHeight = math.min(#sceneItems * rowHeight, 150)

    sceneScrollView = widget.newScrollView({
        width = menuWidth,
        height = listHeight,
        horizontalScrollDisabled = true,
        hideBackground = true,
        top = startY,
        left = 0,
        backgroundColor = {0,0,0,0.2}
    })
    parent:insert(sceneScrollView)

    local contentY = 0
    local current = composer.getSceneName("current")
    hoverRows = {}

    for i = 1, #sceneItems do
        local sceneName = sceneItems[i]
        local fullName = "lua.scenes." .. sceneName
        local isSelected = (current == fullName)

        local row = display.newGroup()
        local hover = display.newRect(row, menuWidth * 0.5, contentY + (rowHeight * 0.5), menuWidth, rowHeight)
        hover.isHitTestable = false
        hover:setFillColor(0.4, 0.4, 0.4)
        hover.alpha = 0

        local label = display.newText({
            parent = row,
            text = isSelected and (sceneName .. " *") or sceneName,
            x = paddingX * 2,
            y = contentY + (rowHeight * 0.5),
            font = fontName,
            fontSize = fontSize
        })
        label.anchorX = 0
        label:setFillColor(unpack(colText))

        local hit = display.newRect(row, menuWidth * 0.5, contentY + (rowHeight * 0.5), menuWidth, rowHeight)
        hit.isVisible = false
        hit.isHitTestable = true
        hit:addEventListener("tap", function()
            playClick()
            composer.gotoScene(fullName)
            return true
        end)

        sceneScrollView:insert(row)
        contentY = contentY + rowHeight
        hoverRows[#hoverRows + 1] = hover
    end

    sceneScrollMax = math.max(0, contentY - listHeight)
    sceneScrollY = 0
    return startY + listHeight
end

local function buildOverlayList(parent, startY)
    local listHeight = math.min(#overlayItems * rowHeight, 150)

    sceneScrollView = widget.newScrollView({
        width = menuWidth,
        height = listHeight,
        horizontalScrollDisabled = true,
        hideBackground = true,
        top = startY,
        left = 0,
        backgroundColor = {0,0,0,0.2}
    })
    parent:insert(sceneScrollView)

    local contentY = 0
    hoverRows = {}
    for i = 1, #overlayItems do
        local overlayName = overlayItems[i]
        local fullName = "lua.overlays." .. overlayName
        local row = display.newGroup()
        local hover = display.newRect(row, menuWidth * 0.5, contentY + (rowHeight * 0.5), menuWidth, rowHeight)
        hover.isHitTestable = false
        hover:setFillColor(0.4, 0.4, 0.4)
        hover.alpha = 0
        local label = display.newText({
            parent = row,
            text = overlayName,
            x = paddingX * 2,
            y = contentY + (rowHeight * 0.5),
            font = fontName,
            fontSize = fontSize
        })
        label.anchorX = 0
        label:setFillColor(unpack(colText))

        local hit = display.newRect(row, menuWidth * 0.5, contentY + (rowHeight * 0.5), menuWidth, rowHeight)
        hit.isVisible = false
        hit.isHitTestable = true
        hit:addEventListener("tap", function()
            playClick()
            if seedOverlayData then
                composer.data = composer.data or {}
                if overlayName == "chat" then
                    composer.data.chatLog = composer.data.chatLog or {}
                    if #composer.data.chatLog == 0 then
                        composer.data.chatLog = {
                            { message = "Hello from dev menu", username = "Player", playerId = 1 },
                            { message = "Overlay preview", username = "Dev", playerId = 2 }
                        }
                    end
                end
            end
            local params = {}
            if overlayName == "customPlayModeSelect" then
                params.setGameModeFunction = function() end
            elseif overlayName == "marketFree" then
                params.item = {
                    title = "Dev Item",
                    plate = "1",
                    imagePath = "images/gui/market/items/hat/301.png"
                }
                params.onCloseFunction = function() end
            elseif overlayName == "weeklyPrizes" then
                params.prize = {
                    { i = 1, a = 100 },
                    { i = 301, a = 1 }
                }
            elseif overlayName == "spinPrize" then
                params.rewardThatIsWon = { type = "coins", image = "prizeCoins2.png" }
                params.rewardValue = 100
            elseif overlayName == "todaysChallenges" then
                composer.todayChallenges = composer.todayChallenges or {}
                composer.todayChallenges.time = 3600
                composer.todayChallenges.data = {
                    ["1"] = { p = 0, c = 0 },
                    ["2"] = { p = 0.5, c = 0 }
                }
            end
            composer.showOverlay(fullName, { isModal = true, params = params })
            return true
        end)

        sceneScrollView:insert(row)
        contentY = contentY + rowHeight
        hoverRows[#hoverRows + 1] = hover
    end

    sceneScrollMax = math.max(0, contentY - listHeight)
    sceneScrollY = 0
    return startY + listHeight
end

local function buildMenu()
    clearMenu()

    menuGroup = display.newGroup()
    menuGroup.x, menuGroup.y = menuPosX, menuPosY
    menuGroup.alpha = 0
    menuGroup.xScale, menuGroup.yScale = 0.9, 0.9

    local currentY = 0
    local bgRect = display.newRect(menuGroup, 0, 0, menuWidth, 100)
    bgRect.anchorX, bgRect.anchorY = 0, 0
    bgRect:setFillColor(unpack(colMenuBg))

    currentY = addRow(menuGroup, currentY, "Scenes", true, true, function()
        scenesExpanded = not scenesExpanded
        buildMenu()
    end)

    if scenesExpanded then
        currentY = buildSceneList(menuGroup, currentY)
    end
    currentY = addSeparator(menuGroup, currentY)

    currentY = addRow(menuGroup, currentY, "Overlays", true, true, function()
        overlaysExpanded = not overlaysExpanded
        buildMenu()
    end)
    if overlaysExpanded then
        currentY = buildOverlayList(menuGroup, currentY)
    end
    currentY = addSeparator(menuGroup, currentY)

    currentY = addRow(menuGroup, currentY, "DevTools", true, false, function()
        if composer.devTools then
            if composer.devTools.enabled then composer.devTools.disable() else composer.devTools.enable() end
        end
    end)
    currentY = addSeparator(menuGroup, currentY)

    currentY = addRow(menuGroup, currentY, "PostLobby UI", true, false, function()
        placeholdersEnabled = not placeholdersEnabled
        local scene = composer.getScene(composer.getSceneName("current"))
        if scene and scene.setPostLobbyPlaceholdersVisible then scene.setPostLobbyPlaceholdersVisible(placeholdersEnabled) end
    end)
    currentY = addSeparator(menuGroup, currentY)

    currentY = addRow(menuGroup, currentY, "PostLobby Buttons", true, false, function()
        buttonsEnabled = not buttonsEnabled
        local scene = composer.getScene(composer.getSceneName("current"))
        if scene and scene.setPostLobbyButtonsVisible then scene.setPostLobbyButtonsVisible(buttonsEnabled) end
    end)
    currentY = addSeparator(menuGroup, currentY)

    currentY = addRow(menuGroup, currentY, "Seed Overlay Data", true, false, function()
        seedOverlayData = not seedOverlayData
    end)
    currentY = addSeparator(menuGroup, currentY)

    currentY = addRow(menuGroup, currentY, "Back", true, false, function()
        if lastSceneName then composer.gotoScene(lastSceneName) end
    end)

    bgRect.height = currentY + 4

    local titleHeight = 24
    local titleBg = display.newRect(menuGroup, 0, -titleHeight, menuWidth, titleHeight)
    titleBg.anchorX, titleBg.anchorY = 0, 0
    titleBg:setFillColor(unpack(colTitleBg))
    titleBg.isHitTestable = true

    local titleText = display.newText({
        parent = menuGroup,
        text = "Debug",
        x = paddingX,
        y = -titleHeight * 0.5,
        font = fontName,
        fontSize = fontSize
    })
    titleText.anchorX = 0

    local function onDrag(event)
        if event.phase == "began" then
            display.getCurrentStage():setFocus(titleBg)
            titleBg.isFocus = true
            dragStartX = event.x - menuGroup.x
            dragStartY = event.y - menuGroup.y
        elseif titleBg.isFocus and event.phase == "moved" then
            menuGroup.x = event.x - dragStartX
            menuGroup.y = event.y - dragStartY
        else
            display.getCurrentStage():setFocus(nil)
            titleBg.isFocus = false
            menuPosX = menuGroup.x
            menuPosY = menuGroup.y
        end
        return true
    end
    titleBg:addEventListener("touch", onDrag)

    transition.to(menuGroup, { time = 200, alpha = 1, xScale = 1, yScale = 1, transition = easing.outBack })
    menuGroup:toFront()
end

local function toggleMenu()
    menuOpen = not menuOpen
    playClick()
    if menuOpen then
        buildMenu()
    else
        if menuGroup then
            transition.to(menuGroup, { time = 150, alpha = 0, xScale = 0.9, yScale = 0.9, transition = easing.inQuad, onComplete = clearMenu })
        end
    end
end

local function onKey(event)
    if event.phase ~= "down" then
        return false
    end
    if event.isRepeat then
        return false
    end
    local key = event.keyName
    if key == "/" or key == "slash" or key == "kpDivide" or key == "numpadDivide" or key == "keypadDivide" then
        toggleMenu()
        return true
    end
    return false
end

function M.init()
    refreshSceneList()
    refreshOverlayList()
    Runtime:addEventListener("key", onKey)
    Runtime:addEventListener("mouse", function(event)
        if event.type == "move" then
            lastMouseX, lastMouseY = event.x, event.y
            if menuOpen and hoverRows then
                for i = 1, #hoverRows do
                    local rect = hoverRows[i]
                    if rect and rect.contentBounds then
                        local b = rect.contentBounds
                        rect.alpha = (lastMouseX >= b.xMin and lastMouseX <= b.xMax and lastMouseY >= b.yMin and lastMouseY <= b.yMax) and 0.2 or 0
                    end
                end
            end
            return false
        end

        if not menuOpen or not sceneScrollView or not event.scrollY then
            return false
        end

        local svB = sceneScrollView.contentBounds
        if not (event.x >= svB.xMin and event.x <= svB.xMax and event.y >= svB.yMin and event.y <= svB.yMax) then
            return false
        end

        local scrollSensitivity = 25
        sceneScrollY = sceneScrollY - (event.scrollY * scrollSensitivity)

        if sceneScrollY < -sceneScrollMax then
            sceneScrollY = -sceneScrollMax
        elseif sceneScrollY > 0 then
            sceneScrollY = 0
        end

        sceneScrollView:scrollToPosition({
            y = sceneScrollY,
            time = 80,
            transition = easing.outQuad
        })

        timer.performWithDelay(1, function()
            if not hoverRows then return end
            for i = 1, #hoverRows do
                local rect = hoverRows[i]
                if rect and rect.contentBounds then
                    local b = rect.contentBounds
                    rect.alpha = (lastMouseX >= b.xMin and lastMouseX <= b.xMax and lastMouseY >= b.yMin and lastMouseY <= b.yMax) and 0.2 or 0
                end
            end
        end)

        return true
    end)
end

M.init()

return M
