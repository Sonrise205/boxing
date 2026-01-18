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
local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
local _ = require(l_Modules_0:WaitForChild("Styles"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("Bezier"));
local _ = require(l_Modules_0:WaitForChild("RayHelper"));
local l_Assets_0 = l_ReplicatedStorage_0:WaitForChild("Assets");
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
local v17 = require(l_Modules_0.Cutscene.Utilities);
local v18 = require(l_Modules_0.Cutscene.Cutscene);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local l_Parent_0 = script.Parent.Parent;
local v23 = require(l_Parent_0);
local _ = Random.new();
local function _(v25, v26, v27) --[[ Line: 33 ]] --[[ Name: Lerp ]]
    return v25 + (v26 - v25) * v27;
end;
local v29 = {
    Animations = {
        Character = 13863241980, 
        Victim = 13863260227, 
        Camera = 13863301078
    }
};
v29.Use = function(v30) --[[ Line: 43 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v23 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), v17 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_TweenService_0 (copy), v29 (copy), l_AnimHelper_0 (copy), l_EffectHelper_0 (copy), v18 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
    local l_Character_0 = v30.Character;
    local l_Victim_0 = v30.Victim;
    local v33 = l_LocalPlayer_0.Character == l_Character_0;
    local v34 = l_LocalPlayer_0.Character == l_Victim_0;
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v36 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v38 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    for _, v40 in (v36:GetPlayingAnimationTracks()) do
        if v40.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_0 = v40.Speed;
            v40:AdjustSpeed(l_Speed_0 / 4);
            task.delay(2, function() --[[ Line: 65 ]]
                -- upvalues: v40 (copy), l_Speed_0 (copy)
                v40:AdjustSpeed(l_Speed_0);
            end);
        end;
    end;
    for _, v43 in (v38:GetPlayingAnimationTracks()) do
        if v43.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_1 = v43.Speed;
            v43:AdjustSpeed(l_Speed_1 / 4);
            task.delay(2, function() --[[ Line: 77 ]]
                -- upvalues: v43 (copy), l_Speed_1 (copy)
                v43:AdjustSpeed(l_Speed_1);
            end);
        end;
    end;
    task.defer(function() --[[ Line: 82 ]]
        -- upvalues: v33 (copy), v34 (copy), v23 (ref), l_Main_0 (ref)
        if v33 or v34 then
            v23.StatusFrame(v34, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v45 = l_Parent_0.UltimateStart:Clone();
    v45.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v45.Parent = l_Workspace_0.Debris;
    task.delay(20, function() --[[ Line: 92 ]]
        -- upvalues: v45 (copy)
        if v45 then
            v45:Destroy();
        end;
    end);
    for _, v47 in v45.Particle:GetChildren() do
        v47.Enabled = false;
    end;
    v17.Emit(v45.Particle);
    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
    local v49 = l_SoundHelper_0:PlaySound({
        Name = "TakamuraSFX", 
        Parent = l_Character_0
    });
    v49.Volume = 0;
    task.delay(1.29, function() --[[ Line: 111 ]]
        -- upvalues: v49 (copy), v33 (copy), v34 (copy)
        v49:Stop();
        if v33 or v34 then
            v49.Volume = 0.35;
        else
            v49.Volume = 0.05;
        end;
        v49:Play();
    end);
    if v33 or v34 then
        task.defer(function() --[[ Line: 124 ]]
            -- upvalues: l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v23 (ref), v45 (copy)
            l_ColorCorrection_0.Saturation = 0;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v50 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v50, {
                Saturation = -0.7, 
                Contrast = 0.5
            }):Play();
            local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
            l_MenuBlur_0.Size = 0;
            l_MenuBlur_0.Enabled = true;
            local v52 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_0, v52, {
                Size = 10
            }):Play();
            local v53 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v53, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v23.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v23.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.5, 
                Fade = 0.5
            });
            task.wait(5);
            v45:Destroy();
        end);
    end;
    local v54 = nil;
    if v33 or v34 then
        task.delay(0.6, function() --[[ Line: 161 ]]
            -- upvalues: v54 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref)
            v54 = l_SoundHelper_0:PlaySound({
                Name = "TakamuraUltSong", 
                Parent = l_Workspace_0.Debris, 
                Volume = 0.25
            });
        end);
    end;
    task.wait(0.5);
    local v55 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v56 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v33 or v34 then
        l_TweenService_0:Create(l_Main_0.White, v56, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v56, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v55, {
            ImageTransparency = 0.5
        }):Play();
    end;
    task.wait(0.5);
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v33 or v34 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 60;
    end;
    local v59 = {
        Animator = v36, 
        AnimId = v29.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v60 = {
        Animator = v38, 
        AnimId = v29.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    v23.TeleportModel({
        Character = v30.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame * v30.Offset, 
        TeleportId = v30.TeleportId
    });
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v59);
    l_AnimHelper_0:CreateAnim(v60);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v59);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v60);
    local l_ClockTime_0 = l_Lighting_0.ClockTime;
    local v64 = script.Effects:Clone();
    v64.Parent = l_Workspace_0.Debris;
    v64.CFrame = l_Victim_0.PrimaryPart.CFrame;
    task.delay(20, function() --[[ Line: 228 ]]
        -- upvalues: v64 (copy)
        v64:Destroy();
    end);
    local v65 = {};
    local l_Aura_0 = script.Aura;
    task.delay(3, function() --[[ Line: 235 ]]
        -- upvalues: l_Character_0 (copy), l_Aura_0 (copy), v65 (copy), v23 (ref)
        for _, v68 in l_Character_0:GetChildren() do
            for _, v70 in l_Aura_0:GetChildren() do
                if v70:IsA("ParticleEmitter") then
                    local v71 = v70:Clone();
                    v71.Parent = v68;
                    table.insert(v65, v71);
                end;
            end;
        end;
        task.defer(function() --[[ Line: 246 ]]
            -- upvalues: v23 (ref), l_Character_0 (ref)
            v23.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "Takamura", 
                    TargetPart = "RightHand", 
                    DelayTime = 0, 
                    HoldTime = 0.6666666666666666, 
                    TimeScale = 1
                }
            });
        end);
        task.wait(7.916666666666667);
        for _, v73 in v65 do
            v73.Enabled = false;
        end;
        task.wait(2);
        for _, v75 in v65 do
            v75:Destroy();
        end;
    end);
    local v76 = nil;
    local v77 = nil;
    local v78 = {};
    local v79 = {};
    local v80 = {
        "Live", 
        "Welds", 
        v76
    };
    if v33 or v34 then
        local v81, v82 = l_EffectHelper_0.GetPartsToHide(l_Character_0, v80);
        v78 = v81;
        v79 = v82;
        for _, v84 in v78 do
            l_TweenService_0:Create(v84, TweenInfo.new(1), {
                LocalTransparencyModifier = 1
            }):Play();
        end;
        for _, v86 in v79 do
            v86.Enabled = false;
        end;
        v76 = script.BlackBox:Clone();
        v76.Parent = workspace.Debris;
        v76:PivotTo(l_Character_0.HumanoidRootPart.CFrame + Vector3.new(0, 0.009999999776482582, 0, 0));
        for _, v88 in v76:GetChildren() do
            if v88.Name == "Bottom" then
                l_TweenService_0:Create(v88, TweenInfo.new(1), {
                    Transparency = 0
                }):Play();
            end;
        end;
        task.delay(0.16666666666666666, function() --[[ Line: 300 ]]
            -- upvalues: l_TweenService_0 (ref), l_Main_0 (ref), l_Lighting_0 (ref), l_Workspace_0 (ref), v77 (ref), l_SoundHelper_0 (ref), v23 (ref), v17 (ref), v33 (copy), v34 (copy), l_CameraMode_0 (copy), l_CurrentCamera_0 (copy), v78 (ref), v79 (ref), l_ColorCorrection_0 (copy), l_ClockTime_0 (copy), v76 (ref)
            local v89 = TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.In);
            local v90 = TweenInfo.new(0.1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
            l_TweenService_0:Create(l_Main_0.Black, v89, {
                BackgroundTransparency = 0
            }):Play();
            local v91 = script.CameraEffect:Clone();
            task.defer(function() --[[ Line: 307 ]]
                -- upvalues: l_Lighting_0 (ref), v91 (copy), l_Workspace_0 (ref), v77 (ref), l_TweenService_0 (ref), l_Main_0 (ref), v90 (copy), l_SoundHelper_0 (ref), v23 (ref), v17 (ref), v33 (ref), v34 (ref), l_CameraMode_0 (ref), l_CurrentCamera_0 (ref), v78 (ref), v79 (ref), l_ColorCorrection_0 (ref)
                task.wait(1.65);
                l_Lighting_0.ClockTime = 0;
                v91.Parent = l_Workspace_0.Debris;
                v77 = v91.Camera.CFrame;
                l_TweenService_0:Create(l_Main_0.Black, v90, {
                    BackgroundTransparency = 1
                }):Play();
                task.wait(0.25);
                l_SoundHelper_0:PlaySound({
                    Name = "Lightning", 
                    Parent = l_Workspace_0
                });
                l_SoundHelper_0:PlaySound({
                    Name = "Growl", 
                    Parent = l_Workspace_0
                });
                task.wait(0.25);
                v23.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.2, 
                    Fade = 1.5
                });
                v17.Emit(v91.Effect);
                if v33 or v34 then
                    l_CameraMode_0.Value = "Cutscene";
                    l_CurrentCamera_0.FieldOfView = 40;
                    for _, v93 in v78 do
                        v93.LocalTransparencyModifier = 0;
                    end;
                    for _, v95 in v79 do
                        v95.Enabled = true;
                    end;
                end;
                local v96 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v96, {
                    Saturation = -0.2, 
                    Contrast = 0.5
                }):Play();
                local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                l_MenuBlur_1.Size = 0;
                l_MenuBlur_1.Enabled = true;
                local v98 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_1, v98, {
                    Size = 20
                }):Play();
                local v99 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v99, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.2
                }):Play();
                task.wait(0.5);
                l_TweenService_0:Create(l_Lighting_0, v99, {
                    ExposureCompensation = 0.1
                }):Play();
                local v100 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v100, {
                    Saturation = 0, 
                    Contrast = 0
                }):Play();
            end);
            task.wait(2.8333333333333335);
            l_TweenService_0:Create(l_Main_0.Black, v90, {
                BackgroundTransparency = 0
            }):Play();
            task.wait(0.08);
            l_Lighting_0.ClockTime = l_ClockTime_0;
            task.wait(0.08);
            l_CameraMode_0.Value = "Cutscene";
            l_CurrentCamera_0.FieldOfView = 60;
            local v101 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
            v77 = nil;
            l_TweenService_0:Create(l_Main_0.Black, v101, {
                BackgroundTransparency = 1
            }):Play();
            for _, v103 in v76:GetChildren() do
                if v103.Name == "Bottom" then
                    l_TweenService_0:Create(v103, TweenInfo.new(1), {
                        Transparency = 1
                    }):Play();
                end;
            end;
            v91:Destroy();
        end);
    end;
    local v110 = {
        [1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hide"):Connect(function() --[[ Line: 410 ]]
            -- upvalues: v33 (copy), v34 (copy), v18 (ref), l_Victim_0 (copy)
            if v33 or v34 then
                v18.SetTransparency(l_Victim_0, 1);
                task.delay(5, function() --[[ Line: 414 ]]
                    -- upvalues: v18 (ref), l_Victim_0 (ref)
                    v18.SetTransparency(l_Victim_0, 0);
                end);
            end;
        end), 
        [2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Show"):Connect(function() --[[ Line: 420 ]]
            -- upvalues: v33 (copy), v34 (copy), v18 (ref), l_Victim_0 (copy)
            if v33 or v34 then
                v18.SetTransparency(l_Victim_0, 0);
            end;
        end), 
        [3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Start"):Connect(function() --[[ Line: 426 ]]
            -- upvalues: v17 (ref), v64 (copy), l_Victim_0 (copy), v76 (ref), v33 (copy), v34 (copy), v23 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
            v17.Emit(v64.Start);
            local l_Head_0 = v64.Head;
            v64.Parent = l_Victim_0.Head;
            v76:Destroy();
            v17.Emit(l_Head_0);
            if not v33 and not v34 then
                return;
            else
                task.defer(function() --[[ Line: 436 ]]
                    -- upvalues: v23 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (ref), l_Lighting_0 (ref)
                    v23.CreateImpactFrame({
                        Time = 0.06
                    });
                    local v105 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                    l_TweenService_0:Create(l_ColorCorrection_0, v105, {
                        Saturation = -0.4, 
                        Contrast = 1
                    }):Play();
                    local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_2.Size = 0;
                    l_MenuBlur_2.Enabled = true;
                    local v107 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_2, v107, {
                        Size = 20
                    }):Play();
                    local v108 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v108, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                    }):Play();
                    task.wait(0.5);
                    l_TweenService_0:Create(l_Lighting_0, v108, {
                        ExposureCompensation = workspace.Exposure.Value
                    }):Play();
                    local v109 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                    l_TweenService_0:Create(l_ColorCorrection_0, v109, {
                        Saturation = 0, 
                        Contrast = 0
                    }):Play();
                end);
                v23.HUDShake({
                    Scale = 20, 
                    Damper = 0.09999999999999999
                });
                v23.CameraShake({
                    Preset = "HardHitRoll", 
                    WaitTime = 0.8, 
                    Fade = 1
                });
                return;
            end;
        end), 
        [4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Camera"):Connect(function() --[[ Line: 473 ]]
            -- upvalues: v23 (ref)
            v23.CameraShake({
                Preset = "MedHit", 
                WaitTime = 0.05, 
                Fade = 6
            });
        end)
    };
    local v111 = 0;
    v110[5] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hit"):Connect(function() --[[ Line: 482 ]]
        -- upvalues: v64 (copy), v111 (ref), v17 (ref), v23 (ref), l_Character_0 (copy), v33 (copy), v34 (copy), l_CameraMode_0 (copy), l_CurrentCamera_0 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
        local l_Right_0 = v64.Right;
        if v111 % 2 == 0 then
            l_Right_0 = v64.Left;
        end;
        v17.Emit(l_Right_0);
        task.defer(function() --[[ Line: 493 ]]
            -- upvalues: v23 (ref), l_Character_0 (ref)
            v23.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "Takamura", 
                    TargetPart = "RightHand", 
                    DelayTime = 0, 
                    HoldTime = 0.6666666666666666, 
                    TimeScale = 1
                }
            });
        end);
        if not v33 and not v34 then
            return;
        else
            v111 = v111 + 1;
            if v33 or v34 then
                l_CameraMode_0.Value = "Cutscene";
                l_CurrentCamera_0.FieldOfView = 70;
            end;
            l_ColorCorrection_0.Saturation = 0.1;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v113 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v113, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
            l_MenuBlur_3.Size = 0;
            l_MenuBlur_3.Enabled = true;
            local v115 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_3, v115, {
                Size = 20
            }):Play();
            local v116 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v116, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v23.HUDShake({
                Scale = 20, 
                Damper = 0.35
            });
            v23.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.1, 
                Fade = 0.15
            });
            return;
        end;
    end);
    v110[6] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("BodyShot"):Connect(function() --[[ Line: 544 ]]
        -- upvalues: v33 (copy), v34 (copy), l_CameraMode_0 (copy), l_CurrentCamera_0 (copy), v23 (ref), l_Character_0 (copy), v17 (ref), v64 (copy), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        if v33 or v34 then
            l_CameraMode_0.Value = "Cutscene";
            l_CurrentCamera_0.FieldOfView = 65;
        end;
        task.defer(function() --[[ Line: 550 ]]
            -- upvalues: v23 (ref), l_Character_0 (ref)
            v23.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "Takamura", 
                    TargetPart = "LeftHand", 
                    DelayTime = 0, 
                    HoldTime = 0.6666666666666666, 
                    TimeScale = 1
                }
            });
        end);
        v17.Emit(v64.Body2);
        if v33 or v34 then
            task.defer(function() --[[ Line: 568 ]]
                -- upvalues: l_TweenService_0 (ref), l_ColorCorrection_0 (ref), l_Lighting_0 (ref)
                local v117 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v117, {
                    Saturation = -0.4, 
                    Contrast = 1
                }):Play();
                local v118 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v118, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                l_MenuBlur_4.Size = 0;
                l_MenuBlur_4.Enabled = true;
                local v120 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_4, v120, {
                    Size = 20
                }):Play();
                task.wait(0.5);
                local v121 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v121, {
                    Saturation = 0, 
                    Contrast = 0
                }):Play();
            end);
            v23.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            task.defer(function() --[[ Line: 593 ]]
                -- upvalues: v23 (ref)
                v23.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.3, 
                    Fade = 0.5
                });
            end);
        end;
    end);
    v110[7] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 603 ]]
        -- upvalues: v110 (copy), v23 (ref), l_Character_0 (copy), v17 (ref), v64 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v33 (copy), v34 (copy)
        for _, v123 in v110 do
            v123:Disconnect();
        end;
        task.defer(function() --[[ Line: 608 ]]
            -- upvalues: v23 (ref), l_Character_0 (ref)
            v23.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "Takamura", 
                    TargetPart = "RightHand", 
                    DelayTime = 0, 
                    HoldTime = 0.6666666666666666, 
                    TimeScale = 0.5
                }
            });
        end);
        v17.Emit(v64.Final);
        task.defer(function() --[[ Line: 623 ]]
            -- upvalues: l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
            l_ColorCorrection_0.Saturation = 0;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v124 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v124, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local function _(v125, v126, v127) --[[ Line: 632 ]] --[[ Name: createAndDestroyEffect ]]
                local v128 = script.Lighting[v125]:Clone();
                v128.Parent = v126;
                task.wait(v127);
                v128:Destroy();
            end;
            task.spawn(function() --[[ Line: 639 ]]
                -- upvalues: l_Lighting_0 (ref), l_TweenService_0 (ref)
                local v130 = "Impact" .. 1;
                local l_l_Lighting_0_0 = l_Lighting_0;
                local v132 = script.Lighting[v130]:Clone();
                v132.Parent = l_l_Lighting_0_0;
                task.wait(0.05);
                v132:Destroy();
                v130 = "Impact" .. 2;
                l_l_Lighting_0_0 = l_Lighting_0;
                v132 = script.Lighting[v130]:Clone();
                v132.Parent = l_l_Lighting_0_0;
                task.wait(0.05);
                v132:Destroy();
                v130 = Instance.new("BlurEffect");
                v130.Name = "EffectBlur";
                v130.Size = 26;
                v130.Parent = l_Lighting_0;
                l_TweenService_0:Create(v130, TweenInfo.new(1), {
                    Size = 0
                }):Play();
            end);
            local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
            l_MenuBlur_5.Size = 0;
            l_MenuBlur_5.Enabled = true;
            local v134 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_5, v134, {
                Size = 20
            }):Play();
            local v135 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v135, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
        end);
        v23.HUDShake({
            Scale = 20, 
            Damper = 0.09999999999999999
        });
        task.defer(function() --[[ Line: 668 ]]
            -- upvalues: v23 (ref)
            v23.CameraShake({
                Preset = "HardHit", 
                WaitTime = 1.3, 
                Fade = 0.5
            });
        end);
        task.defer(function() --[[ Line: 676 ]]
            -- upvalues: v23 (ref)
            v23.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.4, 
                Fade = 1.4
            });
        end);
        if not v33 and not v34 then
            return;
        else
            task.defer(function() --[[ Line: 685 ]]
                -- upvalues: l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                l_ColorCorrection_0.Saturation = 0;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v136 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v136, {
                    Saturation = -0.4, 
                    Contrast = 0.2
                }):Play();
                local function _(v137, v138, v139) --[[ Line: 694 ]] --[[ Name: createAndDestroyEffect ]]
                    local v140 = script.Lighting[v137]:Clone();
                    v140.Parent = v138;
                    task.wait(v139);
                    v140:Destroy();
                end;
                task.spawn(function() --[[ Line: 701 ]]
                    -- upvalues: l_Lighting_0 (ref), l_TweenService_0 (ref)
                    local v142 = "Impact" .. 1;
                    local l_l_Lighting_0_1 = l_Lighting_0;
                    local v144 = script.Lighting[v142]:Clone();
                    v144.Parent = l_l_Lighting_0_1;
                    task.wait(0.05);
                    v144:Destroy();
                    v142 = "Impact" .. 2;
                    l_l_Lighting_0_1 = l_Lighting_0;
                    v144 = script.Lighting[v142]:Clone();
                    v144.Parent = l_l_Lighting_0_1;
                    task.wait(0.05);
                    v144:Destroy();
                    v142 = Instance.new("BlurEffect");
                    v142.Name = "EffectBlur";
                    v142.Size = 26;
                    v142.Parent = l_Lighting_0;
                    l_TweenService_0:Create(v142, TweenInfo.new(1), {
                        Size = 0
                    }):Play();
                end);
                local l_MenuBlur_6 = l_Lighting_0.MenuBlur;
                l_MenuBlur_6.Size = 0;
                l_MenuBlur_6.Enabled = true;
                local v146 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_6, v146, {
                    Size = 20
                }):Play();
                local v147 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v147, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
            end);
            v23.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            task.defer(function() --[[ Line: 730 ]]
                -- upvalues: v23 (ref)
                v23.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 1.3, 
                    Fade = 0.5
                });
            end);
            task.defer(function() --[[ Line: 738 ]]
                -- upvalues: v23 (ref)
                v23.CameraShake({
                    Preset = "HardHitRoll", 
                    WaitTime = 0.4, 
                    Fade = 1.4
                });
            end);
            return;
        end;
    end);
    if v33 or v34 then
        local v148 = l_Assets_0.Camera:Clone();
        v148.Name = l_Character_0.Name .. "Camera";
        v148.Parent = l_Workspace_0.Debris;
        local v149 = 0;
        do
            local l_v149_0 = v149;
            (function() --[[ Line: 753 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v149_0 (ref), v148 (copy), l_Character_0 (copy)
                if os.time() - l_v149_0 < 0.5 then
                    return;
                else
                    l_v149_0 = os.time();
                    v148:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end)();
            local v151 = {
                Animator = v148.AnimationController.Animator, 
                AnimId = v29.Animations.Camera
            };
            local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v151);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 771 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v77 (ref), v148 (copy)
                l_CurrentCamera_0.CFrame = v77 or v148.Head.CFrame;
            end);
            task.delay(12.333333333333334, function() --[[ Line: 775 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(12.666666666666666);
            l_l_AnimHelper_0_Anim_2:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.01);
            l_TweenService_0:Create(l_Main_0.White, v56, {
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
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v55, {
                ImageTransparency = 1
            }):Play();
            local v154 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v154, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v23.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v148:Destroy();
        end;
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v29;