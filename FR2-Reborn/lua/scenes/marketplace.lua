local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter

function scene:create(event)
  local screenGroup = self.view
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
  local itemTimer, horizontalTableView, currentMarketData, updateTableView, marketTable, marketTableList, monster, updateMoneyLabel, updateMarketplace, btnSkin, btnSkinBack, btnBuy, tableViewData, masterSkinBackground, masterSkinInfo, masterSkinText, bubbleWindow
  local monsterData = composer.database.getAvatarData()
  local itemTrailSelected = monsterData[6]
  local startMonsterData = composer.tableHelper.deepCopy(monsterData)
  local moneyValue = composer.database.getMoney()
  local boughtItems = composer.database.getItems()
  local startedClean = false
  local marketBackground = display.newImageRect("images/gui/market/bg.png", 480, 320)
  marketBackground.anchorX = 0
  marketBackground.anchorY = 0
  marketBackground.x = 0
  marketBackground.y = 0
  local backgroundCoins = display.newImageRect("images/gui/market/currentCoins.png", 70, 53)
  backgroundCoins.anchorX = 0
  backgroundCoins.anchorY = 0
  backgroundCoins.x = 400
  backgroundCoins.y = 0
  local backgroundRoof = display.newImageRect("images/gui/market/roof.png", 480, 30)
  backgroundRoof.anchorX = 0
  backgroundRoof.anchorY = 0
  backgroundRoof.x = 0
  backgroundRoof.y = 0
  local backgroundBottom = display.newImageRect("images/gui/market/categoryCover.png", 119, 80)
  backgroundBottom.anchorX = 0
  backgroundBottom.anchorY = 1
  backgroundBottom.x = 0
  backgroundBottom.y = 320
  local leftBarImage = display.newImageRect("images/gui/market/categoryPanel.png", 117, 261)
  leftBarImage.anchorX = 0
  leftBarImage.anchorY = 0
  leftBarImage.x = 0
  leftBarImage.y = 0
  leftBarDisplayGroup:insert(leftBarImage)
  itemSelected = 1
  
  local function commCallback(data)
    if data.m == tcpFormat.purchaseItem() or data.m == httpsFormat.buyCrystalIOS() or data.m == httpsFormat.buyCrystalGoogle() or data.m == httpsFormat.buyCrystalAmazon() then
      boughtItems = composer.database.getItems()
      updateMoneyLabel()
      updateTableView()
    end
  end
  
  local function createItemEffect()
    trailHelper.createTrail(itemTrailSelected, monster.getGroup().x - 5, monster.getGroup().y - 50, screenGroup)
    screenGroup:insert(monster.getGroup())
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
    local newMonsterData = composer.tableHelper.deepCopy(monsterData)
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
    monsterGroup.x = 290
    monsterGroup.y = 164
    screenGroup:insert(monsterGroup)
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
      size = 14,
      x = 280,
      y = 278,
      color = {
        1,
        1,
        1
      }
    })
    screenGroup:insert(title)
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
      masterSkinBackground = display.newImageRect("images/gui/market/masterWindow.png", 100, 32)
      masterSkinBackground.x = 280
      masterSkinBackground.y = 304
      screenGroup:insert(masterSkinBackground)
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
          y = 310,
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
          y = 298,
          color = {
            1,
            1,
            1
          }
        })
        screenGroup:insert(masterSkinInfo)
        screenGroup:insert(masterSkinText)
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
        screenGroup:insert(masterSkinInfo)
      end
    elseif currentMarketData[index].seasonal then
      addMasterSkinBackground()
      masterSkinInfo = composer.newText({
        string = composer.localized.get("seasonal"),
        size = 14,
        x = 280,
        y = 304,
        color = {
          1,
          1,
          1
        }
      })
      screenGroup:insert(masterSkinInfo)
    elseif currentMarketData[index].spinningPrize then
      addMasterSkinBackground()
      masterSkinInfo = composer.newText({
        string = composer.localized.get("SpinningPrize"),
        size = 14,
        x = 280,
        y = 304,
        color = {
          1,
          1,
          1
        }
      })
      screenGroup:insert(masterSkinInfo)
    elseif currentMarketData[index].achievementPrize then
      addMasterSkinBackground()
      masterSkinInfo = composer.newText({
        string = composer.localized.get("AchievementPrize"),
        size = 14,
        x = 280,
        y = 304,
        color = {
          1,
          1,
          1
        }
      })
      screenGroup:insert(masterSkinInfo)
    elseif currentMarketData[index].weeklyPrice then
      addMasterSkinBackground()
      masterSkinInfo = composer.newText({
        string = composer.localized.get("WeeklyPrize"),
        size = 14,
        x = 280,
        y = 304,
        color = {
          1,
          1,
          1
        }
      })
      screenGroup:insert(masterSkinInfo)
    elseif tabSelected == 8 and currentMarketData[itemSelected].characterId and not boughtItems[tostring(currentMarketData[itemSelected].characterId)] then
      addMasterSkinBackground()
      local text = composer.localized.get("Buy") .. " " .. composer.storeConfig.getItem(currentMarketData[itemSelected].characterId).title .. " " .. composer.localized.get("First")
      masterSkinInfo = composer.newText({
        string = text,
        size = 14,
        x = 280,
        y = 304,
        color = {
          1,
          1,
          1
        }
      })
      screenGroup:insert(masterSkinInfo)
    elseif tabSelected == 8 and findIndexOnId(currentMarketData[itemSelected].key) == 10 then
      addMasterSkinBackground()
      local text = composer.localized.get("Forever")
      if currentMarketData[itemSelected].mysteryBox then
        text = composer.localized.get("youandfriends")
      end
      masterSkinInfo = composer.newText({
        string = text,
        size = 14,
        x = 280,
        y = 304,
        color = {
          1,
          1,
          1
        }
      })
      screenGroup:insert(masterSkinInfo)
      bubbleWindow = display.newImageRect("images/gui/market/items/boosts/" .. currentMarketData[itemSelected].key .. "_2.png", 100, 69)
      bubbleWindow.x = 210
      bubbleWindow.y = 50
      screenGroup:insert(bubbleWindow)
    elseif not isItemBought(currentMarketData[1]) and tabSelected == 2 and itemSelected ~= 1 then
      addMasterSkinBackground()
      local text = composer.localized.get("Buy") .. " " .. currentMarketData[1].title .. " " .. composer.localized.get("First")
      masterSkinInfo = composer.newText({
        string = text,
        size = 14,
        x = 280,
        y = 304,
        color = {
          1,
          1,
          1
        }
      })
      screenGroup:insert(masterSkinInfo)
    end
  end
  
  local function updateBuyButtonState(index)
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
    moneyLabel = composer.newText({
      string = moneyValue,
      size = 14,
      x = 424,
      y = 40,
      ax = 0,
      color = {
        1,
        1,
        1
      }
    })
    screenGroup:insert(moneyLabel)
  end
  
  local function findItemSelectedForSpriteType(currentMonster)
    local inedxToSearchFor = tonumber(monsterData[tabSelected])
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
    updateMarketTabSelected(1, oldMonster)
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
  
  marketTable = tableHelper.new(4, 0, 100, 240, 58, nil, "market", function()
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
    if composer.storeConfig.isThereNewItems(101) then
      marketTableList[2].newItem = true
    end
    if composer.storeConfig.isThereNewItems(201) then
      marketTableList[2].newItem = true
    end
    if composer.storeConfig.isThereNewItems(301) then
      marketTableList[3].newItem = true
    end
    if composer.storeConfig.isThereNewItems(401) then
      marketTableList[4].newItem = true
    end
    if composer.storeConfig.isThereNewItems(501) then
      marketTableList[5].newItem = true
    end
    if composer.storeConfig.isThereNewItems(601) then
      marketTableList[6].newItem = true
    end
    if composer.storeConfig.isThereNewItems(701) then
      marketTableList[7].newItem = true
    end
    if not marketTableList[1].active then
      marketTableList[2].active = true
    end
    marketTable.createTable(marketTableList, screenGroup)
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
    if isLocked() then
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
        params = {item = item, itemIAPStatus = itemIAPStatus}
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
    end
  end
  
  local btnBack = composer.newButton({
    image = "images/gui/common/buttonHome.png",
    width = 90,
    height = 57,
    onRelease = btnBackRelease,
    x = 50,
    y = 292
  })
  btnBuy = composer.newButton({
    image = "images/gui/market/buttonBuy.png",
    text = {
      string = composer.localized.get("Buy"),
      size = 32
    },
    width = 83,
    height = 54,
    onRelease = btnBuyRelease,
    x = 437,
    y = 291
  })
  btnSkin = composer.newButton({
    image = "images/gui/market/buttonSkins.png",
    width = 57,
    height = 53,
    onRelease = btnSkinRelease,
    x = 365,
    y = 291
  })
  btnSkinBack = composer.newButton({
    image = "images/gui/market/buttonSkinsBack.png",
    width = 57,
    height = 53,
    onRelease = btnSkinRelease,
    x = 365,
    y = 291
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
    for i = 1, #currentMarketData do
      local imagePath = currentMarketData[i].imagePath
      local plate = currentMarketData[i].plate
      local isBought = isItemBought(currentMarketData[i])
      currentMarketData[i].skinTitle = nil
      if isBought and i == 1 then
        ownFirstItem = true
      end
      if tabSelected == 1 and isBought then
        local skinInfo = boughtItems[tostring(currentMarketData[i].key)]
        if skinInfo then
          local defaultSkin = skinInfo.s
          if defaultSkin and defaultSkin ~= 0 then
            local skinData = composer.storeConfig.getItem(tonumber(defaultSkin))
            imagePath = "images/gui/market/items/avatars/" .. defaultSkin .. ".png"
            plate = skinData.plate
            currentMarketData[i].skinTitle = skinData.title
          end
        end
      end
      tableViewData[i] = {
        image = imagePath,
        price = currentMarketData[i].price,
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
        elseif data.tier then
          priceText = inApp.getLocalizedPrice(data.tier, data.key)
          local priceBackground = display.newImageRect("images/gui/market/pricetagTier.png", 60, 18)
          priceBackground.x = 40
          priceBackground.y = 82
          group:insert(priceBackground)
        end
        if data.plateIndex then
          local plate = display.newImageRect("images/gui/market/items/plate/" .. data.plateIndex .. ".png", 35, 15)
          plate.x = 42
          plate.y = 64
          group:insert(plate)
        end
        if data.image then
          local icon = display.newImageRect(data.image, 52, 58)
          icon.x = 40
          icon.y = 33
          group:insert(icon)
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
        if data.index ~= 1 and (not ownFirstItem or masterLocked) then
          locked = display.newImageRect("images/gui/market/masterLocked.png", 37, 37)
          locked.x = 42
          locked.y = 40
          group:insert(locked)
          haveLock = true
        end
        if data.minBuild and data.minBuild > composer.database.getMarketItemId() then
          local bg = display.newImageRect("images/gui/market/newItemSmall.png", 23, 20)
          bg.x = 10
          bg.y = 81
          group:insert(bg)
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
    horizontalTableView.y = 264
    screenGroup:insert(horizontalTableView)
    horizontalTableView:startAt(itemSelected)
    updateItemTitle(itemSelected)
    screenGroup:insert(leftBarDisplayGroup)
  end
  
  local function updateDisplayGroup()
    screenGroup:insert(marketBackground)
    screenGroup:insert(leftBarDisplayGroup)
    leftBarDisplayGroup:insert(marketTable.getTable())
    leftBarDisplayGroup:insert(backgroundBottom)
    screenGroup:insert(backgroundCoins)
    leftBarDisplayGroup:insert(backgroundRoof)
    leftBarDisplayGroup:insert(btnBack)
    screenGroup:insert(btnBuy)
    screenGroup:insert(btnSkin)
    screenGroup:insert(btnSkinBack)
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
  
  function cleanEnter()
    androidLogic.removeBackButton()
  end
end

function scene:hide(event)
  local phase = event.phase
  if phase == "did" then
    return
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
