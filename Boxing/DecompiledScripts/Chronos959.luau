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
local v14 = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules", 10):WaitForChild("EmoteHelper", 10));
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local l_BubbleModule_0 = require(l_ReplicatedStorage_0:WaitForChild("BubbleModule"));
local l_Parent_0 = script.Parent.Parent;
local v22 = require(l_Parent_0);
local _ = Random.new();
local function _(v24, v25, v26) --[[ Line: 34 ]] --[[ Name: Lerp ]]
    return v24 + (v25 - v24) * v26;
end;
local v28 = {
    Animations = {
        Character = 17121993251, 
        Victim = 17122013380, 
        Camera = 17122024902
    }
};
v28.Use = function(v29) --[[ Line: 44 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v22 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_TweenService_0 (copy), v28 (copy), l_AnimHelper_0 (copy), l_ReplicatedStorage_0 (copy), l_BubbleModule_0 (copy), l_Assets_0 (copy), l_RunService_0 (copy), v14 (copy)
    local l_Character_0 = v29.Character;
    local l_Victim_0 = v29.Victim;
    local l_IsVariant_0 = v29.IsVariant;
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
            task.delay(2, function() --[[ Line: 67 ]]
                -- upvalues: v40 (copy), l_Speed_0 (copy)
                v40:AdjustSpeed(l_Speed_0);
            end);
        end;
    end;
    for _, v43 in (v38:GetPlayingAnimationTracks()) do
        if v43.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_1 = v43.Speed;
            v43:AdjustSpeed(l_Speed_1 / 4);
            task.delay(2, function() --[[ Line: 79 ]]
                -- upvalues: v43 (copy), l_Speed_1 (copy)
                v43:AdjustSpeed(l_Speed_1);
            end);
        end;
    end;
    task.defer(function() --[[ Line: 84 ]]
        -- upvalues: v33 (copy), v34 (copy), v22 (ref), l_Main_0 (ref)
        if v33 or v34 then
            v22.StatusFrame(v34, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v45 = l_Parent_0.UltimateStart:Clone();
    v45.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v45.Parent = l_Workspace_0.Debris;
    task.delay(20, function() --[[ Line: 94 ]]
        -- upvalues: v45 (copy)
        if v45 then
            v45:Destroy();
        end;
    end);
    for _, v47 in v45.Particle:GetChildren() do
        v47.Enabled = false;
        v47:Emit(v47:GetAttribute("EmitCount"));
    end;
    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
    local v49 = l_SoundHelper_0:PlaySound({
        Name = "ChronosSFX", 
        Parent = l_Character_0
    });
    v49.Volume = 0;
    task.delay(0.93, function() --[[ Line: 112 ]]
        -- upvalues: v49 (copy), v33 (copy), v34 (copy), v29 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v49:Stop();
        if v33 or v34 then
            v49.Volume = 0.35;
        else
            v49.Volume = 0.05;
        end;
        v49:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v29.HasVoicelines then
            local v51 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v33 or v34) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v33 and not v34 then
                v51.Volume = v51.Volume / 5;
            end;
        end;
    end);
    if v33 or v34 then
        task.delay(0.93, function() --[[ Line: 138 ]]
            -- upvalues: l_SoundHelper_0 (ref), l_IsVariant_0 (copy), l_Workspace_0 (ref)
            local _ = l_SoundHelper_0:PlaySound({
                Name = "ChronosUltSong" .. (l_IsVariant_0 and "Variant" or ""), 
                Parent = l_Workspace_0.Debris
            }).Volume;
        end);
    end;
    task.wait(0.5);
    local v53 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v54 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v33 or v34 then
        l_TweenService_0:Create(l_Main_0.White, v54, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v54, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v53, {
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
    local v57 = {
        Animator = v36, 
        AnimId = v28.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v58 = {
        Animator = v38, 
        AnimId = v28.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    v22.TeleportModel({
        Character = v29.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame * v29.Offset, 
        TeleportId = v29.TeleportId
    });
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v57);
    l_AnimHelper_0:CreateAnim(v58);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v57);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v58);
    local v61 = nil;
    local v62 = script.EffectParticles:Clone();
    v62.Parent = l_Workspace_0.Debris;
    v62.CFrame = l_Victim_0.PrimaryPart.CFrame;
    task.delay(22, function() --[[ Line: 207 ]]
        -- upvalues: v62 (ref)
        v62:Destroy();
    end);
    local v63 = {};
    if l_IsVariant_0 then
        task.delay(6.666666666666667, function() --[[ Line: 214 ]]
            -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), v49 (copy), v58 (copy), l_l_AnimHelper_0_Anim_1 (ref), l_AnimHelper_0 (ref), v61 (ref)
            l_l_AnimHelper_0_Anim_0.TimePosition = 10.016666666666667;
            v49.TimePosition = 10.016666666666667;
            v58.TimePosition = 10.016666666666667;
            l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v58);
            l_l_AnimHelper_0_Anim_1.TimePosition = 10.016666666666667;
            if v61 then
                v61.TimePosition = 10.016666666666667;
            end;
        end);
    end;
    local function v73(v64, v65) --[[ Line: 226 ]] --[[ Name: SetTransparency ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), l_Workspace_0 (ref)
        for _, v67 in v64:GetDescendants() do
            if v67.Name == "UnusualParticle" then
                v67.Enabled = v65 == 0;
                if not v67.Enabled then
                    local l_Parent_1 = v67.Parent;
                    v67.Parent = l_ReplicatedStorage_0;
                    v67.Parent = l_Parent_1;
                end;
            end;
            if (v67:IsA("BasePart") or v67:IsA("Decal")) and v67.LocalTransparencyModifier < 1000 then
                v67.LocalTransparencyModifier = v65;
            end;
        end;
        local l_FirstChild_0 = l_Workspace_0.Welds:FindFirstChild(v64.Name);
        if l_FirstChild_0 then
            for _, v71 in l_FirstChild_0:GetDescendants() do
                if v71.Name == "UnusualParticle" then
                    v71.Enabled = v65 == 0;
                    if not v71.Enabled then
                        local l_Parent_2 = v71.Parent;
                        v71.Parent = l_ReplicatedStorage_0;
                        v71.Parent = l_Parent_2;
                    end;
                end;
                if (v71:IsA("BasePart") or v71:IsA("Decal")) and v71.LocalTransparencyModifier < 1000 then
                    v71.LocalTransparencyModifier = v65;
                end;
            end;
        end;
    end;
    v63[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("ShuffleStart"):Connect(function() --[[ Line: 263 ]]
        -- upvalues: v33 (copy), v34 (copy), v73 (copy), l_Victim_0 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy)
        if not v33 and not v34 then
            return;
        else
            v73(l_Victim_0, 1);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 40
            }):Play();
            return;
        end;
    end);
    v63[2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Switch"):Connect(function() --[[ Line: 270 ]]
        -- upvalues: v33 (copy), v34 (copy), v73 (copy), l_Victim_0 (copy), l_CurrentCamera_0 (copy), l_TweenService_0 (ref)
        if not v33 and not v34 then
            return;
        else
            v73(l_Victim_0, 0);
            l_CurrentCamera_0.FieldOfView = 80;
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 60
            }):Play();
            return;
        end;
    end);
    v63[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Dodge"):Connect(function() --[[ Line: 278 ]]
        -- upvalues: v33 (copy), v34 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v22 (ref), l_Character_0 (copy), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        if not v33 and not v34 then
            return;
        else
            task.delay(1.5, function() --[[ Line: 281 ]]
                -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_0 (ref), v22 (ref)
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    FieldOfView = 70
                }):Play();
                v22.CameraShake({
                    Preset = "LightHit", 
                    WaitTime = 0.5, 
                    Fade = 1
                });
            end);
            task.delay(1.8, function() --[[ Line: 291 ]]
                -- upvalues: v22 (ref), l_Character_0 (ref)
                v22.AttackTrail({
                    Character = l_Character_0, 
                    TrailInfo = {
                        EffectName = "AttackTrail", 
                        TrailName = "Chronos", 
                        TargetPart = "RightHand", 
                        DelayTime = 0, 
                        HoldTime = 0.6666666666666666, 
                        TimeScale = 1
                    }
                });
            end);
            local v74 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v74, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
            l_MenuBlur_0.Size = 0;
            l_MenuBlur_0.Enabled = true;
            local v76 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_0, v76, {
                Size = 10
            }):Play();
            local v77 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v77, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            return;
        end;
    end);
    v63[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("HitStart"):Connect(function() --[[ Line: 319 ]]
        -- upvalues: v62 (ref), l_BubbleModule_0 (ref), l_Victim_0 (copy), v33 (copy), v34 (copy), l_CurrentCamera_0 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v22 (ref)
        for _, v79 in v62.Uppercut:GetChildren() do
            v79:Emit(2);
        end;
        l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(10, 10, 10, 0), 0.3);
        if not v33 and not v34 then
            return;
        else
            l_CurrentCamera_0.FieldOfView = 60;
            l_ColorCorrection_0.Saturation = 0.4;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v80 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v80, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v82 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v82, {
                Size = 20
            }):Play();
            local v83 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v83, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.1
            }):Play();
            task.defer(function() --[[ Line: 347 ]]
                -- upvalues: v22 (ref)
                task.wait(0.06666666666666667);
                v22.CreateImpactFrame({
                    Time = 0.1
                });
            end);
            v22.CameraShake({
                Preset = "SuperHardHit", 
                WaitTime = 0.6, 
                Fade = 1.5
            });
            return;
        end;
    end);
    local v84 = 0;
    v63[5] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hit"):Connect(function() --[[ Line: 362 ]]
        -- upvalues: v84 (ref), v22 (ref), l_Character_0 (copy), v62 (ref), v33 (copy), v34 (copy), l_CurrentCamera_0 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
        local v85 = "Left";
        if v84 % 2 == 0 then
            v85 = "Right";
        end;
        v84 = v84 + 1;
        task.defer(function() --[[ Line: 371 ]]
            -- upvalues: v22 (ref), l_Character_0 (ref), v85 (ref)
            v22.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "Chronos", 
                    TargetPart = v85 .. "Hand", 
                    DelayTime = 0, 
                    HoldTime = 0.16666666666666666, 
                    TimeScale = 1
                }
            });
        end);
        if v84 < 6 then
            v85 = v85 .. "Block";
        end;
        for _, v87 in v62:FindFirstChild(v85):GetChildren() do
            v87:Emit(2);
        end;
        v22.HUDShake({
            Scale = 20, 
            Damper = 0.35
        });
        if not v33 and not v34 then
            return;
        else
            l_CurrentCamera_0.FieldOfView = 70;
            if v84 < 6 then
                v22.CameraShake({
                    Preset = "MedHit", 
                    WaitTime = 0.2, 
                    Fade = 0.4
                });
            else
                v22.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.1, 
                    Fade = 0.4
                });
                l_ColorCorrection_0.Saturation = 0.1;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v88 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v88, {
                    Saturation = -0.1, 
                    Contrast = 0.1
                }):Play();
                local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                l_MenuBlur_2.Size = 0;
                l_MenuBlur_2.Enabled = true;
                local v90 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_2, v90, {
                    Size = 5
                }):Play();
                local v91 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v91, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.1
                }):Play();
            end;
            return;
        end;
    end);
    v63[6] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Moonwalk"):Connect(function() --[[ Line: 434 ]]
        -- upvalues: v33 (copy), v34 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v22 (ref)
        if not v33 and not v34 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 52
            }):Play();
            v22.CameraShake({
                Preset = "LightHit", 
                WaitTime = 0.1, 
                Fade = 0.5
            });
            return;
        end;
    end);
    v63[7] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Jump"):Connect(function() --[[ Line: 445 ]]
        -- upvalues: v22 (ref), l_Character_0 (copy), v33 (copy), v34 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        task.defer(function() --[[ Line: 446 ]]
            -- upvalues: v22 (ref), l_Character_0 (ref)
            v22.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "Chronos", 
                    TargetPart = "RightHand", 
                    DelayTime = 0, 
                    HoldTime = 3.2, 
                    TimeScale = 0.1
                }
            });
        end);
        if not v33 and not v34 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 60
            }):Play();
            local v92 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v92, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
            l_MenuBlur_3.Size = 0;
            l_MenuBlur_3.Enabled = true;
            local v94 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_3, v94, {
                Size = 10
            }):Play();
            local v95 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v95, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.defer(function() --[[ Line: 477 ]]
                -- upvalues: l_Character_0 (ref), v22 (ref)
                local v96 = {
                    Step = 1, 
                    MaxTime = 0.11666666666666667, 
                    DeleteDelay = 0.2, 
                    AddTransparency = 0.985, 
                    Character = l_Character_0
                };
                v22.AfterimageEffect(v96);
            end);
            v22.CameraShake({
                Preset = "MedHit", 
                WaitTime = 0.2, 
                Fade = 0.2
            });
            return;
        end;
    end);
    v63[8] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Clipped"):Connect(function() --[[ Line: 496 ]]
        -- upvalues: v33 (copy), v34 (copy), v22 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        if not v33 and not v34 then
            return;
        else
            task.defer(function() --[[ Line: 499 ]]
                -- upvalues: v22 (ref)
                v22.CameraShake({
                    Preset = "SuperHardHit", 
                    WaitTime = 0.05, 
                    Fade = 0.2
                });
            end);
            local v97 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v97, {
                Saturation = 0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
            l_MenuBlur_4.Size = 0;
            l_MenuBlur_4.Enabled = true;
            local v99 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_4, v99, {
                Size = 5
            }):Play();
            task.wait(1);
            v22.CameraShake({
                Preset = "MedHit", 
                WaitTime = 0.5, 
                Fade = 1
            });
            return;
        end;
    end);
    v63[9] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 526 ]]
        -- upvalues: v63 (copy), l_IsVariant_0 (copy), v62 (ref), v33 (copy), v34 (copy), l_ColorCorrection_0 (copy), l_BubbleModule_0 (ref), l_Victim_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v22 (ref)
        for _, v101 in v63 do
            v101:Disconnect();
        end;
        if l_IsVariant_0 then
            for _, v103 in v62.Final:GetChildren() do
                v103:Emit(v103:GetAttribute("EmitCount") * 1.2);
            end;
        else
            for _, v105 in v62.Final2:GetChildren() do
                v105:Emit(v105:GetAttribute("EmitCount"));
            end;
        end;
        if not v33 and not v34 then
            return;
        else
            l_ColorCorrection_0.Saturation = 0.4;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(10, 10, 10, 0), 0.3);
            local v106 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v106, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
            l_MenuBlur_5.Size = 0;
            l_MenuBlur_5.Enabled = true;
            local v108 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_5, v108, {
                Size = 20
            }):Play();
            local v109 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v109, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.defer(function() --[[ Line: 562 ]]
                -- upvalues: v22 (ref)
                v22.CreateImpactFrame({
                    Time = 0.1
                });
            end);
            v22.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 1, 
                Fade = 2
            });
            return;
        end;
    end);
    if v33 or v34 then
        local v110 = l_Assets_0.Camera:Clone();
        v110.Name = l_Character_0.Name .. "Camera";
        v110.Parent = l_Workspace_0.Debris;
        local v111 = 0;
        do
            local l_v111_0 = v111;
            local function v113() --[[ Line: 581 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v111_0 (ref), v110 (copy), l_Character_0 (copy)
                if os.time() - l_v111_0 < 0.5 then
                    return;
                else
                    l_v111_0 = os.time();
                    v110:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v113();
            local v114 = {
                Animator = v110.AnimationController.Animator, 
                AnimId = v28.Animations.Camera
            };
            v61 = l_AnimHelper_0:CreateAnim(v114);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 599 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v110 (copy), v113 (copy)
                l_CurrentCamera_0.CFrame = v110.Head.CFrame;
                v113();
            end);
            local v116 = 15;
            if l_IsVariant_0 then
                v116 = 11.5;
            end;
            task.delay(v116, function() --[[ Line: 609 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(v116);
            v61:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.01);
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v53, {
                ImageTransparency = 1
            }):Play();
            l_TweenService_0:Create(l_Main_0.White, v54, {
                BackgroundTransparency = 0
            }):Play();
            task.wait(0.3333333333333333);
            v61:Stop(0.1);
            if l_l_AnimHelper_0_Anim_1 then
                l_l_AnimHelper_0_Anim_1:Stop(0.1);
            end;
            l_l_AnimHelper_0_Anim_0:Stop(0.1);
            v14.StopAnimsHack(l_Victim_0);
            task.wait(0.4166666666666667);
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_CameraMode_0.Value = "";
            local v117 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
            l_TweenService_0:Create(l_ColorCorrection_0, v117, {
                Saturation = 0, 
                Contrast = 0
            }):Play();
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v53, {
                ImageTransparency = 1
            }):Play();
            local v118 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v118, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v22.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v110:Destroy();
        end;
    end;
    for _, v120 in v63 do
        v120:Disconnect();
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v28;