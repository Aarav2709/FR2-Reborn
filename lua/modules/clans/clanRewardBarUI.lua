local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)

function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2
  L0_2 = require
  L1_2 = "lua.modules.uiElements.progressBar"
  L0_2 = L0_2(L1_2)
  L1_2 = require
  L2_2 = "lua.modules.timeFormat"
  L1_2 = L1_2(L2_2)
  L2_2 = require
  L3_2 = "lua.modules.clans.clanEmblem"
  L2_2 = L2_2(L3_2)
  L3_2 = display
  L3_2 = L3_2.newGroup
  L3_2 = L3_2()
  L4_2 = display
  L4_2 = L4_2.newGroup
  L4_2 = L4_2()
  L5_2 = false
  L6_2 = nil
  L7_2 = 60
  L8_2 = nil
  L9_2 = display
  L9_2 = L9_2.newImageRect
  L10_2 = "images/gui/clan_v2/clan_reward/progressBar_bg.png"
  L11_2 = 134
  L12_2 = 20
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L11_2 = L4_2
  L10_2 = L4_2.insert
  L12_2 = L9_2
  L10_2(L11_2, L12_2)
  L10_2 = L0_2.create
  L11_2 = 130
  L12_2 = 20
  L10_2 = L10_2(L11_2, L12_2)
  L11_2 = L9_2.x
  L12_2 = L9_2.width
  L12_2 = L12_2 * 0.5
  L11_2 = L11_2 - L12_2
  L11_2 = L11_2 + 4
  L10_2.x = L11_2
  L12_2 = L10_2
  L11_2 = L10_2.setFillColor
  L13_2 = L1_1
  L13_2 = L13_2.colors
  L13_2 = L13_2.colorAsArgumentList
  L14_2 = L1_1
  L14_2 = L14_2.colors
  L14_2 = L14_2.green
  L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2 = L13_2(L14_2)
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2)
  L12_2 = L4_2
  L11_2 = L4_2.insert
  L13_2 = L10_2
  L11_2(L12_2, L13_2)
  L11_2 = display
  L11_2 = L11_2.newImageRect
  L12_2 = "images/gui/clan_v2/clan_support/clanpoint.png"
  L13_2 = 11
  L14_2 = 11
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L13_2 = L4_2
  L12_2 = L4_2.insert
  L14_2 = L11_2
  L12_2(L13_2, L14_2)
  L12_2 = display
  L12_2 = L12_2.newImageRect
  L13_2 = "images/gui/clan_v2/clan_reward/progressBar.png"
  L14_2 = 162
  L15_2 = 43
  L12_2 = L12_2(L13_2, L14_2, L15_2)
  L14_2 = L4_2
  L13_2 = L4_2.insert
  L15_2 = L12_2
  L13_2(L14_2, L15_2)
  L13_2 = L12_2.width
  L13_2 = L13_2 * 0.5
  L13_2 = L13_2 + 10
  L14_2 = display
  L14_2 = L14_2.newImageRect
  L15_2 = "images/gui/clan_v2/clan_reward/chestplate_green.png"
  L16_2 = 50
  L17_2 = 50
  L14_2 = L14_2(L15_2, L16_2, L17_2)
  L15_2 = -L13_2
  L15_2 = L15_2 + 4
  L14_2.x = L15_2
  L14_2.y = -2
  L16_2 = L4_2
  L15_2 = L4_2.insert
  L17_2 = L14_2
  L15_2(L16_2, L17_2)
  L15_2 = display
  L15_2 = L15_2.newImageRect
  L16_2 = "images/gui/clan_v2/clan_reward/chestplate.png"
  L17_2 = 50
  L18_2 = 50
  L15_2 = L15_2(L16_2, L17_2, L18_2)
  L15_2.x = L13_2
  L15_2.y = -6
  L17_2 = L15_2
  L16_2 = L15_2.scale
  L18_2 = 1.2
  L19_2 = 1.2
  L16_2(L17_2, L18_2, L19_2)
  L17_2 = L4_2
  L16_2 = L4_2.insert
  L18_2 = L15_2
  L16_2(L17_2, L18_2)
  L16_2 = L1_1
  L16_2 = L16_2.newText
  L17_2 = {}
  L18_2 = L1_1
  L18_2 = L18_2.localized
  L18_2 = L18_2.get
  L19_2 = "Time left: ??D ??H ??M"
  L18_2 = L18_2(L19_2)
  L17_2.string = L18_2
  L17_2.size = 10
  L18_2 = L12_2.x
  L17_2.x = L18_2
  L18_2 = L12_2.y
  L18_2 = L18_2 - 16
  L17_2.y = L18_2
  L18_2 = L1_1
  L18_2 = L18_2.colors
  L18_2 = L18_2.black
  L17_2.color = L18_2
  L16_2 = L16_2(L17_2)
  L18_2 = L4_2
  L17_2 = L4_2.insert
  L19_2 = L16_2
  L17_2(L18_2, L19_2)
  L17_2 = L1_1
  L17_2 = L17_2.newText
  L18_2 = {}
  L19_2 = L1_1
  L19_2 = L19_2.localized
  L19_2 = L19_2.get
  L20_2 = "Clan Reward Challenge"
  L19_2 = L19_2(L20_2)
  L18_2.string = L19_2
  L18_2.size = 15
  L18_2.x = 0
  L18_2.y = -30
  L19_2 = L1_1
  L19_2 = L19_2.colors
  L19_2 = L19_2.grey
  L18_2.color = L19_2
  L17_2 = L17_2(L18_2)
  L19_2 = L4_2
  L18_2 = L4_2.insert
  L20_2 = L17_2
  L18_2(L19_2, L20_2)
  L18_2 = L1_1
  L18_2 = L18_2.newText
  L19_2 = {}
  L20_2 = L1_1
  L20_2 = L20_2.localized
  L20_2 = L20_2.get
  L21_2 = "Play games to earn clan points"
  L20_2 = L20_2(L21_2)
  L19_2.string = L20_2
  L19_2.size = 10
  L19_2.x = 0
  L19_2.y = 26
  L20_2 = L1_1
  L20_2 = L20_2.colors
  L20_2 = L20_2.grey
  L19_2.color = L20_2
  L18_2 = L18_2(L19_2)
  L20_2 = L4_2
  L19_2 = L4_2.insert
  L21_2 = L18_2
  L19_2(L20_2, L21_2)
  L19_2 = nil
  
  function L20_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3
    L1_3 = display
    L1_3 = L1_3.newGroup
    L1_3 = L1_3()
    L2_3 = display
    L2_3 = L2_3.newGroup
    L2_3 = L2_3()
    L3_3 = false
    L4_3 = print
    L5_3 = "Create Claimable!"
    L6_3 = A0_3
    L4_3(L5_3, L6_3)
    L4_3 = L1_1
    L4_3 = L4_3.clanUtils
    L4_3 = L4_3.clanRewardTiers
    L4_3 = L4_3[A0_3]
    L5_3 = display
    L5_3 = L5_3.newImageRect
    L6_3 = "images/gui/clan_v2/clan_reward/whiteStream.png"
    L7_3 = 241
    L8_3 = 91
    L5_3 = L5_3(L6_3, L7_3, L8_3)
    L7_3 = L1_3
    L6_3 = L1_3.insert
    L8_3 = L5_3
    L6_3(L7_3, L8_3)
    L6_3 = "images/gui/clan_v2/clan_reward/Chest_"
    L7_3 = L4_3 or L7_3
    if not L4_3 then
      L7_3 = "wood"
    end
    L8_3 = "_closed.png"
    L6_3 = L6_3 .. L7_3 .. L8_3
    if A0_3 == 1 or A0_3 == nil then
      L6_3 = "images/gui/clan_v2/clan_reward/bag_full.png"
    end
    L7_3 = display
    L7_3 = L7_3.newImageRect
    L8_3 = L6_3
    L9_3 = 83
    L10_3 = 70
    L7_3 = L7_3(L8_3, L9_3, L10_3)
    L9_3 = L7_3
    L8_3 = L7_3.scale
    L10_3 = 0.85
    L11_3 = 0.85
    L8_3(L9_3, L10_3, L11_3)
    L9_3 = L2_3
    L8_3 = L2_3.insert
    L10_3 = L7_3
    L8_3(L9_3, L10_3)
    L8_3 = L2_2
    L8_3 = L8_3.create
    L8_3 = L8_3()
    L8_3.x = 0
    L9_3 = L7_3.y
    L8_3.y = L9_3
    L9_3 = L8_3.setEmblemSize
    L10_3 = "small"
    L9_3(L10_3)
    L10_3 = L2_3
    L9_3 = L2_3.insert
    L11_3 = L8_3
    L9_3(L10_3, L11_3)
    L9_3 = L1_1
    L9_3 = L9_3.newText
    L10_3 = {}
    L11_3 = L1_1
    L11_3 = L11_3.localized
    L11_3 = L11_3.get
    L12_3 = "Tap to Claim!"
    L11_3 = L11_3(L12_3)
    L10_3.string = L11_3
    L10_3.size = 10
    L10_3.x = 0
    L11_3 = L7_3.y
    L11_3 = L11_3 + 34
    L10_3.y = L11_3
    L11_3 = L1_1
    L11_3 = L11_3.colors
    L11_3 = L11_3.lightGrey
    L10_3.color = L11_3
    L9_3 = L9_3(L10_3)
    L11_3 = L1_3
    L10_3 = L1_3.insert
    L12_3 = L9_3
    L10_3(L11_3, L12_3)
    L11_3 = L1_3
    L10_3 = L1_3.insert
    L12_3 = L2_3
    L10_3(L11_3, L12_3)
    
    function L10_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4
      if A0_4 and 0 < A0_4 then
        L1_4 = L9_3
        L2_4 = "Available in: "
        L3_4 = L1_2
        L3_4 = L3_4.leagueTimeRemainingFormat
        L4_4 = A0_4
        L3_4 = L3_4(L4_4)
        L2_4 = L2_4 .. L3_4
        L1_4.text = L2_4
      else
        L1_4 = L9_3
        L2_4 = L1_1
        L2_4 = L2_4.localized
        L2_4 = L2_4.get
        L3_4 = "Tap to Claim!"
        L2_4 = L2_4(L3_4)
        L1_4.text = L2_4
      end
    end
    
    L1_3.updateText = L10_3
    
    function L10_3(A0_4)
      local L1_4
      L3_3 = A0_4
    end
    
    L1_3.setClaimable = L10_3
    
    function L10_3(A0_4, A1_4)
      local L2_4, L3_4
      L2_4 = transition
      L2_4 = L2_4.cancel
      L3_4 = "clanChallengeChest"
      L2_4(L3_4)
      if A1_4 then
        A0_4.rotation = 0
        A0_4.xScale = 1
        A0_4.yScale = 1
      end
    end
    
    function L11_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4
      
      function L1_4()
        local L0_5, L1_5, L2_5, L3_5
        L0_5 = transition
        L0_5 = L0_5.to
        L1_5 = A0_4
        L2_5 = {}
        L2_5.time = 80
        L2_5.rotation = 5
        L3_5 = L2_4
        L2_5.onComplete = L3_5
        L2_5.tag = "clanChallengeChest"
        L0_5(L1_5, L2_5)
      end
      
      function L2_4()
        local L0_5, L1_5, L2_5, L3_5
        L0_5 = transition
        L0_5 = L0_5.to
        L1_5 = A0_4
        L2_5 = {}
        L2_5.time = 80
        L2_5.rotation = -5
        L3_5 = L1_4
        L2_5.onComplete = L3_5
        L2_5.tag = "clanChallengeChest"
        L0_5(L1_5, L2_5)
      end
      
      function L3_4()
        local L0_5, L1_5, L2_5, L3_5
        L0_5 = transition
        L0_5 = L0_5.to
        L1_5 = A0_4
        L2_5 = {}
        L2_5.time = 100
        L2_5.xScale = 0.9
        L2_5.yScale = 0.9
        L3_5 = L1_4
        L2_5.onComplete = L3_5
        L2_5.tag = "clanChallengeChest"
        L0_5(L1_5, L2_5)
      end
      
      L4_4 = L3_4
      L4_4()
    end
    
    function L12_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4
      
      function L1_4()
        local L0_5, L1_5, L2_5, L3_5
        L0_5 = transition
        L0_5 = L0_5.to
        L1_5 = A0_4
        L2_5 = {}
        L2_5.time = 100
        L2_5.xScale = 0.75
        L2_5.yScale = 0.75
        L3_5 = L2_4
        L2_5.onComplete = L3_5
        L2_5.tag = "clanChallengeChest"
        L0_5(L1_5, L2_5)
      end
      
      function L2_4()
        local L0_5, L1_5, L2_5
        L0_5 = transition
        L0_5 = L0_5.to
        L1_5 = A0_4
        L2_5 = {}
        L2_5.time = 200
        L2_5.xScale = 1
        L2_5.yScale = 1
        L2_5.tag = "clanChallengeChest"
        L0_5(L1_5, L2_5)
      end
      
      L3_4 = transition
      L3_4 = L3_4.to
      L4_4 = A0_4
      L5_4 = {}
      L5_4.time = 100
      L5_4.rotation = 0
      L5_4.tag = "clanChallengeChest"
      L3_4(L4_4, L5_4)
      L3_4 = L1_4
      L3_4()
    end
    
    function L13_3(A0_4, A1_4)
      local L2_4, L3_4, L4_4
      L2_4 = L3_3
      if not L2_4 then
        return
      end
      L2_4 = A1_4.phase
      if L2_4 == "began" then
        L2_4 = L10_3
        L3_4 = A0_4
        L4_4 = true
        L2_4(L3_4, L4_4)
        L2_4 = display
        L2_4 = L2_4.getCurrentStage
        L2_4 = L2_4()
        L3_4 = L2_4
        L2_4 = L2_4.setFocus
        L4_4 = A0_4
        L2_4(L3_4, L4_4)
        A0_4.isFocus = true
        L2_4 = L11_3
        L3_4 = A0_4
        L2_4(L3_4)
      else
        L2_4 = A1_4.phase
        if L2_4 == "cancelled" then
          L2_4 = L10_3
          L3_4 = A0_4
          L2_4(L3_4)
        else
          L2_4 = A1_4.phase
          if L2_4 == "ended" then
            L2_4 = L10_3
            L3_4 = A0_4
            L2_4(L3_4)
            L2_4 = display
            L2_4 = L2_4.getCurrentStage
            L2_4 = L2_4()
            L3_4 = L2_4
            L2_4 = L2_4.setFocus
            L4_4 = nil
            L2_4(L3_4, L4_4)
            A0_4.isFocus = nil
            L2_4 = L12_3
            L3_4 = A0_4
            L2_4(L3_4)
            L2_4 = L1_1
            L2_4 = L2_4.comm
            L2_4 = L2_4.claimClanReward
            L2_4()
          end
        end
      end
    end
    
    L2_3.touch = L13_3
    L14_3 = L2_3
    L13_3 = L2_3.addEventListener
    L15_3 = "touch"
    L16_3 = L2_3
    L13_3(L14_3, L15_3, L16_3)
    
    function L13_3()
      local L0_4, L1_4, L2_4, L3_4
      L0_4 = transition
      L0_4 = L0_4.cancel
      L1_4 = "clanChallengeChest"
      L0_4(L1_4)
      L0_4 = L2_3
      L0_4 = L0_4.removeEventListener
      if L0_4 then
        L0_4 = L2_3
        L1_4 = L0_4
        L0_4 = L0_4.removeEventListener
        L2_4 = "touch"
        L3_4 = L2_3
        L0_4(L1_4, L2_4, L3_4)
      end
      L0_4 = L8_3
      L0_4 = L0_4.clean
      L0_4()
    end
    
    L1_3.clean = L13_3
    return L1_3
  end
  
  L21_2 = "images/gui/clan_v2/clan_reward/progressBarStep.png"
  
  function L22_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = display
    L1_3 = L1_3.newGroup
    L1_3 = L1_3()
    L2_3 = display
    L2_3 = L2_3.newImageRect
    L3_3 = L21_2
    L4_3 = 5
    L5_3 = 20
    L2_3 = L2_3(L3_3, L4_3, L5_3)
    L4_3 = L1_3
    L3_3 = L1_3.insert
    L5_3 = L2_3
    L3_3(L4_3, L5_3)
    L3_3 = L1_1
    L3_3 = L3_3.newText
    L4_3 = {}
    L5_3 = "+"
    L6_3 = A0_3
    L5_3 = L5_3 .. L6_3
    L4_3.string = L5_3
    L4_3.size = 10
    L4_3.x = -16
    L4_3.y = 14
    L4_3.ax = 0
    L5_3 = L1_1
    L5_3 = L5_3.colors
    L5_3 = L5_3.white
    L4_3.color = L5_3
    L3_3 = L3_3(L4_3)
    L5_3 = L1_3
    L4_3 = L1_3.insert
    L6_3 = L3_3
    L4_3(L5_3, L6_3)
    L4_3 = display
    L4_3 = L4_3.newImageRect
    L5_3 = "images/gui/common/coin_small.png"
    L6_3 = 13
    L7_3 = 13
    L4_3 = L4_3(L5_3, L6_3, L7_3)
    L5_3 = L3_3.x
    L6_3 = L3_3.width
    L5_3 = L5_3 + L6_3
    L5_3 = L5_3 + 7
    L4_3.x = L5_3
    L5_3 = L3_3.y
    L4_3.y = L5_3
    L6_3 = L1_3
    L5_3 = L1_3.insert
    L7_3 = L4_3
    L5_3(L6_3, L7_3)
    
    function L5_3()
      local L0_4, L1_4, L2_4, L3_4
      L0_4 = L3_3
      L1_4 = L0_4
      L0_4 = L0_4.setFillColor
      L2_4 = L1_1
      L2_4 = L2_4.colors
      L2_4 = L2_4.colorAsArgumentList
      L3_4 = L1_1
      L3_4 = L3_4.colors
      L3_4 = L3_4.green
      L2_4, L3_4 = L2_4(L3_4)
      L0_4(L1_4, L2_4, L3_4)
    end
    
    L1_3.setUnlocked = L5_3
    return L1_3
  end
  
  L23_2 = {}
  
  function L24_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L1_3 = -1
    L2_3 = A0_3
    L3_3 = 0
    L4_3 = -1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = L1_1
      L6_3 = L6_3.database
      L6_3 = L6_3.getClanRewardsOwnedForTier
      L7_3 = A0_3
      L6_3 = L6_3(L7_3)
      L7_3 = L1_1
      L7_3 = L7_3.storeConfig
      L7_3 = L7_3.getNumberOfClanRewardsForTier
      L8_3 = A0_3
      L7_3 = L7_3(L8_3)
      L8_3 = L1_1
      L8_3 = L8_3.database
      L8_3 = L8_3.getClanRewardsOwnedForTierAndBelow
      L9_3 = A0_3
      L8_3 = L8_3(L9_3)
      L9_3 = L1_1
      L9_3 = L9_3.storeConfig
      L9_3 = L9_3.getNumberOfClanRewardsForTierAndBelow
      L10_3 = A0_3
      L9_3 = L9_3(L10_3)
      if L6_3 < L7_3 then
        L1_3 = A0_3
        break
      end
    end
    return L1_3
  end
  
  L25_2 = nil
  L26_2 = nil
  
  function L27_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L0_3 = display
    L0_3 = L0_3.newGroup
    L0_3 = L0_3()
    L1_3 = display
    L1_3 = L1_3.newImageRect
    L2_3 = "images/gui/customplay/info_bubble_large.png"
    L3_3 = 228
    L4_3 = 94
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    L3_3 = L1_3
    L2_3 = L1_3.scale
    L4_3 = 0.5
    L5_3 = 0.5
    L2_3(L3_3, L4_3, L5_3)
    L3_3 = L0_3
    L2_3 = L0_3.insert
    L4_3 = L1_3
    L2_3(L3_3, L4_3)
    L2_3 = L1_1
    L2_3 = L2_3.newText
    L3_3 = {}
    L4_3 = L1_1
    L4_3 = L4_3.localized
    L4_3 = L4_3.get
    L5_3 = "Contains:"
    L4_3 = L4_3(L5_3)
    L3_3.string = L4_3
    L3_3.size = 8
    L3_3.x = 0
    L3_3.y = -10
    L4_3 = L1_1
    L4_3 = L4_3.colors
    L4_3 = L4_3.black
    L3_3.color = L4_3
    L3_3.align = "left"
    L2_3 = L2_3(L3_3)
    L3_3 = L1_1
    L3_3 = L3_3.newText
    L4_3 = {}
    L5_3 = L1_1
    L5_3 = L5_3.localized
    L5_3 = L5_3.get
    L6_3 = ""
    L5_3 = L5_3(L6_3)
    L4_3.string = L5_3
    L4_3.size = 8
    L4_3.x = -45
    L4_3.y = -5
    L4_3.ax = 0
    L4_3.ay = 0
    L5_3 = L1_1
    L5_3 = L5_3.colors
    L5_3 = L5_3.black
    L4_3.color = L5_3
    L4_3.align = "left"
    L3_3 = L3_3(L4_3)
    L4_3 = display
    L4_3 = L4_3.newImageRect
    L5_3 = "images/gui/common/coin_small.png"
    L6_3 = 10
    L7_3 = 10
    L4_3 = L4_3(L5_3, L6_3, L7_3)
    L4_3.anchorY = 0
    L5_3 = L3_3.y
    L4_3.y = L5_3
    L4_3.isVisible = false
    L5_3 = L1_1
    L5_3 = L5_3.newText
    L6_3 = {}
    L7_3 = L1_1
    L7_3 = L7_3.localized
    L7_3 = L7_3.get
    L8_3 = ""
    L7_3 = L7_3(L8_3)
    L6_3.string = L7_3
    L6_3.size = 8
    L6_3.x = -7
    L6_3.y = -5
    L6_3.ax = 0
    L6_3.ay = 0
    L7_3 = L1_1
    L7_3 = L7_3.colors
    L7_3 = L7_3.black
    L6_3.color = L7_3
    L6_3.align = "left"
    L5_3 = L5_3(L6_3)
    L6_3 = display
    L6_3 = L6_3.newImageRect
    L7_3 = "images/gui/common/coin_small.png"
    L8_3 = 10
    L9_3 = 10
    L6_3 = L6_3(L7_3, L8_3, L9_3)
    L6_3.anchorY = 0
    L6_3.anchorX = 0
    L7_3 = L5_3.y
    L6_3.y = L7_3
    L6_3.isVisible = false
    L7_3 = nil
    
    function L8_3(A0_4, A1_4)
      local L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4
      L2_4 = L7_3
      if L2_4 then
        L2_4 = L7_3
        L3_4 = L2_4
        L2_4 = L2_4.removeSelf
        L2_4(L3_4)
        L2_4 = nil
        L7_3 = L2_4
      end
      L2_4 = L5_3
      L2_4.y = 0
      L2_4 = L3_3
      L2_4.y = 0
      if A0_4 == 0 then
        L2_4 = L4_3
        L2_4.isVisible = false
        L2_4 = L6_3
        L2_4.isVisible = false
        L2_4 = L3_3
        L3_4 = L3_3
        L3_4 = L3_4.width
        L3_4 = -L3_4
        L3_4 = L3_4 * 0.5
        L2_4.x = L3_4
        L2_4 = L3_3
        L3_4 = L1_1
        L3_4 = L3_4.localized
        L3_4 = L3_4.get
        L4_4 = "Nothing yet"
        L3_4 = L3_4(L4_4)
        L2_4.text = L3_4
        L2_4 = L5_3
        L2_4.text = ""
        return
      end
      L2_4 = L1_1
      L2_4 = L2_4.database
      L2_4 = L2_4.getClanRewardsOwnedForTier
      L3_4 = A1_4
      L2_4 = L2_4(L3_4)
      L3_4 = L1_1
      L3_4 = L3_4.storeConfig
      L3_4 = L3_4.getNumberOfClanRewardsForTier
      L4_4 = A1_4
      L3_4 = L3_4(L4_4)
      L4_4 = L1_1
      L4_4 = L4_4.storeConfig
      L4_4 = L4_4.getNumberOfClanRewardsForTierAndBelow
      L5_4 = A1_4
      L4_4 = L4_4(L5_4)
      L5_4 = L1_1
      L5_4 = L5_4.database
      L5_4 = L5_4.getClanRewardsOwnedForTierAndBelow
      L6_4 = A1_4
      L5_4 = L5_4(L6_4)
      L6_4 = L1_1
      L6_4 = L6_4.clanUtils
      L6_4 = L6_4.clanRewardTiers
      L6_4 = L6_4[A1_4]
      if L4_4 <= L5_4 then
        L7_4 = L1_1
        L7_4 = L7_4.storeConfig
        L7_4 = L7_4.getNumberOfClanRewardsForTierAndBelow
        L8_4 = 7
        L7_4 = L7_4(L8_4)
        L8_4 = L1_1
        L8_4 = L8_4.database
        L8_4 = L8_4.getClanRewardsOwnedForTier
        L9_4 = 7
        L8_4 = L8_4(L9_4)
        L9_4 = L7_4 <= L8_4
        if L9_4 then
          L10_4 = L1_1
          L10_4 = L10_4.awards
          L10_4 = L10_4.getClanRewardTierValue
          L11_4 = A1_4
          L10_4 = L10_4(L11_4)
          if L10_4 and 0 < L10_4 then
            L11_4 = L5_3
            L12_4 = L1_1
            L12_4 = L12_4.localized
            L12_4 = L12_4.get
            L13_4 = "+ "
            L14_4 = L10_4
            L13_4 = L13_4 .. L14_4
            L12_4 = L12_4(L13_4)
            L11_4.text = L12_4
            L11_4 = L5_3
            L11_4.x = 4
            L11_4 = L5_3
            L11_4.y = -5
            L11_4 = L3_3
            L11_4.y = -5
            L11_4 = L6_3
            L12_4 = L5_3
            L12_4 = L12_4.y
            L11_4.y = L12_4
            L11_4 = L6_3
            L12_4 = L5_3
            L12_4 = L12_4.x
            L13_4 = L5_3
            L13_4 = L13_4.width
            L12_4 = L12_4 + L13_4
            L11_4.x = L12_4
            L11_4 = L6_3
            L11_4.isVisible = true
            L11_4 = L1_1
            L11_4 = L11_4.newText
            L12_4 = {}
            L13_4 = L1_1
            L13_4 = L13_4.localized
            L13_4 = L13_4.get
            L14_4 = ""
            L13_4 = L13_4(L14_4)
            L12_4.string = L13_4
            L12_4.size = 6
            L12_4.x = 0
            L12_4.y = 0
            L12_4.ax = 0.5
            L12_4.ay = 0
            L13_4 = L1_1
            L13_4 = L13_4.colors
            L13_4 = L13_4.darkGrey
            L12_4.color = L13_4
            L12_4.align = "center"
            L12_4.width = 110
            L11_4 = L11_4(L12_4)
            L7_3 = L11_4
            L11_4 = L7_3
            L12_4 = L1_1
            L12_4 = L12_4.localized
            L12_4 = L12_4.get
            L13_4 = "You have collected all clan items!"
            L12_4 = L12_4(L13_4)
            L11_4.text = L12_4
            L11_4 = L7_3
            L11_4.x = 0
            L11_4 = L7_3
            L12_4 = L5_3
            L12_4 = L12_4.y
            L13_4 = L5_3
            L13_4 = L13_4.height
            L12_4 = L12_4 + L13_4
            L12_4 = L12_4 + 3
            L11_4.y = L12_4
          end
        else
          L10_4 = L1_1
          L10_4 = L10_4.awards
          L10_4 = L10_4.getClanRewardTierValue
          L11_4 = A1_4
          L10_4 = L10_4(L11_4)
          if L10_4 and 0 < L10_4 then
            L11_4 = L5_3
            L12_4 = L1_1
            L12_4 = L12_4.localized
            L12_4 = L12_4.get
            L13_4 = "+ "
            L14_4 = L10_4
            L13_4 = L13_4 .. L14_4
            L12_4 = L12_4(L13_4)
            L11_4.text = L12_4
            L11_4 = L5_3
            L11_4.x = 4
            L11_4 = L5_3
            L11_4.y = -5
            L11_4 = L3_3
            L11_4.y = -5
            L11_4 = L6_3
            L12_4 = L5_3
            L12_4 = L12_4.y
            L11_4.y = L12_4
            L11_4 = L6_3
            L12_4 = L5_3
            L12_4 = L12_4.x
            L13_4 = L5_3
            L13_4 = L13_4.width
            L12_4 = L12_4 + L13_4
            L11_4.x = L12_4
            L11_4 = L6_3
            L11_4.isVisible = true
            L11_4 = L1_1
            L11_4 = L11_4.newText
            L12_4 = {}
            L13_4 = L1_1
            L13_4 = L13_4.localized
            L13_4 = L13_4.get
            L14_4 = ""
            L13_4 = L13_4(L14_4)
            L12_4.string = L13_4
            L12_4.size = 6
            L12_4.x = 0
            L12_4.y = 0
            L12_4.ax = 0.5
            L12_4.ay = 0
            L13_4 = L1_1
            L13_4 = L13_4.colors
            L13_4 = L13_4.darkGrey
            L12_4.color = L13_4
            L12_4.align = "center"
            L12_4.width = 110
            L11_4 = L11_4(L12_4)
            L7_3 = L11_4
            L11_4 = L7_3
            L12_4 = L1_1
            L12_4 = L12_4.localized
            L12_4 = L12_4.get
            L13_4 = "You own all available "
            L14_4 = L6_4
            L15_4 = " items. More items are available in higher challenge chests"
            L13_4 = L13_4 .. L14_4 .. L15_4
            L12_4 = L12_4(L13_4)
            L11_4.text = L12_4
            L11_4 = L7_3
            L11_4.x = 0
            L11_4 = L7_3
            L12_4 = L5_3
            L12_4 = L12_4.y
            L13_4 = L5_3
            L13_4 = L13_4.height
            L12_4 = L12_4 + L13_4
            L11_4.y = L12_4
          elseif A1_4 == 1 then
            L11_4 = L1_1
            L11_4 = L11_4.newText
            L12_4 = {}
            L13_4 = L1_1
            L13_4 = L13_4.localized
            L13_4 = L13_4.get
            L14_4 = ""
            L13_4 = L13_4(L14_4)
            L12_4.string = L13_4
            L12_4.size = 6
            L12_4.x = 0
            L12_4.y = 0
            L12_4.ax = 0
            L12_4.ay = 0
            L13_4 = L1_1
            L13_4 = L13_4.colors
            L13_4 = L13_4.darkGrey
            L12_4.color = L13_4
            L12_4.align = "center"
            L12_4.width = 60
            L11_4 = L11_4(L12_4)
            L7_3 = L11_4
            L11_4 = L7_3
            L12_4 = L1_1
            L12_4 = L12_4.localized
            L12_4 = L12_4.get
            L13_4 = "No clan item given for this challenge"
            L12_4 = L12_4(L13_4)
            L11_4.text = L12_4
            L11_4 = L7_3
            L11_4.x = -10
            L11_4 = L7_3
            L12_4 = L5_3
            L12_4 = L12_4.y
            L11_4.y = L12_4
          end
        end
      elseif L2_4 >= L3_4 then
        L7_4 = L1_1
        L7_4 = L7_4.newText
        L8_4 = {}
        L9_4 = L1_1
        L9_4 = L9_4.localized
        L9_4 = L9_4.get
        L10_4 = ""
        L9_4 = L9_4(L10_4)
        L8_4.string = L9_4
        L8_4.size = 6
        L8_4.x = 0
        L8_4.y = 0
        L8_4.ax = 0
        L8_4.ay = 0
        L9_4 = L1_1
        L9_4 = L9_4.colors
        L9_4 = L9_4.darkGrey
        L8_4.color = L9_4
        L8_4.align = "center"
        L8_4.width = 60
        L7_4 = L7_4(L8_4)
        L7_3 = L7_4
        L7_4 = L7_3
        L8_4 = L1_1
        L8_4 = L8_4.localized
        L8_4 = L8_4.get
        L9_4 = "You own all "
        L10_4 = L6_4
        L11_4 = " items and will be awared an item from a previous challenge"
        L9_4 = L9_4 .. L10_4 .. L11_4
        L8_4 = L8_4(L9_4)
        L7_4.text = L8_4
        L7_4 = L7_3
        L7_4.y = -2
        L7_4 = L7_3
        L7_4.x = -8
      else
        L7_4 = L5_3
        L8_4 = L1_1
        L8_4 = L8_4.localized
        L8_4 = L8_4.get
        L9_4 = L6_4
        L10_4 = " clan item"
        L9_4 = L9_4 .. L10_4
        L8_4 = L8_4(L9_4)
        L7_4.text = L8_4
        L7_4 = L1_1
        L7_4 = L7_4.newText
        L8_4 = {}
        L9_4 = L1_1
        L9_4 = L9_4.localized
        L9_4 = L9_4.get
        L10_4 = ""
        L9_4 = L9_4(L10_4)
        L8_4.string = L9_4
        L8_4.size = 6
        L8_4.x = 0
        L8_4.y = 0
        L8_4.ax = 0.5
        L8_4.ay = 0
        L9_4 = L1_1
        L9_4 = L9_4.colors
        L9_4 = L9_4.darkGrey
        L8_4.color = L9_4
        L8_4.align = "center"
        L8_4.width = 60
        L7_4 = L7_4(L8_4)
        L7_3 = L7_4
        L7_4 = L7_3
        L8_4 = L1_1
        L8_4 = L8_4.localized
        L8_4 = L8_4.get
        L9_4 = "You own "
        L10_4 = L2_4
        L11_4 = "/"
        L12_4 = L3_4
        L13_4 = " items"
        L9_4 = L9_4 .. L10_4 .. L11_4 .. L12_4 .. L13_4
        L8_4 = L8_4(L9_4)
        L7_4.text = L8_4
        L7_4 = L7_3
        L8_4 = L5_3
        L8_4 = L8_4.y
        L9_4 = L5_3
        L9_4 = L9_4.height
        L8_4 = L8_4 + L9_4
        L7_4.y = L8_4
      end
      L7_4 = L3_3
      L7_4.text = A0_4
      L7_4 = L3_3
      L7_4.x = -42
      L7_4 = L4_3
      L8_4 = L3_3
      L8_4 = L8_4.y
      L7_4.y = L8_4
      L7_4 = L4_3
      L8_4 = L3_3
      L8_4 = L8_4.x
      L9_4 = L3_3
      L9_4 = L9_4.width
      L8_4 = L8_4 + L9_4
      L8_4 = L8_4 + 5
      L7_4.x = L8_4
      L7_4 = L4_3
      L7_4.isVisible = true
      L7_4 = L7_3
      if L7_4 then
        L7_4 = L0_3
        L8_4 = L7_4
        L7_4 = L7_4.insert
        L9_4 = L7_3
        L7_4(L8_4, L9_4)
      end
    end
    
    L0_3.setPrizeInfo = L8_3
    L9_3 = L0_3
    L8_3 = L0_3.insert
    L10_3 = L2_3
    L8_3(L9_3, L10_3)
    L9_3 = L0_3
    L8_3 = L0_3.insert
    L10_3 = L3_3
    L8_3(L9_3, L10_3)
    L9_3 = L0_3
    L8_3 = L0_3.insert
    L10_3 = L4_3
    L8_3(L9_3, L10_3)
    L9_3 = L0_3
    L8_3 = L0_3.insert
    L10_3 = L6_3
    L8_3(L9_3, L10_3)
    L9_3 = L0_3
    L8_3 = L0_3.insert
    L10_3 = L5_3
    L8_3(L9_3, L10_3)
    
    function L8_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4
      L1_4 = A0_4.phase
      if L1_4 == "ended" then
        L1_4 = L25_2
        if L1_4 then
          L1_4 = timer
          L1_4 = L1_4.cancel
          L2_4 = L25_2
          L1_4(L2_4)
          L1_4 = nil
          L25_2 = L1_4
        end
        L1_4 = L0_3
        L1_4 = L1_4.isVisible
        L2_4 = L0_3
        L3_4 = not L1_4
        L2_4.isVisible = L3_4
        
        function L2_4()
          local L0_5, L1_5
          L0_5 = L0_3
          L0_5.isVisible = false
        end
        
        if L1_4 == false then
          L3_4 = timer
          L3_4 = L3_4.performWithDelay
          L4_4 = 7000
          L5_4 = L2_4
          L6_4 = 1
          L3_4 = L3_4(L4_4, L5_4, L6_4)
          L25_2 = L3_4
        end
      end
    end
    
    L0_3.show = L8_3
    L0_3.isVisible = false
    return L0_3
  end
  
  L28_2 = L27_2
  L28_2 = L28_2()
  L29_2 = L14_2.x
  L28_2.x = L29_2
  L29_2 = L14_2.y
  L30_2 = L28_2.height
  L30_2 = L30_2 * 0.5
  L29_2 = L29_2 + L30_2
  L29_2 = L29_2 + 10
  L28_2.y = L29_2
  L30_2 = L14_2
  L29_2 = L14_2.addEventListener
  L31_2 = "touch"
  L32_2 = L28_2.show
  L29_2(L30_2, L31_2, L32_2)
  L30_2 = L4_2
  L29_2 = L4_2.insert
  L31_2 = L28_2
  L29_2(L30_2, L31_2)
  
  function L29_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L0_3 = display
    L0_3 = L0_3.newGroup
    L0_3 = L0_3()
    L1_3 = display
    L1_3 = L1_3.newImageRect
    L2_3 = "images/gui/customplay/info_bubble_large.png"
    L3_3 = 228
    L4_3 = 94
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    L3_3 = L1_3
    L2_3 = L1_3.scale
    L4_3 = 0.5
    L5_3 = 0.5
    L2_3(L3_3, L4_3, L5_3)
    L3_3 = L0_3
    L2_3 = L0_3.insert
    L4_3 = L1_3
    L2_3(L3_3, L4_3)
    L2_3 = L1_1
    L2_3 = L2_3.newText
    L3_3 = {}
    L4_3 = L1_1
    L4_3 = L4_3.localized
    L4_3 = L4_3.get
    L5_3 = "Next chest:"
    L4_3 = L4_3(L5_3)
    L3_3.string = L4_3
    L3_3.size = 8
    L3_3.x = 0
    L3_3.y = -10
    L4_3 = L1_1
    L4_3 = L4_3.colors
    L4_3 = L4_3.black
    L3_3.color = L4_3
    L3_3.align = "left"
    L2_3 = L2_3(L3_3)
    L3_3 = L1_1
    L3_3 = L3_3.newText
    L4_3 = {}
    L5_3 = L1_1
    L5_3 = L5_3.localized
    L5_3 = L5_3.get
    L6_3 = ""
    L5_3 = L5_3(L6_3)
    L4_3.string = L5_3
    L4_3.size = 8
    L4_3.x = -5
    L4_3.y = 4
    L5_3 = L1_1
    L5_3 = L5_3.colors
    L5_3 = L5_3.black
    L4_3.color = L5_3
    L4_3.align = "center"
    L3_3 = L3_3(L4_3)
    L4_3 = display
    L4_3 = L4_3.newImageRect
    L5_3 = "images/gui/common/coin_small.png"
    L6_3 = 10
    L7_3 = 10
    L4_3 = L4_3(L5_3, L6_3, L7_3)
    L5_3 = L3_3.y
    L4_3.y = L5_3
    L4_3.isVisible = false
    L5_3 = L1_1
    L5_3 = L5_3.newText
    L6_3 = {}
    L7_3 = L1_1
    L7_3 = L7_3.localized
    L7_3 = L7_3.get
    L8_3 = ""
    L7_3 = L7_3(L8_3)
    L6_3.string = L7_3
    L6_3.size = 8
    L6_3.x = 0
    L6_3.y = 10
    L7_3 = L1_1
    L7_3 = L7_3.colors
    L7_3 = L7_3.black
    L6_3.color = L7_3
    L6_3.align = "center"
    L6_3.width = 100
    L5_3 = L5_3(L6_3)
    L6_3 = display
    L6_3 = L6_3.newImageRect
    L7_3 = "images/gui/common/coin_small.png"
    L8_3 = 10
    L9_3 = 10
    L6_3 = L6_3(L7_3, L8_3, L9_3)
    L7_3 = L5_3.y
    L6_3.y = L7_3
    L6_3.isVisible = false
    
    function L7_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4
      L1_4 = A0_4 + 1
      L2_4 = L1_1
      L2_4 = L2_4.database
      L2_4 = L2_4.getClanRewardsOwnedForTier
      L3_4 = L1_4
      L2_4 = L2_4(L3_4)
      L3_4 = L1_1
      L3_4 = L3_4.storeConfig
      L3_4 = L3_4.getNumberOfClanRewardsForTier
      L4_4 = L1_4
      L3_4 = L3_4(L4_4)
      L4_4 = L1_1
      L4_4 = L4_4.storeConfig
      L4_4 = L4_4.getNumberOfClanRewardsForTierAndBelow
      L5_4 = L1_4
      L4_4 = L4_4(L5_4)
      L5_4 = L1_1
      L5_4 = L5_4.clanUtils
      L5_4 = L5_4.clanRewardTiers
      L5_4 = L5_4[L1_4]
      if L5_4 then
        L6_4 = L5_3
        L7_4 = L1_1
        L7_4 = L7_4.localized
        L7_4 = L7_4.get
        L8_4 = "You own "
        L9_4 = L2_4
        L10_4 = "/"
        L11_4 = L3_4
        L12_4 = " "
        L13_4 = L5_4
        L14_4 = " items."
        L8_4 = L8_4 .. L9_4 .. L10_4 .. L11_4 .. L12_4 .. L13_4 .. L14_4
        L7_4 = L7_4(L8_4)
        L6_4.text = L7_4
      end
    end
    
    L0_3.setPrizeInfo = L7_3
    L8_3 = L0_3
    L7_3 = L0_3.insert
    L9_3 = L2_3
    L7_3(L8_3, L9_3)
    L8_3 = L0_3
    L7_3 = L0_3.insert
    L9_3 = L3_3
    L7_3(L8_3, L9_3)
    L8_3 = L0_3
    L7_3 = L0_3.insert
    L9_3 = L4_3
    L7_3(L8_3, L9_3)
    L8_3 = L0_3
    L7_3 = L0_3.insert
    L9_3 = L6_3
    L7_3(L8_3, L9_3)
    L8_3 = L0_3
    L7_3 = L0_3.insert
    L9_3 = L5_3
    L7_3(L8_3, L9_3)
    
    function L7_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4
      L1_4 = A0_4.phase
      if L1_4 == "ended" then
        L1_4 = L26_2
        if L1_4 then
          L1_4 = timer
          L1_4 = L1_4.cancel
          L2_4 = L26_2
          L1_4(L2_4)
          L1_4 = nil
          L26_2 = L1_4
        end
        L1_4 = L0_3
        L1_4 = L1_4.isVisible
        L2_4 = L0_3
        L3_4 = not L1_4
        L2_4.isVisible = L3_4
        
        function L2_4()
          local L0_5, L1_5
          L0_5 = L0_3
          L0_5.isVisible = false
        end
        
        if L1_4 == false then
          L3_4 = timer
          L3_4 = L3_4.performWithDelay
          L4_4 = 7000
          L5_4 = L2_4
          L6_4 = 1
          L3_4 = L3_4(L4_4, L5_4, L6_4)
          L26_2 = L3_4
        end
      end
    end
    
    L0_3.show = L7_3
    L0_3.isVisible = false
    return L0_3
  end
  
  L30_2 = L29_2
  L30_2 = L30_2()
  L31_2 = L15_2.x
  L30_2.x = L31_2
  L31_2 = L15_2.y
  L32_2 = L30_2.height
  L32_2 = L32_2 * 0.5
  L31_2 = L31_2 + L32_2
  L31_2 = L31_2 + 10
  L30_2.y = L31_2
  L32_2 = L15_2
  L31_2 = L15_2.addEventListener
  L33_2 = "touch"
  L34_2 = L30_2.show
  L31_2(L32_2, L33_2, L34_2)
  L32_2 = L4_2
  L31_2 = L4_2.insert
  L33_2 = L30_2
  L31_2(L32_2, L33_2)
  L31_2 = "images/gui/clan_v2/clan_reward/smallChest_"
  L32_2 = nil
  L33_2 = nil
  L34_2 = L1_1
  L34_2 = L34_2.newText
  L35_2 = {}
  L36_2 = L1_1
  L36_2 = L36_2.localized
  L36_2 = L36_2.get
  L37_2 = "??/??"
  L36_2 = L36_2(L37_2)
  L35_2.string = L36_2
  L35_2.size = 8
  L36_2 = L12_2.x
  L35_2.x = L36_2
  L36_2 = L12_2.y
  L35_2.y = L36_2
  L36_2 = L1_1
  L36_2 = L36_2.colors
  L36_2 = L36_2.white
  L35_2.color = L36_2
  L34_2 = L34_2(L35_2)
  L36_2 = L4_2
  L35_2 = L4_2.insert
  L37_2 = L34_2
  L35_2(L36_2, L37_2)
  
  function L35_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L6_2 = A0_3
    L1_3 = L16_2
    L2_3 = L1_2
    L2_3 = L2_3.leagueTimeRemainingFormat
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    L1_3.text = L2_3
    
    function L1_3()
      local L0_4, L1_4, L2_4
      L0_4 = L6_2
      L1_4 = L7_2
      L0_4 = L0_4 - L1_4
      L6_2 = L0_4
      L0_4 = L16_2
      L1_4 = L1_2
      L1_4 = L1_4.leagueTimeRemainingFormat
      L2_4 = L6_2
      L1_4 = L1_4(L2_4)
      L0_4.text = L1_4
    end
    
    L2_3 = L8_2
    if L2_3 then
      L2_3 = timer
      L2_3 = L2_3.cancel
      L3_3 = L8_2
      L2_3(L3_3)
      L2_3 = nil
      L8_2 = L2_3
    end
    L2_3 = timer
    L2_3 = L2_3.performWithDelay
    L3_3 = L7_2
    L3_3 = L3_3 * 1000
    L4_3 = L1_3
    L5_3 = 0
    L2_3 = L2_3(L3_3, L4_3, L5_3)
    L8_2 = L2_3
  end
  
  L3_2.setTimeLeft = L35_2
  
  function L35_2(A0_3)
    local L1_3, L2_3
    if A0_3 then
      L1_3 = A0_3.clean
      if L1_3 then
        L1_3 = A0_3.clean
        L1_3()
      end
      L2_3 = A0_3
      L1_3 = A0_3.removeSelf
      L1_3(L2_3)
      A0_3 = nil
    end
  end
  
  function L36_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = 1
    L1_3 = L23_2
    L1_3 = #L1_3
    L2_3 = 1
    for L3_3 = L0_3, L1_3, L2_3 do
      L4_3 = L23_2
      L4_3 = L4_3[L3_3]
      if L4_3 then
        L4_3 = L23_2
        L4_3 = L4_3[L3_3]
        L5_3 = L4_3
        L4_3 = L4_3.removeSelf
        L4_3(L5_3)
        L4_3 = L23_2
        L4_3[L3_3] = nil
      end
    end
  end
  
  function L37_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    L1_3 = L36_2
    L1_3()
    L1_3 = L1_1
    L1_3 = L1_3.awards
    L1_3 = L1_3.getClanRewardStepData
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    L2_3 = 130
    L3_3 = L10_2
    L3_3 = L3_3.x
    L4_3 = L10_2
    L4_3 = L4_3.y
    L5_3 = #L1_3
    L5_3 = L5_3 + 1
    L5_3 = L2_3 / L5_3
    L6_3 = 1
    L7_3 = #L1_3
    L8_3 = 1
    for L9_3 = L6_3, L7_3, L8_3 do
      L10_3 = L22_2
      L11_3 = L1_3[L9_3]
      L10_3 = L10_3(L11_3)
      L11_3 = L9_3 * L5_3
      L11_3 = L3_3 + L11_3
      L10_3.x = L11_3
      L10_3.y = L4_3
      L11_3 = L23_2
      L11_3[L9_3] = L10_3
      L11_3 = L4_2
      L12_3 = L11_3
      L11_3 = L11_3.insert
      L13_3 = L10_3
      L11_3(L12_3, L13_3)
    end
  end
  
  function L38_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = {}
    L2_3 = 0.33
    L3_3 = 0.66
    L1_3[1] = L2_3
    L1_3[2] = L3_3
    L2_3 = 1
    L3_3 = L23_2
    L3_3 = #L3_3
    L4_3 = 1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = L23_2
      L6_3 = L6_3[L5_3]
      if L6_3 then
        L6_3 = L1_3[L5_3]
        if A0_3 >= L6_3 then
          L6_3 = L23_2
          L6_3 = L6_3[L5_3]
          L6_3 = L6_3.setUnlocked
          L6_3()
        end
      end
    end
  end
  
  function L39_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    L1_3 = L1_1
    L1_3 = L1_3.awards
    L1_3 = L1_3.getAchievedClanRewardTierAndRequirement
    L2_3 = A0_3
    L1_3, L2_3 = L1_3(L2_3)
    L3_3 = A0_3 - L2_3
    L4_3 = L1_1
    L4_3 = L4_3.awards
    L4_3 = L4_3.getNextClanPointRequirement
    L5_3 = L1_3 + 1
    L4_3 = L4_3(L5_3)
    L5_3 = L4_3 - L2_3
    L6_3 = L3_3 / L5_3
    L7_3 = L35_2
    L8_3 = L32_2
    L7_3(L8_3)
    L7_3 = L35_2
    L8_3 = L33_2
    L7_3(L8_3)
    L7_3 = L35_2
    L8_3 = L19_2
    L7_3(L8_3)
    L7_3 = L1_1
    L7_3 = L7_3.clanUtils
    L7_3 = L7_3.clanRewardTiers
    L7_3 = L7_3[L1_3]
    if 1 < L1_3 and L1_3 < 7 then
      L8_3 = L1_1
      L8_3 = L8_3.clanUtils
      L8_3 = L8_3.clanRewardTiers
      L9_3 = L1_3 + 1
      L8_3 = L8_3[L9_3]
      L9_3 = display
      L9_3 = L9_3.newImageRect
      L10_3 = L31_2
      L11_3 = L7_3
      L12_3 = ".png"
      L10_3 = L10_3 .. L11_3 .. L12_3
      L11_3 = 50
      L12_3 = 43
      L9_3 = L9_3(L10_3, L11_3, L12_3)
      L32_2 = L9_3
      L9_3 = display
      L9_3 = L9_3.newImageRect
      L10_3 = L31_2
      L11_3 = L8_3
      L12_3 = ".png"
      L10_3 = L10_3 .. L11_3 .. L12_3
      L11_3 = 50
      L12_3 = 43
      L9_3 = L9_3(L10_3, L11_3, L12_3)
      L33_2 = L9_3
      L9_3 = L34_2
      L10_3 = L3_3
      L11_3 = "/"
      L12_3 = L5_3
      L10_3 = L10_3 .. L11_3 .. L12_3
      L9_3.text = L10_3
      L9_3 = L11_2
      L10_3 = L34_2
      L10_3 = L10_3.x
      L11_3 = L34_2
      L11_3 = L11_3.width
      L11_3 = L11_3 * 0.5
      L10_3 = L10_3 + L11_3
      L10_3 = L10_3 + 5
      L9_3.x = L10_3
      L9_3 = L10_2
      L9_3 = L9_3.setProgression
      L10_3 = L6_3
      L9_3(L10_3)
      L9_3 = L37_2
      L10_3 = L1_3
      L9_3(L10_3)
      L9_3 = L4_2
      L9_3.isVisible = true
    elseif L1_3 == 7 then
      L8_3 = L20_2
      L9_3 = L1_3
      L8_3 = L8_3(L9_3)
      L19_2 = L8_3
      L8_3 = L19_2
      L8_3 = L8_3.updateText
      L9_3 = L6_2
      L8_3(L9_3)
      L8_3 = L19_2
      L8_3.y = -8
      L8_3 = L19_2
      L8_3 = L8_3.setClaimable
      L9_3 = false
      L8_3(L9_3)
      L8_3 = L4_2
      L8_3.isVisible = false
      L8_3 = L3_2
      L9_3 = L8_3
      L8_3 = L8_3.insert
      L10_3 = L19_2
      L8_3(L9_3, L10_3)
    else
      L8_3 = "empty"
      if 0.33 <= L6_3 then
        L8_3 = "full"
      end
      L9_3 = display
      L9_3 = L9_3.newImageRect
      L10_3 = "images/gui/clan_v2/clan_reward/smallBag_"
      L11_3 = L8_3
      L12_3 = ".png"
      L10_3 = L10_3 .. L11_3 .. L12_3
      L11_3 = 50
      L12_3 = 43
      L9_3 = L9_3(L10_3, L11_3, L12_3)
      L32_2 = L9_3
      L9_3 = L1_1
      L9_3 = L9_3.clanUtils
      L9_3 = L9_3.clanRewardTiers
      L10_3 = L1_3 + 1
      L9_3 = L9_3[L10_3]
      L10_3 = display
      L10_3 = L10_3.newImageRect
      L11_3 = L31_2
      L12_3 = L9_3
      L13_3 = ".png"
      L11_3 = L11_3 .. L12_3 .. L13_3
      L12_3 = 50
      L13_3 = 43
      L10_3 = L10_3(L11_3, L12_3, L13_3)
      L33_2 = L10_3
      L10_3 = L34_2
      L11_3 = L3_3
      L12_3 = "/"
      L13_3 = L5_3
      L11_3 = L11_3 .. L12_3 .. L13_3
      L10_3.text = L11_3
      L10_3 = L11_2
      L11_3 = L34_2
      L11_3 = L11_3.x
      L12_3 = L34_2
      L12_3 = L12_3.width
      L12_3 = L12_3 * 0.5
      L11_3 = L11_3 + L12_3
      L11_3 = L11_3 + 5
      L10_3.x = L11_3
      L10_3 = L37_2
      L11_3 = L1_3
      L10_3(L11_3)
      L10_3 = L4_2
      L10_3.isVisible = true
    end
    L8_3 = L10_2
    L8_3 = L8_3.setProgression
    L9_3 = L6_3
    L8_3(L9_3)
    L8_3 = L38_2
    L9_3 = L6_3
    L8_3(L9_3)
    L8_3 = L1_1
    L8_3 = L8_3.awards
    L8_3 = L8_3.getClanRewardCoinReward
    L9_3 = L1_3
    L8_3 = L8_3(L9_3)
    L9_3 = L1_1
    L9_3 = L9_3.awards
    L9_3 = L9_3.getClanRewardSubRewardAchieved
    L10_3 = L1_3
    L11_3 = L6_3
    L9_3 = L9_3(L10_3, L11_3)
    L8_3 = L8_3 + L9_3
    L9_3 = L28_2
    L9_3 = L9_3.setPrizeInfo
    L10_3 = L8_3
    L11_3 = L1_3
    L9_3(L10_3, L11_3)
    L9_3 = L30_2
    L9_3 = L9_3.setPrizeInfo
    L10_3 = L1_3
    L9_3(L10_3)
    L9_3 = L32_2
    if L9_3 then
      L9_3 = L32_2
      L10_3 = L9_3
      L9_3 = L9_3.scale
      L11_3 = 0.8
      L12_3 = 0.8
      L9_3(L10_3, L11_3, L12_3)
      L9_3 = L32_2
      L10_3 = L14_2
      L10_3 = L10_3.x
      L9_3.x = L10_3
      L9_3 = L32_2
      L10_3 = L14_2
      L10_3 = L10_3.y
      L10_3 = L10_3 - 4
      L9_3.y = L10_3
      L9_3 = L4_2
      L10_3 = L9_3
      L9_3 = L9_3.insert
      L11_3 = L32_2
      L9_3(L10_3, L11_3)
    end
    L9_3 = L33_2
    if L9_3 then
      L9_3 = L33_2
      L10_3 = L9_3
      L9_3 = L9_3.scale
      L11_3 = 1
      L12_3 = 1
      L9_3(L10_3, L11_3, L12_3)
      L9_3 = L33_2
      L10_3 = L15_2
      L10_3 = L10_3.x
      L9_3.x = L10_3
      L9_3 = L33_2
      L10_3 = L15_2
      L10_3 = L10_3.y
      L10_3 = L10_3 - 6
      L9_3.y = L10_3
      L9_3 = L4_2
      L10_3 = L9_3
      L9_3 = L9_3.insert
      L11_3 = L33_2
      L9_3(L10_3, L11_3)
    end
    L9_3 = L1_1
    L9_3 = L9_3.data
    L9_3 = L9_3.clans
    L9_3 = L9_3.clanRewardToClaim
    if L9_3 then
      L9_3 = L4_2
      L9_3.isVisible = false
      L9_3 = L35_2
      L10_3 = L19_2
      L9_3(L10_3)
      L9_3 = L20_2
      L10_3 = L1_1
      L10_3 = L10_3.data
      L10_3 = L10_3.clans
      L10_3 = L10_3.clanRewardToClaim
      L9_3 = L9_3(L10_3)
      L19_2 = L9_3
      L9_3 = L19_2
      L9_3.isVisible = true
      L9_3 = L19_2
      L9_3.y = -8
      L9_3 = L19_2
      L9_3 = L9_3.updateText
      L9_3()
      L9_3 = L19_2
      L9_3 = L9_3.setClaimable
      L10_3 = true
      L9_3(L10_3)
      L9_3 = L3_2
      L10_3 = L9_3
      L9_3 = L9_3.insert
      L11_3 = L19_2
      L9_3(L10_3, L11_3)
    end
    L9_3 = L28_2
    L10_3 = L9_3
    L9_3 = L9_3.toFront
    L9_3(L10_3)
    L9_3 = L30_2
    L10_3 = L9_3
    L9_3 = L9_3.toFront
    L9_3(L10_3)
  end
  
  L3_2.setClanPoints = L39_2
  
  function L39_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L5_2
    if L0_3 then
      return
    end
    L0_3 = true
    L5_2 = L0_3
    L0_3 = L10_2
    L0_3 = L0_3.clean
    L0_3()
    L0_3 = L19_2
    if L0_3 then
      L0_3 = L19_2
      L0_3 = L0_3.clean
      L0_3()
    end
    L0_3 = L14_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L28_2
    L3_3 = L3_3.show
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L8_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L8_2
      L0_3(L1_3)
      L0_3 = nil
      L8_2 = L0_3
    end
    L0_3 = L25_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L25_2
      L0_3(L1_3)
      L0_3 = nil
      L25_2 = L0_3
    end
    L0_3 = L26_2
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L26_2
      L0_3(L1_3)
      L0_3 = nil
      L26_2 = L0_3
    end
  end
  
  L3_2.clean = L39_2
  L40_2 = L3_2
  L39_2 = L3_2.insert
  L41_2 = L4_2
  L39_2(L40_2, L41_2)
  return L3_2
end

L0_1.create = L2_1
return L0_1
