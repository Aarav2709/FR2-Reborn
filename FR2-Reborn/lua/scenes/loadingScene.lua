local composer = require("composer")
local assetLoader = require("lua.modules.assetLoader")
local scene = composer.newScene()
local updateLoadbar, cleanEnter

function scene:create(event)
  local screenGroup = self.view
  local transitionTime = 200
  local backgroundImage = display.newImageRect("images/gui/common/bgBlur.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  screenGroup:insert(backgroundImage)
  local logo = display.newImageRect("images/gui/common/logo.png", 224, 135)
  logo.x = display.contentWidth * 0.5
  logo.y = display.contentHeight * 0.25
  screenGroup:insert(logo)
  local text1 = composer.newText({
    string = composer.localized.get("DirtybitGame"),
    x = display.contentWidth * 0.5,
    y = display.contentHeight * 0.9,
    size = 22
  })
  screenGroup:insert(text1)
  local loadBarBG = display.newImageRect("images/gui/loading/loadingBarBG.png", 200, 22)
  loadBarBG.x = display.contentWidth * 0.5
  loadBarBG.y = display.contentHeight * 0.7
  screenGroup:insert(loadBarBG)
  local loadBar = display.newRect(0, 0, 0, 20)
  loadBar:setFillColor(1, 1, 1, 1)
  loadBar.anchorX = 0
  loadBar.anchorY = 0.5
  loadBar.x = 140
  loadBar.y = display.contentHeight * 0.5
  screenGroup:insert(loadBar)
  local loadBar = display.newImageRect("images/gui/loading/loadingBarFiller.png", 12, 20)
  loadBar.anchorX = 0
  loadBar.anchorY = 0.5
  loadBar.x = 140
  loadBar.y = display.contentHeight * 0.7
  screenGroup:insert(loadBar)
  local loadBarForground = display.newImageRect("images/gui/loading/loadingBar.png", 220, 40)
  loadBarForground.x = display.contentWidth * 0.5
  loadBarForground.y = display.contentHeight * 0.7
  screenGroup:insert(loadBarForground)
  
  function updateLoadbar()
    if loadBar and loadBar.width then
      transition.to(loadBar, {
        time = transitionTime,
        width = loadBar.width + 38,
        x = loadBar.x
      })
    end
  end
end

function scene:show(event)
  local phase = event.phase
  if phase == "will" then
    return
  end
  local screenGroup = self.view
  local waitTime = 240
  local onLoginComplete, startToLoad, loadBase
  local updateAttempsLeft = 40
  local totalFilesToDownloaded = 0
  local fileDownloadAttempts = 0
  local filesThatAreDownloaded = 0
  local oldNumberOfMaps
  local updateMaps = false
  local updateConfig = false
  local configFilesCorruptOnFirstRead = false
  local loadBaseTimer, startToLoadTimer, nextStepTimer
  local downloadText = composer.newText({
    string = composer.localized.get("Downloading"),
    x = display.contentWidth * 0.5,
    y = display.contentHeight * 0.8,
    size = 22
  })
  downloadText.isVisible = false
  screenGroup:insert(downloadText)
  
  local function updateDownloadTextWithMaps(success)
    totalFilesToDownloaded = totalFilesToDownloaded + composer.mapHandler.getNumberOfMaps()
    downloadText.text = composer.localized.get("Downloading") .. filesThatAreDownloaded .. "/" .. totalFilesToDownloaded
    downloadText.isVisible = true
    updateMaps = true
  end
  
  local function updateDownloadTextWithConfig(success)
    totalFilesToDownloaded = totalFilesToDownloaded + 3
    downloadText.text = composer.localized.get("Downloading") .. filesThatAreDownloaded .. "/" .. totalFilesToDownloaded
    downloadText.isVisible = true
    updateConfig = true
  end
  
  local function downloadNewJsonFilesDone(success)
    updateAttempsLeft = updateAttempsLeft + 1
    if success then
      filesThatAreDownloaded = filesThatAreDownloaded + 1
    end
    downloadText.text = composer.localized.get("Downloading") .. filesThatAreDownloaded .. "/" .. totalFilesToDownloaded
  end
  
  local function checkForFacebookLogin()
    local function goToStartScene()
      if composer.comm and composer.playerInfo then
        if composer.tcpSocial then
          composer.comm.stopTCPSocial()
        end
        if composer.tcpClient then
          composer.tcpClient.stopTCPClient()
        end
      end
      composer.database.reset()
      local currentScene = composer.getCurrentSceneName("current")
      if currentScene ~= "lua.scenes.mainMenu" then
        composer.removeScene("lua.scenes.mainMenu")
      end
      composer.gotoScene("lua.scenes.startScreen")
      composer.removeScene(currentScene)
    end
    
    if composer.database.getFacebookId() and not composer.facebook.isLoggedIn() and not composer.facebookLogin then
      function onLoginComplete(event)
        if event.phase ~= "login" then
          native.showAlert("Error", "Could not login with Facebook.", {"Ok"}, goToStartScene)
        elseif event.isError then
          native.showAlert("Error", "Could not login with Facebook.", {"Ok"}, goToStartScene)
        end
      end
      
      composer.facebook.login({}, onLoginComplete)
    end
  end
  
  local function scrollText()
    updateLoadbar()
  end
  
  local function loadSounds()
    assetLoader.loadSounds()
    scrollText()
    nextStepTimer = timer.performWithDelay(waitTime, startToLoad, 1)
  end
  
  local function loadAnimations3()
    assetLoader.loadAnimations3()
    scrollText()
    nextStepTimer = timer.performWithDelay(waitTime, loadSounds, 1)
  end
  
  local function loadAnimations2()
    assetLoader.loadAnimations1()
    assetLoader.loadAnimations2()
    scrollText()
    nextStepTimer = timer.performWithDelay(waitTime, loadAnimations3, 1)
  end
  
  local function continueLoadingConfigCritical()
    assetLoader.createConfigChecksum()
    assetLoader.createMapChecksum()
    
    -- OFFLINE MOD: IAP ve online özellikler devre dışı
    if not composer.config.offlineMode then
      assetLoader.loadIAP()
      composer.comm.startSocialTCP()
      checkForFacebookLogin()
      local cb = require("lua.ads.chartboostModule")
      cb.initAds()
    end
    
    composer.tableHelper = require("lua.modules.tableUtil")
    composer.loadScene("lua.scenes.mainMenu")
    assetLoader.loadSpine()
    assetLoader.readJsonMapFiles()
    scrollText()
    nextStepTimer = timer.performWithDelay(waitTime, loadAnimations2, 1)
  end
  
  local function downloadConfigDone(event)
    if event.success == false then
      print("Warning: Failed to update config file.")
      if event.configType == "awards" then
        composer.awardsDownloadFailure = true
      elseif event.configType == "store" then
        composer.storeDownloadFailure = true
      elseif event.configType == "config" then
        composer.configDownloadFailure = true
      end
    end
    fileDownloadAttempts = fileDownloadAttempts + 1
    if composer.updatingConfingFiles == false then
      if configFilesCorruptOnFirstRead then
        configFilesCorruptOnFirstRead = false
        if composer.awardsDownloadFailure or composer.storeDownloadFailure or composer.configDownloadFailure then
          local function closeApp()
            native.requestExit()
          end
          
          native.showAlert(composer.localized.get("CorruptedFiles"), composer.localized.get("CorruptedFilesText"), {
            composer.localized.get("Ok")
          }, closeApp)
          print("Warning: Coudl not get new config files and current ones are currupted. Closing app.")
          return
        end
        continueLoadingConfigCritical()
      end
      assetLoader.readJsonConfigFiles()
    end
    downloadNewJsonFilesDone(event.success)
  end
  
  local function downloadMapDone(event)
    if event.success == false then
      print("Warning: Failed to update map.")
      composer.mapDownloadFailure = true
    end
    fileDownloadAttempts = fileDownloadAttempts + 1
    downloadNewJsonFilesDone(event.success)
  end
  
  function startToLoad()
    if not (composer.updatingConfingFiles or composer.updatingMaps) or composer.config.ignoreJsonConfig then
    else
      startToLoadTimer = timer.performWithDelay(200, startToLoad)
      return
    end
    local configFilesDownloadFailure = composer.configDownloadFailure or composer.awardsDownloadFailure or composer.storeDownloadFailure or composer.mapDownloadFailure
    if configFilesDownloadFailure then
      composer.comm.stopTCPSocial(true)
      composer.createCustomOverlay(46)
    end
    if updateMaps then
      assetLoader.readMapDataToMemory(true)
    end
    composer.onboarding.init()
    composer.onboarding.checkOnboardingStatus()
    if composer.onboarding.isActive == true then
      composer.onboarding.activateStep()
    else
      composer.loadScene("lua.scenes.playMenu")
      if not composer.data.wrongVersion and not composer.config.invalidUser then
        composer.gotoScene("lua.scenes.mainMenu")
      end
      composer.removeScene("lua.scenes.loadingScene")
    end
  end
  
  local function checkAndReloadConfigFiles()
    local filessAreOk = assetLoader.readJsonConfigFiles()
    if filessAreOk == 0 then
      print("Current config files have errors. Need to get new.")
      configFilesCorruptOnFirstRead = true
      assetLoader.updateConfigFiles()
    end
  end
  
  function loadBase()
    assetLoader.loadFacebook()
    checkAndReloadConfigFiles()
    if configFilesCorruptOnFirstRead then
      return
    else
      print("Current config files are OK. Continue download.")
      continueLoadingConfigCritical()
    end
  end
  
  scrollText()
  nextStepTimer = timer.performWithDelay(waitTime * 1.5, loadBase, 1)
  Runtime:addEventListener("downloadConfigDone", downloadConfigDone)
  Runtime:addEventListener("downloadMapDone", downloadMapDone)
  Runtime:addEventListener("downloadStartConfig", updateDownloadTextWithConfig)
  Runtime:addEventListener("downloadStartMaps", updateDownloadTextWithMaps)
  
  function cleanEnter()
    Runtime:removeEventListener("downloadStartMaps", updateDownloadTextWithMaps)
    Runtime:removeEventListener("downloadStartConfig", updateDownloadTextWithConfig)
    Runtime:removeEventListener("downloadMapDone", downloadMapDone)
    Runtime:removeEventListener("downloadConfigDone", downloadConfigDone)
    if nextStepTimer then
      timer.cancel(nextStepTimer)
      nextStepTimer = nil
    end
    if loadBaseTimer then
      timer.cancel(loadBaseTimer)
      loadBaseTimer = nil
    end
    if startToLoadTimer then
      timer.cancel(startToLoadTimer)
      startToLoadTimer = nil
    end
  end
end

function scene:hide(event)
  local phase = event.phase
  if phase == "will" then
    if cleanEnter then
      cleanEnter()
      cleanEnter = nil
    end
  elseif phase == "did" then
  end
end

function scene:destroy(event)
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
