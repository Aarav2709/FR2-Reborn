local root = arg and arg[0] and arg[0]:match("^(.*[/\\])") or ""
if root ~= "" then
  root = root .. ".."
else
  root = "."
end

package.path = table.concat({
  root .. "/?.lua",
  root .. "/?/init.lua",
  root .. "/tests/?.lua",
  package.path
}, ";")

local tests = {
  "tests.ads.videoSelection_test",
  "tests.modules.marketplaceIndex_test",
  "tests.modules.animationSequenceBuilder_test"
}

local total = 0
local failed = 0

local function runTest(name, fn)
  total = total + 1
  local ok, err = pcall(fn)
  if ok then
    print("ok - " .. name)
  else
    failed = failed + 1
    print("not ok - " .. name)
    print("  " .. tostring(err):gsub("\n", "\n  "))
  end
end

local test = {}

function test.case(name, fn)
  runTest(name, fn)
end

for _, moduleName in ipairs(tests) do
  local ok, moduleOrError = pcall(require, moduleName)
  if not ok then
    failed = failed + 1
    print("not ok - load " .. moduleName)
    print("  " .. tostring(moduleOrError):gsub("\n", "\n  "))
  else
    moduleOrError(test)
  end
end

print(string.format("%d tests, %d failures", total, failed))

if failed > 0 then
  os.exit(1)
end
