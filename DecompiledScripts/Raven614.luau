local v0 = {
    Metadata = {
        DisplayName = "Raven", 
        Rarity = "Mythic", 
        Price = 99999999999, 
        Description = "Emperor, charging up with an intense aura of energy.", 
        Time = 2.45, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 130350049988801, 
        Camera = 136417442104968
    }
};
if game:GetService("RunService"):IsServer() then
    return v0;
else
    local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
    local l_TweenService_0 = game:GetService("TweenService");
    local l_RunService_0 = game:GetService("RunService");
    local l_Workspace_0 = game:GetService("Workspace");
    local l_Lighting_0 = game:GetService("Lighting");
    local l_Players_0 = game:GetService("Players");
    local l_Debris_0 = game:GetService("Debris");
    local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
    local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
    local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
    local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
    local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
    local v13 = require(l_Modules_0.Cutscene.Utilities);
    local v14 = require(l_Modules_0.Cutscene.CameraEffects);
    local v15 = require(l_Modules_0.Cutscene.Cutscene);
    local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
    local l_Debris_1 = l_Workspace_0:WaitForChild("Debris");
    CameraShake = function(v18) --[[ Line: 49 ]] --[[ Name: CameraShake ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), l_Workspace_0 (copy)
        local l_CameraShaker_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
        local l_camShake_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
        if not v18.Preset then
            return;
        else
            local l_FoV_0 = v18.FoV;
            if l_FoV_0 then
                l_Workspace_0.FoVMult.Value = v18.FoVMult or 3;
                l_Workspace_0.CurrentCamera.FieldOfView = l_FoV_0;
            end;
            local v22 = l_camShake_0:ShakeSustain(l_CameraShaker_0.Presets[v18.Preset]);
            task.delay(v18 and v18.WaitTime or 0.1, function() --[[ Line: 62 ]]
                -- upvalues: v22 (copy), v18 (copy)
                v22:StartFadeOut(v18 and v18.Fade or 0.2);
            end);
            return v22;
        end;
    end;
    TitleDrop = function() --[[ Line: 69 ]] --[[ Name: TitleDrop ]]
        -- upvalues: l_Players_0 (copy), l_Modules_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_TweenService_0 (copy)
        task.spawn(function() --[[ Line: 70 ]]
            -- upvalues: l_Players_0 (ref), l_Modules_0 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_TweenService_0 (ref)
            local l_Common_0 = l_Players_0.LocalPlayer.PlayerGui:FindFirstChild("Common");
            if not l_Common_0 then
                return;
            else
                local v24 = script.Frame:Clone();
                v24.Name = "TitleDrop";
                v24.TitleCopy.Text = "RAVEN";
                v24.SubtitleCopy.Text = "The Heartless Lieutenant, Void Clan";
                local l_Main_0 = v24.Gradients:FindFirstChild("Main");
                if l_Main_0 then
                    for _, v27 in v24:GetChildren() do
                        if v27:IsA("TextLabel") then
                            l_Main_0:Clone().Parent = v27;
                        end;
                    end;
                end;
                local l_UserInputService_0 = game:GetService("UserInputService");
                if not l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.TouchEnabled then
                    v24.Size = UDim2.new(1.15, 0, 1.15, 0);
                end;
                v24.Title.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\">" .. v24.TitleCopy.Text .. "</stroke>";
                v24.Subtitle.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\">" .. v24.SubtitleCopy.Text .. "</stroke>";
                v24.Vignette.ImageTransparency = 1;
                v24.Parent = l_Common_0;
                local l_EffectHelper_1 = require(l_Modules_0:WaitForChild("EffectHelper"));
                task.delay(0.05, function() --[[ Line: 107 ]]
                    -- upvalues: l_EffectHelper_1 (copy), v24 (copy)
                    l_EffectHelper_1.TripleText({
                        Image = v24.SubtitleCopy, 
                        HoldTime = 0.16666666666666666, 
                        Amount = 2
                    });
                end);
                task.spawn(function() --[[ Line: 115 ]]
                    -- upvalues: l_EffectHelper_1 (copy), v24 (copy)
                    l_EffectHelper_1.TripleText({
                        Image = v24.TitleCopy, 
                        HoldTime = 0.6666666666666666, 
                        Amount = 2
                    });
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "SFX", 
                    Parent = l_Workspace_0, 
                    DirectCopy = script.SFX
                });
                local v30 = TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                local v31 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                local v32 = TweenInfo.new(1.3333333333333333, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                local v33 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                local v34 = TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                l_TweenService_0:Create(v24.Vignette, v30, {
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
                l_TweenService_0:Create(l_ColorCorrectionEffect_0, v34, {
                    Brightness = 0.1, 
                    Contrast = 0.5, 
                    Saturation = -1
                }):Play();
                task.wait(0.2);
                v24.Badge.Position = UDim2.new(0.5, 0, 0.4, 0);
                v24.Badge.Size = UDim2.new(1, 0, 1, 0);
                v24.Badge.Rotation = 41;
                local l_Exponential_0 = Enum.EasingStyle.Exponential;
                local l_Out_0 = Enum.EasingDirection.Out;
                task.spawn(function() --[[ Line: 163 ]]
                    -- upvalues: v24 (copy), l_TweenService_0 (ref), l_Exponential_0 (copy), l_Out_0 (copy)
                    for _ = 1, 10 do
                        local v39 = v24.Badge:Clone();
                        v39.Parent = v24;
                        v39.Position = v39.Position;
                        l_TweenService_0:Create(v39, TweenInfo.new(0.5, l_Exponential_0, l_Out_0), {
                            ImageTransparency = 1
                        }):Play();
                        task.wait(0.1);
                    end;
                end);
                l_TweenService_0:Create(v24.Badge, TweenInfo.new(0.5), {
                    Position = UDim2.new(0.349, 0, 0.233, 0), 
                    Size = UDim2.new(0.3, 0, 0.3, 0), 
                    Rotation = 0
                }):Play();
                task.wait(0.45);
                v24.Shine.ImageTransparency = 0.4;
                l_TweenService_0:Create(v24.Shine, TweenInfo.new(3), {
                    Position = UDim2.new(0.15, 0, -0.13, 0), 
                    Size = UDim2.new(0.7, 0, 0.7, 0), 
                    Rotation = 0, 
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(v24.Badge, TweenInfo.new(2), {
                    Position = UDim2.new(0.325, 0, 0.2, 0), 
                    Size = UDim2.new(0.35, 0, 0.35, 0), 
                    Rotation = 0
                }):Play();
                task.wait(2.9);
                l_TweenService_0:Create(v24.Badge, TweenInfo.new(0.5), {
                    Position = UDim2.new(0.349, 0, 0.233, 0), 
                    Size = UDim2.new(0.3, 0, 0.3, 0), 
                    Rotation = 0
                }):Play();
                task.spawn(function() --[[ Line: 206 ]]
                    -- upvalues: v24 (copy), l_TweenService_0 (ref), l_Exponential_0 (copy), l_Out_0 (copy)
                    for _ = 1, 10 do
                        local v41 = v24.Badge:Clone();
                        v41.Parent = v24;
                        v41.Position = v41.Position;
                        l_TweenService_0:Create(v41, TweenInfo.new(0.5, l_Exponential_0, l_Out_0), {
                            ImageTransparency = 1
                        }):Play();
                        task.wait(0.1);
                    end;
                end);
                v24.Title.Text = v24.TitleCopy.Text;
                v24.Subtitle.Text = v24.SubtitleCopy.Text;
                l_TweenService_0:Create(v24.Vignette, v30, {
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(v24.Title, v31, {
                    TextTransparency = 1
                }):Play();
                l_TweenService_0:Create(v24.Subtitle, v31, {
                    TextTransparency = 1
                }):Play();
                l_TweenService_0:Create(v24.Shine, v31, {
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(v24.Badge, v31, {
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(v24, v32, {
                    Size = UDim2.new(3, 0, 3, 0)
                }):Play();
                task.wait(1);
                l_TweenService_0:Create(l_ColorCorrectionEffect_0, v33, {
                    Brightness = 0, 
                    Contrast = 0, 
                    Saturation = 0
                }):Play();
                v24.Name = "Remove";
                task.wait(4);
                v24:Destroy();
                l_ColorCorrectionEffect_0:Destroy();
                return;
            end;
        end);
    end;
    local function _(v42, v43, v44) --[[ Line: 247 ]] --[[ Name: createAndDestroyEffect ]]
        local v45 = script.Lighting[v42]:Clone();
        v45.Parent = v43;
        task.wait(v44);
        v45:Destroy();
    end;
    v0.Use = function(v47) --[[ Line: 254 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_EmoteHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), v14 (copy), l_Lighting_0 (copy), v15 (copy), l_Debris_1 (copy), l_RunService_0 (copy), l_Debris_0 (copy), l_EffectHelper_0 (copy), l_TweenService_0 (copy), v13 (copy)
        if l_Workspace_0:GetAttribute("MatchStarted") then
            return;
        else
            local l_Character_0 = v47.Character;
            if not l_Character_0 then
                return;
            else
                local l_Target_0 = v47.Target;
                if not l_Target_0 then
                    return;
                else
                    local l_IsInvolved_0 = v47.IsInvolved;
                    local v51 = {};
                    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                    local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                    local v54 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
                    l_EmoteHelper_0.StopAnimsHack(l_Character_0);
                    local v55 = {
                        Animator = v54, 
                        AnimId = v0.Animations.Character, 
                        Priority = Enum.AnimationPriority.Action4, 
                        FadeIn = 0
                    };
                    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                    if l_IsInvolved_0 then
                        l_CameraMode_0.Value = "Freecam";
                    end;
                    l_Character_0:SetPrimaryPartCFrame(l_Target_0.CFrame);
                    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v55);
                    l_SoundHelper_0:PlaySound({
                        Name = "SFX", 
                        Parent = l_IsInvolved_0 and l_Workspace_0 or l_Character_0, 
                        DirectCopy = script.Main
                    }).TimePosition = 1.5;
                    local v59 = nil;
                    local v60 = nil;
                    if l_IsInvolved_0 then
                        v59 = v14.setupCamera(l_HumanoidRootPart_0);
                        v60 = v59.AnimationController.Animator;
                    end;
                    local l_ClockTime_0 = l_Lighting_0.ClockTime;
                    v15.adjustHumanoidProperties(l_Humanoid_0, l_HumanoidRootPart_0, {
                        WalkSpeed = 0, 
                        JumpPower = 0, 
                        Anchored = true
                    });
                    local v62 = nil;
                    if l_IsInvolved_0 and v60 then
                        v62 = {
                            Animator = v60, 
                            AnimId = v0.Animations.Camera
                        };
                    end;
                    local v63 = RaycastParams.new();
                    v63.FilterType = Enum.RaycastFilterType.Exclude;
                    v63.FilterDescendantsInstances = {
                        l_Debris_1, 
                        l_Character_0
                    };
                    local v64 = nil;
                    if l_IsInvolved_0 then
                        v64 = l_AnimHelper_0:CreateAnim(v62);
                        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                    end;
                    local v65 = nil;
                    v51[#v51 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Start", function() --[[ Line: 345 ]]
                        -- upvalues: l_IsInvolved_0 (copy), v62 (ref), v59 (ref), v65 (ref), l_CurrentCamera_0 (copy), v51 (copy), l_RunService_0 (ref), v15 (ref), l_l_AnimHelper_0_Anim_0 (copy), l_Character_0 (copy), l_Debris_0 (ref), v64 (ref), l_EffectHelper_0 (ref), l_Debris_1 (ref), l_HumanoidRootPart_0 (copy), l_Lighting_0 (ref), l_TweenService_0 (ref), v13 (ref), v14 (ref), l_ClockTime_0 (copy), l_Humanoid_0 (copy), l_CameraMode_0 (copy)
                        if l_IsInvolved_0 and v62 and v59 then
                            v65 = l_CurrentCamera_0.CameraType;
                            l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
                            l_CurrentCamera_0.FieldOfView = 50;
                            v51[#v51 + 1] = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 353 ]]
                                -- upvalues: l_CurrentCamera_0 (ref), v59 (ref)
                                l_CurrentCamera_0.CFrame = v59.camera.camera.TransformedWorldCFrame + v59.camera.camera.TransformedWorldCFrame.UpVector * -3;
                            end);
                        end;
                        v51[#v51 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_0, "1", function() --[[ Line: 361 ]]
                            -- upvalues: l_Character_0 (ref), v51 (ref), v15 (ref), l_l_AnimHelper_0_Anim_0 (ref), l_Debris_0 (ref)
                            local v66 = script.Lines.Bruh:Clone();
                            v66.Parent = l_Character_0.RightHand;
                            v51[#v51 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_0, "2", function() --[[ Line: 364 ]]
                                -- upvalues: v66 (copy), l_Character_0 (ref), l_Debris_0 (ref)
                                v66:Destroy();
                                local v67 = script.Lines.Bruh:Clone();
                                v67.Parent = l_Character_0.LeftHand;
                                l_Debris_0:AddItem(v67, 0.2);
                            end);
                        end);
                        local v68 = nil;
                        local v69 = {};
                        local v70 = {};
                        local v71 = {
                            "Live", 
                            "Welds"
                        };
                        v51[#v51 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_0, "3", function() --[[ Line: 379 ]]
                            -- upvalues: l_Character_0 (ref), l_IsInvolved_0 (ref), l_l_AnimHelper_0_Anim_0 (ref), v64 (ref), v69 (ref), v70 (ref), l_EffectHelper_0 (ref), v71 (copy), v68 (ref), l_Debris_1 (ref), l_HumanoidRootPart_0 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref), v13 (ref), v51 (ref), v14 (ref), v59 (ref), l_ClockTime_0 (ref), l_CurrentCamera_0 (ref), v65 (ref), v15 (ref), l_Humanoid_0 (ref), l_CameraMode_0 (ref)
                            task.wait(0.7);
                            local l_Aura_0 = script.Aura;
                            for _, v74 in ipairs(l_Aura_0:GetChildren()) do
                                if v74:IsA("Part") then
                                    local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(v74.Name);
                                    if l_l_Character_0_FirstChild_0 then
                                        for _, v77 in ipairs(v74:GetChildren()) do
                                            v77:Clone().Parent = l_l_Character_0_FirstChild_0;
                                        end;
                                    end;
                                end;
                            end;
                            if l_IsInvolved_0 then
                                task.spawn(function() --[[ Line: 398 ]]
                                    CameraShake({
                                        Preset = "HardHit", 
                                        WaitTime = 4.5, 
                                        Fade = 2
                                    });
                                end);
                            end;
                            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0);
                            if l_IsInvolved_0 then
                                if v64 then
                                    v64:AdjustSpeed(0);
                                end;
                                local v78, v79 = l_EffectHelper_0.GetPartsToHide(l_Character_0, v71);
                                v69 = v78;
                                v70 = v79;
                                for _, v81 in v69 do
                                    v81.LocalTransparencyModifier = 1;
                                end;
                                for _, v83 in v70 do
                                    v83.Enabled = false;
                                end;
                                v68 = script.BlackBox:Clone();
                                v68.Parent = l_Debris_1;
                                v68:PivotTo(l_HumanoidRootPart_0.CFrame + Vector3.new(0, 0.009999999776482582, 0, 0));
                                l_Lighting_0.ClockTime = 0;
                                task.spawn(function() --[[ Line: 429 ]]
                                    -- upvalues: l_Lighting_0 (ref), l_TweenService_0 (ref)
                                    local v84 = "Impact" .. 1;
                                    local l_l_Lighting_0_0 = l_Lighting_0;
                                    local v86 = script.Lighting[v84]:Clone();
                                    v86.Parent = l_l_Lighting_0_0;
                                    task.wait(0.05);
                                    v86:Destroy();
                                    v84 = "Impact" .. 2;
                                    l_l_Lighting_0_0 = l_Lighting_0;
                                    v86 = script.Lighting[v84]:Clone();
                                    v86.Parent = l_l_Lighting_0_0;
                                    task.wait(0.05);
                                    v86:Destroy();
                                    v84 = "Impact" .. 3;
                                    l_l_Lighting_0_0 = l_Lighting_0;
                                    v86 = script.Lighting[v84]:Clone();
                                    v86.Parent = l_l_Lighting_0_0;
                                    task.wait(0.05);
                                    v86:Destroy();
                                    v84 = "Impact" .. 4;
                                    l_l_Lighting_0_0 = l_Lighting_0;
                                    v86 = script.Lighting[v84]:Clone();
                                    v86.Parent = l_l_Lighting_0_0;
                                    task.wait(0.05);
                                    v86:Destroy();
                                    v84 = "Impact" .. 5;
                                    l_l_Lighting_0_0 = l_Lighting_0;
                                    v86 = script.Lighting[v84]:Clone();
                                    v86.Parent = l_l_Lighting_0_0;
                                    task.wait(0.05);
                                    v86:Destroy();
                                    v84 = "Impact" .. 6;
                                    l_l_Lighting_0_0 = l_Lighting_0;
                                    v86 = script.Lighting[v84]:Clone();
                                    v86.Parent = l_l_Lighting_0_0;
                                    task.wait(0.05);
                                    v86:Destroy();
                                    v84 = Instance.new("BlurEffect");
                                    v84.Name = "EffectBlur";
                                    v84.Size = 26;
                                    v84.Parent = l_Lighting_0;
                                    l_TweenService_0:Create(v84, TweenInfo.new(0.5), {
                                        Size = 0
                                    }):Play();
                                end);
                            end;
                            local v87 = v13.SpawnGroup(script.PowerUp, l_HumanoidRootPart_0.CFrame, 8);
                            v13.Emit(v87);
                            TitleDrop();
                            task.wait(4);
                            for _, v89 in v51 do
                                v89:Disconnect();
                            end;
                            if l_IsInvolved_0 then
                                v14.createBlindness(0.5, 1);
                            end;
                            task.wait(0.5);
                            v87:Destroy();
                            if l_IsInvolved_0 and v59 then
                                v59:Destroy();
                            end;
                            if v68 then
                                v68:Destroy();
                                l_Lighting_0.ClockTime = l_ClockTime_0;
                            end;
                            for _, v91 in v69 do
                                v91.LocalTransparencyModifier = 0;
                            end;
                            for _, v93 in v70 do
                                v93.Enabled = true;
                            end;
                            l_HumanoidRootPart_0:FindFirstChild("MainAuraAttachment"):Destroy();
                            l_l_AnimHelper_0_Anim_0:Stop();
                            if l_IsInvolved_0 then
                                l_CurrentCamera_0.CameraType = v65 or Enum.CameraType.Scriptable;
                                l_CurrentCamera_0.FieldOfView = 70;
                            end;
                            v15.adjustHumanoidProperties(l_Humanoid_0, l_HumanoidRootPart_0, {
                                WalkSpeed = 16, 
                                JumpPower = 50, 
                                Anchored = false
                            });
                            if l_IsInvolved_0 then
                                l_CameraMode_0.Value = "";
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