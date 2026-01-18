--!native
local v0 = false;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Analytics);
local l_Players_0 = game:GetService("Players");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("GuiService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local _ = game:GetService("UserInputService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = require(l_ReplicatedStorage_0:WaitForChild("Bitbuffer"));
local l_Buwic_0 = require(l_ReplicatedStorage_0:WaitForChild("Buwic"));
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local _ = require(l_Modules_0:WaitForChild("UIHelper"));
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local l_AlignHelper_0 = require(l_Modules_0:WaitForChild("AlignHelper"));
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_TweenHelper_0 = require(l_Modules_0:WaitForChild("TweenHelper"));
local _ = require(l_Modules_0:WaitForChild("HitboxManager"));
local _ = require(l_Modules_0:WaitForChild("CombatShared"));
local l_InfoToString_0 = require(l_ReplicatedStorage_0:WaitForChild("InfoToString"));
local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
local l_Events_0 = l_ReplicatedStorage_0:WaitForChild("Events");
local l_RemoteEvents_0 = l_ReplicatedStorage_0:WaitForChild("RemoteEvents");
local l_SimulateKnockbackBE_0 = l_RemoteEvents_0:WaitForChild("SimulateKnockbackBE");
local l_ReplicateLanded_0 = l_RemoteEvents_0:WaitForChild("ReplicateLanded");
local l_ReplicateTryAttack_0 = l_RemoteEvents_0:WaitForChild("ReplicateTryAttack");
local v31 = require(l_ReplicatedStorage_0:WaitForChild("Modules", 10):WaitForChild("EmoteHelper", 10));
local l_Cleaner_0 = require(l_ReplicatedFirst_0:WaitForChild("Cleaner"));
local v33;
if game:GetService("RunService"):IsClient() then
    v33 = shared.BridgeNet2;
    if not v33 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v33 = shared.BridgeNet2;
        v0 = v33;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v33 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local v34 = v33.ReferenceBridge("PingBridge");
local v35 = v33.ReferenceBridge("SettledPing");
local v36 = v33.ReferenceBridge("UsedDash");
local v37 = v33.ReferenceBridge("OverridePosition");
local v38 = v33.ReferenceBridge("SimulateKnockback");
local function _(v39, v40, v41) --[[ Line: 56 ]] --[[ Name: Lerp ]]
    return v39 + (v40 - v39) * v41;
end;
local l_UnreliableRemoteEvents_0 = l_ReplicatedStorage_0:WaitForChild("UnreliableRemoteEvents");
local l_PlayAnimation_0 = l_UnreliableRemoteEvents_0:WaitForChild("PlayAnimation");
local l_CreateEffect_0 = l_UnreliableRemoteEvents_0:WaitForChild("CreateEffect");
local l_PlaySound_0 = l_UnreliableRemoteEvents_0:WaitForChild("PlaySound");
local l_RollbackDash_0 = l_UnreliableRemoteEvents_0:WaitForChild("RollbackDash");
local l_RollbackHit_0 = l_UnreliableRemoteEvents_0:WaitForChild("RollbackHit");
local _ = v33.ReferenceBridge("ReplicateQuickReload");
local _ = v33.ReferenceBridge("ReplicateTryAttack");
local _ = v33.ReferenceBridge("ReplicateLanded");
CreateEffect = function(v52) --[[ Line: 74 ]] --[[ Name: CreateEffect ]]
    -- upvalues: l_Workspace_0 (copy), l_EffectHelper_0 (copy)
    local v53 = v52[1];
    if type(v52) == "table" and #v52 >= 2 then
        local v54 = v52[2];
        if typeof(v54) == "Instance" and v54:IsA("Model") and v54.Parent ~= l_Workspace_0.Live then
            return;
        end;
    end;
    l_EffectHelper_0[v53](v52);
end;
l_CreateEffect_0.OnClientEvent:Connect(function(v55) --[[ Line: 89 ]]
    CreateEffect(v55);
end);
v33.ReferenceBridge("CreateEffect"):Connect(function(v56) --[[ Line: 94 ]]
    CreateEffect(v56);
end);
l_PlayAnimation_0.OnClientEvent:Connect(function(v57) --[[ Line: 98 ]]
    -- upvalues: l_InfoToString_0 (copy), l_AnimHelper_0 (copy)
    local v58 = l_InfoToString_0.DeconvertAnimation(v57);
    l_AnimHelper_0:CreateAnim(v58);
end);
l_PlaySound_0.OnClientEvent:Connect(function(v59) --[[ Line: 108 ]]
    -- upvalues: l_SoundHelper_0 (copy)
    l_SoundHelper_0:PlaySound({
        Name = v59[1], 
        Parent = v59[2], 
        SpeedMult = v59[3], 
        Volume = #v59 >= 4 and v59[4] or nil
    });
end);
local v60 = Random.new();
GetPlayerData = function(v61) --[[ Line: 119 ]] --[[ Name: GetPlayerData ]]
    -- upvalues: l_Workspace_0 (copy)
    if not v61 then
        return;
    else
        local l_FirstChild_0 = l_Workspace_0:WaitForChild("States"):FindFirstChild(v61.Name);
        if not l_FirstChild_0 then
            return;
        else
            return l_FirstChild_0:FindFirstChild("PlayerData");
        end;
    end;
end;
v36:Connect(function(v63) --[[ Line: 127 ]]
    -- upvalues: l_Styles_0 (copy), l_SoundHelper_0 (copy), v60 (copy), l_AnimHelper_0 (copy), l_EffectHelper_0 (copy)
    local v64 = v63[1];
    local v65 = v63[2];
    local v66 = v63[3];
    local v67 = v63[4] or "Action2";
    v67 = Enum.AnimationPriority[v67];
    local v68 = GetPlayerData(v65);
    if not v68 then
        return;
    else
        local v69 = l_Styles_0[v68.Style.Value];
        if not v69 then
            return;
        else
            local l_DashInfo_0 = v69.DashInfo;
            local v71 = l_DashInfo_0[v64];
            local l_DefaultInfo_0 = l_DashInfo_0.DefaultInfo;
            local function _(v73) --[[ Line: 145 ]] --[[ Name: GetDashInfo ]]
                -- upvalues: v71 (copy), l_DefaultInfo_0 (copy)
                return v71[v73] or l_DefaultInfo_0[v73];
            end;
            if not (v71.IgnoreSound or l_DefaultInfo_0.IgnoreSound) then
                local v75 = v71.Sound or l_DefaultInfo_0.Sound or "Step";
                local v76 = v71.Volume or l_DefaultInfo_0.Volume or 0.05;
                l_SoundHelper_0:PlaySound({
                    Name = v75, 
                    Volume = v76, 
                    Parent = v65.PrimaryPart, 
                    Speed = v60:NextNumber(1.1, 1.6)
                });
            end;
            if not (v71.IgnoreAnimation or l_DefaultInfo_0.IgnoreAnimation) then
                local l_Humanoid_0 = v65:FindFirstChild("Humanoid");
                local v78 = l_Humanoid_0:FindFirstChild("Animator") or l_Humanoid_0;
                local v79 = v71.AnimId or l_DefaultInfo_0.AnimId;
                if v78 and v79 then
                    local v80 = {
                        Priority = v67, 
                        Animator = v78, 
                        AnimId = v79, 
                        NameFade = 0.001, 
                        FadeIn = 0.05, 
                        Weight = 1000, 
                        Name = "Server", 
                        AnimSpeed = v71.AnimSpeed or l_DefaultInfo_0.AnimSpeed, 
                        StopInfo = v71.StopInfo or l_DefaultInfo_0.StopInfo or {
                            StopDelay = 0.3, 
                            StopTime = 0.2, 
                            Weight = 1
                        }
                    };
                    task.spawn(function() --[[ Line: 186 ]]
                        -- upvalues: l_AnimHelper_0 (ref), v80 (copy)
                        l_AnimHelper_0:CreateAnim(v80);
                    end);
                end;
            end;
            local v81 = v71.OnUse or l_DefaultInfo_0.OnUse;
            if v81 then
                v81(v65);
            end;
            if not (v71.IgnoreEffects or l_DefaultInfo_0.IgnoreEffects) then
                local v82 = {
                    "DashMain", 
                    v65, 
                    v66
                };
                task.spawn(function() --[[ Line: 204 ]]
                    -- upvalues: l_EffectHelper_0 (ref), v82 (copy)
                    l_EffectHelper_0[v82[1]](v82);
                end);
            end;
            return;
        end;
    end;
end);
local v83 = {};
local v84 = {};
l_Workspace_0.Live.ChildRemoved:Connect(function(v85) --[[ Line: 213 ]]
    -- upvalues: v84 (copy)
    v84[v85] = nil;
end);
GetOccupied = function(v86) --[[ Line: 217 ]] --[[ Name: GetOccupied ]]
    -- upvalues: l_Workspace_0 (copy)
    if not v86 then
        return;
    else
        local l_FirstChild_1 = l_Workspace_0:WaitForChild("States"):FindFirstChild(v86.Name);
        if not l_FirstChild_1 then
            return;
        else
            return l_FirstChild_1:FindFirstChild("Occupied");
        end;
    end;
end;
local v88 = {};
for _, v90 in l_Workspace_0.Rings:GetChildren() do
    local l_Hitboxes_0 = v90:FindFirstChild("Hitboxes");
    if l_Hitboxes_0 then
        for _, v93 in l_Hitboxes_0:GetChildren() do
            table.insert(v88, v93);
        end;
    end;
end;
workspace.Rings.ChildAdded:Connect(function(v94) --[[ Line: 235 ]]
    -- upvalues: v88 (copy)
    local v95 = v94:WaitForChild("Hitboxes", 10);
    if not v95 then
        return;
    else
        for _, v97 in v95:GetChildren() do
            table.insert(v88, v97);
        end;
        return;
    end;
end);
local v98 = OverlapParams.new();
v98.FilterType = Enum.RaycastFilterType.Include;
v98.FilterDescendantsInstances = v88;
v98.MaxParts = false;
v98.BruteForceAllSlow = false;
v98.RespectCanCollide = false;
local v99 = 0;
SimulateKnockback = function(v100) --[[ Line: 253 ]] --[[ Name: SimulateKnockback ]]
    -- upvalues: l_LocalPlayer_0 (copy), v83 (copy), v99 (ref), l_RunService_0 (copy), l_EffectHelper_0 (copy), l_RayHelper_0 (copy), v84 (copy), l_Players_0 (copy), v88 (copy), l_AlignHelper_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_Victim_0 = v100.Victim;
    local l_StartTime_0 = v100.StartTime;
    local l_TargetTime_0 = v100.TargetTime;
    local l_TargetVector_0 = v100.TargetVector;
    local l_VictimPosition_0 = v100.VictimPosition;
    local v107 = v100.HitIndex or 1;
    if not v83[l_Victim_0] then
        v83[l_Victim_0] = {};
    end;
    local v108 = v83[l_Victim_0];
    local v109 = v108.CurrentHitIndex or 0;
    if tick() - v99 < 3 then
        l_RunService_0:UnbindFromRenderStep("PlayersHit");
        l_RunService_0:UnbindFromRenderStep("PlayerDash");
        return;
    elseif v107 < v109 then
        return;
    else
        local v110 = l_EffectHelper_0.UpdateTeleportId(l_Victim_0);
        l_RunService_0:UnbindFromRenderStep("PlayersHit");
        l_RunService_0:UnbindFromRenderStep("PlayerDash");
        local l_v99_0 = v99;
        local l_PrimaryPart_0 = l_Victim_0.PrimaryPart;
        local l_Position_0 = l_PrimaryPart_0.Position;
        local v114 = v100.LookVector or (l_PrimaryPart_0.CFrame.LookVector * Vector3.new(1, 0, 1, 0)).Unit;
        local v115 = false;
        local v116 = tick();
        v108.CurrentMovement = v116;
        v108.CurrentHitIndex = v107;
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        local v118 = l_workspace_ServerTimeNow_0 - l_StartTime_0 + l_TargetTime_0;
        local v119 = v100.EndPosition or l_VictimPosition_0 + l_TargetVector_0;
        if v119 == l_Position_0 then
            v119 = v119 + v114 * 0.05;
        end;
        local v120 = GetOccupied(l_Victim_0);
        if l_Character_0 == l_Victim_0 then
            v120.SpeedMult.Value = 0.97;
        end;
        if not v100.IgnoreSettingCFrame then
            local _ = l_RayHelper_0:GetEnvironmentWhitelist();
            local v122 = v84[l_Victim_0];
            if v122 and tick() - v122.StartTime < v122.MaxTime then
                l_VictimPosition_0 = v122.Position;
            end;
            if l_Players_0:GetPlayerFromCharacter(l_Victim_0) then
                v84[l_Victim_0] = {
                    Position = v119, 
                    StartTime = tick(), 
                    MaxTime = v118 + 0.3333333333333333
                };
            end;
            local v123 = RaycastParams.new();
            v123.FilterDescendantsInstances = v88;
            v123.FilterType = Enum.RaycastFilterType.Include;
            v123.IgnoreWater = true;
            if v119 then
                v119 = Vector3.new(v119.X, l_Position_0.Y, v119.Z);
            end;
            local v124 = v119 - l_Position_0;
            local l_Magnitude_0 = v124.Magnitude;
            if l_Magnitude_0 <= 0 then

            end;
            v124 = v124.Unit;
            local l_RightVector_0 = CFrame.lookAt(l_Position_0, v119).RightVector;
            local v127 = {
                Vector3.new(0, 0, 0, 0), 
                l_RightVector_0 * 2, 
                -l_RightVector_0 * 2
            };
            local v128 = nil;
            local v129 = nil;
            for _, v131 in ipairs(v127) do
                local v132 = l_Position_0 + v131;
                local v133 = workspace:Raycast(v132, v124 * (l_Magnitude_0 + 0.6), v123);
                if v133 then
                    local l_Magnitude_1 = (v133.Position - l_Position_0).Magnitude;
                    if not v129 or l_Magnitude_1 < v129 then
                        v129 = l_Magnitude_1;
                        v128 = v133;
                    end;
                end;
            end;
            if v128 then
                v119 = l_Position_0;
            end;
            if v119 then
                v119 = Vector3.new(v119.X, l_Position_0.Y, v119.Z);
            end;
            local l_l_TargetTime_0_0 = l_TargetTime_0;
            if l_Character_0 ~= l_Victim_0 then
                l_l_TargetTime_0_0 = l_TargetTime_0 + 0.3333333333333333;
            end;
            do
                local l_l_l_TargetTime_0_0_0 = l_l_TargetTime_0_0;
                l_RunService_0:BindToRenderStep("PlayersHit", 1, function() --[[ Line: 389 ]]
                    -- upvalues: l_Victim_0 (copy), v99 (ref), l_v99_0 (copy), v115 (ref), l_workspace_ServerTimeNow_0 (copy), l_TargetTime_0 (copy), l_l_l_TargetTime_0_0_0 (ref), l_RunService_0 (ref), l_Position_0 (copy), v119 (ref), l_PrimaryPart_0 (copy), v114 (copy)
                    if not l_Victim_0:FindFirstChild("Humanoid") or l_Victim_0.Humanoid.Health <= 0 or l_Victim_0:GetAttribute("IsFreeDashing") or v99 ~= l_v99_0 then
                        v115 = true;
                    end;
                    if v115 then
                        return;
                    else
                        local v137 = workspace:GetServerTimeNow() - l_workspace_ServerTimeNow_0;
                        local v138 = v137 / l_TargetTime_0;
                        if l_l_l_TargetTime_0_0_0 < v137 then
                            l_RunService_0:UnbindFromRenderStep("PlayersHit");
                        end;
                        local v139 = math.min(v138, 1);
                        local l_l_Position_0_0 = l_Position_0;
                        local v141 = l_l_Position_0_0 + (v119 - l_l_Position_0_0) * v139;
                        l_PrimaryPart_0.AssemblyAngularVelocity = Vector3.new();
                        l_PrimaryPart_0.AssemblyLinearVelocity = Vector3.new();
                        if v114.Magnitude > 0.1 then
                            l_Victim_0:PivotTo(CFrame.lookAt(v141, v141 + v114));
                        end;
                        return;
                    end;
                end);
                if l_Victim_0 == l_LocalPlayer_0.Character then
                    local v142 = {
                        KeepPos = true, 
                        SetPosition = v119, 
                        Responsiveness = 200, 
                        Velocity = 0, 
                        MaxTime = 0.1, 
                        IgnoreStun = true
                    };
                    task.defer(function() --[[ Line: 427 ]]
                        -- upvalues: l_AlignHelper_0 (ref), v142 (copy)
                        l_AlignHelper_0:MoveAlignPosition(v142);
                    end);
                end;
            end;
        end;
        local l_ExtraDelay_0 = v100.ExtraDelay;
        if l_ExtraDelay_0 then
            v118 = v118 + l_ExtraDelay_0;
        end;
        if not v100.IgnoreSettingCFrame or l_TargetTime_0 ~= 0 then
            task.wait(v118 + 0.3333333333333333);
        end;
        if v116 ~= v108.CurrentMovement then
            return;
        else
            l_RunService_0:UnbindFromRenderStep("PlayersHit");
            if l_EffectHelper_0.GetTeleportId(l_Victim_0) ~= v110 then
                v100.IgnoreSettingCFrame = true;
            end;
            if v100.IgnoreSettingCFrame or v115 or v114.Magnitude <= 0.1 or l_Character_0 ~= l_LocalPlayer_0.Character then

            end;
            if v116 ~= v108.CurrentMovement then
                return;
            else
                v108.CurrentHitIndex = 0;
                if l_Character_0 == l_Victim_0 and v120.SpeedMult.Value == 0.97 and not l_Character_0:GetAttribute("CurrentEmote") then
                    v120.SpeedMult.Value = 0;
                end;
                return;
            end;
        end;
    end;
end;
v38:Connect(function(v144) --[[ Line: 465 ]]
    -- upvalues: l_Workspace_0 (copy), l_LocalPlayer_0 (copy)
    local l_Occupied_0 = l_Workspace_0.States[l_LocalPlayer_0.Character.Name].Occupied;
    if l_Occupied_0 and l_Occupied_0.Dashing.Value then
        return;
    else
        local v146 = {
            Victim = v144[1], 
            StartTime = v144[2], 
            VictimPosition = v144[3], 
            TargetVector = v144[4], 
            TargetTime = v144[5], 
            HitIndex = v144[6]
        };
        SimulateKnockback(v146);
        return;
    end;
end);
l_SimulateKnockbackBE_0.Event:Connect(function(v147) --[[ Line: 483 ]]
    SimulateKnockback(v147);
end);
v37:Connect(function(v148) --[[ Line: 596 ]]
    -- upvalues: l_TweenHelper_0 (copy), l_RunService_0 (copy), l_EffectHelper_0 (copy), l_LocalPlayer_0 (copy)
    l_TweenHelper_0.StopSelfTweens();
    l_RunService_0:UnbindFromRenderStep("PlayerDash");
    l_RunService_0:UnbindFromRenderStep("PlayersHit");
    local l_DelayTime_0 = v148.DelayTime;
    if l_DelayTime_0 then
        task.wait(l_DelayTime_0);
    end;
    l_EffectHelper_0.UpdateTeleportId(l_LocalPlayer_0.Character);
    local l_Character_1 = v148.Character;
    local l_TargetCFrame_0 = v148.TargetCFrame;
    l_Character_1.PrimaryPart.CFrame = l_TargetCFrame_0;
    l_Character_1.PrimaryPart.Anchored = false;
end);
local v152 = Random.new();
local v153 = nil;
GetRollbackDelayFromPing = function(v154) --[[ Line: 621 ]] --[[ Name: GetRollbackDelayFromPing ]]
    return (math.clamp((v154 - 0.06) / 1.5, 0, 0.058333333333333334));
end;
local v155 = {};
local v156 = {};
l_Workspace_0.Live.ChildRemoved:Connect(function(v157) --[[ Line: 628 ]]
    -- upvalues: v156 (copy)
    v156[v157] = nil;
end);
local function _() --[[ Line: 632 ]] --[[ Name: GetInputType ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    return l_LocalPlayer_0:GetAttribute("Interface");
end;
local l_GameplaySettings_0 = l_Styles_0.GameplaySettings;
l_ReplicateTryAttack_0.OnClientEvent:Connect(function(v160) --[[ Line: 639 ]]
    -- upvalues: l_Buwic_0 (copy), l_InfoToString_0 (copy), v155 (copy), l_Workspace_0 (copy), l_Styles_0 (copy), l_LocalPlayer_0 (copy), l_GameplaySettings_0 (copy), v156 (copy), l_EffectHelper_0 (copy), l_Places_0 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), v152 (copy), v153 (ref)
    local v161 = v160[1];
    local v162 = v160[2];
    if not v162 then
        return;
    else
        local v163 = l_Buwic_0.fromBuffer(v161);
        local v164 = v163:readu16();
        local v165 = {
            v163:readString()
        };
        local v166 = v163:readf32();
        local v167 = l_InfoToString_0.DeconvertAttack(v165);
        local l_Ping_0 = v167.Ping;
        local l_IsHeavy_0 = v167.IsHeavy;
        local l_IsCharge_0 = v167.IsCharge;
        local l_IsUltimate_0 = v167.IsUltimate;
        local l_CurrentCombo_0 = v167.CurrentCombo;
        local l_CurrentPunch_0 = v167.CurrentPunch;
        v155[v164] = v167;
        v162:SetAttribute("TryAttack", v164);
        task.delay(1, function() --[[ Line: 661 ]]
            -- upvalues: v162 (copy), v164 (copy), v155 (ref), v167 (copy)
            if v162:GetAttribute("TryAttack") == v164 then
                v162:SetAttribute("TryAttack", nil);
            end;
            task.wait(2);
            if v155[v164] == v167 then
                v155[v164] = nil;
            end;
        end);
        local l_PlayerData_0 = l_Workspace_0.States[v162.Name].PlayerData;
        local l_CharacterData_0 = l_Workspace_0.States[v162.Name].CharacterData;
        local l_Humanoid_1 = v162:FindFirstChild("Humanoid");
        local l_Value_0 = l_PlayerData_0:FindFirstChild("Style").Value;
        local v178 = l_Styles_0[l_Value_0];
        if workspace.Settings.ShinyStartups.Value and v178.BaseStyleName and (l_CurrentPunch_0 == 1 or l_IsHeavy_0 or l_IsUltimate_0) then
            l_Value_0 = v178.BaseStyleName;
            v178 = l_Styles_0[l_Value_0];
        end;
        local _ = v178.HitboxInfo;
        local v180 = v178.Combos[l_CurrentCombo_0];
        local v181 = v180 and v180[l_CurrentPunch_0];
        if l_IsHeavy_0 then
            v180 = l_Styles_0[l_Value_0].HeavyAttacks;
            v181 = v180[l_CurrentPunch_0];
        elseif l_IsUltimate_0 then
            v180 = l_Styles_0[l_Value_0].UltimateInfo;
            v181 = v180[1];
        end;
        local v182 = v180.DefaultPunchInfo or l_Styles_0[l_Value_0].DefaultPunchInfo;
        local function _(v183) --[[ Line: 699 ]] --[[ Name: GetPunchInfo ]]
            -- upvalues: v181 (ref), v182 (copy)
            return v181[v183] or v182[v183];
        end;
        local v185 = tick();
        local v186 = l_IsHeavy_0 and "Heavy" or "Light";
        local v187 = l_LocalPlayer_0.Character == v162;
        local v188 = v181.OnUse or v182.OnUse;
        if v188 and not v187 then
            v188(v162);
        end;
        local v189 = false;
        local l_Character_2 = l_LocalPlayer_0.Character;
        local _ = l_Workspace_0.States[l_Character_2.Name].CharacterData;
        local l_PlayerData_1 = l_Workspace_0.States[l_Character_2.Name].PlayerData;
        local l_Occupied_1 = l_Workspace_0.States[l_Character_2.Name].Occupied;
        local v194 = v181.AnimSpeed or v182.AnimSpeed;
        local v195 = nil;
        if v162:GetAttribute("DashFollowupWindow") and not l_IsCharge_0 and l_CurrentCombo_0 < 90 then
            v195 = (l_IsHeavy_0 and l_GameplaySettings_0.DashM2Frames or l_GameplaySettings_0.DashM1Frames) / 60;
        end;
        local v196 = l_Occupied_1 and l_Occupied_1.LockedOn.Value;
        local l_l_Character_2_Attribute_0 = l_Character_2:GetAttribute("IsFeinting");
        if not v189 and v196 == v162 and l_l_Character_2_Attribute_0 then
            v195 = l_GameplaySettings_0.FeintReadStart / 60;
        end;
        if v156[v162] then
            local v198 = v156[v162][1];
            local v199 = v156[v162][2];
            local v200 = v156[v162][3];
            local v201 = v156[v162][4];
            local _ = v156[v162][5];
            local v203 = v185 - v198 < v199 * 1.2;
            local v204 = false;
            if v200 == "Light" then
                v204 = v186 == "Heavy";
            end;
            local v205 = false;
            if v200 == "Heavy" then
                v205 = v186 == "Light";
            end;
            local v206 = v204 or v205;
            if v204 then
                v195 = l_GameplaySettings_0.M1FeintStart / 60;
            elseif v205 then
                v195 = l_GameplaySettings_0.M2FeintStart / 60;
            end;
            local l_v198_0 = v198 --[[ copy: 38 -> 65 ]];
            local function _() --[[ Line: 763 ]] --[[ Name: IsTryingToStagger ]]
                -- upvalues: l_Occupied_1 (copy), v162 (copy), v200 (copy), v201 (copy), v186 (copy), l_CurrentPunch_0 (copy), l_v198_0 (copy)
                if l_Occupied_1.LockedOn.Value ~= v162 then
                    return false;
                elseif v200 ~= "Light" or v201 <= 1 or v186 ~= "Light" or l_CurrentPunch_0 ~= 1 then
                    return false;
                elseif tick() - l_v198_0 >= 1 then
                    return false;
                else
                    return true;
                end;
            end;
            if l_Occupied_1.LockedOn.Value == v162 and v200 == "Light" and v201 > 1 and v186 == "Light" and not (l_CurrentPunch_0 ~= 1) and tick() - v198 < 1 then
                l_Occupied_1.Stunned.Value = false;
            end;
            if (l_CurrentPunch_0 == 1 or l_IsHeavy_0) and v203 and v206 then
                v189 = true;
                local v209 = v162:GetAttribute("LastLanded") or 0;
                if l_Workspace_0:GetServerTimeNow() - v209 < v166 then
                    return;
                else
                    v162:SetAttribute("NoBullet", v185);
                    task.delay(0.5, function() --[[ Line: 803 ]]
                        -- upvalues: v162 (copy), v185 (copy)
                        if v162:GetAttribute("NoBullet") == v185 then
                            v162:SetAttribute("NoBullet", nil);
                        end;
                    end);
                    local l_Value_1 = l_CharacterData_0.Stunned.Value;
                    l_CharacterData_0.Stunned.Value = true;
                    l_CharacterData_0.Stunned.Value = l_Value_1;
                    if not v187 then
                        task.spawn(function() --[[ Line: 814 ]]
                            -- upvalues: l_EffectHelper_0 (ref), v162 (copy)
                            l_EffectHelper_0.FeintEffect({
                                v162
                            });
                        end);
                    end;
                end;
            end;
        end;
        local v211 = l_GameplaySettings_0.CalculateStartupMult({
            Character = v162, 
            CurrentPunch = l_CurrentPunch_0, 
            IsFeint = v189, 
            IsHeavy = l_IsHeavy_0, 
            IsUltimate = l_IsUltimate_0, 
            StyleInfo = v178
        });
        local v212 = (v166 or v181.Startup or v182.Startup) / v211;
        v156[v162] = {
            v185, 
            v212, 
            v186, 
            l_CurrentPunch_0, 
            l_CurrentCombo_0
        };
        if l_Styles_0[l_PlayerData_1.Style.Value].CoreInfo.IgnoreStartPunchAbility and l_Occupied_1.LockedOn.Value == v162 then
            if l_CurrentPunch_0 == 1 and not l_IsHeavy_0 then
                local v213 = tick();
                l_Character_2:SetAttribute("IgnoreStart", v213);
                local l_v213_0 = v213 --[[ copy: 42 -> 64 ]];
                task.delay(v212, function() --[[ Line: 846 ]]
                    -- upvalues: l_Character_2 (copy), l_v213_0 (copy)
                    if l_Character_2:GetAttribute("IgnoreStart") == l_v213_0 then
                        l_Character_2:SetAttribute("IgnoreStart", nil);
                    end;
                end);
            else
                l_Character_2:SetAttribute("IgnoreStart", nil);
            end;
        end;
        local v215 = if v187 then l_Occupied_1 and l_Occupied_1.LockedOn.Value else l_Occupied_1 and l_Occupied_1.LockedOn.Value;
        if l_Occupied_1 and v215 == v162 then
            local v216 = 0.11666666666666667;
            if not l_Places_0.IsTesting() then
                if l_PlayerData_0.Knockdowns.Value <= 25 then
                    v216 = v216 * 2;
                elseif l_PlayerData_1.Knockdowns.Value <= 250 then
                    v216 = v216 + 0.05;
                end;
            end;
            l_Character_2:SetAttribute("ClientFreeDash", nil);
            l_Character_2:SetAttribute("FoolishDodge", nil);
            l_Character_2:SetAttribute("Perfect", nil);
            do
                local l_v216_0 = v216;
                if (l_CurrentPunch_0 == 1 or l_IsHeavy_0) and not l_IsCharge_0 then
                    local v218 = math.clamp((l_Workspace_0.Ping.Value - 0.09) / 0.15, 0, 1);
                    local v219 = v162:GetAttribute("LandTime") or 0;
                    local _ = math.clamp((l_Workspace_0.Ping.Value - l_Ping_0) / 2, 0, 0.2);
                    local v221 = v181.PDFrameReduction or v182.PDFrameReduction;
                    if v221 then
                        l_v216_0 = l_v216_0 - v221;
                    end;
                    local v222 = v219 - workspace:GetServerTimeNow();
                    local v223 = l_GameplaySettings_0.GetTimeLeftToDodge(v222);
                    local v224 = math.min(v166 - 0, v223);
                    if (v181.IgnoreFoolishTime or v182.IgnoreFoolishTime) and not l_Character_2:GetAttribute("DisallowIgnoreFoolish") then
                        v224 = v166;
                        l_Character_2:SetAttribute("FoolishDodge", nil);
                        local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
                        l_Character_2:SetAttribute("ClientFreeDash", l_l_Workspace_0_ServerTimeNow_0);
                        local l_l_l_Workspace_0_ServerTimeNow_0_0 = l_l_Workspace_0_ServerTimeNow_0 --[[ copy: 51 -> 63 ]];
                        task.delay(v166, function() --[[ Line: 964 ]]
                            -- upvalues: l_Character_2 (copy), l_l_l_Workspace_0_ServerTimeNow_0_0 (copy)
                            if l_Character_2:GetAttribute("ClientFreeDash") == l_l_l_Workspace_0_ServerTimeNow_0_0 then
                                l_Character_2:SetAttribute("ClientFreeDash", nil);
                            end;
                        end);
                    end;
                    local l_l_LocalPlayer_0_Attribute_0 = l_LocalPlayer_0:GetAttribute("Interface");
                    if l_l_LocalPlayer_0_Attribute_0 == "Touch" or l_l_LocalPlayer_0_Attribute_0 == "Controller" then
                        l_v216_0 = l_v216_0 + 0.025;
                    end;
                    l_v216_0 = l_v216_0 * (1 + 0.33000000000000007 * v218);
                    local _ = tick();
                    l_Character_2:SetAttribute("CanRollback", (tick()));
                    local l_v219_0 = v219 --[[ copy: 45 -> 62 ]];
                    task.delay(v224 - l_v216_0, function() --[[ Line: 988 ]]
                        -- upvalues: v156 (ref), v162 (copy), v185 (copy), l_IsCharge_0 (copy), v181 (ref), l_Character_2 (copy), l_v219_0 (copy), l_v216_0 (ref)
                        if v156[v162][1] ~= v185 then
                            return;
                        elseif l_IsCharge_0 then
                            return;
                        else
                            local l_TrailInfo_0 = v181.TrailInfo;
                            local v231 = (l_TrailInfo_0 and type(l_TrailInfo_0.TargetPart) == "string" and l_TrailInfo_0.TargetPart or "RightHand") == "LeftHand" and "Right" or "Left";
                            l_Character_2:SetAttribute("NeededDirection", v231);
                            l_Character_2:SetAttribute("Perfect", l_v219_0);
                            task.wait(l_v216_0);
                            if l_Character_2:GetAttribute("Perfect") == l_v219_0 then
                                l_Character_2:SetAttribute("Perfect", nil);
                            end;
                            return;
                        end;
                    end);
                    if (l_RunService_0:IsStudio() or l_LocalPlayer_0.Name == "drowningsome" or l_LocalPlayer_0.Name == "TestyTestTest") and (l_Workspace_0.TestingValue.Value or nil) then
                        local v232 = v162:GetAttribute("LandTime") - workspace:GetServerTimeNow();
                        task.delay(l_GameplaySettings_0.GetTimeLeftToDodge(v232) + workspace.TestNumber.Value, function() --[[ Line: 1018 ]]
                            -- upvalues: l_ReplicatedStorage_0 (ref)
                            l_ReplicatedStorage_0:WaitForChild("MobileEvents"):WaitForChild("TryDash"):Fire();
                        end);
                    end;
                else
                    l_Character_2:SetAttribute("Perfect", nil);
                end;
            end;
        end;
        local v233 = v181.TrailInfo or v182.TrailInfo;
        if v233 then
            local v234 = {
                v233.EffectName, 
                v162; 
                TrailInfo = v233
            };
            if not v187 then
                local _ = v234[1];
                task.defer(function() --[[ Line: 1092 ]]
                    -- upvalues: v156 (ref), v162 (copy), v185 (copy), l_EffectHelper_0 (ref), v233 (copy)
                    if v156[v162][1] ~= v185 then
                        return;
                    else
                        l_EffectHelper_0[v233.EffectName]({
                            Character = v162, 
                            TrailInfo = v233
                        });
                        return;
                    end;
                end);
            end;
        end;
        local v236 = v181.ExtraEffect or v182.ExtraEffect;
        if v236 and not v187 then
            local v237 = {
                v236.Effect, 
                v162, 
                v236.EffectDelay, 
                v236
            };
            local v238 = v237[1];
            local l_v238_0 = v238 --[[ copy: 46 -> 60 ]];
            local l_v237_0 = v237 --[[ copy: 45 -> 61 ]];
            task.defer(function() --[[ Line: 1119 ]]
                -- upvalues: v156 (ref), v162 (copy), v185 (copy), l_EffectHelper_0 (ref), l_v238_0 (copy), l_v237_0 (copy)
                if v156[v162][1] ~= v185 then
                    return;
                else
                    l_EffectHelper_0[l_v238_0](l_v237_0);
                    return;
                end;
            end);
        end;
        local v241 = v181.AuraEffect or v182.AuraEffect;
        if v241 then
            local v242 = {
                "PlayAura", 
                v162, 
                v241.Name
            };
            local v243 = v242[1];
            local l_v243_0 = v243 --[[ copy: 47 -> 58 ]];
            local l_v242_0 = v242 --[[ copy: 46 -> 59 ]];
            task.defer(function() --[[ Line: 1138 ]]
                -- upvalues: v156 (ref), v162 (copy), v185 (copy), l_EffectHelper_0 (ref), l_v243_0 (copy), l_v242_0 (copy)
                if v156[v162][1] ~= v185 then
                    return;
                else
                    l_EffectHelper_0[l_v243_0](l_v242_0);
                    return;
                end;
            end);
        end;
        if (l_CurrentPunch_0 <= 1 or l_IsHeavy_0 or l_IsUltimate_0) and not (v181.HideStartup or v182.HideStartup) then
            local v246 = {
                "StartupHighlight", 
                v162, 
                l_IsHeavy_0, 
                l_IsCharge_0, 
                l_IsUltimate_0, 
                v181.StartupScale or v182.StartupScale, 
                v189
            };
            if not v187 then
                local v247 = v246[1];
                local l_v247_0 = v247 --[[ copy: 47 -> 56 ]];
                local l_v246_0 = v246 --[[ copy: 46 -> 57 ]];
                task.defer(function() --[[ Line: 1161 ]]
                    -- upvalues: v156 (ref), v162 (copy), v185 (copy), l_EffectHelper_0 (ref), l_v247_0 (copy), l_v246_0 (copy)
                    if v156[v162][1] ~= v185 then
                        return;
                    elseif not l_EffectHelper_0[l_v247_0] then
                        return;
                    else
                        l_EffectHelper_0[l_v247_0](l_v246_0);
                        return;
                    end;
                end);
            end;
        end;
        local v250 = {
            Priority = Enum.AnimationPriority.Action3, 
            Animator = l_Humanoid_1:FindFirstChild("Animator"), 
            AnimId = v181.AnimId or v182.AnimId, 
            NameFade = 0.05, 
            FadeIn = 0.1, 
            Weight = 1000, 
            Name = "Server", 
            AnimSpeed = v194
        };
        if l_CurrentPunch_0 == 1 and not l_IsHeavy_0 then
            v250.Weight = 1001;
        elseif l_IsHeavy_0 or l_IsUltimate_0 then
            v250.Weight = 1001;
        end;
        if not v187 and (l_CurrentPunch_0 == 1 or l_IsHeavy_0) then
            v250.AnimSpeed = v250.AnimSpeed * ((v181.Startup or v182.Startup) / v166);
        end;
        if l_IsCharge_0 then
            v250.SpeedDelay = {
                MaxIndex = 15, 
                TargetSpeed = 0.15, 
                Time = v212 * 0.2
            };
        end;
        task.defer(function() --[[ Line: 1202 ]]
            -- upvalues: v187 (copy), l_AnimHelper_0 (ref), v250 (copy)
            if not v187 then
                l_AnimHelper_0:CreateAnim(v250);
            end;
        end);
        local v251 = v181.StartSound or v182.StartSound;
        if v251 then
            l_SoundHelper_0:PlaySound({
                Name = v251, 
                Parent = v162.PrimaryPart, 
                PartName = v162.Name .. "Start"
            });
        end;
        local l_Occupied_2 = l_Workspace_0.States[v162.Name].Occupied;
        task.delay(v212 - 0.1, function() --[[ Line: 1223 ]]
            -- upvalues: v156 (ref), v162 (copy), v185 (copy), l_CharacterData_0 (copy), l_Occupied_2 (copy), l_CurrentPunch_0 (copy), v187 (copy), l_SoundHelper_0 (ref), v152 (ref)
            if not v156[v162] or v156[v162][1] ~= v185 then
                return;
            elseif l_CharacterData_0.Stunned.Value or l_Occupied_2.Stunned.Value then
                return;
            elseif l_CurrentPunch_0 > 1 then
                return;
            else
                if not v187 then
                    l_SoundHelper_0:PlaySound({
                        Name = "Step", 
                        Parent = v162.PrimaryPart, 
                        SpeedMult = v152:NextNumber(1.4, 1.6), 
                        Volume = 0.06666666666666667, 
                        PartName = v162.Name .. "Start"
                    });
                end;
                return;
            end;
        end);
        local v253 = false;
        if v215 == v162 then
            v253 = true;
            l_CharacterData_0.FastFace.Value = v185;
            task.delay(v212 * 1.5, function() --[[ Line: 1249 ]]
                -- upvalues: l_CharacterData_0 (copy), v185 (copy)
                if l_CharacterData_0.FastFace.Value == v185 then
                    l_CharacterData_0.FastFace.Value = 0;
                end;
            end);
        end;
        task.delay(v212, function() --[[ Line: 1256 ]]
            -- upvalues: v156 (ref), v162 (copy), v185 (copy), l_CharacterData_0 (copy), l_Occupied_2 (copy), v187 (copy), l_SoundHelper_0 (ref), l_IsHeavy_0 (copy), v152 (ref)
            if not v156[v162] or v156[v162][1] ~= v185 then
                return;
            elseif l_CharacterData_0.Stunned.Value or l_Occupied_2.Stunned.Value then
                return;
            else
                if not v187 then
                    l_SoundHelper_0:PlaySound({
                        Name = l_IsHeavy_0 and "SwingBig" or "Swing", 
                        Parent = v162.PrimaryPart, 
                        SpeedMult = v152:NextNumber(0.85, 1.15), 
                        PartName = v162.Name .. "Start"
                    });
                end;
                return;
            end;
        end);
        v153 = nil;
        return;
    end;
end);
l_Workspace_0.States:WaitForChild(l_LocalPlayer_0.Name):WaitForChild("Occupied").LockedOn.Changed:Connect(function(_) --[[ Line: 1283 ]]

end);
local v255 = {};
local v256 = nil;
SetStunned = function(v257, v258, v259) --[[ Line: 1294 ]] --[[ Name: SetStunned ]]
    -- upvalues: l_Workspace_0 (copy)
    if not v257 then
        return;
    else
        if not v258 then
            v258 = 1;
        end;
        if not v259 then
            v259 = l_Workspace_0:GetServerTimeNow();
        end;
        local l_FirstChild_2 = l_Workspace_0.States:FindFirstChild(v257.Name);
        local v261 = l_FirstChild_2 and l_FirstChild_2:FindFirstChild("Occupied");
        if not v261 then
            return;
        else
            v261.Stunned.Value = true;
            v257:SetAttribute("LocalLastStunned", v259);
            task.delay(v258, function() --[[ Line: 1306 ]]
                -- upvalues: v257 (copy), v259 (ref), v261 (copy)
                if v257:GetAttribute("LocalLastStunned") ~= v259 then
                    return;
                else
                    v261.Stunned.Value = false;
                    return;
                end;
            end);
            return;
        end;
    end;
end;
l_ReplicateLanded_0.OnClientEvent:Connect(function(v262) --[[ Line: 1317 ]]
    -- upvalues: l_Buwic_0 (copy), v155 (copy), l_LocalPlayer_0 (copy), l_Workspace_0 (copy), l_GameplaySettings_0 (copy), v153 (ref), l_EffectHelper_0 (copy), l_Events_0 (copy), l_Styles_0 (copy), v256 (ref), v255 (ref), l_TweenService_0 (copy), l_AnimHelper_0 (copy), v152 (copy), l_SoundHelper_0 (copy)
    local v263 = v262[1];
    local v264 = v262[2];
    local v265 = v262[3];
    local v266 = l_Buwic_0.fromBuffer(v263);
    local v267 = v266:readu16();
    local v268 = v266:readi8() == 1;
    local v269 = v266:readf32();
    local v270 = v266:readf32();
    if v270 == -1 then
        v270 = nil;
    end;
    v264:SetAttribute("TryAttack", nil);
    local v271 = v266:readf32();
    local v272 = v155[v267];
    if not v272 then
        return;
    elseif v264:GetAttribute("IgnoreNextLanded") then
        v264:SetAttribute("IgnoreNextLanded", nil);
        return;
    else
        local _ = v272.Ping;
        local l_IsHeavy_1 = v272.IsHeavy;
        local _ = v272.IsCharge;
        local l_IsUltimate_1 = v272.IsUltimate;
        local l_CurrentCombo_1 = v272.CurrentCombo;
        local l_CurrentPunch_1 = v272.CurrentPunch;
        if not v264 then
            return;
        elseif v264:GetAttribute("SlowMoNoDamage") then
            return;
        else
            local v279 = l_LocalPlayer_0.Character == v264;
            local v280 = l_LocalPlayer_0.Character == v265;
            local v281 = l_Workspace_0.States[v265.Name];
            local l_Occupied_3 = v281.Occupied;
            local _ = v281.CharacterData;
            local l_v265_Attribute_0 = v265:GetAttribute("LastRollback");
            local _ = l_Occupied_3.AwaitRollback.Value;
            local l_RollbackTime_0 = l_GameplaySettings_0.RollbackTime;
            local v287 = false;
            local function v290() --[[ Line: 1368 ]] --[[ Name: TryAwaitRollback ]]
                -- upvalues: v287 (ref), v280 (copy), l_Occupied_3 (copy), v265 (copy), v153 (ref), l_RollbackTime_0 (copy)
                if v287 then
                    return;
                elseif not v280 or not l_Occupied_3.Dashing.Value then
                    return;
                else
                    v287 = true;
                    local _ = v265:GetAttribute("LastRollback");
                    local v289 = tick();
                    while not v153 and l_Occupied_3.AwaitRollback.Value do
                        task.wait();
                        if tick() - v289 > l_RollbackTime_0 + 0.01 then
                            break;
                        end;
                    end;
                    return;
                end;
            end;
            v290();
            if l_CurrentPunch_1 == 1 or l_IsHeavy_1 then
                task.wait(0.025);
            end;
            v290();
            if v153 then
                v153 = nil;
                return;
            elseif l_v265_Attribute_0 ~= v265:GetAttribute("LastRollback") then
                return;
            else
                local v291 = l_EffectHelper_0.GetWeldCharacter(v265);
                if v291 then
                    for _, v293 in v291:GetChildren() do
                        if v293.Name == "DeleteHighlight" then
                            v293:Destroy();
                        end;
                    end;
                end;
                if v279 then
                    task.spawn(function() --[[ Line: 1415 ]]
                        -- upvalues: l_Events_0 (ref)
                        l_Events_0.Landed:Fire();
                    end);
                end;
                local l_PlayerData_2 = l_Workspace_0.States[v264.Name].PlayerData;
                local l_CharacterData_3 = l_Workspace_0.States[v264.Name].CharacterData;
                local _ = v264:FindFirstChild("Humanoid");
                local l_Value_3 = l_PlayerData_2:FindFirstChild("Style").Value;
                local v298 = l_Styles_0[l_Value_3].Combos[l_CurrentCombo_1];
                local v299 = v298[l_CurrentPunch_1];
                if l_IsHeavy_1 then
                    v298 = l_Styles_0[l_Value_3].HeavyAttacks;
                    v299 = v298[l_CurrentPunch_1];
                elseif l_IsUltimate_1 then
                    v298 = l_Styles_0[l_Value_3].UltimateInfo;
                    v299 = v298[1];
                end;
                local v300 = v298.DefaultPunchInfo or l_Styles_0[l_Value_3].DefaultPunchInfo;
                local function _(v301) --[[ Line: 1439 ]] --[[ Name: GetPunchInfo ]]
                    -- upvalues: v299 (ref), v300 (copy)
                    return v299[v301] or v300[v301];
                end;
                local v303 = v299.KnockbackInfo or v300.KnockbackInfo;
                local l_v265_Attribute_2 = v265:GetAttribute("HyperArmor");
                local l_v265_Attribute_3 = v265:GetAttribute("SuperArmor");
                if l_v265_Attribute_3 then
                    v303 = nil;
                end;
                if (v279 or v280) and not l_IsUltimate_1 and v303 then
                    local _ = v303.Distance;
                    local v307 = v266:readf64();
                    local v308 = v266:readVector3();
                    local _ = v266:readf32();
                    local v310 = v266:readVector3();
                    local l_v265_Attribute_4 = v265:GetAttribute("ActiveNPC");
                    local v312 = {
                        Victim = v265, 
                        StartTime = v307, 
                        VictimPosition = l_v265_Attribute_4 and v265.PrimaryPart.Position or v308, 
                        TargetVector = v310 * Vector3.new(1, 0, 1, 0), 
                        TargetTime = v303.TargetTime or l_CurrentPunch_1 == 1 and 0.3 or 0.2, 
                        HitIndex = v303.HitIndex or 1
                    };
                    if l_CurrentPunch_1 == 1 or l_IsHeavy_1 then
                        v256 = nil;
                    end;
                    if l_CurrentPunch_1 > 1 then
                        v312.VictimPosition = v265.PrimaryPart.Position;
                        if v256 then
                            local v313 = v256[1];
                            local v314 = v256[2];
                            if tick() - v314 < 0.8 then
                                v312.VictimPosition = v313;
                            end;
                            v256 = nil;
                        end;
                    end;
                    v256 = {
                        v312.VictimPosition + v312.TargetVector, 
                        tick()
                    };
                    if l_CurrentPunch_1 == 1 or l_IsHeavy_1 then
                        if v280 then
                            v312.StartTime = l_Workspace_0:GetServerTimeNow();
                            v312.TargetTime = 0.3;
                            v312.ExtraDelay = 0.3;
                        elseif v279 then
                            v312.StartTime = l_Workspace_0:GetServerTimeNow();
                            v312.TargetTime = 0.3;
                            v312.ExtraDelay = 0.4;
                        end;
                    end;
                    local l_v312_0 = v312 --[[ copy: 46 -> 103 ]];
                    task.spawn(function() --[[ Line: 1507 ]]
                        -- upvalues: l_v312_0 (copy)
                        SimulateKnockback(l_v312_0);
                    end);
                end;
                v255 = {};
                local l_HitInfo_0 = v299.HitInfo;
                local l_AnimName_0 = l_HitInfo_0.AnimName;
                local l_Direction_0 = l_HitInfo_0.Direction;
                local l_PlayerData_3 = l_Workspace_0.States[v265.Name].PlayerData;
                local l_CharacterData_4 = l_Workspace_0.States[v265.Name].CharacterData;
                local l_Humanoid_3 = v265:FindFirstChild("Humanoid");
                local l_Style_0 = l_PlayerData_3:FindFirstChild("Style");
                local v323 = l_Styles_0[l_Style_0.Value];
                local l_Value_4 = l_CharacterData_4.Blocking.Value;
                if not l_PlayerData_3 or not l_CharacterData_4 or not l_Humanoid_3 or l_Humanoid_3.Health <= 0 then
                    return;
                else
                    if v280 and l_Style_0.Value == "Supernova" and l_CurrentPunch_1 <= 1 then
                        v265:SetAttribute("Dizzy", nil);
                        local v325 = tick();
                        v265:SetAttribute("LastDizzyUpdate", v325);
                        v265:SetAttribute("Dizzy", l_TweenService_0:GetValue(l_CharacterData_4.CTE.Value, Enum.EasingStyle.Linear, Enum.EasingDirection.In) * 0.8);
                        local l_v325_0 = v325 --[[ copy: 49 -> 102 ]];
                        task.delay(3, function() --[[ Line: 1540 ]]
                            -- upvalues: v265 (copy), l_v325_0 (copy), l_CharacterData_4 (copy)
                            if v265:GetAttribute("LastDizzyUpdate") == l_v325_0 then
                                v265:SetAttribute("Dizzy", l_CharacterData_4.CTE.Value / 1.8);
                            end;
                        end);
                    end;
                    local v327 = l_Value_4 and v323.BlockAnimations or v323.HitAnimations;
                    if l_Value_4 and l_IsHeavy_1 then
                        l_AnimName_0 = l_AnimName_0:sub(1, -6);
                    end;
                    local v328 = false;
                    local v329 = 0;
                    if l_CurrentPunch_1 == 1 or l_IsHeavy_1 then
                        v328 = true;
                        v329 = GetRollbackDelayFromPing(v271);
                        if v265 == l_LocalPlayer_0.Character then
                            v329 = 0.1;
                        end;
                    end;
                    if v280 then
                        local l_Value_5 = l_CharacterData_4.Blocking.Value;
                        local v331 = l_Value_5 and 1 or 1;
                        if v299.NoFollowIfBlock or v300.NoFollowIfBlock then
                            v264:SetAttribute("VictimBlocking", l_Value_5);
                        end;
                        local v332 = (v299.StunTime or v300.StunTime) * v331;
                        local v333 = v299.BlockStunTime or v300.BlockStunTime;
                        if l_Value_5 and v333 then
                            v332 = v333;
                        end;
                        SetStunned(v265, v332, l_Workspace_0:GetServerTimeNow());
                    end;
                    local v334 = v327[l_Workspace_0.StyleMode.Value .. l_AnimName_0] or v327[l_AnimName_0];
                    local l_OverrideAnim_0 = l_HitInfo_0.OverrideAnim;
                    if not l_Value_4 and l_OverrideAnim_0 then
                        v334 = l_OverrideAnim_0;
                    end;
                    local v336 = l_Value_4 and "BlockHitAnimWeight" or "HitAnimWeight";
                    local v337 = l_Value_4 and "BlockBodyHitAnimWeight" or "BodyHitAnimWeight";
                    local v338 = v323.CoreInfo[v336] or 1000;
                    local l_Action2_0 = Enum.AnimationPriority.Action2;
                    local v340 = "HitAnim";
                    if l_v265_Attribute_3 or v265:GetAttribute("JoeBurnTransition") then
                        v334 = nil;
                    end;
                    if l_v265_Attribute_2 then
                        l_Action2_0 = Enum.AnimationPriority.Action;
                        v340 = "Remove";
                    end;
                    if string.find(v340, "Body") then
                        v338 = v323.CoreInfo[v337] or v338;
                    end;
                    local v341 = false;
                    if v323.CoreInfo[v336] or v323.CoreInfo[v337] then
                        v341 = true;
                    end;
                    local v342 = v323.CoreInfo.HitNameFade or 0.001;
                    if v334 then
                        local v343 = l_Humanoid_3:FindFirstChild("Animator") or l_Humanoid_3;
                        local v344 = {
                            Priority = l_Action2_0, 
                            Animator = v343, 
                            AnimId = v334, 
                            NameFade = v342, 
                            FadeIn = 0.05, 
                            Weight = v338, 
                            Name = v340, 
                            AnimSpeed = v299.HitAnimSpeed or v300.HitAnimSpeed or 1, 
                            OverrideWeight = v341
                        };
                        if l_Value_4 then
                            v344.StopInfo = {
                                StopDelay = 0.35, 
                                StopTime = 0.5
                            };
                        else
                            v344.StopInfo = {
                                StopDelay = l_IsHeavy_1 and 0.6666666666666666 or 0.5, 
                                StopTime = 0.3333333333333333
                            };
                        end;
                        local l_v344_0 = v344 --[[ copy: 62 -> 101 ]];
                        task.defer(function() --[[ Line: 1662 ]]
                            -- upvalues: v280 (copy), v153 (ref), l_AnimHelper_0 (ref), l_v344_0 (copy), v279 (copy), l_CurrentPunch_1 (copy), l_IsHeavy_1 (copy), l_IsUltimate_1 (copy)
                            if v280 then
                                if v153 then
                                    return;
                                else
                                    l_AnimHelper_0:CreateAnim(l_v344_0);
                                    return;
                                end;
                            else
                                if v279 and l_CurrentPunch_1 > 1 and not l_IsHeavy_1 and not l_IsUltimate_1 then
                                    l_v344_0.Animator = nil;
                                end;
                                if v153 then
                                    return;
                                else
                                    l_v344_0.Priority = Enum.AnimationPriority.Action3;
                                    l_AnimHelper_0:CreateAnim(l_v344_0);
                                    return;
                                end;
                            end;
                        end);
                    end;
                    local v346 = CFrame.lookAt(v265.PrimaryPart.Position, v264.PrimaryPart.Position) * CFrame.new(0, 0, -0.7);
                    if l_Direction_0 == "Right" then
                        v346 = v346 * CFrame.new(v152:NextNumber(0.3, 0.8), 1 + v152:NextNumber(0, 0.4), 0);
                    elseif l_Direction_0 == "Left" then
                        v346 = v346 * CFrame.new(-v152:NextNumber(0.3, 0.8), 1 + v152:NextNumber(0, 0.4), 0);
                    elseif l_Direction_0 == "Forward" then
                        v346 = v346 * CFrame.new(0, 1, 0);
                    end;
                    local v347 = v299.HitCFrameOffset or v300.HitCFrameOffset;
                    if v347 then
                        v346 = v346 * v347;
                    end;
                    local v348 = v299.HitEffect or v300.HitEffect;
                    local v349 = if l_Value_4 then v323.CoreInfo.BlockEffect or "BlockMain" else v348 or l_IsHeavy_1 and "HeavyMain" or "HitMain";
                    local l_TrailInfo_1 = v299.TrailInfo;
                    local v351 = "RightHand";
                    if type(l_TrailInfo_1) == "table" and type(l_TrailInfo_1.TargetPart) == "string" then
                        v351 = l_TrailInfo_1.TargetPart;
                    end;
                    local v352 = {
                        v349, 
                        v265, 
                        v346, 
                        v264, 
                        v351
                    };
                    if v279 and l_CurrentPunch_1 == 1 or not v279 then
                        local v353 = v352[1];
                        local l_v353_0 = v353 --[[ copy: 68 -> 100 ]];
                        task.spawn(function() --[[ Line: 1717 ]]
                            -- upvalues: v328 (ref), v329 (ref), v153 (ref), l_EffectHelper_0 (ref), l_v353_0 (copy), v352 (copy)
                            if v328 then
                                task.wait((math.max(0.075, v329)));
                            else
                                task.wait(0.075);
                            end;
                            if v153 or not l_EffectHelper_0[l_v353_0] then
                                return;
                            else
                                l_EffectHelper_0[l_v353_0](v352);
                                return;
                            end;
                        end);
                    end;
                    local v355 = v299.ExtraCounterEffect or v300.ExtraCounterEffect;
                    if v268 and v355 then
                        local v356 = {
                            v355, 
                            v265, 
                            v346, 
                            v264
                        };
                        local v357 = v356[1];
                        local l_v357_0 = v357 --[[ copy: 70 -> 98 ]];
                        local l_v356_0 = v356 --[[ copy: 69 -> 99 ]];
                        task.spawn(function() --[[ Line: 1743 ]]
                            -- upvalues: v153 (ref), l_EffectHelper_0 (ref), l_v357_0 (copy), l_v356_0 (copy)
                            if v153 or not l_EffectHelper_0[l_v357_0] then
                                return;
                            else
                                l_EffectHelper_0[l_v357_0](l_v356_0);
                                return;
                            end;
                        end);
                    end;
                    local v360 = v299.ExtraHitEffect or v300.ExtraHitEffect;
                    if v360 then
                        local v361 = {
                            v360.Effect, 
                            v264
                        };
                        local v362 = v361[1];
                        local l_v362_0 = v362 --[[ copy: 71 -> 96 ]];
                        local l_v361_0 = v361 --[[ copy: 70 -> 97 ]];
                        task.defer(function() --[[ Line: 1758 ]]
                            -- upvalues: v328 (ref), v329 (ref), v153 (ref), l_EffectHelper_0 (ref), l_v362_0 (copy), l_v361_0 (copy)
                            if v328 then
                                task.wait(v329);
                            end;
                            if v153 or not l_EffectHelper_0[l_v362_0] then
                                return;
                            else
                                l_EffectHelper_0[l_v362_0](l_v361_0);
                                return;
                            end;
                        end);
                    end;
                    local v365 = v299.ExtraVictimHitEffect or v300.ExtraVictimHitEffect;
                    if v365 then
                        local v366 = {
                            v365.Effect, 
                            v265
                        };
                        local v367 = v366[1];
                        local l_v367_0 = v367 --[[ copy: 72 -> 94 ]];
                        local l_v366_0 = v366 --[[ copy: 71 -> 95 ]];
                        task.defer(function() --[[ Line: 1777 ]]
                            -- upvalues: v328 (ref), v329 (ref), v153 (ref), l_EffectHelper_0 (ref), l_v367_0 (copy), l_v366_0 (copy)
                            if v328 then
                                task.wait(v329);
                            end;
                            if v153 or not l_EffectHelper_0[l_v367_0] then
                                return;
                            else
                                l_EffectHelper_0[l_v367_0](l_v366_0);
                                return;
                            end;
                        end);
                    end;
                    local v370 = if l_Value_4 then v323.CoreInfo.GuardHitSound or "GuardHit" else v299.HitSound or v300.HitSound;
                    local v371 = v299.ExtraHitSound or v300.ExtraHitSound;
                    if v279 and (l_CurrentPunch_1 == 1 or l_IsHeavy_1 or l_IsUltimate_1) or not v279 then
                        local v372 = v352[1];
                        local l_v372_0 = v372 --[[ copy: 73 -> 93 ]];
                        task.spawn(function() --[[ Line: 1794 ]]
                            -- upvalues: v328 (ref), v329 (ref), v153 (ref), l_EffectHelper_0 (ref), l_v372_0 (copy), v352 (copy)
                            if v328 then
                                task.wait(v329);
                            end;
                            if v153 or not l_EffectHelper_0[l_v372_0] then
                                return;
                            else
                                l_EffectHelper_0[l_v372_0](v352);
                                return;
                            end;
                        end);
                        task.spawn(function() --[[ Line: 1804 ]]
                            -- upvalues: v328 (ref), v329 (ref), v153 (ref), l_SoundHelper_0 (ref), v370 (copy), v264 (copy), v152 (ref), l_Value_4 (copy), v323 (copy), v299 (ref), v300 (copy), l_IsHeavy_1 (copy)
                            if v328 then
                                task.wait(v329);
                            end;
                            if v153 then
                                return;
                            else
                                l_SoundHelper_0:PlaySound({
                                    Name = v370, 
                                    Parent = v264.PrimaryPart, 
                                    Speed = v152:NextNumber(0.9, 1.1) * (l_Value_4 and v323.CoreInfo.GuardHitSoundSpeedMult or v299.HitSoundSpeedMult or v300.HitSoundSpeedMult or 1), 
                                    PartName = v264.Name .. "Hit"
                                });
                                if v299.NoHeavyLayer or v300.NoHeavyLayer then
                                    return;
                                else
                                    local v374 = v299.PlayHeavyLayer or v300.PlayHeavyLayer;
                                    if l_IsHeavy_1 or v374 then
                                        l_SoundHelper_0:PlaySound({
                                            Name = "HeavyLayer", 
                                            Parent = v264.PrimaryPart, 
                                            Speed = v152:NextNumber(0.9, 1.1), 
                                            PartName = v264.Name .. "Hit"
                                        });
                                        l_SoundHelper_0:PlaySound({
                                            Name = "Crush", 
                                            Parent = v264.PrimaryPart, 
                                            Speed = v152:NextNumber(0.9, 1.1), 
                                            PartName = v264.Name .. "Hit"
                                        });
                                    end;
                                    return;
                                end;
                            end;
                        end);
                    end;
                    task.spawn(function() --[[ Line: 1843 ]]
                        -- upvalues: v328 (ref), v329 (ref), v153 (ref), v371 (copy), l_SoundHelper_0 (ref), v264 (copy), v152 (ref), v299 (ref), v300 (copy)
                        if v328 then
                            task.wait(v329);
                        end;
                        if v153 then
                            return;
                        else
                            if v371 then
                                l_SoundHelper_0:PlaySound({
                                    Name = v371, 
                                    Parent = v264.PrimaryPart, 
                                    Speed = v152:NextNumber(0.9, 1.1) * (v299.ExtraHitSoundSpeedMult or v300.ExtraHitSoundSpeedMult or 1), 
                                    PartName = v264.Name .. "Hit"
                                });
                            end;
                            return;
                        end;
                    end);
                    local v375 = v299.ShakeInfo or v300.ShakeInfo;
                    local v376 = {
                        "HUDShakeS", 
                        v269 / 5
                    };
                    local v377 = nil;
                    local v378 = v299.Startup or v300.Startup;
                    local v379 = v299.ChargeInfo or v300.ChargeInfo;
                    if v270 then
                        local v380 = v299.MaxTime or v300.MaxTime;
                        v377 = (math.min(v270, v380) - v378) / (v380 - v378);
                    end;
                    if v377 then
                        local l_MinShakeInfo_0 = v379.MinShakeInfo;
                        local l_MaxShakeInfo_0 = v379.MaxShakeInfo;
                        v375 = {
                            Preset = l_MinShakeInfo_0.Preset
                        };
                        for v383, _ in l_MinShakeInfo_0 do
                            if v383 ~= "Preset" then
                                local v385 = l_MinShakeInfo_0[v383];
                                v375[v383] = v385 + (l_MaxShakeInfo_0[v383] - v385) * v377;
                            end;
                        end;
                    end;
                    if v375 then
                        v375.Effect = "CameraShake";
                    end;
                    if v279 then
                        task.spawn(function() --[[ Line: 1895 ]]
                            -- upvalues: v328 (ref), v329 (ref), v153 (ref), l_EffectHelper_0 (ref), v375 (ref), v255 (ref)
                            if v328 then
                                task.wait(v329);
                            end;
                            if v153 then
                                return;
                            else
                                local v386 = l_EffectHelper_0.CameraShake(v375);
                                if v328 then
                                    table.insert(v255, v386);
                                end;
                                return;
                            end;
                        end);
                    end;
                    local v387 = {
                        "CameraShakeS", 
                        v375.Fade or 0.2, 
                        v375.FoV or 69, 
                        v375.FoVMult or 3, 
                        v375.Preset or "LightHit", 
                        v375.WaitTime or 0.1
                    };
                    if v279 or v280 then
                        local v388 = v376[1];
                        local l_v388_0 = v388 --[[ copy: 79 -> 92 ]];
                        task.spawn(function() --[[ Line: 1921 ]]
                            -- upvalues: l_EffectHelper_0 (ref), l_v388_0 (copy), v376 (copy)
                            l_EffectHelper_0[l_v388_0](v376);
                        end);
                    end;
                    if v375 and v280 then
                        local v390 = v387[1];
                        local l_v390_0 = v390 --[[ copy: 79 -> 91 ]];
                        task.spawn(function() --[[ Line: 1929 ]]
                            -- upvalues: v328 (ref), v329 (ref), v153 (ref), l_EffectHelper_0 (ref), l_v390_0 (copy), v387 (copy), v255 (ref)
                            if v328 then
                                task.wait(v329);
                            end;
                            if v153 then
                                return;
                            else
                                local v392 = l_EffectHelper_0[l_v390_0](v387);
                                if v328 then
                                    table.insert(v255, v392);
                                end;
                                return;
                            end;
                        end);
                    end;
                    local v393 = v299.MeterCharge or v300.MeterCharge;
                    local v394 = v299.CounterAbilityCharge or v300.CounterAbilityCharge;
                    if v268 and v394 then
                        v393 = v394;
                    end;
                    local v395 = v299.SupernovaComboMeterMult or v300.SupernovaComboMeterMult;
                    if v395 and v264:GetAttribute("InSupernovaCombo") then
                        print("SupernovaCombo!");
                        v393 = v393 * v395;
                    end;
                    if v393 then
                        l_CharacterData_3.AbilityEnergy.Value = math.clamp(l_CharacterData_3.AbilityEnergy.Value + (l_Value_4 and v393 * 0.5 or v393), 0, 100);
                    end;
                    local l_Character_3 = l_LocalPlayer_0.Character;
                    if v268 and (l_Character_3 == v265 or l_Character_3 == v264) then
                        local v397 = {
                            "CounterEffect", 
                            l_Character_3 == v265
                        };
                        local v398 = v397[1];
                        local l_v398_0 = v398 --[[ copy: 84 -> 89 ]];
                        local l_v397_0 = v397 --[[ copy: 83 -> 90 ]];
                        task.defer(function() --[[ Line: 1969 ]]
                            -- upvalues: v328 (ref), v329 (ref), v153 (ref), l_EffectHelper_0 (ref), l_v398_0 (copy), l_v397_0 (copy)
                            if v328 then
                                task.wait(v329);
                            end;
                            if v153 or not l_EffectHelper_0[l_v398_0] then
                                return;
                            else
                                l_EffectHelper_0[l_v398_0](l_v397_0);
                                return;
                            end;
                        end);
                    end;
                    if l_Character_3 == v265 then
                        local l_CharacterData_5 = l_Workspace_0.States[l_Character_3.Name].CharacterData;
                        local l_PlayerData_4 = l_Workspace_0.States[l_Character_3.Name].PlayerData;
                        local _ = l_Workspace_0.States[l_Character_3.Name].Occupied;
                        local l_SpecialInfo_0 = l_Styles_0[l_PlayerData_4.Style.Value].SpecialInfo;
                        if l_SpecialInfo_0 then
                            local l_BlockChargeMult_0 = l_SpecialInfo_0.BlockChargeMult;
                            if l_BlockChargeMult_0 and (l_Value_4 or l_Character_3:GetAttribute("BlockBroken")) then
                                l_CharacterData_5.AbilityEnergy.Value = math.clamp(l_CharacterData_5.AbilityEnergy.Value + v269 * l_BlockChargeMult_0, 0, 100);
                            end;
                        end;
                        local v406 = tick();
                        if v268 then
                            v265:SetAttribute("UpdateNextCombo", true);
                            v265:SetAttribute("NoLocalPunch", v406);
                        end;
                        l_CharacterData_3.FastFace.Value = v406;
                        task.delay(0.5, function() --[[ Line: 2003 ]]
                            -- upvalues: l_CharacterData_3 (copy), v406 (copy), v265 (copy)
                            if l_CharacterData_3.FastFace.Value == v406 then
                                l_CharacterData_3.FastFace.Value = 0;
                            end;
                            if v265:GetAttribute("NoLocalPunch") == v406 then
                                v265:SetAttribute("NoLocalPunch", nil);
                            end;
                        end);
                    end;
                    return;
                end;
            end;
        end;
    end;
end);
l_RollbackDash_0.OnClientEvent:Connect(function(v407) --[[ Line: 2085 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v153 (ref), l_Workspace_0 (copy), v255 (ref), l_Events_0 (copy), l_EffectHelper_0 (copy)
    local v408 = v407[1];
    local v409 = v407[2];
    local v410 = v407[3];
    local v411 = l_LocalPlayer_0.Character == v408;
    local v412 = l_LocalPlayer_0.Character == v409;
    if v411 and v408:GetAttribute("IsComet") then
        return;
    else
        if v411 or v412 then
            local v413 = tick();
            v153 = v413;
            v408:SetAttribute("LastRollback", v413);
            v409:SetAttribute("LastRollback", v413);
            local l_v413_0 = v413 --[[ copy: 6 -> 15 ]];
            task.delay(1, function() --[[ Line: 2107 ]]
                -- upvalues: v153 (ref), l_v413_0 (copy)
                if v153 == l_v413_0 then
                    v153 = nil;
                end;
            end);
        end;
        local v415 = v409.Name .. "Hit";
        for _, v417 in l_Workspace_0.Debris:GetChildren() do
            if v417.Name == v415 then
                v417:Destroy();
            end;
        end;
        if v410 == -1 then
            return;
        else
            if v411 or v412 then
                for _, v419 in v255 do
                    v419:StartFadeOut(0);
                end;
                if workspace.FightCameraMode.Value == "" then
                    l_Workspace_0.CurrentCamera.FieldOfView = 70;
                end;
            end;
            if v408:GetAttribute("BlockBroken") or v408:GetAttribute("SlowMo") then
                return;
            else
                if v412 then
                    l_Events_0.RollbackLanded:Fire();
                elseif v411 then
                    l_Events_0.RollbackDash:Fire();
                    local v420 = l_EffectHelper_0.GetWeldCharacter(v408);
                    if v420 then
                        for _, v422 in v420:GetChildren() do
                            if v422.Name == "DeleteHighlight" then
                                v422:Destroy();
                            end;
                        end;
                    end;
                end;
                if v412 then
                    local v423 = {
                        Victim = v408, 
                        LookVector = Vector3.new(), 
                        EndPosition = v408.PrimaryPart.Position, 
                        VictimPosition = v408.PrimaryPart.Position, 
                        TargetVector = Vector3.new(), 
                        StartTime = 0, 
                        TargetTime = 0, 
                        HitIndex = 2, 
                        IgnoreSettingCFrame = true
                    };
                    SimulateKnockback(v423);
                end;
                local l_Humanoid_4 = v408:FindFirstChild("Humanoid");
                for _, v426 in ((l_Humanoid_4:FindFirstChild("Animator") or l_Humanoid_4):GetPlayingAnimationTracks()) do
                    if v426.Name == "HitAnim" then
                        v426:Stop(0);
                    end;
                end;
                return;
            end;
        end;
    end;
end);
l_RollbackHit_0.OnClientEvent:Connect(function(v427) --[[ Line: 2182 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Workspace_0 (copy), v153 (ref), v255 (ref), l_AnimHelper_0 (copy)
    local v428 = v427[1];
    local v429 = v427[2];
    local v430 = l_LocalPlayer_0.Character == v428;
    local v431 = l_LocalPlayer_0.Character == v429;
    local v432 = v429.Name .. "Hit";
    for _, v434 in l_Workspace_0.Debris:GetChildren() do
        if v434.Name == v432 then
            v434:Destroy();
        end;
    end;
    if v430 or v431 then
        local v435 = tick();
        v153 = v435;
        v428:SetAttribute("LastRollback", v435);
        v429:SetAttribute("LastRollback", v435);
        local l_v435_0 = v435 --[[ copy: 6 -> 14 ]];
        task.delay(1, function() --[[ Line: 2203 ]]
            -- upvalues: v153 (ref), l_v435_0 (copy)
            if v153 == l_v435_0 then
                v153 = nil;
            end;
        end);
    end;
    if v430 or v431 then
        for _, v438 in v255 do
            v438:StartFadeOut(0);
        end;
        if workspace.FightCameraMode.Value == "" then
            l_Workspace_0.CurrentCamera.FieldOfView = 70;
        end;
    end;
    if v428:GetAttribute("BlockBroken") or v428:GetAttribute("SlowMo") then
        return;
    else
        local l_Humanoid_5 = v428:FindFirstChild("Humanoid");
        local v440 = l_Humanoid_5:FindFirstChild("Animator") or l_Humanoid_5;
        for _, v442 in (v440:GetPlayingAnimationTracks()) do
            if v442.Name == "HitAnim" then
                v442:Stop(0);
            end;
        end;
        l_AnimHelper_0:Restore(v440, "Server", 0.05);
        return;
    end;
end);
local v443 = nil;
local v444 = 10;
local l_CountryRegionForPlayerAsync_0 = game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(l_LocalPlayer_0);
local l_LocalPlayerTeleportData_0 = game:GetService("TeleportService"):GetLocalPlayerTeleportData();
if l_LocalPlayerTeleportData_0 then
    v444 = 13;
end;
if l_LocalPlayerTeleportData_0 and l_LocalPlayerTeleportData_0.IsSoftShutdown then
    v444 = 15;
end;
local v447 = 0;
local v448 = 0;
local v449 = {};
task.spawn(function() --[[ Line: 2261 ]]
    -- upvalues: v447 (ref), v443 (ref), v34 (copy)
    while task.wait(1.5) do
        v447 = v447 + 1;
        if v447 >= 10 then
            v447 = 0;
        end;
        v443 = tick();
        v34:Fire(v447);
    end;
end);
PreviousPing = 0;
v34:Connect(function(v450) --[[ Line: 2275 ]]
    -- upvalues: v447 (ref), v443 (ref), l_Workspace_0 (copy), v448 (ref), v444 (ref), v449 (copy), v35 (copy), l_CountryRegionForPlayerAsync_0 (copy), l_LocalPlayerTeleportData_0 (copy)
    if v450 ~= v447 then
        warn("DELAYED PING - IGNORED!");
        return;
    else
        local v451 = tick() - v443;
        local v452 = v451 - PreviousPing;
        PreviousPing = v451;
        if v452 > 0.05 then
            warn("POSSIBLE FALSE PING SPIKE");
            return;
        else
            l_Workspace_0.Ping.Value = tick() - v443;
            if v448 <= v444 then
                v448 = v448 + 1;
                table.insert(v449, (math.clamp(l_Workspace_0.Ping.Value, 0.05, 0.3333333333333333)));
            end;
            if v448 == v444 then
                table.sort(v449);
                local v453 = v449[math.floor(#v449 / 2)];
                v35:Fire({
                    l_CountryRegionForPlayerAsync_0, 
                    v453, 
                    l_LocalPlayerTeleportData_0 and l_LocalPlayerTeleportData_0.IsFirstJoin == false
                });
            end;
            return;
        end;
    end;
end);
local _ = v33.ReferenceBridge("TeleportToSameServer");
local v455 = {};
local function v461(v456) --[[ Line: 2311 ]] --[[ Name: SetAnimations ]]
    local l_Humanoid_6 = v456:FindFirstChild("Humanoid");
    local v458 = l_Humanoid_6 and l_Humanoid_6:FindFirstChild("Animator");
    if not v458 then
        return;
    else
        for _, v460 in (v458:GetPlayingAnimationTracks()) do
            if v460.Priority ~= Enum.AnimationPriority.Core and v460.Priority ~= Enum.AnimationPriority.Idle and v460.Priority ~= Enum.AnimationPriority.Movement then
                v460.Name = "Server";
            end;
        end;
        return;
    end;
end;
local v462 = l_Workspace_0.States:WaitForChild(l_LocalPlayer_0.Name, 10):WaitForChild("CharacterData", 10);
local v463 = l_Workspace_0.States:WaitForChild(l_LocalPlayer_0.Name, 10):WaitForChild("Occupied", 10);
local l_CustomControlsShared_0 = require(l_Modules_0:WaitForChild("CustomControlsShared"));
local v465 = l_Cleaner_0.new();
TryHandleNPC = function(v466) --[[ Line: 2333 ]] --[[ Name: TryHandleNPC ]]
    -- upvalues: v465 (ref), l_Cleaner_0 (copy), l_CustomControlsShared_0 (copy), l_RunService_0 (copy)
    if v465 then
        v465:Clean();
    end;
    v465 = l_Cleaner_0.new();
    if not v466 or not v466:GetAttribute("ActiveNPC") or v466:GetAttribute("ServerOwnedNPC") then
        return;
    else
        if not v466:FindFirstChild("AnimSpeed") then
            local l_NumberValue_0 = Instance.new("NumberValue");
            l_NumberValue_0.Name = "AnimSpeed";
            l_NumberValue_0.Parent = v466;
            l_NumberValue_0.Value = 1;
        end;
        local v468 = l_CustomControlsShared_0.New({
            Character = v466
        });
        local v469 = script.Animate:Clone();
        v469.Parent = v466;
        v469.Enabled = true;
        v465:Add(l_RunService_0.Heartbeat:Connect(function(v470) --[[ Line: 2363 ]]
            -- upvalues: v466 (copy), v468 (copy)
            if v466.PrimaryPart.Anchored then
                return;
            else
                v468:SetInput(v466:GetAttribute("SimulatedInput") or Vector3.new());
                v468:Update(v470);
                return;
            end;
        end));
        return;
    end;
end;
l_Events_0.TryHandleNPC.Event:Connect(function(v471) --[[ Line: 2370 ]]
    TryHandleNPC(v471);
end);
v463.LockedOn.Changed:Connect(function(v472) --[[ Line: 2374 ]]
    -- upvalues: v455 (copy), l_Workspace_0 (copy), v462 (copy), v461 (copy), l_LocalPlayer_0 (copy)
    for _, v474 in v455 do
        v474:Disconnect();
    end;
    if not v472 then
        return;
    else
        local _ = l_Workspace_0.States[v472.Name];
        v455[1] = v462.Cutscene.Changed:Connect(function() --[[ Line: 2382 ]]
            -- upvalues: v461 (ref), l_LocalPlayer_0 (ref)
            v461(l_LocalPlayer_0.Character);
        end);
        v455[2] = v462.Cutscene.Changed:Connect(function() --[[ Line: 2386 ]]
            -- upvalues: v461 (ref), v472 (copy)
            v461(v472);
        end);
        return;
    end;
end);
v462.Opponent.Changed:Connect(function(v476) --[[ Line: 2391 ]]
    -- upvalues: l_Workspace_0 (copy), v99 (ref), v31 (copy), l_LocalPlayer_0 (copy), l_Places_0 (copy), l_RunService_0 (copy)
    if v476 then
        l_Workspace_0.CurrentMenu.Value = "";
    end;
    v99 = tick();
    task.delay(0.3, function() --[[ Line: 2398 ]]
        -- upvalues: v31 (ref), l_LocalPlayer_0 (ref)
        v31.StopAnimsHack(l_LocalPlayer_0.Character);
    end);
    TryHandleNPC(v476);
    if not v476 then
        if game.PlaceId ~= l_Places_0.Main then
            return;
        else
            local v477 = 0;
            local v478 = nil;
            do
                local l_v477_0 = v477;
                v478 = l_RunService_0.RenderStepped:Connect(function(_) --[[ Line: 2411 ]]
                    -- upvalues: l_v477_0 (ref)
                    l_v477_0 = l_v477_0 + 1;
                end);
                task.wait(2);
                v478:Disconnect();
            end;
        end;
    end;
end);
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_Folder_0 = Instance.new("Folder");
l_Folder_0.Name = "HiddenStorage";
l_Folder_0.Parent = l_ServerStorage_0;
local l_Folder_1 = Instance.new("Folder");
l_Folder_1.Name = "WeldStorage";
l_Folder_1.Parent = l_ServerStorage_0;
local v484 = {};
local v485 = {};
local l_Settings_0 = workspace.Settings;
local v487 = false;
local v488 = {};
local function v491() --[[ Line: 2452 ]] --[[ Name: UpdateHiddenStates ]]
    -- upvalues: l_Players_0 (copy), l_LocalPlayer_0 (copy), v462 (copy), v485 (copy)
    for _, v490 in l_Players_0:GetPlayers() do
        if v490 ~= l_LocalPlayer_0 then
            if v462.Opponent.Value and v462.Opponent.Value.Name == v490.Name then
                v485[v490.Name] = "OPPONENT";
            elseif v490:GetAttribute("InHiddenArea") then
                v485[v490.Name] = "HIDDEN_AREA";
            else
                v485[v490.Name] = "DEFAULT";
            end;
        end;
    end;
end;
local _ = function() --[[ Line: 2468 ]] --[[ Name: UpdateTrackedInstances ]]
    -- upvalues: v488 (copy)
    for _, v493 in v488 do
        task.defer(v493.Update);
    end;
end;
local _ = function(v495) --[[ Line: 2474 ]] --[[ Name: UntrackInstance ]]
    -- upvalues: v488 (copy)
    local v496 = v488[v495];
    if not v496 then
        return;
    else
        for _, v498 in v496.Connections do
            v498:Disconnect();
        end;
        v488[v495] = nil;
        return;
    end;
end;
local function v517(v500, v501) --[[ Line: 2488 ]] --[[ Name: TrackInstance ]]
    -- upvalues: v488 (copy), l_Players_0 (copy), l_Folder_0 (copy), v485 (copy), v487 (ref), v462 (copy)
    if v488[v500] or not v500.Parent then
        return;
    else
        local l_l_Players_0_FirstChild_0 = l_Players_0:FindFirstChild(v500.Name);
        if not l_l_Players_0_FirstChild_0 then
            return;
        else
            local v503 = v501 or l_Folder_0;
            local v504 = {};
            local v505 = {
                IntendedParent = v500.Parent, 
                Connections = v504, 
                Player = l_l_Players_0_FirstChild_0
            };
            local function v508() --[[ Line: 2508 ]] --[[ Name: FixPhysics ]]
                -- upvalues: v500 (copy)
                for _, v507 in v500:GetDescendants() do
                    if v507:IsA("BasePart") then
                        v507.Anchored = false;
                    end;
                end;
            end;
            local function v510() --[[ Line: 2516 ]] --[[ Name: UpdateParent ]]
                -- upvalues: v485 (ref), l_l_Players_0_FirstChild_0 (copy), v488 (ref), v500 (copy), v503 (copy), v505 (copy), v508 (copy), v487 (ref), v462 (ref)
                local v509 = v485[l_l_Players_0_FirstChild_0.Name];
                if v509 == nil or v488[v500] == nil then
                    return;
                elseif v509 == "HIDDEN_AREA" then
                    v500.Parent = v503;
                    return;
                elseif v509 == "OPPONENT" then
                    v500.Parent = v505.IntendedParent;
                    v508();
                    return;
                else
                    if v509 == "DEFAULT" then
                        if v487 and v462.Opponent.Value then
                            v500.Parent = v503;
                            return;
                        else
                            v500.Parent = v505.IntendedParent;
                            v508();
                        end;
                    end;
                    return;
                end;
            end;
            v505.Update = v510;
            v488[v500] = v505;
            table.insert(v504, v500.AncestryChanged:Connect(function(_, v512) --[[ Line: 2542 ]]
                -- upvalues: v503 (copy), v500 (copy), v488 (ref), v505 (copy), v510 (copy)
                if v512 == v503 then
                    return;
                else
                    if v512 == nil then
                        local l_v500_0 = v500;
                        local v514 = v488[l_v500_0];
                        if v514 then
                            for _, v516 in v514.Connections do
                                v516:Disconnect();
                            end;
                            v488[l_v500_0] = nil;
                        end;
                    end;
                    if v512 ~= v505.IntendedParent then
                        task.defer(v510);
                    end;
                    return;
                end;
            end));
            return;
        end;
    end;
end;
local function _() --[[ Line: 2638 ]] --[[ Name: UpdateHide ]]
    -- upvalues: v487 (ref), l_Settings_0 (copy), l_LocalPlayer_0 (copy)
    v487 = l_Settings_0.HideOthers.Value or l_LocalPlayer_0:GetAttribute("ForceHideOthers") or false;
end;
v462.Opponent.Changed:Connect(function() --[[ Line: 2642 ]]
    -- upvalues: v487 (ref), l_Settings_0 (copy), l_LocalPlayer_0 (copy), v491 (copy), v488 (copy)
    v487 = l_Settings_0.HideOthers.Value or l_LocalPlayer_0:GetAttribute("ForceHideOthers") or false;
    v491();
    for _, v520 in v488 do
        task.defer(v520.Update);
    end;
end);
l_Settings_0.HideOthers.Changed:Connect(function() --[[ Line: 2648 ]]
    -- upvalues: v487 (ref), l_Settings_0 (copy), l_LocalPlayer_0 (copy), v491 (copy), v488 (copy)
    v487 = l_Settings_0.HideOthers.Value or l_LocalPlayer_0:GetAttribute("ForceHideOthers") or false;
    v491();
    for _, v522 in v488 do
        task.defer(v522.Update);
    end;
end);
for _, v524 in l_Workspace_0.Live:GetChildren() do
    v517(v524);
end;
l_Workspace_0.Live.ChildAdded:Connect(function(v525) --[[ Line: 2662 ]]
    -- upvalues: v517 (copy)
    v517(v525);
end);
local function v532(v526) --[[ Line: 2670 ]] --[[ Name: HandlePlayer ]]
    -- upvalues: v484 (copy), v491 (copy), v488 (copy)
    local v527 = {};
    v484[v526.Name] = v527;
    table.insert(v527, v526:GetAttributeChangedSignal("InHiddenArea"):Connect(function() --[[ Line: 2674 ]]
        -- upvalues: v491 (ref), v488 (ref)
        v491();
        for _, v529 in v488 do
            task.defer(v529.Update);
        end;
    end));
    v491();
    for _, v531 in v488 do
        task.defer(v531.Update);
    end;
end;
for _, v534 in l_Players_0:GetPlayers() do
    v532(v534);
end;
l_Players_0.PlayerAdded:Connect(v532);
l_Players_0.PlayerRemoving:Connect(function(v535) --[[ Line: 2689 ]]
    -- upvalues: v485 (copy), v484 (copy)
    v485[v535.Name] = nil;
    local v536 = v484[v535.Name];
    if not v536 then
        return;
    else
        for _, v538 in v536 do
            v538:Disconnect();
        end;
        return;
    end;
end);