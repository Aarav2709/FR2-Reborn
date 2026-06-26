local assert = require("tests.support.assertions")
local marketplaceIndex = require("lua.modules.marketplaceIndex")

local marketData = {
  { key = "101" },
  { key = "205" },
  { key = "402" },
  { key = "1201" }
}

return function(test)
  test.case("marketplaceIndex.findIndexOnKey_numberOrStringKey_returnsMatchingIndex", function()
    assert.equal(marketplaceIndex.findIndexOnKey(marketData, 101), 1)
    assert.equal(marketplaceIndex.findIndexOnKey(marketData, "205"), 2)
    assert.equal(marketplaceIndex.findIndexOnKey(marketData, 999), nil)
  end)

  test.case("marketplaceIndex.findIndexOnId_storeItemRanges_mapToAvatarSlots", function()
    assert.equal(marketplaceIndex.findIndexOnId(101), 1)
    assert.equal(marketplaceIndex.findIndexOnId(250), 2)
    assert.equal(marketplaceIndex.findIndexOnId(350), 3)
    assert.equal(marketplaceIndex.findIndexOnId(450), 4)
    assert.equal(marketplaceIndex.findIndexOnId(550), 5)
    assert.equal(marketplaceIndex.findIndexOnId(650), 6)
    assert.equal(marketplaceIndex.findIndexOnId(750), 7)
    assert.equal(marketplaceIndex.findIndexOnId(1001), 10)
    assert.equal(marketplaceIndex.findIndexOnId(1201), 9)
    assert.equal(marketplaceIndex.findIndexOnId("not-a-number"), nil)
  end)

  test.case("marketplaceIndex.normalizeSelection_powerupTab_clampsIndexToMarketData", function()
    local index, slot = marketplaceIndex.normalizeSelection(9, 99, marketData)
    assert.equal(index, #marketData)
    assert.equal(slot, 9)

    index, slot = marketplaceIndex.normalizeSelection(10, 0, marketData)
    assert.equal(index, 1)
    assert.equal(slot, 10)
  end)

  test.case("marketplaceIndex.normalizeSelection_spriteTypeEight_mapsItemIdToSlot", function()
    local index, slot = marketplaceIndex.normalizeSelection(8, 1201, marketData)
    assert.equal(index, 9)
    assert.equal(slot, 8)
  end)

  test.case("marketplaceIndex.findItemSelectedForSpriteType_currentMonster_usesDefaultSkinWhenNeeded", function()
    local index = marketplaceIndex.findItemSelectedForSpriteType(2, marketData, { [2] = 999 }, 101, function(monster)
      assert.equal(monster, 101)
      return 205
    end)

    assert.equal(index, 2)
  end)
end
