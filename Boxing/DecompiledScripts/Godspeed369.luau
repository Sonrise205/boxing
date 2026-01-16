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
local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
local v13 = require(l_Modules_0.Cutscene.Utilities);
local _ = require(l_Modules_0.Cutscene.Cutscene);
local v15 = require(l_Modules_0.Cutscene.CameraEffects);
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local l_Parent_0 = script.Parent.Parent;
local v22 = require(l_Parent_0);
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local l_Debris_0 = workspace:WaitForChild("Debris");
local _ = Random.new();
local function _(v26, v27, v28) --[[ Line: 35 ]] --[[ Name: Lerp ]]
    return v26 + (v27 - v26) * v28;
end;
local v30 = {
    Animations = {
        Character = 105703421123982, 
        Victim = 71595559888429, 
        Camera = 128175089186893
    }, 
    CameraRig = script.CameraRig
};
local function _(v31) --[[ Line: 47 ]] --[[ Name: impactCorrection ]]
    -- upvalues: l_TweenService_0 (copy), l_Lighting_0 (copy)
    task.defer(function() --[[ Line: 48 ]]
        -- upvalues: l_TweenService_0 (ref), v31 (copy), l_Lighting_0 (ref)
        local v32 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        l_TweenService_0:Create(v31, v32, {
            Saturation = -0.3, 
            Contrast = 7
        }):Play();
        local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
        l_MenuBlur_0.Size = 0;
        l_MenuBlur_0.Enabled = true;
        local v34 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
        l_TweenService_0:Create(l_MenuBlur_0, v34, {
            Size = 30
        }):Play();
    end);
end;
v30.Use = function(v36) --[[ Line: 61 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Players_0 (copy), l_Debris_0 (copy), v22 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_TweenService_0 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), v15 (copy), l_CurrentCamera_0 (copy), v30 (copy), l_AnimHelper_0 (copy), v13 (copy), l_EffectHelper_0 (copy)
    local l_Character_0 = v36.Character;
    local l_Victim_0 = v36.Victim;
    local v39 = l_LocalPlayer_0.Character == l_Character_0;
    local v40 = l_LocalPlayer_0.Character == l_Victim_0;
    local _ = l_Players_0:GetPlayerFromCharacter(l_Victim_0);
    local v42 = RaycastParams.new();
    v42.FilterType = Enum.RaycastFilterType.Exclude;
    v42.FilterDescendantsInstances = {
        l_Debris_0, 
        l_Character_0, 
        l_Victim_0
    };
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v44 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v46 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    local v47 = v22.GetWeldCharacter(l_Character_0);
    local _ = v22.GetWeldCharacter(l_Victim_0);
    local function v55() --[[ Line: 85 ]] --[[ Name: SlowDownAnimations ]]
        -- upvalues: v44 (copy), v46 (copy)
        for _, v50 in (v44:GetPlayingAnimationTracks()) do
            if v50.Priority ~= Enum.AnimationPriority.Idle then
                local _ = v50.Speed;
                v50:AdjustSpeed(0.2);
            end;
        end;
        for _, v53 in (v46:GetPlayingAnimationTracks()) do
            if v53.Priority ~= Enum.AnimationPriority.Idle then
                local _ = v53.Speed;
                v53:AdjustSpeed(0.2);
            end;
        end;
    end;
    task.defer(function() --[[ Line: 103 ]]
        -- upvalues: v55 (copy)
        local v56 = tick();
        while tick() - v56 < 1 do
            v55();
            task.wait(0.1);
        end;
    end);
    task.defer(function() --[[ Line: 112 ]]
        -- upvalues: v39 (copy), v40 (copy), v22 (ref), l_Main_0 (ref)
        if v39 or v40 then
            v22.StatusFrame(v40, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v57 = l_Parent_0.UltimateStart:Clone();
    v57.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v57.Parent = l_Debris_0;
    local l_ClockTime_0 = l_Lighting_0.ClockTime;
    task.delay(20, function() --[[ Line: 124 ]]
        -- upvalues: v57 (copy)
        if v57 then
            v57:Destroy();
        end;
    end);
    for _, v60 in v57.Particle:GetChildren() do
        v60.Enabled = false;
        v60:Emit(v60:GetAttribute("EmitCount"));
    end;
    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
    local v62 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v39 or v40) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v62.Volume;
    v62.Volume = 0;
    task.delay(1, function() --[[ Line: 144 ]]
        -- upvalues: v62 (copy), v39 (copy), v40 (copy), l_Volume_0 (copy)
        v62:Stop();
        if v39 or v40 then
            v62.Volume = l_Volume_0;
        else
            v62.Volume = l_Volume_0 / 5;
        end;
        v62:Play();
    end);
    local v64 = l_SoundHelper_0:PlaySound({
        Name = "Song", 
        DirectCopy = script.MONOLITH, 
        Parent = (not not v39 or v40) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_1 = v64.Volume;
    v64.Volume = 0;
    task.delay(0, function() --[[ Line: 165 ]]
        -- upvalues: v64 (copy), l_TweenService_0 (ref), v39 (copy), v40 (copy), l_Volume_1 (copy)
        v64:Stop();
        l_TweenService_0:Create(v64, TweenInfo.new(14, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            Volume = (not not v39 or v40) and l_Volume_1 or l_Volume_1 / 5
        }):Play();
        v64:Play();
        v64.TimePosition = 26;
    end);
    local v66 = nil;
    local v67 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local _ = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local _ = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
    local v70 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    local v71 = nil;
    local v72 = nil;
    local v73 = nil;
    local v74 = nil;
    local v75 = nil;
    local v76 = {};
    local v77 = {};
    local v78 = {};
    local v79 = {};
    local v80 = nil;
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    v80 = l_Character_0:GetAttribute("CachedLighting");
    local v86 = false;
    local function v98() --[[ Line: 212 ]] --[[ Name: cleanup ]]
        -- upvalues: v76 (copy), l_RunService_0 (ref), v73 (ref), v66 (ref), l_Victim_0 (copy), l_Character_0 (copy), v72 (ref), v85 (ref), v84 (ref), v83 (ref), v74 (ref), v75 (ref), v62 (copy), v78 (ref), v79 (ref), v64 (copy), l_TweenService_0 (ref), v71 (ref), v77 (copy), l_Lighting_0 (ref), l_ColorCorrection_0 (copy), l_ClockTime_0 (copy), l_ReplicatedStorage_0 (ref), v82 (ref), l_Main_0 (ref), v67 (copy)
        for _, v88 in v76 do
            v88:Disconnect();
        end;
        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
        v73.Value = "";
        v66 = true;
        l_Victim_0.PrimaryPart.Anchored = false;
        l_Character_0.PrimaryPart.Anchored = false;
        if v72 then
            v72:Stop(0.01);
        end;
        if v85 then
            v85:Destroy();
        end;
        if v84 then
            v84:Destroy();
        end;
        if v83 then
            v83:Destroy();
        end;
        if v74 then
            v74:Stop();
        end;
        if v75 then
            v75:Stop();
        end;
        if v62 then
            v62:Destroy();
        end;
        for _, v90 in v78 do
            v90.LocalTransparencyModifier = 0;
        end;
        for _, v92 in v79 do
            v92.Enabled = true;
        end;
        if v64 then
            l_TweenService_0:Create(v64, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Volume = 0
            }):Play();
            task.delay(1, function() --[[ Line: 263 ]]
                -- upvalues: v64 (ref)
                v64:Destroy();
            end);
        end;
        if v71 then
            v71:Destroy();
        end;
        for _, v94 in v77 do
            v94:Destroy();
        end;
        local l_CachedAtmosphere_0 = l_Lighting_0:FindFirstChild("CachedAtmosphere");
        if l_CachedAtmosphere_0 then
            for _, v97 in l_CachedAtmosphere_0:GetChildren() do
                v97.Parent = l_Lighting_0;
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
        if v82 then
            v82:Destroy();
        end;
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v67, {
            ImageTransparency = 1
        }):Play();
    end;
    v76[#v76 + 1] = l_Character_0.AncestryChanged:Connect(function() --[[ Line: 304 ]]
        -- upvalues: l_Character_0 (copy), v98 (copy)
        task.wait(0.1);
        if l_Character_0.Parent == nil then
            v98();
        end;
    end);
    v76[#v76 + 1] = l_Victim_0.AncestryChanged:Connect(function() --[[ Line: 311 ]]
        -- upvalues: l_Victim_0 (copy), v98 (copy)
        task.wait(0.1);
        if l_Victim_0.Parent == nil then
            v98();
        end;
    end);
    if v39 or v40 then
        task.defer(function() --[[ Line: 319 ]]
            -- upvalues: l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v22 (ref), v57 (copy)
            l_ColorCorrection_0.Saturation = 0;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v99 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v99, {
                Saturation = -0.7, 
                Contrast = 0.5
            }):Play();
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v101 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v101, {
                Size = 10
            }):Play();
            local v102 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v102, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.delay(0.4, function() --[[ Line: 337 ]]
                -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v102 (copy)
                l_TweenService_0:Create(l_Lighting_0, v102, {
                    ExposureCompensation = workspace.Exposure.Value
                }):Play();
            end);
            v22.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v22.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.5, 
                Fade = 0.5
            });
            task.wait(5);
            v57:Destroy();
        end);
    end;
    task.wait(0.5);
    local v103 = v22.GetAtmosphere();
    if v39 or v40 then
        l_TweenService_0:Create(l_Main_0.White, v70, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v70, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v67, {
            ImageTransparency = 0.5
        }):Play();
        task.delay(1, function() --[[ Line: 366 ]]
            -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v70 (copy)
            l_TweenService_0:Create(l_Lighting_0, v70, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
        end);
    end;
    local l_Volume_2 = v62.Volume;
    v62.Volume = 0;
    task.delay(0.35, function() --[[ Line: 374 ]]
        -- upvalues: v62 (copy), v39 (copy), v40 (copy), l_Volume_2 (copy), v36 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v62:Stop();
        if v39 or v40 then
            v62.Volume = l_Volume_2;
        else
            v62.Volume = l_Volume_2 / 5;
        end;
        v62:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v36.HasVoicelines then
            local v106 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v39 or v40) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v39 and not v40 then
                v106.Volume = v106.Volume / 5;
            end;
        end;
    end);
    task.wait(0.5);
    v15.createBlindness(0.5, 0.8);
    v73 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    if v39 or v40 then
        v73.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 45;
    end;
    local v107 = {
        Animator = v44, 
        AnimId = v30.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v108 = {
        Animator = v46, 
        AnimId = v30.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v107);
    l_AnimHelper_0:CreateAnim(v108);
    v74 = l_AnimHelper_0:CreateAnim(v107);
    v75 = l_AnimHelper_0:CreateAnim(v108);
    task.spawn(function() --[[ Line: 435 ]]
        -- upvalues: v85 (ref), l_Lighting_0 (ref)
        v85 = Instance.new("ColorCorrectionEffect");
        v85.Parent = l_Lighting_0;
        require(script.ColorCorrectionHandler).Init(v85);
    end);
    if v39 or v40 then
        v73.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 41;
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v67, {
            ImageTransparency = 0
        }):Play();
        if v103 then
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "CachedAtmosphere";
            l_Folder_0.Parent = l_Lighting_0;
            v103.Parent = l_Folder_0;
        end;
        v81 = script.Domain:Clone();
        v81.Parent = l_Debris_0;
        v81.CFrame = l_Character_0.HumanoidRootPart.CFrame;
        table.insert(v77, v81);
        l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0.01), {
            FogColor = Color3.new(0, 0, 0)
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0.1), {
            Ambient = Color3.fromRGB(138, 138, 138), 
            Brightness = 2, 
            OutdoorAmbient = Color3.fromRGB(70, 70, 70), 
            EnvironmentDiffuseScale = 0.399, 
            EnvironmentSpecularScale = 0.723, 
            FogEnd = 50, 
            FogStart = 0
        }):Play();
    end;
    v83 = script.EyeFX:Clone();
    v83.Parent = v47:FindFirstChild("Head") or l_Character_0.Head;
    v84 = script.ChargeFx:Clone();
    v84.Parent = v47:FindFirstChild("LeftHand") or l_Character_0.LeftHand;
    v84.ChargeFx.Part0 = v47:FindFirstChild("LeftHand") or l_Character_0.LeftHand;
    local function v118() --[[ Line: 486 ]] --[[ Name: LoadMap ]]
        -- upvalues: l_Debris_0 (ref), l_RunService_0 (ref), l_Character_0 (copy)
        local l_Model_0 = Instance.new("Model");
        l_Model_0.Name = "VisualMap";
        l_Model_0.Parent = l_Debris_0;
        local l_Children_0 = script.Map:GetChildren();
        local v112 = 1;
        while v112 <= #l_Children_0 do
            local v113 = math.min(v112 + 10 - 1, #l_Children_0);
            for v114 = v112, v113 do
                local v115 = l_Children_0[v114]:Clone();
                for _, v117 in ipairs(v115:GetDescendants()) do
                    if v117:IsA("BasePart") then
                        v117.LocalTransparencyModifier = 1;
                    end;
                end;
                v115.Parent = l_Model_0;
            end;
            v112 = v113 + 1;
            l_RunService_0.Heartbeat:Wait();
        end;
        l_Model_0.PrimaryPart = l_Model_0.HumanoidRootPart;
        l_Model_0:PivotTo(l_Character_0:WaitForChild("HumanoidRootPart").CFrame);
        return l_Model_0;
    end;
    task.delay(0.5, function() --[[ Line: 516 ]]
        -- upvalues: v82 (ref), v118 (copy)
        v82 = v118();
    end);
    v76[#v76 + 1] = v74:GetMarkerReachedSignal("SpawnMap"):Connect(function() --[[ Line: 521 ]]
        -- upvalues: v13 (ref), v82 (ref), v84 (ref), v81 (ref), v71 (ref), v78 (ref), v79 (ref), l_EffectHelper_0 (ref), l_Character_0 (copy), l_RunService_0 (ref), l_Victim_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
        v13.Emit(v82.CutsceneFx.Start);
        v84:Destroy();
        local v119 = {
            "Welds", 
            v81, 
            v71
        };
        local v120, v121 = l_EffectHelper_0.GetPartsToHide(l_Character_0, v119);
        v78 = v120;
        v79 = v121;
        task.spawn(function() --[[ Line: 530 ]]
            -- upvalues: v82 (ref), l_RunService_0 (ref)
            for v122 = 1, 0, -0.1 do
                for _, v124 in v82:GetDescendants() do
                    if v124:IsA("BasePart") then
                        v124.LocalTransparencyModifier = v122;
                    end;
                end;
                l_RunService_0.Heartbeat:Wait();
            end;
        end);
        for _, v126 in v78 do
            v126.LocalTransparencyModifier = 1;
        end;
        for _, v128 in v79 do
            v128.Enabled = false;
        end;
        for _, v130 in l_Character_0:GetDescendants() do
            if v130:IsA("BasePart") or v130:IsA("MeshPart") then
                v130.LocalTransparencyModifier = 0;
            end;
        end;
        for _, v132 in l_Victim_0:GetDescendants() do
            if v132:IsA("BasePart") or v132:IsA("MeshPart") then
                v132.LocalTransparencyModifier = 0;
            end;
        end;
        l_TweenService_0:Create(v81, TweenInfo.new(0.01), {
            Color = Color3.new(0.67451, 0.533333, 0.388235)
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0.01), {
            FogColor = Color3.new(0.905882, 0.741176, 0.576471)
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0.1), {
            Ambient = Color3.fromRGB(138, 105, 60), 
            Brightness = 3.35, 
            FogEnd = 300
        }):Play();
        for _, v134 in v71:FindFirstChild("CamPart").Main:GetDescendants() do
            if v134:IsA("Beam") or v134:IsA("ParticleEmitter") then
                v134.Enabled = false;
            end;
        end;
        for _, v136 in v71:FindFirstChild("CamPart").WindBeams:GetDescendants() do
            if v136:IsA("Beam") then
                l_TweenService_0:Create(v136, TweenInfo.new(0.5), {
                    Brightness = 20
                }):Play();
                v136.Enabled = false;
            end;
        end;
        v81.LocalTransparencyModifier = 0;
    end);
    local v137 = 1;
    v76[#v76 + 1] = v74:GetMarkerReachedSignal("Hit"):Connect(function() --[[ Line: 595 ]]
        -- upvalues: v82 (ref), v137 (ref), v13 (ref)
        local l_FirstChild_0 = v82.CutsceneFx:FindFirstChild("Hit" .. v137);
        v13.Emit(l_FirstChild_0);
        v137 = v137 + 1;
    end);
    v76[#v76 + 1] = v74:GetMarkerReachedSignal("Grab"):Connect(function() --[[ Line: 601 ]]
        -- upvalues: v13 (ref), v82 (ref)
        v13.Emit(v82.CutsceneFx.Grab);
    end);
    v76[#v76 + 1] = v74:GetMarkerReachedSignal("Land"):Connect(function() --[[ Line: 605 ]]
        -- upvalues: v82 (ref), v77 (copy), l_Character_0 (copy), v42 (copy), v13 (ref)
        local v139 = script.Floor:Clone();
        v139.Parent = v82;
        table.insert(v77, v139);
        local v140 = workspace:Raycast(l_Character_0.LowerTorso.Position, Vector3.new(-0, -10, -0, -0), v42);
        if v140 then
            local v141 = v13.GetRaySurface(v140);
            local l_CFrame_0 = l_Character_0.HumanoidRootPart.CFrame;
            v139:PivotTo(CFrame.new(v141.Position, l_CFrame_0 * CFrame.new(0, 0, -40000).Position));
        end;
        v13.Emit(v139);
    end);
    v76[#v76 + 1] = v75:GetMarkerReachedSignal("Slam"):Connect(function() --[[ Line: 622 ]]
        -- upvalues: v13 (ref), v82 (ref)
        v13.Emit(v82.CutsceneFx.SmokeMain);
    end);
    if v39 or v40 then
        v71 = script.CameraRig:Clone();
        v71.Name = l_Character_0.Name .. "Camera";
        v71.Parent = l_Debris_0;
        local l_CFrame_1 = l_Character_0.HumanoidRootPart.CFrame;
        v71:PivotTo(l_CFrame_1);
        if v71:FindFirstChild("CamPart") then
            for _, v145 in v71:FindFirstChild("CamPart").Main:GetDescendants() do
                if v145:IsA("Beam") or v145:IsA("ParticleEmitter") then
                    v145.Enabled = true;
                end;
            end;
            for _, v147 in v71:FindFirstChild("CamPart").WindBeams:GetDescendants() do
                if v147:IsA("Beam") then
                    l_TweenService_0:Create(v147, TweenInfo.new(0.5), {
                        Brightness = 20
                    }):Play();
                    v147.Enabled = true;
                end;
            end;
        end;
        local v148 = {
            Animator = v71.AnimationController.Animator, 
            AnimId = v30.Animations.Camera
        };
        v72 = l_AnimHelper_0:CreateAnim(v148);
        l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 661 ]]
            -- upvalues: l_CurrentCamera_0 (ref), v71 (ref), v72 (ref)
            l_CurrentCamera_0.CFrame = v71.CamPart.CFrame;
            local v150 = tostring((math.floor(v72.TimePosition * 60)));
            local l_FirstChild_1 = script.U1.FOV:FindFirstChild(v150);
            if l_FirstChild_1 then
                workspace.CurrentCamera.FieldOfView = l_FirstChild_1.Value;
            end;
        end);
        task.delay(v36.Time - 0.55, function() --[[ Line: 670 ]]
            -- upvalues: v75 (ref), v74 (ref), v72 (ref), l_TweenService_0 (ref), l_Main_0 (ref), v70 (copy)
            v75:AdjustSpeed(0.01);
            v74:AdjustSpeed(0.01);
            v72:AdjustSpeed(0.01);
            l_TweenService_0:Create(l_Main_0.White, v70, {
                BackgroundTransparency = 0
            }):Play();
        end);
        task.delay(v36.Time - 0.55, function() --[[ Line: 678 ]]
            -- upvalues: v66 (ref), v22 (ref), l_RunService_0 (ref), v73 (ref), v76 (copy), v75 (ref), v86 (ref), l_Character_0 (copy), v36 (copy), l_Victim_0 (copy), v98 (copy)
            if v66 then
                return;
            else
                v22.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.2, 
                    Fade = 1
                });
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                v73.Value = "";
                for _, v153 in v76 do
                    v153:Disconnect();
                end;
                if v75 then
                    v75:Stop(0.01);
                end;
                (function() --[[ Line: 696 ]] --[[ Name: ResetPosition ]]
                    -- upvalues: v86 (ref), l_Character_0 (ref), v36 (ref), l_Victim_0 (ref), v22 (ref)
                    if v86 then
                        return;
                    else
                        v86 = true;
                        l_Character_0:SetPrimaryPartCFrame(v36.StartCFrame * CFrame.Angles(0, 3.141592653589793, 0));
                        l_Victim_0:SetPrimaryPartCFrame(v36.StartCFrame * CFrame.new(0, 0, 5));
                        task.delay(0.016666666666666666, function() --[[ Line: 703 ]]
                            -- upvalues: l_Character_0 (ref), l_Victim_0 (ref), v22 (ref)
                            for _, v155 in {
                                l_Character_0, 
                                l_Victim_0, 
                                v22.GetWeldCharacter(l_Character_0), 
                                v22.GetWeldCharacter(l_Victim_0)
                            } do
                                for _, v157 in v155:GetDescendants() do
                                    if v157:IsA("BasePart") then
                                        local l_v157_Attribute_0 = v157:GetAttribute("PreviousCollisionGroup");
                                        if l_v157_Attribute_0 then
                                            v157.CollisionGroup = l_v157_Attribute_0;
                                            v157:SetAttribute("PreviousCollisionGroup", nil);
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
                v98();
                return;
            end;
        end);
        task.wait(v36.Time);
        v22.CameraShake({
            Preset = "HardHit", 
            WaitTime = 0.2, 
            Fade = 1
        });
        v22.HUDShake({
            Scale = 20, 
            Damper = 0.07777777777777778
        });
    end;
end;
return v30;