local v0 = {
    Metadata = {
        DisplayName = "Arrival", 
        Rarity = "Rare", 
        Price = 99999999999, 
        Description = "", 
        Time = 4.4, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 118017205861395, 
        Camera = 122911408667138
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
                        local v32 = script.Hat:Clone();
                        v32.Parent = l_Character_0;
                        local v33 = script.Hat6D:Clone();
                        v33.Name = "Hat";
                        v33.Parent = l_Character_0.PrimaryPart;
                        v33.Part0 = l_Character_0.PrimaryPart;
                        v33.Part1 = v32;
                        local v34 = {
                            Name = "Entrance", 
                            Animator = v29, 
                            AnimId = v0.Animations.Character, 
                            Priority = Enum.AnimationPriority.Action4, 
                            FadeIn = 0
                        };
                        local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v34);
                        local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                        local _ = l_CameraSettings_0:WaitForChild("CameraTarget");
                        local l_CameraMode_0 = l_CameraSettings_0:WaitForChild("CameraMode");
                        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                        local v40 = nil;
                        local v41 = nil;
                        local _ = nil;
                        if l_IsInvolved_0 then
                            v40 = l_ReplicatedStorage_0.Assets.FoVCamera:Clone();
                            v40.Parent = workspace.Debris;
                            v40:PivotTo(l_HumanoidRootPart_0.CFrame * CFrame.new(0, -3, 0));
                            if v40 then
                                local v43 = {
                                    Animator = v40.AnimationController.Animator, 
                                    AnimId = v0.Animations.Camera
                                };
                                v41 = l_AnimHelper_0:CreateAnim(v43);
                            end;
                        end;
                        local v44 = nil;
                        if l_IsInvolved_0 then
                            v44 = v13.setupCameraShake();
                        end;
                        local v45 = false;
                        local function v48() --[[ Line: 137 ]] --[[ Name: Cleanup ]]
                            -- upvalues: v45 (ref), v31 (copy), l_IsInvolved_0 (copy), v13 (ref), l_l_AnimHelper_0_Anim_0 (copy), v32 (copy), v33 (copy), v40 (ref), l_workspace_Attribute_0 (copy), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref)
                            if v45 then
                                return;
                            else
                                v45 = true;
                                for _, v47 in v31 do
                                    v47:Disconnect();
                                end;
                                if l_IsInvolved_0 then
                                    v13.createBlindness(0.5, 1);
                                end;
                                task.wait(0.5);
                                l_l_AnimHelper_0_Anim_0:Stop();
                                if v32 then
                                    v32:Destroy();
                                end;
                                if v33 then
                                    v33:Destroy();
                                end;
                                if v40 then
                                    v40:Destroy();
                                end;
                                if l_IsInvolved_0 and workspace:GetAttribute("RingEntrance") == l_workspace_Attribute_0 then
                                    l_CurrentCamera_0.FieldOfView = 70;
                                    l_CameraMode_0.Value = "";
                                    l_RunService_0:UnbindFromRenderStep("RingEntrance");
                                end;
                                return;
                            end;
                        end;
                        task.delay(v0.Metadata.Time, function() --[[ Line: 164 ]]
                            -- upvalues: v48 (copy)
                            v48();
                        end);
                        v31[#v31 + 1] = l_ReplicatedStorage_0.Events.CleanupEntrances.Event:Connect(function() --[[ Line: 168 ]]
                            -- upvalues: v48 (copy)
                            v48();
                        end);
                        task.spawn(function() --[[ Line: 172 ]]
                            -- upvalues: l_IsInvolved_0 (copy), v23 (copy), v40 (ref), l_CameraMode_0 (copy), l_RunService_0 (ref), l_CurrentCamera_0 (copy), l_HumanoidRootPart_0 (copy)
                            if l_IsInvolved_0 and v23 and v40 then
                                l_CameraMode_0.Value = "Freecam";
                                l_RunService_0:BindToRenderStep("RingEntrance", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 176 ]]
                                    -- upvalues: l_CurrentCamera_0 (ref), v40 (ref), l_HumanoidRootPart_0 (ref)
                                    l_CurrentCamera_0.CFrame = v40.CamPart.CFrame;
                                    l_CurrentCamera_0.FieldOfView = math.abs((v40.FovPart.Position - v40.RootPart.Position).Y);
                                    v40:PivotTo(l_HumanoidRootPart_0.CFrame * CFrame.new(0, -3, 0));
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