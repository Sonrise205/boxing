local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_Assets_0 = l_ReplicatedStorage_0:WaitForChild("Assets");
local v9 = {
    Metadata = {
        DisplayName = "", 
        Rarity = "Mythic", 
        Price = 9999999999, 
        Description = "", 
        Time = 7.4901960784313735, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 18705345789, 
        Camera = 14350660939
    }
};
CameraShake = function(v10) --[[ Line: 36 ]] --[[ Name: CameraShake ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_Workspace_0 (copy)
    local l_CameraShaker_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
    local l_camShake_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
    if not v10.Preset then
        return;
    else
        local l_FoV_0 = v10.FoV;
        if l_FoV_0 then
            l_Workspace_0.FoVMult.Value = v10.FoVMult or 3;
            l_Workspace_0.CurrentCamera.FieldOfView = l_FoV_0;
        end;
        local v14 = l_camShake_0:ShakeSustain(l_CameraShaker_0.Presets[v10.Preset]);
        task.delay(v10 and v10.WaitTime or 0.1, function() --[[ Line: 49 ]]
            -- upvalues: v14 (copy), v10 (copy)
            v14:StartFadeOut(v10 and v10.Fade or 0.2);
        end);
        return v14;
    end;
end;
TitleDrop = function() --[[ Line: 56 ]] --[[ Name: TitleDrop ]]
    -- upvalues: l_Players_0 (copy), l_Modules_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_TweenService_0 (copy)
    task.spawn(function() --[[ Line: 57 ]]
        -- upvalues: l_Players_0 (ref), l_Modules_0 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_TweenService_0 (ref)
        local l_Common_0 = l_Players_0.LocalPlayer.PlayerGui:FindFirstChild("Common");
        if not l_Common_0 then
            return;
        else
            local v16 = script.Frame:Clone();
            v16.Name = "TitleDrop";
            v16.TitleCopy.Text = "FATHER BRINGUS";
            v16.SubtitleCopy.Text = "The Ultimate Champion";
            local l_Main_0 = v16.Gradients:FindFirstChild("Main");
            if l_Main_0 then
                for _, v19 in v16:GetChildren() do
                    if v19:IsA("TextLabel") then
                        l_Main_0:Clone().Parent = v19;
                    end;
                end;
            end;
            local l_UserInputService_0 = game:GetService("UserInputService");
            if not l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.TouchEnabled then
                v16.Size = UDim2.new(1.15, 0, 1.15, 0);
            end;
            v16.Title.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\">" .. v16.TitleCopy.Text .. "</stroke>";
            v16.Subtitle.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\">" .. v16.SubtitleCopy.Text .. "</stroke>";
            v16.Vignette.ImageTransparency = 1;
            v16.Parent = l_Common_0;
            local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
            task.delay(0.05, function() --[[ Line: 94 ]]
                -- upvalues: l_EffectHelper_0 (copy), v16 (copy)
                l_EffectHelper_0.TripleText({
                    Image = v16.SubtitleCopy, 
                    HoldTime = 0.16666666666666666, 
                    Amount = 2
                });
            end);
            task.spawn(function() --[[ Line: 102 ]]
                -- upvalues: l_EffectHelper_0 (copy), v16 (copy)
                l_EffectHelper_0.TripleText({
                    Image = v16.TitleCopy, 
                    HoldTime = 0.6666666666666666, 
                    Amount = 2
                });
            end);
            l_SoundHelper_0:PlaySound({
                Name = "SFX", 
                Parent = l_Workspace_0, 
                DirectCopy = script.SFX
            });
            local v22 = TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
            local v23 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            local v24 = TweenInfo.new(1.3333333333333333, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            local v25 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
            local v26 = TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
            l_TweenService_0:Create(v16.Vignette, v22, {
                ImageTransparency = 0.4
            }):Play();
            local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
            l_ColorCorrectionEffect_0.Brightness = 0;
            l_ColorCorrectionEffect_0.Contrast = 0;
            l_ColorCorrectionEffect_0.Saturation = 0;
            l_ColorCorrectionEffect_0.Parent = game.Lighting;
            workspace.FoVMult.Value = 0.1;
            l_TweenService_0:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 35
            }):Play();
            l_TweenService_0:Create(l_ColorCorrectionEffect_0, v26, {
                Brightness = 0.1, 
                Contrast = 1, 
                Saturation = -1
            }):Play();
            task.wait(2.75);
            l_TweenService_0:Create(l_ColorCorrectionEffect_0, v25, {
                Brightness = 0, 
                Contrast = 0, 
                Saturation = 0
            }):Play();
            v16.Title.Text = v16.TitleCopy.Text;
            v16.Subtitle.Text = v16.SubtitleCopy.Text;
            l_TweenService_0:Create(v16.Vignette, v22, {
                ImageTransparency = 1
            }):Play();
            l_TweenService_0:Create(v16.Title, v23, {
                TextTransparency = 1
            }):Play();
            l_TweenService_0:Create(v16.Subtitle, v23, {
                TextTransparency = 1
            }):Play();
            l_TweenService_0:Create(v16, v24, {
                Size = UDim2.new(3, 0, 3, 0)
            }):Play();
            task.wait(1);
            v16.Name = "Remove";
            task.wait(4);
            v16:Destroy();
            l_ColorCorrectionEffect_0:Destroy();
            return;
        end;
    end);
end;
v9.Use = function(v28) --[[ Line: 166 ]] --[[ Name: Use ]]
    -- upvalues: l_Workspace_0 (copy), v9 (copy), l_Assets_0 (copy), l_AnimHelper_0 (copy), l_RunService_0 (copy), l_SoundHelper_0 (copy), l_TweenService_0 (copy), l_Players_0 (copy), l_Modules_0 (copy)
    if l_Workspace_0:GetAttribute("MatchStarted") then
        return;
    else
        local l_Character_0 = v28.Character;
        if not l_Character_0 then
            return;
        else
            local l_l_Character_0_Attribute_0 = l_Character_0:GetAttribute("ActiveNPC");
            l_Character_0 = l_Character_0:Clone();
            l_Character_0.Parent = l_Workspace_0.Debris;
            task.delay(10, function() --[[ Line: 177 ]]
                -- upvalues: l_Character_0 (ref)
                if l_Character_0 then
                    l_Character_0:Destroy();
                end;
            end);
            local l_Target_0 = v28.Target;
            if not l_Target_0 then
                return;
            else
                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                local v33 = {
                    Animator = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator"), 
                    AnimId = v9.Animations.Character, 
                    Priority = Enum.AnimationPriority.Action4, 
                    FadeIn = 0, 
                    AnimSpeed = 0.85
                };
                local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                l_CameraMode_0.Value = "Freecam";
                l_Character_0.PrimaryPart.Anchored = true;
                local v36 = l_Target_0.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, 0, 0);
                l_Character_0:SetPrimaryPartCFrame(v36);
                local v37 = l_Assets_0.MoonCamera:Clone();
                v37.Parent = l_Workspace_0.Debris;
                v37:PivotTo(l_Target_0.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(4, 0.5, 0.5));
                local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                v36 = l_CameraSettings_0.CameraTarget;
                local l_CameraMode_1 = l_CameraSettings_0.CameraMode;
                local l_Variant_0 = l_CameraSettings_0.Variant;
                for _, v42 in l_Workspace_0:GetChildren() do
                    if string.find(v42.Name, "m_") then
                        local l_EntranceTarget_0 = v42:FindFirstChild("EntranceTarget");
                        if l_EntranceTarget_0 then
                            local l_CFrame_0 = l_EntranceTarget_0.CFrame;
                            l_Character_0:SetPrimaryPartCFrame(l_CFrame_0);
                        end;
                    end;
                end;
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v33);
                game.Lighting.DepthOfField.Enabled = true;
                game.Lighting.DepthOfField.InFocusRadius = 5;
                l_CurrentCamera_0.CFrame = v37.Bone.CFrame;
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                l_Variant_0.Value = "Fight3";
                l_CameraMode_1.Value = "Knockdown";
                v36.Value = l_Character_0;
                l_CurrentCamera_0.FieldOfView = 50;
                task.delay(1.5, function() --[[ Line: 239 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                    l_SoundHelper_0:PlaySound({
                        Name = "GetUpCheer", 
                        Parent = l_Workspace_0
                    });
                    l_SoundHelper_0:PlaySound({
                        Name = "TheGamesIntro", 
                        Parent = l_Workspace_0
                    });
                end);
                task.delay(1, function() --[[ Line: 252 ]]
                    -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_0 (copy)
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        FieldOfView = 40
                    }):Play();
                end);
                local v46 = {
                    Animator = v37.AnimationController.Animator, 
                    AnimId = v9.Animations.Camera
                };
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v46);
                local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
                l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 266 ]]

                end);
                task.delay(1.607843137254902, function() --[[ Line: 270 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_1 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_TweenService_0 (ref), l_CurrentCamera_1 (copy)
                    task.spawn(function() --[[ Line: 271 ]]
                        CameraShake({
                            Preset = "LightHit", 
                            WaitTime = 0.1, 
                            Fade = 0.5
                        });
                    end);
                    task.wait(0.4313725490196078);
                    task.spawn(function() --[[ Line: 280 ]]
                        CameraShake({
                            Preset = "LightHit", 
                            WaitTime = 0.1, 
                            Fade = 0.5
                        });
                    end);
                    task.wait(0.4705882352941177);
                    l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.05);
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.05);
                    TitleDrop();
                    task.wait(3);
                    l_TweenService_0:Create(l_CurrentCamera_1, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        FieldOfView = 60
                    }):Play();
                    l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.765);
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.765);
                    task.spawn(function() --[[ Line: 301 ]]
                        CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.1, 
                            Fade = 0.5
                        });
                    end);
                end);
                local l_Vignette_0 = l_Players_0.LocalPlayer.PlayerGui:WaitForChild("Main").DownFrame.Vignette;
                local v51 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                l_TweenService_0:Create(l_Vignette_0, v51, {
                    ImageTransparency = 0.2
                }):Play();
                task.wait(v9.Metadata.Time - 1);
                if l_l_Character_0_Attribute_0 then
                    local v52 = {
                        FadeTime = 0.8, 
                        HoldTime = 1.3, 
                        IgnoreSound = true
                    };
                    task.spawn(function() --[[ Line: 324 ]]
                        -- upvalues: l_Modules_0 (ref), v52 (copy)
                        require(l_Modules_0:WaitForChild("Transitions")).FadeTransition(v52);
                    end);
                    task.delay(v52.HoldTime, function() --[[ Line: 329 ]]
                        -- upvalues: l_Character_0 (ref)
                        if l_Character_0 then
                            l_Character_0:Destroy();
                        end;
                    end);
                end;
                task.wait(1);
                l_TweenService_0:Create(l_Vignette_0, v51, {
                    ImageTransparency = 1
                }):Play();
                l_l_AnimHelper_0_Anim_0:Stop(0);
                l_l_AnimHelper_0_Anim_1:Stop(0);
                l_CameraMode_1.Value = "Cutscene";
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                v37:Destroy();
                return;
            end;
        end;
    end;
end;
return v9;