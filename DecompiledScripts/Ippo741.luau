local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_CollectionService_0 = game:GetService("CollectionService");
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
local v21 = require(l_Parent_0);
local v22 = Random.new();
local function _(v23, v24, v25) --[[ Line: 31 ]] --[[ Name: Lerp ]]
    return v23 + (v24 - v23) * v25;
end;
local v27 = {
    Animations = {
        Character = 17333184285, 
        Victim = 17333196213, 
        Camera = 17333215690
    }
};
local function v35(v28, v29) --[[ Line: 41 ]] --[[ Name: SetTransparency ]]
    -- upvalues: l_Workspace_0 (copy)
    for _, v31 in v28:GetDescendants() do
        if v31.Name == "UnusualParticle" then
            v31.Enabled = v29 == 0;
        end;
        if (v31:IsA("BasePart") or v31:IsA("Decal")) and v31.LocalTransparencyModifier < 1000 then
            v31.LocalTransparencyModifier = v29;
        end;
    end;
    local l_FirstChild_0 = l_Workspace_0.Welds:FindFirstChild(v28.Name);
    if l_FirstChild_0 then
        for _, v34 in l_FirstChild_0:GetDescendants() do
            if v34.Name == "UnusualParticle" then
                v34.Enabled = v29 == 0;
            end;
            if (v34:IsA("BasePart") or v34:IsA("Decal")) and v34.LocalTransparencyModifier < 1000 then
                v34.LocalTransparencyModifier = v29;
            end;
        end;
    end;
end;
v27.Use = function(v36) --[[ Line: 60 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v21 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), v27 (copy), l_AnimHelper_0 (copy), v35 (copy), v22 (copy), l_CollectionService_0 (copy), l_RunService_0 (copy), l_Assets_0 (copy)
    local l_Character_0 = v36.Character;
    local l_Victim_0 = v36.Victim;
    local v39 = l_LocalPlayer_0.Character == l_Character_0;
    local v40 = l_LocalPlayer_0.Character == l_Victim_0;
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v42 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v44 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    for _, v46 in (v42:GetPlayingAnimationTracks()) do
        if v46.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_0 = v46.Speed;
            v46:AdjustSpeed(l_Speed_0 / 4);
            task.delay(2, function() --[[ Line: 82 ]]
                -- upvalues: v46 (copy), l_Speed_0 (copy)
                v46:AdjustSpeed(l_Speed_0);
            end);
        end;
    end;
    for _, v49 in (v44:GetPlayingAnimationTracks()) do
        if v49.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_1 = v49.Speed;
            v49:AdjustSpeed(l_Speed_1 / 4);
            task.delay(2, function() --[[ Line: 94 ]]
                -- upvalues: v49 (copy), l_Speed_1 (copy)
                v49:AdjustSpeed(l_Speed_1);
            end);
        end;
    end;
    task.defer(function() --[[ Line: 99 ]]
        -- upvalues: v39 (copy), v40 (copy), v21 (ref), l_Main_0 (ref)
        if v39 or v40 then
            v21.StatusFrame(v40, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v51 = l_Parent_0.UltimateStart:Clone();
    v51.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v51.Parent = l_Workspace_0.Debris;
    task.delay(20, function() --[[ Line: 109 ]]
        -- upvalues: v51 (copy)
        if v51 then
            v51:Destroy();
        end;
    end);
    for _, v53 in v51.Particle:GetChildren() do
        v53.Enabled = false;
        v53:Emit(v53:GetAttribute("EmitCount"));
    end;
    local v54 = l_Lighting_0.ColorCorrection:Clone();
    v54.Parent = l_Lighting_0;
    if v39 or v40 then
        task.defer(function() --[[ Line: 122 ]]
            -- upvalues: v54 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v51 (copy)
            v54.Saturation = 0;
            v54.Contrast = 0;
            v54.Enabled = true;
            local v55 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(v54, v55, {
                Saturation = -0.7, 
                Contrast = 0.5
            }):Play();
            local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
            l_MenuBlur_0.Size = 0;
            l_MenuBlur_0.Enabled = true;
            local v57 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_0, v57, {
                Size = 10
            }):Play();
            local v58 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v58, {
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
            v51:Destroy();
        end);
    end;
    if v39 or v40 then
        local v59 = l_SoundHelper_0:PlaySound({
            Name = "NewIppoUltSong", 
            Parent = l_Workspace_0.Debris
        });
        local l_Volume_0 = v59.Volume;
        v59.Volume = 0;
        v59.TimePosition = 2.6;
        l_TweenService_0:Create(v59, TweenInfo.new(3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
            Volume = l_Volume_0
        }):Play();
    end;
    local v61 = l_SoundHelper_0:PlaySound({
        Name = "IppoSFX", 
        Parent = l_Character_0
    });
    v61.Volume = 0;
    task.delay(0.83, function() --[[ Line: 177 ]]
        -- upvalues: v61 (copy), v39 (copy), v40 (copy), v36 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v61:Stop();
        if v39 or v40 then
            v61.Volume = 0.25;
        else
            v61.Volume = 0.05;
        end;
        v61:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v36.HasVoicelines then
            local v63 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v39 or v40) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v39 and not v40 then
                v63.Volume = v63.Volume / 5;
            end;
        end;
    end);
    task.wait(0.5);
    local v64 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v65 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v39 or v40 then
        l_TweenService_0:Create(l_Main_0.White, v65, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v65, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v64, {
            ImageTransparency = 0.5
        }):Play();
    end;
    task.wait(0.5);
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v39 or v40 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 35;
    end;
    local v68 = {
        Animator = v42, 
        AnimId = v27.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v69 = {
        Animator = v44, 
        AnimId = v27.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    v21.TeleportModel({
        Character = v36.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame * v36.Offset, 
        TeleportId = v36.TeleportId
    });
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v68);
    l_AnimHelper_0:CreateAnim(v69);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v68);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v69);
    local v72 = nil;
    local l_Brightness_0 = l_Lighting_0.Brightness;
    local l_TimeOfDay_0 = l_Lighting_0.TimeOfDay;
    local v75 = TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
    task.delay(7.75, function() --[[ Line: 259 ]]
        -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v39 (copy), v40 (copy), v72 (ref), v61 (copy)
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.55);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.55);
        if v39 or v40 then
            v72:AdjustSpeed(0.55);
        end;
        v61.PlaybackSpeed = 0.55;
        task.wait(0.4545454545454545);
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
        if v39 or v40 then
            v72:AdjustSpeed(1);
        end;
        v61.PlaybackSpeed = 1;
        task.wait(2);
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.75);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.75);
        if v39 or v40 then
            v72:AdjustSpeed(0.75);
        end;
        v61.PlaybackSpeed = 0.75;
        task.wait(1);
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
        if v39 or v40 then
            v72:AdjustSpeed(1);
        end;
        v61.PlaybackSpeed = 1;
    end);
    local v76 = script.IppoUlt:Clone();
    v76.Parent = l_Workspace_0.Debris;
    v76.CFrame = l_Victim_0.PrimaryPart.CFrame;
    task.delay(20, function() --[[ Line: 292 ]]
        -- upvalues: v76 (copy)
        if v76 then
            v76:Destroy();
        end;
    end);
    task.delay(1.5, function() --[[ Line: 296 ]]
        -- upvalues: v21 (ref), l_Character_0 (copy)
        v21.AttackTrail({
            Character = l_Character_0, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TargetPart = "LeftHand", 
                DelayTime = 0, 
                HoldTime = 1.5, 
                TimeScale = 1
            }
        });
    end);
    local v119 = {
        [1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Swap"):Connect(function() --[[ Line: 311 ]]
            -- upvalues: v39 (copy), v40 (copy), v35 (ref), l_Character_0 (copy), l_CurrentCamera_0 (copy), v54 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v22 (ref), l_CollectionService_0 (ref), l_Victim_0 (copy), l_Workspace_0 (ref), l_RunService_0 (ref)
            if not v39 and not v40 then
                return;
            else
                v35(l_Character_0, 1);
                l_CurrentCamera_0.FieldOfView = 25;
                task.delay(0.16666666666666666, function() --[[ Line: 317 ]]
                    -- upvalues: v54 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref)
                    v54.Saturation = 0;
                    v54.Contrast = 0;
                    v54.Enabled = true;
                    local v77 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(v54, v77, {
                        Saturation = -0.4, 
                        Contrast = 0.2
                    }):Play();
                    local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_1.Size = 0;
                    l_MenuBlur_1.Enabled = true;
                    local v79 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_1, v79, {
                        Size = 20
                    }):Play();
                    local v80 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v80, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                    }):Play();
                    v21.CameraShake({
                        Preset = "HardHitRoll", 
                        WaitTime = 0.25, 
                        Fade = 0.2
                    });
                end);
                local v81 = TweenInfo.new(2.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                local l_FirstChild_1 = workspace.Welds:FindFirstChild(l_Character_0.Name);
                local v83 = l_FirstChild_1 and l_FirstChild_1:FindFirstChild("WeldCharacter");
                local v84 = v83 and v83:FindFirstChild("GloveModelLeft");
                local v85 = v84 and v84:FindFirstChild("LeftLowerArm");
                local v86 = script.BarrageArms:Clone();
                local l_Shirt_0 = l_Character_0:FindFirstChildWhichIsA("Shirt");
                if l_Shirt_0 then
                    l_Shirt_0:Clone().Parent = v86;
                end;
                local _ = CFrame.new(v22:NextNumber(-2.1, 2.1), v22:NextNumber(-1.2, 2.3), 0);
                local v89 = nil;
                v89 = v86["Left Arm"];
                v86["Right Arm"]:Destroy();
                v89.Color = l_Character_0.LeftLowerArm.Color;
                task.delay(10, function() --[[ Line: 364 ]]
                    -- upvalues: v86 (copy)
                    if v86 then
                        v86:Destroy();
                    end;
                end);
                local v90 = nil;
                if v85 then
                    v90 = v85:Clone();
                    v90.Parent = v89;
                    for _, v92 in v90:GetDescendants() do
                        if v92:IsA("Weld") or v92:IsA("ParticleEmitter") then
                            v92:Destroy();
                        end;
                        if v92:IsA("BasePart") then
                            for _, v94 in l_CollectionService_0:GetTags(v92) do
                                l_CollectionService_0:RemoveTag(v92, v94);
                            end;
                        end;
                    end;
                    local l_Weld_0 = Instance.new("Weld");
                    l_Weld_0.Name = "Delete";
                    l_Weld_0.Parent = v90.Middle;
                    l_Weld_0.Part0 = v90.Middle;
                    l_Weld_0.Part1 = v89;
                    l_Weld_0.C0 = CFrame.new(0, 1.7, 0);
                end;
                v89.Transparency = v89.Transparency * 0.7;
                if v90 then
                    for _, v97 in v90:GetDescendants() do
                        if v97:IsA("BasePart") then
                            v97.Transparency = v97.Transparency * 0.7;
                        end;
                    end;
                end;
                task.delay(0.1, function() --[[ Line: 401 ]]
                    -- upvalues: l_TweenService_0 (ref), v89 (ref), v81 (copy), v90 (ref)
                    l_TweenService_0:Create(v89, v81, {
                        Transparency = 1
                    }):Play();
                    if v90 then
                        for _, v99 in v90:GetDescendants() do
                            if v99:IsA("BasePart") then
                                l_TweenService_0:Create(v99, v81, {
                                    Transparency = 1
                                }):Play();
                            end;
                        end;
                    end;
                end);
                local v100 = tick();
                v89.Size = Vector3.new(1, 3.4200000762939453, 1, 0);
                local v101 = l_Victim_0.PrimaryPart.CFrame * CFrame.new(0, 0, -6) * CFrame.Angles(-1.5707963267948966, 0, 0);
                local v102 = l_Victim_0.PrimaryPart.CFrame * CFrame.new(0, 0, -0.7) * CFrame.Angles(-1.5707963267948966, 0, 0);
                v89.CFrame = v101;
                v86.Parent = l_Workspace_0.Debris;
                local v103 = script.WindStartup:Clone();
                v103.Parent = l_Workspace_0.Debris;
                v103.CFrame = v102;
                for _, v105 in v103.Particle:GetChildren() do
                    v105:Emit(1);
                end;
                local v106 = nil;
                v106 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 430 ]]
                    -- upvalues: v100 (copy), l_TweenService_0 (ref), v89 (ref), v101 (copy), v102 (copy)
                    local v107 = math.clamp((tick() - v100) / 1, 0, 1);
                    local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v107, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                    v89.CFrame = v101:Lerp(v102, l_l_TweenService_0_Value_0);
                end);
                task.wait(5);
                v106:Disconnect();
                v103:Destroy();
                v89:Destroy();
                return;
            end;
        end), 
        [2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Dash"):Connect(function() --[[ Line: 442 ]]
            -- upvalues: v39 (copy), v40 (copy), v35 (ref), l_Character_0 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v21 (ref)
            if not v39 and not v40 then
                return;
            else
                v35(l_Character_0, 0);
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    FieldOfView = 35
                }):Play();
                task.delay(0.6666666666666666, function() --[[ Line: 448 ]]
                    -- upvalues: v21 (ref)
                    v21.CameraShake({
                        Preset = "MedHit", 
                        WaitTime = 0.4, 
                        Fade = 0.4
                    });
                end);
                v21.CameraShake({
                    Preset = "LightHit", 
                    WaitTime = 0.2, 
                    Fade = 0.2
                });
                return;
            end;
        end), 
        [3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Uppercut"):Connect(function() --[[ Line: 463 ]]
            -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (copy), v76 (copy), v39 (copy), v40 (copy), l_CurrentCamera_0 (copy), l_TweenService_0 (ref), v21 (ref), v54 (copy), l_Lighting_0 (ref)
            l_SoundHelper_0:PlaySound({
                Name = "KnockdownPunch", 
                Parent = l_Character_0.PrimaryPart
            });
            l_SoundHelper_0:PlaySound({
                Name = "FlameHit1", 
                Parent = l_Character_0.PrimaryPart
            });
            l_SoundHelper_0:PlaySound({
                Name = "BoxLayer", 
                Parent = l_Character_0.PrimaryPart
            });
            for _, v110 in v76.Uppercut:GetChildren() do
                v110:Emit(2);
            end;
            for _, v112 in v76.Uppercut2:GetChildren() do
                v112:Emit(2);
            end;
            if not v39 and not v40 then
                return;
            else
                task.delay(0.5333333333333333, function() --[[ Line: 489 ]]
                    -- upvalues: l_CurrentCamera_0 (ref), l_TweenService_0 (ref)
                    l_CurrentCamera_0.FieldOfView = 22;
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        FieldOfView = 35
                    }):Play();
                end);
                task.defer(function() --[[ Line: 494 ]]
                    -- upvalues: v21 (ref), v54 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                    v21.CreateImpactFrame({
                        Time = 0.1
                    });
                    v54.Saturation = 0;
                    v54.Contrast = 0;
                    v54.Enabled = true;
                    local v113 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(v54, v113, {
                        Saturation = -0.4, 
                        Contrast = 0.6
                    }):Play();
                    local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_2.Size = 0;
                    l_MenuBlur_2.Enabled = true;
                    local v115 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_2, v115, {
                        Size = 30
                    }):Play();
                    local v116 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v116, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.4
                    }):Play();
                end);
                v21.HUDShake({
                    Scale = 20, 
                    Damper = 0.09999999999999999
                });
                v21.CameraShake({
                    Preset = "HardHitRoll", 
                    WaitTime = 1, 
                    Fade = 0.5
                });
                task.defer(function() --[[ Line: 528 ]]
                    -- upvalues: v21 (ref)
                    v21.CameraShake({
                        Preset = "LightHit", 
                        WaitTime = 8, 
                        Fade = 5
                    });
                end);
                return;
            end;
        end), 
        [4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Dempsey"):Connect(function() --[[ Line: 537 ]]
            -- upvalues: l_Character_0 (copy), v21 (ref), v76 (copy)
            task.defer(function() --[[ Line: 538 ]]
                -- upvalues: l_Character_0 (ref), v21 (ref)
                local v117 = {
                    Step = 1, 
                    MaxTime = 3.5, 
                    DeleteDelay = 0.4, 
                    AddTransparency = 0.99, 
                    Character = l_Character_0
                };
                v21.AfterimageEffect(v117);
            end);
            task.wait(2.5);
            local v118 = v76.EyeGlow:Clone();
            v118.Parent = v21.GetWeldCharacter(l_Character_0).Head;
            v118.Glow:Emit(10);
            task.wait(5);
            v118:Destroy();
        end), 
        [5] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("StartHit"):Connect(function() --[[ Line: 560 ]]
            -- upvalues: v39 (copy), v40 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy)
            if not v39 and not v40 then
                return;
            else
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    FieldOfView = 35
                }):Play();
                return;
            end;
        end)
    };
    local v120 = 0;
    v119[6] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hit"):Connect(function() --[[ Line: 566 ]]
        -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (copy), v76 (copy), v120 (ref), v21 (ref), v39 (copy), v40 (copy), v54 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
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
        local l_Left_0 = v76.Left;
        local v122 = "LeftHand";
        if v120 % 2 == 0 then
            l_Left_0 = v76.Right;
            v122 = "RightHand";
        end;
        for _, v124 in l_Left_0:GetChildren() do
            v124:Emit(2);
        end;
        task.defer(function() --[[ Line: 603 ]]
            -- upvalues: v21 (ref), l_Character_0 (ref), v122 (ref)
            v21.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TargetPart = v122, 
                    DelayTime = 0, 
                    HoldTime = 0.6666666666666666, 
                    TimeScale = 1
                }
            });
        end);
        if not v39 and not v40 then
            return;
        else
            v120 = v120 + 1;
            v54.Saturation = 0.1;
            v54.Contrast = 0;
            v54.Enabled = true;
            local v125 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(v54, v125, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
            l_MenuBlur_3.Size = 0;
            l_MenuBlur_3.Enabled = true;
            local v127 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_3, v127, {
                Size = 20
            }):Play();
            local v128 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v128, {
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
    v119[7] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final1"):Connect(function() --[[ Line: 648 ]]
        -- upvalues: v39 (copy), v40 (copy), v54 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), l_CurrentCamera_0 (copy), v21 (ref)
        if not v39 and not v40 then
            return;
        else
            v54.Saturation = 0.4;
            v54.Contrast = 0;
            v54.Enabled = true;
            local v129 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(v54, v129, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
            l_MenuBlur_4.Size = 0;
            l_MenuBlur_4.Enabled = true;
            local v131 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_4, v131, {
                Size = 20
            }):Play();
            local v132 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v132, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                FieldOfView = 23
            }):Play();
            v21.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.1, 
                Fade = 0.2
            });
            return;
        end;
    end);
    v119[8] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final2"):Connect(function() --[[ Line: 677 ]]
        -- upvalues: v119 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v76 (copy), v39 (copy), v40 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v21 (ref), v54 (copy), l_Lighting_0 (ref)
        for _, v134 in v119 do
            v134:Disconnect();
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
        for _, v136 in v76.Final:GetChildren() do
            v136:Emit(2);
        end;
        if not v39 and not v40 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                FieldOfView = 40
            }):Play();
            task.defer(function() --[[ Line: 705 ]]
                -- upvalues: v21 (ref), v54 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                v21.CreateImpactFrame({
                    Time = 0.1
                });
                v54.Saturation = 0;
                v54.Contrast = 0;
                v54.Enabled = true;
                local v137 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(v54, v137, {
                    Saturation = -1, 
                    Contrast = 1
                }):Play();
                local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
                l_MenuBlur_5.Size = 0;
                l_MenuBlur_5.Enabled = true;
                local v139 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_5, v139, {
                    Size = 25
                }):Play();
                local v140 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v140, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
                }):Play();
            end);
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v21.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.3, 
                Fade = 1.5
            });
            return;
        end;
    end);
    if v39 or v40 then
        local v141 = l_Assets_0.Camera:Clone();
        v141.Name = l_Character_0.Name .. "Camera";
        v141.Parent = l_Workspace_0.Debris;
        local v142 = 0;
        do
            local l_v142_0 = v142;
            local function v144() --[[ Line: 746 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v142_0 (ref), v141 (copy), l_Character_0 (copy)
                if os.time() - l_v142_0 < 0.5 then
                    return;
                else
                    l_v142_0 = os.time();
                    v141:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v144();
            local v145 = {
                Animator = v141.AnimationController.Animator, 
                AnimId = v27.Animations.Camera
            };
            v72 = l_AnimHelper_0:CreateAnim(v145);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 764 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v141 (copy), v144 (copy)
                l_CurrentCamera_0.CFrame = v141.Head.CFrame;
                v144();
            end);
            task.wait(11.916666666666666);
            v72:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.01);
            l_TweenService_0:Create(l_Main_0.White, v65, {
                BackgroundTransparency = 0
            }):Play();
            task.wait(0.3333333333333333);
            v72:AdjustSpeed(1);
            l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_CameraMode_0.Value = "";
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v64, {
                ImageTransparency = 1
            }):Play();
            local v147 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v147, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v141:Destroy();
            for _, v149 in v76:GetDescendants() do
                if v149:IsA("ParticleEmitter") then
                    v149.Enabled = false;
                end;
            end;
            l_TweenService_0:Create(l_Lighting_0, v75, {
                Brightness = l_Brightness_0
            }):Play();
            l_Lighting_0.TimeOfDay = l_TimeOfDay_0;
        end;
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v27;