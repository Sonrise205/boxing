local v0 = false;
local _ = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_HttpService_0 = game:GetService("HttpService");
local l_MessagingService_0 = game:GetService("MessagingService");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local v8;
if game:GetService("RunService"):IsClient() then
    v8 = shared.BridgeNet2;
    if not v8 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v8 = shared.BridgeNet2;
        v0 = v8;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v8 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local v9 = require(l_ReplicatedFirst_0.Async);
local v10 = require(l_ReplicatedFirst_0.Rosyn);
local v11 = require(l_ReplicatedFirst_0.Vapor);
local v12 = v8.ReferenceBridge("BasicMessage");
local v13 = {};
v13.__index = v13;
v13.Type = "ServerEvents";
v13.Register = {
    Components = v10.Setup.Children(game, v13), 
    Filter = function(v14) --[[ Line: 29 ]] --[[ Name: Filter ]]
        -- upvalues: l_Workspace_0 (copy)
        return v14 == l_Workspace_0;
    end
};
v13.new = function(v15) --[[ Line: 34 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy)
    return (setmetatable({
        _Root = v15
    }, v13));
end;
v13.Initial = function(v16) --[[ Line: 40 ]] --[[ Name: Initial ]]
    -- upvalues: v11 (copy)
    v16._EventsStore = v11.InstanceReplication(v16._Root, "Events");
end;
v13.StartEvent = function(v17, v18, v19) --[[ Line: 45 ]] --[[ Name: StartEvent ]]
    -- upvalues: l_RunService_0 (copy), v9 (copy), l_Players_0 (copy), v12 (copy), l_Workspace_0 (copy)
    if not l_RunService_0:IsServer() then
        return false;
    else
        local l_v17_EventsStore_0 = v17:GetEventsStore();
        local v21 = require(script:FindFirstChild(v18));
        if l_v17_EventsStore_0[v18]:Get() then
            local v22 = l_v17_EventsStore_0[v18];
            v22.EndTimestamp:Set(v22.EndTimestamp:Get() + v21.Duration);
            if v21.OnExtend then
                local v23, v24 = v9.Await(v9.Spawn(v21.OnExtend, v21, v22, v19), 60);
                if not v23 then
                    task.spawn(error, (("[ServerEvents] Failed to extend event \"%*\": %*"):format(v18, v24)));
                    return false;
                end;
            end;
            if v21.ExtendMessages then
                local v25 = nil;
                if string.match(v19, "^Player/(%d+)$") then
                    local v26 = tonumber(string.match(v19, "^Player/(%d+)$"));
                    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v26);
                    if l_l_Players_0_PlayerByUserId_0 then
                        v25 = if l_l_Players_0_PlayerByUserId_0.DisplayName ~= l_l_Players_0_PlayerByUserId_0.Name then ("%* (%*)"):format(l_l_Players_0_PlayerByUserId_0.DisplayName, l_l_Players_0_PlayerByUserId_0.Name) else l_l_Players_0_PlayerByUserId_0.Name;
                    end;
                elseif string.match(v19, "^External/(.+)$") then
                    v25 = string.match(v19, "^External/(.+)$");
                end;
                for _, v29 in l_Players_0:GetPlayers() do
                    for v30 = 1, #v21.ExtendMessages do
                        local v31 = v21.ExtendMessages[v30];
                        if typeof(v31) == "function" then
                            v31 = v31(v25);
                        end;
                        v12:Fire(v29, {
                            Message = v31, 
                            IsRainbow = true
                        });
                    end;
                end;
            end;
            return true;
        else
            local v32 = l_v17_EventsStore_0[v18];
            v32.Source:Set(v19);
            v32.EndTimestamp:Set(l_Workspace_0:GetServerTimeNow() + v21.Duration);
            v32.StartTimestamp:Set(l_Workspace_0:GetServerTimeNow());
            local v33, v34 = v9.Await(v9.Spawn(v21.OnActivate, v21, v32, v19), 60);
            if not v33 then
                task.spawn(error, (("[ServerEvents] Failed to start event \"%*\": %*"):format(v18, v34)));
                return false;
            else
                if typeof(v34) ~= "function" then
                    warn((("[ServerEvents] Event \"%*\" has no clean-up function returned by OnActivate. It will not be cleaned up upon completion."):format(v18)));
                end;
                local v35 = nil;
                if string.match(v19, "^Player/(%d+)$") then
                    local v36 = tonumber(string.match(v19, "^Player/(%d+)$"));
                    local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v36);
                    if l_l_Players_0_PlayerByUserId_1 then
                        v35 = if l_l_Players_0_PlayerByUserId_1.DisplayName ~= l_l_Players_0_PlayerByUserId_1.Name then ("%* (%*)"):format(l_l_Players_0_PlayerByUserId_1.DisplayName, l_l_Players_0_PlayerByUserId_1.Name) else l_l_Players_0_PlayerByUserId_1.Name;
                    end;
                elseif string.match(v19, "^External/(.+)$") then
                    v35 = string.match(v19, "^External/(.+)$");
                end;
                local v38 = {
                    ("EVENT %* was started%*"):format(v21.DisplayName, v35 and (" by <gold>%*</gold>!"):format(v35) or ""), 
                    table.unpack(v21.ActivationMessages or {})
                };
                local function v42(v39) --[[ Line: 147 ]] --[[ Name: AnnounceEvent ]]
                    -- upvalues: v38 (copy), v35 (ref), v12 (ref)
                    for v40 = 1, #v38 do
                        local v41 = v38[v40];
                        if typeof(v41) == "function" then
                            v41 = v41(v35);
                        end;
                        v12:Fire(v39, {
                            Message = v41, 
                            IsRainbow = v40 == 1
                        });
                    end;
                end;
                for _, v44 in l_Players_0:GetPlayers() do
                    task.spawn(v42, v44);
                end;
                local v45 = l_Players_0.PlayerAdded:Connect(v42);
                local v46 = nil;
                v46 = v9.Timer(1, function() --[[ Line: 170 ]]
                    -- upvalues: l_Workspace_0 (ref), v32 (copy), v45 (copy), v46 (ref), v9 (ref), v34 (copy), v18 (copy)
                    if l_Workspace_0:GetServerTimeNow() < v32.EndTimestamp:Get(0) then
                        return;
                    else
                        if v45.Connected then
                            v45:Disconnect();
                        end;
                        v32:Set(nil);
                        v46();
                        local v47, v48 = v9.Await(v9.Spawn(v34), 60);
                        if not v47 then
                            task.spawn(error, (("[ServerEvents] Failed to clean-up event \"%*\": %*"):format(v18, v48)));
                        end;
                        return;
                    end;
                end);
                warn((("[ServerEvents] Started event \"%*\" for %*s"):format(v18, v21.Duration)));
                return true;
            end;
        end;
    end;
end;
v13.GetEventsStore = function(v49) --[[ Line: 194 ]] --[[ Name: GetEventsStore ]]
    return v49._EventsStore;
end;
v13.Destroy = function(_) --[[ Line: 198 ]] --[[ Name: Destroy ]]

end;
if l_RunService_0:IsServer() and not l_RunService_0:IsStudio() and game.PrivateServerId == "" then
    task.spawn(function() --[[ Line: 203 ]]
        -- upvalues: l_MessagingService_0 (copy), l_HttpService_0 (copy), v10 (copy), l_Workspace_0 (copy), v13 (copy)
        l_MessagingService_0:SubscribeAsync("StartEvent", function(v51) --[[ Line: 204 ]]
            -- upvalues: l_HttpService_0 (ref), v10 (ref), l_Workspace_0 (ref), v13 (ref)
            local v52 = l_HttpService_0:JSONDecode(v51.Data);
            local v53 = v10.AwaitComponentInit(l_Workspace_0, v13);
            if not require(script:FindFirstChild(v52.ID)) then
                warn((("[ServerEvents] Failed to start event \"%*\" because it does not exist."):format(v52.Event)));
                return;
            else
                v53:StartEvent(v52.Event, (("External/%*"):format(v52.Source)));
                return;
            end;
        end);
    end);
end;
return v13;