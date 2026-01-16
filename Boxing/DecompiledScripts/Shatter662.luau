local v0 = {
    DelayTime = 6, 
    ServerDelayTime = 12.5, 
    Metadata = {
        DisplayName = "SHATTER", 
        GlowColor = Color3.fromRGB(53, 248, 144), 
        Price = 54321
    }, 
    Animations = {
        Start = 16714513829, 
        End = 16714521179, 
        KO = 16714523086
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
    local v23 = Random.new();
    local function _(v24, v25, v26) --[[ Line: 56 ]] --[[ Name: Lerp ]]
        return v24 + (v25 - v24) * v26;
    end;
    local v28 = {
        X = {
            0, 
            67, 
            130, 
            194, 
            258, 
            322, 
            386, 
            450, 
            513, 
            577, 
            640, 
            705, 
            769, 
            833, 
            896, 
            961
        }, 
        Level1 = {
            479, 
            543
        }, 
        Level2 = {
            619, 
            683
        }, 
        Level3 = {
            759, 
            823
        }, 
        Level4 = {
            899, 
            963
        }
    };
    v0.Main = function(v29) --[[ Line: 95 ]] --[[ Name: Main ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), v22 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy), l_ReplicatedStorage_0 (copy)
        local v30 = tick();
        local l_Character_0 = v29.Character;
        local l_Damager_0 = v29.Damager;
        local l_StartPosition_0 = v29.StartPosition;
        local l_LookVector_0 = v29.LookVector;
        local l_FirstChild_0 = l_Workspace_0.States:FindFirstChild(l_Character_0.Name);
        local l_CharacterData_0 = l_FirstChild_0:FindFirstChild("CharacterData");
        local l_PlayerData_0 = l_FirstChild_0:FindFirstChild("PlayerData");
        local l_Occupied_0 = l_FirstChild_0:FindFirstChild("Occupied");
        if not l_CharacterData_0 or not l_PlayerData_0 or not l_Occupied_0 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_0);
            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
            local v41 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
            local l_Humanoid_1 = l_Damager_0:FindFirstChild("Humanoid");
            local v43 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
            if not v41 or not v43 then
                return;
            else
                local v44 = l_Assets_0.DownFrames.Default:Clone();
                local v45 = l_LocalPlayer_0.Character == l_Character_0;
                if v45 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v44.Parent = l_Common_0;
                end;
                local v46 = 1.5;
                local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_0, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_0, l_StartPosition_0 - l_LookVector_0, v46 + 0, l_l_RayHelper_0_EnvironmentWhitelist_0);
                local v51 = l_StartPosition_0 - l_LookVector_0 * v46;
                if l_l_RayHelper_0_RayWithWhiteList_0 then
                    v51 = l_StartPosition_0 - l_LookVector_0 * 0;
                end;
                v51 = v51 + Vector3.new(0, 0.7200000286102295, 0, 0);
                local v52 = {};
                for _, v54 in l_Character_0:GetChildren() do
                    if v54:IsA("BasePart") and v54 ~= l_Character_0.PrimaryPart then
                        v52[v54] = v54.CollisionGroup;
                        v54.CollisionGroup = "None";
                    end;
                end;
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = true;
                end;
                for _, v56 in (v43:GetPlayingAnimationTracks()) do
                    if v56.Priority == Enum.AnimationPriority.Action or v56.Priority == Enum.AnimationPriority.Action2 or v56.Priority == Enum.AnimationPriority.Action3 then
                        local l_Speed_0 = v56.Speed;
                        v56:AdjustSpeed(l_Speed_0 / 2.2);
                        task.delay(1.3666666666666667, function() --[[ Line: 167 ]]
                            -- upvalues: v56 (copy), l_Speed_0 (copy)
                            if not v56 then
                                return;
                            else
                                v56:AdjustSpeed(l_Speed_0);
                                return;
                            end;
                        end);
                    end;
                end;
                local v58 = {
                    AnimId = v0.Animations.Start, 
                    FadeIn = 0.05, 
                    NameFade = 0, 
                    AnimSpeed = 1, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = v41, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v58);
                local v60 = nil;
                task.delay(0.3333333333333333, function() --[[ Line: 187 ]]
                    -- upvalues: v60 (ref), l_SoundHelper_0 (ref), l_Character_0 (copy), v22 (ref), v44 (copy)
                    v60 = l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Song
                    });
                    task.wait(0.85);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.DryBones
                    });
                    v22.TripleText({
                        Image = v44.Down, 
                        HoldTime = 0.6666666666666666
                    });
                end);
                task.delay(0.3, function() --[[ Line: 207 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (copy)
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Head
                    });
                end);
                local v61 = v45 or l_LocalPlayer_0.Character == l_Damager_0;
                task.delay(0.5, function() --[[ Line: 217 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v61 (copy), v22 (ref)
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Lego
                    });
                    if v61 then
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.3, 
                            Fade = 4
                        });
                    end;
                    task.wait(1.5);
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.75);
                end);
                local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
                local l_CFrame_0 = l_PrimaryPart_0.CFrame;
                local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
                local v65 = {
                    Victim = l_Character_0, 
                    LookVector = l_LookVector_0, 
                    EndPosition = v51, 
                    VictimPosition = l_PrimaryPart_0.Position, 
                    TargetVector = v51 - v51, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_0, 
                    TargetTime = 0.5, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v65);
                local v66 = script.Knockdown:Clone();
                v66.CFrame = CFrame.lookAt(l_CFrame_0.Position, v51);
                v66.Position = v66.Position + Vector3.new(0, 0.75, 0, 0);
                v66.Parent = l_Workspace_0.Debris;
                for _, v68 in v66.Particle:GetChildren() do
                    v68.Enabled = false;
                    v68:Emit(v68:GetAttribute("EmitCount"));
                end;
                task.delay(6, function() --[[ Line: 268 ]]
                    -- upvalues: v66 (copy)
                    v66:Destroy();
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_0.PrimaryPart
                });
                if l_Occupied_0 and l_LocalPlayer_0.Character == l_Character_0 then
                    l_Occupied_0.Target.Value = l_LookVector_0;
                    l_Occupied_0.LockedOn.Value = l_Damager_0;
                end;
                local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                local l_CameraTarget_0 = l_CameraSettings_0.CameraTarget;
                local l_CameraMode_0 = l_CameraSettings_0.CameraMode;
                local l_Variant_0 = l_CameraSettings_0.Variant;
                local l_Vignette_0 = l_Main_0.DownFrame.Vignette;
                local v74 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v75 = l_LocalPlayer_0.Character == l_Character_0;
                if v75 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v74, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v75 then
                    l_Occupied_0.LerpMult.Value = 0.1;
                end;
                local v76 = {};
                local function v82(v77) --[[ Line: 302 ]] --[[ Name: CreateTrail ]]
                    -- upvalues: l_Character_0 (copy), v22 (ref), v76 (copy)
                    local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(v77);
                    if not l_l_Character_0_FirstChild_0 then
                        return;
                    else
                        local v79 = script.Trail:Clone();
                        v79.Parent = v22.GetWeldCharacter(l_Character_0);
                        local l_Attachment0_0 = v79.Attachment0;
                        local l_Attachment1_0 = v79.Attachment1;
                        l_Attachment0_0.Parent = l_l_Character_0_FirstChild_0;
                        l_Attachment1_0.Parent = l_l_Character_0_FirstChild_0;
                        v79:Destroy();
                        table.insert(v76, l_Attachment0_0);
                        table.insert(v76, l_Attachment1_0);
                        return;
                    end;
                end;
                for _, v84 in l_Character_0:GetChildren() do
                    if string.find(v84.Name, "Foot") and v84:IsA("BasePart") and v84.Transparency ~= 1 then
                        v82(v84.Name);
                    end;
                end;
                if v75 or l_LocalPlayer_0.Character == l_Damager_0 then
                    task.defer(function() --[[ Line: 329 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "Knockdown", 
                            WaitTime = 0.2, 
                            Fade = 1, 
                            FoV = 55, 
                            FoVMult = 1
                        });
                    end);
                    v22.HUDShake({
                        Scale = 20, 
                        Damper = 0.09999999999999999
                    });
                    task.delay(0.5, function() --[[ Line: 345 ]]
                        -- upvalues: l_Lighting_0 (ref), l_TweenService_0 (ref)
                        local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
                        l_ColorCorrection_0.Saturation = 0;
                        l_ColorCorrection_0.Contrast = 0;
                        l_ColorCorrection_0.Enabled = true;
                        local v86 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                        l_TweenService_0:Create(l_ColorCorrection_0, v86, {
                            Saturation = 0.2, 
                            Contrast = 0.1
                        }):Play();
                        local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_0.Size = 0;
                        l_MenuBlur_0.Enabled = true;
                        local v88 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_0, v88, {
                            Size = 10
                        }):Play();
                        local v89 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_Lighting_0, v89, {
                            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                        }):Play();
                    end);
                end;
                task.wait(1.3666666666666667);
                local function v99(v90, v91) --[[ Line: 368 ]] --[[ Name: SetTransparency ]]
                    -- upvalues: l_ReplicatedStorage_0 (ref), l_Workspace_0 (ref)
                    for _, v93 in v90:GetDescendants() do
                        if v93.Name == "UnusualParticle" then
                            v93.Enabled = v91 == 0;
                            if not v93.Enabled then
                                local l_Parent_1 = v93.Parent;
                                v93.Parent = l_ReplicatedStorage_0;
                                v93.Parent = l_Parent_1;
                            end;
                        end;
                        if (v93:IsA("BasePart") or v93:IsA("Decal")) and v93.LocalTransparencyModifier < 1000 then
                            v93.LocalTransparencyModifier = v91;
                        end;
                    end;
                    local l_FirstChild_1 = l_Workspace_0.Welds:FindFirstChild(v90.Name);
                    if l_FirstChild_1 then
                        for _, v97 in l_FirstChild_1:GetDescendants() do
                            if v97.Name == "UnusualParticle" then
                                v97.Enabled = v91 == 0;
                                if not v97.Enabled then
                                    local l_Parent_2 = v97.Parent;
                                    v97.Parent = l_ReplicatedStorage_0;
                                    v97.Parent = l_Parent_2;
                                end;
                            end;
                            if (v97:IsA("BasePart") or v97:IsA("Decal")) and v97.LocalTransparencyModifier < 1000 then
                                v97.LocalTransparencyModifier = v91;
                            end;
                        end;
                    end;
                end;
                task.wait(1);
                task.defer(function() --[[ Line: 407 ]]
                    -- upvalues: v22 (ref), l_Character_0 (copy), v29 (copy), v0 (ref), v75 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy)
                    v22.DownCount({
                        Character = l_Character_0, 
                        Name = "Shatter", 
                        Sound = script.Sounds.Count, 
                        Speed = v29.ExtraTime / (v0.DelayTime + v29.ExtraTime), 
                        IsBillboard = not (v75 or l_LocalPlayer_0.Character == l_Damager_0)
                    });
                end);
                local v100 = v0.DelayTime - l_Workspace_0.Ping.Value / 2 - 2 * v29.RandomMult + 2 + v29.ExtraTime;
                task.delay(v100, function() --[[ Line: 419 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                local v101 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v75 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_Variant_0.Value = "Craft";
                    l_CameraMode_0.Value = "Knockdown";
                    l_CameraTarget_0.Value = l_Character_0;
                    v99(l_Damager_0, 1);
                    l_TweenService_0:Create(l_Vignette_0, v74, {
                        ImageTransparency = 0.2
                    }):Play();
                    l_TweenService_0:Create(l_Lighting_0, v101, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.2
                    }):Play();
                    task.delay(1, function() --[[ Line: 438 ]]
                        -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v101 (copy)
                        l_TweenService_0:Create(l_Lighting_0, v101, {
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
                l_Damager_0:SetAttribute("CurrentEmote", nil);
                local v102 = tick();
                l_l_AnimHelper_0_Anim_0.Priority = Enum.AnimationPriority.Action3;
                task.wait(v100 - 2);
                v58.Priority = Enum.AnimationPriority.Action4;
                v58.AnimId = v0.Animations.End;
                v58.Looped = false;
                v58.AnimSpeed = 1;
                v58.FadeIn = 0.1;
                v58.NameFade = 0.1;
                v58.StopInfo = {
                    StopDelay = 4, 
                    StopTime = 0.4, 
                    Weight = 1
                };
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v58);
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_LocalPlayer_0.Character == l_Damager_0 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                    DirectCopy = script.Sounds.Build
                });
                local v104 = {};
                task.delay(2.8333333333333335, function() --[[ Line: 482 ]]
                    -- upvalues: l_Character_0 (copy), l_LookVector_0 (copy), v51 (ref), l_PrimaryPart_0 (copy), l_Workspace_0 (ref), l_SimulateKnockbackBE_0 (ref), v76 (copy)
                    local v105 = {
                        Victim = l_Character_0, 
                        LookVector = l_LookVector_0, 
                        EndPosition = v51 - Vector3.new(0, 0.7200000286102295, 0, 0), 
                        VictimPosition = l_PrimaryPart_0.Position, 
                        TargetVector = v51 - v51, 
                        StartTime = l_Workspace_0:GetServerTimeNow(), 
                        TargetTime = 0.03333333333333333, 
                        HitIndex = 4
                    };
                    l_SimulateKnockbackBE_0:Fire(v105);
                    task.wait(0.03333333333333333);
                    if l_Character_0 and l_Character_0.PrimaryPart then
                        l_Character_0.PrimaryPart.Anchored = false;
                    end;
                    v105.TargetTime = 0.6666666666666666;
                    l_SimulateKnockbackBE_0:Fire(v105);
                    task.wait(3);
                    for _, v107 in v76 do
                        v107:Destroy();
                    end;
                end);
                repeat
                    task.wait(0.1);
                until l_Character_0:GetAttribute("GettingUp") or not l_Character_0:IsDescendantOf(l_Workspace_0) or tick() - v102 > 15;
                if v75 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Lighting_0, v101, {
                        ExposureCompensation = workspace.Exposure.Value
                    }):Play();
                    task.delay(1, function() --[[ Line: 518 ]]
                        -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v101 (copy)
                        l_TweenService_0:Create(l_Lighting_0, v101, {
                            ExposureCompensation = workspace.Exposure.Value
                        }):Play();
                    end);
                end;
                if v75 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v99(l_Damager_0, 0);
                    l_TweenService_0:Create(l_Vignette_0, v74, {
                        ImageTransparency = 1
                    }):Play();
                    l_CameraMode_0.Value = "";
                    l_Variant_0.Value = "";
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                task.delay(1.15, function() --[[ Line: 539 ]]
                    -- upvalues: v30 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v75 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v22 (ref), v44 (copy), l_Workspace_0 (ref)
                    print(v30 - tick());
                    l_SoundHelper_0:PlaySound({
                        Name = "BoxLayer", 
                        Parent = l_Character_0.PrimaryPart
                    });
                    if v75 or l_LocalPlayer_0.Character == l_Damager_0 then
                        v22.TripleText({
                            Image = v44.Box, 
                            HoldTime = 0.6666666666666666
                        });
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.4, 
                            Fade = 0.7
                        });
                    end;
                    task.wait(0.2);
                    if v75 or l_LocalPlayer_0.Character == l_Damager_0 then
                        l_SoundHelper_0:PlaySound({
                            Name = "Box", 
                            Parent = l_Workspace_0.Debris
                        });
                    end;
                end);
                if l_Occupied_0 and l_Occupied_0:FindFirstChild("Target") then
                    l_Occupied_0.Target.Value = Vector3.new();
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "Rustle3", 
                    Parent = l_Character_0.PrimaryPart, 
                    Volume = 1
                });
                task.wait(1.25);
                if v75 then
                    l_Occupied_0.LerpMult.Value = 0;
                end;
                if v75 or l_LocalPlayer_0.Character == l_Damager_0 then
                    local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
                    local v109 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                    l_TweenService_0:Create(l_ColorCorrection_1, v109, {
                        Saturation = 0, 
                        Contrast = 0
                    }):Play();
                    local v110 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                    l_TweenService_0:Create(v60, v110, {
                        Volume = 0
                    }):Play();
                end;
                if l_Damager_0 and l_Damager_0.PrimaryPart then
                    l_Damager_0.PrimaryPart.Anchored = false;
                end;
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = false;
                end;
                for v111, v112 in v52 do
                    v111.CollisionGroup = v112;
                end;
                for _, v114 in v104 do
                    v114:Disconnect();
                end;
                task.wait(5);
                l_l_AnimHelper_0_Anim_0:Stop(0);
                l_l_AnimHelper_0_Anim_1:Stop(0);
                if v44 then
                    v44:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.KO = function(v115) --[[ Line: 614 ]] --[[ Name: KO ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), v23 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), v28 (copy), l_Main_0 (copy), v22 (copy), l_Lighting_0 (copy), l_ReplicatedStorage_0 (copy)
        local l_Character_1 = v115.Character;
        local l_Damager_1 = v115.Damager;
        local l_StartPosition_1 = v115.StartPosition;
        local l_LookVector_1 = v115.LookVector;
        local l_FirstChild_2 = l_Workspace_0.States:FindFirstChild(l_Character_1.Name);
        local l_CharacterData_1 = l_FirstChild_2:FindFirstChild("CharacterData");
        local l_PlayerData_1 = l_FirstChild_2:FindFirstChild("PlayerData");
        local l_Occupied_1 = l_FirstChild_2:FindFirstChild("Occupied");
        if not l_CharacterData_1 or not l_PlayerData_1 or not l_Occupied_1 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_1);
            local l_Humanoid_2 = l_Character_1:FindFirstChild("Humanoid");
            local v126 = l_Humanoid_2 and l_Humanoid_2:FindFirstChild("Animator");
            local l_Humanoid_3 = l_Damager_1:FindFirstChild("Humanoid");
            local v128 = l_Humanoid_3 and l_Humanoid_3:FindFirstChild("Animator");
            if not v126 or not v128 then
                return;
            else
                local v129 = l_Assets_0.DownFrames.Default:Clone();
                if l_LocalPlayer_0.Character == l_Character_1 or l_LocalPlayer_0.Character == l_Damager_1 then
                    v129.Parent = l_Common_0;
                end;
                local v130 = 5;
                local l_l_RayHelper_0_EnvironmentWhitelist_1 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_1, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_1, l_StartPosition_1 - l_LookVector_1, v130 + 0, l_l_RayHelper_0_EnvironmentWhitelist_1);
                local v135 = l_StartPosition_1 - l_LookVector_1 * v130;
                if l_l_RayHelper_0_RayWithWhiteList_1 then
                    v135 = l_StartPosition_1 - l_LookVector_1 * 2.5;
                end;
                local v136 = {};
                for _, v138 in l_Character_1:GetChildren() do
                    if v138:IsA("BasePart") and v138 ~= l_Character_1.PrimaryPart then
                        v136[v138] = v138.CollisionGroup;
                        v138.CollisionGroup = "None";
                    end;
                end;
                if not l_Character_1 or l_Character_1.PrimaryPart then

                end;
                local l_v128_PlayingAnimationTracks_0 = v128:GetPlayingAnimationTracks();
                for _, v141 in l_v128_PlayingAnimationTracks_0 do
                    if v141.Priority ~= Enum.AnimationPriority.Idle then
                        v141:AdjustSpeed(v141.Speed / 3);
                    end;
                end;
                task.delay(0.5555555555555556, function() --[[ Line: 681 ]]
                    -- upvalues: l_v128_PlayingAnimationTracks_0 (copy)
                    for _, v143 in l_v128_PlayingAnimationTracks_0 do
                        if v143.Priority ~= Enum.AnimationPriority.Idle then
                            v143:AdjustSpeed(v143.Speed * 3);
                        end;
                    end;
                end);
                local v144 = {
                    AnimId = v0.Animations.KO, 
                    FadeIn = 0.05, 
                    AnimSpeed = 0.9, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_2, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v144);
                if l_LocalPlayer_0.Character == l_Damager_1 then
                    local l_FirstChild_3 = l_Workspace_0.States:FindFirstChild(l_Damager_1.Name);
                    local l_CharacterData_2 = l_FirstChild_3:FindFirstChild("CharacterData");
                    local _ = l_FirstChild_3:FindFirstChild("Occupied");
                    l_CharacterData_2.Cutscene.Value = false;
                end;
                task.delay(3, function() --[[ Line: 709 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_2 (copy)
                    l_l_AnimHelper_0_Anim_2:AdjustSpeed(0);
                end);
                local v149 = l_LocalPlayer_0.Character == l_Character_1;
                if v149 or l_LocalPlayer_0.Character == l_Damager_1 then
                    task.delay(0.8333333333333334, function() --[[ Line: 716 ]]
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
                local _ = l_PrimaryPart_1.CFrame;
                local l_l_Workspace_0_ServerTimeNow_1 = l_Workspace_0:GetServerTimeNow();
                local v153 = {
                    Victim = l_Character_1, 
                    LookVector = l_LookVector_1, 
                    EndPosition = v135, 
                    VictimPosition = l_PrimaryPart_1.Position, 
                    TargetVector = v135 - v135, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_1, 
                    TargetTime = 0.5555555555555556, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v153);
                l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_1.PrimaryPart
                });
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Character_1.PrimaryPart, 
                    DirectCopy = script.Sounds.Lego, 
                    Volume = 0.4
                });
                if l_Occupied_1 and l_LocalPlayer_0.Character == l_Character_1 then
                    l_Occupied_1.Target.Value = l_LookVector_1;
                    l_Occupied_1.LockedOn.Value = l_Damager_1;
                end;
                task.delay(0.3, function() --[[ Line: 770 ]]
                    -- upvalues: v135 (ref), l_SoundHelper_0 (ref), l_Character_1 (copy), l_Workspace_0 (ref), v23 (ref), l_RayHelper_0 (ref), l_l_RayHelper_0_EnvironmentWhitelist_1 (copy), l_RunService_0 (ref), l_TweenService_0 (ref), v28 (ref), l_Damager_1 (copy)
                    local v154 = {};
                    local l_v135_0 = v135;
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Studs
                    });
                    task.delay(0.1, function() --[[ Line: 781 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Character_1 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = l_Character_1.PrimaryPart, 
                            DirectCopy = script.Sounds.Studs
                        });
                        task.wait(0.2);
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = l_Character_1.PrimaryPart, 
                            DirectCopy = script.Sounds.Studs
                        });
                        task.wait(0.1);
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = l_Character_1.PrimaryPart, 
                            DirectCopy = script.Sounds.Studs
                        });
                        task.wait(0.4);
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = l_Character_1.PrimaryPart, 
                            DirectCopy = script.Sounds.Studs
                        });
                    end);
                    for _ = 1, 13 do
                        local v157 = script.Coin:Clone();
                        v157.Parent = l_Workspace_0.Debris;
                        v157.CFrame = CFrame.new(l_v135_0);
                        local l_Unit_0 = (v23:NextUnitVector() * Vector3.new(1, 0, 1, 0)).Unit;
                        local v159 = v23:NextNumber(2.5, 9);
                        local _, v161, _ = l_RayHelper_0:GetRayWithWhiteList(l_v135_0, l_v135_0 + l_Unit_0, v159, l_l_RayHelper_0_EnvironmentWhitelist_1);
                        v159 = (l_v135_0 - v161).Magnitude;
                        local v163 = v23:NextInteger(0, 100);
                        local v164 = 1;
                        if v163 < 10 then
                            v164 = 4;
                        elseif v163 < 30 then
                            v164 = 3;
                        elseif v163 < 50 then
                            v164 = 2;
                        end;
                        table.insert(v154, {
                            Model = v157, 
                            Level = v164, 
                            StartTime = tick(), 
                            StartPosition = l_v135_0, 
                            EndPosition = l_v135_0 + l_Unit_0 * v159, 
                            CurrentSprite = v23:NextInteger(2, 14)
                        });
                    end;
                    local v165 = nil;
                    local v166 = 0;
                    v165 = l_RunService_0.RenderStepped:Connect(function(v167) --[[ Line: 848 ]]
                        -- upvalues: v166 (ref), l_TweenService_0 (ref), v154 (ref), v28 (ref), l_Damager_1 (ref), l_SoundHelper_0 (ref), v23 (ref)
                        local v168 = math.clamp(v166 / 2, 0, 1);
                        v168 = l_TweenService_0:GetValue(v168, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
                        for _, v170 in v154 do
                            local l_Model_0 = v170.Model;
                            local l_Level_0 = v170.Level;
                            local v173 = math.floor(v170.CurrentSprite);
                            if not v170.Finished and l_Model_0 then
                                local v174 = v28.X[v173 + 1];
                                if v173 >= 16 then
                                    v174 = v28.X[v173 - 15];
                                end;
                                local v175 = v28["Level" .. tostring(l_Level_0)][v173 <= 15 and 1 or 2];
                                l_Model_0.GUI.Coin.ImageRectOffset = Vector2.new(v174, v175);
                                v170.CurrentSprite = v170.CurrentSprite + v167 * 20;
                                if v170.CurrentSprite >= 32 then
                                    v170.CurrentSprite = 0;
                                end;
                                local l_Magnitude_0 = (l_Model_0.Position - l_Damager_1.PrimaryPart.Position).Magnitude;
                                if v168 > 0.5 and l_Magnitude_0 <= 5 then
                                    if not v170.FinishData then
                                        v170.FinishData = {
                                            CurrentPos = l_Model_0.Position, 
                                            TargetPos = l_Damager_1.PrimaryPart.Position, 
                                            StartTime = tick()
                                        };
                                    end;
                                    local l_FinishData_0 = v170.FinishData;
                                    local l_StartTime_0 = l_FinishData_0.StartTime;
                                    local l_CurrentPos_0 = l_FinishData_0.CurrentPos;
                                    local l_TargetPos_0 = l_FinishData_0.TargetPos;
                                    l_TargetPos_0 = Vector3.new(l_TargetPos_0.X, l_CurrentPos_0.Y + 0.15, l_TargetPos_0.Z);
                                    local v181 = math.clamp((tick() - l_StartTime_0) / 0.35, 0, 1);
                                    v181 = l_TweenService_0:GetValue(v181, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
                                    l_Model_0.CFrame = CFrame.new(l_CurrentPos_0 + (l_TargetPos_0 - l_CurrentPos_0) * v181);
                                    if v181 >= 0.8 then
                                        v170.Finished = true;
                                        l_Model_0:Destroy();
                                        if l_Level_0 <= 2 then
                                            l_SoundHelper_0:PlaySound({
                                                Name = "Knockdown", 
                                                Speed = v23:NextNumber(1.3, 1.7), 
                                                Parent = l_Damager_1.PrimaryPart, 
                                                DirectCopy = script.Sounds.GetStud
                                            });
                                        else
                                            l_SoundHelper_0:PlaySound({
                                                Name = "Knockdown", 
                                                Speed = v23:NextNumber(0.95, 1.05), 
                                                Parent = l_Damager_1.PrimaryPart, 
                                                DirectCopy = script.Sounds.BlueStud
                                            });
                                        end;
                                    end;
                                else
                                    local l_StartPosition_2 = v170.StartPosition;
                                    local l_EndPosition_0 = v170.EndPosition;
                                    local l_StartTime_1 = v170.StartTime;
                                    l_Model_0.Position = l_StartPosition_2 + (l_EndPosition_0 - l_StartPosition_2) * v168;
                                    local v185 = tick() - l_StartTime_1 + 0.1;
                                    local v186 = 1.7 - 27 * (v185 % 0.5018484351393873 - 0.25092421756969363) ^ 2;
                                    local v187 = 0.5 ^ math.floor(v185 / 0.5018484351393873) * v186;
                                    l_Model_0.Position = l_Model_0.Position + Vector3.new(0, v187 - 2.2, 0);
                                end;
                            end;
                        end;
                        v166 = v166 + v167;
                    end);
                    task.wait(8);
                    v165:Disconnect();
                    for _, v189 in v154 do
                        v189.Model:Destroy();
                    end;
                    v154 = {};
                end);
                local l_CameraSettings_1 = l_Workspace_0:FindFirstChild("CameraSettings");
                local _ = l_CameraSettings_1.CameraTarget;
                local _ = l_CameraSettings_1.CameraMode;
                local l_Variant_1 = l_CameraSettings_1.Variant;
                local l_CameraMode_2 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                if v149 then
                    l_CameraMode_2.Value = "Cutscene";
                    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        FieldOfView = 60
                    }):Play();
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        CFrame = l_CurrentCamera_0.CFrame * CFrame.new(-3.5, 3.5, 7.7) * CFrame.Angles(-0.2617993877991494, 0, 0.03490658503988659)
                    }):Play();
                end;
                local l_Vignette_1 = l_Main_0.DownFrame.Vignette;
                local v197 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v198 = l_LocalPlayer_0.Character == l_Character_1;
                if v198 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v197, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v198 then
                    l_Occupied_1.LerpMult.Value = 0.1;
                end;
                if v198 or l_LocalPlayer_0.Character == l_Damager_1 then
                    task.defer(function() --[[ Line: 990 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "Knockdown", 
                            WaitTime = 0.5, 
                            Fade = 2, 
                            FoV = 55, 
                            FoVMult = 1
                        });
                    end);
                    v22.HUDShake({
                        Scale = 20, 
                        Damper = 0.09999999999999999
                    });
                    local l_ColorCorrection_2 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_2.Saturation = 0;
                    l_ColorCorrection_2.Contrast = 0;
                    l_ColorCorrection_2.Enabled = true;
                    local v200 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_2, v200, {
                        Saturation = -1, 
                        Contrast = 0.5
                    }):Play();
                    local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_1.Size = 0;
                    l_MenuBlur_1.Enabled = true;
                    local v202 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_1, v202, {
                        Size = 10
                    }):Play();
                    local v203 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v203, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(0.5555555555555556, function() --[[ Line: 1024 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                end;
                task.wait(0.7407407407407407);
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2 - 2 * v115.RandomMult, function() --[[ Line: 1035 ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_1:SetAttribute("GettingUp", nil);
                end);
                if v198 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v197, {
                        ImageTransparency = 1
                    }):Play();
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                local v204 = {
                    HoldTime = 1.5
                };
                l_SoundHelper_0:PlaySound({
                    Name = "StartMatch", 
                    Parent = l_Workspace_0.Debris
                });
                task.wait(2);
                if v198 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_SoundHelper_0:PlaySound({
                        Name = "Box", 
                        Volume = 0.25, 
                        Parent = l_Workspace_0.Debris
                    });
                    task.defer(function() --[[ Line: 1070 ]]
                        -- upvalues: v204 (copy), v129 (copy), v22 (ref)
                        v204.Image = v129.KO.K;
                        v22.TripleText(v204);
                    end);
                end;
                if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                    l_Occupied_1.Target.Value = Vector3.new();
                end;
                local function v214(v205, v206) --[[ Line: 1078 ]] --[[ Name: SetTransparency ]]
                    -- upvalues: l_ReplicatedStorage_0 (ref), l_Workspace_0 (ref)
                    for _, v208 in v205:GetDescendants() do
                        if v208.Name == "UnusualParticle" then
                            v208.Enabled = v206 == 0;
                            if not v208.Enabled then
                                local l_Parent_3 = v208.Parent;
                                v208.Parent = l_ReplicatedStorage_0;
                                v208.Parent = l_Parent_3;
                            end;
                        end;
                        if (v208:IsA("BasePart") or v208:IsA("Decal")) and v208.LocalTransparencyModifier < 1000 then
                            v208.LocalTransparencyModifier = v206;
                        end;
                    end;
                    local l_FirstChild_4 = l_Workspace_0.Welds:FindFirstChild(v205.Name);
                    if l_FirstChild_4 then
                        for _, v212 in l_FirstChild_4:GetDescendants() do
                            if v212.Name == "UnusualParticle" then
                                v212.Enabled = v206 == 0;
                                if not v212.Enabled then
                                    local l_Parent_4 = v212.Parent;
                                    v212.Parent = l_ReplicatedStorage_0;
                                    v212.Parent = l_Parent_4;
                                end;
                            end;
                            if (v212:IsA("BasePart") or v212:IsA("Decal")) and v212.LocalTransparencyModifier < 1000 then
                                v212.LocalTransparencyModifier = v206;
                            end;
                        end;
                    end;
                end;
                local v215 = false;
                task.delay(0.7, function() --[[ Line: 1117 ]]
                    -- upvalues: v215 (ref), v214 (copy), l_Character_1 (copy)
                    for v216 = 1, 9 do
                        local v217 = 8 + -6 * (v216 / 9);
                        if v215 then
                            return;
                        else
                            v214(l_Character_1, 1);
                            task.wait(v217 / 60);
                            v214(l_Character_1, 0);
                            task.wait(v217 / 60);
                        end;
                    end;
                    v214(l_Character_1, 1);
                end);
                local v218 = nil;
                if l_CharacterData_1 and l_CharacterData_1:FindFirstChild("Cutscene") then
                    v218 = l_CharacterData_1.Cutscene.Changed:Connect(function() --[[ Line: 1135 ]]
                        -- upvalues: v218 (ref), v215 (ref), l_l_AnimHelper_0_Anim_2 (copy), v214 (copy), l_Character_1 (copy)
                        if v218 then
                            v218:Disconnect();
                        end;
                        v215 = true;
                        task.wait(0.2);
                        l_l_AnimHelper_0_Anim_2:Stop(0);
                        v214(l_Character_1, 0);
                    end);
                end;
                task.wait(1.25);
                if v198 then
                    l_Occupied_1.LerpMult.Value = 0;
                end;
                task.delay(2, function() --[[ Line: 1151 ]]
                    -- upvalues: v198 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), l_CameraMode_2 (copy), l_Variant_1 (copy)
                    if v198 or l_LocalPlayer_0.Character == l_Damager_1 then
                        l_CameraMode_2.Value = "";
                        l_Variant_1.Value = "";
                    end;
                end);
                for v219, v220 in v136 do
                    v219.CollisionGroup = v220;
                end;
                if v198 or l_LocalPlayer_0.Character == l_Damager_1 then
                    v22.CameraShake({
                        Preset = "MedHit", 
                        WaitTime = 0.2, 
                        Fade = 1
                    });
                end;
                task.wait(10);
                v215 = true;
                v214(l_Character_1, 0);
                l_l_AnimHelper_0_Anim_2:Stop(0);
                if v218 then
                    v218:Disconnect();
                end;
                if l_Damager_1 and l_Damager_1.PrimaryPart then
                    l_Damager_1.PrimaryPart.Anchored = false;
                end;
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = false;
                end;
                if v129 then
                    v129:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.Use = function(v221) --[[ Line: 1189 ]] --[[ Name: Use ]]
        -- upvalues: v0 (copy)
        local _ = v221.Character;
        local _ = v221.Damager;
        if v221.IsKO then
            v0.KO(v221);
            return;
        else
            v0.Main(v221);
            return;
        end;
    end;
    return v0;
end;