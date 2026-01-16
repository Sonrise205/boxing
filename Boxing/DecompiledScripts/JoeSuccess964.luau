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
        Character = 113396220152238, 
        Victim = 98224861774427, 
        Camera = 83052680519784
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
    if v37 or v38 then
        l_Victim_0.PrimaryPart.Anchored = true;
        l_Character_0.PrimaryPart.Anchored = true;
    end;
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
        task.defer(function() --[[ Line: 97 ]]
            -- upvalues: l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref)
            l_ColorCorrection_0.Saturation = 0;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v50 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v50, {
                Saturation = -0.7, 
                Contrast = 0.5
            }):Play();
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v52 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v52, {
                Size = 10
            }):Play();
            local v53 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v53, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.delay(0.4, function() --[[ Line: 115 ]]
                -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v53 (copy)
                l_TweenService_0:Create(l_Lighting_0, v53, {
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
    local v54 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v55 = TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v37 or v38 then
        local v56 = l_Main_0.White:Clone();
        v56.Position = UDim2.new(0, 0, 0, 0);
        v56.Parent = l_Common_0;
        local l_v56_0 = v56 --[[ copy: 14 -> 45 ]];
        task.delay(3, function() --[[ Line: 140 ]]
            -- upvalues: l_v56_0 (copy)
            l_v56_0:Destroy();
        end);
        l_TweenService_0:Create(v56, v55, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v55, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        task.delay(1, function() --[[ Line: 147 ]]
            -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v55 (copy)
            l_TweenService_0:Create(l_Lighting_0, v55, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
        end);
    end;
    task.wait(0.3);
    local v58 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v37 or v38) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v58.Volume;
    v58.Volume = 0;
    task.delay(0, function() --[[ Line: 163 ]]
        -- upvalues: v58 (copy), v37 (copy), v38 (copy), l_Volume_0 (copy)
        v58:Stop();
        if v37 or v38 then
            v58.Volume = l_Volume_0;
        else
            v58.Volume = l_Volume_0 / 5;
        end;
        v58:Play();
        v58.TimePosition = 4.02;
    end);
    local v60 = nil;
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v37 or v38 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 45;
    end;
    local v63 = {
        Animator = v46, 
        AnimId = v27.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v64 = {
        Animator = v48, 
        AnimId = v27.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    l_AnimHelper_0:CreateAnim(v63);
    l_AnimHelper_0:CreateAnim(v64);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v63);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v64);
    local v67 = {};
    local v68 = false;
    local v69 = nil;
    local v70 = nil;
    local function v78() --[[ Line: 215 ]] --[[ Name: cleanup ]]
        -- upvalues: v68 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), l_Victim_0 (copy), l_Character_0 (copy), v70 (ref), v69 (ref), v60 (ref), v58 (copy), l_Main_0 (ref), v67 (copy), l_Humanoid_1 (copy), v54 (copy), l_Lighting_0 (ref), l_RunService_0 (ref), l_CameraMode_0 (copy), v21 (ref)
        v68 = true;
        l_TweenService_0:Create(l_ColorCorrection_0, TweenInfo.new(1), {
            Saturation = 0, 
            Contrast = 0, 
            Brightness = 0, 
            TintColor = Color3.new(1, 1, 1)
        }):Play();
        l_Victim_0.PrimaryPart.Anchored = false;
        l_Character_0.PrimaryPart.Anchored = false;
        if v70 then
            v70:Destroy();
        end;
        if v69 then
            v69:Destroy();
        end;
        if v60 then
            v60:Destroy();
        end;
        if v58 then
            v58:Destroy();
        end;
        if workspace.Debris:FindFirstChild("Song") then
            l_TweenService_0:Create(workspace.Debris:FindFirstChild("Song"), TweenInfo.new(0.5), {
                Volume = 0
            }):Play();
            game.Debris:AddItem(workspace.Debris:FindFirstChild("Song"), 3);
        end;
        for _, v72 in l_Main_0:GetChildren() do
            if v72:IsA("Frame") then
                v72.Position = UDim2.new(0, 0, 0, 0);
            end;
        end;
        for _, v74 in v67 do
            v74:Disconnect();
        end;
        for _, v76 in l_Humanoid_1:GetPlayingAnimationTracks() do
            v76:Stop();
        end;
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v54, {
            ImageTransparency = 1
        }):Play();
        local v77 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
        l_TweenService_0:Create(l_Lighting_0, v77, {
            ExposureCompensation = workspace.Exposure.Value
        }):Play();
        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
        l_CameraMode_0.Value = "";
        v21.SetTransparency(l_Character_0, 0);
        v21.SetTransparency(l_Victim_0, 0);
    end;
    v67[#v67 + 1] = l_Character_0.AncestryChanged:Connect(function() --[[ Line: 271 ]]
        -- upvalues: l_Character_0 (copy), v78 (copy)
        task.wait(0.1);
        if l_Character_0.Parent == nil then
            v78();
        end;
    end);
    v67[#v67 + 1] = l_Victim_0.AncestryChanged:Connect(function() --[[ Line: 278 ]]
        -- upvalues: l_Victim_0 (copy), v78 (copy)
        task.wait(0.1);
        if l_Victim_0.Parent == nil then
            v78();
        end;
    end);
    if v37 or v38 then
        l_camShake_0:ShakeOnce(3, 10, 0.2, 2, 0.1, 20);
    end;
    v70 = script.fastShards:Clone();
    v70.Parent = workspace.Debris;
    v70.CFrame = l_Victim_0.HumanoidRootPart.CFrame;
    game.Debris:AddItem(v70, 4);
    if v68 then
        return;
    else
        v67[#v67 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("FastWind"):Connect(function() --[[ Line: 296 ]]
            -- upvalues: v68 (ref), v70 (ref), v69 (ref), l_Character_0 (copy), v37 (copy), v38 (copy), l_camShake_0 (ref), v67 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v40 (copy), v16 (ref), v39 (copy)
            if v68 then
                return;
            else
                v70:Destroy();
                v69 = script.fastShards:Clone();
                v69.Parent = workspace.Debris;
                v69.CFrame = l_Character_0.HumanoidRootPart.CFrame;
                game.Debris:AddItem(v69, 4);
                if v37 or v38 then
                    l_camShake_0:ShakeOnce(3, 10, 0.2, 2, 0.1, 20);
                end;
                v67[#v67 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("FastWindStop"):Connect(function() --[[ Line: 309 ]]
                    -- upvalues: v68 (ref), v37 (ref), v38 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v69 (ref), v40 (ref), l_Character_0 (ref), v16 (ref), v39 (ref)
                    if v68 then
                        return;
                    else
                        if v37 or v38 then
                            local l_l_ColorCorrection_0_0 = l_ColorCorrection_0;
                            local l_l_l_ColorCorrection_0_0_0 = l_l_ColorCorrection_0_0 --[[ copy: 0 -> 2 ]];
                            task.defer(function() --[[ Line: 47 ]]
                                -- upvalues: l_TweenService_0 (ref), l_l_l_ColorCorrection_0_0_0 (copy), l_Lighting_0 (ref)
                                local v81 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                                l_TweenService_0:Create(l_l_l_ColorCorrection_0_0_0, v81, {
                                    Saturation = -0.3, 
                                    Contrast = 0.4
                                }):Play();
                                local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                                l_MenuBlur_2.Size = 0;
                                l_MenuBlur_2.Enabled = true;
                                local v83 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                                l_TweenService_0:Create(l_MenuBlur_2, v83, {
                                    Size = 15
                                }):Play();
                            end);
                            v21.HUDShake({
                                Scale = 20, 
                                Damper = 0.07777777777777778
                            });
                            task.defer(function() --[[ Line: 320 ]]
                                -- upvalues: v21 (ref)
                                v21.CameraShake({
                                    Preset = "HardHit", 
                                    WaitTime = 0.2, 
                                    Fade = 2
                                });
                            end);
                        end;
                        v69:Destroy();
                        local v84 = script.Effects.Joe:Clone();
                        v84.Parent = v40:FindFirstChild("Head") or l_Character_0.Head;
                        v16.Emit(v84);
                        game.Debris:AddItem(v84, 5);
                        local v85 = script.Effects.Normal:Clone();
                        v85.Parent = v39:FindFirstChild("Head") or l_Character_0.Head;
                        v16.Emit(v85);
                        game.Debris:AddItem(v85, 5);
                        return;
                    end;
                end);
                return;
            end;
        end);
        local v86 = RaycastParams.new();
        v86.FilterType = Enum.RaycastFilterType.Exclude;
        v86.FilterDescendantsInstances = {
            workspace.Debris, 
            l_Character_0, 
            l_Victim_0
        };
        v67[#v67 + 1] = l_l_AnimHelper_0_Anim_1:GetMarkerReachedSignal("First"):Connect(function() --[[ Line: 347 ]]
            -- upvalues: v68 (ref), v37 (copy), v38 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v16 (ref), l_Character_0 (copy), v86 (copy)
            if v68 then
                return;
            else
                if v37 or v38 then
                    local l_l_ColorCorrection_0_1 = l_ColorCorrection_0;
                    local l_l_l_ColorCorrection_0_1_0 = l_l_ColorCorrection_0_1 --[[ copy: 0 -> 4 ]];
                    task.defer(function() --[[ Line: 47 ]]
                        -- upvalues: l_TweenService_0 (ref), l_l_l_ColorCorrection_0_1_0 (copy), l_Lighting_0 (ref)
                        local v89 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_l_l_ColorCorrection_0_1_0, v89, {
                            Saturation = -0.3, 
                            Contrast = 0.4
                        }):Play();
                        local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_3.Size = 0;
                        l_MenuBlur_3.Enabled = true;
                        local v91 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_3, v91, {
                            Size = 15
                        }):Play();
                    end);
                    v21.HUDShake({
                        Scale = 10, 
                        Damper = 0.09999999999999999
                    });
                    task.defer(function() --[[ Line: 357 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.2, 
                            Fade = 0.5
                        });
                    end);
                end;
                local v92 = script.First:Clone();
                v92.Parent = workspace.Debris;
                v16.Emit(v92);
                game.Debris:AddItem(v92, 4);
                local v93 = workspace:Raycast(l_Character_0.LowerTorso.Position, Vector3.new(-0, -10, -0, -0), v86);
                if v93 then
                    local v94 = v16.GetRaySurface(v93);
                    local l_CFrame_0 = l_Character_0.HumanoidRootPart.CFrame;
                    v92.CFrame = CFrame.new(v94.Position, l_CFrame_0 * CFrame.new(0, 0, -40000).Position);
                end;
                return;
            end;
        end);
        v67[#v67 + 1] = l_l_AnimHelper_0_Anim_1:GetMarkerReachedSignal("Knockdown"):Connect(function() --[[ Line: 381 ]]
            -- upvalues: v68 (ref), v37 (copy), v38 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v16 (ref), l_Victim_0 (copy), v86 (copy)
            if v68 then
                return;
            else
                if v37 or v38 then
                    local l_l_ColorCorrection_0_2 = l_ColorCorrection_0;
                    local l_l_l_ColorCorrection_0_2_0 = l_l_ColorCorrection_0_2 --[[ copy: 0 -> 4 ]];
                    task.defer(function() --[[ Line: 47 ]]
                        -- upvalues: l_TweenService_0 (ref), l_l_l_ColorCorrection_0_2_0 (copy), l_Lighting_0 (ref)
                        local v98 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_l_l_ColorCorrection_0_2_0, v98, {
                            Saturation = -0.3, 
                            Contrast = 0.4
                        }):Play();
                        local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_4.Size = 0;
                        l_MenuBlur_4.Enabled = true;
                        local v100 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_4, v100, {
                            Size = 15
                        }):Play();
                    end);
                    v21.HUDShake({
                        Scale = 20, 
                        Damper = 0.07777777777777778
                    });
                    task.defer(function() --[[ Line: 392 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.2, 
                            Fade = 2
                        });
                    end);
                end;
                local v101 = script.Knockdown:Clone();
                v101.Parent = workspace.Debris;
                v16.Emit(v101);
                game.Debris:AddItem(v101, 4);
                local v102 = workspace:Raycast(l_Victim_0.LowerTorso.Position, Vector3.new(-0, -10, -0, -0), v86);
                if v102 then
                    local v103 = v16.GetRaySurface(v102);
                    local l_CFrame_1 = l_Victim_0.HumanoidRootPart.CFrame;
                    v101.CFrame = CFrame.new(v103.Position, l_CFrame_1 * CFrame.new(0, 0, -40000).Position);
                end;
                return;
            end;
        end);
        if v37 or v38 then
            if v68 then
                return;
            else
                v60 = l_ReplicatedStorage_0.Assets.FoVCamera:Clone();
                v60.Name = l_Character_0.Name .. "Camera";
                v60.Parent = l_Workspace_0.Debris;
                local v105 = 0;
                local function _() --[[ Line: 423 ]] --[[ Name: UpdateCameraCFrame ]]
                    -- upvalues: v105 (ref), v60 (ref), v34 (copy)
                    if os.time() - v105 < 0.5 then
                        return;
                    else
                        v105 = os.time();
                        v60:PivotTo(v34.StartCFrame * CFrame.new(0, -3, 0));
                        return;
                    end;
                end;
                if os.time() - v105 >= 0.5 then
                    v105 = os.time();
                    local v107 = v34.StartCFrame * CFrame.new(0, -3, 0);
                    v60:PivotTo(v107);
                end;
                local v108 = {
                    Animator = v60.AnimationController.Animator, 
                    AnimId = v27.Animations.Camera
                };
                local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v108);
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 442 ]]
                    -- upvalues: l_CurrentCamera_0 (copy), v60 (ref), v105 (ref), v34 (copy)
                    l_CurrentCamera_0.CFrame = v60.CamPart.CFrame;
                    l_CurrentCamera_0.FieldOfView = math.abs((v60.FovPart.Position - v60.RootPart.Position).Y);
                    if os.time() - v105 < 0.5 then
                        return;
                    else
                        v105 = os.time();
                        v60:PivotTo(v34.StartCFrame * CFrame.new(0, -3, 0));
                        return;
                    end;
                end);
                v67[#v67 + 1] = l_l_AnimHelper_0_Anim_2:GetMarkerReachedSignal("HidePlayer"):Connect(function() --[[ Line: 448 ]]
                    -- upvalues: v68 (ref), v21 (ref), l_Character_0 (copy), l_Victim_0 (copy)
                    if v68 then
                        return;
                    else
                        v21.SetTransparency(l_Character_0, 1);
                        v21.SetTransparency(l_Victim_0, 0);
                        return;
                    end;
                end);
                v67[#v67 + 1] = l_l_AnimHelper_0_Anim_2:GetMarkerReachedSignal("HideVictim"):Connect(function() --[[ Line: 457 ]]
                    -- upvalues: v68 (ref), v21 (ref), l_Character_0 (copy), l_Victim_0 (copy), v38 (copy), v37 (copy)
                    if v68 then
                        return;
                    else
                        v21.SetTransparency(l_Character_0, 0);
                        v21.SetTransparency(l_Victim_0, 1);
                        if v38 or v37 then
                            task.spawn(function() --[[ Line: 463 ]]
                                -- upvalues: v21 (ref)
                                v21.CameraShake({
                                    Preset = "HardHit", 
                                    WaitTime = 0.1, 
                                    Fade = 0.4
                                });
                            end);
                        end;
                        return;
                    end;
                end);
                v67[#v67 + 1] = l_l_AnimHelper_0_Anim_2:GetMarkerReachedSignal("Appear"):Connect(function() --[[ Line: 476 ]]
                    -- upvalues: v68 (ref), v21 (ref), l_Character_0 (copy), l_Victim_0 (copy)
                    if v68 then
                        return;
                    else
                        v21.SetTransparency(l_Character_0, 0);
                        v21.SetTransparency(l_Victim_0, 0);
                        return;
                    end;
                end);
                if v68 then
                    return;
                else
                    local v111 = TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, 0, true);
                    local _ = l_CommonUtilities_0.GetOccupied(l_Character_0);
                    local v113 = false;
                    local function v120() --[[ Line: 491 ]] --[[ Name: ResetPosition ]]
                        -- upvalues: v113 (ref), v68 (ref), l_RunService_0 (ref), l_Character_0 (copy), v34 (copy), l_Victim_0 (copy), v21 (ref)
                        if v113 then
                            return;
                        elseif v68 then
                            return;
                        else
                            v113 = true;
                            local v114 = nil;
                            v114 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 497 ]]
                                -- upvalues: l_Character_0 (ref), v34 (ref), l_Victim_0 (ref)
                                task.wait(0.016666666666666666);
                                l_Character_0:PivotTo(v34.StartCFrame * CFrame.Angles(0, 3.141592653589793, 0));
                                l_Victim_0:PivotTo(v34.StartCFrame * CFrame.new(0, 0, 5));
                            end);
                            task.delay(0.5, function() --[[ Line: 503 ]]
                                -- upvalues: v114 (ref), l_Character_0 (ref), l_Victim_0 (ref), v21 (ref)
                                if v114 then
                                    v114:Disconnect();
                                end;
                                for _, v116 in {
                                    l_Character_0, 
                                    l_Victim_0, 
                                    v21.GetWeldCharacter(l_Character_0), 
                                    v21.GetWeldCharacter(l_Victim_0)
                                } do
                                    for _, v118 in v116:GetDescendants() do
                                        if v118:IsA("BasePart") then
                                            local l_v118_Attribute_0 = v118:GetAttribute("PreviousCollisionGroup");
                                            if l_v118_Attribute_0 then
                                                v118.CollisionGroup = l_v118_Attribute_0;
                                                v118:SetAttribute("PreviousCollisionGroup", nil);
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
                    if v68 then
                        return;
                    else
                        local v121 = l_Main_0.White:Clone();
                        v121.Position = UDim2.new(0, 0, 0, 0);
                        v121.Parent = l_Common_0;
                        task.delay(3, function() --[[ Line: 530 ]]
                            -- upvalues: v121 (copy)
                            v121:Destroy();
                        end);
                        l_TweenService_0:Create(v121, v111, {
                            BackgroundTransparency = 0
                        }):Play();
                        l_TweenService_0:Create(l_Lighting_0, v111, {
                            ExposureCompensation = 2
                        }):Play();
                        l_TweenService_0:Create(l_Main_0.White, v111, {
                            BackgroundTransparency = 0
                        }):Play();
                        task.wait(1);
                        v120();
                        for _, v123 in l_Main_0:GetChildren() do
                            if v123:IsA("Frame") then
                                v123.Position = UDim2.new(0, 0, 0, 0);
                            end;
                        end;
                        for _, v125 in v67 do
                            v125:Disconnect();
                        end;
                        l_l_AnimHelper_0_Anim_2:Stop(0.1);
                        if l_l_AnimHelper_0_Anim_1 then
                            l_l_AnimHelper_0_Anim_1:Stop(0.1);
                        end;
                        l_l_AnimHelper_0_Anim_0:Stop(0.1);
                        l_CameraMode_0.Value = "";
                        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v54, {
                            ImageTransparency = 1
                        }):Play();
                        local v126 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
                        l_TweenService_0:Create(l_Lighting_0, v126, {
                            ExposureCompensation = workspace.Exposure.Value
                        }):Play();
                        print("DEBUG// SHAKE");
                        v21.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                        v60:Destroy();
                        task.delay(0.5, function() --[[ Line: 572 ]]
                            -- upvalues: v67 (copy)
                            for _, v128 in v67 do
                                v128:Disconnect();
                            end;
                        end);
                        --[[ close >= 30 ]]
                    end;
                end;
            end;
        end;
        if not v38 and not v37 then
            l_Victim_0.PrimaryPart.Anchored = false;
            l_Character_0.PrimaryPart.Anchored = false;
        end;
        return;
    end;
end;
return v27;