local assert = require("tests.support.assertions")
local videoSelection = require("lua.ads.videoSelection")

return function(test)
  test.case("videoSelection.buildChanceState_scalesConfiguredProviders_totalMatchesLegacyWeighting", function()
    local state = videoSelection.buildChanceState({
      vungle = 1,
      admob = 2,
      chartboost = nil,
      nativeX = 3,
      adrally = 4
    })

    assert.equal(state.vungle, 10)
    assert.equal(state.admob, 20)
    assert.equal(state.chartboost, nil)
    assert.equal(state.nativeX, 30)
    assert.equal(state.adrally, 40)
    assert.equal(state.total, 100)
  end)

  test.case("videoSelection.appendReadyVideo_unreadyOrZeroChance_skipsSupplier", function()
    local readyVideos = {}
    local module = {}

    assert.equal(videoSelection.appendReadyVideo(readyVideos, module, 0, function()
      return true
    end), false)
    assert.equal(videoSelection.appendReadyVideo(readyVideos, module, 10, function()
      return false
    end), false)
    assert.equal(#readyVideos, 0)
  end)

  test.case("videoSelection.appendReadyVideo_readySupplier_addsWeightedAd", function()
    local readyVideos = {}
    local module = { id = "admob" }

    assert.equal(videoSelection.appendReadyVideo(readyVideos, module, 20, function(candidate)
      return candidate.id == "admob"
    end), true)
    assert.equal(#readyVideos, 1)
    assert.equal(readyVideos[1].chance, 20)
    assert.equal(readyVideos[1].ad, module)
  end)

  test.case("videoSelection.selectReadyVideo_randomNumber_selectsWeightedBucket", function()
    local readyVideos = {
      { chance = 10, ad = "a" },
      { chance = 20, ad = "b" },
      { chance = 30, ad = "c" }
    }

    assert.equal(videoSelection.selectReadyVideo(readyVideos, 0).ad, "a")
    assert.equal(videoSelection.selectReadyVideo(readyVideos, 10).ad, "b")
    assert.equal(videoSelection.selectReadyVideo(readyVideos, 29).ad, "b")
    assert.equal(videoSelection.selectReadyVideo(readyVideos, 30).ad, "c")
    assert.equal(videoSelection.selectReadyVideo(readyVideos, 60), nil)
  end)
end
