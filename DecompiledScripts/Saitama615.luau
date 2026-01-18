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
local v23 = Random.new();
local function _(v24, v25, v26) --[[ Line: 34 ]] --[[ Name: Lerp ]]
    return v24 + (v25 - v24) * v26;
end;
local v28 = {
    Animations = {
        Character = 138390765350333, 
        Victim = 131226711171528, 
        Camera = 133545539143877
    }, 
    CameraRig = l_ReplicatedStorage_0.Assets.FoVCamera
};
local function _(v29) --[[ Line: 46 ]] --[[ Name: impactCorrection ]]
    -- upvalues: l_TweenService_0 (copy), l_Lighting_0 (copy)
    task.defer(function() --[[ Line: 47 ]]
        -- upvalues: l_TweenService_0 (ref), v29 (copy), l_Lighting_0 (ref)
        local v30 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        l_TweenService_0:Create(v29, v30, {
            Saturation = -0.3, 
            Contrast = 7
        }):Play();
        local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
        l_MenuBlur_0.Size = 0;
        l_MenuBlur_0.Enabled = true;
        local v32 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
        l_TweenService_0:Create(l_MenuBlur_0, v32, {
            Size = 30
        }):Play();
    end);
end;
v28.Use = function(v34) --[[ Line: 60 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Players_0 (copy), l_Debris_0 (copy), v20 (copy), l_Main_0 (copy), l_EffectHelper_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_TweenService_0 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), l_CurrentCamera_0 (copy), v28 (copy), l_AnimHelper_0 (copy), v12 (copy), v23 (copy)
    local l_Character_0 = v34.Character;
    local l_Victim_0 = v34.Victim;
    local v37 = l_LocalPlayer_0.Character == l_Character_0;
    local v38 = l_LocalPlayer_0.Character == l_Victim_0;
    local _ = l_Players_0:GetPlayerFromCharacter(l_Victim_0);
    local v40 = RaycastParams.new();
    v40.FilterType = Enum.RaycastFilterType.Exclude;
    v40.FilterDescendantsInstances = {
        l_Debris_0, 
        l_Character_0, 
        l_Victim_0
    };
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v42 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v44 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    local v45 = v20.GetWeldCharacter(l_Character_0);
    local v46 = v20.GetWeldCharacter(l_Victim_0);
    local function v53() --[[ Line: 84 ]] --[[ Name: SlowDownAnimations ]]
        -- upvalues: v42 (copy), v44 (copy)
        for _, v48 in (v42:GetPlayingAnimationTracks()) do
            if v48.Priority ~= Enum.AnimationPriority.Idle then
                local _ = v48.Speed;
                v48:AdjustSpeed(0.2);
            end;
        end;
        for _, v51 in (v44:GetPlayingAnimationTracks()) do
            if v51.Priority ~= Enum.AnimationPriority.Idle then
                local _ = v51.Speed;
                v51:AdjustSpeed(0.2);
            end;
        end;
    end;
    task.defer(function() --[[ Line: 102 ]]
        -- upvalues: v53 (copy)
        local v54 = tick();
        while tick() - v54 < 1 do
            v53();
            task.wait(0.1);
        end;
    end);
    task.defer(function() --[[ Line: 111 ]]
        -- upvalues: v37 (copy), v38 (copy), v20 (ref), l_Main_0 (ref)
        if v37 or v38 then
            v20.StatusFrame(v38, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v55 = l_EffectHelper_0.UltimateStart:Clone();
    v55.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v55.Parent = l_Debris_0;
    local l_ClockTime_0 = l_Lighting_0.ClockTime;
    task.delay(20, function() --[[ Line: 123 ]]
        -- upvalues: v55 (copy)
        if v55 then
            v55:Destroy();
        end;
    end);
    for _, v58 in v55.Particle:GetChildren() do
        v58.Enabled = false;
        v58:Emit(v58:GetAttribute("EmitCount"));
    end;
    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
    local v60 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v37 or v38) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v60.Volume;
    v60.Volume = 0;
    task.delay(1, function() --[[ Line: 143 ]]
        -- upvalues: v60 (copy), v37 (copy), v38 (copy), l_Volume_0 (copy)
        v60:Stop();
        if v37 or v38 then
            v60.Volume = l_Volume_0;
        else
            v60.Volume = l_Volume_0 / 5;
        end;
        v60:Play();
        v60.TimePosition = 0.2;
    end);
    local v62 = l_SoundHelper_0:PlaySound({
        Name = "Song", 
        DirectCopy = script.MONOLITH, 
        Parent = (not not v37 or v38) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_1 = v62.Volume;
    v62.Volume = 0;
    task.delay(1, function() --[[ Line: 166 ]]
        -- upvalues: v62 (copy), l_TweenService_0 (ref), v37 (copy), v38 (copy), l_Volume_1 (copy)
        v62:Stop();
        l_TweenService_0:Create(v62, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            Volume = (not not v37 or v38) and l_Volume_1 or l_Volume_1 / 5
        }):Play();
        v62:Play();
    end);
    local l_Saitama_0 = script.Saitama;
    local v65 = nil;
    local v66 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local _ = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local _ = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
    local v69 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    local v70 = nil;
    local v71 = nil;
    local v72 = nil;
    local v73 = nil;
    local v74 = nil;
    local v75 = {};
    local v76 = {};
    local v77 = {};
    local v78 = {};
    local v79 = nil;
    local v80 = nil;
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    v79 = l_Character_0:GetAttribute("CachedLighting");
    local v86 = false;
    local l_FarIntensity_0 = l_Lighting_0.DepthOfField.FarIntensity;
    local function v101() --[[ Line: 213 ]] --[[ Name: cleanup ]]
        -- upvalues: v75 (copy), l_RunService_0 (ref), v73 (ref), v65 (ref), l_Victim_0 (copy), l_Character_0 (copy), v71 (ref), l_Humanoid_1 (copy), v60 (copy), v84 (ref), v85 (ref), v62 (copy), l_TweenService_0 (ref), v70 (ref), v72 (ref), v76 (copy), v77 (ref), v78 (ref), l_Lighting_0 (ref), l_ColorCorrection_0 (copy), l_ClockTime_0 (copy), l_ReplicatedStorage_0 (ref), l_FarIntensity_0 (copy), l_Main_0 (ref), v66 (copy), v20 (ref)
        for _, v89 in v75 do
            v89:Disconnect();
        end;
        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
        v73.Value = "";
        v65 = true;
        l_Victim_0.PrimaryPart.Anchored = false;
        l_Character_0.PrimaryPart.Anchored = false;
        if v71 then
            v71:Stop(0.01);
        end;
        for _, v91 in l_Humanoid_1:GetPlayingAnimationTracks() do
            v91:Stop();
        end;
        if v60 then
            v60:Destroy();
        end;
        if v84 then
            v84:Destroy();
        end;
        if v85 then
            v85:Disconnect();
        end;
        if v62 then
            l_TweenService_0:Create(v62, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Volume = 0
            }):Play();
            task.delay(1, function() --[[ Line: 246 ]]
                -- upvalues: v62 (ref)
                v62:Destroy();
            end);
        end;
        if v70 then
            v70:Destroy();
        end;
        if v72 then
            v72:Destroy();
        end;
        for _, v93 in v76 do
            v93:Destroy();
        end;
        for _, v95 in v77 do
            v95.LocalTransparencyModifier = 0;
        end;
        for _, v97 in v78 do
            v97.Enabled = true;
        end;
        local l_CachedAtmosphere_0 = l_Lighting_0:FindFirstChild("CachedAtmosphere");
        if l_CachedAtmosphere_0 then
            for _, v100 in l_CachedAtmosphere_0:GetChildren() do
                v100.Parent = l_Lighting_0;
            end;
            l_CachedAtmosphere_0:Destroy();
        end;
        l_TweenService_0:Create(l_ColorCorrection_0, TweenInfo.new(1), {
            Saturation = 0, 
            Contrast = 0, 
            Brightness = 0, 
            TintColor = Color3.new(1, 1, 1)
        }):Play();
        l_Lighting_0.ClockTime = l_ClockTime_0;
        l_ReplicatedStorage_0.Events.RefreshMapLighting:Fire();
        v73.Value = "";
        l_Lighting_0.DepthOfField.FarIntensity = l_FarIntensity_0;
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v66, {
            ImageTransparency = 1
        }):Play();
        v20.SetTransparency(l_Victim_0, 0);
        v20.SetTransparency(l_Character_0, 0);
    end;
    v75[#v75 + 1] = l_Character_0.AncestryChanged:Connect(function() --[[ Line: 302 ]]
        -- upvalues: l_Character_0 (copy), v101 (copy)
        task.wait(0.1);
        if l_Character_0.Parent == nil then
            v101();
        end;
    end);
    v75[#v75 + 1] = l_Victim_0.AncestryChanged:Connect(function() --[[ Line: 309 ]]
        -- upvalues: l_Victim_0 (copy), v101 (copy)
        task.wait(0.1);
        if l_Victim_0.Parent == nil then
            v101();
        end;
    end);
    if v37 or v38 then
        task.defer(function() --[[ Line: 317 ]]
            -- upvalues: l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v20 (ref), v55 (copy)
            l_ColorCorrection_0.Saturation = 0;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v102 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v102, {
                Saturation = -0.7, 
                Contrast = 0.5
            }):Play();
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v104 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v104, {
                Size = 10
            }):Play();
            local v105 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v105, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.delay(0.4, function() --[[ Line: 335 ]]
                -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v105 (copy)
                l_TweenService_0:Create(l_Lighting_0, v105, {
                    ExposureCompensation = workspace.Exposure.Value
                }):Play();
            end);
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
            v55:Destroy();
        end);
    end;
    task.wait(0.5);
    local v106 = v20.GetAtmosphere();
    if v37 or v38 then
        l_TweenService_0:Create(l_Main_0.White, v69, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v69, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v66, {
            ImageTransparency = 0.5
        }):Play();
        task.delay(1, function() --[[ Line: 364 ]]
            -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v69 (copy)
            l_TweenService_0:Create(l_Lighting_0, v69, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
        end);
    end;
    local l_Volume_2 = v60.Volume;
    v60.Volume = 0;
    task.delay(0.35, function() --[[ Line: 372 ]]
        -- upvalues: v60 (copy), v37 (copy), v38 (copy), l_Volume_2 (copy), v34 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v60:Stop();
        if v37 or v38 then
            v60.Volume = l_Volume_2;
        else
            v60.Volume = l_Volume_2 / 5;
        end;
        v60:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v34.HasVoicelines then
            local v109 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v37 or v38) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v37 and not v38 then
                v109.Volume = v109.Volume / 5;
            end;
        end;
    end);
    task.wait(0.5);
    v73 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    if v37 or v38 then
        v73.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 45;
    end;
    local v110 = {
        Animator = v42, 
        AnimId = v28.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v111 = {
        Animator = v44, 
        AnimId = v28.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v110);
    l_AnimHelper_0:CreateAnim(v111);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v110);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v111);
    if v37 or v38 then
        v73.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 41;
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v66, {
            ImageTransparency = 1
        }):Play();
    end;
    local v114 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(0.5, 1), 
        NumberSequenceKeypoint.new(1, 1)
    });
    local v115 = nil;
    local v116 = 0;
    v75[#v75 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Teleport"):Connect(function() --[[ Line: 448 ]]
        -- upvalues: v116 (ref), l_Saitama_0 (copy), l_Debris_0 (ref), l_Character_0 (copy), v76 (copy), v12 (ref), v20 (ref), v37 (copy), v38 (copy), v72 (ref), v114 (copy), v82 (ref), l_TweenService_0 (ref), l_Main_0 (ref), v66 (copy), v115 (ref), v106 (copy), l_Lighting_0 (ref), v45 (copy)
        v116 = v116 + 1;
        if v116 == 1 then
            local v117 = l_Saitama_0.DustControl.FrontAppear:Clone();
            v117.Parent = l_Debris_0;
            v117.Position = l_Character_0.HumanoidRootPart.Position + Vector3.new(0, -1, 0, 0);
            table.insert(v76, v117);
            v12.Emit(v117);
            v20.SetTransparency(l_Character_0, 0);
            if v37 or v38 then
                v20.HUDShake({
                    Scale = 10, 
                    Damper = 0.09999999999999999
                });
                return;
            end;
        else
            for _, v119 in v72.SideWays:GetDescendants() do
                if v119:IsA("Beam") then
                    v119.Enabled = true;
                end;
            end;
            task.wait(0.2);
            for _, v121 in v72.SideWays:GetDescendants() do
                if v121:IsA("Beam") then
                    task.spawn(function() --[[ Line: 477 ]]
                        -- upvalues: v12 (ref), v121 (copy), v114 (ref)
                        v12.TweenNumberSequence(v121.Transparency, v114, 50, 1, v121, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                    end);
                end;
            end;
            v82 = l_Saitama_0.DustControl.SideAppear:Clone();
            v82.Parent = l_Debris_0;
            v82.CFrame = CFrame.new(l_Character_0.LowerTorso.Position) * CFrame.Angles(l_Character_0.HumanoidRootPart.CFrame:ToOrientation()) + Vector3.new(0, -1, 0, 0);
            table.insert(v76, v82);
            v12.Emit(v82);
            for _, v123 in v82:GetDescendants() do
                if v123:IsA("ParticleEmitter") then
                    l_TweenService_0:Create(v123, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TimeScale = 0.5
                    }):Play();
                end;
            end;
            task.wait(0.5);
            if v37 or v38 then
                l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v66, {
                    ImageTransparency = 0
                }):Play();
            end;
            if v37 or v38 then
                v115 = script.Domain:Clone();
                v115.Parent = l_Debris_0;
                v115.CFrame = l_Character_0.HumanoidRootPart.CFrame;
                l_TweenService_0:Create(v115, TweenInfo.new(1), {
                    Transparency = 0
                }):Play();
                table.insert(v76, v115);
                if v106 then
                    local l_Folder_0 = Instance.new("Folder");
                    l_Folder_0.Name = "CachedAtmosphere";
                    l_Folder_0.Parent = l_Lighting_0;
                    v106.Parent = l_Folder_0;
                end;
                l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(1), {
                    Ambient = Color3.new(0, 0, 0), 
                    OutdoorAmbient = Color3.new(0.345098, 0.345098, 0.345098), 
                    EnvironmentDiffuseScale = 0.1, 
                    EnvironmentSpecularScale = 0.4, 
                    Brightness = 0, 
                    FogEnd = 30, 
                    FogStart = 0, 
                    FogColor = Color3.new(0, 0, 0)
                }):Play();
            end;
            task.wait(0.6);
            local v125 = l_Saitama_0.EyeVFX:Clone();
            v125.Parent = v45:FindFirstChild("Head") or l_Character_0.Head;
            table.insert(v76, v125);
            v12.Emit(v125);
        end;
    end);
    v75[#v75 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Click"):Connect(function() --[[ Line: 547 ]]
        -- upvalues: l_Saitama_0 (copy), v46 (copy), l_Victim_0 (copy), v76 (copy), v12 (ref)
        local v126 = l_Saitama_0.Click:Clone();
        v126.Parent = v46:FindFirstChild("Head") or l_Victim_0.Head;
        table.insert(v76, v126);
        v12.Emit(v126);
    end);
    v75[#v75 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("ArmDust"):Connect(function() --[[ Line: 554 ]]
        -- upvalues: l_Saitama_0 (copy), l_Debris_0 (ref), l_Character_0 (copy), v12 (ref), v76 (copy), v37 (copy), v38 (copy), l_TweenService_0 (ref), l_Main_0 (ref), v66 (copy), v82 (ref), v72 (ref), l_Lighting_0 (ref), l_ClockTime_0 (copy), l_ReplicatedStorage_0 (ref)
        local v127 = l_Saitama_0.Sike:Clone();
        v127.Parent = l_Debris_0;
        v127.Position = l_Character_0.RightLowerArm.Position;
        v12.Emit(v127);
        table.insert(v76, v127);
        if v37 or v38 then
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v66, {
                ImageTransparency = 1
            }):Play();
        end;
        for _, v129 in v82:GetDescendants() do
            if v129:IsA("ParticleEmitter") then
                v129.TimeScale = 1;
            end;
        end;
        for _, v131 in v72.SideWays:GetDescendants() do
            if v131:IsA("Beam") then
                v131.Enabled = false;
                v131.Transparency = NumberSequence.new(0);
            end;
        end;
        if l_Lighting_0:FindFirstChild("CachedAtmosphere") then
            for _, v133 in l_Lighting_0:FindFirstChild("CachedAtmosphere"):GetChildren() do
                v133.Parent = l_Lighting_0;
            end;
            l_Lighting_0:FindFirstChild("CachedAtmosphere"):Destroy();
        end;
        l_Lighting_0.ClockTime = l_ClockTime_0;
        l_ReplicatedStorage_0.Events.RefreshMapLighting:Fire();
    end);
    local v134 = nil;
    v75[#v75 + 1] = l_l_AnimHelper_0_Anim_1:GetMarkerReachedSignal("Awaken"):Connect(function() --[[ Line: 594 ]]
        -- upvalues: v46 (copy), l_Character_0 (copy), v12 (ref), v76 (copy), v134 (ref), l_Saitama_0 (copy), l_Victim_0 (copy)
        local v135 = script.WHAT.WHAT:Clone();
        v135.Parent = v46:FindFirstChild("Head") or l_Character_0.Head;
        v12.Emit(v135);
        table.insert(v76, v135);
        v134 = l_Saitama_0.LegTrail:Clone();
        v134.Parent = v46:FindFirstChild("LeftLowerLeg") or l_Victim_0.LeftLowerLeg;
        table.insert(v76, v134);
    end);
    v75[#v75 + 1] = l_l_AnimHelper_0_Anim_1:GetMarkerReachedSignal("OhYeahItsGoing"):Connect(function() --[[ Line: 605 ]]
        -- upvalues: v83 (ref), l_Saitama_0 (copy), l_Debris_0 (ref), l_Character_0 (copy), v76 (copy), v37 (copy), v38 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v134 (ref)
        v83 = l_Saitama_0.Middddd:Clone();
        v83.Parent = l_Debris_0;
        v83:PivotTo(CFrame.new(l_Character_0.UpperTorso.Position) * CFrame.Angles(l_Character_0.HumanoidRootPart.CFrame:ToOrientation()) * CFrame.Angles(0, 3.12413936106985, 0) + Vector3.new(0, 0.800000011920929, 0, 0) + l_Character_0.HumanoidRootPart.CFrame.LookVector * -3);
        table.insert(v76, v83);
        if v37 or v38 then
            local l_l_ColorCorrection_0_0 = l_ColorCorrection_0;
            task.defer(function() --[[ Line: 47 ]]
                -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrection_0_0 (copy), l_Lighting_0 (ref)
                local v137 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_l_ColorCorrection_0_0, v137, {
                    Saturation = -0.3, 
                    Contrast = 7
                }):Play();
                local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                l_MenuBlur_2.Size = 0;
                l_MenuBlur_2.Enabled = true;
                local v139 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_2, v139, {
                    Size = 30
                }):Play();
            end);
        end;
        table.remove(v76, table.find(v76, v134));
        v134:Destroy();
    end);
    v70 = l_ReplicatedStorage_0.Assets.FoVCamera:Clone();
    v70.Name = l_Character_0.Name .. "Camera";
    v70.Parent = l_Debris_0;
    local v140 = v34.StartCFrame * CFrame.new(0, -3, 0);
    v70:PivotTo(v140);
    v72 = script.Camera:Clone();
    v72.Parent = l_Debris_0;
    v74 = v72.SideWays;
    local v141 = {
        Animator = v70.AnimationController.Animator, 
        AnimId = v28.Animations.Camera
    };
    v71 = l_AnimHelper_0:CreateAnim(v141);
    v75[#v75 + 1] = v71:GetMarkerReachedSignal("AppearSaitamaAnimation"):Connect(function() --[[ Line: 639 ]]
        -- upvalues: v71 (ref), l_l_AnimHelper_0_Anim_1 (copy), l_l_AnimHelper_0_Anim_0 (copy), v37 (copy), v38 (copy), v84 (ref), l_LocalPlayer_0 (ref), l_TweenService_0 (ref), v85 (ref), l_RunService_0 (ref), v23 (ref)
        v71:AdjustSpeed(0);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(0);
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(0);
        l_l_AnimHelper_0_Anim_1.TimePosition = v71.TimePosition;
        l_l_AnimHelper_0_Anim_0.TimePosition = v71.TimePosition;
        task.delay(0.8, function() --[[ Line: 647 ]]
            -- upvalues: v71 (ref), l_l_AnimHelper_0_Anim_1 (ref), l_l_AnimHelper_0_Anim_0 (ref)
            v71:AdjustSpeed(1);
            l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
        end);
        if not v37 and not v38 then
            return;
        else
            v84 = script.Death:Clone();
            v84.Parent = l_LocalPlayer_0.PlayerGui;
            l_TweenService_0:Create(v84.Frame, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                BackgroundTransparency = 0
            }):Play();
            l_TweenService_0:Create(v84.Main["1"], TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                ImageTransparency = 0
            }):Play();
            task.delay(0.3, function() --[[ Line: 662 ]]
                -- upvalues: l_TweenService_0 (ref), v84 (ref)
                l_TweenService_0:Create(v84.Main["2"], TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
                    ImageTransparency = 0.3
                }):Play();
            end);
            task.delay(1.3, function() --[[ Line: 666 ]]
                -- upvalues: l_TweenService_0 (ref), v84 (ref), v85 (ref)
                l_TweenService_0:Create(v84.Main["2"], TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(v84.Main["1"], TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    ImageTransparency = 1
                }):Play();
                task.wait(0.5);
                l_TweenService_0:Create(v84.Frame, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 1
                }):Play();
                task.wait(0.5);
                if v85 then
                    v85:Disconnect();
                end;
                if v84 then
                    v84:Destroy();
                end;
            end);
            local l_Size_0 = v84.Main.Size;
            v84.Main.Size = UDim2.new(v84.Main.Size.X.Scale * 4, 0, v84.Main.Size.Y.Scale * 4, 0);
            l_TweenService_0:Create(v84.Main, TweenInfo.new(1.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                Size = l_Size_0
            }):Play();
            local v143 = tick();
            local v144 = 0;
            v85 = l_RunService_0.Heartbeat:Connect(function(v145) --[[ Line: 687 ]]
                -- upvalues: v144 (ref), v143 (copy), v84 (ref), v23 (ref)
                v144 = v144 + v145;
                if v144 < 0.016666666666666666 then
                    return;
                else
                    v144 = 0;
                    local v146 = 0.06666666666666667 + -0.06566666666666666 * math.clamp((tick() - v143) / 1.1, 0, 1);
                    v84.Main.Position = UDim2.new(v23:NextNumber(0.5 - v146, 0.5 + v146), 0, v23:NextNumber(0.5 - v146, 0.5 + v146), 0);
                    return;
                end;
            end);
            return;
        end;
    end);
    v75[#v75 + 1] = v71:GetMarkerReachedSignal("DeleteFinal"):Connect(function() --[[ Line: 698 ]]
        -- upvalues: v83 (ref), v37 (copy), v38 (copy), v81 (ref), l_Lighting_0 (ref), l_FarIntensity_0 (copy), v72 (ref), v12 (ref), v114 (copy), l_TweenService_0 (ref), l_Saitama_0 (copy), l_Debris_0 (ref), l_Character_0 (copy), v76 (copy)
        if v83 then
            v83:Destroy();
        end;
        if (v37 or v38) and v81 then
            v81:Destroy();
            l_Lighting_0.DepthOfField.FarIntensity = l_FarIntensity_0;
            for _, v148 in v72.WindBeams:GetDescendants() do
                if v148:IsA("Beam") then
                    v148.Enabled = false;
                end;
            end;
            for _, v150 in v72.SideWays:GetDescendants() do
                if v150:IsA("Beam") then
                    task.spawn(function() --[[ Line: 717 ]]
                        -- upvalues: v12 (ref), v150 (copy), v114 (ref)
                        v12.TweenNumberSequence(v150.Transparency, v114, 50, 0.5, v150, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                    end);
                end;
            end;
            v72.Lines.Enabled = false;
            for _, v152 in v72.WindBeam["1"].Beams:GetChildren() do
                v152.Enabled = true;
                l_TweenService_0:Create(v152, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    TextureSpeed = 0.5, 
                    Brightness = 0.04
                }):Play();
            end;
            local v153 = l_Saitama_0.Middddd2:Clone();
            v153.Parent = l_Debris_0;
            v153:PivotTo(CFrame.new(l_Character_0.UpperTorso.Position) * CFrame.Angles(l_Character_0.HumanoidRootPart.CFrame:ToOrientation()) + Vector3.new(0, 2, 0, 0));
            table.insert(v76, v153);
        end;
    end);
    if v37 or v38 then
        v75[#v75 + 1] = v71:GetMarkerReachedSignal("HideCharacter"):Connect(function() --[[ Line: 748 ]]
            -- upvalues: v20 (ref), l_Character_0 (copy), v37 (copy), v38 (copy), l_Saitama_0 (copy), l_Debris_0 (ref), v76 (copy), v12 (ref)
            v20.SetTransparency(l_Character_0, 1);
            if not v37 and not v38 then
                local v154 = l_Saitama_0.DustControl.Disappear:Clone();
                v154.Parent = l_Debris_0;
                v154.Position = l_Character_0.HumanoidRootPart.Position + Vector3.new(0, -1, 0, 0);
                table.insert(v76, v154);
                v12.Emit(v154);
            end;
        end);
        v140 = nil;
        v75[#v75 + 1] = v71:GetMarkerReachedSignal("DissappearSaitamaAnimation"):Connect(function() --[[ Line: 764 ]]
            -- upvalues: v37 (copy), v38 (copy), v46 (copy), v45 (copy), v115 (ref), v77 (ref), v78 (ref), v20 (ref), l_Character_0 (copy), l_Victim_0 (copy), l_Debris_0 (ref), v140 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v80 (ref), v76 (copy)
            if v37 or v38 then
                local v155 = {
                    v46, 
                    v45, 
                    v115
                };
                local v156, v157 = v20.GetPartsToHide(l_Character_0, v155);
                v77 = v156;
                v78 = v157;
                for _, v159 in v77 do
                    v159.LocalTransparencyModifier = 1;
                end;
                for _, v161 in v78 do
                    v161.Enabled = false;
                end;
                v20.SetTransparency(l_Victim_0, 0);
                v20.SetTransparency(l_Character_0, 1);
                v156 = script.Part:Clone();
                v156.Parent = l_Debris_0;
                v156.CFrame_Settle.Part0 = l_Character_0.HumanoidRootPart;
                v140 = v45:FindFirstChild("GloveModelRight"):Clone();
                v140.Parent = l_Debris_0;
                v140:ScaleTo(10);
                v156.Parent = v140;
                v157 = v140.RightLowerArm.Middle.Delete;
                v157.Part1 = v156;
                v157.C0 = CFrame.new(0, -20, 0) * CFrame.Angles(0, 0, -1.5707963267948966);
                l_TweenService_0:Create(v157, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    C0 = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, -1.5707963267948966)
                }):Play();
                v20.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.1, 
                    Fade = 4, 
                    FoVMult = 2
                });
                local v162 = script.ShardModel:Clone();
                v162.Parent = v140;
                v156.CFrame_VFX.Part0 = v162.Root;
                l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0.1), {
                    Ambient = Color3.new(0, 0, 0), 
                    OutdoorAmbient = Color3.new(0.690196, 0.690196, 0.690196), 
                    EnvironmentDiffuseScale = 0.1, 
                    EnvironmentSpecularScale = 0.4, 
                    Brightness = 0, 
                    FogEnd = 300, 
                    FogStart = 0, 
                    FogColor = Color3.new(0, 0, 0)
                }):Play();
                l_Lighting_0.DepthOfField.FarIntensity = 0.1;
                v80 = Instance.new("Model");
                v80.Parent = l_Debris_0;
                local v163 = script.Head:Clone();
                v163.Parent = l_Debris_0;
                v163.Part.Part1 = v156;
                l_Character_0.Archivable = true;
                local v164 = l_Character_0:Clone();
                l_Character_0.Archivable = false;
                v164.Parent = l_Debris_0;
                local v165 = v164.Head:Clone();
                v165.Neck:Destroy();
                v165.Anchored = true;
                for _, v167 in l_Character_0:GetChildren() do
                    if v167:IsA("Accessory") and (v167.AccessoryType == Enum.AccessoryType.Hair or v167.AccessoryType == Enum.AccessoryType.Hat) then
                        local v168 = v167:Clone();
                        v168.Parent = v165;
                        v168:FindFirstChildWhichIsA("MeshPart"):FindFirstChildWhichIsA("Weld").Part1 = v165;
                    end;
                end;
                for _, v170 in v165:GetChildren() do
                    if v170:IsA("Decal") then
                        v170:Destroy();
                    end;
                end;
                local l_Model_0 = Instance.new("Model");
                l_Model_0.Parent = l_Debris_0;
                v165.Parent = l_Model_0;
                l_Model_0:ScaleTo(7);
                v165.Parent = l_Debris_0;
                l_Model_0:Destroy();
                v164:Destroy();
                v165.CFrame = v163.CFrame + Vector3.new(-0.5, -0, 0, 0);
                for _, v173 in script.DarkParts:GetChildren() do
                    v173:Clone().Parent = v165;
                end;
                for _, v175 in v165:GetDescendants() do
                    if v175:IsA("BasePart") then
                        for _, v177 in script.DarkParts:GetChildren() do
                            v177:Clone().Parent = v175;
                        end;
                    end;
                end;
                v163.Transparency = 1;
                v163.Parent = v80;
                v165.Parent = v80;
                v140.Parent = v80;
                table.insert(v76, v80);
            end;
        end);
        v75[#v75 + 1] = v71:GetMarkerReachedSignal("AppearParts"):Connect(function() --[[ Line: 905 ]]
            -- upvalues: v77 (ref), v78 (ref), v80 (ref), v20 (ref), l_Character_0 (copy), l_Lighting_0 (ref), l_FarIntensity_0 (copy)
            for _, v179 in v77 do
                v179.LocalTransparencyModifier = 0;
            end;
            for _, v181 in v78 do
                v181.Enabled = true;
            end;
            v80:Destroy();
            v20.SetTransparency(l_Character_0, 0);
            l_Lighting_0.DepthOfField.FarIntensity = l_FarIntensity_0;
        end);
        v75[#v75 + 1] = v71:GetMarkerReachedSignal("Go"):Connect(function() --[[ Line: 921 ]]
            -- upvalues: v37 (copy), v38 (copy), v62 (copy), l_TweenService_0 (ref), v81 (ref), l_Saitama_0 (copy), l_Debris_0 (ref), l_Character_0 (copy), v76 (copy), v72 (ref), v20 (ref), l_Lighting_0 (ref)
            if v37 or v38 then
                if v62 then
                    v62.Volume = 0;
                end;
                task.delay(2, function() --[[ Line: 925 ]]
                    -- upvalues: l_TweenService_0 (ref), v62 (ref)
                    l_TweenService_0:Create(v62, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        Volume = 0.2
                    }):Play();
                end);
                v81 = l_Saitama_0.FinalBooii:Clone();
                v81.Parent = l_Debris_0;
                v81:PivotTo(CFrame.new(l_Character_0.UpperTorso.Position) * CFrame.Angles(l_Character_0.HumanoidRootPart.CFrame:ToOrientation()));
                table.insert(v76, v81);
                for _, v183 in v72.WindBeams:GetDescendants() do
                    if v183:IsA("Beam") then
                        v183.Enabled = true;
                    end;
                end;
                for _, v185 in v72.SideWays:GetDescendants() do
                    if v185:IsA("Beam") then
                        v185.Enabled = true;
                    end;
                end;
                v72.Lines.Enabled = true;
                v20.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 2.7, 
                    Fade = 3, 
                    FoVMult = 2
                });
                l_Lighting_0.DepthOfField.FarIntensity = 0.2;
            end;
        end);
        local v186 = 0;
        l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 962 ]]
            -- upvalues: l_CurrentCamera_0 (ref), v70 (ref), v72 (ref), v186 (ref), l_Character_0 (copy)
            l_CurrentCamera_0.CFrame = v70.CamPart.CFrame;
            l_CurrentCamera_0.FieldOfView = math.abs((v70.FovPart.Position - v70.RootPart.Position).Y);
            if v72 then
                v72.CFrame = l_CurrentCamera_0.CFrame;
            end;
            v186 = v186 + 1;
            if v186 % 10 ~= 0 then
                return;
            elseif not l_Character_0 or not l_Character_0.PrimaryPart then
                return;
            else
                v70:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.new(0, -3, 0));
                return;
            end;
        end);
        task.delay(v34.Time - 0.55, function() --[[ Line: 977 ]]
            -- upvalues: l_l_AnimHelper_0_Anim_1 (copy), l_l_AnimHelper_0_Anim_0 (copy), v71 (ref), l_TweenService_0 (ref), l_Main_0 (ref), v69 (copy)
            l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.01);
            v71:AdjustSpeed(0.01);
            l_TweenService_0:Create(l_Main_0.White, v69, {
                BackgroundTransparency = 0
            }):Play();
        end);
        task.delay(v34.Time - 0.55, function() --[[ Line: 985 ]]
            -- upvalues: v62 (copy), l_TweenService_0 (ref), v65 (ref), l_Main_0 (ref), v69 (copy), v71 (ref), v66 (copy), v20 (ref), l_RunService_0 (ref), v73 (ref), v75 (copy), l_l_AnimHelper_0_Anim_1 (copy), v86 (ref), l_Character_0 (copy), v34 (copy), l_Victim_0 (copy), l_l_AnimHelper_0_Anim_0 (copy), v70 (ref), v72 (ref), l_Humanoid_1 (copy), v60 (copy), v76 (copy)
            if v62 then
                l_TweenService_0:Create(v62, TweenInfo.new(6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Volume = 0
                }):Play();
            end;
            if v65 then
                return;
            else
                l_TweenService_0:Create(l_Main_0.White, v69, {
                    BackgroundTransparency = 0
                }):Play();
                v71:Stop(0.1);
                l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v66, {
                    ImageTransparency = 1
                }):Play();
                v20.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.2, 
                    Fade = 1
                });
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                v73.Value = "";
                for _, v189 in v75 do
                    v189:Disconnect();
                end;
                if l_l_AnimHelper_0_Anim_1 then
                    l_l_AnimHelper_0_Anim_1:Stop(0.01);
                end;
                (function() --[[ Line: 1014 ]] --[[ Name: ResetPosition ]]
                    -- upvalues: v86 (ref), l_Character_0 (ref), v34 (ref), l_Victim_0 (ref), v20 (ref)
                    if v86 then
                        return;
                    else
                        v86 = true;
                        l_Character_0:SetPrimaryPartCFrame(v34.StartCFrame * CFrame.Angles(0, 0, 0));
                        l_Victim_0:SetPrimaryPartCFrame(v34.StartCFrame * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5));
                        task.delay(0.016666666666666666, function() --[[ Line: 1021 ]]
                            -- upvalues: l_Character_0 (ref), l_Victim_0 (ref), v20 (ref)
                            for _, v191 in {
                                l_Character_0, 
                                l_Victim_0, 
                                v20.GetWeldCharacter(l_Character_0), 
                                v20.GetWeldCharacter(l_Victim_0)
                            } do
                                for _, v193 in v191:GetDescendants() do
                                    if v193:IsA("BasePart") then
                                        local l_v193_Attribute_0 = v193:GetAttribute("PreviousCollisionGroup");
                                        if l_v193_Attribute_0 then
                                            v193.CollisionGroup = l_v193_Attribute_0;
                                            v193:SetAttribute("PreviousCollisionGroup", nil);
                                        end;
                                    end;
                                end;
                            end;
                            l_Victim_0.PrimaryPart.Anchored = false;
                            l_Character_0.PrimaryPart.Anchored = false;
                        end);
                        return;
                    end;
                end)();
                l_l_AnimHelper_0_Anim_0:Stop(0.01);
                if v71 then
                    v71:Stop(0.01);
                end;
                if v70 then
                    v70:Destroy();
                end;
                if v72 then
                    v72:Destroy();
                end;
                for _, v196 in l_Humanoid_1:GetPlayingAnimationTracks() do
                    v196:Stop();
                end;
                if v60 then
                    v60:Destroy();
                end;
                if v62 then
                    l_TweenService_0:Create(v62, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Volume = 0
                    }):Play();
                    task.delay(1, function() --[[ Line: 1065 ]]
                        -- upvalues: v62 (ref)
                        v62:Destroy();
                    end);
                end;
                for _, v198 in v76 do
                    v198:Destroy();
                end;
                return;
            end;
        end);
        task.wait(v34.Time);
        if v65 then
            return;
        else
            v20.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v20.HUDShake({
                Scale = 20, 
                Damper = 0.07777777777777778
            });
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v66, {
                ImageTransparency = 1
            }):Play();
            --[[ close >= 59 ]]
        end;
    end;
end;
return v28;