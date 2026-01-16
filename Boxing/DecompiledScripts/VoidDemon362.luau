local v0 = {
    Metadata = {
        DisplayName = "Requiem", 
        Rarity = "Mythic", 
        Price = 99999999999, 
        Description = "The immense power flowing through space.", 
        Time = 3.3, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 91213120992616, 
        Friend = 128939420479636, 
        Camera = 77723089367458
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
    local l_Players_0 = game:GetService("Players");
    local _ = game:GetService("Debris");
    local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
    local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
    local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
    local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
    local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
    local _ = require(l_Modules_0.Cutscene.Utilities);
    local v14 = require(l_Modules_0.Cutscene.CameraEffects);
    local v15 = require(l_Modules_0.Cutscene.Cutscene);
    local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
    local l_Debris_1 = l_Workspace_0:WaitForChild("Debris");
    local function _(v18, v19, v20) --[[ Line: 51 ]] --[[ Name: createAndDestroyEffect ]]
        local v21 = script.Lighting[v18]:Clone();
        v21.Parent = v19;
        task.wait(v20);
        v21:Destroy();
    end;
    CameraShake = function(v23) --[[ Line: 58 ]] --[[ Name: CameraShake ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), l_Workspace_0 (copy)
        local l_CameraShaker_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
        local l_camShake_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
        if not v23.Preset then
            return;
        else
            local l_FoV_0 = v23.FoV;
            if l_FoV_0 then
                l_Workspace_0.FoVMult.Value = v23.FoVMult or 3;
                l_Workspace_0.CurrentCamera.FieldOfView = l_FoV_0;
            end;
            local v27 = l_camShake_0:ShakeSustain(l_CameraShaker_0.Presets[v23.Preset]);
            task.delay(v23 and v23.WaitTime or 0.1, function() --[[ Line: 71 ]]
                -- upvalues: v27 (copy), v23 (copy)
                v27:StartFadeOut(v23 and v23.Fade or 0.2);
            end);
            return v27;
        end;
    end;
    v0.Use = function(v28) --[[ Line: 78 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_EmoteHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), v14 (copy), v15 (copy), l_Debris_1 (copy), l_SoundHelper_0 (copy), l_Modules_0 (copy), l_EffectHelper_0 (copy), l_RunService_0 (copy), l_TweenService_0 (copy)
        if l_Workspace_0:GetAttribute("MatchStarted") then
            return;
        else
            local l_Character_0 = v28.Character;
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_0);
            if not l_Character_0 then
                return;
            else
                local l_Target_0 = v28.Target;
                if not l_Target_0 then
                    return;
                else
                    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                    local l_IsInvolved_0 = v28.IsInvolved;
                    local v34 = {};
                    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                    local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                    local v37 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
                    l_EmoteHelper_0.StopAnimsHack(l_Character_0);
                    local v38 = {
                        Animator = v37, 
                        AnimId = v0.Animations.Character, 
                        Priority = Enum.AnimationPriority.Action4, 
                        FadeIn = 1
                    };
                    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                    local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
                    if l_IsInvolved_0 then
                        l_CameraMode_0.Value = "Freecam";
                    end;
                    l_Character_0:SetPrimaryPartCFrame(l_Target_0.CFrame);
                    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v38);
                    local v42 = nil;
                    local v43 = nil;
                    local v44 = nil;
                    local v45 = nil;
                    local v46 = nil;
                    local v47 = nil;
                    local v48 = nil;
                    local v49 = nil;
                    local v50 = nil;
                    if l_IsInvolved_0 then
                        v44 = v14.setupCamera(l_HumanoidRootPart_0);
                        v48 = v44.AnimationController.Animator;
                    end;
                    local v51 = script.R15:Clone();
                    v51.Parent = workspace.Welds;
                    local l_Humanoid_1 = v51.Humanoid;
                    local v53 = {
                        Animator = v51.Humanoid.Animator, 
                        AnimId = v0.Animations.Friend, 
                        Priority = Enum.AnimationPriority.Action4, 
                        FadeIn = 0
                    };
                    v51.Name = v51.Name .. "_Dummy";
                    l_Humanoid_1.PlatformStand = true;
                    l_Humanoid_1.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
                    for _, v55 in v51:GetChildren() do
                        if v55:IsA("BasePart") then
                            v55.Massless = true;
                            v55.Anchored = false;
                        end;
                    end;
                    local l_Weld_0 = Instance.new("Weld");
                    l_Weld_0.Parent = l_Character_0;
                    l_Weld_0.Part0 = l_HumanoidRootPart_0;
                    l_Weld_0.Part1 = v51.HumanoidRootPart;
                    l_Weld_0.C0 = CFrame.new(0, 1000, 0);
                    v15.adjustHumanoidProperties(l_Humanoid_0, l_HumanoidRootPart_0, {
                        WalkSpeed = 0, 
                        JumpPower = 0, 
                        Anchored = true
                    });
                    if l_IsInvolved_0 and v48 then
                        v49 = {
                            Animator = v48, 
                            AnimId = v0.Animations.Camera
                        };
                    end;
                    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v53);
                    if l_IsInvolved_0 then
                        v46 = l_AnimHelper_0:CreateAnim(v49);
                    end;
                    local v58 = script.Camera:Clone();
                    v58.Parent = l_Debris_1;
                    l_SoundHelper_0:PlaySound({
                        Name = "SFX", 
                        Parent = l_Workspace_0, 
                        DirectCopy = l_Modules_0.EffectHelper.VoidMoves.Bass
                    });
                    l_EffectHelper_0.SetTransparency(l_Players_0.LocalPlayer.Character, 1);
                    local v59 = {};
                    local v60 = {};
                    local v61 = {
                        "Live", 
                        "Welds"
                    };
                    v34[#v34 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Start", function() --[[ Line: 203 ]]
                        -- upvalues: l_IsInvolved_0 (copy), v49 (ref), v44 (ref), l_CurrentCamera_1 (copy), v34 (copy), l_RunService_0 (ref), l_TweenService_0 (ref), v47 (ref), v58 (copy), v15 (ref), l_l_AnimHelper_0_Anim_1 (copy), v43 (ref), l_Character_0 (copy), v42 (ref), v51 (copy), v59 (ref), v60 (ref), l_EffectHelper_0 (ref), v61 (copy), v45 (ref), l_HumanoidRootPart_0 (copy), v50 (ref), l_l_AnimHelper_0_Anim_0 (copy), v46 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Modules_0 (ref), l_CurrentCamera_0 (copy), l_Humanoid_0 (copy), l_CameraMode_0 (copy), l_Players_0 (ref)
                        if l_IsInvolved_0 and v49 and v44 then
                            l_CurrentCamera_1.CameraType = Enum.CameraType.Scriptable;
                            l_CurrentCamera_1.FieldOfView = 60;
                            v34[#v34 + 1] = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 214 ]]
                                -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_1 (ref), v44 (ref)
                                l_TweenService_0:Create(l_CurrentCamera_1, TweenInfo.new(1), {
                                    CFrame = (v44.camera.camera.TransformedWorldCFrame + v44.camera.camera.TransformedWorldCFrame.UpVector * -3.3) * CFrame.new(0.7, 0, 0)
                                }):Play();
                            end);
                        end;
                        if l_IsInvolved_0 then
                            l_TweenService_0:Create(l_CurrentCamera_1, TweenInfo.new(1.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                                FieldOfView = 40
                            }):Play();
                            task.wait(0.8);
                            task.spawn(function() --[[ Line: 232 ]]
                                CameraShake({
                                    Preset = "MediumHit", 
                                    WaitTime = 3, 
                                    Fade = 2
                                });
                            end);
                            v47 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 240 ]]
                                -- upvalues: v58 (ref)
                                v58.CFrame = workspace.CurrentCamera.CFrame;
                            end);
                        end;
                        v34[#v34 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_1, "Appear", function() --[[ Line: 245 ]]
                            -- upvalues: l_IsInvolved_0 (ref), v43 (ref), v15 (ref), l_Character_0 (ref), v42 (ref), v51 (ref), v59 (ref), v60 (ref), l_EffectHelper_0 (ref), v61 (ref), v45 (ref), l_HumanoidRootPart_0 (ref), v50 (ref), l_TweenService_0 (ref), v47 (ref), v58 (ref)
                            if l_IsInvolved_0 then
                                task.spawn(function() --[[ Line: 247 ]]
                                    CameraShake({
                                        Preset = "HardHit", 
                                        WaitTime = 3, 
                                        Fade = 2
                                    });
                                end);
                                v43 = v15.createHighlight(l_Character_0);
                                v42 = v15.createHighlight(v51);
                                local v62, v63 = l_EffectHelper_0.GetPartsToHide(l_Character_0, v61);
                                v59 = v62;
                                v60 = v63;
                                for _, v65 in v59 do
                                    v65.LocalTransparencyModifier = 1;
                                end;
                                for _, v67 in v60 do
                                    v67.Enabled = false;
                                end;
                                v45 = script.Background.Main:Clone();
                                v45.Parent = l_HumanoidRootPart_0;
                                for _, v69 in l_Character_0:GetChildren() do
                                    if v69:IsA("Shirt") or v69:IsA("Pants") or v69.Name == "Second" or v69.Name == "First" then
                                        v69:Destroy();
                                    elseif v69.Name == "Third" and v69:FindFirstChild("Handle") then
                                        v69.Handle.Transparency = 0;
                                    end;
                                end;
                                for _, v71 in l_Character_0.Clothing:GetChildren() do
                                    if v71.Name == "Third" then
                                        v71.Parent = l_Character_0;
                                    else
                                        v71:Destroy();
                                    end;
                                end;
                                l_Character_0.Head.Transparency = 1;
                                l_Character_0.DemonHead.Transparency = 0;
                                v50 = v15.createColorCorrectionEffect({
                                    Brightness = 0.1, 
                                    Contrast = -10, 
                                    TintColor = Color3.new(0.4, 0.133333, 0.701961)
                                });
                                l_TweenService_0:Create(v50, TweenInfo.new(1), {
                                    Brightness = 0.1, 
                                    Contrast = 0.5, 
                                    Saturation = -0.5, 
                                    TintColor = Color3.new(1, 1, 1)
                                }):Play();
                                v47:Disconnect();
                                v58:Destroy();
                            end;
                            for _, v73 in script.Aura:GetChildren() do
                                if v73:IsA("ParticleEmitter") then
                                    for _, v75 in l_Character_0:GetChildren() do
                                        if v75:IsA("MeshPart") then
                                            local v76 = v73:Clone();
                                            v76.Parent = v75;
                                            v76:SetAttribute("Aura", true);
                                        end;
                                    end;
                                end;
                            end;
                            if l_IsInvolved_0 then
                                task.wait(0.2);
                                l_TweenService_0:Create(v43, TweenInfo.new(0.5), {
                                    FillTransparency = 1
                                }):Play();
                                l_TweenService_0:Create(v42, TweenInfo.new(0.5), {
                                    FillTransparency = 1
                                }):Play();
                            end;
                        end);
                        task.wait(1.5);
                        l_l_AnimHelper_0_Anim_0:AdjustSpeed(0);
                        l_l_AnimHelper_0_Anim_1:AdjustSpeed(0);
                        if v46 then
                            v46:AdjustSpeed(0);
                        end;
                        for _, v78 in v34 do
                            v78:Disconnect();
                        end;
                        l_SoundHelper_0:PlaySound({
                            Name = "SFX", 
                            Parent = l_Workspace_0, 
                            DirectCopy = l_Modules_0.EffectHelper.VoidMoves.Transform
                        });
                        task.defer(function() --[[ Line: 351 ]]
                            -- upvalues: l_TweenService_0 (ref), v50 (ref), l_l_AnimHelper_0_Anim_0 (ref), l_CurrentCamera_0 (ref), l_EffectHelper_0 (ref)
                            l_TweenService_0:Create(v50, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Brightness = -10
                            }):Play();
                            task.wait(1);
                            l_l_AnimHelper_0_Anim_0:Stop();
                            task.wait(3);
                            l_CurrentCamera_0.FieldOfView = 0;
                            task.defer(function() --[[ Line: 362 ]]
                                -- upvalues: l_EffectHelper_0 (ref)
                                l_EffectHelper_0.CameraShake({
                                    Preset = "HardHit", 
                                    WaitTime = 1, 
                                    Fade = 3
                                });
                            end);
                            l_TweenService_0:Create(v50, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Brightness = 0, 
                                Saturation = 0, 
                                Contrast = 0
                            }):Play();
                            task.wait(5);
                            if v50 then
                                v50:Destroy();
                            end;
                        end);
                        task.wait(0.5);
                        if v44 then
                            v44:Destroy();
                        end;
                        if v45 then
                            v45:Destroy();
                        end;
                        for _, v80 in l_Character_0:GetDescendants() do
                            if v80:IsA("ParticleEmitter") and v80:GetAttribute("Aura") then
                                v80.Enabled = false;
                                task.delay(1, function() --[[ Line: 389 ]]
                                    -- upvalues: v80 (copy)
                                    v80:Destroy();
                                end);
                            end;
                        end;
                        for _, v82 in v51:GetDescendants() do
                            if v82:IsA("BasePart") or v82:IsA("Decal") then
                                l_TweenService_0:Create(v82, TweenInfo.new(0.5), {
                                    Transparency = 1
                                }):Play();
                            end;
                        end;
                        if l_IsInvolved_0 then
                            for _, v84 in v59 do
                                v84.LocalTransparencyModifier = 0;
                            end;
                            for _, v86 in v60 do
                                v86.Enabled = true;
                            end;
                        end;
                        l_l_AnimHelper_0_Anim_0:Stop();
                        v51:Destroy();
                        v15.adjustHumanoidProperties(l_Humanoid_0, l_HumanoidRootPart_0, {
                            WalkSpeed = 16, 
                            JumpPower = 50, 
                            Anchored = false
                        });
                        if l_IsInvolved_0 then
                            l_CameraMode_0.Value = "";
                        end;
                        task.wait(0.5);
                        l_EffectHelper_0.TGESetTransparency(l_Players_0.LocalPlayer.Character, 0);
                        l_EffectHelper_0.SetTransparency(l_Players_0.LocalPlayer.Character, 0);
                        v51:Destroy();
                    end);
                    return;
                end;
            end;
        end;
    end;
    return v0;
end;