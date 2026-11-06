-- checks dev codes made by tools/devcode/devcode.js: Schnorr signatures over a player's Dev ID.
-- Lua 5.1 has no integers or bit operations, so big numbers are arrays of 24-bit limbs
-- (least significant first) and products stay below 2^53, where doubles are exact.
local M = {}

local floor = math.floor
local B = 16777216 -- 2^24
local ALPHABET = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
local CODE_BYTES = 49 -- action, 16 challenge bytes, 32 bytes of s

M.ACTION_MAX = 1

-- Dev IDs and codes are typed by people: ignore case and separators, read O as 0 and I/L as 1
function M.normalize(text)
  return (tostring(text or ""):upper():gsub("[^%w]", ""):gsub("O", "0"):gsub("[IL]", "1"))
end

local function fromHex(hex, limbs)
  local n = {}
  for i = 1, limbs do
    local last = #hex - (i - 1) * 6
    n[i] = last > 0 and tonumber(hex:sub(math.max(1, last - 5), last), 16) or 0
  end
  return n
end

-- big-endian bytes; a 24-bit limb is exactly three bytes
local function toBytes(n, length)
  local out = {}
  for i = #n, 1, -1 do
    local limb = n[i]
    local a = floor(limb / 65536)
    local b = floor(limb / 256) % 256
    out[#out + 1] = string.char(a, b, limb % 256)
  end
  local text = table.concat(out)
  return text:sub(-length)
end

-- Montgomery product a*b/R mod p (CIOS with the reduction folded into the same pass)
local function montMul(a, b, p, n0, L)
  local t = {}
  for i = 1, L + 1 do
    t[i] = 0
  end
  local p1, b1 = p[1], b[1]
  for i = 1, L do
    local ai = a[i]
    local m = (((t[1] + ai * b1) % B) * n0) % B
    local x = t[1] + ai * b1 + m * p1
    local carry = floor(x / B)
    for j = 2, L do
      x = t[j] + ai * b[j] + m * p[j] + carry
      carry = floor(x / B)
      t[j - 1] = x - carry * B
    end
    x = t[L + 1] + carry
    carry = floor(x / B)
    t[L] = x - carry * B
    t[L + 1] = carry
  end
  -- the result is below 2p: subtract p once if it is not below p
  local geq = t[L + 1] > 0
  if not geq then
    geq = true
    for i = L, 1, -1 do
      if t[i] ~= p[i] then
        geq = t[i] > p[i]
        break
      end
    end
  end
  if geq then
    local borrow = 0
    for i = 1, L do
      local x = t[i] - p[i] - borrow
      if x < 0 then
        x = x + B
        borrow = 1
      else
        borrow = 0
      end
      t[i] = x
    end
  end
  t[L + 1] = nil
  return t
end

local function bitsOf(bytes)
  local bits = {}
  for i = 1, #bytes do
    local byte = bytes:byte(i)
    for shift = 7, 0, -1 do
      bits[#bits + 1] = floor(byte / 2 ^ shift) % 2
    end
  end
  return bits
end

local function decodeBase32(text)
  local out = {}
  local value, bits = 0, 0
  for i = 1, #text do
    local digit = ALPHABET:find(text:sub(i, i), 1, true)
    if not digit then
      return nil
    end
    value = value * 32 + (digit - 1)
    bits = bits + 5
    if bits >= 8 then
      bits = bits - 8
      local byte = floor(value / 2 ^ bits)
      value = value - byte * 2 ^ bits
      out[#out + 1] = string.char(byte)
    end
  end
  return table.concat(out)
end

local function defaultSha256(data)
  return crypto.digest(crypto.sha256, data)
end

-- returns the code's action if it is a valid code for this Dev ID, or nil and a reason
function M.verify(devId, codeText, key, sha256)
  key = key or require("lua.modules.devUnlockKey")
  sha256 = sha256 or defaultSha256
  local bytes = decodeBase32(M.normalize(codeText))
  if not bytes or #bytes ~= CODE_BYTES then
    return nil, "That code is not complete."
  end
  local action = bytes:byte(1)
  local challenge = bytes:sub(2, 17)
  local sBits, cBits = bitsOf(bytes:sub(18, 49)), bitsOf(challenge)
  local L, n0 = key.limbs, key.n0
  local p = fromHex(key.p, L)
  local g, yInv, gyInv = fromHex(key.gM, L), fromHex(key.yInvM, L), fromHex(key.gyInvM, L)
  -- r = g^s * y^-c, both exponents in one square-and-multiply pass (c is the shorter one)
  local x = fromHex(key.oneM, L)
  local offset = #sBits - #cBits
  -- this takes a second or more on phones: run inside a coroutine, it pauses so frames keep drawing
  local co = coroutine.running()
  for i = 1, #sBits do
    if co and i % 4 == 0 then
      coroutine.yield()
    end
    x = montMul(x, x, p, n0, L)
    local sBit, cBit = sBits[i] == 1, i > offset and cBits[i - offset] == 1
    if sBit and cBit then
      x = montMul(x, gyInv, p, n0, L)
    elseif sBit then
      x = montMul(x, g, p, n0, L)
    elseif cBit then
      x = montMul(x, yInv, p, n0, L)
    end
  end
  local one = { 1 }
  for i = 2, L do
    one[i] = 0
  end
  local r = montMul(x, one, p, n0, L)
  local message = "FR2R-DEV|v1|" .. M.normalize(devId) .. "|" .. action
  local digest = sha256(toBytes(r, key.bytes) .. message)
  local expected = {}
  for i = 1, 16 do
    expected[i] = string.format("%02x", challenge:byte(i))
  end
  if digest:sub(1, 32):lower() ~= table.concat(expected) then
    return nil, "That code is not for this account."
  end
  return action
end

return M
