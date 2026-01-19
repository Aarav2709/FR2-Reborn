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
          isSensor = true,
          filter = {
            categoryBits = 2,
            maskBits = 21,
            groupIndex = 0
          },
          shape = {
            30,
            -25,
            30,
            25,
            -30,
            25,
            -30,
            -25
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
