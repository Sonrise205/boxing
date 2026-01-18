local v0 = {
    Metadata = {
        DisplayName = "Requiem", 
        Rarity = "Mythic", 
        Price = 99999999999, 
        Description = "The immense power flowing through space.", 
        Time = 3.7, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 91213120992616, 
        Friend = 128939420479636, 
        Camera = 77723089367458
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
    local l_Players_0 = game:GetService("Players");
    local _ = game:GetService("Debris");
    local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
    local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
    local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
    local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
    local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
    local _ = require(l_Modules_0.Cutscene.Utilities);
    local v14 = require(l_Modules_0.Cutscene.CameraEffects);
    local v15 = require(l_Modules_0.Cutscene.Cutscene);
    local l_CommonUtilities_0 = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
    local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
    local l_Debris_1 = l_Workspace_0:WaitForChild("Debris");
    local function _(v19, v20, v21) --[[ Line: 52 ]] --[[ Name: createAndDestroyEffect ]]
        local v22 = script.Lighting[v19]:Clone();
        v22.Parent = v20;
        task.wait(v21);
        v22:Destroy();
    end;
    v0.Use = function(v24) --[[ Line: 59 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_CommonUtilities_0 (copy), l_SoundHelper_0 (copy), l_EmoteHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), v14 (copy), l_Debris_1 (copy), l_TweenService_0 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), v15 (copy), l_EffectHelper_0 (copy)
        local l_workspace_Attribute_0 = workspace:GetAttribute("RingEntrance");
        if l_Workspace_0:GetAttribute("MatchStarted") then
            return;
        else
            local l_Character_0 = v24.Character;
            local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(l_Character_0);
            if not l_Character_0 then
                return;
            else
                local l_IsInvolved_0 = v24.IsInvolved;
                if not l_CommonUtilities_0.GetCharacterData(l_Character_0) then
                    return;
                else
                    local _ = l_SoundHelper_0:PlaySound({
                        Name = "SFX", 
                        Parent = l_IsInvolved_0 and l_Workspace_0 or l_Character_0, 
                        DirectCopy = script.SFX
                    });
                    local v30 = {};
                    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                    local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                    local v33 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
                    if not v33 then
                        return;
                    else
                        l_EmoteHelper_0.StopAnimsHack(l_Character_0);
                        local v34 = {
                            Name = "Entrance", 
                            Animator = v33, 
                            AnimId = v0.Animations.Character, 
                            Priority = Enum.AnimationPriority.Action4, 
                            FadeIn = 0
                        };
                        local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                        if l_IsInvolved_0 then
                            l_CameraMode_0.Value = "Freecam";
                        end;
                        l_Character_0.PrimaryPart.Anchored = true;
                        local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v34);
                        local v38 = nil;
                        local v39 = nil;
                        local v40 = nil;
                        local v41 = nil;
                        local v42 = nil;
                        local v43 = nil;
                        local v44 = nil;
                        local v45 = nil;
                        local v46 = nil;
                        local v47 = nil;
                        if l_IsInvolved_0 then
                            v40 = v14.setupCameraShake();
                        end;
                        if l_IsInvolved_0 then
                            v41 = v14.setupCamera(l_HumanoidRootPart_0);
                            v45 = v41.AnimationController.Animator;
                        end;
                        local v48 = script.R15:Clone();
                        v48.Parent = workspace.Welds;
                        local l_Humanoid_1 = v48.Humanoid;
                        local function v58(v50) --[[ Line: 135 ]] --[[ Name: getRandomFriend ]]
                            -- upvalues: l_Players_0 (ref), l_Humanoid_1 (copy)
                            local l_status_0, l_result_0 = pcall(function() --[[ Line: 136 ]]
                                -- upvalues: l_Players_0 (ref), v50 (copy)
                                return l_Players_0:GetFriendsAsync(v50.UserId);
                            end);
                            if not l_status_0 then
                                warn("Failed to get friends for player:", v50.Name);
                                return;
                            else
                                local v53 = {};
                                for _, v55 in ipairs(l_result_0:GetCurrentPage()) do
                                    table.insert(v53, v55);
                                end;
                                if #v53 == 0 then
                                    warn(v50.Name .. " has no friends, loser");
                                    return;
                                else
                                    local v56 = v53[math.random(1, #v53)];
                                    local l_l_Players_0_HumanoidDescriptionFromUserId_0 = l_Players_0:GetHumanoidDescriptionFromUserId(v56.Id);
                                    if not l_l_Players_0_HumanoidDescriptionFromUserId_0 then
                                        warn("Failed to get appearance for this guy called:", v56.Id);
                                        return;
                                    else
                                        l_Humanoid_1:ApplyDescription(l_l_Players_0_HumanoidDescriptionFromUserId_0);
                                        return;
                                    end;
                                end;
                            end;
                        end;
                        task.spawn(function() --[[ Line: 167 ]]
                            -- upvalues: v58 (copy), l_l_Players_0_PlayerFromCharacter_0 (copy)
                            v58(l_l_Players_0_PlayerFromCharacter_0);
                        end);
                        local v59 = {
                            Animator = v48.Humanoid.Animator, 
                            AnimId = v0.Animations.Friend, 
                            Priority = Enum.AnimationPriority.Action4, 
                            FadeIn = 0
                        };
                        v48.Name = v48.Name .. "_Dummy";
                        l_Humanoid_1.PlatformStand = true;
                        l_Humanoid_1.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
                        for _, v61 in v48:GetChildren() do
                            if v61:IsA("BasePart") then
                                v61.Massless = true;
                                v61.Anchored = false;
                            end;
                        end;
                        local l_Weld_0 = Instance.new("Weld");
                        l_Weld_0.Parent = l_Character_0;
                        l_Weld_0.Part0 = l_HumanoidRootPart_0;
                        l_Weld_0.Part1 = v48.HumanoidRootPart;
                        if l_IsInvolved_0 and v45 then
                            v46 = {
                                Animator = v45, 
                                AnimId = v0.Animations.Camera
                            };
                        end;
                        local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v59);
                        if l_IsInvolved_0 then
                            v43 = l_AnimHelper_0:CreateAnim(v46);
                        end;
                        local v64 = script.Camera:Clone();
                        v64.Parent = l_Debris_1;
                        local v65 = {};
                        local v66 = {};
                        local v67 = {
                            "Live", 
                            "Welds"
                        };
                        local v68 = false;
                        local function v79() --[[ Line: 219 ]] --[[ Name: Cleanup ]]
                            -- upvalues: v68 (ref), v30 (copy), l_IsInvolved_0 (copy), v14 (ref), v40 (ref), v41 (ref), v47 (ref), v42 (ref), l_Character_0 (copy), v48 (copy), l_TweenService_0 (ref), v65 (ref), v66 (ref), l_l_AnimHelper_0_Anim_0 (copy), l_workspace_Attribute_0 (copy), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref)
                            if v68 then
                                return;
                            else
                                v68 = true;
                                for _, v70 in v30 do
                                    v70:Disconnect();
                                end;
                                if l_IsInvolved_0 then
                                    v14.createBlindness(0.5, 1);
                                end;
                                task.wait(0.5);
                                if v40 then
                                    v40:Stop();
                                end;
                                if v41 then
                                    v41:Destroy();
                                end;
                                if v47 then
                                    v47:Destroy();
                                end;
                                if v42 then
                                    v42:Destroy();
                                end;
                                for _, v72 in l_Character_0:GetDescendants() do
                                    if v72:IsA("ParticleEmitter") and v72:GetAttribute("Aura") then
                                        v72.Enabled = false;
                                        task.delay(1, function() --[[ Line: 242 ]]
                                            -- upvalues: v72 (copy)
                                            v72:Destroy();
                                        end);
                                    end;
                                end;
                                for _, v74 in v48:GetDescendants() do
                                    if v74:IsA("BasePart") or v74:IsA("Decal") then
                                        l_TweenService_0:Create(v74, TweenInfo.new(0.5), {
                                            Transparency = 1
                                        }):Play();
                                    end;
                                end;
                                task.delay(0.5, function() --[[ Line: 256 ]]
                                    -- upvalues: v48 (ref)
                                    v48:Destroy();
                                end);
                                if l_IsInvolved_0 then
                                    for _, v76 in v65 do
                                        v76.LocalTransparencyModifier = 0;
                                    end;
                                    for _, v78 in v66 do
                                        v78.Enabled = true;
                                    end;
                                end;
                                l_l_AnimHelper_0_Anim_0:Stop();
                                if l_IsInvolved_0 and workspace:GetAttribute("RingEntrance") == l_workspace_Attribute_0 then
                                    l_CurrentCamera_0.FieldOfView = 70;
                                    l_CameraMode_0.Value = "";
                                    l_RunService_0:UnbindFromRenderStep("RingEntrance");
                                end;
                                l_Character_0.PrimaryPart.Anchored = false;
                                task.wait(0.5);
                                v48:Destroy();
                                return;
                            end;
                        end;
                        task.delay(v0.Metadata.Time, function() --[[ Line: 286 ]]
                            -- upvalues: v79 (copy)
                            v79();
                        end);
                        v30[#v30 + 1] = l_ReplicatedStorage_0.Events.CleanupEntrances.Event:Connect(function() --[[ Line: 290 ]]
                            -- upvalues: v79 (copy)
                            v79();
                        end);
                        v30[#v30 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Start", function() --[[ Line: 294 ]]
                            -- upvalues: l_IsInvolved_0 (copy), v24 (copy), v41 (ref), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref), l_HumanoidRootPart_0 (copy), l_TweenService_0 (ref), v40 (ref), v44 (ref), v64 (copy), v30 (copy), v15 (ref), l_l_AnimHelper_0_Anim_1 (copy), v39 (ref), l_Character_0 (copy), v38 (ref), v48 (copy), v65 (ref), v66 (ref), l_EffectHelper_0 (ref), v67 (copy), v42 (ref), v47 (ref), l_l_AnimHelper_0_Anim_0 (copy), v43 (ref), v79 (copy)
                            if l_IsInvolved_0 and v24 and v41 then
                                l_CurrentCamera_0.FieldOfView = 65;
                                l_CameraMode_0.Value = "Freecam";
                                l_RunService_0:BindToRenderStep("RingEntrance", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 299 ]]
                                    -- upvalues: v41 (ref), l_HumanoidRootPart_0 (ref), l_CurrentCamera_0 (ref)
                                    v41:PivotTo(l_HumanoidRootPart_0.CFrame);
                                    l_CurrentCamera_0.CFrame = v41.camera.camera.TransformedWorldCFrame + v41.camera.camera.TransformedWorldCFrame.UpVector * -3.3;
                                end);
                            end;
                            if l_IsInvolved_0 then
                                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                                    FieldOfView = 45
                                }):Play();
                                task.wait(0.8);
                                local v81 = v40:StartShake(3, 10, 0.2, 0.1, 20);
                                task.delay(2, function() --[[ Line: 313 ]]
                                    -- upvalues: v81 (copy)
                                    if v81 then
                                        v81:StartFadeOut(3);
                                    end;
                                end);
                                v44 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 317 ]]
                                    -- upvalues: v64 (ref)
                                    v64.CFrame = workspace.CurrentCamera.CFrame;
                                end);
                            end;
                            v30[#v30 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_1, "Appear", function() --[[ Line: 322 ]]
                                -- upvalues: l_IsInvolved_0 (ref), v40 (ref), v39 (ref), v15 (ref), l_Character_0 (ref), v38 (ref), v48 (ref), v65 (ref), v66 (ref), l_EffectHelper_0 (ref), v67 (ref), v42 (ref), l_HumanoidRootPart_0 (ref), v47 (ref), l_TweenService_0 (ref), v44 (ref), v64 (ref)
                                if l_IsInvolved_0 then
                                    v40:Stop();
                                    v40:Start();
                                    local v82 = v40:StartShake(1, 15, 0.1, 0.5);
                                    task.delay(2, function() --[[ Line: 327 ]]
                                        -- upvalues: v82 (copy)
                                        if v82 then
                                            v82:StartFadeOut(3);
                                        end;
                                    end);
                                    v39 = v15.createHighlight(l_Character_0);
                                    v38 = v15.createHighlight(v48);
                                    local v83, v84 = l_EffectHelper_0.GetPartsToHide(l_Character_0, v67);
                                    v65 = v83;
                                    v66 = v84;
                                    for _, v86 in v65 do
                                        v86.LocalTransparencyModifier = 1;
                                    end;
                                    for _, v88 in v66 do
                                        v88.Enabled = false;
                                    end;
                                    v42 = script.Background.Main:Clone();
                                    v42.Parent = l_HumanoidRootPart_0;
                                    v47 = v15.createColorCorrectionEffect({
                                        Brightness = 0.1, 
                                        Contrast = -3, 
                                        TintColor = Color3.new(0.180392, 0.701961, 0.588235)
                                    });
                                    l_TweenService_0:Create(v47, TweenInfo.new(1), {
                                        Brightness = -0.2, 
                                        Contrast = 1, 
                                        Saturation = -0.1, 
                                        TintColor = Color3.new(1, 1, 1)
                                    }):Play();
                                    v44:Disconnect();
                                    v64:Destroy();
                                end;
                                for _, v90 in script.Aura:GetChildren() do
                                    if v90:IsA("ParticleEmitter") then
                                        for _, v92 in l_Character_0:GetChildren() do
                                            if v92:IsA("MeshPart") then
                                                local v93 = v90:Clone();
                                                v93.Parent = v92;
                                                v93:SetAttribute("Aura", true);
                                            end;
                                        end;
                                    end;
                                end;
                                if l_IsInvolved_0 then
                                    task.wait(0.2);
                                    l_TweenService_0:Create(v39, TweenInfo.new(0.5), {
                                        FillTransparency = 1
                                    }):Play();
                                    l_TweenService_0:Create(v38, TweenInfo.new(0.5), {
                                        FillTransparency = 1
                                    }):Play();
                                end;
                            end);
                            v30[#v30 + 1] = v15.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Slow", function() --[[ Line: 389 ]]
                                -- upvalues: l_l_AnimHelper_0_Anim_0 (ref), l_l_AnimHelper_0_Anim_1 (ref), v43 (ref), v79 (ref)
                                l_l_AnimHelper_0_Anim_0:AdjustSpeed(0);
                                l_l_AnimHelper_0_Anim_1:AdjustSpeed(0);
                                if v43 then
                                    v43:AdjustSpeed(0);
                                end;
                                task.wait(2);
                                v79();
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