local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = {}
L2_1 = L0_1.localized
L2_1 = L2_1.get
L3_1 = "All those guys just got washed #funrun2 dirtybit.com/funrun2/"
L4_1 = true
L2_1 = L2_1(L3_1, L4_1)
L3_1 = L0_1.localized
L3_1 = L3_1.get
L4_1 = "Want to catch an L? #funrun2 dirtybit.com/funrun2/"
L5_1 = true
L3_1 = L3_1(L4_1, L5_1)
L4_1 = L0_1.localized
L4_1 = L4_1.get
L5_1 = "Get on my level, son! #funrun2 dirtybit.com/funrun2/"
L6_1 = true
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L4_1(L5_1, L6_1)
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L1_1[7] = L8_1
L1_1[8] = L9_1
L2_1 = {}
L3_1 = L0_1.localized
L3_1 = L3_1.get
L4_1 = "Having a blast @ #funrun2 dirtybit.com/funrun2/"
L5_1 = true
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L3_1(L4_1, L5_1)
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L3_1 = {}
L4_1 = L0_1.localized
L4_1 = L4_1.get
L5_1 = "Represent!"
L6_1 = true
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L4_1(L5_1, L6_1)
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L4_1 = L0_1.localized
L4_1 = L4_1.get
L5_1 = "I just played a golden fox! #funrun2 dirtybit.com/funrun2/"
L6_1 = true
L4_1 = L4_1(L5_1, L6_1)
L5_1 = L0_1.localized
L5_1 = L5_1.get
L6_1 = "I just beat a golden fox! #funrun2 dirtybit.com/funrun2/"
L7_1 = true
L5_1 = L5_1(L6_1, L7_1)
L6_1 = L0_1.localized
L6_1 = L6_1.get
L7_1 = "I just played a #DirtybitDev! #funrun2 dirtybit.com/funrun2/"
L8_1 = true
L6_1 = L6_1(L7_1, L8_1)
L7_1 = L0_1.localized
L7_1 = L7_1.get
L8_1 = "I just beat a #DirtybitDev! #funrun2 dirtybit.com/funrun2/"
L9_1 = true
L7_1 = L7_1(L8_1, L9_1)

function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  
  function L5_2()
    local L0_3, L1_3, L2_3
    L0_3 = A0_2
    if L0_3 == "clanScene" then
      L0_3 = L3_1
      L0_3 = L0_3[1]
      return L0_3
    else
      L0_3 = A3_2
      if L0_3 then
        L0_3 = A1_2
        if L0_3 then
          L0_3 = L5_1
          return L0_3
        else
          L0_3 = L4_1
          return L0_3
        end
      else
        L0_3 = A2_2
        if L0_3 then
          L0_3 = A1_2
          if L0_3 then
            L0_3 = L7_1
            return L0_3
          else
            L0_3 = L6_1
            return L0_3
          end
        else
          L0_3 = A1_2
          if L0_3 then
            L0_3 = math
            L0_3 = L0_3.random
            L1_3 = 1
            L2_3 = L1_1
            L2_3 = #L2_3
            L0_3 = L0_3(L1_3, L2_3)
            L1_3 = L1_1
            L1_3 = L1_3[L0_3]
            return L1_3
          else
            L0_3 = math
            L0_3 = L0_3.random
            L1_3 = 1
            L2_3 = L2_1
            L2_3 = #L2_3
            L0_3 = L0_3(L1_3, L2_3)
            L1_3 = L2_1
            L1_3 = L1_3[L0_3]
            return L1_3
          end
        end
      end
    end
  end
  
  L6_2 = L5_2
  L6_2 = L6_2()
  L7_2 = L6_2
  L8_2 = "UIActivityTypePostToTwitter"
  L9_2 = isAndroid
  if L9_2 then
    L8_2 = "share"
  end
  L9_2 = "activity"
  L10_2 = isAndroid
  if L10_2 then
    L9_2 = "social"
  end
  L10_2 = native
  L10_2 = L10_2.canShowPopup
  L11_2 = L9_2
  L12_2 = L8_2
  L10_2 = L10_2(L11_2, L12_2)
  if L10_2 then
    L11_2 = {}
    
    function L12_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3, L5_3
      L2_3 = print
      L3_3 = "name: "
      L4_3 = A1_3.name
      L3_3 = L3_3 .. L4_3
      L2_3(L3_3)
      L2_3 = print
      L3_3 = "type: "
      L4_3 = A1_3.type
      L3_3 = L3_3 .. L4_3
      L2_3(L3_3)
      L2_3 = print
      L3_3 = "action: "
      L4_3 = tostring
      L5_3 = A1_3.action
      L4_3 = L4_3(L5_3)
      L3_3 = L3_3 .. L4_3
      L2_3(L3_3)
      L2_3 = print
      L3_3 = "limitReached: "
      L4_3 = tostring
      L5_3 = A1_3.limitReached
      L4_3 = L4_3(L5_3)
      L3_3 = L3_3 .. L4_3
      L2_3(L3_3)
    end
    
    L11_2.popup = L12_2
    L12_2 = math
    L12_2 = L12_2.floor
    L13_2 = system
    L13_2 = L13_2.getTimer
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
    L13_2 = ".png"
    L12_2 = L12_2 .. L13_2
    L13_2 = {}
    L13_2.filename = L12_2
    L14_2 = system
    L14_2 = L14_2.CachesDirectory
    L13_2.baseDir = L14_2
    L14_2 = display
    L14_2 = L14_2.captureScreen
    L15_2 = false
    L14_2 = L14_2(L15_2)
    L15_2 = display
    L15_2 = L15_2.contentWidth
    L15_2 = L15_2 / 2
    L14_2.x = L15_2
    L15_2 = display
    L15_2 = L15_2.contentHeight
    L15_2 = L15_2 / 2
    L14_2.y = L15_2
    L15_2 = display
    L15_2 = L15_2.save
    L16_2 = L14_2
    L17_2 = L13_2
    L15_2(L16_2, L17_2)
    L16_2 = L14_2
    L15_2 = L14_2.removeSelf
    L15_2(L16_2)
    L15_2 = {}
    L15_2.message = L6_2
    L15_2.listener = L11_2
    L16_2 = {}
    L17_2 = {}
    L17_2.filename = L12_2
    L18_2 = system
    L18_2 = L18_2.CachesDirectory
    L17_2.baseDir = L18_2
    L16_2[1] = L17_2
    L15_2.image = L16_2
    L16_2 = isIOS
    if L16_2 then
      L16_2 = {}
      L17_2 = {}
      L18_2 = {}
      L18_2.type = "string"
      L18_2.value = L6_2
      L19_2 = {}
      L19_2.type = "image"
      L20_2 = {}
      L20_2.filename = L12_2
      L21_2 = system
      L21_2 = L21_2.CachesDirectory
      L20_2.baseDir = L21_2
      L19_2.value = L20_2
      L17_2[1] = L18_2
      L17_2[2] = L19_2
      L16_2.items = L17_2
      L16_2.listener = L11_2
      L15_2 = L16_2
    end
    L16_2 = native
    L16_2 = L16_2.showPopup
    L17_2 = L9_2
    L18_2 = L15_2
    L16_2(L17_2, L18_2)
  else
    L11_2 = "No Social Media"
    L12_2 = "Please setup your Twitter account or check your network connection."
    L13_2 = {}
    L14_2 = "OK"
    L13_2[1] = L14_2
    L14_2 = native
    L14_2 = L14_2.showAlert
    L15_2 = L11_2
    L16_2 = L12_2
    L17_2 = L13_2
    L14_2(L15_2, L16_2, L17_2)
  end
end

L0_1.showSocialPopup = L8_1
