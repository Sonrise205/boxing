local v0 = {
    Metadata = {
        DisplayName = "Objection", 
        Rarity = "Mythic", 
        Price = 99999999999, 
        Description = "Used as a dramatic courtroom exclamation.", 
        Time = 3.38, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 98163742314262, 
        Camera = 84245754816394
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
    local v16 = require(l_Modules_0.Cutscene.Viewport);
    local l_CommonUtilities_0 = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
    local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
    local l_Debris_1 = l_Workspace_0:WaitForChild("Debris");
    v0.Use = function(v20) --[[ Line: 51 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_CommonUtilities_0 (copy), l_SoundHelper_0 (copy), l_EmoteHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), v14 (copy), l_Debris_1 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), v15 (copy), l_Debris_0 (copy), l_EffectHelper_0 (copy), v13 (copy), l_Players_0 (copy), v16 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy)
        local l_workspace_Attribute_0 = workspace:GetAttribute("RingEntrance");
        if l_Workspace_0:GetAttribute("MatchStarted") then
            return;
        else
            local l_Character_0 = v20.Character;
            if not l_Character_0 then
                return;
            else
                local l_IsInvolved_0 = v20.IsInvolved;
                if not l_CommonUtilities_0.GetCharacterData(l_Character_0) then
                    return;
                else
                    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                    local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                    local v26 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
                    if not v26 then
                        return;
                    else
                        local _ = l_SoundHelper_0:PlaySound({
                            Name = "SFX", 
                            Parent = l_IsInvolved_0 and l_Workspace_0 or l_Character_0, 
                            DirectCopy = script.SFX
                        });
                        local v28 = {};
                        l_EmoteHelper_0.StopAnimsHack(l_Character_0);
                        local v29 = {
                            Name = "Entrance", 
                            Animator = v26, 
                            AnimId = v0.Animations.Character, 
                            Priority = Enum.AnimationPriority.Action4, 
                            FadeIn = 0
                        };
                        local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v29);
                        warn("Character Anim: Made!");
                        local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                        local _ = l_CameraSettings_0:WaitForChild("CameraTarget");
                        local l_CameraMode_0 = l_CameraSettings_0:WaitForChild("CameraMode");
                        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                        local v35 = nil;
                        local v36 = nil;
                        local _ = nil;
                        if l_IsInvolved_0 then
                            v35 = v14.setupCamera(l_HumanoidRootPart_0);
                            if v35 then
                                local v38 = {
                                    Animator = v35.AnimationController.Animator, 
                                    AnimId = v0.Animations.Camera
                                };
                                v36 = l_AnimHelper_0:CreateAnim(v38);
                            end;
                        end;
                        local v39 = nil;
                        if l_IsInvolved_0 then
                            v39 = v14.setupCameraShake();
                        end;
                        local v40 = RaycastParams.new();
                        v40.FilterType = Enum.RaycastFilterType.Exclude;
                        v40.FilterDescendantsInstances = {
                            l_Debris_1, 
                            l_Character_0
                        };
                        local v41 = nil;
                        local v42 = nil;
                        local v43 = nil;
                        local v44 = nil;
                        local v45 = {};
                        local v46 = {};
                        local v47 = {
                            "Live", 
                            "Welds"
                        };
                        local v48 = nil;
                        local v49 = nil;
                        local v50 = nil;
                        local v51 = nil;
                        local v52 = false;
                        local function v59() --[[ Line: 139 ]] --[[ Name: Cleanup ]]
                            -- upvalues: v52 (ref), v28 (copy), l_IsInvolved_0 (copy), v14 (ref), v35 (ref), v43 (ref), v48 (ref), v49 (ref), v44 (ref), v50 (ref), v51 (ref), l_l_AnimHelper_0_Anim_0 (copy), v42 (ref), v45 (ref), v46 (ref), l_workspace_Attribute_0 (copy), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref)
                            if v52 then
                                return;
                            else
                                v52 = true;
                                for _, v54 in v28 do
                                    v54:Disconnect();
                                end;
                                if l_IsInvolved_0 then
                                    v14.createBlindness(0.5, 1);
                                end;
                                task.wait(0.5);
                                if l_IsInvolved_0 and v35 then
                                    v35:Destroy();
                                end;
                                if v43 then
                                    v43:Destroy();
                                end;
                                if v48 then
                                    v48:Destroy();
                                end;
                                if v49 then
                                    v44 = true;
                                    v49:Destroy();
                                end;
                                if v50 then
                                    v50:Destroy();
                                end;
                                if v51 then
                                    v51:Pause();
                                end;
                                l_l_AnimHelper_0_Anim_0:Stop();
                                if v42 then
                                    v42:Destroy();
                                end;
                                for _, v56 in v45 do
                                    v56.LocalTransparencyModifier = 0;
                                end;
                                for _, v58 in v46 do
                                    v58.Enabled = true;
                                end;
                                if l_IsInvolved_0 and workspace:GetAttribute("RingEntrance") == l_workspace_Attribute_0 then
                                    l_CurrentCamera_0.FieldOfView = 70;
                                    l_CameraMode_0.Value = "";
                                    l_RunService_0:UnbindFromRenderStep("RingEntrance");
                                end;
                                return;
                            end;
                        end;
                        task.delay(v0.Metadata.Time, function() --[[ Line: 179 ]]
                            -- upvalues: v59 (copy)
                            v59();
                        end);
                        v28[#v28 + 1] = l_ReplicatedStorage_0.Events.CleanupEntrances.Event:Connect(function() --[[ Line: 183 ]]
                            -- upvalues: v59 (copy)
                            v59();
                        end);
                        v28[#v28 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Start", function() --[[ Line: 187 ]]
                            -- upvalues: l_IsInvolved_0 (copy), v20 (copy), v35 (ref), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref), l_HumanoidRootPart_0 (copy), l_Character_0 (copy), v28 (copy), v15 (ref), l_l_AnimHelper_0_Anim_0 (copy), l_Debris_0 (ref), v45 (ref), v46 (ref), l_EffectHelper_0 (ref), v47 (copy), v43 (ref), v13 (ref), l_Players_0 (ref), v42 (ref), v44 (ref), v16 (ref), v41 (ref), v39 (ref), v48 (ref), l_Lighting_0 (ref), v36 (ref), v49 (ref), v50 (ref), v51 (ref), l_TweenService_0 (ref), v59 (copy)
                            warn("Start");
                            if l_IsInvolved_0 and v20 and v35 then
                                l_CurrentCamera_0.FieldOfView = 43;
                                l_CameraMode_0.Value = "Freecam";
                                l_RunService_0:BindToRenderStep("RingEntrance", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 193 ]]
                                    -- upvalues: v35 (ref), l_HumanoidRootPart_0 (ref), l_CurrentCamera_0 (ref)
                                    v35:PivotTo(l_HumanoidRootPart_0.CFrame);
                                    l_CurrentCamera_0.CFrame = v35.camera.camera.TransformedWorldCFrame + v35.camera.camera.TransformedWorldCFrame.UpVector * -3;
                                end);
                            end;
                            task.wait(1);
                            local v61 = script.Lines.Bruh:Clone();
                            v61.Parent = l_Character_0.LeftHand;
                            v28[#v28 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_0, "1", function() --[[ Line: 205 ]]
                                -- upvalues: v61 (copy)
                                v61:Destroy();
                            end);
                            v28[#v28 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_0, "2", function() --[[ Line: 209 ]]
                                -- upvalues: v61 (copy), l_Character_0 (ref), l_Debris_0 (ref)
                                v61:Destroy();
                                local v62 = script.Lines.Bruh:Clone();
                                v62.Parent = l_Character_0.RightHand;
                                l_Debris_0:AddItem(v62, 0.2);
                            end);
                            v28[#v28 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_0, "3", function() --[[ Line: 216 ]]
                                -- upvalues: l_IsInvolved_0 (ref), v45 (ref), v46 (ref), l_EffectHelper_0 (ref), l_Character_0 (ref), v47 (ref), v43 (ref), v13 (ref), l_HumanoidRootPart_0 (ref), l_Players_0 (ref), v42 (ref), v44 (ref), v16 (ref), v41 (ref), v15 (ref), v39 (ref), v48 (ref), l_Lighting_0 (ref), l_l_AnimHelper_0_Anim_0 (ref), v36 (ref), v49 (ref), v50 (ref), v51 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (ref), v59 (ref)
                                task.wait(0.14);
                                if l_IsInvolved_0 then
                                    local v63, v64 = l_EffectHelper_0.GetPartsToHide(l_Character_0, v47);
                                    v45 = v63;
                                    v46 = v64;
                                    for _, v66 in v45 do
                                        v66.LocalTransparencyModifier = 1;
                                    end;
                                    for _, v68 in v46 do
                                        v68.Enabled = false;
                                    end;
                                    v43 = v13.SpawnGroup(script.Main, l_HumanoidRootPart_0.CFrame, 10);
                                    v63 = l_Players_0.LocalPlayer;
                                    local v69;
                                    v64, v69 = v16.main(v63, l_Character_0);
                                    v42 = v64;
                                    v44 = v69;
                                    v41 = v15.createColorCorrectionEffect({
                                        Contrast = 10, 
                                        Saturation = -1.3
                                    });
                                    v42.Ambient = v42.Parent.IMPACT.Ambient;
                                    v42.LightColor = v42.Parent.IMPACT.LightColor;
                                    v42.LightDirection = v42.Parent.IMPACT.LightDirection;
                                    v39:ShakeOnce(3, 26, 0, 1);
                                    v15.adjustEffectProperties(v43, {
                                        TextureSpeed = 0.1
                                    });
                                end;
                                task.wait(0.1);
                                if l_IsInvolved_0 then
                                    v41:Destroy();
                                    v48 = script.ColorCorrection:Clone();
                                    v48.Parent = l_Lighting_0;
                                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.1);
                                    if v36 then
                                        v36:AdjustSpeed(0.1);
                                    end;
                                    v49 = v42.Parent;
                                    v42.Ambient = v42.Parent.COPY.Ambient;
                                    v42.LightColor = v42.Parent.COPY.LightColor;
                                    v42.LightDirection = v42.Parent.COPY.LightDirection;
                                    v50 = v15.createHighlight(l_Character_0, {
                                        FillTransparency = 0, 
                                        OutlineTransparency = 1, 
                                        FillColor = Color3.new(0, 0, 0)
                                    });
                                    v51 = l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(4), {
                                        FieldOfView = 47
                                    });
                                    v51:Play();
                                    v15.showSequenceFrames({
                                        v49["1"], 
                                        v49["2"], 
                                        v49["3"], 
                                        v49["4"], 
                                        v49["5"]
                                    }, 0.03);
                                    task.wait(1.1);
                                    v59();
                                end;
                            end);
                        end);
                        return;
                    end;
                end;
            end;
        end;
    end;
    return v0;
end;