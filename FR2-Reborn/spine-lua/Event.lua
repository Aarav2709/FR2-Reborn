local Event = {}

function Event.new(data)
  if not data then
    error("data cannot be nil", 2)
  end
  local self = {
    data = data,
    intValue = 0,
    floatValue = 0,
    stringValue = nil
  }
  return self
end

return Event
