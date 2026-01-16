local v0 = {
    Metadata = {
        DisplayName = "Vigilante", 
        Rarity = "Mythic", 
        Price = 99999999999, 
        Description = "", 
        Time = 4.3, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 71535302935899, 
        Camera = 124772007794692
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
    local v12 = require(l_Modules_0.Cutscene.Utilities);
    local v13 = require(l_Modules_0.Cutscene.CameraEffects);
    local v14 = require(l_Modules_0.Cutscene.Cutscene);
    local l_CommonUtilities_0 = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
    local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
    local l_Debris_1 = l_Workspace_0:WaitForChild("Debris");
    local function _(v18, v19, v20) --[[ Line: 49 ]] --[[ Name: createAndDestroyEffect ]]
        local v21 = script.Lighting[v18]:Clone();
        v21.Parent = v19;
        task.wait(v20);
        v21:Destroy();
    end;
    v0.Use = function(v23) --[[ Line: 56 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_CommonUtilities_0 (copy), l_SoundHelper_0 (copy), l_EmoteHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), v13 (copy), l_Lighting_0 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), v14 (copy), l_EffectHelper_0 (copy), l_Debris_1 (copy), l_TweenService_0 (copy), v12 (copy)
        local l_workspace_Attribute_0 = workspace:GetAttribute("RingEntrance");
        if l_Workspace_0:GetAttribute("MatchStarted") then
            return;
        else
            local l_Character_0 = v23.Character;
            if not l_Character_0 then
                return;
            else
                local l_IsInvolved_0 = v23.IsInvolved;
                if not l_CommonUtilities_0.GetCharacterData(l_Character_0) then
                    return;
                else
                    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                    local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                    local v29 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
                    if not v29 then
                        return;
                    else
                        local _ = l_SoundHelper_0:PlaySound({
                            Name = "SFX", 
                            Parent = l_IsInvolved_0 and l_Workspace_0 or l_Character_0, 
                            DirectCopy = script.SFX
                        });
                        local v31 = {};
                        l_EmoteHelper_0.StopAnimsHack(l_Character_0);
                        local v32 = {
                            Name = "Entrance", 
                            Animator = v29, 
                            AnimId = v0.Animations.Character, 
                            Priority = Enum.AnimationPriority.Action4, 
                            FadeIn = 0
                        };
                        local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v32);
                        local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                        local _ = l_CameraSettings_0:WaitForChild("CameraTarget");
                        local l_CameraMode_0 = l_CameraSettings_0:WaitForChild("CameraMode");
                        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                        local v38 = nil;
                        local v39 = nil;
                        local _ = nil;
                        if l_IsInvolved_0 then
                            v38 = v13.setupCamera(l_HumanoidRootPart_0);
                            if v38 then
                                local v41 = {
                                    Animator = v38.AnimationController.Animator, 
                                    AnimId = v0.Animations.Camera
                                };
                                v39 = l_AnimHelper_0:CreateAnim(v41);
                            end;
                        end;
                        local v42 = nil;
                        if l_IsInvolved_0 then
                            v42 = v13.setupCameraShake();
                        end;
                        local l_ClockTime_0 = l_Lighting_0.ClockTime;
                        local v44 = nil;
                        local v45 = {};
                        local v46 = {};
                        local v47 = {
                            "Live", 
                            "Welds"
                        };
                        local v48 = false;
                        local function v55() --[[ Line: 132 ]] --[[ Name: Cleanup ]]
                            -- upvalues: v48 (ref), v31 (copy), l_IsInvolved_0 (copy), v13 (ref), v38 (ref), v44 (ref), l_Lighting_0 (ref), l_ClockTime_0 (copy), v45 (ref), v46 (ref), l_l_AnimHelper_0_Anim_0 (copy), l_workspace_Attribute_0 (copy), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref)
                            if v48 then
                                return;
                            else
                                v48 = true;
                                for _, v50 in v31 do
                                    v50:Disconnect();
                                end;
                                if l_IsInvolved_0 then
                                    v13.createBlindness(0.5, 1);
                                end;
                                task.wait(0.5);
                                if l_IsInvolved_0 and v38 then
                                    v38:Destroy();
                                end;
                                if v44 then
                                    v44:Destroy();
                                    l_Lighting_0.ClockTime = l_ClockTime_0;
                                end;
                                for _, v52 in v45 do
                                    v52.LocalTransparencyModifier = 0;
                                end;
                                for _, v54 in v46 do
                                    v54.Enabled = true;
                                end;
                                if v38 then
                                    v38:Destroy();
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
                        task.delay(v0.Metadata.Time, function() --[[ Line: 168 ]]
                            -- upvalues: v55 (copy)
                            v55();
                        end);
                        v31[#v31 + 1] = l_ReplicatedStorage_0.Events.CleanupEntrances.Event:Connect(function() --[[ Line: 172 ]]
                            -- upvalues: v55 (copy)
                            v55();
                        end);
                        v31[#v31 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Start", function() --[[ Line: 176 ]]
                            -- upvalues: l_IsInvolved_0 (copy), v38 (ref), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref), l_HumanoidRootPart_0 (copy), v31 (copy), v14 (ref), l_l_AnimHelper_0_Anim_0 (copy), v42 (ref), v45 (ref), v46 (ref), l_EffectHelper_0 (ref), l_Character_0 (copy), v47 (copy), v44 (ref), l_Debris_1 (ref), l_Lighting_0 (ref), l_ReplicatedStorage_0 (ref), l_TweenService_0 (ref), v12 (ref), v55 (copy)
                            if l_IsInvolved_0 and v38 then
                                l_CurrentCamera_0.FieldOfView = 43;
                                l_CameraMode_0.Value = "Freecam";
                                l_RunService_0:BindToRenderStep("RingEntrance", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 181 ]]
                                    -- upvalues: v38 (ref), l_HumanoidRootPart_0 (ref), l_CurrentCamera_0 (ref)
                                    v38:PivotTo(l_HumanoidRootPart_0.CFrame);
                                    l_CurrentCamera_0.CFrame = v38.camera.camera.TransformedWorldCFrame + v38.camera.camera.TransformedWorldCFrame.UpVector * -3;
                                end);
                            end;
                            v31[#v31 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_0, "PowerUp", function() --[[ Line: 187 ]]
                                -- upvalues: l_IsInvolved_0 (ref), v42 (ref), v45 (ref), v46 (ref), l_EffectHelper_0 (ref), l_Character_0 (ref), v47 (ref), v44 (ref), l_Debris_1 (ref), l_HumanoidRootPart_0 (ref), l_Lighting_0 (ref), l_ReplicatedStorage_0 (ref), l_TweenService_0 (ref), v12 (ref)
                                if l_IsInvolved_0 then
                                    v42:ShakeOnce(3, 26, 0, 2);
                                    local v57, v58 = l_EffectHelper_0.GetPartsToHide(l_Character_0, v47);
                                    v45 = v57;
                                    v46 = v58;
                                    for _, v60 in v45 do
                                        v60.LocalTransparencyModifier = 1;
                                    end;
                                    for _, v62 in v46 do
                                        v62.Enabled = false;
                                    end;
                                    v44 = script.BlackBox:Clone();
                                    v44.Parent = l_Debris_1;
                                    v44:PivotTo(l_HumanoidRootPart_0.CFrame + Vector3.new(0, 0.009999999776482582, 0, 0));
                                    l_Lighting_0.ClockTime = 0;
                                    task.spawn(function() --[[ Line: 208 ]]
                                        -- upvalues: l_ReplicatedStorage_0 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref)
                                        l_ReplicatedStorage_0.Events.SetDefaultMapLighting:Fire();
                                        local v63 = "Impact" .. 1;
                                        local l_l_Lighting_0_0 = l_Lighting_0;
                                        local v65 = script.Lighting[v63]:Clone();
                                        v65.Parent = l_l_Lighting_0_0;
                                        task.wait(0.05);
                                        v65:Destroy();
                                        v63 = "Impact" .. 2;
                                        l_l_Lighting_0_0 = l_Lighting_0;
                                        v65 = script.Lighting[v63]:Clone();
                                        v65.Parent = l_l_Lighting_0_0;
                                        task.wait(0.05);
                                        v65:Destroy();
                                        v63 = "Impact" .. 3;
                                        l_l_Lighting_0_0 = l_Lighting_0;
                                        v65 = script.Lighting[v63]:Clone();
                                        v65.Parent = l_l_Lighting_0_0;
                                        task.wait(0.05);
                                        v65:Destroy();
                                        v63 = Instance.new("BlurEffect");
                                        v63.Name = "EffectBlur";
                                        v63.Size = 26;
                                        v63.Parent = l_Lighting_0;
                                        l_TweenService_0:Create(v63, TweenInfo.new(1), {
                                            Size = 0
                                        }):Play();
                                    end);
                                    v57 = v42:StartShake(1, 5, 0.1, 0.5);
                                    local l_v57_0 = v57 --[[ copy: 0 -> 5 ]];
                                    task.delay(4, function() --[[ Line: 224 ]]
                                        -- upvalues: l_v57_0 (copy)
                                        l_v57_0:StartFadeOut(2);
                                    end);
                                end;
                                local v67 = script.Eyes.Eyes:Clone();
                                v67.Parent = l_Character_0.Head;
                                v12.Emit(v67);
                                local v68 = script.Container.MainMovement:Clone();
                                v68.Parent = l_HumanoidRootPart_0;
                                v12.Emit(v68);
                            end);
                            v31[#v31 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_0, "End", function() --[[ Line: 239 ]]
                                -- upvalues: v55 (ref)
                                task.wait(2);
                                v55();
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