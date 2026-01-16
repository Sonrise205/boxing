local v0 = {
    Metadata = {
        DisplayName = "Godspeed", 
        Rarity = "Rare", 
        Price = 99999999999, 
        Description = "The true sensation of unmatched speed.", 
        Time = 4.7, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 116469354967933, 
        Camera = 110803637643829
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
    local l_Debris_0 = game:GetService("Debris");
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
    local function _(v18, v19, v20, v21) --[[ Line: 50 ]] --[[ Name: createParticleEffect ]]
        -- upvalues: l_Debris_1 (copy), v12 (copy), l_Debris_0 (copy)
        local v22 = v18:Clone();
        v22.Parent = l_Debris_1;
        if v19 then
            v22.Position = v19;
        end;
        if v20 then
            v22.CFrame = v20;
        end;
        v12.Emit(v22);
        l_Debris_0:AddItem(v22, v21);
        return v22;
    end;
    CameraShake = function(v24) --[[ Line: 67 ]] --[[ Name: CameraShake ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), l_Workspace_0 (copy)
        local l_CameraShaker_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
        local l_camShake_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
        if not v24.Preset then
            return;
        else
            local l_FoV_0 = v24.FoV;
            if l_FoV_0 then
                l_Workspace_0.FoVMult.Value = v24.FoVMult or 3;
                l_Workspace_0.CurrentCamera.FieldOfView = l_FoV_0;
            end;
            local v28 = l_camShake_0:ShakeSustain(l_CameraShaker_0.Presets[v24.Preset]);
            task.delay(v24 and v24.WaitTime or 0.1, function() --[[ Line: 80 ]]
                -- upvalues: v28 (copy), v24 (copy)
                v28:StartFadeOut(v24 and v24.Fade or 0.2);
            end);
            return v28;
        end;
    end;
    local _ = game:GetService("Players");
    v0.Use = function(v30) --[[ Line: 90 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_CommonUtilities_0 (copy), l_SoundHelper_0 (copy), l_EmoteHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), v13 (copy), l_Debris_1 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), v14 (copy), v12 (copy), l_Debris_0 (copy), l_TweenService_0 (copy), l_EffectHelper_0 (copy)
        local l_workspace_Attribute_0 = workspace:GetAttribute("RingEntrance");
        if l_Workspace_0:GetAttribute("MatchStarted") then
            return;
        else
            local l_Character_0 = v30.Character;
            if not l_Character_0 then
                return;
            else
                local l_IsInvolved_0 = v30.IsInvolved;
                if not l_CommonUtilities_0.GetCharacterData(l_Character_0) then
                    return;
                else
                    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                    local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                    local v36 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
                    if not v36 then
                        return;
                    else
                        local _ = l_SoundHelper_0:PlaySound({
                            Name = "SFX", 
                            Parent = l_IsInvolved_0 and l_Workspace_0 or l_Character_0, 
                            DirectCopy = script.SFX
                        });
                        local v38 = {};
                        l_EmoteHelper_0.StopAnimsHack(l_Character_0);
                        local v39 = {
                            Name = "Entrance", 
                            Animator = v36, 
                            AnimId = v0.Animations.Character, 
                            Priority = Enum.AnimationPriority.Action4, 
                            FadeIn = 0
                        };
                        local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v39);
                        local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                        local _ = l_CameraSettings_0:WaitForChild("CameraTarget");
                        local l_CameraMode_0 = l_CameraSettings_0:WaitForChild("CameraMode");
                        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                        local v45 = nil;
                        local v46 = nil;
                        local _ = nil;
                        if l_IsInvolved_0 then
                            v45 = v13.setupCamera(l_HumanoidRootPart_0);
                            if v45 then
                                local v48 = {
                                    Animator = v45.AnimationController.Animator, 
                                    AnimId = v0.Animations.Camera
                                };
                                v46 = l_AnimHelper_0:CreateAnim(v48);
                            end;
                        end;
                        local v49 = nil;
                        if l_IsInvolved_0 then
                            v49 = v13.setupCameraShake();
                        end;
                        local v50 = RaycastParams.new();
                        v50.FilterType = Enum.RaycastFilterType.Exclude;
                        v50.FilterDescendantsInstances = {
                            l_Debris_1, 
                            l_Character_0
                        };
                        local v51 = nil;
                        local v52 = nil;
                        local v53 = nil;
                        local v54 = false;
                        local function v59() --[[ Line: 168 ]] --[[ Name: Cleanup ]]
                            -- upvalues: v54 (ref), v38 (copy), l_IsInvolved_0 (copy), v13 (ref), v51 (ref), v53 (ref), v52 (ref), l_l_AnimHelper_0_Anim_0 (copy), l_workspace_Attribute_0 (copy), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref), v45 (ref)
                            if v54 then
                                return;
                            else
                                v54 = true;
                                for _, v56 in v38 do
                                    v56:Disconnect();
                                end;
                                if l_IsInvolved_0 then
                                    v13.createBlindness(0.5, 1);
                                end;
                                if v51 then
                                    v51:Destroy();
                                end;
                                if v53 then
                                    for _, v58 in v53:GetDescendants() do
                                        if v58:IsA("ParticleEmitter") then
                                            v58.Enabled = false;
                                        end;
                                    end;
                                end;
                                task.wait(0.5);
                                if v52 then
                                    v52:Destroy();
                                end;
                                l_l_AnimHelper_0_Anim_0:Stop();
                                if v53 then
                                    v53:Destroy();
                                end;
                                if l_IsInvolved_0 and workspace:GetAttribute("RingEntrance") == l_workspace_Attribute_0 then
                                    l_CurrentCamera_0.FieldOfView = 70;
                                    l_CameraMode_0.Value = "";
                                    l_RunService_0:UnbindFromRenderStep("RingEntrance");
                                end;
                                if l_IsInvolved_0 and v45 then
                                    v45:Destroy();
                                end;
                                return;
                            end;
                        end;
                        task.delay(v0.Metadata.Time, function() --[[ Line: 209 ]]
                            -- upvalues: v59 (copy)
                            v59();
                        end);
                        v38[#v38 + 1] = l_ReplicatedStorage_0.Events.CleanupEntrances.Event:Connect(function() --[[ Line: 213 ]]
                            -- upvalues: v59 (copy)
                            v59();
                        end);
                        v38[#v38 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Start", function() --[[ Line: 217 ]]
                            -- upvalues: l_IsInvolved_0 (copy), v30 (copy), v45 (ref), l_CurrentCamera_0 (copy), l_CameraMode_0 (copy), l_RunService_0 (ref), l_HumanoidRootPart_0 (copy), l_Character_0 (copy), l_Debris_1 (ref), v12 (ref), l_Debris_0 (ref), v38 (copy), l_l_AnimHelper_0_Anim_0 (copy), v14 (ref), v51 (ref), v52 (ref), l_TweenService_0 (ref), v53 (ref), l_EffectHelper_0 (ref), v46 (ref), v59 (copy)
                            if l_IsInvolved_0 and v30 and v45 then
                                l_CurrentCamera_0.FieldOfView = 50;
                                l_CameraMode_0.Value = "Freecam";
                                l_RunService_0:BindToRenderStep("RingEntrance", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 222 ]]
                                    -- upvalues: v45 (ref), l_HumanoidRootPart_0 (ref), l_CurrentCamera_0 (ref)
                                    v45:PivotTo(l_HumanoidRootPart_0.CFrame);
                                    l_CurrentCamera_0.CFrame = v45.camera.camera.TransformedWorldCFrame + v45.camera.camera.TransformedWorldCFrame.UpVector * -3;
                                end);
                            end;
                            local v70 = {
                                LeftFoot = function() --[[ Line: 231 ]] --[[ Name: LeftFoot ]]
                                    -- upvalues: l_Character_0 (ref), l_Debris_1 (ref), v12 (ref), l_Debris_0 (ref)
                                    local l_Light_0 = script.Light;
                                    local l_Position_0 = l_Character_0.LeftFoot.Position;
                                    local v63 = l_Light_0:Clone();
                                    v63.Parent = l_Debris_1;
                                    if l_Position_0 then
                                        v63.Position = l_Position_0;
                                    end;
                                    v12.Emit(v63);
                                    l_Debris_0:AddItem(v63, 4);
                                end, 
                                RightFoot = function() --[[ Line: 232 ]] --[[ Name: RightFoot ]]
                                    -- upvalues: l_Character_0 (ref), l_Debris_1 (ref), v12 (ref), l_Debris_0 (ref)
                                    local l_Light_1 = script.Light;
                                    local l_Position_1 = l_Character_0.RightFoot.Position;
                                    local v66 = l_Light_1:Clone();
                                    v66.Parent = l_Debris_1;
                                    if l_Position_1 then
                                        v66.Position = l_Position_1;
                                    end;
                                    v12.Emit(v66);
                                    l_Debris_0:AddItem(v66, 4);
                                end, 
                                RightHand = function() --[[ Line: 233 ]] --[[ Name: RightHand ]]
                                    -- upvalues: l_Character_0 (ref), l_Debris_1 (ref), v12 (ref), l_Debris_0 (ref)
                                    local l_Light_2 = script.Light;
                                    local l_Position_2 = l_Character_0.RightFoot.Position;
                                    local v69 = l_Light_2:Clone();
                                    v69.Parent = l_Debris_1;
                                    if l_Position_2 then
                                        v69.Position = l_Position_2;
                                    end;
                                    v12.Emit(v69);
                                    l_Debris_0:AddItem(v69, 4);
                                end
                            };
                            for v71, v72 in pairs(v70) do
                                v38[#v38 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal(v71):Connect(v72);
                            end;
                            v38[#v38 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_0, "PowerUp", function() --[[ Line: 240 ]]
                                -- upvalues: l_IsInvolved_0 (ref), v51 (ref), v14 (ref), v52 (ref), l_TweenService_0 (ref), v12 (ref), l_Character_0 (ref), v53 (ref), l_Debris_1 (ref), l_HumanoidRootPart_0 (ref)
                                if l_IsInvolved_0 then
                                    v51 = v14.createColorCorrectionEffect({
                                        Brightness = 0.8
                                    });
                                    v52 = v14.createColorCorrectionEffect();
                                end;
                                if l_IsInvolved_0 and v51 then
                                    l_TweenService_0:Create(v51, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                        Brightness = 0
                                    }):Play();
                                end;
                                v12.Emit(l_Character_0);
                                v53 = script.Part:Clone();
                                v53.Parent = l_Debris_1;
                                v53.HumanoidRootPart.Part1 = l_HumanoidRootPart_0;
                            end);
                            v38[#v38 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Dash", function() --[[ Line: 267 ]]
                                -- upvalues: l_Character_0 (ref), l_Debris_1 (ref), v12 (ref), l_Debris_0 (ref), v53 (ref), l_IsInvolved_0 (ref), v52 (ref), l_TweenService_0 (ref), l_EffectHelper_0 (ref), v38 (ref), v14 (ref), l_l_AnimHelper_0_Anim_0 (ref)
                                local l_Dash_0 = script.Dash;
                                local l_Position_3 = l_Character_0.UpperTorso.Position;
                                local v75 = l_Dash_0:Clone();
                                v75.Parent = l_Debris_1;
                                if l_Position_3 then
                                    v75.Position = l_Position_3;
                                end;
                                v12.Emit(v75);
                                l_Debris_0:AddItem(v75, 2);
                                v75.Weld.Part0 = l_Character_0.UpperTorso;
                                for _, v77 in v53:GetDescendants() do
                                    if v77:IsA("ParticleEmitter") then
                                        v77.Enabled = false;
                                    end;
                                end;
                                if l_IsInvolved_0 and v52 then
                                    l_TweenService_0:Create(v52, TweenInfo.new(0.2), {
                                        Contrast = 0.8, 
                                        Saturation = -0.6
                                    }):Play();
                                end;
                                l_EffectHelper_0.SetTransparency(l_Character_0, 1);
                                for _, v79 in workspace.Welds:FindFirstChild(l_Character_0.Name).WeldCharacter:GetDescendants() do
                                    if v79:IsA("BasePart") then
                                        v79.LocalTransparencyModifier = 1;
                                    end;
                                end;
                                v38[#v38 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_0, "TurnOff", function() --[[ Line: 291 ]]
                                    -- upvalues: l_EffectHelper_0 (ref), l_Character_0 (ref), v53 (ref), l_IsInvolved_0 (ref), v52 (ref), l_TweenService_0 (ref)
                                    l_EffectHelper_0.SetTransparency(l_Character_0, 0);
                                    for _, v81 in workspace.Welds:FindFirstChild(l_Character_0.Name).WeldCharacter:GetDescendants() do
                                        if v81:IsA("BasePart") then
                                            v81.LocalTransparencyModifier = 0;
                                        end;
                                    end;
                                    for _, v83 in v53:GetDescendants() do
                                        if v83:IsA("ParticleEmitter") then
                                            v83.Enabled = true;
                                        end;
                                    end;
                                    if l_IsInvolved_0 and v52 then
                                        l_TweenService_0:Create(v52, TweenInfo.new(0.2), {
                                            Contrast = 0, 
                                            Saturation = 0
                                        }):Play();
                                    end;
                                end);
                            end);
                            v38[#v38 + 1] = v14.onMarkerReached(l_l_AnimHelper_0_Anim_0, "Land", function() --[[ Line: 314 ]]
                                -- upvalues: l_Character_0 (ref), l_Debris_1 (ref), v12 (ref), l_Debris_0 (ref), v30 (ref), l_l_AnimHelper_0_Anim_0 (ref), v46 (ref), l_TweenService_0 (ref), v53 (ref), l_CurrentCamera_0 (ref), v59 (ref)
                                local l_Land_0 = script.Land;
                                local v85 = l_Character_0.UpperTorso.Position + Vector3.new(0, -2, 0, 0);
                                local v86 = l_Land_0:Clone();
                                v86.Parent = l_Debris_1;
                                if v85 then
                                    v86.Position = v85;
                                end;
                                v12.Emit(v86);
                                l_Debris_0:AddItem(v86, 4);
                                local _ = v86;
                                task.spawn(function() --[[ Line: 317 ]]
                                    CameraShake({
                                        Preset = "SuperHardHit", 
                                        WaitTime = 0.2, 
                                        Fade = 1
                                    });
                                end);
                                task.wait(0.4);
                                if v30.IsEvent then
                                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.09999999999999999);
                                    v46:AdjustSpeed(0.15);
                                    task.spawn(function() --[[ Line: 336 ]]
                                        -- upvalues: v46 (ref), l_TweenService_0 (ref)
                                        for v88 = 1, 45 do
                                            v46:AdjustSpeed((math.lerp(0.03333333333333333, 0.3, l_TweenService_0:GetValue(v88 / 45, Enum.EasingStyle.Quad, Enum.EasingDirection.In))));
                                            task.wait(0.016666666666666666);
                                        end;
                                    end);
                                    for _, v90 in l_Character_0:GetDescendants() do
                                        if v90:IsA("ParticleEmitter") then
                                            v90.TimeScale = v90.TimeScale * 0.1;
                                        end;
                                    end;
                                    task.spawn(function() --[[ Line: 358 ]]
                                        -- upvalues: v53 (ref), l_TweenService_0 (ref)
                                        local v91 = {};
                                        for _, v93 in v53:GetDescendants() do
                                            if v93:IsA("ParticleEmitter") then
                                                v93:SetAttribute("TS", v93.TimeScale);
                                                v93.ZOffset = v93.ZOffset - 2;
                                                table.insert(v91, v93);
                                            end;
                                        end;
                                        for v94 = 1, 90 do
                                            for _, v96 in v91 do
                                                v96.TimeScale = math.lerp(v96:GetAttribute("TS"), 0, (l_TweenService_0:GetValue(v94 / 90, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)));
                                            end;
                                            task.wait(0.016666666666666666);
                                        end;
                                    end);
                                    task.wait(0.2);
                                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                        FieldOfView = 35
                                    }):Play();
                                    task.wait(3.5);
                                end;
                                task.wait(2);
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