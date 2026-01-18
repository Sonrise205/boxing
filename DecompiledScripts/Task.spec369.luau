local function v0(...) --[[ Line: 4 ]] --[[ Name: anyfn ]]
    return {};
end;
it = it or v0;
expect = expect or v0;
describe = describe or v0;
local v1 = require(script.Parent);
local l_Task_0 = require(script.Parent:WaitForChild("Task"));
return function() --[[ Line: 12 ]]
    -- upvalues: l_Task_0 (copy), v1 (copy)
    describe("usingDelay", function() --[[ Line: 13 ]]
        -- upvalues: l_Task_0 (ref)
        it("should emulate Async.Delay", function() --[[ Line: 14 ]]
            -- upvalues: l_Task_0 (ref)
            local v3 = false;
            l_Task_0.usingDelay(0, function() --[[ Line: 17 ]]
                -- upvalues: v3 (ref)
                v3 = true;
            end);
            expect(v3).to.equal(false);
            task.wait();
            expect(v3).to.equal(true);
        end);
    end);
    describe("usingDefer", function() --[[ Line: 27 ]]
        -- upvalues: l_Task_0 (ref), v1 (ref)
        it("should emulate Async.Defer", function() --[[ Line: 28 ]]
            -- upvalues: l_Task_0 (ref), v1 (ref)
            local v4 = false;
            l_Task_0.usingDefer(function() --[[ Line: 31 ]]
                -- upvalues: v4 (ref)
                v4 = true;
            end);
            expect(v4).to.equal(false);
            v1.DeferWait();
            expect(v4).to.equal(true);
        end);
    end);
    describe("new", function() --[[ Line: 41 ]]
        -- upvalues: l_Task_0 (ref)
        it("should be the same implementation as usingTimeLimit", function() --[[ Line: 42 ]]
            -- upvalues: l_Task_0 (ref)
            expect(l_Task_0.new).to.equal(l_Task_0.usingTimeLimit);
        end);
        it("should emulate Async.SpawnTimed", function() --[[ Line: 46 ]]
            -- upvalues: l_Task_0 (ref)
            local v5 = false;
            l_Task_0.new(function() --[[ Line: 49 ]]
                -- upvalues: v5 (ref)
                v5 = true;
            end);
            expect(v5).to.equal(true);
        end);
    end);
    describe("DidComplete", function() --[[ Line: 57 ]]

    end);
end;