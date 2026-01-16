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
        Character = 13913257624, 
        Victim = 13913383554, 
        Camera = 13913485128
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
    local v50 = nil;
    if v30 or v31 then
        task.delay(0.6, function() --[[ Line: 138 ]]
            -- upvalues: v50 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref)
            v50 = l_SoundHelper_0:PlaySound({
                Name = "IppoUltSong", 
                Parent = l_Workspace_0.Debris
            });
            script.ReverbSoundEffect:Clone().Parent = v50;
            task.wait(3);
            v50.ReverbSoundEffect.DecayTime = 20;
        end);
    end;
    task.wait(0.5);
    local v51 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v52 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v30 or v31 then
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
        Parent = (not not v30 or v31) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v53.Volume;
    v53.Volume = 0;
    task.delay(0.85, function() --[[ Line: 169 ]]
        -- upvalues: v53 (copy), v30 (copy), v31 (copy), l_Volume_0 (copy), v27 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v53:Stop();
        if v30 or v31 then
            v53.Volume = l_Volume_0;
        else
            v53.Volume = l_Volume_0 / 5;
        end;
        v53:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v27.HasVoicelines then
            local v56 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v30 or v31) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v30 and not v31 then
                v56.Volume = v56.Volume / 5;
            end;
        end;
    end);
    task.wait(0.5);
    local v57 = script.HeartRoot:Clone();
    v57.CFrame = l_Victim_0.UpperTorso.CFrame;
    v57.Parent = l_Workspace_0.Debris;
    v57.Heart.Transparency = 1;
    task.delay(20, function() --[[ Line: 201 ]]
        -- upvalues: v57 (copy)
        if v57 then
            v57:Destroy();
        end;
    end);
    local l_Weld_0 = Instance.new("Weld");
    l_Weld_0.Parent = v57;
    l_Weld_0.Part0 = v57;
    l_Weld_0.Part1 = l_Victim_0.UpperTorso;
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v30 or v31 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 60;
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
    v20.TeleportModel({
        Character = v27.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame * v27.Offset, 
        TeleportId = v27.TeleportId
    });
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v61);
    l_AnimHelper_0:CreateAnim(v62);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v61);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v62);
    local v65 = script.Effects:Clone();
    v65.Parent = l_Workspace_0.Debris;
    v65.CFrame = l_Victim_0.PrimaryPart.CFrame;
    task.delay(10, function() --[[ Line: 254 ]]
        -- upvalues: v65 (copy)
        v65:Destroy();
    end);
    task.delay(2.3666666666666667, function() --[[ Line: 258 ]]
        -- upvalues: v20 (ref), l_Character_0 (copy)
        v20.AttackTrail({
            Character = l_Character_0, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Date", 
                TargetPart = "RightHand", 
                DelayTime = 0, 
                HoldTime = 0.43333333333333335, 
                TimeScale = 1
            }
        });
    end);
    task.delay(6.816666666666666, function() --[[ Line: 272 ]]
        -- upvalues: v20 (ref), l_Character_0 (copy)
        v20.AttackTrail({
            Character = l_Character_0, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Date", 
                TargetPart = "LeftHand", 
                DelayTime = 0, 
                HoldTime = 0.9166666666666666, 
                TimeScale = 0.7
            }
        });
    end);
    local v66 = {};
    local function v74(v67, v68) --[[ Line: 288 ]] --[[ Name: SetTransparency ]]
        -- upvalues: l_Workspace_0 (ref)
        for _, v70 in v67:GetDescendants() do
            if v70.Name == "UnusualParticle" then
                v70.Enabled = v68 == 0;
            end;
            if (v70:IsA("BasePart") or v70:IsA("Decal")) and v70.LocalTransparencyModifier < 1000 then
                v70.LocalTransparencyModifier = v68;
            end;
        end;
        local l_FirstChild_0 = l_Workspace_0.Welds:FindFirstChild(v67.Name);
        if l_FirstChild_0 then
            for _, v73 in l_FirstChild_0:GetDescendants() do
                if v73.Name == "UnusualParticle" then
                    v73.Enabled = v68 == 0;
                end;
                if (v73:IsA("BasePart") or v73:IsA("Decal")) and v73.LocalTransparencyModifier < 1000 then
                    v73.LocalTransparencyModifier = v68;
                end;
            end;
        end;
    end;
    v66[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hide"):Connect(function() --[[ Line: 307 ]]
        -- upvalues: v30 (copy), v31 (copy), v74 (copy), l_Victim_0 (copy)
        if v30 or v31 then
            v74(l_Victim_0, 1);
            task.delay(9, function() --[[ Line: 311 ]]
                -- upvalues: v74 (ref), l_Victim_0 (ref)
                v74(l_Victim_0, 0);
            end);
        end;
    end);
    v66[2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Show"):Connect(function() --[[ Line: 317 ]]
        -- upvalues: v30 (copy), v31 (copy), v74 (copy), l_Victim_0 (copy)
        if v30 or v31 then
            v74(l_Victim_0, 0);
        end;
    end);
    v66[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Spin1"):Connect(function() --[[ Line: 323 ]]
        -- upvalues: v20 (ref), l_Character_0 (copy)
        local v75 = {};
        for _, v77 in script.Corkscrew:GetChildren() do
            local v78 = v77:Clone();
            v78.Parent = v20.GetWeldCharacter(l_Character_0).RightLowerArm;
            table.insert(v75, v78);
            task.delay(0.4, function() --[[ Line: 331 ]]
                -- upvalues: v78 (copy)
                for _, v80 in v78:GetChildren() do
                    v80.Enabled = false;
                end;
            end);
        end;
        task.wait(5);
        for _, v82 in v75 do
            v82:Destroy();
        end;
    end);
    v66[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Spin2"):Connect(function() --[[ Line: 344 ]]
        -- upvalues: v65 (copy), v20 (ref), l_Character_0 (copy)
        local v83 = {};
        local v84 = v65.FootSmoke:Clone();
        v84.Parent = v20.GetWeldCharacter(l_Character_0).LeftFoot;
        for _, v86 in v84:GetChildren() do
            v86:Emit(2);
        end;
        task.delay(5, function() --[[ Line: 354 ]]
            -- upvalues: v84 (copy)
            if v84 then
                v84:Destroy();
            end;
        end);
        for _, v88 in script.Corkscrew:GetChildren() do
            local v89 = v88:Clone();
            v89.Parent = v20.GetWeldCharacter(l_Character_0).LeftLowerLeg;
            table.insert(v83, v89);
            task.delay(0.2, function() --[[ Line: 365 ]]
                -- upvalues: v89 (copy)
                for _, v91 in v89:GetChildren() do
                    v91.Enabled = false;
                end;
            end);
        end;
        task.wait(5);
        for _, v93 in v83 do
            v93:Destroy();
        end;
    end);
    v66[5] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hit"):Connect(function() --[[ Line: 378 ]]
        -- upvalues: v57 (copy), l_TweenService_0 (ref), v50 (ref), v20 (ref), l_Character_0 (copy), v65 (copy), v30 (copy), v31 (copy), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        v57.Heart.Transparency = 0;
        local v94 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        l_TweenService_0:Create(v57.Heart.Highlight, v94, {
            FillTransparency = 0.4, 
            OutlineTransparency = 0.4
        }):Play();
        if v50 then
            task.delay(0.1, function() --[[ Line: 384 ]]
                -- upvalues: l_TweenService_0 (ref), v50 (ref)
                l_TweenService_0:Create(v50, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Volume = v50.Volume * 8
                }):Play();
                v50.ReverbSoundEffect.WetLevel = -80;
                v50.ReverbSoundEffect.DryLevel = -80;
                v50.ReverbSoundEffect.DecayTime = 20;
                task.delay(3.6666666666666665, function() --[[ Line: 390 ]]
                    -- upvalues: l_TweenService_0 (ref), v50 (ref)
                    l_TweenService_0:Create(v50, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Volume = v50.Volume / 8
                    }):Play();
                    l_TweenService_0:Create(v50.ReverbSoundEffect, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        WetLevel = 0, 
                        DryLevel = 10, 
                        DecayTime = 0
                    }):Play();
                end);
            end);
        end;
        local v95 = {};
        for _, v97 in script.Corkscrew2:GetChildren() do
            local v98 = v97:Clone();
            v98.Parent = v20.GetWeldCharacter(l_Character_0).RightLowerArm;
            table.insert(v95, v98);
            for _, v100 in v98:GetChildren() do
                v100.Rate = v100.Rate * 0.5;
                v100.TimeScale = 0.1;
            end;
            task.delay(3, function() --[[ Line: 409 ]]
                -- upvalues: v98 (copy)
                for _, v102 in v98:GetChildren() do
                    v102.TimeScale = 0.8;
                    v102.Enabled = false;
                end;
            end);
        end;
        task.delay(10, function() --[[ Line: 417 ]]
            -- upvalues: v95 (copy)
            for _, v104 in v95 do
                v104:Destroy();
            end;
        end);
        task.defer(function() --[[ Line: 423 ]]
            -- upvalues: l_TweenService_0 (ref), v57 (ref)
            task.wait(0.8);
            local v105 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, true);
            l_TweenService_0:Create(v57.Heart, v105, {
                Size = v57.Heart.Size * 0.85
            }):Play();
            task.wait(0.7);
            local v106 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, true);
            l_TweenService_0:Create(v57.Heart, v106, {
                Size = v57.Heart.Size * 0.92
            }):Play();
            task.wait(1.1);
            local v107 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(v57.Heart, v107, {
                Size = v57.Heart.Size * 0.9
            }):Play();
        end);
        task.delay(1.6, function() --[[ Line: 437 ]]
            -- upvalues: l_TweenService_0 (ref), v57 (ref)
            local v108 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
            l_TweenService_0:Create(v57.Heart.Highlight, v108, {
                FillColor = Color3.fromRGB(62, 187, 255), 
                FillTransparency = 0.3, 
                OutlineTransparency = 0.3
            }):Play();
        end);
        for _, v110 in v65.Start:GetChildren() do
            v110:Emit(v110:GetAttribute("EmitCount") or 2);
        end;
        if not v30 and not v31 then
            return;
        else
            task.defer(function() --[[ Line: 448 ]]
                -- upvalues: v20 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (ref), l_Lighting_0 (ref)
                v20.CreateImpactFrame({
                    Time = 0.06
                });
                local v111 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v111, {
                    Saturation = -0.4, 
                    Contrast = 1
                }):Play();
                local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                l_MenuBlur_1.Size = 0;
                l_MenuBlur_1.Enabled = true;
                local v113 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_1, v113, {
                    Size = 20
                }):Play();
                local v114 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v114, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                task.wait(0.5);
                l_TweenService_0:Create(l_Lighting_0, v114, {
                    ExposureCompensation = workspace.Exposure.Value
                }):Play();
                local v115 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                l_TweenService_0:Create(l_ColorCorrection_0, v115, {
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
                WaitTime = 0.8, 
                Fade = 1
            });
            return;
        end;
    end);
    v66[6] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 485 ]]
        -- upvalues: v66 (copy), l_TweenService_0 (ref), v57 (copy), v65 (copy), v30 (copy), v31 (copy), v20 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), l_Main_0 (ref), v51 (copy)
        for _, v117 in v66 do
            v117:Disconnect();
        end;
        local v118 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        l_TweenService_0:Create(v57.Heart.Highlight, v118, {
            FillTransparency = 1, 
            OutlineTransparency = 1
        }):Play();
        task.delay(1, function() --[[ Line: 493 ]]
            -- upvalues: v57 (ref)
            if v57 then
                v57:Destroy();
            end;
        end);
        for _, v120 in v65.Final:GetChildren() do
            v120:Emit(3);
        end;
        if not v30 and not v31 then
            return;
        else
            task.defer(function() --[[ Line: 503 ]]
                -- upvalues: v20 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                v20.CreateImpactFrame({
                    Time = 0.1
                });
                l_ColorCorrection_0.Saturation = 0;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v121 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v121, {
                    Saturation = -0.4, 
                    Contrast = 0.2
                }):Play();
                local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                l_MenuBlur_2.Size = 0;
                l_MenuBlur_2.Enabled = true;
                local v123 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_2, v123, {
                    Size = 20
                }):Play();
                local v124 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v124, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
            end);
            v20.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v20.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.8, 
                Fade = 2.7
            });
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v51, {
                ImageTransparency = 1
            }):Play();
            return;
        end;
    end);
    if v30 or v31 then
        local v125 = l_Assets_0.Camera:Clone();
        v125.Name = l_Character_0.Name .. "Camera";
        v125.Parent = l_Workspace_0.Debris;
        local v126 = 0;
        do
            local l_v126_0 = v126;
            local function v128() --[[ Line: 546 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v126_0 (ref), v125 (copy), l_Character_0 (copy)
                if os.time() - l_v126_0 < 0.5 then
                    return;
                else
                    l_v126_0 = os.time();
                    v125:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v128();
            local v129 = {
                Animator = v125.AnimationController.Animator, 
                AnimId = v26.Animations.Camera
            };
            local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v129);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 564 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v125 (copy), v128 (copy)
                l_CurrentCamera_0.CFrame = v125.Head.CFrame;
                v128();
            end);
            task.delay(9.083333333333334, function() --[[ Line: 569 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(8.75);
            l_l_AnimHelper_0_Anim_2:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.01);
            l_TweenService_0:Create(l_Main_0.White, v52, {
                BackgroundTransparency = 0
            }):Play();
            if v57 then
                v57:Destroy();
            end;
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
            local v132 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v132, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v20.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v125:Destroy();
        end;
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v26;