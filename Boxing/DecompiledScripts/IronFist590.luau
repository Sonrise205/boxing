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
local l_BubbleModule_0 = require(l_ReplicatedStorage_0:WaitForChild("BubbleModule"));
local l_Parent_0 = script.Parent.Parent;
local v21 = require(l_Parent_0);
local _ = Random.new();
local function _(v23, v24, v25) --[[ Line: 32 ]] --[[ Name: Lerp ]]
    return v23 + (v24 - v23) * v25;
end;
local v27 = {
    Animations = {
        Character = 15187207937, 
        Victim = 15187266014, 
        Camera = 15187278475
    }
};
v27.Use = function(v28) --[[ Line: 42 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v21 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_TweenService_0 (copy), v27 (copy), l_AnimHelper_0 (copy), l_BubbleModule_0 (copy), l_ReplicatedStorage_0 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
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
        task.delay(1.9, function() --[[ Line: 103 ]]
            -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_TweenService_0 (ref)
            local v47 = l_SoundHelper_0:PlaySound({
                Name = "IronFistUltSong", 
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
    task.delay(0.36, function() --[[ Line: 135 ]]
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
            local l_Volume_2 = v54.Volume;
            v54.Volume = 0;
            task.wait(4);
            v54.Volume = l_Volume_2;
        end;
    end);
    task.wait(0.5);
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v31 or v32 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 60;
    end;
    local v58 = {
        Animator = v34, 
        AnimId = v27.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v59 = {
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
    l_AnimHelper_0:CreateAnim(v58);
    l_AnimHelper_0:CreateAnim(v59);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v58);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v59);
    local v62 = nil;
    local v63 = script.Effects:Clone();
    v63.Parent = l_Workspace_0.Debris;
    v63.CFrame = l_Victim_0.PrimaryPart.CFrame;
    task.delay(30, function() --[[ Line: 213 ]]
        -- upvalues: v63 (copy)
        v63:Destroy();
    end);
    local v64 = {};
    local function v72(v65, v66) --[[ Line: 219 ]] --[[ Name: SetTransparency ]]
        -- upvalues: l_Workspace_0 (ref)
        for _, v68 in v65:GetDescendants() do
            if v68.Name == "UnusualParticle" then
                v68.Enabled = v66 == 0;
            end;
            if (v68:IsA("BasePart") or v68:IsA("Decal")) and v68.LocalTransparencyModifier < 1000 then
                v68.LocalTransparencyModifier = v66;
            end;
        end;
        local l_FirstChild_0 = l_Workspace_0.Welds:FindFirstChild(v65.Name);
        if l_FirstChild_0 then
            for _, v71 in l_FirstChild_0:GetDescendants() do
                if v71.Name == "UnusualParticle" then
                    v71.Enabled = v66 == 0;
                end;
                if (v71:IsA("BasePart") or v71:IsA("Decal")) and v71.LocalTransparencyModifier < 1000 then
                    v71.LocalTransparencyModifier = v66;
                end;
            end;
        end;
    end;
    local v73 = v21.GetWeldCharacter(l_Character_0);
    v64[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("FirstHit"):Connect(function() --[[ Line: 242 ]]
        -- upvalues: v63 (copy), l_Character_0 (copy), v31 (copy), v32 (copy), v21 (ref), l_BubbleModule_0 (ref), l_Victim_0 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
        local l_Splatter_0 = v63.Splatter;
        l_Splatter_0.Parent = l_Character_0.Head;
        for _, v76 in l_Splatter_0:GetChildren() do
            task.delay(v76:GetAttribute("EmitDelay") or 0, function() --[[ Line: 247 ]]
                -- upvalues: v76 (copy)
                v76:Emit(v76:GetAttribute("EmitCount") or 1);
            end);
        end;
        task.delay(0.5, function() --[[ Line: 252 ]]
            -- upvalues: v63 (ref), l_Character_0 (ref)
            local l_MiniSplatter_0 = v63.MiniSplatter;
            l_MiniSplatter_0.Parent = l_Character_0.Head;
            for _, v79 in l_MiniSplatter_0:GetChildren() do
                task.delay(v79:GetAttribute("EmitDelay") or 0, function() --[[ Line: 257 ]]
                    -- upvalues: v79 (copy)
                    v79:Emit(v79:GetAttribute("EmitCount") or 1);
                end);
            end;
            task.delay(10, function() --[[ Line: 262 ]]
                -- upvalues: l_MiniSplatter_0 (copy)
                l_MiniSplatter_0:Destroy();
            end);
        end);
        task.delay(10, function() --[[ Line: 267 ]]
            -- upvalues: l_Splatter_0 (copy)
            l_Splatter_0:Destroy();
        end);
        if not v31 and not v32 then
            return;
        else
            task.defer(function() --[[ Line: 273 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.08
                });
            end);
            l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(8, 8, 8, 0), 0.3);
            l_ColorCorrection_0.Saturation = 0.1;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v80 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v80, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
            l_MenuBlur_0.Size = 0;
            l_MenuBlur_0.Enabled = true;
            local v82 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_0, v82, {
                Size = 20
            }):Play();
            local v83 = TweenInfo.new(0.075, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v83, {
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
    v64[2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Courage"):Connect(function() --[[ Line: 310 ]]
        -- upvalues: v63 (copy), l_Character_0 (copy), v31 (copy), v32 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
        task.wait(0.1);
        local v84 = v63.EyeGlow:Clone();
        v84.Parent = l_Character_0.Head;
        v84.Glow:Emit(1);
        task.delay(5, function() --[[ Line: 317 ]]
            -- upvalues: v84 (copy)
            v84:Destroy();
        end);
        if not v31 and not v32 then
            return;
        else
            l_ColorCorrection_0.Saturation = 0.1;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v85 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v85, {
                Saturation = -0.1, 
                Contrast = 0.1
            }):Play();
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v87 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v87, {
                Size = 10
            }):Play();
            local v88 = TweenInfo.new(0.075, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v88, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            return;
        end;
    end);
    local v89 = script.Ribcage:Clone();
    v89.CFrame = l_Victim_0.UpperTorso.CFrame;
    v89.Parent = l_Workspace_0.Debris;
    v89.Main.Transparency = 1;
    local l_Weld_0 = Instance.new("Weld");
    l_Weld_0.Parent = v89;
    l_Weld_0.Part0 = v89;
    l_Weld_0.Part1 = l_Victim_0.UpperTorso;
    local l_Saturation_0 = l_ColorCorrection_0.Saturation;
    v64[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("FirstLoad"):Connect(function() --[[ Line: 352 ]]
        -- upvalues: v21 (ref), l_Character_0 (copy)
        task.defer(function() --[[ Line: 353 ]]
            -- upvalues: v21 (ref), l_Character_0 (ref)
            v21.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "IronFist", 
                    TargetPart = "LeftHand", 
                    DelayTime = 0, 
                    HoldTime = 0.3333333333333333, 
                    TimeScale = 0.3
                }
            });
        end);
    end);
    v64[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("FirstRib"):Connect(function() --[[ Line: 368 ]]
        -- upvalues: l_BubbleModule_0 (ref), l_Victim_0 (copy), v63 (copy), v31 (copy), v32 (copy), v21 (ref), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Saturation_0 (copy), l_Lighting_0 (ref)
        l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(10, 10, 10, 0), 0.3);
        local l_Left_0 = v63.Left;
        l_Left_0.Parent = l_Victim_0.PrimaryPart;
        for _, v94 in l_Left_0:GetChildren() do
            v94:Emit(1);
        end;
        if not v31 and not v32 then
            return;
        else
            task.defer(function() --[[ Line: 380 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.08
                });
            end);
            l_ColorCorrection_0.Saturation = 0.4;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v95 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v95, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            task.delay(0.7, function() --[[ Line: 393 ]]
                -- upvalues: l_TweenService_0 (ref), l_ColorCorrection_0 (ref), l_Saturation_0 (ref)
                l_TweenService_0:Create(l_ColorCorrection_0, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Saturation = l_Saturation_0
                }):Play();
            end);
            local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
            l_MenuBlur_2.Size = 0;
            l_MenuBlur_2.Enabled = true;
            local v97 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_2, v97, {
                Size = 20
            }):Play();
            local v98 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v98, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.4, 
                Fade = 3
            });
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.35
            });
            return;
        end;
    end);
    v64[5] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Zoom"):Connect(function() --[[ Line: 440 ]]
        -- upvalues: v89 (copy), l_TweenService_0 (ref), v63 (copy), v73 (copy), l_BubbleModule_0 (ref), l_Victim_0 (copy), v31 (copy), v32 (copy), l_ColorCorrection_0 (copy), v21 (ref), l_Saturation_0 (copy), l_Lighting_0 (ref)
        task.delay(0.1, function() --[[ Line: 441 ]]
            -- upvalues: v89 (ref), l_TweenService_0 (ref)
            v89.Main.Transparency = 0;
            v89.Main.Highlight.Enabled = true;
            l_TweenService_0:Create(v89.Main.Highlight, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FillColor = Color3.fromRGB(255, 78, 81), 
                OutlineColor = Color3.fromRGB(255, 78, 81)
            }):Play();
            task.wait(0.3);
            l_TweenService_0:Create(v89.Main.Highlight, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FillTransparency = 1, 
                OutlineTransparency = 1
            }):Play();
            task.wait(0.5);
            v89.Main.Transparency = 1;
            v89.Main.Highlight.Enabled = false;
        end);
        local v99 = v63.Smoke:Clone();
        v99.Parent = v73.PrimaryPart;
        for _, v101 in v99:GetChildren() do
            v101:Emit(v101:GetAttribute("EmitCount") or 0);
        end;
        l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(10, 10, 10, 0), 0.3);
        if not v31 and not v32 then
            return;
        else
            l_ColorCorrection_0.Enabled = true;
            l_TweenService_0:Create(l_ColorCorrection_0, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Saturation = -0.5
            }):Play();
            task.defer(function() --[[ Line: 470 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.08
                });
            end);
            l_ColorCorrection_0.Saturation = 0.4;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v102 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v102, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            task.delay(0.7, function() --[[ Line: 483 ]]
                -- upvalues: l_TweenService_0 (ref), l_ColorCorrection_0 (ref), l_Saturation_0 (ref)
                l_TweenService_0:Create(l_ColorCorrection_0, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Saturation = l_Saturation_0
                }):Play();
            end);
            local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
            l_MenuBlur_3.Size = 0;
            l_MenuBlur_3.Enabled = true;
            local v104 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_3, v104, {
                Size = 20
            }):Play();
            local v105 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v105, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v21.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.2, 
                Fade = 3
            });
            return;
        end;
    end);
    v64[6] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Broken"):Connect(function() --[[ Line: 504 ]]
        -- upvalues: v63 (copy), v73 (copy), v31 (copy), v32 (copy), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        local l_HandSplatter_0 = v63.HandSplatter;
        l_HandSplatter_0.Parent = v73.LeftHand;
        for _, v108 in l_HandSplatter_0:GetChildren() do
            task.delay(v108:GetAttribute("EmitDelay") or 0, function() --[[ Line: 509 ]]
                -- upvalues: v108 (copy)
                v108:Emit(5);
            end);
        end;
        task.delay(10, function() --[[ Line: 514 ]]
            -- upvalues: l_HandSplatter_0 (copy)
            l_HandSplatter_0:Destroy();
        end);
        if not v31 and not v32 then
            return;
        else
            task.wait(0.5);
            local v109 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v109, {
                Saturation = -1, 
                Contrast = 0.6
            }):Play();
            local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
            l_MenuBlur_4.Size = 0;
            l_MenuBlur_4.Enabled = true;
            local v111 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_4, v111, {
                Size = 20
            }):Play();
            return;
        end;
    end);
    local l_Brightness_0 = l_Lighting_0.Brightness;
    local l_TimeOfDay_0 = l_Lighting_0.TimeOfDay;
    local v114 = TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
    local v115 = v21.GetAtmosphere();
    local v116 = {
        Density = v115.Density, 
        Color = v115.Color, 
        Haze = v115.Haze, 
        Glare = v115.Glare, 
        Decay = v115.Decay
    };
    v64[7] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Cover"):Connect(function() --[[ Line: 545 ]]
        -- upvalues: v31 (copy), v32 (copy), l_TweenService_0 (ref), v115 (copy), l_Lighting_0 (ref), l_ColorCorrection_0 (copy)
        if not v31 and not v32 then
            return;
        else
            l_TweenService_0:Create(v115, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Density = 0.92, 
                Color = Color3.fromRGB(0, 0, 0), 
                Decay = Color3.fromRGB(125, 125, 125), 
                Haze = 20, 
                Glare = 0
            }):Play();
            local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
            l_MenuBlur_5.Size = 0;
            l_MenuBlur_5.Enabled = true;
            local v118 = TweenInfo.new(1.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_5, v118, {
                Size = 60
            }):Play();
            local v119 = TweenInfo.new(1.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v119, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            return;
        end;
    end);
    v64[8] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hide"):Connect(function() --[[ Line: 567 ]]
        -- upvalues: v31 (copy), v32 (copy), v72 (copy), l_Victim_0 (copy), l_Character_0 (copy)
        if not v31 and not v32 then
            return;
        else
            v72(l_Victim_0, 0);
            v72(l_Character_0, 1);
            return;
        end;
    end);
    v64[9] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Confusion"):Connect(function() --[[ Line: 574 ]]
        -- upvalues: v31 (copy), v32 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v21 (ref)
        if not v31 and not v32 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 65
            }):Play();
            v21.CameraShake({
                Preset = "SuperHardHit", 
                WaitTime = 0.1, 
                Fade = 0.5
            });
            task.wait(1.4);
            v21.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.1, 
                Fade = 0.5
            });
            return;
        end;
    end);
    local v120 = {};
    local v121 = {};
    local v122 = {
        "Live", 
        "Welds"
    };
    if v31 or v32 then
        local v123, v124 = v21.GetPartsToHide(l_Character_0, v122);
        v120 = v123;
        v121 = v124;
    end;
    local v125 = l_ReplicatedStorage_0.Assets.Speedbox:Clone();
    task.delay(30, function() --[[ Line: 603 ]]
        -- upvalues: v125 (copy), v120 (ref), v121 (ref), v89 (copy)
        if v125 then
            v125:Destroy();
            for _, v127 in v120 do
                v127.LocalTransparencyModifier = 0;
            end;
            for _, v129 in v121 do
                v129.Enabled = true;
            end;
        end;
        if v89 then
            v89:Destroy();
        end;
    end);
    v64[10] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Show"):Connect(function() --[[ Line: 619 ]]
        -- upvalues: v21 (ref), l_Character_0 (copy), v31 (copy), v32 (copy), v125 (copy), l_TweenService_0 (ref), v115 (copy), v116 (copy), l_Lighting_0 (ref), v114 (copy), l_Brightness_0 (copy), l_TimeOfDay_0 (copy), v120 (ref), v121 (ref), l_CurrentCamera_0 (copy), v72 (copy), l_Victim_0 (copy), l_ColorCorrection_0 (copy)
        task.defer(function() --[[ Line: 620 ]]
            -- upvalues: v21 (ref), l_Character_0 (ref)
            v21.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "IronFist", 
                    TargetPart = "RightHand", 
                    DelayTime = 0, 
                    HoldTime = 2, 
                    TimeScale = 0.1
                }
            });
        end);
        if not v31 and not v32 then
            return;
        else
            v125.Parent = game.Workspace.Debris;
            v125:SetPrimaryPartCFrame(l_Character_0.PrimaryPart.CFrame);
            l_TweenService_0:Create(v115, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v116):Play();
            l_TweenService_0:Create(l_Lighting_0, v114, {
                Brightness = l_Brightness_0
            }):Play();
            l_Lighting_0.TimeOfDay = l_TimeOfDay_0;
            for _, v131 in v120 do
                v131.LocalTransparencyModifier = 1;
            end;
            for _, v133 in v121 do
                v133.Enabled = false;
            end;
            l_CurrentCamera_0.FieldOfView = 70;
            v72(l_Victim_0, 1);
            v72(l_Character_0, 0);
            l_ColorCorrection_0.Saturation = 0.4;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v134 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v134, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_6 = l_Lighting_0.MenuBlur;
            l_MenuBlur_6.Size = 0;
            l_MenuBlur_6.Enabled = true;
            local v136 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_6, v136, {
                Size = 20
            }):Play();
            local v137 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v137, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.defer(function() --[[ Line: 674 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.12
                });
            end);
            v21.CameraShake({
                Preset = "SuperHardHit", 
                WaitTime = 3, 
                Fade = 3
            });
            return;
        end;
    end);
    v64[11] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 687 ]]
        -- upvalues: v31 (copy), v32 (copy), l_CurrentCamera_0 (copy), v125 (copy), v89 (copy), l_TweenService_0 (ref), v120 (ref), v121 (ref), v72 (copy), l_Victim_0 (copy), l_Character_0 (copy), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), v21 (ref)
        if not v31 and not v32 then
            return;
        else
            l_CurrentCamera_0.FieldOfView = 60;
            v125:Destroy();
            task.defer(function() --[[ Line: 694 ]]
                -- upvalues: v89 (ref), l_TweenService_0 (ref)
                v89.Main.Transparency = 0;
                v89.Main.Highlight.Enabled = true;
                l_TweenService_0:Create(v89.Main.Highlight, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FillColor = Color3.fromRGB(255, 78, 81), 
                    OutlineColor = Color3.fromRGB(255, 78, 81)
                }):Play();
                task.wait(0.3);
                l_TweenService_0:Create(v89.Main.Highlight, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FillTransparency = 1, 
                    OutlineTransparency = 1
                }):Play();
                task.wait(0.5);
                v89.Main.Transparency = 1;
                v89.Main.Highlight.Enabled = false;
            end);
            for _, v139 in v120 do
                v139.LocalTransparencyModifier = 0;
            end;
            for _, v141 in v121 do
                v141.Enabled = true;
            end;
            v72(l_Victim_0, 0);
            v72(l_Character_0, 0);
            l_ColorCorrection_0.Saturation = 0.4;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v142 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v142, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_7 = l_Lighting_0.MenuBlur;
            l_MenuBlur_7.Size = 0;
            l_MenuBlur_7.Enabled = true;
            local v144 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_7, v144, {
                Size = 20
            }):Play();
            local v145 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v145, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.defer(function() --[[ Line: 737 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.12
                });
            end);
            v21.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.1, 
                Fade = 3
            });
            return;
        end;
    end);
    v64[12] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final2"):Connect(function() --[[ Line: 750 ]]
        -- upvalues: v64 (copy), v63 (copy), v73 (copy), v89 (copy), l_TweenService_0 (ref), l_Victim_0 (copy), l_BubbleModule_0 (ref), v31 (copy), v32 (copy), l_CurrentCamera_0 (copy), v72 (copy), l_Character_0 (copy), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), v21 (ref)
        for _, v147 in v64 do
            v147:Disconnect();
        end;
        local v148 = v63.Smoke:Clone();
        v148.Parent = v73.PrimaryPart;
        for _, v150 in v148:GetChildren() do
            v150:Emit(v150:GetAttribute("EmitCount") or 0);
        end;
        task.defer(function() --[[ Line: 762 ]]
            -- upvalues: v89 (ref), l_TweenService_0 (ref)
            v89.Main.Transparency = 0;
            v89.Main.Highlight.Enabled = true;
            l_TweenService_0:Create(v89.Main.Highlight, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FillColor = Color3.fromRGB(255, 78, 81), 
                OutlineColor = Color3.fromRGB(255, 78, 81)
            }):Play();
            task.wait(0.3);
            l_TweenService_0:Create(v89.Main.Highlight, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FillTransparency = 1, 
                OutlineTransparency = 1
            }):Play();
            task.wait(0.5);
            v89.Main.Transparency = 1;
            v89.Main.Highlight.Enabled = false;
            if v89 then
                v89:Destroy();
            end;
        end);
        local l_Final_0 = v63.Final;
        l_Final_0.Parent = l_Victim_0.PrimaryPart;
        for _, v153 in l_Final_0:GetChildren() do
            v153:Emit(v153:GetAttribute("EmitCount") or 5);
        end;
        task.delay(5, function() --[[ Line: 786 ]]
            -- upvalues: l_Final_0 (copy)
            l_Final_0:Destroy();
        end);
        l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(10, 10, 10, 0), 0.3);
        if not v31 and not v32 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 55
            }):Play();
            v72(l_Victim_0, 0);
            v72(l_Character_0, 0);
            l_ColorCorrection_0.Saturation = 0.4;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v154 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v154, {
                Saturation = -1, 
                Contrast = 0.6
            }):Play();
            local l_MenuBlur_8 = l_Lighting_0.MenuBlur;
            l_MenuBlur_8.Size = 0;
            l_MenuBlur_8.Enabled = true;
            local v156 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_8, v156, {
                Size = 50
            }):Play();
            local v157 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v157, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 1.7
            }):Play();
            task.defer(function() --[[ Line: 816 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.1
                });
            end);
            v21.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 1, 
                Fade = 3
            });
            return;
        end;
    end);
    if v31 or v32 then
        local v158 = l_Assets_0.Camera:Clone();
        v158.Name = l_Character_0.Name .. "Camera";
        v158.Parent = l_Workspace_0.Debris;
        local v159 = 0;
        do
            local l_v159_0 = v159;
            local function v161() --[[ Line: 835 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v159_0 (ref), v158 (copy), l_Character_0 (copy)
                if os.time() - l_v159_0 < 0.5 then
                    return;
                else
                    l_v159_0 = os.time();
                    v158:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v161();
            local v162 = {
                Animator = v158.AnimationController.Animator, 
                AnimId = v27.Animations.Camera
            };
            v62 = l_AnimHelper_0:CreateAnim(v162);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 853 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v158 (copy), v161 (copy)
                l_CurrentCamera_0.CFrame = v158.Head.CFrame;
                v161();
            end);
            task.delay(18.666666666666668, function() --[[ Line: 858 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(18.666666666666668);
            v62:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.01);
            l_TweenService_0:Create(l_Main_0.White, v50, {
                BackgroundTransparency = 0
            }):Play();
            task.wait(0.3333333333333333);
            v62:Stop(0.1);
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
            local v164 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v164, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v158:Destroy();
            l_TweenService_0:Create(l_Lighting_0, v114, {
                Brightness = l_Brightness_0
            }):Play();
            l_Lighting_0.TimeOfDay = l_TimeOfDay_0;
        end;
    end;
    for _, v166 in v64 do
        v166:Disconnect();
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v27;