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
local _ = require(l_ReplicatedStorage_0:WaitForChild("BubbleModule"));
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
        Character = 14543473653, 
        Victim = 14543480925, 
        Camera = 14543550973
    }
};
v27.Use = function(v28) --[[ Line: 45 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v21 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), v27 (copy), l_AnimHelper_0 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
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
            task.delay(2, function() --[[ Line: 67 ]]
                -- upvalues: v38 (copy), l_Speed_0 (copy)
                v38:AdjustSpeed(l_Speed_0);
            end);
        end;
    end;
    for _, v41 in (v36:GetPlayingAnimationTracks()) do
        if v41.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_1 = v41.Speed;
            v41:AdjustSpeed(l_Speed_1 / 4);
            task.delay(2, function() --[[ Line: 79 ]]
                -- upvalues: v41 (copy), l_Speed_1 (copy)
                v41:AdjustSpeed(l_Speed_1);
            end);
        end;
    end;
    task.defer(function() --[[ Line: 84 ]]
        -- upvalues: v31 (copy), v32 (copy), v21 (ref), l_Main_0 (ref)
        if v31 or v32 then
            v21.StatusFrame(v32, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v43 = l_Parent_0.UltimateStart:Clone();
    v43.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v43.Parent = l_Workspace_0.Debris;
    task.delay(20, function() --[[ Line: 94 ]]
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
        task.defer(function() --[[ Line: 106 ]]
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
        task.delay(0.6, function() --[[ Line: 137 ]]
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
    task.delay(0.5, function() --[[ Line: 167 ]]
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
    task.wait(0.5);
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v31 or v32 then
        l_CameraMode_0.Value = "Cutscene";
        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
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
    local v65 = nil;
    l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.9);
    l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.9);
    task.delay(1, function() --[[ Line: 239 ]]
        -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v65 (ref)
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(1.35);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(1.35);
        if v65 then
            v65:AdjustSpeed(1.35);
        end;
        l_l_AnimHelper_0_Anim_1.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition - 0.1;
        v65.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
        task.wait(2.5);
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(1.15);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(1.15);
        if v65 then
            v65:AdjustSpeed(1.15);
        end;
        l_l_AnimHelper_0_Anim_1.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition - 0.1;
        v65.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
    end);
    local v66 = script.Effects:Clone();
    v66.Parent = l_Workspace_0.Debris;
    task.spawn(function() --[[ Line: 261 ]]
        -- upvalues: v66 (copy), l_Character_0 (copy)
        for _ = 1, 20 do
            v66.CFrame = l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 2.5);
            task.wait(0.1);
        end;
    end);
    task.delay(10, function() --[[ Line: 268 ]]
        -- upvalues: v66 (copy)
        v66:Destroy();
    end);
    task.defer(function() --[[ Line: 272 ]]
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
    task.delay(0.4, function() --[[ Line: 286 ]]
        -- upvalues: v66 (copy), v21 (ref), l_Character_0 (copy), v31 (copy), v32 (copy)
        local v68 = v66.FootSmoke:Clone();
        v68.Parent = v21.GetWeldCharacter(l_Character_0).LeftFoot;
        for _, v70 in v68:GetChildren() do
            v70:Emit(2);
        end;
        task.delay(5, function() --[[ Line: 294 ]]
            -- upvalues: v68 (copy)
            if v68 then
                v68:Destroy();
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
    end);
    local v71 = {};
    local v72 = 0;
    v71[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hit"):Connect(function() --[[ Line: 312 ]]
        -- upvalues: v66 (copy), v72 (ref), v21 (ref), l_Character_0 (copy), v31 (copy), v32 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
        local l_Left_0 = v66.Left;
        v72 = v72 + 1;
        if v72 == 5 then
            l_Left_0 = v66.LeftBig;
        end;
        task.defer(function() --[[ Line: 320 ]]
            -- upvalues: v21 (ref), l_Character_0 (ref)
            v21.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "Kimura", 
                    TargetPart = "LeftHand", 
                    DelayTime = 0, 
                    HoldTime = 0.26666666666666666, 
                    TimeScale = 0.5
                }
            });
        end);
        for _, v75 in l_Left_0:GetChildren() do
            v75:Emit(1);
        end;
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
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v78 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v78, {
                Size = 20
            }):Play();
            local v79 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v79, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            if v72 < 5 then
                v21.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.1, 
                    Fade = 0.3
                });
            else
                task.defer(function() --[[ Line: 366 ]]
                    -- upvalues: v21 (ref), l_Character_0 (ref)
                    task.wait(1.6);
                    v21.AttackTrail({
                        Character = l_Character_0, 
                        TrailInfo = {
                            EffectName = "AttackTrail", 
                            TrailName = "UltimateTrail", 
                            TargetPart = "RightHand", 
                            DelayTime = 0, 
                            HoldTime = 1.6666666666666667, 
                            TimeScale = 1
                        }
                    });
                end);
                v21.CameraShake({
                    Preset = "SuperHardHit", 
                    WaitTime = 0.1, 
                    Fade = 0.5
                });
            end;
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.35
            });
            return;
        end;
    end);
    local function v87(v80, v81) --[[ Line: 394 ]] --[[ Name: SetTransparency ]]
        -- upvalues: l_Workspace_0 (ref)
        for _, v83 in v80:GetDescendants() do
            if v83.Name == "UnusualParticle" then
                v83.Enabled = v81 == 0;
            end;
            if (v83:IsA("BasePart") or v83:IsA("Decal")) and v83.LocalTransparencyModifier < 1000 then
                v83.LocalTransparencyModifier = v81;
            end;
        end;
        local l_FirstChild_0 = l_Workspace_0.Welds:FindFirstChild(v80.Name);
        if l_FirstChild_0 then
            for _, v86 in l_FirstChild_0:GetDescendants() do
                if v86.Name == "UnusualParticle" then
                    v86.Enabled = v81 == 0;
                end;
                if (v86:IsA("BasePart") or v86:IsA("Decal")) and v86.LocalTransparencyModifier < 1000 then
                    v86.LocalTransparencyModifier = v81;
                end;
            end;
        end;
    end;
    v71[2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hide"):Connect(function() --[[ Line: 413 ]]
        -- upvalues: v31 (copy), v32 (copy), v87 (copy), l_Victim_0 (copy)
        if not v31 and not v32 then
            return;
        else
            v87(l_Victim_0, 1);
            task.delay(3, function() --[[ Line: 417 ]]
                -- upvalues: v87 (ref), l_Victim_0 (ref)
                v87(l_Victim_0, 0);
            end);
            return;
        end;
    end);
    v71[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("EndStart"):Connect(function() --[[ Line: 422 ]]
        -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v65 (ref), l_Character_0 (copy), v21 (ref), v87 (copy), l_Victim_0 (copy), v31 (copy), v32 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy)
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(1.5);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(1.5);
        if v65 then
            v65:AdjustSpeed(1.5);
        end;
        l_l_AnimHelper_0_Anim_1.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition - 0.1;
        v65.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
        task.defer(function() --[[ Line: 430 ]]
            -- upvalues: l_Character_0 (ref), v21 (ref)
            local v88 = {
                Step = 1, 
                MaxTime = 1, 
                DeleteDelay = 0.2, 
                AddTransparency = 0.98, 
                Character = l_Character_0
            };
            v21.AfterimageEffect(v88);
        end);
        v87(l_Victim_0, 0);
        if not v31 and not v32 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 10
            }):Play();
            v21.CameraShake({
                Preset = "LightHit", 
                WaitTime = 0.1, 
                Fade = 0.3
            });
            return;
        end;
    end);
    v71[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("EndMid"):Connect(function() --[[ Line: 455 ]]
        -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v65 (ref), v31 (copy), v32 (copy), v21 (ref)
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(2);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(2);
        if v65 then
            v65:AdjustSpeed(2);
        end;
        if not v31 and not v32 then
            return;
        else
            v21.CameraShake({
                Preset = "SuperHardHit", 
                WaitTime = 0.2, 
                Fade = 0.3
            });
            return;
        end;
    end);
    v71[5] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final1"):Connect(function() --[[ Line: 470 ]]
        -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v65 (ref), v31 (copy), v32 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v21 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.9);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.9);
        if v65 then
            v65:AdjustSpeed(0.9);
        end;
        l_l_AnimHelper_0_Anim_1.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition - 0.1;
        v65.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
        if not v31 and not v32 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 7
            }):Play();
            task.defer(function() --[[ Line: 482 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.1
                });
            end);
            l_ColorCorrection_0.Saturation = 0.1;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v89 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v89, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
            l_MenuBlur_2.Size = 0;
            l_MenuBlur_2.Enabled = true;
            local v91 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_2, v91, {
                Size = 20
            }):Play();
            local v92 = TweenInfo.new(0.075, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v92, {
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
    v71[6] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final2"):Connect(function() --[[ Line: 517 ]]
        -- upvalues: v71 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v65 (ref), v66 (copy), v31 (copy), v32 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v21 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        for _, v94 in v71 do
            v94:Disconnect();
        end;
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.7);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.7);
        if v65 then
            v65:AdjustSpeed(0.7);
        end;
        l_l_AnimHelper_0_Anim_1.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition - 0.1;
        v65.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
        for _, v96 in v66.Vortex:GetChildren() do
            v96:Emit(3);
        end;
        for _, v98 in v66.Vortex2:GetChildren() do
            v98:Emit(2);
        end;
        if not v31 and not v32 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 32
            }):Play();
            task.defer(function() --[[ Line: 541 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.05
                });
            end);
            l_ColorCorrection_0.Saturation = 0.1;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v99 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v99, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
            l_MenuBlur_3.Size = 0;
            l_MenuBlur_3.Enabled = true;
            local v101 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_3, v101, {
                Size = 20
            }):Play();
            local v102 = TweenInfo.new(0.075, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v102, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.HUDShake({
                Scale = 30, 
                Damper = 0.35
            });
            v21.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.4, 
                Fade = 1
            });
            return;
        end;
    end);
    if v31 or v32 then
        local v103 = l_Assets_0.Camera:Clone();
        v103.Name = l_Character_0.Name .. "Camera";
        v103.Parent = l_Workspace_0.Debris;
        local v104 = 0;
        do
            local l_v104_0 = v104;
            local function v106() --[[ Line: 582 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v104_0 (ref), v103 (copy), l_Character_0 (copy)
                if os.time() - l_v104_0 < 0.5 then
                    return;
                else
                    l_v104_0 = os.time();
                    v103:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v106();
            local v107 = {
                Animator = v103.AnimationController.Animator, 
                AnimId = v27.Animations.Camera
            };
            v65 = l_AnimHelper_0:CreateAnim(v107);
            v65:AdjustSpeed(0.9);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 601 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v103 (copy), v106 (copy)
                l_CurrentCamera_0.CFrame = v103.Head.CFrame;
                v106();
            end);
            task.delay(7.333333333333333, function() --[[ Line: 606 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(7.333333333333333);
            l_TweenService_0:Create(l_Main_0.White, v53, {
                BackgroundTransparency = 0
            }):Play();
            task.wait(0.3333333333333333);
            if l_l_AnimHelper_0_Anim_1 then
                l_l_AnimHelper_0_Anim_1:Stop(0.1);
            end;
            l_l_AnimHelper_0_Anim_0:Stop(0.1);
            l_Victim_0:SetPrimaryPartCFrame(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5));
            task.wait(0.3333333333333333);
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_CurrentCamera_0.FieldOfView = 70;
            l_CameraMode_0.Value = "";
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v52, {
                ImageTransparency = 1
            }):Play();
            local v109 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v109, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v103:Destroy();
        end;
    end;
    for v110, v111 in v62 do
        v110.CollisionGroup = v111;
    end;
    for _, v113 in v71 do
        v113:Disconnect();
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v27;