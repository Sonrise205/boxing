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
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("NumberSequenceTween"));
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
local function _(v23, v24, v25) --[[ Line: 31 ]] --[[ Name: Lerp ]]
    return v23 + (v24 - v23) * v25;
end;
local v27 = {
    Animations = {
        Character = 14000549120, 
        Victim = 14000573433, 
        Camera = 14000612333
    }
};
v27.Use = function(v28) --[[ Line: 41 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Styles_0 (copy), l_Workspace_0 (copy), l_SoundHelper_0 (copy), v21 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), v27 (copy), l_AnimHelper_0 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
    local l_Character_0 = v28.Character;
    local l_Victim_0 = v28.Victim;
    local v31 = l_LocalPlayer_0.Character == l_Character_0;
    local v32 = l_LocalPlayer_0.Character == l_Victim_0;
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v34 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v36 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    local v37 = 0;
    for _, v39 in l_Styles_0[script.Name].UltimateInfo.DamageTimes do
        v37 = v37 + v39[2];
    end;
    local v40 = v37 < l_Workspace_0.States[l_Victim_0.Name].CharacterData.Health.Value;
    for _, v42 in (v34:GetPlayingAnimationTracks()) do
        if v42.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_0 = v42.Speed;
            v42:AdjustSpeed(l_Speed_0 / 4);
            task.delay(2, function() --[[ Line: 71 ]]
                -- upvalues: v42 (copy), l_Speed_0 (copy)
                v42:AdjustSpeed(l_Speed_0);
            end);
        end;
    end;
    for _, v45 in (v36:GetPlayingAnimationTracks()) do
        if v45.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_1 = v45.Speed;
            v45:AdjustSpeed(l_Speed_1 / 4);
            task.delay(2, function() --[[ Line: 83 ]]
                -- upvalues: v45 (copy), l_Speed_1 (copy)
                v45:AdjustSpeed(l_Speed_1);
            end);
        end;
    end;
    local v47 = l_SoundHelper_0:PlaySound({
        Name = "HandsLowSFX", 
        Parent = l_Character_0
    });
    v47.Volume = 0;
    task.delay(0.65, function() --[[ Line: 95 ]]
        -- upvalues: v47 (copy), v31 (copy), v32 (copy), v28 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v47:Stop();
        if v31 or v32 then
            v47.Volume = 0.3;
        else
            v47.Volume = 0.05;
        end;
        v47:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v28.HasVoicelines then
            local v49 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v31 or v32) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v31 and not v32 then
                v49.Volume = v49.Volume / 5;
            end;
        end;
    end);
    task.defer(function() --[[ Line: 120 ]]
        -- upvalues: v31 (copy), v32 (copy), v21 (ref), l_Main_0 (ref)
        if v31 or v32 then
            v21.StatusFrame(v32, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v50 = l_Parent_0.UltimateStart:Clone();
    v50.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v50.Parent = l_Workspace_0.Debris;
    task.delay(20, function() --[[ Line: 130 ]]
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
    if v31 or v32 then
        task.defer(function() --[[ Line: 142 ]]
            -- upvalues: l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v50 (copy)
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
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.5, 
                Fade = 0.5
            });
            task.wait(5);
            v50:Destroy();
        end);
    end;
    if v31 or v32 then
        l_SoundHelper_0:PlaySound({
            Name = "IppoUltSong", 
            Parent = l_Workspace_0.Debris
        });
    end;
    task.wait(0.5);
    local v58 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v59 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v31 or v32 then
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
    task.wait(0.5);
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v31 or v32 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 65;
    end;
    local v62 = {
        Animator = v34, 
        AnimId = v27.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v63 = {
        Animator = v36, 
        AnimId = v27.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    v21.TeleportModel({
        Character = v28.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame * v28.Offset, 
        TeleportId = v28.TeleportId
    });
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v62);
    l_AnimHelper_0:CreateAnim(v63);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v62);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v63);
    local v66 = script.Effects:Clone();
    v66.Parent = l_Workspace_0.Debris;
    v66.CFrame = l_Victim_0.PrimaryPart.CFrame;
    task.delay(10, function() --[[ Line: 239 ]]
        -- upvalues: v66 (copy)
        v66:Destroy();
    end);
    task.delay(1.8333333333333333, function() --[[ Line: 243 ]]
        -- upvalues: v21 (ref), l_Character_0 (copy)
        v21.AttackTrail({
            Character = l_Character_0, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Saeki", 
                TargetPart = "RightHand", 
                DelayTime = 0, 
                HoldTime = 2.6666666666666665, 
                TimeScale = 1
            }
        });
    end);
    local v67 = {};
    local function v75(v68, v69) --[[ Line: 259 ]] --[[ Name: SetTransparency ]]
        -- upvalues: l_Workspace_0 (ref)
        for _, v71 in v68:GetDescendants() do
            if v71.Name == "UnusualParticle" then
                v71.Enabled = v69 == 0;
            end;
            if (v71:IsA("BasePart") or v71:IsA("Decal")) and v71.LocalTransparencyModifier < 1000 then
                v71.LocalTransparencyModifier = v69;
            end;
        end;
        local l_FirstChild_0 = l_Workspace_0.Welds:FindFirstChild(v68.Name);
        if l_FirstChild_0 then
            for _, v74 in l_FirstChild_0:GetDescendants() do
                if v74.Name == "UnusualParticle" then
                    v74.Enabled = v69 == 0;
                end;
                if (v74:IsA("BasePart") or v74:IsA("Decal")) and v74.LocalTransparencyModifier < 1000 then
                    v74.LocalTransparencyModifier = v69;
                end;
            end;
        end;
    end;
    if v31 or v32 then
        l_CurrentCamera_0.FieldOfView = 40;
        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            FieldOfView = 65
        }):Play();
    end;
    v67[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hide"):Connect(function() --[[ Line: 282 ]]
        -- upvalues: v31 (copy), v32 (copy), v75 (copy), l_Victim_0 (copy), l_Character_0 (copy)
        if v31 or v32 then
            v75(l_Victim_0, 1);
            task.delay(5, function() --[[ Line: 286 ]]
                -- upvalues: v75 (ref), l_Character_0 (ref)
                v75(l_Character_0, 0);
            end);
        end;
    end);
    v67[2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Show"):Connect(function() --[[ Line: 292 ]]
        -- upvalues: v31 (copy), v32 (copy), v75 (copy), l_Victim_0 (copy)
        if v31 or v32 then
            v75(l_Victim_0, 0);
        end;
        if not v31 and not v32 then
            return;
        else
            return;
        end;
    end);
    local v76 = 1;
    v67[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hit"):Connect(function() --[[ Line: 302 ]]
        -- upvalues: v66 (copy), v76 (ref), v21 (ref), l_Character_0 (copy), v31 (copy), v32 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
        local l_Left_0 = v66.Left;
        local v78 = "LeftHand";
        if v76 <= 3 then
            l_Left_0 = v66.Small;
        elseif (v76 + 1) % 2 == 0 then
            l_Left_0 = v66.Right;
            v78 = "RightHand";
        end;
        for _, v80 in l_Left_0:GetChildren() do
            v80:Emit(1);
        end;
        v76 = v76 + 1;
        task.defer(function() --[[ Line: 321 ]]
            -- upvalues: v21 (ref), l_Character_0 (ref), v78 (ref)
            v21.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "Saeki", 
                    TargetPart = v78, 
                    DelayTime = 0, 
                    HoldTime = 0.1, 
                    TimeScale = 1
                }
            });
        end);
        if not v31 and not v32 then
            return;
        else
            l_ColorCorrection_0.Saturation = 0.1;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v81 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v81, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v83 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v83, {
                Size = 20
            }):Play();
            local v84 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v84, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.35
            });
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.1, 
                Fade = 0.2
            });
            return;
        end;
    end);
    v67[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hook"):Connect(function() --[[ Line: 366 ]]
        -- upvalues: v66 (copy), v21 (ref), l_Character_0 (copy), v31 (copy), v32 (copy), l_Main_0 (ref), l_TweenService_0 (ref), v40 (copy), l_LocalPlayer_0 (ref), l_Styles_0 (ref), l_Lighting_0 (ref), l_CurrentCamera_0 (copy), l_ColorCorrection_0 (copy)
        for _, v86 in v66.Hook:GetChildren() do
            v86:Emit(1);
        end;
        task.defer(function() --[[ Line: 374 ]]
            -- upvalues: v21 (ref), l_Character_0 (ref)
            v21.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "Saeki", 
                    TargetPart = "LeftHand", 
                    DelayTime = 0, 
                    HoldTime = 0.25, 
                    TimeScale = 1
                }
            });
        end);
        if not v31 and not v32 then
            return;
        else
            l_Main_0.Ultimates.Saeki.ImageTransparency = 1;
            l_Main_0.Ultimates.Saeki.Visible = true;
            l_TweenService_0:Create(l_Main_0.Ultimates.Saeki, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ImageTransparency = 0
            }):Play();
            if v40 then
                task.defer(function() --[[ Line: 395 ]]
                    -- upvalues: v32 (ref), l_LocalPlayer_0 (ref), l_Styles_0 (ref), v21 (ref), l_Main_0 (ref)
                    if v32 then
                        l_LocalPlayer_0.Character:SetAttribute("ClientEyeDamage", 100);
                    end;
                    local v87 = l_Styles_0.Saeki.UltimateInfo.EyeDamageTime + 5.5;
                    v21.StatusFrame(true, l_Main_0.StatusFrame.BlindedFrame, {
                        SlowProgressTime = v87 * 0.6923076923076923, 
                        ProgressTime = v87
                    });
                end);
            end;
            task.delay(3.55, function() --[[ Line: 409 ]]
                -- upvalues: v21 (ref), l_Character_0 (ref), l_TweenService_0 (ref), l_Main_0 (ref)
                task.defer(function() --[[ Line: 410 ]]
                    -- upvalues: v21 (ref), l_Character_0 (ref)
                    v21.AttackTrail({
                        Character = l_Character_0, 
                        TrailInfo = {
                            EffectName = "AttackTrail", 
                            TrailName = "Saeki", 
                            TargetPart = "RightHand", 
                            DelayTime = 0, 
                            HoldTime = 0.25, 
                            TimeScale = 1
                        }
                    });
                end);
                l_TweenService_0:Create(l_Main_0.Ultimates.Saeki, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ImageTransparency = 1
                }):Play();
                task.delay(2, function() --[[ Line: 425 ]]
                    -- upvalues: l_Main_0 (ref)
                    l_Main_0.Ultimates.Saeki.Visible = false;
                end);
            end);
            task.delay(1, function() --[[ Line: 430 ]]
                -- upvalues: l_Lighting_0 (ref), l_TweenService_0 (ref), l_Character_0 (ref), v21 (ref), l_CurrentCamera_0 (ref)
                local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                l_MenuBlur_2.Size = 0;
                l_MenuBlur_2.Enabled = true;
                local v89 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_2, v89, {
                    Size = 45
                }):Play();
                local v90 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v90, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                task.defer(function() --[[ Line: 442 ]]
                    -- upvalues: l_Character_0 (ref), v21 (ref)
                    local v91 = {
                        Step = 1, 
                        MaxTime = 1.6666666666666667, 
                        DeleteDelay = 0.3, 
                        AddTransparency = 0.97, 
                        Character = l_Character_0
                    };
                    v21.AfterimageEffect(v91);
                end);
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    FieldOfView = 40
                }):Play();
            end);
            v21.CreateImpactFrame({
                Time = 0.1
            });
            l_ColorCorrection_0.Saturation = 0.1;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v92 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v92, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
            l_MenuBlur_3.Size = 0;
            l_MenuBlur_3.Enabled = true;
            local v94 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_3, v94, {
                Size = 20
            }):Play();
            local v95 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v95, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.35
            });
            v21.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.1, 
                Fade = 0.2
            });
            return;
        end;
    end);
    v67[5] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 491 ]]
        -- upvalues: v67 (copy), v66 (copy), v31 (copy), v32 (copy), l_CurrentCamera_0 (copy), l_TweenService_0 (ref), v21 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), l_Main_0 (ref), v58 (copy)
        for _, v97 in v67 do
            v97:Disconnect();
        end;
        for _, v99 in v66.Final:GetChildren() do
            v99:Emit(6);
        end;
        if not v31 and not v32 then
            return;
        else
            task.defer(function() --[[ Line: 503 ]]
                -- upvalues: l_CurrentCamera_0 (ref), l_TweenService_0 (ref), v21 (ref), l_ColorCorrection_0 (ref), l_Lighting_0 (ref)
                l_CurrentCamera_0.FieldOfView = 40;
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FieldOfView = 70
                }):Play();
                v21.CreateImpactFrame({
                    Time = 0.1
                });
                local v100 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v100, {
                    Saturation = -0.4, 
                    Contrast = 1
                }):Play();
                local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                l_MenuBlur_4.Size = 0;
                l_MenuBlur_4.Enabled = true;
                local v102 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_4, v102, {
                    Size = 20
                }):Play();
                local v103 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v103, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                task.wait(0.5);
                local v104 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v104, {
                    Saturation = 0, 
                    Contrast = 0
                }):Play();
            end);
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v21.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 1.6, 
                Fade = 1.5
            });
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v58, {
                ImageTransparency = 1
            }):Play();
            return;
        end;
    end);
    if v31 or v32 then
        local v105 = l_Assets_0.Camera:Clone();
        v105.Name = l_Character_0.Name .. "Camera";
        v105.Parent = l_Workspace_0.Debris;
        local v106 = 0;
        do
            local l_v106_0 = v106;
            local function v108() --[[ Line: 549 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v106_0 (ref), v105 (copy), l_Character_0 (copy)
                if os.time() - l_v106_0 < 0.5 then
                    return;
                else
                    l_v106_0 = os.time();
                    v105:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v108();
            local v109 = {
                Animator = v105.AnimationController.Animator, 
                AnimId = v27.Animations.Camera
            };
            local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v109);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 567 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v105 (copy), v108 (copy)
                l_CurrentCamera_0.CFrame = v105.Head.CFrame;
                v108();
            end);
            task.delay(615, function() --[[ Line: 572 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(9.916666666666666);
            l_l_AnimHelper_0_Anim_2:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.01);
            l_TweenService_0:Create(l_Main_0.White, v59, {
                BackgroundTransparency = 0
            }):Play();
            task.wait(0.3333333333333333);
            l_l_AnimHelper_0_Anim_2:Stop(0.1);
            if l_l_AnimHelper_0_Anim_1 then
                l_l_AnimHelper_0_Anim_1:Stop(0.1);
            end;
            l_l_AnimHelper_0_Anim_0:Stop(0.1);
            task.wait(0.3333333333333333);
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_CameraMode_0.Value = "";
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v58, {
                ImageTransparency = 1
            }):Play();
            local v112 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v112, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v105:Destroy();
        end;
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v27;