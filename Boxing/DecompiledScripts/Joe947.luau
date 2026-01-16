local v0 = {
    DelayTime = 11.5, 
    ServerDelayTime = 13, 
    ExtraEndTime = 3, 
    Metadata = {
        DisplayName = "PURE WHITE ASH", 
        GlowColor = Color3.fromRGB(101, 150, 255), 
        Price = 84999
    }, 
    Animations = {
        Regular = 17208991545, 
        KO = 17229450952, 
        Camera = 17224473454, 
        CameraKO = 17229376441
    }
};
local l_RunService_0 = game:GetService("RunService");
if l_RunService_0:IsServer() then
    return v0;
else
    local l_Players_0 = game:GetService("Players");
    local l_Lighting_0 = game:GetService("Lighting");
    local l_Workspace_0 = game:GetService("Workspace");
    local l_TweenService_0 = game:GetService("TweenService");
    local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
    local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
    local _ = require(l_Modules_0:WaitForChild("AlignHelper"));
    local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
    local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
    local _ = require(l_Modules_0:WaitForChild("Styles"));
    local _ = require(l_ReplicatedStorage_0:WaitForChild("Bezier"));
    local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
    local l_Assets_0 = l_ReplicatedStorage_0:WaitForChild("Assets");
    local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
    local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
    local l_Common_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
    local l_SimulateKnockbackBE_0 = l_ReplicatedStorage_0:WaitForChild("RemoteEvents"):WaitForChild("SimulateKnockbackBE");
    local l_Parent_0 = script.Parent.Parent;
    local v22 = require(l_Parent_0);
    local _ = Random.new();
    local function _(v24, v25, v26) --[[ Line: 58 ]] --[[ Name: Lerp ]]
        return v24 + (v25 - v24) * v26;
    end;
    local function v37(v28, v29) --[[ Line: 60 ]] --[[ Name: SetTransparency ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), l_Workspace_0 (copy)
        for _, v31 in v28:GetDescendants() do
            if v31.Name == "UnusualParticle" then
                v31.Enabled = v29 == 0;
                if not v31.Enabled then
                    local l_Parent_1 = v31.Parent;
                    v31.Parent = l_ReplicatedStorage_0;
                    v31.Parent = l_Parent_1;
                end;
            end;
            if (v31:IsA("BasePart") or v31:IsA("Decal")) and v31.LocalTransparencyModifier < 1000 then
                v31.LocalTransparencyModifier = v29;
            end;
        end;
        local l_FirstChild_0 = l_Workspace_0.Welds:FindFirstChild(v28.Name);
        if l_FirstChild_0 then
            for _, v35 in l_FirstChild_0:GetDescendants() do
                if v35.Name == "UnusualParticle" then
                    v35.Enabled = v29 == 0;
                    if not v35.Enabled then
                        local l_Parent_2 = v35.Parent;
                        v35.Parent = l_ReplicatedStorage_0;
                        v35.Parent = l_Parent_2;
                    end;
                end;
                if (v35:IsA("BasePart") or v35:IsA("Decal")) and v35.LocalTransparencyModifier < 1000 then
                    v35.LocalTransparencyModifier = v29;
                end;
            end;
        end;
    end;
    v0.Main = function(v38) --[[ Line: 97 ]] --[[ Name: Main ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), l_SoundHelper_0 (copy), v0 (copy), l_TweenService_0 (copy), l_AnimHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), v22 (copy), l_Lighting_0 (copy), l_RunService_0 (copy), v37 (copy)
        local v39 = tick();
        local l_Character_0 = v38.Character;
        local l_Damager_0 = v38.Damager;
        local l_StartPosition_0 = v38.StartPosition;
        local l_LookVector_0 = v38.LookVector;
        local l_FirstChild_1 = l_Workspace_0.States:FindFirstChild(l_Character_0.Name);
        local l_CharacterData_0 = l_FirstChild_1:FindFirstChild("CharacterData");
        local l_PlayerData_0 = l_FirstChild_1:FindFirstChild("PlayerData");
        local l_Occupied_0 = l_FirstChild_1:FindFirstChild("Occupied");
        if not l_CharacterData_0 or not l_PlayerData_0 or not l_Occupied_0 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_0);
            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
            local v50 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
            local l_Humanoid_1 = l_Damager_0:FindFirstChild("Humanoid");
            local v52 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
            if not v50 or not v52 then
                return;
            else
                local v53 = l_Assets_0.DownFrames.Default:Clone();
                local v54 = l_LocalPlayer_0.Character == l_Character_0;
                if v54 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v53.Parent = l_Common_0;
                end;
                local v55 = v54 or l_LocalPlayer_0.Character == l_Damager_0;
                local v56 = 0.1;
                local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_0, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_0, l_StartPosition_0 - l_LookVector_0, v56 + 2, l_l_RayHelper_0_EnvironmentWhitelist_0);
                local v61 = l_StartPosition_0 - l_LookVector_0 * v56;
                if l_l_RayHelper_0_RayWithWhiteList_0 then
                    v61 = l_StartPosition_0 - l_LookVector_0 * 0.1;
                end;
                local v62 = {};
                for _, v64 in l_Character_0:GetChildren() do
                    if v64:IsA("BasePart") and v64 ~= l_Character_0.PrimaryPart then
                        v62[v64] = v64.CollisionGroup;
                        v64.CollisionGroup = "None";
                    end;
                end;
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = true;
                end;
                local v65 = l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = v55 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                    DirectCopy = script.Sounds.Song
                });
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2 + v38.ExtraTime, function() --[[ Line: 164 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                if not v55 then
                    v65.Volume = v65.Volume / 2;
                end;
                local l_Volume_0 = v65.Volume;
                v65.Volume = 0;
                l_TweenService_0:Create(v65, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Volume = l_Volume_0
                }):Play();
                task.delay(5, function() --[[ Line: 179 ]]
                    -- upvalues: l_TweenService_0 (ref), v65 (copy)
                    l_TweenService_0:Create(v65.EqualizerSoundEffect, TweenInfo.new(7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        HighGain = 0, 
                        MidGain = 0
                    }):Play();
                end);
                for _, v68 in (v52:GetPlayingAnimationTracks()) do
                    if v68.Priority ~= Enum.AnimationPriority.Idle then
                        local l_Speed_0 = v68.Speed;
                        v68:AdjustSpeed(l_Speed_0 / 1.7);
                        task.delay(1, function() --[[ Line: 190 ]]
                            -- upvalues: v68 (copy), l_Speed_0 (copy)
                            if not v68 then
                                return;
                            else
                                v68:AdjustSpeed(l_Speed_0);
                                return;
                            end;
                        end);
                    end;
                end;
                local v70 = {
                    AnimId = v0.Animations.Regular, 
                    FadeIn = 0.05, 
                    AnimSpeed = 1, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_0, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local _ = l_AnimHelper_0:CreateAnim(v70);
                local v72 = l_Assets_0.Camera:Clone();
                v72.Parent = l_Workspace_0.Debris;
                v72:SetPrimaryPartCFrame(CFrame.new(l_Character_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position - l_LookVector_0) * CFrame.new(0, -2.8, 0) * CFrame.Angles(0, -1.5707963267948966, 0));
                local v73 = {
                    AnimId = v0.Animations.Camera, 
                    AnimSpeed = 1, 
                    Animator = v72.AnimationController.Animator
                };
                local _ = l_AnimHelper_0:CreateAnim(v73);
                local v75 = {};
                local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                local l_CameraTarget_0 = l_CameraSettings_0.CameraTarget;
                local _ = l_CameraSettings_0.CameraMode;
                local l_Variant_0 = l_CameraSettings_0.Variant;
                l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_0.PrimaryPart
                });
                local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
                local _ = l_PrimaryPart_0.CFrame;
                local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
                local v83 = {
                    Victim = l_Character_0, 
                    LookVector = l_LookVector_0, 
                    EndPosition = v61, 
                    VictimPosition = l_PrimaryPart_0.Position, 
                    TargetVector = v61 - v61, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_0, 
                    TargetTime = 1.1666666666666667, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v83);
                if l_Occupied_0 and l_LocalPlayer_0.Character == l_Character_0 then
                    l_Occupied_0.Target.Value = l_LookVector_0;
                    l_Occupied_0.LockedOn.Value = l_Damager_0;
                end;
                local l_Vignette_0 = l_Main_0.DownFrame.Vignette;
                local v85 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v54 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v85, {
                        ImageTransparency = 0.6
                    }):Play();
                end;
                local l_CameraMode_1 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                local v87 = nil;
                local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                if v55 then
                    l_SoundHelper_0:PlaySound({
                        Name = "Cheering", 
                        Parent = l_Workspace_0.Debris
                    });
                    task.delay(0.2, function() --[[ Line: 278 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "KnockdownStart", 
                            Parent = l_Workspace_0.Debris
                        });
                    end);
                    task.defer(function() --[[ Line: 285 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "Knockdown", 
                            WaitTime = 0.3, 
                            Fade = 1.5
                        });
                    end);
                    v22.HUDShake({
                        Scale = 20, 
                        Damper = 0.09999999999999999
                    });
                    v87 = Instance.new("ColorCorrectionEffect");
                    v87.Parent = game.Lighting;
                    v87.Saturation = 0;
                    v87.Contrast = 0;
                    v87.Enabled = true;
                    local v89 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                    l_TweenService_0:Create(v87, v89, {
                        Saturation = -0.6, 
                        Contrast = 0.33
                    }):Play();
                    local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_0.Size = 0;
                    l_MenuBlur_0.Enabled = true;
                    local v91 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_0, v91, {
                        Size = 10
                    }):Play();
                    local v92 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v92, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(0.9966666666666667, function() --[[ Line: 317 ]]
                        -- upvalues: l_CameraMode_1 (copy), l_RunService_0 (ref), l_CurrentCamera_0 (copy), v72 (copy), v22 (ref)
                        l_CameraMode_1.Value = "Cutscene";
                        l_RunService_0:BindToRenderStep("CameraRig", Enum.RenderPriority.Camera.Value + 6, function(_) --[[ Line: 320 ]]
                            -- upvalues: l_CurrentCamera_0 (ref), v72 (ref)
                            l_CurrentCamera_0.CFrame = v72.Head.CFrame;
                        end);
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                    local l_l_MenuBlur_0_0 = l_MenuBlur_0 --[[ copy: 51 -> 57 ]];
                    task.delay(1, function() --[[ Line: 331 ]]
                        -- upvalues: l_TweenService_0 (ref), l_l_MenuBlur_0_0 (copy), v87 (ref), v22 (ref)
                        local v95 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_l_MenuBlur_0_0, v95, {
                            Size = 20
                        }):Play();
                        l_TweenService_0:Create(v87, v95, {
                            Saturation = -0.4, 
                            Contrast = 1.5
                        }):Play();
                        task.wait(0.25);
                        v22.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                    task.delay(4.616666666666666, function() --[[ Line: 344 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "LightHit", 
                            WaitTime = 0.18, 
                            Fade = 1
                        });
                    end);
                    task.delay(5.5, function() --[[ Line: 352 ]]
                        -- upvalues: l_TweenService_0 (ref), v87 (ref)
                        local v96 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(v87, v96, {
                            Saturation = -0.5, 
                            Contrast = 1
                        }):Play();
                    end);
                    task.delay(5.25, function() --[[ Line: 357 ]]
                        -- upvalues: l_SoundHelper_0 (ref), v55 (copy), l_Workspace_0 (ref), l_Character_0 (copy), l_TweenService_0 (ref), l_l_MenuBlur_0_0 (copy), v22 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v55 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                            DirectCopy = script.Sounds.Ragdoll
                        });
                        task.wait(0.3333333333333333);
                        local v97 = TweenInfo.new(1.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_l_MenuBlur_0_0, v97, {
                            Size = 15
                        }):Play();
                        v22.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.3, 
                            Fade = 1.2
                        });
                    end);
                    task.delay(7.5, function() --[[ Line: 375 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (copy), l_TweenService_0 (ref), v87 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Rustle3", 
                            Speed = 0.45, 
                            Volume = 2.9, 
                            Parent = l_Character_0.PrimaryPart
                        });
                        task.wait(0.6666666666666666);
                        local v98 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                        l_TweenService_0:Create(v87, v98, {
                            Saturation = 0, 
                            Contrast = 0
                        }):Play();
                        task.wait(1.3333333333333333);
                        l_SoundHelper_0:PlaySound({
                            Name = "Rustle2", 
                            Speed = 0.5, 
                            Volume = 1, 
                            Parent = l_Character_0.PrimaryPart
                        });
                        task.wait(5);
                        v87:Destroy();
                    end);
                end;
                task.delay(1.4166666666666667, function() --[[ Line: 400 ]]
                    -- upvalues: v61 (ref), l_LookVector_0 (copy), l_Workspace_0 (ref), l_SoundHelper_0 (ref), v55 (copy), l_Character_0 (copy), v87 (ref), l_TweenService_0 (ref), v22 (ref)
                    local v99 = script.FallSmoke:Clone();
                    v99.Position = (CFrame.lookAt(v61, v61 + l_LookVector_0) * CFrame.new(0, 0, 4.5)).Position - Vector3.new(0, 3, 0, 0);
                    v99.Parent = l_Workspace_0.Debris;
                    for _, v101 in v99.Particle:GetChildren() do
                        v101.Enabled = false;
                        v101:Emit(v101:GetAttribute("EmitCount"));
                    end;
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v55 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Crash
                    });
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v55 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Ragdoll
                    });
                    task.wait(1.3333333333333333);
                    l_SoundHelper_0:PlaySound({
                        Name = "Rustle3", 
                        Speed = 0.9, 
                        Volume = 2.3, 
                        Parent = l_Character_0.PrimaryPart
                    });
                    if v55 and v87 then
                        local v102 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                        l_TweenService_0:Create(v87, v102, {
                            Saturation = -0.2, 
                            Contrast = 0.8
                        }):Play();
                    end;
                    task.wait(1.8333333333333333);
                    l_SoundHelper_0:PlaySound({
                        Name = "Rustle5", 
                        Speed = 0.8, 
                        Volume = 1.7, 
                        Parent = l_Character_0.PrimaryPart
                    });
                    task.wait(4.25);
                    local v103 = script.Electric:Clone();
                    v103.Position = (CFrame.lookAt(v61, v61 + l_LookVector_0) * CFrame.new(0, 0, 3.3)).Position - Vector3.new(0, 3, 0, 0);
                    v103.Parent = l_Workspace_0.Debris;
                    for _, v105 in v103:GetDescendants() do
                        if v105:IsA("ParticleEmitter") then
                            v105.Enabled = false;
                            v105:Emit(v105:GetAttribute("EmitCount"));
                        end;
                    end;
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v55 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Metal
                    });
                    if v55 then
                        v22.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.2, 
                            Fade = 1.2
                        });
                    end;
                    task.wait(5);
                    v99:Destroy();
                    v103:Destroy();
                end);
                task.wait(1);
                local v106 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v54 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_Variant_0.Value = "Joe";
                    l_CameraMode_1.Value = "Knockdown";
                    l_CameraTarget_0.Value = l_Character_0;
                    v37(l_Damager_0, 1);
                    l_TweenService_0:Create(l_Vignette_0, v85, {
                        ImageTransparency = 0.2
                    }):Play();
                    l_TweenService_0:Create(l_Lighting_0, v106, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.2
                    }):Play();
                    task.delay(1, function() --[[ Line: 489 ]]
                        -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v106 (copy)
                        l_TweenService_0:Create(l_Lighting_0, v106, {
                            ExposureCompensation = workspace.Exposure.Value
                        }):Play();
                    end);
                    if l_LocalPlayer_0.Character == l_Damager_0 then
                        v22.KnockdownWalk({
                            Damager = l_Damager_0, 
                            DamagerHumanoid = l_Humanoid_1, 
                            LookVector = l_LookVector_0
                        });
                    end;
                end;
                if v54 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v85, {
                        ImageTransparency = 1
                    }):Play();
                end;
                local _ = {
                    HoldTime = 1.5
                };
                if v55 then
                    task.defer(function() --[[ Line: 513 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.4, 
                            Fade = 2
                        });
                    end);
                end;
                task.wait(v0.DelayTime - l_Workspace_0.Ping.Value / 2 - 1 + v38.ExtraTime);
                if v54 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v85, {
                        ImageTransparency = 1
                    }):Play();
                    l_CameraMode_1.Value = "";
                    l_Variant_0.Value = "";
                    v37(l_Damager_0, 0);
                    l_RunService_0:UnbindFromRenderStep("CameraRig");
                    if v72 then
                        v72:Destroy();
                    end;
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                task.delay(0.75, function() --[[ Line: 542 ]]
                    -- upvalues: v39 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v54 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v22 (ref), v53 (copy), l_Workspace_0 (ref)
                    print(v39 - tick());
                    l_SoundHelper_0:PlaySound({
                        Name = "BoxLayer", 
                        Parent = l_Character_0.PrimaryPart
                    });
                    if v54 or l_LocalPlayer_0.Character == l_Damager_0 then
                        v22.TripleText({
                            Image = v53.Box, 
                            HoldTime = 0.6666666666666666
                        });
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.4, 
                            Fade = 0.7
                        });
                    end;
                    task.wait(0.2);
                    if v54 or l_LocalPlayer_0.Character == l_Damager_0 then
                        l_SoundHelper_0:PlaySound({
                            Name = "Box", 
                            Parent = l_Workspace_0.Debris
                        });
                    end;
                end);
                for _, v109 in v75 do
                    v109:Disconnect();
                end;
                if l_Occupied_0 and l_Occupied_0:FindFirstChild("Target") then
                    l_Occupied_0.Target.Value = Vector3.new();
                end;
                if v54 then
                    l_CameraMode_1.Value = "";
                end;
                if l_Damager_0 and l_Damager_0.PrimaryPart then
                    l_Damager_0.PrimaryPart.Anchored = false;
                end;
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = false;
                end;
                for v110, v111 in v62 do
                    v110.CollisionGroup = v111;
                end;
                task.delay(5, function() --[[ Line: 594 ]]
                    -- upvalues: v53 (copy)
                    if v53 then
                        v53:Destroy();
                    end;
                end);
                return;
            end;
        end;
    end;
    v0.KO = function(v112) --[[ Line: 599 ]] --[[ Name: KO ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), l_Main_0 (copy), v22 (copy), v37 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy)
        local l_Character_1 = v112.Character;
        local l_Damager_1 = v112.Damager;
        local _ = v112.StartPosition;
        local l_LookVector_1 = v112.LookVector;
        local l_FirstChild_2 = l_Workspace_0.States:FindFirstChild(l_Character_1.Name);
        local l_CharacterData_1 = l_FirstChild_2:FindFirstChild("CharacterData");
        local l_PlayerData_1 = l_FirstChild_2:FindFirstChild("PlayerData");
        local l_Occupied_1 = l_FirstChild_2:FindFirstChild("Occupied");
        if not l_CharacterData_1 or not l_PlayerData_1 or not l_Occupied_1 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_1);
            local l_Humanoid_2 = l_Character_1:FindFirstChild("Humanoid");
            local v123 = l_Humanoid_2 and l_Humanoid_2:FindFirstChild("Animator");
            local l_Humanoid_3 = l_Damager_1:FindFirstChild("Humanoid");
            local v125 = l_Humanoid_3 and l_Humanoid_3:FindFirstChild("Animator");
            if not v123 or not v125 then
                return;
            else
                local v126 = l_Assets_0.DownFrames.Default:Clone();
                local v127 = l_LocalPlayer_0.Character == l_Character_1;
                if v127 or l_LocalPlayer_0.Character == l_Damager_1 then
                    v126.Parent = l_Common_0;
                end;
                local v128 = v127 or l_LocalPlayer_0.Character == l_Damager_1;
                local v129 = {};
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = true;
                    l_Character_1:PivotTo(CFrame.lookAt(v112.StartPosition, v112.StartPosition + v112.LookVector));
                    task.delay(0.1, function() --[[ Line: 637 ]]
                        -- upvalues: l_Character_1 (copy), v112 (copy)
                        l_Character_1:PivotTo(CFrame.lookAt(v112.StartPosition, v112.StartPosition + v112.LookVector));
                    end);
                end;
                local v130 = script.StoolModel:Clone();
                v130.Name = "Stool";
                v130.Parent = l_Character_1.PrimaryPart;
                local v131 = script.Stool:Clone();
                v131.Parent = l_Character_1.PrimaryPart;
                v131.Part0 = l_Character_1.PrimaryPart;
                v131.Part1 = v130;
                v131.Part0 = l_Character_1.PrimaryPart;
                for _, v133 in (v125:GetPlayingAnimationTracks()) do
                    if v133.Priority ~= Enum.AnimationPriority.Idle then
                        local l_Speed_1 = v133.Speed;
                        v133:AdjustSpeed(l_Speed_1 / 1.7);
                        task.delay(2.8333333333333335, function() --[[ Line: 664 ]]
                            -- upvalues: v133 (copy), l_Speed_1 (copy)
                            if not v133 then
                                return;
                            else
                                v133:AdjustSpeed(l_Speed_1);
                                return;
                            end;
                        end);
                    end;
                end;
                local v135 = {
                    AnimId = v0.Animations.KO, 
                    FadeIn = 0.05, 
                    AnimSpeed = 1.35, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_2, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v135);
                l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Character_1.PrimaryPart
                });
                local v137 = l_Assets_0.Camera:Clone();
                v137.Parent = l_Workspace_0.Debris;
                v137:SetPrimaryPartCFrame(l_Character_1.PrimaryPart.CFrame);
                local v138 = {
                    AnimId = v0.Animations.CameraKO, 
                    AnimSpeed = 1.35, 
                    Animator = v137.AnimationController.Animator
                };
                local l_l_AnimHelper_0_Anim_3 = l_AnimHelper_0:CreateAnim(v138);
                local _ = l_Character_1.PrimaryPart.CFrame;
                local _ = l_Workspace_0.CurrentCamera;
                if l_Occupied_1 and l_LocalPlayer_0.Character == l_Character_1 then
                    l_Occupied_1.Target.Value = l_LookVector_1;
                    l_Occupied_1.LockedOn.Value = l_Damager_1;
                end;
                local l_Vignette_1 = l_Main_0.DownFrame.Vignette;
                local v143 = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local l_CameraMode_2 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                local l_CurrentCamera_2 = l_Workspace_0.CurrentCamera;
                local v146 = v22.GetAtmosphere();
                local v147 = {
                    Density = v146.Density, 
                    Color = v146.Color, 
                    Haze = v146.Haze, 
                    Glare = v146.Glare
                };
                local v148 = script.Light:Clone();
                v148.CFrame = l_Character_1.PrimaryPart.CFrame * CFrame.new(0, -2.5, 3);
                v148.Parent = l_Workspace_0.Debris;
                local v149 = {};
                local v150 = {};
                local v151 = {
                    "Live", 
                    "Welds"
                };
                if v128 then
                    local v152, v153 = v22.GetPartsToHide(l_Character_1, v151);
                    v149 = v152;
                    v150 = v153;
                end;
                local v154 = script.Base:Clone();
                v154.LocalTransparencyModifier = 1;
                v154.CFrame = l_Character_1.PrimaryPart.CFrame * CFrame.new(0, -12.8, 0);
                v154.Parent = l_Workspace_0.Debris;
                task.delay(8, function() --[[ Line: 745 ]]
                    -- upvalues: v154 (copy)
                    if v154 then
                        v154:Destroy();
                    end;
                end);
                local l_Color_0 = v154.Color;
                v154.Color = Color3.fromRGB(29, 33, 39);
                local v156 = nil;
                local v157 = nil;
                if v128 then
                    l_CameraMode_2.Value = "Cutscene";
                    for _, v159 in l_Workspace_0.Live:GetChildren() do
                        if v159.Name ~= l_Character_1.Name then
                            v37(v159, 1);
                        end;
                    end;
                    v157 = l_Workspace_0.Live.ChildAdded:Connect(function(v160) --[[ Line: 763 ]]
                        -- upvalues: v37 (ref)
                        v37(v160, 1);
                    end);
                    task.defer(function() --[[ Line: 767 ]]
                        -- upvalues: l_Lighting_0 (ref), l_TweenService_0 (ref), v22 (ref)
                        local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
                        l_ColorCorrection_0.Saturation = 0;
                        l_ColorCorrection_0.Contrast = 0;
                        l_ColorCorrection_0.Enabled = true;
                        local v162 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_ColorCorrection_0, v162, {
                            Saturation = -1, 
                            Contrast = 0.5
                        }):Play();
                        local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_1.Size = 0;
                        l_MenuBlur_1.Enabled = true;
                        local v164 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_1, v164, {
                            Size = 10
                        }):Play();
                        local v165 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_Lighting_0, v165, {
                            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                        }):Play();
                        task.defer(function() --[[ Line: 786 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "HardHitRoll", 
                                WaitTime = 0.5, 
                                Fade = 3
                            });
                        end);
                        v22.CreateImpactFrame({
                            Time = 0.12
                        });
                    end);
                    l_CurrentCamera_2.FieldOfView = 45;
                    l_TweenService_0:Create(l_CurrentCamera_2, TweenInfo.new(2.962962962962963, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        FieldOfView = 32
                    }):Play();
                    local v166 = CFrame.new();
                    do
                        local l_v166_0 = v166;
                        l_RunService_0:BindToRenderStep("CameraRig", Enum.RenderPriority.Camera.Value + 6, function(_) --[[ Line: 803 ]]
                            -- upvalues: l_CurrentCamera_2 (copy), v137 (copy), l_v166_0 (ref)
                            l_CurrentCamera_2.CFrame = v137.Head.CFrame * l_v166_0;
                        end);
                        v156 = Instance.new("ColorCorrectionEffect");
                        v156.Parent = game.Lighting;
                        v156.Saturation = 0;
                        v156.Contrast = 0;
                        v156.Enabled = true;
                        task.delay(0.5, function() --[[ Line: 813 ]]
                            -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_ReplicatedStorage_0 (ref)
                            l_SoundHelper_0:PlaySound({
                                Name = "Knockdown", 
                                Parent = l_Workspace_0.Debris, 
                                DirectCopy = script.Sounds.Voice
                            });
                            task.wait(6);
                            l_ReplicatedStorage_0.Events.AddCustomSong:Fire(math.random(1, 2) == 1 and script.Sounds.Final1 or script.Sounds.Final2);
                        end);
                        task.delay(0.061728395061728385, function() --[[ Line: 824 ]]
                            -- upvalues: l_SoundHelper_0 (ref), l_Character_1 (copy)
                            l_SoundHelper_0:PlaySound({
                                Name = "Rustle3", 
                                Speed = 0.7, 
                                Volume = 1.6, 
                                Parent = l_Character_1.PrimaryPart
                            });
                            task.wait(2.0370370370370368);
                            l_SoundHelper_0:PlaySound({
                                Name = "Rustle5", 
                                Speed = 0.7, 
                                Volume = 1.6, 
                                Parent = l_Character_1.PrimaryPart
                            });
                        end);
                        task.delay(1.419753086419753, function() --[[ Line: 841 ]]
                            -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_2 (copy), l_v166_0 (ref)
                            l_TweenService_0:Create(l_CurrentCamera_2, TweenInfo.new(0.6172839506172839, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
                                FieldOfView = 50
                            }):Play();
                            task.wait(0.8148148148148149);
                            l_TweenService_0:Create(l_CurrentCamera_2, TweenInfo.new(0.9876543209876542, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                FieldOfView = 28
                            }):Play();
                            task.defer(function() --[[ Line: 847 ]]
                                -- upvalues: l_v166_0 (ref), l_TweenService_0 (ref)
                                for v169 = 1, 80 do
                                    l_v166_0 = CFrame.new(0, 0, 0 + 8 * l_TweenService_0:GetValue(v169 / 80, Enum.EasingStyle.Quad, Enum.EasingDirection.Out));
                                    task.wait(0.016666666666666666);
                                end;
                            end);
                            task.wait(0.4691358024691358);
                            l_TweenService_0:Create(l_CurrentCamera_2, TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                FieldOfView = 37
                            }):Play();
                        end);
                        task.delay(1.8271604938271604, function() --[[ Line: 859 ]]
                            -- upvalues: l_TweenService_0 (ref), v148 (copy)
                            l_TweenService_0:Create(v148.PointLight, TweenInfo.new(1.9753086419753083, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {
                                Brightness = 1, 
                                Range = 8
                            }):Play();
                            task.wait(0.4938271604938271);
                            v148.Beam.Enabled = true;
                            local v170 = TweenInfo.new(2.716049382716049, Enum.EasingStyle.Quart, Enum.EasingDirection.Out);
                            l_TweenService_0:Create(v148.A0, v170, {
                                Position = v148.A0.Position - Vector3.new(0.800000011920929, 0, 0, 0)
                            }):Play();
                            l_TweenService_0:Create(v148.A1, v170, {
                                Position = v148.A1.Position - Vector3.new(0.800000011920929, 0, 0, 0)
                            }):Play();
                            l_TweenService_0:Create(v148.Beam, TweenInfo.new(4.938271604938271, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                                Width0 = 8.2, 
                                Width1 = 0.1
                            }):Play();
                        end);
                        l_TweenService_0:Create(v156, TweenInfo.new(0.09876543209876543, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Brightness = 0.4
                        }):Play();
                        task.wait(0.09876543209876543);
                        l_TweenService_0:Create(v156, TweenInfo.new(0.2716049382716049, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Brightness = 0
                        }):Play();
                        task.wait(1.728395061728395);
                        l_TweenService_0:Create(v156, TweenInfo.new(0.37037037037037035, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
                            Brightness = 0.5
                        }):Play();
                        l_TweenService_0:Create(v156, TweenInfo.new(0.37037037037037035, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            Saturation = -1
                        }):Play();
                        task.wait(0.2222222222222222);
                        l_TweenService_0:Create(v146, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Density = 0.45, 
                            Color = Color3.fromRGB(0, 0, 0), 
                            Haze = 20, 
                            Glare = 0.2
                        }):Play();
                        l_TweenService_0:Create(v156, TweenInfo.new(0.7160493827160493, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                            Contrast = 2.5, 
                            TintColor = Color3.fromRGB(189, 209, 255)
                        }):Play();
                        for _, v172 in v150 do
                            v172.Enabled = false;
                        end;
                        task.defer(function() --[[ Line: 911 ]]
                            -- upvalues: l_TweenService_0 (ref), v154 (copy), l_Color_0 (copy), v149 (ref)
                            l_TweenService_0:Create(v154, TweenInfo.new(1.9, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Color = l_Color_0
                            }):Play();
                            for v173 = 1, 20 do
                                local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v173 / 20, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                                for _, v176 in v149 do
                                    if v176.LocalTransparencyModifier < 1000 then
                                        v176.LocalTransparencyModifier = l_l_TweenService_0_Value_0;
                                    end;
                                end;
                                v154.LocalTransparencyModifier = 1 - l_l_TweenService_0_Value_0;
                                task.wait(0.03333333333333333);
                            end;
                        end);
                        task.wait(0.09876543209876543);
                        l_TweenService_0:Create(v156, TweenInfo.new(0.5925925925925926, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            Brightness = -0.1
                        }):Play();
                        task.wait(1.8518518518518516);
                        l_l_AnimHelper_0_Anim_3:AdjustSpeed(0);
                        l_l_AnimHelper_0_Anim_2:AdjustSpeed(0);
                    end;
                end;
                local v177 = false;
                local function v190() --[[ Line: 938 ]] --[[ Name: Reset ]]
                    -- upvalues: v177 (ref), v156 (ref), v130 (copy), v131 (copy), v148 (copy), l_TweenService_0 (ref), v146 (copy), v147 (copy), v37 (ref), l_Character_1 (copy), l_Occupied_1 (copy), v127 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), l_Lighting_0 (ref), v129 (copy), l_l_AnimHelper_0_Anim_2 (copy), v126 (copy), v137 (copy), l_Vignette_1 (copy), v143 (copy), v128 (copy), v157 (ref), l_Workspace_0 (ref), v22 (ref), l_RunService_0 (ref), l_CameraMode_2 (copy), l_CurrentCamera_2 (copy), v149 (ref), v154 (copy), v150 (ref)
                    if v177 then
                        return;
                    else
                        v177 = true;
                        if v156 then
                            v156:Destroy();
                        end;
                        if v130 then
                            v130:Destroy();
                        end;
                        if v131 then
                            v131:Destroy();
                        end;
                        if v148 then
                            v148:Destroy();
                        end;
                        l_TweenService_0:Create(v146, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v147):Play();
                        v37(l_Character_1, 0);
                        if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                            l_Occupied_1.Target.Value = Vector3.new();
                        end;
                        if v127 then
                            l_Occupied_1.LerpMult.Value = 0;
                        end;
                        if v127 or l_LocalPlayer_0.Character == l_Damager_1 then
                            local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
                            local v179 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                            l_TweenService_0:Create(l_ColorCorrection_1, v179, {
                                Saturation = 0, 
                                Contrast = 0
                            }):Play();
                        end;
                        if l_Damager_1 and l_Damager_1.PrimaryPart then
                            l_Damager_1:SetPrimaryPartCFrame(l_Character_1.PrimaryPart.CFrame * CFrame.new(0, 0, -3.5) * CFrame.Angles(0, 3.141592653589793, 0));
                            l_Damager_1.PrimaryPart.Anchored = false;
                        end;
                        if l_Character_1 and l_Character_1.PrimaryPart then
                            l_Character_1.PrimaryPart.Anchored = false;
                        end;
                        for v180, v181 in v129 do
                            v180.CollisionGroup = v181;
                        end;
                        l_l_AnimHelper_0_Anim_2:Stop(0);
                        if v126 then
                            v126:Destroy();
                        end;
                        if v137 then
                            v137:Destroy();
                        end;
                        if v127 or l_LocalPlayer_0.Character == l_Damager_1 then
                            l_TweenService_0:Create(l_Vignette_1, v143, {
                                ImageTransparency = 1
                            }):Play();
                        end;
                        if v126 then
                            v126:Destroy();
                        end;
                        if v128 then
                            v157:Disconnect();
                            for _, v183 in l_Workspace_0.Live:GetChildren() do
                                v37(v183, 0);
                            end;
                            l_TweenService_0:Create(l_Vignette_1, v143, {
                                ImageTransparency = 1
                            }):Play();
                            task.delay(0.3, function() --[[ Line: 996 ]]
                                -- upvalues: v22 (ref)
                                v22.CameraShake({
                                    Preset = "Knockdown", 
                                    WaitTime = 0.15, 
                                    Fade = 0.5, 
                                    FoV = 65, 
                                    FoVMult = 1
                                });
                            end);
                            l_RunService_0:UnbindFromRenderStep("CameraRig");
                            l_CameraMode_2.Value = "";
                            l_CurrentCamera_2.FieldOfView = 70;
                        end;
                        if v128 then
                            task.defer(function() --[[ Line: 1014 ]]
                                -- upvalues: l_TweenService_0 (ref), v149 (ref), v154 (ref), v150 (ref)
                                for v184 = 1, 8 do
                                    local l_l_TweenService_0_Value_1 = l_TweenService_0:GetValue(v184 / 8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                                    for _, v187 in v149 do
                                        if v187.LocalTransparencyModifier < 1000 then
                                            v187.LocalTransparencyModifier = 1 - l_l_TweenService_0_Value_1;
                                        end;
                                    end;
                                    if v154 then
                                        v154.LocalTransparencyModifier = l_l_TweenService_0_Value_1;
                                    end;
                                    task.wait(0.03333333333333333);
                                end;
                                for _, v189 in v150 do
                                    v189.Enabled = true;
                                end;
                                if v154 then
                                    v154:Destroy();
                                end;
                            end);
                        end;
                        return;
                    end;
                end;
                local v191 = nil;
                if l_CharacterData_1 and l_CharacterData_1:FindFirstChild("Cutscene") then
                    v191 = l_CharacterData_1.Cutscene.Changed:Connect(function() --[[ Line: 1039 ]]
                        -- upvalues: v191 (ref), v190 (copy)
                        if v191 then
                            v191:Disconnect();
                        end;
                        task.wait(0.28);
                        v190();
                    end);
                end;
                task.wait(8);
                v190();
                return;
            end;
        end;
    end;
    v0.Use = function(v192) --[[ Line: 1050 ]] --[[ Name: Use ]]
        -- upvalues: v0 (copy)
        local _ = v192.Character;
        local _ = v192.Damager;
        if v192.IsKO then
            v0.KO(v192);
            return;
        else
            v0.Main(v192);
            return;
        end;
    end;
    return v0;
end;