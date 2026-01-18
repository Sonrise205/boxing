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
        Character = 13674991776, 
        Victim = 13653220063, 
        Camera = 13653250649
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
    end;
    local v52 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v30 or v31) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v52.Volume;
    v52.Volume = 0;
    task.delay(0.25, function() --[[ Line: 161 ]]
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
        l_CurrentCamera_0.FieldOfView = 50;
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
    task.delay(10, function() --[[ Line: 232 ]]
        -- upvalues: v62 (copy)
        v62:Destroy();
    end);
    task.delay(0.43333333333333335, function() --[[ Line: 236 ]]
        -- upvalues: v20 (ref), l_Character_0 (copy)
        v20.AttackTrail({
            Character = l_Character_0, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Sendo", 
                TargetPart = "LeftHand", 
                DelayTime = 0, 
                HoldTime = 1, 
                TimeScale = 0.5
            }
        });
    end);
    local v63 = {};
    local v64 = {};
    local l_Aura_0 = script.Aura;
    for _, v67 in l_Character_0:GetChildren() do
        if v67:IsA("BasePart") then
            for _, v69 in l_Aura_0:GetChildren() do
                local v70 = v69:Clone();
                v70.Parent = v67;
                table.insert(v64, v70);
            end;
        end;
    end;
    task.delay(3.8333333333333335, function() --[[ Line: 265 ]]
        -- upvalues: v64 (copy)
        for _, v72 in v64 do
            v72.Enabled = false;
        end;
        task.wait(2);
        for _, v74 in v64 do
            v74:Destroy();
        end;
    end);
    v63[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Smash"):Connect(function() --[[ Line: 276 ]]
        -- upvalues: v62 (copy), v20 (ref), l_Character_0 (copy), v30 (copy), v31 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
        for _, v76 in v62.Uppercut:GetChildren() do
            v76:Emit(2);
        end;
        for _, v78 in v62.Uppercut2:GetChildren() do
            v78:Emit(2);
        end;
        task.delay(0.8333333333333334, function() --[[ Line: 285 ]]
            -- upvalues: v20 (ref), l_Character_0 (ref)
            v20.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "RedUltimate", 
                    TargetPart = "RightHand", 
                    DelayTime = 0, 
                    HoldTime = 2.5, 
                    TimeScale = 0.5
                }
            });
        end);
        if not v30 and not v31 then
            return;
        else
            task.defer(function() --[[ Line: 301 ]]
                -- upvalues: v20 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                v20.CreateImpactFrame({
                    Time = 0.06
                });
                l_ColorCorrection_0.Saturation = 0;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v79 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v79, {
                    Saturation = -0.4, 
                    Contrast = 0.2
                }):Play();
                local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                l_MenuBlur_1.Size = 0;
                l_MenuBlur_1.Enabled = true;
                local v81 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_1, v81, {
                    Size = 20
                }):Play();
                local v82 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v82, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
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
    v63[2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 336 ]]
        -- upvalues: v63 (copy), v30 (copy), v31 (copy), l_CameraMode_0 (copy), l_CurrentCamera_0 (copy), v62 (copy), v20 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), l_Main_0 (ref), v50 (copy)
        for _, v84 in v63 do
            v84:Disconnect();
        end;
        if v30 or v31 then
            l_CameraMode_0.Value = "Cutscene";
            l_CurrentCamera_0.FieldOfView = 40;
        end;
        for _, v86 in v62.Final2:GetChildren() do
            v86:Emit(v86:GetAttribute("EmitCount") or 2);
        end;
        if not v30 and not v31 then
            return;
        else
            task.defer(function() --[[ Line: 352 ]]
                -- upvalues: v20 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (ref), l_Lighting_0 (ref)
                v20.CreateImpactFrame({
                    Time = 0.06
                });
                local v87 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v87, {
                    Saturation = -0.4, 
                    Contrast = 1
                }):Play();
                local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                l_MenuBlur_2.Size = 0;
                l_MenuBlur_2.Enabled = true;
                local v89 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_2, v89, {
                    Size = 20
                }):Play();
                local v90 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v90, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                task.wait(0.5);
                local v91 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v91, {
                    Saturation = 0, 
                    Contrast = 0
                }):Play();
            end);
            v20.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v20.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 1, 
                Fade = 1
            });
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v50, {
                ImageTransparency = 1
            }):Play();
            return;
        end;
    end);
    if v30 or v31 then
        local v92 = l_Assets_0.Camera:Clone();
        v92.Name = l_Character_0.Name .. "Camera";
        v92.Parent = l_Workspace_0.Debris;
        local v93 = 0;
        do
            local l_v93_0 = v93;
            local function v95() --[[ Line: 395 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v93_0 (ref), v92 (copy), l_Character_0 (copy)
                if os.time() - l_v93_0 < 0.5 then
                    return;
                else
                    l_v93_0 = os.time();
                    v92:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v95();
            local v96 = {
                Animator = v92.AnimationController.Animator, 
                AnimId = v26.Animations.Camera
            };
            local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v96);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 413 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v92 (copy), v95 (copy)
                l_CurrentCamera_0.CFrame = v92.Head.CFrame;
                v95();
            end);
            task.delay(290, function() --[[ Line: 418 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(4.166666666666667);
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
            local v99 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v99, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v20.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v92:Destroy();
        end;
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v26;