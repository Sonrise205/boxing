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
        Character = 13815799083, 
        Victim = 13815810035, 
        Camera = 13815819808
    }
};
v26.Use = function(v27) --[[ Line: 40 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v20 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), v26 (copy), l_AnimHelper_0 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
    local l_Character_0 = v27.Character;
    local l_Victim_0 = v27.Victim;
    local v30 = l_LocalPlayer_0.Character == l_Character_0;
    local v31 = l_LocalPlayer_0.Character == l_Victim_0;
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v33 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v35 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    for _, v37 in (v33:GetPlayingAnimationTracks()) do
        if v37.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_0 = v37.Speed;
            v37:AdjustSpeed(l_Speed_0 / 4);
            task.delay(2, function() --[[ Line: 62 ]]
                -- upvalues: v37 (copy), l_Speed_0 (copy)
                v37:AdjustSpeed(l_Speed_0);
            end);
        end;
    end;
    for _, v40 in (v35:GetPlayingAnimationTracks()) do
        if v40.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_1 = v40.Speed;
            v40:AdjustSpeed(l_Speed_1 / 4);
            task.delay(2, function() --[[ Line: 74 ]]
                -- upvalues: v40 (copy), l_Speed_1 (copy)
                v40:AdjustSpeed(l_Speed_1);
            end);
        end;
    end;
    task.defer(function() --[[ Line: 79 ]]
        -- upvalues: v30 (copy), v31 (copy), v20 (ref), l_Main_0 (ref)
        if v30 or v31 then
            v20.StatusFrame(v31, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v42 = l_Parent_0.UltimateStart:Clone();
    v42.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v42.Parent = l_Workspace_0.Debris;
    task.delay(20, function() --[[ Line: 89 ]]
        -- upvalues: v42 (copy)
        if v42 then
            v42:Destroy();
        end;
    end);
    for _, v44 in v42.Particle:GetChildren() do
        v44.Enabled = false;
        v44:Emit(v44:GetAttribute("EmitCount"));
    end;
    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
    if v30 or v31 then
        task.defer(function() --[[ Line: 101 ]]
            -- upvalues: l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v20 (ref), v42 (copy)
            l_ColorCorrection_0.Saturation = 0;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v46 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v46, {
                Saturation = -0.7, 
                Contrast = 0.5
            }):Play();
            local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
            l_MenuBlur_0.Size = 0;
            l_MenuBlur_0.Enabled = true;
            local v48 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_0, v48, {
                Size = 10
            }):Play();
            local v49 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v49, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.delay(0.4, function() --[[ Line: 119 ]]
                -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v49 (copy)
                l_TweenService_0:Create(l_Lighting_0, v49, {
                    ExposureCompensation = workspace.Exposure.Value
                }):Play();
            end);
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
            v42:Destroy();
        end);
    end;
    local v50 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v51 = TweenInfo.new(0.1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v52 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    local l_Brightness_0 = l_Lighting_0.Brightness;
    local l_TimeOfDay_0 = l_Lighting_0.TimeOfDay;
    if v30 or v31 then
        l_TweenService_0:Create(l_Main_0.White, v52, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v52, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v50, {
            ImageTransparency = 0.5
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v51, {
            Brightness = 0, 
            ClockTime = 0
        }):Play();
    end;
    local v55 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v30 or v31) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v55.Volume;
    v55.Volume = 0;
    task.delay(0.3, function() --[[ Line: 162 ]]
        -- upvalues: v55 (copy), v30 (copy), v31 (copy), l_Volume_0 (copy), v27 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v55:Stop();
        if v30 or v31 then
            v55.Volume = l_Volume_0;
        else
            v55.Volume = l_Volume_0 / 5;
        end;
        v55:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v27.HasVoicelines then
            local v58 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v30 or v31) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v30 and not v31 then
                v58.Volume = v58.Volume / 5;
            end;
        end;
    end);
    task.wait(0.5);
    task.delay(1.5, function() --[[ Line: 190 ]]
        -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (copy)
        l_SoundHelper_0:PlaySound({
            Name = "Gasp", 
            Parent = l_Character_0.PrimaryPart
        });
    end);
    l_SoundHelper_0:PlaySound({
        Name = "AokiUlt", 
        Parent = l_Character_0.PrimaryPart
    });
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v30 or v31 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 55;
    end;
    local v61 = {
        Animator = v33, 
        AnimId = v26.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v62 = {
        Animator = v35, 
        AnimId = v26.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    v20.TeleportModel({
        Character = v27.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame * v27.Offset, 
        TeleportId = v27.TeleportId
    });
    l_AnimHelper_0:CreateAnim(v61);
    l_AnimHelper_0:CreateAnim(v62);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v61);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v62);
    if v30 or v31 then
        task.delay(1, function() --[[ Line: 243 ]]
            -- upvalues: l_Character_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), l_Brightness_0 (copy), l_TimeOfDay_0 (copy)
            local v65 = script.Light:Clone();
            v65.CFrame = l_Character_0.PrimaryPart.CFrame * CFrame.new(10, 3, -1);
            v65.Parent = game.Workspace.Debris;
            local v66 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.In);
            l_TweenService_0:Create(v65.PointLight, v66, {
                Brightness = 1.1
            }):Play();
            task.wait(4.833333333333333);
            local v67 = TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
            l_TweenService_0:Create(l_Lighting_0, v67, {
                Brightness = l_Brightness_0
            }):Play();
            l_Lighting_0.TimeOfDay = l_TimeOfDay_0;
            l_TweenService_0:Create(v65.PointLight, v67, {
                Brightness = 0
            }):Play();
            task.wait(3);
            v65:Destroy();
        end);
    end;
    local v68 = script.Effects:Clone();
    v68.Parent = l_Workspace_0.Debris;
    v68.CFrame = l_Victim_0.PrimaryPart.CFrame;
    local v69 = {};
    local function v77(v70, v71) --[[ Line: 271 ]] --[[ Name: SetTransparency ]]
        -- upvalues: l_Workspace_0 (ref)
        for _, v73 in v70:GetDescendants() do
            if v73.Name == "UnusualParticle" then
                v73.Enabled = v71 == 0;
            end;
            if (v73:IsA("BasePart") or v73:IsA("Decal")) and v73.LocalTransparencyModifier < 1000 then
                v73.LocalTransparencyModifier = v71;
            end;
        end;
        local l_FirstChild_0 = l_Workspace_0.Welds:FindFirstChild(v70.Name);
        if l_FirstChild_0 then
            for _, v76 in l_FirstChild_0:GetDescendants() do
                if v76.Name == "UnusualParticle" then
                    v76.Enabled = v71 == 0;
                end;
                if (v76:IsA("BasePart") or v76:IsA("Decal")) and v76.LocalTransparencyModifier < 1000 then
                    v76.LocalTransparencyModifier = v71;
                end;
            end;
        end;
    end;
    v69[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hide"):Connect(function() --[[ Line: 290 ]]
        -- upvalues: v30 (copy), v31 (copy), v77 (copy), l_Character_0 (copy)
        if v30 or v31 then
            v77(l_Character_0, 1);
            task.delay(5, function() --[[ Line: 294 ]]
                -- upvalues: v77 (ref), l_Character_0 (ref)
                v77(l_Character_0, 0);
            end);
        end;
    end);
    v69[2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Show"):Connect(function() --[[ Line: 300 ]]
        -- upvalues: v30 (copy), v31 (copy), v77 (copy), l_Character_0 (copy)
        if v30 or v31 then
            v77(l_Character_0, 0);
        end;
    end);
    v69[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Jump"):Connect(function() --[[ Line: 306 ]]
        -- upvalues: v20 (ref), l_Character_0 (copy)
        task.delay(0, function() --[[ Line: 307 ]]
            -- upvalues: v20 (ref), l_Character_0 (ref)
            v20.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "Aoki", 
                    TargetPart = "RightHand", 
                    DelayTime = 0, 
                    HoldTime = 0.6666666666666666, 
                    TimeScale = 0.5
                }
            });
        end);
    end);
    v69[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hit"):Connect(function() --[[ Line: 322 ]]
        -- upvalues: v68 (copy), v30 (copy), v31 (copy), v20 (ref), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v52 (copy)
        for _, v79 in v68.Hit:GetChildren() do
            v79:Emit(2);
        end;
        if not v30 and not v31 then
            return;
        else
            task.defer(function() --[[ Line: 329 ]]
                -- upvalues: v20 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v52 (ref)
                v20.CreateImpactFrame({
                    Time = 0.06
                });
                l_ColorCorrection_0.Saturation = 0;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v80 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v80, {
                    Saturation = -0.4, 
                    Contrast = 0.2
                }):Play();
                local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                l_MenuBlur_1.Size = 0;
                l_MenuBlur_1.Enabled = true;
                local v82 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_1, v82, {
                    Size = 20
                }):Play();
                local v83 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v83, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                task.delay(2, function() --[[ Line: 351 ]]
                    -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v52 (ref)
                    l_TweenService_0:Create(l_Lighting_0, v52, {
                        ExposureCompensation = workspace.Exposure.Value
                    }):Play();
                end);
            end);
            v20.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v20.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.2, 
                Fade = 0.4
            });
            return;
        end;
    end);
    v69[5] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 368 ]]
        -- upvalues: v69 (copy), v30 (copy), v31 (copy), l_CameraMode_0 (copy), l_TweenService_0 (ref), l_Main_0 (ref), v50 (copy), v68 (copy), v20 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), v52 (copy)
        for _, v85 in v69 do
            v85:Disconnect();
        end;
        if v30 or v31 then
            l_CameraMode_0.Value = "Cutscene";
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v50, {
                ImageTransparency = 1
            }):Play();
        end;
        for _, v87 in v68.Uppercut:GetChildren() do
            v87:Emit(3);
        end;
        for _, v89 in v68.Uppercut2:GetChildren() do
            v89:Emit(2);
        end;
        if not v30 and not v31 then
            return;
        else
            task.defer(function() --[[ Line: 388 ]]
                -- upvalues: v20 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v52 (ref)
                v20.CreateImpactFrame({
                    Time = 0.06
                });
                l_ColorCorrection_0.Saturation = 0;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v90 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v90, {
                    Saturation = -0.4, 
                    Contrast = 0.2
                }):Play();
                local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                l_MenuBlur_2.Size = 0;
                l_MenuBlur_2.Enabled = true;
                local v92 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_2, v92, {
                    Size = 20
                }):Play();
                local v93 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v93, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                task.delay(0.8, function() --[[ Line: 410 ]]
                    -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v52 (ref)
                    l_TweenService_0:Create(l_Lighting_0, v52, {
                        ExposureCompensation = workspace.Exposure.Value
                    }):Play();
                end);
            end);
            v20.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v20.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 1.5, 
                Fade = 1.5
            });
            return;
        end;
    end);
    if v30 or v31 then
        local v94 = l_Assets_0.Camera:Clone();
        v94.Name = l_Character_0.Name .. "Camera";
        v94.Parent = l_Workspace_0.Debris;
        local v95 = 0;
        do
            local l_v95_0 = v95;
            local function v97() --[[ Line: 433 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v95_0 (ref), v94 (copy), l_Character_0 (copy)
                if os.time() - l_v95_0 < 0.5 then
                    return;
                else
                    l_v95_0 = os.time();
                    v94:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v97();
            v94.Head.Transparency = 1;
            local v98 = {
                Animator = v94.AnimationController.Animator, 
                AnimId = v26.Animations.Camera
            };
            local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v98);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 452 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v94 (copy), v97 (copy)
                l_CurrentCamera_0.CFrame = v94.Head.CFrame;
                v97();
            end);
            task.delay(650, function() --[[ Line: 457 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(10.5);
            l_l_AnimHelper_0_Anim_2:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.01);
            l_TweenService_0:Create(l_Main_0.White, v52, {
                BackgroundTransparency = 0
            }):Play();
            task.wait(0.3333333333333333);
            l_l_AnimHelper_0_Anim_2:Stop(0.1);
            if l_l_AnimHelper_0_Anim_1 then
                l_l_AnimHelper_0_Anim_1:Stop(0.1);
            end;
            l_l_AnimHelper_0_Anim_0:Stop(0.1);
            for _, v102 in l_Character_0:GetDescendants() do
                if v102:IsA("BasePart") and v102.LocalTransparencyModifier < 1000 then
                    v102.LocalTransparencyModifier = 0;
                end;
            end;
            local l_FirstChild_1 = l_Workspace_0.Welds:FindFirstChild(l_Character_0.Name);
            if l_FirstChild_1 then
                for _, v105 in l_FirstChild_1:GetDescendants() do
                    if v105:IsA("BasePart") and v105.LocalTransparencyModifier < 1000 then
                        v105.LocalTransparencyModifier = 0;
                    end;
                end;
            end;
            task.wait(0.3333333333333333);
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_CameraMode_0.Value = "";
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v50, {
                ImageTransparency = 1
            }):Play();
            local v106 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v106, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v20.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v94:Destroy();
        end;
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v26;