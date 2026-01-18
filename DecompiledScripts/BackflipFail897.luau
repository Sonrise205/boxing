local v0 = {
    Metadata = {
        DisplayName = "BackflipFail", 
        Rarity = "Uncommon", 
        Price = 99999999999, 
        Description = "", 
        Time = 3.3, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 78800231140302, 
        Camera = 124076644654436
    }
};
if game:GetService("RunService"):IsServer() then
    return v0;
else
    local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
    local _ = game:GetService("TweenService");
    local l_RunService_0 = game:GetService("RunService");
    local l_Workspace_0 = game:GetService("Workspace");
    local _ = game:GetService("Lighting");
    local _ = game:GetService("Debris");
    local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
    local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
    local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
    local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
    local _ = require(l_Modules_0:WaitForChild("EffectHelper"));
    local _ = require(l_Modules_0.Cutscene.Utilities);
    local v13 = require(l_Modules_0.Cutscene.CameraEffects);
    local _ = require(l_Modules_0.Cutscene.Cutscene);
    local l_CommonUtilities_0 = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
    local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
    local _ = l_Workspace_0:WaitForChild("Debris");
    local function _(v18, v19, v20) --[[ Line: 50 ]] --[[ Name: createAndDestroyEffect ]]
        local v21 = script.Lighting[v18]:Clone();
        v21.Parent = v19;
        task.wait(v20);
        v21:Destroy();
    end;
    v0.Use = function(v23) --[[ Line: 57 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_CommonUtilities_0 (copy), l_SoundHelper_0 (copy), l_EmoteHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_ReplicatedStorage_0 (copy), v13 (copy), l_RunService_0 (copy)
        local l_workspace_Attribute_0 = workspace:GetAttribute("RingEntrance");
        if l_Workspace_0:GetAttribute("MatchStarted") then
            return;
        else
            local l_Character_0 = v23.Character;
            if not l_Character_0 then
                return;
            else
                local l_IsInvolved_0 = v23.IsInvolved;
                local v27 = l_CommonUtilities_0.GetCharacterData(l_Character_0);
                if not v27 then
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
                        local v42 = CFrame.new(1, -3.25, -2.46);
                        if l_IsInvolved_0 then
                            v39 = l_ReplicatedStorage_0.Assets.FoVCamera:Clone();
                            v39.Parent = workspace.Debris;
                            v39:PivotTo(l_HumanoidRootPart_0.CFrame * v42);
                            if v39 then
                                local v43 = {
                                    Animator = v39.AnimationController.Animator, 
                                    AnimId = v0.Animations.Camera
                                };
                                v40 = l_AnimHelper_0:CreateAnim(v43);
                            end;
                        end;
                        local v44 = nil;
                        if l_IsInvolved_0 then
                            v44 = v13.setupCameraShake();
                        end;
                        local l_Value_0 = v27.Centre.Value;
                        local v46 = l_Value_0 and l_Value_0.Parent.Parent;
                        if v46 then
                            for _, v48 in v46:GetDescendants() do
                                if v48.Name == "OuterRingPart" then
                                    v48.LocalTransparencyModifier = v48.LocalTransparencyModifier - 10000;
                                end;
                            end;
                        end;
                        local v49 = false;
                        local function v54() --[[ Line: 140 ]] --[[ Name: Cleanup ]]
                            -- upvalues: v49 (ref), v32 (copy), l_IsInvolved_0 (copy), v13 (ref), l_l_AnimHelper_0_Anim_0 (copy), v46 (copy), v39 (ref), l_workspace_Attribute_0 (copy), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref)
                            if v49 then
                                return;
                            else
                                v49 = true;
                                for _, v51 in v32 do
                                    v51:Disconnect();
                                end;
                                if l_IsInvolved_0 then
                                    v13.createBlindness(0.5, 1);
                                end;
                                task.wait(0.5);
                                l_l_AnimHelper_0_Anim_0:Stop();
                                if v46 then
                                    for _, v53 in v46:GetDescendants() do
                                        if v53.Name == "OuterRingPart" then
                                            v53.LocalTransparencyModifier = v53.LocalTransparencyModifier + 10000;
                                        end;
                                    end;
                                end;
                                if v39 then
                                    v39:Destroy();
                                end;
                                if l_IsInvolved_0 and workspace:GetAttribute("RingEntrance") == l_workspace_Attribute_0 then
                                    l_CurrentCamera_0.FieldOfView = 70;
                                    l_CameraMode_0.Value = "";
                                    l_RunService_0:UnbindFromRenderStep("RingEntrance");
                                end;
                                return;
                            end;
                        end;
                        task.delay(v0.Metadata.Time, function() --[[ Line: 171 ]]
                            -- upvalues: v54 (copy)
                            v54();
                        end);
                        v32[#v32 + 1] = l_ReplicatedStorage_0.Events.CleanupEntrances.Event:Connect(function() --[[ Line: 175 ]]
                            -- upvalues: v54 (copy)
                            v54();
                        end);
                        task.spawn(function() --[[ Line: 179 ]]
                            -- upvalues: l_IsInvolved_0 (copy), v23 (copy), v39 (ref), l_CameraMode_0 (copy), l_RunService_0 (ref), l_CurrentCamera_0 (copy), l_HumanoidRootPart_0 (copy), v42 (copy)
                            if l_IsInvolved_0 and v23 and v39 then
                                l_CameraMode_0.Value = "Freecam";
                                l_RunService_0:BindToRenderStep("RingEntrance", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 183 ]]
                                    -- upvalues: l_CurrentCamera_0 (ref), v39 (ref), l_HumanoidRootPart_0 (ref), v42 (ref)
                                    l_CurrentCamera_0.CFrame = v39.CamPart.CFrame;
                                    l_CurrentCamera_0.FieldOfView = math.abs((v39.FovPart.Position - v39.RootPart.Position).Y);
                                    v39:PivotTo(l_HumanoidRootPart_0.CFrame * v42);
                                end);
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