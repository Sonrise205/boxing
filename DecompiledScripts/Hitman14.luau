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
local v21 = Random.new();
local function _(v22, v23, v24) --[[ Line: 30 ]] --[[ Name: Lerp ]]
    return v22 + (v23 - v22) * v24;
end;
local v26 = {
    Animations = {
        Character = 13633643142, 
        Victim = 13633643044, 
        Camera = 13633642900
    }
};
v26.Use = function(v27) --[[ Line: 40 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v20 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), v26 (copy), l_AnimHelper_0 (copy), v21 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
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
    local v51 = TweenInfo.new(0.65, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
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
    task.wait(0.5);
    local l_Voiceline_0 = script:FindFirstChild("Voiceline");
    if l_Voiceline_0 and v27.HasVoicelines then
        local v53 = l_SoundHelper_0:PlaySound({
            Name = "Voice", 
            DirectCopy = l_Voiceline_0, 
            Parent = (not not v30 or v31) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
        });
        if not v30 and not v31 then
            v53.Volume = v53.Volume / 5;
        end;
    end;
    task.delay(0.2, function() --[[ Line: 167 ]]
        -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (copy)
        l_SoundHelper_0:PlaySound({
            Speed = 0.8, 
            Name = "SwingBig", 
            Parent = l_Character_0.PrimaryPart
        });
        task.wait(0.06666666666666667);
        l_SoundHelper_0:PlaySound({
            Name = "Step", 
            Parent = l_Character_0.PrimaryPart
        });
    end);
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v30 or v31 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 50;
    end;
    local v56 = {
        Animator = v33, 
        AnimId = v26.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v57 = {
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
    l_AnimHelper_0:CreateAnim(v56);
    l_AnimHelper_0:CreateAnim(v57);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v56);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v57);
    local v60 = script.Effects:Clone();
    v60.Parent = l_Workspace_0.Debris;
    v60.CFrame = l_Victim_0.PrimaryPart.CFrame;
    task.delay(15, function() --[[ Line: 225 ]]
        -- upvalues: v60 (copy)
        v60:Destroy();
    end);
    task.delay(1.1666666666666667, function() --[[ Line: 229 ]]
        -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (copy)
        l_SoundHelper_0:PlaySound({
            Speed = 0.65, 
            Name = "SwingBig", 
            Parent = l_Character_0.PrimaryPart
        });
    end);
    task.delay(1.5, function() --[[ Line: 237 ]]
        -- upvalues: v20 (ref), l_Character_0 (copy)
        v20.AttackTrail({
            Character = l_Character_0, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Hitman", 
                TargetPart = "RightHand", 
                DelayTime = 0, 
                HoldTime = 1, 
                TimeScale = 1
            }
        });
    end);
    local _ = function() --[[ Line: 251 ]] --[[ Name: CreateSlash ]]
        -- upvalues: v60 (copy), v20 (ref), l_Character_0 (copy), v21 (ref)
        task.defer(function() --[[ Line: 252 ]]
            -- upvalues: v60 (ref), v20 (ref), l_Character_0 (ref), v21 (ref)
            local v61 = v60.Slash:Clone();
            v61.Parent = v20.GetWeldCharacter(l_Character_0).PrimaryPart;
            v61.Orientation = Vector3.new(v21:NextNumber(0, 20), 0, v21:NextNumber(-40, 40));
            for _, v63 in v61:GetChildren() do
                v63:Emit(3);
            end;
            task.wait(5);
            v61:Destroy();
        end);
    end;
    local v84 = {
        [1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("ScaryStart"):Connect(function() --[[ Line: 268 ]]
            -- upvalues: l_Character_0 (copy), l_SoundHelper_0 (ref), v30 (copy), v31 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), v20 (ref)
            local v65 = script.Scary:Clone();
            v65.CFrame = l_Character_0.PrimaryPart.CFrame * CFrame.new(-1, 0.5, 0);
            v65.Parent = game.Workspace.Debris;
            l_SoundHelper_0:PlaySound({
                Name = "Scary", 
                Parent = l_Character_0.PrimaryPart
            });
            if v30 or v31 then
                l_ColorCorrection_0.Saturation = 0;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v66 = TweenInfo.new(1.8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v66, {
                    Saturation = -0.2, 
                    Contrast = 0.5
                }):Play();
            end;
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
            for _, v75 in script.Aura2:GetChildren() do
                local v76 = v75:Clone();
                v76.Parent = v20.GetWeldCharacter(l_Character_0).PrimaryPart;
                v76:Emit(1);
                table.insert(v67, v76);
            end;
            task.wait(3);
            for _, v78 in v67 do
                v78.Enabled = false;
            end;
            for _, v80 in v65:GetDescendants() do
                if v80:IsA("ParticleEmitter") then
                    v80.Enabled = false;
                end;
            end;
            task.wait(5);
            for _, v82 in v67 do
                v82:Destroy();
            end;
            v65:Destroy();
        end), 
        [2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Skull"):Connect(function() --[[ Line: 328 ]]
            -- upvalues: v60 (copy), v20 (ref), l_Character_0 (copy)
            local v83 = v60.Skull:Clone();
            v83.Parent = v20.GetWeldCharacter(l_Character_0).Head;
            v83.Glow:Emit(1);
            task.wait(5);
            v83:Destroy();
        end)
    };
    local v85 = 0;
    v84[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Flicker"):Connect(function() --[[ Line: 338 ]]
        -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (copy), v85 (ref), v60 (copy), v20 (ref), v21 (ref), v30 (copy), v31 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
        l_SoundHelper_0:PlaySound({
            Name = "SwingBig", 
            Parent = l_Character_0.PrimaryPart
        });
        l_SoundHelper_0:PlaySound({
            Name = "Hit1", 
            Parent = l_Character_0.PrimaryPart, 
            Speed = 2
        });
        l_SoundHelper_0:PlaySound({
            Name = "Crush", 
            Parent = l_Character_0.PrimaryPart, 
            Speed = 0.8
        });
        if v85 % 7 == 0 then
            l_SoundHelper_0:PlaySound({
                Name = "Whips", 
                Parent = l_Character_0.PrimaryPart
            });
        end;
        local l_Left_0 = v60.Left;
        if v85 % 2 == 0 then
            l_Left_0 = v60.Right;
            task.delay(0.1, function() --[[ Line: 369 ]]
                -- upvalues: v60 (ref), v20 (ref), l_Character_0 (ref), v21 (ref)
                task.defer(function() --[[ Line: 252 ]]
                    -- upvalues: v60 (ref), v20 (ref), l_Character_0 (ref), v21 (ref)
                    local v87 = v60.Slash:Clone();
                    v87.Parent = v20.GetWeldCharacter(l_Character_0).PrimaryPart;
                    v87.Orientation = Vector3.new(v21:NextNumber(0, 20), 0, v21:NextNumber(-40, 40));
                    for _, v89 in v87:GetChildren() do
                        v89:Emit(3);
                    end;
                    task.wait(5);
                    v87:Destroy();
                end);
            end);
        end;
        for _, v91 in l_Left_0:GetChildren() do
            v91:Emit(2);
        end;
        task.defer(function() --[[ Line: 378 ]]
            -- upvalues: v20 (ref), l_Character_0 (ref)
            v20.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "Hitman", 
                    TargetPart = "LeftHand", 
                    DelayTime = 0, 
                    HoldTime = 0.6666666666666666, 
                    TimeScale = 1
                }
            });
        end);
        task.defer(function() --[[ Line: 252 ]]
            -- upvalues: v60 (ref), v20 (ref), l_Character_0 (ref), v21 (ref)
            local v92 = v60.Slash:Clone();
            v92.Parent = v20.GetWeldCharacter(l_Character_0).PrimaryPart;
            v92.Orientation = Vector3.new(v21:NextNumber(0, 20), 0, v21:NextNumber(-40, 40));
            for _, v94 in v92:GetChildren() do
                v94:Emit(3);
            end;
            task.wait(5);
            v92:Destroy();
        end);
        if not v30 and not v31 then
            return;
        else
            v85 = v85 + 1;
            l_ColorCorrection_0.Saturation = 0.1;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v95 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v95, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v97 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v97, {
                Size = 20
            }):Play();
            local v98 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v98, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v20.HUDShake({
                Scale = 20, 
                Damper = 0.35
            });
            v20.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.1, 
                Fade = 0.2
            });
            return;
        end;
    end);
    v84[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 427 ]]
        -- upvalues: v84 (copy), v30 (copy), v31 (copy), l_CameraMode_0 (copy), l_CurrentCamera_0 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v60 (copy), v20 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), l_Main_0 (ref), v50 (copy)
        for _, v100 in v84 do
            v100:Disconnect();
        end;
        if v30 or v31 then
            l_CameraMode_0.Value = "Cutscene";
            l_CurrentCamera_0.FieldOfView = 75;
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
        local l_FinalStart_0 = v60.FinalStart;
        local l_FinalHit_0 = v60.FinalHit;
        task.delay(0, function() --[[ Line: 455 ]]
            -- upvalues: l_FinalStart_0 (copy), l_FinalHit_0 (copy)
            for _, v104 in l_FinalStart_0:GetChildren() do
                v104:Emit(v104:GetAttribute("EmitCount"));
            end;
            task.wait(0.2);
            for _, v106 in l_FinalHit_0:GetChildren() do
                v106:Emit(v106:GetAttribute("EmitCount") or 2);
            end;
            task.wait(5);
            l_FinalStart_0:Destroy();
            l_FinalHit_0:Destroy();
        end);
        if not v30 and not v31 then
            return;
        else
            task.defer(function() --[[ Line: 472 ]]
                -- upvalues: v20 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (ref), l_Lighting_0 (ref)
                v20.CreateImpactFrame({
                    Time = 0.06
                });
                local v107 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v107, {
                    Saturation = -0.4, 
                    Contrast = 1
                }):Play();
                local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                l_MenuBlur_2.Size = 0;
                l_MenuBlur_2.Enabled = true;
                local v109 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_2, v109, {
                    Size = 20
                }):Play();
                local v110 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v110, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                task.wait(0.5);
                local v111 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v111, {
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
        local v112 = l_Assets_0.Camera:Clone();
        v112.Name = l_Character_0.Name .. "Camera";
        v112.Parent = l_Workspace_0.Debris;
        local v113 = 0;
        do
            local l_v113_0 = v113;
            local function v115() --[[ Line: 515 ]] --[[ Name: UpdateCameraCFrame ]]
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
                AnimId = v26.Animations.Camera
            };
            local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v116);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 533 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v112 (copy), v115 (copy)
                l_CurrentCamera_0.CFrame = v112.Head.CFrame;
                v115();
            end);
            task.delay(530, function() --[[ Line: 538 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(8.166666666666666);
            l_l_AnimHelper_0_Anim_2:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.01);
            l_TweenService_0:Create(l_Main_0.White, v51, {
                BackgroundTransparency = 0
            }):Play();
            task.wait(0.3333333333333333);
            l_l_AnimHelper_0_Anim_2:Stop(0.1);
            l_l_AnimHelper_0_Anim_1:Stop(1);
            l_l_AnimHelper_0_Anim_0:Stop(0.1);
            task.wait(0.3333333333333333);
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_CameraMode_0.Value = "";
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v50, {
                ImageTransparency = 1
            }):Play();
            local v119 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v119, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v20.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v112:Destroy();
        end;
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v26;