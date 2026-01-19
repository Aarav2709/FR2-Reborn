local unpack = unpack
local pairs = pairs
local ipairs = ipairs
local M = {}

function M.physicsData(scale)
  local physics = {
    data = {
      big_shroom1 = {
        {
          pe_fixture_id = "",
          density = 2,
          friction = 0,
          bounce = 0,
          isSensor = true,
          filter = {
            categoryBits = 1,
            maskBits = 65535,
            groupIndex = 0
          },
          shape = {
            3,
            -41,
            53,
            -34,
            79,
            -15,
            -71,
            -13,
            -50,
            -32
          }
        }
      },
      small_shroom1 = {
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
            16,
            -54,
            14,
            -36,
            -3,
            -9,
            -10,
            19,
            -11,
            44,
            -3
          }
        }
      },
      groundThorns1 = {
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
            -41,
            79,
            -11,
            -81,
            -11,
            -81,
            -41
          }
        }
      },
      roofThorns1 = {
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
            3,
            80,
            33,
            -80,
            33,
            -80,
            3
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
