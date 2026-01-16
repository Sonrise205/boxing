--!native
local v0 = false;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("CollectionService");
local _ = game:GetService("UserInputService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local v9 = l_RunService_0:IsClient();
local _ = require(l_ReplicatedFirst_0:WaitForChild("Places"));
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AlignHelper_0 = require(l_Modules_0:WaitForChild("AlignHelper"));
local l_SettingValueHelper_0 = require(l_ReplicatedStorage_0.PrivateServerPlusModules:WaitForChild("SettingValueHelper"));
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local v16 = nil;
if not v9 then
    v16 = require(game:GetService("ServerScriptService"):WaitForChild("Combat", 30):WaitForChild("Combat", 30));
end;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
if v9 then
    v17 = require(l_Modules_0:WaitForChild("EffectHelper"));
    v19 = require(l_Modules_0:WaitForChild("EmoteHelper"));
    v18 = require(l_Modules_0:WaitForChild("AnimHelper"));
    local v21;
    if game:GetService("RunService"):IsClient() then
        v21 = shared.BridgeNet2;
        if not v21 then
            repeat
                task.wait();
            until shared.BridgeNet2;
            v21 = shared.BridgeNet2;
            v0 = v21;
        else
            v0 = true;
        end;
    end;
    if not v0 then
        if not v0 then
            v21 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
        end;
    end;
    v0 = false;
    v20 = v21.ReferenceBridge("TryDash");
end;
local l_InfoToString_0 = require(l_ReplicatedStorage_0:WaitForChild("InfoToString"));
local l_Events_0 = l_ReplicatedStorage_0.Events;
local _ = require(l_ReplicatedStorage_0:WaitForChild("RemoteRap"));
local l_RemoteEvents_0 = l_ReplicatedStorage_0:WaitForChild("RemoteEvents");
local l_SimulateKnockbackBE_0 = l_RemoteEvents_0:WaitForChild("SimulateKnockbackBE");
local _ = l_RemoteEvents_0:WaitForChild("TryDash");
local l_GameplaySettings_0 = l_Styles_0.GameplaySettings;
local v29 = Random.new();
local function _(v30, v31, v32) --[[ Line: 56 ]] --[[ Name: Lerp ]]
    return v30 + (v31 - v30) * v32;
end;
local v34 = {};
v34.__index = v34;
v34.Init = function(v35, v36) --[[ Line: 61 ]] --[[ Name: Init ]]
    -- upvalues: l_Workspace_0 (copy), l_AlignHelper_0 (copy), v9 (copy), l_Players_0 (copy)
    v35.Character = v36.Character;
    v35.RootPart = v35.Character.PrimaryPart;
    v35.Humanoid = v35.Character:WaitForChild("Humanoid", 20);
    v35.Animator = v35.Humanoid:FindFirstChild("Animator") or v35.Humanoid;
    local v37 = l_Workspace_0:WaitForChild("States", 20):WaitForChild(v35.Character.Name, 20);
    v35.CharacterData = v37:WaitForChild("CharacterData", 20);
    v35.PlayerData = v37:WaitForChild("PlayerData", 20);
    v35.Occupied = v37:WaitForChild("Occupied", 20);
    v35.Style = v35.PlayerData:WaitForChild("Style", 20);
    v35.IgnoreRollbackDodge = false;
    v35.DenyDueToBackDash = false;
    v35.LastDashDirection = nil;
    v35.CurrentDashId = 0;
    v35.LastDashInfo = {};
    if v36.AlignHelper then
        v35.AlignHelper = v36.AlignHelper;
    else
        v35.AlignHelper = l_AlignHelper_0.New({
            Character = v35.Character
        });
    end;
    if v9 then
        v35.Controls = require(l_Players_0:GetPlayerFromCharacter(v35.Character):WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls();
    end;
end;
local l_WearoutInfo_0 = l_Styles_0.JoeBurn.WearoutInfo;
local l_WearoutToDisableBackdash_0 = l_WearoutInfo_0.WearoutToDisableBackdash;
local l_MaxWearoutDashDistanceMult_0 = l_WearoutInfo_0.MaxWearoutDashDistanceMult;
v34.New = function(v41) --[[ Line: 101 ]] --[[ Name: New ]]
    -- upvalues: v34 (copy), v9 (copy), l_Events_0 (copy), l_Workspace_0 (copy), v18 (ref), v19 (ref), l_SimulateKnockbackBE_0 (copy), l_AlignHelper_0 (copy)
    local v42 = setmetatable({}, v34);
    v42:Init(v41);
    if v9 then
        l_Events_0.ForceDash.Event:Connect(function(v43) --[[ Line: 107 ]]
            -- upvalues: v42 (copy)
            v42:TryDash(v43);
        end);
        l_Events_0.RollbackDash.Event:Connect(function() --[[ Line: 111 ]]
            -- upvalues: v42 (copy), l_Workspace_0 (ref), v18 (ref), v19 (ref), l_SimulateKnockbackBE_0 (ref), l_AlignHelper_0 (ref)
            if v42.Character:GetAttribute("DempseyRolling") then
                return;
            else
                local l_AnimInfo_0 = v42.LastDashInfo.AnimInfo;
                l_AnimInfo_0.Priority = Enum.AnimationPriority.Action3;
                l_AnimInfo_0.TimePosition = l_Workspace_0:GetServerTimeNow() - v42.LastDashInfo.CurrentTime;
                local v45 = nil;
                if not l_AnimInfo_0.AnimId and l_AnimInfo_0.AnimId ~= 0 then
                    v45 = v18:CreateAnim(l_AnimInfo_0);
                end;
                local l_AlignInfo_0 = v42.LastDashInfo.AlignInfo;
                if not l_AlignInfo_0.IgnoreStun then
                    local l_CurrentTime_0 = v42.LastDashInfo.CurrentTime;
                    local v48 = l_Workspace_0:GetServerTimeNow() - l_CurrentTime_0;
                    l_AlignInfo_0.MaxTime = l_AlignInfo_0.MaxTime - v48;
                    v42.AlignHelper:MoveAlignPosition(l_AlignInfo_0);
                end;
                if v42.LastDashInfo then
                    local l_AlignInfo_1 = v42.LastDashInfo.AlignInfo;
                    local l_CurrentTime_1 = v42.LastDashInfo.CurrentTime;
                    local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
                    local v52 = l_l_Workspace_0_ServerTimeNow_0 - l_CurrentTime_1;
                    l_AlignInfo_1.MaxTime = l_AlignInfo_1.MaxTime - v52;
                    if v42.IgnoreRollbackDodge then
                        return;
                    else
                        v19.StopAnimsHack(v42.Character);
                        v45 = v18:CreateAnim(l_AnimInfo_0);
                        local v53 = {
                            Victim = v42.Character, 
                            LookVector = v42.Character.PrimaryPart.CFrame.LookVector, 
                            EndPosition = v42.RootPart.Position, 
                            VictimPosition = v42.RootPart.Position, 
                            TargetVector = Vector3.new(), 
                            StartTime = l_l_Workspace_0_ServerTimeNow_0, 
                            TargetTime = 0, 
                            HitIndex = 3, 
                            IgnoreSettingCFrame = true
                        };
                        l_SimulateKnockbackBE_0:Fire(v53);
                        task.wait();
                        l_AlignHelper_0:MoveAlignPosition(l_AlignInfo_1);
                    end;
                end;
                return;
            end;
        end);
    end;
    return v42;
end;
local v54 = {
    Forward = Vector3.new(0, 0, -1, 0), 
    Backward = Vector3.new(0, 0, 1, 0), 
    Left = Vector3.new(-1, 0, 0, 0), 
    Right = Vector3.new(1, 0, 0, 0)
};
v34.Dash = function(v55, v56) --[[ Line: 217 ]] --[[ Name: Dash ]]
    -- upvalues: l_Styles_0 (copy), v9 (copy), v54 (copy), l_WearoutToDisableBackdash_0 (copy), l_Workspace_0 (copy), l_MaxWearoutDashDistanceMult_0 (copy), l_SettingValueHelper_0 (copy), l_GameplaySettings_0 (copy), l_InfoToString_0 (copy), l_SimulateKnockbackBE_0 (copy), v20 (ref), v16 (ref), v17 (ref), v18 (ref), l_SoundHelper_0 (copy), v29 (copy)
    if v55.PlayerData.Disable.Value then
        return;
    else
        local l_Value_0 = v55.Occupied.LockedOn.Value;
        local v58 = l_Value_0 and l_Value_0:GetAttribute("HyperArmor") and l_Value_0:GetAttribute("Punching");
        local v59 = v55.Character:GetAttribute("FreeDash") or v55.Character:GetAttribute("ClientFreeDash");
        local l_Value_1 = v55.Style.Value;
        local v61 = l_Styles_0[l_Value_1];
        local l_SpecialInfo_0 = l_Styles_0[l_Value_1].SpecialInfo;
        if not v56 or not v56.IgnoreChecks then
            if not v55.Character and not v55.Animator then
                return;
            elseif not v58 and (not v55.Occupied.Punching.Value or v55.Character:GetAttribute("Punching") or not v59) and (v55.Occupied.Punching.Value or v55.Occupied.StopRotate.Value) then
                return false;
            elseif v55.CharacterData.Cutscene.Value or v55.CharacterData.Toxic.Value then
                return false;
            elseif v55.CharacterData.Stamina.Value <= 1 then
                return false;
            elseif v9 and not v55.Occupied.Equipped.Value then
                return;
            elseif v55.Character:GetAttribute("BlockBroken") or v55.Character:GetAttribute("UsingSpecial") or v55.Character:GetAttribute("DenyDash") or v55.Character:GetAttribute("StaminaBroken") or v55.Character:GetAttribute("LocalSlowMo") then
                return false;
            elseif v55.DenyDueToBackDash then
                return false;
            elseif v55.GeneralDebounce then
                return false;
            end;
        end;
        local l_DashInfo_0 = v61.DashInfo;
        local l_DefaultInfo_0 = l_DashInfo_0.DefaultInfo;
        local v65 = v56 and v56.MoveVector;
        if not v65 and v9 then
            v65 = v55.Controls and v55.Controls:GetMoveVector();
            if workspace.FightCameraMode.Value == "ProCamera" then
                v65 = Vector3.new(v65.Z, v65.Y, -v65.X);
            end;
            if v55.Occupied.ReverseInputs.Value then
                v65 = v65 * Vector3.new(-1, -1, -1, 0);
            end;
        end;
        if not v65 then
            v65 = Vector3.new();
        end;
        local v66 = l_Value_0 and l_Value_0.PrimaryPart and v55.RootPart and CFrame.lookAt(v55.RootPart.Position, l_Value_0.PrimaryPart.Position);
        if v66 then
            v55.RootPart.CFrame = CFrame.new(v55.RootPart.Position, v55.RootPart.Position + Vector3.new(v66.LookVector.X, 0, v66.LookVector.Z));
        end;
        local l_v61_Dash_0, v68 = v61:GetDash(v55.RootPart, v65);
        if v56 and v56.Direction then
            l_v61_Dash_0 = v56.Direction;
            if not v9 then
                local l_v61_Dash_1, v70 = v61:GetDash(v55.RootPart, v54[l_v61_Dash_0]);
                l_v61_Dash_0 = l_v61_Dash_1;
                v68 = v70;
            end;
        end;
        if (v55.CharacterData.Wearout.Value >= l_WearoutToDisableBackdash_0 or v55.Character:GetAttribute("Backward")) and l_v61_Dash_0 == "Backward" then
            return;
        elseif l_v61_Dash_0 == "None" then
            return;
        elseif v55.Character:GetAttribute("NoDash") then
            return false;
        elseif l_v61_Dash_0 == "Backward" and v55.BackdashDebounce then
            return false;
        else
            if v9 and l_SpecialInfo_0 then
                if l_SpecialInfo_0.Type == "Freedom" then
                    if v55.Character:GetAttribute("EatNextFreedomInput") and l_Workspace_0.StyleMode.Value ~= "Whirlwind" then
                        l_Workspace_0.StyleMode.Value = "Whirlwind";
                        v55.Character:SetAttribute("EatNextFreedomInput", tick());
                        return;
                    end;
                elseif l_SpecialInfo_0.Type == "Supernova" then
                    workspace.StyleMode.Value = "Comet";
                end;
            end;
            local v71 = l_DashInfo_0[l_v61_Dash_0];
            local function _(v72) --[[ Line: 356 ]] --[[ Name: GetInfo ]]
                -- upvalues: v71 (copy), l_DefaultInfo_0 (copy)
                return v71[v72] or l_DefaultInfo_0[v72];
            end;
            if l_v61_Dash_0 == "Standing" then
                if v55.StandingDebounce then
                    return false;
                else
                    v55.StandingDebounce = true;
                    task.delay(v71.StandingDelay or l_DefaultInfo_0.StandingDelay or 0, function() --[[ Line: 364 ]]
                        -- upvalues: v55 (copy)
                        v55.StandingDebounce = nil;
                    end);
                end;
            end;
            local l_Attribute_0 = v55.Character:GetAttribute("TimeSinceLastUnblock");
            local v75 = v71.AfterBlockDelay or l_DefaultInfo_0.AfterBlockDelay;
            if v75 and l_Attribute_0 and tick() - l_Attribute_0 < v75 then
                return false;
            else
                if not v59 then
                    if v55.Occupied.Stunned.Value or v55.CharacterData.Stunned.Value and not v55.Character:GetAttribute("CanRollback") then
                        return false;
                    elseif v55.Character:GetAttribute("SlowMo") then
                        return false;
                    end;
                end;
                local v76 = v71.DashStartup or l_DefaultInfo_0.DashStartup;
                if not v71.DashTime then
                    local _ = l_DefaultInfo_0.DashTime;
                end;
                if not v71.HitWindowStart then
                    local _ = l_DefaultInfo_0.HitWindowStart;
                end;
                if not v71.HitWindowEnd then
                    local _ = l_DefaultInfo_0.HitWindowEnd;
                end;
                if not v71.MinTime then
                    local _ = l_DefaultInfo_0.MinTime;
                end;
                local v81 = v71.DashDelay or l_DefaultInfo_0.DashDelay or 0.5;
                local v82 = v71.GeneralDebounce or l_DefaultInfo_0.GeneralDebounce;
                if v82 then
                    local v83 = tick();
                    v55.GeneralDebounce = v83;
                    local l_v83_0 = v83 --[[ copy: 25 -> 65 ]];
                    task.delay(v82, function() --[[ Line: 418 ]]
                        -- upvalues: v55 (copy), l_v83_0 (copy)
                        if v55.GeneralDebounce ~= l_v83_0 then
                            return;
                        else
                            v55.GeneralDebounce = nil;
                            return;
                        end;
                    end);
                end;
                local v85 = v59 and 0.7 or 1;
                local v86 = (v59 and 0.75 or 1) * 0.88;
                local l_Attribute_1 = v55.Character:GetAttribute("IgnoreFreeDashSpeed");
                if l_Attribute_1 then
                    v85 = 1;
                    v86 = 1;
                end;
                if v55.CharacterData.Wearout.Value > 0 then
                    local l_l_MaxWearoutDashDistanceMult_0_0 = l_MaxWearoutDashDistanceMult_0;
                    local l_Value_2 = v55.CharacterData.Wearout.Value;
                    v85 = v85 * (1 + (l_l_MaxWearoutDashDistanceMult_0_0 - 1) * l_Value_2);
                end;
                local v90 = l_SettingValueHelper_0.GetValue("DashMultiplier");
                local v91 = (v71.MaxDistance or l_DefaultInfo_0.MaxDistance) * v85;
                local v92 = l_Value_0 and l_Value_0.PrimaryPart and (v55.RootPart.Position - l_Value_0.PrimaryPart.Position).Magnitude or 1000;
                local v93 = v71.MinDistance or l_DefaultInfo_0.MinDistance;
                if v93 and l_Value_0 then
                    local v94 = math.clamp(v92 - 3.5, 0, 8) / 8;
                    local v95 = v71.MaxDistance or l_DefaultInfo_0.MaxDistance;
                    v91 = v91 * ((v93 + (v95 - v93) * v94) / v95);
                end;
                local v96 = {
                    LookVector = v68, 
                    MaxDistance = v91, 
                    MaxTime = (v71.DashTime or l_DefaultInfo_0.DashTime) * v86 + (l_v61_Dash_0 == "Backward" and 0.25 or 0), 
                    IgnoreStun = v59, 
                    Responsiveness = (v71.Responsiveness or l_DefaultInfo_0.Responsiveness) / 1.2, 
                    Velocity = (v71.Velocity or l_DefaultInfo_0.Velocity) * 1.1 * (l_v61_Dash_0 == "Forward" and 0.7 or 1), 
                    DashDelay = v76
                };
                local v97 = false;
                if l_v61_Dash_0 == "Forward" then
                    v97 = l_Value_0;
                end;
                v96.LockedOn = v97;
                v96.LockPositionTime = (v71.DashTime or l_DefaultInfo_0.DashTime) * 0.5;
                v96.StartPosition = v55.RootPart.Position;
                v96.Direction = l_v61_Dash_0;
                if v56 and v56.IgnoreStun then
                    v96.IgnoreStun = true;
                end;
                if v90 ~= 1 and v90 then
                    for _, v99 in {
                        "MaxDistance", 
                        "Velocity", 
                        "Responsiveness"
                    } do
                        v96[v99] = v96[v99] * v90;
                    end;
                end;
                if v92 <= 10 and l_v61_Dash_0 == "Forward" then
                    v96.LockPositionTime = v71.ForwardLockTime or l_DefaultInfo_0.ForwardLockTime or v71.DashTime or l_DefaultInfo_0.DashTime;
                end;
                v97 = v96.MaxTime;
                local v100 = tick() - v55.CurrentDashId;
                if v100 < v81 * 0.8 then
                    return;
                else
                    local l_Value_3 = l_Workspace_0.Ping.Value;
                    local l_l_Workspace_0_ServerTimeNow_1 = l_Workspace_0:GetServerTimeNow();
                    local v103 = l_Value_0 and l_Value_0:GetAttribute("LandTime");
                    v55.IgnoreRollbackDodge = false;
                    v55.Occupied.AwaitRollback.Value = false;
                    local v104 = false;
                    local v105 = nil;
                    if v103 then
                        local v106 = v103 - l_l_Workspace_0_ServerTimeNow_1;
                        v105 = l_GameplaySettings_0.GetTimeLeftToDodge(v106);
                        local l_Magnitude_0 = (v55.Character.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude;
                        if v105 > 0 then
                            v55.Occupied.AwaitRollback.Value = true;
                            v55.IgnoreRollbackDodge = true;
                        elseif l_Magnitude_0 < 4 then
                            v104 = true;
                        end;
                    end;
                    if l_Value_0 and l_Value_0:GetAttribute("Charging") then
                        v55.IgnoreRollbackDodge = false;
                        v55.Occupied.AwaitRollback.Value = false;
                    end;
                    local v108 = l_v61_Dash_0 == "Backward";
                    local v109 = false;
                    local v110 = l_Value_0 and l_Value_0:GetAttribute("TryAttack");
                    if v108 and not l_Attribute_1 then
                        v96.MaxDistance = v96.MaxDistance * (0.95 + -0.35 * (0 + 1 * (v55.CharacterData.BackdashDegrade.Value / 100)));
                        if v110 then
                            v109 = true;
                            v96.MaxDistance = v96.MaxDistance * (0.8 + -0.20000000000000007 * (0 + 1 * (v55.CharacterData.BackdashDegrade.Value / 100)));
                        end;
                    end;
                    if v55.Character:GetAttribute("CometVulnerable") and l_v61_Dash_0 ~= "Left" and l_v61_Dash_0 ~= "Right" then
                        v96.MaxDistance = v96.MaxDistance * 0.4;
                    end;
                    v55.LastDashDirection = l_v61_Dash_0;
                    local v111 = tick();
                    v55.CurrentDashId = v111;
                    v55.Occupied.Dashing.Value = true;
                    v55.Character:SetAttribute("LocalDashDirection", l_v61_Dash_0);
                    v55.Character:SetAttribute("LocalDashTime", l_l_Workspace_0_ServerTimeNow_1);
                    local v112 = {
                        Direction = l_v61_Dash_0, 
                        LookVector = v68
                    };
                    v55.Character:SetAttribute("NoBlock", l_l_Workspace_0_ServerTimeNow_1);
                    task.delay((v71.DashTime or l_DefaultInfo_0.DashTime) * 0.75, function() --[[ Line: 590 ]]
                        -- upvalues: v55 (copy), l_l_Workspace_0_ServerTimeNow_1 (copy)
                        if v55.Character:GetAttribute("NoBlock") == l_l_Workspace_0_ServerTimeNow_1 then
                            v55.Character:SetAttribute("NoBlock", nil);
                        end;
                    end);
                    local v113 = l_InfoToString_0.ConvertDash(v112);
                    local l_l_Workspace_0_ServerTimeNow_2 = l_Workspace_0:GetServerTimeNow();
                    if v9 then
                        task.defer(function() --[[ Line: 600 ]]
                            -- upvalues: v55 (copy), v68 (ref), l_l_Workspace_0_ServerTimeNow_2 (copy), l_SimulateKnockbackBE_0 (ref)
                            local v115 = {
                                Victim = v55.Character, 
                                LookVector = v68, 
                                EndPosition = v55.RootPart.Position, 
                                VictimPosition = v55.RootPart.Position, 
                                TargetVector = Vector3.new(), 
                                StartTime = l_l_Workspace_0_ServerTimeNow_2, 
                                TargetTime = 0.016666666666666666, 
                                HitIndex = 1, 
                                IgnoreSettingCFrame = true
                            };
                            l_SimulateKnockbackBE_0:Fire(v115);
                        end);
                    end;
                    local v116 = (v71.DashWindow or l_DefaultInfo_0.DashWindow) + 0.08333333333333333;
                    local v117 = v55.Character:GetAttribute("Perfect") and not v55.Character:GetAttribute("SlowMoDebounce") or false;
                    if v104 then
                        v55.IgnoreRollbackDodge = false;
                        v96.MaxDistance = math.clamp(v96.MaxDistance, 0, 2);
                        v55.Character:SetAttribute("Perfect", nil);
                        v117 = false;
                    end;
                    table.insert(v113, l_Value_3);
                    local v118 = l_Styles_0[v55.PlayerData:FindFirstChild("Style").Value];
                    if v117 then
                        local l_BackwardSlowMo_0 = v118.CoreInfo.BackwardSlowMo;
                        local l_StandingSlowMo_0 = v118.CoreInfo.StandingSlowMo;
                        local v121 = l_BackwardSlowMo_0 and l_v61_Dash_0 == "Backward" or l_StandingSlowMo_0 and l_v61_Dash_0 == "Standing";
                        if v55.Character:GetAttribute("NeededDirection") ~= l_v61_Dash_0 and not v121 then
                            v117 = false;
                        end;
                    end;
                    local v122 = v100 < (v118.CoreInfo.DoubleDashingWindow or l_GameplaySettings_0.DoubleDashingWindow);
                    local v123 = {
                        v113, 
                        v55.Occupied.LockedOn.Value, 
                        v110, 
                        v117, 
                        v122, 
                        v104, 
                        v68
                    };
                    if v9 then
                        v20:Fire(v123);
                    else
                        v16.TryDash(v55.Character, v123);
                        v55.Character:SetAttribute("Perfect", nil);
                    end;
                    v55.CharacterData.Blocking.Value = false;
                    if v117 and l_Value_0 then
                        local l_Humanoid_0 = l_Value_0:FindFirstChild("Humanoid");
                        for _, v126 in ((l_Humanoid_0:FindFirstChild("Animator") or l_Humanoid_0):GetPlayingAnimationTracks()) do
                            if v126.Name == "Server" then
                                local l_Speed_0 = v126.Speed;
                                v126:AdjustSpeed(0.5);
                                task.delay(math.clamp(l_Workspace_0.Ping.Value, 0, 0.1), function() --[[ Line: 710 ]]
                                    -- upvalues: v55 (copy), v126 (copy), l_Speed_0 (copy)
                                    if not v55.Character:GetAttribute("SlowMo") then
                                        v126:AdjustSpeed(l_Speed_0);
                                    end;
                                end);
                            end;
                        end;
                    end;
                    local v128 = v71.OnUse or l_DefaultInfo_0.OnUse;
                    if v128 then
                        v128(v55.Character);
                    end;
                    if v9 and not v71.IgnoreEffects then
                        task.spawn(function() --[[ Line: 725 ]]
                            -- upvalues: v17 (ref), v55 (copy), v116 (ref)
                            v17.DashMain({
                                "DashMain", 
                                v55.Character, 
                                v116
                            });
                        end);
                    end;
                    v55.Occupied.CanBlock.Value = false;
                    v55.Occupied.CanPunch.Value = false;
                    local v129 = v71.AttackTime or l_DefaultInfo_0.AttackTime or (v71.DashTime or l_DefaultInfo_0.DashTime) * 0.8;
                    if not v110 or l_v61_Dash_0 == "Forward" then

                    end;
                    local v130 = 1;
                    if v108 then
                        v55.LastBackdashTime = v111;
                        v55.DenyDueToBackDash = v111;
                        v55.BackdashDebounce = v111;
                        if v109 then
                            v129 = v129 + (0.15 + 0.05000000000000002 * (0 + 1 * (v55.CharacterData.BackdashDegrade.Value / 100)));
                            v130 = 0.25;
                        else
                            v129 = v129 + (0.15 + 0.25 * (0 + 1 * (v55.CharacterData.BackdashDegrade.Value / 100)));
                            v130 = 0.25;
                        end;
                        v129 = v129 * (1 + 0.19999999999999996 * (0 + 1 * (v55.CharacterData.BackdashDegrade.Value / 100)));
                    end;
                    task.delay(v129 + 0.1, function() --[[ Line: 768 ]]
                        -- upvalues: v111 (copy), v55 (copy)
                        if v111 == v55.CurrentDashId then
                            v55.Occupied.CanBlock.Value = true;
                        end;
                    end);
                    local l_Attribute_2 = v55.Character:GetAttribute("CurrentPunchId");
                    task.delay(v129, function() --[[ Line: 776 ]]
                        -- upvalues: v111 (copy), v55 (copy), v117 (ref), l_GameplaySettings_0 (ref), v105 (ref), l_Attribute_2 (copy), l_v61_Dash_0 (ref), v108 (copy), v130 (ref), v109 (ref)
                        if v111 == v55.CurrentDashId then
                            if v117 and l_GameplaySettings_0.CanPerfectDodge(v55.Character) == true and v105 then
                                task.wait(v105 + 0.05);
                            end;
                            v55.Occupied.Dashing.Value = false;
                            if v55.Character:GetAttribute("CurrentPunchId") == l_Attribute_2 and l_v61_Dash_0 ~= "Comet" then
                                v55.Occupied.CanPunch.Value = true;
                            end;
                        end;
                        if not v108 then
                            return;
                        else
                            v55.Occupied.BackwardsMult.Value = 0.4;
                            task.delay(1.2, function() --[[ Line: 797 ]]
                                -- upvalues: v111 (ref), v55 (ref)
                                if v111 ~= v55.LastBackdashTime or v55.Occupied.BackwardsMult.Value ~= 0.4 then
                                    return;
                                else
                                    v55.Occupied.BackwardsMult.Value = 0;
                                    return;
                                end;
                            end);
                            task.wait(v130);
                            if v55.DenyDueToBackDash == v111 then
                                v55.DenyDueToBackDash = false;
                            end;
                            local v132 = 0.7;
                            if v109 then
                                v132 = 0.25;
                            end;
                            task.wait(v132);
                            if v55.BackdashDebounce == v111 then
                                v55.BackdashDebounce = false;
                            end;
                            return;
                        end;
                    end);
                    local v133 = v71.FadeIn or l_DefaultInfo_0.FadeIn;
                    local v134 = v71.AnimPriority or l_DefaultInfo_0.AnimPriority or Enum.AnimationPriority.Action2;
                    local v135 = {
                        Name = v71.AnimName or l_DefaultInfo_0.AnimName or "Remove10", 
                        AnimId = v71[l_Workspace_0.StyleMode.Value .. "AnimId"] or v71.AnimId, 
                        FadeIn = v133, 
                        AnimSpeed = v117 and 0.5 or (v71.AnimSpeed or l_DefaultInfo_0.AnimSpeed) * 1.05, 
                        Priority = v134, 
                        Animator = v55.Animator, 
                        WeightFade = 0.1, 
                        NameFade = v71.NameFade or l_DefaultInfo_0.NameFade or 0.05, 
                        Weight = 1, 
                        OverrideWeight = true, 
                        StopInfo = v71.StopInfo or l_DefaultInfo_0.StopInfo or {
                            StopDelay = 0.5, 
                            StopTime = 0.5, 
                            Weight = 1
                        }
                    };
                    if v117 then
                        v135.StopInfo.StopDelay = 0.3;
                    end;
                    if v55.Character:GetAttribute("InStatic") then
                        v96.MaxDistance = v96.MaxDistance * 0.8;
                        v135.AnimSpeed = v135.AnimSpeed * 0.8;
                        v135.Weight = 0.7;
                    end;
                    if v55.IgnoreRollbackDodge then
                        v96.IgnoreStun = true;
                    end;
                    local _ = l_Workspace_0.Ping.Value;
                    if v9 and not v71.IgnoreAnimation then
                        v18:CreateAnim(v135);
                    end;
                    if v9 and not (v71.IgnoreSound or l_DefaultInfo_0.IgnoreSound) then
                        local v137 = v71.Sound or l_DefaultInfo_0.Sound or "Step";
                        local v138 = v71.Volume or l_DefaultInfo_0.Volume or 0.05;
                        l_SoundHelper_0:PlaySound({
                            Name = v137, 
                            Volume = v138, 
                            Parent = v55.Character.PrimaryPart, 
                            Speed = v29:NextNumber(1.1, 1.6)
                        });
                    end;
                    v55.LastDashInfo = {
                        AnimInfo = v135, 
                        AlignInfo = v96, 
                        CurrentTime = l_l_Workspace_0_ServerTimeNow_2
                    };
                    if (v71.MaxDistance or l_DefaultInfo_0.MaxDistance) ~= 0 then
                        v55.AlignHelper:MoveAlignPosition(v96);
                    end;
                    if v55.Style.Value == "Ippo" and l_v61_Dash_0 ~= "Dempsey" then
                        v55.Character:SetAttribute("DempseyRolling", nil);
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
v34.TryDash = function(v139, v140) --[[ Line: 925 ]] --[[ Name: TryDash ]]
    local v141 = tick();
    v139.Character:SetAttribute("BlockEmotes", v141);
    local _ = v139:Dash(v140);
    task.spawn(function() --[[ Line: 949 ]]
        -- upvalues: v139 (copy), v141 (copy)
        if v139.Character:GetAttribute("BlockEmotes") == v141 then
            v139.Character:SetAttribute("BlockEmotes", nil);
        end;
    end);
end;
return v34;