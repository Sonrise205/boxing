local v0 = {
    DelayTime = 7, 
    ServerDelayTime = 13.25, 
    Metadata = {
        DisplayName = "FLING", 
        GlowColor = Color3.fromRGB(48, 178, 248), 
        Price = 19999
    }, 
    Animations = {
        Start = 16648553087, 
        Loop = 16648493072, 
        End = 16648665342, 
        KO = 16649713083
    }
};
local l_RunService_0 = game:GetService("RunService");
if l_RunService_0:IsServer() then
    return v0;
else
    local l_Players_0 = game:GetService("Players");
    local l_Lighting_0 = game:GetService("Lighting");
    local l_Workspace_0 = game:GetService("Workspace");
    local l_TweenService_0 = game:GetService("TweenService");
    local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
    local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
    local _ = require(l_Modules_0:WaitForChild("AlignHelper"));
    local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
    local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
    local _ = require(l_Modules_0:WaitForChild("Styles"));
    local _ = require(l_ReplicatedStorage_0:WaitForChild("Bezier"));
    local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
    local l_Assets_0 = l_ReplicatedStorage_0:WaitForChild("Assets");
    local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
    local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
    local l_Common_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
    local l_SimulateKnockbackBE_0 = l_ReplicatedStorage_0:WaitForChild("RemoteEvents"):WaitForChild("SimulateKnockbackBE");
    local l_Parent_0 = script.Parent.Parent;
    local v22 = require(l_Parent_0);
    local _ = Random.new();
    local function _(v24, v25, v26) --[[ Line: 57 ]] --[[ Name: Lerp ]]
        return v24 + (v25 - v24) * v26;
    end;
    v0.Main = function(v28) --[[ Line: 59 ]] --[[ Name: Main ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), v22 (copy), l_Main_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_Lighting_0 (copy)
        local v29 = tick();
        local l_Character_0 = v28.Character;
        local l_Damager_0 = v28.Damager;
        local l_StartPosition_0 = v28.StartPosition;
        local l_LookVector_0 = v28.LookVector;
        local l_FirstChild_0 = l_Workspace_0.States:FindFirstChild(l_Character_0.Name);
        local l_CharacterData_0 = l_FirstChild_0:FindFirstChild("CharacterData");
        local l_PlayerData_0 = l_FirstChild_0:FindFirstChild("PlayerData");
        local l_Occupied_0 = l_FirstChild_0:FindFirstChild("Occupied");
        if not l_CharacterData_0 or not l_PlayerData_0 or not l_Occupied_0 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_0);
            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
            local v40 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
            local l_Humanoid_1 = l_Damager_0:FindFirstChild("Humanoid");
            local v42 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
            if not v40 or not v42 then
                return;
            else
                local v43 = l_Assets_0.DownFrames.Default:Clone();
                if l_LocalPlayer_0.Character == l_Character_0 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v43.Parent = l_Common_0;
                end;
                local v44 = 3.5;
                local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_0, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_0, l_StartPosition_0 - l_LookVector_0, v44 + 1.5, l_l_RayHelper_0_EnvironmentWhitelist_0);
                local v49 = l_StartPosition_0 - l_LookVector_0 * v44;
                if l_l_RayHelper_0_RayWithWhiteList_0 then
                    v49 = l_StartPosition_0 - l_LookVector_0 * 1;
                end;
                local v50 = {};
                for _, v52 in l_Character_0:GetChildren() do
                    if v52:IsA("BasePart") and v52 ~= l_Character_0.PrimaryPart then
                        v50[v52] = v52.CollisionGroup;
                        v52.CollisionGroup = "None";
                    end;
                end;
                if not l_Character_0 or l_Character_0.PrimaryPart then

                end;
                for _, v54 in (v42:GetPlayingAnimationTracks()) do
                    if v54.Priority ~= Enum.AnimationPriority.Idle then
                        local l_Speed_0 = v54.Speed;
                        v54:AdjustSpeed(l_Speed_0 / 2.5);
                        task.delay(2.888888888888889, function() --[[ Line: 127 ]]
                            -- upvalues: v54 (copy), l_Speed_0 (copy)
                            if not v54 then
                                return;
                            else
                                v54:AdjustSpeed(l_Speed_0);
                                return;
                            end;
                        end);
                    end;
                end;
                local v56 = {
                    AnimId = v0.Animations.Start, 
                    FadeIn = 0.05, 
                    AnimSpeed = 0.45, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_0, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v56);
                task.delay(0.7407407407407407, function() --[[ Line: 145 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_0 (ref)
                    for v58 = 1, 20 do
                        l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.45 + 0.35000000000000003 * (v58 / 20));
                        task.wait(0.016666666666666666);
                    end;
                end);
                local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
                local l_CFrame_0 = l_PrimaryPart_0.CFrame;
                local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
                local v62 = {
                    Victim = l_Character_0, 
                    LookVector = l_LookVector_0, 
                    EndPosition = v49, 
                    VictimPosition = l_PrimaryPart_0.Position, 
                    TargetVector = v49 - v49, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_0, 
                    TargetTime = 1.4814814814814814, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v62);
                local v63 = {};
                local function v69(v64) --[[ Line: 175 ]] --[[ Name: CreateTrail ]]
                    -- upvalues: l_Character_0 (copy), v22 (ref), v63 (copy)
                    local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(v64);
                    if not l_l_Character_0_FirstChild_0 then
                        return;
                    else
                        local v66 = script.Trail:Clone();
                        v66.Parent = v22.GetWeldCharacter(l_Character_0);
                        local l_Attachment0_0 = v66.Attachment0;
                        local l_Attachment1_0 = v66.Attachment1;
                        l_Attachment0_0.Parent = l_l_Character_0_FirstChild_0;
                        l_Attachment1_0.Parent = l_l_Character_0_FirstChild_0;
                        v66:Destroy();
                        table.insert(v63, l_Attachment0_0);
                        table.insert(v63, l_Attachment1_0);
                        return;
                    end;
                end;
                v69("LeftHand");
                v69("RightHand");
                v69("LeftFoot");
                v69("RightFoot");
                local v70 = script.Knockdown:Clone();
                v70.CFrame = CFrame.lookAt(l_CFrame_0.Position, v49);
                v70.Position = v70.Position + Vector3.new(0, 0.75, 0, 0);
                v70.Parent = l_Workspace_0.Debris;
                for _, v72 in v70.Particle:GetChildren() do
                    v72.Enabled = false;
                    v72:Emit(v72:GetAttribute("EmitCount"));
                end;
                if l_Occupied_0 and l_LocalPlayer_0.Character == l_Character_0 then
                    l_Occupied_0.Target.Value = l_LookVector_0;
                    l_Occupied_0.LockedOn.Value = l_Damager_0;
                end;
                local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                local l_CameraTarget_0 = l_CameraSettings_0.CameraTarget;
                local l_CameraMode_0 = l_CameraSettings_0.CameraMode;
                local l_Variant_0 = l_CameraSettings_0.Variant;
                local l_Vignette_0 = l_Main_0.DownFrame.Vignette;
                local v78 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v79 = l_LocalPlayer_0.Character == l_Character_0;
                if v79 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v78, {
                        ImageTransparency = 0.6
                    }):Play();
                end;
                local v80 = nil;
                local v81 = {};
                local v82 = nil;
                local v83 = l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_0.PrimaryPart
                });
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Damager_0.PrimaryPart, 
                    DirectCopy = script.Sounds.Punch
                });
                if v79 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v80 = l_SoundHelper_0:PlaySound({
                        Name = "Cheering", 
                        Parent = l_Workspace_0.Debris
                    });
                    local l_EqualizerSoundEffect_0 = v80.EqualizerSoundEffect;
                    local l_l_EqualizerSoundEffect_0_0 = l_EqualizerSoundEffect_0 --[[ copy: 46 -> 60 ]];
                    local function _(v86) --[[ Line: 251 ]] --[[ Name: TryEqClone ]]
                        -- upvalues: v80 (ref), v83 (copy), l_l_EqualizerSoundEffect_0_0 (copy), v81 (copy)
                        if not v86:IsA("Sound") then
                            return;
                        elseif v86 == v80 or v86 == v83 then
                            return;
                        else
                            local v87 = l_l_EqualizerSoundEffect_0_0:Clone();
                            v87.Enabled = true;
                            v87.Parent = v86;
                            table.insert(v81, v87);
                            return;
                        end;
                    end;
                    for _, v90 in l_Workspace_0:GetChildren() do
                        if v90:IsA("Sound") and v90 ~= v80 and v90 ~= v83 then
                            local v91 = l_EqualizerSoundEffect_0:Clone();
                            v91.Enabled = true;
                            v91.Parent = v90;
                            table.insert(v81, v91);
                        end;
                    end;
                    for _, v93 in l_Workspace_0.Music:GetDescendants() do
                        if v93:IsA("Sound") and v93 ~= v80 and v93 ~= v83 then
                            local v94 = l_EqualizerSoundEffect_0:Clone();
                            v94.Enabled = true;
                            v94.Parent = v93;
                            table.insert(v81, v94);
                        end;
                    end;
                    for _, v96 in l_Workspace_0.Live:GetChildren() do
                        local l_PrimaryPart_1 = v96.PrimaryPart;
                        if l_PrimaryPart_1 then
                            for _, v99 in l_PrimaryPart_1:GetChildren() do
                                if v99:IsA("Sound") and v99 ~= v80 and v99 ~= v83 then
                                    local v100 = l_EqualizerSoundEffect_0:Clone();
                                    v100.Enabled = true;
                                    v100.Parent = v99;
                                    table.insert(v81, v100);
                                end;
                            end;
                        end;
                    end;
                    for _, v102 in l_Workspace_0.Misc:GetChildren() do
                        if v102:IsA("Model") then
                            local l_PrimaryPart_2 = v102.PrimaryPart;
                            if l_PrimaryPart_2 then
                                for _, v105 in l_PrimaryPart_2:GetChildren() do
                                    if v105:IsA("Sound") and v105 ~= v80 and v105 ~= v83 then
                                        local v106 = l_EqualizerSoundEffect_0:Clone();
                                        v106.Enabled = true;
                                        v106.Parent = v105;
                                        table.insert(v81, v106);
                                    end;
                                end;
                            end;
                        end;
                    end;
                    local l_l_EqualizerSoundEffect_0_1 = l_EqualizerSoundEffect_0 --[[ copy: 46 -> 61 ]];
                    v82 = l_Workspace_0.DescendantAdded:Connect(function(v108) --[[ Line: 284 ]]
                        -- upvalues: l_Workspace_0 (ref), v80 (ref), v83 (copy), l_l_EqualizerSoundEffect_0_1 (copy), v81 (copy)
                        if v108.Parent == l_Workspace_0 then
                            return;
                        elseif not v108:IsA("Sound") then
                            return;
                        else
                            if v108 ~= v80 then
                                if v108 == v83 then
                                    return;
                                else
                                    local v109 = l_l_EqualizerSoundEffect_0_1:Clone();
                                    v109.Enabled = true;
                                    v109.Parent = v108;
                                    table.insert(v81, v109);
                                end;
                            end;
                            return;
                        end;
                    end);
                    task.delay(0.2, function() --[[ Line: 293 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "KnockdownStart", 
                            Parent = l_Workspace_0.Debris
                        });
                    end);
                    task.delay(2.5, function() --[[ Line: 300 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Ringing", 
                            Parent = l_Workspace_0.Debris
                        });
                    end);
                    task.defer(function() --[[ Line: 307 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "Knockdown", 
                            WaitTime = 0.3, 
                            Fade = 1.5, 
                            FoV = 55, 
                            FoVMult = 1
                        });
                    end);
                    v22.HUDShake({
                        Scale = 20, 
                        Damper = 0.09999999999999999
                    });
                    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_0.Saturation = 0;
                    l_ColorCorrection_0.Contrast = 0;
                    l_ColorCorrection_0.Enabled = true;
                    local v111 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_0, v111, {
                        Saturation = -1, 
                        Contrast = 0.5
                    }):Play();
                    local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_0.Size = 0;
                    l_MenuBlur_0.Enabled = true;
                    local v113 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_0, v113, {
                        Size = 10
                    }):Play();
                    local v114 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v114, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(1.4814814814814814, function() --[[ Line: 341 ]]
                        -- upvalues: v22 (ref), v43 (copy)
                        v22.TripleText({
                            Image = v43.Down
                        });
                    end);
                    task.delay(1.4814814814814814, function() --[[ Line: 347 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                end;
                task.delay(1.4814814814814814, function() --[[ Line: 356 ]]
                    -- upvalues: v49 (ref), l_LookVector_0 (copy), l_Workspace_0 (ref)
                    local v115 = script.FallSmoke:Clone();
                    v115.Position = (CFrame.lookAt(v49, v49 + l_LookVector_0) * CFrame.new(0, 0, 1)).Position - Vector3.new(0, 4, 0, 0);
                    v115.Parent = l_Workspace_0.Debris;
                    for _, v117 in v115.Particle:GetChildren() do
                        v117.Enabled = false;
                        v117:Emit(v117:GetAttribute("EmitCount"));
                    end;
                    task.wait(5);
                    v115:Destroy();
                end);
                task.wait(2.888888888888889);
                v56.Priority = Enum.AnimationPriority.Action3;
                v56.AnimId = v0.Animations.Loop;
                v56.Looped = true;
                v56.AnimSpeed = 1;
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v56);
                l_l_AnimHelper_0_Anim_1.Name = "Remove";
                task.wait(1);
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2 + v28.ExtraTime, function() --[[ Line: 382 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                if v79 or l_LocalPlayer_0.Character == l_Damager_0 then
                    task.defer(function() --[[ Line: 389 ]]
                        -- upvalues: v80 (ref), l_TweenService_0 (ref)
                        local l_EqualizerSoundEffect_1 = v80.EqualizerSoundEffect;
                        local v120 = {
                            HighGain = l_EqualizerSoundEffect_1.HighGain, 
                            LowGain = l_EqualizerSoundEffect_1.LowGain, 
                            MidGain = l_EqualizerSoundEffect_1.MidGain
                        };
                        l_EqualizerSoundEffect_1.HighGain = 0;
                        l_EqualizerSoundEffect_1.LowGain = 0;
                        l_EqualizerSoundEffect_1.MidGain = 0;
                        l_EqualizerSoundEffect_1.Enabled = true;
                        local v121 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                        l_TweenService_0:Create(l_EqualizerSoundEffect_1, v121, v120):Play();
                        l_TweenService_0:Create(v80, v121, {
                            Volume = v80.Volume * 3
                        }):Play();
                    end);
                end;
                local v122 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                task.defer(function() --[[ Line: 411 ]]
                    -- upvalues: v28 (copy), v79 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v0 (ref), v22 (ref)
                    v28.IsBillboard = not (v79 or l_LocalPlayer_0.Character == l_Damager_0);
                    v28.Speed = v28.ExtraTime / (v0.DelayTime + v28.ExtraTime);
                    v22.DownCount(v28);
                end);
                if v79 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_Variant_0.Value = "Match";
                    l_CameraMode_0.Value = "Knockdown";
                    l_CameraTarget_0.Value = l_Character_0;
                    l_TweenService_0:Create(l_Vignette_0, v78, {
                        ImageTransparency = 0.2
                    }):Play();
                    l_TweenService_0:Create(l_Lighting_0, v122, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.2
                    }):Play();
                    task.delay(1, function() --[[ Line: 425 ]]
                        -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v122 (copy)
                        l_TweenService_0:Create(l_Lighting_0, v122, {
                            ExposureCompensation = workspace.Exposure.Value
                        }):Play();
                    end);
                    if l_LocalPlayer_0.Character == l_Damager_0 then
                        v22.KnockdownWalk({
                            Damager = l_Damager_0, 
                            DamagerHumanoid = l_Humanoid_1, 
                            LookVector = l_LookVector_0
                        });
                    end;
                end;
                l_Damager_0:SetAttribute("CurrentEmote", nil);
                local v123 = tick();
                repeat
                    task.wait(0.1);
                until l_Character_0:GetAttribute("GettingUp") or not l_Character_0:IsDescendantOf(l_Workspace_0) or tick() - v123 > 15;
                if v79 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Lighting_0, v122, {
                        ExposureCompensation = workspace.Exposure.Value
                    }):Play();
                    task.delay(1, function() --[[ Line: 448 ]]
                        -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v122 (copy)
                        l_TweenService_0:Create(l_Lighting_0, v122, {
                            ExposureCompensation = workspace.Exposure.Value
                        }):Play();
                    end);
                end;
                if v79 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v78, {
                        ImageTransparency = 1
                    }):Play();
                    l_CameraMode_0.Value = "";
                    l_Variant_0.Value = "";
                end;
                v56.Priority = Enum.AnimationPriority.Action4;
                v56.AnimId = v0.Animations.End;
                v56.Looped = false;
                v56.StopInfo = {
                    StopDelay = 1.05, 
                    StopTime = 0.4, 
                    Weight = 1
                };
                if l_l_AnimHelper_0_Anim_1 then
                    l_l_AnimHelper_0_Anim_1:Stop(0);
                end;
                l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v56);
                if v82 then
                    v82:Disconnect();
                    for _, v125 in v81 do
                        if v125 then
                            v125:Destroy();
                        end;
                    end;
                    l_SoundHelper_0:PlaySound({
                        Name = "GetUpCheer", 
                        Parent = l_Workspace_0.Debris
                    });
                end;
                task.delay(1.15, function() --[[ Line: 487 ]]
                    -- upvalues: v29 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v79 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v22 (ref), v43 (copy), l_Workspace_0 (ref)
                    print(v29 - tick());
                    l_SoundHelper_0:PlaySound({
                        Name = "BoxLayer", 
                        Parent = l_Character_0.PrimaryPart
                    });
                    if v79 or l_LocalPlayer_0.Character == l_Damager_0 then
                        v22.TripleText({
                            Image = v43.Box, 
                            HoldTime = 0.6666666666666666
                        });
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.4, 
                            Fade = 0.7
                        });
                    end;
                    task.wait(0.2);
                    if v79 or l_LocalPlayer_0.Character == l_Damager_0 then
                        l_SoundHelper_0:PlaySound({
                            Name = "Box", 
                            Parent = l_Workspace_0.Debris
                        });
                    end;
                end);
                if l_Occupied_0 and l_Occupied_0:FindFirstChild("Target") then
                    l_Occupied_0.Target.Value = Vector3.new();
                end;
                if l_l_AnimHelper_0_Anim_1 then
                    l_l_AnimHelper_0_Anim_1:Stop(0);
                end;
                task.wait(1.25);
                for _, v127 in v63 do
                    v127:Destroy();
                end;
                if l_Damager_0 and l_Damager_0.PrimaryPart then
                    l_Damager_0.PrimaryPart.Anchored = false;
                end;
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = false;
                end;
                for v128, v129 in v50 do
                    v128.CollisionGroup = v129;
                end;
                task.wait(5);
                v70:Destroy();
                if v43 then
                    v43:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.KO = function(v130) --[[ Line: 544 ]] --[[ Name: KO ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_TweenService_0 (copy), l_RunService_0 (copy), l_Main_0 (copy), v22 (copy), l_Lighting_0 (copy)
        local l_Character_1 = v130.Character;
        local l_Damager_1 = v130.Damager;
        local l_StartPosition_1 = v130.StartPosition;
        local l_LookVector_1 = v130.LookVector;
        local l_FirstChild_1 = l_Workspace_0.States:FindFirstChild(l_Character_1.Name);
        local l_CharacterData_1 = l_FirstChild_1:FindFirstChild("CharacterData");
        local l_PlayerData_1 = l_FirstChild_1:FindFirstChild("PlayerData");
        local l_Occupied_1 = l_FirstChild_1:FindFirstChild("Occupied");
        if not l_CharacterData_1 or not l_PlayerData_1 or not l_Occupied_1 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_1);
            local l_Humanoid_2 = l_Character_1:FindFirstChild("Humanoid");
            local v141 = l_Humanoid_2 and l_Humanoid_2:FindFirstChild("Animator");
            local l_Humanoid_3 = l_Damager_1:FindFirstChild("Humanoid");
            local v143 = l_Humanoid_3 and l_Humanoid_3:FindFirstChild("Animator");
            if not v141 or not v143 then
                return;
            else
                local v144 = l_Assets_0.DownFrames.Default:Clone();
                if l_LocalPlayer_0.Character == l_Character_1 or l_LocalPlayer_0.Character == l_Damager_1 then
                    v144.Parent = l_Common_0;
                end;
                local v145 = 2.75;
                local l_l_RayHelper_0_EnvironmentWhitelist_1 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_1, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_1, l_StartPosition_1 - l_LookVector_1, v145 + 1.5, l_l_RayHelper_0_EnvironmentWhitelist_1);
                local v150 = l_StartPosition_1 - l_LookVector_1 * v145;
                if l_l_RayHelper_0_RayWithWhiteList_1 then
                    v150 = l_StartPosition_1 - l_LookVector_1 * 0.5;
                end;
                local v151 = {};
                for _, v153 in l_Character_1:GetChildren() do
                    if v153:IsA("BasePart") and v153 ~= l_Character_1.PrimaryPart then
                        v151[v153] = v153.CollisionGroup;
                        v153.CollisionGroup = "None";
                    end;
                end;
                if not l_Character_1 or l_Character_1.PrimaryPart then

                end;
                for _, v155 in (v143:GetPlayingAnimationTracks()) do
                    if v155.Priority ~= Enum.AnimationPriority.Idle then
                        v155:AdjustSpeed(v155.Speed / 4);
                    end;
                end;
                local v156 = {
                    AnimId = v0.Animations.KO, 
                    FadeIn = 0.05, 
                    AnimSpeed = 0.35, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_2, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v156);
                local v158 = l_LocalPlayer_0.Character == l_Character_1;
                task.delay(0.9523809523809524, function() --[[ Line: 625 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_2 (copy)
                    for v159 = 1, 10 do
                        l_l_AnimHelper_0_Anim_2:AdjustSpeed(0.35 + 0.45000000000000007 * (v159 / 10));
                        task.wait(0.016666666666666666);
                    end;
                end);
                if v158 or l_LocalPlayer_0.Character == l_Damager_1 then
                    task.delay(0.8333333333333334, function() --[[ Line: 636 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Character_1 (copy)
                        l_SoundHelper_0:PlaySound({
                            Name = "Rustle3", 
                            Parent = l_Character_1.PrimaryPart, 
                            Volume = 2
                        });
                        task.wait(0.4666666666666667);
                        l_SoundHelper_0:PlaySound({
                            Name = "FeintRustle", 
                            Parent = l_Character_1.PrimaryPart, 
                            Volume = 0.3, 
                            Speed = 0.7
                        });
                    end);
                end;
                local l_PrimaryPart_3 = l_Character_1.PrimaryPart;
                local l_CFrame_1 = l_PrimaryPart_3.CFrame;
                local l_l_Workspace_0_ServerTimeNow_1 = l_Workspace_0:GetServerTimeNow();
                local v163 = {
                    Victim = l_Character_1, 
                    LookVector = l_LookVector_1, 
                    EndPosition = v150, 
                    VictimPosition = l_PrimaryPart_3.Position, 
                    TargetVector = v150 - v150, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_1, 
                    TargetTime = 1.7142857142857144, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v163);
                local v164 = script.Knockdown:Clone();
                v164.CFrame = CFrame.lookAt(l_CFrame_1.Position, v150);
                v164.Position = v164.Position + Vector3.new(0, 0.75, 0, 0);
                v164.Parent = l_Workspace_0.Debris;
                for _, v166 in v164.Particle:GetChildren() do
                    v166.Enabled = false;
                    v166:Emit(v166:GetAttribute("EmitCount"));
                end;
                if l_Occupied_1 and l_LocalPlayer_0.Character == l_Character_1 then
                    l_Occupied_1.Target.Value = l_LookVector_1;
                    l_Occupied_1.LockedOn.Value = l_Damager_1;
                end;
                local l_CameraSettings_1 = l_Workspace_0:FindFirstChild("CameraSettings");
                local _ = l_CameraSettings_1.CameraTarget;
                local l_CameraMode_1 = l_CameraSettings_1.CameraMode;
                local l_Variant_1 = l_CameraSettings_1.Variant;
                local v171 = nil;
                task.delay(0.05, function() --[[ Line: 695 ]]
                    -- upvalues: v158 (copy), l_CameraMode_1 (copy), l_Workspace_0 (ref), l_TweenService_0 (ref), l_Character_1 (copy), l_Damager_1 (copy), l_LocalPlayer_0 (ref), v171 (ref), l_RunService_0 (ref)
                    if v158 then
                        l_CameraMode_1.Value = "Cutscene";
                        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FieldOfView = 50
                        }):Play();
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            CFrame = CFrame.lookAt((l_Character_1.PrimaryPart.CFrame * CFrame.new(0.1, -1.1, 15)).Position, l_Damager_1.PrimaryPart.Position - Vector3.new(0, 2, 0, 0)) * CFrame.Angles(0, 0, 0.13962634015954636)
                        }):Play();
                        return;
                    else
                        if l_LocalPlayer_0.Character == l_Damager_1 then
                            l_CameraMode_1.Value = "Cutscene";
                            local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
                            l_TweenService_0:Create(l_CurrentCamera_1, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                FieldOfView = 50
                            }):Play();
                            local l_CFrame_2 = l_CurrentCamera_1.CFrame;
                            local v175 = l_Character_1.PrimaryPart.CFrame * CFrame.new(0.1, -1.1, 12.5) * CFrame.Angles(0, 0, 0.13962634015954636);
                            local l_l_CFrame_2_0 = l_CFrame_2;
                            local v177 = tick();
                            do
                                local l_l_l_CFrame_2_0_0 = l_l_CFrame_2_0;
                                v171 = l_RunService_0.RenderStepped:Connect(function(_) --[[ Line: 721 ]]
                                    -- upvalues: l_TweenService_0 (ref), v177 (copy), l_l_l_CFrame_2_0_0 (ref), l_CFrame_2 (copy), v175 (copy), l_CurrentCamera_1 (copy), l_Damager_1 (ref), l_Character_1 (ref)
                                    local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(math.clamp((tick() - v177) / 0.5, 0, 1), Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                                    local l_new_0 = CFrame.new;
                                    local l_Position_0 = l_CFrame_2.Position;
                                    l_l_l_CFrame_2_0_0 = l_new_0(l_Position_0 + (v175.Position - l_Position_0) * l_l_TweenService_0_Value_0);
                                    l_CurrentCamera_1.CFrame = CFrame.lookAt(l_l_l_CFrame_2_0_0.Position, l_Damager_1.PrimaryPart.Position - Vector3.new(0, l_Character_1.PrimaryPart.Position.Y - l_Character_1.Head.Position.Y - 0.6, 0));
                                end);
                            end;
                        end;
                        return;
                    end;
                end);
                local l_Vignette_1 = l_Main_0.DownFrame.Vignette;
                local v184 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v185 = l_LocalPlayer_0.Character == l_Character_1;
                if v185 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v184, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                local v186 = nil;
                local _ = {};
                local _ = l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_1.PrimaryPart
                });
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Damager_1.PrimaryPart, 
                    DirectCopy = script.Sounds.Punch
                });
                if v185 or l_LocalPlayer_0.Character == l_Damager_1 then
                    v186 = l_SoundHelper_0:PlaySound({
                        Name = "Cheering", 
                        Parent = l_Workspace_0.Debris
                    });
                    task.delay(0.2, function() --[[ Line: 759 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "KnockdownStart", 
                            Parent = l_Workspace_0.Debris
                        });
                    end);
                    task.defer(function() --[[ Line: 766 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "Knockdown", 
                            WaitTime = 0.3, 
                            Fade = 1.5, 
                            FoV = 55, 
                            FoVMult = 1
                        });
                    end);
                    v22.HUDShake({
                        Scale = 20, 
                        Damper = 0.09999999999999999
                    });
                    local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_1.Saturation = 0;
                    l_ColorCorrection_1.Contrast = 0;
                    l_ColorCorrection_1.Enabled = true;
                    local v190 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_1, v190, {
                        Saturation = -1, 
                        Contrast = 0.5
                    }):Play();
                    local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_1.Size = 0;
                    l_MenuBlur_1.Enabled = true;
                    local v192 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_1, v192, {
                        Size = 10
                    }):Play();
                    local v193 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v193, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(1.7142857142857144, function() --[[ Line: 800 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                    v22.CreateImpactFrame({
                        Time = 0.05
                    });
                end;
                local v197 = {
                    [1] = l_l_AnimHelper_0_Anim_2:GetMarkerReachedSignal("Start"):Connect(function() --[[ Line: 814 ]]
                        -- upvalues: v150 (ref), l_LookVector_1 (copy), l_Workspace_0 (ref)
                        local v194 = script.FallSmoke:Clone();
                        v194.Position = (CFrame.lookAt(v150, v150 + l_LookVector_1) * CFrame.new(0, 0, 2)).Position - Vector3.new(0, 4.5, 0, 0);
                        v194.Parent = l_Workspace_0.Debris;
                        for _, v196 in v194.Particle:GetChildren() do
                            v196.Enabled = false;
                            v196:Emit(v196:GetAttribute("EmitCount"));
                        end;
                        task.wait(5);
                        v194:Destroy();
                    end)
                };
                task.wait(1.7142857142857144);
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2 - 2 * v130.RandomMult, function() --[[ Line: 830 ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_1:SetAttribute("GettingUp", nil);
                end);
                if v185 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v184, {
                        ImageTransparency = 1
                    }):Play();
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                local v198 = {
                    HoldTime = 1.5
                };
                if v185 or l_LocalPlayer_0.Character == l_Damager_1 then
                    task.defer(function() --[[ Line: 853 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.4, 
                            Fade = 2
                        });
                    end);
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "StartMatch", 
                    Parent = l_Workspace_0.Debris
                });
                task.wait(0.2);
                if v185 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_SoundHelper_0:PlaySound({
                        Name = "Box", 
                        Volume = 0.25, 
                        Parent = l_Workspace_0.Debris
                    });
                    task.defer(function() --[[ Line: 876 ]]
                        -- upvalues: v198 (copy), v144 (copy), v22 (ref)
                        v198.Image = v144.KO.K;
                        v22.TripleText(v198);
                    end);
                    task.wait(0.1);
                    task.defer(function() --[[ Line: 882 ]]
                        -- upvalues: v198 (copy), v144 (copy), v22 (ref)
                        v198.Image = v144.KO.Dot1;
                        v22.TripleText(v198);
                    end);
                    task.wait(0.1);
                    task.defer(function() --[[ Line: 888 ]]
                        -- upvalues: v198 (copy), v144 (copy), v22 (ref)
                        v198.Image = v144.KO.O;
                        v22.TripleText(v198);
                    end);
                    task.wait(0.1);
                    task.defer(function() --[[ Line: 894 ]]
                        -- upvalues: v198 (copy), v144 (copy), v22 (ref)
                        v198.Image = v144.KO.Dot2;
                        v22.TripleText(v198);
                    end);
                end;
                if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                    l_Occupied_1.Target.Value = Vector3.new();
                end;
                local v199 = nil;
                v199 = l_CharacterData_1.Equipped.Changed:Connect(function(v200) --[[ Line: 903 ]]
                    -- upvalues: v199 (ref), v141 (copy), v143 (copy)
                    if v200 then
                        return;
                    else
                        if v199 then
                            v199:Disconnect();
                        end;
                        for _, v202 in v141:GetPlayingAnimationTracks() do
                            if v202.Priority ~= Enum.AnimationPriority.Idle then
                                v202:Stop(0.1);
                            end;
                        end;
                        for _, v204 in v143:GetPlayingAnimationTracks() do
                            if v204.Priority ~= Enum.AnimationPriority.Idle then
                                v204:Stop(0.1);
                            end;
                        end;
                        return;
                    end;
                end);
                task.wait(1.25);
                task.delay(2, function() --[[ Line: 922 ]]
                    -- upvalues: v171 (ref), v185 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), l_CameraMode_1 (copy), l_Variant_1 (copy)
                    if v171 then
                        v171:Disconnect();
                    end;
                    if v185 or l_LocalPlayer_0.Character == l_Damager_1 then
                        l_CameraMode_1.Value = "";
                        l_Variant_1.Value = "";
                    end;
                end);
                if l_Damager_1 and l_Damager_1.PrimaryPart then
                    l_Damager_1.PrimaryPart.Anchored = false;
                end;
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = false;
                end;
                for v205, v206 in v151 do
                    v205.CollisionGroup = v206;
                end;
                for _, v208 in v197 do
                    v208:Disconnect();
                end;
                task.wait(5);
                v164:Destroy();
                if v144 then
                    v144:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.Use = function(v209) --[[ Line: 951 ]] --[[ Name: Use ]]
        -- upvalues: v0 (copy)
        local _ = v209.Character;
        local _ = v209.Damager;
        if v209.IsKO then
            v0.KO(v209);
            return;
        else
            v0.Main(v209);
            return;
        end;
    end;
    return v0;
end;