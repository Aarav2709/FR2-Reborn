local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
L1_1 = require
L2_1 = "composer"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "lua.modules.androidBackButton"
L2_1 = L2_1(L3_1)
L3_1 = require
L4_1 = "lua.overlays.areYouSureOverlay"
L3_1 = L3_1(L4_1)

function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L0_2 = display
  L0_2 = L0_2.newGroup
  L0_2 = L0_2()
  L1_2 = nil
  L2_2 = nil
  L3_2 = nil
  L4_2 = nil
  L5_2 = true
  L6_2 = true
  L7_2 = true
  L8_2 = true
  L9_2 = -1
  
  function L10_2()
    local L0_3, L1_3, L2_3
    L0_3 = L1_1
    L0_3 = L0_3.database
    L0_3 = L0_3.getPlayerInformation
    L0_3 = L0_3()
    L1_3 = L0_3.playerId
    L2_3 = L9_2
    L1_3 = L1_3 == L2_3
    return L1_3
  end
  
  function L11_2(A0_3)
    local L1_3, L2_3
    L1_3 = L1_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getPlayerRank
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    if L1_3 then
      L2_3 = L1_1
      L2_3 = L2_3.clanUtils
      L2_3 = L2_3.getMyClanRank
      L2_3 = L2_3()
      L2_3 = L1_3 > L2_3
      return L2_3
    end
    L2_3 = true
    return L2_3
  end
  
  function L12_2()
    local L0_3, L1_3, L2_3
    L0_3 = L1_1
    L0_3 = L0_3.clanUtils
    L0_3 = L0_3.getPlayerRank
    L1_3 = L9_2
    L0_3 = L0_3(L1_3)
    if not L0_3 then
      L1_3 = false
      return L1_3
    end
    L1_3 = L1_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getMyClanRank
    L1_3 = L1_3()
    L2_3 = (L1_3 == 3 or L1_3 == 2) and L0_3 < L1_3
    return L2_3
  end
  
  function L13_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L1_1
    L0_3 = L0_3.clanUtils
    L0_3 = L0_3.getPlayerRank
    L1_3 = L9_2
    L0_3 = L0_3(L1_3)
    if not L0_3 then
      L1_3 = false
      return L1_3
    end
    L1_3 = L1_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getMyClanRank
    L1_3 = L1_3()
    L2_3 = L1_3 == 2 and L0_3 < 1
    L3_3 = L1_3 == 3 and L0_3 < 3
    L4_3 = L0_3 < 3
    L5_3 = L3_3 or L5_3
    if L2_3 or L3_3 then
      L5_3 = L4_3
    end
    return L5_3
  end
  
  function L14_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L1_1
    L0_3 = L0_3.clanUtils
    L0_3 = L0_3.getPlayerRank
    L1_3 = L9_2
    L0_3 = L0_3(L1_3)
    if not L0_3 then
      L1_3 = false
      return L1_3
    end
    L1_3 = L1_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getMyClanRank
    L1_3 = L1_3()
    L2_3 = L1_3 == 2 and L0_3 < 2
    L3_3 = L1_3 == 3 and L0_3 < 3
    L4_3 = 0 < L0_3
    L5_3 = L3_3 or L5_3
    if L2_3 or L3_3 then
      L5_3 = L4_3
    end
    return L5_3
  end
  
  function L15_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L1_3 = L0_2
    L1_3.isVisible = true
    L9_2 = A0_3
    L1_3 = L1_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getPlayerRank
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    if L1_3 == nil then
      L2_3 = L0_2
      L2_3.isVisible = false
      return
    end
    L2_3 = L10_2
    L2_3 = L2_3()
    if not L2_3 then
      L2_3 = L12_2
      L2_3 = L2_3()
      L8_2 = L2_3
      L2_3 = L13_2
      L2_3 = L2_3()
      L6_2 = L2_3
      L2_3 = L14_2
      L2_3 = L2_3()
      L7_2 = L2_3
      L2_3 = true
      L5_2 = L2_3
      L2_3 = L1_1
      L2_3 = L2_3.database
      L2_3 = L2_3.isFriend
      L3_3 = A0_3
      L2_3 = L2_3(L3_3)
      if L2_3 then
        L3_3 = false
        L5_2 = L3_3
      end
      L3_3 = L8_2
      if L3_3 then
        L3_3 = L4_2
        L3_3 = L3_3.changeButtonImage
        L4_3 = "images/gui/clan_v2/actions/kick.png"
        L3_3(L4_3)
      end
    else
      L2_3 = false
      L5_2 = L2_3
      L2_3 = true
      L8_2 = L2_3
      L2_3 = false
      L6_2 = L2_3
      L2_3 = false
      L7_2 = L2_3
      if L1_3 and L1_3 == 3 then
        L2_3 = L1_1
        L2_3 = L2_3.data
        L2_3 = L2_3.clans
        L2_3 = L2_3.members
        L2_3 = #L2_3
        if 1 < L2_3 then
          L2_3 = false
          L8_2 = L2_3
        end
      end
      L2_3 = L8_2
      if L2_3 then
        L2_3 = L4_2
        L2_3 = L2_3.changeButtonImage
        L3_3 = "images/gui/clan_v2/actions/leave.png"
        L2_3(L3_3)
      end
    end
    L2_3 = L1_2
    L2_3.isVisible = false
    L2_3 = L2_2
    L2_3.isVisible = false
    L2_3 = L3_2
    L2_3.isVisible = false
    L2_3 = L4_2
    L2_3.isVisible = false
    L2_3 = L5_2
    if L2_3 then
      L2_3 = L1_2
      L2_3.isVisible = true
    end
    L2_3 = L6_2
    if L2_3 then
      L2_3 = L2_2
      L2_3.isVisible = true
    end
    L2_3 = L7_2
    if L2_3 then
      L2_3 = L3_2
      L2_3.isVisible = true
    end
    L2_3 = L8_2
    if L2_3 then
      L2_3 = L4_2
      L2_3.isVisible = true
    end
    L2_3 = {}
    L3_3 = L1_2
    L4_3 = L2_2
    L5_3 = L3_2
    L6_3 = L4_2
    L2_3[1] = L3_3
    L2_3[2] = L4_3
    L2_3[3] = L5_3
    L2_3[4] = L6_3
    L3_3 = 0
    L4_3 = 0
    L5_3 = 34
    L6_3 = 1
    L7_3 = 4
    L8_3 = 1
    for L9_3 = L6_3, L7_3, L8_3 do
      L10_3 = L2_3[L9_3]
      L11_3 = L10_3.isVisible
      if L11_3 then
        L10_3.x = L3_3
        L10_3.y = L4_3
        L4_3 = L4_3 + L5_3
      end
    end
    L6_3 = true
    return L6_3
  end
  
  L0_2.refreshButtons = L15_2
  
  function L16_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L5_2
    if not L0_3 then
      return
    end
    L0_3 = L1_1
    L0_3 = L0_3.clanUtils
    L0_3 = L0_3.getClanMember
    L1_3 = L9_2
    L0_3 = L0_3(L1_3)
    L1_3 = nil
    if L0_3 then
      L1_3 = L0_3.name
    end
    L2_3 = {}
    
    function L3_3()
      local L0_4, L1_4, L2_4
      L0_4 = L1_1
      L0_4 = L0_4.comm
      L0_4 = L0_4.addFriend
      L1_4 = L9_2
      L2_4 = false
      L0_4(L1_4, L2_4)
    end
    
    L2_3.yesEvent = L3_3
    L3_3 = L1_1
    L3_3 = L3_3.localized
    L3_3 = L3_3.get
    L4_3 = "Add friend"
    L3_3 = L3_3(L4_3)
    L4_3 = "\n"
    L5_3 = L1_3
    L3_3 = L3_3 .. L4_3 .. L5_3
    L2_3.text = L3_3
    L3_3 = L2_3.yesEvent
    if L3_3 then
      L3_3 = L3_1
      L3_3 = L3_3.create
      L4_3 = L2_3
      L3_3(L4_3)
    end
  end
  
  L17_2 = L1_1
  L17_2 = L17_2.newButton
  L18_2 = {}
  L18_2.image = "images/gui/clan_v2/actions/friend.png"
  L18_2.width = 56
  L18_2.height = 32
  L18_2.onRelease = L16_2
  L18_2.x = 0
  L18_2.y = 0
  L17_2 = L17_2(L18_2)
  L1_2 = L17_2
  L18_2 = L0_2
  L17_2 = L0_2.insert
  L19_2 = L1_2
  L17_2(L18_2, L19_2)
  
  function L17_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = L6_2
    if not L0_3 then
      return
    end
    L0_3 = {}
    L1_3 = L1_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getClanMember
    L2_3 = L9_2
    L1_3 = L1_3(L2_3)
    L2_3 = nil
    if L1_3 then
      L2_3 = L1_3.name
    end
    L3_3 = L1_1
    L3_3 = L3_3.clanUtils
    L3_3 = L3_3.getClanMember
    L4_3 = L9_2
    L3_3 = L3_3(L4_3)
    L3_3 = L3_3.rank
    L3_3 = L3_3 + 1
    if 3 < L3_3 then
      return
    end
    L4_3 = L10_2
    L4_3 = L4_3()
    if not L4_3 then
      L4_3 = L13_2
      L4_3 = L4_3()
      if L4_3 then
        function L4_3()
          local L0_4, L1_4, L2_4
          
          L0_4 = L1_1
          L0_4 = L0_4.comm
          L0_4 = L0_4.changeClanRank
          L1_4 = L9_2
          L2_4 = L3_3
          L0_4(L1_4, L2_4)
        end
        
        L0_3.yesEvent = L4_3
        L4_3 = L1_1
        L4_3 = L4_3.localized
        L4_3 = L4_3.get
        L5_3 = "PromotePlayer"
        L4_3 = L4_3(L5_3)
        L5_3 = " "
        L6_3 = L2_3
        L4_3 = L4_3 .. L5_3 .. L6_3
        L0_3.text = L4_3
        if L3_3 == 3 then
          L4_3 = L1_1
          L4_3 = L4_3.clanUtils
          L4_3 = L4_3.getMyClanRank
          L4_3 = L4_3()
          if L4_3 == 3 then
            L4_3 = L0_3.text
            L5_3 = L1_1
            L5_3 = L5_3.localized
            L5_3 = L5_3.get
            L6_3 = "PromoteToLeaderWarning"
            L5_3 = L5_3(L6_3)
            L4_3 = L4_3 .. L5_3
            L0_3.text = L4_3
            L4_3 = {}
            L5_3 = 0.78
            L6_3 = 0.15
            L7_3 = 0.15
            L4_3[1] = L5_3
            L4_3[2] = L6_3
            L4_3[3] = L7_3
            L0_3.color = L4_3
          end
        end
      end
    end
    L4_3 = L0_3.yesEvent
    if L4_3 then
      L4_3 = L3_1
      L4_3 = L4_3.create
      L5_3 = L0_3
      L4_3(L5_3)
    end
  end
  
  L18_2 = L1_1
  L18_2 = L18_2.newButton
  L19_2 = {}
  L19_2.image = "images/gui/clan_v2/actions/promote.png"
  L19_2.width = 56
  L19_2.height = 32
  L19_2.onRelease = L17_2
  L19_2.x = 0
  L19_2.y = 0
  L18_2 = L18_2(L19_2)
  L2_2 = L18_2
  L19_2 = L0_2
  L18_2 = L0_2.insert
  L20_2 = L2_2
  L18_2(L19_2, L20_2)
  
  function L18_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = L7_2
    if not L0_3 then
      return
    end
    L0_3 = {}
    L1_3 = L1_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getClanMember
    L2_3 = L9_2
    L1_3 = L1_3(L2_3)
    L2_3 = nil
    if L1_3 then
      L2_3 = L1_3.name
    end
    L3_3 = L1_1
    L3_3 = L3_3.clanUtils
    L3_3 = L3_3.getClanMember
    L4_3 = L9_2
    L3_3 = L3_3(L4_3)
    L3_3 = L3_3.rank
    L3_3 = L3_3 - 1
    if L3_3 < 0 then
      return
    end
    L4_3 = L10_2
    L4_3 = L4_3()
    if not L4_3 then
      L4_3 = L14_2
      L4_3 = L4_3()
      if L4_3 then
        function L4_3()
          local L0_4, L1_4, L2_4
          
          L0_4 = L1_1
          L0_4 = L0_4.comm
          L0_4 = L0_4.changeClanRank
          L1_4 = L9_2
          L2_4 = L3_3
          L0_4(L1_4, L2_4)
        end
        
        L0_3.yesEvent = L4_3
        L4_3 = L1_1
        L4_3 = L4_3.localized
        L4_3 = L4_3.get
        L5_3 = "DemotePlayer"
        L4_3 = L4_3(L5_3)
        L5_3 = " "
        L6_3 = L2_3
        L4_3 = L4_3 .. L5_3 .. L6_3
        L0_3.text = L4_3
      end
    end
    L4_3 = L0_3.yesEvent
    if L4_3 then
      L4_3 = L3_1
      L4_3 = L4_3.create
      L5_3 = L0_3
      L4_3(L5_3)
    end
  end
  
  L19_2 = L1_1
  L19_2 = L19_2.newButton
  L20_2 = {}
  L20_2.image = "images/gui/clan_v2/actions/demote.png"
  L20_2.width = 56
  L20_2.height = 32
  L20_2.onRelease = L18_2
  L20_2.x = 0
  L20_2.y = 0
  L19_2 = L19_2(L20_2)
  L3_2 = L19_2
  L20_2 = L0_2
  L19_2 = L0_2.insert
  L21_2 = L3_2
  L19_2(L20_2, L21_2)
  
  function L19_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L8_2
    if not L0_3 then
      L0_3 = L1_1
      L0_3 = L0_3.clanUtils
      L0_3 = L0_3.getMyClanRank
      L0_3 = L0_3()
      if L0_3 == 3 then
        L0_3 = L1_1
        L0_3 = L0_3.createCustomOverlay
        L1_3 = 55
        L0_3(L1_3)
      end
      return
    end
    L0_3 = {}
    L1_3 = L1_1
    L1_3 = L1_3.clanUtils
    L1_3 = L1_3.getClanMember
    L2_3 = L9_2
    L1_3 = L1_3(L2_3)
    L2_3 = nil
    if L1_3 then
      L2_3 = L1_3.name
    end
    L3_3 = L10_2
    L3_3 = L3_3()
    if L3_3 then
      function L3_3()
        local L0_4, L1_4
        
        L0_4 = L1_1
        L0_4 = L0_4.comm
        L0_4 = L0_4.leaveClan
        L0_4()
      end
      
      L0_3.yesEvent = L3_3
      L3_3 = L1_1
      L3_3 = L3_3.localized
      L3_3 = L3_3.get
      L4_3 = "LeaveClan"
      L3_3 = L3_3(L4_3)
      L0_3.text = L3_3
    else
      L3_3 = L12_2
      L3_3 = L3_3()
      if L3_3 then
        function L3_3()
          local L0_4, L1_4
          
          L0_4 = L1_1
          L0_4 = L0_4.comm
          L0_4 = L0_4.kickPlayerFromClan
          L1_4 = L9_2
          L0_4(L1_4)
        end
        
        L0_3.yesEvent = L3_3
        L3_3 = L1_1
        L3_3 = L3_3.localized
        L3_3 = L3_3.get
        L4_3 = "KickPlayer"
        L3_3 = L3_3(L4_3)
        L4_3 = " "
        L5_3 = L2_3
        L3_3 = L3_3 .. L4_3 .. L5_3
        L0_3.text = L3_3
      end
    end
    L3_3 = L0_3.yesEvent
    if L3_3 then
      L3_3 = L3_1
      L3_3 = L3_3.create
      L4_3 = L0_3
      L3_3(L4_3)
    end
  end
  
  L20_2 = L1_1
  L20_2 = L20_2.newButton
  L21_2 = {}
  L21_2.image = "images/gui/clan_v2/actions/leave.png"
  L21_2.width = 56
  L21_2.height = 32
  L21_2.onRelease = L19_2
  L21_2.x = 0
  L21_2.y = 0
  L20_2 = L20_2(L21_2)
  L4_2 = L20_2
  L21_2 = L0_2
  L20_2 = L0_2.insert
  L22_2 = L4_2
  L20_2(L21_2, L22_2)
  
  function L20_2()
    local L0_3, L1_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L1_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L2_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L3_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L4_2
    L0_3(L1_3)
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L0_2
    L0_3(L1_3)
  end
  
  L0_2.clean = L20_2
  return L0_2
end

L0_1.create = L4_1
return L0_1
