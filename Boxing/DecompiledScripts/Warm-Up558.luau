local v0 = {
    Metadata = {
        DisplayName = "Warm-Up", 
        Rarity = "Uncommon", 
        Price = 99999999999, 
        Description = "Warming up for the fight.", 
        Time = 4.38, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 70382753653393, 
        Camera = 119905372872642
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
    local _ = game:GetService("Debris");
    local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
    local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
    local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
    local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
    local v11 = require(l_Modules_0.Cutscene.Utilities);
    local v12 = require(l_Modules_0.Cutscene.CameraEffects);
    local v13 = require(l_Modules_0.Cutscene.Cutscene);
    local _ = require(l_Modules_0.Cutscene.Viewport);
    local l_CommonUtilities_0 = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
    local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
    local l_Debris_1 = l_Workspace_0:WaitForChild("Debris");
    v0.Use = function(v18) --[[ Line: 48 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_CommonUtilities_0 (copy), l_SoundHelper_0 (copy), l_EmoteHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), v12 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), v13 (copy), v11 (copy), l_TweenService_0 (copy), l_Debris_1 (copy)
        local l_workspace_Attribute_0 = workspace:GetAttribute("RingEntrance");
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
                        if l_IsInvolved_0 then
                            v33 = v12.setupCamera(l_HumanoidRootPart_0);
                            if v33 then
                                local v36 = {
                                    Animator = v33.AnimationController.Animator, 
                                    AnimId = v0.Animations.Camera
                                };
                                v34 = l_AnimHelper_0:CreateAnim(v36);
                            end;
                        end;
                        local v37 = nil;
                        if l_IsInvolved_0 then
                            v37 = v12.setupCameraShake();
                        end;
                        local v38 = nil;
                        local v39 = nil;
                        local v40 = nil;
                        local v41 = false;
                        local function v44() --[[ Line: 120 ]] --[[ Name: Cleanup ]]
                            -- upvalues: v41 (ref), v26 (copy), l_IsInvolved_0 (copy), v12 (ref), v33 (ref), v39 (ref), v40 (ref), v38 (ref), l_l_AnimHelper_0_Anim_0 (copy), l_workspace_Attribute_0 (copy), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref)
                            if v41 then
                                return;
                            else
                                v41 = true;
                                for _, v43 in v26 do
                                    v43:Disconnect();
                                end;
                                if l_IsInvolved_0 then
                                    v12.createBlindness(0.5, 1);
                                end;
                                task.wait(0.5);
                                if l_IsInvolved_0 and v33 then
                                    v33:Destroy();
                                end;
                                if v39 then
                                    v39:Destroy();
                                end;
                                if v40 then
                                    v40:Destroy();
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
                        task.delay(v0.Metadata.Time, function() --[[ Line: 149 ]]
                            -- upvalues: v44 (copy)
                            v44();
                        end);
                        v26[#v26 + 1] = l_ReplicatedStorage_0.Events.CleanupEntrances.Event:Connect(function() --[[ Line: 153 ]]
                            -- upvalues: v44 (copy)
                            v44();
                        end);
                        v26[#v26 + 1] = v13.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Start", function() --[[ Line: 157 ]]
                            -- upvalues: l_IsInvolved_0 (copy), v18 (copy), v33 (ref), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref), l_HumanoidRootPart_0 (copy), l_Character_0 (copy), v26 (copy), v13 (ref), l_l_AnimHelper_0_Anim_0 (copy), v37 (ref), v11 (ref), v40 (ref), l_TweenService_0 (ref), v39 (ref), v38 (ref), l_Debris_1 (ref), v44 (copy)
                            if l_IsInvolved_0 and v18 and v33 then
                                l_CurrentCamera_0.FieldOfView = 50;
                                l_CameraMode_0.Value = "Freecam";
                                l_RunService_0:BindToRenderStep("RingEntrance", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 162 ]]
                                    -- upvalues: v33 (ref), l_HumanoidRootPart_0 (ref), l_CurrentCamera_0 (ref)
                                    v33:PivotTo(l_HumanoidRootPart_0.CFrame);
                                    l_CurrentCamera_0.CFrame = v33.camera.camera.TransformedWorldCFrame + v33.camera.camera.TransformedWorldCFrame.UpVector * -3;
                                end);
                            end;
                            local v46 = script.Crack.Attachment:Clone();
                            v46.Parent = l_Character_0.Head;
                            v26[#v26 + 1] = v13.onMarkerReached(l_l_AnimHelper_0_Anim_0, "1", function() --[[ Line: 172 ]]
                                -- upvalues: l_IsInvolved_0 (ref), v37 (ref), v11 (ref), v46 (copy)
                                if l_IsInvolved_0 then
                                    v37:ShakeOnce(1, 7, 0, 0.2);
                                end;
                                v11.Emit(v46.Right);
                            end);
                            v26[#v26 + 1] = v13.onMarkerReached(l_l_AnimHelper_0_Anim_0, "2", function() --[[ Line: 180 ]]
                                -- upvalues: l_IsInvolved_0 (ref), v37 (ref), v11 (ref), v46 (copy), l_l_AnimHelper_0_Anim_0 (ref), v40 (ref), l_TweenService_0 (ref), v39 (ref), v13 (ref), v38 (ref), l_Debris_1 (ref), l_HumanoidRootPart_0 (ref), v44 (ref)
                                if l_IsInvolved_0 then
                                    v37:ShakeOnce(1, 7, 0, 0.2);
                                end;
                                v11.Emit(v46.Left);
                                task.wait(1.5);
                                l_l_AnimHelper_0_Anim_0:AdjustSpeed(0);
                                if l_IsInvolved_0 then
                                    v40 = script["Warm-Up"]:Clone();
                                    v40.Parent = game.Players.LocalPlayer.PlayerGui;
                                    l_TweenService_0:Create(v40.BubbleChat, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                        ImageTransparency = 0, 
                                        Position = UDim2.new(0.5, 0, 0.05, 0)
                                    }):Play();
                                    l_TweenService_0:Create(v40.BubbleChat, TweenInfo.new(3), {
                                        Size = UDim2.new(0.41, 0, 0.38, 0)
                                    }):Play();
                                    task.delay(0.3, function() --[[ Line: 204 ]]
                                        -- upvalues: l_TweenService_0 (ref), v40 (ref)
                                        l_TweenService_0:Create(v40.CanvasGroup, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            GroupTransparency = 0
                                        }):Play();
                                    end);
                                    v39 = v13.createColorCorrectionEffect({});
                                    l_TweenService_0:Create(v39, TweenInfo.new(0.3), {
                                        Contrast = 2, 
                                        Saturation = -1
                                    }):Play();
                                    v38 = script.BlackBox:Clone();
                                    v38.Parent = l_Debris_1;
                                    v38:PivotTo(l_HumanoidRootPart_0.CFrame + Vector3.new(0, 0.009999999776482582, 0, 0));
                                    for _, v48 in v38:GetChildren() do
                                        if v48.Name == "Bottom" then
                                            l_TweenService_0:Create(v48, TweenInfo.new(0.3), {
                                                Transparency = 0
                                            }):Play();
                                        end;
                                    end;
                                end;
                                task.wait(2);
                                v44();
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