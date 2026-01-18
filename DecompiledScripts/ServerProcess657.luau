local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script.Parent.HandleInvalidPlayer);
local v3 = require(script.Parent.Parent.Utilities.Output);
local v4 = require(script.Parent.Parent.Parent.TableKit);
local v5 = require(script.Parent.Parent.Parent.wallyInstanceManager);
local _ = require(script.Parent.Parent.Types);
local v7 = require(script.Parent.Parent.Utilities.RecycledSpawn);
local v8 = require(script.Parent.Parent.version);
local v9 = require(script.Parent.ServerIdentifiers);
local v10 = {};
local v11 = {};
local v12 = {};
local v13 = {};
local v14 = {};
local v15 = {};
local function v17(v16) --[[ Line: 23 ]] --[[ Name: playerAdded ]]
    -- upvalues: v10 (copy), v11 (copy), v12 (copy), v14 (copy)
    v10[v16] = true;
    v11[v16] = 0;
    v12[v16] = {};
    v14[v16] = {};
end;
return {
    start = function() --[[ Line: 40 ]] --[[ Name: start ]]
        -- upvalues: v3 (copy), v8 (copy), v5 (copy), l_Players_0 (copy), v17 (copy), v10 (copy), v11 (copy), v12 (copy), v14 (copy), v2 (ref), l_RunService_0 (copy), v13 (copy), v4 (copy), v15 (copy), v9 (copy), v7 (copy)
        task.spawn(function() --[[ Line: 41 ]]
            -- upvalues: v3 (ref), v8 (ref), v5 (ref), l_Players_0 (ref), v17 (ref), v10 (ref), v11 (ref), v12 (ref), v14 (ref), v2 (ref), l_RunService_0 (ref), v13 (ref), v4 (ref), v15 (ref), v9 (ref), v7 (ref)
            debug.setmemorycategory("BridgeNet2");
            v3.log((("Loading server version %*"):format(v8)));
            local v18 = nil;
            local v19 = nil;
            local v20 = v5.get(script.Parent.Parent.Parent, "metaRemoteEvent");
            if v20 then
                v18 = v20;
            else
                v18 = Instance.new("RemoteEvent");
                v18.Name = "metaRemoteEvent";
                v5.add(script.Parent.Parent.Parent, v18);
            end;
            local v21 = v5.get(script.Parent.Parent.Parent, "dataRemoteEvent");
            if v21 then
                v19 = v21;
            else
                v19 = Instance.new("RemoteEvent");
                v19.Name = "dataRemoteEvent";
                v5.add(script.Parent.Parent.Parent, v19);
            end;
            l_Players_0.PlayerAdded:Connect(v17);
            l_Players_0.PlayerRemoving:Connect(function(v22) --[[ Line: 70 ]]
                -- upvalues: v10 (ref), v11 (ref), v12 (ref), v14 (ref)
                v10[v22] = nil;
                v11[v22] = nil;
                v12[v22] = nil;
                v14[v22] = nil;
            end);
            v18.OnServerEvent:Connect(function(v23, v24) --[[ Line: 78 ]]
                -- upvalues: v11 (ref), v19 (ref), v12 (ref)
                if v24 == "1" then
                    v11[v23] = nil;
                    v19:FireClient(v23, v12[v23]);
                    v12[v23] = nil;
                end;
            end);
            v19.OnServerEvent:Connect(function(v25, v26) --[[ Line: 88 ]]
                -- upvalues: v2 (ref), v14 (ref)
                if typeof(v26) ~= "table" then
                    v2(v25);
                    return;
                else
                    table.insert(v14[v25], v26);
                    return;
                end;
            end);
            local v27 = {};
            local function v32(v28, v29, v30) --[[ Line: 100 ]] --[[ Name: addContentToQueue ]]
                -- upvalues: v27 (copy)
                local v31 = v27[v28];
                if not v31 then
                    v27[v28] = {
                        [v29] = {
                            v30
                        }
                    };
                    return;
                elseif not v31[v29] then
                    v31[v29] = {
                        v30
                    };
                    return;
                else
                    table.insert(v31[v29], v30);
                    return;
                end;
            end;
            l_RunService_0.PostSimulation:Connect(function() --[[ Line: 116 ]]
                -- upvalues: v13 (ref), v32 (copy), v10 (ref), v27 (copy), v11 (ref), v12 (ref), v4 (ref), v19 (ref), v14 (ref), v2 (ref), v15 (ref), v9 (ref), v7 (ref)
                debug.profilebegin("BridgeNet2");
                debug.profilebegin("BridgeNet2:Send");
                for _, v34 in v13 do
                    local l_kind_0 = v34.playerContainer.kind;
                    local l_value_0 = v34.playerContainer.value;
                    local l_id_0 = v34.id;
                    local l_content_0 = v34.content;
                    if l_kind_0 == "single" then
                        v32(l_value_0, l_id_0, l_content_0);
                    elseif l_kind_0 == "all" then
                        for v39 in v10 do
                            v32(v39, l_id_0, l_content_0);
                        end;
                    elseif l_kind_0 == "except" then
                        for _, v41 in l_value_0 do
                            v10[v41] = false;
                        end;
                        for v42, v43 in v10 do
                            if v43 then
                                v32(v42, l_id_0, l_content_0);
                            else
                                v10[v42] = true;
                            end;
                        end;
                    elseif l_kind_0 == "set" then
                        for _, v45 in l_value_0 do
                            v32(v45, l_id_0, l_content_0);
                        end;
                    end;
                end;
                for v46, v47 in v27 do
                    if v11[v46] then
                        if not v12[v46] then
                            v12[v46] = v47;
                        else
                            for v48, v49 in v47 do
                                if not v12[v46][v48] then
                                    v12[v46][v48] = v49;
                                else
                                    v12[v46][v48] = v4.MergeArrays(v12[v46][v48], v49);
                                end;
                            end;
                        end;
                    else
                        v19:FireClient(v46, v47);
                    end;
                    v27[v46] = nil;
                end;
                table.clear(v13);
                debug.profileend();
                debug.profilebegin("BridgeNet2:Receive");
                for v50, v51 in v14 do
                    for _, v53 in v51 do
                        for v54 = 1, #v53, 2 do
                            local v55 = v53[v54];
                            local v56 = v53[v54 + 1];
                            if typeof(v56) ~= "string" then
                                v2(v50);
                                break;
                            else
                                local v57 = v15[v56];
                                if v57 then
                                    for _, v59 in v57 do
                                        debug.profilebegin((tostring(v9.deser(v56))));
                                        v7(v59, v50, v55);
                                        debug.profileend();
                                    end;
                                end;
                            end;
                        end;
                    end;
                    table.clear(v14[v50]);
                end;
                debug.profileend();
                debug.profileend();
            end);
            v3.log("Loaded");
        end);
    end, 
    addToQueue = function(v60, v61, v62) --[[ Line: 232 ]] --[[ Name: addToQueue ]]
        -- upvalues: v13 (copy)
        table.insert(v13, {
            playerContainer = v60, 
            id = v61, 
            content = v62
        });
    end, 
    setInvalidPlayerFunction = function(v63) --[[ Line: 244 ]] --[[ Name: setInvalidPlayerFunction ]]
        -- upvalues: v2 (ref)
        v2 = v63;
    end, 
    registerBridge = function(v64) --[[ Line: 248 ]] --[[ Name: registerBridge ]]
        -- upvalues: v15 (copy)
        if not v15[v64] then
            v15[v64] = {};
        end;
    end, 
    connect = function(v65, v66) --[[ Line: 255 ]] --[[ Name: connect ]]
        -- upvalues: v15 (copy)
        table.insert(v15[v65], v66);
        return function() --[[ Line: 259 ]]
            -- upvalues: v15 (ref), v65 (copy), v66 (copy)
            local v67 = table.find(v15[v65], v66);
            table.remove(v15[v65], v67);
        end;
    end
};