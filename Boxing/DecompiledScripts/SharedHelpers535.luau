local v0 = false;
local _ = game.Players;
local l_ReplicatedStorage_0 = game.ReplicatedStorage;
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_PrivateServerPlusModules_0 = l_ReplicatedStorage_0.PrivateServerPlusModules;
local _ = require(l_PrivateServerPlusModules_0.SettingTypes);
local _ = require(l_ReplicatedStorage_0.Modules.FuzzySearch);
local _ = game:GetService("HttpService");
local _ = require(l_ReplicatedStorage_0:WaitForChild("Catalog"):WaitForChild("SearchHelper"));
local _ = game:GetService("ReplicatedFirst");
local v11;
if game:GetService("RunService"):IsClient() then
    v11 = shared.BridgeNet2;
    if not v11 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v11 = shared.BridgeNet2;
        v0 = v11;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v11 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local v12 = v11.ReferenceBridge("BasicMessage");
local _ = require;
local v14 = {};
local l_Rings_0 = workspace:WaitForChild("Rings");
v14.FindClosestRing = function(v16, v17) --[[ Line: 25 ]] --[[ Name: FindClosestRing ]]
    -- upvalues: l_Rings_0 (copy)
    if not v16.Character then
        return nil;
    else
        local l_Position_0 = v16.Character:GetPivot().Position;
        local v19 = 9000000000;
        local v20 = nil;
        for _, v22 in l_Rings_0:GetChildren() do
            local l_Magnitude_0 = (l_Position_0 - v22.Keypoints.Centre.Position).Magnitude;
            if (not v22:GetAttribute("IsActive") or v17) and l_Magnitude_0 < v19 then
                v19 = l_Magnitude_0;
                v20 = v22;
            end;
        end;
        return v20;
    end;
end;
v14.SpawnServerControlsNPC = function(v24) --[[ Line: 46 ]] --[[ Name: SpawnServerControlsNPC ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_RunService_0 (copy)
    local l_CustomControlsShared_0 = require(l_ReplicatedStorage_0.Modules:WaitForChild("CustomControlsShared"));
    if not v24:FindFirstChild("AnimSpeed") then
        local l_NumberValue_0 = Instance.new("NumberValue");
        l_NumberValue_0.Name = "AnimSpeed";
        l_NumberValue_0.Parent = v24;
        l_NumberValue_0.Value = 1;
    end;
    local v27 = l_CustomControlsShared_0.New({
        Character = v24
    });
    local v28 = nil;
    v28 = l_RunService_0.Heartbeat:Connect(function(v29) --[[ Line: 62 ]]
        -- upvalues: v24 (copy), v27 (copy)
        if v24.PrimaryPart.Anchored then
            return;
        else
            v27:SetInput(v24:GetAttribute("SimulatedInput") or Vector3.new());
            v27:Update(v29);
            local l_HumanoidRootPart_0 = v24.HumanoidRootPart;
            if l_HumanoidRootPart_0:CanSetNetworkOwnership() and l_HumanoidRootPart_0:GetNetworkOwner() ~= nil then
                l_HumanoidRootPart_0:SetNetworkOwner(nil);
            end;
            return;
        end;
    end);
end;
v14.SpawnNPC = function(v31) --[[ Line: 75 ]]
    return require(script.SpawnNPC)(v31);
end;
v14.SendMessage = function(v32, ...) --[[ Line: 82 ]] --[[ Name: SendMessage ]]
    -- upvalues: v12 (copy)
    v12:Fire(v32, ...);
end;
return v14;