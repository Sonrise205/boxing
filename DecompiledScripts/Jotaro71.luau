local v0 = {
    Metadata = {
        DisplayName = "Jotaro", 
        Rarity = "Mythic", 
        Price = 99999999999, 
        Description = "", 
        Time = 3.5, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 108449076549765, 
        Friend = 134903486954910, 
        Camera = 139020185775070
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
    local _ = require(l_Modules_0:WaitForChild("EffectHelper"));
    local _ = require(l_Modules_0.Cutscene.Utilities);
    local v13 = require(l_Modules_0.Cutscene.CameraEffects);
    local v14 = require(l_Modules_0.Cutscene.Cutscene);
    local l_CommonUtilities_0 = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
    local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
    local _ = l_Workspace_0:WaitForChild("Debris");
    local function _(v18, v19, v20) --[[ Line: 51 ]] --[[ Name: createAndDestroyEffect ]]
        local v21 = script.Lighting[v18]:Clone();
        v21.Parent = v19;
        task.wait(v20);
        v21:Destroy();
    end;
    v0.Use = function(v23) --[[ Line: 58 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_CommonUtilities_0 (copy), l_SoundHelper_0 (copy), l_EmoteHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), v13 (copy), l_TweenService_0 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), v14 (copy)
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
                        l_Character_0.PrimaryPart.Anchored = true;
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
                        local v43 = script.R15:Clone();
                        v43.Parent = workspace.Welds;
                        local l_Humanoid_1 = v43.Humanoid;
                        local v45 = {
                            Animator = v43.Humanoid.Animator, 
                            AnimId = v0.Animations.Friend, 
                            Priority = Enum.AnimationPriority.Action4, 
                            FadeIn = 0
                        };
                        v43.Name = v43.Name .. "_Dummy";
                        l_Humanoid_1.PlatformStand = true;
                        l_Humanoid_1.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
                        for _, v47 in v43:GetChildren() do
                            if v47:IsA("BasePart") then
                                v47.Massless = true;
                                v47.Anchored = false;
                                v47.CanCollide = false;
                                v47.CollisionGroup = "None";
                            end;
                        end;
                        local l_Weld_0 = Instance.new("Weld");
                        l_Weld_0.Parent = l_Character_0;
                        l_Weld_0.Part0 = l_HumanoidRootPart_0;
                        l_Weld_0.Part1 = v43.HumanoidRootPart;
                        local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v45);
                        local v50 = false;
                        local function v55() --[[ Line: 163 ]] --[[ Name: Cleanup ]]
                            -- upvalues: v50 (ref), v31 (copy), l_IsInvolved_0 (copy), v13 (ref), l_l_AnimHelper_0_Anim_1 (copy), v43 (copy), l_TweenService_0 (ref), v38 (ref), l_l_AnimHelper_0_Anim_0 (copy), l_workspace_Attribute_0 (copy), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref), l_Character_0 (copy)
                            if v50 then
                                return;
                            else
                                v50 = true;
                                for _, v52 in v31 do
                                    v52:Disconnect();
                                end;
                                if l_IsInvolved_0 then
                                    v13.createBlindness(0.5, 1);
                                end;
                                l_l_AnimHelper_0_Anim_1:AdjustSpeed(0);
                                for _, v54 in v43:GetDescendants() do
                                    if v54:IsA("BasePart") or v54:IsA("Decal") then
                                        l_TweenService_0:Create(v54, TweenInfo.new(0.5), {
                                            Transparency = 1
                                        }):Play();
                                    end;
                                end;
                                task.wait(0.5);
                                if v38 then
                                    v38:Destroy();
                                end;
                                l_l_AnimHelper_0_Anim_0:Stop();
                                if l_IsInvolved_0 and workspace:GetAttribute("RingEntrance") == l_workspace_Attribute_0 then
                                    l_CurrentCamera_0.FieldOfView = 70;
                                    l_CameraMode_0.Value = "";
                                    l_RunService_0:UnbindFromRenderStep("RingEntrance");
                                end;
                                task.delay(0.5, function() --[[ Line: 197 ]]
                                    -- upvalues: v43 (ref)
                                    if v43 then
                                        v43:Destroy();
                                    end;
                                end);
                                l_Character_0.PrimaryPart.Anchored = false;
                                return;
                            end;
                        end;
                        task.delay(v0.Metadata.Time, function() --[[ Line: 204 ]]
                            -- upvalues: v55 (copy)
                            v55();
                        end);
                        v31[#v31 + 1] = l_ReplicatedStorage_0.Events.CleanupEntrances.Event:Connect(function() --[[ Line: 208 ]]
                            -- upvalues: v55 (copy)
                            v55();
                        end);
                        v31[#v31 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Start", function() --[[ Line: 212 ]]
                            -- upvalues: l_IsInvolved_0 (copy), v23 (copy), v38 (ref), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref), l_HumanoidRootPart_0 (copy), v31 (copy), v14 (ref), l_l_AnimHelper_0_Anim_1 (copy), v39 (ref), l_l_AnimHelper_0_Anim_0 (copy), v55 (copy)
                            if l_IsInvolved_0 and v23 and v38 then
                                l_CurrentCamera_0.FieldOfView = 43;
                                l_CameraMode_0.Value = "Freecam";
                                l_RunService_0:BindToRenderStep("RingEntrance", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 217 ]]
                                    -- upvalues: v38 (ref), l_HumanoidRootPart_0 (ref), l_CurrentCamera_0 (ref)
                                    v38:PivotTo(l_HumanoidRootPart_0.CFrame);
                                    l_CurrentCamera_0.CFrame = v38.camera.camera.TransformedWorldCFrame + v38.camera.camera.TransformedWorldCFrame.UpVector * -3.3;
                                end);
                            end;
                            v31[#v31 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_1, "Appear", function() --[[ Line: 223 ]]
                                -- upvalues: v39 (ref), l_l_AnimHelper_0_Anim_0 (ref), v55 (ref)
                                task.wait(1.5);
                                v39:AdjustSpeed(0.1);
                                l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.1);
                                task.wait(1);
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