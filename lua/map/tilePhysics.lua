local unpack = unpack
local pairs = pairs
local ipairs = ipairs
local M = {}

function M.physicsData(scale)
  local physics = {
    data = {
      ["001"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            26,
            -27,
            26,
            24,
            -26,
            24,
            -26,
            -27
          }
        }
      },
      ["002"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["003"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["004"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["005"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            51
          }
        }
      },
      ["006"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            45,
            -80,
            45,
            -80,
            -50,
            80,
            -50
          }
        }
      },
      ["007"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            71,
            -50,
            77,
            26,
            30,
            50,
            -80,
            45
          }
        }
      },
      ["008"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["009"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -43,
            40,
            -72,
            50,
            -62,
            34
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            15,
            -16,
            75,
            50,
            -43,
            40,
            -26,
            -3
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            75,
            50,
            -72,
            50,
            -43,
            40
          }
        }
      },
      ["010"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["011"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -13,
            6,
            9,
            5,
            43,
            48,
            -67,
            50
          }
        }
      },
      ["012"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["013"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            28,
            50,
            -37,
            50,
            3,
            26
          }
        }
      },
      ["014"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            74,
            -3,
            51,
            23,
            3,
            46,
            -80,
            50
          }
        }
      },
      ["015"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            -50,
            40,
            7,
            -42,
            50,
            -80,
            50,
            -80,
            -50
          }
        }
      },
      ["016"] = {},
      ["017"] = {},
      ["018"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["019"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            50,
            -71,
            -49,
            70,
            -50,
            80,
            50
          }
        }
      },
      ["020"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["021"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["022"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            72,
            -50,
            80,
            50,
            -80,
            50,
            -80,
            -50
          }
        }
      },
      ["023"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["024"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            9,
            37,
            80,
            2
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            9,
            37
          }
        }
      },
      ["025"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -80,
            2,
            -63,
            -11,
            8,
            -42,
            80,
            -50
          }
        }
      },
      ["026"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["027"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["028"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            45,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["029"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -80,
            45,
            80,
            5
          }
        }
      },
      ["030"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["031"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["032"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -80,
            5,
            80,
            -50
          }
        }
      },
      ["033"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["034"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -37,
            50,
            80,
            40
          }
        }
      },
      ["035"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -80,
            40,
            80,
            0
          }
        }
      },
      ["036"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["037"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["038"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -80,
            0,
            0,
            -25,
            80,
            -41
          }
        }
      },
      ["039"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -80,
            -41,
            -18,
            -49,
            80,
            -50
          }
        }
      },
      ["040"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["041"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            80,
            -3
          }
        }
      },
      ["042"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -80,
            -3,
            19,
            -35,
            80,
            -44
          }
        }
      },
      ["043"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["044"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -80,
            -44,
            80,
            -50
          }
        }
      },
      ["045"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["046"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            80,
            0
          }
        }
      },
      ["047"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -80,
            0,
            80,
            -50
          }
        }
      },
      ["048"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["049"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["050"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            25,
            17,
            40,
            3,
            80,
            0
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            50,
            25,
            17,
            80,
            50
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            25,
            17,
            -26,
            33,
            4,
            16
          }
        }
      },
      ["051"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -80,
            0,
            80,
            -50
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -25,
            -18,
            -57,
            -9,
            -48,
            -19
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -25,
            -18,
            -80,
            0,
            -57,
            -9
          }
        }
      },
      ["052"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["053"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["054"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            80,
            25
          }
        }
      },
      ["055"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -80,
            25,
            80,
            0
          }
        }
      },
      ["056"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["057"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["058"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -80,
            0,
            80,
            -24
          }
        }
      },
      ["059"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -80,
            -24,
            80,
            -50
          }
        }
      },
      ["060"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["061"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            -40,
            -80,
            -40
          }
        }
      },
      ["062"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            -25,
            -50,
            -80,
            -40
          }
        }
      },
      ["063"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            0,
            80,
            15,
            -25,
            50,
            -80,
            50
          }
        }
      },
      ["064"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            0,
            80,
            -50,
            80,
            -40,
            -80,
            15
          }
        }
      },
      ["065"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            0,
            -50,
            -7,
            -40,
            -80,
            -40
          }
        }
      },
      ["066"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            -35,
            -50,
            -35,
            -40,
            -80,
            -40
          }
        }
      },
      ["067"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            75,
            -50,
            80,
            -40,
            -80,
            -40,
            -80,
            -50
          }
        }
      },
      ["068"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["069"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            76,
            -48,
            80,
            50,
            -80,
            50,
            -80,
            -50
          }
        }
      },
      ["070"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            79,
            -49,
            80,
            50,
            -80,
            50,
            -80,
            -50
          }
        }
      },
      ["071"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["072"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["073"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["074"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            26,
            40,
            80,
            27
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -65,
            50,
            26,
            40
          }
        }
      },
      ["075"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            45,
            -22,
            80,
            -50
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -13,
            5,
            45,
            -22
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -13,
            5,
            -80,
            50,
            -80,
            27
          }
        }
      },
      ["076"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["077"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["078"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["079"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -24,
            -31,
            -5,
            -50,
            80,
            -50
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -24,
            -31,
            -80,
            50,
            -80,
            5
          }
        }
      },
      ["080"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            28,
            20,
            80,
            -50
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            28,
            20,
            80,
            50,
            -5,
            50
          }
        }
      },
      ["081"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            51,
            20,
            80,
            5
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            24,
            33,
            51,
            20
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -23,
            46,
            24,
            33
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -23,
            46
          }
        }
      },
      ["082"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["083"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            80,
            -50
          }
        }
      },
      ["084"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["085"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            59,
            -24,
            80,
            -50
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            35,
            1,
            59,
            -24
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -9,
            31,
            35,
            1
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -54,
            48,
            -9,
            31
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -54,
            48
          }
        }
      },
      ["086"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["087"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            50,
            -59,
            20,
            6,
            -29,
            45,
            -44,
            80,
            -50,
            80,
            50
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            6,
            -29,
            -59,
            20,
            -29,
            -8
          }
        }
      },
      ["088"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            -50,
            80,
            50,
            -80,
            50,
            -80,
            -50
          }
        }
      },
      ["089"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            0,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["090"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["091"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["092"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["093"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["094"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["095"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            80,
            -50,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["096"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            54,
            -40,
            -80,
            -35,
            -80,
            -50,
            80,
            -50,
            80,
            -43
          }
        }
      },
      ["097"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            17,
            48,
            80,
            42
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            17,
            48,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["098"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            30,
            -20,
            50,
            -3,
            32,
            80,
            15
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -20,
            50,
            -80,
            50,
            -80,
            42,
            -3,
            32
          }
        }
      },
      ["099"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            -40,
            16,
            -3,
            -80,
            30,
            -4,
            -12,
            80,
            -50
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -4,
            -12,
            -80,
            30,
            -80,
            15
          }
        }
      },
      ["100"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            -25,
            -50,
            -80,
            -43
          }
        }
      },
      ["101"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            6,
            -39,
            -80,
            -34,
            -80,
            -50,
            50,
            -50
          }
        }
      },
      ["102"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            49,
            36,
            80,
            27
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            7,
            45,
            49,
            36
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -48,
            50,
            7,
            45
          }
        }
      },
      ["103"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -26,
            8,
            10,
            6,
            -80,
            41,
            -80,
            27
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            -41,
            10,
            6,
            -26,
            8
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            -41,
            23,
            -15,
            80,
            -50
          }
        }
      },
      ["104"] = {},
      ["105"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            41,
            -14,
            3,
            14,
            3,
            80,
            27
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -33,
            -21,
            -14,
            3,
            -80,
            -40,
            -80,
            -50
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            14,
            3,
            -14,
            3,
            -33,
            -21
          }
        }
      },
      ["106"] = {},
      ["107"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            1,
            -41,
            -47,
            -50,
            80,
            -50,
            80,
            -37
          }
        }
      },
      ["108"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            27,
            -41,
            38,
            -52,
            50,
            -80,
            40
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            13,
            47,
            -52,
            50,
            -41,
            38
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -52,
            50,
            13,
            47
          }
        }
      },
      ["109"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -80,
            -50,
            45,
            -50,
            27,
            -46,
            -8,
            -40,
            -56,
            -36,
            -80,
            -36
          }
        }
      },
      ["110"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            40,
            40,
            50,
            40,
            38,
            80,
            27
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            40,
            50,
            -15,
            47,
            40,
            38
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            40,
            50,
            -80,
            50,
            -15,
            47
          }
        }
      },
      ["111"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            -26,
            7,
            8,
            5,
            -80,
            39,
            -80,
            26
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            -40,
            8,
            5,
            32,
            -21,
            80,
            -50
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            8,
            5,
            -26,
            7,
            32,
            -21
          }
        }
      },
      ["112"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            80,
            -50,
            80,
            -40,
            -80,
            -40,
            -80,
            -50
          }
        }
      }
    }
  }
  local s = scale or 1
  for bi, body in pairs(physics.data) do
    for fi, fixture in ipairs(body) do
      if fixture.shape then
        for ci, coordinate in ipairs(fixture.shape) do
          fixture.shape[ci] = s * coordinate
        end
      else
        fixture.radius = s * fixture.radius
      end
    end
  end
  
  function physics:get(name)
    return unpack(self.data[name])
  end
  
  function physics:getFixtureId(name, index)
    return self.data[name][index].pe_fixture_id
  end
  
  return physics
end

return M
