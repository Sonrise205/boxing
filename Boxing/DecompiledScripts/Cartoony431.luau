local v0 = {
    DelayTime = 6, 
    ServerDelayTime = 10, 
    Metadata = {
        DisplayName = "CARTOONY", 
        GlowColor = Color3.fromRGB(228, 81, 248), 
        Price = 19999
    }, 
    Animations = {
        Start = 16736446293, 
        Loop = 16736449478, 
        End = 16736450977, 
        KO = 16736453288
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
    local l_NumberSequenceTween_0 = require(l_ReplicatedStorage_0:WaitForChild("NumberSequenceTween"));
    v0.Main = function(v28) --[[ Line: 61 ]] --[[ Name: Main ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v21 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), l_TweenService_0 (copy), l_ReplicatedStorage_0 (copy), l_NumberSequenceTween_0 (copy), l_Lighting_0 (copy)
        local v29 = tick();
        local l_Character_0 = v28.Character;
        local l_Damager_0 = v28.Damager;
        local l_StartPosition_0 = v28.StartPosition;
        local l_LookVector_0 = v28.LookVector;
        local l_FirstChild_0 = l_Workspace_0.States:FindFirstChild(l_Character_0.Name);
        local l_CharacterData_0 = l_FirstChild_0:FindFirstChild("CharacterData");
        local l_PlayerData_0 = l_FirstChild_0:FindFirstChild("PlayerData");
        local l_Occupied_0 = l_FirstChild_0:FindFirstChild("Occupied");
        if not l_CharacterData_0 or not l_PlayerData_0 or not l_Occupied_0 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_0);
            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
            local v40 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
            local l_Humanoid_1 = l_Damager_0:FindFirstChild("Humanoid");
            local v42 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
            if not v40 or not v42 then
                return;
            else
                local v43 = l_Assets_0.DownFrames.Default:Clone();
                local v44 = l_LocalPlayer_0.Character == l_Character_0;
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v43.Parent = l_Common_0;
                end;
                if not v44 then
                    local _ = l_LocalPlayer_0.Character == l_Damager_0;
                end;
                local v46 = 3;
                local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_0, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_0, l_StartPosition_0 - l_LookVector_0, v46 + 0, l_l_RayHelper_0_EnvironmentWhitelist_0);
                local v51 = l_StartPosition_0 - l_LookVector_0 * v46;
                if l_l_RayHelper_0_RayWithWhiteList_0 then
                    v51 = l_StartPosition_0 - l_LookVector_0 * 1;
                end;
                v51 = v51 + Vector3.new(0, 0.20000000298023224, 0, 0);
                local v52 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                task.delay(0.5151515151515151, function() --[[ Line: 117 ]]
                    -- upvalues: v51 (ref), l_LookVector_0 (copy), l_Workspace_0 (ref), v44 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v21 (ref)
                    local v53 = script.FallSmoke:Clone();
                    v53.Position = (CFrame.lookAt(v51, v51 + l_LookVector_0) * CFrame.new(0, 0, 2.5)).Position - Vector3.new(0, 3, 0, 0);
                    v53.Parent = l_Workspace_0.Debris;
                    for _, v55 in v53.Particle:GetChildren() do
                        v55.Enabled = false;
                        v55:Emit(v55:GetAttribute("EmitCount"));
                    end;
                    if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                        task.defer(function() --[[ Line: 128 ]]
                            -- upvalues: v21 (ref)
                            v21.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.1, 
                                Fade = 0.6
                            });
                        end);
                        v21.HUDShake({
                            Scale = 20, 
                            Damper = 0.09999999999999999
                        });
                    end;
                    task.wait(8);
                    v53:Destroy();
                end);
                local v56 = {};
                for _, v58 in l_Character_0:GetChildren() do
                    if v58:IsA("BasePart") and v58 ~= l_Character_0.PrimaryPart then
                        v56[v58] = v58.CollisionGroup;
                        v58.CollisionGroup = "None";
                    end;
                end;
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = true;
                end;
                for _, v60 in (v42:GetPlayingAnimationTracks()) do
                    if v60.Priority == Enum.AnimationPriority.Action or v60.Priority == Enum.AnimationPriority.Action2 or v60.Priority == Enum.AnimationPriority.Action3 then
                        local l_Speed_0 = v60.Speed;
                        v60:AdjustSpeed(l_Speed_0 / 3);
                        task.delay(2.1818181818181817, function() --[[ Line: 165 ]]
                            -- upvalues: v60 (copy), l_Speed_0 (copy)
                            if not v60 then
                                return;
                            else
                                v60:AdjustSpeed(l_Speed_0);
                                return;
                            end;
                        end);
                    end;
                end;
                local v62 = {
                    AnimId = v0.Animations.Start, 
                    FadeIn = 0.05, 
                    NameFade = 0.1, 
                    AnimSpeed = 0.55, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = v40, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v62);
                task.delay(0.3333333333333333, function() --[[ Line: 184 ]]
                    -- upvalues: v21 (ref), v43 (copy)
                    v21.TripleText({
                        Image = v43.Down, 
                        HoldTime = 0.6666666666666666
                    });
                end);
                task.delay(0.5151515151515151, function() --[[ Line: 191 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), l_SoundHelper_0 (ref), l_Damager_0 (copy)
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.6);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Damager_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Fall
                    });
                    task.wait(0.9);
                    l_SoundHelper_0:PlaySound({
                        Name = "Rustle2", 
                        Parent = l_Damager_0.PrimaryPart, 
                        Volume = 0.6, 
                        Speed = 0.8
                    });
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Damager_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Dizzy
                    });
                    task.wait(3.4);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Damager_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Dizzy, 
                        Volume = 0.3
                    });
                end);
                local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
                local l_CFrame_0 = l_PrimaryPart_0.CFrame;
                local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
                local v67 = {
                    Victim = l_Character_0, 
                    LookVector = l_LookVector_0, 
                    EndPosition = v51, 
                    VictimPosition = l_PrimaryPart_0.Position, 
                    TargetVector = v51 - v51, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_0, 
                    TargetTime = 0.5151515151515151, 
                    HitIndex = 3
                };
                print("Swag Moment.");
                l_SimulateKnockbackBE_0:Fire(v67);
                local v68 = script.Knockdown:Clone();
                v68.CFrame = CFrame.lookAt(l_CFrame_0.Position, v51);
                v68.Position = v68.Position + Vector3.new(0, 0.75, 0, 0);
                v68.Parent = l_Workspace_0.Debris;
                for _, v70 in v68.Particle:GetChildren() do
                    v70.Enabled = false;
                    v70:Emit(v70:GetAttribute("EmitCount"));
                end;
                task.delay(6, function() --[[ Line: 254 ]]
                    -- upvalues: v68 (copy)
                    v68:Destroy();
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_0.PrimaryPart
                });
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Damager_0.PrimaryPart, 
                    DirectCopy = script.Sounds.Bonk
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
                local v76 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v76, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v44 then
                    l_Occupied_0.LerpMult.Value = 0.1;
                end;
                local v77 = script.Dizzy:Clone();
                v77.Parent = l_Workspace_0.Debris;
                local l_Weld_0 = Instance.new("Weld");
                l_Weld_0.Parent = v77;
                l_Weld_0.Part0 = v77;
                l_Weld_0.Part1 = l_Character_0.Head;
                task.wait(2.1818181818181817);
                local function v88(v79, v80) --[[ Line: 300 ]] --[[ Name: SetTransparency ]]
                    -- upvalues: l_ReplicatedStorage_0 (ref), l_Workspace_0 (ref)
                    for _, v82 in v79:GetDescendants() do
                        if v82.Name == "UnusualParticle" then
                            v82.Enabled = v80 == 0;
                            if not v82.Enabled then
                                local l_Parent_1 = v82.Parent;
                                v82.Parent = l_ReplicatedStorage_0;
                                v82.Parent = l_Parent_1;
                            end;
                        end;
                        if (v82:IsA("BasePart") or v82:IsA("Decal")) and v82.LocalTransparencyModifier < 1000 then
                            v82.LocalTransparencyModifier = v80;
                        end;
                    end;
                    local l_FirstChild_1 = l_Workspace_0.Welds:FindFirstChild(v79.Name);
                    if l_FirstChild_1 then
                        for _, v86 in l_FirstChild_1:GetDescendants() do
                            if v86.Name == "UnusualParticle" then
                                v86.Enabled = v80 == 0;
                                if not v86.Enabled then
                                    local l_Parent_2 = v86.Parent;
                                    v86.Parent = l_ReplicatedStorage_0;
                                    v86.Parent = l_Parent_2;
                                end;
                            end;
                            if (v86:IsA("BasePart") or v86:IsA("Decal")) and v86.LocalTransparencyModifier < 1000 then
                                v86.LocalTransparencyModifier = v80;
                            end;
                        end;
                    end;
                end;
                v62.Priority = Enum.AnimationPriority.Action3;
                v62.AnimId = v0.Animations.Loop;
                v62.Looped = true;
                v62.AnimSpeed = 1;
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v62);
                l_l_AnimHelper_0_Anim_1.Name = "Remove";
                task.wait(0.16666666666666666);
                local v90 = v0.DelayTime - l_Workspace_0.Ping.Value / 2 - 2 * v28.RandomMult + v28.ExtraTime;
                task.defer(function() --[[ Line: 349 ]]
                    -- upvalues: v21 (ref), l_Character_0 (copy), v44 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v28 (copy), v0 (ref)
                    v21.DownCount({
                        Character = l_Character_0, 
                        IsBillboard = not (v44 or l_LocalPlayer_0.Character == l_Damager_0), 
                        Speed = v28.ExtraTime / (v0.DelayTime + v28.ExtraTime)
                    });
                end);
                task.delay(v90, function() --[[ Line: 357 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_Variant_0.Value = "Cartoony";
                    l_CameraMode_0.Value = "Knockdown";
                    l_CameraTarget_0.Value = l_Character_0;
                    v88(l_Damager_0, 1);
                    l_TweenService_0:Create(l_Vignette_0, v76, {
                        ImageTransparency = 0.2
                    }):Play();
                    if l_LocalPlayer_0.Character == l_Damager_0 then
                        v21.KnockdownWalk({
                            Damager = l_Damager_0, 
                            DamagerHumanoid = l_Humanoid_1, 
                            LookVector = l_LookVector_0
                        });
                    end;
                end;
                l_Damager_0:SetAttribute("CurrentEmote", nil);
                local v92 = tick();
                local v93 = {};
                repeat
                    task.wait(0.1);
                until l_Character_0:GetAttribute("GettingUp") or not l_Character_0:IsDescendantOf(l_Workspace_0) or tick() - v92 > 15;
                v62.Priority = Enum.AnimationPriority.Action4;
                v62.AnimId = v0.Animations.End;
                v62.Looped = false;
                v62.AnimSpeed = 1;
                v62.FadeIn = 0.2;
                v62.NameFade = 0.2;
                v62.StopInfo = {
                    StopDelay = 1.9666666666666666, 
                    StopTime = 0.5, 
                    Weight = 1
                };
                local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v62);
                task.delay(0.16666666666666666, function() --[[ Line: 409 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_LocalPlayer_0 (ref), l_Damager_0 (copy), l_Workspace_0 (ref), v77 (copy), l_NumberSequenceTween_0 (ref), l_l_AnimHelper_0_Anim_1 (copy)
                    l_SoundHelper_0:PlaySound({
                        Name = "Rustle2", 
                        Parent = l_LocalPlayer_0.Character == l_Damager_0 and l_Workspace_0.Debris or l_Damager_0.PrimaryPart, 
                        Volume = 1.2
                    });
                    for _, v96 in v77:GetDescendants() do
                        if v96:IsA("ParticleEmitter") then
                            v96.Enabled = false;
                        elseif v96:IsA("Beam") then
                            l_NumberSequenceTween_0.Tween(v96, 20);
                        end;
                    end;
                    task.wait(1);
                    if l_l_AnimHelper_0_Anim_1 then
                        l_l_AnimHelper_0_Anim_1:Stop(0);
                    end;
                    l_SoundHelper_0:PlaySound({
                        Name = "FeintRustle", 
                        Parent = l_LocalPlayer_0.Character == l_Damager_0 and l_Workspace_0.Debris or l_Damager_0.PrimaryPart, 
                        Volume = 0.3
                    });
                    task.wait(5);
                    v77:Destroy();
                end);
                task.delay(0.6666666666666666, function() --[[ Line: 437 ]]
                    -- upvalues: l_Character_0 (copy), l_Workspace_0 (ref), l_LookVector_0 (copy), v51 (ref), l_PrimaryPart_0 (copy), l_SimulateKnockbackBE_0 (ref)
                    if l_Character_0 and l_Character_0.PrimaryPart then
                        l_Character_0.PrimaryPart.Anchored = false;
                    end;
                    local l_l_Workspace_0_ServerTimeNow_1 = l_Workspace_0:GetServerTimeNow();
                    local v98 = {
                        Victim = l_Character_0, 
                        LookVector = l_LookVector_0, 
                        EndPosition = v51 - Vector3.new(0, 0.20000000298023224, 0, 0), 
                        VictimPosition = l_PrimaryPart_0.Position, 
                        TargetVector = v51 - v51, 
                        StartTime = l_l_Workspace_0_ServerTimeNow_1, 
                        TargetTime = 0.6666666666666666, 
                        HitIndex = 3
                    };
                    l_SimulateKnockbackBE_0:Fire(v98);
                end);
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v88(l_Damager_0, 0);
                    l_TweenService_0:Create(l_Vignette_0, v76, {
                        ImageTransparency = 1
                    }):Play();
                    task.defer(function() --[[ Line: 463 ]]
                        -- upvalues: v44 (copy), v21 (ref), l_CameraMode_0 (copy), l_Variant_0 (copy)
                        if v44 then
                            task.delay(0.3, function() --[[ Line: 465 ]]
                                -- upvalues: v21 (ref)
                                v21.CameraShake({
                                    Preset = "Knockdown", 
                                    WaitTime = 0.15, 
                                    Fade = 0.5, 
                                    FoV = 65, 
                                    FoVMult = 1
                                });
                            end);
                            task.wait(0.7);
                        end;
                        l_CameraMode_0.Value = "";
                        l_Variant_0.Value = "";
                    end);
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                task.delay(0.44999999999999996, function() --[[ Line: 491 ]]
                    -- upvalues: v29 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v44 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), l_Workspace_0 (ref), v21 (ref), v43 (copy)
                    print(v29 - tick());
                    l_SoundHelper_0:PlaySound({
                        Name = "BoxLayer", 
                        Parent = l_Character_0.PrimaryPart
                    });
                    task.wait(0.2);
                    if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                        l_SoundHelper_0:PlaySound({
                            Name = "Box", 
                            Parent = l_Workspace_0.Debris
                        });
                    end;
                    task.wait(0.9);
                    if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                        v21.TripleText({
                            Image = v43.Box, 
                            HoldTime = 0.6666666666666666
                        });
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.1, 
                            Fade = 0.5
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
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Lighting_0, v52, {
                        ExposureCompensation = l_Workspace_0.Exposure.Value
                    }):Play();
                end;
                if v44 then
                    l_Occupied_0.LerpMult.Value = 0;
                end;
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
                    local v100 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                    l_TweenService_0:Create(l_ColorCorrection_0, v100, {
                        Saturation = 0, 
                        Contrast = 0
                    }):Play();
                end;
                if l_Damager_0 and l_Damager_0.PrimaryPart then
                    l_Damager_0.PrimaryPart.Anchored = false;
                end;
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = false;
                end;
                for v101, v102 in v56 do
                    v101.CollisionGroup = v102;
                end;
                for _, v104 in v93 do
                    v104:Disconnect();
                end;
                task.wait(5);
                l_l_AnimHelper_0_Anim_0:Stop(0);
                l_l_AnimHelper_0_Anim_2:Stop(0);
                if v43 then
                    v43:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.KO = function(v105) --[[ Line: 568 ]] --[[ Name: KO ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), v21 (copy), l_SimulateKnockbackBE_0 (copy), l_TweenService_0 (copy), l_Main_0 (copy), l_Lighting_0 (copy)
        local l_Character_1 = v105.Character;
        local l_Damager_1 = v105.Damager;
        local l_StartPosition_1 = v105.StartPosition;
        local l_LookVector_1 = v105.LookVector;
        local l_FirstChild_2 = l_Workspace_0.States:FindFirstChild(l_Character_1.Name);
        local l_CharacterData_1 = l_FirstChild_2:FindFirstChild("CharacterData");
        local l_PlayerData_1 = l_FirstChild_2:FindFirstChild("PlayerData");
        local l_Occupied_1 = l_FirstChild_2:FindFirstChild("Occupied");
        if not l_CharacterData_1 or not l_PlayerData_1 or not l_Occupied_1 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_1);
            local l_Humanoid_2 = l_Character_1:FindFirstChild("Humanoid");
            local v116 = l_Humanoid_2 and l_Humanoid_2:FindFirstChild("Animator");
            local l_Humanoid_3 = l_Damager_1:FindFirstChild("Humanoid");
            local v118 = l_Humanoid_3 and l_Humanoid_3:FindFirstChild("Animator");
            if not v116 or not v118 then
                return;
            else
                local v119 = l_Assets_0.DownFrames.Default:Clone();
                if l_LocalPlayer_0.Character == l_Character_1 or l_LocalPlayer_0.Character == l_Damager_1 then
                    v119.Parent = l_Common_0;
                end;
                local v120 = {};
                for _, v122 in l_Character_1:GetChildren() do
                    if v122:IsA("BasePart") and v122 ~= l_Character_1.PrimaryPart then
                        v120[v122] = v122.CollisionGroup;
                        v122.CollisionGroup = "None";
                    end;
                end;
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = true;
                end;
                for _, v124 in (v118:GetPlayingAnimationTracks()) do
                    if v124.Priority ~= Enum.AnimationPriority.Idle then
                        v124:AdjustSpeed(v124.Speed / 3);
                    end;
                end;
                local v125 = {
                    AnimId = v0.Animations.KO, 
                    FadeIn = 0.05, 
                    AnimSpeed = 0.88, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_2, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_3 = l_AnimHelper_0:CreateAnim(v125);
                local v127 = l_LocalPlayer_0.Character == l_Character_1;
                if v127 or l_LocalPlayer_0.Character == l_Damager_1 then
                    task.delay(0.8333333333333334, function() --[[ Line: 636 ]]
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
                l_SoundHelper_0:PlaySound({
                    Name = "VineBoom", 
                    Parent = l_Character_1.PrimaryPart
                });
                if l_Occupied_1 and l_LocalPlayer_0.Character == l_Character_1 then
                    l_Occupied_1.Target.Value = l_LookVector_1;
                    l_Occupied_1.LockedOn.Value = l_Damager_1;
                end;
                local l_CameraSettings_1 = l_Workspace_0:FindFirstChild("CameraSettings");
                local _ = l_CameraSettings_1.CameraTarget;
                local _ = l_CameraSettings_1.CameraMode;
                local l_Variant_1 = l_CameraSettings_1.Variant;
                local l_CameraMode_2 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                task.delay(0.3333333333333333, function() --[[ Line: 675 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Damager_1 (copy), v21 (ref), l_Character_1 (copy)
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Damager_1.PrimaryPart, 
                        DirectCopy = script.Sounds.DryBones
                    });
                    local v135 = script.Particles.Skull:Clone();
                    v135.Parent = v21.GetWeldCharacter(l_Character_1).Head;
                    v135.Main:Emit(1);
                    task.wait(2);
                    v135:Destroy();
                end);
                task.delay(1.893939393939394, function() --[[ Line: 690 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_3 (copy)
                    l_l_AnimHelper_0_Anim_3:AdjustSpeed(0);
                end);
                local v136 = l_StartPosition_1 - l_LookVector_1 * 2;
                task.delay(0.8522727272727273, function() --[[ Line: 696 ]]
                    -- upvalues: l_Workspace_0 (ref), l_Character_1 (copy), l_LookVector_1 (copy), v136 (copy), l_PrimaryPart_1 (copy), l_StartPosition_1 (copy), l_SimulateKnockbackBE_0 (ref), v127 (copy), l_CameraMode_2 (copy), l_TweenService_0 (ref), l_LocalPlayer_0 (ref), l_Damager_1 (copy), v21 (ref), l_SoundHelper_0 (ref)
                    local l_l_Workspace_0_ServerTimeNow_2 = l_Workspace_0:GetServerTimeNow();
                    local v138 = {
                        Victim = l_Character_1, 
                        LookVector = l_LookVector_1, 
                        EndPosition = v136 + Vector3.new(0, 0.3499999940395355, 0, 0), 
                        VictimPosition = l_PrimaryPart_1.Position, 
                        TargetVector = l_StartPosition_1 - l_StartPosition_1, 
                        StartTime = l_l_Workspace_0_ServerTimeNow_2, 
                        TargetTime = 0.3787878787878788, 
                        HitIndex = 3
                    };
                    l_SimulateKnockbackBE_0:Fire(v138);
                    if v127 then
                        l_CameraMode_2.Value = "Cutscene";
                        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FieldOfView = 60
                        }):Play();
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                            CFrame = l_CurrentCamera_0.CFrame * CFrame.new(-3.1, -2, 4.7) * CFrame.Angles(0, 0, 0.06981317007977318)
                        }):Play();
                    end;
                    task.wait(0.2840909090909091);
                    if v127 or l_LocalPlayer_0.Character == l_Damager_1 then
                        task.defer(function() --[[ Line: 729 ]]
                            -- upvalues: v21 (ref)
                            v21.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.15, 
                                Fade = 0.8
                            });
                        end);
                        v21.HUDShake({
                            Scale = 20, 
                            Damper = 0.09999999999999999
                        });
                    end;
                    local v140 = script.FinalFall:Clone();
                    v140.Position = (CFrame.lookAt(v136, v136 + l_LookVector_1) * CFrame.new(0, 0, 2.5)).Position - Vector3.new(0, 3, 0, 0);
                    v140.Parent = l_Workspace_0.Debris;
                    for _, v142 in v140:GetDescendants() do
                        if v142:IsA("ParticleEmitter") then
                            v142.Enabled = false;
                            v142:Emit(v142:GetAttribute("EmitCount"));
                        end;
                    end;
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Damager_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Fall2
                    });
                    task.wait(8);
                    v140:Destroy();
                end);
                local l_Vignette_1 = l_Main_0.DownFrame.Vignette;
                local v144 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v145 = l_LocalPlayer_0.Character == l_Character_1;
                if v145 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v144, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v145 then
                    l_Occupied_1.LerpMult.Value = 0.1;
                end;
                if v145 or l_LocalPlayer_0.Character == l_Damager_1 then
                    task.defer(function() --[[ Line: 777 ]]
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
                    local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_1.Saturation = 0;
                    l_ColorCorrection_1.Contrast = 0;
                    l_ColorCorrection_1.Enabled = true;
                    local v147 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_1, v147, {
                        Saturation = -1, 
                        Contrast = 0.5
                    }):Play();
                    local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_0.Size = 0;
                    l_MenuBlur_0.Enabled = true;
                    local v149 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_0, v149, {
                        Size = 10
                    }):Play();
                    local v150 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v150, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(0.5681818181818182, function() --[[ Line: 811 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                end;
                task.wait(1.1363636363636365);
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2 - 2 * v105.RandomMult, function() --[[ Line: 822 ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_1:SetAttribute("GettingUp", nil);
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                local v151 = {
                    HoldTime = 1.5
                };
                l_SoundHelper_0:PlaySound({
                    Name = "StartMatch", 
                    Parent = l_Workspace_0.Debris
                });
                task.wait(2);
                if v145 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_SoundHelper_0:PlaySound({
                        Name = "Box", 
                        Volume = 0.25, 
                        Parent = l_Workspace_0.Debris
                    });
                    task.defer(function() --[[ Line: 853 ]]
                        -- upvalues: v151 (copy), v119 (copy), v21 (ref)
                        v151.Image = v119.KO.K;
                        v21.TripleText(v151);
                    end);
                    task.wait(0.1);
                    task.defer(function() --[[ Line: 859 ]]
                        -- upvalues: v151 (copy), v119 (copy), v21 (ref)
                        v151.Image = v119.KO.Dot1;
                        v21.TripleText(v151);
                    end);
                    task.wait(0.1);
                    task.defer(function() --[[ Line: 865 ]]
                        -- upvalues: v151 (copy), v119 (copy), v21 (ref)
                        v151.Image = v119.KO.O;
                        v21.TripleText(v151);
                    end);
                    task.wait(0.1);
                    task.defer(function() --[[ Line: 871 ]]
                        -- upvalues: v151 (copy), v119 (copy), v21 (ref)
                        v151.Image = v119.KO.Dot2;
                        v21.TripleText(v151);
                    end);
                end;
                if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                    l_Occupied_1.Target.Value = Vector3.new();
                end;
                local v152 = false;
                task.wait(1.25);
                if v145 then
                    l_Occupied_1.LerpMult.Value = 0;
                end;
                task.delay(2, function() --[[ Line: 887 ]]
                    -- upvalues: v145 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), l_CameraMode_2 (copy), l_Variant_1 (copy)
                    if v145 or l_LocalPlayer_0.Character == l_Damager_1 then
                        l_CameraMode_2.Value = "";
                        l_Variant_1.Value = "";
                    end;
                end);
                for v153, v154 in v120 do
                    v153.CollisionGroup = v154;
                end;
                if v145 or l_LocalPlayer_0.Character == l_Damager_1 then
                    v21.CameraShake({
                        Preset = "MedHit", 
                        WaitTime = 0.2, 
                        Fade = 1
                    });
                end;
                task.wait(5);
                if v145 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v144, {
                        ImageTransparency = 1
                    }):Play();
                end;
                task.wait(5);
                v152 = true;
                l_l_AnimHelper_0_Anim_3:Stop(0);
                if l_Damager_1 and l_Damager_1.PrimaryPart then
                    l_Damager_1.PrimaryPart.Anchored = false;
                end;
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = false;
                end;
                if v119 then
                    v119:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.Use = function(v155) --[[ Line: 928 ]] --[[ Name: Use ]]
        -- upvalues: v0 (copy)
        local _ = v155.Character;
        local _ = v155.Damager;
        if v155.IsKO then
            v0.KO(v155);
            return;
        else
            v0.Main(v155);
            return;
        end;
    end;
    return v0;
end;