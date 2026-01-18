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
local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local l_camShake_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
local v16 = require(l_Modules_0.Cutscene.Utilities);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local l_Common_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local l_Parent_0 = script.Parent.Parent;
local v21 = require(l_Parent_0);
local _ = Random.new();
local function _(v23, v24, v25) --[[ Line: 32 ]] --[[ Name: Lerp ]]
    return v23 + (v24 - v23) * v25;
end;
local v27 = {
    Animations = {
        Character = 114456187125624, 
        Victim = 71294488276764, 
        Camera = 82841027489770
    }, 
    CameraRig = l_ReplicatedStorage_0.Assets.FoVCamera
};
local l_CommonUtilities_0 = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
local function _(v29) --[[ Line: 46 ]] --[[ Name: impactCorrection ]]
    -- upvalues: l_TweenService_0 (copy), l_Lighting_0 (copy)
    task.defer(function() --[[ Line: 47 ]]
        -- upvalues: l_TweenService_0 (ref), v29 (copy), l_Lighting_0 (ref)
        local v30 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        l_TweenService_0:Create(v29, v30, {
            Saturation = -0.3, 
            Contrast = 0.4
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
v27.Use = function(v34) --[[ Line: 60 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v21 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_Main_0 (copy), l_Common_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), v27 (copy), l_AnimHelper_0 (copy), l_RunService_0 (copy), l_camShake_0 (copy), v16 (copy), l_ReplicatedStorage_0 (copy), l_CommonUtilities_0 (copy)
    local l_Character_0 = v34.Character;
    local l_Victim_0 = v34.Victim;
    local v37 = l_LocalPlayer_0.Character == l_Character_0;
    local v38 = l_LocalPlayer_0.Character == l_Victim_0;
    local v39 = v21.GetWeldCharacter(l_Character_0);
    local v40 = v21.GetWeldCharacter(l_Victim_0);
    for _, v42 in v40:GetDescendants() do
        if v42.Name == "MainWindAtttachment" then
            v42:Destroy();
        end;
    end;
    for _, v44 in v39:GetDescendants() do
        if v44.Name == "MainWindAtttachment" then
            v44:Destroy();
        end;
    end;
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v46 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v48 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
    if v37 or v38 then
        task.defer(function() --[[ Line: 92 ]]
            -- upvalues: l_ColorCorrection_0 (copy), l_Lighting_0 (ref), l_TweenService_0 (ref), v21 (ref)
            l_ColorCorrection_0.Saturation = 0;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v51 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v51, {
                Size = 10
            }):Play();
            local v52 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v52, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.delay(0.4, function() --[[ Line: 107 ]]
                -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v52 (copy)
                l_TweenService_0:Create(l_Lighting_0, v52, {
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
        end);
    end;
    local v53 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v54 = TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v37 or v38 then
        local v55 = l_Main_0.White:Clone();
        v55.Position = UDim2.new(0, 0, 0, 0);
        v55.Parent = l_Common_0;
        local l_v55_0 = v55 --[[ copy: 14 -> 44 ]];
        task.delay(3, function() --[[ Line: 133 ]]
            -- upvalues: l_v55_0 (copy)
            l_v55_0:Destroy();
        end);
        l_TweenService_0:Create(v55, v54, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v54, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        task.delay(1, function() --[[ Line: 140 ]]
            -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v54 (copy)
            l_TweenService_0:Create(l_Lighting_0, v54, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
        end);
    end;
    task.wait(0.3);
    local v57 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v37 or v38) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v57.Volume;
    v57.Volume = 0;
    task.delay(0, function() --[[ Line: 156 ]]
        -- upvalues: v57 (copy), v37 (copy), v38 (copy), l_Volume_0 (copy)
        v57:Stop();
        if v37 or v38 then
            v57.Volume = l_Volume_0;
        else
            v57.Volume = l_Volume_0 / 5;
        end;
        v57:Play();
        v57.TimePosition = 3.92;
    end);
    local v59 = nil;
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v37 or v38 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 45;
    end;
    local v62 = {
        Animator = v46, 
        AnimId = v27.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v63 = {
        Animator = v48, 
        AnimId = v27.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    if v37 or v38 then
        l_Victim_0.PrimaryPart.Anchored = true;
        l_Character_0.PrimaryPart.Anchored = true;
    end;
    l_AnimHelper_0:CreateAnim(v62);
    l_AnimHelper_0:CreateAnim(v63);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v62);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v63);
    task.delay(0, function() --[[ Line: 206 ]]
        -- upvalues: v21 (ref), l_Character_0 (copy)
        v21.AttackTrail({
            Character = l_Character_0, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Basic", 
                TargetPart = "LeftHand", 
                DelayTime = 0, 
                HoldTime = 1.5, 
                TimeScale = 0.5
            }
        });
    end);
    local v66 = {};
    local v67 = false;
    local v68 = nil;
    local v69 = nil;
    local function v77() --[[ Line: 226 ]] --[[ Name: cleanup ]]
        -- upvalues: v67 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), l_Victim_0 (copy), l_Character_0 (copy), v69 (ref), v68 (ref), v59 (ref), v57 (copy), l_Main_0 (ref), v66 (copy), l_Humanoid_1 (copy), v53 (copy), l_Lighting_0 (ref), l_RunService_0 (ref), l_CameraMode_0 (copy), v21 (ref)
        v67 = true;
        l_TweenService_0:Create(l_ColorCorrection_0, TweenInfo.new(1), {
            Saturation = 0, 
            Contrast = 0, 
            Brightness = 0, 
            TintColor = Color3.new(1, 1, 1)
        }):Play();
        l_Victim_0.PrimaryPart.Anchored = false;
        l_Character_0.PrimaryPart.Anchored = false;
        if v69 then
            v69:Destroy();
        end;
        if v68 then
            v68:Destroy();
        end;
        if v59 then
            v59:Destroy();
        end;
        if v57 then
            v57:Destroy();
        end;
        if workspace.Debris:FindFirstChild("Song") then
            l_TweenService_0:Create(workspace.Debris:FindFirstChild("Song"), TweenInfo.new(0.5), {
                Volume = 0
            }):Play();
            game.Debris:AddItem(workspace.Debris:FindFirstChild("Song"), 3);
        end;
        for _, v71 in l_Main_0:GetChildren() do
            if v71:IsA("Frame") then
                v71.Position = UDim2.new(0, 0, 0, 0);
            end;
        end;
        print("What");
        for _, v73 in v66 do
            v73:Disconnect();
        end;
        for _, v75 in l_Humanoid_1:GetPlayingAnimationTracks() do
            v75:Stop();
        end;
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v53, {
            ImageTransparency = 1
        }):Play();
        local v76 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
        l_TweenService_0:Create(l_Lighting_0, v76, {
            ExposureCompensation = workspace.Exposure.Value
        }):Play();
        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
        l_CameraMode_0.Value = "";
        v21.SetTransparency(l_Character_0, 0);
        v21.SetTransparency(l_Victim_0, 0);
    end;
    v66[#v66 + 1] = l_Character_0.AncestryChanged:Connect(function() --[[ Line: 284 ]]
        -- upvalues: l_Character_0 (copy), v77 (copy)
        task.wait(0.1);
        if l_Character_0.Parent == nil then
            v77();
        end;
    end);
    v66[#v66 + 1] = l_Victim_0.AncestryChanged:Connect(function() --[[ Line: 291 ]]
        -- upvalues: l_Victim_0 (copy), v77 (copy)
        task.wait(0.1);
        if l_Victim_0.Parent == nil then
            v77();
        end;
    end);
    if v37 or v38 then
        l_camShake_0:ShakeOnce(3, 10, 0.2, 2, 0.1, 20);
    end;
    v69 = script.fastShards:Clone();
    v69.Parent = workspace.Debris;
    v69.CFrame = l_Victim_0.HumanoidRootPart.CFrame;
    game.Debris:AddItem(v69, 4);
    v66[#v66 + 1] = l_l_AnimHelper_0_Anim_1:GetMarkerReachedSignal("FastWind"):Connect(function() --[[ Line: 307 ]]
        -- upvalues: v67 (ref), v69 (ref), v68 (ref), l_Character_0 (copy), v37 (copy), v38 (copy), l_camShake_0 (ref), v66 (copy), l_l_AnimHelper_0_Anim_1 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v40 (copy), v16 (ref), v39 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref)
        if v67 then
            return;
        else
            v69:Destroy();
            v68 = script.fastShards:Clone();
            v68.Parent = workspace.Debris;
            v68.CFrame = l_Character_0.HumanoidRootPart.CFrame;
            game.Debris:AddItem(v68, 4);
            if v37 or v38 then
                l_camShake_0:ShakeOnce(3, 10, 0.2, 2, 0.1, 20);
            end;
            v66[#v66 + 1] = l_l_AnimHelper_0_Anim_1:GetMarkerReachedSignal("ArmTap"):Connect(function() --[[ Line: 320 ]]
                -- upvalues: v67 (ref), v37 (ref), v38 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v68 (ref), v40 (ref), l_Character_0 (ref), v16 (ref), v66 (ref), l_l_AnimHelper_0_Anim_1 (ref), v39 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                if v67 then
                    return;
                else
                    if v37 or v38 then
                        local l_l_ColorCorrection_0_0 = l_ColorCorrection_0;
                        local l_l_l_ColorCorrection_0_0_0 = l_l_ColorCorrection_0_0 --[[ copy: 0 -> 1 ]];
                        task.defer(function() --[[ Line: 47 ]]
                            -- upvalues: l_TweenService_0 (ref), l_l_l_ColorCorrection_0_0_0 (copy), l_Lighting_0 (ref)
                            local v80 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                            l_TweenService_0:Create(l_l_l_ColorCorrection_0_0_0, v80, {
                                Saturation = -0.3, 
                                Contrast = 0.4
                            }):Play();
                            local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                            l_MenuBlur_2.Size = 0;
                            l_MenuBlur_2.Enabled = true;
                            local v82 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                            l_TweenService_0:Create(l_MenuBlur_2, v82, {
                                Size = 15
                            }):Play();
                        end);
                        v21.HUDShake({
                            Scale = 20, 
                            Damper = 0.175
                        });
                        task.defer(function() --[[ Line: 330 ]]
                            -- upvalues: v21 (ref)
                            v21.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.2, 
                                Fade = 2
                            });
                        end);
                    end;
                    v68:Destroy();
                    local v83 = script.Effects.ArmTap:Clone();
                    v83.Parent = v40:FindFirstChild("LeftLowerArm") or l_Character_0.LeftLowerArm;
                    v16.Emit(v83);
                    game.Debris:AddItem(v83, 4);
                    v66[#v66 + 1] = l_l_AnimHelper_0_Anim_1:GetMarkerReachedSignal("Hit"):Connect(function() --[[ Line: 346 ]]
                        -- upvalues: v67 (ref), v37 (ref), v38 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v39 (ref), l_Character_0 (ref), v16 (ref), v66 (ref), l_l_AnimHelper_0_Anim_1 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        if v67 then
                            return;
                        else
                            if v37 or v38 then
                                local l_l_ColorCorrection_0_1 = l_ColorCorrection_0;
                                local l_l_l_ColorCorrection_0_1_0 = l_l_ColorCorrection_0_1 --[[ copy: 0 -> 2 ]];
                                task.defer(function() --[[ Line: 47 ]]
                                    -- upvalues: l_TweenService_0 (ref), l_l_l_ColorCorrection_0_1_0 (copy), l_Lighting_0 (ref)
                                    local v86 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                                    l_TweenService_0:Create(l_l_l_ColorCorrection_0_1_0, v86, {
                                        Saturation = -0.3, 
                                        Contrast = 0.4
                                    }):Play();
                                    local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                                    l_MenuBlur_3.Size = 0;
                                    l_MenuBlur_3.Enabled = true;
                                    local v88 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                                    l_TweenService_0:Create(l_MenuBlur_3, v88, {
                                        Size = 15
                                    }):Play();
                                end);
                                v21.HUDShake({
                                    Scale = 20, 
                                    Damper = 0.07777777777777778
                                });
                                task.defer(function() --[[ Line: 356 ]]
                                    -- upvalues: v21 (ref)
                                    v21.CameraShake({
                                        Preset = "SuperHardHit", 
                                        WaitTime = 0.4, 
                                        Fade = 2
                                    });
                                end);
                                l_l_ColorCorrection_0_1 = l_Lighting_0.MenuBlur;
                                l_l_ColorCorrection_0_1.Size = 30;
                                l_l_ColorCorrection_0_1.Enabled = true;
                                local v89 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                                l_TweenService_0:Create(l_l_ColorCorrection_0_1, v89, {
                                    Size = 0
                                }):Play();
                                v21.CreateImpactFrame({
                                    Time = 0.05
                                });
                            end;
                            local v90 = script.Effects.Normal:Clone();
                            v90.Parent = v39:FindFirstChild("Head") or l_Character_0.Head;
                            v16.Emit(v90);
                            game.Debris:AddItem(v90, 5);
                            v66[#v66 + 1] = l_l_AnimHelper_0_Anim_1:GetMarkerReachedSignal("Emit"):Connect(function() --[[ Line: 382 ]]
                                -- upvalues: v67 (ref), v37 (ref), v38 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v39 (ref), l_Character_0 (ref), v16 (ref)
                                if v67 then
                                    return;
                                else
                                    if v37 or v38 then
                                        l_SoundHelper_0:PlaySound({
                                            Name = "KnockdownPunch", 
                                            Parent = l_Workspace_0.Debris
                                        });
                                        local l_l_ColorCorrection_0_2 = l_ColorCorrection_0;
                                        local l_l_l_ColorCorrection_0_2_0 = l_l_ColorCorrection_0_2 --[[ copy: 0 -> 2 ]];
                                        task.defer(function() --[[ Line: 47 ]]
                                            -- upvalues: l_TweenService_0 (ref), l_l_l_ColorCorrection_0_2_0 (copy), l_Lighting_0 (ref)
                                            local v93 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                                            l_TweenService_0:Create(l_l_l_ColorCorrection_0_2_0, v93, {
                                                Saturation = -0.3, 
                                                Contrast = 0.4
                                            }):Play();
                                            local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                                            l_MenuBlur_4.Size = 0;
                                            l_MenuBlur_4.Enabled = true;
                                            local v95 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                                            l_TweenService_0:Create(l_MenuBlur_4, v95, {
                                                Size = 15
                                            }):Play();
                                        end);
                                        v21.HUDShake({
                                            Scale = 20, 
                                            Damper = 0.07777777777777778
                                        });
                                        task.defer(function() --[[ Line: 397 ]]
                                            -- upvalues: v21 (ref)
                                            v21.CameraShake({
                                                Preset = "SuperHardHit", 
                                                WaitTime = 0.5, 
                                                Fade = 2
                                            });
                                        end);
                                        v21.CreateImpactFrame({
                                            Time = 0.05
                                        });
                                    end;
                                    local v96 = script.Effects.Normal:Clone();
                                    v96.Parent = v39:FindFirstChild("Head") or l_Character_0.Head;
                                    v16.Emit(v96);
                                    game.Debris:AddItem(v96, 5);
                                    local v97 = script.Effects.Spit:Clone();
                                    v97.Parent = v39:FindFirstChild("Head") or l_Character_0.Head;
                                    v16.Emit(v97);
                                    game.Debris:AddItem(v97, 5);
                                    return;
                                end;
                            end);
                            return;
                        end;
                    end);
                    return;
                end;
            end);
            return;
        end;
    end);
    if v37 or v38 then
        if v67 then
            return;
        else
            v59 = l_ReplicatedStorage_0.Assets.FoVCamera:Clone();
            v59.Name = l_Character_0.Name .. "Camera";
            v59.Parent = l_Workspace_0.Debris;
            local v98 = 0;
            local function _() --[[ Line: 431 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: v98 (ref), v59 (ref), v34 (copy)
                if os.time() - v98 < 0.5 then
                    return;
                else
                    v98 = os.time();
                    v59:PivotTo(v34.StartCFrame * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            if os.time() - v98 >= 0.5 then
                v98 = os.time();
                local v100 = v34.StartCFrame * CFrame.new(0, -3, 0);
                v59:PivotTo(v100);
            end;
            local v101 = {
                Animator = v59.AnimationController.Animator, 
                AnimId = v27.Animations.Camera
            };
            local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v101);
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 450 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v59 (ref), v98 (ref), v34 (copy)
                l_CurrentCamera_0.CFrame = v59.CamPart.CFrame;
                l_CurrentCamera_0.FieldOfView = math.abs((v59.FovPart.Position - v59.RootPart.Position).Y);
                if os.time() - v98 < 0.5 then
                    return;
                else
                    v98 = os.time();
                    v59:PivotTo(v34.StartCFrame * CFrame.new(0, -3, 0));
                    return;
                end;
            end);
            v66[#v66 + 1] = l_l_AnimHelper_0_Anim_2:GetMarkerReachedSignal("HidePlayer"):Connect(function() --[[ Line: 456 ]]
                -- upvalues: v67 (ref), v21 (ref), l_Character_0 (copy), l_Victim_0 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_2 (copy), l_l_AnimHelper_0_Anim_1 (copy)
                if v67 then
                    return;
                else
                    v21.SetTransparency(l_Character_0, 1);
                    v21.SetTransparency(l_Victim_0, 0);
                    l_l_AnimHelper_0_Anim_0.TimePosition = l_l_AnimHelper_0_Anim_2.TimePosition;
                    l_l_AnimHelper_0_Anim_1.TimePosition = l_l_AnimHelper_0_Anim_2.TimePosition;
                    return;
                end;
            end);
            v66[#v66 + 1] = l_l_AnimHelper_0_Anim_2:GetMarkerReachedSignal("HideVictim"):Connect(function() --[[ Line: 465 ]]
                -- upvalues: v67 (ref), v21 (ref), l_Character_0 (copy), l_Victim_0 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_2 (copy), l_l_AnimHelper_0_Anim_1 (copy)
                if v67 then
                    return;
                else
                    v21.SetTransparency(l_Character_0, 0);
                    v21.SetTransparency(l_Victim_0, 1);
                    l_l_AnimHelper_0_Anim_0.TimePosition = l_l_AnimHelper_0_Anim_2.TimePosition;
                    l_l_AnimHelper_0_Anim_1.TimePosition = l_l_AnimHelper_0_Anim_2.TimePosition;
                    return;
                end;
            end);
            v66[#v66 + 1] = l_l_AnimHelper_0_Anim_2:GetMarkerReachedSignal("Appear"):Connect(function() --[[ Line: 474 ]]
                -- upvalues: v67 (ref), v21 (ref), l_Victim_0 (copy), l_Character_0 (copy)
                if v67 then
                    return;
                else
                    v21.SetTransparency(l_Victim_0, 0);
                    v21.SetTransparency(l_Character_0, 0);
                    return;
                end;
            end);
            if v67 then
                return;
            else
                local v104 = TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, 0, true);
                local _ = l_CommonUtilities_0.GetOccupied(l_Character_0);
                local v106 = false;
                local function v113() --[[ Line: 489 ]] --[[ Name: ResetPosition ]]
                    -- upvalues: v106 (ref), v67 (ref), l_RunService_0 (ref), l_Character_0 (copy), v34 (copy), l_Victim_0 (copy), v21 (ref)
                    if v106 then
                        return;
                    elseif v67 then
                        return;
                    else
                        v106 = true;
                        local v107 = nil;
                        v107 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 495 ]]
                            -- upvalues: l_Character_0 (ref), v34 (ref), l_Victim_0 (ref)
                            task.wait(0.016666666666666666);
                            l_Character_0:PivotTo(v34.StartCFrame * CFrame.Angles(0, 3.141592653589793, 0));
                            l_Victim_0:PivotTo(v34.StartCFrame * CFrame.new(0, 0, 5));
                        end);
                        task.delay(0.5, function() --[[ Line: 501 ]]
                            -- upvalues: v107 (ref), l_Character_0 (ref), l_Victim_0 (ref), v21 (ref)
                            if v107 then
                                v107:Disconnect();
                            end;
                            for _, v109 in {
                                l_Character_0, 
                                l_Victim_0, 
                                v21.GetWeldCharacter(l_Character_0), 
                                v21.GetWeldCharacter(l_Victim_0)
                            } do
                                for _, v111 in v109:GetDescendants() do
                                    if v111:IsA("BasePart") then
                                        local l_v111_Attribute_0 = v111:GetAttribute("PreviousCollisionGroup");
                                        if l_v111_Attribute_0 then
                                            v111.CollisionGroup = l_v111_Attribute_0;
                                            v111:SetAttribute("PreviousCollisionGroup", nil);
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
                task.wait(v34.Time - 1 - 0.3 - 0.3333333333333333);
                if v67 then
                    return;
                else
                    local v114 = l_Main_0.White:Clone();
                    v114.Position = UDim2.new(0, 0, 0, 0);
                    v114.Parent = l_Common_0;
                    task.delay(3, function() --[[ Line: 528 ]]
                        -- upvalues: v114 (copy)
                        v114:Destroy();
                    end);
                    l_TweenService_0:Create(v114, v104, {
                        BackgroundTransparency = 0
                    }):Play();
                    l_TweenService_0:Create(l_Lighting_0, v104, {
                        ExposureCompensation = 2
                    }):Play();
                    l_TweenService_0:Create(l_Main_0.White, v104, {
                        BackgroundTransparency = 0
                    }):Play();
                    task.wait(1);
                    if v67 then
                        return;
                    else
                        v113();
                        for _, v116 in l_Main_0:GetChildren() do
                            if v116:IsA("Frame") then
                                v116.Position = UDim2.new(0, 0, 0, 0);
                            end;
                        end;
                        l_l_AnimHelper_0_Anim_2:Stop(0.1);
                        if l_l_AnimHelper_0_Anim_1 then
                            l_l_AnimHelper_0_Anim_1:Stop(0.1);
                        end;
                        l_l_AnimHelper_0_Anim_0:Stop(0.1);
                        l_CameraMode_0.Value = "";
                        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v53, {
                            ImageTransparency = 1
                        }):Play();
                        local v117 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
                        l_TweenService_0:Create(l_Lighting_0, v117, {
                            ExposureCompensation = workspace.Exposure.Value
                        }):Play();
                        v21.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                        v59:Destroy();
                        task.delay(0.5, function() --[[ Line: 567 ]]
                            -- upvalues: v66 (copy)
                            for _, v119 in v66 do
                                v119:Disconnect();
                            end;
                        end);
                        --[[ close >= 29 ]]
                    end;
                end;
            end;
        end;
    end;
    if not v38 and not v37 then
        l_Victim_0.PrimaryPart.Anchored = false;
        l_Character_0.PrimaryPart.Anchored = false;
    end;
end;
return v27;