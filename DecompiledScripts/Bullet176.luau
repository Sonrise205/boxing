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
local v22 = Random.new();
local function _(v23, v24, v25) --[[ Line: 32 ]] --[[ Name: Lerp ]]
    return v23 + (v24 - v23) * v25;
end;
local v27 = {
    Animations = {
        Character = 14849520023, 
        Victim = 14849513622, 
        Camera = 14849530947
    }, 
    CameraRig = l_Assets_0.MoonCamera
};
v27.Use = function(v28) --[[ Line: 44 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v21 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), v27 (copy), l_AnimHelper_0 (copy), l_BubbleModule_0 (copy), v22 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
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
            task.delay(2, function() --[[ Line: 66 ]]
                -- upvalues: v38 (copy), l_Speed_0 (copy)
                v38:AdjustSpeed(l_Speed_0);
            end);
        end;
    end;
    for _, v41 in (v36:GetPlayingAnimationTracks()) do
        if v41.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_1 = v41.Speed;
            v41:AdjustSpeed(l_Speed_1 / 4);
            task.delay(2, function() --[[ Line: 78 ]]
                -- upvalues: v41 (copy), l_Speed_1 (copy)
                v41:AdjustSpeed(l_Speed_1);
            end);
        end;
    end;
    task.defer(function() --[[ Line: 83 ]]
        -- upvalues: v31 (copy), v32 (copy), v21 (ref), l_Main_0 (ref)
        if v31 or v32 then
            v21.StatusFrame(v32, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v43 = l_Parent_0.UltimateStart:Clone();
    v43.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v43.Parent = l_Workspace_0.Debris;
    task.delay(20, function() --[[ Line: 93 ]]
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
        task.defer(function() --[[ Line: 105 ]]
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
        task.delay(0.6, function() --[[ Line: 136 ]]
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
    local v54 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v31 or v32) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v54.Volume;
    v54.Volume = 0;
    task.delay(0.23, function() --[[ Line: 165 ]]
        -- upvalues: v54 (copy), v31 (copy), v32 (copy), l_Volume_0 (copy), v28 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v54:Stop();
        if v31 or v32 then
            v54.Volume = l_Volume_0;
        else
            v54.Volume = l_Volume_0 / 5;
        end;
        v54:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v28.HasVoicelines then
            local v57 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v31 or v32) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v31 and not v32 then
                v57.Volume = v57.Volume / 5;
            end;
        end;
    end);
    task.wait(0.2);
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v31 or v32 then
        l_CameraMode_0.Value = "Cutscene";
        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            FieldOfView = 32
        }):Play();
    end;
    local v60 = {
        Animator = v34, 
        AnimId = v27.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v61 = {
        Animator = v36, 
        AnimId = v27.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    local v62 = {};
    v21.TeleportModel({
        Character = v28.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame, 
        TeleportId = v28.TeleportId
    });
    l_AnimHelper_0:CreateAnim(v60);
    l_AnimHelper_0:CreateAnim(v61);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v60);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v61);
    local v65 = script.Effects:Clone();
    v65.Parent = l_Workspace_0.Debris;
    v65.CFrame = l_Victim_0.PrimaryPart.CFrame * v28.Offset;
    task.delay(20, function() --[[ Line: 238 ]]
        -- upvalues: v65 (copy)
        v65:Destroy();
    end);
    local v71 = {
        [9] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Effect"):Connect(function() --[[ Line: 245 ]]
            -- upvalues: v31 (copy), v32 (copy), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), l_TweenService_0 (ref), v21 (ref)
            if not v31 and not v32 then
                return;
            else
                local v66 = l_ColorCorrection_0:Clone();
                v66.Parent = game.Lighting;
                v66.Saturation = 0.1;
                v66.Contrast = 0;
                v66.Enabled = true;
                local _ = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                l_MenuBlur_1.Size = 0;
                l_MenuBlur_1.Enabled = true;
                local v69 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_1, v69, {
                    Size = 20
                }):Play();
                local v70 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v70, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                v21.HUDShake({
                    Scale = 20, 
                    Damper = 0.35
                });
                return;
            end;
        end)
    };
    local function v79(v72, v73) --[[ Line: 272 ]] --[[ Name: SetTransparency ]]
        -- upvalues: l_Workspace_0 (ref)
        for _, v75 in v72:GetDescendants() do
            if v75.Name == "UnusualParticle" then
                v75.Enabled = v73 == 0;
            end;
            if (v75:IsA("BasePart") or v75:IsA("Decal")) and v75.LocalTransparencyModifier < 1000 then
                v75.LocalTransparencyModifier = v73;
            end;
        end;
        local l_FirstChild_0 = l_Workspace_0.Welds:FindFirstChild(v72.Name);
        if l_FirstChild_0 then
            for _, v78 in l_FirstChild_0:GetDescendants() do
                if v78.Name == "UnusualParticle" then
                    v78.Enabled = v73 == 0;
                end;
                if (v78:IsA("BasePart") or v78:IsA("Decal")) and v78.LocalTransparencyModifier < 1000 then
                    v78.LocalTransparencyModifier = v73;
                end;
            end;
        end;
    end;
    if v31 or v32 then
        v79(l_Character_0, 1);
    end;
    if not v31 and not v32 then
        task.defer(function() --[[ Line: 296 ]]
            -- upvalues: l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
            l_ColorCorrection_0.Saturation = 0;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v80 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v80, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
            l_MenuBlur_2.Size = 0;
            l_MenuBlur_2.Enabled = true;
            local v82 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_2, v82, {
                Size = 20
            }):Play();
            local v83 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v83, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
        end);
    end;
    local v84 = 1.5;
    local v85 = CFrame.new(0.8, -0.3, 0);
    v71[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Dodge"):Connect(function() --[[ Line: 319 ]]
        -- upvalues: l_Character_0 (copy), v21 (ref), l_Victim_0 (copy), v31 (copy), v32 (copy), v84 (ref), v85 (ref), v79 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
        task.defer(function() --[[ Line: 320 ]]
            -- upvalues: l_Character_0 (ref), v21 (ref)
            task.wait(0.025);
            local v86 = {
                Step = 1, 
                MaxTime = 1, 
                DeleteDelay = 0.3, 
                AddTransparency = 0.99, 
                Character = l_Character_0
            };
            v21.AfterimageEffect(v86);
        end);
        task.defer(function() --[[ Line: 334 ]]
            -- upvalues: l_Victim_0 (ref), v21 (ref)
            task.wait(0.025);
            local v87 = {
                Step = 1, 
                MaxTime = 1, 
                DeleteDelay = 0.3, 
                AddTransparency = 0.99, 
                Character = l_Victim_0
            };
            v21.AfterimageEffect(v87);
        end);
        if not v31 and not v32 then
            return;
        else
            for v88 = 1, 20 do
                local l_v84_0 = v84;
                local v90 = v88 / 20;
                v84 = l_v84_0 + (2 - l_v84_0) * v90;
                v85 = v85:Lerp(CFrame.new(), v88 / 20);
                task.wait();
            end;
            task.wait(0.025);
            v79(l_Character_0, 0);
            task.wait(0.025);
            task.defer(function() --[[ Line: 363 ]]
                -- upvalues: l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                l_ColorCorrection_0.Saturation = 0;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v91 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v91, {
                    Saturation = -0.4, 
                    Contrast = 0.2
                }):Play();
                local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                l_MenuBlur_3.Size = 0;
                l_MenuBlur_3.Enabled = true;
                local v93 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_3, v93, {
                    Size = 20
                }):Play();
                local v94 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v94, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
            end);
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v21.CameraShake({
                Preset = "MedHit", 
                WaitTime = 0.4, 
                Fade = 0.6
            });
            return;
        end;
    end);
    local v95 = nil;
    v71[2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Foot"):Connect(function() --[[ Line: 397 ]]
        -- upvalues: v31 (copy), v32 (copy), v85 (ref), v84 (ref), v95 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (copy)
        if not v31 and not v32 then
            return;
        else
            v85 = CFrame.new();
            for v96 = 1, 20 do
                local l_v84_1 = v84;
                local v98 = v96 / 20;
                v84 = l_v84_1 + (3 - l_v84_1) * v98;
                task.wait();
            end;
            v95 = l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                FieldOfView = 10
            });
            v95:Play();
            return;
        end;
    end);
    v71[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Rush"):Connect(function() --[[ Line: 412 ]]
        -- upvalues: v31 (copy), v32 (copy), v21 (ref)
        if not v31 and not v32 then
            return;
        else
            task.wait(0.6);
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 0.1
            });
            return;
        end;
    end);
    v71[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Head"):Connect(function() --[[ Line: 424 ]]
        -- upvalues: v65 (copy), v21 (ref), l_Character_0 (copy), l_Victim_0 (copy), v54 (copy), l_TweenService_0 (ref), v31 (copy), v32 (copy), v95 (ref), l_CurrentCamera_0 (copy), v84 (ref), l_BubbleModule_0 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        local l_Smoke_0 = v65.Smoke;
        l_Smoke_0.Parent = v21.GetWeldCharacter(l_Character_0).PrimaryPart;
        for _, v101 in l_Smoke_0:GetChildren() do
            v101:Emit(v101:GetAttribute("EmitCount") or 0);
        end;
        task.delay(10, function() --[[ Line: 432 ]]
            -- upvalues: l_Smoke_0 (copy)
            if l_Smoke_0 then
                l_Smoke_0:Destroy();
            end;
        end);
        local l_Splatter_0 = v65.Splatter;
        l_Splatter_0.Parent = l_Victim_0.Head;
        local l_Volume_1 = v54.Volume;
        l_TweenService_0:Create(v54, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Volume = v54.Volume / 6
        }):Play();
        task.delay(1, function() --[[ Line: 441 ]]
            -- upvalues: l_TweenService_0 (ref), v54 (ref), l_Volume_1 (copy)
            l_TweenService_0:Create(v54, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Volume = l_Volume_1
            }):Play();
        end);
        for _, v105 in l_Splatter_0:GetChildren() do
            task.delay(v105:GetAttribute("EmitDelay") or 0, function() --[[ Line: 446 ]]
                -- upvalues: v105 (copy)
                v105:Emit(v105:GetAttribute("EmitCount") or 1);
            end);
        end;
        task.delay(10, function() --[[ Line: 451 ]]
            -- upvalues: l_Splatter_0 (copy)
            l_Splatter_0:Destroy();
        end);
        if not v31 and not v32 then
            return;
        else
            if v95 then
                v95:Pause();
            end;
            v95 = l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 32
            });
            v95:Play();
            task.defer(function() --[[ Line: 461 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.08
                });
            end);
            v84 = 4;
            task.delay(0.2, function() --[[ Line: 469 ]]
                -- upvalues: l_BubbleModule_0 (ref), l_Victim_0 (ref)
                l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(8, 8, 8, 0), 0.3);
            end);
            l_ColorCorrection_0.Saturation = 0.1;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v106 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v106, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
            l_MenuBlur_4.Size = 0;
            l_MenuBlur_4.Enabled = true;
            local v108 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_4, v108, {
                Size = 20
            }):Play();
            local v109 = TweenInfo.new(0.075, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v109, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.35
            });
            v21.CameraShake({
                Preset = "SuperHardHit", 
                WaitTime = 0.6, 
                Fade = 1
            });
            return;
        end;
    end);
    v71[5] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Ready"):Connect(function() --[[ Line: 502 ]]
        -- upvalues: v31 (copy), v32 (copy), v84 (ref)
        if not v31 and not v32 then
            return;
        else
            task.defer(function() --[[ Line: 505 ]]
                -- upvalues: v84 (ref)
                for v110 = 1, 30 do
                    local l_v84_2 = v84;
                    local v112 = v110 / 30;
                    v84 = l_v84_2 + (2 - l_v84_2) * v112;
                    task.wait();
                end;
            end);
            return;
        end;
    end);
    local _ = function(v113) --[[ Line: 514 ]] --[[ Name: CreateSlash ]]
        -- upvalues: l_Workspace_0 (ref), l_Character_0 (copy), v22 (ref)
        task.defer(function() --[[ Line: 515 ]]
            -- upvalues: l_Workspace_0 (ref), l_Character_0 (ref), v22 (ref), v113 (copy)
            local v114 = script.Slash:Clone();
            v114.Parent = l_Workspace_0.Debris;
            v114.PrimaryPart.CFrame = l_Character_0.PrimaryPart.CFrame * CFrame.new(0, -1, -3);
            v114.PrimaryPart.Orientation = Vector3.new(v22:NextNumber(-60, 60), v114.PrimaryPart.Orientation.Y, v22:NextNumber(-20, 20));
            local v115 = 1;
            if v113 then
                task.wait(0.02);
                v115 = 0.3;
                v114.PrimaryPart.CFrame = l_Character_0.PrimaryPart.CFrame * CFrame.new(0, -1, -2);
                v114.PrimaryPart.Orientation = Vector3.new(-34, v114.PrimaryPart.Orientation.Y + 10, 24);
            end;
            for _, v117 in v114:GetDescendants() do
                if v117:IsA("ParticleEmitter") then
                    task.delay(v117:GetAttribute("EmitDelay") or 0, function() --[[ Line: 534 ]]
                        -- upvalues: v117 (copy)
                        v117:Emit(v117:GetAttribute("EmitCount") or 0);
                    end);
                end;
            end;
            for _, v119 in v114.PrimaryPart:GetDescendants() do
                if v119:IsA("ParticleEmitter") then
                    v119.TimeScale = v115 or 1;
                end;
            end;
            task.wait(10);
            v114:Destroy();
        end);
    end;
    local v121 = 0;
    v71[6] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hit"):Connect(function() --[[ Line: 551 ]]
        -- upvalues: v121 (ref), l_Workspace_0 (ref), l_Character_0 (copy), v22 (ref), v65 (copy), v21 (ref), v31 (copy), v32 (copy)
        if v121 == 0 then

        end;
        v121 = v121 + 1;
        if v121 < 16 then
            task.defer(function() --[[ Line: 559 ]]
                -- upvalues: v121 (ref), l_Workspace_0 (ref), l_Character_0 (ref), v22 (ref)
                local v122 = v121 + 1 == 16;
                task.defer(function() --[[ Line: 515 ]]
                    -- upvalues: l_Workspace_0 (ref), l_Character_0 (ref), v22 (ref), v122 (copy)
                    local v123 = script.Slash:Clone();
                    v123.Parent = l_Workspace_0.Debris;
                    v123.PrimaryPart.CFrame = l_Character_0.PrimaryPart.CFrame * CFrame.new(0, -1, -3);
                    v123.PrimaryPart.Orientation = Vector3.new(v22:NextNumber(-60, 60), v123.PrimaryPart.Orientation.Y, v22:NextNumber(-20, 20));
                    local v124 = 1;
                    if v122 then
                        task.wait(0.02);
                        v124 = 0.3;
                        v123.PrimaryPart.CFrame = l_Character_0.PrimaryPart.CFrame * CFrame.new(0, -1, -2);
                        v123.PrimaryPart.Orientation = Vector3.new(-34, v123.PrimaryPart.Orientation.Y + 10, 24);
                    end;
                    for _, v126 in v123:GetDescendants() do
                        if v126:IsA("ParticleEmitter") then
                            task.delay(v126:GetAttribute("EmitDelay") or 0, function() --[[ Line: 534 ]]
                                -- upvalues: v126 (copy)
                                v126:Emit(v126:GetAttribute("EmitCount") or 0);
                            end);
                        end;
                    end;
                    for _, v128 in v123.PrimaryPart:GetDescendants() do
                        if v128:IsA("ParticleEmitter") then
                            v128.TimeScale = v124 or 1;
                        end;
                    end;
                    task.wait(10);
                    v123:Destroy();
                end);
            end);
        end;
        local l_Left_0 = v65.Left;
        local v130 = "RightHand";
        if v121 % 2 == 0 then
            l_Left_0 = v65.Right;
            v130 = "LeftHand";
        end;
        for _, v132 in l_Left_0:GetChildren() do
            v132:Emit(2);
        end;
        task.defer(function() --[[ Line: 576 ]]
            -- upvalues: v21 (ref), l_Character_0 (ref), v130 (ref)
            v21.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "Bullet", 
                    TargetPart = v130, 
                    DelayTime = 0, 
                    HoldTime = 0.16666666666666666, 
                    TimeScale = 1
                }
            });
        end);
        if v121 == 16 then

        end;
        if not v31 and not v32 then
            return;
        else
            v21.HUDShake({
                Scale = 5 + 11 * (v121 / 16), 
                Damper = 0.35
            });
            v21.CameraShake({
                Preset = "MedHit", 
                WaitTime = 0.03 + 0.12 * (v121 / 16), 
                Fade = 0.03 + 0.12 * (v121 / 16)
            });
            return;
        end;
    end);
    v71[7] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final1"):Connect(function() --[[ Line: 608 ]]
        -- upvalues: v31 (copy), v32 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v21 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        if not v31 and not v32 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 20
            }):Play();
            task.defer(function() --[[ Line: 613 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.1
                });
            end);
            l_ColorCorrection_0.Saturation = 0.1;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v133 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v133, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
            l_MenuBlur_5.Size = 0;
            l_MenuBlur_5.Enabled = true;
            local v135 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_5, v135, {
                Size = 20
            }):Play();
            local v136 = TweenInfo.new(0.075, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v136, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.HUDShake({
                Scale = 30, 
                Damper = 0.35
            });
            v21.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.2, 
                Fade = 0.6
            });
            return;
        end;
    end);
    v71[8] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final2"):Connect(function() --[[ Line: 648 ]]
        -- upvalues: v71 (copy), v65 (copy), v31 (copy), v32 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v21 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        for _, v138 in v71 do
            v138:Disconnect();
        end;
        for _, v140 in v65.Final:GetChildren() do
            v140:Emit(3);
        end;
        if not v31 and not v32 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 40
            }):Play();
            task.defer(function() --[[ Line: 661 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.08
                });
            end);
            l_ColorCorrection_0.Saturation = 0.3;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v141 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v141, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_6 = l_Lighting_0.MenuBlur;
            l_MenuBlur_6.Size = 0;
            l_MenuBlur_6.Enabled = true;
            local v143 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_6, v143, {
                Size = 20
            }):Play();
            local v144 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v144, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.HUDShake({
                Scale = 30, 
                Damper = 0.35
            });
            v21.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.65, 
                Fade = 1
            });
            return;
        end;
    end);
    if v31 or v32 then
        local v145 = l_Assets_0.MoonCamera:Clone();
        v145.Parent = l_Workspace_0.Debris;
        local v146 = 0;
        do
            local l_v146_0 = v146;
            local function v148() --[[ Line: 702 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v146_0 (ref), v145 (copy), l_Character_0 (copy)
                if os.time() - l_v146_0 < 0.5 then
                    return;
                else
                    l_v146_0 = os.time();
                    v145:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 2, 0));
                    return;
                end;
            end;
            v148();
            local v149 = {
                Animator = v145.AnimationController.Animator, 
                AnimId = v27.Animations.Camera
            };
            local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v149);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 720 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v145 (copy), v84 (ref), v85 (ref), v148 (copy)
                l_CurrentCamera_0.CFrame = v145.Bone.CFrame * CFrame.new(0, 0, v84) * v85;
                v148();
            end);
            task.delay(10.866666666666667, function() --[[ Line: 725 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(10.533333333333333);
            l_TweenService_0:Create(l_Main_0.White, v53, {
                BackgroundTransparency = 0
            }):Play();
            l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.1);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.1);
            l_l_AnimHelper_0_Anim_2:AdjustSpeed(0.1);
            task.wait(0.3333333333333333);
            if l_l_AnimHelper_0_Anim_1 then
                l_l_AnimHelper_0_Anim_1:Stop(0.1);
            end;
            l_l_AnimHelper_0_Anim_0:Stop(0.1);
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_Victim_0:SetPrimaryPartCFrame(l_Character_0.PrimaryPart.CFrame * v28.Offset);
            task.wait(0.3333333333333333);
            for _, v153 in v71 do
                v153:Disconnect();
            end;
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_CurrentCamera_0.FieldOfView = 70;
            l_CameraMode_0.Value = "";
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v52, {
                ImageTransparency = 1
            }):Play();
            local v154 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v154, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v145:Destroy();
        end;
    end;
    for v155, v156 in v62 do
        v155.CollisionGroup = v156;
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v27;