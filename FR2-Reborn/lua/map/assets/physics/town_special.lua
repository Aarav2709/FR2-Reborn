local unpack = unpack
local pairs = pairs
local ipairs = ipairs
local M = {}

function M.physicsData(scale)
  local physics = {
    data = {
      cannon = {
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
          radius = 34
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
            -81,
            4,
            -70,
            -111,
            -79
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
            -81,
            156,
            -147,
            4,
            -70
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
            41,
            53,
            202,
            -62,
            74,
            53
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
