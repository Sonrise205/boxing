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
local l_Common_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local l_BubbleModule_0 = require(l_ReplicatedStorage_0:WaitForChild("BubbleModule"));
local l_Parent_0 = script.Parent.Parent;
local v21 = require(l_Parent_0);
local _ = Random.new();
local function _(v23, v24, v25) --[[ Line: 32 ]] --[[ Name: Lerp ]]
    return v23 + (v24 - v23) * v25;
end;
local v27 = {
    Animations = {
        Character = 14476915136, 
        Victim = 14476924948, 
        Camera = 14476939570
    }
};
v27.Use = function(v28) --[[ Line: 42 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v21 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_TweenService_0 (copy), v27 (copy), l_AnimHelper_0 (copy), l_BubbleModule_0 (copy), l_Common_0 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
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
        task.delay(0.9, function() --[[ Line: 103 ]]
            -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_TweenService_0 (ref)
            local v47 = l_SoundHelper_0:PlaySound({
                Name = "GhostUltSong", 
                Parent = l_Workspace_0.Debris
            });
            local l_Volume_0 = v47.Volume;
            v47.Volume = 0;
            l_TweenService_0:Create(v47, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Volume = l_Volume_0
            }):Play();
        end);
    end;
    task.wait(0.5);
    local v49 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v50 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v31 or v32 then
        l_TweenService_0:Create(l_Main_0.White, v50, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v50, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v49, {
            ImageTransparency = 0.5
        }):Play();
    end;
    local v51 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v31 or v32) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_1 = v51.Volume;
    v51.Volume = 0;
    task.delay(0.25, function() --[[ Line: 135 ]]
        -- upvalues: v51 (copy), v31 (copy), v32 (copy), l_Volume_1 (copy), v28 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v51:Stop();
        if v31 or v32 then
            v51.Volume = l_Volume_1;
        else
            v51.Volume = l_Volume_1 / 5;
        end;
        v51:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v28.HasVoicelines then
            local v54 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v31 or v32) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v31 and not v32 then
                v54.Volume = v54.Volume / 5;
            end;
        end;
    end);
    task.wait(0.5);
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v31 or v32 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 60;
    end;
    local v57 = {
        Animator = v34, 
        AnimId = v27.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v58 = {
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
    l_AnimHelper_0:CreateAnim(v57);
    l_AnimHelper_0:CreateAnim(v58);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v57);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v58);
    local v61 = nil;
    local v62 = script.Effects:Clone();
    v62.Parent = l_Workspace_0.Debris;
    v62.CFrame = l_Victim_0.PrimaryPart.CFrame;
    task.delay(20, function() --[[ Line: 207 ]]
        -- upvalues: v62 (copy)
        v62:Destroy();
    end);
    local v63 = {};
    local l_Aura_0 = script.Aura;
    task.delay(2.0833333333333335, function() --[[ Line: 214 ]]
        -- upvalues: l_Character_0 (copy), l_Aura_0 (copy), v63 (copy)
        for _, v66 in l_Character_0:GetChildren() do
            if v66:IsA("BasePart") then
                for _, v68 in l_Aura_0:GetChildren() do
                    local v69 = v68:Clone();
                    v69.Parent = v66;
                    table.insert(v63, v69);
                end;
            end;
        end;
        task.wait(10);
        for _, v71 in v63 do
            v71.Enabled = false;
        end;
        task.wait(2);
        for _, v73 in v63 do
            v73:Destroy();
        end;
    end);
    local v74 = {};
    local function v82(v75, v76) --[[ Line: 238 ]] --[[ Name: SetTransparency ]]
        -- upvalues: l_Workspace_0 (ref)
        for _, v78 in v75:GetDescendants() do
            if v78.Name == "UnusualParticle" then
                v78.Enabled = v76 == 0;
            end;
            if (v78:IsA("BasePart") or v78:IsA("Decal")) and v78.LocalTransparencyModifier < 1000 then
                v78.LocalTransparencyModifier = v76;
            end;
        end;
        local l_FirstChild_0 = l_Workspace_0.Welds:FindFirstChild(v75.Name);
        if l_FirstChild_0 then
            for _, v81 in l_FirstChild_0:GetDescendants() do
                if v81.Name == "UnusualParticle" then
                    v81.Enabled = v76 == 0;
                end;
                if (v81:IsA("BasePart") or v81:IsA("Decal")) and v81.LocalTransparencyModifier < 1000 then
                    v81.LocalTransparencyModifier = v76;
                end;
            end;
        end;
    end;
    v74[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hide1"):Connect(function() --[[ Line: 259 ]]
        -- upvalues: v31 (copy), v32 (copy), v82 (copy), l_Character_0 (copy), l_CurrentCamera_0 (copy)
        if not v31 and not v32 then
            return;
        else
            v82(l_Character_0, 1);
            l_CurrentCamera_0.FieldOfView = 45;
            task.delay(10, function() --[[ Line: 264 ]]
                -- upvalues: v82 (ref), l_Character_0 (ref)
                v82(l_Character_0, 0);
            end);
            return;
        end;
    end);
    v74[2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hide2"):Connect(function() --[[ Line: 269 ]]
        -- upvalues: v31 (copy), v32 (copy), v82 (copy), l_Victim_0 (copy), l_Character_0 (copy), l_CurrentCamera_0 (copy), l_TweenService_0 (ref)
        if not v31 and not v32 then
            return;
        else
            v82(l_Victim_0, 1);
            v82(l_Character_0, 0);
            l_CurrentCamera_0.FieldOfView = 45;
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 60
            }):Play();
            task.wait(1.2);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 45
            }):Play();
            task.wait(0.2);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 60
            }):Play();
            task.delay(10, function() --[[ Line: 284 ]]
                -- upvalues: v82 (ref), l_Victim_0 (ref)
                v82(l_Victim_0, 0);
            end);
            return;
        end;
    end);
    v74[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Show"):Connect(function() --[[ Line: 289 ]]
        -- upvalues: v31 (copy), v32 (copy), v82 (copy), l_Character_0 (copy), l_Victim_0 (copy)
        if not v31 and not v32 then
            return;
        else
            v82(l_Character_0, 0);
            v82(l_Victim_0, 0);
            return;
        end;
    end);
    v74[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("FOV1"):Connect(function() --[[ Line: 295 ]]
        -- upvalues: v31 (copy), v32 (copy), l_CurrentCamera_0 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), l_Victim_0 (copy), v21 (ref)
        if not v31 and not v32 then
            return;
        else
            l_CurrentCamera_0.FieldOfView = 30;
            task.delay(0.3333333333333333, function() --[[ Line: 299 ]]
                -- upvalues: l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                l_ColorCorrection_0.Saturation = 0;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v83 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v83, {
                    Saturation = 0.2, 
                    Contrast = 0.2
                }):Play();
                local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                l_MenuBlur_0.Size = 0;
                l_MenuBlur_0.Enabled = true;
                local v85 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_0, v85, {
                    Size = 30
                }):Play();
                local v86 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v86, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
            end);
            task.wait(1.4166666666666667);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 28
            }):Play();
            task.defer(function() --[[ Line: 321 ]]
                -- upvalues: l_Victim_0 (ref), v21 (ref)
                local v87 = {
                    Step = 1, 
                    MaxTime = 0.6666666666666666, 
                    DeleteDelay = 0.2, 
                    AddTransparency = 0.97, 
                    Character = l_Victim_0
                };
                v21.AfterimageEffect(v87);
            end);
            v21.CameraShake({
                Preset = "LightHit", 
                WaitTime = 0.9, 
                Fade = 0.4
            });
            return;
        end;
    end);
    v74[5] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("FOV2"):Connect(function() --[[ Line: 340 ]]
        -- upvalues: v31 (copy), v32 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v61 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v21 (ref)
        if not v31 and not v32 then
            return;
        else
            task.wait(0.1);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.5);
            l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.5);
            v61:AdjustSpeed(0.5);
            task.delay(0.55, function() --[[ Line: 348 ]]
                -- upvalues: l_l_AnimHelper_0_Anim_0 (ref), l_l_AnimHelper_0_Anim_1 (ref), v61 (ref)
                l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
                l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
                v61:AdjustSpeed(1);
                l_l_AnimHelper_0_Anim_1.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
                v61.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
            end);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 60
            }):Play();
            v21.CameraShake({
                Preset = "SuperHardHit", 
                WaitTime = 0.2, 
                Fade = 0.8
            });
            return;
        end;
    end);
    local v88 = 0;
    v74[6] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Jab"):Connect(function() --[[ Line: 367 ]]
        -- upvalues: v62 (copy), v88 (ref), v21 (ref), l_Character_0 (copy), v31 (copy), v32 (copy), l_BubbleModule_0 (ref), l_Victim_0 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
        for _, v90 in v62.Hit1:GetChildren() do
            v90:Emit(v90:GetAttribute("EmitCount"));
        end;
        v88 = v88 + 1;
        if v88 == 1 then
            for _, v92 in v62.White:GetChildren() do
                v92:Emit(1);
            end;
        else
            for _, v94 in v62.Jab:GetChildren() do
                v94:Emit(v94:GetAttribute("EmitCount"));
            end;
            for _, v96 in v62.Hit2:GetChildren() do
                v96:Emit(1);
            end;
        end;
        for _, v98 in script.Jab:GetChildren() do
            local v99 = v98:Clone();
            v99.Parent = v21.GetWeldCharacter(l_Character_0).LeftLowerArm;
            for _, v101 in v99:GetChildren() do
                task.delay(v101:GetAttribute("EmitDelay") or 0, function() --[[ Line: 395 ]]
                    -- upvalues: v101 (copy)
                    v101:Emit(v101:GetAttribute("EmitCount") or 1);
                end);
            end;
            task.delay(5, function() --[[ Line: 400 ]]
                -- upvalues: v99 (copy)
                v99:Destroy();
            end);
        end;
        if not v31 and not v32 then
            return;
        else
            l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(8, 8, 8, 0), 0.3);
            if v88 == 1 then
                task.wait(0.2);
            end;
            task.defer(function() --[[ Line: 413 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.08
                });
            end);
            l_ColorCorrection_0.Saturation = 0.1;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v102 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v102, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v104 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v104, {
                Size = 20
            }):Play();
            local v105 = TweenInfo.new(0.075, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v105, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.35
            });
            if v88 == 1 then
                v21.CameraShake({
                    Preset = "SuperHardHit", 
                    WaitTime = 0.6, 
                    Fade = 1
                });
            elseif v88 == 2 then
                v21.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.2, 
                    Fade = 0.6
                });
            end;
            if v88 == 3 then
                v21.CameraShake({
                    Preset = "HardHitRoll", 
                    WaitTime = 0.3, 
                    Fade = 0.6
                });
            end;
            return;
        end;
    end);
    local v106 = nil;
    v74[7] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Ready"):Connect(function() --[[ Line: 466 ]]
        -- upvalues: v31 (copy), v32 (copy), l_Common_0 (ref), v21 (ref), l_Character_0 (copy), l_TweenService_0 (ref), v106 (ref)
        if not v31 and not v32 then
            return;
        else
            local v107 = script.GhostFrame:Clone();
            v107.Parent = l_Common_0;
            local v108 = script.Startup.Attachment:Clone();
            v108.Parent = v21.GetWeldCharacter(l_Character_0).RightLowerArm;
            for _, v110 in v108:GetChildren() do
                v110.Enabled = true;
            end;
            task.delay(0.25, function() --[[ Line: 479 ]]
                -- upvalues: v108 (copy)
                for _, v112 in v108:GetChildren() do
                    v112.Enabled = false;
                end;
            end);
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.1, 
                Fade = 0.4
            });
            task.wait(0.1);
            l_TweenService_0:Create(v107, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                BackgroundTransparency = 0
            }):Play();
            task.wait(0.7);
            task.defer(function() --[[ Line: 495 ]]
                -- upvalues: v107 (copy)
                for v113, v114 in Enum.FontWeight:GetEnumItems() do
                    if v113 ~= 2 and v113 ~= 3 and v113 ~= 4 then
                        v107.TextLabel.FontFace = Font.new(Font.fromEnum(Enum.Font.GrenzeGotisch).Family, v114, Enum.FontStyle.Normal);
                        task.wait(0.2);
                    end;
                end;
            end);
            l_TweenService_0:Create(v107.TextLabel, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                TextTransparency = 0
            }):Play();
            task.wait(1.2);
            l_TweenService_0:Create(v107, TweenInfo.new(1.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                BackgroundTransparency = 1
            }):Play();
            l_TweenService_0:Create(v107.TextLabel, TweenInfo.new(1.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                TextTransparency = 1
            }):Play();
            v106 = script.WindBeam:Clone();
            v106.Parent = v21.GetWeldCharacter(l_Character_0);
            for _, v116 in v106:GetChildren() do
                local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(v116.Name);
                if l_l_Character_0_FirstChild_0 then
                    local l_Weld_0 = Instance.new("Weld");
                    l_Weld_0.Parent = v116;
                    l_Weld_0.Part0 = l_l_Character_0_FirstChild_0;
                    l_Weld_0.Part1 = v116;
                end;
            end;
            return;
        end;
    end);
    v74[8] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final1"):Connect(function() --[[ Line: 526 ]]
        -- upvalues: v62 (copy), v31 (copy), v32 (copy), v21 (ref), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
        for _, v120 in v62.Hit3:GetChildren() do
            v120:Emit(v120:GetAttribute("EmitCount"));
        end;
        for _, v122 in v62.Hit4:GetChildren() do
            v122:Emit(v122:GetAttribute("EmitCount"));
        end;
        if not v31 and not v32 then
            return;
        else
            task.defer(function() --[[ Line: 539 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.1
                });
            end);
            l_ColorCorrection_0.Saturation = 0.1;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v123 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v123, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
            l_MenuBlur_2.Size = 0;
            l_MenuBlur_2.Enabled = true;
            local v125 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_2, v125, {
                Size = 20
            }):Play();
            local v126 = TweenInfo.new(0.075, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v126, {
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
    v74[9] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final2"):Connect(function() --[[ Line: 574 ]]
        -- upvalues: v74 (copy), v62 (copy), v31 (copy), v32 (copy), v21 (ref), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
        for _, v128 in v74 do
            v128:Disconnect();
        end;
        for _, v130 in v62.Hit3:GetChildren() do
            v130:Emit(v130:GetAttribute("EmitCount"));
        end;
        for _, v132 in v62.Hit4:GetChildren() do
            v132:Emit(v132:GetAttribute("EmitCount"));
        end;
        for _, v134 in v62.Explosion:GetChildren() do
            v134:Emit(v134:GetAttribute("EmitCount"));
        end;
        for _, v136 in v62.Final:GetChildren() do
            v136:Emit(2);
        end;
        if not v31 and not v32 then
            return;
        else
            task.defer(function() --[[ Line: 599 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.1
                });
            end);
            l_ColorCorrection_0.Saturation = 0.1;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v137 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v137, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
            l_MenuBlur_3.Size = 0;
            l_MenuBlur_3.Enabled = true;
            local v139 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_3, v139, {
                Size = 20
            }):Play();
            local v140 = TweenInfo.new(0.075, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v140, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.HUDShake({
                Scale = 30, 
                Damper = 0.35
            });
            v21.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.3, 
                Fade = 0.6
            });
            return;
        end;
    end);
    if v31 or v32 then
        local v141 = l_Assets_0.Camera:Clone();
        v141.Name = l_Character_0.Name .. "Camera";
        v141.Parent = l_Workspace_0.Debris;
        local v142 = 0;
        do
            local l_v142_0 = v142;
            local function v144() --[[ Line: 641 ]] --[[ Name: UpdateCameraCFrame ]]
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
            v61 = l_AnimHelper_0:CreateAnim(v145);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 659 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v141 (copy), v144 (copy)
                l_CurrentCamera_0.CFrame = v141.Head.CFrame;
                v144();
            end);
            task.delay(12.75, function() --[[ Line: 664 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(12.75);
            v61:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.01);
            l_TweenService_0:Create(l_Main_0.White, v50, {
                BackgroundTransparency = 0
            }):Play();
            task.wait(0.3333333333333333);
            v61:Stop(0.1);
            if l_l_AnimHelper_0_Anim_1 then
                l_l_AnimHelper_0_Anim_1:Stop(0.1);
            end;
            l_l_AnimHelper_0_Anim_0:Stop(0.1);
            task.wait(0.3333333333333333);
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_CameraMode_0.Value = "";
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v49, {
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
        end;
    end;
    if v106 then
        v106:Destroy();
    end;
    for _, v149 in v74 do
        v149:Disconnect();
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v27;