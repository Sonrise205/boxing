local v0 = {
    Metadata = {
        DisplayName = "Emperor", 
        Rarity = "Mythic", 
        Price = 99999999999, 
        Description = "Emperor, charging up with an intense aura of energy.", 
        Time = 4.4, 
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
    local _ = game:GetService("Players");
    local l_Debris_0 = game:GetService("Debris");
    local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
    local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
    local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
    local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
    local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
    local v13 = require(l_Modules_0.Cutscene.Utilities);
    local v14 = require(l_Modules_0.Cutscene.CameraEffects);
    local v15 = require(l_Modules_0.Cutscene.Cutscene);
    local l_CommonUtilities_0 = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
    local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
    local l_Debris_1 = l_Workspace_0:WaitForChild("Debris");
    local function _(v19, v20, v21) --[[ Line: 50 ]] --[[ Name: createAndDestroyEffect ]]
        local v22 = script.Lighting[v19]:Clone();
        v22.Parent = v20;
        task.wait(v21);
        v22:Destroy();
    end;
    v0.Use = function(v24) --[[ Line: 57 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_CommonUtilities_0 (copy), l_SoundHelper_0 (copy), l_EmoteHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), v14 (copy), l_Lighting_0 (copy), l_Debris_1 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), v15 (copy), l_Debris_0 (copy), l_EffectHelper_0 (copy), l_TweenService_0 (copy), v13 (copy)
        local l_workspace_Attribute_0 = workspace:GetAttribute("RingEntrance");
        if l_Workspace_0:GetAttribute("MatchStarted") then
            return;
        else
            local l_Character_0 = v24.Character;
            if not l_Character_0 then
                return;
            else
                local l_IsInvolved_0 = v24.IsInvolved;
                if not l_CommonUtilities_0.GetCharacterData(l_Character_0) then
                    return;
                else
                    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                    local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                    local v30 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
                    if not v30 then
                        return;
                    else
                        local _ = l_SoundHelper_0:PlaySound({
                            Name = "SFX", 
                            Parent = l_IsInvolved_0 and l_Workspace_0 or l_Character_0, 
                            DirectCopy = script.SFX
                        });
                        local v32 = {};
                        l_EmoteHelper_0.StopAnimsHack(l_Character_0);
                        local v33 = {
                            Name = "Entrance", 
                            Animator = v30, 
                            AnimId = v0.Animations.Character, 
                            Priority = Enum.AnimationPriority.Action4, 
                            FadeIn = 0
                        };
                        local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v33);
                        local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                        local _ = l_CameraSettings_0:WaitForChild("CameraTarget");
                        local l_CameraMode_0 = l_CameraSettings_0:WaitForChild("CameraMode");
                        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                        local v39 = nil;
                        local v40 = nil;
                        local _ = nil;
                        if l_IsInvolved_0 then
                            v39 = v14.setupCamera(l_HumanoidRootPart_0);
                            if v39 then
                                local v42 = {
                                    Animator = v39.AnimationController.Animator, 
                                    AnimId = v0.Animations.Camera
                                };
                                v40 = l_AnimHelper_0:CreateAnim(v42);
                            end;
                        end;
                        local v43 = nil;
                        if l_IsInvolved_0 then
                            v43 = v14.setupCameraShake();
                        end;
                        local l_ClockTime_0 = l_Lighting_0.ClockTime;
                        local v45 = RaycastParams.new();
                        v45.FilterType = Enum.RaycastFilterType.Exclude;
                        v45.FilterDescendantsInstances = {
                            l_Debris_1, 
                            l_Character_0
                        };
                        local v46 = nil;
                        local v47 = nil;
                        local v48 = {};
                        local v49 = {};
                        local v50 = {
                            "Live", 
                            "Welds"
                        };
                        local v51 = false;
                        local function v59() --[[ Line: 139 ]] --[[ Name: Cleanup ]]
                            -- upvalues: v51 (ref), v32 (copy), l_IsInvolved_0 (copy), v14 (ref), v47 (ref), v39 (ref), v46 (ref), l_Lighting_0 (ref), l_ClockTime_0 (copy), v48 (ref), v49 (ref), l_HumanoidRootPart_0 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_workspace_Attribute_0 (copy), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref)
                            if v51 then
                                return;
                            else
                                v51 = true;
                                for _, v53 in v32 do
                                    v53:Disconnect();
                                end;
                                if l_IsInvolved_0 then
                                    v14.createBlindness(0.5, 1);
                                end;
                                task.wait(0.5);
                                if v47 then
                                    v47:Destroy();
                                end;
                                if l_IsInvolved_0 and v39 then
                                    v39:Destroy();
                                end;
                                if v46 then
                                    v46:Destroy();
                                end;
                                if l_IsInvolved_0 then
                                    l_Lighting_0.ClockTime = l_ClockTime_0;
                                end;
                                for _, v55 in v48 do
                                    v55.LocalTransparencyModifier = 0;
                                end;
                                for _, v57 in v49 do
                                    v57.Enabled = true;
                                end;
                                local l_MainAuraAttachment_0 = l_HumanoidRootPart_0:FindFirstChild("MainAuraAttachment");
                                if l_MainAuraAttachment_0 then
                                    l_MainAuraAttachment_0:Destroy();
                                end;
                                l_l_AnimHelper_0_Anim_0:Stop();
                                if l_IsInvolved_0 and workspace:GetAttribute("RingEntrance") == l_workspace_Attribute_0 then
                                    l_CurrentCamera_0.FieldOfView = 70;
                                    l_CameraMode_0.Value = "";
                                    l_RunService_0:UnbindFromRenderStep("RingEntrance");
                                end;
                                return;
                            end;
                        end;
                        task.delay(v0.Metadata.Time, function() --[[ Line: 185 ]]
                            -- upvalues: v59 (copy)
                            v59();
                        end);
                        v32[#v32 + 1] = l_ReplicatedStorage_0.Events.CleanupEntrances.Event:Connect(function() --[[ Line: 189 ]]
                            -- upvalues: v59 (copy)
                            v59();
                        end);
                        v32[#v32 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Start", function() --[[ Line: 194 ]]
                            -- upvalues: l_IsInvolved_0 (copy), v24 (copy), v39 (ref), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref), l_HumanoidRootPart_0 (copy), v32 (copy), v15 (ref), l_l_AnimHelper_0_Anim_0 (copy), l_Character_0 (copy), l_Debris_0 (ref), v43 (ref), v40 (ref), v48 (ref), v49 (ref), l_EffectHelper_0 (ref), v50 (copy), v46 (ref), l_Debris_1 (ref), l_Lighting_0 (ref), l_ReplicatedStorage_0 (ref), l_TweenService_0 (ref), v47 (ref), v13 (ref), v59 (copy)
                            if l_IsInvolved_0 and v24 and v39 then
                                l_CurrentCamera_0.FieldOfView = 50;
                                l_CameraMode_0.Value = "Freecam";
                                l_RunService_0:BindToRenderStep("RingEntrance", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 199 ]]
                                    -- upvalues: v39 (ref), l_HumanoidRootPart_0 (ref), l_CurrentCamera_0 (ref)
                                    v39:PivotTo(l_HumanoidRootPart_0.CFrame);
                                    l_CurrentCamera_0.CFrame = v39.camera.camera.TransformedWorldCFrame + v39.camera.camera.TransformedWorldCFrame.UpVector * -3;
                                end);
                            end;
                            v32[#v32 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_0, "1", function() --[[ Line: 206 ]]
                                -- upvalues: l_Character_0 (ref), v32 (ref), v15 (ref), l_l_AnimHelper_0_Anim_0 (ref), l_Debris_0 (ref)
                                local v61 = script.Lines.Bruh:Clone();
                                v61.Parent = l_Character_0.RightHand;
                                v32[#v32 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_0, "2", function() --[[ Line: 209 ]]
                                    -- upvalues: v61 (copy), l_Character_0 (ref), l_Debris_0 (ref)
                                    v61:Destroy();
                                    local v62 = script.Lines.Bruh:Clone();
                                    v62.Parent = l_Character_0.LeftHand;
                                    l_Debris_0:AddItem(v62, 0.2);
                                end);
                            end);
                            v32[#v32 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_0, "3", function() --[[ Line: 217 ]]
                                -- upvalues: l_Character_0 (ref), l_IsInvolved_0 (ref), v43 (ref), l_l_AnimHelper_0_Anim_0 (ref), v40 (ref), v48 (ref), v49 (ref), l_EffectHelper_0 (ref), v50 (ref), v46 (ref), l_Debris_1 (ref), l_HumanoidRootPart_0 (ref), l_Lighting_0 (ref), l_ReplicatedStorage_0 (ref), l_TweenService_0 (ref), v47 (ref), v13 (ref), v59 (ref)
                                task.wait(1);
                                local l_Aura_0 = script.Aura;
                                for _, v65 in ipairs(l_Aura_0:GetChildren()) do
                                    if v65:IsA("Part") then
                                        local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(v65.Name);
                                        if l_l_Character_0_FirstChild_0 then
                                            for _, v68 in ipairs(v65:GetChildren()) do
                                                v68:Clone().Parent = l_l_Character_0_FirstChild_0;
                                            end;
                                        end;
                                    end;
                                end;
                                if l_IsInvolved_0 and v43 then
                                    local v69 = v43:StartShake(3, 26, 0, 2);
                                    local l_v69_0 = v69 --[[ copy: 1 -> 12 ]];
                                    task.delay(2, function() --[[ Line: 237 ]]
                                        -- upvalues: l_v69_0 (copy)
                                        l_v69_0:StartFadeOut(2);
                                    end);
                                end;
                                l_l_AnimHelper_0_Anim_0:AdjustSpeed(0);
                                if l_IsInvolved_0 then
                                    if v40 then
                                        v40:AdjustSpeed(0);
                                    end;
                                    local v71, v72 = l_EffectHelper_0.GetPartsToHide(l_Character_0, v50);
                                    v48 = v71;
                                    v49 = v72;
                                    for _, v74 in v48 do
                                        v74.LocalTransparencyModifier = 1;
                                    end;
                                    for _, v76 in v49 do
                                        v76.Enabled = false;
                                    end;
                                    v46 = script.BlackBox:Clone();
                                    v46.Parent = l_Debris_1;
                                    v46:PivotTo(l_HumanoidRootPart_0.CFrame + Vector3.new(0, 0.009999999776482582, 0, 0));
                                    l_Lighting_0.ClockTime = 0;
                                    task.spawn(function() --[[ Line: 264 ]]
                                        -- upvalues: l_ReplicatedStorage_0 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref)
                                        l_ReplicatedStorage_0.Events.SetDefaultMapLighting:Fire();
                                        local v77 = "Impact" .. 1;
                                        local l_l_Lighting_0_0 = l_Lighting_0;
                                        local v79 = script.Lighting[v77]:Clone();
                                        v79.Parent = l_l_Lighting_0_0;
                                        task.wait(0.05);
                                        v79:Destroy();
                                        v77 = "Impact" .. 2;
                                        l_l_Lighting_0_0 = l_Lighting_0;
                                        v79 = script.Lighting[v77]:Clone();
                                        v79.Parent = l_l_Lighting_0_0;
                                        task.wait(0.05);
                                        v79:Destroy();
                                        v77 = "Impact" .. 3;
                                        l_l_Lighting_0_0 = l_Lighting_0;
                                        v79 = script.Lighting[v77]:Clone();
                                        v79.Parent = l_l_Lighting_0_0;
                                        task.wait(0.05);
                                        v79:Destroy();
                                        v77 = "Impact" .. 4;
                                        l_l_Lighting_0_0 = l_Lighting_0;
                                        v79 = script.Lighting[v77]:Clone();
                                        v79.Parent = l_l_Lighting_0_0;
                                        task.wait(0.05);
                                        v79:Destroy();
                                        v77 = "Impact" .. 5;
                                        l_l_Lighting_0_0 = l_Lighting_0;
                                        v79 = script.Lighting[v77]:Clone();
                                        v79.Parent = l_l_Lighting_0_0;
                                        task.wait(0.05);
                                        v79:Destroy();
                                        v77 = "Impact" .. 6;
                                        l_l_Lighting_0_0 = l_Lighting_0;
                                        v79 = script.Lighting[v77]:Clone();
                                        v79.Parent = l_l_Lighting_0_0;
                                        task.wait(0.05);
                                        v79:Destroy();
                                        v77 = Instance.new("BlurEffect");
                                        v77.Name = "EffectBlur";
                                        v77.Size = 26;
                                        v77.Parent = l_Lighting_0;
                                        l_TweenService_0:Create(v77, TweenInfo.new(0.5), {
                                            Size = 0
                                        }):Play();
                                    end);
                                end;
                                v47 = v13.SpawnGroup(script.PowerUp, l_HumanoidRootPart_0.CFrame, 8);
                                v13.Emit(v47);
                                task.wait(4);
                                v59();
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