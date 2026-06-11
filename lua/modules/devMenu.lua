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
local sceneScrollView = nil
local sceneScrollMax = 0
local sceneScrollY = 0
local sceneScrollTargetY = 0
local sceneScrollHoverTimer = nil
local dragStartX = 0
local dragStartY = 0
local menuPosX = display.contentCenterX - (menuWidth * 0.5)
local menuPosY = display.contentCenterY - 100
local seedOverlayData = false
local hoverRows = {}
local lastMouseX = nil
local lastMouseY = nil
local toggleMenu

local clickSound = audio.loadSound("sound/sfx_button_press.wav")
local coinRewardModule = require("lua.modules.coinReward")
local promptGroup = nil
local promptField = nil

local function playClick()
    if clickSound then audio.play(clickSound) end
end

local function playCurrencyEffect(kind, amount)
    local scene = composer.getScene(composer.getSceneName("current"))
    local parent = scene and scene.view or display.getCurrentStage()
    local targetX = display.contentWidth - 40
    local targetY = 40
    if kind == "coins" then
        composer.audio.play("coins")
        local effect = coinRewardModule.createCoinReward(0, math.min(amount, 30), 1, true)
        if effect then
            local baseTargetX = 202
            local baseTargetY = display.contentHeight - 30
            effect.x = targetX - baseTargetX
            effect.y = targetY - baseTargetY
            parent:insert(effect)
            effect.animateCoins()
            timer.performWithDelay(2000, function()
                if effect.clean then effect.clean() end
                display.remove(effect)
            end)
        end
    elseif kind == "gems" then
        local group = display.newGroup()
        local icon = display.newImageRect(group, "images/gui/common/gem_small.png", 18, 18)
        icon.anchorX = 0
        icon.anchorY = 0.5
        local text = display.newText({
            parent = group,
            text = "+" .. tostring(amount),
            x = 22,
            y = 0,
            size = 14,
            color = { 1, 1, 1 }
        })
        text.anchorX = 0
        text.anchorY = 0.5
        group.x = targetX
        group.y = targetY
        parent:insert(group)
        transition.to(group, { time = 150, xScale = 1.1, yScale = 1.1 })
        transition.to(group, { time = 350, delay = 200, alpha = 0, y = targetY + 10, onComplete = function()
            display.remove(group)
        end })
    end
end

local function clearPrompt()
    if promptField then
        promptField:removeSelf()
        promptField = nil
    end
    if promptGroup then
        display.remove(promptGroup)
        promptGroup = nil
    end
end

local function showAmountPrompt(title, defaultValue, onApply)
    if promptGroup then
        clearPrompt()
    end
    promptGroup = display.newGroup()
    local overlay = display.newRect(promptGroup, display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    overlay:setFillColor(0, 0, 0, 0.6)
    overlay.isHitTestable = true
    overlay:addEventListener("tap", function() clearPrompt() return true end)

    local box = display.newRoundedRect(promptGroup, display.contentCenterX, display.contentCenterY, 220, 120, 6)
    box:setFillColor(0.12, 0.12, 0.12, 0.95)
    local label = display.newText({
        parent = promptGroup,
        text = title,
        x = display.contentCenterX,
        y = display.contentCenterY - 40,
        font = native.systemFontBold,
        fontSize = 12
    })
    label:setFillColor(1, 1, 1)

    promptField = native.newTextField(display.contentCenterX, display.contentCenterY - 10, 160, 26)
    promptField.text = tostring(defaultValue or "")
    promptField.inputType = "number"

    local okBtn = display.newRoundedRect(promptGroup, display.contentCenterX - 45, display.contentCenterY + 30, 70, 26, 4)
    okBtn:setFillColor(0.2, 0.53, 0.86, 1)
    local okText = display.newText({ parent = promptGroup, text = "OK", x = okBtn.x, y = okBtn.y, font = native.systemFontBold, fontSize = 12 })
    local cancelBtn = display.newRoundedRect(promptGroup, display.contentCenterX + 45, display.contentCenterY + 30, 70, 26, 4)
    cancelBtn:setFillColor(0.3, 0.3, 0.3, 1)
    local cancelText = display.newText({ parent = promptGroup, text = "Cancel", x = cancelBtn.x, y = cancelBtn.y, font = native.systemFontBold, fontSize = 12 })

    okBtn:addEventListener("tap", function()
        local value = tonumber(promptField and promptField.text) or defaultValue or 0
        clearPrompt()
        onApply(value)
        return true
    end)
    cancelBtn:addEventListener("tap", function()
        clearPrompt()
        return true
    end)
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
    if sceneScrollHoverTimer then
        timer.cancel(sceneScrollHoverTimer)
        sceneScrollHoverTimer = nil
    end
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

local function addRow(group, currentY, textStr, isHeader, hasArrow, onTap, colorOverride)
    local color = colorOverride or (isHeader and colHeader or colText)
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

local function isPointInMenu(x, y)
    if not menuGroup or not menuGroup.contentBounds then
        return false
    end
    local b = menuGroup.contentBounds
    return x >= b.xMin and x <= b.xMax and y >= b.yMin and y <= b.yMax
end

local function onGlobalTouch(event)
    if not menuOpen or not menuGroup then
        return false
    end
    if event.phase == "began" then
        if not isPointInMenu(event.x, event.y) then
            toggleMenu()
            return true
        end
    end
    return false
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
    sceneScrollTargetY = 0
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
    sceneScrollTargetY = 0
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

    currentY = addRow(menuGroup, currentY, "Add Coins", true, false, function()
        showAmountPrompt("Add Coins", 10000, function(amount)
            composer.database.setMoney(composer.database.getMoney() + amount)
            playCurrencyEffect("coins", amount)
            local marketScene = composer.getScene("lua.scenes.marketplace")
            if marketScene and marketScene.refreshMarketUI then marketScene.refreshMarketUI() end
        end)
    end)
    currentY = addSeparator(menuGroup, currentY)

    currentY = addRow(menuGroup, currentY, "Add Gems", true, false, function()
        showAmountPrompt("Add Gems", 100, function(amount)
            composer.database.setGems(composer.database.getGems() + amount)
            playCurrencyEffect("gems", amount)
            local marketScene = composer.getScene("lua.scenes.marketplace")
            if marketScene and marketScene.refreshMarketUI then marketScene.refreshMarketUI() end
        end)
    end)
    currentY = addSeparator(menuGroup, currentY)

    currentY = addRow(menuGroup, currentY, "Max Coins/Gems", true, false, function()
        composer.database.setMoney(9999999)
        composer.database.setGems(999999)
        playCurrencyEffect("coins", 30)
        playCurrencyEffect("gems", 30)
        local marketScene = composer.getScene("lua.scenes.marketplace")
        if marketScene and marketScene.refreshMarketUI then marketScene.refreshMarketUI() end
    end)
    currentY = addSeparator(menuGroup, currentY)

    currentY = addRow(menuGroup, currentY, "Reset Data", true, false, function()
        composer.database.reset()
        composer.database.createDefaultOfflinePlayer()
        composer.database.setAvatarData({ 1, 0, 0, 0, 0, 0, 0 }, false)
        composer.database.setItems({
            [1] = {},
            [2] = {},
            [3] = {},
            [4] = {},
            [5] = {},
            [6] = {},
            [7] = {}
        })
        local marketScene = composer.getScene("lua.scenes.marketplace")
        if marketScene and marketScene.refreshMarketUI then marketScene.refreshMarketUI() end
        local mainMenuScene = composer.getScene("lua.scenes.mainMenu")
        if mainMenuScene and mainMenuScene.refreshAvatarDisplay then
            mainMenuScene.refreshAvatarDisplay()
        end
    end, { 0.6, 0.1, 0.1, 1 })
    currentY = addSeparator(menuGroup, currentY)

    currentY = addRow(menuGroup, currentY, "Unlock All Items", true, false, function()
        local items = composer.database.getItems() or {}
        local store = composer.storeConfig
        if store and store.readFromFile then
            store.readFromFile()
        end
        local function addList(list)
            if not list then return end
            for i = 1, #list do
                local key = list[i].key
                if key and tonumber(key) and tonumber(key) ~= 0 then
                    items[tostring(key)] = {}
                end
            end
        end
        addList(store and store.getAllCharactersSortedOnPrice and store.getAllCharactersSortedOnPrice() or nil)
        addList(store and store.getAllHatsSortedOnPrice and store.getAllHatsSortedOnPrice() or nil)
        addList(store and store.getAllFacewearSortedOnPrice and store.getAllFacewearSortedOnPrice() or nil)
        addList(store and store.getAllNecksSortedOnPrice and store.getAllNecksSortedOnPrice() or nil)
        addList(store and store.getAllTrailsSortedOnPrice and store.getAllTrailsSortedOnPrice() or nil)
        addList(store and store.getAllFeetSortedOnPrice and store.getAllFeetSortedOnPrice() or nil)
        local avatars = store and store.getAllCharactersSortedOnPrice and store.getAllCharactersSortedOnPrice() or nil
        if avatars and store and store.getAllSkinsSortedOnPrice then
            for i = 1, #avatars do
                local avatarKey = avatars[i].key
                if avatarKey and tonumber(avatarKey) and tonumber(avatarKey) ~= 0 then
                    addList(store.getAllSkinsSortedOnPrice(avatarKey))
                end
            end
        end
        composer.database.setItems(items)
        local marketScene = composer.getScene("lua.scenes.marketplace")
        if marketScene and marketScene.refreshMarketUI then marketScene.refreshMarketUI() end
    end)
    currentY = addSeparator(menuGroup, currentY)


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

toggleMenu = function()
    menuOpen = not menuOpen
    playClick()
    if menuOpen then
        buildMenu()
        Runtime:addEventListener("touch", onGlobalTouch)
    else
        Runtime:removeEventListener("touch", onGlobalTouch)
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

        local scrollSensitivity = 18
        local scrollTime = 220
        sceneScrollTargetY = sceneScrollTargetY - (event.scrollY * scrollSensitivity)

        if sceneScrollTargetY < -sceneScrollMax then
            sceneScrollTargetY = -sceneScrollMax
        elseif sceneScrollTargetY > 0 then
            sceneScrollTargetY = 0
        end

        sceneScrollY = sceneScrollTargetY
        sceneScrollView:scrollToPosition({
            y = sceneScrollTargetY,
            time = scrollTime,
            transition = easing.outQuad
        })

        if sceneScrollHoverTimer then
            timer.cancel(sceneScrollHoverTimer)
            sceneScrollHoverTimer = nil
        end
        sceneScrollHoverTimer = timer.performWithDelay(scrollTime, function()
            sceneScrollHoverTimer = nil
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
