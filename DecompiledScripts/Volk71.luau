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
        Character = 14090389345, 
        Victim = 14090391953, 
        Camera = 14090376621
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
                Name = "IppoUltSong", 
                Parent = l_Workspace_0.Debris, 
                Volume = 0.25
            });
        end);
    end;
    task.wait(0.5);
    local v52 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v53 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v31 or v32 then
        l_TweenService_0:Create(l_Main_0.White, v53, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v53, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v52, {
            ImageTransparency = 0.5
        }):Play();
    end;
    task.wait(0.5);
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
    l_SoundHelper_0:PlaySound({
        Name = "WhiteFangStart", 
        Parent = l_Character_0.PrimaryPart
    });
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v31 or v32 then
        l_CameraMode_0.Value = "Cutscene";
        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            FieldOfView = 32
        }):Play();
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
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    v21.TeleportModel({
        Character = v28.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame * v28.Offset, 
        TeleportId = v28.TeleportId
    });
    local v60 = {};
    v21.TeleportModel({
        Character = v28.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame, 
        TeleportId = v28.TeleportId
    });
    l_AnimHelper_0:CreateAnim(v58);
    l_AnimHelper_0:CreateAnim(v59);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v58);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v59);
    local v63 = script.Effects:Clone();
    v63.Parent = l_Workspace_0.Debris;
    v63.CFrame = l_Victim_0.PrimaryPart.CFrame * v28.Offset;
    task.delay(10, function() --[[ Line: 226 ]]
        -- upvalues: v63 (copy)
        v63:Destroy();
    end);
    task.defer(function() --[[ Line: 230 ]]
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
    local v64 = nil;
    if v31 or v32 then
        v64 = script.Start:Clone();
        v64.CFrame = l_Character_0.PrimaryPart.CFrame;
        v64.Parent = game.Workspace.Debris;
        task.delay(20, function() --[[ Line: 249 ]]
            -- upvalues: v64 (ref)
            if v64 then
                v64:Destroy();
            end;
        end);
    end;
    local v65 = {};
    local v66 = 1;
    v65[9] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Effect"):Connect(function() --[[ Line: 257 ]]
        -- upvalues: v31 (copy), v32 (copy), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), l_TweenService_0 (ref), v21 (ref)
        if not v31 and not v32 then
            return;
        else
            local v67 = l_ColorCorrection_0:Clone();
            v67.Parent = game.Lighting;
            v67.Saturation = 0.1;
            v67.Contrast = 0;
            v67.Enabled = true;
            local _ = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v70 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v70, {
                Size = 20
            }):Play();
            local v71 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v71, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.35
            });
            return;
        end;
    end);
    v65[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hit"):Connect(function() --[[ Line: 284 ]]
        -- upvalues: v63 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v66 (ref), v21 (ref), v31 (copy), v32 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
        local l_Right_0 = v63.Right;
        local v73 = "RightHand";
        l_SoundHelper_0:PlaySound({
            Name = "KnockdownPunch", 
            Parent = l_Character_0.PrimaryPart, 
            Volume = 0.05, 
            Speed = 1.5
        });
        l_SoundHelper_0:PlaySound({
            Name = "HeavyLayer", 
            Parent = l_Character_0.PrimaryPart
        });
        l_SoundHelper_0:PlaySound({
            Name = "FlameHit2", 
            Parent = l_Character_0.PrimaryPart, 
            Speed = 0.8
        });
        l_SoundHelper_0:PlaySound({
            Name = "Crush", 
            Parent = l_Character_0.PrimaryPart, 
            Speed = 0.8
        });
        if (v66 + 1) % 2 == 0 then
            l_Right_0 = v63.Left;
            v73 = "LeftHand";
        end;
        for _, v75 in l_Right_0:GetChildren() do
            v75:Emit(1);
        end;
        v66 = v66 + 1;
        task.defer(function() --[[ Line: 323 ]]
            -- upvalues: v21 (ref), l_Character_0 (ref), v73 (ref)
            v21.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "Volk", 
                    TargetPart = v73, 
                    DelayTime = 0, 
                    HoldTime = 0.3333333333333333, 
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
            local v76 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v76, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
            l_MenuBlur_2.Size = 0;
            l_MenuBlur_2.Enabled = true;
            local v78 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_2, v78, {
                Size = 20
            }):Play();
            local v79 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v79, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.35
            });
            return;
        end;
    end);
    v65[2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Uppercut"):Connect(function() --[[ Line: 363 ]]
        -- upvalues: v63 (copy), v21 (ref), l_Character_0 (copy), l_SoundHelper_0 (ref), l_BubbleModule_0 (ref), l_Victim_0 (copy), v31 (copy), v32 (copy), l_Lighting_0 (ref), l_TweenService_0 (ref), l_Workspace_0 (ref), l_ColorCorrection_0 (copy)
        for _, v81 in v63.Uppercut:GetChildren() do
            v81:Emit(1);
        end;
        task.defer(function() --[[ Line: 372 ]]
            -- upvalues: v21 (ref), l_Character_0 (ref)
            v21.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "Volk", 
                    TargetPart = "LeftHand", 
                    DelayTime = 0, 
                    HoldTime = 0.5, 
                    TimeScale = 1
                }
            });
        end);
        l_SoundHelper_0:PlaySound({
            Name = "WhiteFangMiddle", 
            Parent = l_Character_0.PrimaryPart
        });
        l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(8, 8, 8, 0), 0.3);
        if not v31 and not v32 then
            return;
        else
            for _, v83 in v63.Vortex:GetChildren() do
                v83.Enabled = true;
            end;
            task.delay(1, function() --[[ Line: 400 ]]
                -- upvalues: v63 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (ref), v21 (ref)
                for _, v85 in v63.Vortex:GetChildren() do
                    v85.Enabled = false;
                end;
                local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                l_MenuBlur_3.Size = 0;
                l_MenuBlur_3.Enabled = true;
                local v87 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_3, v87, {
                    Size = 25
                }):Play();
                local v88 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v88, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                l_SoundHelper_0:PlaySound({
                    Name = "Heartbeat", 
                    Parent = l_Workspace_0
                });
                task.defer(function() --[[ Line: 421 ]]
                    -- upvalues: l_Character_0 (ref), v21 (ref)
                    local v89 = {
                        Step = 1, 
                        MaxTime = 1.6666666666666667, 
                        DeleteDelay = 0.3, 
                        AddTransparency = 0.97, 
                        Character = l_Character_0
                    };
                    v21.AfterimageEffect(v89);
                end);
            end);
            v21.CreateImpactFrame({
                Time = 0.1
            });
            l_ColorCorrection_0.Saturation = 0.1;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v90 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v90, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
            l_MenuBlur_4.Size = 0;
            l_MenuBlur_4.Enabled = true;
            local v92 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_4, v92, {
                Size = 20
            }):Play();
            local v93 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v93, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.35
            });
            return;
        end;
    end);
    local v94 = false;
    v65[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hook"):Connect(function() --[[ Line: 463 ]]
        -- upvalues: v94 (ref), l_SoundHelper_0 (ref), l_Character_0 (copy), l_BubbleModule_0 (ref), l_Victim_0 (copy), v21 (ref), v31 (copy), v32 (copy), l_Lighting_0 (ref), l_TweenService_0 (ref), l_Workspace_0 (ref), v64 (ref), l_ColorCorrection_0 (copy)
        if v94 then
            return;
        else
            v94 = true;
            l_SoundHelper_0:PlaySound({
                Name = "HeavyLayer", 
                Parent = l_Character_0.PrimaryPart, 
                Speed = 0.8
            });
            l_SoundHelper_0:PlaySound({
                Name = "Crush", 
                Parent = l_Character_0.PrimaryPart, 
                Speed = 2
            });
            l_SoundHelper_0:PlaySound({
                Name = "WhiteFangEnd", 
                Parent = l_Character_0.PrimaryPart
            });
            l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(8, 8, 8, 0), 0.3);
            task.defer(function() --[[ Line: 488 ]]
                -- upvalues: v21 (ref), l_Character_0 (ref)
                v21.AttackTrail({
                    Character = l_Character_0, 
                    TrailInfo = {
                        EffectName = "AttackTrail", 
                        TrailName = "Volk", 
                        TargetPart = "LeftHand", 
                        DelayTime = 0, 
                        HoldTime = 0.5, 
                        TimeScale = 0.5
                    }
                });
            end);
            if not v31 and not v32 then
                return;
            else
                task.delay(3.55, function() --[[ Line: 504 ]]
                    -- upvalues: v21 (ref), l_Character_0 (ref)
                    task.defer(function() --[[ Line: 505 ]]
                        -- upvalues: v21 (ref), l_Character_0 (ref)
                        v21.AttackTrail({
                            Character = l_Character_0, 
                            TrailInfo = {
                                EffectName = "AttackTrail", 
                                TrailName = "Volk", 
                                TargetPart = "RightHand", 
                                DelayTime = 0, 
                                HoldTime = 0.5, 
                                TimeScale = 1
                            }
                        });
                    end);
                end);
                task.delay(1, function() --[[ Line: 520 ]]
                    -- upvalues: l_Lighting_0 (ref), l_TweenService_0 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (ref), v21 (ref)
                    local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_5.Size = 0;
                    l_MenuBlur_5.Enabled = true;
                    local v96 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_5, v96, {
                        Size = 45
                    }):Play();
                    local v97 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v97, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                    }):Play();
                    l_SoundHelper_0:PlaySound({
                        Name = "Heartbeat", 
                        Parent = l_Workspace_0
                    });
                    task.defer(function() --[[ Line: 536 ]]
                        -- upvalues: l_Character_0 (ref), v21 (ref)
                        local v98 = {
                            Step = 1, 
                            MaxTime = 1.6666666666666667, 
                            DeleteDelay = 0.3, 
                            AddTransparency = 0.97, 
                            Character = l_Character_0
                        };
                        v21.AfterimageEffect(v98);
                    end);
                end);
                if v64 then
                    v64:Destroy();
                end;
                v21.CreateImpactFrame({
                    Time = 0.1
                });
                l_ColorCorrection_0.Saturation = 0.1;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v99 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v99, {
                    Saturation = -0.4, 
                    Contrast = 0.2
                }):Play();
                local l_MenuBlur_6 = l_Lighting_0.MenuBlur;
                l_MenuBlur_6.Size = 0;
                l_MenuBlur_6.Enabled = true;
                local v101 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_6, v101, {
                    Size = 20
                }):Play();
                local v102 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v102, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                v21.HUDShake({
                    Scale = 20, 
                    Damper = 0.35
                });
                return;
            end;
        end;
    end);
    v65[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 577 ]]
        -- upvalues: v65 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v63 (copy), v31 (copy), v32 (copy), v21 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), l_Main_0 (ref), v52 (copy)
        for _, v104 in v65 do
            v104:Disconnect();
        end;
        l_SoundHelper_0:PlaySound({
            Name = "KnockdownPunch", 
            Parent = l_Character_0.PrimaryPart
        });
        l_SoundHelper_0:PlaySound({
            Name = "FlameHit1", 
            Parent = l_Character_0.PrimaryPart
        });
        l_SoundHelper_0:PlaySound({
            Name = "GlassShatter", 
            Parent = l_Character_0.PrimaryPart
        });
        for _, v106 in v63.Final:GetChildren() do
            v106:Emit(2);
        end;
        if not v31 and not v32 then
            return;
        else
            task.defer(function() --[[ Line: 603 ]]
                -- upvalues: v21 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (ref), l_Lighting_0 (ref)
                v21.CreateImpactFrame({
                    Time = 0.1
                });
                local v107 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v107, {
                    Saturation = -0.4, 
                    Contrast = 1
                }):Play();
                local l_MenuBlur_7 = l_Lighting_0.MenuBlur;
                l_MenuBlur_7.Size = 0;
                l_MenuBlur_7.Enabled = true;
                local v109 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_7, v109, {
                    Size = 20
                }):Play();
                local v110 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v110, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                task.wait(0.5);
                local v111 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v111, {
                    Saturation = 0, 
                    Contrast = 0
                }):Play();
            end);
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v52, {
                ImageTransparency = 1
            }):Play();
            return;
        end;
    end);
    if v31 or v32 then
        local v112 = l_Assets_0.Camera:Clone();
        v112.Name = l_Character_0.Name .. "Camera";
        v112.Parent = l_Workspace_0.Debris;
        local v113 = 0;
        do
            local l_v113_0 = v113;
            local function v115() --[[ Line: 640 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v113_0 (ref), v112 (copy), l_Character_0 (copy)
                if os.time() - l_v113_0 < 0.5 then
                    return;
                else
                    l_v113_0 = os.time();
                    v112:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v115();
            local v116 = {
                Animator = v112.AnimationController.Animator, 
                AnimId = v27.Animations.Camera
            };
            local _ = l_AnimHelper_0:CreateAnim(v116);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 658 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v112 (copy), v115 (copy)
                l_CurrentCamera_0.CFrame = v112.Head.CFrame;
                v115();
            end);
            task.delay(6.566666666666666, function() --[[ Line: 663 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(6.566666666666666);
            l_TweenService_0:Create(l_Main_0.White, v53, {
                BackgroundTransparency = 0
            }):Play();
            task.wait(0.3333333333333333);
            if l_l_AnimHelper_0_Anim_1 then
                l_l_AnimHelper_0_Anim_1:Stop(0.1);
            end;
            l_l_AnimHelper_0_Anim_0:Stop(0.1);
            l_Victim_0:SetPrimaryPartCFrame(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5));
            if v64 then
                v64:Destroy();
            end;
            task.wait(0.3333333333333333);
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_CurrentCamera_0.FieldOfView = 70;
            l_CameraMode_0.Value = "";
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v52, {
                ImageTransparency = 1
            }):Play();
            local v119 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v119, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v112:Destroy();
        end;
    end;
    for v120, v121 in v60 do
        v120.CollisionGroup = v121;
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v27;