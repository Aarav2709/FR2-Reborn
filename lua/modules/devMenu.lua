local composer = require("composer")
local lfs = require("lfs")

local M = {}
local menuGroup
local panel
local headerBar
local title
local scenesButton
local devToolsButton
local placeholdersButton
local postLobbyButtonsButton
local backButton
local resizeHandle
local scenesContainer
local scenesGroup
local sceneItems = {}
local scenesContainerHasListener = false
local isOpen = false
local isScenesOpen = false
local placeholdersVisible = true
local postLobbyButtonsVisible = true
local resizeListener
local isDragging = false
local dragOffsetX = 0
local dragOffsetY = 0
local isResizing = false
local resizeStartX = 0
local resizeStartY = 0
local resizeStartW = 0
local resizeStartH = 0
local panelWidth = 360
local panelHeight = 260
local headerHeight = 28
local scenesScrollY = 0
local scenesMaxScroll = 0
local isScrolling = false
local scrollStartY = 0
local scrollStartOffset = 0
local lastSceneName
local onScenesScroll
local onScenesWheel

local function setDevUI(obj)
    if obj then
        obj._isDevUI = true
    end
end

local function listScenes()
    local scenes = {}
    local basePath = system.pathForFile("lua/scenes", system.ResourceDirectory)
    if not basePath then
        return scenes
    end

    for file in lfs.dir(basePath) do
        if file:match("%.lua$") then
            local name = file:gsub("%.lua$", "")
            scenes[#scenes + 1] = "lua.scenes." .. name
        end
    end

    table.sort(scenes)
    return scenes
end

local function clearSceneItems()
    for i = 1, #sceneItems do
        if sceneItems[i] then
            pcall(function() sceneItems[i]:removeSelf() end)
            sceneItems[i] = nil
        end
    end
    sceneItems = {}
end

local function buildSceneList(container, startX, startY, maxHeight)
    if not scenesContainer then
        scenesContainer = display.newContainer(1, 1)
        container:insert(scenesContainer)
        setDevUI(scenesContainer)
        scenesContainerHasListener = false
    end
    if not scenesGroup then
        scenesGroup = display.newGroup()
        scenesContainer:insert(scenesGroup)
        setDevUI(scenesGroup)
    end

    scenesContainer.width = panelWidth - 24
    scenesContainer.height = maxHeight
    scenesContainer.x = startX + scenesContainer.width * 0.5
    scenesContainer.y = startY + scenesContainer.height * 0.5
    scenesContainer.isVisible = isScenesOpen
    scenesGroup.x = 0
    scenesGroup.y = -scenesScrollY

    clearSceneItems()

    if not isScenesOpen then
        return
    end

    if scenesContainer and not scenesContainerHasListener and onScenesScroll then
        scenesContainer.isHitTestable = true
        scenesContainer:addEventListener("touch", onScenesScroll)
        scenesContainerHasListener = true
    end

    local scenes = listScenes()
    local lineHeight = 24
    local leftEdge = -scenesContainer.width * 0.5
    local topEdge = -scenesContainer.height * 0.5
    local y = topEdge + lineHeight * 0.5
    for i = 1, #scenes do
        local sceneName = scenes[i]
        local label = display.newText({
            text = sceneName,
            x = leftEdge + 6,
            y = y,
            fontSize = 16,
            align = "left",
            width = 480
        })
        label.anchorX = 0
        label:setFillColor(1, 1, 1)
        setDevUI(label)
        scenesGroup:insert(label)
        sceneItems[#sceneItems + 1] = label

        label:addEventListener("tap", function()
            M.close()
            lastSceneName = composer.getSceneName("current")
            composer.gotoScene(sceneName)
            return true
        end)
        y = y + lineHeight
    end
    local totalHeight = #scenes * lineHeight
    scenesMaxScroll = math.max(0, totalHeight - maxHeight)
    scenesScrollY = math.min(scenesScrollY, scenesMaxScroll)
    scenesGroup.y = -scenesScrollY
end

local function updateLayout()
  if not panel or not menuGroup then
    return
  end

  panel.width = panelWidth
  panel.height = panelHeight
  panel.x = panel.x
  panel.y = panel.y

  if headerBar then
    headerBar.width = panelWidth
    headerBar.height = headerHeight
    headerBar.x = panel.x + panelWidth * 0.5
    headerBar.y = panel.y + headerHeight * 0.5
  end
  if title then
    title.x = panel.x + panelWidth * 0.5
    title.y = panel.y + headerHeight * 0.5
  end
  if scenesButton then
    scenesButton.group.x = panel.x + 70
    scenesButton.group.y = panel.y + headerHeight + 20
  end
  if devToolsButton then
    devToolsButton.group.x = panel.x + panelWidth - 70
    devToolsButton.group.y = panel.y + headerHeight + 20
  end
  if placeholdersButton then
    placeholdersButton.group.x = panel.x + panelWidth * 0.5
    placeholdersButton.group.y = panel.y + headerHeight + 84
  end
  if postLobbyButtonsButton then
    postLobbyButtonsButton.group.x = panel.x + panelWidth * 0.5
    postLobbyButtonsButton.group.y = panel.y + headerHeight + 116
  end
  if backButton then
    backButton.x = panel.x + panelWidth * 0.5
    backButton.y = panel.y + headerHeight + 148
  end
  if resizeHandle then
    resizeHandle.x = panel.x + panelWidth - 8
    resizeHandle.y = panel.y + panelHeight - 8
  end

  buildSceneList(menuGroup, panel.x + 12, panel.y + headerHeight + 48, panelHeight - headerHeight - 60)
end

local function buildMenu()
    if menuGroup then
        return
    end

    menuGroup = display.newGroup()
    setDevUI(menuGroup)

    panel = display.newRoundedRect(menuGroup, display.screenOriginX + 16, display.screenOriginY + 16,
        panelWidth, panelHeight, 10)
    panel.anchorX = 0
    panel.anchorY = 0
    panel:setFillColor(0.1, 0.1, 0.1, 0.95)
    panel.strokeWidth = 2
    panel:setStrokeColor(0.2, 0.6, 0.9)
    setDevUI(panel)

    headerBar = display.newRoundedRect(menuGroup, panel.x + panelWidth * 0.5, panel.y + headerHeight * 0.5,
        panelWidth, headerHeight, 10)
    headerBar:setFillColor(0.15, 0.2, 0.3, 0.95)
    headerBar.strokeWidth = 0
    setDevUI(headerBar)

    title = display.newText({
        text = "DEV MENU",
        x = headerBar.x,
        y = headerBar.y,
        fontSize = 14
    })
    title:setFillColor(0.9, 0.95, 1)
    setDevUI(title)
    menuGroup:insert(title)

    local function makeButton(labelText, x, y, onTap)
        local btnGroup = display.newGroup()
        menuGroup:insert(btnGroup)
        setDevUI(btnGroup)

        local btn = display.newRoundedRect(btnGroup, x, y, 120, 26, 6)
        btn:setFillColor(0.2, 0.2, 0.2, 0.95)
        btn.strokeWidth = 2
        btn:setStrokeColor(0.3, 0.7, 1)
        setDevUI(btn)

        local label = display.newText({
            text = labelText,
            x = x,
            y = y,
            fontSize = 12
        })
        label:setFillColor(1, 1, 1)
        setDevUI(label)
        btnGroup:insert(label)

        btnGroup:addEventListener("tap", function()
            onTap()
            return true
        end)
        return btnGroup
    end

    scenesButton = { group = makeButton("Scenes", 0, 0, function()
        isScenesOpen = not isScenesOpen
        updateLayout()
    end) }

    devToolsButton = { group = makeButton("DevTools", 0, 0, function()
        if composer.devTools and composer.devTools.enabled then
            composer.devTools.disable()
        elseif composer.devTools then
            composer.devTools.enable()
        end
    end) }

    placeholdersButton = { group = makeButton("PostLobby UI", 0, 0, function()
        placeholdersVisible = not placeholdersVisible
        local sceneObj = composer.getScene("lua.scenes.postLobby")
        if sceneObj and sceneObj.setPostLobbyPlaceholdersVisible then
            sceneObj.setPostLobbyPlaceholdersVisible(placeholdersVisible)
        end
    end) }

    postLobbyButtonsButton = { group = makeButton("PostLobby Buttons", 0, 0, function()
        postLobbyButtonsVisible = not postLobbyButtonsVisible
        local sceneObj = composer.getScene("lua.scenes.postLobby")
        if sceneObj and sceneObj.setPostLobbyButtonsVisible then
            sceneObj.setPostLobbyButtonsVisible(postLobbyButtonsVisible)
        end
    end) }

    backButton = makeButton("Back", 0, 0, function()
        if lastSceneName and lastSceneName ~= "" then
            M.close()
            composer.gotoScene(lastSceneName)
        end
    end)

    resizeHandle = display.newRect(menuGroup, panel.x + panelWidth - 8, panel.y + panelHeight - 8, 14, 14)
    resizeHandle:setFillColor(0.3, 0.7, 1, 0.9)
    setDevUI(resizeHandle)

    local function onHeaderTouch(event)
        if event.phase == "began" then
            isDragging = true
            dragOffsetX = event.x - panel.x
            dragOffsetY = event.y - panel.y
            display.getCurrentStage():setFocus(event.target)
            return true
        elseif event.phase == "moved" and isDragging then
            panel.x = event.x - dragOffsetX
            panel.y = event.y - dragOffsetY
            updateLayout()
            return true
        elseif event.phase == "ended" or event.phase == "cancelled" then
            isDragging = false
            display.getCurrentStage():setFocus(nil)
            return true
        end
        return false
    end

    headerBar:addEventListener("touch", onHeaderTouch)

    local function onResizeTouch(event)
        if event.phase == "began" then
            isResizing = true
            resizeStartX = event.x
            resizeStartY = event.y
            resizeStartW = panelWidth
            resizeStartH = panelHeight
            display.getCurrentStage():setFocus(event.target)
            return true
        elseif event.phase == "moved" and isResizing then
            local dx = event.x - resizeStartX
            local dy = event.y - resizeStartY
            panelWidth = math.max(240, resizeStartW + dx)
            panelHeight = math.max(180, resizeStartH + dy)
            updateLayout()
            return true
        elseif event.phase == "ended" or event.phase == "cancelled" then
            isResizing = false
            display.getCurrentStage():setFocus(nil)
            return true
        end
        return false
    end

    resizeHandle:addEventListener("touch", onResizeTouch)

    if scenesContainer and onScenesScroll then
        scenesContainer.isHitTestable = true
        scenesContainer:addEventListener("touch", onScenesScroll)
    end
    if onScenesWheel then
        Runtime:addEventListener("mouse", onScenesWheel)
    end

    updateLayout()

    resizeListener = function()
        if not menuGroup then
            return
        end
        updateLayout()
    end
    Runtime:addEventListener("resize", resizeListener)
end

onScenesScroll = function(event)
    if not scenesContainer or not isScenesOpen then
        return false
    end
    if event.phase == "began" then
        isScrolling = true
        scrollStartY = event.y
        scrollStartOffset = scenesScrollY
        display.getCurrentStage():setFocus(event.target)
        return true
    elseif event.phase == "moved" and isScrolling then
        local dy = event.y - scrollStartY
        scenesScrollY = math.max(0, math.min(scenesMaxScroll, scrollStartOffset - dy))
        if scenesGroup then
            scenesGroup.y = -scenesScrollY
        end
        return true
    elseif event.phase == "ended" or event.phase == "cancelled" then
        isScrolling = false
        display.getCurrentStage():setFocus(nil)
        return true
    end
    return false
end

onScenesWheel = function(event)
    if not scenesContainer or not isScenesOpen then
        return false
    end
    local scrollY = event.scrollY or 0
    if scrollY ~= 0 then
        scenesScrollY = math.max(0, math.min(scenesMaxScroll, scenesScrollY + scrollY * 4))
        if scenesGroup then
            scenesGroup.y = -scenesScrollY
        end
        return true
    end
    return false
end

function M.open()
    if isOpen then
        return
    end
    isOpen = true
    buildMenu()
    if menuGroup then
        menuGroup.isVisible = true
        menuGroup:toFront()
    end
end

function M.close()
    isOpen = false
    isScenesOpen = false
    if menuGroup then
        menuGroup:removeSelf()
        menuGroup = nil
    end
    scenesContainer = nil
    scenesGroup = nil
    if resizeListener then
        Runtime:removeEventListener("resize", resizeListener)
        resizeListener = nil
    end
    if onScenesWheel then
        Runtime:removeEventListener("mouse", onScenesWheel)
    end
end

function M.toggle()
    if isOpen then
        M.close()
    else
        M.open()
    end
end

local function onKey(event)
    if event.phase ~= "up" then
        return false
    end
  if event.keyName == "/" then
        M.toggle()
        return true
    end
    return false
end

function M.init()
    Runtime:addEventListener("key", onKey)
end

M.init()
composer.devMenu = M

return M
