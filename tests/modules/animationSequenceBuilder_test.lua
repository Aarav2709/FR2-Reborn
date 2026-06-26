local assert = require("tests.support.assertions")
local animationSequenceBuilder = require("lua.modules.animationSequenceBuilder")

local function sheetInfo(frames)
  return {
    getFrameIndex = function(_, key)
      return frames[key]
    end
  }
end

return function(test)
  test.case("animationSequenceBuilder.buildTrapAnimation_existingSkin_buildsCloseAndReverseOpen", function()
    local key, sequence = animationSequenceBuilder.buildTrapAnimation(sheetInfo({
      ["1401"] = 50,
      ["1401_4"] = 53
    }), 1401)

    assert.equal(key, "1401")
    assert.same(sequence[1], { name = "close", start = 50, count = 4, time = 70, loopCount = 1 })
    assert.same(sequence[2], { name = "open", frames = { 53, 52, 51, 50 }, time = 1000, loopCount = 1 })
  end)

  test.case("animationSequenceBuilder.buildTrapAnimation_missingSkin_fallsBackToDefaultTrap", function()
    local key, sequence = animationSequenceBuilder.buildTrapAnimation(sheetInfo({
      ["1301"] = 10,
      ["1301_4"] = 13
    }), 9999)

    assert.equal(key, "1301")
    assert.same(sequence[2].frames, { 13, 12, 11, 10 })
  end)

  test.case("animationSequenceBuilder.buildBounceTrapAnimation_missingSkin_fallsBackToDefaultBounceTrap", function()
    local key, sequence = animationSequenceBuilder.buildBounceTrapAnimation(sheetInfo({
      ["2001"] = 20,
      ["2001_5"] = 24
    }), 9999)

    assert.equal(key, "2001")
    assert.same(sequence[1], { name = "play", start = 20, count = 5, time = 70, loopCount = 1 })
    assert.same(sequence[2].frames, { 24, 23, 22, 21, 20 })
  end)
end
