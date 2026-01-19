local unpack = unpack
local pairs = pairs
local ipairs = ipairs
local M = {}

function M.physicsData(scale)
  local physics = {
    data = {
      ["2"] = {
        {
          pe_fixture_id = "",
          density = 100,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 53,
            groupIndex = 0
          },
          shape = {
            -160,
            -25,
            160,
            -25,
            160,
            25,
            -160,
            25
          }
        }
      },
      ["3"] = {
        {
          pe_fixture_id = "",
          density = 100,
          friction = 0,
          bounce = 0,
          filter = {
            categoryBits = 2,
            maskBits = 53,
            groupIndex = 0
          },
          shape = {
            -25,
            160,
            -25,
            -160,
            25,
            -160,
            25,
            160
          }
        }
      },
      ["1"] = {
        {
          pe_fixture_id = "",
          density = 3.2,
          friction = 0,
          bounce = 0,
          isSensor = true,
          filter = {
            categoryBits = 8,
            maskBits = 1,
            groupIndex = 0
          },
          shape = {
            -29.5,
            10,
            -64,
            36.5,
            -79,
            -10.5,
            -55.5,
            -38,
            -20.5,
            -29
          }
        },
        {
          pe_fixture_id = "",
          density = 3.2,
          friction = 0,
          bounce = 0,
          isSensor = true,
          filter = {
            categoryBits = 8,
            maskBits = 1,
            groupIndex = 0
          },
          shape = {
            -64,
            36.5,
            -29.5,
            10,
            -8.5,
            37
          }
        },
        {
          pe_fixture_id = "",
          density = 3.2,
          friction = 0,
          bounce = 0,
          isSensor = true,
          filter = {
            categoryBits = 8,
            maskBits = 1,
            groupIndex = 0
          },
          shape = {
            -55.5,
            -39,
            -55.5,
            -38,
            -79,
            -10.5
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
