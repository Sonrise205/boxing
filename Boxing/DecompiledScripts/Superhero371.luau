local v0 = {
    Metadata = {
        DisplayName = "Superhero", 
        Rarity = "Rare", 
        Price = 99999999999, 
        Description = "A superhero landing from the sky.", 
        Time = 3.92, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 94798307247196, 
        Camera = 75494518320163
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
    local l_CommonUtilities_0 = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
    local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
    local l_Debris_1 = l_Workspace_0:WaitForChild("Debris");
    v0.Use = function(v17) --[[ Line: 47 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_CommonUtilities_0 (copy), l_SoundHelper_0 (copy), l_EmoteHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), v12 (copy), l_Debris_1 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), v13 (copy), v11 (copy), l_TweenService_0 (copy)
        local l_workspace_Attribute_0 = workspace:GetAttribute("RingEntrance");
        if l_Workspace_0:GetAttribute("MatchStarted") then
            return;
        else
            local l_Character_0 = v17.Character;
            if not l_Character_0 then
                return;
            else
                local l_IsInvolved_0 = v17.IsInvolved;
                if not l_CommonUtilities_0.GetCharacterData(l_Character_0) then
                    return;
                else
                    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                    local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                    local v23 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
                    if not v23 then
                        return;
                    else
                        local _ = l_SoundHelper_0:PlaySound({
                            Name = "SFX", 
                            Parent = l_IsInvolved_0 and l_Workspace_0 or l_Character_0, 
                            DirectCopy = script.SFX
                        });
                        local v25 = {};
                        l_EmoteHelper_0.StopAnimsHack(l_Character_0);
                        local v26 = {
                            Name = "Entrance", 
                            Animator = v23, 
                            AnimId = v0.Animations.Character, 
                            Priority = Enum.AnimationPriority.Action4, 
                            FadeIn = 0
                        };
                        local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v26);
                        local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                        local _ = l_CameraSettings_0:WaitForChild("CameraTarget");
                        local l_CameraMode_0 = l_CameraSettings_0:WaitForChild("CameraMode");
                        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                        local v32 = nil;
                        local v33 = nil;
                        local _ = nil;
                        if l_IsInvolved_0 then
                            v32 = v12.setupCamera(l_HumanoidRootPart_0);
                            if v32 then
                                local v35 = {
                                    Animator = v32.AnimationController.Animator, 
                                    AnimId = v0.Animations.Camera
                                };
                                v33 = l_AnimHelper_0:CreateAnim(v35);
                            end;
                        end;
                        local v36 = nil;
                        if l_IsInvolved_0 then
                            v36 = v12.setupCameraShake();
                        end;
                        local v37 = RaycastParams.new();
                        v37.FilterType = Enum.RaycastFilterType.Exclude;
                        v37.FilterDescendantsInstances = {
                            l_Debris_1, 
                            l_Character_0
                        };
                        local v38 = nil;
                        local v39 = false;
                        local function v42() --[[ Line: 121 ]] --[[ Name: Cleanup ]]
                            -- upvalues: v39 (ref), v25 (copy), l_IsInvolved_0 (copy), v12 (ref), v38 (ref), v32 (ref), l_l_AnimHelper_0_Anim_0 (copy), l_workspace_Attribute_0 (copy), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref)
                            if v39 then
                                return;
                            else
                                v39 = true;
                                for _, v41 in v25 do
                                    v41:Disconnect();
                                end;
                                if l_IsInvolved_0 then
                                    v12.createBlindness(0.5, 1);
                                end;
                                task.wait(0.5);
                                if v38 then
                                    v38:Destroy();
                                end;
                                if l_IsInvolved_0 and v32 then
                                    v32:Destroy();
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
                        task.delay(v0.Metadata.Time, function() --[[ Line: 150 ]]
                            -- upvalues: v42 (copy)
                            v42();
                        end);
                        v25[#v25 + 1] = l_ReplicatedStorage_0.Events.CleanupEntrances.Event:Connect(function() --[[ Line: 154 ]]
                            -- upvalues: v42 (copy)
                            v42();
                        end);
                        v25[#v25 + 1] = v13.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Start", function() --[[ Line: 158 ]]
                            -- upvalues: l_IsInvolved_0 (copy), v17 (copy), v32 (ref), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref), l_HumanoidRootPart_0 (copy), l_Character_0 (copy), v25 (copy), v13 (ref), l_l_AnimHelper_0_Anim_0 (copy), v36 (ref), v11 (ref), v37 (copy), l_Debris_1 (ref), l_TweenService_0 (ref), v38 (ref), v33 (ref), v42 (copy)
                            if l_IsInvolved_0 and v17 and v32 then
                                l_CurrentCamera_0.FieldOfView = 50;
                                l_CameraMode_0.Value = "Freecam";
                                l_RunService_0:BindToRenderStep("RingEntrance", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 163 ]]
                                    -- upvalues: v32 (ref), l_HumanoidRootPart_0 (ref), l_CurrentCamera_0 (ref)
                                    v32:PivotTo(l_HumanoidRootPart_0.CFrame);
                                    l_CurrentCamera_0.CFrame = v32.camera.camera.TransformedWorldCFrame + v32.camera.camera.TransformedWorldCFrame.UpVector * -3;
                                end);
                            end;
                            local v44 = script.Leg.Leg:Clone();
                            v44.Parent = l_Character_0.RightUpperLeg;
                            v25[#v25 + 1] = v13.onMarkerReached(l_l_AnimHelper_0_Anim_0, "1", function() --[[ Line: 173 ]]
                                -- upvalues: l_IsInvolved_0 (ref), v36 (ref), v11 (ref), l_HumanoidRootPart_0 (ref), v37 (ref), l_Debris_1 (ref), l_TweenService_0 (ref), v44 (copy), v25 (ref), v13 (ref), l_l_AnimHelper_0_Anim_0 (ref), v38 (ref), v33 (ref), v42 (ref)
                                if l_IsInvolved_0 then
                                    v36:ShakeOnce(3, 26, 0, 0.5);
                                end;
                                local v45 = v11.SpawnGroup(script.Main, l_HumanoidRootPart_0.CFrame, 8);
                                v11.Emit(v45);
                                local v46 = workspace:Raycast(l_HumanoidRootPart_0.Position, Vector3.new(-0, -10, -0, -0), v37);
                                if v46 then
                                    local v47 = v11.GetRaySurface(v46);
                                    local l_CFrame_0 = l_HumanoidRootPart_0.CFrame;
                                    v45.BaseGround.CFrame = CFrame.new(v47.Position, l_CFrame_0 * CFrame.new(0, 0, -40000).Position);
                                end;
                                local v49 = v11.SpawnGroup(script.KickA, l_HumanoidRootPart_0.CFrame, 8);
                                v11.Emit(v49);
                                v49.Particles.Parent = l_Debris_1;
                                for _, v51 in v49:GetDescendants() do
                                    if v51.Name == "Start" then
                                        if v51:FindFirstChild("Mesh") then
                                            v51.Transparency = 1;
                                        else
                                            v51.Transparency = 0;
                                        end;
                                        for _, v53 in v49:GetDescendants() do
                                            if v53.Name == "End" then
                                                if v51:IsA("MeshPart") and v51.Parent:FindFirstChild("End") then
                                                    local v54 = TweenInfo.new(0.2);
                                                    local v55 = {
                                                        Size = v51.Parent:FindFirstChild("End").Size, 
                                                        CFrame = v51.Parent:FindFirstChild("End").CFrame
                                                    };
                                                    l_TweenService_0:Create(v51, v54, v55):Play();
                                                end;
                                                if v51:FindFirstChildWhichIsA("SpecialMesh") and v51.Parent.End:FindFirstChildWhichIsA("SpecialMesh") then
                                                    local l_SpecialMesh_0 = v51:FindFirstChildWhichIsA("SpecialMesh");
                                                    local l_SpecialMesh_1 = v51.Parent.End:FindFirstChildWhichIsA("SpecialMesh");
                                                    local v58 = TweenInfo.new(0.5);
                                                    local v59 = {
                                                        Scale = l_SpecialMesh_1.Scale
                                                    };
                                                    l_TweenService_0:Create(l_SpecialMesh_0, v58, v59):Play();
                                                    l_TweenService_0:Create(v51, TweenInfo.new(0.5), {
                                                        CFrame = v51.Parent.End.CFrame
                                                    }):Play();
                                                end;
                                            end;
                                        end;
                                    elseif v51.Name == "ThinOut" then
                                        if v51:IsA("MeshPart") then
                                            local v60 = TweenInfo.new(0.4);
                                            local v61 = {
                                                Size = Vector3.new(0, 0, v51.Size.Z)
                                            };
                                            l_TweenService_0:Create(v51, v60, v61):Play();
                                        end;
                                        if v51:FindFirstChildWhichIsA("SpecialMesh") then
                                            local l_SpecialMesh_2 = v51:FindFirstChildWhichIsA("SpecialMesh");
                                            local v63 = TweenInfo.new(0.4);
                                            local v64 = {
                                                Scale = Vector3.new(0, 0, 0, 0)
                                            };
                                            l_TweenService_0:Create(l_SpecialMesh_2, v63, v64):Play();
                                        end;
                                    elseif v51.Name == "BigOut" and v51:FindFirstChildWhichIsA("SpecialMesh") then
                                        local l_SpecialMesh_3 = v51:FindFirstChildWhichIsA("SpecialMesh");
                                        local v66 = TweenInfo.new(0.5);
                                        local v67 = {
                                            Scale = l_SpecialMesh_3.Scale * 5
                                        };
                                        l_TweenService_0:Create(l_SpecialMesh_3, v66, v67):Play();
                                        l_TweenService_0:Create(v51, TweenInfo.new(0.45), {
                                            CFrame = v51.CFrame + v51.CFrame.RightVector * 35
                                        }):Play();
                                        l_TweenService_0:Create(v51.Decal, TweenInfo.new(0.45), {
                                            Transparency = 1
                                        }):Play();
                                    end;
                                end;
                                task.wait(0.1);
                                v49:Destroy();
                                v44:Destroy();
                                v25[#v25 + 1] = v13.onMarkerReached(l_l_AnimHelper_0_Anim_0, "2", function() --[[ Line: 251 ]]
                                    -- upvalues: l_IsInvolved_0 (ref), v38 (ref), v13 (ref), v33 (ref), l_l_AnimHelper_0_Anim_0 (ref), v42 (ref)
                                    if l_IsInvolved_0 then
                                        v38 = v13.createColorCorrectionEffect({
                                            Brightness = 0.2
                                        });
                                    end;
                                    task.wait(1);
                                    v33:AdjustSpeed(0.1);
                                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.1);
                                    task.wait(1);
                                    v42();
                                end);
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