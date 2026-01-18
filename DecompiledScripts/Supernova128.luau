local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("HttpService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0:WaitForChild("AlignHelper"));
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("Styles"));
local v12 = require(l_Modules_0.Cutscene.Utilities);
local _ = require(l_Modules_0.Cutscene.Cutscene);
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local l_EffectHelper_0 = l_Modules_0.EffectHelper;
local v20 = require(l_EffectHelper_0);
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local l_Debris_0 = workspace:WaitForChild("Debris");
local _ = Random.new();
local function _(v24, v25, v26) --[[ Line: 34 ]] --[[ Name: Lerp ]]
    return v24 + (v25 - v24) * v26;
end;
local v28 = {
    Animations = {
        Character = 94083159061113, 
        Victim = 109942829613094, 
        Camera = 74405242269371
    }, 
    CameraRig = l_ReplicatedStorage_0.Assets.FoVCamera
};
local v29 = {
    Low = {
        ColorCorrection = {
            Saturation = -0.2, 
            Contrast = 1
        }, 
        Blur = {
            Size = 12
        }
    }, 
    Medium = {
        ColorCorrection = {
            Saturation = -0.3, 
            Contrast = 1.5
        }, 
        Blur = {
            Size = 15
        }
    }
};
local function _(v30, v31) --[[ Line: 68 ]] --[[ Name: impactCorrection ]]
    -- upvalues: l_TweenService_0 (copy), l_Lighting_0 (copy)
    task.defer(function() --[[ Line: 69 ]]
        -- upvalues: l_TweenService_0 (ref), v30 (copy), v31 (copy), l_Lighting_0 (ref)
        local v32 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        l_TweenService_0:Create(v30, v32, v31.ColorCorrection):Play();
        local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
        l_MenuBlur_0.Size = 0;
        l_MenuBlur_0.Enabled = true;
        local v34 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
        l_TweenService_0:Create(l_MenuBlur_0, v34, v31.Blur):Play();
    end);
end;
local _ = function(v36, v37) --[[ Line: 82 ]] --[[ Name: toggleLines ]]
    for _, v39 in v36:GetChildren() do
        if v39:IsA("ParticleEmitter") then
            v39.Enabled = v37;
        end;
    end;
end;
local function _(v41, v42, v43) --[[ Line: 89 ]] --[[ Name: createFeetEffect ]]
    -- upvalues: l_Debris_0 (copy), v12 (copy)
    local v44 = v41:Clone();
    v44.Parent = l_Debris_0;
    if v42 then
        v44.Position = v42;
    end;
    v12.Emit(v44);
    game:GetService("Debris"):AddItem(v44, v43);
    return v44;
end;
v28.Use = function(v46) --[[ Line: 102 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Players_0 (copy), l_Debris_0 (copy), v20 (copy), l_Main_0 (copy), l_EffectHelper_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_TweenService_0 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), l_CurrentCamera_0 (copy), v28 (copy), l_AnimHelper_0 (copy), v12 (copy), v29 (copy)
    local l_Character_0 = v46.Character;
    local l_Victim_0 = v46.Victim;
    local v49 = l_LocalPlayer_0.Character == l_Character_0;
    local v50 = l_LocalPlayer_0.Character == l_Victim_0;
    local _ = l_Players_0:GetPlayerFromCharacter(l_Victim_0);
    local v52 = RaycastParams.new();
    v52.FilterType = Enum.RaycastFilterType.Exclude;
    v52.FilterDescendantsInstances = {
        l_Debris_0, 
        l_Character_0, 
        l_Victim_0
    };
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v54 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v56 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    local v57 = v20.GetWeldCharacter(l_Character_0);
    local v58 = v20.GetWeldCharacter(l_Victim_0);
    local function v65() --[[ Line: 126 ]] --[[ Name: SlowDownAnimations ]]
        -- upvalues: v54 (copy), v56 (copy)
        for _, v60 in (v54:GetPlayingAnimationTracks()) do
            if v60.Priority ~= Enum.AnimationPriority.Idle then
                local _ = v60.Speed;
                v60:AdjustSpeed(0.2);
            end;
        end;
        for _, v63 in (v56:GetPlayingAnimationTracks()) do
            if v63.Priority ~= Enum.AnimationPriority.Idle then
                local _ = v63.Speed;
                v63:AdjustSpeed(0.2);
            end;
        end;
    end;
    task.defer(function() --[[ Line: 144 ]]
        -- upvalues: v65 (copy)
        local v66 = tick();
        while tick() - v66 < 1 do
            v65();
            task.wait(0.1);
        end;
    end);
    task.defer(function() --[[ Line: 153 ]]
        -- upvalues: v49 (copy), v50 (copy), v20 (ref), l_Main_0 (ref)
        if v49 or v50 then
            v20.StatusFrame(v50, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v67 = l_EffectHelper_0.UltimateStart:Clone();
    v67.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v67.Parent = l_Debris_0;
    local l_ClockTime_0 = l_Lighting_0.ClockTime;
    task.delay(20, function() --[[ Line: 165 ]]
        -- upvalues: v67 (copy)
        if v67 then
            v67:Destroy();
        end;
    end);
    for _, v70 in v67.Particle:GetChildren() do
        v70.Enabled = false;
        v70:Emit(v70:GetAttribute("EmitCount"));
    end;
    local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
    l_ColorCorrectionEffect_0.Name = "MapRemove";
    l_ColorCorrectionEffect_0.Parent = l_Lighting_0;
    local v72 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v49 or v50) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v72.Volume;
    v72.Volume = 0;
    task.delay(1.32, function() --[[ Line: 187 ]]
        -- upvalues: v72 (copy), v49 (copy), v50 (copy), l_Volume_0 (ref), l_TweenService_0 (ref)
        v72:Stop();
        if not v49 and not v50 then
            l_Volume_0 = l_Volume_0 / 5;
        end;
        v72:Play();
        l_TweenService_0:Create(v72, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Volume = l_Volume_0
        }):Play();
    end);
    local v74 = l_SoundHelper_0:PlaySound({
        Name = "Song", 
        IgnoreDelete = true, 
        DirectCopy = script.SONG, 
        Parent = (not not v49 or v50) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_1 = v74.Volume;
    v74:Stop();
    task.delay(0.5, function() --[[ Line: 211 ]]
        -- upvalues: v74 (copy), l_TweenService_0 (ref), l_Volume_1 (copy)
        v74.Volume = 0;
        v74.TimePosition = 0.5;
        l_TweenService_0:Create(v74, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Volume = l_Volume_1 / 2
        }):Play();
        v74:Play();
        task.wait(1.21);
        v74.Volume = l_Volume_1;
        task.wait(25);
        if v74 then
            v74:Destroy();
        end;
    end);
    local v76 = nil;
    local v77 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local _ = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local _ = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
    local v80 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    local v85 = {};
    local v86 = {};
    local v87 = {};
    local v88 = {};
    local v89 = nil;
    local v90 = nil;
    v89 = l_Character_0:GetAttribute("CachedLighting");
    local v91 = false;
    local v92 = false;
    local v93 = nil;
    local v94 = nil;
    local function v106() --[[ Line: 259 ]] --[[ Name: cleanup ]]
        -- upvalues: v85 (copy), l_RunService_0 (ref), v84 (ref), v76 (ref), v92 (ref), l_Victim_0 (copy), l_Character_0 (copy), v93 (ref), v94 (ref), v82 (ref), v72 (copy), l_TweenService_0 (ref), v74 (copy), v81 (ref), v90 (ref), v86 (copy), v87 (copy), v88 (copy), l_Lighting_0 (ref), l_ColorCorrectionEffect_0 (copy), l_ClockTime_0 (copy), l_ReplicatedStorage_0 (ref), l_Main_0 (ref), v77 (copy), v20 (ref)
        for _, v96 in v85 do
            v96:Disconnect();
        end;
        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
        v84.Value = "";
        v76 = true;
        v92 = true;
        l_Victim_0.PrimaryPart.Anchored = false;
        l_Character_0.PrimaryPart.Anchored = false;
        if v93 then
            v93:Stop();
        end;
        if v94 then
            v94:Stop();
        end;
        if v82 then
            v82:Stop();
        end;
        if v72 then
            l_TweenService_0:Create(v72, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Volume = 0
            }):Play();
            task.delay(1, function() --[[ Line: 287 ]]
                -- upvalues: v72 (ref)
                v72:Destroy();
            end);
        end;
        if v74 then
            l_TweenService_0:Create(v74, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Volume = 0
            }):Play();
            task.delay(5, function() --[[ Line: 294 ]]
                -- upvalues: v74 (ref)
                v74:Destroy();
            end);
        end;
        if v81 then
            v81:Destroy();
        end;
        if v90 then
            v90.Parent = script;
        end;
        for _, v98 in v86 do
            v98:Destroy();
        end;
        for _, v100 in v87 do
            v100.LocalTransparencyModifier = 0;
        end;
        for _, v102 in v88 do
            v102.Enabled = true;
        end;
        local l_CachedAtmosphere_0 = l_Lighting_0:FindFirstChild("CachedAtmosphere");
        if l_CachedAtmosphere_0 then
            for _, v105 in l_CachedAtmosphere_0:GetChildren() do
                v105.Parent = l_Lighting_0;
            end;
            l_CachedAtmosphere_0:Destroy();
        end;
        l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(1), {
            Saturation = 0, 
            Contrast = 0, 
            Brightness = 0, 
            TintColor = Color3.new(1, 1, 1)
        }):Play();
        l_Lighting_0.ClockTime = l_ClockTime_0;
        l_ReplicatedStorage_0.Events.RefreshMapLighting:Fire();
        v84.Value = "";
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v77, {
            ImageTransparency = 1
        }):Play();
        v20.SetTransparency(l_Victim_0, 0);
        v20.SetTransparency(l_Character_0, 0);
    end;
    v85[#v85 + 1] = l_Character_0.AncestryChanged:Connect(function() --[[ Line: 348 ]]
        -- upvalues: l_Character_0 (copy), v106 (copy)
        task.wait(0.1);
        if l_Character_0.Parent == nil then
            v106();
        end;
    end);
    v85[#v85 + 1] = l_Victim_0.AncestryChanged:Connect(function() --[[ Line: 355 ]]
        -- upvalues: l_Victim_0 (copy), v106 (copy)
        task.wait(0.1);
        if l_Victim_0.Parent == nil then
            v106();
        end;
    end);
    if v49 or v50 then
        task.defer(function() --[[ Line: 363 ]]
            -- upvalues: v20 (ref), v67 (copy)
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
            v67:Destroy();
        end);
    end;
    local v107 = os.clock();
    v90 = script.EffectModel:Clone();
    v90.Parent = workspace;
    print((("Took %*s to clone"):format(os.clock() - v107)));
    task.wait(0.5);
    local l_CFrame_0 = l_Character_0.HumanoidRootPart.CFrame;
    v90:PivotTo(l_CFrame_0);
    local _ = v20.GetAtmosphere();
    if v49 or v50 then
        l_TweenService_0:Create(l_Main_0.White, v80, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v80, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v77, {
            ImageTransparency = 0.5
        }):Play();
        task.delay(1, function() --[[ Line: 395 ]]
            -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v80 (copy)
            l_TweenService_0:Create(l_Lighting_0, v80, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
        end);
    end;
    local _ = l_Workspace_0:FindFirstChild("CameraSettings");
    table.insert(v86, v90);
    task.wait(0.5);
    v84 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    if v49 or v50 then
        v84.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 30;
    end;
    local v111 = {
        Animator = v54, 
        AnimId = v28.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v112 = {
        Animator = v56, 
        AnimId = v28.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v111);
    l_AnimHelper_0:CreateAnim(v112);
    v93 = l_AnimHelper_0:CreateAnim(v111);
    v94 = l_AnimHelper_0:CreateAnim(v112);
    if v49 or v50 then
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v77, {
            ImageTransparency = 1
        }):Play();
    end;
    local function v122(v113, v114) --[[ Line: 442 ]] --[[ Name: moveChildrenToParent ]]
        -- upvalues: v86 (copy)
        for _, v116 in v114:GetChildren() do
            for _, v118 in v113:GetChildren() do
                if v116.Name == v118.Name then
                    for _, v120 in v116:GetChildren() do
                        local v121 = v120:Clone();
                        v121.Parent = v118;
                        table.insert(v86, v121);
                    end;
                end;
            end;
        end;
    end;
    local v123 = os.clock();
    v122(v58, script.VictimParts);
    v122(v57, script.CharacterParts);
    print((("Move children to parent took %*s"):format(os.clock() - v123)));
    local v124 = true;
    local v125 = 0;
    task.delay(0.6, function() --[[ Line: 464 ]]
        -- upvalues: v12 (ref), v81 (ref)
        v12.Emit(v81.CamPart.camsidefx1);
    end);
    local v126 = script.Eyes:Clone();
    v126.Parent = v57:FindFirstChild("Head") or l_Character_0.Head;
    table.insert(v86, v126);
    for v197, v198 in {
        Victim = {
            BeginRightCharge = function() --[[ Line: 475 ]] --[[ Name: BeginRightCharge ]]
                -- upvalues: v125 (ref), v12 (ref), v58 (copy), l_ColorCorrectionEffect_0 (copy), v29 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v83 (ref)
                v125 = v125 + 1;
                if v125 == 2 then
                    v12.Emit(v58.RightHand);
                    local l_l_ColorCorrectionEffect_0_0 = l_ColorCorrectionEffect_0;
                    local l_Low_0 = v29.Low;
                    task.defer(function() --[[ Line: 69 ]]
                        -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrectionEffect_0_0 (copy), l_Low_0 (copy), l_Lighting_0 (ref)
                        local v129 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_l_ColorCorrectionEffect_0_0, v129, l_Low_0.ColorCorrection):Play();
                        local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_1.Size = 0;
                        l_MenuBlur_1.Enabled = true;
                        local v131 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_1, v131, l_Low_0.Blur):Play();
                    end);
                    v12.Emit(v83);
                end;
            end, 
            Punch1 = function() --[[ Line: 485 ]] --[[ Name: Punch1 ]]
                -- upvalues: v12 (ref), v90 (ref), l_ColorCorrectionEffect_0 (copy), v29 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                v12.Emit(v90.VFX.Barrage.FirstPunch1);
                task.wait(0.1);
                v12.Emit(v90.VFX["First Punch"]);
                local l_l_ColorCorrectionEffect_0_1 = l_ColorCorrectionEffect_0;
                local l_Low_1 = v29.Low;
                task.defer(function() --[[ Line: 69 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrectionEffect_0_1 (copy), l_Low_1 (copy), l_Lighting_0 (ref)
                    local v134 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_ColorCorrectionEffect_0_1, v134, l_Low_1.ColorCorrection):Play();
                    local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_2.Size = 0;
                    l_MenuBlur_2.Enabled = true;
                    local v136 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_2, v136, l_Low_1.Blur):Play();
                end);
            end, 
            Hook2 = function() --[[ Line: 493 ]] --[[ Name: Hook2 ]]
                -- upvalues: v12 (ref), v90 (ref)
                v12.Emit(v90.VFX.Hook2);
            end, 
            UpperTorsoCuts = function() --[[ Line: 497 ]] --[[ Name: UpperTorsoCuts ]]
                -- upvalues: v12 (ref), v90 (ref), v57 (copy)
                v12.Emit(v90.VFX.UpperCuts);
                v12.Emit(v57.UpperTorso);
            end, 
            BackgroundStreakLines = function() --[[ Line: 502 ]] --[[ Name: BackgroundStreakLines ]]
                -- upvalues: v12 (ref), v58 (copy)
                v12.Emit(v58.RightHand["Background streak lines 1"]);
                v12.Emit(v58.RightHand["Background streak 22233 1"]);
            end, 
            Hook3 = function() --[[ Line: 508 ]] --[[ Name: Hook3 ]]
                -- upvalues: v12 (ref), v90 (ref)
                v12.Emit(v90.VFX.Hookie);
            end, 
            FastPunches = function() --[[ Line: 512 ]] --[[ Name: FastPunches ]]
                -- upvalues: v12 (ref), v90 (ref), l_ColorCorrectionEffect_0 (copy), v29 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                v12.Emit(v90.VFX["Fast Punches"]);
                local l_l_ColorCorrectionEffect_0_2 = l_ColorCorrectionEffect_0;
                local l_Low_2 = v29.Low;
                task.defer(function() --[[ Line: 69 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrectionEffect_0_2 (copy), l_Low_2 (copy), l_Lighting_0 (ref)
                    local v139 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_ColorCorrectionEffect_0_2, v139, l_Low_2.ColorCorrection):Play();
                    local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_3.Size = 0;
                    l_MenuBlur_3.Enabled = true;
                    local v141 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_3, v141, l_Low_2.Blur):Play();
                end);
            end, 
            FastPunches2 = function() --[[ Line: 517 ]] --[[ Name: FastPunches2 ]]
                -- upvalues: v12 (ref), v90 (ref), l_ColorCorrectionEffect_0 (copy), v29 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                v12.Emit(v90.VFX["Fast Punches2"]);
                local l_l_ColorCorrectionEffect_0_3 = l_ColorCorrectionEffect_0;
                local l_Low_3 = v29.Low;
                task.defer(function() --[[ Line: 69 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrectionEffect_0_3 (copy), l_Low_3 (copy), l_Lighting_0 (ref)
                    local v144 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_ColorCorrectionEffect_0_3, v144, l_Low_3.ColorCorrection):Play();
                    local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_4.Size = 0;
                    l_MenuBlur_4.Enabled = true;
                    local v146 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_4, v146, l_Low_3.Blur):Play();
                end);
            end, 
            PunchWiffUpperTorso = function() --[[ Line: 522 ]] --[[ Name: PunchWiffUpperTorso ]]
                -- upvalues: v12 (ref), v90 (ref), v57 (copy)
                v12.Emit(v90.VFX.PunchWiff);
                v12.Emit(v57.UpperTorso);
            end, 
            Hook4 = function() --[[ Line: 527 ]] --[[ Name: Hook4 ]]
                -- upvalues: v12 (ref), v90 (ref)
                v12.Emit(v90.VFX.Hook3);
            end, 
            M11 = function() --[[ Line: 531 ]] --[[ Name: M11 ]]
                -- upvalues: v12 (ref), v90 (ref), v83 (ref), l_TweenService_0 (ref), l_ColorCorrectionEffect_0 (copy)
                v12.Emit(v90.VFX.m11);
                for _, v148 in v83:GetChildren() do
                    v148.Enabled = false;
                end;
                l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Saturation = -1
                }):Play();
                v12.Emit(v90.VFX.m11.Main.hit2);
                for _, v150 in v90.VFX.m11.Main.hit2:GetChildren() do
                    if v150:IsA("ParticleEmitter") then
                        l_TweenService_0:Create(v150, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TimeScale = 0.03
                        }):Play();
                    end;
                end;
            end, 
            Hook5 = function() --[[ Line: 548 ]] --[[ Name: Hook5 ]]
                -- upvalues: v12 (ref), v90 (ref), v83 (ref)
                v12.Emit(v90.VFX.Hook4);
                task.spawn(function() --[[ Line: 551 ]]
                    -- upvalues: v12 (ref), v83 (ref)
                    for _ = 1, 3 do
                        v12.Emit(v83);
                        task.wait(0.9);
                    end;
                end);
            end, 
            Fast3 = function() --[[ Line: 560 ]] --[[ Name: Fast3 ]]
                -- upvalues: v12 (ref), v90 (ref), l_ColorCorrectionEffect_0 (copy), v29 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                v12.Emit(v90.VFX["Fast 3"]);
                local l_l_ColorCorrectionEffect_0_4 = l_ColorCorrectionEffect_0;
                local l_Low_4 = v29.Low;
                task.defer(function() --[[ Line: 69 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrectionEffect_0_4 (copy), l_Low_4 (copy), l_Lighting_0 (ref)
                    local v154 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_ColorCorrectionEffect_0_4, v154, l_Low_4.ColorCorrection):Play();
                    local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_5.Size = 0;
                    l_MenuBlur_5.Enabled = true;
                    local v156 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_5, v156, l_Low_4.Blur):Play();
                end);
            end, 
            Fast34 = function() --[[ Line: 565 ]] --[[ Name: Fast34 ]]
                -- upvalues: v12 (ref), v90 (ref), l_ColorCorrectionEffect_0 (copy), v29 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                v12.Emit(v90.VFX["Fast 34"]);
                local l_l_ColorCorrectionEffect_0_5 = l_ColorCorrectionEffect_0;
                local l_Low_5 = v29.Low;
                task.defer(function() --[[ Line: 69 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrectionEffect_0_5 (copy), l_Low_5 (copy), l_Lighting_0 (ref)
                    local v159 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_ColorCorrectionEffect_0_5, v159, l_Low_5.ColorCorrection):Play();
                    local l_MenuBlur_6 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_6.Size = 0;
                    l_MenuBlur_6.Enabled = true;
                    local v161 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_6, v161, l_Low_5.Blur):Play();
                end);
                task.wait(0.06666666666666667);
                v12.Emit(v90.VFX.Barrage.Punch1);
                task.wait(0.016666666666666666);
                v12.Emit(v90.VFX.Barrage.Punch2);
            end, 
            ["2"] = function() --[[ Line: 578 ]]
                -- upvalues: v12 (ref), v90 (ref)
                v12.Emit(v90.VFX["2"]);
            end, 
            FinalMiss = function() --[[ Line: 582 ]] --[[ Name: FinalMiss ]]
                -- upvalues: v12 (ref), v90 (ref), v20 (ref), v57 (copy), l_Character_0 (copy), v86 (copy), l_TweenService_0 (ref), l_ColorCorrectionEffect_0 (copy)
                v12.Emit(v90["Final Hits"].Punch);
                v20.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.3, 
                    Fade = 1
                });
                local v162 = script.FinalMiss:Clone();
                v162.Parent = v57:FindFirstChild("UpperTorso") or l_Character_0.UpperTorso;
                table.insert(v86, v162);
                v12.Emit(v162);
                l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Saturation = -1
                }):Play();
                task.delay(0.4, function() --[[ Line: 598 ]]
                    -- upvalues: l_TweenService_0 (ref), l_ColorCorrectionEffect_0 (ref)
                    l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Saturation = 0
                    }):Play();
                end);
            end
        }, 
        Character = {
            RaycastDust = function() --[[ Line: 605 ]] --[[ Name: RaycastDust ]]
                -- upvalues: l_ReplicatedStorage_0 (ref), l_Character_0 (copy), v12 (ref), v57 (copy)
                task.spawn(function() --[[ Line: 606 ]]
                    -- upvalues: l_ReplicatedStorage_0 (ref), l_Character_0 (ref)
                    require(l_ReplicatedStorage_0.GarbageAfterimages)({
                        Instance = l_Character_0, 
                        ActiveTime = 0.6, 
                        TimeBetweenImages = 0.1, 
                        Transparency = 0.4, 
                        FadeInTime = 0, 
                        TimeBeforeFadeOut = 0, 
                        FadeOutTime = 0.5, 
                        ImageColor = Color3.fromRGB(207, 233, 240)
                    });
                end);
                v12.Emit(v57.LowerTorso.raycastdust);
            end, 
            UpperLowerTorso = function() --[[ Line: 622 ]] --[[ Name: UpperLowerTorso ]]
                -- upvalues: v12 (ref), v57 (copy)
                v12.Emit(v57.UpperTorso);
                v12.Emit(v57.LowerTorso);
            end, 
            UpperTorso = function() --[[ Line: 627 ]] --[[ Name: UpperTorso ]]
                -- upvalues: v12 (ref), v57 (copy)
                v12.Emit(v57.UpperTorso);
            end, 
            Punch1 = function() --[[ Line: 631 ]] --[[ Name: Punch1 ]]
                -- upvalues: v12 (ref), v90 (ref), l_ColorCorrectionEffect_0 (copy), v29 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v20 (ref)
                v12.Emit(v90.VFX["Victim punch 1"]);
                l_ColorCorrectionEffect_0.Saturation = 0;
                local l_l_ColorCorrectionEffect_0_6 = l_ColorCorrectionEffect_0;
                local l_Medium_0 = v29.Medium;
                task.defer(function() --[[ Line: 69 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrectionEffect_0_6 (copy), l_Medium_0 (copy), l_Lighting_0 (ref)
                    local v165 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_ColorCorrectionEffect_0_6, v165, l_Medium_0.ColorCorrection):Play();
                    local l_MenuBlur_7 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_7.Size = 0;
                    l_MenuBlur_7.Enabled = true;
                    local v167 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_7, v167, l_Medium_0.Blur):Play();
                end);
                v20.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.2, 
                    Fade = 1
                });
                v20.HUDShake({
                    Scale = 20, 
                    Damper = 0.07777777777777778
                });
                for _, v169 in v90.VFX.m11.Main.hit2:GetChildren() do
                    if v169:IsA("ParticleEmitter") then
                        l_TweenService_0:Create(v169, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TimeScale = 1
                        }):Play();
                    end;
                end;
            end, 
            Punch2 = function() --[[ Line: 654 ]] --[[ Name: Punch2 ]]
                -- upvalues: v90 (ref), v12 (ref), l_ColorCorrectionEffect_0 (copy), v29 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v20 (ref), v81 (ref)
                local v170 = v90.VFX["vICTIM pUNCH 2"];
                v12.Emit(v170);
                local l_l_ColorCorrectionEffect_0_7 = l_ColorCorrectionEffect_0;
                local l_Medium_1 = v29.Medium;
                task.defer(function() --[[ Line: 69 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrectionEffect_0_7 (copy), l_Medium_1 (copy), l_Lighting_0 (ref)
                    local v173 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_ColorCorrectionEffect_0_7, v173, l_Medium_1.ColorCorrection):Play();
                    local l_MenuBlur_8 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_8.Size = 0;
                    l_MenuBlur_8.Enabled = true;
                    local v175 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_8, v175, l_Medium_1.Blur):Play();
                end);
                for _, v177 in v170:GetDescendants() do
                    if v177:IsA("ParticleEmitter") then
                        l_TweenService_0:Create(v177, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, true, 0.4), {
                            TimeScale = 0.5
                        }):Play();
                    end;
                end;
                v20.HUDShake({
                    Scale = 20, 
                    Damper = 0.07777777777777778
                });
                v12.Emit(v81.CamPart.camsidefx1);
            end, 
            AlrightCmon = function() --[[ Line: 678 ]] --[[ Name: AlrightCmon ]]
                -- upvalues: v90 (ref)
                for _, v179 in v90["Final Hits"].Charge:GetChildren() do
                    if v179:IsA("ParticleEmitter") then
                        v179.Enabled = true;
                    end;
                end;
            end, 
            FinalBlow = function() --[[ Line: 691 ]] --[[ Name: FinalBlow ]]
                -- upvalues: v12 (ref), v90 (ref), v50 (copy), v49 (copy), v20 (ref), v93 (ref), v94 (ref), v82 (ref), l_ColorCorrectionEffect_0 (copy), v29 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v83 (ref), v124 (ref), l_CurrentCamera_0 (ref), v58 (copy), v92 (ref)
                v12.Emit(v90["Final Hits"]["Final Hits"]);
                for _, v181 in v90["Final Hits"].Charge:GetChildren() do
                    if v181:IsA("ParticleEmitter") then
                        v181.Enabled = false;
                    end;
                end;
                for _, v183 in v90["Final Hits"]["Final Hits"]:GetChildren() do
                    if v183:IsA("ParticleEmitter") then
                        v183.Enabled = false;
                    end;
                end;
                if v50 or v49 then
                    task.defer(function() --[[ Line: 709 ]]
                        -- upvalues: v20 (ref)
                        v20.CreateImpactFrame({
                            Time = 0.05
                        });
                    end);
                end;
                v93:AdjustSpeed(0);
                v94:AdjustSpeed(0);
                v82:AdjustSpeed(0);
                local l_l_ColorCorrectionEffect_0_8 = l_ColorCorrectionEffect_0;
                local l_Medium_2 = v29.Medium;
                task.defer(function() --[[ Line: 69 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrectionEffect_0_8 (copy), l_Medium_2 (copy), l_Lighting_0 (ref)
                    local v186 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_ColorCorrectionEffect_0_8, v186, l_Medium_2.ColorCorrection):Play();
                    local l_MenuBlur_9 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_9.Size = 0;
                    l_MenuBlur_9.Enabled = true;
                    local v188 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_9, v188, l_Medium_2.Blur):Play();
                end);
                v20.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 1.5, 
                    Fade = 1.5
                });
                v20.HUDShake({
                    Scale = 20, 
                    Damper = 0.07777777777777778
                });
                v12.Emit(v83);
                task.delay(0.6, function() --[[ Line: 736 ]]
                    -- upvalues: v20 (ref), v124 (ref), v93 (ref), v94 (ref), v82 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (ref), v12 (ref), v58 (ref), l_Lighting_0 (ref), v92 (ref), l_ColorCorrectionEffect_0 (ref), v29 (ref)
                    v20.CameraShake({
                        Preset = "HardHit", 
                        WaitTime = 1.3, 
                        Fade = 1
                    });
                    v20.HUDShake({
                        Scale = 20, 
                        Damper = 0.07777777777777778
                    });
                    v124 = false;
                    v93:AdjustSpeed(0);
                    v94:AdjustSpeed(0);
                    v82:AdjustSpeed(0);
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        FieldOfView = 50
                    }):Play();
                    v12.Emit(v58.UpperTorso.hit4);
                    for _, v190 in v58.UpperTorso.hit4:GetDescendants() do
                        if v190:IsA("ParticleEmitter") then
                            l_TweenService_0:Create(v190, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                                TimeScale = 0.04
                            }):Play();
                        end;
                    end;
                    l_Lighting_0.ClockTime = 0;
                    local _ = task.spawn(function() --[[ Line: 776 ]]
                        -- upvalues: v92 (ref), l_ColorCorrectionEffect_0 (ref)
                        while v92 do
                            l_ColorCorrectionEffect_0.Brightness = 0.1;
                            task.wait(0.07);
                            l_ColorCorrectionEffect_0.Brightness = 0;
                        end;
                    end);
                    v20.ImpactCorrection();
                    local l_l_ColorCorrectionEffect_0_9 = l_ColorCorrectionEffect_0;
                    local l_Medium_3 = v29.Medium;
                    task.defer(function() --[[ Line: 69 ]]
                        -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrectionEffect_0_9 (copy), l_Medium_3 (copy), l_Lighting_0 (ref)
                        local v194 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_l_ColorCorrectionEffect_0_9, v194, l_Medium_3.ColorCorrection):Play();
                        local l_MenuBlur_10 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_10.Size = 0;
                        l_MenuBlur_10.Enabled = true;
                        local v196 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_10, v196, l_Medium_3.Blur):Play();
                    end);
                end);
            end
        }
    } do
        for v199, v200 in v198 do
            local v201 = #v85 + 1;
            local v202 = v197 .. "_" .. v199;
            v85[v201] = v94:GetMarkerReachedSignal(v202):Connect(v200);
        end;
    end;
    task.delay(6.616666666666666, function() --[[ Line: 798 ]]
        -- upvalues: v49 (copy), v50 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (ref)
        if not v49 and not v50 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.18333333333333335, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                FieldOfView = 40
            }):Play();
            task.wait(0.2);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.75, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                FieldOfView = 50
            }):Play();
            task.wait(0.7666666666666667);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.016666666666666666, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                FieldOfView = 32
            }):Play();
            task.wait(0.03333333333333333);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.8333333333333333, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                FieldOfView = 39
            }):Play();
            task.wait(0.85);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                FieldOfView = 30
            }):Play();
            task.wait(0.36666666666666664);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.18333333333333335, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                FieldOfView = 20
            }):Play();
            task.wait(0.2);
            print(l_CurrentCamera_0.FieldOfView);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.1333333333333333, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                FieldOfView = 30
            }):Play();
            task.wait(1.15);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.08333333333333334, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                FieldOfView = 20
            }):Play();
            task.wait(0.1);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2.7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                FieldOfView = 28.624
            }):Play();
            task.wait(2.716666666666667);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.16666666666666666, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                FieldOfView = 40
            }):Play();
            task.wait(0.18333333333333332);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.5666666666666667, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                FieldOfView = 20
            }):Play();
            task.wait(0.5833333333333334);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.6500000000000001, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                FieldOfView = 15
            }):Play();
            task.wait(1.6666666666666667);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.26666666666666666, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                FieldOfView = 30
            }):Play();
            task.wait(0.9166666666666666);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3.9833333333333334, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                FieldOfView = 60
            }):Play();
            return;
        end;
    end);
    if v49 or v50 then
        v81 = script.Cam:Clone();
        v81.Name = l_Character_0.Name .. "Camera";
        v81.Parent = l_Debris_0;
        local l_StartCFrame_0 = v46.StartCFrame;
        v81:PivotTo(l_StartCFrame_0);
        local v204 = {
            Animator = v81.AnimationController.Animator, 
            AnimId = v28.Animations.Camera
        };
        v83 = script.Camera:Clone();
        v83.Parent = l_Debris_0;
        table.insert(v86, v83);
        v82 = l_AnimHelper_0:CreateAnim(v204);
        l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 933 ]]
            -- upvalues: l_CurrentCamera_0 (ref), v81 (ref), v83 (ref)
            l_CurrentCamera_0.CFrame = v81.CamPart.CFrame;
            v83.CFrame = v81.CamPart.CFrame;
        end);
        l_StartCFrame_0 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
        task.delay(v46.Time - 0.55 - 0.55, function() --[[ Line: 942 ]]
            -- upvalues: v76 (ref), l_TweenService_0 (ref), l_Main_0 (ref), l_StartCFrame_0 (copy), v91 (ref), l_Character_0 (copy), v46 (copy), l_Victim_0 (copy), v20 (ref)
            if v76 then
                return;
            else
                l_TweenService_0:Create(l_Main_0.White, l_StartCFrame_0, {
                    BackgroundTransparency = 0
                }):Play();
                local function v211() --[[ Line: 946 ]] --[[ Name: ResetPosition ]]
                    -- upvalues: v91 (ref), l_Character_0 (ref), v46 (ref), l_Victim_0 (ref), v20 (ref)
                    if v91 then
                        return;
                    else
                        v91 = true;
                        l_Character_0:SetPrimaryPartCFrame(v46.StartCFrame * CFrame.Angles(0, 0, 0));
                        l_Victim_0:SetPrimaryPartCFrame(v46.StartCFrame * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5));
                        task.delay(0.016666666666666666, function() --[[ Line: 953 ]]
                            -- upvalues: l_Character_0 (ref), l_Victim_0 (ref), v20 (ref)
                            for _, v207 in {
                                l_Character_0, 
                                l_Victim_0, 
                                v20.GetWeldCharacter(l_Character_0), 
                                v20.GetWeldCharacter(l_Victim_0)
                            } do
                                for _, v209 in v207:GetDescendants() do
                                    if v209:IsA("BasePart") then
                                        local l_v209_Attribute_0 = v209:GetAttribute("PreviousCollisionGroup");
                                        if l_v209_Attribute_0 then
                                            v209.CollisionGroup = l_v209_Attribute_0;
                                            v209:SetAttribute("PreviousCollisionGroup", nil);
                                        end;
                                    end;
                                end;
                            end;
                            l_Victim_0.PrimaryPart.Anchored = false;
                            l_Character_0.PrimaryPart.Anchored = false;
                        end);
                        return;
                    end;
                end;
                task.wait(0.55);
                v211();
                return;
            end;
        end);
        task.wait(v46.Time - 0.55);
        v106();
        l_TweenService_0:Create(l_Main_0.White, l_StartCFrame_0, {
            BackgroundTransparency = 1
        }):Play();
        v20.CameraShake({
            Preset = "HardHit", 
            WaitTime = 0.2, 
            Fade = 1
        });
        v20.HUDShake({
            Scale = 20, 
            Damper = 0.07777777777777778
        });
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v77, {
            ImageTransparency = 1
        }):Play();
    end;
end;
return v28;