local v0 = {
    DelayTime = 4, 
    ServerDelayTime = 8.2, 
    RandomTime = 1, 
    Metadata = {
        DisplayName = "CHAMPION", 
        GlowColor = Color3.fromRGB(72, 195, 248), 
        IgnoreShop = true
    }, 
    Animations = {
        Start = 16743390493, 
        Loop = 16743517821, 
        End = 16743527834, 
        KO = 16743541165
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
    local function _(v23, v24, v25) --[[ Line: 58 ]] --[[ Name: Lerp ]]
        return v23 + (v24 - v23) * v25;
    end;
    local l_NumberSequenceTween_0 = require(l_ReplicatedStorage_0:WaitForChild("NumberSequenceTween"));
    v0.Main = function(v28) --[[ Line: 62 ]] --[[ Name: Main ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), v21 (copy), l_SoundHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), l_TweenService_0 (copy), l_NumberSequenceTween_0 (copy), l_Lighting_0 (copy)
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
            local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(l_Character_0);
            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
            local v40 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
            local l_Humanoid_1 = l_Damager_0:FindFirstChild("Humanoid");
            local v42 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
            if not v40 or not v42 then
                return;
            else
                local v43 = l_Assets_0.DownFrames.Default:Clone();
                local v44 = l_LocalPlayer_0.Character == l_Character_0;
                local v45 = v44 or l_LocalPlayer_0.Character == l_Damager_0;
                if v45 then
                    v43.Parent = l_Common_0;
                end;
                local v46 = 1;
                local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_0, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_0, l_StartPosition_0 - l_LookVector_0, v46 + 0, l_l_RayHelper_0_EnvironmentWhitelist_0);
                local v51 = l_StartPosition_0 - l_LookVector_0 * v46;
                if l_l_RayHelper_0_RayWithWhiteList_0 then
                    v51 = l_StartPosition_0 - l_LookVector_0 * 1;
                end;
                local v52 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v53 = {};
                for _, v55 in l_Character_0:GetChildren() do
                    if v55:IsA("BasePart") and v55 ~= l_Character_0.PrimaryPart then
                        v53[v55] = v55.CollisionGroup;
                        v55.CollisionGroup = "None";
                    end;
                end;
                if not l_Character_0 or l_Character_0.PrimaryPart then

                end;
                for _, v57 in (v42:GetPlayingAnimationTracks()) do
                    if v57.Priority == Enum.AnimationPriority.Action or v57.Priority == Enum.AnimationPriority.Action2 or v57.Priority == Enum.AnimationPriority.Action3 then
                        local l_Speed_0 = v57.Speed;
                        v57:AdjustSpeed(l_Speed_0 / 3);
                        task.delay(1.0185185185185186, function() --[[ Line: 132 ]]
                            -- upvalues: v57 (copy), l_Speed_0 (copy)
                            if not v57 then
                                return;
                            else
                                v57:AdjustSpeed(l_Speed_0);
                                return;
                            end;
                        end);
                    end;
                end;
                local v59 = {
                    AnimId = v0.Animations.Start, 
                    FadeIn = 0.05, 
                    NameFade = 0.1, 
                    AnimSpeed = 0.5, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = v40, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v59);
                task.delay(0.3333333333333333, function() --[[ Line: 151 ]]
                    -- upvalues: v21 (ref), v43 (copy)
                    v21.TripleText({
                        Image = v43.Down, 
                        HoldTime = 0.6666666666666666
                    });
                end);
                if v45 then
                    task.defer(function() --[[ Line: 159 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.3, 
                            Fade = 3
                        });
                    end);
                end;
                task.delay(0.5, function() --[[ Line: 168 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v51 (ref), l_LookVector_0 (copy), l_Workspace_0 (ref), v45 (copy), v21 (ref)
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.9);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Step
                    });
                    local v61 = script.FallSmoke:Clone();
                    v61.Position = (CFrame.lookAt(v51, v51 + l_LookVector_0) * CFrame.new(0, 0, 2.5)).Position - Vector3.new(0, 2.700000047683716, 0, 0);
                    v61.Parent = l_Workspace_0.Debris;
                    for _, v63 in v61.Particle:GetChildren() do
                        v63.Enabled = false;
                        v63:Emit(v63:GetAttribute("EmitCount"));
                    end;
                    if v45 then
                        v21.HUDShake({
                            Scale = 10, 
                            Damper = 0.09999999999999999
                        });
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.4, 
                            Fade = 2.5
                        });
                    end;
                    task.wait(4);
                    v61:Destroy();
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
                    TargetTime = 0.5, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v67);
                local v68 = script.Knockdown:Clone();
                v68.CFrame = CFrame.lookAt(l_CFrame_0.Position, v51);
                v68.Position = v68.Position + Vector3.new(0, 0.75, 0, 0);
                v68.Parent = l_Workspace_0.Debris;
                for _, v70 in v68.Particle:GetChildren() do
                    v70.Enabled = false;
                    v70:Emit(v70:GetAttribute("EmitCount"));
                end;
                task.delay(6, function() --[[ Line: 233 ]]
                    -- upvalues: v68 (copy)
                    v68:Destroy();
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
                local v76 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v76, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v44 then
                    l_Occupied_0.LerpMult.Value = 0.1;
                end;
                local v77 = l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Character_0.PrimaryPart, 
                    DirectCopy = script.Sounds.PowerUp
                });
                task.wait(1.0185185185185186);
                local v78 = {};
                local v79 = {};
                for _, v81 in script.Aura:GetChildren() do
                    local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(v81.Name);
                    if l_l_Character_0_FirstChild_0 then
                        local v83 = v81:Clone();
                        v83.Parent = l_Workspace_0.Debris;
                        v83.Transparency = 1;
                        local l_Weld_0 = Instance.new("Weld");
                        l_Weld_0.Parent = v83;
                        l_Weld_0.Part0 = v83;
                        l_Weld_0.Part1 = l_l_Character_0_FirstChild_0;
                        for _, v86 in v83:GetDescendants() do
                            if v86:IsA("ParticleEmitter") then
                                v86.TimeScale = v86.TimeScale * 0;
                                v86.Enabled = true;
                                v79[v86] = v86.Rate;
                                v86.Rate = 0;
                            elseif v86:IsA("Beam") then
                                l_NumberSequenceTween_0.Tween(v86, 1, 0.99);
                                task.delay(1.5, function() --[[ Line: 301 ]]
                                    -- upvalues: l_NumberSequenceTween_0 (ref), v86 (copy)
                                    l_NumberSequenceTween_0.Tween(v86, 225, -100);
                                end);
                            end;
                        end;
                        table.insert(v78, v83);
                    end;
                end;
                task.delay(1.5, function() --[[ Line: 310 ]]
                    -- upvalues: l_TweenService_0 (ref), v78 (copy), v79 (copy)
                    for v87 = 1, 450 do
                        local v88 = v87 / 450;
                        v88 = l_TweenService_0:GetValue(v88, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                        for _, v90 in v78 do
                            for _, v92 in v90:GetDescendants() do
                                if v92:IsA("ParticleEmitter") then
                                    v92.TimeScale = 0 + 1 * v88;
                                    v92.Rate = 0 + (v79[v92] - 0) * v88;
                                end;
                            end;
                        end;
                        task.wait(0.016666666666666666);
                    end;
                end);
                local v93 = nil;
                task.delay(2.5, function() --[[ Line: 329 ]]
                    -- upvalues: v93 (ref), l_SoundHelper_0 (ref), l_Character_0 (copy)
                    v93 = l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Eye
                    });
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Flames
                    });
                end);
                v59.Priority = Enum.AnimationPriority.Action3;
                v59.AnimId = v0.Animations.Loop;
                v59.Looped = true;
                v59.AnimSpeed = 1;
                v59.FadeIn = 0.3;
                v59.NameFade = 0.3;
                l_AnimHelper_0:CreateAnim(v59).Name = "Remove";
                task.wait(0.8333333333333334);
                local v94 = v0.DelayTime - l_Workspace_0.Ping.Value / 2 - v28.RandomMult * v0.RandomTime + v28.ExtraTime;
                if v45 then
                    local v95 = v94 - 5.25 - v28.ExtraTime;
                    local l_v95_0 = v95 --[[ copy: 46 -> 56 ]];
                    task.defer(function() --[[ Line: 368 ]]
                        -- upvalues: l_v95_0 (copy), v21 (ref), v28 (copy)
                        task.wait(l_v95_0);
                        v21.CameraShake({
                            Preset = "LightHit", 
                            WaitTime = 6 + v28.ExtraTime, 
                            Fade = 2
                        });
                    end);
                    task.defer(function() --[[ Line: 378 ]]
                        -- upvalues: v94 (copy), v21 (ref)
                        task.wait(v94 - 0.8);
                        v21.CameraShake({
                            Preset = "LightHit", 
                            WaitTime = 1, 
                            Fade = 1
                        });
                    end);
                end;
                task.defer(function() --[[ Line: 389 ]]
                    -- upvalues: v21 (ref), l_Character_0 (copy), v44 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v28 (copy), v0 (ref)
                    v21.DownCount({
                        Character = l_Character_0, 
                        IsBillboard = not (v44 or l_LocalPlayer_0.Character == l_Damager_0), 
                        Speed = v28.ExtraTime / (v0.DelayTime + v28.ExtraTime)
                    });
                end);
                task.delay(v94, function() --[[ Line: 397 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                if v45 then
                    l_Variant_0.Value = "Barbarian";
                    l_CameraMode_0.Value = "Knockdown";
                    l_CameraTarget_0.Value = l_Character_0;
                    v21.SetTransparency(l_Damager_0, 1);
                    l_TweenService_0:Create(l_Vignette_0, v76, {
                        ImageTransparency = 0.2
                    }):Play();
                    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_0.Enabled = true;
                    l_TweenService_0:Create(l_ColorCorrection_0, TweenInfo.new(v94 + 1, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                        TintColor = Color3.fromRGB(226, 234, 255)
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
                local v99 = tick();
                local v100 = {};
                repeat
                    task.wait(0.1);
                until l_Character_0:GetAttribute("GettingUp") or not l_Character_0:IsDescendantOf(l_Workspace_0) or tick() - v99 > 15;
                v59.Priority = Enum.AnimationPriority.Action4;
                v59.AnimId = v0.Animations.End;
                v59.Looped = false;
                v59.AnimSpeed = 1;
                v59.FadeIn = 0.2;
                v59.NameFade = 0.2;
                v59.StopInfo = {
                    StopDelay = 1.9666666666666666, 
                    StopTime = 0.5, 
                    Weight = 1
                };
                task.delay(0.25, function() --[[ Line: 452 ]]
                    -- upvalues: l_Lighting_0 (ref), v45 (copy), l_TweenService_0 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy), v77 (copy), v93 (ref), v21 (ref), l_l_Players_0_PlayerFromCharacter_0 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v78 (copy), l_NumberSequenceTween_0 (ref)
                    local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
                    local v102 = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                    if v45 then
                        l_TweenService_0:Create(l_ColorCorrection_1, v102, {
                            TintColor = Color3.fromRGB(255, 255, 255)
                        }):Play();
                    end;
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v45 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Explosion
                    });
                    if v77 and v93 then
                        l_TweenService_0:Create(v77, v102, {
                            Volume = 0
                        }):Play();
                        l_TweenService_0:Create(v93, v102, {
                            Volume = 0
                        }):Play();
                    end;
                    local v103 = script.Particles.Explosion:Clone();
                    v103.Parent = v21.GetWeldCharacter(l_Character_0).PrimaryPart;
                    for _, v105 in v103:GetChildren() do
                        v105:Emit(v105:GetAttribute("EmitCount"));
                    end;
                    if l_l_Players_0_PlayerFromCharacter_0 or l_LocalPlayer_0.Character == l_Damager_0 then
                        task.defer(function() --[[ Line: 479 ]]
                            -- upvalues: v21 (ref)
                            v21.CameraShake({
                                Preset = "Knockdown", 
                                WaitTime = 0.35, 
                                Fade = 1, 
                                FoV = 55, 
                                FoVMult = 1
                            });
                        end);
                        v21.HUDShake({
                            Scale = 20, 
                            Damper = 0.09999999999999999
                        });
                        l_ColorCorrection_1.Saturation = 0;
                        l_ColorCorrection_1.Contrast = 0;
                        l_ColorCorrection_1.Enabled = true;
                        local v106 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_ColorCorrection_1, v106, {
                            Saturation = -1, 
                            Contrast = 0.5
                        }):Play();
                        local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_0.Size = 0;
                        l_MenuBlur_0.Enabled = true;
                        local v108 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_0, v108, {
                            Size = 10
                        }):Play();
                        local v109 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_Lighting_0, v109, {
                            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                        }):Play();
                    end;
                    task.wait(0.7);
                    for _, v111 in v78 do
                        for _, v113 in v111:GetDescendants() do
                            if v113:IsA("ParticleEmitter") then
                                v113.TimeScale = v113.TimeScale * 0.2;
                                v113.Enabled = false;
                            elseif v113:IsA("Beam") then
                                l_NumberSequenceTween_0.Tween(v113, 40, 1);
                            end;
                        end;
                    end;
                    task.wait(5);
                    v103:Destroy();
                    for _, v115 in v78 do
                        v115:Destroy();
                    end;
                end);
                task.delay(0.4166666666666667, function() --[[ Line: 534 ]]
                    -- upvalues: l_SoundHelper_0 (ref), v45 (copy), l_Workspace_0 (ref), l_Character_0 (copy)
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v45 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Impact
                    });
                end);
                l_l_AnimHelper_0_Anim_0.Priority = Enum.AnimationPriority.Action3;
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v59);
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v21.SetTransparency(l_Damager_0, 0);
                    l_TweenService_0:Create(l_Vignette_0, v76, {
                        ImageTransparency = 1
                    }):Play();
                    task.defer(function() --[[ Line: 549 ]]
                        -- upvalues: l_CameraMode_0 (copy), l_Variant_0 (copy)
                        l_CameraMode_0.Value = "";
                        l_Variant_0.Value = "";
                    end);
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                task.delay(0.44999999999999996, function() --[[ Line: 562 ]]
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
                    local l_ColorCorrection_2 = l_Lighting_0.ColorCorrection;
                    local v118 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                    l_TweenService_0:Create(l_ColorCorrection_2, v118, {
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
                for v119, v120 in v53 do
                    v119.CollisionGroup = v120;
                end;
                for _, v122 in v100 do
                    v122:Disconnect();
                end;
                task.wait(5);
                l_l_AnimHelper_0_Anim_0:Stop(0);
                l_l_AnimHelper_0_Anim_1:Stop(0);
                if v43 then
                    v43:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.KO = function(v123) --[[ Line: 639 ]] --[[ Name: KO ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), v21 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy)
        local l_Character_1 = v123.Character;
        local l_Damager_1 = v123.Damager;
        local l_StartPosition_1 = v123.StartPosition;
        local l_LookVector_1 = v123.LookVector;
        local l_FirstChild_1 = l_Workspace_0.States:FindFirstChild(l_Character_1.Name);
        local l_CharacterData_1 = l_FirstChild_1:FindFirstChild("CharacterData");
        local l_PlayerData_1 = l_FirstChild_1:FindFirstChild("PlayerData");
        local l_Occupied_1 = l_FirstChild_1:FindFirstChild("Occupied");
        if not l_CharacterData_1 or not l_PlayerData_1 or not l_Occupied_1 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_1);
            local l_Humanoid_2 = l_Character_1:FindFirstChild("Humanoid");
            local v134 = l_Humanoid_2 and l_Humanoid_2:FindFirstChild("Animator");
            local l_Humanoid_3 = l_Damager_1:FindFirstChild("Humanoid");
            local v136 = l_Humanoid_3 and l_Humanoid_3:FindFirstChild("Animator");
            if not v134 or not v136 then
                return;
            else
                local v137 = l_Assets_0.DownFrames.Default:Clone();
                local v138 = l_LocalPlayer_0.Character == l_Character_1;
                if v138 or l_LocalPlayer_0.Character == l_Damager_1 then
                    v137.Parent = l_Common_0;
                end;
                local v139 = 3.5;
                local l_l_RayHelper_0_EnvironmentWhitelist_1 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_1, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_1, l_StartPosition_1 - l_LookVector_1, v139 + 0, l_l_RayHelper_0_EnvironmentWhitelist_1);
                local v144 = l_StartPosition_1 - l_LookVector_1 * v139;
                if l_l_RayHelper_0_RayWithWhiteList_1 then
                    v144 = l_StartPosition_1 - l_LookVector_1 * 2;
                end;
                local v145 = {};
                for _, v147 in l_Character_1:GetChildren() do
                    if v147:IsA("BasePart") and v147 ~= l_Character_1.PrimaryPart then
                        v145[v147] = v147.CollisionGroup;
                        v147.CollisionGroup = "None";
                    end;
                end;
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = true;
                end;
                for _, v149 in (v136:GetPlayingAnimationTracks()) do
                    if v149.Priority ~= Enum.AnimationPriority.Idle then
                        v149:AdjustSpeed(v149.Speed / 3);
                    end;
                end;
                local v150 = {
                    AnimId = v0.Animations.KO, 
                    FadeIn = 0.05, 
                    NameFade = 0.1, 
                    AnimSpeed = 0.22, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_2, 
                    Weight = 10000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v150);
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Character_1.PrimaryPart, 
                    DirectCopy = script.Sounds.Final
                });
                l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_1.PrimaryPart
                });
                local v152 = v138 or l_LocalPlayer_0.Character == l_Damager_1;
                task.delay(0.1, function() --[[ Line: 732 ]]
                    -- upvalues: v21 (ref)
                    v21.CreateImpactFrame({
                        Time = 0.06
                    });
                end);
                task.delay(0.7575757575757576, function() --[[ Line: 738 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_2 (copy), l_SoundHelper_0 (ref), l_Character_1 (copy), v144 (ref), l_LookVector_1 (copy), l_Workspace_0 (ref), v152 (copy), v21 (ref)
                    l_l_AnimHelper_0_Anim_2:AdjustSpeed(0.76);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Step
                    });
                    local v153 = script.FallSmoke:Clone();
                    v153.Position = (CFrame.lookAt(v144, v144 + l_LookVector_1) * CFrame.new(0, 0, 2.5)).Position - Vector3.new(0, 3, 0, 0);
                    v153.Parent = l_Workspace_0.Debris;
                    for _, v155 in v153.Particle:GetChildren() do
                        v155.Enabled = false;
                        v155:Emit(v155:GetAttribute("EmitCount"));
                    end;
                    if v152 then
                        task.defer(function() --[[ Line: 757 ]]
                            -- upvalues: v21 (ref)
                            v21.HUDShake({
                                Scale = 10, 
                                Damper = 0.09999999999999999
                            });
                            v21.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 0.1, 
                                Fade = 2
                            });
                        end);
                    end;
                    task.wait(1.4035087719298245);
                    local v156 = script.FinalFall:Clone();
                    v156.Position = (CFrame.lookAt(v144, v144 + l_LookVector_1) * CFrame.new(0, 0, -1.5)).Position - Vector3.new(0, 3, 0, 0);
                    v156.Parent = l_Workspace_0.Debris;
                    for _, v158 in v156.Particle:GetChildren() do
                        v158.Enabled = false;
                        v158:Emit(v158:GetAttribute("EmitCount"));
                    end;
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Land1
                    });
                    if v152 then
                        task.defer(function() --[[ Line: 789 ]]
                            -- upvalues: v21 (ref)
                            v21.HUDShake({
                                Scale = 10, 
                                Damper = 0.09999999999999999
                            });
                            v21.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.1, 
                                Fade = 3.5
                            });
                        end);
                    end;
                    task.wait(4);
                    v156:Destroy();
                end);
                if v138 or l_LocalPlayer_0.Character == l_Damager_1 then
                    task.delay(0.8333333333333334, function() --[[ Line: 808 ]]
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
                local v162 = {
                    Victim = l_Character_1, 
                    LookVector = l_LookVector_1, 
                    EndPosition = v144, 
                    VictimPosition = l_PrimaryPart_1.Position, 
                    TargetVector = v144 - v144, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_1, 
                    TargetTime = 0.7575757575757576, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v162);
                if l_Occupied_1 and l_LocalPlayer_0.Character == l_Character_1 then
                    l_Occupied_1.Target.Value = l_LookVector_1;
                    l_Occupied_1.LockedOn.Value = l_Damager_1;
                end;
                local l_CameraSettings_1 = l_Workspace_0:FindFirstChild("CameraSettings");
                local _ = l_CameraSettings_1.CameraTarget;
                local _ = l_CameraSettings_1.CameraMode;
                local l_Variant_1 = l_CameraSettings_1.Variant;
                local l_CameraMode_2 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                local l_Vignette_1 = l_Main_0.DownFrame.Vignette;
                local v169 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v170 = l_LocalPlayer_0.Character == l_Character_1;
                if v170 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v169, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v170 then
                    l_Occupied_1.LerpMult.Value = 0.1;
                end;
                if v170 or l_LocalPlayer_0.Character == l_Damager_1 then
                    task.defer(function() --[[ Line: 871 ]]
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
                    local l_ColorCorrection_3 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_3.Saturation = 0;
                    l_ColorCorrection_3.Contrast = 0;
                    l_ColorCorrection_3.Enabled = true;
                    local v172 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_3, v172, {
                        Saturation = -1, 
                        Contrast = 0.5
                    }):Play();
                    local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_1.Size = 0;
                    l_MenuBlur_1.Enabled = true;
                    local v174 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_1, v174, {
                        Size = 10
                    }):Play();
                    local v175 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v175, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(0.7575757575757576, function() --[[ Line: 905 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                end;
                task.wait(1.6347687400318978);
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2, function() --[[ Line: 916 ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_1:SetAttribute("GettingUp", nil);
                end);
                local v176 = tick();
                repeat
                    task.wait(0.1);
                until l_Character_1:GetAttribute("GettingUp") or not l_Character_1:IsDescendantOf(l_Workspace_0) or tick() - v176 > 10;
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                local v177 = {
                    HoldTime = 1.5
                };
                l_SoundHelper_0:PlaySound({
                    Name = "StartMatch", 
                    Parent = l_Workspace_0.Debris
                });
                task.wait(2);
                if v170 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_SoundHelper_0:PlaySound({
                        Name = "Box", 
                        Volume = 0.25, 
                        Parent = l_Workspace_0.Debris
                    });
                    if v152 then
                        task.defer(function() --[[ Line: 953 ]]
                            -- upvalues: v21 (ref)
                            v21.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 0.2, 
                                Fade = 1
                            });
                        end);
                    end;
                    if not l_Character_1:GetAttribute("ActiveNPC") then
                        task.defer(function() --[[ Line: 963 ]]
                            -- upvalues: v177 (copy), v137 (copy), v21 (ref)
                            v177.Image = v137.KO.K;
                            v21.TripleText(v177);
                        end);
                        task.wait(0.1);
                        task.defer(function() --[[ Line: 969 ]]
                            -- upvalues: v177 (copy), v137 (copy), v21 (ref)
                            v177.Image = v137.KO.Dot1;
                            v21.TripleText(v177);
                        end);
                        task.wait(0.1);
                        task.defer(function() --[[ Line: 975 ]]
                            -- upvalues: v177 (copy), v137 (copy), v21 (ref)
                            v177.Image = v137.KO.O;
                            v21.TripleText(v177);
                        end);
                        task.wait(0.1);
                        task.defer(function() --[[ Line: 981 ]]
                            -- upvalues: v177 (copy), v137 (copy), v21 (ref)
                            v177.Image = v137.KO.Dot2;
                            v21.TripleText(v177);
                        end);
                    end;
                end;
                if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                    l_Occupied_1.Target.Value = Vector3.new();
                end;
                local v178 = false;
                task.wait(1.25);
                if v170 then
                    l_Occupied_1.LerpMult.Value = 0;
                end;
                task.delay(2, function() --[[ Line: 998 ]]
                    -- upvalues: v170 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), l_CameraMode_2 (copy), l_Variant_1 (copy)
                    if v170 or l_LocalPlayer_0.Character == l_Damager_1 then
                        l_CameraMode_2.Value = "";
                        l_Variant_1.Value = "";
                    end;
                end);
                for v179, v180 in v145 do
                    v179.CollisionGroup = v180;
                end;
                task.wait(5);
                if v170 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v169, {
                        ImageTransparency = 1
                    }):Play();
                end;
                task.wait(5);
                v178 = true;
                l_l_AnimHelper_0_Anim_2:Stop(0);
                if l_Damager_1 and l_Damager_1.PrimaryPart then
                    l_Damager_1.PrimaryPart.Anchored = false;
                end;
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = false;
                end;
                if v137 then
                    v137:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.Use = function(v181) --[[ Line: 1031 ]] --[[ Name: Use ]]
        -- upvalues: v0 (copy)
        local _ = v181.Character;
        local _ = v181.Damager;
        if v181.IsKO then
            v0.KO(v181);
            return;
        else
            v0.Main(v181);
            return;
        end;
    end;
    return v0;
end;