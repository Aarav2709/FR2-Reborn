local composer = require("composer")
local seasonal = require("lua.modules.seasonalModule")
local screen = require("lua.modules.screen")
local scene = composer.newScene()
local clean, cleanEnter
local marketBackground, backgroundCoins, backgroundBottom, leftBarImage, marketBackgroundBlur
local layoutMarketplace, resizeListener

-- The shop is laid out in the original 480x320 design units (all market art is
-- drawn for that size at 2x). One uniform scale fits this design box to the screen;
-- the box rests on the bottom edge, and the side panel, roof and currency board
-- reach out to the real screen edges on wider or taller displays.
local DESIGN_W, DESIGN_H = 480, 320
local box = screen.designBox(DESIGN_W, DESIGN_H)

local function computeBox()
  screen.designBox(DESIGN_W, DESIGN_H, box)
end

-- Design units -> screen coordinates, for objects kept outside the scaled groups.
local function toScreenX(x)
  return box.left + x * box.scale
end

local function toScreenY(y)
  return box.top + y * box.scale
end

-- Where things sit in the design box (the shop art has the grass shadow at 291,162,
-- the counter top at y 223-245 and a small name plank centred on 280,278).
local PREVIEW_X, PREVIEW_Y = 291, 162
local TITLE_X, TITLE_Y = 280, 278
-- Unlock / sale notes go on a small board under the name plank.
local INFO_X, INFO_Y = 280, 306
-- Left of this column the art has a ragged edge and a lighter strip under the
-- counter, so it is replaced by a mirrored copy of the counter from here to the
-- category panel.
local ART_SEAM = 116
local PANEL_VISIBLE_W = 100
-- Item strip: the selected cell's left edge sits at SELECTED_CELL_LEFT so the cell
-- is centred on the info plank; cells hang down from ITEM_ROW_TOP.
local SELECTED_CELL_LEFT = 240
local ITEM_ROW_TOP = 173
local ITEM_CELL_W, ITEM_CELL_H = 80, 96
local BUTTON_ROW_Y = 291
-- Category buttons (87 wide): centred on the panel's 100 unit wide wood, first row
-- below the roof.
local CATEGORY_INSET = 6.5
local CATEGORY_ROW_H = 58
local CATEGORY_TOP_PADDING = 43
local CATEGORY_BOTTOM = 248

-- Text placed in the scaled shop groups is rasterised at its final on-screen size
-- and scaled back down, so it stays sharp at any box scale.
local function newShopText(params)
  local s = box.scale
  params.size = (params.size or 14) * s
  if params.width then
    params.width = params.width * s
  end
  local text = composer.newText(params)
  text.baseScale = 1 / s
  -- Long strings shrink to fit their board instead of spilling past it.
  if params.maxWidth and text.width > 0 then
    text.baseScale = text.baseScale * math.min(1, params.maxWidth / (text.width / s))
  end
  text.xScale, text.yScale = text.baseScale, text.baseScale
  return text
end

function scene:create(event)
  local screenGroup = self.view
  computeBox()
  -- Layers, back to front: blurred backdrop, shop art (design units), item list
  -- (screen units), shop UI (design units), category list (screen units), then the
  -- roof / bottom plank that frame the category list (design units).
  local artGroup = display.newGroup()
  local listGroup = display.newGroup()
  local uiGroup = display.newGroup()
  local categoryGroup = display.newGroup()
  local topGroup = display.newGroup()
  local tableHelper = require("lua.modules.tableHelper")
  local trailHelper = require("lua.modules.trails")
  local tcpFormat = require("lua.network.tcpMessageFormat")
  local httpsFormat = require("lua.network.httpsMessageFormat")
  local monsterLoader = require("spine-corona.monsterLoader")
  local tableView = require("lua.modules.tableViewHorizontal")
  local inApp = require("lua.iap.inAppPurchase")
  local powerUpPreviewer = require("lua.gameLogic.powerUpPreviewer")
  local marketplaceIndex = require("lua.modules.marketplaceIndex")
  local title, moneyLabel
  local itemSelected = 1
  local tabSelected = 0
  local oldEffect = 0
  local savedPowerupIndex = 1
  local powerUpPreviewImage = nil
  local itemTimer, horizontalTableView, currentMarketData, updateTableView, marketTable, marketTableList, monster, updateMoneyLabel, updateMarketplace, btnSkin, btnSkinBack, btnBuy, btnBack, tableViewData, masterSkinBackground, masterSkinInfo, masterSkinText, bubbleWindow
  local gemLabel, gemIcon
  local monsterData = composer.database.getAvatarData()
  local itemTrailSelected = monsterData[6]
  local startMonsterData = composer.tableHelper.deepCopy(monsterData)
  local moneyValue = composer.database.getMoney()
  local boughtItems = composer.database.getItems()
  local startedClean = false

  marketBackgroundBlur = display.newImageRect(screenGroup, seasonal.blurredBackground(), 960, 640)
  screenGroup:insert(artGroup)
  screenGroup:insert(listGroup)
  screenGroup:insert(uiGroup)
  screenGroup:insert(categoryGroup)
  screenGroup:insert(topGroup)
  -- Shop art, clipped to the columns right of its ragged left edge. On screens wider
  -- than the design box, mirrored copies continue the grass and counter to the left
  -- (up to the category panel) and to the right edge.
  local artClip = display.newContainer(artGroup, DESIGN_W - ART_SEAM, DESIGN_H)
  artClip.x = (ART_SEAM + DESIGN_W) * 0.5
  artClip.y = DESIGN_H * 0.5
  marketBackground = display.newImageRect(artClip, "images/gui/market/bg.png", DESIGN_W, DESIGN_H)
  marketBackground.x = DESIGN_W * 0.5 - artClip.x
  marketBackground.y = 0
  -- Everything left of the seam; the copy is reflected about the seam column.
  -- (It reaches one unit past the seam so no hairline shows between the two copies.)
  local leftArtClip = display.newContainer(artGroup, 1001, DESIGN_H)
  leftArtClip.x = ART_SEAM - 499.5
  leftArtClip.y = DESIGN_H * 0.5
  local leftArtMirror = display.newImageRect(leftArtClip, "images/gui/market/bg.png", DESIGN_W, DESIGN_H)
  leftArtMirror.xScale = -1
  leftArtMirror.x = (2 * ART_SEAM - DESIGN_W * 0.5) - leftArtClip.x
  leftArtMirror.y = 0
  local marketBackgroundMirror = display.newImageRect(artGroup, "images/gui/market/bg.png", DESIGN_W, DESIGN_H)
  marketBackgroundMirror.anchorX = 1
  marketBackgroundMirror.anchorY = 0
  marketBackgroundMirror.xScale = -1
  leftBarImage = display.newImageRect(uiGroup, "images/gui/market/categoryPanel.png", 117, 261)
  leftBarImage.anchorX = 0
  leftBarImage.anchorY = 0
  backgroundCoins = display.newImageRect(uiGroup, "images/gui/market/currentCoins.png", 70, 81)
  backgroundCoins.anchorX = 0
  backgroundCoins.anchorY = 0
  backgroundBottom = display.newImageRect(topGroup, "images/gui/market/categoryCover.png", 119, 80)
  backgroundBottom.anchorX = 0
  backgroundBottom.anchorY = 1
  local roofTiles = {}
  local categoryTableGeometry
  local itemStripGeometry

  local function boxGeometry()
    return string.format("%.4f:%.2f:%.2f:%.2f", box.scale, box.left, box.top, box.SL)
  end

  -- Buy sits in the bottom-right corner with the skins button beside it.
  local function placeActionButtons()
    if btnBuy then
      btnBuy.x, btnBuy.y = box.SR - 43, BUTTON_ROW_Y
    end
    if btnSkin then
      btnSkin.x, btnSkin.y = box.SR - 115, BUTTON_ROW_Y
    end
    if btnSkinBack then
      btnSkinBack.x, btnSkinBack.y = box.SR - 115, BUTTON_ROW_Y
    end
  end

  -- The category list is a scrolling widget, so it lives in screen units (touch
  -- tracking stays 1:1) and is rebuilt whenever the box moves or changes scale.
  local function buildCategoryTable()
    if not marketTableList then
      return
    end
    local s = box.scale
    local left = toScreenX(box.SL + CATEGORY_INSET)
    local top = screen.top
    local geometry = string.format("%.4f:%.2f:%.2f", s, left, top)
    if marketTable and marketTable.getTable() and geometry == categoryTableGeometry then
      return
    end
    if marketTable then
      marketTable.cleanTable()
    end
    categoryTableGeometry = geometry
    marketTable = tableHelper.new(left, top, 100 * s, (CATEGORY_BOTTOM - box.T) * s, CATEGORY_ROW_H * s, nil, "market", function()
    end, CATEGORY_TOP_PADDING * s, s)
    marketTable.createTable(marketTableList, categoryGroup)
  end

  layoutMarketplace = function()
    computeBox()
    local s = box.scale
    for _, group in ipairs({ artGroup, uiGroup, topGroup }) do
      group.xScale, group.yScale = s, s
      group.x, group.y = box.left, box.top
    end
    screen.cover(marketBackgroundBlur)
    marketBackgroundMirror.x = DESIGN_W
    marketBackgroundMirror.y = 0
    marketBackgroundMirror.isVisible = box.R > DESIGN_W
    -- Category column from the screen's left edge to just past the buttons, full
    -- height down to the bottom plank; it widens to cover a notch or camera cut-out.
    local panelScale = math.max(1, (box.SL + PANEL_VISIBLE_W - box.L) / PANEL_VISIBLE_W)
    leftBarImage.x = box.L
    leftBarImage.xScale = panelScale
    leftBarImage.y = box.T
    leftBarImage.yScale = (261 - box.T) / 261
    backgroundBottom.x = box.L
    backgroundBottom.xScale = panelScale
    backgroundBottom.y = DESIGN_H
    -- Roof tiles across the whole top edge.
    local tileWidth = DESIGN_W - 4
    local tilesNeeded = math.ceil((box.R - box.L) / tileWidth) + 1
    for i = 1, tilesNeeded do
      if not roofTiles[i] then
        roofTiles[i] = display.newImageRect(topGroup, "images/gui/market/roof.png", DESIGN_W, 30)
        roofTiles[i].anchorX = 0
        roofTiles[i].anchorY = 0
      end
      roofTiles[i].x = box.L + (i - 1) * tileWidth
      roofTiles[i].y = box.T
    end
    backgroundCoins.x = box.SR - 80
    backgroundCoins.y = box.T
    if moneyLabel then
      moneyLabel.x = backgroundCoins.x + 24
      moneyLabel.y = backgroundCoins.y + 69
    end
    if gemLabel then
      gemLabel.x = backgroundCoins.x + 24
      gemLabel.y = backgroundCoins.y + 41
    end
    if btnBack then
      btnBack.x = box.SL + 50
      btnBack.y = BUTTON_ROW_Y
    end
    placeActionButtons()
    buildCategoryTable()
    powerUpPreviewer.setPlacement(PREVIEW_X, PREVIEW_Y - 45, 1)
    -- After a window resize the screen-space item strip and the text are rebuilt.
    if horizontalTableView and itemStripGeometry ~= boxGeometry() and scene.refreshMarketUI then
      scene.refreshMarketUI()
    end
  end
  layoutMarketplace()
  itemSelected = 1

  local function commCallback(data)
    if data.m == tcpFormat.purchaseItem() or data.m == httpsFormat.buyCrystalIOS() or data.m == httpsFormat.buyCrystalGoogle() or data.m == httpsFormat.buyCrystalAmazon() then
      boughtItems = composer.database.getItems()
      updateMoneyLabel()
      updateTableView()
    end
  end

  local function createItemEffect()
    if not monster then return end
    trailHelper.createTrail(itemTrailSelected, monster.getGroup().x - 5, monster.getGroup().y - 50, uiGroup)
    uiGroup:insert(monster.getGroup())
  end

  local function playItemEffect()
    if oldEffect ~= itemTrailSelected then
      oldEffect = itemTrailSelected
      if itemTimer then
        timer.cancel(itemTimer)
        itemTimer = nil
      end
      if (tonumber(itemTrailSelected) or 0) > 1 then
        createItemEffect()
        itemTimer = timer.performWithDelay(200, createItemEffect, 0)
      end
    end
  end

  local function changeAvatar(spriteType, index)
    if currentMarketData[index] == nil then
      return
    end
    -- Cancel any running item effect timer before cleaning up monster
    if itemTimer then
      timer.cancel(itemTimer)
      itemTimer = nil
    end
    oldEffect = 0
    -- Clean up any existing powerup preview
    if powerUpPreviewImage then
      display.remove(powerUpPreviewImage)
      powerUpPreviewImage = nil
    end
    powerUpPreviewer.softClean()
    if monster then
      monster.clean()
      monster = nil
    end

    -- For powerup tabs (9 and 10), show powerup preview instead of character
    if tabSelected == 9 or tabSelected == 10 then
      local itemKey = currentMarketData[itemSelected].key
      local category = composer.storeConfig.getItemCategory(tonumber(itemKey))
      if category then
        powerUpPreviewImage = powerUpPreviewer.showPreviewForCategory(category, itemKey)
        if powerUpPreviewImage then
          uiGroup:insert(powerUpPreviewImage)
        end
      end
      return
    end

    -- Build preview from currently equipped loadout so preview always matches
    -- "what player is wearing now + candidate item".
    local equippedMonsterData = composer.database.getAvatarData() or monsterData
    local newMonsterData = composer.tableHelper.deepCopy(equippedMonsterData)
    if spriteType == 1 then
      local skinInfo = boughtItems[tostring(currentMarketData[index].key)]
      if skinInfo then
        local defaultSkin = skinInfo.s
        if defaultSkin and defaultSkin ~= 0 then
          local skinData = composer.storeConfig.getItem(tonumber(defaultSkin))
          if type(skinData) == "table" then
            newMonsterData[2] = skinData.skinId
          else
            newMonsterData[2] = 0
          end
        else
          newMonsterData[2] = 0
        end
      elseif tabSelected ~= 8 then
        newMonsterData[2] = 0
      end
    end
    if spriteType == 2 then
      if tabSelected == 8 then
        newMonsterData[1] = currentMarketData[index].characterId
      else
        newMonsterData[1] = currentMarketData[1].key
      end
    end
    if tabSelected == 8 and index == 1 then
      newMonsterData[1] = newMonsterData[1]
    else
      newMonsterData[spriteType] = currentMarketData[itemSelected].key
    end
    monster = monsterLoader.new(newMonsterData)
    local monsterGroup = monster.getGroup()
    monsterGroup.xScale = 0.5
    monsterGroup.yScale = 0.5
    monsterGroup.x = PREVIEW_X
    monsterGroup.y = PREVIEW_Y
    uiGroup:insert(monsterGroup)
    if newMonsterData[6] then
      itemTrailSelected = tonumber(newMonsterData[6])
      playItemEffect()
    end
  end
  local function findIndexOnKey(key)
    return marketplaceIndex.findIndexOnKey(currentMarketData, key)
  end

  local function findIndexOnId(key)
    return marketplaceIndex.findIndexOnId(key)
  end

  local function isItemBought(itemData)
    if itemData and boughtItems[tostring(itemData.key)] then
      return true
    elseif itemData and itemData.preOwned then
      return true
    end
    return false
  end

  -- Powerup overview: one entry per powerup type showing the skin equipped for it.
  local function getPowerupOverviewData()
    local list = composer.storeConfig.getAllPowerupsSortedOnPrice()
    local equipped = composer.database.getPowerupSkin()
    for i = 1, #list do
      local category = list[i].powerupCategory
      for _, skinId in ipairs(equipped) do
        local skin = composer.storeConfig.getItem(skinId)
        if composer.storeConfig.getPowerupCategoryFromId(skinId) == category and type(skin) == "table" then
          local entry = {}
          for k, v in pairs(skin) do
            entry[k] = v
          end
          entry.key = tostring(skinId)
          entry.imagePath = "images/gui/market/items/" .. category .. "/" .. skinId .. ".png"
          entry.powerupCategory = category
          list[i] = entry
        end
      end
    end
    return list
  end

  local function getEquippedPowerupIndex()
    for i = 1, #currentMarketData do
      if composer.database.isPowerupSkinEquipped(currentMarketData[i].key) then
        return i
      end
    end
    return 1
  end

  local function updateItemTitle(index)
    local newTitle = ""
    if currentMarketData[index] then
      newTitle = currentMarketData[index].title
      if currentMarketData[index].skinTitle then
        newTitle = currentMarketData[index].skinTitle
      end
    end
    if title then
      title:removeSelf()
      title = nil
    end
    title = newShopText({
      string = newTitle,
      size = 14,
      x = TITLE_X,
      y = TITLE_Y,
      maxWidth = 104,
      color = {
        1,
        1,
        1
      }
    })
    uiGroup:insert(title)
  end

  local function updateTextInfo(index)
    if masterSkinBackground then
      masterSkinBackground:removeSelf()
      masterSkinBackground = nil
    end
    if masterSkinInfo then
      masterSkinInfo:removeSelf()
      masterSkinInfo = nil
    end
    if masterSkinText then
      masterSkinText:removeSelf()
      masterSkinText = nil
    end
    if bubbleWindow then
      transition.cancel(bubbleWindow)
      bubbleWindow:removeSelf()
      bubbleWindow = nil
    end
    if isItemBought(currentMarketData[index]) then
      return
    end
    if currentMarketData[index] == nil then
      return
    end

    -- Messages about locked or special items go on the small plank under the counter.
    local function addMasterSkinBackground()
      masterSkinBackground = display.newImageRect("images/gui/market/masterWindow.png", 100, 32)
      masterSkinBackground.x = INFO_X
      masterSkinBackground.y = INFO_Y
      uiGroup:insert(masterSkinBackground)
    end

    local function addInfoLine(text, yOffset, size)
      local line = newShopText({
        string = text,
        size = size or 12,
        x = INFO_X,
        y = INFO_Y - 2 + (yOffset or 0),
        maxWidth = 92,
        color = { 1, 1, 1 }
      })
      uiGroup:insert(line)
      return line
    end

    local item = currentMarketData[index]
    if item.master then
      local currentWins = composer.database.getWinsForAvatar(item.characterId)
      local reqWins = item.winsReq or 0
      addMasterSkinBackground()
      if currentWins < reqWins then
        masterSkinText = addInfoLine(currentWins .. "/" .. reqWins, -6)
        masterSkinInfo = addInfoLine(composer.localized.get("WinsUnlock"), 6)
      else
        masterSkinInfo = addInfoLine(composer.localized.get("Unlocked"))
      end
    elseif item.seasonal then
      addMasterSkinBackground()
      masterSkinInfo = addInfoLine(composer.localized.get("seasonal"))
    elseif item.spinningPrize then
      addMasterSkinBackground()
      masterSkinInfo = addInfoLine(composer.localized.get("SpinningPrize"))
    elseif item.achievementPrize then
      addMasterSkinBackground()
      masterSkinInfo = addInfoLine(composer.localized.get("AchievementPrize"))
    elseif item.weeklyPrice then
      addMasterSkinBackground()
      masterSkinInfo = addInfoLine(composer.localized.get("WeeklyPrize"))
    elseif tabSelected == 8 and item.characterId and not boughtItems[tostring(item.characterId)] then
      addMasterSkinBackground()
      local character = composer.storeConfig.getItem(item.characterId)
      local characterTitle = type(character) == "table" and character.title or ""
      masterSkinInfo = addInfoLine(composer.localized.get("Buy") .. " " .. characterTitle .. " " .. composer.localized.get("First"))
    elseif tabSelected == 8 and findIndexOnId(item.key) == 10 then
      addMasterSkinBackground()
      local text = composer.localized.get("Forever")
      if item.mysteryBox then
        text = composer.localized.get("youandfriends")
      end
      masterSkinInfo = addInfoLine(text, 0, 14)
      -- Speech bubble explaining the boost pops up beside the preview.
      bubbleWindow = display.newImageRect("images/gui/market/items/boosts/" .. item.key .. "_2.png", 100, 69)
      if bubbleWindow then
        bubbleWindow.anchorX = 1
        bubbleWindow.x = PREVIEW_X - 30
        bubbleWindow.y = 50
        bubbleWindow.xScale, bubbleWindow.yScale = 0.2, 0.2
        uiGroup:insert(bubbleWindow)
        transition.to(bubbleWindow, { time = 250, xScale = 1, yScale = 1, transition = easing.outBack })
      end
    elseif not isItemBought(currentMarketData[1]) and tabSelected == 2 and itemSelected ~= 1 then
      addMasterSkinBackground()
      masterSkinInfo = addInfoLine(composer.localized.get("Buy") .. " " .. currentMarketData[1].title .. " " .. composer.localized.get("First"))
    end
  end

  -- The skins button opens the selected avatar's skins (tab 1) or powerup's skins
  -- (tab 9); the "back" variant returns from those lists (tabs 2 and 10).
  local function updateBuyButtonState(index)
    if not btnBuy then
      return
    end
    placeActionButtons()
    local item = index and currentMarketData and currentMarketData[index]
    if btnSkin then
      btnSkin.isVisible = item ~= nil and (tabSelected == 1 or tabSelected == 9)
    end
    if btnSkinBack then
      btnSkinBack.isVisible = tabSelected == 2 or tabSelected == 10
    end
    if not item then
      btnBuy.isVisible = false
      return
    end
    local notForSale = item.spinningPrize or item.weeklyPrice or item.achievementPrize or (item.seasonal and not item.seasonalActive)
    btnBuy.isVisible = not notForSale and not isItemBought(item)
  end

  function updateMarketplace(spriteType, newIndex)
    composer.debugger.debugTable("network", "currentMarketData :", currentMarketData)
    local index, slotToChange = marketplaceIndex.normalizeSelection(spriteType, newIndex, currentMarketData)
    itemSelected = index
    if tabSelected == 10 and currentMarketData[index] and isItemBought(currentMarketData[index]) then
      composer.database.changePowerupSkin(currentMarketData[index].key)
    end
    updateItemTitle(index)
    updateTextInfo(index)
    changeAvatar(slotToChange, index)
    if index == 2 and slotToChange == 4 and composer.onboarding.isActive == true then
      composer.onboarding.removeIconArrow()
    end
    updateBuyButtonState(index)
  end

  function updateMoneyLabel()
    moneyValue = composer.database.getMoney()
    if moneyLabel then
      moneyLabel:removeSelf()
      moneyLabel = nil
    end
    if gemLabel then
      gemLabel:removeSelf()
      gemLabel = nil
    end
    local coinX = backgroundCoins.x + 24
    local coinY = backgroundCoins.y
    moneyLabel = newShopText({
      string = moneyValue,
      size = 14,
      x = coinX,
      y = coinY + 69,
      ax = 0,
      maxWidth = 42,
      color = {
        1,
        1,
        1
      }
    })
    uiGroup:insert(moneyLabel)
    gemLabel = newShopText({
      string = composer.database.getGems(),
      size = 14,
      x = coinX,
      y = coinY + 41,
      ax = 0,
      maxWidth = 42,
      color = {
        1,
        1,
        1
      }
    })
    uiGroup:insert(gemLabel)
  end

  local function flashLabel(label)
    if not label or not label.removeSelf then
      return
    end
    local baseScale = label.baseScale or 1
    label:setFillColor(1, 0.2, 0.2)
    transition.to(label, { time = 150, xScale = baseScale * 1.1, yScale = baseScale * 1.1 })
    transition.to(label, {
      time = 150,
      delay = 150,
      xScale = baseScale,
      yScale = baseScale,
      onComplete = function()
        if label and label.removeSelf then
          label:setFillColor(1, 1, 1)
        end
      end
    })
  end

  function scene.flashMarketCoins()
    flashLabel(moneyLabel)
  end

  function scene.flashMarketGems()
    flashLabel(gemLabel)
  end

  function scene.refreshMarketUI()
    updateMoneyLabel()
    updateTableView()
    updateMarketplace(tabSelected, itemSelected)
  end

  local function findItemSelectedForSpriteType(currentMonster)
    -- Powerup tabs don't map to monsterData slots
    if tabSelected == 9 or tabSelected == 10 then
      itemSelected = 1
      return
    end
    itemSelected = marketplaceIndex.findItemSelectedForSpriteType(
      tabSelected,
      currentMarketData,
      composer.database.getAvatarData() or monsterData,
      currentMonster,
      composer.database.getDefaultSkinForAvatar
    )
  end

  local function btnBackRelease(event)
    if composer.onboarding.isActive == true then
      composer.onboarding.stepDone()
    else
      composer.gotoScene("lua.scenes.mainMenu")
    end
  end

  local function giveNoticeOfSkinChanges()
    local newSkin = 0
    if 1 < itemSelected then
      newSkin = currentMarketData[itemSelected].key
    end
    if newSkin == 0 or isItemBought(currentMarketData[itemSelected]) then
      composer.database.setNewDefaultSkinForAvatar(currentMarketData[1].key, newSkin)
      composer.comm.changeSkin(currentMarketData[1].key, newSkin)
    end
  end

  local function storeTempMonsterChanges()
    if not currentMarketData then
      return
    end
    -- Powerup skins live outside the avatar data; only owned skins can be equipped.
    if tabSelected == 9 or tabSelected == 10 then
      local item = currentMarketData[itemSelected]
      if tabSelected == 10 and item and isItemBought(item) then
        composer.database.changePowerupSkin(item.key)
      end
      return
    end

    if tabSelected == 2 then
      giveNoticeOfSkinChanges()
    end
    local boughtItem = isItemBought(currentMarketData[itemSelected])
    if boughtItem then
      if tabSelected == 2 then
        monsterData[2] = currentMarketData[itemSelected].skinId or currentMarketData[itemSelected].key or 0
      elseif tabSelected == 1 then
        monsterData[1] = currentMarketData[itemSelected].key
        monsterData[2] = composer.database.getDefaultSkinForAvatar(monsterData[1]) or 0
      elseif tabSelected == 8 then
        local itemType = currentMarketData[itemSelected].itemType
        if itemType then
          monsterData[itemType] = currentMarketData[itemSelected].key
        end
      else
        monsterData[tabSelected] = currentMarketData[itemSelected].key
      end
      composer.database.setAvatarData(monsterData)
    end
  end

  local function updateMarketTabSelected(newTabId, currentMonster)
    local deselectIndex
    if 0 < tabSelected and tabSelected ~= 2 then
      deselectIndex = tabSelected
      if deselectIndex == 1 then
        deselectIndex = 2
      elseif deselectIndex == 8 then
        deselectIndex = 1
      elseif deselectIndex == 9 or deselectIndex == 10 then
        deselectIndex = 8
      end
      if marketTable.getTable():getRowAtIndex(deselectIndex) then
        marketTable.getTable():getRowAtIndex(deselectIndex).setActiveState(false)
      elseif marketTableList[deselectIndex] then
        marketTableList[deselectIndex].active = false
      end
    end
    tabSelected = newTabId
    local selectIndex = tabSelected
    if selectIndex == 1 then
      selectIndex = 2
    elseif selectIndex == 8 then
      selectIndex = 1
    elseif selectIndex == 9 or selectIndex == 10 then
      selectIndex = 8
    end
    findItemSelectedForSpriteType(currentMonster)
    if tabSelected == 9 or tabSelected == 10 then
      -- Powerup overview returns to the type that was open; a type's skin list
      -- opens on the skin currently equipped.
      local startIndex = 1
      if tabSelected == 10 then
        startIndex = getEquippedPowerupIndex()
      elseif savedPowerupIndex and currentMarketData[savedPowerupIndex] then
        startIndex = savedPowerupIndex
      end
      itemSelected = startIndex
      updateMarketplace(tabSelected, startIndex)
      if marketTable.getTable():getRowAtIndex(selectIndex) then
        marketTable.getTable():getRowAtIndex(selectIndex).setActiveState(true)
      end
    elseif tabSelected == 2 or tabSelected == 8 or tabSelected == 1 and currentMonster then
      updateMarketplace(tabSelected, currentMonster)
      if (tabSelected == 8 or tabSelected == 1) and marketTable.getTable():getRowAtIndex(selectIndex) then
        marketTable.getTable():getRowAtIndex(selectIndex).setActiveState(true)
      end
    else
      updateMarketplace(tabSelected, monsterData[tabSelected])
      if marketTable.getTable():getRowAtIndex(selectIndex) then
        marketTable.getTable():getRowAtIndex(selectIndex).setActiveState(true)
      end
    end
    if tabSelected == 1 or tabSelected == 9 then
      btnSkin.isVisible = true
      btnSkinBack.isVisible = false
    elseif tabSelected == 2 or tabSelected == 10 then
      btnSkin.isVisible = false
      btnSkinBack.isVisible = true
    else
      btnSkin.isVisible = false
      btnSkinBack.isVisible = false
    end
    updateTableView()
  end

  local function setUpForAvatar(oldMonster)
    storeTempMonsterChanges()
    currentMarketData = composer.storeConfig.getAllCharactersSortedOnPrice()
    -- Opens on the animal being worn (or the one whose skins were open), not the bear.
    local equipped = composer.database.getAvatarData() or monsterData
    local animal = oldMonster or (equipped and equipped[1]) or 101
    local animalIndex = findIndexOnKey(animal)
    if not animalIndex then
      animal = 101
      animalIndex = findIndexOnKey(101)
    end
    if animalIndex then
      itemSelected = animalIndex
    end
    updateMarketTabSelected(1, animal)
  end

  local function btnAvatarRelease()
    if tabSelected ~= 1 then
      composer.audio.play("button_press")
      setUpForAvatar()
    end
  end

  local function btnSkinRelease()
    if startedClean then
      return
    end
    if tabSelected == 1 then
      local currentMonster
      if tabSelected == 1 then
        currentMonster = currentMarketData[itemSelected].key
      else
        currentMonster = monsterData[1]
      end
      storeTempMonsterChanges()
      currentMarketData = composer.storeConfig.getAllSkinsSortedOnPrice(currentMonster)
      updateMarketTabSelected(2, currentMonster)
    elseif tabSelected == 2 then
      setUpForAvatar(currentMarketData[1].key)
    elseif tabSelected == 9 then
      -- Drill into per-type powerup skins
      local itemKey = currentMarketData[itemSelected].key
      local category = composer.storeConfig.getPowerupCategoryFromId(tonumber(itemKey))
      if category then
        savedPowerupIndex = itemSelected
        storeTempMonsterChanges()
        currentMarketData = composer.storeConfig.getAllPowerupsOfTypeSortedOnPrice(category)
        updateMarketTabSelected(10)
      end
    elseif tabSelected == 10 then
      -- Back to all powerups
      storeTempMonsterChanges()
      currentMarketData = getPowerupOverviewData()
      updateMarketTabSelected(9)
    end
  end

  local function btnHeadRelease()
    if tabSelected ~= 3 then
      composer.audio.play("button_press")
      storeTempMonsterChanges()
      currentMarketData = composer.storeConfig.getAllHatsSortedOnPrice()
      updateMarketTabSelected(3)
    end
  end

  local function btnFacewearRelease()
    if tabSelected ~= 4 then
      composer.audio.play("button_press")
      storeTempMonsterChanges()
      currentMarketData = composer.storeConfig.getAllFacewearSortedOnPrice()
      updateMarketTabSelected(4)
    end
  end

  local function btnNeckRelease()
    if tabSelected ~= 5 then
      composer.audio.play("button_press")
      storeTempMonsterChanges()
      currentMarketData = composer.storeConfig.getAllNecksSortedOnPrice()
      updateMarketTabSelected(5)
    end
  end

  local function btnItemRelease(self, event)
    if tabSelected ~= 6 then
      composer.audio.play("button_press")
      storeTempMonsterChanges()
      currentMarketData = composer.storeConfig.getAllTrailsSortedOnPrice()
      updateMarketTabSelected(6)
    end
  end

  local function btnFeetRelease(self, event)
    if tabSelected ~= 7 then
      composer.audio.play("button_press")
      storeTempMonsterChanges()
      currentMarketData = composer.storeConfig.getAllFeetSortedOnPrice()
      updateMarketTabSelected(7)
    end
  end

  local function btnSaleRelease(self, event, noSound)
    if tabSelected ~= 8 then
      if not noSound then
        composer.audio.play("button_press")
      end
      local currentMonster
      if tabSelected == 1 then
        currentMonster = currentMarketData[itemSelected].key
      else
        currentMonster = monsterData[1]
      end
      storeTempMonsterChanges()
      currentMarketData = composer.storeConfig.getAllSaleItemSortedOnPrice()
      updateMarketTabSelected(8, currentMonster)
    end
  end

  local function btnPowerupsRelease(self, event, noSound)
    if tabSelected ~= 9 then
      if not noSound then
        composer.audio.play("button_press")
      end
      storeTempMonsterChanges()
      powerUpPreviewer.clean()
      powerUpPreviewer.init()
      savedPowerupIndex = 1
      currentMarketData = getPowerupOverviewData()
      updateMarketTabSelected(9)
    end
  end

  local function createMarketButtonTable()
    marketTableList = {
      {
        image = "images/gui/market/categorySpecial.png",
        onClick = btnSaleRelease
      },
      {
        image = "images/gui/market/categoryAvatars.png",
        onClick = btnAvatarRelease
      },
      {
        image = "images/gui/market/categoryHats.png",
        onClick = btnHeadRelease
      },
      {
        image = "images/gui/market/categoryGlasses.png",
        onClick = btnFacewearRelease
      },
      {
        image = "images/gui/market/categoryNeck.png",
        onClick = btnNeckRelease
      },
      {
        image = "images/gui/market/categoryTrails.png",
        onClick = btnItemRelease
      },
      {
        image = "images/gui/market/categoryShoes.png",
        onClick = btnFeetRelease
      },
      {
        image = "images/gui/market/categoryPowerups.png",
        onClick = btnPowerupsRelease
      }
    }
    if composer.database.salesItem then
      local currentTime = system.getTimer() / 1000
      for key, value in pairs(composer.database.salesItem) do
        if type(value) == "table" then
          local saleType = composer.storeConfig.getItemCategory(tonumber(value.i))
          if value.y - currentTime < 0 then
          else
            marketTableList[1].active = true
            if saleType == "avatars" and not boughtItems[tostring(value.i)] then
              marketTableList[2].sale = true
            elseif saleType == "hat" and not boughtItems[tostring(value.i)] then
              marketTableList[3].sale = true
            elseif saleType == "facewear" and not boughtItems[tostring(value.i)] then
              marketTableList[4].sale = true
            elseif saleType == "neck" and not boughtItems[tostring(value.i)] then
              marketTableList[5].sale = true
            elseif saleType == "trail" and not boughtItems[tostring(value.i)] then
              marketTableList[6].sale = true
            elseif saleType == "shoes" and not boughtItems[tostring(value.i)] then
              marketTableList[7].sale = true
            end
          end
        end
      end
    end
    -- newItem badges removed per request
    if not marketTableList[1].active then
      marketTableList[2].active = true
    end
    buildCategoryTable()
  end

  local function tableViewCellButtonRelease()
  end

  local function isLocked()
    if horizontalTableView and horizontalTableView.dataTable and horizontalTableView.dataTable[itemSelected] then
      local cell = horizontalTableView.dataTable[itemSelected].group
      if cell and cell.isLocked() then
        cell.bounceLock()
        return true
      end
    end
    return false
  end

  local function btnBuyRelease(event)
    local item = currentMarketData[itemSelected]
    if item and item.key then
      composer.analytics.newEvent("design", {
        event_id = "market:buyButton:press:" .. item.key,
        value = composer.database.getMoney(),
        area = composer.config.fullVersion
      })
    end
    if not composer.config.offlineMode and isLocked() then
      if item and item.key then
        composer.analytics.newEvent("design", {
          event_id = "market:buyButton:locked:" .. item.key,
          value = composer.database.getMoney(),
          area = composer.config.fullVersion
        })
      end
      composer.audio.play("no_powerup")
    elseif not isItemBought(item) then
      if item and item.key then
        composer.analytics.newEvent("design", {
          event_id = "market:buyButton:openBuyOptions:" .. item.key,
          value = composer.database.getMoney(),
          area = composer.config.fullVersion
        })
      end
      local itemKeyToLoad = item.key
      if item.saleTier and item.saleKey then
        itemKeyToLoad = item.saleKey
      end
      local itemIAPStatus = inApp.loadSpecificProduct(itemKeyToLoad)
      local options = {
        isModal = true,
        params = { item = item, itemIAPStatus = itemIAPStatus }
      }
      composer.showOverlay("lua.overlays.marketBuy", options)
    end
  end

  local function onTableViewScrollEnd(item, isClick)
    if isClick and itemSelected == item and (tabSelected == 1 or tabSelected == 2) then
      timer.performWithDelay(100, btnSkinRelease)
      else
        itemSelected = item
        updateMarketplace(tabSelected, itemSelected)
        updateTableView()
        if horizontalTableView then
          horizontalTableView:startAt(itemSelected)
        end
      end
  end

  -- Button sizes are the original design sizes; the groups they live in scale them.
  btnBack = composer.newButton({
    image = "images/gui/common/buttonHome.png",
    width = 90,
    height = 57,
    onRelease = btnBackRelease,
    x = 0,
    y = 0
  })
  topGroup:insert(btnBack)
  btnBuy = composer.newButton({
    image = "images/gui/market/buttonBuy.png",
    text = {
      string = composer.localized.get("Buy"),
      size = 32
    },
    width = 83,
    height = 54,
    onRelease = btnBuyRelease,
    x = 0,
    y = 0
  })
  uiGroup:insert(btnBuy)
  btnSkin = composer.newButton({
    image = "images/gui/market/buttonSkins.png",
    width = 57,
    height = 53,
    onRelease = btnSkinRelease,
    x = 0,
    y = 0
  })
  uiGroup:insert(btnSkin)
  btnSkinBack = composer.newButton({
    image = "images/gui/market/buttonSkinsBack.png",
    width = 57,
    height = 53,
    onRelease = btnSkinRelease,
    x = 0,
    y = 0
  })
  uiGroup:insert(btnSkinBack)

  local function getTimeLeftInText(timeLeft)
    if timeLeft then
      local minutes = math.floor(timeLeft / 60)
      local hours = math.floor(minutes / 60)
      local days = math.floor(hours / 24)
      minutes = minutes - hours * 60
      hours = hours - days * 24
      local text = days .. "d " .. hours .. "h " .. minutes .. "m"
      return text
    end
    return ""
  end

  function updateTableView()
    if horizontalTableView then
      horizontalTableView:cleanUp()
      horizontalTableView = nil
    end
    tableViewData = {}
    local ownFirstItem = false
    local function getMarketItemImagePath(itemData, subfolder, fallback)
      if not itemData or not itemData.key then
        return fallback
      end
      local key = tostring(itemData.key)
      local path = "images/gui/market/items/" .. subfolder .. "/" .. key .. ".png"
      if system.pathForFile(path, system.ResourceDirectory) then
        return path
      end
      return fallback
    end
    for i = 1, #currentMarketData do
      local imagePath = currentMarketData[i].imagePath
      local plate = currentMarketData[i].plate
      local isBought = isItemBought(currentMarketData[i])
      currentMarketData[i].skinTitle = nil
      if isBought and i == 1 then
        ownFirstItem = true
      end
      if tabSelected == 1 then
        imagePath = getMarketItemImagePath(currentMarketData[i], "avatars", imagePath)
      elseif tabSelected == 2 then
        imagePath = getMarketItemImagePath(currentMarketData[i], "skins", imagePath)
      end
      tableViewData[i] = {
        image = imagePath,
        price = currentMarketData[i].price,
        gemPrice = currentMarketData[i].gemPrice,
        master = currentMarketData[i].master,
        weeklyPrice = currentMarketData[i].weeklyPrice,
        spinningPrize = currentMarketData[i].spinningPrize,
        seasonal = currentMarketData[i].seasonal,
        seasonalActive = currentMarketData[i].seasonalActive,
        achievementPrize = currentMarketData[i].achievementPrize,
        winsReq = currentMarketData[i].winsReq,
        saleKey = currentMarketData[i].saleKey,
        salePrice = currentMarketData[i].salePrice,
        saleTier = currentMarketData[i].saleTier,
        timeLeft = currentMarketData[i].saleTime,
        minBuild = currentMarketData[i].minBuild,
        tier = currentMarketData[i].tier,
        bought = isBought,
        equipped = tabSelected == 10 and isBought and composer.database.isPowerupSkinEquipped(currentMarketData[i].key),
        index = i,
        plateIndex = plate,
        key = currentMarketData[i].key,
        characterId = currentMarketData[i].characterId
      }
    end
    -- The strip scrolls in screen units; each cell is drawn in design units and scaled.
    local s = box.scale
    local cellWidth = ITEM_CELL_W * s
    local selectedLeft = toScreenX(SELECTED_CELL_LEFT)
    horizontalTableView = tableView.newList({
      data = tableViewData,
      onRelease = tableViewCellButtonRelease,
      onScrollEnd = onTableViewScrollEnd,
      -- Scrolling stops with the first or the last item in the selected slot.
      left = selectedLeft,
      right = display.contentWidth - (selectedLeft + cellWidth),
      screenWidth = display.contentWidth,
      centerX = selectedLeft,
      minTouchX = toScreenX(box.SL + PANEL_VISIBLE_W),
      width = cellWidth,
      height = ITEM_CELL_H * s,
      callback = function(data)
        local group = display.newGroup()
        group.xScale, group.yScale = s, s
        local masterLocked = false
        local haveLock = false
        local locked, priceText
        if data.bought or data.weeklyPrice or data.spinningPrize or data.achievementPrize then
          priceText = " "
        elseif data.price then
          priceText = data.price
          local priceBackground = display.newImageRect("images/gui/market/pricetag.png", 60, 18)
          priceBackground.x = 40
          priceBackground.y = 82
          group:insert(priceBackground)
        elseif data.gemPrice then
          priceText = data.gemPrice
          local priceBackground = display.newImageRect("images/gui/market/pricetagGems.png", 60, 18)
          priceBackground.x = 40
          priceBackground.y = 82
          group:insert(priceBackground)
        elseif data.tier and composer.config.offlineMode then
          -- There is no store offline: real-money items are claimed for 0 coins
          -- (see marketBuy), so don't show a dollar price.
          priceText = "0"
          local priceBackground = display.newImageRect("images/gui/market/pricetag.png", 60, 18)
          priceBackground.x = 40
          priceBackground.y = 82
          group:insert(priceBackground)
        elseif data.tier then
          priceText = inApp.getLocalizedPrice(data.tier, data.key)
          local priceBackground = display.newImageRect("images/gui/market/pricetagTier.png", 60, 18)
          priceBackground.x = 40
          priceBackground.y = 82
          group:insert(priceBackground)
        end
        if data.index == itemSelected then
          local selectedGlow = display.newImageRect("images/gui/market/selectedGlow.png", 74, 74)
          selectedGlow.x = 40
          selectedGlow.y = 40
          group:insert(selectedGlow)
        end
        if data.plateIndex then
          local plate = display.newImageRect("images/gui/market/items/plate/" .. data.plateIndex .. ".png", 35, 15)
          plate.x = 42
          plate.y = 64
          group:insert(plate)
        end
        if data.equipped then
          -- Powerup skin currently in use.
          local equippedIcon = display.newImageRect("images/gui/market/preOwned.png", 23, 20)
          equippedIcon.x = 40
          equippedIcon.y = 78
          group:insert(equippedIcon)
        elseif data.bought then
          local checkIcon = display.newImageRect("images/gui/market/check.png", 23, 20)
          checkIcon.x = 40
          checkIcon.y = 78
          group:insert(checkIcon)
        elseif data.key and tostring(data.key) == "101" then
          local preOwnedIcon = display.newImageRect("images/gui/market/preOwned.png", 23, 20)
          preOwnedIcon.x = 40
          preOwnedIcon.y = 78
          group:insert(preOwnedIcon)
        end
        if data.image then
          local icon = display.newImageRect(data.image, 52, 58)
          if icon then
            icon.x = 40
            icon.y = 33
            group:insert(icon)
          end
          if not data.bought then
          end
          if data.key and data.key == "402" and composer.onboarding.isActive == true then
            composer.onboarding.addGuiReference("market_glasses_icon", group)
            composer.onboarding.showGlassesArrow()
          end
        end
        if data.master then
          local currentWins = composer.database.getWinsForAvatar(currentMarketData[2].characterId)
          if currentWins < data.winsReq then
            masterLocked = true
          end
        elseif not data.bought then
          if data.weeklyPrice then
            masterLocked = true
          elseif data.spinningPrize then
            masterLocked = true
          elseif data.seasonal and not data.seasonalActive then
            masterLocked = true
          elseif data.achievementPrize then
            masterLocked = true
          elseif tabSelected == 8 and data.characterId and not boughtItems[tostring(data.characterId)] then
            masterLocked = true
          end
        end
        if not composer.config.offlineMode and data.index ~= 1 and (not ownFirstItem or masterLocked) then
          locked = display.newImageRect("images/gui/market/masterLocked.png", 37, 37)
          locked.x = 42
          locked.y = 40
          group:insert(locked)
          haveLock = true
        end
        if data.saleKey and not data.bought then
          local path, amount
          if data.salePrice then
            path = "images/gui/market/saleCoins.png"
            amount = math.ceil(data.salePrice / data.price * 100) - 100
            priceText = data.salePrice
          elseif data.saleTier and data.tier then
            path = "images/gui/market/saleCash.png"
            amount = math.ceil(data.saleTier / data.tier * 100) - 100
          end
          if path and amount then
            local bgTime = display.newImageRect("images/gui/market/timeleftGeneral.png", 74, 19)
            bgTime.x = 40
            bgTime.y = 68
            group:insert(bgTime)
            local timeLeftText = composer.newText({
              string = getTimeLeftInText(data.timeLeft),
              size = 10,
              x = bgTime.x - 12,
              y = bgTime.y,
              color = {
                1,
                1,
                1
              },
              ax = 0
            })
            group:insert(timeLeftText)
            local bg = display.newImageRect(path, 40, 35)
            bg.x = 48
            bg.y = 15
            group:insert(bg)
            local amountText = composer.newText({
              string = amount .. "%",
              size = 10,
              x = bg.x,
              y = bg.y + 4,
              color = {
                1,
                1,
                1
              }
            })
            group:insert(amountText)
          end
        end
        if data.seasonalActive and not data.bought then
          local bgTime = display.newImageRect("images/gui/market/timeleftGeneral.png", 74, 19)
          bgTime.x = 40
          bgTime.y = 68
          group:insert(bgTime)
          local timeLeftText = composer.newText({
            string = getTimeLeftInText(data.timeLeft),
            size = 10,
            x = bgTime.x - 12,
            y = bgTime.y,
            color = {
              1,
              1,
              1
            },
            ax = 0
          })
          group:insert(timeLeftText)
        end
        local priceLabel = composer.newText({
          string = priceText,
          size = 13,
          x = 35,
          y = 81,
          color = {
            1,
            1,
            1
          }
        })
        group:insert(priceLabel)

        local function isLocked()
          return haveLock
        end

        group.isLocked = isLocked

        local function bounceLock()
          if locked then
            transition.to(locked, {
              time = 80,
              xScale = 1.3,
              yScale = 1.3
            })
            transition.to(locked, {
              time = 100,
              delay = 200,
              xScale = 1,
              yScale = 1
            })
          end
        end

        group.bounceLock = bounceLock
        return group
      end
    })
    horizontalTableView.y = toScreenY(ITEM_ROW_TOP)
    listGroup:insert(horizontalTableView)
    horizontalTableView:startAt(itemSelected)
    itemStripGeometry = boxGeometry()
    updateItemTitle(itemSelected)
    updateBuyButtonState(itemSelected)
  end

  function clean()
    startedClean = true
    display.remove(btnBack)
    display.remove(btnBuy)
    display.remove(btnSkin)
    display.remove(btnSkinBack)
    storeTempMonsterChanges()
    local syncAvatarWithServer = false
    for i = 1, #startMonsterData do
      if startMonsterData[i] ~= monsterData[i] then
        syncAvatarWithServer = true
      end
    end
    if syncAvatarWithServer then
      composer.database.setAvatarData(monsterData)
      if composer.comm and composer.comm.setActiveCreature then
        composer.comm.setActiveCreature()
      end
    end
    composer.database.setMarketItemId(composer.config.serverVersion)
    itemTrailSelected = 0
    if itemTimer then
      timer.cancel(itemTimer)
      itemTimer = nil
    end
    transition.cancel("trails")
    if horizontalTableView then
      horizontalTableView:cleanUp()
      horizontalTableView = nil
    end
    if marketTable then
      marketTable.cleanTable()
      marketTable = nil
    end
    if monster then
      monster.clean()
      monster = nil
    end
    if powerUpPreviewImage then
      display.remove(powerUpPreviewImage)
      powerUpPreviewImage = nil
    end
    powerUpPreviewer.clean()
  end

  function scene:overlayEnded(data)
    composer.comm.setCallback(commCallback)
    if type(data) == "table" and data.localPurchase then
      -- Bought offline: show the item as owned (and equip it if it's a powerup skin).
      boughtItems = composer.database.getItems()
      updateMoneyLabel()
      updateMarketplace(tabSelected, itemSelected)
      updateTableView()
      return
    elseif type(data) == "table" then
      commCallback(data)
    end
    updateMoneyLabel()
    if itemSelected then
      updateBuyButtonState(itemSelected)
    end
  end

  createMarketButtonTable()
  if marketTableList[1].active then
    btnSaleRelease(nil, nil, true)
  else
    setUpForAvatar()
  end
  updateTableView()
  updateMoneyLabel()
  playItemEffect()
  composer.comm.setCallback(commCallback)
  if composer.onboarding.isActive == true then
    composer.onboarding.updateDisplayGroups(nil, screenGroup)
    composer.onboarding.addGuiReference("marketplace_back", btnBack)
  end
  if layoutMarketplace then
    layoutMarketplace()
  end
end

function scene:show(event)
  local phase = event.phase
  if phase == "will" then
    return
  end
  local screenGroup = self.view
  local androidLogic = require("lua.modules.androidBackButton")
  androidLogic.addBackButton("lua.scenes.mainMenu", "lua.scenes.marketplace")
  composer.database.resetMarketNotification()
  if not resizeListener then
    resizeListener = function()
      if layoutMarketplace then
        layoutMarketplace()
      end
    end
    Runtime:addEventListener("resize", resizeListener)
  end
  resizeListener()

  function cleanEnter()
    androidLogic.removeBackButton()
  end
end

function scene:hide(event)
  local phase = event.phase
  if phase == "did" then
    -- Everything was torn down in "will"; drop the scene so the next visit
    -- builds a fresh shop.
    composer.removeScene("lua.scenes.marketplace")
    return
  end
  if resizeListener then
    Runtime:removeEventListener("resize", resizeListener)
    resizeListener = nil
  end
  clean()
end

function scene:destroy(event)
  if resizeListener then
    Runtime:removeEventListener("resize", resizeListener)
    resizeListener = nil
  end
  if cleanEnter then
    cleanEnter()
    cleanEnter = nil
  end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene






