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
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
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
      ["002"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
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
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
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
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            24,
            46,
            80,
            40
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -80,
            50,
            24,
            46,
            80,
            50
          }
        }
      },
      ["005"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
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
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -80,
            50,
            -80,
            40,
            -13,
            28
          }
        }
      },
      ["006"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
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
      ["007"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
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
      ["008"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -80,
            50,
            80,
            25,
            80,
            50
          }
        }
      },
      ["009"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
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
      ["010"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
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
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
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
      ["012"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -80,
            50,
            80,
            0,
            80,
            50
          }
        }
      },
      ["013"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
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
      ["014"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            28,
            31,
            80,
            0
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -12,
            43,
            28,
            31
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -80,
            50,
            -12,
            43,
            80,
            50
          }
        }
      },
      ["015"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
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
      ["016"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -80,
            0,
            7,
            -25,
            80,
            -40
          }
        }
      },
      ["017"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            4,
            -47,
            80,
            -50,
            80,
            50,
            -80,
            50,
            -80,
            -40
          }
        }
      },
      ["018"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
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
            -25
          }
        }
      },
      ["019"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -79,
            50,
            -79,
            -25,
            80,
            -50
          }
        }
      },
      ["020"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
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
      ["021"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -80,
            0,
            -31,
            -28,
            20,
            -44,
            80,
            -50
          }
        }
      },
      ["022"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            7,
            35,
            -49,
            -18,
            -70,
            -50,
            80,
            -50,
            80,
            50
          }
        }
      },
      ["023"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -17,
            34,
            -65,
            4,
            -70,
            -50,
            80,
            -50,
            80,
            50
          }
        }
      },
      ["024"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            70,
            -50,
            69,
            29,
            -68,
            31,
            -70,
            -50
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -68,
            31,
            69,
            29
          }
        }
      },
      ["025"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            -50,
            80,
            50,
            -70,
            50,
            -70,
            -50
          }
        }
      },
      ["026"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -70,
            50,
            -65,
            -50,
            80,
            -50
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
            categoryBits = 2,
            maskBits = 21,
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
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
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
      ["029"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -70,
            -6,
            -70,
            -50,
            80,
            -50
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -70,
            -6,
            80,
            50,
            -80,
            50
          }
        }
      },
      ["030"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0.2,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
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
            categoryBits = 2,
            maskBits = 21,
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
      ["032"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            70,
            50,
            -80,
            50,
            -80,
            -50,
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            -50,
            80,
            -30,
            -80,
            -30,
            -80,
            -50
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -80,
            -34,
            -80,
            -50,
            -32,
            -50
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            0,
            80,
            15,
            -30,
            50,
            -80,
            50
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            -35,
            -80,
            15,
            -80,
            0,
            80,
            -50
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
            categoryBits = 2,
            maskBits = 21,
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
      ["038"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            78,
            36,
            60,
            50,
            62,
            35,
            77,
            24
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            60,
            50,
            42,
            47,
            62,
            35
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            42,
            47,
            60,
            50,
            23,
            50
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -15,
            -6,
            80,
            50,
            -70,
            50,
            -70,
            -6
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -15,
            -6,
            -15,
            -50,
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            17,
            -50,
            80,
            -17,
            80,
            50,
            -80,
            50,
            -80,
            -50
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            -17,
            80,
            50,
            -80,
            50,
            -80,
            -17
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -28,
            43,
            -52,
            7,
            -65,
            -50,
            80,
            -50,
            78,
            50
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -80,
            41,
            -80,
            -50,
            80,
            -50,
            80,
            42
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            -50,
            80,
            50,
            72,
            35,
            53,
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            -50,
            80,
            50,
            -70,
            50,
            -70,
            -50
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            5,
            25,
            33,
            0,
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            5,
            25,
            -13,
            30,
            -7,
            20
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -80,
            50,
            5,
            25,
            80,
            50
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -20,
            -19,
            -56,
            -7,
            -44,
            -31
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            80,
            50,
            -80,
            50,
            -56,
            -7,
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            16,
            -30,
            -11,
            -22,
            1,
            -33
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -56,
            -7,
            -80,
            50,
            -80,
            0
          }
        },
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -20,
            -19,
            16,
            -30,
            -56,
            -7
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
            categoryBits = 2,
            maskBits = 21,
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            1,
            50,
            -54,
            50,
            -41,
            40,
            -11,
            39
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
            categoryBits = 2,
            maskBits = 21,
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
      ["051"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -50,
            50,
            -47,
            32,
            -29,
            24,
            -8,
            25,
            0,
            50
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
            categoryBits = 2,
            maskBits = 21,
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -64,
            50,
            -43,
            17,
            -12,
            12,
            23,
            50
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
