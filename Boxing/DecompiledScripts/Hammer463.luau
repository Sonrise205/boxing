local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0:WaitForChild("AlignHelper"));
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("Styles"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("Bezier"));
local _ = require(l_Modules_0:WaitForChild("RayHelper"));
local l_Assets_0 = l_ReplicatedStorage_0:WaitForChild("Assets");
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local l_Parent_0 = script.Parent.Parent;
local v20 = require(l_Parent_0);
local _ = Random.new();
local function _(v22, v23, v24) --[[ Line: 30 ]] --[[ Name: Lerp ]]
    return v22 + (v23 - v22) * v24;
end;
local v26 = {
    Animations = {
        Character = 17505715878, 
        Victim = 17505435548, 
        Camera = 17507119339
    }
};
local _ = function(v27, v28) --[[ Line: 40 ]] --[[ Name: SetTransparency ]]
    -- upvalues: l_Workspace_0 (copy)
    for _, v30 in v27:GetDescendants() do
        if v30.Name == "UnusualParticle" then
            v30.Enabled = v28 == 0;
        end;
        if (v30:IsA("BasePart") or v30:IsA("Decal")) and v30.LocalTransparencyModifier < 1000 then
            v30.LocalTransparencyModifier = v28;
        end;
    end;
    local l_FirstChild_0 = l_Workspace_0.Welds:FindFirstChild(v27.Name);
    if l_FirstChild_0 then
        for _, v33 in l_FirstChild_0:GetDescendants() do
            if v33.Name == "UnusualParticle" then
                v33.Enabled = v28 == 0;
            end;
            if (v33:IsA("BasePart") or v33:IsA("Decal")) and v33.LocalTransparencyModifier < 1000 then
                v33.LocalTransparencyModifier = v28;
            end;
        end;
    end;
end;
v26.Use = function(v35) --[[ Line: 59 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v20 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), v26 (copy), l_AnimHelper_0 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
    local l_Character_0 = v35.Character;
    local l_Victim_0 = v35.Victim;
    local v38 = l_LocalPlayer_0.Character == l_Character_0;
    local v39 = l_LocalPlayer_0.Character == l_Victim_0;
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v41 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v43 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    for _, v45 in (v41:GetPlayingAnimationTracks()) do
        if v45.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_0 = v45.Speed;
            v45:AdjustSpeed(l_Speed_0 / 4);
            task.delay(2, function() --[[ Line: 81 ]]
                -- upvalues: v45 (copy), l_Speed_0 (copy)
                v45:AdjustSpeed(l_Speed_0);
            end);
        end;
    end;
    for _, v48 in (v43:GetPlayingAnimationTracks()) do
        if v48.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_1 = v48.Speed;
            v48:AdjustSpeed(l_Speed_1 / 4);
            task.delay(2, function() --[[ Line: 93 ]]
                -- upvalues: v48 (copy), l_Speed_1 (copy)
                v48:AdjustSpeed(l_Speed_1);
            end);
        end;
    end;
    task.defer(function() --[[ Line: 98 ]]
        -- upvalues: v38 (copy), v39 (copy), v20 (ref), l_Main_0 (ref)
        if v38 or v39 then
            v20.StatusFrame(v39, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v50 = l_Parent_0.UltimateStart:Clone();
    v50.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v50.Parent = l_Workspace_0.Debris;
    task.delay(20, function() --[[ Line: 108 ]]
        -- upvalues: v50 (copy)
        if v50 then
            v50:Destroy();
        end;
    end);
    for _, v52 in v50.Particle:GetChildren() do
        v52.Enabled = false;
        v52:Emit(v52:GetAttribute("EmitCount"));
    end;
    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
    if v38 or v39 then
        task.defer(function() --[[ Line: 120 ]]
            -- upvalues: l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v20 (ref), v50 (copy)
            l_ColorCorrection_0.Saturation = 0;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v54 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v54, {
                Saturation = -0.7, 
                Contrast = 0.5
            }):Play();
            local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
            l_MenuBlur_0.Size = 0;
            l_MenuBlur_0.Enabled = true;
            local v56 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_0, v56, {
                Size = 10
            }):Play();
            local v57 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v57, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v20.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v20.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.5, 
                Fade = 0.5
            });
            task.wait(5);
            v50:Destroy();
        end);
    end;
    task.wait(0.5);
    local v58 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v59 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v38 or v39 then
        l_TweenService_0:Create(l_Main_0.White, v59, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v59, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v58, {
            ImageTransparency = 0.5
        }):Play();
    end;
    if v38 or v39 then
        task.delay(1, function() --[[ Line: 165 ]]
            -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
            local _ = l_SoundHelper_0:PlaySound({
                Name = "HammerUltSong", 
                Parent = l_Workspace_0.Debris
            });
        end);
    end;
    local v61 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v38 or v39) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v61.Volume;
    v61.Volume = 0;
    task.delay(0.4, function() --[[ Line: 182 ]]
        -- upvalues: v61 (copy), v38 (copy), v39 (copy), l_Volume_0 (copy), v35 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v61:Stop();
        if v38 or v39 then
            v61.Volume = l_Volume_0;
        else
            v61.Volume = l_Volume_0 / 5;
        end;
        v61:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v35.HasVoicelines then
            local v64 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v38 or v39) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v38 and not v39 then
                v64.Volume = v64.Volume / 5;
            end;
        end;
    end);
    task.wait(0.5);
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v38 or v39 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 40;
    end;
    local v67 = {
        Animator = v41, 
        AnimId = v26.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v68 = {
        Animator = v43, 
        AnimId = v26.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    v20.TeleportModel({
        Character = v35.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame * v35.Offset, 
        TeleportId = v35.TeleportId
    });
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v67);
    l_AnimHelper_0:CreateAnim(v68);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v67);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v68);
    local v71 = nil;
    local l_Brightness_0 = l_Lighting_0.Brightness;
    local l_TimeOfDay_0 = l_Lighting_0.TimeOfDay;
    local v74 = TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
    task.delay(7.75, function() --[[ Line: 254 ]]
        -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v38 (copy), v39 (copy), v71 (ref), v61 (copy)
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.55);
        if l_l_AnimHelper_0_Anim_1 then
            l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.55);
        end;
        if v38 or v39 then
            v71:AdjustSpeed(0.55);
        end;
        v61.PlaybackSpeed = 0.55;
        task.wait(0.4545454545454545);
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
        if v38 or v39 then
            v71:AdjustSpeed(1);
        end;
        v61.PlaybackSpeed = 1;
        task.wait(2);
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.75);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.75);
        if v38 or v39 then
            v71:AdjustSpeed(0.75);
        end;
        v61.PlaybackSpeed = 0.75;
        task.wait(1);
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
        if v38 or v39 then
            v71:AdjustSpeed(1);
        end;
        v61.PlaybackSpeed = 1;
    end);
    local v75 = script.IppoUlt:Clone();
    v75.Parent = l_Workspace_0.Debris;
    v75.CFrame = l_Victim_0.PrimaryPart.CFrame;
    task.delay(11, function() --[[ Line: 287 ]]
        -- upvalues: v75 (copy)
        if v75 then
            v75:Destroy();
        end;
    end);
    task.delay(1.5, function() --[[ Line: 291 ]]
        -- upvalues: v20 (ref), l_Character_0 (copy)
        v20.AttackTrail({
            Character = l_Character_0, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TargetPart = "LeftHand", 
                TrailName = "Hammer", 
                DelayTime = 0, 
                HoldTime = 1.5, 
                TimeScale = 1
            }
        });
    end);
    local v100 = {
        [1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("First"):Connect(function() --[[ Line: 307 ]]
            -- upvalues: v75 (copy), v38 (copy), v39 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v20 (ref)
            for _, v77 in v75.Right:GetChildren() do
                v77:Emit(2);
            end;
            if not v38 and not v39 then
                return;
            else
                l_ColorCorrection_0.Saturation = 0;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v78 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v78, {
                    Saturation = -0.2, 
                    Contrast = 0.1
                }):Play();
                local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                l_MenuBlur_1.Size = 0;
                l_MenuBlur_1.Enabled = true;
                local v80 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_1, v80, {
                    Size = 20
                }):Play();
                local v81 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v81, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                v20.CameraShake({
                    Preset = "SuperHardHit", 
                    WaitTime = 0.2, 
                    Fade = 0.25
                });
                return;
            end;
        end), 
        [2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Second"):Connect(function() --[[ Line: 338 ]]
            -- upvalues: v75 (copy), v38 (copy), v39 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v20 (ref)
            for _, v83 in v75.Left:GetChildren() do
                v83:Emit(2);
            end;
            if not v38 and not v39 then
                return;
            else
                l_ColorCorrection_0.Saturation = 0;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v84 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v84, {
                    Saturation = -0.4, 
                    Contrast = 0.2
                }):Play();
                local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                l_MenuBlur_2.Size = 0;
                l_MenuBlur_2.Enabled = true;
                local v86 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_2, v86, {
                    Size = 20
                }):Play();
                local v87 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v87, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                v20.CameraShake({
                    Preset = "SuperHardHit", 
                    WaitTime = 0.35, 
                    Fade = 0.2
                });
                return;
            end;
        end), 
        [3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Slam"):Connect(function() --[[ Line: 369 ]]
            -- upvalues: v75 (copy), v38 (copy), v39 (copy), v20 (ref), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
            for _, v89 in v75.Uppercut:GetChildren() do
                v89:Emit(2);
            end;
            for _, v91 in v75.Uppercut2:GetChildren() do
                v91:Emit(2);
            end;
            if not v38 and not v39 then
                return;
            else
                task.defer(function() --[[ Line: 380 ]]
                    -- upvalues: v20 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                    v20.CreateImpactFrame({
                        Time = 0.1
                    });
                    l_ColorCorrection_0.Saturation = 0;
                    l_ColorCorrection_0.Contrast = 0;
                    l_ColorCorrection_0.Enabled = true;
                    local v92 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_0, v92, {
                        Saturation = -0.4, 
                        Contrast = 0.6
                    }):Play();
                    local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_3.Size = 0;
                    l_MenuBlur_3.Enabled = true;
                    local v94 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_3, v94, {
                        Size = 20
                    }):Play();
                    local v95 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v95, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.4
                    }):Play();
                end);
                v20.HUDShake({
                    Scale = 20, 
                    Damper = 0.09999999999999999
                });
                v20.CameraShake({
                    Preset = "HardHitRoll", 
                    WaitTime = 0.5, 
                    Fade = 0.4
                });
                return;
            end;
        end), 
        [4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final1"):Connect(function() --[[ Line: 415 ]]
            -- upvalues: v38 (copy), v39 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), l_CurrentCamera_0 (copy), v20 (ref)
            if not v38 and not v39 then
                return;
            else
                l_ColorCorrection_0.Saturation = 0.4;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v96 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v96, {
                    Saturation = -0.4, 
                    Contrast = 0.2
                }):Play();
                local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                l_MenuBlur_4.Size = 0;
                l_MenuBlur_4.Enabled = true;
                local v98 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_4, v98, {
                    Size = 20
                }):Play();
                local v99 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v99, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    FieldOfView = 45
                }):Play();
                task.defer(function() --[[ Line: 437 ]]
                    -- upvalues: v20 (ref)
                    v20.CameraShake({
                        Preset = "MediumHit", 
                        WaitTime = 1, 
                        Fade = 0.5
                    });
                end);
                v20.CameraShake({
                    Preset = "SuperHardHit", 
                    WaitTime = 0.2, 
                    Fade = 0.3
                });
                return;
            end;
        end)
    };
    v100[5] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final2"):Connect(function() --[[ Line: 452 ]]
        -- upvalues: v100 (copy), v75 (copy), v38 (copy), v39 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v20 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        for _, v102 in v100 do
            v102:Disconnect();
        end;
        for _, v104 in v75.Final:GetChildren() do
            v104:Emit(2);
        end;
        if not v38 and not v39 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                FieldOfView = 50
            }):Play();
            task.defer(function() --[[ Line: 465 ]]
                -- upvalues: v20 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                v20.CreateImpactFrame({
                    Time = 0.1
                });
                l_ColorCorrection_0.Saturation = 0;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v105 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v105, {
                    Saturation = -1, 
                    Contrast = 1
                }):Play();
                local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
                l_MenuBlur_5.Size = 0;
                l_MenuBlur_5.Enabled = true;
                local v107 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_5, v107, {
                    Size = 25
                }):Play();
                local v108 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v108, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
                }):Play();
            end);
            v20.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v20.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.3, 
                Fade = 1.5
            });
            return;
        end;
    end);
    if v38 or v39 then
        local v109 = l_Assets_0.Camera:Clone();
        v109.Name = l_Character_0.Name .. "Camera";
        v109.Parent = l_Workspace_0.Debris;
        local v110 = 0;
        do
            local l_v110_0 = v110;
            local function v112() --[[ Line: 506 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v110_0 (ref), v109 (copy), l_Character_0 (copy)
                if os.time() - l_v110_0 < 0.5 then
                    return;
                else
                    l_v110_0 = os.time();
                    v109:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.new(0, -3.3, -5.1) * CFrame.Angles(0, 1.5707963267948966, 0));
                    return;
                end;
            end;
            v112();
            local v113 = {
                Animator = v109.AnimationController.Animator, 
                AnimId = v26.Animations.Camera
            };
            v71 = l_AnimHelper_0:CreateAnim(v113);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 524 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v109 (copy), v112 (copy)
                l_CurrentCamera_0.CFrame = v109.Head.CFrame;
                v112();
            end);
            task.wait(5.75);
            v71:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.01);
            l_TweenService_0:Create(l_Main_0.White, v59, {
                BackgroundTransparency = 0
            }):Play();
            task.wait(0.3333333333333333);
            v71:AdjustSpeed(1);
            l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_CameraMode_0.Value = "";
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v58, {
                ImageTransparency = 1
            }):Play();
            local v115 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v115, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v20.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v109:Destroy();
            l_TweenService_0:Create(l_Lighting_0, v74, {
                Brightness = l_Brightness_0
            }):Play();
            l_Lighting_0.TimeOfDay = l_TimeOfDay_0;
        end;
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v26;