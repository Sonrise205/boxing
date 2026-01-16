local l_Async_0 = game:GetService("ReplicatedFirst"):WaitForChild("Async");
local v1 = require(l_Async_0.Parent.TypeGuard);
local v2 = require(l_Async_0);
local _ = function(v3, v4) --[[ Line: 6 ]] --[[ Name: GenerateBenchmarks ]]
    return {
        [v3 .. "Spawn"] = function() --[[ Line: 8 ]]
            -- upvalues: v4 (copy)
            for _ = 1, 100 do
                v4(function() --[[ Line: 10 ]]

                end);
            end;
        end
    };
end;
local v7 = {};
local l_Old_0 = l_Async_0:FindFirstChild("Old");
if l_Old_0 then
    local l_Spawn_0 = require(l_Old_0).Spawn;
    local l_l_Spawn_0_0 = l_Spawn_0 --[[ copy: 10 -> 13 ]];
    for v12, v13 in {
        OldAsyncSpawn = function() --[[ Line: 8 ]]
            -- upvalues: l_l_Spawn_0_0 (copy)
            for _ = 1, 100 do
                l_l_Spawn_0_0(function() --[[ Line: 10 ]]

                end);
            end;
        end
    } do
        v7[v12] = v13;
    end;
end;
local l_Spawn_1 = v2.Spawn;
local l_l_Spawn_1_0 = l_Spawn_1 --[[ copy: 10 -> 12 ]];
for v17, v18 in {
    [">NewAsyncSpawn"] = function() --[[ Line: 8 ]]
        -- upvalues: l_l_Spawn_1_0 (copy)
        for _ = 1, 100 do
            l_l_Spawn_1_0(function() --[[ Line: 10 ]]

            end);
        end;
    end
} do
    v7[v17] = v18;
end;
l_Spawn_1 = task.spawn;
for v20, v21 in {
    RobloxAsyncSpawn = function() --[[ Line: 8 ]]
        -- upvalues: l_Spawn_1 (copy)
        for _ = 1, 100 do
            l_Spawn_1(function() --[[ Line: 10 ]]

            end);
        end;
    end
} do
    v7[v20] = v21;
end;
v1.SetContextEnabled("Async", false);
v1.SetContextEnabled("Old", false);
return {
    ParameterGenerator = function() --[[ Line: 37 ]] --[[ Name: ParameterGenerator ]]

    end, 
    Functions = v7
};