local v0 = {
    DelayTime = 8, 
    ServerDelayTime = 11, 
    Metadata = {
        DisplayName = "8-BIT", 
        GlowColor = Color3.fromRGB(255, 210, 28), 
        Price = 32100
    }, 
    Animations = {
        Start = 16660377173, 
        Loop = 16660406457, 
        End = 16660353264, 
        KO = 16662188706
    }
};
if game:GetService("RunService"):IsServer() then
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
    local v21 = require(l_Parent_0);
    local _ = Random.new();
    local function _(v23, v24, v25) --[[ Line: 57 ]] --[[ Name: Lerp ]]
        return v23 + (v24 - v23) * v25;
    end;
    v0.Main = function(v27) --[[ Line: 59 ]] --[[ Name: Main ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), v21 (copy), l_Main_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_Lighting_0 (copy)
        local v28 = tick();
        local l_Character_0 = v27.Character;
        local l_Damager_0 = v27.Damager;
        local l_StartPosition_0 = v27.StartPosition;
        local l_LookVector_0 = v27.LookVector;
        local l_FirstChild_0 = l_Workspace_0.States:FindFirstChild(l_Character_0.Name);
        local l_CharacterData_0 = l_FirstChild_0:FindFirstChild("CharacterData");
        local l_PlayerData_0 = l_FirstChild_0:FindFirstChild("PlayerData");
        local l_Occupied_0 = l_FirstChild_0:FindFirstChild("Occupied");
        if not l_CharacterData_0 or not l_PlayerData_0 or not l_Occupied_0 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_0);
            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
            local v39 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
            local l_Humanoid_1 = l_Damager_0:FindFirstChild("Humanoid");
            local v41 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
            if not v39 or not v41 then
                return;
            else
                local v42 = l_Assets_0.DownFrames.Default:Clone();
                local v43 = l_LocalPlayer_0.Character == l_Character_0;
                if v43 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v42.Parent = l_Common_0;
                end;
                local v44 = v43 or l_LocalPlayer_0.Character == l_Damager_0;
                local v45 = 3.5;
                local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_0, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_0, l_StartPosition_0 - l_LookVector_0, v45 + 1.5, l_l_RayHelper_0_EnvironmentWhitelist_0);
                local v50 = l_StartPosition_0 - l_LookVector_0 * v45;
                if l_l_RayHelper_0_RayWithWhiteList_0 then
                    v50 = l_StartPosition_0 - l_LookVector_0 * 1.5;
                end;
                local v51 = {};
                for _, v53 in l_Character_0:GetChildren() do
                    if v53:IsA("BasePart") and v53 ~= l_Character_0.PrimaryPart then
                        v51[v53] = v53.CollisionGroup;
                        v53.CollisionGroup = "None";
                    end;
                end;
                if not l_Character_0 or l_Character_0.PrimaryPart then

                end;
                for _, v55 in (v41:GetPlayingAnimationTracks()) do
                    if v55.Priority ~= Enum.AnimationPriority.Idle then
                        local l_Speed_0 = v55.Speed;
                        v55:AdjustSpeed(l_Speed_0 / 1.8);
                        task.delay(1.4222222222222223, function() --[[ Line: 129 ]]
                            -- upvalues: v55 (copy), l_Speed_0 (copy)
                            if not v55 then
                                return;
                            else
                                v55:AdjustSpeed(l_Speed_0);
                                return;
                            end;
                        end);
                    end;
                end;
                local v57 = {
                    AnimId = v0.Animations.Start, 
                    FadeIn = 0.05, 
                    AnimSpeed = 0.75, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = v39, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v57);
                local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
                local l_CFrame_0 = l_PrimaryPart_0.CFrame;
                local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
                local v62 = {
                    Victim = l_Character_0, 
                    LookVector = l_LookVector_0, 
                    EndPosition = v50, 
                    VictimPosition = l_PrimaryPart_0.Position, 
                    TargetVector = v50 - v50, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_0, 
                    TargetTime = 0.17777777777777778, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v62);
                local v63 = script.Particles.Hit8Bit:Clone();
                v63.Parent = l_Damager_0.PrimaryPart;
                for _, v65 in v63:GetChildren() do
                    v65:Emit(v65:GetAttribute("EmitCount"));
                end;
                task.delay(8, function() --[[ Line: 173 ]]
                    -- upvalues: v63 (copy)
                    v63:Destroy();
                end);
                local v66 = {};
                local function v72(v67) --[[ Line: 178 ]] --[[ Name: CreateTrail ]]
                    -- upvalues: l_Character_0 (copy), v21 (ref), v66 (copy)
                    local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(v67);
                    if not l_l_Character_0_FirstChild_0 then
                        return;
                    else
                        local v69 = script.Trail:Clone();
                        v69.Parent = v21.GetWeldCharacter(l_Character_0);
                        local l_Attachment0_0 = v69.Attachment0;
                        local l_Attachment1_0 = v69.Attachment1;
                        l_Attachment0_0.Parent = l_l_Character_0_FirstChild_0;
                        l_Attachment1_0.Parent = l_l_Character_0_FirstChild_0;
                        v69:Destroy();
                        table.insert(v66, l_Attachment0_0);
                        table.insert(v66, l_Attachment1_0);
                        return;
                    end;
                end;
                v72("LeftHand");
                v72("RightHand");
                v72("LeftFoot");
                v72("RightFoot");
                local v73 = script.Knockdown:Clone();
                v73.CFrame = CFrame.lookAt(l_CFrame_0.Position, v50);
                v73.Position = v73.Position + Vector3.new(0, 0.75, 0, 0);
                v73.Parent = l_Workspace_0.Debris;
                for _, v75 in v73.Particle:GetChildren() do
                    v75.Enabled = false;
                    v75:Emit(v75:GetAttribute("EmitCount"));
                end;
                if l_Occupied_0 and l_LocalPlayer_0.Character == l_Character_0 then
                    l_Occupied_0.Target.Value = l_LookVector_0;
                    l_Occupied_0.LockedOn.Value = l_Damager_0;
                end;
                local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                local l_CameraTarget_0 = l_CameraSettings_0.CameraTarget;
                local l_CameraMode_0 = l_CameraSettings_0.CameraMode;
                local l_Variant_0 = l_CameraSettings_0.Variant;
                local l_Vignette_0 = l_Main_0.DownFrame.Vignette;
                local v81 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v82 = l_LocalPlayer_0.Character == l_Character_0;
                if v82 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v81, {
                        ImageTransparency = 0.6
                    }):Play();
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Damager_0.PrimaryPart, 
                    DirectCopy = script.Sounds.Explosion
                });
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Damager_0.PrimaryPart, 
                    DirectCopy = script.Sounds.Death
                });
                local v86 = {
                    [1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Fall"):Connect(function() --[[ Line: 245 ]]
                        -- upvalues: v44 (copy), v21 (ref), v50 (ref), l_LookVector_0 (copy), l_Workspace_0 (ref), l_SoundHelper_0 (ref), l_Damager_0 (copy)
                        task.wait(0.1);
                        if v44 then
                            task.defer(function() --[[ Line: 249 ]]
                                -- upvalues: v21 (ref)
                                v21.CameraShake({
                                    Preset = "HardHit", 
                                    WaitTime = 0.1, 
                                    Fade = 1
                                });
                            end);
                        end;
                        local v83 = script.FallSmoke:Clone();
                        v83.Position = (CFrame.lookAt(v50, v50 + l_LookVector_0) * CFrame.new(0, 0, 1)).Position - Vector3.new(0, 2.5, 0, 0);
                        v83.Parent = l_Workspace_0.Debris;
                        for _, v85 in v83.Particle:GetChildren() do
                            v85.Enabled = false;
                            v85:Emit(v85:GetAttribute("EmitCount") * 1.5);
                        end;
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = l_Damager_0.PrimaryPart, 
                            DirectCopy = script.Sounds.Hit
                        });
                        task.wait(5);
                        v83:Destroy();
                    end)
                };
                if v44 then
                    task.defer(function() --[[ Line: 278 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "Knockdown", 
                            WaitTime = 0.5, 
                            Fade = 2, 
                            FoV = 55, 
                            FoVMult = 1
                        });
                    end);
                    v21.HUDShake({
                        Scale = 20, 
                        Damper = 0.09999999999999999
                    });
                    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_0.Saturation = 0;
                    l_ColorCorrection_0.Contrast = 0;
                    l_ColorCorrection_0.Enabled = true;
                    local v88 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                    l_TweenService_0:Create(l_ColorCorrection_0, v88, {
                        Saturation = 0.2, 
                        Contrast = 0.1
                    }):Play();
                    local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_0.Size = 0;
                    l_MenuBlur_0.Enabled = true;
                    local v90 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_0, v90, {
                        Size = 10
                    }):Play();
                    local v91 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v91, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(0.17777777777777778, function() --[[ Line: 312 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Damager_0 (copy), v21 (ref), v42 (copy)
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = l_Damager_0.PrimaryPart, 
                            DirectCopy = script.Sounds.Start
                        });
                        v21.TripleText({
                            Image = v42.Down
                        });
                    end);
                    task.delay(0.17777777777777778, function() --[[ Line: 324 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                end;
                task.wait(1.4222222222222223);
                v57.Priority = Enum.AnimationPriority.Action3;
                v57.AnimId = v0.Animations.Loop;
                v57.Looped = true;
                v57.AnimSpeed = 1;
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v57);
                l_l_AnimHelper_0_Anim_1.Name = "Remove";
                task.wait(1);
                local v93 = l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Damager_0.PrimaryPart, 
                    DirectCopy = script.Sounds.Song
                });
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2 - 2 * v27.RandomMult - 1 + v27.ExtraTime, function() --[[ Line: 351 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                local v94 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                task.defer(function() --[[ Line: 360 ]]
                    -- upvalues: v21 (ref), l_Character_0 (copy), v27 (copy), v0 (ref), v82 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy)
                    v21.DownCount({
                        Character = l_Character_0, 
                        Name = "8Bit", 
                        Sound = script.Sounds.Count, 
                        Speed = v27.ExtraTime / (v0.DelayTime + v27.ExtraTime), 
                        IsBillboard = not (v82 or l_LocalPlayer_0.Character == l_Damager_0)
                    });
                end);
                if v82 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_Variant_0.Value = "Retro";
                    l_CameraMode_0.Value = "Knockdown";
                    l_CameraTarget_0.Value = l_Character_0;
                    l_TweenService_0:Create(l_Vignette_0, v81, {
                        ImageTransparency = 0.2
                    }):Play();
                    l_TweenService_0:Create(l_Lighting_0, v94, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.2
                    }):Play();
                    task.delay(1, function() --[[ Line: 379 ]]
                        -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v94 (copy)
                        l_TweenService_0:Create(l_Lighting_0, v94, {
                            ExposureCompensation = workspace.Exposure.Value
                        }):Play();
                    end);
                    if l_LocalPlayer_0.Character == l_Damager_0 then
                        v21.KnockdownWalk({
                            Damager = l_Damager_0, 
                            DamagerHumanoid = l_Humanoid_1, 
                            LookVector = l_LookVector_0
                        });
                    end;
                end;
                l_Damager_0:SetAttribute("CurrentEmote", nil);
                local v95 = tick();
                repeat
                    task.wait(0.1);
                until l_Character_0:GetAttribute("GettingUp") or not l_Character_0:IsDescendantOf(l_Workspace_0) or tick() - v95 > 15;
                if v82 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Lighting_0, v94, {
                        ExposureCompensation = workspace.Exposure.Value
                    }):Play();
                    task.delay(1, function() --[[ Line: 402 ]]
                        -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v94 (copy)
                        l_TweenService_0:Create(l_Lighting_0, v94, {
                            ExposureCompensation = workspace.Exposure.Value
                        }):Play();
                    end);
                end;
                if v82 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v81, {
                        ImageTransparency = 1
                    }):Play();
                    l_CameraMode_0.Value = "";
                    l_Variant_0.Value = "";
                end;
                v57.Priority = Enum.AnimationPriority.Action4;
                v57.AnimId = v0.Animations.End;
                v57.Looped = false;
                v57.StopInfo = {
                    StopDelay = 1.05, 
                    StopTime = 0.4, 
                    Weight = 1
                };
                task.delay(0.4, function() --[[ Line: 424 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Damager_0 (copy)
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Damager_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Jump
                    });
                end);
                if l_l_AnimHelper_0_Anim_1 then
                    l_l_AnimHelper_0_Anim_1:Stop(0);
                end;
                l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v57);
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                task.delay(1.15, function() --[[ Line: 442 ]]
                    -- upvalues: v28 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v44 (copy), v21 (ref), v42 (copy), v82 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), l_Workspace_0 (ref)
                    print(v28 - tick());
                    l_SoundHelper_0:PlaySound({
                        Name = "BoxLayer", 
                        Parent = l_Character_0.PrimaryPart
                    });
                    if v44 then
                        v21.TripleText({
                            Image = v42.Box, 
                            HoldTime = 0.6666666666666666
                        });
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.4, 
                            Fade = 0.7
                        });
                    end;
                    task.wait(0.2);
                    if v82 or l_LocalPlayer_0.Character == l_Damager_0 then
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = l_Damager_0.PrimaryPart, 
                            DirectCopy = script.Sounds.Ding
                        });
                        l_SoundHelper_0:PlaySound({
                            Name = "Box", 
                            Parent = l_Workspace_0.Debris
                        });
                    end;
                end);
                if l_Occupied_0 and l_Occupied_0:FindFirstChild("Target") then
                    l_Occupied_0.Target.Value = Vector3.new();
                end;
                l_TweenService_0:Create(v93, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Volume = 0
                }):Play();
                task.wait(1.25);
                if v82 or l_LocalPlayer_0.Character == l_Damager_0 then
                    local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
                    local v97 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                    l_TweenService_0:Create(l_ColorCorrection_1, v97, {
                        Saturation = 0, 
                        Contrast = 0
                    }):Play();
                end;
                for _, v99 in v66 do
                    v99:Destroy();
                end;
                if l_Damager_0 and l_Damager_0.PrimaryPart then
                    l_Damager_0.PrimaryPart.Anchored = false;
                end;
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = false;
                end;
                for v100, v101 in v51 do
                    v100.CollisionGroup = v101;
                end;
                for _, v103 in v86 do
                    v103:Disconnect();
                end;
                task.wait(5);
                l_l_AnimHelper_0_Anim_0:Stop(0);
                v73:Destroy();
                if v42 then
                    v42:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.KO = function(v104) --[[ Line: 518 ]] --[[ Name: KO ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), l_TweenService_0 (copy), v21 (copy), l_Lighting_0 (copy), l_ReplicatedStorage_0 (copy)
        local l_Character_1 = v104.Character;
        local l_Damager_1 = v104.Damager;
        local l_StartPosition_1 = v104.StartPosition;
        local l_LookVector_1 = v104.LookVector;
        local l_FirstChild_1 = l_Workspace_0.States:FindFirstChild(l_Character_1.Name);
        local l_CharacterData_1 = l_FirstChild_1:FindFirstChild("CharacterData");
        local l_PlayerData_1 = l_FirstChild_1:FindFirstChild("PlayerData");
        local l_Occupied_1 = l_FirstChild_1:FindFirstChild("Occupied");
        if not l_CharacterData_1 or not l_PlayerData_1 or not l_Occupied_1 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_1);
            local l_Humanoid_2 = l_Character_1:FindFirstChild("Humanoid");
            local v115 = l_Humanoid_2 and l_Humanoid_2:FindFirstChild("Animator");
            local l_Humanoid_3 = l_Damager_1:FindFirstChild("Humanoid");
            local v117 = l_Humanoid_3 and l_Humanoid_3:FindFirstChild("Animator");
            if not v115 or not v117 then
                return;
            else
                local v118 = l_Assets_0.DownFrames.Default:Clone();
                if l_LocalPlayer_0.Character == l_Character_1 or l_LocalPlayer_0.Character == l_Damager_1 then
                    v118.Parent = l_Common_0;
                end;
                local v119 = 2.25;
                local l_l_RayHelper_0_EnvironmentWhitelist_1 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_1, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_1, l_StartPosition_1 - l_LookVector_1, v119 + 1.5, l_l_RayHelper_0_EnvironmentWhitelist_1);
                local v124 = l_StartPosition_1 - l_LookVector_1 * v119;
                if l_l_RayHelper_0_RayWithWhiteList_1 then
                    v124 = l_StartPosition_1 - l_LookVector_1 * 0.25;
                end;
                local v125 = {};
                for _, v127 in l_Character_1:GetChildren() do
                    if v127:IsA("BasePart") and v127 ~= l_Character_1.PrimaryPart then
                        v125[v127] = v127.CollisionGroup;
                        v127.CollisionGroup = "None";
                    end;
                end;
                if not l_Character_1 or l_Character_1.PrimaryPart then

                end;
                for _, v129 in (v117:GetPlayingAnimationTracks()) do
                    if v129.Priority ~= Enum.AnimationPriority.Idle then
                        v129:AdjustSpeed(v129.Speed / 4);
                    end;
                end;
                local v130 = {
                    AnimId = v0.Animations.KO, 
                    FadeIn = 0.05, 
                    AnimSpeed = 0.85, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_2, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v130);
                local v132 = script.Particles.Hit8Bit:Clone();
                v132.Parent = l_Damager_1.PrimaryPart;
                for _, v134 in v132:GetChildren() do
                    v134:Emit(v134:GetAttribute("EmitCount"));
                end;
                task.delay(8, function() --[[ Line: 604 ]]
                    -- upvalues: v132 (copy)
                    v132:Destroy();
                end);
                local v135 = l_LocalPlayer_0.Character == l_Character_1;
                task.delay(0.39215686274509803, function() --[[ Line: 610 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_2 (copy)
                    for v136 = 1, 10 do
                        l_l_AnimHelper_0_Anim_2:AdjustSpeed(0.85 + -0.04999999999999993 * (v136 / 10));
                        task.wait(0.016666666666666666);
                    end;
                end);
                if v135 or l_LocalPlayer_0.Character == l_Damager_1 then
                    task.delay(0.8333333333333334, function() --[[ Line: 621 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Character_1 (copy)
                        l_SoundHelper_0:PlaySound({
                            Name = "Rustle3", 
                            Parent = l_Character_1.PrimaryPart, 
                            Volume = 2
                        });
                        task.wait(0.4666666666666667);
                        l_SoundHelper_0:PlaySound({
                            Name = "FeintRustle", 
                            Parent = l_Character_1.PrimaryPart, 
                            Volume = 0.3, 
                            Speed = 0.7
                        });
                    end);
                end;
                local l_PrimaryPart_1 = l_Character_1.PrimaryPart;
                local l_CFrame_1 = l_PrimaryPart_1.CFrame;
                local l_l_Workspace_0_ServerTimeNow_1 = l_Workspace_0:GetServerTimeNow();
                local v140 = {
                    Victim = l_Character_1, 
                    LookVector = l_LookVector_1, 
                    EndPosition = v124, 
                    VictimPosition = l_PrimaryPart_1.Position, 
                    TargetVector = v124 - v124, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_1, 
                    TargetTime = 0.7058823529411765, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v140);
                local v141 = script.Knockdown:Clone();
                v141.CFrame = CFrame.lookAt(l_CFrame_1.Position, v124);
                v141.Position = v141.Position + Vector3.new(0, 0.75, 0, 0);
                v141.Parent = l_Workspace_0.Debris;
                for _, v143 in v141.Particle:GetChildren() do
                    v143.Enabled = false;
                    v143:Emit(v143:GetAttribute("EmitCount"));
                end;
                if l_Occupied_1 and l_LocalPlayer_0.Character == l_Character_1 then
                    l_Occupied_1.Target.Value = l_LookVector_1;
                    l_Occupied_1.LockedOn.Value = l_Damager_1;
                end;
                local l_CameraSettings_1 = l_Workspace_0:FindFirstChild("CameraSettings");
                local _ = l_CameraSettings_1.CameraTarget;
                local l_CameraMode_1 = l_CameraSettings_1.CameraMode;
                local l_Variant_1 = l_CameraSettings_1.Variant;
                local l_Vignette_1 = l_Main_0.DownFrame.Vignette;
                local v149 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v150 = l_LocalPlayer_0.Character == l_Character_1;
                if v150 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v149, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                local v151 = v150 or l_LocalPlayer_0.Character == l_Damager_1;
                if v150 then
                    l_CameraMode_1.Value = "Cutscene";
                    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        FieldOfView = 60
                    }):Play();
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                        CFrame = l_CurrentCamera_0.CFrame * CFrame.new(-3.1, -2, 4.7) * CFrame.Angles(0, 0, 0.06981317007977318)
                    }):Play();
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Damager_1.PrimaryPart, 
                    DirectCopy = script.Sounds.Explosion
                });
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Damager_1.PrimaryPart, 
                    DirectCopy = script.Sounds.Hit
                });
                if v151 then
                    l_SoundHelper_0:PlaySound({
                        Name = "Cheering", 
                        Parent = l_Workspace_0.Debris
                    });
                    task.defer(function() --[[ Line: 719 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "Knockdown", 
                            WaitTime = 0.3, 
                            Fade = 1.5, 
                            FoV = 55, 
                            FoVMult = 1
                        });
                    end);
                    v21.HUDShake({
                        Scale = 20, 
                        Damper = 0.09999999999999999
                    });
                    local l_ColorCorrection_2 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_2.Saturation = 0;
                    l_ColorCorrection_2.Contrast = 0;
                    l_ColorCorrection_2.Enabled = true;
                    local v154 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_2, v154, {
                        Saturation = -1, 
                        Contrast = 0.5
                    }):Play();
                    local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_1.Size = 0;
                    l_MenuBlur_1.Enabled = true;
                    local v156 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_1, v156, {
                        Size = 10
                    }):Play();
                    local v157 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v157, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(0.7058823529411765, function() --[[ Line: 753 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                end;
                local v161 = {
                    [1] = l_l_AnimHelper_0_Anim_2:GetMarkerReachedSignal("Fall"):Connect(function() --[[ Line: 763 ]]
                        -- upvalues: v151 (copy), v21 (ref), v124 (ref), l_LookVector_1 (copy), l_Workspace_0 (ref), l_SoundHelper_0 (ref), l_Damager_1 (copy)
                        task.wait(0.06666666666666667);
                        if v151 then
                            task.defer(function() --[[ Line: 767 ]]
                                -- upvalues: v21 (ref)
                                v21.CameraShake({
                                    Preset = "HardHit", 
                                    WaitTime = 0.1, 
                                    Fade = 1
                                });
                            end);
                        end;
                        local v158 = script.FallSmoke:Clone();
                        v158.Position = (CFrame.lookAt(v124, v124 + l_LookVector_1) * CFrame.new(0, 0, 4.4)).Position - Vector3.new(0, 2.5, 0, 0);
                        v158.Parent = l_Workspace_0.Debris;
                        for _, v160 in v158.Particle:GetChildren() do
                            v160.Enabled = false;
                            v160:Emit(v160:GetAttribute("EmitCount") * 1.5);
                        end;
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = l_Damager_1.PrimaryPart, 
                            DirectCopy = script.Sounds.Hit
                        });
                        task.wait(5);
                        v158:Destroy();
                    end)
                };
                task.wait(0.7058823529411765);
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2 - 2 * v104.RandomMult, function() --[[ Line: 797 ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_1:SetAttribute("GettingUp", nil);
                end);
                if v150 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v149, {
                        ImageTransparency = 1
                    }):Play();
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                local v162 = {
                    HoldTime = 1.5
                };
                if v151 then
                    task.defer(function() --[[ Line: 819 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.4, 
                            Fade = 2
                        });
                    end);
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "StartMatch", 
                    Parent = l_Workspace_0.Debris
                });
                task.wait(0.2);
                if v150 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_SoundHelper_0:PlaySound({
                        Name = "Box", 
                        Volume = 0.25, 
                        Parent = l_Workspace_0.Debris
                    });
                    task.defer(function() --[[ Line: 842 ]]
                        -- upvalues: v162 (copy), v118 (copy), v21 (ref)
                        v162.Image = v118.KO.K;
                        v21.TripleText(v162);
                    end);
                end;
                if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                    l_Occupied_1.Target.Value = Vector3.new();
                end;
                task.wait(1.25);
                task.delay(2, function() --[[ Line: 852 ]]
                    -- upvalues: v150 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), l_CameraMode_1 (copy), l_Variant_1 (copy)
                    if v150 or l_LocalPlayer_0.Character == l_Damager_1 then
                        l_CameraMode_1.Value = "";
                        l_Variant_1.Value = "";
                    end;
                end);
                for v163, v164 in v125 do
                    v163.CollisionGroup = v164;
                end;
                for _, v166 in v161 do
                    v166:Disconnect();
                end;
                task.wait(0.6);
                local v167 = script.Particles:Clone();
                v167.Explode8Bit.WorldPosition = l_Character_1.UpperTorso.Position;
                v167.Parent = l_Workspace_0.Debris;
                for _, v169 in v167.Explode8Bit:GetChildren() do
                    v169.Enabled = false;
                    v169:Emit(v169:GetAttribute("EmitCount"));
                end;
                local function v179(v170, v171) --[[ Line: 881 ]] --[[ Name: SetTransparency ]]
                    -- upvalues: l_ReplicatedStorage_0 (ref), l_Workspace_0 (ref)
                    for _, v173 in v170:GetDescendants() do
                        if v173.Name == "UnusualParticle" then
                            v173.Enabled = v171 == 0;
                            if not v173.Enabled then
                                local l_Parent_1 = v173.Parent;
                                v173.Parent = l_ReplicatedStorage_0;
                                v173.Parent = l_Parent_1;
                            end;
                        end;
                        if (v173:IsA("BasePart") or v173:IsA("Decal")) and v173.LocalTransparencyModifier < 1000 then
                            v173.LocalTransparencyModifier = v171;
                        end;
                    end;
                    local l_FirstChild_2 = l_Workspace_0.Welds:FindFirstChild(v170.Name);
                    if l_FirstChild_2 then
                        for _, v177 in l_FirstChild_2:GetDescendants() do
                            if v177.Name == "UnusualParticle" then
                                v177.Enabled = v171 == 0;
                                if not v177.Enabled then
                                    local l_Parent_2 = v177.Parent;
                                    v177.Parent = l_ReplicatedStorage_0;
                                    v177.Parent = l_Parent_2;
                                end;
                            end;
                            if (v177:IsA("BasePart") or v177:IsA("Decal")) and v177.LocalTransparencyModifier < 1000 then
                                v177.LocalTransparencyModifier = v171;
                            end;
                        end;
                    end;
                end;
                if l_CharacterData_1.Cutscene.Value then
                    v179(l_Character_1, 1);
                end;
                for _, v181 in pairs(l_Character_1:GetChildren()) do
                    if v181:IsA("BasePart") and v181.Transparency ~= 1 and v181.Name ~= "HumanoidRootPart" then
                        local v182 = v181:Clone();
                        v182:ClearAllChildren();
                        if v181.Name == "Head" then
                            local l_SpecialMesh_0 = Instance.new("SpecialMesh");
                            l_SpecialMesh_0.MeshType = Enum.MeshType.Head;
                            l_SpecialMesh_0.Scale = Vector3.new(1.25, 1.25, 1.25, 0);
                            l_SpecialMesh_0.Parent = v182;
                        end;
                        v182.CFrame = v182.CFrame * CFrame.new(0, 0, 0);
                        v182.Material = "Neon";
                        v182.Color = Color3.fromRGB(93, 114, 255);
                        v182.CanCollide = false;
                        v182.Anchored = true;
                        v182.Transparency = 0;
                        v182.Parent = l_Workspace_0.Debris;
                        l_TweenService_0:Create(v182, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Transparency = 1
                        }):Play();
                        task.delay(1, function() --[[ Line: 949 ]]
                            -- upvalues: v182 (copy)
                            v182:Destroy();
                        end);
                    end;
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Damager_1.PrimaryPart, 
                    DirectCopy = script.Sounds.Final
                });
                if v151 then
                    v21.CameraShake({
                        Preset = "MedHit", 
                        WaitTime = 0.2, 
                        Fade = 1
                    });
                end;
                local v184 = nil;
                if l_CharacterData_1 and l_CharacterData_1:FindFirstChild("Cutscene") then
                    v184 = l_CharacterData_1.Cutscene.Changed:Connect(function() --[[ Line: 970 ]]
                        -- upvalues: v184 (ref), v179 (copy), l_Character_1 (copy)
                        if v184 then
                            v184:Disconnect();
                        end;
                        task.wait(0.2);
                        v179(l_Character_1, 0);
                    end);
                end;
                task.wait(10);
                v141:Destroy();
                v179(l_Character_1, 0);
                if l_Damager_1 and l_Damager_1.PrimaryPart then
                    l_Damager_1.PrimaryPart.Anchored = false;
                end;
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = false;
                end;
                if v118 then
                    v118:Destroy();
                end;
                if v167 then
                    v167:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.Use = function(v185) --[[ Line: 994 ]] --[[ Name: Use ]]
        -- upvalues: v0 (copy)
        local _ = v185.Character;
        local _ = v185.Damager;
        if v185.IsKO then
            v0.KO(v185);
            return;
        else
            v0.Main(v185);
            return;
        end;
    end;
    return v0;
end;