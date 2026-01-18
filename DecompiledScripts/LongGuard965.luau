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
        Character = 13674180071, 
        Victim = 13674193999, 
        Camera = 13674217034
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
    if v30 or v31 then
        l_SoundHelper_0:PlaySound({
            Name = "IppoUltSong", 
            Parent = l_Workspace_0.Debris
        });
    end;
    task.wait(0.5);
    local v50 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v51 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v30 or v31 then
        l_TweenService_0:Create(l_Main_0.White, v51, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v51, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v50, {
            ImageTransparency = 0.5
        }):Play();
        task.delay(1.2, function() --[[ Line: 155 ]]
            -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v51 (copy)
            l_TweenService_0:Create(l_Lighting_0, v51, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
        end);
    end;
    local v52 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v30 or v31) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v52.Volume;
    v52.Volume = 0;
    task.delay(0.28, function() --[[ Line: 169 ]]
        -- upvalues: v52 (copy), v30 (copy), v31 (copy), l_Volume_0 (copy), v27 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v52:Stop();
        if v30 or v31 then
            v52.Volume = l_Volume_0;
        else
            v52.Volume = l_Volume_0 / 5;
        end;
        v52:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v27.HasVoicelines then
            local v55 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v30 or v31) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v30 and not v31 then
                v55.Volume = v55.Volume / 5;
            end;
        end;
    end);
    task.wait(0.5);
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v30 or v31 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 65;
    end;
    local v58 = {
        Animator = v33, 
        AnimId = v26.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v59 = {
        Animator = v35, 
        AnimId = v26.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    v20.TeleportModel({
        Character = v27.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame * v27.Offset, 
        TeleportId = v27.TeleportId
    });
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v58);
    l_AnimHelper_0:CreateAnim(v59);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v58);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v59);
    local v62 = script.Effects:Clone();
    v62.Parent = l_Workspace_0.Debris;
    v62.CFrame = l_Victim_0.PrimaryPart.CFrame;
    task.delay(10, function() --[[ Line: 240 ]]
        -- upvalues: v62 (copy)
        v62:Destroy();
    end);
    task.delay(0.6333333333333333, function() --[[ Line: 244 ]]
        -- upvalues: v20 (ref), l_Character_0 (copy)
        v20.AttackTrail({
            Character = l_Character_0, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "LongGuard", 
                TargetPart = "LeftHand", 
                DelayTime = 0, 
                HoldTime = 1, 
                TimeScale = 1
            }
        });
    end);
    local v75 = {
        [1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Jab"):Connect(function() --[[ Line: 260 ]]
            -- upvalues: v62 (copy), v30 (copy), v31 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), l_Main_0 (ref), v50 (copy), v20 (ref)
            for _, v64 in v62.Uppercut:GetChildren() do
                v64:Emit(2);
            end;
            if not v30 and not v31 then
                return;
            else
                task.defer(function() --[[ Line: 267 ]]
                    -- upvalues: l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                    l_ColorCorrection_0.Saturation = 0;
                    l_ColorCorrection_0.Contrast = 0;
                    l_ColorCorrection_0.Enabled = true;
                    local v65 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_0, v65, {
                        Saturation = -0.2, 
                        Contrast = 0.1
                    }):Play();
                    local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_1.Size = 0;
                    l_MenuBlur_1.Enabled = true;
                    local v67 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_1, v67, {
                        Size = 20
                    }):Play();
                    local v68 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v68, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.1
                    }):Play();
                end);
                l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v50, {
                    ImageTransparency = 1
                }):Play();
                v20.HUDShake({
                    Scale = 20, 
                    Damper = 0.09999999999999999
                });
                v20.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.1, 
                    Fade = 0.3
                });
                return;
            end;
        end), 
        [2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Jab2"):Connect(function() --[[ Line: 300 ]]
            -- upvalues: v62 (copy), v30 (copy), v31 (copy), v20 (ref), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
            for _, v70 in v62.Uppercut:GetChildren() do
                v70:Emit(3);
            end;
            if not v30 and not v31 then
                return;
            else
                task.defer(function() --[[ Line: 307 ]]
                    -- upvalues: v20 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                    v20.CreateImpactFrame({
                        Time = 0.05
                    });
                    l_ColorCorrection_0.Saturation = 0;
                    l_ColorCorrection_0.Contrast = 0;
                    l_ColorCorrection_0.Enabled = true;
                    local v71 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_0, v71, {
                        Saturation = -0.3, 
                        Contrast = 0.1
                    }):Play();
                    local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_2.Size = 0;
                    l_MenuBlur_2.Enabled = true;
                    local v73 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_2, v73, {
                        Size = 20
                    }):Play();
                    local v74 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v74, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.1
                    }):Play();
                end);
                v20.HUDShake({
                    Scale = 20, 
                    Damper = 0.09999999999999999
                });
                v20.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.2, 
                    Fade = 0.3
                });
                return;
            end;
        end)
    };
    v75[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 342 ]]
        -- upvalues: v75 (copy), v62 (copy), v30 (copy), v31 (copy), v20 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), l_Main_0 (ref), v50 (copy)
        for _, v77 in v75 do
            v77:Disconnect();
        end;
        for _, v79 in v62.Final:GetChildren() do
            v79:Emit(v79:GetAttribute("EmitCount") or 2);
        end;
        if not v30 and not v31 then
            return;
        else
            task.defer(function() --[[ Line: 353 ]]
                -- upvalues: v20 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (ref), l_Lighting_0 (ref), l_Main_0 (ref), v50 (ref)
                v20.CreateImpactFrame({
                    Time = 0.06
                });
                local v80 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v80, {
                    Saturation = -0.4, 
                    Contrast = 1
                }):Play();
                local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                l_MenuBlur_3.Size = 0;
                l_MenuBlur_3.Enabled = true;
                local v82 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_3, v82, {
                    Size = 20
                }):Play();
                local v83 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v83, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                task.wait(0.5);
                l_TweenService_0:Create(l_Lighting_0, v83, {
                    ExposureCompensation = workspace.Exposure.Value
                }):Play();
                local v84 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v84, {
                    Saturation = 0, 
                    Contrast = 0
                }):Play();
                l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v50, {
                    ImageTransparency = 1
                }):Play();
            end);
            v20.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v20.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.4, 
                Fade = 1
            });
            return;
        end;
    end);
    if v30 or v31 then
        local v85 = l_Assets_0.Camera:Clone();
        v85.Name = l_Character_0.Name .. "Camera";
        v85.Parent = l_Workspace_0.Debris;
        local v86 = 0;
        do
            local l_v86_0 = v86;
            local function v88() --[[ Line: 398 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v86_0 (ref), v85 (copy), l_Character_0 (copy)
                if os.time() - l_v86_0 < 0.5 then
                    return;
                else
                    l_v86_0 = os.time();
                    v85:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v88();
            local v89 = {
                Animator = v85.AnimationController.Animator, 
                AnimId = v26.Animations.Camera
            };
            local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v89);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 416 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v85 (copy), v88 (copy)
                l_CurrentCamera_0.CFrame = v85.Head.CFrame;
                v88();
            end);
            task.delay(4.5, function() --[[ Line: 421 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(3.8333333333333335);
            l_l_AnimHelper_0_Anim_2:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.01);
            l_TweenService_0:Create(l_Main_0.White, v51, {
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
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v50, {
                ImageTransparency = 1
            }):Play();
            local v92 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v92, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v20.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v85:Destroy();
        end;
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v26;