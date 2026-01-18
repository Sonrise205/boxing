local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
local function _(v4, v5, v6) --[[ Line: 8 ]] --[[ Name: Lerp ]]
    return v4 + (v5 - v4) * v6;
end;
local v8 = l_RunService_0:IsClient();
local v9 = nil;
local v10 = {};
v10.__index = v10;
v10.InitAlignSystem = function(v11) --[[ Line: 19 ]] --[[ Name: InitAlignSystem ]]
    -- upvalues: v8 (copy), v9 (ref), l_Workspace_0 (copy)
    if v8 and v9 then
        v11 = v9;
    end;
    if not v11.Character or not v11.RootPart then
        return;
    else
        local l_FirstChild_0 = l_Workspace_0.Debris:FindFirstChild(v11.Character.Name .. "TargetPart");
        if not l_FirstChild_0 then
            l_FirstChild_0 = Instance.new("Part");
            l_FirstChild_0.Name = v11.Character.Name .. "TargetPart";
            l_FirstChild_0.Parent = l_Workspace_0.Debris;
            l_FirstChild_0.CanCollide = false;
            l_FirstChild_0.Anchored = true;
            l_FirstChild_0.Transparency = 1;
        end;
        v11.TargetPart = l_FirstChild_0;
        local l_Attach0_0 = v11.RootPart:FindFirstChild("Attach0");
        if not l_Attach0_0 then
            l_Attach0_0 = Instance.new("Attachment");
            l_Attach0_0.Parent = v11.RootPart;
            l_Attach0_0.Name = "Attach0";
        end;
        v11.Attach0 = l_Attach0_0;
        local l_Attach1_0 = v11.TargetPart:FindFirstChild("Attach1");
        if not l_Attach1_0 then
            l_Attach1_0 = Instance.new("Attachment");
            l_Attach1_0.Parent = v11.TargetPart;
            l_Attach1_0.Name = "Attach1";
        end;
        v11.Attach1 = l_Attach1_0;
        local l_AlignPosition_0 = v11.RootPart:FindFirstChild("AlignPosition");
        if not l_AlignPosition_0 then
            l_AlignPosition_0 = Instance.new("AlignPosition");
            l_AlignPosition_0.Parent = v11.RootPart;
            l_AlignPosition_0.Attachment0 = v11.Attach0;
            l_AlignPosition_0.MaxForce = 1000000;
            l_AlignPosition_0.Responsiveness = 20;
            l_AlignPosition_0.MaxVelocity = 30;
        end;
        v11.AlignPosition = l_AlignPosition_0;
        return;
    end;
end;
v10.Init = function(v16, v17) --[[ Line: 67 ]] --[[ Name: Init ]]
    v16.Character = v17.Character;
    v16.RootPart = v16.Character.PrimaryPart;
    v16.CurrentPriority = 1;
    v16.CurrentAlignId = nil;
    v16.PositionHB = nil;
    v16:InitAlignSystem();
end;
v10.New = function(v18) --[[ Line: 79 ]] --[[ Name: New ]]
    -- upvalues: v8 (copy), v9 (ref), v10 (copy)
    if v8 and v9 then
        v9:Init(v18);
        return v9;
    else
        local v19 = setmetatable({}, v10);
        v19:Init(v18);
        if v8 then
            v9 = v19;
        end;
        return v19;
    end;
end;
v10.GetCurrentAlignId = function(v20) --[[ Line: 96 ]] --[[ Name: GetCurrentAlignId ]]
    -- upvalues: v8 (copy), v9 (ref)
    if v8 and v9 then
        v20 = v9;
    end;
    return v20.CurrentAlignId;
end;
v10.SetPriority = function(v21, v22) --[[ Line: 101 ]] --[[ Name: SetPriority ]]
    -- upvalues: v8 (copy), v9 (ref)
    if v8 and v9 then
        v21 = v9;
    end;
    v21.CurrentPriority = v22;
end;
v10.GetLockedPosition = function(v23, v24, v25, v26, v27) --[[ Line: 106 ]] --[[ Name: GetLockedPosition ]]
    -- upvalues: v8 (copy), v9 (ref), l_Workspace_0 (copy)
    if v8 and v9 then
        v23 = v9;
    end;
    if not v24 or v24.Parent ~= l_Workspace_0.Live then
        return v25 + v26;
    else
        local v28 = v24 and v24.PrimaryPart.Position;
        if not v28 then
            return;
        else
            local l_Magnitude_0 = (v28 - v25).Magnitude;
            local _ = v27;
            return v23:GetRayPosition(v25, v26, (math.min(l_Magnitude_0 - 3, v27)));
        end;
    end;
end;
v10.GetTrackedPart = function(v31, v32, v33, v34) --[[ Line: 124 ]] --[[ Name: GetTrackedPart ]]
    -- upvalues: v8 (copy), v9 (ref)
    if v8 and v9 then
        v31 = v9;
    end;
    local v35 = v32 and v32.Position;
    if not v35 then
        return;
    else
        return v35 - v33 * v34;
    end;
end;
v10.GetRayPosition = function(v36, v37, v38, v39, v40) --[[ Line: 134 ]] --[[ Name: GetRayPosition ]]
    -- upvalues: v8 (copy), v9 (ref), l_RayHelper_0 (copy)
    if v8 and v9 then
        v36 = v9;
    end;
    if not v40 then
        v40 = {};
    end;
    local l_l_RayHelper_0_RayWithWhiteList_0, v42, v43 = l_RayHelper_0:GetRayWithWhiteList(v37, v37 + v38, 1, v40);
    local l_v39_0 = v39;
    if l_l_RayHelper_0_RayWithWhiteList_0 then
        l_v39_0 = math.min((v42 - v37).Magnitude - 1, v39);
    end;
    local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
    local l_l_RayHelper_0_RayWithWhiteList_1, v47, v48 = l_RayHelper_0:GetRayWithWhiteList(v37, v37 + v38, l_v39_0, l_l_RayHelper_0_EnvironmentWhitelist_0);
    l_l_RayHelper_0_RayWithWhiteList_0 = l_l_RayHelper_0_RayWithWhiteList_1;
    v42 = v47;
    v43 = v48;
    l_l_RayHelper_0_RayWithWhiteList_1 = (v37 + v38 * l_v39_0 - v42).Magnitude;
    if l_l_RayHelper_0_RayWithWhiteList_0 then
        l_v39_0 = l_v39_0 - 1;
    end;
    return v37 + v38 * (l_v39_0 - l_l_RayHelper_0_RayWithWhiteList_1);
end;
v10.StopMovement = function(v49) --[[ Line: 167 ]] --[[ Name: StopMovement ]]
    -- upvalues: v8 (copy), v9 (ref)
    if v8 and v9 then
        v49 = v9;
    end;
    v49.AlignPosition.Attachment1 = nil;
end;
local v50 = {};
local v51 = {};
v10.CreateDummyMovement = function(v52, v53) --[[ Line: 175 ]] --[[ Name: CreateDummyMovement ]]
    -- upvalues: v8 (copy), v9 (ref), v51 (copy), v50 (copy), l_Workspace_0 (copy), l_RunService_0 (copy), l_RayHelper_0 (copy)
    if v8 and v9 then
        v52 = v9;
    end;
    local v54 = tick();
    local l_Character_0 = v53.Character;
    local l_MaxTime_0 = v53.MaxTime;
    local l_Velocity_0 = v53.Velocity;
    local l_LookVector_0 = v53.LookVector;
    local l_MaxDistance_0 = v53.MaxDistance;
    local l_Responsiveness_0 = v53.Responsiveness;
    local l_SetPosition_0 = v53.SetPosition;
    local l_TrackedPart_0 = v53.TrackedPart;
    local _ = v53.RayInfo;
    local l_LockedOn_0 = v53.LockedOn;
    local l_LockPositionTime_0 = v53.LockPositionTime;
    local l_DummyPart_0 = v53.DummyPart;
    local v67 = v53.StartPosition or l_DummyPart_0.Position;
    v51[l_Character_0] = v54;
    task.delay(l_LockPositionTime_0, function() --[[ Line: 199 ]]
        -- upvalues: v50 (ref), l_Character_0 (copy), v51 (ref), v54 (copy)
        if v50[l_Character_0] and v51[l_Character_0] == v54 then
            v50[l_Character_0]:Disconnect();
        end;
    end);
    l_LookVector_0 = l_LookVector_0 and (l_LookVector_0 * Vector3.new(1, 0, 1, 0)).Unit;
    local l_Part_0 = Instance.new("Part");
    l_Part_0.CanCollide = false;
    l_Part_0.Anchored = true;
    l_Part_0.Transparency = 1;
    l_Part_0.Color = Color3.fromRGB(255, 0, 0);
    l_Part_0.Position = v67;
    l_Part_0.Name = "TargetDummyPart";
    l_Part_0.Parent = l_Workspace_0.Debris;
    if l_SetPosition_0 then
        l_Part_0.Position = l_SetPosition_0;
    elseif l_TrackedPart_0 then
        l_LookVector_0 = (CFrame.lookAt(v52.RootPart.Position, l_TrackedPart_0.Position).LookVector * Vector3.new(1, 0, 1, 0)).Unit;
        local v71 = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 221 ]]
            -- upvalues: v52 (ref), l_TrackedPart_0 (copy), l_LookVector_0 (ref), l_MaxDistance_0 (copy), l_Part_0 (copy)
            local l_v52_TrackedPart_0 = v52:GetTrackedPart(l_TrackedPart_0, l_LookVector_0, l_MaxDistance_0);
            if not l_v52_TrackedPart_0 then
                return;
            else
                l_Part_0.Position = l_v52_TrackedPart_0;
                return;
            end;
        end);
        v52.PositionHB = v71;
    elseif l_LockedOn_0 then
        local v85 = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 228 ]]
            -- upvalues: v52 (ref), l_LockedOn_0 (copy), v67 (copy), l_LookVector_0 (ref), l_MaxDistance_0 (copy), l_Part_0 (copy), v53 (copy)
            local l_v52_LockedPosition_0 = v52:GetLockedPosition(l_LockedOn_0, v67, l_LookVector_0, l_MaxDistance_0);
            if not l_v52_LockedPosition_0 then
                return;
            else
                l_Part_0.Position = l_v52_LockedPosition_0;
                if v53.Direction == "Forward" then
                    local l_AssemblyLinearVelocity_0 = l_LockedOn_0.PrimaryPart.AssemblyLinearVelocity;
                    local v75 = v52.RootPart.CFrame:VectorToObjectSpace(l_AssemblyLinearVelocity_0);
                    local l_LookVector_1 = CFrame.new(v52.RootPart.Position, l_LockedOn_0.PrimaryPart.Position).LookVector;
                    local v77 = l_LockedOn_0 and (v52.RootPart.Position - l_LockedOn_0.PrimaryPart.Position).Magnitude or 1000;
                    local v78 = game.Workspace.States[l_LockedOn_0.Name];
                    local v79 = v78 and v78:FindFirstChild("CharacterData");
                    if v75.Unit.Z < -0.6 and v77 <= 9 then
                        local l_l_Part_0_0 = l_Part_0;
                        l_l_Part_0_0.Position = l_l_Part_0_0.Position + l_LookVector_1 * math.clamp(l_AssemblyLinearVelocity_0.Magnitude / 2, 0, 2.5);
                        return;
                    elseif v75.Unit.Z > 0.6 or v79 and v79.Dashing.Value and l_LockedOn_0:GetAttribute("DashDirection") == "Forward" then
                        local v81 = game.Workspace.States[l_LockedOn_0.Name];
                        local v82 = v81 and v81:FindFirstChild("CharacterData");
                        local v83 = math.clamp(l_AssemblyLinearVelocity_0.Magnitude / 2, 0, 2);
                        if v82 and v82.Dashing.Value then
                            v83 = 1.7;
                        end;
                        local l_l_Part_0_1 = l_Part_0;
                        l_l_Part_0_1.Position = l_l_Part_0_1.Position - l_LookVector_1 * v83;
                    end;
                end;
                return;
            end;
        end);
        v52.PositionHB = v85;
    else
        l_Part_0.Position = v52:GetRayPosition(v67, l_LookVector_0, l_MaxDistance_0, l_RayHelper_0:GetCharactersExcept({
            v52.Character
        }));
    end;
    local l_AlignPosition_1 = Instance.new("AlignPosition");
    l_AlignPosition_1.Parent = l_DummyPart_0;
    l_AlignPosition_1.MaxForce = 1000000;
    l_AlignPosition_1.MaxVelocity = l_Velocity_0;
    l_AlignPosition_1.Responsiveness = l_Responsiveness_0;
    l_DummyPart_0.Anchored = true;
    l_DummyPart_0.Position = v67;
    local l_Attachment_0 = Instance.new("Attachment");
    l_Attachment_0.Parent = l_DummyPart_0;
    local l_Attachment_1 = Instance.new("Attachment");
    l_Attachment_1.Parent = l_Part_0;
    l_AlignPosition_1.Attachment0 = l_Attachment_0;
    l_AlignPosition_1.Attachment1 = l_Attachment_1;
    l_DummyPart_0.Anchored = false;
    task.wait(l_MaxTime_0);
    l_Part_0:Destroy();
    l_DummyPart_0:Destroy();
    if v51[l_Character_0] ~= v54 then
        return;
    else
        if v50[l_Character_0] then
            v50[l_Character_0]:Disconnect();
        end;
        return;
    end;
end;
local l_GameplaySettings_0 = require(l_Modules_0:WaitForChild("Styles")).GameplaySettings;
v10.MoveAlignPosition = function(v90, v91) --[[ Line: 295 ]] --[[ Name: MoveAlignPosition ]]
    -- upvalues: v8 (copy), v9 (ref), l_RunService_0 (copy), l_Workspace_0 (copy), l_GameplaySettings_0 (copy), l_RayHelper_0 (copy)
    if v8 and v9 then
        v90 = v9;
    end;
    v90:InitAlignSystem();
    local v92 = v91.Priority or 1;
    if v92 < v90.CurrentPriority then
        return;
    else
        v90.CurrentPriority = v92;
        local v93 = tick();
        v90.CurrentAlignId = v93;
        v90.AlignPosition.Attachment1 = nil;
        if v90.PositionHB then
            v90.PositionHB:Disconnect();
        end;
        local l_LookVector_2 = v91.LookVector;
        local l_MaxDistance_1 = v91.MaxDistance;
        local l_Velocity_1 = v91.Velocity;
        local l_Responsiveness_1 = v91.Responsiveness;
        local l_MaxTime_1 = v91.MaxTime;
        local v99 = v91.StartPosition or v90.RootPart.Position;
        local l_SetPosition_1 = v91.SetPosition;
        local l_TrackedPart_1 = v91.TrackedPart;
        local _ = v91.RayInfo;
        local l_LockedOn_1 = v91.LockedOn;
        local l_LockPositionTime_1 = v91.LockPositionTime;
        task.delay(l_LockPositionTime_1, function() --[[ Line: 331 ]]
            -- upvalues: v90 (ref), v93 (copy)
            if v90.PositionHB and v90.CurrentAlignId == v93 then
                v90.PositionHB:Disconnect();
            end;
        end);
        l_LookVector_2 = l_LookVector_2 and (l_LookVector_2 * Vector3.new(1, 0, 1, 0)).Unit;
        if l_SetPosition_1 then
            v90.TargetPart.Position = l_SetPosition_1;
        elseif l_TrackedPart_1 then
            l_LookVector_2 = (CFrame.lookAt(v90.RootPart.Position, l_TrackedPart_1.Position).LookVector * Vector3.new(1, 0, 1, 0)).Unit;
            local v107 = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 344 ]]
                -- upvalues: v90 (ref), l_TrackedPart_1 (copy), l_LookVector_2 (ref), l_MaxDistance_1 (copy)
                local l_v90_TrackedPart_0 = v90:GetTrackedPart(l_TrackedPart_1, l_LookVector_2, l_MaxDistance_1);
                if not l_v90_TrackedPart_0 then
                    return;
                else
                    v90.TargetPart.Position = l_v90_TrackedPart_0;
                    return;
                end;
            end);
            v90.PositionHB = v107;
        elseif l_LockedOn_1 then
            local v127 = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 351 ]]
                -- upvalues: v90 (ref), l_LockedOn_1 (copy), v99 (copy), l_LookVector_2 (ref), l_MaxDistance_1 (copy), l_Workspace_0 (ref), v91 (copy), l_GameplaySettings_0 (ref)
                local l_v90_LockedPosition_0 = v90:GetLockedPosition(l_LockedOn_1, v99, l_LookVector_2, l_MaxDistance_1);
                if not l_v90_LockedPosition_0 or not l_LockedOn_1 or l_LockedOn_1.Parent ~= l_Workspace_0.Live then
                    return;
                else
                    v90.TargetPart.Position = l_v90_LockedPosition_0;
                    local l_AssemblyLinearVelocity_1 = l_LockedOn_1.PrimaryPart.AssemblyLinearVelocity;
                    local v111 = v90.RootPart.CFrame:VectorToObjectSpace(l_AssemblyLinearVelocity_1);
                    local l_Unit_0 = (CFrame.lookAt(v90.RootPart.Position, l_LockedOn_1.PrimaryPart.Position).LookVector * Vector3.new(1, 0, 1, 0)).Unit;
                    local v113 = l_LockedOn_1 and (v90.RootPart.Position - l_LockedOn_1.PrimaryPart.Position).Magnitude or 1000;
                    local v114 = game.Workspace.States[l_LockedOn_1.Name];
                    local v115 = v114 and v114:FindFirstChild("CharacterData");
                    if v91.Direction == "Forward" then
                        if v111.Unit.Z < -0.6 and v113 <= 9 then
                            local l_TargetPart_0 = v90.TargetPart;
                            l_TargetPart_0.Position = l_TargetPart_0.Position + l_Unit_0 * math.clamp(l_AssemblyLinearVelocity_1.Magnitude / 2, 0, 2.5);
                            return;
                        elseif v111.Unit.Z > 0.6 or v115 and v115.Dashing.Value and l_LockedOn_1:GetAttribute("DashDirection") == "Forward" then
                            local v117 = game.Workspace.States[l_LockedOn_1.Name];
                            local v118 = v117 and v117:FindFirstChild("CharacterData");
                            local v119 = math.clamp(l_AssemblyLinearVelocity_1.Magnitude / 2, 0, 2);
                            if v118 and v118.Dashing.Value then
                                v119 = 1.7;
                            end;
                            local l_TargetPart_1 = v90.TargetPart;
                            l_TargetPart_1.Position = l_TargetPart_1.Position - l_Unit_0 * v119;
                            return;
                        end;
                    elseif v91.Direction == "StepIn" then
                        if v113 <= 9 then
                            local v121 = 0.5;
                            local v122 = 2;
                            local _ = l_GameplaySettings_0.DegradePunish;
                            local v124 = math.clamp(v115.BackdashDegrade.Value / 50, 0, 1);
                            if v115.BackdashDegrade.Value < 20 then
                                return;
                            else
                                v121 = v121 * (0.2 + 0.8 * v124);
                                v122 = v122 * (0.2 + 0.8 * v124);
                                local l_TargetPart_2 = v90.TargetPart;
                                l_TargetPart_2.Position = l_TargetPart_2.Position + l_Unit_0 * math.clamp(l_AssemblyLinearVelocity_1.Magnitude / 2, v121, v122);
                                return;
                            end;
                        else
                            local l_TargetPart_3 = v90.TargetPart;
                            l_TargetPart_3.Position = l_TargetPart_3.Position - l_Unit_0 * 1;
                        end;
                    end;
                    return;
                end;
            end);
            v90.PositionHB = v127;
        else
            local l_TargetPart_4 = v90.TargetPart;
            local l_v99_0 = v99;
            local l_l_LookVector_2_0 = l_LookVector_2;
            local l_l_MaxDistance_1_0 = l_MaxDistance_1;
            local l_l_RayHelper_0_0 = l_RayHelper_0;
            local v133 = {
                v90.Character
            };
            l_TargetPart_4.Position = v90:GetRayPosition(l_v99_0, l_l_LookVector_2_0, l_l_MaxDistance_1_0, l_l_RayHelper_0_0:GetCharactersExcept(v133));
        end;
        v90.AlignPosition.Responsiveness = l_Responsiveness_1;
        v90.AlignPosition.MaxVelocity = l_Velocity_1;
        v90.AlignPosition.Attachment0 = v90.Attach0;
        local v134 = l_Workspace_0.States[v90.Character.Name];
        local _ = v134.CharacterData;
        local l_Occupied_0 = v134.Occupied;
        local v137 = false;
        local v138 = nil;
        if not v91.IgnoreStun then
            v138 = l_Occupied_0.Stunned.Changed:Connect(function(v139) --[[ Line: 419 ]]
                -- upvalues: v137 (ref)
                if v139 then
                    v137 = true;
                end;
            end);
        end;
        local l_DashDelay_0 = v91.DashDelay;
        if l_DashDelay_0 then
            task.wait(l_DashDelay_0);
        end;
        if v138 then
            v138:Disconnect();
        end;
        if v90.CurrentAlignId ~= v93 then
            return;
        elseif v137 then
            return;
        else
            v90.AlignPosition.Attachment1 = v90.Attach1;
            task.wait(l_MaxTime_1);
            if v90.CurrentAlignId ~= v93 then
                return;
            else
                if v90.PositionHB then
                    v90.PositionHB:Disconnect();
                end;
                v90.AlignPosition.Attachment1 = nil;
                return;
            end;
        end;
    end;
end;
v10.SetProperties = function(v141, v142) --[[ Line: 439 ]] --[[ Name: SetProperties ]]
    for v143, v144 in v142 do
        v141.AlignPosition[v143] = v144;
    end;
end;
return v10;