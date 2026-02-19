local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = require
L1_1 = "composer"
L0_1 = L0_1(L1_1)
L1_1 = L0_1.newScene
L1_1 = L1_1()
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = nil

function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  L2_2 = require
  L3_2 = "lua.network.httpsMessageFormat"
  L2_2 = L2_2(L3_2)
  L3_2 = A0_2.view
  L4_2 = display
  L4_2 = L4_2.newImageRect
  L5_2 = "images/gui/common/black.png"
  L6_2 = 480
  L7_2 = 320
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = display
  L5_2 = L5_2.contentWidth
  L5_2 = L5_2 * 0.5
  L4_2.x = L5_2
  L5_2 = display
  L5_2 = L5_2.contentHeight
  L5_2 = L5_2 * 0.5
  L4_2.y = L5_2
  L5_2 = display
  L5_2 = L5_2.newImageRect
  L6_2 = "images/gui/login/window.png"
  L7_2 = 350
  L8_2 = 137
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = display
  L6_2 = L6_2.contentWidth
  L6_2 = L6_2 * 0.5
  L5_2.x = L6_2
  L5_2.y = 66
  L6_2 = L0_1
  L6_2 = L6_2.newText
  L7_2 = {}
  L8_2 = L0_1
  L8_2 = L8_2.localized
  L8_2 = L8_2.get
  L9_2 = "Validating Receipts"
  L8_2 = L8_2(L9_2)
  L7_2.string = L8_2
  L8_2 = L5_2.x
  L7_2.x = L8_2
  L8_2 = L5_2.y
  L8_2 = L8_2 - 44
  L7_2.y = L8_2
  L7_2.size = 18
  L8_2 = {}
  L9_2 = 1
  L10_2 = 1
  L11_2 = 1
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L7_2.color = L8_2
  L6_2 = L6_2(L7_2)
  L7_2 = L0_1
  L7_2 = L7_2.newText
  L8_2 = {}
  L9_2 = L0_1
  L9_2 = L9_2.localized
  L9_2 = L9_2.get
  L10_2 = "Validating receipt"
  L9_2 = L9_2(L10_2)
  L8_2.string = L9_2
  L9_2 = L5_2.x
  L8_2.x = L9_2
  L9_2 = L5_2.y
  L8_2.y = L9_2
  L8_2.size = 14
  L9_2 = {}
  L10_2 = 1
  L11_2 = 1
  L12_2 = 1
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L8_2.color = L9_2
  L7_2 = L7_2(L8_2)
  L8_2 = L0_1
  L8_2 = L8_2.newText
  L9_2 = {}
  L10_2 = L0_1
  L10_2 = L10_2.localized
  L10_2 = L10_2.get
  L11_2 = "Sending.."
  L10_2 = L10_2(L11_2)
  L9_2.string = L10_2
  L10_2 = L5_2.x
  L9_2.x = L10_2
  L10_2 = L5_2.y
  L10_2 = L10_2 + 20
  L9_2.y = L10_2
  L9_2.size = 14
  L10_2 = {}
  L11_2 = 1
  L12_2 = 1
  L13_2 = 1
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L9_2.color = L10_2
  L8_2 = L8_2(L9_2)
  L6_1 = L8_2
  L8_2 = L0_1
  L8_2 = L8_2.database
  L8_2 = L8_2.getReceipts
  L8_2 = L8_2()
  L9_2 = #L8_2
  L10_2 = 0
  L11_2 = nil
  L12_2 = nil
  
  function L13_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3.hideOverlay
    L0_3()
  end
  
  function L14_2()
    local L0_3, L1_3
    L0_3 = L4_1
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L4_1
      L0_3(L1_3)
      L0_3 = nil
      L4_1 = L0_3
    end
  end
  
  function L15_2()
    local L0_3, L1_3, L2_3
    L0_3 = L14_2
    L0_3()
    L0_3 = timer
    L0_3 = L0_3.performWithDelay
    L1_3 = L0_1
    L1_3 = L1_3.config
    L1_3 = L1_3.serverTimeout
    L2_3 = L13_2
    L0_3 = L0_3(L1_3, L2_3)
    L4_1 = L0_3
  end
  
  function L16_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L7_2
    L1_3 = L0_1
    L1_3 = L1_3.localized
    L1_3 = L1_3.get
    L2_3 = "Validating receipt"
    L1_3 = L1_3(L2_3)
    L2_3 = ": "
    L3_3 = L10_2
    L4_3 = "/"
    L5_3 = L9_2
    L1_3 = L1_3 .. L2_3 .. L3_3 .. L4_3 .. L5_3
    L0_3.text = L1_3
  end
  
  function L17_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L0_1
    L1_3 = L1_3.commHttps
    L1_3 = L1_3.validateReceipt
    L2_3 = A0_3.transactionData
    L3_3 = A0_3.storeType
    L1_3(L2_3, L3_3)
  end
  
  function L18_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L15_2
    L0_3()
    L0_3 = L10_2
    L0_3 = L0_3 + 1
    L10_2 = L0_3
    L0_3 = L10_2
    L1_3 = L9_2
    if L0_3 > L1_3 then
      L0_3 = L12_2
      L0_3.isVisible = true
    else
      L0_3 = L7_2
      L1_3 = L0_1
      L1_3 = L1_3.localized
      L1_3 = L1_3.get
      L2_3 = "Validating receipt"
      L1_3 = L1_3(L2_3)
      L2_3 = ": "
      L3_3 = L10_2
      L4_3 = "/"
      L5_3 = L9_2
      L1_3 = L1_3 .. L2_3 .. L3_3 .. L4_3 .. L5_3
      L0_3.text = L1_3
      L0_3 = L6_1
      L1_3 = L0_1
      L1_3 = L1_3.localized
      L1_3 = L1_3.get
      L2_3 = "Sending.."
      L1_3 = L1_3(L2_3)
      L0_3.text = L1_3
      L0_3 = L6_1
      L1_3 = L0_3
      L0_3 = L0_3.setTextColor
      L2_3 = 1
      L3_3 = 1
      L4_3 = 1
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = L8_2
      L1_3 = L10_2
      L0_3 = L0_3[L1_3]
      L11_2 = L0_3
      L0_3 = L17_2
      L1_3 = L11_2
      L0_3(L1_3)
    end
  end
  
  function L19_2()
    local L0_3, L1_3
    L0_3 = L5_1
    if L0_3 then
      L0_3 = timer
      L0_3 = L0_3.cancel
      L1_3 = L5_1
      L0_3(L1_3)
      L0_3 = nil
      L5_1 = L0_3
    end
  end
  
  function L20_2()
    local L0_3, L1_3, L2_3
    L0_3 = L14_2
    L0_3()
    L0_3 = L19_2
    L0_3()
    L0_3 = timer
    L0_3 = L0_3.performWithDelay
    L1_3 = L0_1
    L1_3 = L1_3.config
    L1_3 = L1_3.receiptCheckerTimeout
    L2_3 = L18_2
    L0_3 = L0_3(L1_3, L2_3)
    L5_1 = L0_3
  end
  
  function L21_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = false
    if A0_3 == 8 then
      L2_3 = true
    elseif A0_3 == 6 then
      L2_3 = true
    elseif A0_3 == 67 then
      L2_3 = true
    end
    if L2_3 and A1_3 then
      L3_3 = L0_1
      L3_3 = L3_3.database
      L3_3 = L3_3.removeReceipt
      L4_3 = A1_3
      L3_3(L4_3)
    end
  end
  
  function L22_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3
    L2_3 = L11_2
    if L2_3 then
      L2_3 = L11_2
      L2_3 = L2_3.transactionData
      if L2_3 and A0_3 then
        L2_3 = L11_2
        L2_3 = L2_3.transactionData
        L2_3 = L2_3.receipt
        if A0_3 == L2_3 then
          L2_3 = L0_1
          L2_3 = L2_3.database
          L2_3 = L2_3.removeReceipt
          L3_3 = A0_3
          L2_3(L3_3)
          if A1_3 and 0 < A1_3 then
            L2_3 = L6_1
            L3_3 = L0_1
            L3_3 = L3_3.localized
            L3_3 = L3_3.get
            L4_3 = "Success! You now have "
            L5_3 = A1_3
            L6_3 = " gems"
            L4_3 = L4_3 .. L5_3 .. L6_3
            L3_3 = L3_3(L4_3)
            L2_3.text = L3_3
          else
            L2_3 = L6_1
            L3_3 = L0_1
            L3_3 = L3_3.localized
            L3_3 = L3_3.get
            L4_3 = "Success! Verified receipt"
            L3_3 = L3_3(L4_3)
            L2_3.text = L3_3
          end
          L2_3 = L6_1
          L3_3 = L2_3
          L2_3 = L2_3.setTextColor
          L4_3 = 0
          L5_3 = 1
          L6_3 = 0
          L2_3(L3_3, L4_3, L5_3, L6_3)
        else
        end
      else
      end
    end
  end
  
  function L23_2()
    local L0_3, L1_3
    L0_3 = L10_2
    L1_3 = L9_2
    if L0_3 > L1_3 then
      L0_3 = L0_1
      L0_3 = L0_3.hideOverlay
      L0_3()
    end
    L0_3 = true
    return L0_3
  end
  
  L24_2 = L0_1
  L24_2 = L24_2.newButton
  L25_2 = {}
  L26_2 = L5_2.x
  L25_2.x = L26_2
  L26_2 = L5_2.y
  L26_2 = L26_2 + 50
  L25_2.y = L26_2
  L25_2.width = 126
  L25_2.height = 40
  L26_2 = L0_1
  L26_2 = L26_2.localized
  L26_2 = L26_2.get
  L27_2 = "OK"
  L26_2 = L26_2(L27_2)
  L25_2.text = L26_2
  L25_2.image = "images/gui/common/buttonTextB.png"
  L25_2.onRelease = L23_2
  L24_2 = L24_2(L25_2)
  L12_2 = L24_2
  L12_2.isVisible = false
  
  function L24_2(A0_3)
    local L1_3
    L1_3 = A0_3.phase
    if L1_3 == "ended" then
    end
    L1_3 = true
    return L1_3
  end
  
  function L25_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.addEventListener
    L2_3 = "touch"
    L3_3 = L24_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  function L26_2()
    local L0_3, L1_3, L2_3
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L4_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L5_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L6_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L7_2
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L6_1
    L0_3(L1_3, L2_3)
    L0_3 = L3_2
    L1_3 = L0_3
    L0_3 = L0_3.insert
    L2_3 = L12_2
    L0_3(L1_3, L2_3)
  end
  
  function L27_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = display
    L0_3 = L0_3.remove
    L1_3 = L12_2
    L0_3(L1_3)
    L0_3 = L0_1
    L0_3 = L0_3.commHttps
    L0_3 = L0_3.setCallback
    
    function L1_3()
      local L0_4, L1_4
    end
    
    L0_3(L1_3)
    L0_3 = L4_2
    L1_3 = L0_3
    L0_3 = L0_3.removeEventListener
    L2_3 = "touch"
    L3_3 = L24_2
    L0_3(L1_3, L2_3, L3_3)
  end
  
  L2_1 = L27_2
  
  function L27_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = A0_3.m
    L2_3 = L2_2
    L2_3 = L2_3.buyCrystalIOS
    L2_3 = L2_3()
    if L1_3 ~= L2_3 then
      L1_3 = A0_3.m
      L2_3 = L2_2
      L2_3 = L2_3.buyCrystalGoogle
      L2_3 = L2_3()
      if L1_3 ~= L2_3 then
        L1_3 = A0_3.m
        L2_3 = L2_2
        L2_3 = L2_3.buyCrystalAmazon
        L2_3 = L2_3()
        if L1_3 ~= L2_3 then
          goto lbl_47
        end
      end
    end
    L1_3 = A0_3.e
    L2_3 = A0_3.r
    if L2_3 then
      L2_3 = L21_2
      L3_3 = A0_3.r
      L4_3 = L1_3
      L2_3(L3_3, L4_3)
      L2_3 = L6_1
      L3_3 = L0_1
      L3_3 = L3_3.localized
      L3_3 = L3_3.get
      L4_3 = "Error! Could not Verify Receipt"
      L3_3 = L3_3(L4_3)
      L2_3.text = L3_3
      L2_3 = L6_1
      L3_3 = L2_3
      L2_3 = L2_3.setTextColor
      L4_3 = 1
      L5_3 = 0
      L6_3 = 0
      L2_3(L3_3, L4_3, L5_3, L6_3)
    else
      L2_3 = L22_2
      L3_3 = L1_3
      L4_3 = A0_3.c
      L2_3(L3_3, L4_3)
    end
    L2_3 = L20_2
    L2_3()
    ::lbl_47::
  end
  
  L28_2 = L26_2
  L28_2()
  L28_2 = L25_2
  L28_2()
  L28_2 = L0_1
  L28_2 = L28_2.commHttps
  L28_2 = L28_2.setCallback
  L29_2 = L27_2
  L28_2(L29_2)
  L28_2 = L16_2
  L28_2()
  L28_2 = L18_2
  L28_2()
end

L1_1.create = L7_1

function L7_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2.phase
  if L2_2 == "will" then
    return
  end
  
  function L3_2()
    local L0_3, L1_3
  end
  
  L3_1 = L3_2
end

L1_1.show = L7_1

function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2.view
  L3_2 = A1_2.phase
  if L3_2 == "will" then
    L4_2 = L3_1
    if L4_2 then
      L4_2 = L3_1
      L4_2()
    end
    L4_2 = L4_1
    if L4_2 then
      L4_2 = timer
      L4_2 = L4_2.cancel
      L5_2 = L4_1
      L4_2(L5_2)
      L4_2 = nil
      L4_1 = L4_2
    end
    L4_2 = L5_1
    if L4_2 then
      L4_2 = timer
      L4_2 = L4_2.cancel
      L5_2 = L5_1
      L4_2(L5_2)
      L4_2 = nil
      L5_1 = L4_2
    end
  elseif L3_2 == "did" then
  end
end

L1_1.hide = L7_1

function L7_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A0_2.view
  L3_2 = L2_1
  L3_2()
end

L1_1.destroy = L7_1
L8_1 = L1_1
L7_1 = L1_1.addEventListener
L9_1 = "create"
L10_1 = L1_1
L7_1(L8_1, L9_1, L10_1)
L8_1 = L1_1
L7_1 = L1_1.addEventListener
L9_1 = "show"
L10_1 = L1_1
L7_1(L8_1, L9_1, L10_1)
L8_1 = L1_1
L7_1 = L1_1.addEventListener
L9_1 = "hide"
L10_1 = L1_1
L7_1(L8_1, L9_1, L10_1)
L8_1 = L1_1
L7_1 = L1_1.addEventListener
L9_1 = "destroy"
L10_1 = L1_1
L7_1(L8_1, L9_1, L10_1)
return L1_1
