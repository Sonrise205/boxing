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
local _ = require(l_Modules_0:WaitForChild("EffectHelper"));
local v13 = require(l_Modules_0.Cutscene.Utilities);
local _ = require(l_Modules_0.Cutscene.Cutscene);
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local l_Parent_0 = script.Parent.Parent;
local v21 = require(l_Parent_0);
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local l_Debris_0 = workspace:WaitForChild("Debris");
local _ = Random.new();
local function _(v25, v26, v27) --[[ Line: 35 ]] --[[ Name: Lerp ]]
    return v25 + (v26 - v25) * v27;
end;
local v29 = {
    Animations = {
        Character = 85106385493441, 
        Victim = 112392082122879, 
        Camera = 105836309982198
    }, 
    CameraRig = l_ReplicatedStorage_0.Assets.FoVCamera
};
local function _(v30) --[[ Line: 47 ]] --[[ Name: impactCorrection ]]
    -- upvalues: l_TweenService_0 (copy), l_Lighting_0 (copy)
    task.defer(function() --[[ Line: 48 ]]
        -- upvalues: l_TweenService_0 (ref), v30 (copy), l_Lighting_0 (ref)
        local v31 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        l_TweenService_0:Create(v30, v31, {
            Saturation = -0.3, 
            Contrast = 7
        }):Play();
        local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
        l_MenuBlur_0.Size = 0;
        l_MenuBlur_0.Enabled = true;
        local v33 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
        l_TweenService_0:Create(l_MenuBlur_0, v33, {
            Size = 30
        }):Play();
    end);
end;
v29.Use = function(v35) --[[ Line: 61 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Players_0 (copy), l_Debris_0 (copy), v21 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_TweenService_0 (copy), l_RunService_0 (copy), v29 (copy), l_AnimHelper_0 (copy), l_CurrentCamera_0 (copy), l_Modules_0 (copy), v13 (copy), l_ReplicatedStorage_0 (copy)
    local l_Character_0 = v35.Character;
    local l_Victim_0 = v35.Victim;
    local v38 = l_LocalPlayer_0.Character == l_Character_0;
    local v39 = l_LocalPlayer_0.Character == l_Victim_0;
    local _ = l_Players_0:GetPlayerFromCharacter(l_Victim_0);
    local v41 = RaycastParams.new();
    v41.FilterType = Enum.RaycastFilterType.Exclude;
    v41.FilterDescendantsInstances = {
        l_Debris_0, 
        l_Character_0, 
        l_Victim_0
    };
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v43 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v45 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    local v46 = v21.GetWeldCharacter(l_Character_0);
    local v47 = v21.GetWeldCharacter(l_Victim_0);
    local function v54() --[[ Line: 85 ]] --[[ Name: SlowDownAnimations ]]
        -- upvalues: v43 (copy), v45 (copy)
        for _, v49 in (v43:GetPlayingAnimationTracks()) do
            if v49.Priority ~= Enum.AnimationPriority.Idle then
                local _ = v49.Speed;
                v49:AdjustSpeed(0.2);
            end;
        end;
        for _, v52 in (v45:GetPlayingAnimationTracks()) do
            if v52.Priority ~= Enum.AnimationPriority.Idle then
                local _ = v52.Speed;
                v52:AdjustSpeed(0.2);
            end;
        end;
    end;
    task.defer(function() --[[ Line: 103 ]]
        -- upvalues: v54 (copy)
        local v55 = tick();
        while tick() - v55 < 1 do
            v54();
            task.wait(0.1);
        end;
    end);
    task.defer(function() --[[ Line: 112 ]]
        -- upvalues: v38 (copy), v39 (copy), v21 (ref), l_Main_0 (ref)
        if v38 or v39 then
            v21.StatusFrame(v39, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v56 = l_Parent_0.UltimateStart:Clone();
    v56.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v56.Parent = l_Debris_0;
    local l_ClockTime_0 = l_Lighting_0.ClockTime;
    task.delay(20, function() --[[ Line: 124 ]]
        -- upvalues: v56 (copy)
        if v56 then
            v56:Destroy();
        end;
    end);
    for _, v59 in v56.Particle:GetChildren() do
        v59.Enabled = false;
        v59:Emit(v59:GetAttribute("EmitCount"));
    end;
    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
    local v61 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v38 or v39) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v61.Volume;
    v61.Volume = 0;
    task.delay(1, function() --[[ Line: 144 ]]
        -- upvalues: v61 (copy), v38 (copy), v39 (copy), l_Volume_0 (copy)
        v61:Stop();
        if v38 or v39 then
            v61.Volume = l_Volume_0;
        else
            v61.Volume = l_Volume_0 / 5;
        end;
        v61:Play();
    end);
    local v63 = l_SoundHelper_0:PlaySound({
        Name = "Song", 
        DirectCopy = script.auuuuuuuuuAUuu, 
        Parent = (not not v38 or v39) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_1 = v63.Volume;
    v63.Volume = 0;
    task.delay(0, function() --[[ Line: 165 ]]
        -- upvalues: v63 (copy), l_TweenService_0 (ref), v38 (copy), v39 (copy), l_Volume_1 (copy)
        v63:Stop();
        l_TweenService_0:Create(v63, TweenInfo.new(14, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            Volume = (not not v38 or v39) and l_Volume_1 or l_Volume_1 / 5
        }):Play();
        v63:Play();
    end);
    local v65 = nil;
    local v66 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local _ = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v68 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
    local v69 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    local v70 = nil;
    local v71 = nil;
    local v72 = nil;
    local v73 = nil;
    local v74 = nil;
    local v75 = nil;
    local v76 = nil;
    local v77 = {};
    local v78 = {};
    local v79 = nil;
    local v80 = nil;
    local v81 = false;
    v80 = {
        Ambient = l_Lighting_0.Ambient, 
        Brightness = l_Lighting_0.Brightness, 
        EnvironmentDiffuseScale = l_Lighting_0.EnvironmentDiffuseScale, 
        EnvironmentSpecularScale = l_Lighting_0.EnvironmentSpecularScale, 
        OutdoorAmbient = l_Lighting_0.OutdoorAmbient, 
        FogColor = l_Lighting_0.FogColor, 
        FogStart = l_Lighting_0.FogStart, 
        FogEnd = l_Lighting_0.FogEnd, 
        ExposureCompensation = l_Lighting_0.ExposureCompensation
    };
    local function v89() --[[ Line: 215 ]] --[[ Name: cleanup ]]
        -- upvalues: v77 (copy), l_RunService_0 (ref), v73 (ref), v65 (ref), v71 (ref), v74 (ref), v75 (ref), v61 (copy), l_TweenService_0 (ref), v63 (copy), v70 (ref), v72 (ref), v78 (copy), l_Lighting_0 (ref), v79 (ref), l_ColorCorrection_0 (copy), l_ClockTime_0 (copy), v80 (ref), v68 (copy), l_Main_0 (ref), v66 (copy)
        for _, v83 in v77 do
            v83:Disconnect();
        end;
        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
        v73.Value = "";
        v65 = true;
        if v71 then
            v71:Stop(0.01);
        end;
        if v74 then
            v74:Stop();
        end;
        if v75 then
            v75:Stop();
        end;
        if v61 then
            l_TweenService_0:Create(v63, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Volume = 0
            }):Play();
            task.delay(1, function() --[[ Line: 239 ]]
                -- upvalues: v63 (ref)
                v63:Destroy();
            end);
        end;
        if v63 then
            l_TweenService_0:Create(v63, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Volume = 0
            }):Play();
            task.delay(1, function() --[[ Line: 246 ]]
                -- upvalues: v63 (ref)
                v63:Destroy();
            end);
        end;
        if v70 then
            v70:Destroy();
        end;
        if v72 then
            v72:Destroy();
        end;
        for _, v85 in v78 do
            v85:Destroy();
        end;
        local l_CachedAtmosphere_0 = l_Lighting_0:FindFirstChild("CachedAtmosphere");
        if l_CachedAtmosphere_0 then
            for _, v88 in l_CachedAtmosphere_0:GetChildren() do
                v88.Parent = l_Lighting_0;
            end;
            l_CachedAtmosphere_0:Destroy();
        end;
        if v79 then
            v79:Destroy();
        end;
        l_TweenService_0:Create(l_ColorCorrection_0, TweenInfo.new(1), {
            Saturation = 0, 
            Contrast = 0, 
            Brightness = 0, 
            TintColor = Color3.new(1, 1, 1)
        }):Play();
        l_Lighting_0.ClockTime = l_ClockTime_0;
        workspace.Exposure.Value = v80.ExposureCompensation;
        l_TweenService_0:Create(l_Lighting_0, v68, {
            ExposureCompensation = workspace.Exposure.Value
        }):Play();
        if v80 then
            l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v80):Play();
        end;
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v66, {
            ImageTransparency = 1
        }):Play();
    end;
    v77[#v77 + 1] = l_Character_0.AncestryChanged:Connect(function() --[[ Line: 294 ]]
        -- upvalues: l_Character_0 (copy), v89 (copy)
        task.wait(0.1);
        if l_Character_0.Parent == nil then
            v89();
        end;
    end);
    v77[#v77 + 1] = l_Victim_0.AncestryChanged:Connect(function() --[[ Line: 301 ]]
        -- upvalues: l_Victim_0 (copy), v89 (copy)
        task.wait(0.1);
        if l_Victim_0.Parent == nil then
            v89();
        end;
    end);
    if v38 or v39 then
        task.defer(function() --[[ Line: 309 ]]
            -- upvalues: l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v56 (copy)
            l_ColorCorrection_0.Saturation = 0;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v90 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v90, {
                Saturation = -0.7, 
                Contrast = 0.5
            }):Play();
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v92 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v92, {
                Size = 10
            }):Play();
            local v93 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v93, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.delay(0.4, function() --[[ Line: 327 ]]
                -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v93 (copy)
                l_TweenService_0:Create(l_Lighting_0, v93, {
                    ExposureCompensation = workspace.Exposure.Value
                }):Play();
            end);
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
            v56:Destroy();
        end);
    end;
    task.wait(0.5);
    local v94 = v21.GetAtmosphere();
    if v38 or v39 then
        l_TweenService_0:Create(l_Main_0.White, v69, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v69, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v66, {
            ImageTransparency = 0.5
        }):Play();
        task.delay(1, function() --[[ Line: 356 ]]
            -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v69 (copy)
            l_TweenService_0:Create(l_Lighting_0, v69, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
        end);
    end;
    local l_Volume_2 = v61.Volume;
    v61.Volume = 0;
    task.delay(0.35, function() --[[ Line: 364 ]]
        -- upvalues: v61 (copy), v38 (copy), v39 (copy), l_Volume_2 (copy), v35 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v61:Stop();
        if v38 or v39 then
            v61.Volume = l_Volume_2;
        else
            v61.Volume = l_Volume_2 / 5;
        end;
        v61:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v35.HasVoicelines then
            local v97 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v38 or v39) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v38 and not v39 then
                v97.Volume = v97.Volume / 5;
            end;
        end;
    end);
    task.wait(0.5);
    v73 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local v98 = {
        Animator = v43, 
        AnimId = v29.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v99 = {
        Animator = v45, 
        AnimId = v29.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v98);
    l_AnimHelper_0:CreateAnim(v99);
    v74 = l_AnimHelper_0:CreateAnim(v98);
    v75 = l_AnimHelper_0:CreateAnim(v99);
    if v38 or v39 then
        v73.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 41;
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v66, {
            ImageTransparency = 1
        }):Play();
    end;
    local v100 = nil;
    local v101 = nil;
    local v102 = script.PlayerCharge.ChargePlayer:Clone();
    local v103 = require(l_Modules_0.Cutscene.BezierEffectModule);
    local v104 = script.VictimCharge.ChargeVictim:Clone();
    game.Debris:AddItem(v104, 6);
    v104.Parent = v47:FindFirstChild("UpperTorso") or l_Character_0.UpperTorso;
    local v105 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(0.5, 1), 
        NumberSequenceKeypoint.new(1, 1)
    });
    local v106 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(0.5, 0.5), 
        NumberSequenceKeypoint.new(1, 1)
    });
    v77[#v77 + 1] = v74:GetMarkerReachedSignal("ActivateAura"):Connect(function() --[[ Line: 478 ]]
        -- upvalues: v38 (copy), v39 (copy), v100 (ref), l_Debris_0 (ref), l_Character_0 (copy), l_TweenService_0 (ref), v78 (copy), v79 (ref), l_Lighting_0 (ref), v94 (copy), v46 (copy), v13 (ref)
        local _ = task.spawn(function() --[[ Line: 479 ]]
            -- upvalues: v38 (ref), v39 (ref), v100 (ref), l_Debris_0 (ref), l_Character_0 (ref), l_TweenService_0 (ref), v78 (ref), v79 (ref), l_Lighting_0 (ref), v94 (ref)
            if v38 or v39 then
                v100 = script.Domain:Clone();
                v100.Parent = l_Debris_0;
                v100.CFrame = l_Character_0.HumanoidRootPart.CFrame;
                l_TweenService_0:Create(v100, TweenInfo.new(1), {
                    Transparency = 0
                }):Play();
                table.insert(v78, v100);
                v79 = Instance.new("ColorCorrectionEffect");
                v79.Name = "GonColorCorrection";
                v79.Parent = l_Lighting_0;
                if v94 then
                    local l_Folder_0 = Instance.new("Folder");
                    l_Folder_0.Name = "CachedAtmosphere";
                    l_Folder_0.Parent = l_Lighting_0;
                    v94.Parent = l_Folder_0;
                end;
                l_TweenService_0:Create(v79, TweenInfo.new(1), {
                    Contrast = 0.1, 
                    Saturation = 0.3, 
                    TintColor = Color3.fromRGB(255, 252, 224)
                }):Play();
                l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(1), {
                    Ambient = Color3.new(0, 0, 0), 
                    OutdoorAmbient = Color3.new(0.435294, 0.568627, 0.686275), 
                    EnvironmentDiffuseScale = 0.1, 
                    EnvironmentSpecularScale = 0.4, 
                    Brightness = 0, 
                    FogColor = Color3.new(0, 0, 0), 
                    FogEnd = 100, 
                    FogStart = 0
                }):Play();
            end;
        end);
        local _ = task.spawn(function() --[[ Line: 517 ]]
            -- upvalues: v46 (ref), v78 (ref), v13 (ref), l_Debris_0 (ref)
            local v109 = script.Aura:Clone();
            for _, v111 in v46:GetChildren() do
                if v111:IsA("BasePart") then
                    for _, v113 in v109.Character:GetChildren() do
                        if v113.Name == v111.Name then
                            for _, v115 in v113:GetChildren() do
                                v115.Parent = v111;
                            end;
                        end;
                    end;
                end;
            end;
            for _, v117 in v78 do
                if v117.Name == "Beams" then
                    for _, v119 in v117:GetChildren() do
                        if v119:IsA("Beam") then
                            v119:SetAttribute("TransparencyData", v119.Transparency);
                        end;
                    end;
                end;
            end;
            for _, v121 in v46:GetDescendants() do
                if v121.Name == "Beams" then
                    for _, v123 in v121:GetChildren() do
                        if v123:IsA("Beam") then
                            task.spawn(function() --[[ Line: 547 ]]
                                -- upvalues: v13 (ref), v123 (copy)
                                v13.TweenNumberSequence(v123.Transparency, v123:GetAttribute("TransparencyData"), 50, 1, v123, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                            end);
                        end;
                    end;
                end;
            end;
            local l_Floor_0 = v109.Floor;
            l_Floor_0.Parent = l_Debris_0;
            l_Floor_0.HumanoidRootPart.Part1 = v46.HumanoidRootPart;
        end);
    end);
    local v126 = nil;
    v77[#v77 + 1] = v74:GetMarkerReachedSignal("ReleaseLegMid"):Connect(function() --[[ Line: 573 ]]
        -- upvalues: v126 (ref), l_Debris_0 (ref), l_Victim_0 (copy), l_Character_0 (copy), v13 (ref), v78 (copy), v38 (copy), v39 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref)
        v126 = script:WaitForChild("UpKick"):Clone();
        v126.Parent = l_Debris_0;
        v126.CFrame = CFrame.new(l_Victim_0.UpperTorso.Position) * CFrame.Angles(l_Character_0.HumanoidRootPart.CFrame:ToOrientation()) * CFrame.Angles(0, 0, 0);
        v13.Emit(v126);
        table.insert(v78, v126);
        if v38 or v39 then
            local l_l_ColorCorrection_0_0 = l_ColorCorrection_0;
            task.defer(function() --[[ Line: 48 ]]
                -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrection_0_0 (copy), l_Lighting_0 (ref)
                local v128 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_l_ColorCorrection_0_0, v128, {
                    Saturation = -0.3, 
                    Contrast = 7
                }):Play();
                local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                l_MenuBlur_2.Size = 0;
                l_MenuBlur_2.Enabled = true;
                local v130 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_2, v130, {
                    Size = 30
                }):Play();
            end);
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.07777777777777778
            });
        end;
    end);
    v77[#v77 + 1] = v74:GetMarkerReachedSignal("ChargeLeg"):Connect(function() --[[ Line: 596 ]]
        -- upvalues: v102 (copy), v46 (copy), l_Character_0 (copy), v13 (ref)
        v102.Parent = v46:FindFirstChild("UpperTorso") or l_Character_0.UpperTorso;
        v13.Emit(v102);
    end);
    v77[#v77 + 1] = v74:GetMarkerReachedSignal("ReleaseLeg"):Connect(function() --[[ Line: 601 ]]
        -- upvalues: l_Debris_0 (ref), v78 (copy), v13 (ref), v38 (copy), v39 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref)
        local v131 = script:WaitForChild("KickUp"):Clone();
        v131.Parent = l_Debris_0;
        v131.CFrame = v131.CFrame;
        table.insert(v78, v131);
        v13.Emit(v131);
        if v38 or v39 then
            local l_l_ColorCorrection_0_1 = l_ColorCorrection_0;
            task.defer(function() --[[ Line: 48 ]]
                -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrection_0_1 (copy), l_Lighting_0 (ref)
                local v133 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_l_ColorCorrection_0_1, v133, {
                    Saturation = -0.3, 
                    Contrast = 7
                }):Play();
                local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                l_MenuBlur_3.Size = 0;
                l_MenuBlur_3.Enabled = true;
                local v135 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_3, v135, {
                    Size = 30
                }):Play();
            end);
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.07777777777777778
            });
        end;
    end);
    local v136 = nil;
    v77[#v77 + 1] = v74:GetMarkerReachedSignal("StepLeg"):Connect(function() --[[ Line: 626 ]]
        -- upvalues: v38 (copy), v39 (copy), v21 (ref), v136 (ref), l_Debris_0 (ref), v13 (ref), v78 (copy), l_Character_0 (copy), v41 (copy), l_Victim_0 (copy)
        if v38 or v39 then
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.03684210526315789
            });
        end;
        v136 = script.Feet:Clone();
        v136.Parent = l_Debris_0;
        v13.Emit(v136);
        table.insert(v78, v136);
        local v137 = workspace:Raycast(l_Character_0.LeftFoot.Position, Vector3.new(-0, -10, -0, -0), v41);
        if v137 then
            local v138 = v13.GetRaySurface(v137);
            local l_CFrame_0 = l_Victim_0.HumanoidRootPart.CFrame;
            v136.CFrame = CFrame.new(v138.Position, l_CFrame_0 * CFrame.new(0, 0, -40000).Position);
        end;
    end);
    v77[#v77 + 1] = v74:GetMarkerReachedSignal("ChargeHand"):Connect(function() --[[ Line: 649 ]]
        -- upvalues: v102 (copy), v46 (copy), l_Character_0 (copy), v13 (ref), v78 (copy), v103 (copy)
        if v102 then
            v102.Parent = v46:FindFirstChild("LowerTorso") or l_Character_0.LowerTorso;
            v13.Emit(v102);
        end;
        local v140 = script.ExampleTrail:Clone();
        local v141 = script.HandAura.CenterAtt:Clone();
        local v142 = math.random(0.1, 0.7);
        v141.Parent = v46:FindFirstChild("RightHand") or l_Character_0.RightHand;
        v13.Emit(v141);
        table.insert(v78, v141);
        v103.StartEffect(v141, v140, 60, Vector3.new(-12, -8, -12, 0), Vector3.new(8, 6, 8, 0), 0.08, v142, Vector3.new(-4, -4, -4, 0), (Vector3.new(4, 4, 4, 0)));
    end);
    v77[#v77 + 1] = v74:GetMarkerReachedSignal("EmitHand"):Connect(function() --[[ Line: 676 ]]
        -- upvalues: v13 (ref), v101 (ref), v136 (ref), v38 (copy), v39 (copy), l_Debris_0 (ref), l_Character_0 (copy), v78 (copy), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), v72 (ref), v21 (ref), v41 (copy), l_Victim_0 (copy)
        v13.Emit(v101);
        for _, v144 in v136:GetDescendants() do
            if v144:IsA("ParticleEmitter") then
                v144.Enabled = false;
            end;
        end;
        if v38 or v39 then
            local v145 = script.WindBeam:Clone();
            v145.Parent = l_Debris_0;
            v145.CFrame = CFrame.new(l_Character_0.UpperTorso.Position) * CFrame.Angles(l_Character_0.HumanoidRootPart.CFrame:ToOrientation()) * CFrame.Angles(0, 1.5707963267948966, 0) + v145.CFrame.LookVector * -5 + v145.CFrame.RightVector * 10;
            table.insert(v78, v145);
            for _, v147 in v145:GetDescendants() do
                if v147:IsA("Beam") then
                    l_TweenService_0:Create(v147, TweenInfo.new(0.5), {
                        TextureSpeed = -0.1
                    }):Play();
                    l_TweenService_0:Create(v147, TweenInfo.new(2), {
                        Brightness = 0.01
                    }):Play();
                end;
            end;
            local l_l_ColorCorrection_0_2 = l_ColorCorrection_0;
            local l_l_l_ColorCorrection_0_2_0 = l_l_ColorCorrection_0_2 --[[ copy: 1 -> 7 ]];
            task.defer(function() --[[ Line: 48 ]]
                -- upvalues: l_TweenService_0 (ref), l_l_l_ColorCorrection_0_2_0 (copy), l_Lighting_0 (ref)
                local v150 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_l_l_ColorCorrection_0_2_0, v150, {
                    Saturation = -0.3, 
                    Contrast = 7
                }):Play();
                local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                l_MenuBlur_4.Size = 0;
                l_MenuBlur_4.Enabled = true;
                local v152 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_4, v152, {
                    Size = 30
                }):Play();
            end);
            v13.Emit(v72);
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.07777777777777778
            });
        end;
        local v153 = script.PlayerRelease:Clone();
        v153.Parent = l_Debris_0;
        v13.Emit(v153);
        table.insert(v78, v153);
        local v154 = workspace:Raycast(l_Character_0.UpperTorso.Position, Vector3.new(-0, -10, -0, -0), v41);
        if v154 then
            local v155 = v13.GetRaySurface(v154);
            local l_CFrame_1 = l_Victim_0.HumanoidRootPart.CFrame;
            v153.CFrame = CFrame.new(v155.Position, l_CFrame_1 * CFrame.new(0, 0, -40000).Position);
        end;
        if v101 then
            for _, v158 in v101:GetDescendants() do
                if v158.Name == "N" then
                    v158:Destroy();
                end;
                if v158.Name == "N (T)" then
                    v158:Destroy();
                end;
                if v158.Name == "Y (T)" then
                    v158:Destroy();
                end;
                if v158.Name == "SparkLine" then
                    v158:Destroy();
                end;
                if v158.Name == "Dust" then
                    v158:Destroy();
                end;
                if v158:IsA("ParticleEmitter") then
                    l_TweenService_0:Create(v158, TweenInfo.new(0.1), {
                        TimeScale = 1
                    }):Play();
                end;
            end;
        end;
    end);
    v77[#v77 + 1] = v74:GetMarkerReachedSignal("FinalHitHand"):Connect(function() --[[ Line: 749 ]]
        -- upvalues: v38 (copy), v39 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v76 (ref), l_Debris_0 (ref), l_Character_0 (copy), v13 (ref), v78 (copy), v47 (copy)
        if v38 or v39 then
            local l_l_ColorCorrection_0_3 = l_ColorCorrection_0;
            local l_l_l_ColorCorrection_0_3_0 = l_l_ColorCorrection_0_3 --[[ copy: 0 -> 2 ]];
            task.defer(function() --[[ Line: 48 ]]
                -- upvalues: l_TweenService_0 (ref), l_l_l_ColorCorrection_0_3_0 (copy), l_Lighting_0 (ref)
                local v161 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_l_l_ColorCorrection_0_3_0, v161, {
                    Saturation = -0.3, 
                    Contrast = 7
                }):Play();
                local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
                l_MenuBlur_5.Size = 0;
                l_MenuBlur_5.Enabled = true;
                local v163 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_5, v163, {
                    Size = 30
                }):Play();
            end);
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 2, 
                Fade = 1
            });
            task.spawn(function() --[[ Line: 759 ]]
                -- upvalues: v21 (ref)
                for _ = 1, 2 do
                    v21.HUDShake({
                        Scale = 30, 
                        Damper = 0.07777777777777778
                    });
                    task.wait(0.7);
                end;
            end);
            v76.Beam101.Transparency = NumberSequence.new(0);
            v76.Beam.Transparency = NumberSequence.new(0);
            v76.Beam.TextureSpeed = 10;
            v76.Beam101.TextureSpeed = 10;
        end;
        local v165 = script.fastShardsY:Clone();
        v165.Parent = l_Debris_0;
        v165.CFrame = CFrame.new(l_Character_0.UpperTorso.Position) * CFrame.Angles(l_Character_0.HumanoidRootPart.CFrame:ToOrientation()) * CFrame.Angles(0, 0, 0);
        v13.Emit(v165);
        table.insert(v78, v165);
        local v166 = script.FinalPunch.Final:Clone();
        v166.Parent = v47:FindFirstChild("Head") or l_Character_0.Head;
        v13.Emit(v166);
        table.insert(v78, v166);
    end);
    local v167 = nil;
    local v168 = nil;
    v77[#v77 + 1] = v75:GetMarkerReachedSignal("FloorCharge"):Connect(function() --[[ Line: 791 ]]
        -- upvalues: v13 (ref), v104 (copy), v21 (ref), v167 (ref), v47 (copy), l_Character_0 (copy), v78 (copy), l_TweenService_0 (ref)
        v13.Emit(v104);
        task.wait(0.46);
        v21.CameraShake({
            Preset = "HardHit", 
            WaitTime = 0.1, 
            Fade = 0
        });
        v21.HUDShake({
            Scale = 20, 
            Damper = 0.07777777777777778
        });
        task.wait(0.84);
        v21.CameraShake({
            Preset = "MedHit", 
            WaitTime = 1, 
            Fade = 1
        });
        v167 = script.WindArm.MainWindAtttachment:Clone();
        v167.Parent = v47:FindFirstChild("RightLowerArm") or l_Character_0.RightLowerArm;
        table.insert(v78, v167);
        for _, v170 in v167:GetDescendants() do
            if v170:IsA("Beam") then
                l_TweenService_0:Create(v170, TweenInfo.new(0.2), {
                    Brightness = 1
                }):Play();
            end;
        end;
    end);
    v77[#v77 + 1] = v75:GetMarkerReachedSignal("Trail"):Connect(function() --[[ Line: 826 ]]
        -- upvalues: v38 (copy), v39 (copy), v13 (ref), v76 (ref), v106 (copy), v168 (ref), l_Debris_0 (ref), l_Victim_0 (copy), l_Character_0 (copy), v78 (copy)
        if v38 or v39 then
            task.defer(function() --[[ Line: 828 ]]
                -- upvalues: v13 (ref), v76 (ref), v106 (ref)
                v13.TweenNumberSequence(v76.Beam101.Transparency, v106, 50, 0.2, v76.Beam101, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
            end);
            v13.TweenNumberSequence(v76.Beam.Transparency, v106, 50, 0.2, v76.Beam, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
        end;
        v168 = script.fastShards:Clone();
        v168.Parent = l_Debris_0;
        v168.CFrame = CFrame.new(l_Victim_0.RightLowerArm.Position) * CFrame.Angles(l_Character_0.HumanoidRootPart.CFrame:ToOrientation()) * CFrame.Angles(0, 0, 0);
        table.insert(v78, v168);
    end);
    local v171 = 0;
    v77[#v77 + 1] = v75:GetMarkerReachedSignal("DashEmit"):Connect(function() --[[ Line: 843 ]]
        -- upvalues: v101 (ref), v78 (copy), v171 (ref), v38 (copy), v39 (copy), v76 (ref), v21 (ref), v167 (ref), v168 (ref), v13 (ref), v106 (copy), l_TweenService_0 (ref), v105 (copy), l_Debris_0 (ref), l_Victim_0 (copy)
        if v101 then
            v101:Destroy();
        end;
        table.remove(v78, table.find(v78, v101));
        v171 = v171 + 1;
        if v171 <= 2 then
            if v38 or v39 then
                v76.Beam101.Transparency = NumberSequence.new(1);
                v76.Beam.Transparency = NumberSequence.new(1);
                v21.CameraShake({
                    Preset = "LightHit", 
                    WaitTime = 0.5, 
                    Fade = 0.5
                });
            end;
            if v167 then
                v167:Destroy();
            end;
            if v168 then
                v168:Destroy();
            end;
        end;
        if (v38 or v39) and v171 == 3 then
            v21.CameraShake({
                Preset = "MedHit", 
                WaitTime = 0.5, 
                Fade = 1
            });
            task.defer(function() --[[ Line: 879 ]]
                -- upvalues: v13 (ref), v76 (ref), v106 (ref)
                v13.TweenNumberSequence(v76.Beam101.Transparency, v106, 50, 0.2, v76.Beam101, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
            end);
            v13.TweenNumberSequence(v76.Beam.Transparency, v106, 50, 0.2, v76.Beam, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
            task.delay(0.3, function() --[[ Line: 885 ]]
                -- upvalues: l_TweenService_0 (ref), v76 (ref), v13 (ref), v105 (ref)
                task.defer(function() --[[ Line: 886 ]]
                    -- upvalues: l_TweenService_0 (ref), v76 (ref), v13 (ref), v105 (ref)
                    l_TweenService_0:Create(v76.Beam101, TweenInfo.new(2), {
                        TextureSpeed = 3
                    }):Play();
                    v13.TweenNumberSequence(v76.Beam101.Transparency, v105, 50, 0.6, v76.Beam101, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                end);
                l_TweenService_0:Create(v76.Beam, TweenInfo.new(2), {
                    TextureSpeed = 3
                }):Play();
                v13.TweenNumberSequence(v76.Beam.Transparency, v105, 50, 0.6, v76.Beam, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
            end);
        end;
        v101 = script.Dash:Clone();
        v101.Parent = l_Debris_0;
        v101.CFrame = l_Victim_0.HumanoidRootPart.CFrame * CFrame.Angles(0, 3.141592653589793, 0) + l_Victim_0.HumanoidRootPart.CFrame.LookVector * 15;
        table.insert(v78, v101);
        for _, v173 in v101:GetDescendants() do
            if v173.Name == "Y" then
                v173:Destroy();
            end;
            if v173.Name == "N (T)" then
                v173:Destroy();
            end;
            if v173.Name == "Y (T)" then
                v173:Destroy();
            end;
        end;
        v13.Emit(v101);
        for _, v175 in v101:GetDescendants() do
            if v175:IsA("ParticleEmitter") then
                l_TweenService_0:Create(v175, TweenInfo.new(0.7), {
                    TimeScale = 0.1
                }):Play();
            end;
        end;
    end);
    v77[#v77 + 1] = v75:GetMarkerReachedSignal("WHAT"):Connect(function() --[[ Line: 924 ]]
        -- upvalues: v47 (copy), l_Victim_0 (copy), v13 (ref), v78 (copy)
        local v176 = script.WHAT.WHAT:Clone();
        v176.Parent = v47:FindFirstChild("Head") or l_Victim_0.Head;
        v13.Emit(v176);
        table.insert(v78, v176);
    end);
    v77[#v77 + 1] = v75:GetMarkerReachedSignal("SpitEmit"):Connect(function() --[[ Line: 931 ]]
        -- upvalues: l_Victim_0 (copy), v13 (ref), v78 (copy), v38 (copy), v39 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
        local v177 = script.Spit.Spit:Clone();
        v177.Parent = l_Victim_0.Head;
        v13.Emit(v177);
        table.insert(v78, v177);
        if v38 or v39 then
            local l_l_ColorCorrection_0_4 = l_ColorCorrection_0;
            task.defer(function() --[[ Line: 48 ]]
                -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrection_0_4 (copy), l_Lighting_0 (ref)
                local v179 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_l_ColorCorrection_0_4, v179, {
                    Saturation = -0.3, 
                    Contrast = 7
                }):Play();
                local l_MenuBlur_6 = l_Lighting_0.MenuBlur;
                l_MenuBlur_6.Size = 0;
                l_MenuBlur_6.Enabled = true;
                local v181 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_6, v181, {
                    Size = 30
                }):Play();
            end);
        end;
    end);
    if v38 or v39 then
        v70 = l_ReplicatedStorage_0.Assets.FoVCamera:Clone();
        v70.Name = l_Character_0.Name .. "Camera";
        v70.Parent = l_Debris_0;
        local v182 = v35.StartCFrame * CFrame.new(0, -3, 0);
        v70:PivotTo(v182);
        v72 = script.Camera:Clone();
        v72.Parent = l_Debris_0;
        v76 = v72.SideWays;
        local v183 = {
            Animator = v70.AnimationController.Animator, 
            AnimId = v29.Animations.Camera
        };
        v71 = l_AnimHelper_0:CreateAnim(v183);
        l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 964 ]]
            -- upvalues: l_CurrentCamera_0 (ref), v70 (ref), v72 (ref)
            l_CurrentCamera_0.CFrame = v70.CamPart.CFrame;
            l_CurrentCamera_0.FieldOfView = math.abs((v70.FovPart.Position - v70.RootPart.Position).Y);
            if v72 then
                v72.CFrame = l_CurrentCamera_0.CFrame;
                return;
            else
                return;
            end;
        end);
        task.delay(v35.Time - 0.55, function() --[[ Line: 973 ]]
            -- upvalues: v75 (ref), v74 (ref), v71 (ref), l_TweenService_0 (ref), l_Main_0 (ref), v69 (copy)
            v75:AdjustSpeed(0.01);
            v74:AdjustSpeed(0.01);
            v71:AdjustSpeed(0.01);
            l_TweenService_0:Create(l_Main_0.White, v69, {
                BackgroundTransparency = 0
            }):Play();
        end);
        task.wait(v35.Time);
        (function() --[[ Line: 983 ]] --[[ Name: ResetPosition ]]
            -- upvalues: v81 (ref), l_Character_0 (copy), v35 (copy), l_Victim_0 (copy), v21 (ref)
            if v81 then
                return;
            else
                v81 = true;
                l_Character_0:SetPrimaryPartCFrame(v35.StartCFrame * CFrame.Angles(0, 3.141592653589793, 0));
                l_Victim_0:SetPrimaryPartCFrame(v35.StartCFrame * CFrame.new(0, 0, 5));
                task.delay(0.016666666666666666, function() --[[ Line: 990 ]]
                    -- upvalues: l_Character_0 (ref), l_Victim_0 (ref), v21 (ref)
                    for _, v186 in {
                        l_Character_0, 
                        l_Victim_0, 
                        v21.GetWeldCharacter(l_Character_0), 
                        v21.GetWeldCharacter(l_Victim_0)
                    } do
                        for _, v188 in v186:GetDescendants() do
                            if v188:IsA("BasePart") then
                                local l_v188_Attribute_0 = v188:GetAttribute("PreviousCollisionGroup");
                                if l_v188_Attribute_0 then
                                    v188.CollisionGroup = l_v188_Attribute_0;
                                    v188:SetAttribute("PreviousCollisionGroup", nil);
                                end;
                            end;
                        end;
                    end;
                end);
                return;
            end;
        end)();
        v89();
        v21.CameraShake({
            Preset = "HardHit", 
            WaitTime = 0.2, 
            Fade = 1
        });
        v21.HUDShake({
            Scale = 20, 
            Damper = 0.07777777777777778
        });
    end;
end;
return v29;