local unpack = unpack
local pairs = pairs
local ipairs = ipairs
local M = {}

function M.physicsData(scale)
  local physics = {
    data = {
      sawbladeLeft = {
        {
          pe_fixture_id = "",
          density = 2.5,
          friction = 1,
          bounce = 0.2,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            15,
            44,
            -19,
            47,
            -28,
            -34,
            31,
            -46
          }
        }
      },
      sawbladeRight = {
        {
          pe_fixture_id = "",
          density = 2.5,
          friction = 1,
          bounce = 0.2,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            15,
            -45,
            14,
            44,
            -10,
            41,
            -28,
            -39
          }
        }
      },
      eye = {
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
            16,
            -17,
            4,
            -14,
            -4,
            3,
            -18,
            20,
            -12,
            22,
            2,
            14,
            16
          }
        }
      },
      heart = {
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
            16.5,
            7,
            4.5,
            21,
            -11.5,
            12,
            -8.5,
            -14,
            13.5,
            -17
          }
        }
      },
      intestine1 = {
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
            9.25,
            6,
            -1,
            9.75,
            -16,
            0,
            4,
            -1,
            12,
            -1
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
            -16,
            0,
            -12,
            -10,
            4,
            -1
          }
        }
      },
      intestine2 = {
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
            8.5,
            6,
            -8.5,
            -1,
            4.5,
            -8,
            14.5,
            -3,
            15.5,
            7
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
            -8.5,
            -1,
            8.5,
            6,
            -13.5,
            7
          }
        }
      },
      lung = {
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
            11,
            -8.5,
            14,
            19.5,
            6,
            27.5,
            -15,
            24.5,
            -4,
            -20.5,
            8,
            -27.5
          }
        }
      },
      piece1 = {
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
            14.5,
            -17.5,
            32.5,
            1.5,
            28.25,
            20,
            5.5,
            21.5,
            -33.5,
            16.5
          }
        }
      },
      piece2 = {
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
            -23,
            -10,
            30,
            -6,
            31.25,
            7.5,
            -31,
            9
          }
        }
      },
      piece3 = {
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
            4.5,
            -11,
            1.5,
            -10,
            -5.5,
            11,
            -6.5
          }
        }
      },
      stomach = {
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
            -20.75,
            -8.75,
            -2,
            -2.5,
            -18,
            10.5,
            -31,
            7.5
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
            -2,
            -2.5,
            27,
            -21.5,
            32,
            -12.5,
            26,
            12.5,
            -2,
            20.5,
            -18,
            10.5
          }
        }
      },
      bone1 = {
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
            22,
            -26,
            29,
            -14,
            -12,
            27,
            -32,
            13
          }
        }
      },
      bone2 = {
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
            32,
            -23,
            42,
            -1,
            -30,
            23,
            -42,
            0
          }
        }
      },
      brain1 = {
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
            -10,
            -17,
            9,
            -20,
            17,
            12,
            4,
            22,
            -16,
            9
          }
        }
      },
      brain2 = {
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
            6.5,
            -16,
            22.5,
            -7,
            11.5,
            15,
            -11.5,
            13,
            -21.5,
            -11
          }
        }
      },
      brain3 = {
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
            -15.5,
            -4.5,
            23.5,
            -10.5,
            18.5,
            7.5,
            -10.5,
            10.5,
            -22.5,
            4.5
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
    -- Güvenli unpack - nil kontrolü
    if self.data[name] and type(self.data[name]) == "table" then
      return unpack(self.data[name])
    else
      print("WARNING: Physics data not found for: " .. tostring(name))
      return nil
    end
  end
  
  function physics:getFixtureId(name, index)
    return self.data[name][index].pe_fixture_id
  end
  
  return physics
end

return M
