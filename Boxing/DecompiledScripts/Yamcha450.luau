local v0 = {
    DelayTime = 7, 
    ServerDelayTime = 12, 
    ExtraEndTime = 3, 
    Metadata = {
        DisplayName = "YAMCHA", 
        GlowColor = Color3.fromRGB(248, 133, 56), 
        Price = 69999
    }, 
    Animations = {
        Start = 17600703718, 
        Loop = 17600709125, 
        End = 17600713254, 
        Saibamen = 17614870868, 
        Yamcha = 17614974973, 
        Camera = 17615331054, 
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
    local function _(v24, v25, v26) --[[ Line: 62 ]] --[[ Name: Lerp ]]
        return v24 + (v25 - v24) * v26;
    end;
    local function v37(v28, v29) --[[ Line: 64 ]] --[[ Name: SetTransparency ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), l_Workspace_0 (copy)
        for _, v31 in v28:GetDescendants() do
            if v31.Name == "UnusualParticle" then
                v31.Enabled = v29 == 0;
                if not v31.Enabled then
                    local l_Parent_1 = v31.Parent;
                    v31.Parent = l_ReplicatedStorage_0;
                    v31.Parent = l_Parent_1;
                end;
            end;
            if (v31:IsA("BasePart") or v31:IsA("Decal")) and v31.LocalTransparencyModifier < 1000 then
                v31.LocalTransparencyModifier = v29;
            end;
        end;
        local l_FirstChild_0 = l_Workspace_0.Welds:FindFirstChild(v28.Name);
        if l_FirstChild_0 then
            for _, v35 in l_FirstChild_0:GetDescendants() do
                if v35.Name == "UnusualParticle" then
                    v35.Enabled = v29 == 0;
                    if not v35.Enabled then
                        local l_Parent_2 = v35.Parent;
                        v35.Parent = l_ReplicatedStorage_0;
                        v35.Parent = l_Parent_2;
                    end;
                end;
                if (v35:IsA("BasePart") or v35:IsA("Decal")) and v35.LocalTransparencyModifier < 1000 then
                    v35.LocalTransparencyModifier = v29;
                end;
            end;
        end;
    end;
    v0.Main = function(v38) --[[ Line: 101 ]] --[[ Name: Main ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), v22 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), v37 (copy)
        local v39 = tick();
        local l_Character_0 = v38.Character;
        local l_Damager_0 = v38.Damager;
        local l_StartPosition_0 = v38.StartPosition;
        local l_LookVector_0 = v38.LookVector;
        local l_FirstChild_1 = l_Workspace_0.States:FindFirstChild(l_Character_0.Name);
        local l_CharacterData_0 = l_FirstChild_1:FindFirstChild("CharacterData");
        local l_PlayerData_0 = l_FirstChild_1:FindFirstChild("PlayerData");
        local l_Occupied_0 = l_FirstChild_1:FindFirstChild("Occupied");
        if not l_CharacterData_0 or not l_PlayerData_0 or not l_Occupied_0 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_0);
            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
            local v50 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
            local l_Humanoid_1 = l_Damager_0:FindFirstChild("Humanoid");
            local v52 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
            if not v50 or not v52 then
                return;
            else
                local v53 = l_Assets_0.DownFrames.Default:Clone();
                local v54 = l_LocalPlayer_0.Character == l_Character_0;
                local v55 = v54 or l_LocalPlayer_0.Character == l_Damager_0;
                if v55 then
                    v53.Parent = l_Common_0;
                end;
                local v56 = 0.1;
                local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_0, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_0, l_StartPosition_0 - l_LookVector_0, v56 + 3.5, l_l_RayHelper_0_EnvironmentWhitelist_0);
                local v61 = l_StartPosition_0 - l_LookVector_0 * v56;
                if l_l_RayHelper_0_RayWithWhiteList_0 then
                    v61 = l_StartPosition_0 - l_LookVector_0 * -2;
                end;
                local v62 = {};
                for _, v64 in l_Character_0:GetChildren() do
                    if v64:IsA("BasePart") and v64 ~= l_Character_0.PrimaryPart then
                        v62[v64] = v64.CollisionGroup;
                        v64.CollisionGroup = "None";
                    end;
                end;
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = true;
                end;
                for _, v66 in (v52:GetPlayingAnimationTracks()) do
                    if v66.Priority ~= Enum.AnimationPriority.Idle then
                        local l_Speed_0 = v66.Speed;
                        v66:AdjustSpeed(l_Speed_0 / 2.5);
                        task.delay(0.9770114942528736, function() --[[ Line: 169 ]]
                            -- upvalues: v66 (copy), l_Speed_0 (copy)
                            if not v66 then
                                return;
                            else
                                v66:AdjustSpeed(l_Speed_0);
                                return;
                            end;
                        end);
                    end;
                end;
                local v68 = {
                    AnimId = v0.Animations.Start, 
                    FadeIn = 0.05, 
                    AnimSpeed = 0.29, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_0, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v68);
                local v70 = nil;
                task.delay(0.8620689655172414, function() --[[ Line: 188 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_0 (ref), v70 (ref), v61 (ref), l_LookVector_0 (copy), l_Workspace_0 (ref), v54 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v22 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref), l_SoundHelper_0 (ref), l_Character_0 (copy)
                    for v71 = 1, 5 do
                        l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.29 + 0.71 * (v71 / 5));
                        task.wait(0.016666666666666666);
                    end;
                    task.wait(0.03333333333333333);
                    v70 = script.FallSmoke:Clone();
                    v70.Position = (CFrame.lookAt(v61, v61 + l_LookVector_0) * CFrame.new(0.6, 0, 3.3)).Position - Vector3.new(0, 2.9100000858306885, 0, 0);
                    v70.Parent = l_Workspace_0.Debris;
                    for _, v73 in v70:GetDescendants() do
                        if v73:IsA("ParticleEmitter") then
                            v73.Enabled = false;
                            v73:Emit(v73.Rate);
                        end;
                    end;
                    if v54 or l_LocalPlayer_0.Character == l_Damager_0 then
                        task.defer(function() --[[ Line: 209 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "HardHitRoll", 
                                WaitTime = 0.3, 
                                Fade = 1, 
                                FoV = 55, 
                                FoVMult = 1
                            });
                        end);
                        local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
                        l_ColorCorrection_0.Saturation = 0;
                        l_ColorCorrection_0.Contrast = 0;
                        l_ColorCorrection_0.Enabled = true;
                        local v75 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_ColorCorrection_0, v75, {
                            Saturation = -1, 
                            Contrast = 0.5
                        }):Play();
                        local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_0.Size = 0;
                        l_MenuBlur_0.Enabled = true;
                        local v77 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_0, v77, {
                            Size = 30
                        }):Play();
                        v22.HUDShake({
                            Scale = 20, 
                            Damper = 0.09999999999999999
                        });
                    end;
                    v70.Decal2.Color3 = Color3.fromRGB(255, 173, 90);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Explosion
                    });
                    local v78 = l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Wind
                    });
                    task.wait(6);
                    l_TweenService_0:Create(v70.Decal, TweenInfo.new(6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Transparency = 1
                    }):Play();
                    l_TweenService_0:Create(v70.Decal1, TweenInfo.new(8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Transparency = 1
                    }):Play();
                    l_TweenService_0:Create(v70.Decal2, TweenInfo.new(4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Transparency = 1
                    }):Play();
                    l_TweenService_0:Create(v78, TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Volume = 0
                    }):Play();
                    task.wait(8);
                    v70:Destroy();
                end);
                local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
                local l_CFrame_0 = l_PrimaryPart_0.CFrame;
                local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
                local v82 = {
                    Victim = l_Character_0, 
                    LookVector = l_LookVector_0, 
                    EndPosition = v61, 
                    VictimPosition = l_PrimaryPart_0.Position, 
                    TargetVector = v61 - v61, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_0, 
                    TargetTime = 0.8620689655172414, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v82);
                local v83 = {};
                local function v89(v84) --[[ Line: 286 ]] --[[ Name: CreateTrail ]]
                    -- upvalues: l_Character_0 (copy), v22 (ref), v83 (copy)
                    local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(v84);
                    if not l_l_Character_0_FirstChild_0 then
                        return;
                    else
                        local v86 = script.Trail:Clone();
                        v86.Parent = v22.GetWeldCharacter(l_Character_0);
                        local l_Attachment0_0 = v86.Attachment0;
                        local l_Attachment1_0 = v86.Attachment1;
                        l_Attachment0_0.Parent = l_l_Character_0_FirstChild_0;
                        l_Attachment1_0.Parent = l_l_Character_0_FirstChild_0;
                        v86:Destroy();
                        table.insert(v83, l_Attachment0_0);
                        table.insert(v83, l_Attachment1_0);
                        return;
                    end;
                end;
                v89("LeftHand");
                v89("RightHand");
                v89("LeftFoot");
                v89("RightFoot");
                local v90 = script.Knockdown:Clone();
                v90.CFrame = CFrame.lookAt(l_CFrame_0.Position, v61);
                v90.Position = v90.Position + Vector3.new(0, 0.75, 0, 0);
                v90.Parent = l_Workspace_0.Debris;
                for _, v92 in v90.Particle:GetChildren() do
                    v92.Enabled = false;
                    v92:Emit(v92:GetAttribute("EmitCount"));
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
                local v98 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v99 = l_LocalPlayer_0.Character == l_Character_0;
                if v99 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v98, {
                        ImageTransparency = 0.6
                    }):Play();
                end;
                local v100 = nil;
                local _ = {};
                local _ = l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_0.PrimaryPart
                });
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Character_0.PrimaryPart, 
                    DirectCopy = script.Sounds.Punch
                });
                if v99 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v100 = l_SoundHelper_0:PlaySound({
                        Name = "Cheering", 
                        Parent = l_Workspace_0.Debris
                    });
                    task.delay(0.2, function() --[[ Line: 359 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "KnockdownStart", 
                            Parent = l_Workspace_0.Debris
                        });
                    end);
                    task.delay(2.5, function() --[[ Line: 366 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Ringing", 
                            Parent = l_Workspace_0.Debris
                        });
                    end);
                    task.defer(function() --[[ Line: 373 ]]
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
                    local v104 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_1, v104, {
                        Saturation = -1, 
                        Contrast = 0.5
                    }):Play();
                    local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_1.Size = 0;
                    l_MenuBlur_1.Enabled = true;
                    local v106 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_1, v106, {
                        Size = 10
                    }):Play();
                    local v107 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v107, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(0.8620689655172414, function() --[[ Line: 407 ]]
                        -- upvalues: v22 (ref), v53 (copy)
                        v22.TripleText({
                            Image = v53.Down
                        });
                    end);
                    task.delay(0.8620689655172414, function() --[[ Line: 413 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                end;
                task.wait(0.9770114942528736);
                for _, v109 in v83 do
                    if v109 then
                        v109:Destroy();
                    end;
                end;
                v68.Priority = Enum.AnimationPriority.Action3;
                v68.AnimId = v0.Animations.Loop;
                v68.Looped = true;
                v68.AnimSpeed = 1;
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v68);
                l_l_AnimHelper_0_Anim_1.Name = "Remove";
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2 - 2 * v38.RandomMult + 1 + v38.ExtraTime - 1.5, function() --[[ Line: 437 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                if v99 or l_LocalPlayer_0.Character == l_Damager_0 then
                    task.defer(function() --[[ Line: 444 ]]
                        -- upvalues: v100 (ref), l_TweenService_0 (ref)
                        local l_EqualizerSoundEffect_0 = v100.EqualizerSoundEffect;
                        local v112 = {
                            HighGain = l_EqualizerSoundEffect_0.HighGain, 
                            LowGain = l_EqualizerSoundEffect_0.LowGain, 
                            MidGain = l_EqualizerSoundEffect_0.MidGain
                        };
                        l_EqualizerSoundEffect_0.HighGain = 0;
                        l_EqualizerSoundEffect_0.LowGain = 0;
                        l_EqualizerSoundEffect_0.MidGain = 0;
                        l_EqualizerSoundEffect_0.Enabled = true;
                        local v113 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                        l_TweenService_0:Create(l_EqualizerSoundEffect_0, v113, v112):Play();
                        l_TweenService_0:Create(v100, v113, {
                            Volume = v100.Volume * 3
                        }):Play();
                    end);
                end;
                local v114 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                task.defer(function() --[[ Line: 466 ]]
                    -- upvalues: v38 (copy), v99 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v0 (ref), v22 (ref)
                    v38.IsBillboard = not (v99 or l_LocalPlayer_0.Character == l_Damager_0);
                    v38.Speed = v38.ExtraTime / (v0.DelayTime + v38.ExtraTime);
                    v22.DownCount(v38);
                end);
                if v99 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_Variant_0.Value = "Yamcha";
                    l_CameraMode_0.Value = "Knockdown";
                    l_CameraTarget_0.Value = l_Character_0;
                    v37(l_Damager_0, 1);
                    l_TweenService_0:Create(l_Vignette_0, v98, {
                        ImageTransparency = 0.2
                    }):Play();
                    l_TweenService_0:Create(l_Lighting_0, v114, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.2
                    }):Play();
                    task.delay(1, function() --[[ Line: 482 ]]
                        -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v114 (copy)
                        l_TweenService_0:Create(l_Lighting_0, v114, {
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
                local v115 = tick();
                repeat
                    task.wait(0.1);
                until l_Character_0:GetAttribute("GettingUp") or not l_Character_0:IsDescendantOf(l_Workspace_0) or tick() - v115 > 15;
                v68.Priority = Enum.AnimationPriority.Action4;
                v68.AnimId = v0.Animations.End;
                v68.Looped = false;
                v68.StopInfo = {
                    StopDelay = 3.8, 
                    StopTime = 0.4, 
                    Weight = 1
                };
                if l_l_AnimHelper_0_Anim_1 then
                    l_l_AnimHelper_0_Anim_1:Stop(0);
                end;
                l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v68);
                task.delay(0.16666666666666666, function() --[[ Line: 515 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Damager_0 (copy)
                    l_SoundHelper_0:PlaySound({
                        Name = "Rustle3", 
                        Parent = l_Damager_0.PrimaryPart, 
                        Volume = 0.8
                    });
                    task.wait(1.25);
                    l_SoundHelper_0:PlaySound({
                        Name = "Rustle4", 
                        Parent = l_Damager_0.PrimaryPart, 
                        Volume = 0.8
                    });
                end);
                task.wait(1.5);
                if v99 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Lighting_0, v114, {
                        ExposureCompensation = workspace.Exposure.Value
                    }):Play();
                    task.delay(1, function() --[[ Line: 535 ]]
                        -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v114 (copy)
                        l_TweenService_0:Create(l_Lighting_0, v114, {
                            ExposureCompensation = workspace.Exposure.Value
                        }):Play();
                    end);
                end;
                if v99 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v98, {
                        ImageTransparency = 1
                    }):Play();
                    l_CameraMode_0.Value = "";
                    l_Variant_0.Value = "";
                    v37(l_Damager_0, 0);
                end;
                if v55 then
                    l_SoundHelper_0:PlaySound({
                        Name = "GetUpCheer", 
                        Parent = l_Workspace_0.Debris
                    });
                end;
                task.delay(1.15, function() --[[ Line: 558 ]]
                    -- upvalues: v39 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v99 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v22 (ref), v53 (copy), l_Workspace_0 (ref)
                    print(v39 - tick());
                    l_SoundHelper_0:PlaySound({
                        Name = "BoxLayer", 
                        Parent = l_Character_0.PrimaryPart
                    });
                    if v99 or l_LocalPlayer_0.Character == l_Damager_0 then
                        v22.TripleText({
                            Image = v53.Box, 
                            HoldTime = 0.6666666666666666
                        });
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.4, 
                            Fade = 0.7
                        });
                    end;
                    task.wait(0.2);
                    if v99 or l_LocalPlayer_0.Character == l_Damager_0 then
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
                if l_Damager_0 and l_Damager_0.PrimaryPart then
                    l_Damager_0.PrimaryPart.Anchored = false;
                end;
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = false;
                end;
                for v116, v117 in v62 do
                    v116.CollisionGroup = v117;
                end;
                task.wait(5);
                v90:Destroy();
                if v53 then
                    v53:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.KO = function(v118) --[[ Line: 611 ]] --[[ Name: KO ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_SoundHelper_0 (copy), v37 (copy), v0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), l_ReplicatedStorage_0 (copy), l_RunService_0 (copy), v22 (copy), l_Lighting_0 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy)
        local l_Character_1 = v118.Character;
        local l_Damager_1 = v118.Damager;
        local l_StartPosition_1 = v118.StartPosition;
        local l_LookVector_1 = v118.LookVector;
        local l_FirstChild_2 = l_Workspace_0.States:FindFirstChild(l_Character_1.Name);
        local l_CharacterData_1 = l_FirstChild_2:FindFirstChild("CharacterData");
        local l_PlayerData_1 = l_FirstChild_2:FindFirstChild("PlayerData");
        local l_Occupied_1 = l_FirstChild_2:FindFirstChild("Occupied");
        if not l_CharacterData_1 or not l_PlayerData_1 or not l_Occupied_1 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_1);
            local l_Humanoid_2 = l_Character_1:FindFirstChild("Humanoid");
            local v129 = l_Humanoid_2 and l_Humanoid_2:FindFirstChild("Animator");
            local l_Humanoid_3 = l_Damager_1:FindFirstChild("Humanoid");
            local v131 = l_Humanoid_3 and l_Humanoid_3:FindFirstChild("Animator");
            if not v129 or not v131 then
                return;
            else
                local v132 = l_Assets_0.DownFrames.Default:Clone();
                local v133 = l_LocalPlayer_0.Character == l_Character_1;
                local v134 = v133 or l_LocalPlayer_0.Character == l_Damager_1;
                if v134 then
                    v132.Parent = l_Common_0;
                end;
                local _ = l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_1.PrimaryPart
                });
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Character_1.PrimaryPart, 
                    DirectCopy = script.Sounds.Punch
                });
                task.delay(0.9666666666666667, function() --[[ Line: 650 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Damager_1 (copy)
                    l_SoundHelper_0:PlaySound({
                        Name = "Rustle5", 
                        Parent = l_Damager_1.PrimaryPart, 
                        Volume = 1
                    });
                    task.wait(0.4166666666666667);
                    l_SoundHelper_0:PlaySound({
                        Name = "Rustle2", 
                        Parent = l_Damager_1.PrimaryPart, 
                        Volume = 1
                    });
                end);
                local v136 = l_Damager_1.PrimaryPart.CFrame * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.6);
                l_Character_1:PivotTo(v136);
                for _, v138 in (v131:GetPlayingAnimationTracks()) do
                    if v138.Priority ~= Enum.AnimationPriority.Idle then
                        v138:AdjustSpeed(v138.Speed / 4);
                    end;
                end;
                if v134 then
                    v37(l_Damager_1, 1);
                end;
                local v139 = script.Saibamen:Clone();
                v37(v139, 1);
                v139.Parent = l_Workspace_0.Debris;
                local v140 = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.6);
                if not v134 then
                    v140 = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 2.2);
                end;
                v139:SetPrimaryPartCFrame(v136 * v140);
                local l_Animator_0 = v139.Humanoid.Animator;
                local v142 = {
                    AnimId = v0.Animations.Saibamen, 
                    FadeIn = 0.05, 
                    AnimSpeed = 1, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Animator_0, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v142);
                l_l_AnimHelper_0_Anim_2:Stop(0.01);
                local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                task.delay(1.0833333333333333, function() --[[ Line: 709 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Character_1 (copy), v37 (ref), v139 (copy), l_TweenService_0 (ref), v134 (copy), l_CurrentCamera_0 (copy)
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Grab
                    });
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Jump
                    });
                    v37(v139, 0);
                    task.wait(0.8333333333333334);
                    l_TweenService_0:Create(v139.Highlight, TweenInfo.new(3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                        FillTransparency = 0, 
                        OutlineTransparency = 0
                    }):Play();
                    for _, v146 in v139:GetChildren() do
                        if v146:IsA("BasePart") and v146.Name ~= "HumanoidRootPart" then
                            for _, v148 in script.Aura:GetChildren() do
                                local v149 = v148:Clone();
                                v149.Parent = v146;
                                v149.Enabled = true;
                            end;
                        end;
                    end;
                    task.wait(0.5);
                    if v134 then
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                            FieldOfView = 50
                        }):Play();
                    end;
                end);
                local v150 = {
                    AnimId = v0.Animations.Yamcha, 
                    FadeIn = 0.05, 
                    AnimSpeed = 1, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = v129, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_3 = l_AnimHelper_0:CreateAnim(v150);
                l_l_AnimHelper_0_Anim_3:Stop(0.01);
                l_l_AnimHelper_0_Anim_2:Play();
                l_l_AnimHelper_0_Anim_3:Play();
                local v152 = l_ReplicatedStorage_0.Assets.Camera:Clone();
                v152.Parent = l_Workspace_0.Debris;
                v152:PivotTo(l_Damager_1.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                local v153 = {
                    AnimId = v0.Animations.Camera, 
                    AnimSpeed = 1, 
                    Animator = v152.AnimationController.Animator
                };
                task.delay(0.9666666666666667, function() --[[ Line: 772 ]]
                    -- upvalues: v152 (copy)
                    v152:PivotTo(v152.PrimaryPart.CFrame * CFrame.new(0, -0.5, 0));
                end);
                local l_l_AnimHelper_0_Anim_4 = l_AnimHelper_0:CreateAnim(v153);
                local l_CameraSettings_1 = l_Workspace_0:FindFirstChild("CameraSettings");
                local _ = l_CameraSettings_1.CameraTarget;
                local l_CameraMode_1 = l_CameraSettings_1.CameraMode;
                local _ = l_CameraSettings_1.Variant;
                local v159 = CFrame.new();
                if v134 then
                    task.delay(0, function() --[[ Line: 788 ]]
                        -- upvalues: l_CameraMode_1 (copy), l_CurrentCamera_0 (copy), l_TweenService_0 (ref), l_RunService_0 (ref), v152 (copy), v159 (ref), v139 (copy), l_Character_1 (copy), v140 (ref)
                        l_CameraMode_1.Value = "Cutscene";
                        l_CurrentCamera_0.FieldOfView = 20;
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            FieldOfView = 35
                        }):Play();
                        l_RunService_0:BindToRenderStep("CameraRig", Enum.RenderPriority.Camera.Value + 6, function(_) --[[ Line: 794 ]]
                            -- upvalues: l_CurrentCamera_0 (ref), v152 (ref), v159 (ref), v139 (ref), l_Character_1 (ref), v140 (ref)
                            l_CurrentCamera_0.CFrame = v152.Head.CFrame * v159;
                            v139:PivotTo(l_Character_1.PrimaryPart.CFrame * v140);
                        end);
                    end);
                    task.defer(function() --[[ Line: 800 ]]
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
                    local l_ColorCorrection_2 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_2.Saturation = 0;
                    l_ColorCorrection_2.Contrast = 0;
                    l_ColorCorrection_2.Enabled = true;
                    local v162 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_2, v162, {
                        Saturation = -1, 
                        Contrast = 0.5
                    }):Play();
                    local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_2.Size = 0;
                    l_MenuBlur_2.Enabled = true;
                    local v164 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_2, v164, {
                        Size = 20
                    }):Play();
                    local v165 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v165, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    v22.CreateImpactFrame({
                        Time = 0.05
                    });
                end;
                task.wait(3);
                l_l_AnimHelper_0_Anim_4:AdjustSpeed(0.01);
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Character_1.PrimaryPart, 
                    DirectCopy = script.Sounds.Explosion2
                });
                local v166 = script.Explosion:Clone();
                v166.Parent = l_Workspace_0.Debris;
                v166.CFrame = l_Character_1.PrimaryPart.CFrame * CFrame.new(0, -3, 0);
                for _, v168 in v166:GetDescendants() do
                    if v168:IsA("ParticleEmitter") then
                        v168:Emit(v168.Rate);
                        v168.Enabled = true;
                    end;
                end;
                if v134 then
                    task.defer(function() --[[ Line: 860 ]]
                        -- upvalues: v159 (ref)
                        for v169 = 1, 60 do
                            task.wait(0.016666666666666666);
                            v159 = CFrame.new(0, 0 + -2 * (v169 / 60), 0 + 12 * (v169 / 60));
                        end;
                    end);
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                        FieldOfView = 70
                    }):Play();
                    task.defer(function() --[[ Line: 870 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "HardHitRoll", 
                            WaitTime = 1.5, 
                            Fade = 3, 
                            FoV = 70, 
                            FoVMult = 1
                        });
                    end);
                    v22.HUDShake({
                        Scale = 20, 
                        Damper = 0.09999999999999999
                    });
                    local l_ColorCorrection_3 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_3.Saturation = 0;
                    l_ColorCorrection_3.Contrast = 0;
                    l_ColorCorrection_3.Enabled = true;
                    local v171 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_3, v171, {
                        Saturation = -1, 
                        Contrast = 0.5
                    }):Play();
                    local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_3.Size = 0;
                    l_MenuBlur_3.Enabled = true;
                    local v173 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_3, v173, {
                        Size = 20
                    }):Play();
                    local v174 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v174, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.defer(function() --[[ Line: 904 ]]
                        -- upvalues: v22 (ref)
                        v22.CreateImpactFrame({
                            Time = 0.05
                        });
                    end);
                end;
                v139:Destroy();
                local v175 = nil;
                l_TweenService_0:Create(v166, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    Transparency = 0.7
                }):Play();
                if v134 then
                    v37(l_Character_1, 1);
                    v175 = Instance.new("ColorCorrectionEffect");
                    v175.Parent = game.Lighting;
                    v175.Saturation = 0;
                    v175.Contrast = 0;
                    v175.Enabled = true;
                end;
                task.wait(0.5);
                if v134 then
                    local v176 = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
                    l_TweenService_0:Create(v175, v176, {
                        Brightness = 3, 
                        Saturation = 1.5, 
                        Contrast = 1
                    }):Play();
                end;
                task.wait(1.5);
                for _, v178 in v166:GetDescendants() do
                    if v178:IsA("ParticleEmitter") then
                        v178.Enabled = false;
                    end;
                end;
                local v179 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v175 then
                    l_TweenService_0:Create(v175, v179, {
                        Brightness = 0, 
                        Saturation = 0, 
                        Contrast = 0
                    }):Play();
                end;
                l_TweenService_0:Create(v166, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    Transparency = 1
                }):Play();
                if v134 then
                    l_RunService_0:UnbindFromRenderStep("CameraRig");
                end;
                task.delay(4, function() --[[ Line: 954 ]]
                    -- upvalues: v166 (copy), v175 (ref)
                    v166:Destroy();
                    v175:Destroy();
                end);
                local v180 = l_StartPosition_1 - l_LookVector_1;
                local v181 = {};
                for _, v183 in l_Character_1:GetChildren() do
                    if v183:IsA("BasePart") and v183 ~= l_Character_1.PrimaryPart then
                        v181[v183] = v183.CollisionGroup;
                        v183.CollisionGroup = "None";
                    end;
                end;
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = true;
                end;
                local v184 = {
                    AnimId = v0.Animations.Loop, 
                    FadeIn = 0.05, 
                    AnimSpeed = 1, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_2, 
                    Weight = 1000, 
                    Looped = true, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_5 = l_AnimHelper_0:CreateAnim(v184);
                local v186 = nil;
                task.spawn(function() --[[ Line: 994 ]]
                    -- upvalues: v37 (ref), l_Character_1 (copy), v186 (ref), v180 (copy), l_LookVector_1 (copy), l_Workspace_0 (ref), v133 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), v22 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref), l_SoundHelper_0 (ref)
                    v37(l_Character_1, 0);
                    v186 = script.FallSmoke:Clone();
                    v186.Position = (CFrame.lookAt(v180, v180 + l_LookVector_1) * CFrame.new(0.6, 0, 3.3)).Position - Vector3.new(0, 2.9100000858306885, 0, 0);
                    v186.Parent = l_Workspace_0.Debris;
                    for _, v188 in v186:GetDescendants() do
                        if v188:IsA("ParticleEmitter") then
                            v188.Enabled = false;
                            v188:Emit(v188.Rate);
                        end;
                    end;
                    if v133 or l_LocalPlayer_0.Character == l_Damager_1 then
                        task.defer(function() --[[ Line: 1008 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "HardHitRoll", 
                                WaitTime = 0.3, 
                                Fade = 1, 
                                FoV = 55, 
                                FoVMult = 1
                            });
                        end);
                        local l_ColorCorrection_4 = l_Lighting_0.ColorCorrection;
                        l_ColorCorrection_4.Saturation = 0;
                        l_ColorCorrection_4.Contrast = 0;
                        l_ColorCorrection_4.Enabled = true;
                        local v190 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_ColorCorrection_4, v190, {
                            Saturation = -1, 
                            Contrast = 0.5
                        }):Play();
                        local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_4.Size = 0;
                        l_MenuBlur_4.Enabled = true;
                        local v192 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_4, v192, {
                            Size = 30
                        }):Play();
                        v22.HUDShake({
                            Scale = 20, 
                            Damper = 0.09999999999999999
                        });
                    end;
                    v186.Decal2.Color3 = Color3.fromRGB(255, 74, 74);
                    local v193 = l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Wind
                    });
                    task.wait(6);
                    l_TweenService_0:Create(v186.Decal, TweenInfo.new(6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Transparency = 1
                    }):Play();
                    l_TweenService_0:Create(v186.Decal1, TweenInfo.new(8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Transparency = 1
                    }):Play();
                    l_TweenService_0:Create(v186.Decal2, TweenInfo.new(4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Transparency = 1
                    }):Play();
                    l_TweenService_0:Create(v193, TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Volume = 0
                    }):Play();
                    task.wait(8);
                    v186:Destroy();
                end);
                local l_PrimaryPart_1 = l_Character_1.PrimaryPart;
                local l_CFrame_1 = l_PrimaryPart_1.CFrame;
                local l_l_Workspace_0_ServerTimeNow_1 = l_Workspace_0:GetServerTimeNow();
                local v197 = {
                    Victim = l_Character_1, 
                    LookVector = l_LookVector_1, 
                    EndPosition = v180, 
                    VictimPosition = l_PrimaryPart_1.Position, 
                    TargetVector = v180 - v180, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_1, 
                    TargetTime = 0.25, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v197);
                local v198 = {};
                local function _(v199) --[[ Line: 1079 ]] --[[ Name: CreateTrail ]]
                    -- upvalues: l_Character_1 (copy), v22 (ref), v198 (copy)
                    local l_l_Character_1_FirstChild_0 = l_Character_1:FindFirstChild(v199);
                    if not l_l_Character_1_FirstChild_0 then
                        return;
                    else
                        local v201 = script.Trail:Clone();
                        v201.Parent = v22.GetWeldCharacter(l_Character_1);
                        local l_Attachment0_1 = v201.Attachment0;
                        local l_Attachment1_1 = v201.Attachment1;
                        l_Attachment0_1.Parent = l_l_Character_1_FirstChild_0;
                        l_Attachment1_1.Parent = l_l_Character_1_FirstChild_0;
                        v201:Destroy();
                        table.insert(v198, l_Attachment0_1);
                        table.insert(v198, l_Attachment1_1);
                        return;
                    end;
                end;
                local v205 = script.Knockdown:Clone();
                v205.CFrame = CFrame.lookAt(l_CFrame_1.Position, v180);
                v205.Position = v205.Position + Vector3.new(0, 0.75, 0, 0);
                v205.Parent = l_Workspace_0.Debris;
                for _, v207 in v205.Particle:GetChildren() do
                    v207.Enabled = false;
                    v207:Emit(v207:GetAttribute("EmitCount"));
                end;
                if l_Occupied_1 and l_LocalPlayer_0.Character == l_Character_1 then
                    l_Occupied_1.Target.Value = l_LookVector_1;
                    l_Occupied_1.LockedOn.Value = l_Damager_1;
                end;
                local l_CameraSettings_2 = l_Workspace_0:FindFirstChild("CameraSettings");
                local l_CameraTarget_2 = l_CameraSettings_2.CameraTarget;
                local l_CameraMode_2 = l_CameraSettings_2.CameraMode;
                local l_Variant_2 = l_CameraSettings_2.Variant;
                local l_Vignette_1 = l_Main_0.DownFrame.Vignette;
                local v213 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v214 = l_LocalPlayer_0.Character == l_Character_1;
                if v214 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v213, {
                        ImageTransparency = 0.6
                    }):Play();
                end;
                local v215 = nil;
                local _ = {};
                local _ = l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_1.PrimaryPart
                });
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Character_1.PrimaryPart, 
                    DirectCopy = script.Sounds.Punch
                });
                if v214 or l_LocalPlayer_0.Character == l_Damager_1 then
                    v215 = l_SoundHelper_0:PlaySound({
                        Name = "Cheering", 
                        Parent = l_Workspace_0.Debris
                    });
                    task.delay(0.2, function() --[[ Line: 1147 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "KnockdownStart", 
                            Parent = l_Workspace_0.Debris
                        });
                    end);
                    task.delay(2.5, function() --[[ Line: 1154 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Ringing", 
                            Parent = l_Workspace_0.Debris
                        });
                    end);
                    task.defer(function() --[[ Line: 1161 ]]
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
                    local l_ColorCorrection_5 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_5.Saturation = 0;
                    l_ColorCorrection_5.Contrast = 0;
                    l_ColorCorrection_5.Enabled = true;
                    local v219 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_5, v219, {
                        Saturation = -1, 
                        Contrast = 0.5
                    }):Play();
                    local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_5.Size = 0;
                    l_MenuBlur_5.Enabled = true;
                    local v221 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_5, v221, {
                        Size = 10
                    }):Play();
                    local v222 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v222, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(0.25, function() --[[ Line: 1195 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                end;
                local _ = {
                    HoldTime = 1.5
                };
                if v214 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_SoundHelper_0:PlaySound({
                        Name = "Box", 
                        Volume = 0.25, 
                        Parent = l_Workspace_0.Debris
                    });
                    if v134 then
                        task.defer(function() --[[ Line: 1216 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 0.2, 
                                Fade = 1
                            });
                        end);
                    end;
                end;
                for _, v225 in v198 do
                    if v225 then
                        v225:Destroy();
                    end;
                end;
                local v226 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v214 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_Variant_2.Value = "Yamcha";
                    l_CameraMode_2.Value = "Knockdown";
                    l_CameraTarget_2.Value = l_Character_1;
                    l_TweenService_0:Create(l_Vignette_1, v213, {
                        ImageTransparency = 0.2
                    }):Play();
                    l_TweenService_0:Create(l_Lighting_0, v226, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.2
                    }):Play();
                    task.delay(1, function() --[[ Line: 1241 ]]
                        -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v226 (copy)
                        l_TweenService_0:Create(l_Lighting_0, v226, {
                            ExposureCompensation = workspace.Exposure.Value
                        }):Play();
                    end);
                end;
                if v214 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Lighting_0, v226, {
                        ExposureCompensation = workspace.Exposure.Value
                    }):Play();
                    task.delay(1, function() --[[ Line: 1249 ]]
                        -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v226 (copy)
                        l_TweenService_0:Create(l_Lighting_0, v226, {
                            ExposureCompensation = workspace.Exposure.Value
                        }):Play();
                    end);
                end;
                local v227 = false;
                local function v232() --[[ Line: 1255 ]] --[[ Name: Reset ]]
                    -- upvalues: v227 (ref), v22 (ref), v37 (ref), l_Character_1 (copy), l_Occupied_1 (copy), v214 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), l_Lighting_0 (ref), l_TweenService_0 (ref), v134 (copy), l_Vignette_1 (copy), v213 (copy), l_RunService_0 (ref), l_CameraMode_2 (copy), l_Variant_2 (copy), v181 (copy), l_l_AnimHelper_0_Anim_5 (copy), v132 (copy), v152 (copy)
                    if v227 then
                        return;
                    else
                        v227 = true;
                        task.defer(function() --[[ Line: 1259 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.5, 
                                Fade = 2
                            });
                        end);
                        v37(l_Character_1, 0);
                        if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                            l_Occupied_1.Target.Value = Vector3.new();
                        end;
                        if v214 then
                            l_Occupied_1.LerpMult.Value = 0;
                        end;
                        if v214 or l_LocalPlayer_0.Character == l_Damager_1 then
                            local l_ColorCorrection_6 = l_Lighting_0.ColorCorrection;
                            local v229 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                            l_TweenService_0:Create(l_ColorCorrection_6, v229, {
                                Saturation = 0, 
                                Contrast = 0
                            }):Play();
                        end;
                        if v134 then
                            v37(l_Damager_1, 0);
                            v37(l_Character_1, 0);
                            l_TweenService_0:Create(l_Vignette_1, v213, {
                                ImageTransparency = 1
                            }):Play();
                            task.defer(function() --[[ Line: 1286 ]]
                                -- upvalues: v134 (ref), v22 (ref), l_RunService_0 (ref), l_CameraMode_2 (ref), l_Variant_2 (ref)
                                if v134 then
                                    task.delay(0.3, function() --[[ Line: 1288 ]]
                                        -- upvalues: v22 (ref)
                                        v22.CameraShake({
                                            Preset = "Knockdown", 
                                            WaitTime = 0.15, 
                                            Fade = 0.5, 
                                            FoV = 65, 
                                            FoVMult = 1
                                        });
                                    end);
                                end;
                                l_RunService_0:UnbindFromRenderStep("CameraRig");
                                l_CameraMode_2.Value = "";
                                l_Variant_2.Value = "";
                            end);
                        end;
                        if l_Damager_1 and l_Damager_1.PrimaryPart then
                            l_Damager_1.PrimaryPart.Anchored = false;
                        end;
                        if l_Character_1 and l_Character_1.PrimaryPart then
                            l_Character_1.PrimaryPart.Anchored = false;
                        end;
                        for v230, v231 in v181 do
                            v230.CollisionGroup = v231;
                        end;
                        l_l_AnimHelper_0_Anim_5:Stop(0);
                        if v132 then
                            v132:Destroy();
                        end;
                        if v152 then
                            v152:Destroy();
                        end;
                        if v214 or l_LocalPlayer_0.Character == l_Damager_1 then
                            l_TweenService_0:Create(l_Vignette_1, v213, {
                                ImageTransparency = 1
                            }):Play();
                        end;
                        if v132 then
                            v132:Destroy();
                        end;
                        return;
                    end;
                end;
                local v233 = nil;
                if l_CharacterData_1 and l_CharacterData_1:FindFirstChild("Cutscene") then
                    v233 = l_CharacterData_1.Cutscene.Changed:Connect(function() --[[ Line: 1332 ]]
                        -- upvalues: v233 (ref), v232 (copy)
                        if v233 then
                            v233:Disconnect();
                        end;
                        task.wait(0.28);
                        v232();
                    end);
                end;
                task.wait(8);
                v232();
                return;
            end;
        end;
    end;
    v0.Use = function(v234) --[[ Line: 1343 ]] --[[ Name: Use ]]
        -- upvalues: v0 (copy)
        local _ = v234.Character;
        local _ = v234.Damager;
        if v234.IsKO then
            v0.KO(v234);
            return;
        else
            v0.Main(v234);
            return;
        end;
    end;
    return v0;
end;