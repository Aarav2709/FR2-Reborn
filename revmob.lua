function package.preload.json(...)
  local a = {}
  
  local e = string
  local l = math
  local f = table
  local i = error
  local u = tonumber
  local d = tostring
  local s = type
  local r = setmetatable
  local c = pairs
  local h = ipairs
  local o = assert
  local n = Chipmunk
  local n = {
    buffer = {}
  }
  
  function n:New()
    local e = {}
    r(e, self)
    self.__index = self
    e.buffer = {}
    return e
  end
  
  function n:Append(e)
    self.buffer[#self.buffer + 1] = e
  end
  
  function n:ToString()
    return f.concat(self.buffer)
  end
  
  local t = {
    backslashes = {
      ["\b"] = "\\b",
      ["\t"] = "\\t",
      ["\n"] = "\\n",
      ["\f"] = "\\f",
      ["\r"] = "\\r",
      ["\""] = "\\\"",
      ["\\"] = "\\\\",
      ["/"] = "\\/"
    }
  }
  
  function t:New()
    local e = {}
    e.writer = n:New()
    r(e, self)
    self.__index = self
    return e
  end
  
  function t:Append(e)
    self.writer:Append(e)
  end
  
  function t:ToString()
    return self.writer:ToString()
  end
  
  function t:Write(e)
    local n = s(e)
    if n == "nil" then
      self:WriteNil()
    elseif n == "boolean" then
      self:WriteString(e)
    elseif n == "number" then
      self:WriteString(e)
    elseif n == "string" then
      self:ParseString(e)
    elseif n == "table" then
      self:WriteTable(e)
    elseif n == "function" then
      self:WriteFunction(e)
    elseif n == "thread" then
      self:WriteError(e)
    elseif n == "userdata" then
      self:WriteError(e)
    end
  end
  
  function t:WriteNil()
    self:Append("null")
  end
  
  function t:WriteString(e)
    self:Append(d(e))
  end
  
  function t:ParseString(n)
    self:Append("\"")
    self:Append(e.gsub(n, "[%z%c\\\"/]", function(n)
      local t = self.backslashes[n]
      if t then
        return t
      end
      return e.format("\\u%.4X", e.byte(n))
    end))
    self:Append("\"")
  end
  
  function t:IsArray(t)
    local n = 0
    
    local function i(e)
      if s(e) == "number" and 0 < e and l.floor(e) == e then
        return true
      end
      return false
    end
    
    for e, t in c(t) do
      if not i(e) then
        return false, "{", "}"
      else
        n = l.max(n, e)
      end
    end
    return true, "[", "]", n
  end
  
  function t:WriteTable(e)
    local o, n, i, t = self:IsArray(e)
    self:Append(n)
    if o then
      for n = 1, t do
        self:Write(e[n])
        if n < t then
          self:Append(",")
        end
      end
    else
      local n = true
      for e, t in c(e) do
        if not n then
          self:Append(",")
        end
        n = false
        self:ParseString(e)
        self:Append(":")
        self:Write(t)
      end
    end
    self:Append(i)
  end
  
  function t:WriteError(n)
    i(e.format("Encoding of %s unsupported", d(n)))
  end
  
  function t:WriteFunction(e)
    if e == Null then
      self:WriteNil()
    else
      self:WriteError(e)
    end
  end
  
  local l = {s = "", i = 0}
  
  function l:New(n)
    local e = {}
    r(e, self)
    self.__index = self
    e.s = n or e.s
    return e
  end
  
  function l:Peek()
    local n = self.i + 1
    if n <= #self.s then
      return e.sub(self.s, n, n)
    end
    return nil
  end
  
  function l:Next()
    self.i = self.i + 1
    if self.i <= #self.s then
      return e.sub(self.s, self.i, self.i)
    end
    return nil
  end
  
  function l:All()
    return self.s
  end
  
  local n = {
    escapes = {
      t = "\t",
      n = "\n",
      f = "\f",
      r = "\r",
      b = "\b"
    }
  }
  
  function n:New(n)
    local e = {}
    e.reader = l:New(n)
    r(e, self)
    self.__index = self
    return e
  end
  
  function n:Read()
    self:SkipWhiteSpace()
    local n = self:Peek()
    if n == nil then
      i(e.format("Nil string: '%s'", self:All()))
    elseif n == "{" then
      return self:ReadObject()
    elseif n == "[" then
      return self:ReadArray()
    elseif n == "\"" then
      return self:ReadString()
    elseif e.find(n, "[%+%-%d]") then
      return self:ReadNumber()
    elseif n == "t" then
      return self:ReadTrue()
    elseif n == "f" then
      return self:ReadFalse()
    elseif n == "n" then
      return self:ReadNull()
    elseif n == "/" then
      self:ReadComment()
      return self:Read()
    else
      i(e.format("Invalid input: '%s'", self:All()))
    end
  end
  
  function n:ReadTrue()
    self:TestReservedWord({
      "t",
      "r",
      "u",
      "e"
    })
    return true
  end
  
  function n:ReadFalse()
    self:TestReservedWord({
      "f",
      "a",
      "l",
      "s",
      "e"
    })
    return false
  end
  
  function n:ReadNull()
    self:TestReservedWord({
      "n",
      "u",
      "l",
      "l"
    })
    return nil
  end
  
  function n:TestReservedWord(n)
    for o, t in h(n) do
      if self:Next() ~= t then
        i(e.format("Error reading '%s': %s", f.concat(n), self:All()))
      end
    end
  end
  
  function n:ReadNumber()
    local n = self:Next()
    local t = self:Peek()
    while t ~= nil and e.find(t, "[%+%-%d%.eE]") do
      n = n .. self:Next()
      t = self:Peek()
    end
    n = u(n)
    if n == nil then
      i(e.format("Invalid number: '%s'", n))
    else
      return n
    end
  end
  
  function n:ReadString()
    local n = ""
    o(self:Next() == "\"")
    while self:Peek() ~= "\"" do
      local e = self:Next()
      if e == "\\" then
        e = self:Next()
        if self.escapes[e] then
          e = self.escapes[e]
        end
      end
      n = n .. e
    end
    o(self:Next() == "\"")
    
    local function t(n)
      return e.char(u(n, 16))
    end
    
    return e.gsub(n, "u%x%x(%x%x)", t)
  end
  
  function n:ReadComment()
    o(self:Next() == "/")
    local n = self:Next()
    if n == "/" then
      self:ReadSingleLineComment()
    elseif n == "*" then
      self:ReadBlockComment()
    else
      i(e.format("Invalid comment: %s", self:All()))
    end
  end
  
  function n:ReadBlockComment()
    local n = false
    while not n do
      local t = self:Next()
      if t == "*" and self:Peek() == "/" then
        n = true
      end
      if not n and t == "/" and self:Peek() == "*" then
        i(e.format("Invalid comment: %s, '/*' illegal.", self:All()))
      end
    end
    self:Next()
  end
  
  function n:ReadSingleLineComment()
    local e = self:Next()
    while e ~= "\r" and e ~= "\n" do
      e = self:Next()
    end
  end
  
  function n:ReadArray()
    local t = {}
    o(self:Next() == "[")
    local n = false
    if self:Peek() == "]" then
      n = true
    end
    while not n do
      local o = self:Read()
      t[#t + 1] = o
      self:SkipWhiteSpace()
      if self:Peek() == "]" then
        n = true
      end
      if not n then
        local n = self:Next()
        if n ~= "," then
          i(e.format("Invalid array: '%s' due to: '%s'", self:All(), n))
        end
      end
    end
    o("]" == self:Next())
    return t
  end
  
  function n:ReadObject()
    local l = {}
    o(self:Next() == "{")
    local t = false
    if self:Peek() == "}" then
      t = true
    end
    while not t do
      local o = self:Read()
      if s(o) ~= "string" then
        i(e.format("Invalid non-string object key: %s", o))
      end
      self:SkipWhiteSpace()
      local n = self:Next()
      if n ~= ":" then
        i(e.format("Invalid object: '%s' due to: '%s'", self:All(), n))
      end
      self:SkipWhiteSpace()
      local r = self:Read()
      l[o] = r
      self:SkipWhiteSpace()
      if self:Peek() == "}" then
        t = true
      end
      if not t then
        n = self:Next()
        if n ~= "," then
          i(e.format("Invalid array: '%s' near: '%s'", self:All(), n))
        end
      end
    end
    o(self:Next() == "}")
    return l
  end
  
  function n:SkipWhiteSpace()
    local n = self:Peek()
    while n ~= nil and e.find(n, "[%s/]") do
      if n == "/" then
        self:ReadComment()
      else
        self:Next()
      end
      n = self:Peek()
    end
  end
  
  function n:Peek()
    return self.reader:Peek()
  end
  
  function n:Next()
    return self.reader:Next()
  end
  
  function n:All()
    return self.reader:All()
  end
  
  function encode(n)
    local e = t:New()
    e:Write(n)
    return e:ToString()
  end
  
  function decode(e)
    local e = n:New(e)
    return e:Read()
  end
  
  function Null()
    return Null
  end
  
  a.encode = encode
  a.decode = decode
  return a
end

function package.preload.revmob_messages(...)
  local e = {
    NO_ADS = "No ads for this device/country right now, or your App ID is paused.",
    APP_IDLING = "Is your ad unit paused? Please, check it in the RevMob Console.",
    NO_SESSION = "The method RevMob.startSession(REVMOB_IDS) has not been called.",
    UNKNOWN_REASON = "Ad was not received because a timeout or for an unknown reason: ",
    UNKNOWN_REASON_CORONA = "Ad was not received for an unknown reason. Is your internet connection working properly? It also may be a timeout or a temporary issue in the server. Please, try again later. If this error persist, please contact us for more details.",
    INVALID_DEVICE_ID = "Device requirements not met.",
    INVALID_APPID = "App not recognized due to invalid App ID.",
    INVALID_PLACEMENTID = "No ads because you type an invalid Placement ID.",
    OPEN_MARKET = "Opening market",
    AD_NOT_LOADED = "Ad is not loaded yet to be shown. It will appear as soon as the ad is loaded."
  }
  return e
end

function package.preload.revmob_events(...)
  local e = {
    SESSION_IS_STARTED = "sessionIsStarted",
    SESSION_NOT_STARTED = "sessionNotStarted",
    AD_RECEIVED = "adReceived",
    AD_NOT_RECEIVED = "adNotReceived",
    AD_DISPLAYED = "adDisplayed",
    AD_CLICKED = "adClicked",
    AD_CLOSED = "adClosed",
    INSTALL_RECEIVED = "installReceived",
    INSTALL_NOT_RECEIVED = "installNotReceived",
    UNKNOWN_ERROR = "unknownError"
  }
  return e
end

function package.preload.revmob_about(...)
  local e = {VERSION = "5.5.2", DEBUG = false}
  
  local function n()
    if "Android" == system.getInfo("platformName") then
      return "corona-android"
    elseif "iPhone OS" == system.getInfo("platformName") then
      return "corona-ios"
    else
      return "corona"
    end
  end
  
  e.NAME = n()
  return e
end

function package.preload.revmob_log(...)
  local e
  e = {
    NONE = 0,
    RELEASE = 1,
    INFO = 2,
    DEBUG = 3,
    level = 2,
    setLevel = function(n)
      assert(type(n) == "number", "level expects a number")
      assert(n >= e.NONE and n <= e.INFO)
      e.level = n
    end,
    release = function(n)
      if e.level >= e.RELEASE then
        print("[RevMob] " .. tostring(n))
        io.output():flush()
      end
    end,
    info = function(n)
      if e.level >= e.INFO then
        print("[RevMob] " .. tostring(n))
        io.output():flush()
      end
    end,
    debug = function(n)
      if e.level >= e.DEBUG then
        print("[RevMob Debug] " .. tostring(n))
        io.output():flush()
      end
    end,
    infoTable = function(n)
      if e.level >= e.INFO then
        for n, t in pairs(n) do
          e.info(tostring(n) .. ": " .. tostring(t))
        end
      end
    end,
    debugTable = function(n)
      if e.level >= e.DEBUG then
        for t, n in pairs(n) do
          e.debug(tostring(t) .. ": " .. tostring(n))
        end
      end
    end
  }
  return e
end

function package.preload.revmob_utils(...)
  require("revmob_about")
  local o = "iVBORw0KGgoAAAANSUhEUgAAAC0AAAAtCAYAAAA6GuKaAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NzI4ODhBRTUxMkQ1MTFFMDhCQ0U5MUVBRTRGOTNDMTYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NzI4ODhBRTYxMkQ1MTFFMDhCQ0U5MUVBRTRGOTNDMTYiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo3Mjg4OEFFMzEyRDUxMUUwOEJDRTkxRUFFNEY5M0MxNiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo3Mjg4OEFFNDEyRDUxMUUwOEJDRTkxRUFFNEY5M0MxNiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PkdRyywAAAkxSURBVHjazFlpaFRLFr63b3c63SbptNm3p2gQYxTxx5hxCc8fSkSDxCU6KCIqKIqCf95D9IfrICgMgoKOogju+4IrUeMPn6AoGkEjLoMxq4lJTKc7nV7vnHOpCqcr1Uvm5cEUfNzu6tv3fPfUqbOVqiQ+VHI1Sa78s0ruxaEThBl0yVUh14SIJHIPJaiRKwWfE0mHGLmQgDC58heIS15NgLBI1MxgkVw1QlolGuYkA4Cg5BqUvIA+VNJUu5wwJ5vEYCXgc/weEyEdJsT8DD4CPsfvCREzkmpdTUC7GiGbzEjaBCQT8maiba7lICHbD/AK4PN+Qjyq1tU4hPmyWxkxO2AEIIVc+Vwyg0VCOsBIITyAPoCbfXaTuX72AgFB6xHEZaRl2rUxgggHII1cUzn5srIyR15enrWoqMjMSTc2NgZbW1t9z58/7yFkewEuQA+7uticm2lepnUpaaphCyE8ghFDkukAJ2AkQ3p1dXXuggULUisqKixZWVlRd3RHR4fy4MGDwK1bt3ovX77cBlM/AV0M3ex7DyPvEYgHqWtUBbOghG2McBohmgFAZplVVVWFO3fudE6ePHngxZ8+fZrS3Nyc9PXrVyufGz16tK+goMA/c+ZMN5+rq6vT4b/dN27caIKvPwj4C7gYcS8jHiDa1lXBLMwCYQchmw3IcTgceRcvXhwFmsV7UXtpoLksuGY2NTXZomm6sLDQC//5ASvTAVcX+29w2bJlDT09Pa3wtR3wHdDJyPcQjfuIqeh04/FNlywQRs3mIiZMmDAKljd/7Nix6sePH5MPHjyYd+TIkVHKEMeGDRsatmzZ0jpu3Lj+L1++6GBeLe/fv2+An9oYOiTEA8RMDNJm5gXQDAoBJYAZgCqUAdgDhM90dXXV6rpee+nSpTew4bxCiB4S8P/4HHwePhefj3KYvComv4TxcTJ+xgbXBC1b2Y9pVMsjR44shKX8BbyCevTo0ex169aVwpJalD8x3G63+ebNm9mweb3l5eWeOXPmpJ47dy7o9XoDTKsBIWJymw6L7s3O3Bd6iUy0YUD+hQsXimfMmKGBaaSvWbOm1O/3m5RhGKFQSK2pqcmYOHGiCzZq/6RJk9KAeB+JkrJoaXgQCyOKG60Y8DdAJWA94J/gJa7iEoJH+CMnJ6f/z5hENOBzP3/+/AzloDyUy+RXMj7FjB/ytIgujgcPw1tompZ3/vz5otzcXHXbtm2/PHnyJEP5C4bH4zEHAoHw/Pnzf5aUlCQfP37cAy/gJZ7DT6OkRpIdGzENg/SKFSvGwE63oVuD3V4iEwjLqmzfvl3Jz89XXr16pcS6JzMzU3nz5o30npcvX6ZPmzatC8zQ/+nTJ/Pbt295BPUK4R1NxLDjLLYEf2c7dzPgX7dv336IS7Zy5cpG2bLCSuidnZ06H3v37h10D7gz3efzDdwzderUqGaCclAeykX5jEcV41XMeCJfQ7voh8cDygH/APwOhP7d19dnuLjU1FS/TEhSUpLe29ur00GJi4TjkUY5KA/lonzkwfiUM37IM8UkBJeBXHn69OlpNptNefToURoQk7o38CLK+vXr0QsMzKEZ7Nu3TwHCCkRKBV5s4DcIRMqLFy+i2jbKQXkoF+VLcnUjezQJiT6HZfz48UZIfvfunS3WJgIXpaxevTqC+NatW5Vr165FED527JiycePGuJuSywP5dlIV0YrIJBamA+QzMjKM3KK9vT1uEDl9+vQg4rC8ERrGFUlkcHkgn9adFKopWhFgtVpVZgIJBRIkfvjw4UHzr1+/TkjDfEBENN7WbrerQoU/MERCA6U+biCcgCUOJyJs4cKFmAgNmp8yZYph44kOsGdjuWAz6tHKLZPQj+AIgSsz/pydnR2IJ2jJkiUKhPoIGwYvEGHjiRLn8pj8kISbbiJvEyJFaODDhw/o2JXS0lJvPA2fPXs2gjCayapVqwZtTnCHcUlzeUx+QFJyhaP6abDpuH5aDC44Dh06RIOFHgwGI36HpCghP43yY/npMNUwL/HBpj2PHz82VAVJzPcYmVqEhjdv3hzTq9DP4uByUC7IpyE8ojrXiB8Uq2+7yWRyLFq0yAY7OXjmzJk8UQjaLdSFBpETJ04ou3fvHkQEcggjoID2lAMHDiiQdEUlvX///s/FxcW+PXv29MD/eP3YLalgjKiDmV0BmhTgV7Ykv8HyH4EE5zEuGST+DX9FWsqBz0c5KA/lonzG41fGq4DxtGqS1peFVzHwkCQo/VOWLl1qg3KoDwrabEwjhzs1hXzaB+noJwgowU2bNnVDVGxkhW4n07KbVOZBTdINjSBfX19vgiQno6ysTIeC1nP9+vVsrDiGizDGgVOnTr3HFgNW55C7/IdV5dGK25Am9JRVoWVrNBTv37+vgmtLx5IIa7o7d+5kDRdp2Lz14GU6obrX582b1wARsZWR/sEaOG6WV/OyK6wJgUaWh5jgQSrsaG358uVpWISOGTPGXVtb64Qdrv2vZB0ORwCSqPq1a9d2dHd3KxUVFS3fvn1rYi0E3rjplbUQNEn3XpUBbDsMaaMZSqJUIN4HqWcH+OAwVCuOoRKGTfcNbPjj7NmzXc3NzQo8s7Wuro73PWS27KOtMVmHiXdIU0grIZN3mIqKivJPnjxZBAKNDXn37l0HpKGZ9+7dy2ppaUmOsdn6KysrO8CF/gAzQELKw4cPg1DdN8JoYSbRTrTsYqSlHaZYvbwU1nx0EvJGL2/x4sUFu3btSoewO5B0gQ9OBQJJQD4JszVMfqB29MOL+mfNmtVLcubwjh07fl69erWZkewQenm9gscI0NxD1jU1C4GGtnidBPgSzurq6hzYpKlz5861OJ3OqCaBdltTUxO8cuWKCyqa74wcJ9lNgoibaDhm1zRef9pOWr60N81h9KexRCooKLDm5uaaQcsaaDvU1tYWBLv1PXv2zEX60y6CHtKfps31hPrT8U4CbIy8nWh/BIOd/W6NcRLgY8vdx8h5iFb7SLtgyCcB0c5cLORwKJnkJ7IzF056IEcifbl+yZlLv6QpM6QzFxlxVRLih3q6xYlHO90KCNrVYx3NJXKOaBJsXZOcH4pVs4w0TX/Fc8SQJNEf8jlirBNbWZKlCQek4oltWDihFc8LQ8N5Yvt/eTb+XwEGABl3a+vdZVAJAAAAAElFTkSuQmCC"
  local l = "close.png"
  
  local function r(i, e)
    local t = system.pathForFile(e, system.TemporaryDirectory)
    local e = require("ltn12")
    local n = require("mime")
    e.pump.all(e.source.string(i), e.sink.chain(n.decode("base64"), e.sink.file(io.open(t, "w"))))
  end
  
  local function i(t, e, n)
    timer.performWithDelay(1, function()
      display.loadRemoteImage(t, "GET", e, n, system.TemporaryDirectory)
    end)
  end
  
  local n
  n = {
    left = function()
      return display.screenOriginX
    end,
    top = function()
      return display.screenOriginY
    end,
    right = function()
      return display.viewableContentWidth - display.screenOriginX
    end,
    bottom = function()
      return display.viewableContentHeight - display.screenOriginY
    end,
    width = function()
      return n.right() - n.left()
    end,
    height = function()
      return n.bottom() - n.top()
    end
  }
  local e = {}
  e.loadAsset = i
  e.Screen = n
  e.CLOSE_BUTTON = o
  e.CLOSE_BUTTON_IMAGE = l
  e.createImageFromBase64 = r
  e.fileExists = fileExists
  return e
end

function package.preload.revmob_context(...)
  local s = require("json")
  local o = require("revmob_about")
  local e = require("revmob_log")
  local t = require("revmob_device")
  local a = require("revmob_cache")
  local n
  n = {
    social = {},
    setUserLocationLatitude = function(t)
      if type(t) == "number" then
        n.social.latitude = t
      else
        e.release("Invalid userLocationLatitude")
      end
    end,
    setUserLocationLongitude = function(t)
      if type(t) == "number" then
        n.social.longitude = t
      else
        e.release("Invalid userLocationLongitude")
      end
    end,
    setUserLocationAccuracy = function(t)
      if type(t) == "number" then
        n.social.accuracy = t
      else
        e.release("Invalid userLocationAccuracy")
      end
    end,
    setUserGender = function(t)
      if t ~= nil and (t == "male" or t == "female") then
        n.social.gender = t
      else
        e.release("Invalid userGender")
      end
    end,
    getUserGender = function()
      return n.social.gender
    end,
    setUserAgeRangeMin = function(t)
      if type(t) == "number" and 0 < t then
        n.social.age_range_min = t
      else
        e.release("Invalid userAgeRangeMin")
      end
    end,
    getUserAgeRangeMin = function()
      return n.social.age_range_min
    end,
    setUserAgeRangeMax = function(t)
      if type(t) == "number" and 0 < t then
        n.social.age_range_max = t
      else
        e.release("Invalid userAgeRangeMax")
      end
    end,
    getUserAgeRangeMax = function()
      return n.social.age_range_max
    end,
    setUserBirthday = function(t)
      if type(t) == "string" then
        n.social.birthday = t
      else
        e.release("Invalid userAgeRangeMax")
      end
    end,
    getUserBirthday = function()
      return n.social.birthday
    end,
    setUserPage = function(t)
      if type(t) == "string" then
        n.social.user_page = t
      else
        e.release("Invalid userPage")
      end
    end,
    getUserPage = function()
      return n.social.user_page
    end,
    setUserInterests = function(t)
      if type(t) == "table" then
        n.social.interests = t
      else
        e.release("Invalid user interests")
      end
    end,
    getUserInterests = function()
      return n.social.interests
    end,
    socialPayload = function()
      if type(n.social) == "table" then
        return n.social
      end
      return nil
    end,
    sdkPayload = function(e)
      local n = {
        name = o.NAME,
        version = o.VERSION
      }
      if e then
        n.testing_mode = e
      end
      return n
    end,
    devicePayload = function()
      return t:new()
    end,
    appPayload = function(e)
      local n = a.isInstallRegistered(e)
      if e ~= nil and not n then
        return {install_not_registered = true}
      end
      return nil
    end,
    payload = function(r, t)
      local e = {
        device = n.devicePayload(),
        sdk = n.sdkPayload(t)
      }
      local i = n.socialPayload()
      if next(i) ~= nil then
        local t = 13
        if n.social.age_range_min > 0 and not (t > n.social.age_range_max) then
          local o = string.sub(n.social.birthday, 1, 4)
          local l = string.sub(n.social.birthday, 6, 7)
          local n = string.sub(n.social.birthday, 9, 10)
          local n = os.time({
            year = o + t,
            month = l,
            day = n,
            hour = 0,
            min = 0
          })
          local t = os.time()
          if not (n > t) then
            e.social = i
          end
        end
      end
      if t ~= nil then
        e.testing = {response = t}
      end
      local n = n.appPayload(r)
      if n ~= nil then
        e.app = n
      end
      return e
    end,
    payloadAsJsonString = function(e, t)
      return s.encode(n.payload(e, t))
    end,
    printEnvironmentInformation = function(r, i, l, u)
      e.debug("==============================================")
      e.debug(n.payloadAsJsonString(i, l))
      local d, c, s
      if t.getSessionStarted() then
        d = system.getInfo("iosAdvertisingIdentifier")
        c = system.getInfo("iosIdentifierForVendor")
        s = system.getInfo("iosAdvertisingTrackingEnabled")
      end
      local l, n
      if r ~= nil then
        l = tostring(r[REVMOB_ID_IOS])
        n = tostring(r[REVMOB_ID_ANDROID])
      end
      e.release("==============================================")
      e.release("RevMob Corona SDK: " .. o.NAME .. " - " .. o.VERSION)
      e.release("App ID in the current session: " .. tostring(i))
      if l ~= nil then
        e.release("Publisher App ID for iOS: " .. l)
      end
      if n ~= nil then
        e.release("Publisher App ID for Android: " .. n)
      end
      e.release("IP Address: " .. tostring(t.getIpAddress()))
      e.release("Device name: " .. system.getInfo("name"))
      e.release("Model name: " .. system.getInfo("model"))
      e.release("Device ID: " .. system.getInfo("deviceID"))
      e.release("IDFA (iOS only): " .. tostring(d))
      e.release("IDFV (iOS only): " .. tostring(c))
      e.release("Limit ad tracking (iOS only): " .. tostring(s))
      e.release("Environment: " .. system.getInfo("environment"))
      e.release("Platform name: " .. system.getInfo("platformName"))
      e.release("Platform version: " .. system.getInfo("platformVersion"))
      e.release("Corona version: " .. system.getInfo("version"))
      e.release("Corona build: " .. system.getInfo("build"))
      e.release("Architecture: " .. system.getInfo("architectureInfo"))
      e.release("Locale-Country: " .. system.getPreference("locale", "country"))
      e.release("Locale-Language: " .. system.getPreference("locale", "language"))
      e.release("Timeout: " .. tostring(u) .. "s")
      e.release("Corona Simulator: " .. tostring(t.isSimulator()))
      e.release("iOS Simulator: " .. tostring(t.isXcodeSimulator()))
      if i ~= nil then
        e.release("Installed in this device: " .. tostring(a.isInstallRegistered(i)))
      end
    end
  }
  return n
end

function package.preload.revmob_device(...)
  local t = require("revmob_log")
  local r = {
    android_id = "9774d5f368157442"
  }
  local o = {
    udid = "4c6dbc5d000387f3679a53d76f6944211a7f2224"
  }
  local l = o
  local n = false
  local i = {
    wifi = nil,
    wwan = nil,
    hasInternetConnection = function()
      return not network.canDetectNetworkStatusChanges or RevMobConnection.wifi or RevMobConnection.wwan
    end
  }
  
  local function a(e)
    if e.isReachable then
      t.info("Internet connection available.")
    else
      t.release("Could not connect to RevMob site. No ads will be available.")
    end
    i.wwan = e.isReachableViaCellular
    i.wifi = e.isReachableViaWiFi
    t.debug("IsReachableViaCellular: " .. tostring(e.isReachableViaCellular))
    t.debug("IsReachableViaWiFi: " .. tostring(e.isReachableViaWiFi))
  end
  
  if network.canDetectNetworkStatusChanges and not n then
    network.setStatusListener("revmob.com", a)
    n = true
    t.debug("Listening network reachability.")
  end
  local e
  e = {
    identities = nil,
    country = nil,
    manufacturer = nil,
    model = nil,
    os_version = nil,
    connection_speed = nil,
    sessionStarted = false,
    new = function(t, n)
      n = n or {}
      setmetatable(n, t)
      t.__index = t
      n.identities = e.buildDeviceIdentifierAsTable()
      n.country = system.getPreference("locale", "country")
      n.locale = system.getPreference("locale", "language")
      n.manufacturer = e.getManufacturer()
      n.model = e.getModel()
      n.os_version = system.getInfo("platformVersion")
      if i.wifi then
        n.connection_speed = "wifi"
      elseif i.wwan then
        n.connection_speed = "wwan"
      else
        n.connection_speed = "other"
      end
      return n
    end,
    setSessionStarted = function(n)
      e.sessionStarted = n
    end,
    getSessionStarted = function()
      return e.sessionStarted
    end,
    setIpAddress = function(n)
      e.ipAddress = n
    end,
    getIpAddress = function()
      return e.ipAddress
    end,
    isAndroid = function()
      return "Android" == system.getInfo("platformName")
    end,
    isIOS = function()
      return "iPhone OS" == system.getInfo("platformName")
    end,
    isIPad = function()
      return e.isIOS() and "iPad" == system.getInfo("model")
    end,
    isSimulator = function()
      return e.isCoronaSimulator() or e.isXcodeSimulator()
    end,
    isXcodeSimulator = function()
      return system.getInfo("model") == "iPhone Simulator" or system.getInfo("model") == "iPad Simulator"
    end,
    isCoronaSimulator = function()
      return "simulator" == system.getInfo("environment") or "Mac OS X" == system.getInfo("platformName") or "Win" == system.getInfo("platformName")
    end,
    isIosCoronaSimulator = function()
      return e.isCoronaSimulator() and system.getInfo("model") == "iPhone" or system.getInfo("model") == "iPad"
    end,
    isAndroidCoronaSimulator = function()
      return e.isCoronaSimulator() and not e.isIosCoronaSimulator()
    end,
    getDeviceId = function()
      local e = system.getInfo("deviceID")
      e = string.gsub(e, "-", "")
      e = string.lower(e)
      return e
    end,
    coronaBuild = function()
      return tonumber(system.getInfo("build"):match("[.](.-)$"))
    end,
    buildDeviceIdentifierAsTable = function()
      local n = e.getDeviceId()
      local i = e.coronaBuild()
      if e.isIOS() and e.sessionStarted then
        if 1063 <= i then
          if 1095 <= i then
            local e = system.getInfo("iosAdvertisingIdentifier")
            local t = system.getInfo("iosIdentifierForVendor")
            return {
              mac_address_md5_corona = n,
              identifier_for_advertising = e,
              identifier_for_vendor = t
            }
          else
            return {mac_address_md5_corona = n}
          end
        elseif string.len(n) == 40 then
          return {udid = n}
        end
      elseif e.isAndroid() then
        if string.len(n) == 14 or string.len(n) == 15 or string.len(n) == 17 or string.len(n) == 18 then
          return {mobile_id = n}
        elseif string.len(n) == 16 then
          return {android_id = n}
        end
      elseif e.isXcodeSimulator() or e.isIosCoronaSimulator() then
        return o
      elseif e.isAndroidCoronaSimulator() then
        return r
      elseif e.isSimulator() then
        return l
      end
      t.info("WARNING: device not identified, no registration or ad unit will work: " .. n)
      return nil
    end,
    getManufacturer = function()
      local e = system.getInfo("platformName")
      if e == "iPhone OS" then
        return "Apple"
      end
      return e
    end,
    getModel = function()
      local e = e.getManufacturer()
      if e == "Apple" then
        return system.getInfo("architectureInfo")
      end
      return system.getInfo("model")
    end,
    setSimulatorIOS = function()
      if e.isSimulator() then
        l = o
      end
    end,
    setSimulatorAndroid = function()
      if e.isSimulator() then
        l = r
      end
    end
  }
  return e
end

function package.preload.revmob_client(...)
  local h = require("json")
  local g = require("socket.http")
  local a = require("ltn12")
  local e = require("revmob_about")
  local n = require("revmob_log")
  local t = require("revmob_messages")
  local o = require("revmob_events")
  local u = require("revmob_context")
  local m = require("revmob_cache")
  local i = require("revmob_device")
  local d = require("revmob_utils")
  REVMOB_ID_IOS = "iPhone OS"
  REVMOB_ID_ANDROID = "Android"
  local e
  local v = 30
  local p = "https://ios.revmob.com"
  local c = "https://android.revmob.com"
  local L = "app"
  local D = false
  local k = true
  local E = "Download a FREE game!"
  local A = 10
  local f = true
  local s = 0
  local l
  
  local function r()
    if "Android" == system.getInfo("platformName") then
      return c
    else
      return p
    end
  end
  
  local function y(e)
    if e.phase == "ended" and l ~= nil then
      l:removeSelf()
      l = nil
    end
    return true
  end
  
  local function p(o, t, i, n)
    if n == nil then
      local n
      key = "fetch_" .. t
      local e = e.serverEndPoints[key]
      if e ~= nil then
        return e
      end
      return r() .. "/api/v4/mobile_apps/" .. o .. "/" .. i .. "/fetch.json"
    else
      local t = "fetch_" .. t .. "_with_placement"
      local e = e.serverEndPoints[t]
      if e ~= nil then
        e = string.gsub(e, "PLACEMENT_ID", n)
        return e
      end
      return r() .. "/api/v4/mobile_apps/" .. o .. "/placements/" .. n .. "/" .. i .. "/fetch.json"
    end
  end
  
  local function I(n)
    local e = e.serverEndPoints.install
    if e ~= nil then
      return e
    else
      return r() .. "/api/v4/mobile_apps/" .. n .. "/install.json"
    end
  end
  
  local function _(e)
    return r() .. "/api/v4/mobile_apps/" .. e .. "/sessions.json"
  end
  
  local function c(o, t)
    local i = u.payloadAsJsonString(e.appId, e.testMode)
    if e.testMode ~= nil then
      n.release("TESTING MODE ACTIVE: " .. tostring(e.testMode))
    end
    n.debug("Request url:  " .. o)
    n.debug("Request body: " .. i)
    t = t or function(e)
      n.debugTable(e)
    end
    local n = {}
    n.body = i
    n.headers = {
      ["Content-Type"] = "application/json"
    }
    n.timeout = e.timeout
    network.request(o, "POST", t, n)
  end
  
  local function b(e)
    return e and string.len(e) == 24
  end
  
  local function w(n)
    if n == nil then
      return nil
    end
    local e
    if i.isAndroid() or i.isAndroidCoronaSimulator() then
      e = n[REVMOB_ID_ANDROID]
    elseif i.isIOS() or i.isXcodeSimulator() or i.isIosCoronaSimulator() then
      e = n[REVMOB_ID_IOS]
    end
    if e == nil then
      e = n[REVMOB_ID_IOS]
      if not b(e) then
        e = n[REVMOB_ID_ANDROID]
        i.setSimulatorAndroid()
      else
        i.setSimulatorIOS()
      end
    end
    return e
  end
  
  local function S()
    local n = function(t)
      n.debugTable(t)
      local t = t.status or t.statusCode
      if t == 200 then
        m.saveInstallWasRegistered(e.appId)
        n.release("Install received.")
        if listener ~= nil then
          listener.notifyAdListener({
            type = o.INSTALL_RECEIVED
          })
        end
      else
        n.info("Install not received: " .. tostring(t))
        if listener ~= nil then
          listener.notifyAdListener({
            type = o.INSTALL_NOT_RECEIVED
          })
        end
      end
    end
    c(I(e.appId), n)
  end
  
  local function r(r, a, i, l)
    local i = w(i)
    if e.sessionStarted then
      if i ~= nil then
        n.info("Ad registered with Placement ID " .. i)
      end
      c(p(e.appId, r, a, i), l)
    else
      n.release(t.NO_SESSION)
      local e = {
        type = o.AD_NOT_RECEIVED,
        ad = adUnit,
        reason = t.NO_SESSION,
        error = t.NO_SESSION
      }
      local e = {
        statusCode = 0,
        status = 0,
        response = e,
        headers = {}
      }
    end
  end
  
  function string.starts(n, e)
    return string.sub(n, 1, string.len(e)) == e
  end
  
  function string.ends(n, e)
    return e == "" or string.sub(n, -string.len(e)) == e
  end
  
  local u
  
  local function p(n)
    local t = {}
    local e = ""
    local i, e, t = g.request({
      method = "POST",
      url = n,
      source = a.source.string(e),
      headers = {
        ["Content-Length"] = tostring(#e),
        ["Content-Type"] = "application/json"
      },
      sink = a.sink.table(t)
    })
    return u(n, e, t)
  end
  
  function u(n, t, i)
    if type(t) == "number" and 300 <= t and t <= 308 then
      if string.starts(n, "http://itunes.apple.com") or string.starts(n, "https://itunes.apple.com") then
        return n
      end
      local n = "details%?id=[a-zA-Z0-9%.]+"
      local t = "android%?p=[a-zA-Z0-9%.]+"
      local e = i.location
      if string.sub(e, 1, string.len("market://")) == "market://" then
        return e
      elseif string.match(e, n, 1) then
        local e = string.match(e, n, 1)
        return "market://" .. e
      elseif string.sub(e, 1, string.len("amzn://")) == "amzn://" then
        return e
      elseif string.match(e, t, 1) then
        local e = string.match(e, t, 1)
        return "amzn://apps/" .. e
      elseif f == true and s < A then
        s = s + 1
        return p(e)
      else
        s = 0
        return e
      end
    end
    return n
  end
  
  e = {
    TEST_WITH_ADS = "with_ads",
    TEST_WITHOUT_ADS = "without_ads",
    TEST_DISABLED = nil,
    appId = nil,
    appIds = nil,
    sessionStarted = false,
    testMode = nil,
    listenersRegistered = false,
    serverEndPoints = {},
    ipAddress = nil,
    startSession = function(r, l)
      local t = w(r)
      if b(t) then
        if not e.sessionStarted then
          e.appId = t
          e.appIds = r
          local e = function(r)
            local a = r.status or r.statusCode
            if a == 200 then
              local a, r = pcall(h.decode, r.response)
              if a ~= nil and r ~= nil then
                local a = r.links
                for t, n in ipairs(a) do
                  e.serverEndPoints[n.rel] = n.href
                end
                e.ipAddress = r.ip_address
                e.sessionStarted = true
                if l ~= nil then
                  l({
                    type = o.SESSION_IS_STARTED,
                    ad = "session"
                  })
                end
                i.setSessionStarted(e.sessionStarted)
                i.setIpAddress(e.ipAddress)
                n.info("Session started for App Id: " .. t)
                return t
              end
            else
              e.sessionStarted = false
              i.setSessionStarted(e.sessionStarted)
              if l ~= nil then
                l({
                  type = o.SESSION_NOT_STARTED,
                  ad = "session"
                })
              end
              n.info("Using default end points: " .. tostring(a))
            end
            e.registerInstall()
            return true
          end
          c(_(t), e)
        else
          n.info("Session has already been started for App Id: " .. t)
        end
      else
        n.release("Invalid App Id: " .. tostring(t))
      end
    end,
    setTestingMode = function(n)
      if n == e.TEST_DISABLED or n == e.TEST_WITH_ADS or n == e.TEST_WITHOUT_ADS then
        e.testMode = n
      else
        e.testMode = e.TEST_DISABLED
      end
    end,
    registerInstall = function()
      if m.isInstallRegistered(e.appId) then
        n.info("Install already registered in this device")
      else
        S()
      end
    end,
    fetchFullscreen = function(n, e)
      r("fullscreen", "fullscreens", n, e)
    end,
    fetchBanner = function(n, e)
      r("banner", "banners", n, e)
    end,
    fetchLink = function(e, n)
      r("link", "anchors", e, n)
    end,
    fetchPopup = function(e, n)
      r("pop_up", "pop_ups", e, n)
    end,
    reportImpression = function(e)
      if e ~= nil then
        n.info("Reporting impression")
        c(e, nil)
      else
        n.debug("No impression url")
      end
    end,
    theFetchSucceed = function(a, r, l)
      n.debugTable(r)
      local e = r.status or r.statusCode
      if e ~= 200 and e ~= 302 and e ~= 303 then
        local i
        if e == 204 then
          i = t.NO_ADS
        elseif e == 404 then
          i = t.INVALID_APPID
        elseif e == 409 then
          i = t.INVALID_PLACEMENTID
        elseif e == 422 then
          i = t.INVALID_DEVICE_ID
        elseif e == 423 then
          i = t.APP_IDLING
        elseif e == 500 then
          i = t.UNKNOWN_REASON .. "Please, contact us for more details."
        end
        if i == nil then
          n.release(t.UNKNOWN_REASON_CORONA .. " (" .. tostring(e) .. ")")
        else
          n.release("Reason: " .. tostring(i) .. " (" .. tostring(e) .. ")")
        end
        if l ~= nil then
          l({
            type = o.AD_NOT_RECEIVED,
            ad = a,
            reason = i
          })
        end
        return false, nil
      end
      if e == 302 or e == 303 then
        return true, nil
      end
      local i, e = pcall(h.decode, r.response)
      if not i or e == nil then
        n.release("Reason: " .. t.UNKNOWN_REASON .. tostring(i) .. " / " .. tostring(e))
        if l ~= nil then
          l({
            type = o.AD_NOT_RECEIVED,
            ad = a,
            reason = reason
          })
        end
        return false, e
      end
      return i, e
    end,
    getDefaultValue = function(e)
      if e == "app_or_site" then
        return L
      elseif e == "open_inside" then
        return D
      elseif e == "follow_redirect" then
        return k
      elseif e == "popup_message" then
        return E
      else
        return nil
      end
    end,
    getIpAddress = function()
      return e.ipAddress
    end,
    openWebView = function(n)
      l = display.newGroup()
      d.createImageFromBase64(d.CLOSE_BUTTON, d.CLOSE_BUTTON_IMAGE)
      local e = display.newImage(d.CLOSE_BUTTON_IMAGE, system.TemporaryDirectory)
      e.x, e.y = display.contentWidth - e.width / 2, e.height / 2 + display.screenOriginY
      e:addEventListener("touch", y)
      l:insert(e)
      local e = native.newWebView(0, e.height + display.screenOriginY, display.contentWidth, display.contentHeight - display.screenOriginY * 2)
      e:request(n)
      l:insert(e)
    end,
    getLink = function(n, e)
      for t, e in ipairs(e) do
        if e.rel == n then
          return e.href
        end
      end
      return nil
    end,
    getMarketURL = function(n, e)
      local t = {}
      if e == nil then
        e = ""
      end
      local i, e, t = g.request({
        method = "POST",
        url = n,
        source = a.source.string(e),
        headers = {
          ["Content-Length"] = tostring(#e),
          ["Content-Type"] = "application/json"
        },
        sink = a.sink.table(t)
      })
      return u(n, e, t)
    end,
    getMarketURLWithoutFollow = function(e)
      f = false
      local e = p(e)
      f = true
      return e
    end,
    setTimeoutInSeconds = function(t)
      if 1 <= t and t < 300 then
        e.timeout = t
      else
        n.release("Invalid timeout.")
      end
    end
  }
  
  local function n(n)
    if n.type == "applicationSuspend" then
      e.sessionStarted = false
    elseif n.type == "applicationResume" then
      e.startSession(e.appIds)
    end
  end
  
  if e.listenersRegistered == false then
    e.listenersRegistered = true
    Runtime:removeEventListener("system", n)
    Runtime:addEventListener("system", n)
  end
  e.setTimeoutInSeconds(v)
  return e
end

function package.preload.revmob_fullscreen_web(...)
  local l = require("revmob_log")
  local r = require("revmob_messages")
  local o = require("revmob_events")
  local n = require("revmob_client")
  require("revmob_sound_player")
  local t = "fullscreen"
  local i
  i = {
    autoshow = true,
    listener = nil,
    impressionUrl = nil,
    clickUrl = nil,
    htmlUrl = nil,
    dspHtml = nil,
    campaignId = nil,
    new = function(e)
      local e = e or {}
      setmetatable(e, i)
      return e
    end,
    load = function(e, r)
      function e.networkListener(i)
        local i, r = n.theFetchSucceed(t, i, e.listener)
        
        if i then
          local i = r.fullscreen.links
          e.impressionUrl = n.getLink("impressions", i)
          e.clickUrl = n.getLink("clicks", i)
          e.htmlUrl = n.getLink("html", i)
          l.release("Fullscreen loaded - " .. e.campaignId)
          if e.listener ~= nil then
            e.listener({
              type = o.AD_RECEIVED,
              ad = t
            })
          end
          if e.autoshow then
            e:show()
          end
        end
      end
      
      n.fetchFullscreen(r, e.networkListener)
    end,
    isLoaded = function(e)
      return e.htmlUrl ~= nil and e.clickUrl ~= nil or e.dspHtml ~= nil
    end,
    hide = function(e)
      if not e:isLoaded() then
        e.autoshow = false
      end
    end,
    show = function(e)
      if not e:isLoaded() then
        if e.autoshow == true then
          l.info(r.AD_NOT_LOADED)
        end
        e.autoshow = true
        return
      end
      
      function e.clickListener(i)
        if string.sub(i.url, -string.len("#close")) == "#close" then
          if e.changeOrientationListener then
            Runtime:removeEventListener("orientation", e.changeOrientationListener)
          end
          if e.listener ~= nil then
            e.listener({
              type = o.AD_CLOSED,
              ad = t
            })
          end
          return false
        end
        if string.sub(i.url, -string.len("#click")) == "#click" then
          if e.changeOrientationListener then
            Runtime:removeEventListener("orientation", e.changeOrientationListener)
          end
          if e.listener ~= nil then
            e.listener({
              type = o.AD_CLICKED,
              ad = t
            })
          end
          local t
          if e.followRedirect == true then
            t = n.getMarketURL(e.clickUrl)
          else
            t = n.getMarketURLWithoutFollow(e.clickUrl)
          end
          l.info(r.OPEN_MARKET)
          if t then
            if e.openInside == true and e.appOrSite == "site" then
              n.openWebView(t)
            else
              system.openURL(t)
            end
          end
          return false
        end
        if i.errorCode then
          l.release("Error: " .. tostring(i.errorMessage))
        end
        return true
      end
      
      local i = {
        hasBackground = false,
        autoCancel = true,
        urlRequest = e.clickListener,
        baseUrl = system.TemporaryDirectory
      }
      
      function e.changeOrientationListener(n)
        native.cancelWebPopup()
        timer.performWithDelay(200, function()
          native.showWebPopup(e.htmlUrl, i)
        end)
      end
      
      timer.performWithDelay(1, function()
        if e.listener ~= nil then
          e.listener({
            type = o.AD_DISPLAYED,
            ad = t
          })
        end
        e:playSoundOnShow()
        n.reportImpression(e.impressionUrl)
        if e.dspHtml ~= nil then
          native.showWebPopup("revmob_fullscreen.html", i)
        else
          native.showWebPopup(e.htmlUrl, i)
        end
      end)
      Runtime:addEventListener("orientation", e.changeOrientationListener)
    end,
    close = function(e)
      if e.changeOrientationListener then
        Runtime:removeEventListener("orientation", e.changeOrientationListener)
      end
      native.cancelWebPopup()
    end,
    playSoundOnShow = function(e)
      SoundPlayer.playSoundFromURL(e.showSoundURL)
    end
  }
  i.__index = i
  return i
end

function package.preload.revmob_fullscreen_static(...)
  local t = require("revmob_log")
  local s = require("revmob_messages")
  local o = require("revmob_events")
  local a = require("revmob_utils")
  local d = require("revmob_device")
  local n = require("revmob_client")
  require("revmob_sound_player")
  local i = "fullscreen"
  local r
  r = {
    autoshow = true,
    listener = nil,
    impressionUrl = nil,
    clickUrl = nil,
    imageUrl = nil,
    closeButtonUrl = nil,
    component = nil,
    campaignId = nil,
    _clicked = false,
    _released = false,
    _updateAccordingToOrientation = nil,
    _loadCloseButtonListener = nil,
    _loadImageListener = nil,
    _networkListener = nil,
    _moveToFront = nil,
    new = function(e)
      local e = e or {}
      setmetatable(e, r)
      e.component = display.newGroup()
      e.component.alpha = 0
      e.component.isHitTestable = false
      e.component.isVisible = false
      return e
    end,
    load = function(e, o)
      function e._networkListener(t)
        local i, t = n.theFetchSucceed(i, t, e.listener)
        
        if i then
          local t = t.fullscreen.links
          e.impressionUrl = n.getLink("impressions", t)
          e.clickUrl = n.getLink("clicks", t)
          e.imageUrl = n.getLink("image", t)
          e.closeButtonUrl = n.getLink("close_button", t)
          e:loadImage()
          e:loadCloseButton()
        end
      end
      
      n.fetchFullscreen(o, e._networkListener)
    end,
    loadImage = function(e)
      if e._released == true then
        t.info("Fullscreen was closed.")
        return
      end
      
      function e._loadImageListener(l)
        if e._released == true then
          if l.target then
            l.target:removeSelf()
          end
          t.info("Fullscreen was closed.")
          return
        end
        if l.isError or l.target == nil or e.imageUrl == nil then
          t.release("Fail to load ad image: " .. tostring(e.imageUrl))
          if e.listener ~= nil then
            e.listener({
              type = o.AD_NOT_RECEIVED,
              ad = i
            })
          end
          return
        end
        e.image = l.target
        e.image.isHitTestable = false
        e.image.isVisible = false
        e.image.alpha = 0
        
        function e.image.tap(l)
          if not e._clicked then
            e._clicked = true
            if e.listener ~= nil then
              e.listener({
                type = o.AD_CLICKED,
                ad = i
              })
            end
            local i
            if e.followRedirect == true then
              i = n.getMarketURL(e.clickUrl)
            else
              i = n.getMarketURLWithoutFollow(e.clickUrl)
            end
            t.info(s.OPEN_MARKET)
            if i then
              if e.openInside == true and e.appOrSite == "site" then
                n.openWebView(i)
              else
                system.openURL(i)
              end
            end
            e:close()
          end
          return true
        end
        
        function e.image.touch(n)
          return true
        end
        
        e.image:addEventListener("tap", e.image)
        e.image:addEventListener("touch", e.image)
        e:_updateResourcesLoaded()
      end
      
      a.loadAsset(e.imageUrl, e._loadImageListener, "fullscreen.jpg")
    end,
    loadCloseButton = function(e)
      if e._released == true then
        return
      end
      
      function e._loadCloseButtonListener(n)
        if e._released == true then
          if n.target then
            n.target:removeSelf()
          end
          return
        end
        if n.isError or n.target == nil or e.closeButtonUrl == nil then
          t.release("Fail to load close button image: " .. tostring(e.closeButtonUrl))
          if e.listener ~= nil then
            e.listener({
              type = o.AD_NOT_RECEIVED,
              ad = i
            })
          end
          return
        end
        e.closeButtonImage = n.target
        e.closeButtonImage.isHitTestable = false
        e.closeButtonImage.isVisible = false
        e.closeButtonImage.alpha = 0
        
        function e.closeButtonImage.tap(n)
          if e.listener ~= nil then
            e.listener({
              type = o.AD_CLOSED,
              ad = i
            })
          end
          e:close()
          return true
        end
        
        function e.closeButtonImage.touch(n)
          return true
        end
        
        e.closeButtonImage:addEventListener("tap", e.closeButtonImage)
        e.closeButtonImage:addEventListener("touch", e.closeButtonImage)
        e:_updateResourcesLoaded()
      end
      
      a.loadAsset(e.closeButtonUrl, e._loadCloseButtonListener, "close_button.jpg")
    end,
    _updateResourcesLoaded = function(e)
      if e:isLoaded() then
        t.release("Fullscreen loaded - " .. e.campaignId)
        if e.listener ~= nil then
          e.listener({
            type = o.AD_RECEIVED,
            ad = i
          })
        end
        e.component:insert(1, e.image)
        e.component:insert(2, e.closeButtonImage)
        if e.autoshow then
          e:show()
        end
      end
    end,
    _configureDimensions = function(e)
      if e.image ~= nil then
        e.image.x = display.viewableContentWidth / 2
        e.image.y = display.viewableContentHeight / 2
        e.image.width = a.Screen.width()
        e.image.height = a.Screen.height()
      end
      if e.closeButtonImage ~= nil then
        e.closeButtonImage.x = display.viewableContentWidth - 45
        e.closeButtonImage.y = 40
        e.closeButtonImage.width = d.isIPad() and 35 or 45
        e.closeButtonImage.height = d.isIPad() and 35 or 45
      end
    end,
    isLoaded = function(e)
      return e.clickUrl ~= nil and e.component ~= nil and e.image ~= nil and e.closeButtonImage ~= nil
    end,
    hide = function(e)
      if not e:isLoaded() then
        e.autoshow = false
      end
      if e.component ~= nil then
        e.component.alpha = 0
        e.component.isVisible = false
        if e.image ~= nil then
          e.image.alpha = 0
          e.image.isVisible = false
        end
        if e.closeButtonImage ~= nil then
          e.closeButtonImage.alpha = 0
          e.closeButtonImage.isVisible = false
        end
      end
    end,
    show = function(e)
      if not e:isLoaded() then
        if e.autoshow == true then
          t.info(s.AD_NOT_LOADED)
        end
        e.autoshow = true
        return
      end
      if e.component ~= nil then
        e:_configureDimensions()
        e.component.alpha = 1
        e.component.isVisible = true
        if e.image ~= nil then
          e.image.alpha = 1
          e.image.isVisible = true
        end
        if e.closeButtonImage ~= nil then
          e.closeButtonImage.alpha = 1
          e.closeButtonImage.isVisible = true
        end
        
        function e._moveToFront(n)
          if e.component ~= nil then
            e.component:toFront()
          end
        end
        
        Runtime:addEventListener("enterFrame", e._moveToFront)
        
        function e._updateAccordingToOrientation(n)
          e:_configureDimensions()
        end
        
        Runtime:addEventListener("orientation", e._updateAccordingToOrientation)
        if e.listener ~= nil then
          e.listener({
            type = o.AD_DISPLAYED,
            ad = i
          })
        end
        e:playSoundOnShow()
        n.reportImpression(e.impressionUrl)
      end
    end,
    close = function(e)
      e._released = true
      e.autoshow = false
      if e._moveToFront ~= nil then
        Runtime:removeEventListener("enterFrame", e._moveToFront)
      end
      if e._updateAccordingToOrientation ~= nil then
        Runtime:removeEventListener("orientation", e._updateAccordingToOrientation)
      end
      e._updateAccordingToOrientation = nil
      e._loadCloseButtonListener = nil
      e._loadImageListener = nil
      e._networkListener = nil
      e._moveToFront = nil
      e.listener = nil
      if e.image ~= nil then
        pcall(e.image.removeEventListener, e.image, "tap", e.image)
        pcall(e.image.removeEventListener, e.image, "touch", e.image)
        e.image:removeSelf()
        e.image = nil
      end
      if e.closeButtonImage ~= nil then
        pcall(e.closeButtonImage.removeEventListener, e.closeButtonImage, "tap", e.closeButtonImage)
        pcall(e.closeButtonImage.removeEventListener, e.closeButtonImage, "touch", e.closeButtonImage)
        e.closeButtonImage:removeSelf()
        e.closeButtonImage = nil
      end
      if e.component ~= nil then
        e.component:removeSelf()
        e.component = nil
      end
      e._clicked = false
      t.info("Fullscreen closed")
    end,
    playSoundOnShow = function(e)
      SoundPlayer.playSoundFromURL(e.showSoundURL)
    end
  }
  r.__index = r
  return r
end

function package.preload.revmob_fullscreen(...)
  local l = require("revmob_log")
  local n = require("revmob_client")
  local c = require("revmob_fullscreen_static")
  local r = require("revmob_fullscreen_web")
  local d = require("socket.url")
  local t = "fullscreen"
  RevMobFullscreen = {
    params = nil,
    view = nil,
    listener = nil,
    placementIds = nil,
    autoshow = true,
    new = function(n)
      local e = n or {}
      setmetatable(e, RevMobFullscreen)
      e.params = n
      return e
    end,
    load = function(e)
      local r = function(i)
        local i, t = n.theFetchSucceed(t, i, e.listener)
        if i then
          local i = n.getDefaultValue("app_or_site")
          if t.fullscreen.app_or_site ~= nil then
            i = t.fullscreen.app_or_site
          end
          e.appOrSite = i
          local i = n.getDefaultValue("open_inside")
          if t.fullscreen.open_inside ~= nil then
            i = t.fullscreen.open_inside
          end
          e.openInside = i
          local i = n.getDefaultValue("follow_redirect")
          if t.fullscreen.follow_redirect ~= nil then
            i = t.fullscreen.follow_redirect
          end
          e.followRedirect = i
          local i = ""
          if t.fullscreen.sound ~= nil then
            local e = t.fullscreen.sound
            if e.on_show ~= nil then
              i = e.on_show
            end
          end
          e.showSoundURL = i
          local i = ""
          if t.fullscreen.sound ~= nil then
            local e = t.fullscreen.sound
            if e.on_click ~= nil then
              i = e.on_click
            end
          end
          e.clickSoundURL = i
          local t = t.fullscreen.links
          local o = n.getLink("impressions", t)
          local i = n.getLink("clicks", t)
          local s = n.getLink("html", t)
          local u = n.getLink("image", t)
          local f = n.getLink("close_button", t)
          local a = n.getLink("dsp_url", t)
          local t = n.getLink("dsp_html", t)
          local n = ""
          local d = d.parse(i)
          local d = d.query
          if d ~= nil then
            local e = d:split("&")
            for t = 1, #e do
              if string.find(e[t], "campaign_id=") ~= nil then
                local e = e[t]:split("=")
                n = e[2]
              end
            end
          else
            n = "Testing Mode"
          end
          if t ~= nil then
            l.debug("DSP html fullscreen")
            e.createFile(t)
            e.view = r.new(e.params)
            e.view.dspHtml = t
            e.view.impressionUrl = o
            e.view.clickUrl = i
            e.view.campaignId = n
            e.view.autoshow = e.autoshow
            if e.autoshow == true then
              e.view:show()
            end
          elseif a ~= nil then
            l.debug("DSP url fullscreen")
            e.view = r.new(e.params)
            e.view.htmlUrl = a
            e.view.impressionUrl = o
            e.view.clickUrl = i
            e.view.campaignId = n
            e.view.autoshow = e.autoshow
            if e.autoshow == true then
              e.view:show()
            end
          elseif s ~= nil then
            l.debug("Rich fullscreen")
            e.view = r.new(e.params)
            e.view.htmlUrl = s
            e.view.impressionUrl = o
            e.view.clickUrl = i
            e.view.campaignId = n
            e.view.autoshow = e.autoshow
            if e.autoshow == true then
              e.view:show()
            end
          else
            l.debug("Static fullscreen")
            e.view = c.new(e.params)
            e.view.imageUrl = u
            e.view.closeButtonUrl = f
            e.view.impressionUrl = o
            e.view.clickUrl = i
            e.view.campaignId = n
            e.view.autoshow = e.autoshow
            e.view:loadImage()
            e.view:loadCloseButton()
          end
        end
      end
      
      function string:split(l, t)
        t = t or {}
        local e = 1
        local i, o = string.find(self, l, e)
        while i do
          table.insert(t, string.sub(self, e, i - 1))
          e = o + 1
          i, o = string.find(self, l, e)
        end
        table.insert(t, string.sub(self, e))
        return t
      end
      
      n.fetchFullscreen(e.placementIds, r)
    end,
    hide = function(e)
      e.autoshow = false
      if e.view ~= nil then
        e.view:hide()
      end
    end,
    show = function(e)
      e.autoshow = true
      if e.view ~= nil then
        e.view:show()
      end
    end,
    close = function(e)
      e.autoshow = false
      if e.view ~= nil then
        e.view:close()
      end
    end,
    createFile = function(n)
      local e = system.pathForFile("revmob_fullscreen.html", system.TemporaryDirectory)
      local e = io.open(e, "w")
      e:write(n)
      io.close(e)
      e = nil
    end
  }
  RevMobFullscreen.__index = RevMobFullscreen
end

function package.preload.revmob_banner_web(...)
  local l = require("revmob_log")
  local a = require("revmob_messages")
  local r = require("revmob_events")
  local t = require("revmob_utils")
  local d = require("revmob_device")
  local n = require("revmob_client")
  require("revmob_sound_player")
  local o = "banner"
  local i
  i = {
    autoshow = true,
    listener = nil,
    impressionUrl = nil,
    clickUrl = nil,
    campaignId = nil,
    htmlUrl = nil,
    webView = nil,
    dspHtml = nil,
    x = nil,
    y = nil,
    width = 320,
    height = 50,
    rotation = 0,
    new = function(e)
      local e = e or {}
      setmetatable(e, i)
      return e
    end,
    load = function(e, i)
      function e.networkListener(t)
        local i, t = n.theFetchSucceed(o, t, e.listener)
        
        if i then
          local t = t.banners[1].links
          e.impressionUrl = n.getLink("impressions", t)
          e.clickUrl = n.getLink("clicks", t)
          e.htmlUrl = n.getLink("html", t)
          l.release("Banner loaded - " .. e.campaignId)
          if e.listener ~= nil then
            e.listener({
              type = r.AD_RECEIVED,
              ad = o
            })
          end
          e:configWebView()
          if e.autoshow then
            e:show()
          end
        end
      end
      
      n.fetchBanner(i, e.networkListener)
    end,
    configWebView = function(e)
      function e.clickListener(i)
        if string.sub(i.url, -string.len("#click")) == "#click" then
          if e.listener ~= nil then
            e.listener({
              type = r.AD_CLICKED,
              
              ad = o
            })
          end
          local t
          if e.followRedirect == true then
            t = n.getMarketURL(e.clickUrl)
          else
            t = n.getMarketURLWithoutFollow(e.clickUrl)
          end
          l.info(a.OPEN_MARKET)
          if t then
            if e.openInside == true and e.appOrSite == "site" then
              n.openWebView(t)
            else
              system.openURL(t)
            end
          end
          e:hide()
        end
        if i.errorCode then
          l.release("Error: " .. tostring(i.errorMessage))
        end
        return true
      end
      
      e.webView = native.newWebView(e.x, e.y, e.width, e.height)
      e.webView:addEventListener("urlRequest", e.clickListener)
      e:hide()
      e.webView.rotation = e.rotation
      e.webView.canGoBack = false
      e.webView.canGoForward = false
      e.webView.hasBackground = true
      if e.dspHtml ~= nil then
        e.webView:request("revmob_banner.html", system.TemporaryDirectory)
      else
        e.webView:request(e.htmlUrl)
      end
      
      function e.clickListener2(n)
        return true
      end
      
      e.webView.tap = e.clickListener2
      e.webView.touch = e.clickListener2
      e.webView:addEventListener("tap", e.webView)
      e.webView:addEventListener("touch", e.webView)
    end,
    isLoaded = function(e)
      return e.htmlUrl ~= nil and e.clickUrl ~= nil or e.dspHtml ~= nil
    end,
    show = function(e)
      local s = t.Screen.width() > 640 and 640 or t.Screen.width()
      local i = d.isIPad() and 100 or 50 * (t.Screen.bottom() - t.Screen.top()) / display.contentHeight
      local d = t.Screen.left() + s / 2
      local t = t.Screen.bottom() - i / 2
      e:setPosition(e.x or d, e.y or t)
      e:setDimension(e.width or s, e.height or i)
      if not e:isLoaded() then
        if e.autoshow == true then
          l.info(a.AD_NOT_LOADED)
        end
        e.autoshow = true
        return
      end
      if e.webView ~= nil then
        timer.performWithDelay(1, function()
          if e.listener ~= nil then
            e.listener({
              type = r.AD_DISPLAYED,
              ad = o
            })
          end
          e:playSoundOnShow()
          n.reportImpression(e.impressionUrl)
          e.webView.alpha = 1
        end)
      end
    end,
    setPosition = function(e, n, t)
      if e.webView then
        e.webView.x = n or e.webView.x
        e.webView.y = t or e.webView.y
        e.x = e.webView.x
        e.y = e.webView.y
      end
    end,
    setDimension = function(e, n, t, i)
      if e.webView then
        e.webView.width = n or e.webView.width
        e.webView.height = t or e.webView.height
        e.webView.rotation = i or e.webView.rotation
        e.width = e.webView.width
        e.height = e.webView.height
        e.rotation = e.webView.rotation
      end
    end,
    update = function(e, n, i, t, l, o)
      e:setPosition(n, i)
      e:setDimension(t, l, o)
    end,
    release = function(e)
      if e.webView then
        e.webView:removeEventListener("tap", e.webView)
        e.webView:removeEventListener("touch", e.webView)
        e.webView:removeSelf()
        e.webView = nil
      end
    end,
    hide = function(e)
      if e.webView ~= nil then
        e.webView.alpha = 0
      end
    end,
    playSoundOnShow = function(e)
      SoundPlayer.playSoundFromURL(e.showSoundURL)
    end
  }
  i.__index = i
  return i
end

function package.preload.revmob_banner_static(...)
  local i = require("revmob_log")
  local s = require("revmob_messages")
  local r = require("revmob_events")
  local t = require("revmob_utils")
  local a = require("revmob_device")
  local n = require("revmob_client")
  require("revmob_sound_player")
  local l = "banner"
  local o
  o = {
    autoshow = true,
    listener = nil,
    impressionUrl = nil,
    clickUrl = nil,
    campaignId = nil,
    imageUrl = nil,
    component = nil,
    _clicked = false,
    _released = false,
    shouldRelease = true,
    width = nil,
    height = nil,
    x = nil,
    y = nil,
    rotation = 0,
    new = function(e)
      local e = e or {}
      setmetatable(e, o)
      e.component = display.newGroup()
      e.component.alpha = 0
      return e
    end,
    load = function(e, i)
      function e.networkListener(t)
        local i, t = n.theFetchSucceed(l, t, e.listener)
        
        if i then
          local t = t.banners[1].links
          e.impressionUrl = n.getLink("impressions", t)
          e.clickUrl = n.getLink("clicks", t)
          e.imageUrl = n.getLink("image", t)
          e:loadImage()
        end
      end
      
      n.fetchBanner(i, e.networkListener)
    end,
    loadImage = function(e)
      if e._released == true then
        i.info("Banner was released.")
        return
      end
      
      function e._loadImageListener(o)
        if e._released == true then
          if o.target then
            o.target:removeSelf()
          end
          i.info("Banner was released.")
          return
        end
        if o.isError or o.target == nil or e.imageUrl == nil then
          i.release("Fail to load ad image: " .. tostring(e.imageUrl))
          if e.listener ~= nil then
            e.listener({
              type = r.AD_NOT_RECEIVED,
              ad = l
            })
          end
          return
        end
        e.image = o.target
        local o = t.Screen.width() > 640 and 640 or t.Screen.width()
        local a = a.isIPad() and 100 or 50 * (t.Screen.bottom() - t.Screen.top()) / display.contentHeight
        local c = t.Screen.left() + o / 2
        local d = t.Screen.bottom() - a / 2
        e:setPosition(e.x or c, e.y or d)
        e:setDimension(e.width or o, e.height or a)
        
        function e.image.tap(t)
          if not e._clicked then
            e._clicked = true
            if e.listener ~= nil then
              e.shouldRelease = false
              e.listener({
                type = r.AD_CLICKED,
                ad = l
              })
            end
            local t
            if e.followRedirect == true then
              t = n.getMarketURL(e.clickUrl)
            else
              t = n.getMarketURLWithoutFollow(e.clickUrl)
            end
            i.info(s.OPEN_MARKET)
            if t then
              if e.openInside == true and e.appOrSite == "site" then
                n.openWebView(t)
              else
                system.openURL(t)
              end
            end
            if e.shouldRelease then
              e:release()
            else
              e._clicked = false
              e.shouldRelease = false
              e:load()
            end
          end
          return true
        end
        
        function e.image.touch(n)
          return true
        end
        
        e.image:addEventListener("tap", e.image)
        e.image:addEventListener("touch", e.image)
        e.component:insert(1, e.image)
        i.release("Banner loaded - " .. e.campaignId)
        if e.listener ~= nil then
          e.listener({
            type = r.AD_RECEIVED,
            ad = l
          })
        end
        if e.autoshow then
          e:show()
        end
      end
      
      t.loadAsset(e.imageUrl, e._loadImageListener, "revmob_banner.jpg")
    end,
    isLoaded = function(e)
      return e.image ~= nil and e.clickUrl ~= nil and e.component ~= nil
    end,
    hide = function(e)
      if not e:isLoaded() then
        e.autoshow = false
      end
      if e.component ~= nil then
        e.component.alpha = 0
      end
    end,
    show = function(e)
      if not e:isLoaded() then
        if e.autoshow == true then
          i.info(s.AD_NOT_LOADED)
        end
        e.autoshow = true
        return
      end
      if e.component ~= nil then
        e.component.alpha = 1
        if e.listener ~= nil then
          e.listener({
            type = r.AD_DISPLAYED,
            ad = l
          })
        end
        e:playSoundOnShow()
        n.reportImpression(e.impressionUrl)
      end
    end,
    setPosition = function(e, t, n)
      if e.image ~= nil then
        e.image.x = t or e.image.x
        e.image.y = n or e.image.y
        e.x = e.image.x
        e.y = e.image.y
      end
    end,
    setDimension = function(e, n, t, i)
      if e.image ~= nil then
        e.image.width = n or e.image.width
        e.image.height = t or e.image.height
        e.image.rotation = i or e.image.rotation
        e.width = e.image.width
        e.height = e.image.height
        e.rotation = e.image.rotation
      end
    end,
    release = function(e)
      e._released = true
      e.autoshow = false
      e.networkListener = nil
      e._loadImageListener = nil
      e.listener = nil
      if e.image ~= nil then
        pcall(e.image.removeEventListener, e.image, "tap", e.image)
        pcall(e.image.removeEventListener, e.image, "touch", e.image)
        e.image:removeSelf()
        e.image = nil
      end
      if e.component ~= nil then
        e.component:removeSelf()
        e.component = nil
      end
      e._clicked = false
    end,
    playSoundOnShow = function(e)
      SoundPlayer.playSoundFromURL(e.showSoundURL)
    end
  }
  o.__index = o
  return o
end

function package.preload.revmob_banner(...)
  local o = require("revmob_log")
  local n = require("revmob_client")
  local u = require("revmob_banner_static")
  local r = require("revmob_banner_web")
  local e = require("revmob_events")
  local a = require("socket.url")
  local i = "banner"
  RevMobBanner = {
    params = nil,
    view = nil,
    placementIds = nil,
    listener = nil,
    autoshow = true,
    width = nil,
    height = nil,
    x = nil,
    y = nil,
    rotation = 0,
    new = function(n)
      local e = n or {}
      setmetatable(e, RevMobBanner)
      e.params = n
      return e
    end,
    load = function(e)
      local r = function(t)
        local i, t = n.theFetchSucceed(i, t, e.listener)
        if i then
          local i = n.getDefaultValue("app_or_site")
          if t.banners.app_or_site ~= nil then
            i = t.banners.app_or_site
          end
          e.appOrSite = i
          local i = n.getDefaultValue("open_inside")
          if t.banners.open_inside ~= nil then
            i = t.banners.open_inside
          end
          e.openInside = i
          local i = n.getDefaultValue("follow_redirect")
          if t.banners.follow_redirect ~= nil then
            i = t.banners.follow_redirect
          end
          e.followRedirect = i
          local i = ""
          if t.banners.sound ~= nil then
            local e = t.banners.sound
            if e.on_show ~= nil then
              i = e.on_show
            end
          end
          e.showSoundURL = i
          local i = ""
          if t.banners.sound ~= nil then
            local e = t.banners.sound
            if e.on_click ~= nil then
              i = e.on_click
            end
          end
          e.clickSoundURL = i
          local t = t.banners[1].links
          local l = n.getLink("impressions", t)
          local i = n.getLink("clicks", t)
          local c = n.getLink("image", t)
          local s = n.getLink("html", t)
          local d = n.getLink("dsp_url", t)
          local t = n.getLink("dsp_html", t)
          local n = ""
          local a = a.parse(i)
          local a = a.query
          if a ~= nil then
            local e = a:split("&")
            for t = 1, #e do
              if string.find(e[t], "campaign_id=") ~= nil then
                local e = e[t]:split("=")
                n = e[2]
              end
            end
          else
            n = "Testing Mode"
          end
          if t ~= nil then
            o.debug("DSP hmtl banner")
            e.createFile(t)
            e.view = r.new(e.params)
            e.view.dspHtml = t
            e.view.impressionUrl = l
            e.view.clickUrl = i
            e.view.campaignId = n
            e.view.autoshow = e.autoshow
            e.view:configWebView()
            if e.autoshow == true then
              e.view:show()
            end
          elseif d ~= nil then
            o.debug("DSP url banner")
            e.view = r.new(e.params)
            e.view.htmlUrl = d
            e.view.impressionUrl = l
            e.view.clickUrl = i
            e.view.campaignId = n
            e.view.autoshow = e.autoshow
            e.view:configWebView()
            if e.autoshow == true then
              e.view:show()
            end
          elseif s ~= nil then
            if e.params == nil then
              e.params = {}
            end
            e.params.listener = RevMobBannerViewListener
            o.debug("Rich banner")
            e.view = r.new(e.params)
            e.view.htmlUrl = s
            e.view.impressionUrl = l
            e.view.clickUrl = i
            e.view.campaignId = n
            e.view.autoshow = e.autoshow
            e.view:configWebView()
            if e.autoshow == true then
              e.view:show()
            end
          else
            o.debug("Static banner")
            e.view = u.new(e.params)
            e.view.imageUrl = c
            e.view.impressionUrl = l
            e.view.clickUrl = i
            e.view.campaignId = n
            e.view.autoshow = e.autoshow
            e.view._released = false
            e.view:loadImage()
          end
        end
      end
      
      function string:split(o, t)
        t = t or {}
        local e = 1
        local i, l = string.find(self, o, e)
        while i do
          table.insert(t, string.sub(self, e, i - 1))
          e = l + 1
          i, l = string.find(self, o, e)
        end
        table.insert(t, string.sub(self, e))
        return t
      end
      
      n.fetchBanner(e.placementIds, r)
    end,
    hide = function(e)
      e.autoshow = false
      if e.view ~= nil then
        e.view:hide()
      end
    end,
    show = function(e)
      e.autoshow = true
      if e.view ~= nil then
        e.view:show()
      end
    end,
    setPosition = function(e, t, n)
      if e.view ~= nil then
        e.view:setPosition(t, n)
      end
      e.x = t or e.view.x
      e.y = n or e.view.y
    end,
    setDimension = function(e, n, t, i)
      if e.view ~= nil then
        e.view:setDimension(n, t, i)
      end
      e.width = n or e.view.width
      e.height = t or e.view.height
      e.rotation = i
      if not e.rotation and e.view then
        e.rotation = e.view.rotation
      else
        e.rotation = 0
      end
    end,
    release = function(e)
      e.autoshow = false
      if e.view ~= nil then
        e.view:release()
      end
    end,
    createFile = function(n)
      local e = system.pathForFile("revmob_banner.html", system.TemporaryDirectory)
      local e = io.open(e, "w")
      e:write(n)
      io.close(e)
      e = nil
    end
  }
  RevMobBanner.__index = RevMobBanner
end

function package.preload.revmob_link(...)
  local l = require("revmob_log")
  local r = require("revmob_messages")
  local o = require("revmob_events")
  local n = require("revmob_client")
  local s = require("socket.url")
  local i = "link"
  RevMobAdLink = {
    autoopen = false,
    impressionUrl = nil,
    clickUrl = nil,
    publisherListener = nil,
    new = function(e)
      local e = e or {}
      setmetatable(e, RevMobAdLink)
      return e
    end,
    load = function(e, a)
      function e._networkListener(t)
        local r, t = n.theFetchSucceed(i, t, e.publisherListener)
        
        if r then
          local r = n.getDefaultValue("app_or_site")
          if t.anchor.app_or_site ~= nil then
            r = t.anchor.app_or_site
          end
          e.appOrSite = r
          local r = n.getDefaultValue("open_inside")
          if t.anchor.open_inside ~= nil then
            r = t.anchor.open_inside
          end
          e.openInside = r
          local r = n.getDefaultValue("follow_redirect")
          if t.anchor.follow_redirect ~= nil then
            r = t.anchor.follow_redirect
          end
          e.followRedirect = r
          local t = t.anchor.links
          e.impressionUrl = n.getLink("impressions", t)
          e.clickUrl = n.getLink("clicks", t)
          e.campaignId = ""
          local n = s.parse(e.clickUrl)
          local n = n.query
          if n ~= nil then
            local n = n:split("&")
            for t = 1, #n do
              if string.find(n[t], "campaign_id=") ~= nil then
                local n = n[t]:split("=")
                e.campaignId = n[2]
              end
            end
          else
            e.campaignId = "Testing Mode"
          end
          l.release("Link loaded - " .. e.campaignId)
          if e.publisherListener then
            e.publisherListener({
              type = o.AD_RECEIVED,
              ad = i
            })
          end
          if e.autoopen then
            e:open()
          end
        elseif e.publisherListener then
          e.publisherListener({
            type = o.AD_NOT_RECEIVED,
            ad = i
          })
        end
      end
      
      function string:split(l, t)
        t = t or {}
        local e = 1
        local i, o = string.find(self, l, e)
        while i do
          table.insert(t, string.sub(self, e, i - 1))
          e = o + 1
          i, o = string.find(self, l, e)
        end
        table.insert(t, string.sub(self, e))
        return t
      end
      
      n.fetchLink(a, e._networkListener)
    end,
    cancel = function(e)
      e.autoopen = false
    end,
    open = function(e)
      if e.clickUrl == nil then
        if e.autoopen == true then
          l.info(r.AD_NOT_LOADED)
        end
        e.autoopen = true
        return
      end
      e.autoopen = true
      if e.publisherListener then
        e.publisherListener({
          type = o.AD_DISPLAYED,
          ad = i
        })
      end
      n.reportImpression(e.impressionUrl)
      local t
      if e.followRedirect == true then
        t = n.getMarketURL(e.clickUrl)
      else
        t = n.getMarketURLWithoutFollow(e.clickUrl)
      end
      if t then
        if e.publisherListener then
          e.publisherListener({
            type = o.AD_CLICKED,
            ad = i
          })
        end
        l.info("Link opened")
        l.info(r.OPEN_MARKET)
        if e.openInside == true and e.appOrSite == "site" then
          n.openWebView(t)
        else
          system.openURL(t)
        end
      elseif e.publisherListener then
        e.publisherListener({
          type = o.UNKNOWN_ERROR,
          ad = i
        })
      end
    end
  }
  RevMobAdLink.__index = RevMobAdLink
end

function package.preload.revmob_popup(...)
  local l = require("revmob_log")
  local a = require("revmob_messages")
  local o = require("revmob_events")
  local t = require("revmob_client")
  require("revmob_sound_player")
  local d = require("socket.url")
  local i = "popup"
  local s = 2
  RevMobPopup = {
    autoshow = false,
    impressionUrl = nil,
    clickUrl = nil,
    message = nil,
    publisherListener = nil,
    new = function(e)
      local e = e or {}
      setmetatable(e, RevMobPopup)
      return e
    end,
    load = function(e, a)
      function e._networkListener(n)
        local r, n = t.theFetchSucceed(i, n, e.publisherListener)
        
        if r then
          local r = t.getDefaultValue("app_or_site")
          if n.pop_up.app_or_site ~= nil then
            r = n.pop_up.app_or_site
          end
          e.appOrSite = r
          local r = t.getDefaultValue("open_inside")
          if n.pop_up.open_inside ~= nil then
            r = n.pop_up.open_inside
          end
          e.openInside = r
          local r = t.getDefaultValue("follow_redirect")
          if n.pop_up.follow_redirect ~= nil then
            r = n.pop_up.follow_redirect
          end
          e.followRedirect = r
          local r = ""
          if n.pop_up.sound ~= nil then
            local e = n.pop_up.sound
            if e.on_show ~= nil then
              r = e.on_show
            end
          end
          e.showSoundURL = r
          local r = ""
          if n.pop_up.sound ~= nil then
            local e = n.pop_up.sound
            if e.on_click ~= nil then
              r = e.on_click
            end
          end
          e.clickSoundURL = r
          local r = n.pop_up.links
          e.impressionUrl = t.getLink("impressions", r)
          e.clickUrl = t.getLink("clicks", r)
          local t = t.getDefaultValue("popup_message")
          if n.pop_up.message ~= nil then
            t = n.pop_up.message
          end
          e.message = t
          e.campaignId = ""
          local n = d.parse(e.clickUrl)
          local n = n.query
          if n ~= nil then
            local n = n:split("&")
            for t = 1, #n do
              if string.find(n[t], "campaign_id=") ~= nil then
                local n = n[t]:split("=")
                e.campaignId = n[2]
              end
            end
          else
            e.campaignId = "Testing Mode"
          end
          l.release("Popup loaded - " .. e.campaignId)
          if e.autoshow then
            e:show()
          end
          if e.publisherListener then
            e.publisherListener({
              type = o.AD_RECEIVED,
              ad = i
            })
          end
        elseif e.publisherListener then
          e.publisherListener({
            type = o.AD_NOT_RECEIVED,
            ad = i
          })
        end
      end
      
      function string:split(o, e)
        e = e or {}
        local n = 1
        local i, l = string.find(self, o, n)
        while i do
          table.insert(e, string.sub(self, n, i - 1))
          n = l + 1
          i, l = string.find(self, o, n)
        end
        table.insert(e, string.sub(self, n))
        return e
      end
      
      t.fetchPopup(a, e._networkListener)
    end,
    hide = function(e)
      e.autoshow = false
    end,
    show = function(e)
      if e.clickUrl == nil then
        if e.autoshow == true then
          l.info(a.AD_NOT_LOADED)
        end
        e.autoshow = true
        return
      end
      e.autoshow = true
      if e.publisherListener then
        e.publisherListener({
          type = o.AD_DISPLAYED,
          ad = i
        })
      end
      t.reportImpression(e.impressionUrl)
      timer.performWithDelay(1, function()
        function e._clickListener(n)
          if "clicked" == n.action then
            if s == n.index then
              if e.publisherListener then
                e.publisherListener({
                  type = o.AD_CLICKED,
                  
                  ad = i
                })
              end
              local n
              if e.followRedirect == true then
                n = t.getMarketURL(e.clickUrl)
              else
                n = t.getMarketURLWithoutFollow(e.clickUrl)
              end
              if n then
                l.info(a.OPEN_MARKET)
                if e.openInside == true and e.appOrSite == "site" then
                  t.openWebView(n)
                else
                  system.openURL(n)
                end
              elseif e.publisherListener then
                e.publisherListener({
                  type = o.UNKNOWN_ERROR,
                  ad = i
                })
              end
            elseif e.publisherListener then
              e.publisherListener({
                type = o.AD_CLOSED,
                ad = i
              })
            end
          end
        end
        
        e:playSoundOnShow()
        native.showAlert(e.message, "", {
          "No, thanks.",
          "Yes, Sure!"
        }, e._clickListener)
      end)
    end,
    playSoundOnShow = function(e)
      SoundPlayer.playSoundFromURL(e.showSoundURL)
    end
  }
  RevMobPopup.__index = RevMobPopup
end

function package.preload.revmob_cache(...)
  local e = require("revmob_log")
  local e = require("revmob_loadsave")
  local e = {
    isInstallRegistered = function(t)
      local n = e.loadFromFile()
      if not n then
        e.saveToFile()
        e.loadFromFile()
      end
      return n ~= nil and e.getItem(t) == true
    end,
    saveInstallWasRegistered = function(n)
      e.addItem(n, true)
      e.saveToFile()
    end
  }
  return e
end

function package.preload.revmob_loadsave(...)
  local o = require("json")
  local n = "revmob_sdk.json"
  local e = {}
  
  local function i()
    local e = system.pathForFile(n, system.CachesDirectory)
    e = e or system.pathForFile(n, system.TemporaryDirectory)
    return e
  end
  
  local n = {}
  
  function n.getItem(t)
    return e[t] or nil
  end
  
  function n.addItem(t, i)
    e[t] = i
  end
  
  function n.saveToFile()
    local t = i()
    local t = io.open(t, "w")
    local e = o.encode(e)
    t:write(e)
    io.close(t)
  end
  
  function n.loadFromFile()
    local t = i()
    local n
    if t then
      n = io.open(t, "r")
    end
    if n then
      local t = n:read("*a")
      e = o.decode(t)
      if e == nil then
        e = {}
      end
      io.close(n)
      return true
    end
    return false
  end
  
  return n
end

function package.preload.revmob_sound_player(...)
  local o = require("audio")
  local t = require("revmob_download_manager")
  local e = require("revmob_log")
  SoundPlayer = {}
  SoundPlayer = {
    playSoundFromURL = function(n)
      if n ~= nil and string.len(n) > 0 then
        local l = "/"
        local i
        local e = string.find(n, l, 1)
        i = e
        while e do
          e = string.find(n, l, e + 1)
          if e then
            i = e
          end
        end
        local e = string.sub(n, i + 1)
        t.download(n, e)
        local e = o.play(o.loadSound(t.fileName, t.params.response.baseDirectory))
      end
    end
  }
  return SoundPlayer
end

function package.preload.revmob_download_manager(...)
  local n = require("revmob_log")
  local e = require("socket.http")
  DownloadManager = {}
  DownloadManager = {
    fileName = "",
    params = {},
    networkListener = function(e)
      if e.isError then
        n.info("Network error - download failed")
      elseif e.phase == "began" then
        if e.bytesEstimated <= 0 then
          n.info("Download starting, size unknown")
        else
          n.info("Download starting, estimated size: " .. e.bytesEstimated)
        end
      elseif e.phase == "progress" then
        if e.bytesEstimated <= 0 then
          n.info("Download progress: " .. e.bytesTransferred)
        else
          n.info("Download progress: " .. e.bytesTransferred .. " of estimated: " .. e.bytesEstimated)
        end
      elseif e.phase == "ended" then
        n.info("Download complete, total bytes transferred: " .. e.bytesTransferred)
      end
    end,
    getFileName = function()
      return DownloadManager.fileName
    end,
    setFileName = function(e)
      DownloadManager.fileName = e
    end,
    parameters = function()
      DownloadManager.params.progress = "download"
      DownloadManager.params.response = {
        filename = DownloadManager.getFileName(),
        baseDirectory = system.DocumentsDirectory
      }
    end,
    download = function(e, n)
      DownloadManager.setFileName(n)
      DownloadManager.parameters()
      network.request(e, "GET", DownloadManager.networkListener, DownloadManager.params)
    end
  }
  return DownloadManager
end

local i = require("revmob_log")
local e = require("revmob_context")
local n = require("revmob_client")
require("revmob_fullscreen")
require("revmob_banner")
require("revmob_link")
require("revmob_popup")
local t
t = {
  TEST_DISABLED = n.TEST_DISABLED,
  TEST_WITH_ADS = n.TEST_WITH_ADS,
  TEST_WITHOUT_ADS = n.TEST_WITHOUT_ADS,
  startSession = function(e)
    local e = n.startSession(e, nil)
  end,
  startSessionWithListener = function(t, e)
    local e = n.startSession(t, e)
  end,
  setTestingMode = function(e)
    n.setTestingMode(e)
  end,
  showFullscreen = function(e, n)
    local e = t.createFullscreen(e, n)
    e:show()
    return e
  end,
  createFullscreen = function(n, e)
    local e = RevMobFullscreen.new({listener = n, placementIds = e})
    e:hide()
    e:load()
    return e
  end,
  openAdLink = function(e, n)
    local e = t.createAdLink(e, n)
    e:open()
    return e
  end,
  createAdLink = function(e, n)
    local e = RevMobAdLink.new({publisherListener = e, placementIds = n})
    e:load()
    return e
  end,
  createBanner = function(e, n)
    if e == nil then
      e = {}
    end
    e.placementIds = n
    local e = RevMobBanner.new(e)
    e:load()
    return e
  end,
  showPopup = function(e, n)
    local e = t.createPopup(e, n)
    e:show()
    return e
  end,
  createPopup = function(n, e)
    local e = RevMobPopup.new({publisherListener = n, placementIds = e})
    e:load()
    return e
  end,
  setTimeoutInSeconds = function(e)
    n.setTimeoutInSeconds(e)
  end,
  printEnvironmentInformation = function(t)
    e.printEnvironmentInformation(t, n.appId, n.testMode, n.timeout)
  end,
  setLogLevel = function(e)
    i.setLevel(e)
  end,
  setUserGender = function(n)
    e.setUserGender(n)
  end,
  getUserGender = function()
    return e.getUserGender()
  end,
  setUserAgeRangeMin = function(n)
    e.setUserAgeRangeMin(n)
  end,
  getUserAgeRangeMin = function()
    return e.getUserAgeRangeMin()
  end,
  setUserAgeRangeMax = function(n)
    e.setUserAgeRangeMax(n)
  end,
  getUserAgeRangeMax = function()
    return e.getUserAgeRangeMax()
  end,
  setUserBirthday = function(n)
    e.setUserBirthday(n)
  end,
  getUserBirthday = function()
    return e.getUserBirthday()
  end,
  setUserPage = function(n)
    e.setUserPage(n)
  end,
  getUserPage = function()
    return e.getUserPage()
  end,
  setUserInterests = function(n)
    e.setUserInterests(n)
  end,
  getUserInterests = function()
    return e.getUserInterests()
  end,
  setUserLocationLatitude = function(n)
    e.setUserLocationLatitude(n)
  end,
  setUserLocationLongitude = function(n)
    e.setUserLocationLongitude(n)
  end,
  setUserLocationAccuracy = function(n)
    e.setUserLocationAccuracy(n)
  end
}
return t
