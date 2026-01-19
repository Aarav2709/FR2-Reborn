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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            -139,
            25.5,
            -155,
            -40.5,
            155,
            -40.5,
            134,
            40.5
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            51.5,
            75,
            -61.5,
            78,
            -70.5,
            -83,
            78.5,
            -82
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            30,
            94,
            -30,
            96,
            -30,
            -94,
            32,
            -94
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            96,
            -30,
            95,
            32,
            -95,
            32,
            -96,
            -34
          }
        }
      },
      ["007"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          isSensor = true,
          filter = {
            categoryBits = 8,
            maskBits = 1,
            groupIndex = 0
          },
          shape = {
            6,
            49,
            -12,
            47,
            -25,
            0,
            6,
            -16
          }
        }
      },
      ["008"] = {},
      ["009"] = {},
      ["010"] = {},
      ["011"] = {},
      ["012"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          isSensor = true,
          filter = {
            categoryBits = 8,
            maskBits = 1,
            groupIndex = 0
          },
          shape = {
            25,
            35,
            39,
            48,
            -39,
            51,
            -17,
            22
          }
        }
      },
      ["013"] = {},
      ["003"] = {},
      ["004"] = {},
      ["014"] = {
        {
          pe_fixture_id = "1",
          density = 2,
          friction = 0,
          bounce = 0,
          isSensor = true,
          filter = {
            categoryBits = 8,
            maskBits = 1,
            groupIndex = 0
          },
          shape = {
            20,
            -3,
            41,
            -4,
            39,
            28,
            15,
            27
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
            -6,
            -63,
            11,
            -53,
            -105,
            -42,
            -106,
            -55
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
            11,
            -53,
            -6,
            -63,
            127,
            -114
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
            58,
            50,
            183,
            -54,
            89,
            49
          }
        }
      },
      ["015"] = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          isSensor = true,
          filter = {
            categoryBits = 8,
            maskBits = 1,
            groupIndex = 0
          },
          shape = {
            -59,
            120,
            -58,
            29,
            -19,
            69
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
            -27,
            -21,
            -14,
            -10,
            -202,
            8,
            -201,
            -16
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
            -14,
            -10,
            -27,
            -21,
            136,
            -91
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
            35,
            148,
            -4,
            151,
            212,
            -9
          }
        }
      },
      ["016"] = {
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
      ["017"] = {
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
      ["018"] = {
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
      ["019"] = {
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
      ["020"] = {},
      ["021"] = {
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
      ["022"] = {
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
      ["024"] = {
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
            80,
            -50,
            80,
            50
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
