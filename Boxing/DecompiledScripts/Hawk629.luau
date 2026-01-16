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
local l_BubbleModule_0 = require(l_ReplicatedStorage_0:WaitForChild("BubbleModule"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("Bezier"));
local _ = require(l_Modules_0:WaitForChild("RayHelper"));
local l_Assets_0 = l_ReplicatedStorage_0:WaitForChild("Assets");
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local l_Parent_0 = script.Parent.Parent;
local v21 = require(l_Parent_0);
local _ = Random.new();
local function _(v23, v24, v25) --[[ Line: 32 ]] --[[ Name: Lerp ]]
    return v23 + (v24 - v23) * v25;
end;
local v27 = {
    Animations = {
        Character = 14155921358, 
        Victim = 14155829549, 
        Camera = 14156013880
    }
};
v27.Use = function(v28) --[[ Line: 42 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v21 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), v27 (copy), l_AnimHelper_0 (copy), l_BubbleModule_0 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
    local l_Character_0 = v28.Character;
    local l_Victim_0 = v28.Victim;
    local v31 = l_LocalPlayer_0.Character == l_Character_0;
    local v32 = l_LocalPlayer_0.Character == l_Victim_0;
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v34 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v36 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    for _, v38 in (v34:GetPlayingAnimationTracks()) do
        if v38.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_0 = v38.Speed;
            v38:AdjustSpeed(l_Speed_0 / 4);
            task.delay(2, function() --[[ Line: 64 ]]
                -- upvalues: v38 (copy), l_Speed_0 (copy)
                v38:AdjustSpeed(l_Speed_0);
            end);
        end;
    end;
    for _, v41 in (v36:GetPlayingAnimationTracks()) do
        if v41.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_1 = v41.Speed;
            v41:AdjustSpeed(l_Speed_1 / 4);
            task.delay(2, function() --[[ Line: 76 ]]
                -- upvalues: v41 (copy), l_Speed_1 (copy)
                v41:AdjustSpeed(l_Speed_1);
            end);
        end;
    end;
    task.defer(function() --[[ Line: 81 ]]
        -- upvalues: v31 (copy), v32 (copy), v21 (ref), l_Main_0 (ref)
        if v31 or v32 then
            v21.StatusFrame(v32, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v43 = l_Parent_0.UltimateStart:Clone();
    v43.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v43.Parent = l_Workspace_0.Debris;
    task.delay(20, function() --[[ Line: 91 ]]
        -- upvalues: v43 (copy)
        if v43 then
            v43:Destroy();
        end;
    end);
    for _, v45 in v43.Particle:GetChildren() do
        v45.Enabled = false;
        v45:Emit(v45:GetAttribute("EmitCount"));
    end;
    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
    if v31 or v32 then
        task.defer(function() --[[ Line: 103 ]]
            -- upvalues: l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v43 (copy)
            l_ColorCorrection_0.Saturation = 0;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v47 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v47, {
                Saturation = -0.7, 
                Contrast = 0.5
            }):Play();
            local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
            l_MenuBlur_0.Size = 0;
            l_MenuBlur_0.Enabled = true;
            local v49 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_0, v49, {
                Size = 10
            }):Play();
            local v50 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v50, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            task.wait(5);
            v43:Destroy();
        end);
    end;
    local v51 = nil;
    if v31 or v32 then
        task.delay(0.6, function() --[[ Line: 134 ]]
            -- upvalues: v51 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref)
            v51 = l_SoundHelper_0:PlaySound({
                Name = "HawkUltSong", 
                Parent = l_Workspace_0.Debris, 
                Volume = 0.2
            });
        end);
    end;
    local v52 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v31 or v32) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v52.Volume;
    v52.Volume = 0;
    task.delay(0, function() --[[ Line: 153 ]]
        -- upvalues: v52 (copy), v31 (copy), v32 (copy), l_Volume_0 (copy), v28 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v52:Stop();
        if v31 or v32 then
            v52.Volume = l_Volume_0;
        else
            v52.Volume = l_Volume_0 / 5;
        end;
        v52:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v28.HasVoicelines then
            local v55 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v31 or v32) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v31 and not v32 then
                v55.Volume = v55.Volume / 5;
            end;
        end;
    end);
    task.wait(0.5);
    local v56 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v57 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v31 or v32 then
        l_TweenService_0:Create(l_Main_0.White, v57, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v57, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v56, {
            ImageTransparency = 0.5
        }):Play();
    end;
    task.wait(0.5);
    local v58 = script.Light:Clone();
    v58.CFrame = l_Character_0.UpperTorso.CFrame;
    v58.Parent = l_Workspace_0.Debris;
    l_TweenService_0:Create(v58.PointLight, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Brightness = 0.6
    }):Play();
    local v59 = {};
    local l_Aura_0 = script.Aura;
    task.delay(0.7333333333333333, function() --[[ Line: 201 ]]
        -- upvalues: l_Character_0 (copy), l_Aura_0 (copy), v59 (copy)
        for _, v62 in l_Character_0:GetChildren() do
            if v62:IsA("BasePart") and v62.Transparency < 1 then
                for _, v64 in l_Aura_0:GetChildren() do
                    local v65 = v64:Clone();
                    v65.Parent = v62;
                    table.insert(v59, v65);
                end;
            end;
        end;
    end);
    task.delay(8.7, function() --[[ Line: 213 ]]
        -- upvalues: v59 (copy), l_TweenService_0 (ref), v58 (copy)
        for _, v67 in v59 do
            v67.TimeScale = 0.3;
        end;
        task.wait(0.6666666666666666);
        for _, v69 in v59 do
            v69.Enabled = false;
        end;
        l_TweenService_0:Create(v58.PointLight, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Brightness = 0
        }):Play();
        task.wait(2);
        for _, v71 in v59 do
            v71:Destroy();
        end;
        if v58 then
            v58:Destroy();
        end;
    end);
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v31 or v32 then
        l_CameraMode_0.Value = "Cutscene";
        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            FieldOfView = 32
        }):Play();
    end;
    local v74 = {
        Animator = v34, 
        AnimId = v27.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v75 = {
        Animator = v36, 
        AnimId = v27.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    v21.TeleportModel({
        Character = v28.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame * v28.Offset, 
        TeleportId = v28.TeleportId
    });
    local v76 = {};
    v21.TeleportModel({
        Character = v28.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame, 
        TeleportId = v28.TeleportId
    });
    l_AnimHelper_0:CreateAnim(v74);
    l_AnimHelper_0:CreateAnim(v75);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v74);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v75);
    local v79 = script.Effects:Clone();
    v79.Parent = l_Workspace_0.Debris;
    v79.CFrame = l_Victim_0.PrimaryPart.CFrame * v28.Offset;
    task.delay(10, function() --[[ Line: 285 ]]
        -- upvalues: v79 (copy)
        v79:Destroy();
    end);
    task.defer(function() --[[ Line: 289 ]]
        -- upvalues: v21 (ref), l_Character_0 (copy)
        v21.AttackTrail({
            Character = l_Character_0, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "UltimateTrail", 
                TargetPart = "RightHand", 
                DelayTime = 0, 
                HoldTime = 1, 
                TimeScale = 0.3
            }
        });
    end);
    local v80 = nil;
    if v31 or v32 then
        v80 = script.Start:Clone();
        v80.CFrame = l_Character_0.PrimaryPart.CFrame;
        task.delay(20, function() --[[ Line: 308 ]]
            -- upvalues: v80 (ref)
            if v80 then
                v80:Destroy();
            end;
        end);
    end;
    task.delay(1.2333333333333334, function() --[[ Line: 313 ]]
        -- upvalues: l_Character_0 (copy), v21 (ref)
        task.defer(function() --[[ Line: 314 ]]
            -- upvalues: l_Character_0 (ref), v21 (ref)
            local v81 = {
                Step = 1, 
                MaxTime = 4.166666666666667, 
                DeleteDelay = 0.3, 
                AddTransparency = 0.98, 
                Character = l_Character_0
            };
            v21.AfterimageEffect(v81);
        end);
    end);
    local v82 = {};
    local v83 = 1;
    v82[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hit"):Connect(function() --[[ Line: 331 ]]
        -- upvalues: v79 (copy), v83 (ref), v21 (ref), l_Character_0 (copy), v31 (copy), v32 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
        local l_Right_0 = v79.Right;
        local v85 = "RightHand";
        if v83 == 3 then
            v83 = v83 + 1;
            local l_EyeGlow_0 = v79.EyeGlow;
            l_EyeGlow_0.Parent = v21.GetWeldCharacter(l_Character_0).Head;
            l_EyeGlow_0.Glow.Enabled = true;
            local l_l_EyeGlow_0_0 = l_EyeGlow_0 --[[ copy: 2 -> 7 ]];
            task.delay(0.7, function() --[[ Line: 343 ]]
                -- upvalues: l_l_EyeGlow_0_0 (copy)
                l_l_EyeGlow_0_0.Glow.Enabled = false;
                task.wait(3);
                l_l_EyeGlow_0_0:Destroy();
            end);
        end;
        if (v83 + 1) % 2 == 0 then
            l_Right_0 = v79.Left;
            v85 = "LeftHand";
        end;
        if v83 == 1 then
            task.defer(function() --[[ Line: 356 ]]
                -- upvalues: v21 (ref), l_Character_0 (ref), v85 (ref)
                v21.AttackTrail({
                    Character = l_Character_0, 
                    TrailInfo = {
                        EffectName = "AttackTrail", 
                        TrailName = "HawkUltimate", 
                        TargetPart = v85, 
                        DelayTime = 0, 
                        HoldTime = 1.5, 
                        TimeScale = 1
                    }
                });
            end);
            task.wait(0.5);
        else
            task.defer(function() --[[ Line: 372 ]]
                -- upvalues: v21 (ref), l_Character_0 (ref), v85 (ref), v83 (ref)
                v21.AttackTrail({
                    Character = l_Character_0, 
                    TrailInfo = {
                        EffectName = "AttackTrail", 
                        TrailName = "HawkUltimate", 
                        TargetPart = v85, 
                        DelayTime = 0, 
                        HoldTime = v83 < 5 and 0.06666666666666667 or 0.25, 
                        TimeScale = 1
                    }
                });
            end);
            task.wait(0.16666666666666666);
        end;
        if v83 == 6 then
            for _, v89 in v79.Uppercut3:GetChildren() do
                v89:Emit(1);
            end;
            for _, v91 in v79.Uppercut4:GetChildren() do
                v91:Emit(1);
            end;
        elseif v83 > 1 then
            for _, v93 in l_Right_0:GetChildren() do
                v93:Emit(1);
            end;
        else
            for _, v95 in v79.Uppercut:GetChildren() do
                v95:Emit(1);
            end;
            for _, v97 in v79.Uppercut2:GetChildren() do
                v97:Emit(1);
            end;
        end;
        v83 = v83 + 1;
        if not v31 and not v32 then
            return;
        else
            l_ColorCorrection_0.Saturation = 0.1;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v98 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v98, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v100 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v100, {
                Size = 20
            }):Play();
            local v101 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v101, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            if v83 <= 2 then
                v21.CameraShake({
                    Preset = "HardHitRoll", 
                    WaitTime = 0.1, 
                    Fade = 0.6
                });
                v21.CreateImpactFrame({
                    Time = 0.1
                });
            else
                v21.CameraShake({
                    Preset = "MedHit", 
                    WaitTime = 0.1, 
                    Fade = 0.5
                });
            end;
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.35
            });
            return;
        end;
    end);
    v82[10] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Follow"):Connect(function() --[[ Line: 457 ]]
        -- upvalues: l_BubbleModule_0 (ref), l_Victim_0 (copy), v31 (copy), v32 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref)
        l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(8, 8, 8, 0), 0.3);
        if not v31 and not v32 then
            return;
        else
            l_ColorCorrection_0.Saturation = 0.1;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v102 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v102, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
            l_MenuBlur_2.Size = 0;
            l_MenuBlur_2.Enabled = true;
            local v104 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_2, v104, {
                Size = 20
            }):Play();
            local v105 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v105, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.35
            });
            v21.CameraShake({
                Preset = "MedHit", 
                WaitTime = 0.1, 
                Fade = 0.5
            });
            return;
        end;
    end);
    v82[8] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("FinalTrail"):Connect(function() --[[ Line: 491 ]]
        -- upvalues: v21 (ref), l_Character_0 (copy)
        task.defer(function() --[[ Line: 492 ]]
            -- upvalues: v21 (ref), l_Character_0 (ref)
            v21.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "Hawk", 
                    TargetPart = "RightHand", 
                    DelayTime = 0, 
                    HoldTime = 2, 
                    TimeScale = 1
                }
            });
        end);
        task.defer(function() --[[ Line: 506 ]]
            -- upvalues: l_Character_0 (ref), v21 (ref)
            local v106 = {
                Step = 1, 
                MaxTime = 2, 
                DeleteDelay = 0.3, 
                AddTransparency = 0.98, 
                Character = l_Character_0
            };
            v21.AfterimageEffect(v106);
        end);
    end);
    v82[2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("FinalStart"):Connect(function() --[[ Line: 519 ]]
        -- upvalues: l_BubbleModule_0 (ref), l_Victim_0 (copy), v58 (copy), l_TweenService_0 (ref), v31 (copy), v32 (copy), l_Lighting_0 (ref), v21 (ref)
        l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(8, 8, 8, 0), 0.3);
        if v58 and v58.PointLight then
            l_TweenService_0:Create(v58.PointLight, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Brightness = 2, 
                Range = 30
            }):Play();
        end;
        if not v31 and not v32 then
            return;
        else
            local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
            l_MenuBlur_3.Size = 0;
            l_MenuBlur_3.Enabled = true;
            local v108 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_3, v108, {
                Size = 25
            }):Play();
            local v109 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v109, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.3, 
                Fade = 1.5
            });
            v21.CreateImpactFrame({
                Time = 0.1
            });
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.35
            });
            return;
        end;
    end);
    v82[10] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Evil"):Connect(function() --[[ Line: 555 ]]
        -- upvalues: v79 (copy), v21 (ref), l_Character_0 (copy)
        local l_Skull_0 = v79.Skull;
        l_Skull_0.Parent = v21.GetWeldCharacter(l_Character_0).Head;
        l_Skull_0.Glow:Emit(1);
        task.delay(3, function() --[[ Line: 560 ]]
            -- upvalues: l_Skull_0 (copy)
            l_Skull_0:Destroy();
        end);
    end);
    v82[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 565 ]]
        -- upvalues: v82 (copy), v79 (copy), v31 (copy), v32 (copy), v21 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), l_Main_0 (ref), v56 (copy)
        for _, v112 in v82 do
            v112:Disconnect();
        end;
        for _, v114 in v79.Final:GetChildren() do
            v114:Emit(2);
        end;
        if not v31 and not v32 then
            return;
        else
            task.defer(function() --[[ Line: 576 ]]
                -- upvalues: v21 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (ref), l_Lighting_0 (ref)
                v21.CreateImpactFrame({
                    Time = 0.1
                });
                local v115 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v115, {
                    Saturation = -0.4, 
                    Contrast = 1
                }):Play();
                local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                l_MenuBlur_4.Size = 0;
                l_MenuBlur_4.Enabled = true;
                local v117 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_4, v117, {
                    Size = 20
                }):Play();
                local v118 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v118, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                task.wait(0.5);
                local v119 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v119, {
                    Saturation = 0, 
                    Contrast = 0
                }):Play();
            end);
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.3, 
                Fade = 1.5
            });
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v56, {
                ImageTransparency = 1
            }):Play();
            return;
        end;
    end);
    if v31 or v32 then
        local v120 = l_Assets_0.Camera:Clone();
        v120.Name = l_Character_0.Name .. "Camera";
        v120.Parent = l_Workspace_0.Debris;
        local v121 = 0;
        do
            local l_v121_0 = v121;
            local function v123() --[[ Line: 619 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v121_0 (ref), v120 (copy), l_Character_0 (copy)
                if os.time() - l_v121_0 < 0.5 then
                    return;
                else
                    l_v121_0 = os.time();
                    v120:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v123();
            local v124 = {
                Animator = v120.AnimationController.Animator, 
                AnimId = v27.Animations.Camera
            };
            local _ = l_AnimHelper_0:CreateAnim(v124);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 637 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v120 (copy), v123 (copy)
                l_CurrentCamera_0.CFrame = v120.Head.CFrame;
                v123();
            end);
            task.delay(10.166666666666666, function() --[[ Line: 642 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(9.666666666666666);
            l_TweenService_0:Create(l_Main_0.White, v57, {
                BackgroundTransparency = 0
            }):Play();
            task.wait(0.3333333333333333);
            if l_l_AnimHelper_0_Anim_1 then
                l_l_AnimHelper_0_Anim_1:Stop(0.1);
            end;
            l_l_AnimHelper_0_Anim_0:Stop(0.1);
            l_Victim_0:SetPrimaryPartCFrame(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5));
            if v80 then
                v80:Destroy();
            end;
            task.wait(0.3333333333333333);
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_CurrentCamera_0.FieldOfView = 70;
            l_CameraMode_0.Value = "";
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v56, {
                ImageTransparency = 1
            }):Play();
            local v127 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v127, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v120:Destroy();
        end;
    end;
    for v128, v129 in v76 do
        v128.CollisionGroup = v129;
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v27;