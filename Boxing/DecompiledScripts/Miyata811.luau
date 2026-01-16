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
local l_NumberSequenceTween_0 = require(l_ReplicatedStorage_0:WaitForChild("NumberSequenceTween"));
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
        Character = 13682508488, 
        Victim = 13682527848, 
        Camera = 13682553454
    }
};
v27.Use = function(v28) --[[ Line: 41 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v21 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), v27 (copy), l_AnimHelper_0 (copy), l_NumberSequenceTween_0 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
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
            task.delay(2, function() --[[ Line: 63 ]]
                -- upvalues: v38 (copy), l_Speed_0 (copy)
                v38:AdjustSpeed(l_Speed_0);
            end);
        end;
    end;
    for _, v41 in (v36:GetPlayingAnimationTracks()) do
        if v41.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_1 = v41.Speed;
            v41:AdjustSpeed(l_Speed_1 / 4);
            task.delay(2, function() --[[ Line: 75 ]]
                -- upvalues: v41 (copy), l_Speed_1 (copy)
                v41:AdjustSpeed(l_Speed_1);
            end);
        end;
    end;
    task.defer(function() --[[ Line: 80 ]]
        -- upvalues: v31 (copy), v32 (copy), v21 (ref), l_Main_0 (ref)
        if v31 or v32 then
            v21.StatusFrame(v32, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v43 = l_Parent_0.UltimateStart:Clone();
    v43.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v43.Parent = l_Workspace_0.Debris;
    task.delay(20, function() --[[ Line: 90 ]]
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
        task.defer(function() --[[ Line: 102 ]]
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
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.5, 
                Fade = 0.5
            });
            task.wait(5);
            v43:Destroy();
        end);
    end;
    if v31 or v32 then
        l_SoundHelper_0:PlaySound({
            Name = "IppoUltSong", 
            Parent = l_Workspace_0.Debris
        });
    end;
    task.wait(0.5);
    local v51 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v52 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v31 or v32 then
        l_TweenService_0:Create(l_Main_0.White, v52, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v52, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v51, {
            ImageTransparency = 0.5
        }):Play();
    end;
    local v53 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v31 or v32) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v53.Volume;
    v53.Volume = 0;
    task.delay(0.25, function() --[[ Line: 162 ]]
        -- upvalues: v53 (copy), v31 (copy), v32 (copy), l_Volume_0 (copy), v28 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v53:Stop();
        if v31 or v32 then
            v53.Volume = l_Volume_0;
        else
            v53.Volume = l_Volume_0 / 5;
        end;
        v53:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v28.HasVoicelines then
            local v56 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v31 or v32) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v31 and not v32 then
                v56.Volume = v56.Volume / 5;
            end;
        end;
    end);
    task.wait(0.5);
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v31 or v32 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 65;
    end;
    local v59 = {
        Animator = v34, 
        AnimId = v27.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v60 = {
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
    l_AnimHelper_0:CreateAnim(v59);
    l_AnimHelper_0:CreateAnim(v60);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v59);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v60);
    local v63 = script.Effects:Clone();
    v63.Parent = l_Workspace_0.Debris;
    v63.CFrame = l_Victim_0.PrimaryPart.CFrame;
    task.delay(10, function() --[[ Line: 233 ]]
        -- upvalues: v63 (copy)
        v63:Destroy();
    end);
    task.delay(1.8333333333333333, function() --[[ Line: 237 ]]
        -- upvalues: v21 (ref), l_Character_0 (copy)
        v21.AttackTrail({
            Character = l_Character_0, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "RedUltimate", 
                TargetPart = "RightHand", 
                DelayTime = 0, 
                HoldTime = 2.6666666666666665, 
                TimeScale = 1
            }
        });
    end);
    local v84 = {
        [1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("FootSmoke"):Connect(function() --[[ Line: 253 ]]
            -- upvalues: v63 (copy), v21 (ref), l_Character_0 (copy), v31 (copy), v32 (copy)
            local v64 = v63.FootSmoke:Clone();
            v64.Parent = v21.GetWeldCharacter(l_Character_0).LeftFoot;
            for _, v66 in v64:GetChildren() do
                v66:Emit(2);
            end;
            task.delay(5, function() --[[ Line: 261 ]]
                -- upvalues: v64 (copy)
                if v64 then
                    v64:Destroy();
                end;
            end);
            if not v31 and not v32 then
                return;
            else
                v21.CameraShake({
                    Preset = "LightHit", 
                    WaitTime = 0.2, 
                    Fade = 0.2
                });
                return;
            end;
        end), 
        [2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Aura"):Connect(function() --[[ Line: 276 ]]
            -- upvalues: l_Character_0 (copy)
            local v67 = {};
            local l_Aura_0 = script.Aura;
            for _, v70 in l_Character_0:GetChildren() do
                if v70:IsA("BasePart") then
                    for _, v72 in l_Aura_0:GetChildren() do
                        local v73 = v72:Clone();
                        v73.Parent = v70;
                        table.insert(v67, v73);
                    end;
                end;
            end;
            task.delay(7.166666666666667, function() --[[ Line: 290 ]]
                -- upvalues: v67 (copy)
                for _, v75 in v67 do
                    v75.Enabled = false;
                end;
                task.wait(2);
                for _, v77 in v67 do
                    v77:Destroy();
                end;
            end);
        end), 
        [3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Connect"):Connect(function() --[[ Line: 303 ]]
            -- upvalues: v63 (copy), v31 (copy), v32 (copy), v21 (ref), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
            for _, v79 in v63.Uppercut:GetChildren() do
                v79:Emit(3);
            end;
            if not v31 and not v32 then
                return;
            else
                task.defer(function() --[[ Line: 310 ]]
                    -- upvalues: v21 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                    v21.CreateImpactFrame({
                        Time = 0.1
                    });
                    l_ColorCorrection_0.Saturation = 0;
                    l_ColorCorrection_0.Contrast = 0;
                    l_ColorCorrection_0.Enabled = true;
                    local v80 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_0, v80, {
                        Saturation = -0.3, 
                        Contrast = 0.1
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
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.1
                    }):Play();
                end);
                v21.HUDShake({
                    Scale = 20, 
                    Damper = 0.09999999999999999
                });
                v21.CameraShake({
                    Preset = "LightHit", 
                    WaitTime = 2.5, 
                    Fade = 0.3
                });
                return;
            end;
        end)
    };
    local v85 = CFrame.new();
    v84[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Jolt"):Connect(function() --[[ Line: 347 ]]
        -- upvalues: v84 (copy), v63 (copy), l_Victim_0 (copy), v31 (copy), v32 (copy), l_NumberSequenceTween_0 (ref), l_CameraMode_0 (copy), l_CurrentCamera_0 (copy), v85 (ref), v21 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), l_Main_0 (ref), v51 (copy)
        for _, v87 in v84 do
            v87:Disconnect();
        end;
        for _, v89 in v63.Final:GetChildren() do
            v89:Emit(v89:GetAttribute("EmitCount") or 2);
        end;
        local v90 = script.Final:Clone();
        v90.CFrame = l_Victim_0.PrimaryPart.CFrame * CFrame.new(0, -5, (not not v31 or v32) and 5 or 0) * CFrame.Angles(3.141592653589793, 0, 0);
        v90.Parent = game.Workspace.Debris;
        task.delay(1.7, function() --[[ Line: 360 ]]
            -- upvalues: v90 (copy), l_NumberSequenceTween_0 (ref)
            for _, v92 in v90:GetDescendants() do
                if v92:IsA("Beam") then
                    l_NumberSequenceTween_0.Tween(v92, 20);
                end;
                if v92:IsA("ParticleEmitter") then
                    v92.Enabled = false;
                end;
            end;
        end);
        if not v31 and not v32 then
            return;
        else
            l_CameraMode_0.Value = "Cutscene";
            l_CurrentCamera_0.FieldOfView = 50;
            v85 = CFrame.new(1, -0.1, 0);
            task.defer(function() --[[ Line: 377 ]]
                -- upvalues: v21 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (ref), l_Lighting_0 (ref)
                v21.CreateImpactFrame({
                    Time = 0.1
                });
                local v93 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v93, {
                    Saturation = -0.4, 
                    Contrast = 1
                }):Play();
                local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                l_MenuBlur_2.Size = 0;
                l_MenuBlur_2.Enabled = true;
                local v95 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_2, v95, {
                    Size = 20
                }):Play();
                local v96 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v96, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                task.wait(0.5);
                local v97 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v97, {
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
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v51, {
                ImageTransparency = 1
            }):Play();
            return;
        end;
    end);
    if v31 or v32 then
        local v98 = l_Assets_0.Camera:Clone();
        v98.Name = l_Character_0.Name .. "Camera";
        v98.Parent = l_Workspace_0.Debris;
        local v99 = 0;
        do
            local l_v99_0 = v99;
            local function v101() --[[ Line: 420 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v99_0 (ref), v98 (copy), l_Character_0 (copy)
                if os.time() - l_v99_0 < 0.5 then
                    return;
                else
                    l_v99_0 = os.time();
                    v98:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v101();
            local v102 = {
                Animator = v98.AnimationController.Animator, 
                AnimId = v27.Animations.Camera
            };
            local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v102);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 438 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v98 (copy), v85 (ref), v101 (copy)
                l_CurrentCamera_0.CFrame = v98.Head.CFrame * v85;
                v101();
            end);
            task.delay(540, function() --[[ Line: 443 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(8.333333333333334);
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
            task.wait(0.3333333333333333);
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_CameraMode_0.Value = "";
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v51, {
                ImageTransparency = 1
            }):Play();
            local v105 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v105, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v98:Destroy();
        end;
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v27;