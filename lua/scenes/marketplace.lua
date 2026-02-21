local composer = require("composer")
local layoutGroup = require("lua.modules.layoutGroup")
local scene = composer.newScene()
local clean, cleanEnter
local marketBackground, backgroundCoins, backgroundRoof, backgroundBottom, leftBarImage, marketBackgroundBlur
local layoutMarketplace, resizeListener
local uiGroup, updateUiGroup
local UI_BASE_W, UI_BASE_H

function scene:create(event)
  local screenGroup = self.view
  UI_BASE_W = display.contentWidth
  UI_BASE_H = display.contentHeight
  uiGroup, updateUiGroup = layoutGroup.new(screenGroup, UI_BASE_W, UI_BASE_H)
  local tableHelper = require("lua.modules.tableHelper")
  local trailHelper = require("lua.modules.trails")
  local tcpFormat = require("lua.network.tcpMessageFormat")
  local httpsFormat = require("lua.network.httpsMessageFormat")
  local monsterLoader = require("spine-corona.monsterLoader")
  local tableView = require("lua.modules.tableViewHorizontal")
  local inApp = require("lua.iap.inAppPurchase")
  local leftBarDisplayGroup = display.newGroup()
  local title, moneyLabel
  local itemSelected = 1
  local tabSelected = 0
  local oldEffect = 0
  local itemTimer, horizontalTableView, currentMarketData, updateTableView, marketTable, marketTableList, monster, updateMoneyLabel, updateMarketplace, btnSkin, btnSkinBack, btnBuy, btnBack, tableViewData, masterSkinBackground, masterSkinInfo, masterSkinText, bubbleWindow
  local gemLabel, gemIcon
  local monsterData = composer.database.getAvatarData()
  local itemTrailSelected = monsterData[6]
  local startMonsterData = composer.tableHelper.deepCopy(monsterData)
  local moneyValue = composer.database.getMoney()
  local boughtItems = composer.database.getItems()
  local startedClean = false
  local marketBackgroundOffsetX = -2
  local marketBackgroundOffsetY = 0
  marketBackgroundBlur = display.newImageRect("images/gui/common/bgMain_blur.png", 1920, 1080)
  marketBackgroundBlur.anchorX = 1
  marketBackgroundBlur.anchorY = 1
  marketBackgroundBlur.x = marketBackgroundOffsetX
  marketBackgroundBlur.y = marketBackgroundOffsetY
  marketBackground = display.newImageRect("images/gui/market/bg.png", 2450, 992)
  marketBackground.anchorX = 1
  marketBackground.anchorY = 1
  marketBackground.x = marketBackgroundOffsetX
  marketBackground.y = marketBackgroundOffsetY
  backgroundCoins = display.newImageRect("images/gui/market/currentCoins.png", 86, 82)
  backgroundCoins.anchorX = 0
  backgroundCoins.anchorY = 0
  backgroundCoins.x = 726
  backgroundCoins.y = 2
  local backgroundRoofGroup = display.newGroup()
  local backgroundRoof0 = display.newImageRect(backgroundRoofGroup, "images/gui/market/roof.png", 480, 30)
  backgroundRoof = display.newImageRect(backgroundRoofGroup, "images/gui/market/roof.png", 480, 30)
  local backgroundRoof2 = display.newImageRect(backgroundRoofGroup, "images/gui/market/roof.png", 480, 30)
  backgroundRoof.anchorX = 0
  backgroundRoof.anchorY = 0
  backgroundRoof.x = 39
  backgroundRoof.y = -2
  backgroundRoof0.anchorX = 0
  backgroundRoof0.anchorY = 0
  backgroundRoof0.x = backgroundRoof.x - backgroundRoof.width + 4.5
  backgroundRoof0.y = backgroundRoof.y
  backgroundRoof2.anchorX = 0
  backgroundRoof2.anchorY = 0
  backgroundRoof2.x = backgroundRoof.x + backgroundRoof.width - 8
  backgroundRoof2.y = -2.05
  backgroundBottom = display.newImageRect("images/gui/market/categoryCover.png", 163, 80)
  backgroundBottom.anchorX = 0
  backgroundBottom.anchorY = 0
  backgroundBottom.x = 0
  backgroundBottom.y = 331
  leftBarImage = display.newImageRect("images/gui/market/categoryPanel.png", 130, 351)
  leftBarImage.anchorX = 0
  leftBarImage.anchorY = 0
  leftBarImage.x = -3
  leftBarImage.y = -3
  leftBarImage.height = leftBarImage.height + 0
  leftBarDisplayGroup:insert(leftBarImage)
  layoutMarketplace = function()
    local screenLeft = display.screenOriginX
    local screenTop = display.screenOriginY
    local screenWidth = display.actualContentWidth
    local screenHeight = display.actualContentHeight

    local contentLeft = 0
    local contentTop = 0
    local contentWidth = UI_BASE_W
    local contentHeight = UI_BASE_H

    if marketBackgroundBlur then
      marketBackgroundBlur.x = screenLeft + screenWidth + marketBackgroundOffsetX
      marketBackgroundBlur.y = screenTop + screenHeight + marketBackgroundOffsetY
      marketBackgroundBlur.xScale = 1
      marketBackgroundBlur.yScale = 1
      local scale = math.max(screenWidth / marketBackgroundBlur.width, screenHeight / marketBackgroundBlur.height)
      marketBackgroundBlur.xScale = scale
      marketBackgroundBlur.yScale = scale
    end
     if marketBackground then
      marketBackground.x = screenLeft + screenWidth + marketBackgroundOffsetX
      marketBackground.y = screenTop + screenHeight + marketBackgroundOffsetY
      marketBackground.xScale = 1
      marketBackground.yScale = 1
      local scale = math.max(screenWidth / marketBackground.width, screenHeight / marketBackground.height)
      marketBackground.xScale = scale
      marketBackground.yScale = scale
    end
    if backgroundRoof then
      backgroundRoofGroup.x = contentLeft + 39
      backgroundRoofGroup.y = contentTop - 2
      backgroundRoof.x = 0
      backgroundRoof.y = 0
      backgroundRoof0.x = -backgroundRoof.width + 4.5
      backgroundRoof0.y = 0
      backgroundRoof2.x = backgroundRoof.width - 8
      backgroundRoof2.y = -0.05
    end
    if backgroundBottom then
      backgroundBottom.x = contentLeft + 0
      backgroundBottom.y = contentTop + contentHeight - backgroundBottom.height
    end
    if leftBarImage then
      leftBarImage.x = contentLeft - 3
      leftBarImage.y = contentTop - 3
    end
    if backgroundCoins then
      backgroundCoins.x = contentLeft + 726
      backgroundCoins.y = contentTop + 2
    end
    if btnBack then
      btnBack.x = contentLeft + 4
      btnBack.y = contentTop + 341
    end
  end
  itemSelected = 1

  local function commCallback(data)
    if data.m == tcpFormat.purchaseItem() or data.m == httpsFormat.buyCrystalIOS() or data.m == httpsFormat.buyCrystalGoogle() or data.m == httpsFormat.buyCrystalAmazon() then
      boughtItems = composer.database.getItems()
      updateMoneyLabel()
      updateTableView()
    end
  end

  local function createItemEffect()
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
      if 1 < itemTrailSelected then
        createItemEffect()
        itemTimer = timer.performWithDelay(200, createItemEffect, 0)
      end
    end
  end

  local function changeAvatar(spriteType, index)
    if currentMarketData[index] == nil then
      return
    end
    if monster then
      monster.clean()
      monster = nil
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
          newMonsterData[2] = skinData.skinId
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
    elseif tabSelected == 10 then
    else
      newMonsterData[spriteType] = currentMarketData[itemSelected].key
    end
    monster = monsterLoader.new(newMonsterData)
    local monsterGroup = monster.getGroup()
    monsterGroup.xScale = 0.5
    monsterGroup.yScale = 0.5
    monsterGroup.x = 512
    monsterGroup.y = 208
    uiGroup:insert(monsterGroup)
    if newMonsterData[6] then
      itemTrailSelected = tonumber(newMonsterData[6])
      playItemEffect()
    end
  end

  local function findIndexOnKey(key)
    for i = 1, #currentMarketData do
      if tonumber(currentMarketData[i].key) == tonumber(key) then
        return i
      end
    end
  end

  local function findIndexOnId(key)
    key = tonumber(key)
    if key < 200 then
      return 1
    elseif key < 300 then
      return 2
    elseif key < 400 then
      return 3
    elseif key < 500 then
      return 4
    elseif key < 600 then
      return 5
    elseif key < 700 then
      return 6
    elseif key < 800 then
      return 7
    elseif 1000 < key and key < 1100 then
      return 10
    end
  end

  local function isItemBought(itemData)
    if itemData and boughtItems[tostring(itemData.key)] then
      return true
    elseif itemData and itemData.preOwned then
      return true
    end
    return false
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
    title = composer.newText({
      string = newTitle,
      size = 23,
      x = 488,
      y = 356,
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
      bubbleWindow:removeSelf()
      bubbleWindow = nil
    end
    if isItemBought(currentMarketData[index]) then
      return
    end
    if currentMarketData[index] == nil then
      return
    end

    local function addMasterSkinBackground()
      masterSkinBackground = display.newImageRect("images/gui/market/masterWindow.png", 112, 40)
      masterSkinBackground.x = 280
      masterSkinBackground.y = 359
      uiGroup:insert(masterSkinBackground)
    end

    if currentMarketData[index].master then
      local currentWins = composer.database.getWinsForAvatar(currentMarketData[index].characterId)
      local reqWins = currentMarketData[index].winsReq
      addMasterSkinBackground()
      if currentWins < reqWins then
        masterSkinInfo = composer.newText({
          string = composer.localized.get("WinsUnlock"),
          size = 14,
          x = 280,
          y = 365,
          color = {
            1,
            1,
            1
          }
        })
        local infoText = currentWins .. "/" .. reqWins
        masterSkinText = composer.newText({
          string = infoText,
          size = 14,
          x = 280,
          y = 351,
          color = {
            1,
            1,
            1
          }
        })
        uiGroup:insert(masterSkinInfo)
        uiGroup:insert(masterSkinText)
      else
        masterSkinInfo = composer.newText({
          string = composer.localized.get("Unlocked"),
          size = 14,
          x = 280,
          y = 304,
          color = {
            1,
            1,
            1
          }
        })
        uiGroup:insert(masterSkinInfo)
      end
    elseif currentMarketData[index].seasonal then
      addMasterSkinBackground()
      masterSkinInfo = composer.newText({
        string = composer.localized.get("seasonal"),
        size = 14,
        x = 281,
        y = 358,
        color = {
          1,
          1,
          1
        }
      })
      uiGroup:insert(masterSkinInfo)
    elseif currentMarketData[index].spinningPrize then
      addMasterSkinBackground()
      masterSkinInfo = composer.newText({
        string = composer.localized.get("SpinningPrize"),
        size = 14,
        x = 281,
        y = 358,
        color = {
          1,
          1,
          1
        }
      })
      uiGroup:insert(masterSkinInfo)
    elseif currentMarketData[index].achievementPrize then
      addMasterSkinBackground()
      masterSkinInfo = composer.newText({
        string = composer.localized.get("AchievementPrize"),
        size = 14,
        x = 281,
        y = 358,
        color = {
          1,
          1,
          1
        }
      })
      uiGroup:insert(masterSkinInfo)
    elseif currentMarketData[index].weeklyPrice then
      addMasterSkinBackground()
      masterSkinInfo = composer.newText({
        string = composer.localized.get("WeeklyPrize"),
        size = 14,
        x = 281,
        y = 358,
        color = {
          1,
          1,
          1
        }
      })
      uiGroup:insert(masterSkinInfo)
    elseif tabSelected == 8 and currentMarketData[itemSelected].characterId and not boughtItems[tostring(currentMarketData[itemSelected].characterId)] then
      addMasterSkinBackground()
      local text = composer.localized.get("Buy") ..
          " " ..
          composer.storeConfig.getItem(currentMarketData[itemSelected].characterId).title ..
          " " .. composer.localized.get("First")
      masterSkinInfo = composer.newText({
        string = text,
        size = 14,
        x = 281,
        y = 358,
        color = {
          1,
          1,
          1
        }
      })
      uiGroup:insert(masterSkinInfo)
    elseif tabSelected == 8 and findIndexOnId(currentMarketData[itemSelected].key) == 10 then
      addMasterSkinBackground()
      local text = composer.localized.get("Forever")
      if currentMarketData[itemSelected].mysteryBox then
        text = composer.localized.get("youandfriends")
      end
      masterSkinInfo = composer.newText({
        string = text,
        size = 18,
        x = 282,
        y = 354,
        color = {
          1,
          1,
          1
        }
      })
      uiGroup:insert(masterSkinInfo)
      if masterSkinBackground then
        masterSkinBackground.y = 355
      end
      bubbleWindow = display.newImageRect(
        "images/gui/market/items/boosts/" .. currentMarketData[itemSelected].key .. "_2.png", 100, 69)
      bubbleWindow.x = 420
      bubbleWindow.y = 92
      uiGroup:insert(bubbleWindow)
    elseif not isItemBought(currentMarketData[1]) and tabSelected == 2 and itemSelected ~= 1 then
      addMasterSkinBackground()
      local text = composer.localized.get("Buy") ..
          " " .. currentMarketData[1].title .. " " .. composer.localized.get("First")
      masterSkinInfo = composer.newText({
        string = text,
        size = 14,
        x = 281,
        y = 358,
        color = {
          1,
          1,
          1
        }
      })
      uiGroup:insert(masterSkinInfo)
    end
  end

  local function updateBuyButtonState(index)
    if composer.config.offlineMode then
      if index and isItemBought(currentMarketData[index]) then
        btnBuy.isVisible = false
      else
        btnBuy.isVisible = true
      end
      return
    end
    if index and currentMarketData[index].spinningPrize then
      btnBuy.isVisible = false
    elseif index and currentMarketData[index].weeklyPrice then
      btnBuy.isVisible = false
    elseif index and currentMarketData[index].seasonal and not currentMarketData[index].seasonalActive then
      btnBuy.isVisible = false
    elseif index and currentMarketData[index].achievementPrize then
      btnBuy.isVisible = false
    elseif index and isItemBought(currentMarketData[index]) then
      btnBuy.isVisible = false
    else
      btnBuy.isVisible = true
    end
  end

  function updateMarketplace(spriteType, newIndex)
    composer.debugger.debugTable("network", "currentMarketData :", currentMarketData)
    local index = tonumber(newIndex)
    local slotToChange = spriteType
    if index == 0 then
      index = 1
    elseif spriteType == 8 then
      if 100 < index then
        index = findIndexOnId(index)
      end
      slotToChange = findIndexOnId(currentMarketData[index].key)
    elseif 100 < index then
      index = findIndexOnKey(index)
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
    moneyLabel = composer.newText({
      string = moneyValue,
      size = 14,
      x = 754,
      y = 71,
      ax = 0,
      color = {
        1,
        1,
        1
      }
    })
    uiGroup:insert(moneyLabel)
    gemLabel = composer.newText({
      string = composer.database.getGems(),
      size = 14,
      x = 754,
      y = 43,
      ax = 0,
      color = {
        1,
        1,
        1
      }
    })
    uiGroup:insert(gemLabel)
  end

  local function flashLabel(label)
    if not label then
      return
    end
    label:setFillColor(1, 0.2, 0.2)
    transition.to(label, { time = 150, xScale = 1.1, yScale = 1.1 })
    transition.to(label, {
      time = 150,
      delay = 150,
      xScale = 1,
      yScale = 1,
      onComplete = function()
        if label then
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
    local equippedMonsterData = composer.database.getAvatarData() or monsterData
    local inedxToSearchFor = tonumber(equippedMonsterData[tabSelected])
    if currentMonster then
      if tabSelected == 1 then
        inedxToSearchFor = currentMonster
      else
        inedxToSearchFor = composer.database.getDefaultSkinForAvatar(currentMonster)
      end
    end
    for i = 1, #currentMarketData do
      if tonumber(currentMarketData[i].key) == tonumber(inedxToSearchFor) then
        itemSelected = i
        return
      end
    end
    itemSelected = 1
  end

  local function btnBackRelease(event)
    if composer.onboarding.isActive == true then
      composer.onboarding.stepDone()
    else
      composer.gotoScene("lua.scenes.mainMenu")
      composer.removeScene("lua.scenes.marketplace")
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
    if tabSelected == 2 then
      giveNoticeOfSkinChanges()
    end
    local boughtItem = isItemBought(currentMarketData[itemSelected])
    if boughtItem then
      if tabSelected == 2 and itemSelected == 1 then
        monsterData[tabSelected] = currentMarketData[itemSelected].skinId
      elseif tabSelected == 1 or tabSelected == 2 then
        if tabSelected == 1 then
          monsterData[1] = currentMarketData[itemSelected].key
        end
        monsterData[2] = composer.database.getDefaultSkinForAvatar(monsterData[1])
      elseif tabSelected == 8 then
        local itemType = currentMarketData[itemSelected].itemType
        if itemType then
          monsterData[itemType] = currentMarketData[itemSelected].key
        end
      else
        monsterData[tabSelected] = currentMarketData[itemSelected].key
      end
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
    end
    findItemSelectedForSpriteType(currentMonster)
    if tabSelected == 2 or tabSelected == 8 or tabSelected == 1 and currentMonster then
      updateMarketplace(tabSelected, currentMonster)
      if (tabSelected == 8 or tabSelected == 1) and marketTable.getTable():getRowAtIndex(selectIndex) then
        marketTable.getTable():getRowAtIndex(selectIndex).setActiveState(true)
      end
    else
      updateMarketplace(tabSelected, monsterData[tabSelected])
      marketTable.getTable():getRowAtIndex(selectIndex).setActiveState(true)
    end
    if tabSelected == 1 then
      btnSkin.isVisible = true
      btnSkinBack.isVisible = false
    elseif tabSelected == 2 then
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
    local bearIndex = findIndexOnKey(101)
    if bearIndex then
      itemSelected = bearIndex
    end
    updateMarketTabSelected(1, 101)
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

  marketTable = tableHelper.new(3, 44, 120, 300, 58, nil, "market", function()
  end, 32)

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
    marketTable.createTable(marketTableList, leftBarDisplayGroup)
  end

  local function tableViewCellButtonRelease()
  end

  local function isLocked()
    if horizontalTableView.dataTable and horizontalTableView.dataTable[itemSelected] then
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

  btnBack = composer.newButton({
    image = "images/gui/common/buttonHome.png",
    width = 130,
    height = 75,
    onRelease = btnBackRelease,
    x = 73,
    y = 37
  })
  btnBuy = composer.newButton({
    image = "images/gui/market/buttonBuy.png",
    text = {
      string = composer.localized.get("Buy"),
      size = 32
    },
    width = 73,
    height = 44,
    onRelease = btnBuyRelease,
    x = 715,
    y = 362
  })
  btnSkin = composer.newButton({
    image = "images/gui/market/buttonSkins.png",
    width = 49,
    height = 45,
    onRelease = btnSkinRelease,
    x = 639,
    y = 361
  })
  btnSkinBack = composer.newButton({
    image = "images/gui/market/buttonSkinsBack.png",
    width = 49,
    height = 45,
    onRelease = btnSkinRelease,
    x = 639,
    y = 361
  })

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
        index = i,
        plateIndex = plate,
        key = currentMarketData[i].key,
        characterId = currentMarketData[i].characterId
      }
    end
    horizontalTableView = tableView.newList({
      data = tableViewData,
      onRelease = tableViewCellButtonRelease,
      onScrollEnd = onTableViewScrollEnd,
      left = 250,
      right = 0,
      width = 80,
      height = 80,
      callback = function(data)
        local group = display.newGroup()
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
        if data.bought then
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
    horizontalTableView.anchorX = 0
    horizontalTableView.anchorY = 1
    horizontalTableView.anchorChildren = true
    horizontalTableView.x = 145
    horizontalTableView.y = 332
    uiGroup:insert(horizontalTableView)
    horizontalTableView:startAt(itemSelected)
    updateItemTitle(itemSelected)
    uiGroup:insert(leftBarDisplayGroup)
  end

  local function updateDisplayGroup()
    screenGroup:insert(1, marketBackgroundBlur)
    screenGroup:insert(2, marketBackground)
    uiGroup:insert(leftBarDisplayGroup)
    leftBarDisplayGroup:insert(marketTable.getTable())
    leftBarDisplayGroup:insert(backgroundBottom)
    uiGroup:insert(backgroundCoins)
    leftBarDisplayGroup:insert(backgroundRoofGroup)
    leftBarDisplayGroup:insert(btnBack)
    uiGroup:insert(btnBuy)
    uiGroup:insert(btnSkin)
    uiGroup:insert(btnSkinBack)
    if layoutMarketplace then
      layoutMarketplace()
    end
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
      composer.comm.setActiveCreature()
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
  end

  function scene:overlayEnded(data)
    composer.comm.setCallback(commCallback)
    if data and type(data) == "table" then
      commCallback(data)
    end
    updateMoneyLabel()
    if itemSelected then
      updateBuyButtonState(itemSelected)
    end
  end

  createMarketButtonTable()
  updateDisplayGroup()
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
  resizeListener = function()
    if updateUiGroup then
      updateUiGroup()
    end
    if layoutMarketplace then
      layoutMarketplace()
    end
  end
  Runtime:addEventListener("resize", resizeListener)
  resizeListener()

  function cleanEnter()
    androidLogic.removeBackButton()
  end
end

function scene:hide(event)
  local phase = event.phase
  if phase == "did" then
    return
  end
  if resizeListener then
    Runtime:removeEventListener("resize", resizeListener)
    resizeListener = nil
  end
  local syncAvatarWithServer = false
  clean()
end

function scene:destroy(event)
  cleanEnter()
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene






