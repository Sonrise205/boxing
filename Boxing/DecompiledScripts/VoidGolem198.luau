local v0 = {
    Metadata = {
        DisplayName = "Superhero", 
        Rarity = "Rare", 
        Price = 99999999999, 
        Description = "A superhero landing from the sky.", 
        Time = 0.8, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 94798307247196, 
        Camera = 75494518320163
    }
};
if game:GetService("RunService"):IsServer() then
    return v0;
else
    local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
    local l_TweenService_0 = game:GetService("TweenService");
    local l_RunService_0 = game:GetService("RunService");
    local l_Workspace_0 = game:GetService("Workspace");
    local _ = game:GetService("Lighting");
    local l_Debris_0 = game:GetService("Debris");
    local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
    local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
    local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
    local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
    local v11 = require(l_Modules_0.Cutscene.Utilities);
    local v12 = require(l_Modules_0.Cutscene.CameraEffects);
    local v13 = require(l_Modules_0.Cutscene.Cutscene);
    local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
    local l_Debris_1 = l_Workspace_0:WaitForChild("Debris");
    CameraShake = function(v16) --[[ Line: 47 ]] --[[ Name: CameraShake ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), l_Workspace_0 (copy)
        local l_CameraShaker_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
        local l_camShake_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
        if not v16.Preset then
            return;
        else
            local l_FoV_0 = v16.FoV;
            if l_FoV_0 then
                l_Workspace_0.FoVMult.Value = v16.FoVMult or 3;
                l_Workspace_0.CurrentCamera.FieldOfView = l_FoV_0;
            end;
            local v20 = l_camShake_0:ShakeSustain(l_CameraShaker_0.Presets[v16.Preset]);
            task.delay(v16 and v16.WaitTime or 0.1, function() --[[ Line: 60 ]]
                -- upvalues: v20 (copy), v16 (copy)
                v20:StartFadeOut(v16 and v16.Fade or 0.2);
            end);
            return v20;
        end;
    end;
    TitleDrop = function() --[[ Line: 67 ]] --[[ Name: TitleDrop ]]
        -- upvalues: l_Modules_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_TweenService_0 (copy)
        task.spawn(function() --[[ Line: 68 ]]
            -- upvalues: l_Modules_0 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_TweenService_0 (ref)
            local l_Common_0 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Common");
            if not l_Common_0 then
                return;
            else
                local v22 = script.Frame:Clone();
                v22.Name = "TitleDrop";
                v22.TitleCopy.Text = "??????";
                v22.SubtitleCopy.Text = "Void Samurai, Void Clan";
                local l_Main_0 = v22.Gradients:FindFirstChild("Main");
                if l_Main_0 then
                    for _, v25 in v22:GetChildren() do
                        if v25:IsA("TextLabel") then
                            l_Main_0:Clone().Parent = v25;
                        end;
                    end;
                end;
                local l_UserInputService_0 = game:GetService("UserInputService");
                if not l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.TouchEnabled then
                    v22.Size = UDim2.new(1.15, 0, 1.15, 0);
                end;
                v22.Title.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\">" .. v22.TitleCopy.Text .. "</stroke>";
                v22.Subtitle.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\">" .. v22.SubtitleCopy.Text .. "</stroke>";
                v22.Vignette.ImageTransparency = 1;
                v22.Parent = l_Common_0;
                local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
                task.delay(0.05, function() --[[ Line: 105 ]]
                    -- upvalues: l_EffectHelper_0 (copy), v22 (copy)
                    l_EffectHelper_0.TripleText({
                        Image = v22.SubtitleCopy, 
                        HoldTime = 0.16666666666666666, 
                        Amount = 2
                    });
                end);
                task.spawn(function() --[[ Line: 113 ]]
                    -- upvalues: l_EffectHelper_0 (copy), v22 (copy)
                    l_EffectHelper_0.TripleText({
                        Image = v22.TitleCopy, 
                        HoldTime = 0.6666666666666666, 
                        Amount = 2
                    });
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "SFX", 
                    Parent = l_Workspace_0, 
                    DirectCopy = script.SFX
                });
                local v28 = TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                local v29 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                local v30 = TweenInfo.new(1.3333333333333333, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                local v31 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                local v32 = TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                l_TweenService_0:Create(v22.Vignette, v28, {
                    ImageTransparency = 0.4
                }):Play();
                local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
                l_ColorCorrectionEffect_0.Brightness = 0;
                l_ColorCorrectionEffect_0.Contrast = 0;
                l_ColorCorrectionEffect_0.Saturation = 0;
                l_ColorCorrectionEffect_0.Parent = game.Lighting;
                workspace.FoVMult.Value = 0.1;
                l_TweenService_0:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FieldOfView = 55
                }):Play();
                l_TweenService_0:Create(l_ColorCorrectionEffect_0, v32, {
                    Brightness = 0.1, 
                    Contrast = 0.5, 
                    Saturation = -1
                }):Play();
                task.wait(0.2);
                v22.Badge.Position = UDim2.new(0.5, 0, 0.4, 0);
                v22.Badge.Size = UDim2.new(1, 0, 1, 0);
                v22.Badge.Rotation = 41;
                local l_Exponential_0 = Enum.EasingStyle.Exponential;
                local l_Out_0 = Enum.EasingDirection.Out;
                task.spawn(function() --[[ Line: 161 ]]
                    -- upvalues: v22 (copy), l_TweenService_0 (ref), l_Exponential_0 (copy), l_Out_0 (copy)
                    for _ = 1, 10 do
                        local v37 = v22.Badge:Clone();
                        v37.Parent = v22;
                        v37.Position = v37.Position;
                        l_TweenService_0:Create(v37, TweenInfo.new(0.5, l_Exponential_0, l_Out_0), {
                            ImageTransparency = 1
                        }):Play();
                        task.wait(0.1);
                    end;
                end);
                l_TweenService_0:Create(v22.Badge, TweenInfo.new(0.5), {
                    Position = UDim2.new(0.349, 0, 0.233, 0), 
                    Size = UDim2.new(0.3, 0, 0.3, 0), 
                    Rotation = 0
                }):Play();
                task.wait(0.45);
                v22.Shine.ImageTransparency = 0.4;
                l_TweenService_0:Create(v22.Shine, TweenInfo.new(3), {
                    Position = UDim2.new(0.15, 0, -0.13, 0), 
                    Size = UDim2.new(0.7, 0, 0.7, 0), 
                    Rotation = 0, 
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(v22.Badge, TweenInfo.new(2), {
                    Position = UDim2.new(0.325, 0, 0.2, 0), 
                    Size = UDim2.new(0.35, 0, 0.35, 0), 
                    Rotation = 0
                }):Play();
                task.wait(2.9);
                l_TweenService_0:Create(v22.Badge, TweenInfo.new(0.5), {
                    Position = UDim2.new(0.349, 0, 0.233, 0), 
                    Size = UDim2.new(0.3, 0, 0.3, 0), 
                    Rotation = 0
                }):Play();
                task.spawn(function() --[[ Line: 204 ]]
                    -- upvalues: v22 (copy), l_TweenService_0 (ref), l_Exponential_0 (copy), l_Out_0 (copy)
                    for _ = 1, 10 do
                        local v39 = v22.Badge:Clone();
                        v39.Parent = v22;
                        v39.Position = v39.Position;
                        l_TweenService_0:Create(v39, TweenInfo.new(0.5, l_Exponential_0, l_Out_0), {
                            ImageTransparency = 1
                        }):Play();
                        task.wait(0.1);
                    end;
                end);
                v22.Title.Text = v22.TitleCopy.Text;
                v22.Subtitle.Text = v22.SubtitleCopy.Text;
                l_TweenService_0:Create(v22.Vignette, v28, {
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(v22.Title, v29, {
                    TextTransparency = 1
                }):Play();
                l_TweenService_0:Create(v22.Subtitle, v29, {
                    TextTransparency = 1
                }):Play();
                l_TweenService_0:Create(v22.Shine, v29, {
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(v22.Badge, v29, {
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(v22, v30, {
                    Size = UDim2.new(3, 0, 3, 0)
                }):Play();
                task.wait(1);
                l_TweenService_0:Create(l_ColorCorrectionEffect_0, v31, {
                    Brightness = 0, 
                    Contrast = 0, 
                    Saturation = 0
                }):Play();
                v22.Name = "Remove";
                task.wait(4);
                v22:Destroy();
                l_ColorCorrectionEffect_0:Destroy();
                return;
            end;
        end);
    end;
    local function _(v40, v41, v42, v43) --[[ Line: 247 ]] --[[ Name: createParticleEffect ]]
        -- upvalues: l_Debris_1 (copy), v11 (copy), l_Debris_0 (copy)
        local v44 = v40:Clone();
        v44.Parent = l_Debris_1;
        if v41 then
            v44.Position = v41;
        end;
        if v42 then
            v44.CFrame = v42;
        end;
        v11.Emit(v44);
        l_Debris_0:AddItem(v44, v43);
        return v44;
    end;
    v0.Use = function(v46) --[[ Line: 264 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_EmoteHelper_0 (copy), v0 (copy), l_Modules_0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), v12 (copy), v13 (copy), l_Debris_1 (copy), l_RunService_0 (copy), v11 (copy), l_Debris_0 (copy), l_TweenService_0 (copy)
        if l_Workspace_0:GetAttribute("MatchStarted") then
            return;
        else
            local l_Character_0 = v46.Character;
            if not l_Character_0 then
                return;
            else
                local l_Target_0 = v46.Target;
                if not l_Target_0 then
                    return;
                else
                    local l_IsInvolved_0 = v46.IsInvolved;
                    local v50 = {};
                    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                    local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                    local v53 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
                    local l_Humanoid_1 = l_Character_0:FindFirstChild("Humanoid");
                    local l_HumanoidRootPart_1 = l_Character_0:FindFirstChild("HumanoidRootPart");
                    l_EmoteHelper_0.StopAnimsHack(l_Character_0);
                    local v56 = {
                        Animator = v53, 
                        AnimId = v0.Animations.Character, 
                        Priority = Enum.AnimationPriority.Action4, 
                        FadeIn = 0
                    };
                    local l_EffectHelper_1 = require(l_Modules_0:WaitForChild("EffectHelper"));
                    l_EffectHelper_1.SetTransparency(game.Players.LocalPlayer.Character, 1);
                    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                    l_Character_0:SetPrimaryPartCFrame(l_Target_0.CFrame);
                    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v56);
                    l_SoundHelper_0:PlaySound({
                        Name = "SFX", 
                        Parent = l_IsInvolved_0 and l_Workspace_0 or l_Character_0, 
                        DirectCopy = script.Main
                    });
                    if l_IsInvolved_0 then
                        l_CameraMode_0.Value = "Freecam";
                    end;
                    local v61 = nil;
                    local v62 = nil;
                    if l_IsInvolved_0 then
                        v61 = v12.setupCamera(l_HumanoidRootPart_0);
                        if v61 then
                            v62 = v61.AnimationController.Animator;
                        end;
                    end;
                    v13.adjustHumanoidProperties(l_Humanoid_0, l_HumanoidRootPart_0, {
                        WalkSpeed = 0, 
                        JumpPower = 0, 
                        Anchored = true
                    });
                    v13.adjustHumanoidProperties(l_Humanoid_1, l_HumanoidRootPart_1, {
                        WalkSpeed = 0, 
                        JumpPower = 0, 
                        Anchored = true
                    });
                    local v63 = nil;
                    if l_IsInvolved_0 and v62 then
                        v63 = {
                            Animator = v62, 
                            AnimId = v0.Animations.Camera
                        };
                    end;
                    local v64 = RaycastParams.new();
                    v64.FilterType = Enum.RaycastFilterType.Exclude;
                    v64.FilterDescendantsInstances = {
                        l_Debris_1, 
                        l_Character_0
                    };
                    local v65 = nil;
                    if l_IsInvolved_0 then
                        v65 = l_AnimHelper_0:CreateAnim(v63);
                    end;
                    v50[#v50 + 1] = v13.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Start", function() --[[ Line: 362 ]]
                        -- upvalues: l_IsInvolved_0 (copy), v63 (ref), v61 (ref), l_CurrentCamera_0 (copy), l_RunService_0 (ref), l_Character_0 (copy), v50 (copy), v13 (ref), l_l_AnimHelper_0_Anim_0 (copy), l_Debris_1 (ref), v11 (ref), l_Debris_0 (ref), l_Modules_0 (ref), l_HumanoidRootPart_0 (copy), l_TweenService_0 (ref), v65 (ref), l_EffectHelper_1 (copy), l_Humanoid_0 (copy), l_Humanoid_1 (copy), l_HumanoidRootPart_1 (copy), l_CameraMode_0 (copy)
                        if l_IsInvolved_0 and v63 and v61 then
                            l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
                            l_CurrentCamera_0.FieldOfView = 50;
                            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 1, function() --[[ Line: 370 ]]
                                -- upvalues: l_CurrentCamera_0 (ref), v61 (ref)
                                l_CurrentCamera_0.CFrame = v61.camera.camera.TransformedWorldCFrame + v61.camera.camera.TransformedWorldCFrame.UpVector * -3;
                            end);
                        end;
                        local v66 = script.Leg.Leg:Clone();
                        v66.Parent = l_Character_0.RightUpperLeg;
                        v50[#v50 + 1] = v13.onMarkerReached(l_l_AnimHelper_0_Anim_0, "1", function() --[[ Line: 381 ]]
                            -- upvalues: l_IsInvolved_0 (ref), l_Character_0 (ref), l_Debris_1 (ref), v11 (ref), l_Debris_0 (ref), l_Modules_0 (ref), l_HumanoidRootPart_0 (ref), l_TweenService_0 (ref), v66 (copy), v50 (ref), v13 (ref), l_l_AnimHelper_0_Anim_0 (ref), v65 (ref), l_RunService_0 (ref), l_EffectHelper_1 (ref), v61 (ref), l_Humanoid_0 (ref), l_Humanoid_1 (ref), l_HumanoidRootPart_1 (ref), l_CurrentCamera_0 (ref), l_CameraMode_0 (ref)
                            if l_IsInvolved_0 then
                                task.spawn(function() --[[ Line: 383 ]]
                                    CameraShake({
                                        Preset = "SuperHardHit", 
                                        WaitTime = 0.2, 
                                        Fade = 2
                                    });
                                end);
                            end;
                            local l_Land_0 = script.Land;
                            local v68 = l_Character_0.UpperTorso.Position + Vector3.new(0, -3, 0, 0);
                            local v69 = l_Land_0:Clone();
                            v69.Parent = l_Debris_1;
                            if v68 then
                                v69.Position = v68;
                            end;
                            v11.Emit(v69);
                            l_Debris_0:AddItem(v69, 6);
                            local l_v69_0 = v69;
                            task.spawn(function() --[[ Line: 393 ]]
                                CameraShake({
                                    Preset = "SuperHardHit", 
                                    WaitTime = 0.3, 
                                    Fade = 1.5
                                });
                            end);
                            l_Land_0 = require(l_Modules_0.Cutscene.Utilities);
                            v68 = script.SamuraiFire:Clone();
                            v68.Parent = workspace.Debris;
                            v68.CFrame = l_Character_0.PrimaryPart.CFrame * CFrame.new(0, -2.85, 0);
                            task.delay(6, function() --[[ Line: 407 ]]
                                -- upvalues: v68 (copy)
                                v68:Destroy();
                            end);
                            l_Land_0.Emit(v68);
                            task.delay(0.1, function() --[[ Line: 413 ]]
                                -- upvalues: l_Land_0 (copy), v68 (copy)
                                task.spawn(l_Land_0.Explode, v68.Position, {
                                    Rocks = 6, 
                                    SizeMagnitude = 1, 
                                    HorizontalVelocity = 40, 
                                    VerticalVelocity = 60, 
                                    Lifespan = 3, 
                                    MaxDistance = 0.1, 
                                    RaycastProperties = true
                                });
                            end);
                            v69 = v11.SpawnGroup(script.KickA, l_HumanoidRootPart_0.CFrame, 8);
                            v11.Emit(v69);
                            v69.Particles.Parent = l_Debris_1;
                            for _, v72 in v69:GetDescendants() do
                                if v72.Name == "Start" then
                                    if v72:FindFirstChild("Mesh") then
                                        v72.Transparency = 1;
                                    else
                                        v72.Transparency = 0;
                                    end;
                                    for _, v74 in v69:GetDescendants() do
                                        if v74.Name == "End" then
                                            if v72:IsA("MeshPart") and v72.Parent:FindFirstChild("End") then
                                                local v75 = TweenInfo.new(0.2);
                                                local v76 = {
                                                    Size = v72.Parent:FindFirstChild("End").Size, 
                                                    CFrame = v72.Parent:FindFirstChild("End").CFrame
                                                };
                                                l_TweenService_0:Create(v72, v75, v76):Play();
                                            end;
                                            if v72:FindFirstChildWhichIsA("SpecialMesh") and v72.Parent.End:FindFirstChildWhichIsA("SpecialMesh") then
                                                local l_SpecialMesh_0 = v72:FindFirstChildWhichIsA("SpecialMesh");
                                                local l_SpecialMesh_1 = v72.Parent.End:FindFirstChildWhichIsA("SpecialMesh");
                                                local v79 = TweenInfo.new(0.5);
                                                local v80 = {
                                                    Scale = l_SpecialMesh_1.Scale
                                                };
                                                l_TweenService_0:Create(l_SpecialMesh_0, v79, v80):Play();
                                                l_TweenService_0:Create(v72, TweenInfo.new(0.5), {
                                                    CFrame = v72.Parent.End.CFrame
                                                }):Play();
                                            end;
                                        end;
                                    end;
                                elseif v72.Name == "ThinOut" then
                                    if v72:IsA("MeshPart") then
                                        local v81 = TweenInfo.new(0.4);
                                        local v82 = {
                                            Size = Vector3.new(0, 0, v72.Size.Z)
                                        };
                                        l_TweenService_0:Create(v72, v81, v82):Play();
                                    end;
                                    if v72:FindFirstChildWhichIsA("SpecialMesh") then
                                        local l_SpecialMesh_2 = v72:FindFirstChildWhichIsA("SpecialMesh");
                                        local v84 = TweenInfo.new(0.4);
                                        local v85 = {
                                            Scale = Vector3.new(0, 0, 0, 0)
                                        };
                                        l_TweenService_0:Create(l_SpecialMesh_2, v84, v85):Play();
                                    end;
                                elseif v72.Name == "BigOut" and v72:FindFirstChildWhichIsA("SpecialMesh") then
                                    local l_SpecialMesh_3 = v72:FindFirstChildWhichIsA("SpecialMesh");
                                    local v87 = TweenInfo.new(0.5);
                                    local v88 = {
                                        Scale = l_SpecialMesh_3.Scale * 5
                                    };
                                    l_TweenService_0:Create(l_SpecialMesh_3, v87, v88):Play();
                                    l_TweenService_0:Create(v72, TweenInfo.new(0.45), {
                                        CFrame = v72.CFrame + v72.CFrame.RightVector * 35
                                    }):Play();
                                    l_TweenService_0:Create(v72.Decal, TweenInfo.new(0.45), {
                                        Transparency = 1
                                    }):Play();
                                end;
                            end;
                            task.wait(0.1);
                            v69:Destroy();
                            v66:Destroy();
                            v50[#v50 + 1] = v13.onMarkerReached(l_l_AnimHelper_0_Anim_0, "2", function() --[[ Line: 487 ]]
                                -- upvalues: l_l_AnimHelper_0_Anim_0 (ref), v65 (ref), v68 (copy), l_v69_0 (copy), l_RunService_0 (ref), v50 (ref), l_EffectHelper_1 (ref), l_IsInvolved_0 (ref), v61 (ref), v69 (copy), v13 (ref), l_Humanoid_0 (ref), l_HumanoidRootPart_0 (ref), l_Humanoid_1 (ref), l_HumanoidRootPart_1 (ref), l_CurrentCamera_0 (ref), l_CameraMode_0 (ref)
                                TitleDrop();
                                l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.2);
                                v65:AdjustSpeed(0.2);
                                for _, v90 in v68:GetDescendants() do
                                    if v90:IsA("ParticleEmitter") then
                                        v90.Enabled = false;
                                        v90.TimeScale = v90.TimeScale * 0.1;
                                    end;
                                end;
                                for _, v92 in l_v69_0:GetDescendants() do
                                    if v92:IsA("ParticleEmitter") then
                                        v92.Enabled = false;
                                        v92.TimeScale = v92.TimeScale * 0.02;
                                    end;
                                end;
                                local l_LocalPlayer_0 = game.Players.LocalPlayer;
                                local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
                                local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
                                task.wait(4.2);
                                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                                for _, v97 in v50 do
                                    v97:Disconnect();
                                end;
                                l_EffectHelper_1.SetTransparency(game.Players.LocalPlayer.Character, 0);
                                if l_IsInvolved_0 then
                                    if v61 then
                                        v61:Destroy();
                                    end;
                                    v69:Destroy();
                                    v68:Destroy();
                                    l_v69_0:Destroy();
                                end;
                                l_l_AnimHelper_0_Anim_0:Stop();
                                v13.adjustHumanoidProperties(l_Humanoid_0, l_HumanoidRootPart_0, {
                                    WalkSpeed = 16, 
                                    JumpPower = 50, 
                                    Anchored = false
                                });
                                v13.adjustHumanoidProperties(l_Humanoid_1, l_HumanoidRootPart_1, {
                                    WalkSpeed = 16, 
                                    JumpPower = 50, 
                                    Anchored = false
                                });
                                if l_IsInvolved_0 then
                                    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
                                    l_CurrentCamera_0.FieldOfView = 70;
                                    l_CameraMode_0.Value = "";
                                end;
                            end);
                        end);
                    end);
                    task.delay(5.2, function() --[[ Line: 557 ]]
                        -- upvalues: l_TweenService_0 (ref)
                        local l_Common_2 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Common");
                        if not l_Common_2 then
                            return;
                        else
                            local l_Frame_0 = Instance.new("Frame");
                            l_Frame_0.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
                            l_Frame_0.Position = UDim2.new(0, 0, 0, 0);
                            l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
                            l_Frame_0.BackgroundTransparency = 1;
                            l_Frame_0.Visible = true;
                            l_Frame_0.Parent = l_Common_2;
                            local v100 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                            l_TweenService_0:Create(l_Frame_0, v100, {
                                BackgroundTransparency = 0
                            }):Play();
                            task.wait(1.5);
                            local v101 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                            l_TweenService_0:Create(l_Frame_0, v101, {
                                BackgroundTransparency = 1
                            }):Play();
                            task.wait(3);
                            l_Frame_0:Destroy();
                            return;
                        end;
                    end);
                    return;
                end;
            end;
        end;
    end;
    return v0;
end;