local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("CollectionService");
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
local l_BubbleModule_0 = require(l_ReplicatedStorage_0:WaitForChild("BubbleModule"));
local l_Parent_0 = script.Parent.Parent;
local v22 = require(l_Parent_0);
local l_NumberSequenceTween_0 = require(l_ReplicatedStorage_0:WaitForChild("NumberSequenceTween"));
local _ = Random.new();
local function _(v25, v26, v27) --[[ Line: 34 ]] --[[ Name: Lerp ]]
    return v25 + (v26 - v25) * v27;
end;
local v29 = {
    Animations = {
        Character = 72434159430330, 
        Victim = 74933577655045, 
        Camera = 134032519728044
    }
};
local _ = function(v30, v31) --[[ Line: 44 ]] --[[ Name: SetTransparency ]]
    -- upvalues: l_Workspace_0 (copy)
    for _, v33 in v30:GetDescendants() do
        if v33.Name == "UnusualParticle" then
            v33.Enabled = v31 == 0;
        end;
        if (v33:IsA("BasePart") or v33:IsA("Decal")) and v33.LocalTransparencyModifier < 1000 then
            v33.LocalTransparencyModifier = v31;
        end;
    end;
    local l_FirstChild_0 = l_Workspace_0.Welds:FindFirstChild(v30.Name);
    if l_FirstChild_0 then
        for _, v36 in l_FirstChild_0:GetDescendants() do
            if v36.Name == "UnusualParticle" then
                v36.Enabled = v31 == 0;
            end;
            if (v36:IsA("BasePart") or v36:IsA("Decal")) and v36.LocalTransparencyModifier < 1000 then
                v36.LocalTransparencyModifier = v31;
            end;
        end;
    end;
end;
v29.Use = function(v38) --[[ Line: 63 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v22 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), v29 (copy), l_AnimHelper_0 (copy), l_BubbleModule_0 (copy), l_NumberSequenceTween_0 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
    local l_Character_0 = v38.Character;
    local l_Victim_0 = v38.Victim;
    local v41 = l_LocalPlayer_0.Character == l_Character_0;
    local v42 = l_LocalPlayer_0.Character == l_Victim_0;
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v44 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v46 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    for _, v48 in (v44:GetPlayingAnimationTracks()) do
        if v48.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_0 = v48.Speed;
            v48:AdjustSpeed(l_Speed_0 / 4);
            task.delay(2, function() --[[ Line: 85 ]]
                -- upvalues: v48 (copy), l_Speed_0 (copy)
                v48:AdjustSpeed(l_Speed_0);
            end);
        end;
    end;
    for _, v51 in (v46:GetPlayingAnimationTracks()) do
        if v51.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_1 = v51.Speed;
            v51:AdjustSpeed(l_Speed_1 / 4);
            task.delay(2, function() --[[ Line: 97 ]]
                -- upvalues: v51 (copy), l_Speed_1 (copy)
                v51:AdjustSpeed(l_Speed_1);
            end);
        end;
    end;
    task.defer(function() --[[ Line: 102 ]]
        -- upvalues: v41 (copy), v42 (copy), v22 (ref), l_Main_0 (ref)
        if v41 or v42 then
            v22.StatusFrame(v42, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v53 = l_Parent_0.UltimateStart:Clone();
    v53.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v53.Parent = l_Workspace_0.Debris;
    task.delay(20, function() --[[ Line: 112 ]]
        -- upvalues: v53 (copy)
        if v53 then
            v53:Destroy();
        end;
    end);
    for _, v55 in v53.Particle:GetChildren() do
        v55.Enabled = false;
        v55:Emit(v55:GetAttribute("EmitCount"));
    end;
    local v56 = l_Lighting_0.ColorCorrection:Clone();
    v56.Parent = l_Lighting_0;
    if v41 or v42 then
        task.defer(function() --[[ Line: 125 ]]
            -- upvalues: v56 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v22 (ref), v53 (copy)
            v56.Saturation = 0;
            v56.Contrast = 0;
            v56.Enabled = true;
            local v57 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(v56, v57, {
                Saturation = -0.7, 
                Contrast = 0.5
            }):Play();
            local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
            l_MenuBlur_0.Size = 0;
            l_MenuBlur_0.Enabled = true;
            local v59 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_0, v59, {
                Size = 10
            }):Play();
            local v60 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v60, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v22.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v22.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.5, 
                Fade = 0.5
            });
            task.wait(5);
            v53:Destroy();
        end);
    end;
    local v61 = l_SoundHelper_0:PlaySound({
        Name = "SwitchHitSFX", 
        Parent = l_Character_0
    });
    v61.Volume = 0;
    task.delay(1, function() --[[ Line: 166 ]]
        -- upvalues: v61 (copy), v41 (copy), v42 (copy), l_Workspace_0 (ref), v38 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy)
        v61:Stop();
        if v41 or v42 then
            v61.Parent = l_Workspace_0;
            v61.Volume = 0.25;
        else
            v61.Volume = 0.05;
        end;
        v61:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v38.HasVoicelines then
            local v63 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v41 or v42) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v41 and not v42 then
                v63.Volume = v63.Volume / 5;
            end;
        end;
    end);
    local v64 = {
        Animator = v44, 
        AnimId = v29.Animations.Character, 
        Priority = Enum.AnimationPriority.Core, 
        FadeIn = 0
    };
    local v65 = {
        Animator = v46, 
        AnimId = v29.Animations.Victim, 
        Priority = Enum.AnimationPriority.Core, 
        FadeIn = 0
    };
    l_AnimHelper_0:CreateAnim(v64);
    l_AnimHelper_0:CreateAnim(v65);
    v64.Priority = Enum.AnimationPriority.Action4;
    v65.Priority = Enum.AnimationPriority.Action4;
    task.wait(0.5);
    local v66 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v67 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v41 or v42 then
        l_TweenService_0:Create(l_Main_0.White, v67, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v67, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v66, {
            ImageTransparency = 0.5
        }):Play();
    end;
    task.wait(0.5);
    task.delay(0.2, function() --[[ Line: 224 ]]
        -- upvalues: v41 (copy), v42 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_TweenService_0 (ref)
        if v41 or v42 then
            local v68 = l_SoundHelper_0:PlaySound({
                Name = "SwitchHitUltSong", 
                Parent = l_Workspace_0.Debris
            });
            task.delay(11, function() --[[ Line: 231 ]]
                -- upvalues: l_TweenService_0 (ref), v68 (copy)
                l_TweenService_0:Create(v68, TweenInfo.new(5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    Volume = 0
                }):Play();
            end);
        end;
    end);
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v41 or v42 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 35;
    end;
    v22.TeleportModel({
        Character = v38.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame * v38.Offset, 
        TeleportId = v38.TeleportId
    });
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v64);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v65);
    local v73 = nil;
    local l_Brightness_0 = l_Lighting_0.Brightness;
    local l_TimeOfDay_0 = l_Lighting_0.TimeOfDay;
    local v76 = TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
    local v77 = script.IppoUlt:Clone();
    v77.Parent = l_Workspace_0.Debris;
    v77.CFrame = l_Victim_0.PrimaryPart.CFrame;
    task.delay(20, function() --[[ Line: 269 ]]
        -- upvalues: v77 (copy)
        if v77 then
            v77:Destroy();
        end;
    end);
    task.delay(1.5, function() --[[ Line: 273 ]]
        -- upvalues: v22 (ref), l_Character_0 (copy)
        v22.AttackTrail({
            Character = l_Character_0, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "SwitchHit", 
                TargetPart = "LeftHand", 
                DelayTime = 0, 
                HoldTime = 1.5833333333333333, 
                TimeScale = 1
            }
        });
    end);
    local v101 = {
        [1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Start"):Connect(function() --[[ Line: 289 ]]
            -- upvalues: v41 (copy), v42 (copy), v77 (copy), v22 (ref), v56 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
            if not v41 and not v42 then
                return;
            else
                for _, v79 in v77.Left:GetChildren() do
                    v79.TimeScale = v79.TimeScale * 0.5;
                    v79:Emit(2);
                end;
                task.defer(function() --[[ Line: 297 ]]
                    -- upvalues: v22 (ref)
                    v22.CreateImpactFrame({
                        Time = 0.05
                    });
                end);
                task.spawn(function() --[[ Line: 303 ]]
                    -- upvalues: v56 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                    v56.Saturation = 0;
                    v56.Contrast = 0;
                    v56.Enabled = true;
                    local v80 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(v56, v80, {
                        Saturation = -0.4, 
                        Contrast = 0.6
                    }):Play();
                    local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_1.Size = 0;
                    l_MenuBlur_1.Enabled = true;
                    local v82 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_1, v82, {
                        Size = 20
                    }):Play();
                    local v83 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v83, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.4
                    }):Play();
                end);
                v22.HUDShake({
                    Scale = 20, 
                    Damper = 0.09999999999999999
                });
                v22.CameraShake({
                    Preset = "HardHitRoll", 
                    WaitTime = 0.35, 
                    Fade = 1
                });
                return;
            end;
        end), 
        [2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Charge"):Connect(function() --[[ Line: 334 ]]
            -- upvalues: v41 (copy), v42 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v22 (ref)
            if not v41 and not v42 then
                return;
            else
                l_SoundHelper_0:PlaySound({
                    Name = "IntenseWoosh", 
                    Parent = l_Workspace_0.Debris, 
                    Speed = 1.6, 
                    Volume = 0.8
                });
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    FieldOfView = 29
                }):Play();
                v22.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.2, 
                    Fade = 0.6
                });
                return;
            end;
        end), 
        [3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Dash"):Connect(function() --[[ Line: 353 ]]
            -- upvalues: l_Victim_0 (copy), v22 (ref), v41 (copy), v42 (copy), v56 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), l_CurrentCamera_0 (copy)
            task.defer(function() --[[ Line: 354 ]]
                -- upvalues: l_Victim_0 (ref), v22 (ref)
                local v84 = {
                    Step = 1, 
                    MaxTime = 0.5, 
                    DeleteDelay = 0.2, 
                    AddTransparency = 0.985, 
                    Character = l_Victim_0
                };
                v22.AfterimageEffect(v84);
            end);
            if not v41 and not v42 then
                return;
            else
                task.spawn(function() --[[ Line: 368 ]]
                    -- upvalues: v56 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                    v56.Saturation = 0;
                    v56.Contrast = 0;
                    v56.Enabled = true;
                    local v85 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(v56, v85, {
                        Saturation = -0.4, 
                        Contrast = 0.6
                    }):Play();
                    local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_2.Size = 0;
                    l_MenuBlur_2.Enabled = true;
                    local v87 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_2, v87, {
                        Size = 20
                    }):Play();
                    local v88 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v88, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.4
                    }):Play();
                end);
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FieldOfView = 35
                }):Play();
                v22.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.2, 
                    Fade = 0.6
                });
                return;
            end;
        end), 
        [4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Zoom"):Connect(function() --[[ Line: 396 ]]
            -- upvalues: v77 (copy), v22 (ref), l_Character_0 (copy), v41 (copy), v42 (copy), l_TweenService_0 (ref), l_LocalPlayer_0 (ref), l_CurrentCamera_0 (copy)
            local v89 = v77.EyeGlow:Clone();
            v89.Parent = v22.GetWeldCharacter(l_Character_0).Head;
            v89.Glow:Emit(10);
            task.delay(5, function() --[[ Line: 401 ]]
                -- upvalues: v89 (copy)
                v89:Destroy();
            end);
            if not v41 and not v42 then
                return;
            else
                local v90 = script.ScreenGui:Clone();
                local l_Position_0 = v90.Top.Position;
                local l_Position_1 = v90.Bottom.Position;
                v90.Top.Position = UDim2.new(l_Position_0.X.Scale, 0, l_Position_0.Y.Scale - 0.5, 0);
                v90.Bottom.Position = UDim2.new(l_Position_1.X.Scale, 0, l_Position_1.Y.Scale + 0.5, 0);
                local l_Position_2 = v90.Top.Position;
                local l_Position_3 = v90.Bottom.Position;
                local v95 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                l_TweenService_0:Create(v90.Top, v95, {
                    Position = UDim2.new(l_Position_0.X.Scale, 0, l_Position_0.Y.Scale - 0.07, 0)
                }):Play();
                l_TweenService_0:Create(v90.Bottom, v95, {
                    Position = UDim2.new(l_Position_1.X.Scale, 0, l_Position_1.Y.Scale + 0.07, 0)
                }):Play();
                task.delay(1.6666666666666667, function() --[[ Line: 421 ]]
                    -- upvalues: v95 (ref), l_TweenService_0 (ref), v90 (copy), l_Position_0 (copy), l_Position_1 (copy), l_Position_2 (copy), l_Position_3 (copy)
                    v95 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                    l_TweenService_0:Create(v90.Top, v95, {
                        Position = l_Position_0
                    }):Play();
                    l_TweenService_0:Create(v90.Bottom, v95, {
                        Position = l_Position_1
                    }):Play();
                    task.wait(0.25);
                    v95 = TweenInfo.new(4, Enum.EasingStyle.Cubic, Enum.EasingDirection.In);
                    l_TweenService_0:Create(v90.Top, v95, {
                        Position = l_Position_2
                    }):Play();
                    l_TweenService_0:Create(v90.Bottom, v95, {
                        Position = l_Position_3
                    }):Play();
                    task.wait(15);
                    v90:Destroy();
                end);
                v90.Parent = l_LocalPlayer_0.PlayerGui;
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FieldOfView = 40
                }):Play();
                v22.CameraShake({
                    Preset = "MedHit", 
                    WaitTime = 0.15, 
                    Fade = 0.4
                });
                return;
            end;
        end), 
        [6] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Zoom2"):Connect(function() --[[ Line: 448 ]]
            -- upvalues: v22 (ref), l_Character_0 (copy), l_Victim_0 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v73 (ref), v41 (copy), v42 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy)
            task.spawn(function() --[[ Line: 449 ]]
                -- upvalues: v22 (ref), l_Character_0 (ref), l_Victim_0 (ref)
                v22.AsuraCharacters({
                    "", 
                    l_Character_0, 
                    l_Victim_0, 
                    false, 
                    100, 
                    false, 
                    true
                });
            end);
            task.defer(function() --[[ Line: 461 ]]
                -- upvalues: l_Character_0 (ref), v22 (ref)
                local v96 = {
                    Step = 1, 
                    MaxTime = 0.6666666666666666, 
                    DeleteDelay = 0.2, 
                    AddTransparency = 0.98, 
                    Character = l_Character_0, 
                    Color = Color3.fromRGB(144, 80, 255)
                };
                v22.AfterimageEffect(v96);
            end);
            task.delay(1.1666666666666667, function() --[[ Line: 474 ]]
                -- upvalues: l_l_AnimHelper_0_Anim_0 (ref), l_l_AnimHelper_0_Anim_1 (ref), v73 (ref), v41 (ref), v42 (ref), v22 (ref)
                if l_l_AnimHelper_0_Anim_0 then
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(1.35);
                end;
                if l_l_AnimHelper_0_Anim_1 then
                    l_l_AnimHelper_0_Anim_1:AdjustSpeed(1.35);
                end;
                if v73 then
                    v73:AdjustSpeed(1.35);
                end;
                if not v41 and not v42 then
                    return;
                else
                    v22.CameraShake({
                        Preset = "LightHit", 
                        WaitTime = 2.5, 
                        Fade = 2.5
                    });
                    return;
                end;
            end);
            if not v41 and not v42 then
                return;
            else
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FieldOfView = 35
                }):Play();
                v22.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.2, 
                    Fade = 0.6
                });
                return;
            end;
        end), 
        [7] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final1"):Connect(function() --[[ Line: 498 ]]
            -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v73 (ref), v41 (copy), v42 (copy), v22 (ref), v56 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), l_BubbleModule_0 (ref), l_Victim_0 (copy), l_CurrentCamera_0 (copy)
            if l_l_AnimHelper_0_Anim_0 then
                l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
            end;
            if l_l_AnimHelper_0_Anim_1 then
                l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
            end;
            if v73 then
                v73:AdjustSpeed(1);
            end;
            if not v41 and not v42 then
                return;
            else
                task.defer(function() --[[ Line: 505 ]]
                    -- upvalues: v22 (ref), v56 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                    v22.CreateImpactFrame({
                        Time = 0.1
                    });
                    v56.Saturation = 0;
                    v56.Contrast = 0;
                    v56.Enabled = true;
                    local v97 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(v56, v97, {
                        Saturation = -1, 
                        Contrast = 1
                    }):Play();
                    local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_3.Size = 0;
                    l_MenuBlur_3.Enabled = true;
                    local v99 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_3, v99, {
                        Size = 25
                    }):Play();
                    local v100 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v100, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
                    }):Play();
                end);
                l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(8, 8, 8, 0), 0.3);
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FieldOfView = 28
                }):Play();
                v22.CameraShake({
                    Preset = "HardHitRoll", 
                    WaitTime = 0.5, 
                    Fade = 0.5
                });
                return;
            end;
        end)
    };
    v101[8] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final2"):Connect(function() --[[ Line: 539 ]]
        -- upvalues: v101 (copy), v77 (copy), l_Victim_0 (copy), l_Parent_0 (ref), v22 (ref), l_Character_0 (copy), l_NumberSequenceTween_0 (ref), v41 (copy), v42 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v56 (copy), l_Lighting_0 (ref)
        for _, v103 in v101 do
            v103:Disconnect();
        end;
        v77.CFrame = l_Victim_0.Head.CFrame;
        for _, v105 in v77.Final:GetChildren() do
            v105.TimeScale = v105.TimeScale * 0.5;
            v105:Emit(2);
        end;
        for _, v107 in v77.Final2:GetChildren() do
            v107.TimeScale = v107.TimeScale * 0.9;
        end;
        task.delay(0.7, function() --[[ Line: 555 ]]
            -- upvalues: l_Parent_0 (ref), v22 (ref), l_Character_0 (ref), l_NumberSequenceTween_0 (ref)
            for _, v109 in l_Parent_0.SwitchHitStart:GetChildren() do
                local v110 = v109:Clone();
                v110.Parent = v22.GetWeldCharacter(l_Character_0).PrimaryPart;
                for _, v112 in v110:GetChildren() do
                    v112.TimeScale = v112.TimeScale * 0.35;
                    v112:Emit(v112:GetAttribute("EmitCount"));
                end;
                task.delay(5, function() --[[ Line: 567 ]]
                    -- upvalues: v110 (copy)
                    v110:Destroy();
                end);
            end;
            local v113 = l_Parent_0.SwitchHitBeam:Clone();
            v113.Parent = workspace.Debris;
            local l_Weld_0 = Instance.new("Weld");
            l_Weld_0.Parent = v113;
            l_Weld_0.Part0 = v113;
            l_Weld_0.Part1 = l_Character_0.PrimaryPart;
            task.delay(0.5, function() --[[ Line: 580 ]]
                -- upvalues: v113 (copy), l_NumberSequenceTween_0 (ref)
                for _, v116 in v113:GetDescendants() do
                    if v116:IsA("Beam") then
                        l_NumberSequenceTween_0.Tween(v116, 20, 1);
                    end;
                end;
                task.wait(4);
                v113:Destroy();
            end);
        end);
        if not v41 and not v42 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                FieldOfView = 40
            }):Play();
            task.defer(function() --[[ Line: 595 ]]
                -- upvalues: v22 (ref), v56 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                v22.CreateImpactFrame({
                    Time = 0.1
                });
                v56.Saturation = 0;
                v56.Contrast = 0;
                v56.Enabled = true;
                local v117 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(v56, v117, {
                    Saturation = -1, 
                    Contrast = 1
                }):Play();
                local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                l_MenuBlur_4.Size = 0;
                l_MenuBlur_4.Enabled = true;
                local v119 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_4, v119, {
                    Size = 25
                }):Play();
                local v120 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v120, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
                }):Play();
            end);
            v22.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v22.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.6, 
                Fade = 1.5
            });
            return;
        end;
    end);
    if v41 or v42 then
        local v121 = l_Assets_0.Camera:Clone();
        v121.Name = l_Character_0.Name .. "Camera";
        v121.Parent = l_Workspace_0.Debris;
        local v122 = 0;
        do
            local l_v122_0 = v122;
            local function v124() --[[ Line: 636 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v122_0 (ref), v121 (copy), l_Character_0 (copy)
                if os.time() - l_v122_0 < 0.5 then
                    return;
                else
                    l_v122_0 = os.time();
                    v121:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v124();
            local v125 = {
                Animator = v121.AnimationController.Animator, 
                AnimId = v29.Animations.Camera
            };
            v73 = l_AnimHelper_0:CreateAnim(v125);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 654 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v121 (copy), v124 (copy)
                l_CurrentCamera_0.CFrame = v121.Head.CFrame;
                v124();
            end);
            task.wait(11.583333333333334);
            l_TweenService_0:Create(l_Main_0.White, v67, {
                BackgroundTransparency = 0
            }):Play();
            local v127 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(v56, v127, {
                Saturation = 0, 
                Contrast = 0
            }):Play();
            task.wait(0.3333333333333333);
            if l_l_AnimHelper_0_Anim_0 then
                l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
            end;
            if l_l_AnimHelper_0_Anim_1 then
                l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
            end;
            if v73 then
                v73:AdjustSpeed(1);
            end;
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_CameraMode_0.Value = "";
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v66, {
                ImageTransparency = 1
            }):Play();
            local v128 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v128, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v22.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v121:Destroy();
            for _, v130 in v77:GetDescendants() do
                if v130:IsA("ParticleEmitter") then
                    v130.Enabled = false;
                end;
            end;
            l_TweenService_0:Create(l_Lighting_0, v76, {
                Brightness = l_Brightness_0
            }):Play();
            l_Lighting_0.TimeOfDay = l_TimeOfDay_0;
        end;
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v29;