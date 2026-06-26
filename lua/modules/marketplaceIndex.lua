local M = {}

function M.findIndexOnKey(marketData, key)
  for i = 1, #marketData do
    if tonumber(marketData[i].key) == tonumber(key) then
      return i
    end
  end

  return nil
end

function M.findIndexOnId(key)
  key = tonumber(key)
  if not key then
    return nil
  elseif key < 200 then
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
  elseif key >= 1200 and key < 2100 then
    return 9
  end

  return nil
end

function M.normalizeSelection(spriteType, newIndex, marketData)
  local index = tonumber(newIndex)
  local slotToChange = spriteType

  if index == 0 then
    index = 1
  elseif spriteType == 9 or spriteType == 10 then
    if not index or index < 1 then
      index = 1
    end
    if index > #marketData then
      index = #marketData
    end
  elseif spriteType == 8 then
    if index and 100 < index then
      index = M.findIndexOnId(index)
    end
    if index and marketData[index] then
      slotToChange = M.findIndexOnId(marketData[index].key)
    end
  elseif index and 100 < index and index > #marketData then
    index = M.findIndexOnKey(marketData, index)
  end

  return index, slotToChange
end

function M.findItemSelectedForSpriteType(tabSelected, marketData, equippedMonsterData, currentMonster, defaultSkinForAvatar)
  if tabSelected == 9 or tabSelected == 10 then
    return 1
  end

  local indexToSearchFor = tonumber(equippedMonsterData[tabSelected])
  if currentMonster then
    if tabSelected == 1 then
      indexToSearchFor = currentMonster
    else
      indexToSearchFor = defaultSkinForAvatar(currentMonster)
    end
  end

  return M.findIndexOnKey(marketData, indexToSearchFor) or 1
end

return M
