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
local l_BubbleModule_0 = require(l_ReplicatedStorage_0:WaitForChild("BubbleModule"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local l_Parent_0 = script.Parent.Parent;
local v21 = require(l_Parent_0);
local v22 = Random.new();
local function _(v23, v24, v25) --[[ Line: 32 ]] --[[ Name: Lerp ]]
    return v23 + (v24 - v23) * v25;
end;
local v27 = {
    Animations = {
        Character = 16042303622, 
        Victim = 16042735222, 
        Camera = 16042356517
    }
};
v27.Use = function(v28) --[[ Line: 42 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v21 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_TweenService_0 (copy), v27 (copy), l_AnimHelper_0 (copy), l_BubbleModule_0 (copy), v22 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
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
    local v47 = {
        Brightness = l_ColorCorrection_0.Brightness, 
        Contrast = l_ColorCorrection_0.Contrast, 
        Saturation = l_ColorCorrection_0.Saturation
    };
    if v31 or v32 then
        task.delay(0, function() --[[ Line: 108 ]]
            -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_TweenService_0 (ref)
            local v48 = l_SoundHelper_0:PlaySound({
                Name = "ChargeUltSong", 
                Parent = l_Workspace_0.Debris
            });
            local l_Volume_0 = v48.Volume;
            v48.Volume = 0;
            l_TweenService_0:Create(v48, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Volume = l_Volume_0
            }):Play();
        end);
    end;
    task.wait(0.5);
    local v50 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v51 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v31 or v32 then
        l_TweenService_0:Create(l_Main_0.White, v51, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v51, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v50, {
            ImageTransparency = 0.5
        }):Play();
        task.delay(1, function() --[[ Line: 130 ]]
            -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v51 (copy)
            l_TweenService_0:Create(l_Lighting_0, v51, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
        end);
    end;
    local v52 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v31 or v32) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_1 = v52.Volume;
    v52.Volume = 0;
    task.delay(0.41, function() --[[ Line: 144 ]]
        -- upvalues: v52 (copy), v31 (copy), v32 (copy), l_Volume_1 (copy), v28 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v52:Stop();
        if v31 or v32 then
            v52.Volume = l_Volume_1;
        else
            v52.Volume = l_Volume_1 / 5;
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
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v31 or v32 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 60;
    end;
    local v58 = {
        Animator = v34, 
        AnimId = v27.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v59 = {
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
    l_AnimHelper_0:CreateAnim(v58);
    l_AnimHelper_0:CreateAnim(v59);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v58);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v59);
    l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
    l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
    task.delay(0, function() --[[ Line: 215 ]]
        -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy)
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
    end);
    local v62 = script.Effects:Clone();
    v62.Parent = l_Workspace_0.Debris;
    v62.CFrame = l_Victim_0.PrimaryPart.CFrame;
    task.delay(10, function() --[[ Line: 225 ]]
        -- upvalues: v62 (copy)
        v62:Destroy();
    end);
    task.delay(0, function() --[[ Line: 229 ]]
        -- upvalues: v21 (ref), l_Character_0 (copy)
        v21.AttackTrail({
            Character = l_Character_0, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Basic", 
                TargetPart = "LeftHand", 
                DelayTime = 0, 
                HoldTime = 1.5, 
                TimeScale = 0.5
            }
        });
    end);
    local v77 = {
        [1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("First"):Connect(function() --[[ Line: 245 ]]
            -- upvalues: l_Workspace_0 (ref), l_Character_0 (copy), v31 (copy), v32 (copy), l_ColorCorrection_0 (copy), l_BubbleModule_0 (ref), l_Victim_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref)
            local v63 = script.Attack:Clone();
            v63.Parent = l_Workspace_0.Debris;
            v63.CFrame = l_Character_0.RightHand.CFrame;
            for _, v65 in v63:GetDescendants() do
                if v65:IsA("ParticleEmitter") then
                    v65:Emit(v65:GetAttribute("EmitCount"));
                end;
            end;
            task.delay(6, function() --[[ Line: 256 ]]
                -- upvalues: v63 (copy)
                v63:Destroy();
            end);
            if not v31 and not v32 then
                return;
            else
                l_ColorCorrection_0.Saturation = 0.3;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(10, 10, 10, 0), 0.3);
                local v66 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v66, {
                    Saturation = -0.4, 
                    Contrast = 0.2
                }):Play();
                local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                l_MenuBlur_0.Size = 0;
                l_MenuBlur_0.Enabled = true;
                local v68 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_0, v68, {
                    Size = 16
                }):Play();
                local v69 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v69, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.1
                }):Play();
                v21.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.2, 
                    Fade = 0.3
                });
                return;
            end;
        end), 
        [2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Second"):Connect(function() --[[ Line: 289 ]]
            -- upvalues: l_Workspace_0 (ref), l_Victim_0 (copy), v31 (copy), v32 (copy), l_ColorCorrection_0 (copy), l_BubbleModule_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref)
            local v70 = script.Explosion:Clone();
            v70.Parent = l_Workspace_0.Debris;
            v70.CFrame = l_Victim_0.Head.CFrame;
            for _, v72 in v70:GetDescendants() do
                if v72:IsA("ParticleEmitter") then
                    v72.TimeScale = 0.5;
                    v72:Emit(v72:GetAttribute("EmitCount"));
                end;
            end;
            task.delay(6, function() --[[ Line: 301 ]]
                -- upvalues: v70 (copy)
                v70:Destroy();
            end);
            if not v31 and not v32 then
                return;
            else
                l_ColorCorrection_0.Saturation = 0.4;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(10, 10, 10, 0), 0.3);
                local v73 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v73, {
                    Saturation = -0.4, 
                    Contrast = 0.2
                }):Play();
                local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                l_MenuBlur_1.Size = 0;
                l_MenuBlur_1.Enabled = true;
                local v75 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_1, v75, {
                    Size = 20
                }):Play();
                local v76 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v76, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.1
                }):Play();
                task.defer(function() --[[ Line: 326 ]]
                    -- upvalues: v21 (ref)
                    v21.CreateImpactFrame({
                        Time = 0.08
                    });
                end);
                v21.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.6, 
                    Fade = 0.3
                });
                return;
            end;
        end)
    };
    local function v87(v78, v79) --[[ Line: 339 ]] --[[ Name: HitMain ]]
        -- upvalues: l_Workspace_0 (ref), v31 (copy), v32 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref)
        local v80 = script.HitMain:Clone();
        v80.Parent = l_Workspace_0.Debris;
        v80.CFrame = v78 * CFrame.new(1.5707963267948966, 0, 0);
        for _, v82 in v80:GetDescendants() do
            if v82:IsA("ParticleEmitter") then
                v82:Emit(v82:GetAttribute("EmitCount"));
            end;
        end;
        task.delay(6, function() --[[ Line: 349 ]]
            -- upvalues: v80 (copy)
            v80:Destroy();
        end);
        if not v31 and not v32 then
            return;
        else
            if not v79 then
                l_ColorCorrection_0.Saturation = 0.2;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v83 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v83, {
                    Saturation = -0.2, 
                    Contrast = 0.1
                }):Play();
                local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                l_MenuBlur_2.Size = 0;
                l_MenuBlur_2.Enabled = true;
                local v85 = TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_2, v85, {
                    Size = 16
                }):Play();
                local v86 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v86, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.1
                }):Play();
                v21.CameraShake({
                    Preset = "MedHit", 
                    WaitTime = 0.1, 
                    Fade = 0.1
                });
            end;
            return;
        end;
    end;
    v77[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Third"):Connect(function() --[[ Line: 381 ]]
        -- upvalues: l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref)
        task.defer(function() --[[ Line: 382 ]]
            -- upvalues: l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref)
            l_ColorCorrection_0.Saturation = 0.2;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v88 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v88, {
                Saturation = -0.2, 
                Contrast = 0.1
            }):Play();
            local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
            l_MenuBlur_3.Size = 0;
            l_MenuBlur_3.Enabled = true;
            local v90 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_3, v90, {
                Size = 20
            }):Play();
            local v91 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v91, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.1
            }):Play();
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.1, 
                Fade = 0.1
            });
        end);
    end);
    v77[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Left"):Connect(function() --[[ Line: 410 ]]
        -- upvalues: v87 (copy), l_Victim_0 (copy)
        v87(l_Victim_0.UpperTorso.CFrame * CFrame.new(-0.7, 0, -0.7));
    end);
    v77[5] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Right"):Connect(function() --[[ Line: 414 ]]
        -- upvalues: v87 (copy), l_Victim_0 (copy)
        v87(l_Victim_0.UpperTorso.CFrame * CFrame.new(0.9, 0, -0.6));
    end);
    v77[6] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Small"):Connect(function() --[[ Line: 418 ]]
        -- upvalues: v87 (copy), l_Character_0 (copy), v22 (ref)
        v87(l_Character_0.UpperTorso.CFrame * CFrame.new(-0.05, 1.7, -2.1) * CFrame.new(v22:NextNumber(-0.1, 0.1), v22:NextNumber(-0.15, 0.15), v22:NextNumber(-0.1, 0.1)));
    end);
    v77[7] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 422 ]]
        -- upvalues: v77 (copy), v62 (copy), v31 (copy), v32 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v21 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        for _, v93 in v77 do
            v93:Disconnect();
        end;
        for _, v95 in v62.Final:GetChildren() do
            v95:Emit(3);
        end;
        if not v31 and not v32 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 55
            }):Play();
            task.defer(function() --[[ Line: 435 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.08
                });
            end);
            l_ColorCorrection_0.Saturation = 0.3;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v96 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v96, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
            l_MenuBlur_4.Size = 0;
            l_MenuBlur_4.Enabled = true;
            local v98 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_4, v98, {
                Size = 20
            }):Play();
            local v99 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v99, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.HUDShake({
                Scale = 30, 
                Damper = 0.35
            });
            v21.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.3, 
                Fade = 0.5
            });
            return;
        end;
    end);
    if v31 or v32 then
        local v100 = l_Assets_0.Camera:Clone();
        v100.Name = l_Character_0.Name .. "Camera";
        v100.Parent = l_Workspace_0.Debris;
        local v101 = 0;
        do
            local l_v101_0 = v101;
            local function v103() --[[ Line: 476 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v101_0 (ref), v100 (copy), l_Character_0 (copy)
                if os.time() - l_v101_0 < 0.5 then
                    return;
                else
                    l_v101_0 = os.time();
                    v100:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v103();
            local v104 = {
                Animator = v100.AnimationController.Animator, 
                AnimId = v27.Animations.Camera
            };
            local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v104);
            l_l_AnimHelper_0_Anim_2:AdjustSpeed(1);
            task.delay(0, function() --[[ Line: 495 ]]
                -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy)
                l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
                l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
            end);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 500 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v100 (copy), v103 (copy)
                l_CurrentCamera_0.CFrame = v100.Head.CFrame;
                v103();
            end);
            task.delay(6.666666666666667, function() --[[ Line: 505 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(6.333333333333333);
            l_l_AnimHelper_0_Anim_2:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.01);
            task.wait(0.16666666666666666);
            l_TweenService_0:Create(l_Main_0.White, v51, {
                BackgroundTransparency = 0
            }):Play();
            task.wait(0.3333333333333333);
            l_ColorCorrection_0.Brightness = v47.Brightness;
            l_ColorCorrection_0.Contrast = v47.Contrast;
            l_ColorCorrection_0.Saturation = v47.Saturation;
            l_l_AnimHelper_0_Anim_2:Stop(0.1);
            if l_l_AnimHelper_0_Anim_1 then
                l_l_AnimHelper_0_Anim_1:Stop(0.1);
            end;
            l_l_AnimHelper_0_Anim_0:Stop(0.1);
            task.wait(0.3333333333333333);
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v50, {
                ImageTransparency = 1
            }):Play();
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_CameraMode_0.Value = "";
            for _, v108 in v77 do
                v108:Disconnect();
            end;
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v50, {
                ImageTransparency = 1
            }):Play();
            local v109 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v109, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 1, 
                Fade = 1
            });
            v100:Destroy();
        end;
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v27;