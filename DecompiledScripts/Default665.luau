local v0 = {
    DelayTime = 8, 
    ServerDelayTime = 12.5, 
    RandomTime = 2, 
    Metadata = {
        DisplayName = "DEFAULT", 
        GlowColor = Color3.fromRGB(203, 203, 203), 
        IgnoreShop = true
    }, 
    Animations = {
        Start = 13633987842, 
        Loop = 13633987885, 
        End = 13633987926, 
        StartBody = 13633987968, 
        LoopBody = 13633988018, 
        EndBody = 13633988074
    }
};
if game:GetService("RunService"):IsServer() then
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
    local v21 = require(l_Parent_0);
    local _ = Random.new();
    local function _(v23, v24, v25) --[[ Line: 60 ]] --[[ Name: Lerp ]]
        return v23 + (v24 - v23) * v25;
    end;
    v0.Use = function(v27) --[[ Line: 62 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), v21 (copy), l_Lighting_0 (copy)
        local v28 = tick();
        local l_Character_0 = v27.Character;
        local l_Damager_0 = v27.Damager;
        local l_IsKO_0 = v27.IsKO;
        local l_StartPosition_0 = v27.StartPosition;
        local l_LookVector_0 = v27.LookVector;
        local _ = v27.ServerTime;
        local l_FirstChild_0 = l_Workspace_0.States:FindFirstChild(l_Character_0.Name);
        local v36 = l_FirstChild_0 and l_FirstChild_0:FindFirstChild("CharacterData");
        local v37 = l_FirstChild_0 and l_FirstChild_0:FindFirstChild("PlayerData");
        local v38 = l_FirstChild_0 and l_FirstChild_0:FindFirstChild("Occupied");
        if not v36 or not v37 or not v38 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_0);
            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
            local v41 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
            local l_Humanoid_1 = l_Damager_0:FindFirstChild("Humanoid");
            local v43 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
            if not v41 or not v43 then
                return;
            else
                local v44 = l_Assets_0.DownFrames.Default:Clone();
                if l_LocalPlayer_0.Character == l_Character_0 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v44.Parent = l_Common_0;
                end;
                local v45 = false;
                local v46 = 4;
                local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_0, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_0, l_StartPosition_0 - l_LookVector_0, v46 + 2, l_l_RayHelper_0_EnvironmentWhitelist_0);
                local v51 = l_StartPosition_0 - l_LookVector_0 * v46;
                if l_l_RayHelper_0_RayWithWhiteList_0 then
                    v45 = true;
                    v51 = l_StartPosition_0 - l_LookVector_0 * 2;
                end;
                v51 = v51 + Vector3.new(0, 0.6000000238418579, 0, 0);
                local v52 = {};
                for _, v54 in l_Character_0:GetChildren() do
                    if v54:IsA("BasePart") and v54 ~= l_Character_0.PrimaryPart then
                        v52[v54] = v54.CollisionGroup;
                        v54.CollisionGroup = "None";
                    end;
                end;
                if not l_IsKO_0 and l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = true;
                end;
                for _, v56 in (v43:GetPlayingAnimationTracks()) do
                    if v56.Priority ~= Enum.AnimationPriority.Idle then
                        local l_Speed_0 = v56.Speed;
                        v56:AdjustSpeed(l_Speed_0 / 3);
                        task.delay(1.9166666666666667, function() --[[ Line: 135 ]]
                            -- upvalues: v56 (copy), l_Speed_0 (copy)
                            if not v56 then
                                return;
                            else
                                v56:AdjustSpeed(l_Speed_0);
                                return;
                            end;
                        end);
                    end;
                end;
                local v58 = {
                    AnimId = v45 and v0.Animations.StartBody or v0.Animations.Start, 
                    FadeIn = 0, 
                    AnimSpeed = 1.2, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_0, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v58);
                local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
                local l_CFrame_0 = l_PrimaryPart_0.CFrame;
                local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
                local v63 = {
                    Victim = l_Character_0, 
                    LookVector = l_LookVector_0, 
                    EndPosition = v51, 
                    VictimPosition = l_PrimaryPart_0.Position, 
                    TargetVector = v51 - v51, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_0, 
                    TargetTime = 0.6944444444444445, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v63);
                local v64 = script.Knockdown:Clone();
                v64.CFrame = CFrame.lookAt(l_CFrame_0.Position, v51);
                v64.Position = v64.Position + Vector3.new(0, 0.75, 0, 0);
                v64.Parent = l_Workspace_0.Debris;
                for _, v66 in v64.Particle:GetChildren() do
                    v66.Enabled = false;
                    v66:Emit(v66:GetAttribute("EmitCount"));
                end;
                if v38 and l_LocalPlayer_0.Character == l_Character_0 then
                    v38.Target.Value = l_LookVector_0;
                    v38.LockedOn.Value = l_Damager_0;
                end;
                local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                local l_CameraTarget_0 = l_CameraSettings_0.CameraTarget;
                local l_CameraMode_0 = l_CameraSettings_0.CameraMode;
                local l_Variant_0 = l_CameraSettings_0.Variant;
                local l_Vignette_0 = l_Main_0.DownFrame.Vignette;
                local v72 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v73 = l_LocalPlayer_0.Character == l_Character_0;
                if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v72, {
                        ImageTransparency = 0.6
                    }):Play();
                end;
                local v74 = nil;
                local v75 = {};
                local v76 = nil;
                local v77 = l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_0.PrimaryPart
                });
                if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v74 = l_SoundHelper_0:PlaySound({
                        Name = "Cheering", 
                        Parent = l_Workspace_0.Debris
                    });
                    local l_EqualizerSoundEffect_0 = v74.EqualizerSoundEffect;
                    local l_l_EqualizerSoundEffect_0_0 = l_EqualizerSoundEffect_0 --[[ copy: 47 -> 64 ]];
                    local function _(v80) --[[ Line: 219 ]] --[[ Name: TryEqClone ]]
                        -- upvalues: v74 (ref), v77 (copy), l_l_EqualizerSoundEffect_0_0 (copy), v75 (copy)
                        if not v80:IsA("Sound") then
                            return;
                        elseif v80 == v74 or v80 == v77 then
                            return;
                        else
                            local v81 = l_l_EqualizerSoundEffect_0_0:Clone();
                            v81.Enabled = true;
                            v81.Parent = v80;
                            table.insert(v75, v81);
                            return;
                        end;
                    end;
                    for _, v84 in l_Workspace_0:GetChildren() do
                        if v84:IsA("Sound") and v84 ~= v74 and v84 ~= v77 then
                            local v85 = l_EqualizerSoundEffect_0:Clone();
                            v85.Enabled = true;
                            v85.Parent = v84;
                            table.insert(v75, v85);
                        end;
                    end;
                    for _, v87 in l_Workspace_0.Music:GetDescendants() do
                        if v87:IsA("Sound") and v87 ~= v74 and v87 ~= v77 then
                            local v88 = l_EqualizerSoundEffect_0:Clone();
                            v88.Enabled = true;
                            v88.Parent = v87;
                            table.insert(v75, v88);
                        end;
                    end;
                    for _, v90 in l_Workspace_0.Live:GetChildren() do
                        local l_PrimaryPart_1 = v90.PrimaryPart;
                        if l_PrimaryPart_1 then
                            for _, v93 in l_PrimaryPart_1:GetChildren() do
                                if v93:IsA("Sound") and v93 ~= v74 and v93 ~= v77 then
                                    local v94 = l_EqualizerSoundEffect_0:Clone();
                                    v94.Enabled = true;
                                    v94.Parent = v93;
                                    table.insert(v75, v94);
                                end;
                            end;
                        end;
                    end;
                    for _, v96 in l_Workspace_0.Misc:GetChildren() do
                        if v96:IsA("Model") then
                            local l_PrimaryPart_2 = v96.PrimaryPart;
                            if l_PrimaryPart_2 then
                                for _, v99 in l_PrimaryPart_2:GetChildren() do
                                    if v99:IsA("Sound") and v99 ~= v74 and v99 ~= v77 then
                                        local v100 = l_EqualizerSoundEffect_0:Clone();
                                        v100.Enabled = true;
                                        v100.Parent = v99;
                                        table.insert(v75, v100);
                                    end;
                                end;
                            end;
                        end;
                    end;
                    local l_l_EqualizerSoundEffect_0_1 = l_EqualizerSoundEffect_0 --[[ copy: 47 -> 65 ]];
                    v76 = l_Workspace_0.DescendantAdded:Connect(function(v102) --[[ Line: 252 ]]
                        -- upvalues: l_Workspace_0 (ref), v74 (ref), v77 (copy), l_l_EqualizerSoundEffect_0_1 (copy), v75 (copy)
                        if v102.Parent == l_Workspace_0 then
                            return;
                        elseif not v102:IsA("Sound") then
                            return;
                        else
                            if v102 ~= v74 then
                                if v102 == v77 then
                                    return;
                                else
                                    local v103 = l_l_EqualizerSoundEffect_0_1:Clone();
                                    v103.Enabled = true;
                                    v103.Parent = v102;
                                    table.insert(v75, v103);
                                end;
                            end;
                            return;
                        end;
                    end);
                    task.delay(0.2, function() --[[ Line: 261 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "KnockdownStart", 
                            Parent = l_Workspace_0.Debris
                        });
                    end);
                    task.delay(2.5, function() --[[ Line: 268 ]]
                        -- upvalues: l_IsKO_0 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        if l_IsKO_0 then
                            return;
                        else
                            l_SoundHelper_0:PlaySound({
                                Name = "Ringing", 
                                Parent = l_Workspace_0.Debris
                            });
                            return;
                        end;
                    end);
                    task.defer(function() --[[ Line: 276 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "Knockdown", 
                            WaitTime = 0.3, 
                            Fade = 1.5, 
                            FoV = 55, 
                            FoVMult = 1
                        });
                    end);
                    v21.HUDShake({
                        Scale = 20, 
                        Damper = 0.09999999999999999
                    });
                    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_0.Saturation = 0;
                    l_ColorCorrection_0.Contrast = 0;
                    l_ColorCorrection_0.Enabled = true;
                    local v105 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    if l_IsKO_0 then
                        l_TweenService_0:Create(l_ColorCorrection_0, v105, {
                            Saturation = -1, 
                            Contrast = 0.5
                        }):Play();
                    else
                        l_TweenService_0:Create(l_ColorCorrection_0, v105, {
                            Saturation = 0.2, 
                            Contrast = 0.15
                        }):Play();
                    end;
                    local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_0.Size = 0;
                    l_MenuBlur_0.Enabled = true;
                    local v107 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_0, v107, {
                        Size = 10
                    }):Play();
                    local v108 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v108, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(0.6944444444444445, function() --[[ Line: 314 ]]
                        -- upvalues: l_IsKO_0 (copy), v21 (ref), v44 (copy)
                        if not l_IsKO_0 then
                            v21.TripleText({
                                Image = v44.Down
                            });
                        end;
                    end);
                    task.delay(0.6944444444444445, function() --[[ Line: 322 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                end;
                task.delay(0.625, function() --[[ Line: 331 ]]
                    -- upvalues: v51 (ref), l_LookVector_0 (copy), v45 (ref), l_Workspace_0 (ref)
                    local v109 = script.FallSmoke:Clone();
                    v109.Position = (CFrame.lookAt(v51, v51 + l_LookVector_0) * CFrame.new(0, 0, v45 and 0 or 2)).Position - Vector3.new(0, 4, 0, 0);
                    v109.Parent = l_Workspace_0.Debris;
                    for _, v111 in v109.Particle:GetChildren() do
                        v111.Enabled = false;
                        v111:Emit(v111:GetAttribute("EmitCount"));
                    end;
                    task.wait(5);
                    v109:Destroy();
                end);
                task.wait(1.9166666666666667);
                v58.Priority = Enum.AnimationPriority.Action3;
                v58.AnimId = v45 and v0.Animations.LoopBody or v0.Animations.Loop;
                v58.AnimSpeed = 1;
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v58);
                l_l_AnimHelper_0_Anim_1.Name = "Remove";
                if not l_IsKO_0 then
                    task.wait(1);
                end;
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2 - 2 * v27.RandomMult + v27.ExtraTime, function() --[[ Line: 358 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
                    task.defer(function() --[[ Line: 365 ]]
                        -- upvalues: v74 (ref), l_TweenService_0 (ref)
                        local l_EqualizerSoundEffect_1 = v74.EqualizerSoundEffect;
                        local v114 = {
                            HighGain = l_EqualizerSoundEffect_1.HighGain, 
                            LowGain = l_EqualizerSoundEffect_1.LowGain, 
                            MidGain = l_EqualizerSoundEffect_1.MidGain
                        };
                        l_EqualizerSoundEffect_1.HighGain = 0;
                        l_EqualizerSoundEffect_1.LowGain = 0;
                        l_EqualizerSoundEffect_1.MidGain = 0;
                        l_EqualizerSoundEffect_1.Enabled = true;
                        local v115 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                        l_TweenService_0:Create(l_EqualizerSoundEffect_1, v115, v114):Play();
                        l_TweenService_0:Create(v74, v115, {
                            Volume = v74.Volume * 3
                        }):Play();
                    end);
                end;
                if not l_IsKO_0 then
                    local v116 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                    task.defer(function() --[[ Line: 388 ]]
                        -- upvalues: v27 (copy), v73 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v0 (ref), v21 (ref)
                        v27.IsBillboard = not (v73 or l_LocalPlayer_0.Character == l_Damager_0);
                        v27.Speed = v27.ExtraTime / (v0.DelayTime + v27.ExtraTime);
                        v21.DownCount(v27);
                    end);
                    if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
                        l_Variant_0.Value = v45 and "Liver" or "Match";
                        l_CameraMode_0.Value = "Knockdown";
                        l_CameraTarget_0.Value = l_Character_0;
                        l_TweenService_0:Create(l_Vignette_0, v72, {
                            ImageTransparency = 0.2
                        }):Play();
                        l_TweenService_0:Create(l_Lighting_0, v116, {
                            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.2
                        }):Play();
                        local l_v116_0 = v116 --[[ copy: 48 -> 63 ]];
                        task.delay(1, function() --[[ Line: 402 ]]
                            -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), l_v116_0 (copy)
                            l_TweenService_0:Create(l_Lighting_0, l_v116_0, {
                                ExposureCompensation = workspace.Exposure.Value
                            }):Play();
                        end);
                        if l_LocalPlayer_0.Character == l_Damager_0 then
                            v21.KnockdownWalk({
                                Damager = l_Damager_0, 
                                DamagerHumanoid = l_Humanoid_1, 
                                LookVector = l_LookVector_0
                            });
                        end;
                    end;
                    l_Damager_0:SetAttribute("CurrentEmote", nil);
                    local v118 = tick();
                    repeat
                        task.wait(0.1);
                    until l_Character_0:GetAttribute("GettingUp") or not l_Character_0:IsDescendantOf(l_Workspace_0) or tick() - v118 > 15;
                    if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
                        l_TweenService_0:Create(l_Lighting_0, v116, {
                            ExposureCompensation = workspace.Exposure.Value
                        }):Play();
                        local l_v116_1 = v116 --[[ copy: 48 -> 62 ]];
                        task.delay(1, function() --[[ Line: 425 ]]
                            -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), l_v116_1 (copy)
                            l_TweenService_0:Create(l_Lighting_0, l_v116_1, {
                                ExposureCompensation = workspace.Exposure.Value
                            }):Play();
                        end);
                    end;
                end;
                if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v72, {
                        ImageTransparency = 1
                    }):Play();
                    l_CameraMode_0.Value = "";
                    l_Variant_0.Value = "";
                end;
                v58.Priority = Enum.AnimationPriority.Action4;
                v58.AnimId = v45 and v0.Animations.EndBody or v0.Animations.End;
                v58.Looped = false;
                v58.StopInfo = {
                    StopDelay = 1.05, 
                    StopTime = 0.4, 
                    Weight = 1
                };
                if not l_IsKO_0 then
                    if l_l_AnimHelper_0_Anim_1 then
                        l_l_AnimHelper_0_Anim_1:Stop(0);
                    end;
                    l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v58);
                    if l_Character_0 and l_Character_0.PrimaryPart then
                        l_Character_0.PrimaryPart.Anchored = false;
                    end;
                    local l_l_Workspace_0_ServerTimeNow_1 = l_Workspace_0:GetServerTimeNow();
                    local v121 = {
                        Victim = l_Character_0, 
                        LookVector = l_LookVector_0, 
                        EndPosition = v51 - Vector3.new(0, 0.6000000238418579, 0, 0), 
                        VictimPosition = l_PrimaryPart_0.Position, 
                        TargetVector = v51 - v51, 
                        StartTime = l_l_Workspace_0_ServerTimeNow_1, 
                        TargetTime = 0.6666666666666666, 
                        HitIndex = 3
                    };
                    l_SimulateKnockbackBE_0:Fire(v121);
                end;
                if v76 then
                    v76:Disconnect();
                    for _, v123 in v75 do
                        if v123 then
                            v123:Destroy();
                        end;
                    end;
                    l_SoundHelper_0:PlaySound({
                        Name = "GetUpCheer", 
                        Parent = l_Workspace_0.Debris
                    });
                end;
                if l_IsKO_0 then
                    local v124 = {
                        HoldTime = 1.5
                    };
                    task.defer(function() --[[ Line: 492 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.4, 
                            Fade = 2
                        });
                    end);
                    l_SoundHelper_0:PlaySound({
                        Name = "StartMatch", 
                        Parent = l_Workspace_0.Debris
                    });
                    task.wait(0.2);
                    if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
                        l_SoundHelper_0:PlaySound({
                            Name = "Box", 
                            Volume = 0.25, 
                            Parent = l_Workspace_0.Debris
                        });
                        local l_v124_0 = v124 --[[ copy: 48 -> 61 ]];
                        task.defer(function() --[[ Line: 514 ]]
                            -- upvalues: l_v124_0 (copy), v44 (copy), v21 (ref)
                            l_v124_0.Image = v44.KO.K;
                            v21.TripleText(l_v124_0);
                        end);
                        task.wait(0.1);
                        task.defer(function() --[[ Line: 520 ]]
                            -- upvalues: l_v124_0 (copy), v44 (copy), v21 (ref)
                            l_v124_0.Image = v44.KO.Dot1;
                            v21.TripleText(l_v124_0);
                        end);
                        task.wait(0.1);
                        task.defer(function() --[[ Line: 526 ]]
                            -- upvalues: l_v124_0 (copy), v44 (copy), v21 (ref)
                            l_v124_0.Image = v44.KO.O;
                            v21.TripleText(l_v124_0);
                        end);
                        task.wait(0.1);
                        task.defer(function() --[[ Line: 532 ]]
                            -- upvalues: l_v124_0 (copy), v44 (copy), v21 (ref)
                            l_v124_0.Image = v44.KO.Dot2;
                            v21.TripleText(l_v124_0);
                        end);
                    end;
                else
                    task.delay(1.15, function() --[[ Line: 538 ]]
                        -- upvalues: v28 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v73 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v21 (ref), v44 (copy), l_Workspace_0 (ref)
                        print(v28 - tick());
                        l_SoundHelper_0:PlaySound({
                            Name = "BoxLayer", 
                            Parent = l_Character_0.PrimaryPart
                        });
                        if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
                            v21.TripleText({
                                Image = v44.Box, 
                                HoldTime = 0.6666666666666666
                            });
                            v21.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 0.4, 
                                Fade = 0.7
                            });
                        end;
                        task.wait(0.2);
                        if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
                            l_SoundHelper_0:PlaySound({
                                Name = "Box", 
                                Parent = l_Workspace_0.Debris
                            });
                        end;
                    end);
                end;
                if v38 and v38:FindFirstChild("Target") then
                    v38.Target.Value = Vector3.new();
                end;
                if l_IsKO_0 then
                    local v126 = nil;
                    do
                        local l_v126_0 = v126;
                        l_v126_0 = v36.Equipped.Changed:Connect(function(v128) --[[ Line: 573 ]]
                            -- upvalues: l_v126_0 (ref), v41 (copy), v43 (copy)
                            if v128 then
                                return;
                            else
                                if l_v126_0 then
                                    l_v126_0:Disconnect();
                                end;
                                for _, v130 in v41:GetPlayingAnimationTracks() do
                                    if v130.Priority ~= Enum.AnimationPriority.Idle then
                                        v130:Stop(0.1);
                                    end;
                                end;
                                for _, v132 in v43:GetPlayingAnimationTracks() do
                                    if v132.Priority ~= Enum.AnimationPriority.Idle then
                                        v132:Stop(0.1);
                                    end;
                                end;
                                return;
                            end;
                        end);
                    end;
                elseif l_l_AnimHelper_0_Anim_1 then
                    l_l_AnimHelper_0_Anim_1:Stop(0);
                end;
                task.wait(1.25);
                if l_Damager_0 and l_Damager_0.PrimaryPart then
                    l_Damager_0.PrimaryPart.Anchored = false;
                end;
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = false;
                end;
                for v133, v134 in v52 do
                    v133.CollisionGroup = v134;
                end;
                task.wait(5);
                v64:Destroy();
                if v44 then
                    v44:Destroy();
                end;
                return;
            end;
        end;
    end;
    return v0;
end;