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
        Character = 115186117675079, 
        Victim = 122499536358364, 
        Camera = 123122274470243
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
            Contrast = 2
        }):Play();
        local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
        l_MenuBlur_0.Size = 0;
        l_MenuBlur_0.Enabled = true;
        local v32 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
        l_TweenService_0:Create(l_MenuBlur_0, v32, {
            Size = 15
        }):Play();
    end);
end;
local function v38(v34, v35) --[[ Line: 60 ]] --[[ Name: toggleLines ]]
    for _, v37 in v34:GetChildren() do
        if v37:IsA("ParticleEmitter") then
            v37.Enabled = v35;
        end;
    end;
end;
local function _(v39, v40, v41) --[[ Line: 67 ]] --[[ Name: createFeetEffect ]]
    -- upvalues: l_Debris_0 (copy), v12 (copy)
    local v42 = v39:Clone();
    v42.Parent = l_Debris_0;
    if v40 then
        v42.Position = v40;
    end;
    v12.Emit(v42);
    game:GetService("Debris"):AddItem(v42, v41);
    return v42;
end;
v28.Use = function(v44) --[[ Line: 80 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Players_0 (copy), l_Debris_0 (copy), v20 (copy), l_Main_0 (copy), l_EffectHelper_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_TweenService_0 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), l_CurrentCamera_0 (copy), v28 (copy), l_AnimHelper_0 (copy), v12 (copy), v38 (copy)
    local l_Character_0 = v44.Character;
    local l_Victim_0 = v44.Victim;
    local v47 = l_LocalPlayer_0.Character == l_Character_0;
    local v48 = l_LocalPlayer_0.Character == l_Victim_0;
    local _ = l_Players_0:GetPlayerFromCharacter(l_Victim_0);
    local v50 = RaycastParams.new();
    v50.FilterType = Enum.RaycastFilterType.Exclude;
    v50.FilterDescendantsInstances = {
        l_Debris_0, 
        l_Character_0, 
        l_Victim_0
    };
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v52 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v54 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    local v55 = v20.GetWeldCharacter(l_Character_0);
    local _ = v20.GetWeldCharacter(l_Victim_0);
    local function v63() --[[ Line: 104 ]] --[[ Name: SlowDownAnimations ]]
        -- upvalues: v52 (copy), v54 (copy)
        for _, v58 in (v52:GetPlayingAnimationTracks()) do
            if v58.Priority ~= Enum.AnimationPriority.Idle then
                local _ = v58.Speed;
                v58:AdjustSpeed(0.2);
            end;
        end;
        for _, v61 in (v54:GetPlayingAnimationTracks()) do
            if v61.Priority ~= Enum.AnimationPriority.Idle then
                local _ = v61.Speed;
                v61:AdjustSpeed(0.2);
            end;
        end;
    end;
    task.defer(function() --[[ Line: 122 ]]
        -- upvalues: v63 (copy)
        local v64 = tick();
        while tick() - v64 < 1 do
            v63();
            task.wait(0.1);
        end;
    end);
    task.defer(function() --[[ Line: 131 ]]
        -- upvalues: v47 (copy), v48 (copy), v20 (ref), l_Main_0 (ref)
        if v47 or v48 then
            v20.StatusFrame(v48, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v65 = l_EffectHelper_0.UltimateStart:Clone();
    v65.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v65.Parent = l_Debris_0;
    local l_ClockTime_0 = l_Lighting_0.ClockTime;
    task.delay(20, function() --[[ Line: 143 ]]
        -- upvalues: v65 (copy)
        if v65 then
            v65:Destroy();
        end;
    end);
    for _, v68 in v65.Particle:GetChildren() do
        v68.Enabled = false;
        v68:Emit(v68:GetAttribute("EmitCount"));
    end;
    local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
    l_ColorCorrectionEffect_0.Name = "MapRemove";
    l_ColorCorrectionEffect_0.Parent = l_Lighting_0;
    local v70 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v47 or v48) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v70.Volume;
    v70.Volume = 0;
    task.delay(1.48, function() --[[ Line: 165 ]]
        -- upvalues: v70 (copy), v47 (copy), v48 (copy), l_Volume_0 (copy)
        v70:Stop();
        if v47 or v48 then
            v70.Volume = l_Volume_0;
        else
            v70.Volume = l_Volume_0 / 5;
        end;
        v70:Play();
    end);
    local v72 = l_SoundHelper_0:PlaySound({
        Name = "Song", 
        DirectCopy = script.SONG, 
        Parent = (not not v47 or v48) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_1 = v72.Volume;
    v72:Stop();
    task.delay(0.92, function() --[[ Line: 186 ]]
        -- upvalues: l_TweenService_0 (ref), v72 (copy), l_Volume_1 (copy)
        l_TweenService_0:Create(v72, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Volume = l_Volume_1
        }):Play();
        v72:Play();
    end);
    local v74 = nil;
    local v75 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local _ = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local _ = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
    local v78 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    local v79 = nil;
    local v80 = nil;
    local v81 = nil;
    local v82 = nil;
    local v83 = {};
    local v84 = {};
    local v85 = {};
    local v86 = {};
    local v87 = nil;
    v87 = l_Character_0:GetAttribute("CachedLighting");
    local v88 = false;
    local l_FarIntensity_0 = l_Lighting_0.DepthOfField.FarIntensity;
    local v90 = nil;
    local v91 = nil;
    local function v103() --[[ Line: 226 ]] --[[ Name: cleanup ]]
        -- upvalues: v83 (copy), l_RunService_0 (ref), v82 (ref), v74 (ref), l_Victim_0 (copy), l_Character_0 (copy), v90 (ref), v91 (ref), v80 (ref), v70 (copy), l_TweenService_0 (ref), v72 (copy), v79 (ref), v84 (copy), v85 (copy), v86 (copy), l_Lighting_0 (ref), l_ColorCorrectionEffect_0 (copy), l_ClockTime_0 (copy), l_ReplicatedStorage_0 (ref), l_FarIntensity_0 (copy), l_Main_0 (ref), v75 (copy), v20 (ref)
        for _, v93 in v83 do
            v93:Disconnect();
        end;
        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
        v82.Value = "";
        v74 = true;
        l_Victim_0.PrimaryPart.Anchored = false;
        l_Character_0.PrimaryPart.Anchored = false;
        if v90 then
            v90:Stop();
        end;
        if v91 then
            v91:Stop();
        end;
        if v80 then
            v80:Stop();
        end;
        if v70 then
            l_TweenService_0:Create(v70, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Volume = 0
            }):Play();
            task.delay(1, function() --[[ Line: 257 ]]
                -- upvalues: v70 (ref)
                v70:Destroy();
            end);
        end;
        if v72 then
            l_TweenService_0:Create(v72, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Volume = 0
            }):Play();
            task.delay(5, function() --[[ Line: 264 ]]
                -- upvalues: v72 (ref)
                v72:Destroy();
            end);
        end;
        if v79 then
            v79:Destroy();
        end;
        for _, v95 in v84 do
            v95:Destroy();
        end;
        for _, v97 in v85 do
            v97.LocalTransparencyModifier = 0;
        end;
        for _, v99 in v86 do
            v99.Enabled = true;
        end;
        local l_CachedAtmosphere_0 = l_Lighting_0:FindFirstChild("CachedAtmosphere");
        if l_CachedAtmosphere_0 then
            for _, v102 in l_CachedAtmosphere_0:GetChildren() do
                v102.Parent = l_Lighting_0;
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
        v82.Value = "";
        l_Lighting_0.DepthOfField.FarIntensity = l_FarIntensity_0;
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v75, {
            ImageTransparency = 1
        }):Play();
        v20.SetTransparency(l_Victim_0, 0);
        v20.SetTransparency(l_Character_0, 0);
    end;
    v83[#v83 + 1] = l_Character_0.AncestryChanged:Connect(function() --[[ Line: 316 ]]
        -- upvalues: l_Character_0 (copy), v103 (copy)
        task.wait(0.1);
        if l_Character_0.Parent == nil then
            v103();
        end;
    end);
    v83[#v83 + 1] = l_Victim_0.AncestryChanged:Connect(function() --[[ Line: 323 ]]
        -- upvalues: l_Victim_0 (copy), v103 (copy)
        task.wait(0.1);
        if l_Victim_0.Parent == nil then
            v103();
        end;
    end);
    if v47 or v48 then
        task.defer(function() --[[ Line: 331 ]]
            -- upvalues: v20 (ref), v65 (copy)
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
            v65:Destroy();
        end);
    end;
    task.wait(0.5);
    local _ = v20.GetAtmosphere();
    if v47 or v48 then
        l_TweenService_0:Create(l_Main_0.White, v78, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v78, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v75, {
            ImageTransparency = 0.5
        }):Play();
        task.delay(1, function() --[[ Line: 359 ]]
            -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v78 (copy)
            l_TweenService_0:Create(l_Lighting_0, v78, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
        end);
    end;
    task.wait(0.5);
    v82 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    if v47 or v48 then
        v82.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 45;
    end;
    local v105 = {
        Animator = v52, 
        AnimId = v28.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v106 = {
        Animator = v54, 
        AnimId = v28.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v105);
    l_AnimHelper_0:CreateAnim(v106);
    v90 = l_AnimHelper_0:CreateAnim(v105);
    v91 = l_AnimHelper_0:CreateAnim(v106);
    if v47 or v48 then
        v82.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 41;
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v75, {
            ImageTransparency = 1
        }):Play();
    end;
    local _ = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(0.5, 1), 
        NumberSequenceKeypoint.new(1, 1)
    });
    local v108 = nil;
    local v109 = nil;
    local v110 = nil;
    local v111 = nil;
    local v112 = nil;
    local v113 = nil;
    local v114 = {};
    local v115 = nil;
    local v116 = nil;
    local _ = l_Lighting_0.DepthOfField.FarIntensity;
    local v140 = {
        Left = {
            Barrage_Begin = function() --[[ Line: 427 ]] --[[ Name: Barrage_Begin ]]
                -- upvalues: v110 (ref), l_Victim_0 (copy), v84 (copy)
                v110 = script.HeadBarrage:Clone();
                v110.Parent = l_Victim_0.Head;
                table.insert(v84, v110);
            end, 
            Barrage_End = function() --[[ Line: 434 ]] --[[ Name: Barrage_End ]]
                -- upvalues: v110 (ref)
                for _, v119 in v110:GetChildren() do
                    v119.Enabled = false;
                end;
            end
        }, 
        Final = {
            Punch_EmitNPause = function() --[[ Line: 442 ]] --[[ Name: Punch_EmitNPause ]]
                -- upvalues: v111 (ref), l_Debris_0 (ref), l_Character_0 (copy), v84 (copy), v12 (ref), l_TweenService_0 (ref), v47 (copy), v48 (copy), v20 (ref), l_Lighting_0 (ref), v113 (ref), v115 (ref), v116 (ref), l_Victim_0 (copy), v83 (copy), l_ColorCorrectionEffect_0 (copy), v91 (ref), v90 (ref), v80 (ref), l_RunService_0 (ref)
                v111 = script.FinalBlow:Clone();
                v111.Parent = l_Debris_0;
                v111.CFrame = CFrame.new(l_Character_0.UpperTorso.Position) * CFrame.Angles(l_Character_0.HumanoidRootPart.CFrame:ToOrientation()) + v111.CFrame.RightVector * -3;
                table.insert(v84, v111);
                v12.Emit(v111);
                for _, v121 in v111:GetDescendants() do
                    if v121:IsA("ParticleEmitter") then
                        l_TweenService_0:Create(v121, TweenInfo.new(0.6), {
                            TimeScale = 0
                        }):Play();
                    end;
                end;
                if v47 or v48 then
                    v20.HUDShake({
                        Scale = 5, 
                        Damper = 0.09999999999999999
                    });
                    v20.CameraShake({
                        Preset = "HardHit", 
                        WaitTime = 0.1, 
                        Fade = 0.2, 
                        FoVMult = 2
                    });
                    local v122 = 0;
                    for _, v124 in l_Lighting_0:GetChildren() do
                        if v124:IsA("ColorCorrectionEffect") then
                            v122 = v122 + v124.Saturation;
                        end;
                    end;
                    v113 = Instance.new("ColorCorrectionEffect");
                    v113.Name = "NanoColorCorrection";
                    v113.Parent = l_Lighting_0;
                    table.insert(v84, v113);
                    l_TweenService_0:Create(v113, TweenInfo.new(0.3), {
                        Saturation = -v122
                    }):Play();
                    local v125, v126 = require(script.ViewportFrame).main(l_Character_0, l_Victim_0);
                    v115 = v125;
                    v116 = v126;
                    table.insert(v83, v116);
                    table.insert(v84, v115.Parent);
                    l_ColorCorrectionEffect_0.Saturation = -1;
                    l_ColorCorrectionEffect_0.Brightness = 1;
                    v91:AdjustSpeed(0.1);
                    v90:AdjustSpeed(0.1);
                    v80:AdjustSpeed(0.1);
                    v125 = 0;
                    v126 = nil;
                    do
                        local l_v125_0, l_v126_0 = v125, v126;
                        l_v126_0 = l_RunService_0.Heartbeat:Connect(function(v129) --[[ Line: 505 ]]
                            -- upvalues: l_v125_0 (ref), v91 (ref), v90 (ref), v80 (ref), l_v126_0 (ref)
                            l_v125_0 = l_v125_0 + v129;
                            local v130 = math.clamp(l_v125_0 / 1.5, 0, 1);
                            local v131 = v130 * 0.9 + 0.1;
                            v91:AdjustSpeed(v131);
                            v90:AdjustSpeed(v131);
                            v80:AdjustSpeed(v131);
                            if v130 >= 1 then
                                l_v126_0:Disconnect();
                            end;
                        end);
                        table.insert(v83, l_v126_0);
                        task.wait(0.07);
                        l_ColorCorrectionEffect_0.Brightness = -0.8;
                        l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(0.5), {
                            Brightness = -0.2
                        }):Play();
                        l_TweenService_0:Create(v115, TweenInfo.new(1), {}):Play();
                        v115.CurrentCamera.FieldOfView = 55;
                        l_TweenService_0:Create(v115.CurrentCamera, TweenInfo.new(0.5), {
                            FieldOfView = 51
                        }):Play();
                        local l_ImageLabel_0 = v115.Parent:FindFirstChild("ImageLabel");
                        l_TweenService_0:Create(l_ImageLabel_0, TweenInfo.new(1), {
                            Size = UDim2.new(l_ImageLabel_0.Size.X.Scale * 1.5, 0, l_ImageLabel_0.Size.Y.Scale * 1.5, 0), 
                            ImageTransparency = 1
                        }):Play();
                        task.wait(0.7);
                        for _ = 1, 7 do
                            v115.LightDirection = Vector3.new(math.random(-5, 1), math.random(-5, 1), math.random(-5, 1));
                            task.wait();
                        end;
                        v115.Ambient = Color3.fromRGB(100000000000000, 1000000000001, 100000000000000);
                        v115.LightColor = Color3.fromRGB(100000000000000, 1000000000001, 100000000000000);
                        l_ColorCorrectionEffect_0.Brightness = -50;
                        task.wait(0.07);
                        v115.Ambient = Color3.fromRGB(0, 0, 0);
                        v115.LightColor = Color3.fromRGB(0, 0, 0);
                        l_ColorCorrectionEffect_0.Brightness = 100;
                    end;
                end;
            end, 
            Punch_Go = function() --[[ Line: 565 ]] --[[ Name: Punch_Go ]]
                -- upvalues: v111 (ref), l_TweenService_0 (ref), v47 (copy), v48 (copy), l_ColorCorrectionEffect_0 (copy), v116 (ref), v115 (ref), v113 (ref), l_Lighting_0 (ref), v20 (ref)
                for _, v135 in v111:GetDescendants() do
                    if v135:IsA("ParticleEmitter") then
                        v135.TimeScale = 1;
                        l_TweenService_0:Create(v135, TweenInfo.new(0.5), {
                            TimeScale = 0.5
                        }):Play();
                    end;
                end;
                if v47 or v48 then
                    l_ColorCorrectionEffect_0.Saturation = 0;
                    l_ColorCorrectionEffect_0.Brightness = 0;
                    v116:Disconnect();
                    v115.Parent:Destroy();
                    l_TweenService_0:Create(v113, TweenInfo.new(0.3), {
                        Saturation = 0
                    }):Play();
                    local l_l_ColorCorrectionEffect_0_0 = l_ColorCorrectionEffect_0;
                    task.defer(function() --[[ Line: 47 ]]
                        -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrectionEffect_0_0 (copy), l_Lighting_0 (ref)
                        local v137 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_l_ColorCorrectionEffect_0_0, v137, {
                            Saturation = -0.3, 
                            Contrast = 2
                        }):Play();
                        local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_1.Size = 0;
                        l_MenuBlur_1.Enabled = true;
                        local v139 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_1, v139, {
                            Size = 15
                        }):Play();
                    end);
                    v20.HUDShake({
                        Scale = 10, 
                        Damper = 0.09999999999999999
                    });
                    v20.CreateImpactFrame({
                        Time = 0.03333333333333333
                    });
                    v20.CameraShake({
                        Preset = "HardHit", 
                        WaitTime = 0.7, 
                        Fade = 1, 
                        FoVMult = 2
                    });
                end;
            end
        }
    };
    local v141 = nil;
    for v142, v143 in v140 do
        for v144, v145 in v143 do
            local v146 = #v83 + 1;
            local v147 = v142 .. "_" .. v144;
            v83[v146] = v90:GetMarkerReachedSignal(v147):Connect(v145);
        end;
    end;
    for v154, v155 in {
        LeftH = function() --[[ Line: 618 ]] --[[ Name: LeftH ]]
            -- upvalues: l_Victim_0 (copy), l_Debris_0 (ref), v12 (ref)
            local l_Feet_0 = script.Feet;
            local l_Position_0 = l_Victim_0.LeftFoot.Position;
            local v150 = l_Feet_0:Clone();
            v150.Parent = l_Debris_0;
            if l_Position_0 then
                v150.Position = l_Position_0;
            end;
            v12.Emit(v150);
            game:GetService("Debris"):AddItem(v150, 4);
        end, 
        RightH = function() --[[ Line: 619 ]] --[[ Name: RightH ]]
            -- upvalues: l_Victim_0 (copy), l_Debris_0 (ref), v12 (ref)
            local l_Feet_1 = script.Feet;
            local l_Position_1 = l_Victim_0.RightFoot.Position;
            local v153 = l_Feet_1:Clone();
            v153.Parent = l_Debris_0;
            if l_Position_1 then
                v153.Position = l_Position_1;
            end;
            v12.Emit(v153);
            game:GetService("Debris"):AddItem(v153, 4);
        end
    } do
        v83[#v83 + 1] = v91:GetMarkerReachedSignal(v154):Connect(v155);
    end;
    for v185, v186 in {
        Begin = {
            Punch_Hit = function() --[[ Line: 628 ]] --[[ Name: Punch_Hit ]]
                -- upvalues: l_Character_0 (copy), v12 (ref), l_TweenService_0 (ref), v47 (copy), v48 (copy), l_ColorCorrectionEffect_0 (copy), l_Lighting_0 (ref), v20 (ref)
                l_Character_0:SetAttribute("ForceNanomachines", 20);
                local v156 = script.FirstHit:Clone();
                v156.Parent = l_Character_0.HumanoidRootPart;
                v12.Emit(v156);
                for _, v158 in v156.Attachment_Slowness:GetChildren() do
                    l_TweenService_0:Create(v158, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        TimeScale = 0.1
                    }):Play();
                    task.delay(1.45, function() --[[ Line: 640 ]]
                        -- upvalues: l_TweenService_0 (ref), v158 (copy)
                        l_TweenService_0:Create(v158, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            TimeScale = 1
                        }):Play();
                    end);
                end;
                if v47 or v48 then
                    local l_l_ColorCorrectionEffect_0_1 = l_ColorCorrectionEffect_0;
                    task.defer(function() --[[ Line: 47 ]]
                        -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrectionEffect_0_1 (copy), l_Lighting_0 (ref)
                        local v160 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_l_ColorCorrectionEffect_0_1, v160, {
                            Saturation = -0.3, 
                            Contrast = 2
                        }):Play();
                        local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_2.Size = 0;
                        l_MenuBlur_2.Enabled = true;
                        local v162 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_2, v162, {
                            Size = 15
                        }):Play();
                    end);
                    v20.HUDShake({
                        Scale = 20, 
                        Damper = 0.09999999999999999
                    });
                end;
            end
        }, 
        Left = {
            Punch_Hit = function() --[[ Line: 659 ]] --[[ Name: Punch_Hit ]]
                -- upvalues: l_Character_0 (copy), v12 (ref), v47 (copy), v48 (copy), l_ColorCorrectionEffect_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v20 (ref)
                local v163 = script.FirstHit:Clone();
                v163.Parent = l_Character_0.HumanoidRootPart;
                v12.Emit(v163);
                if v47 or v48 then
                    local l_l_ColorCorrectionEffect_0_2 = l_ColorCorrectionEffect_0;
                    task.defer(function() --[[ Line: 47 ]]
                        -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrectionEffect_0_2 (copy), l_Lighting_0 (ref)
                        local v165 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_l_ColorCorrectionEffect_0_2, v165, {
                            Saturation = -0.3, 
                            Contrast = 2
                        }):Play();
                        local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_3.Size = 0;
                        l_MenuBlur_3.Enabled = true;
                        local v167 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_3, v167, {
                            Size = 15
                        }):Play();
                    end);
                    v20.HUDShake({
                        Scale = 20, 
                        Damper = 0.09999999999999999
                    });
                end;
            end, 
            Punch_Hit_1 = function() --[[ Line: 674 ]] --[[ Name: Punch_Hit_1 ]]
                -- upvalues: l_Character_0 (copy), v12 (ref), v47 (copy), v48 (copy), v20 (ref), l_ColorCorrectionEffect_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
                local v168 = script.FirstHit:Clone();
                v168.Parent = l_Character_0.HumanoidRootPart;
                v12.Emit(v168);
                if v47 or v48 then
                    v20.HUDShake({
                        Scale = 5, 
                        Damper = 0.09999999999999999
                    });
                    local l_l_ColorCorrectionEffect_0_3 = l_ColorCorrectionEffect_0;
                    task.defer(function() --[[ Line: 47 ]]
                        -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrectionEffect_0_3 (copy), l_Lighting_0 (ref)
                        local v170 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_l_ColorCorrectionEffect_0_3, v170, {
                            Saturation = -0.3, 
                            Contrast = 2
                        }):Play();
                        local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_4.Size = 0;
                        l_MenuBlur_4.Enabled = true;
                        local v172 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_4, v172, {
                            Size = 15
                        }):Play();
                    end);
                end;
            end, 
            Punch_Hit_2 = function() --[[ Line: 689 ]] --[[ Name: Punch_Hit_2 ]]
                -- upvalues: v47 (copy), v48 (copy), v20 (ref)
                if v47 or v48 then
                    v20.HUDShake({
                        Scale = 10, 
                        Damper = 0.09999999999999999
                    });
                end;
            end
        }, 
        Right = {
            Punch_Hit = function() --[[ Line: 701 ]] --[[ Name: Punch_Hit ]]
                -- upvalues: l_Character_0 (copy), v12 (ref)
                local v173 = script.FirstHit:Clone();
                v173.Parent = l_Character_0.HumanoidRootPart;
                v12.Emit(v173);
            end, 
            Punch_Final = function() --[[ Line: 707 ]] --[[ Name: Punch_Final ]]
                -- upvalues: l_Character_0 (copy), v12 (ref), v47 (copy), v48 (copy), l_ColorCorrectionEffect_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
                local v174 = script.FinalHit:Clone();
                v174.Parent = l_Character_0.HumanoidRootPart;
                v12.Emit(v174);
                if v47 or v48 then
                    local l_l_ColorCorrectionEffect_0_4 = l_ColorCorrectionEffect_0;
                    task.defer(function() --[[ Line: 47 ]]
                        -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrectionEffect_0_4 (copy), l_Lighting_0 (ref)
                        local v176 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_l_ColorCorrectionEffect_0_4, v176, {
                            Saturation = -0.3, 
                            Contrast = 2
                        }):Play();
                        local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_5.Size = 0;
                        l_MenuBlur_5.Enabled = true;
                        local v178 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_5, v178, {
                            Size = 15
                        }):Play();
                    end);
                end;
            end
        }, 
        Middle = {
            Barrage_Start = function() --[[ Line: 719 ]] --[[ Name: Barrage_Start ]]
                -- upvalues: v108 (ref), v109 (ref), v114 (copy), v112 (ref), v55 (copy), l_Character_0 (copy), v84 (copy), l_Victim_0 (copy)
                if v108 then
                    v108:Destroy();
                    v109:Destroy();
                    for _, v180 in v114 do
                        v180:Destroy();
                    end;
                    return;
                else
                    v112 = true;
                    v108 = script.BarrageVFX:Clone();
                    v108.Parent = v55:FindFirstChild("HumanoidRootPart") or l_Character_0.HumanoidRootPart;
                    table.insert(v84, v108);
                    v109 = script.BarrageLines:Clone();
                    v109.Parent = l_Character_0:FindFirstChild("HumanoidRootPart") or l_Victim_0.HumanoidRootPart;
                    v109.UpperTorso.Part1 = l_Character_0.UpperTorso;
                    table.insert(v84, v109);
                    for _, v182 in script.BarrageParticles:GetChildren() do
                        local v183 = v182:Clone();
                        v183.Parent = l_Character_0.UpperTorso;
                        table.insert(v84, v183);
                        table.insert(v114, v183);
                    end;
                    return;
                end;
            end
        }, 
        Final = {
            Grab = function() --[[ Line: 753 ]] --[[ Name: Grab ]]
                -- upvalues: v141 (ref), l_Victim_0 (copy), v12 (ref)
                v141 = 55;
                task.wait(0.1);
                local v184 = script.Grab:Clone();
                v184.Parent = l_Victim_0.Head;
                v12.Emit(v184);
            end
        }
    } do
        for v187, v188 in v186 do
            local v189 = #v83 + 1;
            local v190 = v185 .. "_" .. v187;
            v83[v189] = v91:GetMarkerReachedSignal(v190):Connect(v188);
        end;
    end;
    if v47 or v48 then
        v79 = l_ReplicatedStorage_0.Assets.FoVCamera:Clone();
        v79.Name = l_Character_0.Name .. "Camera";
        v79.Parent = l_Debris_0;
        local v191 = v44.StartCFrame * CFrame.new(0, -3, 0);
        v79:PivotTo(v191);
        v81 = script.Camera:Clone();
        v81.Parent = l_Debris_0;
        table.insert(v84, v81);
        local v192 = {
            Animator = v79.AnimationController.Animator, 
            AnimId = v28.Animations.Camera
        };
        v80 = l_AnimHelper_0:CreateAnim(v192);
        l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 793 ]]
            -- upvalues: l_CurrentCamera_0 (ref), v79 (ref), v141 (ref), v81 (ref)
            l_CurrentCamera_0.CFrame = v79.CamPart.CFrame;
            l_CurrentCamera_0.FieldOfView = v141 or math.min(math.abs((v79.FovPart.Position - v79.RootPart.Position).Y) + 30, 55);
            if v81 then
                v81.CFrame = l_CurrentCamera_0.CFrame;
                return;
            else
                return;
            end;
        end);
        v191 = nil;
        do
            local l_v191_0 = v191;
            for v203, v204 in {
                Lines = {
                    Begin = function() --[[ Line: 811 ]] --[[ Name: Begin ]]
                        -- upvalues: v38 (ref), v81 (ref)
                        v38(v81, true);
                    end, 
                    End = function() --[[ Line: 815 ]] --[[ Name: End ]]
                        -- upvalues: v38 (ref), v81 (ref)
                        task.wait(0.2);
                        v38(v81, false);
                    end
                }, 
                SideWay = {
                    Begin = function() --[[ Line: 823 ]] --[[ Name: Begin ]]
                        -- upvalues: l_v191_0 (ref), v38 (ref), v81 (ref), v12 (ref)
                        if not l_v191_0 then
                            l_v191_0 = true;
                        else
                            task.delay(0.4, function() --[[ Line: 827 ]]
                                -- upvalues: v38 (ref), v81 (ref)
                                v38(v81, true);
                                task.delay(0.5, function() --[[ Line: 830 ]]
                                    -- upvalues: v38 (ref), v81 (ref)
                                    v38(v81, false);
                                end);
                            end);
                        end;
                        for _, v196 in v81.SideWaysFinal:GetChildren() do
                            if v196:IsA("Beam") then
                                v196.Enabled = true;
                                v196.Transparency = NumberSequence.new(l_v191_0 and 1 or 1);
                                task.spawn(function() --[[ Line: 841 ]]
                                    -- upvalues: l_v191_0 (ref), v12 (ref), v196 (copy)
                                    local v197 = l_v191_0 and {
                                        0.5, 
                                        0.5
                                    } or {
                                        2.8
                                    };
                                    local v198 = l_v191_0 and {
                                        0.5, 
                                        0
                                    } or {
                                        0
                                    };
                                    for v199, v200 in ipairs(v198) do
                                        v12.TweenNumberSequence(v196.Transparency, NumberSequence.new(v200), 50, v197[v199], v196, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                                        if l_v191_0 then
                                            task.spawn(function() --[[ Line: 858 ]]
                                                -- upvalues: v12 (ref), v196 (ref), v197 (copy), v199 (copy)
                                                task.wait(0.4);
                                                v12.TweenNumberSequence(v196.Transparency, NumberSequence.new(1), 50, v197[v199], v196, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                                            end);
                                        end;
                                        if #v198 > 1 and v199 < #v198 then
                                            task.wait(v197[v199]);
                                        end;
                                    end;
                                end);
                            end;
                        end;
                    end, 
                    Instant = function() --[[ Line: 882 ]] --[[ Name: Instant ]]

                    end
                }, 
                SideWay2 = {
                    CameraRotation = function() --[[ Line: 888 ]] --[[ Name: CameraRotation ]]
                        -- upvalues: v38 (ref), v81 (ref)
                        task.delay(0.2, function() --[[ Line: 889 ]]
                            -- upvalues: v38 (ref), v81 (ref)
                            v38(v81, true);
                            task.delay(0.5, function() --[[ Line: 892 ]]
                                -- upvalues: v38 (ref), v81 (ref)
                                v38(v81, false);
                            end);
                        end);
                    end, 
                    Final = function() --[[ Line: 898 ]] --[[ Name: Final ]]
                        -- upvalues: v81 (ref), v12 (ref)
                        for _, v202 in v81.SideWaysFinal:GetChildren() do
                            if v202:IsA("Beam") then
                                v12.TweenNumberSequence(v202.Transparency, NumberSequence.new(0), 20, 0.2, v202, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                            end;
                        end;
                    end
                }
            } do
                for v205, v206 in v204 do
                    local v207 = #v83 + 1;
                    local v208 = v203 .. "_" .. v205;
                    v83[v207] = v80:GetMarkerReachedSignal(v208):Connect(v206);
                end;
            end;
            task.delay(v44.Time - 0.55, function() --[[ Line: 926 ]]
                -- upvalues: v74 (ref), v91 (ref), v90 (ref), v80 (ref), l_TweenService_0 (ref), l_Main_0 (ref), v78 (copy), l_Character_0 (copy), v88 (ref), v44 (copy), l_Victim_0 (copy), v20 (ref)
                if v74 then
                    return;
                else
                    v91:AdjustSpeed(0.01);
                    v90:AdjustSpeed(0.01);
                    v80:AdjustSpeed(0.01);
                    l_TweenService_0:Create(l_Main_0.White, v78, {
                        BackgroundTransparency = 0
                    }):Play();
                    l_Character_0:SetAttribute("ForceNanomachines", nil);
                    (function() --[[ Line: 936 ]] --[[ Name: ResetPosition ]]
                        -- upvalues: v88 (ref), l_Character_0 (ref), v44 (ref), l_Victim_0 (ref), v20 (ref)
                        if v88 then
                            return;
                        else
                            v88 = true;
                            l_Character_0:SetPrimaryPartCFrame(v44.StartCFrame * CFrame.Angles(0, 0, 0));
                            l_Victim_0:SetPrimaryPartCFrame(v44.StartCFrame * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5));
                            task.delay(0.016666666666666666, function() --[[ Line: 943 ]]
                                -- upvalues: l_Character_0 (ref), l_Victim_0 (ref), v20 (ref)
                                for _, v210 in {
                                    l_Character_0, 
                                    l_Victim_0, 
                                    v20.GetWeldCharacter(l_Character_0), 
                                    v20.GetWeldCharacter(l_Victim_0)
                                } do
                                    for _, v212 in v210:GetDescendants() do
                                        if v212:IsA("BasePart") then
                                            local l_v212_Attribute_0 = v212:GetAttribute("PreviousCollisionGroup");
                                            if l_v212_Attribute_0 then
                                                v212.CollisionGroup = l_v212_Attribute_0;
                                                v212:SetAttribute("PreviousCollisionGroup", nil);
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
                    return;
                end;
            end);
            task.wait(v44.Time);
            v103();
            v20.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v20.HUDShake({
                Scale = 20, 
                Damper = 0.07777777777777778
            });
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v75, {
                ImageTransparency = 1
            }):Play();
        end;
    end;
end;
return v28;