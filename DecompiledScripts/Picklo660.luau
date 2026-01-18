local v0 = {
    Metadata = {
        DisplayName = "Picklo", 
        Rarity = "Mythic", 
        Price = 99999999999, 
        Description = "A pickle ready to fight!", 
        CharacterOffset = CFrame.new(0.45, 0, -0.6), 
        Time = 5, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 108444230933516, 
        Camera = 80395408086664, 
        Turban = 84048457548448, 
        Cape = 132988648028472
    }
};
if game:GetService("RunService"):IsServer() then
    return v0;
else
    local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
    local _ = game:GetService("TweenService");
    local l_RunService_0 = game:GetService("RunService");
    local l_Workspace_0 = game:GetService("Workspace");
    local l_Lighting_0 = game:GetService("Lighting");
    local _ = game:GetService("Debris");
    local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
    local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
    local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
    local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
    local _ = require(l_Modules_0:WaitForChild("EffectHelper"));
    local _ = require(l_Modules_0.Cutscene.Utilities);
    local v13 = require(l_Modules_0.Cutscene.CameraEffects);
    local v14 = require(l_Modules_0.Cutscene.Cutscene);
    local l_CommonUtilities_0 = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
    local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
    local l_Debris_1 = l_Workspace_0:WaitForChild("Debris");
    local function _(v18, v19, v20) --[[ Line: 54 ]] --[[ Name: createAndDestroyEffect ]]
        local v21 = script.Lighting[v18]:Clone();
        v21.Parent = v19;
        task.wait(v20);
        v21:Destroy();
    end;
    v0.Use = function(v23) --[[ Line: 61 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_CommonUtilities_0 (copy), l_SoundHelper_0 (copy), l_EmoteHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), v13 (copy), l_Lighting_0 (copy), l_Debris_1 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), v14 (copy)
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
                        if l_IsInvolved_0 then
                            v39 = v13.setupCamera(l_HumanoidRootPart_0);
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
                            v43 = v13.setupCameraShake();
                        end;
                        local _ = l_Lighting_0.ClockTime;
                        local v45 = RaycastParams.new();
                        v45.FilterType = Enum.RaycastFilterType.Exclude;
                        v45.FilterDescendantsInstances = {
                            l_Debris_1, 
                            l_Character_0
                        };
                        local v46 = script.Piccolo_Exported.Turban:Clone();
                        v46.Parent = l_Character_0;
                        local l_PiccoloHat_0 = v46.PiccoloHat;
                        v46["Head (weld this to head)"].Weld.Part0 = l_Character_0.Head;
                        local v48 = {
                            Animator = l_PiccoloHat_0.AnimationController.Animator, 
                            AnimId = v0.Animations.Turban, 
                            Priority = Enum.AnimationPriority.Action4, 
                            FadeIn = 0
                        };
                        local v49 = script.CapeWithBase:Clone();
                        v49.Parent = l_Character_0;
                        v49.RootPart.Weld.Part1 = l_Character_0.UpperTorso;
                        v49.CapeBase.UpperTorso.Part1 = l_Character_0.UpperTorso;
                        local v50 = {
                            Animator = v49.AnimationController.Animator, 
                            AnimId = v0.Animations.Cape, 
                            Priority = Enum.AnimationPriority.Action4, 
                            FadeIn = 0
                        };
                        local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v48);
                        local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v50);
                        local l_Value_0 = v27.Centre.Value;
                        local v54 = l_Value_0 and l_Value_0.Parent.Parent;
                        if v54 then
                            for _, v56 in v54:GetDescendants() do
                                if v56.Name == "OuterRingPart" then
                                    v56.LocalTransparencyModifier = v56.LocalTransparencyModifier - 10000;
                                end;
                            end;
                        end;
                        local v57 = false;
                        local function v62() --[[ Line: 176 ]] --[[ Name: Cleanup ]]
                            -- upvalues: v57 (ref), v32 (copy), l_IsInvolved_0 (copy), v13 (ref), v54 (copy), v39 (ref), v49 (copy), v46 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_workspace_Attribute_0 (copy), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref)
                            if v57 then
                                return;
                            else
                                v57 = true;
                                for _, v59 in v32 do
                                    v59:Disconnect();
                                end;
                                if l_IsInvolved_0 then
                                    v13.createBlindness(0.5, 1);
                                end;
                                task.wait(0.5);
                                if v54 then
                                    for _, v61 in v54:GetDescendants() do
                                        if v61.Name == "OuterRingPart" then
                                            v61.LocalTransparencyModifier = v61.LocalTransparencyModifier + 10000;
                                        end;
                                    end;
                                end;
                                if l_IsInvolved_0 and v39 then
                                    v39:Destroy();
                                end;
                                if v49 then
                                    v49:Destroy();
                                end;
                                if v46 then
                                    v46:Destroy();
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
                        task.delay(v0.Metadata.Time, function() --[[ Line: 211 ]]
                            -- upvalues: v62 (copy)
                            v62();
                        end);
                        v32[#v32 + 1] = l_ReplicatedStorage_0.Events.CleanupEntrances.Event:Connect(function() --[[ Line: 215 ]]
                            -- upvalues: v62 (copy)
                            v62();
                        end);
                        v32[#v32 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_2, "Weld", function() --[[ Line: 219 ]]
                            -- upvalues: v49 (copy), v32 (copy), l_RunService_0 (ref)
                            v49.CapeBase.UpperTorso:Destroy();
                            v49.CapeBase.Anchored = true;
                            v32[#v32 + 1] = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 223 ]]
                                -- upvalues: v49 (ref)
                                if v49 and v49:FindFirstChild("CapeBase") then
                                    v49.CapeBase.CFrame = v49.RootPart.Bone["Bone.001"].TransformedWorldCFrame * CFrame.Angles(0, 0, 1.3962634015954636);
                                end;
                            end);
                        end);
                        v32[#v32 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_2, "End", function() --[[ Line: 230 ]]
                            -- upvalues: v49 (copy)
                            v49:Destroy();
                        end);
                        v32[#v32 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_1, "End", function() --[[ Line: 234 ]]
                            -- upvalues: v46 (copy)
                            v46:Destroy();
                        end);
                        v32[#v32 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Start", function() --[[ Line: 238 ]]
                            -- upvalues: l_IsInvolved_0 (copy), v23 (copy), v39 (ref), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref), l_HumanoidRootPart_0 (copy), v32 (copy), v14 (ref), l_l_AnimHelper_0_Anim_0 (copy), v62 (copy)
                            if l_IsInvolved_0 and v23 and v39 then
                                l_CurrentCamera_0.FieldOfView = 43;
                                l_CameraMode_0.Value = "Freecam";
                                l_RunService_0:BindToRenderStep("RingEntrance", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 243 ]]
                                    -- upvalues: v39 (ref), l_HumanoidRootPart_0 (ref), l_CurrentCamera_0 (ref)
                                    v39:PivotTo(l_HumanoidRootPart_0.CFrame);
                                    l_CurrentCamera_0.CFrame = v39.camera.camera.TransformedWorldCFrame + v39.camera.camera.TransformedWorldCFrame.UpVector * -3;
                                end);
                            end;
                            v32[#v32 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_0, "End", function() --[[ Line: 249 ]]
                                -- upvalues: v62 (ref)
                                task.wait(2);
                                v62();
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