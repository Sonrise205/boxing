local v0 = {
    Metadata = {
        DisplayName = "Raiden", 
        Rarity = "Rare", 
        Price = 99999999999, 
        Description = "The true sensation of unmatched speed.", 
        Time = 3.25, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 116469354967933, 
        Camera = 110803637643829
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
    local _ = require(l_Modules_0:WaitForChild("EffectHelper"));
    local v12 = require(l_Modules_0.Cutscene.Utilities);
    local v13 = require(l_Modules_0.Cutscene.CameraEffects);
    local v14 = require(l_Modules_0.Cutscene.Cutscene);
    local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
    local l_Debris_1 = l_Workspace_0:WaitForChild("Debris");
    local function _(v17, v18, v19, v20) --[[ Line: 49 ]] --[[ Name: createParticleEffect ]]
        -- upvalues: l_Debris_1 (copy), v12 (copy), l_Debris_0 (copy)
        local v21 = v17:Clone();
        v21.Parent = l_Debris_1;
        if v18 then
            v21.Position = v18;
        end;
        if v19 then
            v21.CFrame = v19;
        end;
        v12.Emit(v21);
        l_Debris_0:AddItem(v21, v20);
        return v21;
    end;
    local function v27(v23, v24) --[[ Line: 66 ]] --[[ Name: setCharacterTransparency ]]
        for _, v26 in pairs(v23:GetDescendants()) do
            if v26.Name ~= "HumanoidRootPart" and (v26:IsA("BasePart") or v26:IsA("MeshPart") or v26:IsA("Decal")) then
                v26.Transparency = v24 and 1 or 0;
            end;
        end;
    end;
    CameraShake = function(v28) --[[ Line: 74 ]] --[[ Name: CameraShake ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), l_Workspace_0 (copy)
        local l_CameraShaker_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
        local l_camShake_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
        if not v28.Preset then
            return;
        else
            local l_FoV_0 = v28.FoV;
            if l_FoV_0 then
                l_Workspace_0.FoVMult.Value = v28.FoVMult or 3;
                l_Workspace_0.CurrentCamera.FieldOfView = l_FoV_0;
            end;
            local v32 = l_camShake_0:ShakeSustain(l_CameraShaker_0.Presets[v28.Preset]);
            task.delay(v28 and v28.WaitTime or 0.1, function() --[[ Line: 87 ]]
                -- upvalues: v32 (copy), v28 (copy)
                v32:StartFadeOut(v28 and v28.Fade or 0.2);
            end);
            return v32;
        end;
    end;
    local l_Players_0 = game:GetService("Players");
    TitleDrop = function() --[[ Line: 97 ]] --[[ Name: TitleDrop ]]
        -- upvalues: l_Players_0 (copy), l_Modules_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_TweenService_0 (copy)
        task.spawn(function() --[[ Line: 98 ]]
            -- upvalues: l_Players_0 (ref), l_Modules_0 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_TweenService_0 (ref)
            local l_Common_0 = l_Players_0.LocalPlayer.PlayerGui:FindFirstChild("Common");
            if not l_Common_0 then
                return;
            else
                local v35 = script.Frame:Clone();
                v35.Name = "TitleDrop";
                v35.TitleCopy.Text = "RAIDEN";
                v35.SubtitleCopy.Text = "The Shadow Lieutenant, Void Clan";
                local l_Main_0 = v35.Gradients:FindFirstChild("Main");
                if l_Main_0 then
                    for _, v38 in v35:GetChildren() do
                        if v38:IsA("TextLabel") then
                            l_Main_0:Clone().Parent = v38;
                        end;
                    end;
                end;
                local l_UserInputService_0 = game:GetService("UserInputService");
                if not l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.TouchEnabled then
                    v35.Size = UDim2.new(1.15, 0, 1.15, 0);
                end;
                v35.Title.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\">" .. v35.TitleCopy.Text .. "</stroke>";
                v35.Subtitle.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\">" .. v35.SubtitleCopy.Text .. "</stroke>";
                v35.Vignette.ImageTransparency = 1;
                v35.Parent = l_Common_0;
                local l_EffectHelper_1 = require(l_Modules_0:WaitForChild("EffectHelper"));
                task.delay(0.05, function() --[[ Line: 135 ]]
                    -- upvalues: l_EffectHelper_1 (copy), v35 (copy)
                    l_EffectHelper_1.TripleText({
                        Image = v35.SubtitleCopy, 
                        HoldTime = 0.16666666666666666, 
                        Amount = 2
                    });
                end);
                task.spawn(function() --[[ Line: 143 ]]
                    -- upvalues: l_EffectHelper_1 (copy), v35 (copy)
                    l_EffectHelper_1.TripleText({
                        Image = v35.TitleCopy, 
                        HoldTime = 0.6666666666666666, 
                        Amount = 2
                    });
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "SFX", 
                    Parent = l_Workspace_0, 
                    DirectCopy = script.SFX
                });
                local v41 = TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                local v42 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                local v43 = TweenInfo.new(1.3333333333333333, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                local v44 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                local v45 = TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                l_TweenService_0:Create(v35.Vignette, v41, {
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
                l_TweenService_0:Create(l_ColorCorrectionEffect_0, v45, {
                    Brightness = 0.1, 
                    Contrast = 0.5, 
                    Saturation = -1
                }):Play();
                task.wait(0.2);
                v35.Badge.Position = UDim2.new(0.5, 0, 0.4, 0);
                v35.Badge.Size = UDim2.new(1, 0, 1, 0);
                v35.Badge.Rotation = 41;
                local l_Exponential_0 = Enum.EasingStyle.Exponential;
                local l_Out_0 = Enum.EasingDirection.Out;
                task.spawn(function() --[[ Line: 192 ]]
                    -- upvalues: v35 (copy), l_TweenService_0 (ref), l_Exponential_0 (copy), l_Out_0 (copy)
                    for _ = 1, 10 do
                        local v50 = v35.Badge:Clone();
                        v50.Parent = v35;
                        v50.Position = v50.Position;
                        l_TweenService_0:Create(v50, TweenInfo.new(0.5, l_Exponential_0, l_Out_0), {
                            ImageTransparency = 1
                        }):Play();
                        task.wait(0.1);
                    end;
                end);
                l_TweenService_0:Create(v35.Badge, TweenInfo.new(0.5), {
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0.2, 0, 0.2, 0), 
                    Rotation = 0
                }):Play();
                task.wait(0.45);
                v35.Shine.ImageTransparency = 0.4;
                l_TweenService_0:Create(v35.Shine, TweenInfo.new(3), {
                    Position = UDim2.new(0.15, 0, -0.13, 0), 
                    Size = UDim2.new(0.7, 0, 0.7, 0), 
                    Rotation = 0, 
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(v35.Badge, TweenInfo.new(2), {
                    Position = UDim2.new(0.3, 0, 0.2, 0), 
                    Size = UDim2.new(0.35, 0, 0.35, 0), 
                    Rotation = 0
                }):Play();
                task.wait(2.9);
                l_TweenService_0:Create(v35.Badge, TweenInfo.new(0.5), {
                    Position = UDim2.new(0.349, 0, 0.233, 0), 
                    Size = UDim2.new(0.3, 0, 0.3, 0), 
                    Rotation = 0
                }):Play();
                task.spawn(function() --[[ Line: 236 ]]
                    -- upvalues: v35 (copy), l_TweenService_0 (ref), l_Exponential_0 (copy), l_Out_0 (copy)
                    for _ = 1, 10 do
                        local v52 = v35.Badge:Clone();
                        v52.Parent = v35;
                        v52.Position = v52.Position;
                        l_TweenService_0:Create(v52, TweenInfo.new(0.5, l_Exponential_0, l_Out_0), {
                            ImageTransparency = 1
                        }):Play();
                        task.wait(0.1);
                    end;
                end);
                v35.Title.Text = v35.TitleCopy.Text;
                v35.Subtitle.Text = v35.SubtitleCopy.Text;
                l_TweenService_0:Create(v35.Vignette, v41, {
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(v35.Title, v42, {
                    TextTransparency = 1
                }):Play();
                l_TweenService_0:Create(v35.Subtitle, v42, {
                    TextTransparency = 1
                }):Play();
                l_TweenService_0:Create(v35.Shine, v42, {
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(v35.Badge, v42, {
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(v35, v43, {
                    Size = UDim2.new(3, 0, 3, 0)
                }):Play();
                task.wait(1);
                v35.Name = "Remove";
                l_TweenService_0:Create(l_ColorCorrectionEffect_0, v44, {
                    Brightness = 0, 
                    Contrast = 0, 
                    Saturation = 0
                }):Play();
                task.wait(4);
                v35:Destroy();
                l_ColorCorrectionEffect_0:Destroy();
                return;
            end;
        end);
    end;
    v0.Use = function(v53) --[[ Line: 277 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_EmoteHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), l_RunService_0 (copy), v13 (copy), v14 (copy), l_Debris_1 (copy), v12 (copy), l_Debris_0 (copy), l_TweenService_0 (copy), v27 (copy)
        if l_Workspace_0:GetAttribute("MatchStarted") then
            return;
        else
            local l_Character_0 = v53.Character;
            if not l_Character_0 then
                return;
            else
                local l_Target_0 = v53.Target;
                if not l_Target_0 then
                    return;
                else
                    local l_IsInvolved_0 = v53.IsInvolved;
                    local v57 = {};
                    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                    local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                    local v60 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
                    l_EmoteHelper_0.StopAnimsHack(l_Character_0);
                    local v61 = {
                        Animator = v60, 
                        AnimId = v0.Animations.Character, 
                        Priority = Enum.AnimationPriority.Action4, 
                        FadeIn = 0
                    };
                    local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                    local l_CameraMode_0 = l_CameraSettings_0.CameraMode;
                    local l_Variant_0 = l_CameraSettings_0.Variant;
                    local l_CameraTarget_0 = l_CameraSettings_0.CameraTarget;
                    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                    l_Character_0:SetPrimaryPartCFrame(l_Target_0.CFrame);
                    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v61);
                    l_SoundHelper_0:PlaySound({
                        Name = "SFX", 
                        Parent = l_IsInvolved_0 and l_Workspace_0 or l_Character_0, 
                        DirectCopy = script.Main
                    });
                    if l_IsInvolved_0 then
                        l_Variant_0.Value = "Fight1";
                        l_CameraMode_0.Value = "Knockdown";
                        l_CameraTarget_0.Value = l_Character_0;
                        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                    end;
                    local v68 = nil;
                    local v69 = nil;
                    if l_IsInvolved_0 then
                        v68 = v13.setupCamera(l_HumanoidRootPart_0);
                        if v68 then
                            v69 = v68.AnimationController.Animator;
                        end;
                    end;
                    v14.adjustHumanoidProperties(l_Humanoid_0, l_HumanoidRootPart_0, {
                        WalkSpeed = 0, 
                        JumpPower = 0, 
                        Anchored = true
                    });
                    local v70 = nil;
                    if l_IsInvolved_0 and v69 then
                        v70 = {
                            Animator = v69, 
                            AnimId = v0.Animations.Camera
                        };
                    end;
                    local v71 = RaycastParams.new();
                    v71.FilterType = Enum.RaycastFilterType.Exclude;
                    v71.FilterDescendantsInstances = {
                        l_Debris_1, 
                        l_Character_0
                    };
                    local v72 = nil;
                    if l_IsInvolved_0 then
                        v72 = l_AnimHelper_0:CreateAnim(v70);
                    end;
                    local v73 = nil;
                    v57[#v57 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Start", function() --[[ Line: 374 ]]
                        -- upvalues: l_IsInvolved_0 (copy), v70 (ref), v68 (ref), v73 (ref), l_CurrentCamera_0 (copy), v57 (copy), l_RunService_0 (ref), l_Character_0 (copy), l_Debris_1 (ref), v12 (ref), l_Debris_0 (ref), l_l_AnimHelper_0_Anim_0 (copy), v14 (ref), l_TweenService_0 (ref), l_HumanoidRootPart_0 (copy), v27 (ref), v53 (copy), v72 (ref), v13 (ref), l_Humanoid_0 (copy), l_CameraMode_0 (copy), l_Variant_0 (copy), l_CameraTarget_0 (copy)
                        if l_IsInvolved_0 and v70 and v68 then
                            v73 = l_CurrentCamera_0.CameraType;
                            l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
                            l_CurrentCamera_0.FieldOfView = 50;
                            v57[#v57 + 1] = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 382 ]]
                                -- upvalues: l_CurrentCamera_0 (ref), v68 (ref)
                                l_CurrentCamera_0.CFrame = v68.camera.camera.TransformedWorldCFrame + v68.camera.camera.TransformedWorldCFrame.UpVector * -3;
                            end);
                        end;
                        local v84 = {
                            LeftFoot = function() --[[ Line: 393 ]] --[[ Name: LeftFoot ]]
                                -- upvalues: l_Character_0 (ref), l_Debris_1 (ref), v12 (ref), l_Debris_0 (ref)
                                local l_Light_0 = script.Light;
                                local l_Position_0 = l_Character_0.LeftFoot.Position;
                                local v77 = l_Light_0:Clone();
                                v77.Parent = l_Debris_1;
                                if l_Position_0 then
                                    v77.Position = l_Position_0;
                                end;
                                v12.Emit(v77);
                                l_Debris_0:AddItem(v77, 4);
                            end, 
                            RightFoot = function() --[[ Line: 394 ]] --[[ Name: RightFoot ]]
                                -- upvalues: l_Character_0 (ref), l_Debris_1 (ref), v12 (ref), l_Debris_0 (ref)
                                local l_Light_1 = script.Light;
                                local l_Position_1 = l_Character_0.RightFoot.Position;
                                local v80 = l_Light_1:Clone();
                                v80.Parent = l_Debris_1;
                                if l_Position_1 then
                                    v80.Position = l_Position_1;
                                end;
                                v12.Emit(v80);
                                l_Debris_0:AddItem(v80, 4);
                            end, 
                            RightHand = function() --[[ Line: 395 ]] --[[ Name: RightHand ]]
                                -- upvalues: l_Character_0 (ref), l_Debris_1 (ref), v12 (ref), l_Debris_0 (ref)
                                local l_Light_2 = script.Light;
                                local l_Position_2 = l_Character_0.RightFoot.Position;
                                local v83 = l_Light_2:Clone();
                                v83.Parent = l_Debris_1;
                                if l_Position_2 then
                                    v83.Position = l_Position_2;
                                end;
                                v12.Emit(v83);
                                l_Debris_0:AddItem(v83, 4);
                            end
                        };
                        for v85, v86 in pairs(v84) do
                            v57[#v57 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal(v85):Connect(v86);
                        end;
                        local v87 = nil;
                        local v88 = nil;
                        local v89 = nil;
                        v57[#v57 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_0, "PowerUp", function() --[[ Line: 406 ]]
                            -- upvalues: l_IsInvolved_0 (ref), v87 (ref), v14 (ref), v88 (ref), l_TweenService_0 (ref), v12 (ref), l_Character_0 (ref), v89 (ref), l_Debris_1 (ref), l_HumanoidRootPart_0 (ref)
                            if l_IsInvolved_0 then
                                v87 = v14.createColorCorrectionEffect({
                                    Brightness = 0.8
                                });
                                v88 = v14.createColorCorrectionEffect();
                            end;
                            if l_IsInvolved_0 and v87 then
                                l_TweenService_0:Create(v87, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                    Brightness = 0
                                }):Play();
                            end;
                            v12.Emit(l_Character_0);
                            v89 = script.Part:Clone();
                            v89.Parent = l_Debris_1;
                            v89.HumanoidRootPart.Part1 = l_HumanoidRootPart_0;
                        end);
                        v57[#v57 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Dash", function() --[[ Line: 433 ]]
                            -- upvalues: l_Character_0 (ref), l_Debris_1 (ref), v12 (ref), l_Debris_0 (ref), v89 (ref), l_IsInvolved_0 (ref), v88 (ref), l_TweenService_0 (ref), v27 (ref), v57 (ref), v14 (ref), l_l_AnimHelper_0_Anim_0 (ref)
                            local l_Dash_0 = script.Dash;
                            local l_Position_3 = l_Character_0.UpperTorso.Position;
                            local v92 = l_Dash_0:Clone();
                            v92.Parent = l_Debris_1;
                            if l_Position_3 then
                                v92.Position = l_Position_3;
                            end;
                            v12.Emit(v92);
                            l_Debris_0:AddItem(v92, 2);
                            v92.Weld.Part0 = l_Character_0.UpperTorso;
                            for _, v94 in v89:GetDescendants() do
                                if v94:IsA("ParticleEmitter") then
                                    v94.Enabled = false;
                                end;
                            end;
                            if l_IsInvolved_0 and v88 then
                                l_TweenService_0:Create(v88, TweenInfo.new(0.2), {
                                    Contrast = 0.8, 
                                    Saturation = -0.6
                                }):Play();
                            end;
                            v27(l_Character_0, true);
                            for _, v96 in workspace.Welds:FindFirstChild(l_Character_0.Name).WeldCharacter:GetDescendants() do
                                if v96:IsA("BasePart") then
                                    v96.LocalTransparencyModifier = 1;
                                end;
                            end;
                            v57[#v57 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_0, "TurnOff", function() --[[ Line: 457 ]]
                                -- upvalues: v27 (ref), l_Character_0 (ref), v89 (ref), l_IsInvolved_0 (ref), v88 (ref), l_TweenService_0 (ref)
                                v27(l_Character_0, false);
                                for _, v98 in workspace.Welds:FindFirstChild(l_Character_0.Name).WeldCharacter:GetDescendants() do
                                    if v98:IsA("BasePart") then
                                        v98.LocalTransparencyModifier = 0;
                                    end;
                                end;
                                for _, v100 in v89:GetDescendants() do
                                    if v100:IsA("ParticleEmitter") then
                                        v100.Enabled = true;
                                    end;
                                end;
                                if l_IsInvolved_0 and v88 then
                                    l_TweenService_0:Create(v88, TweenInfo.new(0.2), {
                                        Contrast = 0, 
                                        Saturation = 0
                                    }):Play();
                                end;
                            end);
                        end);
                        v57[#v57 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Land", function() --[[ Line: 480 ]]
                            -- upvalues: l_Character_0 (ref), l_Debris_1 (ref), v12 (ref), l_Debris_0 (ref), v53 (ref), l_l_AnimHelper_0_Anim_0 (ref), v72 (ref), l_TweenService_0 (ref), v89 (ref), l_CurrentCamera_0 (ref), l_IsInvolved_0 (ref), v87 (ref), v13 (ref), v88 (ref), v57 (ref), v68 (ref), v14 (ref), l_Humanoid_0 (ref), l_HumanoidRootPart_0 (ref), l_CameraMode_0 (ref), l_Variant_0 (ref), l_CameraTarget_0 (ref), l_RunService_0 (ref)
                            local l_Land_0 = script.Land;
                            local v102 = l_Character_0.UpperTorso.Position + Vector3.new(0, -2, 0, 0);
                            local v103 = l_Land_0:Clone();
                            v103.Parent = l_Debris_1;
                            if v102 then
                                v103.Position = v102;
                            end;
                            v12.Emit(v103);
                            l_Debris_0:AddItem(v103, 4);
                            local _ = v103;
                            task.spawn(function() --[[ Line: 482 ]]
                                CameraShake({
                                    Preset = "SuperHardHit", 
                                    WaitTime = 0.2, 
                                    Fade = 1
                                });
                            end);
                            task.wait(0.4);
                            if v53.IsEvent then
                                l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.09999999999999999);
                                v72:AdjustSpeed(0.15);
                                task.spawn(function() --[[ Line: 501 ]]
                                    -- upvalues: v72 (ref), l_TweenService_0 (ref)
                                    for v105 = 1, 45 do
                                        v72:AdjustSpeed((math.lerp(0.03333333333333333, 0.3, l_TweenService_0:GetValue(v105 / 45, Enum.EasingStyle.Quad, Enum.EasingDirection.In))));
                                        task.wait(0.016666666666666666);
                                    end;
                                end);
                                for _, v107 in l_Character_0:GetDescendants() do
                                    if v107:IsA("ParticleEmitter") then
                                        v107.TimeScale = v107.TimeScale * 0.1;
                                    end;
                                end;
                                task.spawn(function() --[[ Line: 523 ]]
                                    -- upvalues: v89 (ref), l_TweenService_0 (ref)
                                    local v108 = {};
                                    for _, v110 in v89:GetDescendants() do
                                        if v110:IsA("ParticleEmitter") then
                                            v110:SetAttribute("TS", v110.TimeScale);
                                            v110.ZOffset = v110.ZOffset - 2;
                                            table.insert(v108, v110);
                                        end;
                                    end;
                                    for v111 = 1, 90 do
                                        for _, v113 in v108 do
                                            v113.TimeScale = math.lerp(v113:GetAttribute("TS"), 0, (l_TweenService_0:GetValue(v111 / 90, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)));
                                        end;
                                        task.wait(0.016666666666666666);
                                    end;
                                end);
                                task.wait(0.2);
                                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                    FieldOfView = 35
                                }):Play();
                                TitleDrop();
                                task.wait(3.5);
                            end;
                            task.wait(0.5);
                            if l_IsInvolved_0 and v87 then
                                v87:Destroy();
                                v13.createBlindness(0.5, 1);
                            end;
                            for _, v115 in v89:GetDescendants() do
                                if v115:IsA("ParticleEmitter") then
                                    v115.Enabled = false;
                                end;
                            end;
                            task.wait(0.5);
                            if v88 then
                                v88:Destroy();
                            end;
                            for _, v117 in v57 do
                                v117:Disconnect();
                            end;
                            if l_IsInvolved_0 and v68 then
                                v68:Destroy();
                            end;
                            l_l_AnimHelper_0_Anim_0:Stop();
                            v89:Destroy();
                            v14.adjustHumanoidProperties(l_Humanoid_0, l_HumanoidRootPart_0, {
                                WalkSpeed = 16, 
                                JumpPower = 50, 
                                Anchored = false
                            });
                            if l_IsInvolved_0 then
                                l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
                                l_CurrentCamera_0.FieldOfView = 70;
                                l_CameraMode_0.Value = "";
                                l_Variant_0.Value = "";
                                l_CameraTarget_0.Value = nil;
                                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                            end;
                            if v53.IsEvent then
                                l_Land_0 = {
                                    ExtraHair1 = true, 
                                    Face1 = true, 
                                    SpikyHair = true
                                };
                                for _, v119 in l_Character_0:GetChildren() do
                                    if v119:IsA("Accessory") then
                                        v119.Handle.Transparency = l_Land_0[v119.Name] and 0 or 1;
                                        v119.Handle.LocalTransparencyModifier = 0;
                                    end;
                                end;
                            end;
                        end);
                    end);
                    return;
                end;
            end;
        end;
    end;
    return v0;
end;