local v0 = {
    Metadata = {
        DisplayName = "Darkness", 
        Rarity = "Mythic", 
        Price = 99999999999, 
        Description = "", 
        Time = 6.4, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 96667700993929, 
        Camera = 131300058002390
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
    local _ = game:GetService("Debris");
    local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
    local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
    local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
    local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
    local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
    local _ = require(l_Modules_0.Cutscene.Utilities);
    local v13 = require(l_Modules_0.Cutscene.CameraEffects);
    local v14 = require(l_Modules_0.Cutscene.Cutscene);
    local l_CommonUtilities_0 = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
    local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
    local _ = l_Workspace_0:WaitForChild("Debris");
    v0.Use = function(v18) --[[ Line: 49 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_CommonUtilities_0 (copy), l_SoundHelper_0 (copy), l_EmoteHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_ReplicatedStorage_0 (copy), v13 (copy), l_Lighting_0 (copy), l_RunService_0 (copy), l_EffectHelper_0 (copy), l_TweenService_0 (copy), v14 (copy)
        local _ = workspace:GetAttribute("RingEntrance");
        if l_Workspace_0:GetAttribute("MatchStarted") then
            return;
        else
            local l_Character_0 = v18.Character;
            if not l_Character_0 then
                return;
            else
                local l_IsInvolved_0 = v18.IsInvolved;
                if not l_CommonUtilities_0.GetCharacterData(l_Character_0) then
                    return;
                else
                    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                    local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                    local v24 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
                    if not v24 then
                        return;
                    else
                        local _ = l_SoundHelper_0:PlaySound({
                            Name = "SFX", 
                            Parent = l_IsInvolved_0 and l_Workspace_0 or l_Character_0, 
                            DirectCopy = script.SFX
                        });
                        local v26 = {};
                        l_EmoteHelper_0.StopAnimsHack(l_Character_0);
                        local v27 = {
                            Name = "Entrance", 
                            Animator = v24, 
                            AnimId = v0.Animations.Character, 
                            Priority = Enum.AnimationPriority.Action4, 
                            FadeIn = 0
                        };
                        local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v27);
                        local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                        local _ = l_CameraSettings_0:WaitForChild("CameraTarget");
                        local l_CameraMode_0 = l_CameraSettings_0:WaitForChild("CameraMode");
                        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                        local v33 = nil;
                        local v34 = nil;
                        local _ = nil;
                        local v36 = CFrame.new(0, -3, 0);
                        local v37 = tick();
                        if l_IsInvolved_0 then
                            workspace:SetAttribute("IgnoreSetLighting", v37);
                            v33 = l_ReplicatedStorage_0.Assets.FoVCamera:Clone();
                            v33.Parent = workspace.Debris;
                            v33:PivotTo(l_HumanoidRootPart_0.CFrame * v36);
                            if v33 then
                                local v38 = {
                                    Animator = v33.AnimationController.Animator, 
                                    AnimId = v0.Animations.Camera
                                };
                                v34 = l_AnimHelper_0:CreateAnim(v38);
                            end;
                        end;
                        local v39 = nil;
                        if l_IsInvolved_0 then
                            v39 = v13.setupCameraShake();
                        end;
                        local v40 = nil;
                        local v41 = {};
                        local v42 = {};
                        local v43 = {
                            "Live", 
                            "Welds", 
                            "Debris"
                        };
                        local v44 = nil;
                        local v45 = false;
                        local function v52() --[[ Line: 134 ]] --[[ Name: Cleanup ]]
                            -- upvalues: v45 (ref), v26 (copy), l_IsInvolved_0 (copy), v13 (ref), v37 (copy), l_l_AnimHelper_0_Anim_0 (copy), v40 (ref), v44 (ref), l_Lighting_0 (ref), v41 (ref), v42 (ref), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref), v33 (ref)
                            if v45 then
                                return;
                            else
                                v45 = true;
                                for _, v47 in v26 do
                                    v47:Disconnect();
                                end;
                                if l_IsInvolved_0 then
                                    v13.createBlindness(0.5, 1);
                                end;
                                if workspace:GetAttribute("IgnoreSetLighting") == v37 then
                                    workspace:SetAttribute("IgnoreSetLighting", nil);
                                end;
                                task.wait(0.5);
                                l_l_AnimHelper_0_Anim_0:Stop();
                                if v40 then
                                    v40:Destroy();
                                end;
                                if v44 then
                                    v44:Destroy();
                                end;
                                l_Lighting_0.DepthOfField.Enabled = true;
                                if l_IsInvolved_0 and workspace:GetAttribute("RingEntrance") == v37 then
                                    for _, v49 in v41 do
                                        v49.LocalTransparencyModifier = 0;
                                    end;
                                    for _, v51 in v42 do
                                        v51.Enabled = true;
                                    end;
                                    l_CurrentCamera_0.FieldOfView = 70;
                                    l_CameraMode_0.Value = "";
                                    l_RunService_0:UnbindFromRenderStep("RingEntrance");
                                end;
                                if v33 then
                                    v33:Destroy();
                                end;
                                return;
                            end;
                        end;
                        task.delay(v0.Metadata.Time, function() --[[ Line: 176 ]]
                            -- upvalues: v52 (copy)
                            v52();
                        end);
                        v26[#v26 + 1] = l_ReplicatedStorage_0.Events.CleanupEntrances.Event:Connect(function() --[[ Line: 180 ]]
                            -- upvalues: v52 (copy)
                            v52();
                        end);
                        if l_IsInvolved_0 then
                            l_Lighting_0.DepthOfField.Enabled = false;
                            v44 = l_Lighting_0.DepthOfField:Clone();
                            v44.Enabled = true;
                            v44.Name = "MapRemove";
                            v44.Parent = l_Lighting_0;
                            v40 = script.Map:Clone();
                            v40.Parent = workspace.Debris;
                            task.delay(0.5, function() --[[ Line: 197 ]]
                                -- upvalues: v41 (ref), v42 (ref), l_EffectHelper_0 (ref), l_Character_0 (copy), v43 (copy)
                                local v53, v54 = l_EffectHelper_0.GetPartsToHide(l_Character_0, v43);
                                v41 = v53;
                                v42 = v54;
                                for _, v56 in v41 do
                                    v56.LocalTransparencyModifier = 1;
                                end;
                                for _, v58 in v42 do
                                    v58.Enabled = false;
                                end;
                            end);
                            for _, v60 in l_Lighting_0:GetChildren() do
                                if v60.Name == "MapRemove" or v60:IsA("Atmosphere") or v60:IsA("Sky") then
                                    v60:Destroy();
                                end;
                            end;
                            task.delay(1, function() --[[ Line: 219 ]]
                                -- upvalues: l_TweenService_0 (ref)
                                l_TweenService_0:Create(game.Lighting, TweenInfo.new(4.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                                    FogEnd = 90
                                }):Play();
                            end);
                            for _, v62 in v40.Lighting:GetChildren() do
                                v62.Parent = l_Lighting_0;
                                if v62:IsA("ColorCorrectionEffect") then
                                    task.delay(2, function() --[[ Line: 229 ]]
                                        -- upvalues: l_TweenService_0 (ref), v62 (copy)
                                        l_TweenService_0:Create(v62, TweenInfo.new(3.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
                                            Brightness = -0.1, 
                                            Saturation = -0.85, 
                                            Contrast = 0.6
                                        }):Play();
                                    end);
                                end;
                                if v62:IsA("BloomEffect") then
                                    local l_Threshold_0 = v62.Threshold;
                                    v62.Threshold = 0.7;
                                    l_TweenService_0:Create(v62, TweenInfo.new(4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                                        Threshold = l_Threshold_0
                                    }):Play();
                                end;
                            end;
                            local v64 = require(v40.Settings).Lighting or {};
                            for v65, v66 in v64 do
                                l_Lighting_0[v65] = v66;
                            end;
                            task.delay(0.5, function() --[[ Line: 254 ]]
                                -- upvalues: v44 (ref), l_TweenService_0 (ref)
                                v44.Enabled = true;
                                l_TweenService_0:Create(v44, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                                    FarIntensity = 0, 
                                    FocusDistance = 60, 
                                    InFocusRadius = 40, 
                                    NearIntensity = 0.2
                                }):Play();
                            end);
                        end;
                        task.spawn(function() --[[ Line: 266 ]]
                            -- upvalues: l_IsInvolved_0 (copy), v18 (copy), v33 (ref), l_CameraMode_0 (copy), l_RunService_0 (ref), l_CurrentCamera_0 (copy), l_HumanoidRootPart_0 (copy), v36 (copy), v40 (ref)
                            if l_IsInvolved_0 and v18 and v33 then
                                l_CameraMode_0.Value = "Freecam";
                                l_RunService_0:BindToRenderStep("RingEntrance", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 270 ]]
                                    -- upvalues: v33 (ref), l_CurrentCamera_0 (ref), l_HumanoidRootPart_0 (ref), v36 (ref), v40 (ref)
                                    if not v33 or not v33:FindFirstChild("CamPart") then
                                        return;
                                    else
                                        l_CurrentCamera_0.CFrame = v33.CamPart.CFrame;
                                        l_CurrentCamera_0.FieldOfView = math.abs((v33.FovPart.Position - v33.RootPart.Position).Y);
                                        v33:PivotTo(l_HumanoidRootPart_0.CFrame * v36);
                                        if v40 then
                                            v40:SetPrimaryPartCFrame(l_HumanoidRootPart_0.CFrame);
                                        end;
                                        return;
                                    end;
                                end);
                            end;
                        end);
                        v34:AdjustSpeed(0.1);
                        l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.1);
                        task.wait(0.35);
                        v34:AdjustSpeed(1);
                        l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
                        v26[#v26 + 1] = v14.onMarkerReached(v34, "Zoom", function() --[[ Line: 290 ]]
                            -- upvalues: l_IsInvolved_0 (copy), l_EffectHelper_0 (ref), v40 (ref), v41 (ref), v42 (ref)
                            if l_IsInvolved_0 then
                                l_EffectHelper_0.CreateImpactFrame({
                                    Time = 0.06
                                });
                                if v40 then
                                    v40:Destroy();
                                    v40 = nil;
                                end;
                                for _, v69 in v41 do
                                    v69.LocalTransparencyModifier = 0;
                                end;
                                for _, v71 in v42 do
                                    v71.Enabled = true;
                                end;
                            end;
                        end);
                        return;
                    end;
                end;
            end;
        end;
    end;
    return v0;
end;