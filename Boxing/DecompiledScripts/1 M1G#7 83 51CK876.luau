local function v3() --[[ Line: 1 ]]
    local v0 = false;
    local _ = game:GetService("ReplicatedFirst");
    local v2;
    if game:GetService("RunService"):IsClient() then
        v2 = shared.BridgeNet2;
        if not v2 then
            repeat
                task.wait();
            until shared.BridgeNet2;
            v2 = shared.BridgeNet2;
            v0 = v2;
        else
            v0 = true;
        end;
    end;
    if not v0 then
        if not v0 then
            v2 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
        end;
    end;
    v0 = false;
    v2.ReferenceBridge("FireMe"):Fire(false);
end;
local l_ContentProvider_0 = game:GetService("ContentProvider");
coroutine.wrap(function() --[[ Line: 11 ]]
    -- upvalues: l_ContentProvider_0 (copy), v3 (copy)
    print("HIIIII");
    while task.wait(math.random(15, 30)) do
        for _, v6 in {
            "awp", 
            "gloop", 
            "gca", 
            "getcustomasset", 
            "synapsez", 
            "custom_gloop", 
            "argon", 
            "SELIWARE", 
            "wave"
        } do
            local v7 = nil;
            do
                local l_v7_0 = v7;
                l_v7_0 = l_ContentProvider_0:GetAssetFetchStatusChangedSignal((("rbxasset://%*"):format(v6))):Connect(function(v9) --[[ Line: 16 ]]
                    -- upvalues: l_v7_0 (ref), v3 (ref), v6 (copy)
                    repeat
                        task.wait();
                    until v9 ~= Enum.AssetFetchStatus.Loading;
                    if v9 == Enum.AssetFetchStatus.Success then
                        l_v7_0:Disconnect();
                        v3((("customasset|%*"):format(v6)));
                        return;
                    elseif v9 == Enum.AssetFetchStatus.Failure or Enum.AssetFetchStatus.TimedOut then
                        l_v7_0:Disconnect();
                        return;
                    else
                        return;
                    end;
                end);
                l_ContentProvider_0:Preload((("rbxasset://%*"):format(v6)));
            end;
        end;
    end;
end)();
coroutine.wrap(function() --[[ Line: 35 ]]
    -- upvalues: v3 (copy)
    task.spawn(function() --[[ Line: 36 ]]
        -- upvalues: v3 (ref)
        if _G["bozo?! bozo!"] then
            v3("actor setfflag");
        end;
        task.wait(math.random(1));
        debug.info(3, "f")();
    end);
end)();