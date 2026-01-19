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
            -50,
            50,
            -63,
            13,
            -36,
            -23,
            0,
            -38,
            35,
            -31,
            64,
            -7,
            45,
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
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            9,
            -46,
            9,
            -96,
            77,
            -81,
            124,
            -21
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
            9,
            -46,
            -119,
            2,
            -87,
            -53,
            9,
            -96
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
