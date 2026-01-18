local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Parent.Parent.wallyInstanceManager);
local _ = require(script.Parent.Parent.Types);
local v3 = require(script.Parent.Parent.Utilities.Output);
local v4 = require(script.Parent.Parent.Utilities.RecycledSpawn);
local v5 = require(script.Parent.Parent.version);
local v6 = {};
local v7 = 0;
local v8 = {};
local v9 = {};
return {
    start = function() --[[ Line: 17 ]] --[[ Name: start ]]
        -- upvalues: v3 (copy), v5 (copy), v1 (copy), v8 (copy), l_RunService_0 (copy), v7 (ref), v6 (copy), v9 (copy), v4 (copy)
        debug.setmemorycategory("BridgeNet2");
        v3.log((("Loading client version %*"):format(v5)));
        local v10 = v1.waitForInstance(script.Parent.Parent.Parent, "dataRemoteEvent", 1);
        local v11 = v1.waitForInstance(script.Parent.Parent.Parent, "metaRemoteEvent", 1);
        v10.OnClientEvent:Connect(function(v12) --[[ Line: 27 ]]
            -- upvalues: v8 (ref)
            table.insert(v8, v12);
        end);
        l_RunService_0.PostSimulation:Connect(function() --[[ Line: 31 ]]
            -- upvalues: v7 (ref), v10 (copy), v6 (ref), v8 (ref), v9 (ref), v4 (ref)
            debug.profilebegin("BridgeNet2");
            if v7 > 0 then
                v10:FireServer({
                    table.unpack(v6, 1, v7)
                });
                v7 = 0;
                table.clear(v6);
            end;
            debug.profilebegin("BridgeNet2:Receive");
            for _, v14 in v8 do
                for v15, v16 in v14 do
                    local v17 = v9[v15];
                    if v17 then
                        if #v17 == 1 then
                            local v18 = v17[1];
                            if #v16 == 0 then
                                v4(v18);
                            else
                                for _, v20 in v16 do
                                    v4(v18, v20);
                                end;
                            end;
                        elseif #v16 == 0 then
                            for _, v22 in v17 do
                                v4(v22);
                            end;
                        else
                            for _, v24 in v17 do
                                for _, v26 in v16 do
                                    v4(v24, v26);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            table.clear(v8);
            debug.profileend();
        end);
        task.spawn(function() --[[ Line: 82 ]]
            -- upvalues: v11 (copy)
            for _ = 1, 15 do
                task.wait();
            end;
            v11:FireServer("1");
        end);
        v3.log("Loaded");
    end, 
    registerBridge = function(v28) --[[ Line: 95 ]] --[[ Name: registerBridge ]]
        -- upvalues: v9 (copy)
        if not v9[v28] then
            v9[v28] = {};
        end;
    end, 
    addToQueue = function(v29, v30) --[[ Line: 102 ]] --[[ Name: addToQueue ]]
        -- upvalues: v6 (copy), v7 (ref)
        v6[v7 + 1] = v30;
        v6[v7 + 2] = v29;
        v7 = v7 + 2;
    end, 
    connect = function(v31, v32) --[[ Line: 111 ]] --[[ Name: connect ]]
        -- upvalues: v9 (copy)
        table.insert(v9[v31], v32);
        return function() --[[ Line: 115 ]]
            -- upvalues: v9 (ref), v31 (copy), v32 (copy)
            local v33 = table.find(v9[v31], v32);
            table.remove(v9[v31], v33);
        end;
    end
};