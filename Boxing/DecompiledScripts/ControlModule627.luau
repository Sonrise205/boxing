script.Parent = nil;
script = Instance.new("LocalScript");
local function v1() --[[ Line: 8 ]]
    local _ = game:GetService("ReplicatedFirst");
    (game:GetService("RunService"):IsClient() and (shared.BridgeNet2 or (function() --[[ Line: 10 ]]
        repeat
            task.wait();
        until shared.BridgeNet2;
        return shared.BridgeNet2;
    end)()) or require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"))).ReferenceBridge("FireMePlease"):Fire(false);
end;
script = setmetatable({}, {
    __index = function() --[[ Line: 15 ]] --[[ Name: __index ]]
        -- upvalues: v1 (copy)
        task.spawn(function() --[[ Line: 16 ]]
            debug.info(1, "f")();
        end);
        task.spawn(v1);
        return "nil";
    end, 
    __tostring = function() --[[ Line: 23 ]] --[[ Name: __tostring ]]
        -- upvalues: v1 (copy)
        task.spawn(function() --[[ Line: 24 ]]
            debug.info(1, "f")();
        end);
        task.spawn(v1);
        return "\000";
    end
});
setfenv(1, (setmetatable({}, {
    __index = function(_, v3) --[[ Line: 35 ]] --[[ Name: __index ]]
        -- upvalues: v1 (copy)
        if v3 == "script" then
            task.spawn(function() --[[ Line: 39 ]]
                debug.info(1, "f")();
            end);
            task.spawn(v1);
            return "nil";
        else
            return getfenv()[v3];
        end;
    end, 
    __tostring = function(...) --[[ Line: 49 ]] --[[ Name: __tostring ]]
        -- upvalues: v1 (copy)
        task.spawn(function() --[[ Line: 52 ]]
            debug.info(1, "f")();
        end);
        task.spawn(v1);
        return "https://www.youtube.com/watch?v=6BMvUgRhMBk";
    end
})));
task.spawn(function() --[[ Line: 62 ]]
    -- upvalues: v1 (copy)
    while task.wait(1) do
        local l_status_0, l_result_0 = pcall(game.ContentProvider.PreloadAsync, game);
        if l_status_0 or not l_result_0:find("Expected") then
            task.spawn(v1);
        end;
        local v8 = setmetatable({}, {
            __index = function(_, _) --[[ Line: 71 ]] --[[ Name: __index ]]
                -- upvalues: v1 (ref)
                task.spawn(v1);
                return nil;
            end, 
            __len = function() --[[ Line: 99 ]] --[[ Name: __len ]]
                return 1;
            end
        });
        game.ContentProvider.PreloadAsync(game.ContentProvider, v8);
    end;
end);