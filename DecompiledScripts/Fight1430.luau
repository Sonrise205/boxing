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
        Time = 9.193939393939395, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 18706111758, 
        Camera = 14350660939
    }
};
weldAttachments = function(v10, v11) --[[ Line: 36 ]] --[[ Name: weldAttachments ]]
    local l_Weld_0 = Instance.new("Weld");
    l_Weld_0.Part0 = v10.Parent;
    l_Weld_0.Part1 = v11.Parent;
    l_Weld_0.C0 = v10.CFrame;
    l_Weld_0.C1 = v11.CFrame;
    l_Weld_0.Parent = v10.Parent;
    return l_Weld_0;
end;
local function _(v13, v14, v15, v16, v17, v18) --[[ Line: 46 ]] --[[ Name: buildWeld ]]
    local l_Weld_1 = Instance.new("Weld");
    l_Weld_1.Name = v13;
    l_Weld_1.Part0 = v15;
    l_Weld_1.Part1 = v16;
    l_Weld_1.C0 = v17;
    l_Weld_1.C1 = v18;
    l_Weld_1.Parent = v14;
    return l_Weld_1;
end;
local function v21(v22, v23) --[[ Line: 57 ]] --[[ Name: findFirstMatchingAttachment ]]
    -- upvalues: v21 (copy)
    for _, v25 in pairs(v22:GetChildren()) do
        if v25:IsA("Attachment") and v25.Name == v23 then
            return v25;
        elseif not v25:IsA("Accoutrement") and not v25:IsA("Tool") then
            local v26 = v21(v25, v23);
            if v26 then
                return v26;
            end;
        end;
    end;
end;
addAccoutrement = function(v27, v28) --[[ Line: 70 ]] --[[ Name: addAccoutrement ]]
    -- upvalues: v21 (copy)
    v28.Parent = v27;
    local l_Handle_0 = v28:FindFirstChild("Handle");
    if l_Handle_0 then
        local l_Attachment_0 = l_Handle_0:FindFirstChildOfClass("Attachment");
        if l_Attachment_0 then
            local v31 = v21(v27, l_Attachment_0.Name);
            if v31 then
                weldAttachments(v31, l_Attachment_0);
                return;
            end;
        else
            local l_Head_0 = v27:FindFirstChild("Head");
            if l_Head_0 then
                local v33 = CFrame.new(0, 0.5, 0);
                local l_AttachmentPoint_0 = v28.AttachmentPoint;
                local l_Weld_2 = Instance.new("Weld");
                l_Weld_2.Name = "HeadWeld";
                l_Weld_2.Part0 = l_Head_0;
                l_Weld_2.Part1 = l_Handle_0;
                l_Weld_2.C0 = v33;
                l_Weld_2.C1 = l_AttachmentPoint_0;
                l_Weld_2.Parent = l_Head_0;
            end;
        end;
    end;
end;
CameraShake = function(v36) --[[ Line: 92 ]] --[[ Name: CameraShake ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_Workspace_0 (copy)
    local l_CameraShaker_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
    local l_camShake_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
    if not v36.Preset then
        return;
    else
        local l_FoV_0 = v36.FoV;
        if l_FoV_0 then
            l_Workspace_0.FoVMult.Value = v36.FoVMult or 3;
            l_Workspace_0.CurrentCamera.FieldOfView = l_FoV_0;
        end;
        local v40 = l_camShake_0:ShakeSustain(l_CameraShaker_0.Presets[v36.Preset]);
        task.delay(v36 and v36.WaitTime or 0.1, function() --[[ Line: 105 ]]
            -- upvalues: v40 (copy), v36 (copy)
            v40:StartFadeOut(v36 and v36.Fade or 0.2);
        end);
        return v40;
    end;
end;
TitleDrop = function() --[[ Line: 112 ]] --[[ Name: TitleDrop ]]
    -- upvalues: l_Players_0 (copy), l_Modules_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_TweenService_0 (copy)
    task.spawn(function() --[[ Line: 113 ]]
        -- upvalues: l_Players_0 (ref), l_Modules_0 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_TweenService_0 (ref)
        local l_Common_0 = l_Players_0.LocalPlayer.PlayerGui:FindFirstChild("Common");
        if not l_Common_0 then
            return;
        else
            local v42 = script.Frame:Clone();
            v42.Name = "TitleDrop";
            v42.TitleCopy.Text = "YEONSU HAN";
            v42.SubtitleCopy.Text = "The Boss";
            local l_Main_0 = v42.Gradients:FindFirstChild("Main");
            if l_Main_0 then
                for _, v45 in v42:GetChildren() do
                    if v45:IsA("TextLabel") then
                        l_Main_0:Clone().Parent = v45;
                    end;
                end;
            end;
            local l_UserInputService_0 = game:GetService("UserInputService");
            if not l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.TouchEnabled then
                v42.Size = UDim2.new(1.15, 0, 1.15, 0);
            end;
            v42.Title.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\">" .. v42.TitleCopy.Text .. "</stroke>";
            v42.Subtitle.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\">" .. v42.SubtitleCopy.Text .. "</stroke>";
            v42.Vignette.ImageTransparency = 1;
            v42.Parent = l_Common_0;
            local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
            task.delay(0.05, function() --[[ Line: 150 ]]
                -- upvalues: l_EffectHelper_0 (copy), v42 (copy)
                l_EffectHelper_0.TripleText({
                    Image = v42.SubtitleCopy, 
                    HoldTime = 0.16666666666666666, 
                    Amount = 2
                });
            end);
            task.spawn(function() --[[ Line: 158 ]]
                -- upvalues: l_EffectHelper_0 (copy), v42 (copy)
                l_EffectHelper_0.TripleText({
                    Image = v42.TitleCopy, 
                    HoldTime = 0.6666666666666666, 
                    Amount = 2
                });
            end);
            l_SoundHelper_0:PlaySound({
                Name = "SFX", 
                Parent = l_Workspace_0, 
                DirectCopy = script.SFX
            });
            local v48 = TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
            local v49 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            local v50 = TweenInfo.new(1.3333333333333333, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            local v51 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
            local v52 = TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
            l_TweenService_0:Create(v42.Vignette, v48, {
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
            l_TweenService_0:Create(l_ColorCorrectionEffect_0, v52, {
                Brightness = 0.1, 
                Contrast = 0.5, 
                Saturation = -1
            }):Play();
            task.wait(2.75);
            l_TweenService_0:Create(l_ColorCorrectionEffect_0, v51, {
                Brightness = 0, 
                Contrast = 0, 
                Saturation = 0
            }):Play();
            v42.Title.Text = v42.TitleCopy.Text;
            v42.Subtitle.Text = v42.SubtitleCopy.Text;
            l_TweenService_0:Create(v42.Vignette, v48, {
                ImageTransparency = 1
            }):Play();
            l_TweenService_0:Create(v42.Title, v49, {
                TextTransparency = 1
            }):Play();
            l_TweenService_0:Create(v42.Subtitle, v49, {
                TextTransparency = 1
            }):Play();
            l_TweenService_0:Create(v42, v50, {
                Size = UDim2.new(3, 0, 3, 0)
            }):Play();
            task.wait(1);
            v42.Name = "Remove";
            task.wait(4);
            v42:Destroy();
            l_ColorCorrectionEffect_0:Destroy();
            return;
        end;
    end);
end;
v9.Use = function(v54) --[[ Line: 222 ]] --[[ Name: Use ]]
    -- upvalues: l_Workspace_0 (copy), v9 (copy), l_Assets_0 (copy), l_AnimHelper_0 (copy), l_RunService_0 (copy), l_SoundHelper_0 (copy), l_TweenService_0 (copy), l_Players_0 (copy), l_Modules_0 (copy)
    local l_Character_0 = v54.Character;
    if not l_Character_0 then
        return;
    else
        local l_l_Character_0_Attribute_0 = l_Character_0:GetAttribute("ActiveNPC");
        l_Character_0 = l_Character_0:Clone();
        l_Character_0.Parent = l_Workspace_0.Debris;
        task.delay(10, function() --[[ Line: 233 ]]
            -- upvalues: l_Character_0 (ref)
            if l_Character_0 then
                l_Character_0:Destroy();
            end;
        end);
        local l_Target_0 = v54.Target;
        if not l_Target_0 then
            return;
        else
            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
            local v59 = {
                Animator = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator"), 
                AnimId = v9.Animations.Character, 
                Priority = Enum.AnimationPriority.Action4, 
                FadeIn = 0, 
                AnimSpeed = 1.1
            };
            local l_ColorCorrectionEffect_1 = Instance.new("ColorCorrectionEffect");
            l_ColorCorrectionEffect_1.Brightness = 0.1;
            l_ColorCorrectionEffect_1.Contrast = 0;
            l_ColorCorrectionEffect_1.Saturation = 0;
            l_ColorCorrectionEffect_1.Parent = game.Lighting;
            local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
            local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
            l_CameraMode_0.Value = "Freecam";
            local v63 = script.Boxing:Clone();
            v63.Parent = l_Character_0;
            addAccoutrement(l_Character_0, v63);
            l_Character_0.PrimaryPart.Anchored = true;
            local v64 = l_Target_0.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, 0, 0);
            l_Character_0:SetPrimaryPartCFrame(v64);
            local v65 = l_Assets_0.MoonCamera:Clone();
            v65.Parent = l_Workspace_0.Debris;
            v65:PivotTo(l_Target_0.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(4, 0.5, 0.5));
            local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
            v64 = l_CameraSettings_0.CameraTarget;
            local l_CameraMode_1 = l_CameraSettings_0.CameraMode;
            local l_Variant_0 = l_CameraSettings_0.Variant;
            for _, v70 in l_Workspace_0:GetChildren() do
                if string.find(v70.Name, "m_") then
                    local l_EntranceTarget_0 = v70:FindFirstChild("EntranceTarget");
                    if l_EntranceTarget_0 then
                        local l_CFrame_0 = l_EntranceTarget_0.CFrame;
                        l_Character_0:SetPrimaryPartCFrame(l_CFrame_0);
                    end;
                end;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v59);
            game.Lighting.DepthOfField.Enabled = true;
            game.Lighting.DepthOfField.InFocusRadius = 5;
            l_CurrentCamera_0.CFrame = v65.Bone.CFrame;
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_Variant_0.Value = "Fight1";
            l_CameraMode_1.Value = "Knockdown";
            v64.Value = l_Character_0;
            task.delay(0.7, function() --[[ Line: 301 ]]
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
            l_CurrentCamera_0.FieldOfView = 25;
            task.delay(0.7, function() --[[ Line: 318 ]]
                -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_0 (copy)
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    FieldOfView = 45
                }):Play();
            end);
            local v74 = {
                Animator = v65.AnimationController.Animator, 
                AnimId = v9.Animations.Camera
            };
            local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v74);
            local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 332 ]]

            end);
            local v87 = {
                [1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Rip"):Connect(function() --[[ Line: 338 ]]
                    -- upvalues: v63 (copy), l_Workspace_0 (ref), l_Character_0 (ref), l_TweenService_0 (ref), l_l_AnimHelper_0_Anim_1 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_CurrentCamera_1 (copy)
                    v63:Destroy();
                    local l_l_Workspace_0_0 = l_Workspace_0;
                    l_l_Workspace_0_0.Gravity = l_l_Workspace_0_0.Gravity / 10;
                    task.delay(0, function() --[[ Line: 343 ]]
                        -- upvalues: l_Character_0 (ref), l_TweenService_0 (ref)
                        local v79 = script.Shirt:Clone();
                        local _ = l_Character_0:FindFirstChild("Humanoid");
                        v79.Parent = game.Workspace.Debris;
                        for _, v82 in v79:GetChildren() do
                            if v82:IsA("BasePart") then
                                v82.CanCollide = true;
                            end;
                        end;
                        v79.PrimaryPart.CanCollide = false;
                        v79:SetPrimaryPartCFrame(l_Character_0.LeftHand.CFrame * CFrame.new(2, -1.5, 0));
                        v79.UpperTorso.AssemblyLinearVelocity = CFrame.lookAt(v79.PrimaryPart.Position, (v79.PrimaryPart.CFrame * CFrame.new(-7, 6, -4)).Position).LookVector * 80 + Vector3.new(0, 1, 0, 0);
                        v79.UpperTorso.AssemblyAngularVelocity = Vector3.new(math.random(20, 35), 0, math.random(-45, -20));
                        for _, v84 in v79:GetChildren() do
                            if v84:IsA("BasePart") and v84 ~= v79.PrimaryPart then
                                l_TweenService_0:Create(v84, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                    Size = Vector3.new(v84.Size.X, v84.Size.Y, 0.3)
                                }):Play();
                            end;
                        end;
                        task.wait(4);
                        for _, v86 in v79:GetChildren() do
                            if v86:IsA("BasePart") then
                                l_TweenService_0:Create(v86, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                    Transparency = 1
                                }):Play();
                            end;
                        end;
                        task.wait(4);
                        v79:Destroy();
                    end);
                    task.wait(0.15);
                    l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.05);
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.05);
                    TitleDrop();
                    task.wait(3);
                    l_l_Workspace_0_0 = l_Workspace_0;
                    l_l_Workspace_0_0.Gravity = l_l_Workspace_0_0.Gravity * 10;
                    l_TweenService_0:Create(l_CurrentCamera_1, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        FieldOfView = 60
                    }):Play();
                    l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.9900000000000001);
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.9900000000000001);
                    task.spawn(function() --[[ Line: 391 ]]
                        CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.1, 
                            Fade = 0.5
                        });
                    end);
                end)
            };
            local l_Vignette_0 = l_Players_0.LocalPlayer.PlayerGui:WaitForChild("Main").DownFrame.Vignette;
            local v89 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
            l_TweenService_0:Create(l_Vignette_0, v89, {
                ImageTransparency = 0.2
            }):Play();
            task.wait(v9.Metadata.Time - 1);
            if l_l_Character_0_Attribute_0 then
                local v90 = {
                    FadeTime = 0.8, 
                    HoldTime = 1.3, 
                    IgnoreSound = true
                };
                task.spawn(function() --[[ Line: 414 ]]
                    -- upvalues: l_Modules_0 (ref), v90 (copy)
                    require(l_Modules_0:WaitForChild("Transitions")).FadeTransition(v90);
                end);
                task.delay(v90.HoldTime, function() --[[ Line: 419 ]]
                    -- upvalues: l_Character_0 (ref)
                    if l_Character_0 then
                        l_Character_0:Destroy();
                    end;
                end);
            end;
            task.wait(1);
            l_TweenService_0:Create(l_Vignette_0, v89, {
                ImageTransparency = 1
            }):Play();
            if l_ColorCorrectionEffect_1 then
                l_ColorCorrectionEffect_1:Destroy();
            end;
            l_l_AnimHelper_0_Anim_0:Stop(0);
            l_l_AnimHelper_0_Anim_1:Stop(0);
            for _, v92 in v87 do
                v92:Disconnect();
            end;
            l_CameraMode_1.Value = "Cutscene";
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            v65:Destroy();
            return;
        end;
    end;
end;
return v9;