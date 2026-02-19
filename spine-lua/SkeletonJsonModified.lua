local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = require
L1_1 = "spine-lua.SkeletonData"
L0_1 = L0_1(L1_1)
L1_1 = require
L2_1 = "spine-lua.BoneData"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "spine-lua.SlotData"
L2_1 = L2_1(L3_1)
L3_1 = require
L4_1 = "spine-lua.Skin"
L3_1 = L3_1(L4_1)
L4_1 = require
L5_1 = "spine-lua.AttachmentLoader"
L4_1 = L4_1(L5_1)
L5_1 = require
L6_1 = "spine-lua.Animation"
L5_1 = L5_1(L6_1)
L6_1 = require
L7_1 = "spine-lua.EventData"
L6_1 = L6_1(L7_1)
L7_1 = require
L8_1 = "spine-lua.Event"
L7_1 = L7_1(L8_1)
L8_1 = require
L9_1 = "spine-lua.AttachmentType"
L8_1 = L8_1(L9_1)
L9_1 = {}

function L10_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if not A0_2 then
    L1_2 = L4_1
    L1_2 = L1_2.new
    L1_2 = L1_2()
    A0_2 = L1_2
  end
  L1_2 = {}
  L1_2.attachmentLoader = A0_2
  L1_2.scale = 1
  
  function L2_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3
    L4_3 = A0_3
    L3_3 = A0_3.readSkeletonData
    L5_3 = spine
    L5_3 = L5_3.utils
    L5_3 = L5_3.readFile
    L6_3 = A1_3
    L7_3 = A2_3
    L5_3, L6_3, L7_3 = L5_3(L6_3, L7_3)
    return L3_3(L4_3, L5_3, L6_3, L7_3)
  end
  
  L1_2.readSkeletonDataFile = L2_2
  L2_2 = nil
  L3_2 = nil
  L4_2 = nil
  L5_2 = nil
  
  function L6_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3
    L2_3 = L0_1
    L2_3 = L2_3.new
    L3_3 = A0_3.attachmentLoader
    L2_3 = L2_3(L3_3)
    L3_3 = spine
    L3_3 = L3_3.utils
    L3_3 = L3_3.readJSON
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    if not L3_3 then
      L4_3 = error
      L5_3 = "Invalid JSON: "
      L6_3 = A1_3
      L5_3 = L5_3 .. L6_3
      L6_3 = 2
      L4_3(L5_3, L6_3)
    end
    L4_3 = ipairs
    L5_3 = L3_3.b
    L4_3, L5_3, L6_3 = L4_3(L5_3)
    for L7_3, L8_3 in L4_3, L5_3, L6_3 do
      L9_3 = L8_3.n
      L10_3 = nil
      L11_3 = L8_3.parent
      if L11_3 then
        L13_3 = L2_3
        L12_3 = L2_3.findBone
        L14_3 = L11_3
        L12_3 = L12_3(L13_3, L14_3)
        L10_3 = L12_3
        if not L10_3 then
          L12_3 = error
          L13_3 = "Parent bone not found: "
          L14_3 = L11_3
          L13_3 = L13_3 .. L14_3
          L12_3(L13_3)
        end
      end
      L12_3 = L1_1
      L12_3 = L12_3.new
      L13_3 = L9_3
      L14_3 = L10_3
      L12_3 = L12_3(L13_3, L14_3)
      L13_3 = L8_3.length
      if not L13_3 then
        L13_3 = 0
      end
      L14_3 = A0_3.scale
      L13_3 = L13_3 * L14_3
      L12_3.length = L13_3
      L13_3 = L8_3.x
      if not L13_3 then
        L13_3 = 0
      end
      L14_3 = A0_3.scale
      L13_3 = L13_3 * L14_3
      L12_3.x = L13_3
      L13_3 = L8_3.y
      if not L13_3 then
        L13_3 = 0
      end
      L14_3 = A0_3.scale
      L13_3 = L13_3 * L14_3
      L12_3.y = L13_3
      L13_3 = L8_3.r
      if not L13_3 then
        L13_3 = 0
      end
      L12_3.rotation = L13_3
      L13_3 = L8_3.sx
      if L13_3 ~= nil then
        L13_3 = L8_3.sx
        L12_3.scaleX = L13_3
      else
        L12_3.scaleX = 1
      end
      L13_3 = L8_3.sy
      if L13_3 ~= nil then
        L13_3 = L8_3.sy
        L12_3.scaleY = L13_3
      else
        L12_3.scaleY = 1
      end
      L13_3 = L8_3.inheritScale
      if L13_3 == false then
        L12_3.inheritScale = false
      else
        L12_3.inheritScale = true
      end
      L13_3 = L8_3.inheritRotation
      if L13_3 == false then
        L12_3.inheritRotation = false
      else
        L12_3.inheritRotation = true
      end
      L13_3 = table
      L13_3 = L13_3.insert
      L14_3 = L2_3.bones
      L15_3 = L12_3
      L13_3(L14_3, L15_3)
    end
    L4_3 = L3_3.s
    if L4_3 then
      L4_3 = ipairs
      L5_3 = L3_3.s
      L4_3, L5_3, L6_3 = L4_3(L5_3)
      for L7_3, L8_3 in L4_3, L5_3, L6_3 do
        L9_3 = L8_3.n
        L10_3 = L8_3.bone
        L12_3 = L2_3
        L11_3 = L2_3.findBone
        L13_3 = L10_3
        L11_3 = L11_3(L12_3, L13_3)
        if not L11_3 then
          L12_3 = error
          L13_3 = "Slot bone not found: "
          L14_3 = L10_3
          L13_3 = L13_3 .. L14_3
          L12_3(L13_3)
        end
        L12_3 = L2_1
        L12_3 = L12_3.new
        L13_3 = L9_3
        L14_3 = L11_3
        L12_3 = L12_3(L13_3, L14_3)
        L13_3 = L8_3.color
        if L13_3 then
          L15_3 = L12_3
          L14_3 = L12_3.setColor
          L16_3 = tonumber
          L18_3 = L13_3
          L17_3 = L13_3.sub
          L19_3 = 1
          L20_3 = 2
          L17_3 = L17_3(L18_3, L19_3, L20_3)
          L18_3 = 16
          L16_3 = L16_3(L17_3, L18_3)
          L16_3 = L16_3 / 255
          L17_3 = tonumber
          L19_3 = L13_3
          L18_3 = L13_3.sub
          L20_3 = 3
          L21_3 = 4
          L18_3 = L18_3(L19_3, L20_3, L21_3)
          L19_3 = 16
          L17_3 = L17_3(L18_3, L19_3)
          L17_3 = L17_3 / 255
          L18_3 = tonumber
          L20_3 = L13_3
          L19_3 = L13_3.sub
          L21_3 = 5
          L22_3 = 6
          L19_3 = L19_3(L20_3, L21_3, L22_3)
          L20_3 = 16
          L18_3 = L18_3(L19_3, L20_3)
          L18_3 = L18_3 / 255
          L19_3 = tonumber
          L21_3 = L13_3
          L20_3 = L13_3.sub
          L22_3 = 7
          L23_3 = 8
          L20_3 = L20_3(L21_3, L22_3, L23_3)
          L21_3 = 16
          L19_3 = L19_3(L20_3, L21_3)
          L19_3 = L19_3 / 255
          L14_3(L15_3, L16_3, L17_3, L18_3, L19_3)
        end
        L14_3 = L8_3.attachment
        L12_3.attachmentName = L14_3
        L14_3 = L8_3.additive
        L12_3.additiveBlending = L14_3
        L14_3 = table
        L14_3 = L14_3.insert
        L15_3 = L2_3.slots
        L16_3 = L12_3
        L14_3(L15_3, L16_3)
        L14_3 = L2_3.slotNameIndices
        L15_3 = L12_3.name
        L16_3 = L2_3.slots
        L16_3 = #L16_3
        L14_3[L15_3] = L16_3
      end
    end
    L4_3 = L3_3.skins
    if L4_3 then
      L4_3 = pairs
      L5_3 = L3_3.skins
      L4_3, L5_3, L6_3 = L4_3(L5_3)
      for L7_3, L8_3 in L4_3, L5_3, L6_3 do
        L9_3 = L3_1
        L9_3 = L9_3.new
        L10_3 = L7_3
        L9_3 = L9_3(L10_3)
        L10_3 = pairs
        L11_3 = L8_3
        L10_3, L11_3, L12_3 = L10_3(L11_3)
        for L13_3, L14_3 in L10_3, L11_3, L12_3 do
          L15_3 = L3_3.slotDefinitions
          L15_3 = L15_3[L13_3]
          L16_3 = L14_3
          L17_3 = ""
          L16_3 = L16_3 .. L17_3
          L15_3 = L15_3[L16_3]
          L16_3 = L2_3.slotNameIndices
          L16_3 = L16_3[L13_3]
          if L13_3 == "foot_r" then
            L17_3 = L3_3.rightFootDefinitions
            if L17_3 then
              L17_3 = {}
              L18_3 = pairs
              L19_3 = L15_3
              L18_3, L19_3, L20_3 = L18_3(L19_3)
              for L21_3, L22_3 in L18_3, L19_3, L20_3 do
                L23_3 = L3_3.rightFootDefinitions
                L23_3 = L23_3[L21_3]
                L24_3 = L22_3
                L25_3 = ""
                L24_3 = L24_3 .. L25_3
                L23_3 = L23_3[L24_3]
                L17_3[L21_3] = L23_3
              end
              L15_3 = L17_3
          end
          elseif L13_3 == "foot_l" then
            L17_3 = L3_3.leftFootDefinitions
            if L17_3 then
              L17_3 = {}
              L18_3 = pairs
              L19_3 = L15_3
              L18_3, L19_3, L20_3 = L18_3(L19_3)
              for L21_3, L22_3 in L18_3, L19_3, L20_3 do
                L23_3 = L3_3.leftFootDefinitions
                L23_3 = L23_3[L21_3]
                L24_3 = L22_3
                L25_3 = ""
                L24_3 = L24_3 .. L25_3
                L23_3 = L23_3[L24_3]
                L17_3[L21_3] = L23_3
              end
              L15_3 = L17_3
            end
          end
          L17_3 = pairs
          L18_3 = L15_3
          L17_3, L18_3, L19_3 = L17_3(L18_3)
          for L20_3, L21_3 in L17_3, L18_3, L19_3 do
            L22_3 = L2_2
            L23_3 = L20_3
            L24_3 = L21_3
            L22_3 = L22_3(L23_3, L24_3)
            if L22_3 then
              L24_3 = L9_3
              L23_3 = L9_3.addAttachment
              L25_3 = L16_3
              L26_3 = L20_3
              L27_3 = L22_3
              L23_3(L24_3, L25_3, L26_3, L27_3)
            end
          end
        end
        L10_3 = L9_3.name
        if L10_3 == "default" then
          L2_3.defaultSkin = L9_3
        else
          L10_3 = table
          L10_3 = L10_3.insert
          L11_3 = L2_3.skins
          L12_3 = L9_3
          L10_3(L11_3, L12_3)
        end
      end
    end
    L4_3 = L3_3.events
    if L4_3 then
      L4_3 = pairs
      L5_3 = L3_3.events
      L4_3, L5_3, L6_3 = L4_3(L5_3)
      for L7_3, L8_3 in L4_3, L5_3, L6_3 do
        L9_3 = L6_1
        L9_3 = L9_3.new
        L10_3 = L7_3
        L9_3 = L9_3(L10_3)
        L10_3 = L8_3.int
        if not L10_3 then
          L10_3 = 0
        end
        L9_3.intValue = L10_3
        L10_3 = L8_3.float
        if not L10_3 then
          L10_3 = 0
        end
        L9_3.floatValue = L10_3
        L10_3 = L8_3.string
        L9_3.stringValue = L10_3
        L10_3 = table
        L10_3 = L10_3.insert
        L11_3 = L2_3.events
        L12_3 = L9_3
        L10_3(L11_3, L12_3)
      end
    end
    L4_3 = L3_3.animations
    if L4_3 then
      L4_3 = pairs
      L5_3 = L3_3.animations
      L4_3, L5_3, L6_3 = L4_3(L5_3)
      for L7_3, L8_3 in L4_3, L5_3, L6_3 do
        L9_3 = L3_2
        L10_3 = L7_3
        L11_3 = L8_3
        L12_3 = L2_3
        L9_3(L10_3, L11_3, L12_3)
      end
    end
    return L2_3
  end
  
  L1_2.readSkeletonData = L6_2
  
  function L2_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3
    L2_3 = A1_3.n
    A0_3 = L2_3 or A0_3
    if not L2_3 then
    end
    L2_3 = L8_1
    L3_3 = A1_3.type
    if not L3_3 then
      L3_3 = "region"
    end
    L2_3 = L2_3[L3_3]
    L3_3 = A1_3.path
    if not L3_3 then
      L3_3 = A0_3
    end
    L4_3 = L1_2
    L4_3 = L4_3.scale
    L5_3 = L8_1
    L5_3 = L5_3.region
    if L2_3 == L5_3 then
      L5_3 = A0_2
      L6_3 = L5_3
      L5_3 = L5_3.newRegionAttachment
      L7_3 = L2_3
      L8_3 = A0_3
      L9_3 = L3_3
      L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3)
      if not L5_3 then
        L6_3 = nil
        return L6_3
      end
      L6_3 = A1_3.x
      if not L6_3 then
        L6_3 = 0
      end
      L6_3 = L6_3 * L4_3
      L5_3.x = L6_3
      L6_3 = A1_3.y
      if not L6_3 then
        L6_3 = 0
      end
      L6_3 = L6_3 * L4_3
      L5_3.y = L6_3
      L6_3 = A1_3.sx
      if L6_3 ~= nil then
        L6_3 = A1_3.sx
        L5_3.scaleX = L6_3
      else
        L5_3.scaleX = 1
      end
      L6_3 = A1_3.sy
      if L6_3 ~= nil then
        L6_3 = A1_3.sy
        L5_3.scaleY = L6_3
      else
        L5_3.scaleY = 1
      end
      L6_3 = A1_3.r
      if not L6_3 then
        L6_3 = 0
      end
      L5_3.rotation = L6_3
      L6_3 = A1_3.w
      L6_3 = L6_3 * L4_3
      L5_3.width = L6_3
      L6_3 = A1_3.h
      L6_3 = L6_3 * L4_3
      L5_3.height = L6_3
      L6_3 = A1_3.color
      if L6_3 then
        L7_3 = tonumber
        L9_3 = L6_3
        L8_3 = L6_3.sub
        L10_3 = 1
        L11_3 = 2
        L8_3 = L8_3(L9_3, L10_3, L11_3)
        L9_3 = 16
        L7_3 = L7_3(L8_3, L9_3)
        L7_3 = L7_3 / 255
        L5_3.r = L7_3
        L7_3 = tonumber
        L9_3 = L6_3
        L8_3 = L6_3.sub
        L10_3 = 3
        L11_3 = 4
        L8_3 = L8_3(L9_3, L10_3, L11_3)
        L9_3 = 16
        L7_3 = L7_3(L8_3, L9_3)
        L7_3 = L7_3 / 255
        L5_3.g = L7_3
        L7_3 = tonumber
        L9_3 = L6_3
        L8_3 = L6_3.sub
        L10_3 = 5
        L11_3 = 6
        L8_3 = L8_3(L9_3, L10_3, L11_3)
        L9_3 = 16
        L7_3 = L7_3(L8_3, L9_3)
        L7_3 = L7_3 / 255
        L5_3.b = L7_3
        L7_3 = tonumber
        L9_3 = L6_3
        L8_3 = L6_3.sub
        L10_3 = 7
        L11_3 = 8
        L8_3 = L8_3(L9_3, L10_3, L11_3)
        L9_3 = 16
        L7_3 = L7_3(L8_3, L9_3)
        L7_3 = L7_3 / 255
        L5_3.a = L7_3
      end
      L8_3 = L5_3
      L7_3 = L5_3.updateOffset
      L7_3(L8_3)
      return L5_3
    else
      L5_3 = L8_1
      L5_3 = L5_3.mesh
      if L2_3 == L5_3 then
        L5_3 = A0_2
        L6_3 = L5_3
        L5_3 = L5_3.newMeshAttachment
        L7_3 = skin
        L8_3 = A0_3
        L9_3 = L3_3
        L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3)
        if not L5_3 then
          L6_3 = null
          return L6_3
        end
        L5_3.path = L3_3
        L6_3 = L5_2
        L7_3 = A1_3
        L8_3 = "vertices"
        L9_3 = L4_3
        L6_3 = L6_3(L7_3, L8_3, L9_3)
        L5_3.vertices = L6_3
        L6_3 = L5_2
        L7_3 = A1_3
        L8_3 = "triangles"
        L9_3 = 1
        L6_3 = L6_3(L7_3, L8_3, L9_3)
        L5_3.triangles = L6_3
        L6_3 = L5_2
        L7_3 = A1_3
        L8_3 = "uvs"
        L9_3 = 1
        L6_3 = L6_3(L7_3, L8_3, L9_3)
        L5_3.regionUVs = L6_3
        L7_3 = L5_3
        L6_3 = L5_3.updateUVs
        L6_3(L7_3)
        L6_3 = A1_3.color
        if L6_3 then
          L7_3 = tonumber
          L9_3 = L6_3
          L8_3 = L6_3.sub
          L10_3 = 1
          L11_3 = 2
          L8_3 = L8_3(L9_3, L10_3, L11_3)
          L9_3 = 16
          L7_3 = L7_3(L8_3, L9_3)
          L7_3 = L7_3 / 255
          L5_3.r = L7_3
          L7_3 = tonumber
          L9_3 = L6_3
          L8_3 = L6_3.sub
          L10_3 = 3
          L11_3 = 4
          L8_3 = L8_3(L9_3, L10_3, L11_3)
          L9_3 = 16
          L7_3 = L7_3(L8_3, L9_3)
          L7_3 = L7_3 / 255
          L5_3.g = L7_3
          L7_3 = tonumber
          L9_3 = L6_3
          L8_3 = L6_3.sub
          L10_3 = 5
          L11_3 = 6
          L8_3 = L8_3(L9_3, L10_3, L11_3)
          L9_3 = 16
          L7_3 = L7_3(L8_3, L9_3)
          L7_3 = L7_3 / 255
          L5_3.b = L7_3
          L7_3 = tonumber
          L9_3 = L6_3
          L8_3 = L6_3.sub
          L10_3 = 7
          L11_3 = 8
          L8_3 = L8_3(L9_3, L10_3, L11_3)
          L9_3 = 16
          L7_3 = L7_3(L8_3, L9_3)
          L7_3 = L7_3 / 255
          L5_3.a = L7_3
        end
        L7_3 = A1_3.hull
        if not L7_3 then
          L7_3 = 0
        end
        L7_3 = L7_3 * 2
        L5_3.hullLength = L7_3
        L7_3 = A1_3.edges
        if L7_3 then
          L7_3 = L5_2
          L8_3 = A1_3
          L9_3 = "edges"
          L10_3 = 1
          L7_3 = L7_3(L8_3, L9_3, L10_3)
          L5_3.edges = L7_3
        end
        L7_3 = A1_3.w
        if not L7_3 then
          L7_3 = 0
        end
        L7_3 = L7_3 * L4_3
        L5_3.width = L7_3
        L7_3 = A1_3.h
        if not L7_3 then
          L7_3 = 0
        end
        L7_3 = L7_3 * L4_3
        L5_3.height = L7_3
        return L5_3
      else
        L5_3 = L8_1
        L5_3 = L5_3.skinnedmesh
        if L2_3 == L5_3 then
          L5_3 = L1_2
          L5_3 = L5_3.attachmentLoader
          L5_3 = L5_3.newSkinnedMeshAttachment
          L6_3 = skin
          L7_3 = A0_3
          L8_3 = L3_3
          L5_3 = L5_3(L6_3, L7_3, L8_3)
          if not L5_3 then
            L6_3 = null
            return L6_3
          end
          L5_3.path = L3_3
          L6_3 = L5_2
          L7_3 = A1_3
          L8_3 = "uvs"
          L9_3 = 1
          L6_3 = L6_3(L7_3, L8_3, L9_3)
          L7_3 = L5_2
          L8_3 = A1_3
          L9_3 = "vertices"
          L10_3 = 1
          L7_3 = L7_3(L8_3, L9_3, L10_3)
          vertices = L7_3
          L7_3 = {}
          L8_3 = {}
          L9_3 = 1
          L10_3 = vertices
          L11_3 = 1
          for L12_3 = L9_3, L10_3, L11_3 do
            L13_3 = vertices
            L13_3 = L13_3[L12_3]
            L12_3 = L12_3 + 1
            L14_3 = table
            L14_3 = L14_3.insert
            L15_3 = L8_3
            L16_3 = L13_3
            L14_3(L15_3, L16_3)
            L14_3 = 1
            L15_3 = L13_3 * 4
            L15_3 = L12_3 + L15_3
            L16_3 = 1
            for L17_3 = L14_3, L15_3, L16_3 do
              L18_3 = table
              L18_3 = L18_3.insert
              L19_3 = L8_3
              L20_3 = vertices
              L20_3 = L20_3[L12_3]
              L18_3(L19_3, L20_3)
              L18_3 = table
              L18_3 = L18_3.insert
              L19_3 = L7_3
              L20_3 = vertices
              L21_3 = L12_3 + 1
              L20_3 = L20_3[L21_3]
              L20_3 = L20_3 * L4_3
              L18_3(L19_3, L20_3)
              L18_3 = table
              L18_3 = L18_3.insert
              L19_3 = L7_3
              L20_3 = vertices
              L21_3 = L12_3 + 2
              L20_3 = L20_3[L21_3]
              L20_3 = L20_3 * L4_3
              L18_3(L19_3, L20_3)
              L18_3 = table
              L18_3 = L18_3.insert
              L19_3 = L7_3
              L20_3 = vertices
              L21_3 = L12_3 + 3
              L20_3 = L20_3[L21_3]
              L18_3(L19_3, L20_3)
              L12_3 = L12_3 + 4
            end
          end
          L5_3.bones = L8_3
          L5_3.weights = L7_3
          L9_3 = L5_2
          L10_3 = A1_3
          L11_3 = "triangles"
          L12_3 = 1
          L9_3 = L9_3(L10_3, L11_3, L12_3)
          L5_3.triangles = L9_3
          L5_3.regionUVs = L6_3
          L10_3 = L5_3
          L9_3 = L5_3.updateUVs
          L9_3(L10_3)
          L9_3 = A1_3.color
          if L9_3 then
            L10_3 = tonumber
            L12_3 = L9_3
            L11_3 = L9_3.sub
            L13_3 = 1
            L14_3 = 2
            L11_3 = L11_3(L12_3, L13_3, L14_3)
            L12_3 = 16
            L10_3 = L10_3(L11_3, L12_3)
            L10_3 = L10_3 / 255
            L5_3.r = L10_3
            L10_3 = tonumber
            L12_3 = L9_3
            L11_3 = L9_3.sub
            L13_3 = 3
            L14_3 = 4
            L11_3 = L11_3(L12_3, L13_3, L14_3)
            L12_3 = 16
            L10_3 = L10_3(L11_3, L12_3)
            L10_3 = L10_3 / 255
            L5_3.g = L10_3
            L10_3 = tonumber
            L12_3 = L9_3
            L11_3 = L9_3.sub
            L13_3 = 5
            L14_3 = 6
            L11_3 = L11_3(L12_3, L13_3, L14_3)
            L12_3 = 16
            L10_3 = L10_3(L11_3, L12_3)
            L10_3 = L10_3 / 255
            L5_3.b = L10_3
            L10_3 = tonumber
            L12_3 = L9_3
            L11_3 = L9_3.sub
            L13_3 = 7
            L14_3 = 8
            L11_3 = L11_3(L12_3, L13_3, L14_3)
            L12_3 = 16
            L10_3 = L10_3(L11_3, L12_3)
            L10_3 = L10_3 / 255
            L5_3.a = L10_3
          end
          L10_3 = A1_3.hull
          if not L10_3 then
            L10_3 = 0
          end
          L10_3 = L10_3 * 2
          L5_3.hullLength = L10_3
          L10_3 = A1_3.edges
          if L10_3 then
            L10_3 = L5_2
            L11_3 = A1_3
            L12_3 = "edges"
            L13_3 = 1
            L10_3 = L10_3(L11_3, L12_3, L13_3)
            L5_3.edges = L10_3
          end
          L10_3 = A1_3.w
          if not L10_3 then
            L10_3 = 0
          end
          L10_3 = L10_3 * L4_3
          L5_3.width = L10_3
          L10_3 = A1_3.h
          if not L10_3 then
            L10_3 = 0
          end
          L10_3 = L10_3 * L4_3
          L5_3.height = L10_3
          return L5_3
        else
          L5_3 = L8_1
          L5_3 = L5_3.boundingbox
          if L2_3 == L5_3 then
            L5_3 = A0_2
            L6_3 = L5_3
            L5_3 = L5_3.newBoundingBoxAttachment
            L7_3 = L2_3
            L8_3 = A0_3
            L5_3 = L5_3(L6_3, L7_3, L8_3)
            if not L5_3 then
              L6_3 = nil
              return L6_3
            end
            L6_3 = A1_3.vertices
            L7_3 = ipairs
            L8_3 = L6_3
            L7_3, L8_3, L9_3 = L7_3(L8_3)
            for L10_3, L11_3 in L7_3, L8_3, L9_3 do
              L12_3 = table
              L12_3 = L12_3.insert
              L13_3 = L5_3.vertices
              L14_3 = L6_3[L10_3]
              L14_3 = L14_3 * L4_3
              L12_3(L13_3, L14_3)
            end
            return L5_3
          end
        end
      end
    end
    L5_3 = error
    L6_3 = "Unknown attachment type: "
    L7_3 = L2_3
    L8_3 = " ("
    L9_3 = A0_3
    L10_3 = ")"
    L6_3 = L6_3 .. L7_3 .. L8_3 .. L9_3 .. L10_3
    L5_3(L6_3)
  end
  
  function L3_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3
    L3_3 = {}
    L4_3 = 0
    L5_3 = A1_3.s
    if L5_3 then
      L6_3 = pairs
      L7_3 = L5_3
      L6_3, L7_3, L8_3 = L6_3(L7_3)
      for L9_3, L10_3 in L6_3, L7_3, L8_3 do
        L11_3 = A2_3.slotNameIndices
        L11_3 = L11_3[L9_3]
        L12_3 = pairs
        L13_3 = L10_3
        L12_3, L13_3, L14_3 = L12_3(L13_3)
        for L15_3, L16_3 in L12_3, L13_3, L14_3 do
          if L15_3 == "color" then
            L17_3 = L5_1
            L17_3 = L17_3.ColorTimeline
            L17_3 = L17_3.new
            L17_3 = L17_3()
            L17_3.slotIndex = L11_3
            L18_3 = 0
            L19_3 = ipairs
            L20_3 = L16_3
            L19_3, L20_3, L21_3 = L19_3(L20_3)
            for L22_3, L23_3 in L19_3, L20_3, L21_3 do
              L24_3 = L23_3.color
              L26_3 = L17_3
              L25_3 = L17_3.setFrame
              L27_3 = L18_3
              L28_3 = L23_3.time
              L29_3 = tonumber
              L31_3 = L24_3
              L30_3 = L24_3.sub
              L32_3 = 1
              L33_3 = 2
              L30_3 = L30_3(L31_3, L32_3, L33_3)
              L31_3 = 16
              L29_3 = L29_3(L30_3, L31_3)
              L29_3 = L29_3 / 255
              L30_3 = tonumber
              L32_3 = L24_3
              L31_3 = L24_3.sub
              L33_3 = 3
              L34_3 = 4
              L31_3 = L31_3(L32_3, L33_3, L34_3)
              L32_3 = 16
              L30_3 = L30_3(L31_3, L32_3)
              L30_3 = L30_3 / 255
              L31_3 = tonumber
              L33_3 = L24_3
              L32_3 = L24_3.sub
              L34_3 = 5
              L35_3 = 6
              L32_3 = L32_3(L33_3, L34_3, L35_3)
              L33_3 = 16
              L31_3 = L31_3(L32_3, L33_3)
              L31_3 = L31_3 / 255
              L32_3 = tonumber
              L34_3 = L24_3
              L33_3 = L24_3.sub
              L35_3 = 7
              L36_3 = 8
              L33_3 = L33_3(L34_3, L35_3, L36_3)
              L34_3 = 16
              L32_3 = L32_3(L33_3, L34_3)
              L32_3 = L32_3 / 255
              L25_3(L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3)
              L25_3 = L4_2
              L26_3 = L17_3
              L27_3 = L18_3
              L28_3 = L23_3
              L25_3(L26_3, L27_3, L28_3)
              L18_3 = L18_3 + 1
            end
            L19_3 = table
            L19_3 = L19_3.insert
            L20_3 = L3_3
            L21_3 = L17_3
            L19_3(L20_3, L21_3)
            L19_3 = math
            L19_3 = L19_3.max
            L20_3 = L4_3
            L22_3 = L17_3
            L21_3 = L17_3.getDuration
            L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3 = L21_3(L22_3)
            L19_3 = L19_3(L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3)
            L4_3 = L19_3
          elseif L15_3 == "attachment" then
            L17_3 = L5_1
            L17_3 = L17_3.AttachmentTimeline
            L17_3 = L17_3.new
            L17_3 = L17_3()
            L17_3.slotName = L9_3
            L18_3 = 0
            L19_3 = ipairs
            L20_3 = L16_3
            L19_3, L20_3, L21_3 = L19_3(L20_3)
            for L22_3, L23_3 in L19_3, L20_3, L21_3 do
              L24_3 = L23_3.n
              if not L24_3 then
                L24_3 = nil
              end
              L26_3 = L17_3
              L25_3 = L17_3.setFrame
              L27_3 = L18_3
              L28_3 = L23_3.time
              L29_3 = L24_3
              L25_3(L26_3, L27_3, L28_3, L29_3)
              L18_3 = L18_3 + 1
            end
            L19_3 = table
            L19_3 = L19_3.insert
            L20_3 = L3_3
            L21_3 = L17_3
            L19_3(L20_3, L21_3)
            L19_3 = math
            L19_3 = L19_3.max
            L20_3 = L4_3
            L22_3 = L17_3
            L21_3 = L17_3.getDuration
            L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3 = L21_3(L22_3)
            L19_3 = L19_3(L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3)
            L4_3 = L19_3
          else
            L17_3 = error
            L18_3 = "Invalid frame type for a slot: "
            L19_3 = L15_3
            L20_3 = " ("
            L21_3 = L9_3
            L22_3 = ")"
            L18_3 = L18_3 .. L19_3 .. L20_3 .. L21_3 .. L22_3
            L17_3(L18_3)
          end
        end
      end
    end
    L6_3 = A1_3.b
    if L6_3 then
      L7_3 = pairs
      L8_3 = L6_3
      L7_3, L8_3, L9_3 = L7_3(L8_3)
      for L10_3, L11_3 in L7_3, L8_3, L9_3 do
        L13_3 = A2_3
        L12_3 = A2_3.findBoneIndex
        L14_3 = L10_3
        L12_3 = L12_3(L13_3, L14_3)
        if L12_3 == -1 then
          L13_3 = error
          L14_3 = "Bone not found: "
          L15_3 = L10_3
          L14_3 = L14_3 .. L15_3
          L13_3(L14_3)
        end
        L13_3 = pairs
        L14_3 = L11_3
        L13_3, L14_3, L15_3 = L13_3(L14_3)
        for L16_3, L17_3 in L13_3, L14_3, L15_3 do
          if L16_3 == "rotate" then
            L18_3 = L5_1
            L18_3 = L18_3.RotateTimeline
            L18_3 = L18_3.new
            L18_3 = L18_3()
            L18_3.boneIndex = L12_3
            L19_3 = 0
            L20_3 = ipairs
            L21_3 = L17_3
            L20_3, L21_3, L22_3 = L20_3(L21_3)
            for L23_3, L24_3 in L20_3, L21_3, L22_3 do
              L26_3 = L18_3
              L25_3 = L18_3.setFrame
              L27_3 = L19_3
              L28_3 = L24_3.time
              L29_3 = L24_3.angle
              L25_3(L26_3, L27_3, L28_3, L29_3)
              L25_3 = L4_2
              L26_3 = L18_3
              L27_3 = L19_3
              L28_3 = L24_3
              L25_3(L26_3, L27_3, L28_3)
              L19_3 = L19_3 + 1
            end
            L20_3 = table
            L20_3 = L20_3.insert
            L21_3 = L3_3
            L22_3 = L18_3
            L20_3(L21_3, L22_3)
            L20_3 = math
            L20_3 = L20_3.max
            L21_3 = L4_3
            L23_3 = L18_3
            L22_3 = L18_3.getDuration
            L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3 = L22_3(L23_3)
            L20_3 = L20_3(L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3)
            L4_3 = L20_3
          elseif L16_3 == "translate" or L16_3 == "scale" then
            L18_3 = nil
            L19_3 = 1
            if L16_3 == "scale" then
              L20_3 = L5_1
              L20_3 = L20_3.ScaleTimeline
              L20_3 = L20_3.new
              L20_3 = L20_3()
              L18_3 = L20_3
            else
              L20_3 = L5_1
              L20_3 = L20_3.TranslateTimeline
              L20_3 = L20_3.new
              L20_3 = L20_3()
              L18_3 = L20_3
              L20_3 = L1_2
              L19_3 = L20_3.scale
            end
            L18_3.boneIndex = L12_3
            L20_3 = 0
            L21_3 = ipairs
            L22_3 = L17_3
            L21_3, L22_3, L23_3 = L21_3(L22_3)
            for L24_3, L25_3 in L21_3, L22_3, L23_3 do
              L26_3 = L25_3.x
              if not L26_3 then
                L26_3 = 0
              end
              L26_3 = L26_3 * L19_3
              L27_3 = L25_3.y
              if not L27_3 then
                L27_3 = 0
              end
              L27_3 = L27_3 * L19_3
              L29_3 = L18_3
              L28_3 = L18_3.setFrame
              L30_3 = L20_3
              L31_3 = L25_3.time
              L32_3 = L26_3
              L33_3 = L27_3
              L28_3(L29_3, L30_3, L31_3, L32_3, L33_3)
              L28_3 = L4_2
              L29_3 = L18_3
              L30_3 = L20_3
              L31_3 = L25_3
              L28_3(L29_3, L30_3, L31_3)
              L20_3 = L20_3 + 1
            end
            L21_3 = table
            L21_3 = L21_3.insert
            L22_3 = L3_3
            L23_3 = L18_3
            L21_3(L22_3, L23_3)
            L21_3 = math
            L21_3 = L21_3.max
            L22_3 = L4_3
            L24_3 = L18_3
            L23_3 = L18_3.getDuration
            L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3 = L23_3(L24_3)
            L21_3 = L21_3(L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3)
            L4_3 = L21_3
          else
            L18_3 = error
            L19_3 = "Invalid timeline type for a bone: "
            L20_3 = L16_3
            L21_3 = " ("
            L22_3 = L10_3
            L23_3 = ")"
            L19_3 = L19_3 .. L20_3 .. L21_3 .. L22_3 .. L23_3
            L18_3(L19_3)
          end
        end
      end
    end
    L7_3 = A1_3.ffd
    if L7_3 then
      L8_3 = pairs
      L9_3 = L7_3
      L8_3, L9_3, L10_3 = L8_3(L9_3)
      for L11_3, L12_3 in L8_3, L9_3, L10_3 do
        L13_3 = A2_3.findSkin
        L14_3 = L11_3
        L13_3 = L13_3(L14_3)
        L14_3 = pairs
        L15_3 = L12_3
        L14_3, L15_3, L16_3 = L14_3(L15_3)
        for L17_3, L18_3 in L14_3, L15_3, L16_3 do
          L19_3 = A2_3.findSlotIndex
          L20_3 = L17_3
          L19_3 = L19_3(L20_3)
          L20_3 = pairs
          L21_3 = L18_3
          L20_3, L21_3, L22_3 = L20_3(L21_3)
          for L23_3, L24_3 in L20_3, L21_3, L22_3 do
            L25_3 = L5_1
            L25_3 = L25_3.FfdTimeline
            L25_3 = L25_3.new
            L25_3 = L25_3()
            L27_3 = L13_3
            L26_3 = L13_3.getAttachment
            L28_3 = L19_3
            L29_3 = L23_3
            L26_3 = L26_3(L27_3, L28_3, L29_3)
            if not L26_3 then
              L27_3 = error
              L28_3 = "FFD attachment not found: "
              L29_3 = L23_3
              L28_3 = L28_3 .. L29_3
              L27_3(L28_3)
            end
            L25_3.slotIndex = L19_3
            L25_3.attachment = L26_3
            L27_3 = L26_3.type
            L28_3 = L8_1
            L28_3 = L28_3.mesh
            L27_3 = L27_3 == L28_3
            L28_3 = nil
            if L27_3 then
              L29_3 = L26_3.vertices
              L28_3 = L29_3.length
            else
              L29_3 = L26_3.weights
              L29_3 = L29_3.length
              L29_3 = L29_3 / 3
              L28_3 = L29_3 * 2
            end
            L29_3 = 0
            L30_3 = ipairs
            L31_3 = L24_3
            L30_3, L31_3, L32_3 = L30_3(L31_3)
            for L33_3, L34_3 in L30_3, L31_3, L32_3 do
              L35_3 = nil
              L36_3 = L34_3.vertices
              if not L36_3 then
                if L27_3 then
                  L35_3 = L26_3.vertices
                else
                  L36_3 = {}
                  L35_3 = L36_3
                  L35_3.length = L28_3
                end
              else
                L36_3 = L34_3.vertices
                L37_3 = {}
                L38_3 = L34_3.offset
                if not L38_3 then
                  L38_3 = 0
                end
                L39_3 = scale
                if L39_3 == 1 then
                  L39_3 = 1
                  L40_3 = #L36_3
                  L41_3 = 1
                  for L42_3 = L39_3, L40_3, L41_3 do
                    L43_3 = L42_3 + L38_3
                    L44_3 = L36_3[L42_3]
                    L37_3[L43_3] = L44_3
                  end
                else
                  L39_3 = 1
                  L40_3 = #L36_3
                  L41_3 = 1
                  for L42_3 = L39_3, L40_3, L41_3 do
                    L43_3 = L42_3 + L38_3
                    L44_3 = L36_3[L42_3]
                    L45_3 = scale
                    L44_3 = L44_3 * L45_3
                    L37_3[L43_3] = L44_3
                  end
                end
                if L27_3 then
                  L39_3 = L26_3.vertices
                  L40_3 = 1
                  L41_3 = L28_3
                  L42_3 = 1
                  for L43_3 = L40_3, L41_3, L42_3 do
                    L44_3 = L37_3[L43_3]
                    L45_3 = L39_3[L43_3]
                    L44_3 = L44_3 + L45_3
                    L37_3[L43_3] = L44_3
                  end
                else
                  L39_3 = #L36_3
                  if L28_3 > L39_3 then
                    L37_3[L28_3] = 0
                  end
                end
              end
              L37_3 = L25_3
              L36_3 = L25_3.setFrame
              L38_3 = L29_3
              L39_3 = L34_3.time
              L40_3 = L35_3
              L36_3(L37_3, L38_3, L39_3, L40_3)
              L36_3 = L4_2
              L37_3 = L25_3
              L38_3 = L29_3
              L39_3 = L34_3
              L36_3(L37_3, L38_3, L39_3)
              L29_3 = L29_3 + 1
            end
            L30_3 = table
            L30_3 = L30_3.insert
            L31_3 = L3_3
            L32_3 = L25_3
            L30_3(L31_3, L32_3)
            L30_3 = math
            L30_3 = L30_3.max
            L31_3 = L4_3
            L33_3 = L25_3
            L32_3 = L25_3.getDuration
            L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3 = L32_3(L33_3)
            L30_3 = L30_3(L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3)
            L4_3 = L30_3
          end
        end
      end
    end
    L8_3 = A1_3.draworder
    if L8_3 then
      L9_3 = L5_1
      L9_3 = L9_3.DrawOrderTimeline
      L9_3 = L9_3.new
      L10_3 = #L8_3
      L9_3 = L9_3(L10_3)
      L10_3 = A2_3.slots
      L10_3 = #L10_3
      L11_3 = 0
      L12_3 = ipairs
      L13_3 = L8_3
      L12_3, L13_3, L14_3 = L12_3(L13_3)
      for L15_3, L16_3 in L12_3, L13_3, L14_3 do
        L17_3 = nil
        L18_3 = L16_3.offsets
        if L18_3 then
          L19_3 = {}
          L17_3 = L19_3
          L19_3 = {}
          L20_3 = 1
          L21_3 = 1
          L22_3 = ipairs
          L23_3 = L18_3
          L22_3, L23_3, L24_3 = L22_3(L23_3)
          for L25_3, L26_3 in L22_3, L23_3, L24_3 do
            L28_3 = A2_3
            L27_3 = A2_3.findSlotIndex
            L29_3 = L26_3.slot
            L27_3 = L27_3(L28_3, L29_3)
            if L27_3 == -1 then
              L28_3 = error
              L29_3 = "Slot not found: "
              L30_3 = L26_3.slot
              L29_3 = L29_3 .. L30_3
              L28_3(L29_3)
            end
            while L20_3 ~= L27_3 do
              L19_3[L21_3] = L20_3
              L21_3 = L21_3 + 1
              L20_3 = L20_3 + 1
            end
            L28_3 = L26_3.offset
            L28_3 = L20_3 + L28_3
            L17_3[L28_3] = L20_3
            L20_3 = L20_3 + 1
          end
          while L10_3 >= L20_3 do
            L19_3[L21_3] = L20_3
            L21_3 = L21_3 + 1
            L20_3 = L20_3 + 1
          end
          L22_3 = L10_3
          L23_3 = 1
          L24_3 = -1
          for L25_3 = L22_3, L23_3, L24_3 do
            L26_3 = L17_3[L25_3]
            if not L26_3 then
              L21_3 = L21_3 - 1
              L26_3 = L19_3[L21_3]
              L17_3[L25_3] = L26_3
            end
          end
        end
        L20_3 = L9_3
        L19_3 = L9_3.setFrame
        L21_3 = L11_3
        L22_3 = L16_3.time
        L23_3 = L17_3
        L19_3(L20_3, L21_3, L22_3, L23_3)
        L11_3 = L11_3 + 1
      end
      L12_3 = table
      L12_3 = L12_3.insert
      L13_3 = L3_3
      L14_3 = L9_3
      L12_3(L13_3, L14_3)
      L12_3 = math
      L12_3 = L12_3.max
      L13_3 = L4_3
      L15_3 = L9_3
      L14_3 = L9_3.getDuration
      L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3 = L14_3(L15_3)
      L12_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3)
      L4_3 = L12_3
    end
    L9_3 = A1_3.events
    if L9_3 then
      L10_3 = L5_1
      L10_3 = L10_3.EventTimeline
      L10_3 = L10_3.new
      L11_3 = #L9_3
      L10_3 = L10_3(L11_3)
      L11_3 = 0
      L12_3 = ipairs
      L13_3 = L9_3
      L12_3, L13_3, L14_3 = L12_3(L13_3)
      for L15_3, L16_3 in L12_3, L13_3, L14_3 do
        L18_3 = A2_3
        L17_3 = A2_3.findEvent
        L19_3 = L16_3.n
        L17_3 = L17_3(L18_3, L19_3)
        if not L17_3 then
          L18_3 = error
          L19_3 = "Event not found: "
          L20_3 = L16_3.n
          L19_3 = L19_3 .. L20_3
          L18_3(L19_3)
        end
        L18_3 = L7_1
        L18_3 = L18_3.new
        L19_3 = L17_3
        L18_3 = L18_3(L19_3)
        L19_3 = L16_3.int
        if L19_3 ~= nil then
          L19_3 = L16_3.int
          L18_3.intValue = L19_3
        else
          L19_3 = L17_3.intValue
          L18_3.intValue = L19_3
        end
        L19_3 = L16_3.float
        if L19_3 ~= nil then
          L19_3 = L16_3.float
          L18_3.floatValue = L19_3
        else
          L19_3 = L17_3.floatValue
          L18_3.floatValue = L19_3
        end
        L19_3 = L16_3.string
        if L19_3 ~= nil then
          L19_3 = L16_3.string
          L18_3.stringValue = L19_3
        else
          L19_3 = L17_3.stringValue
          L18_3.stringValue = L19_3
        end
        L20_3 = L10_3
        L19_3 = L10_3.setFrame
        L21_3 = L11_3
        L22_3 = L16_3.time
        L23_3 = L18_3
        L19_3(L20_3, L21_3, L22_3, L23_3)
        L11_3 = L11_3 + 1
      end
      L12_3 = table
      L12_3 = L12_3.insert
      L13_3 = L3_3
      L14_3 = L10_3
      L12_3(L13_3, L14_3)
      L12_3 = math
      L12_3 = L12_3.max
      L13_3 = L4_3
      L15_3 = L10_3
      L14_3 = L10_3.getDuration
      L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3 = L14_3(L15_3)
      L12_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3)
      L4_3 = L12_3
    end
    L10_3 = table
    L10_3 = L10_3.insert
    L11_3 = A2_3.animations
    L12_3 = L5_1
    L12_3 = L12_3.new
    L13_3 = A0_3
    L14_3 = L3_3
    L15_3 = L4_3
    L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3 = L12_3(L13_3, L14_3, L15_3)
    L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3, L45_3)
  end
  
  function L4_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L3_3 = A2_3.curve
    if not L3_3 then
      return
    end
    if L3_3 == "stepped" then
      L5_3 = A0_3
      L4_3 = A0_3.setStepped
      L6_3 = A1_3
      L4_3(L5_3, L6_3)
    else
      L5_3 = A0_3
      L4_3 = A0_3.setCurve
      L6_3 = A1_3
      L7_3 = L3_3[1]
      L8_3 = L3_3[2]
      L9_3 = L3_3[3]
      L10_3 = L3_3[4]
      L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
    end
  end
  
  function L5_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L3_3 = A0_3[A1_3]
    L4_3 = {}
    if A2_3 == 1 then
      L5_3 = 1
      L6_3 = #L3_3
      L7_3 = 1
      for L8_3 = L5_3, L6_3, L7_3 do
        L9_3 = L3_3[L8_3]
        L4_3[L8_3] = L9_3
      end
    else
      L5_3 = 1
      L6_3 = #L3_3
      L7_3 = 1
      for L8_3 = L5_3, L6_3, L7_3 do
        L9_3 = L3_3[L8_3]
        L9_3 = L9_3 * A2_3
        L4_3[L8_3] = L9_3
      end
    end
    return L4_3
  end
  
  return L1_2
end

L9_1.new = L10_1
return L9_1
