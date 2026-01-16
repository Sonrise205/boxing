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
        Character = 98935188881641, 
        Victim = 129452516976109, 
        Camera = 110289965315829
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
    -- upvalues: l_LocalPlayer_0 (copy), l_Players_0 (copy), l_Debris_0 (copy), v21 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_TweenService_0 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), l_CurrentCamera_0 (copy), v29 (copy), l_AnimHelper_0 (copy), v13 (copy)
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
    local _ = v21.GetWeldCharacter(l_Victim_0);
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
    task.delay(1.1, function() --[[ Line: 144 ]]
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
        DirectCopy = script["La Passion Ahh Song"], 
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
        task.delay(2, function() --[[ Line: 169 ]]
            -- upvalues: v63 (ref)
            v63:Play();
        end);
    end);
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
    local v75 = nil;
    local v76 = nil;
    local v77 = {};
    local v78 = {};
    local v79 = nil;
    local v80 = nil;
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    v80 = l_Character_0:GetAttribute("CachedLighting");
    local v85 = false;
    local v86 = false;
    local v87 = script.MainCero:Clone();
    local function v97() --[[ Line: 215 ]] --[[ Name: cleanup ]]
        -- upvalues: v65 (ref), v77 (copy), l_RunService_0 (ref), v73 (ref), v86 (ref), l_Victim_0 (copy), l_Character_0 (copy), v71 (ref), v74 (ref), v75 (ref), l_Humanoid_1 (copy), v61 (copy), v82 (ref), v63 (copy), l_TweenService_0 (ref), v70 (ref), v72 (ref), v81 (ref), v78 (copy), v87 (copy), v83 (ref), v84 (ref), l_Lighting_0 (ref), v79 (ref), v38 (copy), v39 (copy), l_ColorCorrection_0 (copy), l_ClockTime_0 (copy), l_ReplicatedStorage_0 (ref), l_Main_0 (ref), v66 (copy)
        if v65 then
            return;
        else
            v65 = true;
            for _, v89 in v77 do
                v89:Disconnect();
            end;
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            v73.Value = "";
            v86 = true;
            l_Victim_0.PrimaryPart.Anchored = false;
            l_Character_0.PrimaryPart.Anchored = false;
            if v71 then
                v71:Stop(0.01);
            end;
            if v74 then
                v74:Stop();
            end;
            if v75 then
                v75:Stop();
            end;
            for _, v91 in l_Humanoid_1:GetPlayingAnimationTracks() do
                v91:Stop();
            end;
            if v61 then
                v61:Destroy();
            end;
            if v82 then
                v82:Destroy();
            end;
            if v63 then
                l_TweenService_0:Create(v63, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Volume = 0
                }):Play();
                task.delay(1, function() --[[ Line: 261 ]]
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
            if v81 then
                v81:Destroy();
            end;
            for _, v93 in v78 do
                v93:Destroy();
            end;
            if v87 then
                v87:Destroy();
            end;
            if v83 then
                v83:Destroy();
            end;
            if v84 then
                v84:Destroy();
            end;
            local l_CachedAtmosphere_0 = l_Lighting_0:FindFirstChild("CachedAtmosphere");
            if l_CachedAtmosphere_0 then
                for _, v96 in l_CachedAtmosphere_0:GetChildren() do
                    v96.Parent = l_Lighting_0;
                end;
                l_CachedAtmosphere_0:Destroy();
            end;
            if v79 then
                v79:Destroy();
            end;
            if v38 or v39 then
                l_TweenService_0:Create(l_ColorCorrection_0, TweenInfo.new(1), {
                    Saturation = 0, 
                    Contrast = 0, 
                    Brightness = 0, 
                    TintColor = Color3.new(1, 1, 1)
                }):Play();
                l_Lighting_0.ClockTime = l_ClockTime_0;
                l_ReplicatedStorage_0.Events.RefreshMapLighting:Fire();
                l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v66, {
                    ImageTransparency = 1
                }):Play();
                v73.Value = "";
            end;
            return;
        end;
    end;
    v77[#v77 + 1] = l_Character_0.AncestryChanged:Connect(function() --[[ Line: 325 ]]
        -- upvalues: l_Character_0 (copy), v97 (copy)
        task.wait(0.1);
        if l_Character_0.Parent == nil then
            v97();
        end;
    end);
    v77[#v77 + 1] = l_Victim_0.AncestryChanged:Connect(function() --[[ Line: 332 ]]
        -- upvalues: l_Victim_0 (copy), v97 (copy)
        task.wait(0.1);
        if l_Victim_0.Parent == nil then
            v97();
        end;
    end);
    if v38 or v39 then
        task.defer(function() --[[ Line: 340 ]]
            -- upvalues: l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v56 (copy)
            l_ColorCorrection_0.Saturation = 0;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v98 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v98, {
                Saturation = -0.7, 
                Contrast = 0.5
            }):Play();
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v100 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v100, {
                Size = 10
            }):Play();
            local v101 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v101, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.delay(0.4, function() --[[ Line: 358 ]]
                -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v101 (copy)
                l_TweenService_0:Create(l_Lighting_0, v101, {
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
    local v102 = v21.GetAtmosphere();
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
        task.delay(1, function() --[[ Line: 387 ]]
            -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v69 (copy)
            l_TweenService_0:Create(l_Lighting_0, v69, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
        end);
    end;
    local l_Volume_2 = v61.Volume;
    v61.Volume = 0;
    task.delay(0.35, function() --[[ Line: 395 ]]
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
            local v105 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v38 or v39) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v38 and not v39 then
                v105.Volume = v105.Volume / 5;
            end;
        end;
    end);
    task.wait(0.5);
    v73 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    if v38 or v39 then
        v73.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 45;
    end;
    local v106 = {
        Animator = v43, 
        AnimId = v29.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v107 = {
        Animator = v45, 
        AnimId = v29.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v106);
    l_AnimHelper_0:CreateAnim(v107);
    v74 = l_AnimHelper_0:CreateAnim(v106);
    v75 = l_AnimHelper_0:CreateAnim(v107);
    if v38 or v39 then
        v73.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 41;
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v66, {
            ImageTransparency = 1
        }):Play();
    end;
    v77[#v77 + 1] = v74:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 462 ]]
        -- upvalues: v65 (ref), v81 (ref), v38 (copy), v39 (copy), v79 (ref), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v72 (ref), v46 (copy), v13 (ref), v83 (ref), l_Character_0 (copy), l_ClockTime_0 (copy), l_ReplicatedStorage_0 (ref), v84 (ref), v87 (copy)
        if v65 then
            return;
        else
            if v81 then
                v81:Destroy();
            end;
            if v38 or v39 then
                v79.Brightness = 0;
                v79.Contrast = 0;
                local l_l_ColorCorrection_0_0 = l_ColorCorrection_0;
                local l_l_l_ColorCorrection_0_0_0 = l_l_ColorCorrection_0_0 --[[ copy: 0 -> 11 ]];
                task.defer(function() --[[ Line: 48 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_l_ColorCorrection_0_0_0 (copy), l_Lighting_0 (ref)
                    local v110 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_l_ColorCorrection_0_0_0, v110, {
                        Saturation = -0.3, 
                        Contrast = 7
                    }):Play();
                    local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_2.Size = 0;
                    l_MenuBlur_2.Enabled = true;
                    local v112 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_2, v112, {
                        Size = 30
                    }):Play();
                end);
                v21.HUDShake({
                    Scale = 10, 
                    Damper = 0.09999999999999999
                });
                for _, v114 in v72.SideWaysFinal:GetDescendants() do
                    if v114:IsA("Beam") then
                        l_TweenService_0:Create(v114, TweenInfo.new(0), {
                            Width0 = 0, 
                            Width1 = 0
                        }):Play();
                    end;
                end;
                l_l_ColorCorrection_0_0 = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(0.5, 1), 
                    NumberSequenceKeypoint.new(1, 1)
                });
                for _, v116 in v46:GetDescendants() do
                    if v116.Name == "Beams" then
                        for _, v118 in v116:GetChildren() do
                            if v118:IsA("Beam") then
                                task.spawn(function() --[[ Line: 495 ]]
                                    -- upvalues: v13 (ref), v118 (copy), l_l_ColorCorrection_0_0 (copy)
                                    v13.TweenNumberSequence(v118.Transparency, l_l_ColorCorrection_0_0, 50, 1, v118, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                                end);
                            end;
                        end;
                    elseif v116:IsA("ParticleEmitter") then
                        v116.Enabled = false;
                    end;
                end;
                task.spawn(function() --[[ Line: 514 ]]
                    -- upvalues: v21 (ref)
                    v21.CameraShake({
                        Preset = "HardHit", 
                        WaitTime = 1, 
                        Fade = 2, 
                        FoVMult = 6
                    });
                end);
                v21.HUDShake({
                    Scale = 10, 
                    Damper = 0.09999999999999999
                });
            end;
            task.defer(function() --[[ Line: 530 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.1
                });
            end);
            v83 = script.FinalShot:Clone();
            v83.Parent = workspace.Debris;
            v83.CFrame = CFrame.new(l_Character_0.UpperTorso.Position) * CFrame.Angles(l_Character_0.HumanoidRootPart.CFrame:ToOrientation()) * CFrame.Angles(0, 3.141592653589793, 0);
            v13.Emit(v83);
            game.Debris:AddItem(v83, 7);
            if l_Lighting_0:FindFirstChild("CachedAtmosphere") then
                for _, v120 in l_Lighting_0:FindFirstChild("CachedAtmosphere"):GetChildren() do
                    v120.Parent = l_Lighting_0;
                end;
                l_Lighting_0:FindFirstChild("CachedAtmosphere"):Destroy();
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
            l_ReplicatedStorage_0.Events.RefreshMapLighting:Fire();
            if v84 then
                v84:Destroy();
            end;
            local v121 = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1), 
                NumberSequenceKeypoint.new(0.5, 1), 
                NumberSequenceKeypoint.new(1, 1)
            });
            for _, v123 in (v83:GetDescendants()) do
                if v123:IsA("Beam") then
                    v123.Enabled = true;
                    task.spawn(function() --[[ Line: 576 ]]
                        -- upvalues: v123 (copy), l_TweenService_0 (ref), v13 (ref), v121 (copy)
                        local l_Width1_0 = v123.Width1;
                        v123.Width1 = 0;
                        l_TweenService_0:Create(v123, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            TextureSpeed = 2, 
                            Width1 = l_Width1_0
                        }):Play();
                        v13.TweenNumberSequence(v123.Transparency, v121, 50, 1.5, v123, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                    end);
                end;
            end;
            local _ = task.spawn(function() --[[ Line: 596 ]]
                -- upvalues: v65 (ref), v87 (ref), l_TweenService_0 (ref)
                local v125 = false;
                task.delay(0.6, function() --[[ Line: 599 ]]
                    -- upvalues: v125 (ref)
                    v125 = true;
                end);
                while not v125 and not v65 do
                    local v126 = script.Light:Clone();
                    v126.Parent = workspace.Debris;
                    v126.CFrame = v87.HumanoidRootPart.CFrame + v87.HumanoidRootPart.CFrame.LookVector * -50;
                    local v127 = v126.Size * 5;
                    v126.Size = Vector3.new(0, 0, 0, 0);
                    l_TweenService_0:Create(v126, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true), {
                        Size = v127
                    }):Play();
                    local v128 = script.Dark:Clone();
                    v128.Parent = workspace.Debris;
                    v128.CFrame = v126.CFrame;
                    l_TweenService_0:Create(v128, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true), {
                        Size = v127 * 1.1
                    }):Play();
                    game.Debris:AddItem(v126, 0.2);
                    game.Debris:AddItem(v128, 0.2);
                    task.wait(0.1);
                end;
            end);
            return;
        end;
    end);
    v77[#v77 + 1] = v74:GetMarkerReachedSignal("EndingEmit"):Connect(function() --[[ Line: 633 ]]
        -- upvalues: v65 (ref), v86 (ref), v81 (ref), l_Victim_0 (copy), v13 (ref), v78 (copy), l_TweenService_0 (ref), v38 (copy), v39 (copy), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), v21 (ref), v46 (copy), v79 (ref), v72 (ref), v76 (ref)
        if v65 then
            return;
        else
            v86 = true;
            v81 = script.Final:Clone();
            v81.Parent = workspace.Debris;
            v81.CFrame = l_Victim_0.UpperTorso.CFrame;
            v13.Emit(v81);
            table.insert(v78, v81);
            for _, v131 in v81.Attachment:GetChildren() do
                l_TweenService_0:Create(v131, TweenInfo.new(0.3), {
                    TimeScale = 0
                }):Play();
            end;
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
            end;
            task.delay(3.5, function() --[[ Line: 653 ]]
                -- upvalues: v65 (ref), v38 (ref), v39 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v46 (ref), v13 (ref), v79 (ref), v72 (ref)
                if v65 then
                    return;
                else
                    if v38 or v39 then
                        local l_l_ColorCorrection_0_2 = l_ColorCorrection_0;
                        task.defer(function() --[[ Line: 48 ]]
                            -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrection_0_2 (copy), l_Lighting_0 (ref)
                            local v137 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                            l_TweenService_0:Create(l_l_ColorCorrection_0_2, v137, {
                                Saturation = -0.3, 
                                Contrast = 7
                            }):Play();
                            local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                            l_MenuBlur_4.Size = 0;
                            l_MenuBlur_4.Enabled = true;
                            local v139 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                            l_TweenService_0:Create(l_MenuBlur_4, v139, {
                                Size = 30
                            }):Play();
                        end);
                        v21.HUDShake({
                            Scale = 10, 
                            Damper = 0.09999999999999999
                        });
                        task.spawn(function() --[[ Line: 662 ]]
                            -- upvalues: v21 (ref)
                            v21.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.3, 
                                Fade = 0.8, 
                                FoVMult = 2
                            });
                        end);
                        task.delay(0.7, function() --[[ Line: 672 ]]
                            -- upvalues: v65 (ref), v21 (ref), v46 (ref), v13 (ref), v79 (ref), v72 (ref), l_TweenService_0 (ref)
                            if v65 then
                                return;
                            else
                                task.spawn(function() --[[ Line: 674 ]]
                                    -- upvalues: v21 (ref)
                                    v21.CameraShake({
                                        Preset = "HardHit", 
                                        WaitTime = 2, 
                                        Fade = 0.8, 
                                        FoVMult = 4
                                    });
                                end);
                                if v46:FindFirstChild("RightGun") then
                                    v13.Emit(v46:FindFirstChild("RightGun").End.BigCharge);
                                end;
                                v79.Brightness = -0.05;
                                v79.Contrast = 0.3;
                                for _, v141 in v72.SideWaysFinal:GetDescendants() do
                                    if v141:IsA("Beam") then
                                        v141:SetAttribute("Width0", v141.Width0);
                                        v141:SetAttribute("Width1", v141.Width1);
                                        v141.Enabled = true;
                                        v141.Width0 = 0;
                                        v141.Width1 = 0;
                                        l_TweenService_0:Create(v141, TweenInfo.new(0.4), {
                                            Width0 = v141:GetAttribute("Width0"), 
                                            Width1 = v141:GetAttribute("Width1")
                                        }):Play();
                                    end;
                                end;
                                return;
                            end;
                        end);
                    end;
                    return;
                end;
            end);
            task.defer(function() --[[ Line: 705 ]]
                -- upvalues: v76 (ref), v21 (ref)
                if v76 then
                    for _, v143 in v76:GetDescendants() do
                        if v143:IsA("Beam") then
                            v143.Enabled = false;
                        end;
                    end;
                end;
                v21.HUDShake({
                    Scale = 10, 
                    Damper = 0.09999999999999999
                });
                v21.CreateImpactFrame({
                    Time = 0.03333333333333333
                });
            end);
            task.spawn(function() --[[ Line: 724 ]]
                -- upvalues: v21 (ref)
                v21.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.3, 
                    Fade = 0.8, 
                    FoVMult = 2
                });
            end);
            return;
        end;
    end);
    local function _(v144, v145, v146) --[[ Line: 736 ]] --[[ Name: createFeetEffect ]]
        -- upvalues: v13 (ref)
        local v147 = v144:Clone();
        v147.Parent = workspace.Debris;
        if v145 then
            v147.Position = v145;
        end;
        v13.Emit(v147);
        game:GetService("Debris"):AddItem(v147, v146);
        return v147;
    end;
    for v155, v156 in {
        Left = function() --[[ Line: 750 ]] --[[ Name: Left ]]
            -- upvalues: l_Character_0 (copy), v13 (ref)
            local l_Feet_0 = script.Feet;
            local l_Position_0 = l_Character_0.LeftFoot.Position;
            local v151 = l_Feet_0:Clone();
            v151.Parent = workspace.Debris;
            if l_Position_0 then
                v151.Position = l_Position_0;
            end;
            v13.Emit(v151);
            game:GetService("Debris"):AddItem(v151, 4);
        end, 
        Right = function() --[[ Line: 751 ]] --[[ Name: Right ]]
            -- upvalues: l_Character_0 (copy), v13 (ref)
            local l_Feet_1 = script.Feet;
            local l_Position_1 = l_Character_0.RightFoot.Position;
            local v154 = l_Feet_1:Clone();
            v154.Parent = workspace.Debris;
            if l_Position_1 then
                v154.Position = l_Position_1;
            end;
            v13.Emit(v154);
            game:GetService("Debris"):AddItem(v154, 4);
        end
    } do
        v77[#v77 + 1] = v74:GetMarkerReachedSignal(v155):Connect(v156);
    end;
    if v38 or v39 then
        v70 = l_ReplicatedStorage_0.Assets.FoVCamera:Clone();
        v70.Name = l_Character_0.Name .. "Camera";
        v70.Parent = l_Debris_0;
        local v157 = v35.StartCFrame * CFrame.new(0, -3, 0);
        v70:PivotTo(v157);
        v72 = script.Camera:Clone();
        v72.Parent = l_Debris_0;
        v76 = v72.SideWays;
        local v158 = {
            Animator = v70.AnimationController.Animator, 
            AnimId = v29.Animations.Camera
        };
        v71 = l_AnimHelper_0:CreateAnim(v158);
        v157 = false;
        v77[#v77 + 1] = v71:GetMarkerReachedSignal("*Dramatic*"):Connect(function() --[[ Line: 781 ]]
            -- upvalues: v157 (ref), l_Character_0 (copy), v13 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref), v38 (copy), v39 (copy), v84 (ref), l_Debris_0 (ref), v78 (copy), v79 (ref), v102 (copy), l_ColorCorrection_0 (copy), v46 (copy), v82 (ref), v21 (ref), v65 (ref)
            local _ = task.spawn(function() --[[ Line: 782 ]]
                -- upvalues: v157 (ref), l_Character_0 (ref), v13 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref), v38 (ref), v39 (ref), v84 (ref), l_Debris_0 (ref), v78 (ref), v79 (ref), v102 (ref), l_ColorCorrection_0 (ref), v46 (ref), v82 (ref), v21 (ref), v65 (ref)
                if v157 then
                    return;
                else
                    v157 = true;
                    local v159 = script.Eyes:Clone();
                    v159.Parent = l_Character_0.Head;
                    v13.Emit(v159);
                    game.Debris:AddItem(v159, 1);
                    local l_BloomEffect_0 = Instance.new("BloomEffect");
                    l_BloomEffect_0.Parent = l_Lighting_0;
                    l_BloomEffect_0.Intensity = 8;
                    l_BloomEffect_0.Threshold = 0.1;
                    game.Debris:AddItem(l_BloomEffect_0, 2);
                    l_TweenService_0:Create(l_BloomEffect_0, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Intensity = 0, 
                        Threshold = 1
                    }):Play();
                    if v38 or v39 then
                        v84 = script.Domain:Clone();
                        v84.Parent = l_Debris_0;
                        v84.CFrame = l_Character_0.HumanoidRootPart.CFrame;
                        l_TweenService_0:Create(v84, TweenInfo.new(1), {
                            Transparency = 0
                        }):Play();
                        table.insert(v78, v84);
                        v79 = Instance.new("ColorCorrectionEffect");
                        v79.Name = "CoyoteColorCorrection";
                        v79.Parent = l_Lighting_0;
                        if v102 then
                            local l_Folder_0 = Instance.new("Folder");
                            l_Folder_0.Name = "CachedAtmosphere";
                            l_Folder_0.Parent = l_Lighting_0;
                            v102.Parent = l_Folder_0;
                        end;
                        l_TweenService_0:Create(v79, TweenInfo.new(0.01), {
                            Contrast = 0.1, 
                            Saturation = 0.3, 
                            TintColor = Color3.fromRGB(255, 252, 224)
                        }):Play();
                        v84.Color = Color3.new(0.494118, 0.729412, 1);
                        l_Lighting_0.FogColor = Color3.new(0.494118, 0.729412, 1);
                        l_TweenService_0:Create(v84, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            Color = Color3.new(0.0627451, 0.0941176, 0.129412)
                        }):Play();
                        l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            FogColor = Color3.new(0.0627451, 0.0941176, 0.129412)
                        }):Play();
                        l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0.1), {
                            Ambient = Color3.new(0, 0, 0), 
                            OutdoorAmbient = Color3.new(0.435294, 0.568627, 0.686275), 
                            EnvironmentDiffuseScale = 0.1, 
                            EnvironmentSpecularScale = 0.4, 
                            Brightness = 0, 
                            FogEnd = 100, 
                            FogStart = 0
                        }):Play();
                    elseif v38 or v39 then
                        local l_l_ColorCorrection_0_3 = l_ColorCorrection_0;
                        local l_l_l_ColorCorrection_0_3_0 = l_l_ColorCorrection_0_3 --[[ copy: 2 -> 18 ]];
                        task.defer(function() --[[ Line: 48 ]]
                            -- upvalues: l_TweenService_0 (ref), l_l_l_ColorCorrection_0_3_0 (copy), l_Lighting_0 (ref)
                            local v164 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                            l_TweenService_0:Create(l_l_l_ColorCorrection_0_3_0, v164, {
                                Saturation = -0.3, 
                                Contrast = 7
                            }):Play();
                            local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
                            l_MenuBlur_5.Size = 0;
                            l_MenuBlur_5.Enabled = true;
                            local v166 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                            l_TweenService_0:Create(l_MenuBlur_5, v166, {
                                Size = 30
                            }):Play();
                        end);
                    end;
                    local v167 = script.Aura:Clone();
                    for _, v169 in v46:GetChildren() do
                        if v169:IsA("BasePart") then
                            for _, v171 in v167.Character:GetChildren() do
                                if v171.Name == v169.Name then
                                    for _, v173 in v171:GetChildren() do
                                        table.insert(v78, v173);
                                        v173.Parent = v169;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    for _, v175 in v78 do
                        if v175.Name == "Beams" then
                            for _, v177 in v175:GetChildren() do
                                if v177:IsA("Beam") then
                                    v177:SetAttribute("TransparencyData", v177.Transparency);
                                end;
                            end;
                        end;
                    end;
                    for _, v179 in v46:GetDescendants() do
                        if v179.Name == "Beams" then
                            for _, v181 in v179:GetChildren() do
                                if v181:IsA("Beam") then
                                    task.spawn(function() --[[ Line: 880 ]]
                                        -- upvalues: v13 (ref), v181 (copy)
                                        v13.TweenNumberSequence(v181.Transparency, v181:GetAttribute("TransparencyData"), 50, 0.1, v181, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                                    end);
                                end;
                            end;
                        end;
                    end;
                    local l_Floor_0 = v167.Floor;
                    l_Floor_0.Parent = l_Debris_0;
                    l_Floor_0.HumanoidRootPart.Part1 = v46.HumanoidRootPart;
                    table.insert(v78, l_Floor_0);
                    task.spawn(function() --[[ Line: 903 ]]
                        -- upvalues: v82 (ref), v13 (ref), l_Character_0 (ref), v21 (ref), v65 (ref), l_Lighting_0 (ref), v84 (ref)
                        task.wait(3.3333333333333335);
                        local v183 = false;
                        v82 = v13.createHighlight(l_Character_0, Color3.new(0, 0, 0), 0, 1, 6);
                        v21.HUDShake({
                            Scale = 10, 
                            Damper = 0.09999999999999999
                        });
                        v21.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 3, 
                            Fade = 0.8, 
                            FoVMult = 7
                        });
                        task.delay(0.3, function() --[[ Line: 923 ]]
                            -- upvalues: v183 (ref)
                            v183 = true;
                        end);
                        while not v183 and not v65 do
                            v21.CreateImpactFrame({
                                Time = 0.016666666666666666
                            });
                            l_Lighting_0.FogColor = Color3.new(0.156863, 0.227451, 0.317647);
                            v84.Color = Color3.new(0.156863, 0.227451, 0.317647);
                            v82.FillColor = Color3.new(0, 0, 0);
                            task.wait(0.03);
                            v82.FillColor = Color3.new(1, 1, 1);
                            l_Lighting_0.FogColor = Color3.new(0.0784314, 0.113725, 0.156863);
                            v84.Color = Color3.new(0.0784314, 0.113725, 0.156863);
                            task.wait(0.03);
                        end;
                        v82:Destroy();
                    end);
                    return;
                end;
            end);
            if v38 or v39 then
                v21.HUDShake({
                    Scale = 10, 
                    Damper = 0.09999999999999999
                });
                task.spawn(function() --[[ Line: 954 ]]
                    -- upvalues: v21 (ref)
                    v21.CameraShake({
                        Preset = "HardHit", 
                        WaitTime = 0.3, 
                        Fade = 0.8, 
                        FoVMult = 2
                    });
                end);
            end;
        end);
        v77[#v77 + 1] = v71:GetMarkerReachedSignal("Start"):Connect(function() --[[ Line: 966 ]]
            -- upvalues: v65 (ref), v38 (copy), v39 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v87 (copy), l_Character_0 (copy), v72 (ref), v86 (ref), v84 (ref), v13 (ref)
            if v65 then
                return;
            else
                if v38 or v39 then
                    local l_l_ColorCorrection_0_4 = l_ColorCorrection_0;
                    local l_l_l_ColorCorrection_0_4_0 = l_l_ColorCorrection_0_4 --[[ copy: 0 -> 5 ]];
                    task.defer(function() --[[ Line: 48 ]]
                        -- upvalues: l_TweenService_0 (ref), l_l_l_ColorCorrection_0_4_0 (copy), l_Lighting_0 (ref)
                        local v187 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_l_l_ColorCorrection_0_4_0, v187, {
                            Saturation = -0.3, 
                            Contrast = 7
                        }):Play();
                        local l_MenuBlur_6 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_6.Size = 0;
                        l_MenuBlur_6.Enabled = true;
                        local v189 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_6, v189, {
                            Size = 30
                        }):Play();
                    end);
                end;
                v87.Parent = workspace.Debris;
                v87:PivotTo(CFrame.new(l_Character_0.UpperTorso.Position) * CFrame.Angles(l_Character_0.HumanoidRootPart.CFrame:ToOrientation()) * CFrame.Angles(0, 3.141592653589793, 0));
                for _, v191 in v72.SideWays:GetDescendants() do
                    if v191:IsA("Beam") then
                        v191.Enabled = true;
                    end;
                end;
                local _ = task.spawn(function() --[[ Line: 982 ]]
                    -- upvalues: v86 (ref), v65 (ref), v87 (ref), l_TweenService_0 (ref)
                    while not v86 and not v65 do
                        local v192 = script.Light:Clone();
                        v192.Parent = workspace.Debris;
                        v192.CFrame = v87.HumanoidRootPart.CFrame + v87.HumanoidRootPart.CFrame.LookVector * -20 + Vector3.new(0, math.random(-7, 7), math.random(-7, 7));
                        local v193 = math.random(2.5, 3.5);
                        local v194 = v192.Size * v193;
                        v192.Size = Vector3.new(0, 0, 0, 0);
                        l_TweenService_0:Create(v192, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true), {
                            Size = v194
                        }):Play();
                        local v195 = script.Dark:Clone();
                        v195.Parent = workspace.Debris;
                        v195.CFrame = v192.CFrame;
                        l_TweenService_0:Create(v195, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true), {
                            Size = v194 * 1.1
                        }):Play();
                        game.Debris:AddItem(v192, 0.2);
                        game.Debris:AddItem(v195, 0.2);
                        task.wait();
                    end;
                end);
                local _ = task.spawn(function() --[[ Line: 1013 ]]
                    -- upvalues: v86 (ref), v65 (ref), l_Lighting_0 (ref), v84 (ref)
                    while not v86 and not v65 do
                        l_Lighting_0.FogColor = Color3.new(0.156863, 0.227451, 0.317647);
                        v84.Color = Color3.new(0.156863, 0.227451, 0.317647);
                        task.wait(0.04);
                        l_Lighting_0.FogColor = Color3.new(0.0784314, 0.113725, 0.156863);
                        v84.Color = Color3.new(0.0784314, 0.113725, 0.156863);
                        task.wait(0.04);
                    end;
                end);
                v13.Emit(v87);
                return;
            end;
        end);
        local v198 = 0;
        l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 1028 ]]
            -- upvalues: l_CurrentCamera_0 (ref), v70 (ref), v72 (ref), v198 (ref), l_Character_0 (copy)
            l_CurrentCamera_0.CFrame = v70.CamPart.CFrame;
            l_CurrentCamera_0.FieldOfView = math.abs((v70.FovPart.Position - v70.RootPart.Position).Y);
            if v72 then
                v72.CFrame = l_CurrentCamera_0.CFrame;
            end;
            v198 = v198 + 1;
            if v198 % 10 ~= 0 then
                return;
            elseif not l_Character_0 or not l_Character_0.PrimaryPart then
                return;
            else
                v70:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.new(0, -3, 0));
                return;
            end;
        end);
        task.delay(v35.Time - 0.55 - 0.5, function() --[[ Line: 1043 ]]
            -- upvalues: v65 (ref), l_TweenService_0 (ref), l_Main_0 (ref), v69 (copy)
            if v65 then
                return;
            else
                l_TweenService_0:Create(l_Main_0.White, v69, {
                    BackgroundTransparency = 0
                }):Play();
                return;
            end;
        end);
        task.wait(v35.Time - 0.5);
        if v65 then
            return;
        else
            (function() --[[ Line: 1052 ]] --[[ Name: ResetPosition ]]
                -- upvalues: v85 (ref), l_Character_0 (copy), v35 (copy), l_Victim_0 (copy), v21 (ref)
                if v85 then
                    return;
                else
                    v85 = true;
                    l_Character_0:SetPrimaryPartCFrame(v35.StartCFrame * CFrame.Angles(0, 0, 0));
                    l_Victim_0:SetPrimaryPartCFrame(v35.StartCFrame * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5));
                    task.delay(0.016666666666666666, function() --[[ Line: 1059 ]]
                        -- upvalues: l_Character_0 (ref), l_Victim_0 (ref), v21 (ref)
                        for _, v201 in {
                            l_Character_0, 
                            l_Victim_0, 
                            v21.GetWeldCharacter(l_Character_0), 
                            v21.GetWeldCharacter(l_Victim_0)
                        } do
                            for _, v203 in v201:GetDescendants() do
                                if v203:IsA("BasePart") then
                                    local l_v203_Attribute_0 = v203:GetAttribute("PreviousCollisionGroup");
                                    if l_v203_Attribute_0 then
                                        v203.CollisionGroup = l_v203_Attribute_0;
                                        v203:SetAttribute("PreviousCollisionGroup", nil);
                                    end;
                                end;
                            end;
                        end;
                    end);
                    return;
                end;
            end)();
            v97();
            if v65 then
                return;
            else
                v21.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.2, 
                    Fade = 1
                });
                v21.HUDShake({
                    Scale = 20, 
                    Damper = 0.07777777777777778
                });
                l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v66, {
                    ImageTransparency = 1
                }):Play();
                --[[ close >= 54 ]]
            end;
        end;
    end;
end;
return v29;