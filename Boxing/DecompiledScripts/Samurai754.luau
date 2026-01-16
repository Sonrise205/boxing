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
local l_Debris_0 = workspace:WaitForChild("Debris");
local _ = require(l_ReplicatedStorage_0:WaitForChild("Bezier"));
local _ = require(l_Modules_0:WaitForChild("RayHelper"));
local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
local v15 = require(l_Modules_0.Cutscene.Utilities);
local _ = require(l_Modules_0.Cutscene.Cutscene);
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local l_camShake_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local l_Parent_0 = script.Parent.Parent;
local v23 = require(l_Parent_0);
local _ = Random.new();
local function _(v25, v26, v27) --[[ Line: 35 ]] --[[ Name: Lerp ]]
    return v25 + (v26 - v25) * v27;
end;
local v29 = {};
local v30 = RaycastParams.new();
v30.FilterType = Enum.RaycastFilterType.Exclude;
v30.FilterDescendantsInstances = {
    l_Debris_0, 
    l_Workspace_0.Live
};
v29.Animations = {
    Character = 125788081154968, 
    Victim = 80804666784448, 
    Camera = 126343856820310, 
    SecondCharacter = 121413995372703, 
    SecondVictim = 123550074864638, 
    SecondCamera = 116527211948882
};
v29.CameraRig = script.Cam;
v29.Use = function(v31) --[[ Line: 54 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v23 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Debris_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), v29 (copy), l_AnimHelper_0 (copy), v15 (copy), v30 (copy), l_RunService_0 (copy), l_Modules_0 (copy), l_camShake_0 (copy)
    local l_Character_0 = v31.Character;
    local l_Victim_0 = v31.Victim;
    local v34 = l_LocalPlayer_0.Character == l_Character_0;
    local v35 = l_LocalPlayer_0.Character == l_Victim_0;
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v37 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v39 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    for _, v41 in (v37:GetPlayingAnimationTracks()) do
        if v41.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_0 = v41.Speed;
            v41:AdjustSpeed(l_Speed_0 / 4);
            task.delay(2, function() --[[ Line: 76 ]]
                -- upvalues: v41 (copy), l_Speed_0 (copy)
                v41:AdjustSpeed(l_Speed_0);
            end);
        end;
    end;
    for _, v44 in (v39:GetPlayingAnimationTracks()) do
        if v44.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_1 = v44.Speed;
            v44:AdjustSpeed(l_Speed_1 / 4);
            task.delay(2, function() --[[ Line: 88 ]]
                -- upvalues: v44 (copy), l_Speed_1 (copy)
                v44:AdjustSpeed(l_Speed_1);
            end);
        end;
    end;
    task.defer(function() --[[ Line: 93 ]]
        -- upvalues: v34 (copy), v35 (copy), v23 (ref), l_Main_0 (ref)
        if v34 or v35 then
            v23.StatusFrame(v35, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v46 = l_Parent_0.UltimateStart:Clone();
    v46.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v46.Parent = l_Debris_0;
    task.delay(20, function() --[[ Line: 103 ]]
        -- upvalues: v46 (copy)
        if v46 then
            v46:Destroy();
        end;
    end);
    local v47 = nil;
    if v35 or v34 then
        v47 = script.ImpactFrames:Clone();
        v47.Parent = l_LocalPlayer_0.PlayerGui;
    end;
    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
    local _ = {};
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    task.wait(0.5);
    task.defer(function() --[[ Line: 122 ]]
        -- upvalues: v23 (ref), l_Character_0 (copy)
        v23.VoidSamuraiTrail({
            Character = l_Character_0, 
            TrailInfo = {
                EffectName = "VoidSamuraiTrail", 
                TargetPart = "RightHand", 
                HoldTime = 9.166666666666666, 
                Lifetime = 3
            }
        });
    end);
    local v50 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v51 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v34 or v35 then
        l_TweenService_0:Create(l_Main_0.White, v51, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v51, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v50, {
            ImageTransparency = 0.5
        }):Play();
        task.delay(1, function() --[[ Line: 142 ]]
            -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v51 (copy)
            l_TweenService_0:Create(l_Lighting_0, v51, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
        end);
    end;
    local v52 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v34 or v35) and l_Debris_0 or l_Character_0.PrimaryPart
    });
    local _ = l_SoundHelper_0:PlaySound({
        Name = "Song", 
        DirectCopy = script.Song, 
        Parent = (not not v34 or v35) and l_Debris_0 or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v52.Volume;
    v52.Volume = 0;
    task.delay(0.3, function() --[[ Line: 162 ]]
        -- upvalues: l_SoundHelper_0 (ref), v34 (copy), v35 (copy), l_Debris_0 (ref), l_Character_0 (copy)
        l_SoundHelper_0:PlaySound({
            Name = "SwordMain", 
            Parent = (not not v34 or v35) and l_Debris_0 or l_Character_0.PrimaryPart
        });
    end);
    task.delay(0, function() --[[ Line: 169 ]]
        -- upvalues: v52 (copy), v34 (copy), v35 (copy), l_Volume_0 (copy), v31 (copy), l_SoundHelper_0 (ref), l_Debris_0 (ref), l_Character_0 (copy)
        v52:Stop();
        if v34 or v35 then
            v52.Volume = l_Volume_0;
        else
            v52.Volume = l_Volume_0 / 5;
        end;
        v52:Play();
        v52.TimePosition = 0.17;
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v31.HasVoicelines then
            local v56 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v34 or v35) and l_Debris_0 or l_Character_0.PrimaryPart
            });
            if not v34 and not v35 then
                v56.Volume = v56.Volume / 5;
            end;
        end;
    end);
    task.wait(0.5);
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v34 or v35 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 50;
    end;
    local v59 = {
        Animator = v37, 
        AnimId = v29.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v60 = {
        Animator = v39, 
        AnimId = v29.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v61 = {
        Animator = v37, 
        AnimId = v29.Animations.SecondCharacter, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v62 = {
        Animator = v39, 
        AnimId = v29.Animations.SecondVictim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    v70 = script.BillboardGui:Clone();
    v70.Parent = l_Victim_0.UpperTorso;
    l_AnimHelper_0:CreateAnim(v59);
    l_AnimHelper_0:CreateAnim(v60);
    l_AnimHelper_0:CreateAnim(v61);
    l_AnimHelper_0:CreateAnim(v62);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v59);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v60);
    local v73 = {};
    local v74 = false;
    local v75 = script.Jump:Clone();
    v75.Parent = l_Debris_0;
    v73[#v73 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Jump"):Connect(function() --[[ Line: 265 ]]
        -- upvalues: v75 (copy), l_Character_0 (copy), v15 (ref)
        v75:PivotTo(l_Character_0.UpperTorso.CFrame);
        v15.Emit(v75);
        game.Debris:AddItem(v75, 3);
    end);
    local v76 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
    local v77 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
    v73[#v73 + 1] = l_l_AnimHelper_0_Anim_1:GetMarkerReachedSignal("Slash"):Connect(function() --[[ Line: 274 ]]
        -- upvalues: v34 (copy), v35 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), v76 (copy), l_Lighting_0 (ref), v77 (copy), v23 (ref), l_Victim_0 (copy), l_Debris_0 (ref), l_Character_0 (copy), v74 (ref), v15 (ref)
        if v34 or v35 then
            l_ColorCorrection_0.Saturation = 0;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            l_TweenService_0:Create(l_ColorCorrection_0, v76, {
                Contrast = 0.5, 
                Brightness = -0.1
            }):Play();
            local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
            l_MenuBlur_0.Size = 0;
            l_MenuBlur_0.Enabled = true;
            local v79 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_0, v79, {
                Size = 10
            }):Play();
            l_TweenService_0:Create(l_Lighting_0, v77, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v23.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
        end;
        local v80 = script.SlashUp:Clone();
        v80.Parent = l_Victim_0;
        v80.CFrame = l_Victim_0.UpperTorso.CFrame;
        local v81 = script.JumpSlash:Clone();
        v81.Parent = l_Debris_0;
        v81:PivotTo(l_Character_0.UpperTorso.CFrame);
        game.Debris:AddItem(v81, 5);
        if not v74 then
            v80.CFrame = l_Victim_0.UpperTorso.CFrame * CFrame.Angles(-1.5707963267948966, l_Victim_0.UpperTorso.CFrame.Rotation.Y, l_Victim_0.UpperTorso.CFrame.Rotation.Z);
            v81:Destroy();
        end;
        v15.Emit(v81);
        v74 = true;
        v15.Emit(v80);
        game.Debris:AddItem(v80, 3);
    end);
    v73[#v73 + 1] = l_l_AnimHelper_0_Anim_1:GetMarkerReachedSignal("Pause"):Connect(function() --[[ Line: 320 ]]
        -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v64 (ref), v67 (ref), l_AnimHelper_0 (ref), v61 (copy), v68 (ref), v62 (copy), v66 (ref), v69 (ref), v63 (ref), l_Character_0 (copy), l_SoundHelper_0 (ref), v34 (copy), v35 (copy), l_Debris_0 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v23 (ref), l_Victim_0 (copy), v15 (ref), v73 (copy), l_ColorCorrection_0 (copy), v30 (ref), l_RunService_0 (ref), l_Modules_0 (ref), v70 (ref), v47 (ref)
        l_l_AnimHelper_0_Anim_0:Stop(0.01);
        if l_l_AnimHelper_0_Anim_1 then
            l_l_AnimHelper_0_Anim_1:Stop(0.01);
        end;
        v64:Stop(0.1);
        v67 = l_AnimHelper_0:CreateAnim(v61);
        v68 = l_AnimHelper_0:CreateAnim(v62);
        v66.Priority = Enum.AnimationPriority.Action;
        v69 = l_AnimHelper_0:CreateAnim(v66);
        v64:Stop(0.01);
        local v82 = 0;
        (function() --[[ Line: 333 ]] --[[ Name: UpdateCameraCFrame ]]
            -- upvalues: v82 (ref), v63 (ref), l_Character_0 (ref)
            if os.time() - v82 < 0.5 then
                return;
            else
                v82 = os.time();
                v63:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -6, 0));
                return;
            end;
        end)();
        v67:AdjustSpeed(0.1);
        v68:AdjustSpeed(0.1);
        v69:AdjustSpeed(0.1);
        l_SoundHelper_0:PlaySound({
            Name = "SwordHeavy", 
            Parent = (not not v34 or v35) and l_Debris_0 or l_Character_0.PrimaryPart
        });
        task.wait(0.75);
        v67:AdjustSpeed(1);
        v68:AdjustSpeed(1);
        v69:AdjustSpeed(1);
        l_l_AnimHelper_0_Anim_1.TimePosition = 6.833333333333333;
        l_l_AnimHelper_0_Anim_0.TimePosition = 6.833333333333333;
        v69.TimePosition = 0.3333333333333333;
        if v34 or v35 then
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 65
            }):Play();
            task.defer(function() --[[ Line: 368 ]]
                -- upvalues: v23 (ref)
                v23.CameraShake({
                    Preset = "SuperHardHit", 
                    WaitTime = 0.4, 
                    Fade = 1
                });
            end);
        end;
        local v83 = script.SlashUp2.Main:Clone();
        v83.Parent = l_Victim_0.UpperTorso;
        game.Debris:AddItem(v83, 5);
        v15.Emit(v83);
        for _, v85 in v83:GetDescendants() do
            if v85:IsA("ParticleEmitter") then
                v85.TimeScale = 0.05;
                if v85.Name == "SparksToSlow" then
                    v85.TimeScale = 1;
                    v85.Enabled = true;
                end;
                if v85.Name == "LINECOLOR" then
                    v85.TimeScale = 0;
                    l_TweenService_0:Create(v85, TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                        TimeScale = 1
                    }):Play();
                end;
            end;
        end;
        local v86 = nil;
        v86 = script.Wind:Clone();
        v86.Parent = l_Debris_0;
        local l_Sageo_0 = workspace.Welds:FindFirstChild(l_Character_0.Name).WeldCharacter:FindFirstChild("Sageo");
        v73[#v73 + 1] = v67:GetMarkerReachedSignal("Star"):Connect(function() --[[ Line: 405 ]]
            -- upvalues: v34 (ref), v35 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), v23 (ref), v15 (ref), l_Sageo_0 (copy), v83 (copy), v86 (ref), l_Character_0 (ref), v30 (ref)
            if v34 or v35 then
                l_ColorCorrection_0.Brightness = 0.7;
                l_TweenService_0:Create(l_ColorCorrection_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    Brightness = 0
                }):Play();
                task.defer(function() --[[ Line: 410 ]]
                    -- upvalues: v23 (ref)
                    v23.CameraShake({
                        Preset = "SuperHardHit", 
                        WaitTime = 0.25, 
                        Fade = 0.9
                    });
                end);
            end;
            v15.Emit(l_Sageo_0.Ult2);
            for _, v89 in l_Sageo_0.Ult2:GetDescendants() do
                if v89:IsA("ParticleEmitter") then
                    v89.TimeScale = 0.1;
                    l_TweenService_0:Create(v89, TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                        TimeScale = 1
                    }):Play();
                end;
            end;
            for _, v91 in v83:GetDescendants() do
                if v91:IsA("ParticleEmitter") then
                    v91.TimeScale = 0;
                    if v91.Name == "SparksToSlow" then
                        l_TweenService_0:Create(v91, TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                            TimeScale = 1
                        }):Play();
                    end;
                end;
            end;
            game.Debris:AddItem(v86, 20);
            local v92 = workspace:Raycast(l_Character_0.UpperTorso.Position, Vector3.new(-0, -10, -0, -0), v30);
            if v92 then
                local v93 = v15.GetRaySurface(v92);
                local l_CFrame_0 = l_Character_0.HumanoidRootPart.CFrame;
                v86.CFrame = CFrame.new(v93.Position + Vector3.new(0, 0.20000000298023224, 0, 0), l_CFrame_0 * CFrame.new(0, 0, -40000).Position);
            end;
        end);
        v73[#v73 + 1] = v67:GetMarkerReachedSignal("In"):Connect(function() --[[ Line: 447 ]]
            -- upvalues: v34 (ref), v35 (ref), l_Debris_0 (ref), l_RunService_0 (ref), l_TweenService_0 (ref), v15 (ref), l_Character_0 (ref), l_Victim_0 (ref), l_Modules_0 (ref), v70 (ref), l_ColorCorrection_0 (ref), v83 (copy), l_CurrentCamera_0 (ref), v47 (ref), v23 (ref), v86 (ref)
            if v34 or v35 then
                local v95 = script.Mesh:Clone();
                v95.Parent = l_Debris_0;
                local function _(v96) --[[ Line: 454 ]] --[[ Name: getAspectRatio ]]
                    return v96.X / v96.Y;
                end;
                local _ = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 458 ]]
                    -- upvalues: v95 (copy)
                    local _ = math.tan(math.rad(workspace.CurrentCamera.FieldOfView) / 2);
                    local _ = workspace.CurrentCamera.ViewportSize;
                    v95.CFrame = workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -1);
                end);
                l_TweenService_0:Create(v95, TweenInfo.new(1), {
                    Size = Vector3.new(10, 10, 0, 0)
                }):Play();
                local v101 = v15.createHighlight(l_Character_0, Color3.new(0, 0, 0), 0, 1, 6);
                local v102 = v15.createHighlight(l_Victim_0, Color3.new(0, 0, 0), 0, 1, 6);
                local l_VoidSamurai_0 = l_Modules_0.Styles.VoidSamurai;
                local v104 = l_VoidSamurai_0.Katana:Clone();
                local v105 = l_VoidSamurai_0.Sageo:Clone();
                v104.Parent = l_Character_0;
                v105.Parent = l_Character_0;
                local l_Weld_0 = Instance.new("Weld");
                l_Weld_0.Parent = v104;
                l_Weld_0.Part0 = v104;
                l_Weld_0.Part1 = l_Character_0.RightHand;
                local l_Weld_1 = Instance.new("Weld");
                l_Weld_1.Parent = v105;
                l_Weld_1.Part0 = v105;
                l_Weld_1.Part1 = l_Character_0.LeftHand;
                local v108 = false;
                for v109 = 1, 10 do
                    if not v108 then
                        for _ = 1, 10 do
                            if not v108 then
                                local v111 = script.RealP:Clone();
                                v111.Parent = l_Debris_0;
                                v111.CFrame = l_Victim_0.PrimaryPart.CFrame * CFrame.Angles(math.random(-360, 360), math.random(-360, 360), math.random(-360, 360)) + Vector3.new(math.random(-50, 50), 0, math.random(-50, 50));
                                v111.CFrame = v111.CFrame * CFrame.new(-2, 0, 0);
                                local v112 = l_TweenService_0:Create(v111, TweenInfo.new(0.04, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, true), {
                                    Size = Vector3.new(math.random(20, 1000), 1, 1)
                                });
                                v112:Play();
                                v112.Completed:Connect(function() --[[ Line: 502 ]]
                                    -- upvalues: v111 (copy)
                                    v111:Destroy();
                                end);
                                task.wait(0.01);
                            else
                                break;
                            end;
                        end;
                        if v109 == 4 then
                            local l_StartPosKanjiFirst_0 = v70.StartPosKanjiFirst;
                            local l_StartPosKanjiLast_0 = v70.StartPosKanjiLast;
                            local l_EndPosKanjiFirst_0 = v70.EndPosKanjiFirst;
                            local l_EndPosKanjiLast_0 = v70.EndPosKanjiLast;
                            local l_StartPosStar_0 = v70.StartPosStar;
                            local l_EndPosStar_0 = v70.EndPosStar;
                            l_StartPosStar_0.ImageTransparency = 0;
                            l_TweenService_0:Create(l_StartPosStar_0, TweenInfo.new(0.3), {
                                Size = l_EndPosStar_0.Size, 
                                Position = l_EndPosStar_0.Position, 
                                Rotation = 90
                            }):Play();
                            task.wait(0.3);
                            v108 = true;
                            l_StartPosKanjiLast_0.ImageTransparency = 0;
                            local v119 = l_TweenService_0:Create(l_StartPosKanjiLast_0, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                Size = l_EndPosKanjiFirst_0.Size, 
                                Position = l_EndPosKanjiFirst_0.Position
                            });
                            v119:Play();
                            l_StartPosKanjiFirst_0.ImageTransparency = 0.6;
                            l_TweenService_0:Create(l_StartPosKanjiFirst_0, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                Size = l_EndPosKanjiFirst_0.Size, 
                                Position = l_EndPosKanjiFirst_0.Position, 
                                ImageTransparency = 1
                            }):Play();
                            task.wait(0.3);
                            v119:Pause();
                            l_TweenService_0:Create(l_StartPosKanjiLast_0, TweenInfo.new(0.1), {
                                Size = l_EndPosKanjiLast_0.Size, 
                                Position = l_EndPosKanjiLast_0.Position
                            }):Play();
                        end;
                        task.wait(0.01);
                    else
                        break;
                    end;
                end;
                l_TweenService_0:Create(v95, TweenInfo.new(0.1), {
                    Size = Vector3.new(0, 0, 0, 0)
                }):Play();
                for _ = 1, 5 do
                    v101.FillColor = Color3.new(0, 0, 0);
                    v102.FillColor = Color3.new(0, 0, 0);
                    v95.Color = Color3.new(1, 1, 1);
                    task.wait(0.01);
                    v101.FillColor = Color3.new(1, 1, 1);
                    v102.FillColor = Color3.new(1, 1, 1);
                    v95.Color = Color3.new(0, 0, 0);
                    task.wait(0.01);
                end;
                if v34 or v35 then
                    v70:Destroy();
                    l_ColorCorrection_0.Brightness = 1;
                    l_TweenService_0:Create(l_ColorCorrection_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Brightness = 0
                    }):Play();
                end;
                for _, v122 in v83:GetDescendants() do
                    if v122:IsA("ParticleEmitter") then
                        v122.TimeScale = 0.6;
                        v122.Enabled = false;
                    end;
                end;
                v101:Destroy();
                v102:Destroy();
                if v104 then
                    v104:Destroy();
                end;
                if v105 then
                    v105:Destroy();
                end;
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FieldOfView = 70
                }):Play();
                v47.Enabled = true;
                v47.Main.Size = UDim2.new(1, 0, 1, 0);
                v47.Main.Position = UDim2.new(0.5, 0, 0.5, 0);
                for _, v124 in v47:GetDescendants() do
                    if v124:IsA("ImageLabel") then
                        v124.ImageTransparency = 0;
                    end;
                end;
                for v125 = 1, #v47.Main:GetChildren() do
                    v47.Main[tostring(v125)].Visible = false;
                    task.wait(0.016666666666666666);
                end;
                v47:Destroy();
                v23.CameraShake({
                    Preset = "SuperHardHit", 
                    WaitTime = 0.5, 
                    Fade = 1
                });
            end;
            v15.Emit(v86);
            task.wait(0.1);
            v15.Emit(v83);
        end);
    end);
    if v34 or v35 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 70;
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v50, {
            ImageTransparency = 1
        }):Play();
    end;
    v73[#v73 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("StartFast"):Connect(function() --[[ Line: 621 ]]
        -- upvalues: v64 (ref), l_l_AnimHelper_0_Anim_1 (copy), l_l_AnimHelper_0_Anim_0 (copy), v34 (copy), v35 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), l_SoundHelper_0 (ref), l_Debris_0 (ref), l_Character_0 (copy), v63 (ref)
        v64:AdjustSpeed(0.25);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.25);
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.25);
        task.delay(1.3333333333333333, function() --[[ Line: 627 ]]
            -- upvalues: v64 (ref), l_l_AnimHelper_0_Anim_1 (ref), l_l_AnimHelper_0_Anim_0 (ref)
            v64.TimePosition = 5.666666666666667;
            l_l_AnimHelper_0_Anim_1.TimePosition = 5.666666666666667;
            l_l_AnimHelper_0_Anim_0.TimePosition = 5.666666666666667;
        end);
        if not v34 and not v35 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 40
            }):Play();
            l_SoundHelper_0:PlaySound({
                Name = "DeepImpact", 
                Parent = (not not v34 or v35) and l_Debris_0 or l_Character_0.PrimaryPart, 
                Volume = 0.4
            });
            for _, v127 in v63:GetDescendants() do
                if v127:IsA("Beam") then
                    v127.Enabled = true;
                end;
            end;
            return;
        end;
    end);
    if v34 or v35 then
        v63 = script.Cam:Clone();
        v63.Name = l_Character_0.Name .. "Camera";
        v63.Parent = l_Debris_0;
        local l_StartCFrame_0 = v31.StartCFrame;
        v63:PivotTo(l_StartCFrame_0);
        local l_Animator_0 = v63.AnimationController.Animator;
        v65 = {
            Animator = l_Animator_0, 
            AnimId = v29.Animations.Camera
        };
        v66 = {
            Animator = l_Animator_0, 
            AnimId = v29.Animations.SecondCamera, 
            Priority = Enum.AnimationPriority.Core
        };
        l_AnimHelper_0:CreateAnim(v66);
        v64 = l_AnimHelper_0:CreateAnim(v65);
        l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 682 ]]
            -- upvalues: l_CurrentCamera_0 (copy), v63 (ref)
            l_CurrentCamera_0.CFrame = v63.camera.CFrame * CFrame.Angles(0, -3.141592653589793, 0);
        end);
        v73[#v73 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Dash"):Connect(function() --[[ Line: 687 ]]
            -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_0 (copy)
            task.wait(1);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 50
            }):Play();
        end);
        v73[#v73 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Ground"):Connect(function() --[[ Line: 693 ]]
            -- upvalues: l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v23 (ref), l_CurrentCamera_0 (copy)
            l_ColorCorrection_0.Saturation = 0.4;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v131 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v131, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v133 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v133, {
                Size = 20
            }):Play();
            local v134 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v134, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.1
            }):Play();
            task.defer(function() --[[ Line: 711 ]]
                -- upvalues: v23 (ref)
                task.wait(0.06666666666666667);
                v23.CreateImpactFrame({
                    Time = 0.1
                });
            end);
            v23.CameraShake({
                Preset = "SuperHardHit", 
                WaitTime = 0.6, 
                Fade = 1.5
            });
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 60
            }):Play();
        end);
        v73[#v73 + 1] = l_l_AnimHelper_0_Anim_1:GetMarkerReachedSignal("Pause"):Connect(function() --[[ Line: 727 ]]
            -- upvalues: l_camShake_0 (ref), v63 (ref)
            l_camShake_0:ShakeOnce(3, 10, 0.2, 2, 0.1, 20);
            for _, v136 in v63:GetDescendants() do
                if v136:IsA("Beam") then
                    v136.Enabled = false;
                end;
            end;
        end);
        task.wait(9.833333333333334);
        v67:AdjustSpeed(0);
        task.wait(0.8333333333333334);
        v69:AdjustSpeed(0);
        v67:AdjustSpeed(0);
        v68:AdjustSpeed(0);
        task.wait(0.6666666666666666);
        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
        for _, v138 in v73 do
            v138:Disconnect();
        end;
        l_TweenService_0:Create(l_Main_0.White, v51, {
            BackgroundTransparency = 0
        }):Play();
        task.wait(0.3333333333333333);
        v69:Stop(0.1);
        v67:Stop(0.1);
        if v68 then
            v68:Stop(0.1);
        end;
        task.wait(0.3333333333333333);
        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
        l_CameraMode_0.Value = "";
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v50, {
            ImageTransparency = 1
        }):Play();
        local v139 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
        l_TweenService_0:Create(l_Lighting_0, v139, {
            ExposureCompensation = workspace.Exposure.Value
        }):Play();
        v23.CameraShake({
            Preset = "HardHit", 
            WaitTime = 0.2, 
            Fade = 1
        });
        v63:Destroy();
    end;
    for _, v141 in v73 do
        v141:Disconnect();
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v29;