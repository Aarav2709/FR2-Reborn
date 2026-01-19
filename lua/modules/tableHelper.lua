local M = {}
local widget = require("widget")
local composer = require("composer")
local chatFormat = require("lua.network.chatMessageFormat")

local function new(x, y, width, height, cellHeight, background, scene, callback, topPadding)
  local functionList = {}
  local tableCellTouch = false
  local tableView, cellTimer
  
  local function tableViewListener(event)
    local phase = event.phase
    local row = event.target
    if "began" == phase then
      tableCellTouch = true
    elseif "moved" == phase then
      tableCellTouch = false
    elseif "ended" == phase then
      if tableCellTouch then
        if scene == "ranking" and row.getPlayerData then
          callback(row.getPlayerData(), row.getIndex())
          row.setSelected(true)
        end
        if scene == "challenge" and row.getChallengeData then
          callback(row.getChallengeData())
        end
        if scene == "market" and row.clickButton then
          row.clickButton()
        end
        if scene == "settings" and row.clickButton then
          row.clickButton()
        end
        if scene == "map" and row.setThisMapActive then
          row.setThisMapActive()
          callback(row.getId())
        end
        if scene == "friends" then
          if event.x > 420 and row.getId then
            callback(row.getId())
          elseif row.toggleName then
            row.toggleName()
          end
        end
        if scene == "findFriends" and event.x > 317 and row.getPlayerInfo then
          callback(row.getPlayerInfo())
        end
        if scene == "friendsSettings1" then
          if row.openGift then
            if event.x > 330 then
              callback(row.openGift())
            end
          elseif row.acceptRequest and row.deleteRequest then
            if event.x > 330 then
              callback(row.deleteRequest())
            elseif event.x > 270 then
              callback(row.acceptRequest())
            end
          end
        end
        if scene == "friendsSettings2" then
          print("row.isMysteryBox ", row.isMysteryBox)
          if row.isMysteryBox then
            if event.x > 330 then
              callback(row.sendMysterybox())
            elseif row.toggleName then
              row.toggleName()
            end
          elseif row.isRequest then
            if row.isRequest() then
              if event.x > 330 then
                callback(row.declineFriend())
              elseif event.x > 270 then
                callback(row.acceptFriend())
              end
            elseif event.x > 330 then
              callback(row.deleteFriend())
            elseif row.toggleName then
              row.toggleName()
            end
          end
        end
        if scene == "friendsSettings3" then
        end
      end
      tableCellTouch = false
    end
  end
  
  local function onRowRenderSettingsGameInvites(event)
    local phase = event.phase
    local row = event.row
    local params = row.params
    local background = display.newImageRect("images/gui/friends/cell.png", 256, 51)
    background.anchorX = 0
    background.anchorY = 0
    row:insert(background)
    background.x = 10
    background.y = 0
    if params.username then
      local name = composer.newText({
        string = params.username,
        size = 25,
        x = background.x + 42,
        y = row.contentHeight * 0.43,
        ax = 0
      })
      row:insert(name)
    elseif params.mysteryBox and params.f then
      local name = composer.newText({
        string = composer.localized.get("gift") .. params.f,
        size = 25,
        x = background.x + 42,
        y = row.contentHeight * 0.43,
        ax = 0
      })
      row:insert(name)
    end
    local iconPath
    if params.mysteryBox then
      local open = display.newImageRect("images/gui/friends/openMysterybox.png", 36, 36)
      open.anchorX = 0
      open.anchorY = 0
      row:insert(open)
      open.x = background.x + 212
      open.y = 6
      iconPath = "images/gui/friends/messageIconMysterybox.png"
    else
      local accept = display.newImageRect("images/gui/friends/roundAccept.png", 36, 36)
      accept.anchorX = 0
      accept.anchorY = 0
      row:insert(accept)
      accept.x = background.x + 162
      accept.y = 6
      local decline = display.newImageRect("images/gui/friends/roundDecline.png", 36, 36)
      decline.anchorX = 0
      decline.anchorY = 0
      row:insert(decline)
      decline.x = background.x + 212
      decline.y = 6
      iconPath = "images/gui/friends/messageIconInvite.png"
    end
    local icon = display.newImageRect(iconPath, 30, 30)
    icon.anchorX = 0
    icon.anchorY = 0
    row:insert(icon)
    icon.x = background.x + 5
    icon.y = 8
    
    local function deleteRequest()
      return 1, params.p
    end
    
    local function acceptRequest()
      return 2, params.p, params.s, params.a
    end
    
    local function openGift()
      return 3, nil, nil, nil, params
    end
    
    row.deleteRequest = deleteRequest
    row.acceptRequest = acceptRequest
    if params.mysteryBox then
      row.openGift = openGift
    end
  end
  
  local function onRowRenderSettingsFriendsInvite(event)
    local phase = event.phase
    local row = event.row
    local params = row.params
    local delete
    local showDelete = params.showDelete
    local background = display.newImageRect("images/gui/friends/cell.png", 256, 51)
    background.anchorX = 0
    background.anchorY = 0
    row:insert(background)
    background.x = 10
    background.y = 0
    local text
    if params.n2 then
      text = params.n2
    elseif params.n then
      text = params.n
    end
    local name = composer.newText({
      string = text,
      size = 25,
      x = background.x + 42,
      y = row.contentHeight * 0.43,
      ax = 0
    })
    row:insert(name)
    local facebookName
    if params.facebookName then
      facebookName = composer.newText({
        string = params.facebookName,
        size = 25,
        x = background.x + 42,
        y = row.contentHeight * 0.43,
        ax = 0
      })
      row:insert(facebookName)
      facebookName.isVisible = false
      local fbIcon = display.newImageRect("images/gui/friends/fb.png", 30, 30)
      fbIcon.anchorX = 0
      fbIcon.anchorY = 0
      row:insert(fbIcon)
      fbIcon.x = background.x + 5
      fbIcon.y = 8
    end
    if params.request then
      local accept = display.newImageRect("images/gui/friends/roundAccept.png", 36, 36)
      accept.anchorX = 0
      accept.anchorY = 0
      row:insert(accept)
      accept.x = background.x + 162
      accept.y = 6
      local decline = display.newImageRect("images/gui/friends/roundDecline.png", 36, 36)
      decline.anchorX = 0
      decline.anchorY = 0
      row:insert(decline)
      decline.x = background.x + 212
      decline.y = 6
    elseif params.isMysteryBox then
      local send = display.newImageRect("images/gui/friends/sendMysterybox.png", 36, 36)
      send.anchorX = 0
      send.anchorY = 0
      row:insert(send)
      send.x = background.x + 212
      send.y = 6
      row.isMysteryBox = true
    else
      delete = display.newImageRect("images/gui/friends/roundDelete.png", 36, 36)
      delete.anchorX = 0
      delete.anchorY = 0
      row:insert(delete)
      delete.x = background.x + 212
      delete.y = 6
      if not showDelete then
        delete.isVisible = false
      end
    end
    
    local function deleteFriend()
      if showDelete then
        return 1, params.p, params.rowIndex
      else
        return 0
      end
    end
    
    local function declineFriend()
      return 2, params.p, params.rowIndex
    end
    
    local function acceptFriend()
      return 3, params.p
    end
    
    local function sendMysterybox()
      return 4, params.p
    end
    
    local function isRequest()
      return params.request
    end
    
    local function toggleName()
      if facebookName then
        if facebookName.isVisible then
          facebookName.isVisible = false
          name.isVisible = true
        else
          facebookName.isVisible = true
          name.isVisible = false
        end
      end
    end
    
    row.deleteFriend = deleteFriend
    row.declineFriend = declineFriend
    row.acceptFriend = acceptFriend
    row.isRequest = isRequest
    row.toggleName = toggleName
    row.sendMysterybox = sendMysterybox
  end
  
  local function onRowRenderSettingsFacebook(event)
    local phase = event.phase
    local row = event.row
    local params = row.params
    local background = display.newImageRect("images/gui/friends/cell.png", 256, 51)
    background.anchorX = 0
    background.anchorY = 0
    row:insert(background)
    background.x = 10
    background.y = 0
    local name = composer.newText({
      string = params.name,
      size = 25,
      x = background.x + 42,
      y = row.contentHeight * 0.43,
      ax = 0
    })
    row:insert(name)
    local fbIcon = display.newImageRect("images/gui/friends/fb.png", 30, 30)
    fbIcon.anchorX = 0
    fbIcon.anchorY = 0
    row:insert(fbIcon)
    fbIcon.x = background.x + 5
    fbIcon.y = 8
  end
  
  local function onRowRenderAddFriend(event)
    local phase = event.phase
    local row = event.row
    local params = row.params
    local background = display.newImageRect("images/gui/friends/cell.png", 256, 51)
    background.anchorX = 0
    background.anchorY = 0
    row:insert(background)
    background.x = 10
    background.y = 0
    local fullName
    if params.n and params.t then
      fullName = params.n .. "#" .. params.t
    else
      fullName = "Error"
    end
    local name = composer.newText({
      string = fullName,
      size = 25,
      x = background.x + 10,
      y = row.contentHeight * 0.43,
      ax = 0
    })
    row:insert(name)
    local image = display.newImageRect("images/gui/friends/roundAdd.png", 36, 36)
    image.anchorX = 0
    image.anchorY = 0.5
    row:insert(image)
    image.x = background.x + 212
    image.y = row.contentHeight * 0.35
    local imageSent = display.newImageRect("images/gui/friends/roundAccept.png", 36, 36)
    imageSent.anchorX = 0
    imageSent.anchorY = 0.5
    row:insert(imageSent)
    imageSent.x = background.x + 212
    imageSent.y = row.contentHeight * 0.35
    imageSent.isVisible = false
    
    local function changeImage()
      imageSent.isVisible = true
    end
    
    row.changeImage = changeImage
    if params.p then
      local function getPlayerInfo()
        changeImage()
        
        return params.p
      end
      
      row.getPlayerInfo = getPlayerInfo
    end
  end
  
  local function onRowRenderFriends(event)
    local phase = event.phase
    local row = event.row
    local params = row.params
    local id
    local background = display.newImageRect("images/gui/ranking/cell.png", row.contentWidth, row.contentHeight)
    background.anchorX = 0
    background.anchorY = 0
    row:insert(background)
    background.x = 0
    background.y = 0
    if params.title then
      local title = composer.newText({
        string = params.title,
        size = 20,
        x = 20,
        y = 20,
        ax = 0,
        color = {
          0,
          0,
          0,
          0.5
        }
      })
      row:insert(title)
      return
    end
    if params.image then
      local image = display.newImageRect(params.image, 60, 60)
      image.anchorX = 0
      image.anchorY = 0
      row:insert(image)
      image.x = 5
      image.y = 20
    end
    local username, text
    if params.n2 then
      text = params.n2
    elseif params.n then
      text = params.n
    end
    if text then
      username = composer.newText({
        string = text,
        size = 20,
        x = 20,
        y = 20,
        ax = 0
      })
      row:insert(username)
    end
    local facebookName
    if params.facebookName then
      facebookName = composer.newText({
        string = params.facebookName,
        size = 20,
        x = 20,
        y = 20,
        ax = 0
      })
      row:insert(facebookName)
      facebookName.isVisible = false
      local fbIcon = display.newImageRect("images/gui/friends/fb.png", 18, 18)
      fbIcon.anchorX = 0
      fbIcon.anchorY = 0
      row:insert(fbIcon)
      fbIcon.x = 0
      fbIcon.y = 12
    end
    local buttonImage = display.newImageRect("images/gui/friends/roundAdd.png", 36, 36)
    buttonImage.anchorX = 0
    buttonImage.anchorY = 0
    row:insert(buttonImage)
    buttonImage.x = 130
    buttonImage.y = 2
    local buttonImageSendt = display.newImageRect("images/gui/customplay/roundSent.png", 36, 36)
    buttonImageSendt.anchorX = 0
    buttonImageSendt.anchorY = 0
    row:insert(buttonImageSendt)
    buttonImageSendt.x = buttonImage.x
    buttonImageSendt.y = buttonImage.y
    buttonImageSendt.isVisible = false
    
    local function toggleName()
      if facebookName and username then
        if facebookName.isVisible then
          facebookName.isVisible = false
          username.isVisible = true
        else
          facebookName.isVisible = true
          username.isVisible = false
        end
      end
    end
    
    local function getId()
      buttonImageSendt.isVisible = true
      return params.p
    end
    
    row.getId = getId
    row.toggleName = toggleName
  end
  
  local function onRowRenderMap(event)
    local phase = event.phase
    local row = event.row
    local params = row.params
    local id = tonumber(params.id)
    if id == nil then
      print("WARNING: failed to find map id, set 0")
      id = 0
    end
    local path = "images/gui/practice/icon" .. id .. ".png"
    if id == 0 then
      path = "images/gui/practice/iconRandom.png"
    end
    local image = display.newImageRect(path, 88, 90)
    if not image then
      local mapTheme = params.theme
      image = display.newImageRect("images/gui/practice/default" .. mapTheme .. ".png", 88, 90)
    end
    image.anchorY = 0
    row:insert(image)
    image.x = 90
    image.y = 6
    local mapName = composer.newText({
      string = params.name,
      x = image.x,
      y = image.y + 73,
      size = 14
    })
    row:insert(mapName)
    if params.active then
      local imagePath = "images/gui/customplay/mapMarker.png"
      local imageBackground = display.newImageRect(imagePath, 88, 90)
      imageBackground.anchorY = 0
      row:insert(imageBackground)
      imageBackground.x = image.x
      imageBackground.y = image.y
    end
    
    local function setThisMapActive()
      composer.mapHandler.setActiveMap(id)
      composer.analytics.newEvent("design", {
        event_id = "selectMap",
        value = id,
        area = composer.config.fullVersion
      })
    end
    
    local function getId()
      return params.id
    end
    
    row.getId = getId
    row.setThisMapActive = setThisMapActive
  end
  
  local function onRowRendarRanking(event)
    local phase = event.phase
    local row = event.row
    local params = row.params
    local background = display.newImageRect("images/gui/ranking/cell.png", row.contentWidth, row.contentHeight)
    background.anchorX = 0
    background.anchorY = 0
    row:insert(background)
    background.x = 0
    background.y = 0
    if params.tier then
      local background2 = display.newImageRect(params.imagePath, 180, 32)
      background2.anchorX = 0.5
      background2.anchorY = 0.5
      row:insert(background2)
      background2.x = 100
      background2.y = 16
    else
      local rankingPos = ""
      if params.index then
        rankingPos = params.index .. ". "
      end
      local name = composer.newText({
        string = rankingPos .. params.u,
        size = 16,
        x = 15,
        y = 20,
        ax = 0
      })
      row:insert(name)
      local rating = composer.newText({
        string = params.r,
        size = 16,
        x = 190,
        y = 20,
        ax = 1
      })
      row:insert(rating)
      if params.isSelected then
        name:setFillColor(0.2, 0.432, 0.12)
      end
      
      local function setSelected(selected)
        if selected then
          name:setFillColor(0.2, 0.432, 0.12)
        else
          name:setFillColor(0, 0, 0)
        end
      end
      
      local function getPlayerData()
        return params
      end
      
      local function getIndex()
        return params.rowIndex
      end
      
      row.getPlayerData = getPlayerData
      row.setSelected = setSelected
      row.getIndex = getIndex
    end
  end
  
  local function onRowRendarChallenge(event)
    local phase = event.phase
    local row = event.row
    local params = row.params
    local numberInList = 1
    local progression = 0
    local clamed = 0
    local maxStage = 1
    local challenge
    local challengeId = params.rowIndex
    local iconPath
    if composer.playerInfo.awardsTable == 1 then
      if params.serverStatus then
        progression = params.serverStatus.p
        clamed = params.serverStatus.c
      end
      challengeId = params.id
      challenge = params
      if challenge.image then
        iconPath = "images/gui/challenges/iconsDaily/" .. challenge.image .. ".png"
      end
    elseif composer.playerInfo.awardsTable == 2 then
      if params.serverStatus then
        if params.serverStatus.l then
          numberInList = params.serverStatus.l + 1
          if numberInList > params.maxStage then
            numberInList = params.maxStage
          end
        end
        progression = params.serverStatus.p
        clamed = params.serverStatus.c
      end
      maxStage = params.maxStage
      if params.image then
        iconPath = "images/gui/challenges/iconsAchiv/" .. params.image .. ".png"
      end
      challengeId = params.id
      challenge = params.steps[numberInList]
    elseif composer.playerInfo.awardsTable == 3 then
      progression = 1
      if params.serverStatus then
        clamed = params.serverStatus.c
      end
      if params.image then
        iconPath = "images/gui/challenges/iconsCoins/" .. params.image .. ".png"
      end
      challengeId = params.id
      challenge = params
    end
    if params.timeLeft then
      local startText = composer.newText({
        string = composer.localized.get("NewChallenges"),
        size = 16,
        x = 86,
        y = 15
      })
      row:insert(startText)
      local timeLeft = composer.newText({
        string = params.timeLeft,
        size = 16,
        x = startText.x + startText.width * 0.8,
        y = startText.y
      })
      row:insert(timeLeft)
      return
    end
    local progressBarBG = display.newImageRect("images/gui/challenges/cellBG.png", 102, 14)
    progressBarBG.anchorX = 0
    progressBarBG.anchorY = 0
    progressBarBG.x = 65
    progressBarBG.y = 42
    row:insert(progressBarBG)
    local progressPath = "images/gui/challenges/cellBar.png"
    local multiplier = progression
    if clamed == 1 or progression == 1 then
      progressPath = "images/gui/challenges/cellBarGreen.png"
      multiplier = 1
    end
    local progressBar = display.newImageRect(progressPath, 102, 14)
    progressBar.anchorX = 0
    progressBar.anchorY = 0
    progressBar.x = 65
    progressBar.y = 42
    progressBar.width = 102 * multiplier
    row:insert(progressBar)
    local background = display.newImageRect("images/gui/challenges/cellNormal.png", 180, 61)
    background.anchorX = 0
    background.anchorY = 0
    row:insert(background)
    background.x = 0
    background.y = 0
    if iconPath then
      local icon = display.newImageRect(iconPath, 65, 65)
      if icon == nil then
        icon = display.newImageRect("images/gui/challenges/iconsDaily/1.png", 65, 65)
      end
      icon.anchorX = 0
      icon.anchorY = 0
      icon.x = 2
      icon.y = 0
      row:insert(icon)
    end
    local progText
    if progression == 1 and clamed == 0 then
      if params.boost then
        progText = composer.localized.get("Buy")
      elseif params.video then
        progText = composer.localized.get("Video time!")
      else
        progText = composer.localized.get("ClaimMe")
      end
    elseif clamed == 1 then
      progText = ""
    else
      progText = math.floor(progression * 100) .. "%"
    end
    local progressionText = composer.newText({
      string = progText,
      size = 12,
      x = 120,
      y = 48,
      color = {
        1,
        1,
        1
      }
    })
    row:insert(progressionText)
    if params.title then
      local name = composer.newText({
        string = params.title,
        size = 14,
        x = 72,
        y = 15,
        ax = 0,
        color = {
          1,
          1,
          1
        }
      })
      row:insert(name)
    end
    if challenge then
      if challenge.text then
        local description = composer.newText({
          string = challenge.text,
          size = 11,
          x = 72,
          y = 28,
          ax = 0,
          color = {
            1,
            1,
            1
          }
        })
        row:insert(description)
      end
      if challenge.softCurrencyReward and 0 < challenge.softCurrencyReward then
        local path = "images/gui/challenges/claimCoins.png"
        if progression < 1 then
          path = "images/gui/challenges/claimCoinsIncomplete.png"
        end
        if clamed == 1 then
          path = "images/gui/challenges/claimCoinsClaimed.png"
        end
        local softCurrencyIcon = display.newImageRect(path, 58, 55)
        softCurrencyIcon.anchorX = 0
        softCurrencyIcon.anchorY = 0.5
        row:insert(softCurrencyIcon)
        softCurrencyIcon.x = 176
        softCurrencyIcon.y = 32
        if clamed ~= 1 then
          local softCurrencyText = composer.newText({
            string = "x " .. challenge.softCurrencyReward,
            size = 13,
            x = softCurrencyIcon.x + 30,
            y = softCurrencyIcon.y + 13
          })
          row:insert(softCurrencyText)
        end
      elseif challenge.boost then
        local path = "images/gui/challenges/claimBuy.png"
        if clamed == 1 then
          path = "images/gui/challenges/claimBuyClaimed.png"
        end
        local boostIcon = display.newImageRect(path, 58, 55)
        boostIcon.anchorX = 0
        boostIcon.anchorY = 0.5
        row:insert(boostIcon)
        boostIcon.x = 176
        boostIcon.y = 32
      elseif challenge.spinReward then
        local path = "images/gui/challenges/claimSpin.png"
        if progression < 1 then
          path = "images/gui/challenges/claimSpinIncomplete.png"
        end
        if clamed == 1 then
          path = "images/gui/challenges/claimSpinClaimed.png"
        end
        local spinIcon = display.newImageRect(path, 58, 55)
        spinIcon.anchorX = 0
        spinIcon.anchorY = 0.5
        row:insert(spinIcon)
        spinIcon.x = 176
        spinIcon.y = 32
      elseif challenge.itemAwarded then
        local path = "images/gui/challenges/claimItem.png"
        if progression < 1 then
          path = "images/gui/challenges/claimItemIncomplete.png"
        end
        if clamed == 1 then
          path = "images/gui/challenges/claimItemClaimed.png"
        end
        local itemIconBackground = display.newImageRect(path, 58, 55)
        itemIconBackground.anchorX = 0
        itemIconBackground.anchorY = 0.5
        row:insert(itemIconBackground)
        itemIconBackground.x = 176
        itemIconBackground.y = 32
      end
    end
    
    local function createStars(number)
      local path = "images/gui/challenges/star1.png"
      if number < numberInList and clamed == 0 then
        path = "images/gui/challenges/star2.png"
      elseif number <= numberInList and clamed == 1 then
        path = "images/gui/challenges/star2.png"
      end
      local image = display.newImageRect(path, 25, 25)
      image.anchorX = 0
      image.anchorY = 0.5
      row:insert(image)
      if number == 1 then
        image.x = 8
        image.y = 47
      elseif number == 2 then
        image.x = 24
        image.y = 50
      elseif number == 3 then
        image.x = 40
        image.y = 47
      end
    end
    
    if composer.playerInfo.awardsTable == 2 and maxStage == 3 then
      for i = 1, maxStage do
        createStars(i)
      end
    end
    
    local function getChallengeData()
      if challenge then
        return clamed, progression, challengeId, numberInList, challenge
      else
        print("WARNING: challenge is nil for id ", challengeId, " numberInList ", numberInList)
        return clamed, progression, challengeId, numberInList, false, false
      end
    end
    
    row.getChallengeData = getChallengeData
  end
  
  local function onRowRenderMarket(event)
    local phase = event.phase
    local row = event.row
    local params = row.params
    local text = params.text
    local saleImage
    local iconPath = params.image
    local button = display.newImageRect(iconPath, 90, 49)
    button.anchorX = 0
    button.anchorY = 0
    row:insert(button)
    button.x = 0
    button.y = 0
    local buttonActive = display.newImageRect("images/gui/market/categorySelected.png", 90, 49)
    buttonActive.anchorX = 0
    buttonActive.anchorY = 0
    row:insert(buttonActive)
    buttonActive.x = button.x
    buttonActive.y = button.y
    if iconPath == "images/gui/market/categoryGlasses.png" and composer.onboarding.isActive == true then
      composer.onboarding.addGuiReference("market_glasses", row)
    end
    if not params.active then
      buttonActive.isVisible = false
    end
    if params.sale then
      saleImage = display.newImageRect("images/gui/market/saleSmall.png", 23, 20)
      row:insert(saleImage)
      saleImage.x = button.x + 86
      saleImage.y = button.y + 6
    end
    if params.newItem then
      local newItemImage = display.newImageRect("images/gui/market/newItemSmall.png", 23, 20)
      row:insert(newItemImage)
      newItemImage.x = button.x + 86
      newItemImage.y = button.y + 6
      if saleImage then
        newItemImage.x = button.x + 72
        row:insert(saleImage)
      end
    end
    
    local function setActiveState(newState)
      buttonActive.isVisible = newState
      params.active = newState
    end
    
    local function clickButton()
      if params.onClick then
        params.onClick()
      end
      if iconPath == "images/gui/market/categoryGlasses.png" and composer.onboarding.isActive == true then
        composer.onboarding.removeCategoryArrow()
      end
    end
    
    row.clickButton = clickButton
    row.setActiveState = setActiveState
  end
  
  local function onRowRenderSettings(event)
    local phase = event.phase
    local row = event.row
    local params = row.params
    local text = params.text
    local iconPath = "images/gui/settings/button.png"
    if params.sound then
      local state = composer.database.getSound()
      if state == 1 then
        iconPath = "images/gui/settings/buttonSound.png"
      else
        iconPath = "images/gui/settings/buttonSoundMute.png"
      end
    elseif params.violence then
      local state = composer.database.getViolence()
      if state == 1 then
        iconPath = "images/gui/settings/buttonViolenceHigh.png"
      else
        iconPath = "images/gui/settings/buttonViolenceLow.png"
      end
    elseif params.music then
      local state = composer.database.getSound()
      if state == 1 then
        iconPath = "images/gui/settings/buttonMusic.png"
      else
        iconPath = "images/gui/settings/buttonMusicMute.png"
      end
    elseif params.facebook then
      iconPath = "images/gui/settings/buttonFB.png"
    end
    local iconBackground = display.newImageRect(iconPath, 120, 37)
    iconBackground.anchorX = 0
    iconBackground.anchorY = 0
    row:insert(iconBackground)
    iconBackground.x = 0
    iconBackground.y = 10
    if text then
      local description = composer.newText({
        string = params.text
      })
      row:insert(description)
      description.anchorX = 0.5
      description.anchorY = 0.5
      description.x = 60
      description.y = 29
    end
    
    local function clickButton()
      if params.onClick then
        params.onClick()
      end
    end
    
    row.clickButton = clickButton
  end
  
  local function onRowRenderChat(event)
    local phase = event.phase
    local row = event.row
    local params = row.params
    local background = display.newImageRect("images/gui/common/transparent.png", row.contentWidth, row.contentHeight)
    background.anchorX = 0
    background.anchorY = 0
    row:insert(background)
    background.x = 0
    background.y = 0
    if params.formatedText then
      local text = composer.newText({
        string = params.formatedText,
        size = 14,
        width = 220,
        height = 0
      })
      row:insert(text)
      text.anchorX = 0
      text.anchorY = 0
      text.x = 0
      text.y = 0
      if params.splitTable and params.from then
        local nameSum = 0
        for i = 1, string.len(params.from) do
          nameSum = nameSum + string.byte(params.from:sub(i, i))
        end
        local textId = nameSum % 4
        if textId == 0 then
          text:setFillColor(0.8666666666666667, 0.15294117647058825, 0.15294117647058825)
        elseif textId == 1 then
          text:setFillColor(0.08235294117647059, 0.38823529411764707, 0.050980392156862744)
        elseif textId == 2 then
          text:setFillColor(0.14901960784313725, 0.25098039215686274, 0.7686274509803922)
        elseif textId == 3 then
          text:setFillColor(0.8313725490196079, 0.3803921568627451, 0.0784313725490196)
        end
      elseif params.textType ~= chatFormat.playerMessage() then
        text:setFillColor(0.5)
      end
    end
  end
  
  local function onRowRenderCredits(event)
    local phase = event.phase
    local row = event.row
    local params = row.params
    local credits = composer.newText({
      string = params.creditInfo,
      size = params.size
    })
    row:insert(credits)
    credits.anchorX = 0
    credits.anchorY = 0
    credits.x = 100
    credits.y = 24
  end
  
  local function onRowRender(event)
    local phase = event.phase
    local row = event.row
    local rowTitle = composer.createEmbossedText("Create a uniqe one", composer.getFontSize("small"), 35, row.contentHeight * 0.5)
    row:insert(rowTitle)
  end
  
  local function initTable()
    local onRowRender = onRowRender
    if scene == "settings" then
      onRowRender = onRowRenderSettings
    elseif scene == "findFriends" then
      onRowRender = onRowRenderAddFriend
    elseif scene == "friendsSettings1" then
      onRowRender = onRowRenderSettingsGameInvites
    elseif scene == "friendsSettings2" then
      onRowRender = onRowRenderSettingsFriendsInvite
    elseif scene == "friendsSettings3" then
      onRowRender = onRowRenderSettingsFacebook
    elseif scene == "ranking" then
      onRowRender = onRowRendarRanking
    elseif scene == "challenge" then
      onRowRender = onRowRendarChallenge
    elseif scene == "credits" then
      onRowRender = onRowRenderCredits
    elseif scene == "map" then
      onRowRender = onRowRenderMap
    elseif scene == "chat" then
      onRowRender = onRowRenderChat
    elseif scene == "market" then
      onRowRender = onRowRenderMarket
    elseif scene == "friends" then
      onRowRender = onRowRenderFriends
    end
    local thisTopPadding = 0
    if topPadding then
      thisTopPadding = topPadding
    end
    tableView = widget.newTableView({
      top = y,
      left = x,
      width = width,
      height = height,
      hideBackground = true,
      noLines = true,
      listener = tableViewListener,
      onRowRender = onRowRender,
      hideScrollBar = true,
      topPadding = thisTopPadding
    })
  end
  
  local function insertTableData(newTableData)
    if cellTimer then
      timer.cancel(cellTimer)
      cellTimer = nil
    end
    local rowHeight = cellHeight
    local cellsToCreateInstant = 30
    local cellsToCreateDelayed = 0
    local index = 0
    if cellsToCreateInstant < #newTableData then
      cellsToCreateDelayed = #newTableData - cellsToCreateInstant
    else
      cellsToCreateInstant = #newTableData
    end
    
    local function createCell()
      index = index + 1
      local rowColor = {
        default = {
          1,
          1,
          1,
          0
        }
      }
      local lineColor = {
        0.8627450980392157,
        0.8627450980392157,
        0.8627450980392157
      }
      local height = rowHeight
      if newTableData[index].header then
        height = height * 0.5
      end
      newTableData[index].rowIndex = index
      tableView:insertRow({
        rowHeight = height,
        rowColor = rowColor,
        lineColor = lineColor,
        params = newTableData[index]
      })
    end
    
    for i = 1, cellsToCreateInstant do
      createCell()
    end
    if 0 < cellsToCreateDelayed then
      cellTimer = timer.performWithDelay(40, createCell, cellsToCreateDelayed)
    end
  end
  
  local function createTable(newTableData, displayGroup)
    if displayGroup and displayGroup.insert then
      initTable()
      displayGroup:insert(tableView)
      insertTableData(newTableData)
    end
  end
  
  local function cleanTable()
    if cellTimer then
      timer.cancel(cellTimer)
      cellTimer = nil
    end
    if tableView then
      tableView:deleteAllRows()
      tableView:removeSelf()
      tableView = nil
    end
  end
  
  local function deleteRow(index)
    tableView:deleteRow(index)
  end
  
  local function getTable()
    return tableView
  end
  
  local function refreshTable(newTableData, displayGroup, startPos)
    if newTableData and displayGroup and tableView then
      local index = tableView:getContentPosition()
      if startPos then
        index = startPos
      end
      cleanTable()
      createTable(newTableData, displayGroup)
      tableView:scrollToY({y = index, time = 0})
    elseif tableView then
      tableView:reloadData()
    end
  end
  
  functionList.createTable = createTable
  functionList.cleanTable = cleanTable
  functionList.getTable = getTable
  functionList.refreshTable = refreshTable
  functionList.deleteRow = deleteRow
  return functionList
end

M.new = new
return M
