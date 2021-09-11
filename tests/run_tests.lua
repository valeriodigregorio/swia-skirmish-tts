-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

function shell_run(cmd)
    local f = io.popen(cmd)
    if not f then
        error("ERROR: Cannot run command: "..cmd)
    end
    local output = f:read("*a")
    return output:gsub("^%s*(.-)%s*$", "%1")
end

local working_dir = arg[0]
if not working_dir:find("swia%-skirmish%-tts") then
    local pwd = shell_run("pwd")
    if not pwd:find("swia%-skirmish%-tts") then
        error("Invalid working directories: "..working_dir..", "..pwd)
    end
    working_dir = pwd
end
working_dir = working_dir:gsub("(.*/swia%-skirmish%-tts).*$", "%1")
print("working.dir = "..working_dir)

local tests_path = working_dir.."/tests"
print("tests.dir = "..tests_path)

package.path = working_dir:gsub("(.*)/.*$", "%1").."/?.lua;"..tests_path.."/?.lua;"..working_dir.."/packages/share/lua/5.3/?.lua;"
print("package.path = "..package.path.."\n")

require("utils")
require("assert")
require("tts_mocks")

local TestResult = {
    [true] = "PASSED",
    [false] = "FAILED",
}

local function runTest(lua_module)
    print("================================================================================")
    print("Test Suite: "..lua_module)
    print("--------------------------------------------------------------------------------")
    local mod = require(lua_module)
    local n = 0
    local passed = 0
    for name, entry in pairs(mod) do
        if type(entry) == 'function' and name:find("test_") == 1 then
            local status, err = pcall(entry)
            n = n + 1
            if status then
                passed = passed + 1
            end
            print(name, TestResult[status], err or "")
        end
    end
    print("--------------------------------------------------------------------------------")
    print("TOTAL: "..n..", PASSED: "..passed..", FAILED: "..(n-passed))
    print("================================================================================\n")
    return passed, n
end

local function runTests(args)
    local success = true
    local filenames = getFilenames(tests_path)
    local total_tests = 0
    local total_passed = 0
    for _, filename in ipairs(filenames) do
        filename = filename:gsub(".lua", "")
        if filename:find("test_") and (args == nil or args[filename] ~= nil) then
            local passed, n = runTest(filename)
            total_tests = total_tests + n
            total_passed = total_passed + passed
            if n > passed then
                success = false
            end
        end
    end
    if args == nil then
        print("================================================================================")
        print("Test Project: "..tests_path)
        print("--------------------------------------------------------------------------------")
        print("TOTAL: "..total_tests..", PASSED: "..total_passed..", FAILED: "..(total_tests-total_passed))
        print("================================================================================\n")
    end
    return success
end


local args = nil
if #arg > 0 and arg[1] ~= "run_tests" then
    args = {}
    for i=1, #arg do
        args[arg[i]] = arg[i]
    end
end

local success = runTests(args)
sleep(1000)
if success then
    os.exit(0)
else
    os.exit(1)
end
