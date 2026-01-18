local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local _ = game:GetService("MessagingService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_RunService_0 = game:GetService("RunService");
local _ = require(l_ReplicatedFirst_0:WaitForChild("TableUtil"));
local l_Cleaner_0 = require(l_ReplicatedFirst_0:WaitForChild("Cleaner"));
local l_XSignal_0 = require(l_ReplicatedFirst_0:WaitForChild("XSignal"));
local l_Rosyn_0 = require(l_ReplicatedFirst_0:WaitForChild("Rosyn"));
local l_TypeGuard_0 = require(l_ReplicatedFirst_0:WaitForChild("TypeGuard"));
local l_Workspace_0 = game:GetService("Workspace");
local l_Appliers_0 = script:WaitForChild("Appliers");
local l_UpdateMetadata_0 = script:WaitForChild("UpdateMetadata");
local v13 = {
    Type = "RemoteConfig"
};
v13.__index = v13;
v13.new = function(v14) --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: l_Cleaner_0 (copy), v13 (copy)
    return (setmetatable({
        _Root = v14, 
        _Cleaner = l_Cleaner_0.new(), 
        _CategorySyncEvents = {}
    }, v13));
end;
v13.Initial = function(v15) --[[ Line: 36 ]] --[[ Name: Initial ]]
    -- upvalues: l_Appliers_0 (copy), l_RunService_0 (copy)
    l_Appliers_0:WaitForChild("_Deserialize");
    if l_RunService_0:IsServer() then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 50 ]]
            -- upvalues: v15 (copy)
            return v15:PullAllMetadata();
        end);
        if not l_status_0 then
            warn((("[RemoteConfig] Failed to get from cloud: %*"):format(l_result_0)));
        end;
        workspace:SetAttribute("INITIAL_REMOTE_CONFIG_SYNC", true);
    end;
end;
v13.GetCategories = function(_) --[[ Line: 62 ]] --[[ Name: GetCategories ]]
    -- upvalues: l_Appliers_0 (copy)
    local v19 = {};
    for _, v21 in l_Appliers_0:GetChildren() do
        if v21.Name:sub(1, 1) ~= "_" then
            table.insert(v19, v21.Name);
        end;
    end;
    return v19;
end;
v13.GetCategorySyncEvent = function(v22, v23) --[[ Line: 76 ]] --[[ Name: GetCategorySyncEvent ]]
    -- upvalues: l_XSignal_0 (copy)
    local l__CategorySyncEvents_0 = v22._CategorySyncEvents;
    if not l__CategorySyncEvents_0[v23] then
        l__CategorySyncEvents_0[v23] = l_XSignal_0.new();
    end;
    return l__CategorySyncEvents_0[v23];
end;
local v25 = l_TypeGuard_0.Params(l_TypeGuard_0.String());
v13.PullMetadata = function(v26, v27) --[[ Line: 95 ]] --[[ Name: PullMetadata ]]
    -- upvalues: v25 (copy), l_RunService_0 (copy), l_ServerScriptService_0 (copy), l_UpdateMetadata_0 (copy)
    v25(v27);
    assert(l_RunService_0:IsServer(), "PullMetadata can only be called on the server");
    local l_values_0 = require(l_ServerScriptService_0:WaitForChild("FetchSheet"))({
        v27
    })[1].values;
    v26:_ApplyCustomMetadata(v27, l_values_0);
    l_UpdateMetadata_0:FireAllClients({
        Category = v27, 
        Data = l_values_0
    });
end;
v13.PullAllMetadata = function(v29) --[[ Line: 105 ]] --[[ Name: PullAllMetadata ]]
    -- upvalues: l_RunService_0 (copy), l_ServerScriptService_0 (copy), l_UpdateMetadata_0 (copy), l_ReplicatedStorage_0 (copy)
    assert(l_RunService_0:IsServer(), "PullAllMetadata can only be called on the server");
    local v30 = require(l_ServerScriptService_0:WaitForChild("FetchSheet"))(v29:GetCategories());
    v29._CachedValues = v30;
    for _, v32 in v30 do
        local v33 = v32.range:match("(%w+)%!");
        local l_values_1 = v32.values;
        v29:_ApplyCustomMetadata(v33, l_values_1);
        l_UpdateMetadata_0:FireAllClients({
            Category = v33, 
            Data = l_values_1
        });
    end;
    local l_Events_0 = l_ReplicatedStorage_0:FindFirstChild("Events");
    local v36 = l_Events_0 and l_Events_0:FindFirstChild("RemoteConfigLoaded");
    if v36 then
        v36:Fire();
    end;
    local v37 = require(l_ReplicatedStorage_0:WaitForChild("Modules", 30):WaitForChild("Styles", 30));
    for v38, v39 in v37 do
        if v39.Init then
            v37[v38] = v39.Init();
        end;
    end;
    warn("FINDME: " .. v37.Supernova.HeavyAttacks.DefaultPunchInfo.MeterCharge);
end;
local v40 = l_TypeGuard_0.Params(l_TypeGuard_0.String(), l_TypeGuard_0.Array());
v13._ApplyCustomMetadata = function(v41, v42, v43) --[[ Line: 137 ]] --[[ Name: _ApplyCustomMetadata ]]
    -- upvalues: v40 (copy), l_Appliers_0 (copy)
    v40(v42, v43);
    task.spawn(function() --[[ Line: 140 ]]
        -- upvalues: l_Appliers_0 (ref), v42 (copy), v43 (copy), v41 (copy)
        local l_status_1, l_result_1 = pcall(require(l_Appliers_0[v42]), v43);
        if not l_status_1 then
            task.spawn(error, (("Failed to apply metadata for %*:\n%*"):format(v42, l_result_1)));
        end;
        v41:GetCategorySyncEvent(v42):Fire();
    end);
end;
v13.Destroy = function(v46) --[[ Line: 158 ]] --[[ Name: Destroy ]]
    v46._Cleaner:Clean();
end;
v13.__tostring = function(v47) --[[ Line: 162 ]] --[[ Name: __tostring ]]
    return ("RemoteConfig(%s)"):format(v47._Root:GetFullName());
end;
v13.Register = {
    Components = l_Rosyn_0.Setup.Tags({
        Workspace = v13
    })
};
if l_RunService_0:IsClient() then
    print("Listening to event...");
    l_UpdateMetadata_0.OnClientEvent:Connect(function(v48) --[[ Line: 183 ]]
        -- upvalues: l_Rosyn_0 (copy), l_Workspace_0 (copy), v13 (copy), l_ReplicatedStorage_0 (copy)
        print("Client received remote config payload for '", v48.Category, "'");
        local l_Category_0 = v48.Category;
        local l_Data_0 = v48.Data;
        workspace:SetAttribute(("INITIAL_REMOTE_CONFIG_SYNC_CLIENT_%*"):format(l_Category_0), true);
        l_Rosyn_0.AwaitComponentInit(l_Workspace_0, v13):_ApplyCustomMetadata(l_Category_0, l_Data_0);
        local l_Events_1 = l_ReplicatedStorage_0:FindFirstChild("Events");
        local v52 = l_Events_1 and l_Events_1:FindFirstChild("RemoteConfigLoaded");
        if v52 then
            v52:Fire();
        end;
    end);
    l_UpdateMetadata_0:FireServer();
    return v13;
else
    l_UpdateMetadata_0.OnServerEvent:Connect(function(v53) --[[ Line: 200 ]]
        -- upvalues: l_Rosyn_0 (copy), l_Workspace_0 (copy), v13 (copy), l_UpdateMetadata_0 (copy)
        local l__CachedValues_0 = l_Rosyn_0.AwaitComponentInit(l_Workspace_0, v13)._CachedValues;
        if l__CachedValues_0 then
            for _, v56 in l__CachedValues_0 do
                local v57 = v56.range:match("(%w+)%!");
                local l_values_2 = v56.values;
                l_UpdateMetadata_0:FireClient(v53, {
                    Category = v57, 
                    Data = l_values_2
                });
            end;
        end;
    end);
    return v13;
end;