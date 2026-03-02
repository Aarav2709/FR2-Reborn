-- powerupsImageSheet.lua
-- Frame atlas for images/game/powerups/powerups.png (1024x1024)
-- 114 frames matching original FR2 layout
local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    { x=932, y=226, width=90, height=90 }, -- 1: 1201 (default sawblade)
    { x=152, y=624, width=90, height=90 }, -- 2: 1202
    { x=152, y=718, width=90, height=90 }, -- 3: 1203
    { x=152, y=812, width=90, height=90 }, -- 4: 1204
    { x=924, y=320, width=90, height=90 }, -- 5: 1205
    { x=246, y=656, width=82, height=90, sourceX=4, sourceY=0, sourceWidth=90, sourceHeight=90 }, -- 6: 1206
    { x=152, y=906, width=90, height=90 }, -- 7: 1207
    { x=332, y=618, width=90, height=90 }, -- 8: 1208
    { x=426, y=618, width=90, height=90 }, -- 9: 1209
    { x=246, y=750, width=90, height=90 }, -- 10: 1210
    { x=246, y=844, width=90, height=90 }, -- 11: 1211
    { x=520, y=618, width=90, height=90 }, -- 12: 1212
    { x=614, y=614, width=90, height=90 }, -- 13: 1212_2
    { x=802, y=614, width=86, height=90, sourceX=2, sourceY=0, sourceWidth=90, sourceHeight=90 }, -- 14: 1213
    { x=340, y=806, width=86, height=90, sourceX=2, sourceY=0, sourceWidth=90, sourceHeight=90 }, -- 15: 1213_2
    { x=708, y=614, width=90, height=90 }, -- 16: 1214
    { x=340, y=712, width=90, height=90 }, -- 17: 1215
    { x=924, y=414, width=96, height=28, sourceX=0, sourceY=52, sourceWidth=96, sourceHeight=80 }, -- 18: 1301
    { x=836, y=820, width=76, height=48, sourceX=10, sourceY=32, sourceWidth=96, sourceHeight=80 }, -- 19: 1301_2
    { x=868, y=554, width=44, height=56, sourceX=26, sourceY=24, sourceWidth=96, sourceHeight=80 }, -- 20: 1301_3
    { x=482, y=904, width=32, height=52, sourceX=32, sourceY=28, sourceWidth=96, sourceHeight=80 }, -- 21: 1301_4
    { x=904, y=478, width=96, height=24, sourceX=0, sourceY=56, sourceWidth=96, sourceHeight=80 }, -- 22: 1302
    { x=736, y=768, width=80, height=48, sourceX=6, sourceY=32, sourceWidth=96, sourceHeight=80 }, -- 23: 1302_2
    { x=916, y=686, width=44, height=52, sourceX=26, sourceY=28, sourceWidth=96, sourceHeight=80 }, -- 24: 1302_3
    { x=786, y=908, width=32, height=52, sourceX=32, sourceY=28, sourceWidth=96, sourceHeight=80 }, -- 25: 1302_4
    { x=736, y=820, width=96, height=24, sourceX=0, sourceY=56, sourceWidth=96, sourceHeight=80 }, -- 26: 1303
    { x=642, y=828, width=76, height=48, sourceX=10, sourceY=32, sourceWidth=96, sourceHeight=80 }, -- 27: 1303_2
    { x=626, y=932, width=44, height=52, sourceX=26, sourceY=28, sourceWidth=96, sourceHeight=80 }, -- 28: 1303_3
    { x=986, y=834, width=36, height=52, sourceX=28, sourceY=28, sourceWidth=96, sourceHeight=80 }, -- 29: 1303_4
    { x=904, y=446, width=96, height=28, sourceX=0, sourceY=52, sourceWidth=96, sourceHeight=80 }, -- 30: 1304
    { x=820, y=768, width=80, height=48, sourceX=8, sourceY=32, sourceWidth=96, sourceHeight=80 }, -- 31: 1304_2
    { x=822, y=932, width=44, height=52, sourceX=26, sourceY=28, sourceWidth=96, sourceHeight=80 }, -- 32: 1304_3
    { x=986, y=890, width=36, height=52, sourceX=30, sourceY=28, sourceWidth=96, sourceHeight=80 }, -- 33: 1304_4
    { x=904, y=506, width=96, height=28, sourceX=0, sourceY=52, sourceWidth=96, sourceHeight=80 }, -- 34: 1305
    { x=722, y=848, width=76, height=48, sourceX=10, sourceY=32, sourceWidth=96, sourceHeight=80 }, -- 35: 1305_2
    { x=674, y=952, width=44, height=52, sourceX=26, sourceY=28, sourceWidth=96, sourceHeight=80 }, -- 36: 1305_3
    { x=770, y=964, width=32, height=52, sourceX=32, sourceY=28, sourceWidth=96, sourceHeight=80 }, -- 37: 1305_4
    { x=916, y=590, width=96, height=28, sourceX=0, sourceY=52, sourceWidth=96, sourceHeight=80 }, -- 38: 1306
    { x=916, y=538, width=80, height=48, sourceX=6, sourceY=32, sourceWidth=96, sourceHeight=80 }, -- 39: 1306_2
    { x=370, y=900, width=44, height=56, sourceX=26, sourceY=24, sourceWidth=96, sourceHeight=80 }, -- 40: 1306_3
    { x=872, y=494, width=28, height=56, sourceX=34, sourceY=24, sourceWidth=96, sourceHeight=80 }, -- 41: 1306_4
    { x=526, y=900, width=96, height=24, sourceX=0, sourceY=56, sourceWidth=96, sourceHeight=80 }, -- 42: 1307
    { x=626, y=880, width=76, height=48, sourceX=10, sourceY=32, sourceWidth=96, sourceHeight=80 }, -- 43: 1307_2
    { x=722, y=952, width=44, height=52, sourceX=26, sourceY=28, sourceWidth=96, sourceHeight=80 }, -- 44: 1307_3
    { x=152, y=370, width=28, height=52, sourceX=34, sourceY=28, sourceWidth=96, sourceHeight=80 }, -- 45: 1307_4
    { x=906, y=742, width=96, height=28, sourceX=0, sourceY=52, sourceWidth=96, sourceHeight=80 }, -- 46: 1308
    { x=706, y=900, width=76, height=48, sourceX=10, sourceY=32, sourceWidth=96, sourceHeight=80 }, -- 47: 1308_2
    { x=986, y=774, width=36, height=56, sourceX=30, sourceY=24, sourceWidth=96, sourceHeight=80 }, -- 48: 1308_3
    { x=802, y=848, width=24, height=56, sourceX=36, sourceY=24, sourceWidth=96, sourceHeight=80 }, -- 49: 1308_4
    { x=2, y=370, width=146, height=140, sourceX=0, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 50: 1501 (default shield)
    { x=186, y=184, width=142, height=140, sourceX=4, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 51: 1501_2
    { x=330, y=2, width=146, height=140, sourceX=0, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 52: 1502
    { x=186, y=328, width=142, height=140, sourceX=4, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 53: 1502_2
    { x=2, y=514, width=146, height=140, sourceX=0, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 54: 1503
    { x=480, y=2, width=146, height=140, sourceX=0, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 55: 1503_2
    { x=2, y=658, width=146, height=140, sourceX=0, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 56: 1504
    { x=630, y=2, width=146, height=140, sourceX=0, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 57: 1504_2
    { x=2, y=802, width=146, height=140, sourceX=0, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 58: 1505
    { x=780, y=2, width=146, height=140, sourceX=0, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 59: 1505_2
    { x=332, y=146, width=146, height=140, sourceX=2, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 60: 1506
    { x=632, y=290, width=142, height=140, sourceX=4, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 61: 1506_2
    { x=482, y=146, width=146, height=140, sourceX=0, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 62: 1507
    { x=632, y=146, width=146, height=140, sourceX=0, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 63: 1507_2
    { x=782, y=146, width=146, height=140, sourceX=0, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 64: 1508
    { x=778, y=290, width=142, height=140, sourceX=2, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 65: 1508_2
    { x=332, y=290, width=146, height=140, sourceX=0, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 66: 1509
    { x=482, y=290, width=146, height=140, sourceX=0, sourceY=0, sourceWidth=150, sourceHeight=140 }, -- 67: 1509_2
    { x=964, y=622, width=58, height=56, sourceX=80, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 68: 2001
    { x=262, y=536, width=66, height=56, sourceX=72, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 69: 2001_2
    { x=624, y=708, width=90, height=56, sourceX=48, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 70: 2001_3
    { x=474, y=558, width=122, height=56, sourceX=16, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 71: 2001_4
    { x=620, y=434, width=138, height=56 }, -- 72: 2001_5
    { x=964, y=682, width=58, height=56, sourceX=80, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 73: 2002
    { x=262, y=596, width=66, height=56, sourceX=72, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 74: 2002_2
    { x=718, y=708, width=90, height=56, sourceX=48, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 75: 2002_3
    { x=620, y=494, width=122, height=56, sourceX=16, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 76: 2002_4
    { x=762, y=434, width=138, height=56 }, -- 77: 2002_5
    { x=370, y=966, width=58, height=56, sourceX=80, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 78: 2003
    { x=916, y=774, width=66, height=56, sourceX=72, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 79: 2003_2
    { x=812, y=708, width=90, height=56, sourceX=48, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 80: 2003_3
    { x=746, y=494, width=122, height=56, sourceX=16, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 81: 2003_4
    { x=332, y=498, width=138, height=56 }, -- 82: 2003_5
    { x=432, y=966, width=58, height=56, sourceX=80, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 83: 2004
    { x=916, y=834, width=66, height=56, sourceX=72, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 84: 2004_2
    { x=526, y=840, width=90, height=56, sourceX=48, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 85: 2004_3
    { x=616, y=554, width=122, height=56, sourceX=16, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 86: 2004_4
    { x=474, y=498, width=138, height=56 }, -- 87: 2004_5
    { x=518, y=928, width=58, height=56, sourceX=80, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 88: 2005
    { x=830, y=872, width=66, height=56, sourceX=72, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 89: 2005_2
    { x=642, y=768, width=90, height=56, sourceX=48, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 90: 2005_3
    { x=742, y=554, width=122, height=56, sourceX=16, sourceY=0, sourceWidth=138, sourceHeight=56 }, -- 91: 2005_4
    { x=332, y=558, width=138, height=56 }, -- 92: 2005_5
    { x=558, y=712, width=62, height=60, sourceX=78, sourceY=0, sourceWidth=140, sourceHeight=59 }, -- 93: 2006
    { x=558, y=776, width=80, height=60, sourceX=60, sourceY=0, sourceWidth=140, sourceHeight=59 }, -- 94: 2006_2
    { x=930, y=2, width=92, height=60, sourceX=48, sourceY=0, sourceWidth=140, sourceHeight=59 }, -- 95: 2006_3
    { x=246, y=938, width=120, height=60, sourceX=20, sourceY=0, sourceWidth=140, sourceHeight=59 }, -- 96: 2006_4
    { x=2, y=946, width=140, height=60, sourceX=0, sourceY=0, sourceWidth=140, sourceHeight=59 }, -- 97: 2006_5
    { x=900, y=894, width=62, height=60, sourceX=78, sourceY=0, sourceWidth=140, sourceHeight=59 }, -- 98: 2007
    { x=892, y=622, width=68, height=60, sourceX=72, sourceY=0, sourceWidth=140, sourceHeight=59 }, -- 99: 2007_2
    { x=930, y=66, width=92, height=60, sourceX=48, sourceY=0, sourceWidth=140, sourceHeight=59 }, -- 100: 2007_3
    { x=434, y=712, width=120, height=60, sourceX=20, sourceY=0, sourceWidth=140, sourceHeight=59 }, -- 101: 2007_4
    { x=332, y=434, width=140, height=60, sourceX=0, sourceY=0, sourceWidth=140, sourceHeight=59 }, -- 102: 2007_5
    { x=418, y=904, width=60, height=58, sourceX=80, sourceY=0, sourceWidth=140, sourceHeight=59 }, -- 103: 2008
    { x=262, y=472, width=66, height=60, sourceX=74, sourceY=0, sourceWidth=140, sourceHeight=59 }, -- 104: 2008_2
    { x=430, y=840, width=92, height=60, sourceX=48, sourceY=0, sourceWidth=140, sourceHeight=59 }, -- 105: 2008_3
    { x=434, y=776, width=120, height=60, sourceX=20, sourceY=0, sourceWidth=140, sourceHeight=59 }, -- 106: 2008_4
    { x=476, y=434, width=140, height=60, sourceX=0, sourceY=0, sourceWidth=140, sourceHeight=59 }, -- 107: 2008_5
    { x=186, y=2, width=140, height=178, sourceX=20, sourceY=12, sourceWidth=186, sourceHeight=197 }, -- 108: tp1
    { x=2, y=2, width=180, height=182, sourceX=2, sourceY=6, sourceWidth=186, sourceHeight=197 }, -- 109: tp2
    { x=2, y=188, width=180, height=178, sourceX=2, sourceY=0, sourceWidth=186, sourceHeight=197 }, -- 110: tp3
    { x=620, y=840, width=18, height=20, sourceX=82, sourceY=96, sourceWidth=186, sourceHeight=197 }, -- 111: tp4
    { x=152, y=472, width=106, height=148, sourceX=40, sourceY=36, sourceWidth=186, sourceHeight=197 }, -- 112: tp5
    { x=932, y=130, width=90, height=92, sourceX=52, sourceY=62, sourceWidth=186, sourceHeight=197 }, -- 113: tp6
    { x=580, y=928, width=42, height=46, sourceX=72, sourceY=84, sourceWidth=186, sourceHeight=197 }, -- 114: tp7
  },
  sheetContentWidth = 1024,
  sheetContentHeight = 1024
}

SheetInfo.frameIndex = {
  -- Sawblades (1 frame each)
  ["1201"] = 1,  ["1202"] = 2,  ["1203"] = 3,  ["1204"] = 4,
  ["1205"] = 5,  ["1206"] = 6,  ["1207"] = 7,  ["1208"] = 8,
  ["1209"] = 9,  ["1210"] = 10, ["1211"] = 11, ["1212"] = 12,
  ["1212_2"] = 13, ["1213"] = 14, ["1213_2"] = 15,
  ["1214"] = 16, ["1215"] = 17,

  -- Beartraps (4 frames each: open → close)
  ["1301"] = 18, ["1301_2"] = 19, ["1301_3"] = 20, ["1301_4"] = 21,
  ["1302"] = 22, ["1302_2"] = 23, ["1302_3"] = 24, ["1302_4"] = 25,
  ["1303"] = 26, ["1303_2"] = 27, ["1303_3"] = 28, ["1303_4"] = 29,
  ["1304"] = 30, ["1304_2"] = 31, ["1304_3"] = 32, ["1304_4"] = 33,
  ["1305"] = 34, ["1305_2"] = 35, ["1305_3"] = 36, ["1305_4"] = 37,
  ["1306"] = 38, ["1306_2"] = 39, ["1306_3"] = 40, ["1306_4"] = 41,
  ["1307"] = 42, ["1307_2"] = 43, ["1307_3"] = 44, ["1307_4"] = 45,
  ["1308"] = 46, ["1308_2"] = 47, ["1308_3"] = 48, ["1308_4"] = 49,

  -- Shields (2 frames each: normal, absorb)
  ["1501"] = 50, ["1501_2"] = 51,
  ["1502"] = 52, ["1502_2"] = 53,
  ["1503"] = 54, ["1503_2"] = 55,
  ["1504"] = 56, ["1504_2"] = 57,
  ["1505"] = 58, ["1505_2"] = 59,
  ["1506"] = 60, ["1506_2"] = 61,
  ["1507"] = 62, ["1507_2"] = 63,
  ["1508"] = 64, ["1508_2"] = 65,
  ["1509"] = 66, ["1509_2"] = 67,

  -- Punchboxes (5 frames each: retracted → extended)
  ["2001"] = 68, ["2001_2"] = 69, ["2001_3"] = 70, ["2001_4"] = 71, ["2001_5"] = 72,
  ["2002"] = 73, ["2002_2"] = 74, ["2002_3"] = 75, ["2002_4"] = 76, ["2002_5"] = 77,
  ["2003"] = 78, ["2003_2"] = 79, ["2003_3"] = 80, ["2003_4"] = 81, ["2003_5"] = 82,
  ["2004"] = 83, ["2004_2"] = 84, ["2004_3"] = 85, ["2004_4"] = 86, ["2004_5"] = 87,
  ["2005"] = 88, ["2005_2"] = 89, ["2005_3"] = 90, ["2005_4"] = 91, ["2005_5"] = 92,
  ["2006"] = 93, ["2006_2"] = 94, ["2006_3"] = 95, ["2006_4"] = 96, ["2006_5"] = 97,
  ["2007"] = 98, ["2007_2"] = 99, ["2007_3"] = 100, ["2007_4"] = 101, ["2007_5"] = 102,
  ["2008"] = 103, ["2008_2"] = 104, ["2008_3"] = 105, ["2008_4"] = 106, ["2008_5"] = 107,

  -- Teleport (7 frames)
  ["tp1"] = 108, ["tp2"] = 109, ["tp3"] = 110, ["tp4"] = 111,
  ["tp5"] = 112, ["tp6"] = 113, ["tp7"] = 114,

  -- Legacy aliases
  ["sawblade"] = 1,
}

function SheetInfo:getSheet()
  return self.sheet
end

function SheetInfo:getFrameIndex(name)
  return self.frameIndex[name]
end

return SheetInfo
