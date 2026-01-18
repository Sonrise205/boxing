local v0 = {
    DelayTime = 4, 
    ServerDelayTime = 8.2, 
    RandomTime = 1, 
    Metadata = {
        DisplayName = "UNDER-TALE", 
        GlowColor = Color3.fromRGB(64, 201, 216), 
        Price = 49999
    }, 
    Animations = {
        Start = 18475797760, 
        Loop = 18475805579, 
        End = 18475814106, 
        KO = 18477937706
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
    local function _(v23, v24, v25) --[[ Line: 60 ]] --[[ Name: Lerp ]]
        return v23 + (v24 - v23) * v25;
    end;
    local _ = require(l_ReplicatedStorage_0:WaitForChild("NumberSequenceTween"));
    v0.Main = function(v28) --[[ Line: 64 ]] --[[ Name: Main ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), v21 (copy), l_SoundHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy), l_ReplicatedStorage_0 (copy)
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
                        task.delay(0.8333333333333334, function() --[[ Line: 134 ]]
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
                    AnimSpeed = 0.3, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = v40, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v59);
                task.delay(0.3333333333333333, function() --[[ Line: 153 ]]
                    -- upvalues: v21 (ref), v43 (copy)
                    v21.TripleText({
                        Image = v43.Down, 
                        HoldTime = 0.6666666666666666
                    });
                end);
                if v45 then
                    task.defer(function() --[[ Line: 161 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.3, 
                            Fade = 3
                        });
                    end);
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = v45 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                    DirectCopy = script.Sounds.Impact
                });
                task.delay(0.1, function() --[[ Line: 176 ]]
                    -- upvalues: v51 (ref), l_LookVector_0 (copy), l_Workspace_0 (ref)
                    local v61 = script.FallSmoke:Clone();
                    v61.Position = (CFrame.lookAt(v51, v51 + l_LookVector_0) * CFrame.new(0, 0, 1)).Position - Vector3.new(0, 2.700000047683716, 0, 0);
                    v61.Parent = l_Workspace_0.Debris;
                    for _, v63 in v61.Particle:GetChildren() do
                        v63.Enabled = false;
                        v63:Emit(v63:GetAttribute("EmitCount"));
                    end;
                    task.wait(4);
                    v61:Destroy();
                end);
                task.delay(0.8333333333333334, function() --[[ Line: 191 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v45 (copy), v21 (ref)
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.9);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Step
                    });
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
                    TargetTime = 0.8333333333333334, 
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
                task.delay(6, function() --[[ Line: 244 ]]
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
                local _ = l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Character_0.PrimaryPart, 
                    DirectCopy = script.Sounds.PowerUp
                });
                local v78 = script.Particles.Main:Clone();
                v78.Parent = v21.GetWeldCharacter(l_Character_0).PrimaryPart;
                local v79 = {
                    "HeartNormal", 
                    "HeartShatter", 
                    "HeartShatter2", 
                    "HeartShake", 
                    "HeartEmerge", 
                    "HeartNormal2"
                };
                task.defer(function() --[[ Line: 285 ]]
                    -- upvalues: v79 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v21 (ref), v78 (copy)
                    for _, v81 in v79 do
                        if v81 == "HeartShake" then
                            task.delay(0.95, function() --[[ Line: 288 ]]
                                -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (ref)
                                l_SoundHelper_0:PlaySound({
                                    Name = "Knockdown", 
                                    Parent = l_Character_0.PrimaryPart, 
                                    DirectCopy = script.Sounds.Heal2
                                });
                            end);
                        end;
                        if v81 == "HeartEmerge" then
                            l_SoundHelper_0:PlaySound({
                                Name = "Knockdown", 
                                Parent = l_Character_0.PrimaryPart, 
                                DirectCopy = script.Sounds.Heal
                            });
                            task.defer(function() --[[ Line: 304 ]]
                                -- upvalues: v21 (ref)
                                v21.CameraShake({
                                    Preset = "HardHit", 
                                    WaitTime = 0.2, 
                                    Fade = 0.2
                                });
                            end);
                        end;
                        if v78 and v78:FindFirstChild(v81) then
                            v78[v81]:Emit(1);
                            task.wait(v78[v81].Lifetime.Max - 0.03333333333333333);
                        end;
                    end;
                end);
                local v82 = v21.GetAtmosphere();
                local v83 = {
                    Density = v82.Density, 
                    Color = v82.Color, 
                    Haze = v82.Haze, 
                    Glare = v82.Glare, 
                    Decay = v82.Decay
                };
                local v84 = {
                    ColorShift_Bottom = l_Lighting_0.ColorShift_Bottom, 
                    ColorShift_Top = l_Lighting_0.ColorShift_Top, 
                    OutdoorAmbient = l_Lighting_0.OutdoorAmbient, 
                    Ambient = l_Lighting_0.Ambient
                };
                local v85 = {
                    ColorShift_Bottom = Color3.fromRGB(0, 0, 0), 
                    ColorShift_Top = Color3.fromRGB(0, 0, 0), 
                    OutdoorAmbient = Color3.fromRGB(128, 128, 128), 
                    Ambient = Color3.fromRGB(138, 138, 138)
                };
                local v86 = {};
                local v87 = {};
                local v88 = {
                    "Live", 
                    "Welds"
                };
                if v45 then
                    local v89, v90 = v21.GetPartsToHide(l_Character_0, v88);
                    v86 = v89;
                    v87 = v90;
                end;
                task.wait(0.8333333333333334);
                local _ = {};
                task.delay(0, function() --[[ Line: 358 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (copy), v21 (ref)
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Hit
                    });
                    task.wait(1.3);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Reverb
                    });
                    v21.CameraShake({
                        Preset = "HardHit", 
                        WaitTime = 0.2, 
                        Fade = 0.5
                    });
                end);
                local function v101(v92, v93) --[[ Line: 379 ]] --[[ Name: SetTransparency ]]
                    -- upvalues: l_ReplicatedStorage_0 (ref), l_Workspace_0 (ref)
                    for _, v95 in v92:GetDescendants() do
                        if v95.Name == "UnusualParticle" then
                            v95.Enabled = v93 == 0;
                            if not v95.Enabled then
                                local l_Parent_1 = v95.Parent;
                                v95.Parent = l_ReplicatedStorage_0;
                                v95.Parent = l_Parent_1;
                            end;
                        end;
                        if (v95:IsA("BasePart") or v95:IsA("Decal")) and v95.LocalTransparencyModifier < 1000 then
                            v95.LocalTransparencyModifier = v93;
                        end;
                    end;
                    local l_FirstChild_1 = l_Workspace_0.Welds:FindFirstChild(v92.Name);
                    if l_FirstChild_1 then
                        for _, v99 in l_FirstChild_1:GetDescendants() do
                            if v99.Name == "UnusualParticle" then
                                v99.Enabled = v93 == 0;
                                if not v99.Enabled then
                                    local l_Parent_2 = v99.Parent;
                                    v99.Parent = l_ReplicatedStorage_0;
                                    v99.Parent = l_Parent_2;
                                end;
                            end;
                            if (v99:IsA("BasePart") or v99:IsA("Decal")) and v99.LocalTransparencyModifier < 1000 then
                                v99.LocalTransparencyModifier = v93;
                            end;
                        end;
                    end;
                end;
                v59.Priority = Enum.AnimationPriority.Action3;
                v59.AnimId = v0.Animations.Loop;
                v59.Looped = true;
                v59.AnimSpeed = 1;
                v59.FadeIn = 0.3;
                v59.NameFade = 0.3;
                l_AnimHelper_0:CreateAnim(v59).Name = "Remove";
                task.wait(0.8333333333333334);
                local v102 = v0.DelayTime - l_Workspace_0.Ping.Value / 2 - v28.RandomMult * v0.RandomTime + v28.ExtraTime;
                if v45 then
                    local v103 = v102 - 5.25 - v28.ExtraTime;
                    local l_v103_0 = v103 --[[ copy: 54 -> 64 ]];
                    task.defer(function() --[[ Line: 441 ]]
                        -- upvalues: l_v103_0 (copy), v21 (ref), v28 (copy)
                        task.wait(l_v103_0);
                        v21.CameraShake({
                            Preset = "SuperLight", 
                            WaitTime = 6 + v28.ExtraTime, 
                            Fade = 2
                        });
                    end);
                end;
                local v105 = script.Particles.Billboard:Clone();
                v105.Parent = v21.GetWeldCharacter(l_Character_0):FindFirstChild("Head") or l_Character_0:FindFirstChild("Head");
                task.delay(2, function() --[[ Line: 456 ]]
                    -- upvalues: v105 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy)
                    local l_Text_0 = v105.BillboardGui.TextLabel.Text;
                    local v107 = {};
                    for v108 = 1, #l_Text_0 do
                        v107[v108] = l_Text_0:sub(v108, v108);
                    end;
                    for v109 = 1, #l_Text_0 do
                        v105.BillboardGui.TextLabel.MaxVisibleGraphemes = v109;
                        if v107[v109] ~= " " then
                            l_SoundHelper_0:PlaySound({
                                Name = "Knockdown", 
                                Parent = l_Character_0.PrimaryPart, 
                                DirectCopy = script.Sounds.Text
                            });
                        end;
                        task.wait(0.05);
                    end;
                end);
                task.delay(v102, function() --[[ Line: 487 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                if v45 then
                    l_Variant_0.Value = "Undertale";
                    l_CameraMode_0.Value = "Knockdown";
                    l_CameraTarget_0.Value = l_Character_0;
                    v101(l_Damager_0, 1);
                    l_TweenService_0:Create(l_Vignette_0, v76, {
                        ImageTransparency = 0.2
                    }):Play();
                    l_Lighting_0.ColorCorrection.Enabled = true;
                    if l_LocalPlayer_0.Character == l_Damager_0 then
                        v21.KnockdownWalk({
                            Damager = l_Damager_0, 
                            DamagerHumanoid = l_Humanoid_1, 
                            LookVector = l_LookVector_0
                        });
                    end;
                    task.delay(0, function() --[[ Line: 516 ]]
                        -- upvalues: l_TweenService_0 (ref), v82 (copy), l_Lighting_0 (ref), v85 (copy), v87 (ref), v86 (ref)
                        l_TweenService_0:Create(v82, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Density = 0.85, 
                            Color = Color3.fromRGB(0, 0, 0), 
                            Decay = Color3.fromRGB(125, 125, 125), 
                            Haze = 20, 
                            Glare = 0.1
                        }):Play();
                        l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v85):Play();
                        for _, v112 in v87 do
                            v112.Enabled = false;
                        end;
                        task.defer(function() --[[ Line: 532 ]]
                            -- upvalues: l_TweenService_0 (ref), v86 (ref)
                            for v113 = 1, 15 do
                                local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v113 / 15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                                for _, v116 in v86 do
                                    if v116.LocalTransparencyModifier < 1000 then
                                        v116.LocalTransparencyModifier = l_l_TweenService_0_Value_0;
                                    end;
                                end;
                                task.wait(0.03333333333333333);
                            end;
                        end);
                    end);
                end;
                l_Damager_0:SetAttribute("CurrentEmote", nil);
                local v117 = tick();
                local v118 = {};
                repeat
                    task.wait(0.1);
                until l_Character_0:GetAttribute("GettingUp") or not l_Character_0:IsDescendantOf(l_Workspace_0) or tick() - v117 > 15;
                l_TweenService_0:Create(v82, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v83):Play();
                l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v84):Play();
                if v45 then
                    task.defer(function() --[[ Line: 561 ]]
                        -- upvalues: l_TweenService_0 (ref), v86 (ref), v87 (ref)
                        for v119 = 1, 8 do
                            local l_l_TweenService_0_Value_1 = l_TweenService_0:GetValue(v119 / 8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                            for _, v122 in v86 do
                                if v122.LocalTransparencyModifier < 1000 then
                                    v122.LocalTransparencyModifier = 1 - l_l_TweenService_0_Value_1;
                                end;
                            end;
                            task.wait(0.03333333333333333);
                        end;
                        for _, v124 in v87 do
                            v124.Enabled = true;
                        end;
                    end);
                end;
                l_TweenService_0:Create(v105.BillboardGui.TextLabel, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    TextTransparency = 1
                }):Play();
                l_TweenService_0:Create(v105.BillboardGui.TextLabel.UIStroke, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Transparency = 1
                }):Play();
                task.delay(2, function() --[[ Line: 583 ]]
                    -- upvalues: v105 (copy), v78 (copy)
                    if v105 then
                        v105:Destroy();
                    end;
                    if v78 then
                        v78:Destroy();
                    end;
                end);
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
                task.delay(0.25, function() --[[ Line: 602 ]]
                    -- upvalues: l_Lighting_0 (ref), l_SoundHelper_0 (ref), v45 (copy), l_Workspace_0 (ref), l_Character_0 (copy), v21 (ref), v78 (copy), l_l_Players_0_PlayerFromCharacter_0 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), l_TweenService_0 (ref)
                    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v45 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Explosion
                    });
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v45 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Explosion2
                    });
                    local v126 = script.Particles.Explosion:Clone();
                    v126.Parent = v21.GetWeldCharacter(l_Character_0).PrimaryPart;
                    for _, v128 in v126:GetChildren() do
                        v128:Emit(v128:GetAttribute("EmitCount"));
                    end;
                    if v78 then
                        v78:Destroy();
                    end;
                    if l_l_Players_0_PlayerFromCharacter_0 or l_LocalPlayer_0.Character == l_Damager_0 then
                        task.defer(function() --[[ Line: 629 ]]
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
                        l_ColorCorrection_0.Saturation = 0;
                        l_ColorCorrection_0.Contrast = 0;
                        l_ColorCorrection_0.Enabled = true;
                        local v129 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_ColorCorrection_0, v129, {
                            Saturation = -1, 
                            Contrast = 0.5
                        }):Play();
                        local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_0.Size = 0;
                        l_MenuBlur_0.Enabled = true;
                        local v131 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_0, v131, {
                            Size = 10
                        }):Play();
                        local v132 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_Lighting_0, v132, {
                            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                        }):Play();
                    end;
                    task.wait(0.7);
                    task.wait(5);
                    v126:Destroy();
                end);
                l_l_AnimHelper_0_Anim_0.Priority = Enum.AnimationPriority.Action3;
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v59);
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v101(l_Damager_0, 0);
                    l_TweenService_0:Create(l_Vignette_0, v76, {
                        ImageTransparency = 1
                    }):Play();
                    task.defer(function() --[[ Line: 676 ]]
                        -- upvalues: l_CameraMode_0 (copy), l_Variant_0 (copy)
                        l_CameraMode_0.Value = "";
                        l_Variant_0.Value = "";
                    end);
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                task.delay(0.44999999999999996, function() --[[ Line: 689 ]]
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
                    local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
                    local v135 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                    l_TweenService_0:Create(l_ColorCorrection_1, v135, {
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
                for v136, v137 in v53 do
                    v136.CollisionGroup = v137;
                end;
                for _, v139 in v118 do
                    v139:Disconnect();
                end;
                task.wait(5);
                l_l_AnimHelper_0_Anim_0:Stop(0);
                if l_l_AnimHelper_0_Anim_1 then
                    l_l_AnimHelper_0_Anim_1:Stop(0);
                end;
                if v43 then
                    v43:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.KO = function(v140) --[[ Line: 766 ]] --[[ Name: KO ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), v21 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy)
        local l_Character_1 = v140.Character;
        local l_Damager_1 = v140.Damager;
        local l_StartPosition_1 = v140.StartPosition;
        local l_LookVector_1 = v140.LookVector;
        local l_FirstChild_2 = l_Workspace_0.States:FindFirstChild(l_Character_1.Name);
        local l_CharacterData_1 = l_FirstChild_2:FindFirstChild("CharacterData");
        local l_PlayerData_1 = l_FirstChild_2:FindFirstChild("PlayerData");
        local l_Occupied_1 = l_FirstChild_2:FindFirstChild("Occupied");
        if not l_CharacterData_1 or not l_PlayerData_1 or not l_Occupied_1 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_1);
            local l_Humanoid_2 = l_Character_1:FindFirstChild("Humanoid");
            local v151 = l_Humanoid_2 and l_Humanoid_2:FindFirstChild("Animator");
            local l_Humanoid_3 = l_Damager_1:FindFirstChild("Humanoid");
            local v153 = l_Humanoid_3 and l_Humanoid_3:FindFirstChild("Animator");
            if not v151 or not v153 then
                return;
            else
                local v154 = l_Assets_0.DownFrames.Default:Clone();
                local v155 = l_LocalPlayer_0.Character == l_Character_1;
                local v156 = v155 or l_LocalPlayer_0.Character == l_Damager_1;
                if v156 then
                    v154.Parent = l_Common_0;
                end;
                local v157 = v21.GetAtmosphere();
                local v158 = {
                    Density = v157.Density, 
                    Color = v157.Color, 
                    Haze = v157.Haze, 
                    Glare = v157.Glare, 
                    Decay = v157.Decay
                };
                local v159 = {
                    ColorShift_Bottom = l_Lighting_0.ColorShift_Bottom, 
                    ColorShift_Top = l_Lighting_0.ColorShift_Top, 
                    OutdoorAmbient = l_Lighting_0.OutdoorAmbient, 
                    Ambient = l_Lighting_0.Ambient
                };
                local v160 = {
                    ColorShift_Bottom = Color3.fromRGB(0, 0, 0), 
                    ColorShift_Top = Color3.fromRGB(0, 0, 0), 
                    OutdoorAmbient = Color3.fromRGB(128, 128, 128), 
                    Ambient = Color3.fromRGB(138, 138, 138)
                };
                local v161 = {};
                local v162 = {};
                local v163 = {
                    "Live", 
                    "Welds"
                };
                if v156 then
                    local v164, v165 = v21.GetPartsToHide(l_Character_1, v163);
                    v161 = v164;
                    v162 = v165;
                    task.delay(0, function() --[[ Line: 824 ]]
                        -- upvalues: l_TweenService_0 (ref), v157 (copy), l_Lighting_0 (ref), v160 (copy), v162 (ref), v161 (ref)
                        l_TweenService_0:Create(v157, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Density = 0.85, 
                            Color = Color3.fromRGB(0, 0, 0), 
                            Decay = Color3.fromRGB(125, 125, 125), 
                            Haze = 20, 
                            Glare = 0.1
                        }):Play();
                        l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v160):Play();
                        for _, v167 in v162 do
                            v167.Enabled = false;
                        end;
                        task.defer(function() --[[ Line: 840 ]]
                            -- upvalues: l_TweenService_0 (ref), v161 (ref)
                            for v168 = 1, 30 do
                                local l_l_TweenService_0_Value_2 = l_TweenService_0:GetValue(v168 / 30, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                                for _, v171 in v161 do
                                    if v171.LocalTransparencyModifier < 1000 then
                                        v171.LocalTransparencyModifier = l_l_TweenService_0_Value_2;
                                    end;
                                end;
                                task.wait(0.03333333333333333);
                            end;
                        end);
                    end);
                end;
                local v172 = 3.5;
                local l_l_RayHelper_0_EnvironmentWhitelist_1 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_1, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_1, l_StartPosition_1 - l_LookVector_1, v172 + 0, l_l_RayHelper_0_EnvironmentWhitelist_1);
                local v177 = l_StartPosition_1 - l_LookVector_1 * v172;
                if l_l_RayHelper_0_RayWithWhiteList_1 then
                    v177 = l_StartPosition_1 - l_LookVector_1 * 2;
                end;
                local v178 = {};
                for _, v180 in l_Character_1:GetChildren() do
                    if v180:IsA("BasePart") and v180 ~= l_Character_1.PrimaryPart then
                        v178[v180] = v180.CollisionGroup;
                        v180.CollisionGroup = "None";
                    end;
                end;
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = true;
                end;
                for _, v182 in (v153:GetPlayingAnimationTracks()) do
                    if v182.Priority ~= Enum.AnimationPriority.Idle then
                        v182:AdjustSpeed(v182.Speed / 3);
                    end;
                end;
                local v183 = {
                    AnimId = v0.Animations.KO, 
                    FadeIn = 0.05, 
                    NameFade = 0.1, 
                    AnimSpeed = 0.22, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_2, 
                    Weight = 10000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v183);
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Character_1.PrimaryPart, 
                    DirectCopy = script.Sounds.Final
                });
                l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_1.PrimaryPart
                });
                local v185 = v155 or l_LocalPlayer_0.Character == l_Damager_1;
                task.delay(0.1, function() --[[ Line: 921 ]]
                    -- upvalues: v21 (ref)
                    v21.CreateImpactFrame({
                        Time = 0.06
                    });
                end);
                task.delay(0.7575757575757576, function() --[[ Line: 927 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_2 (copy), l_SoundHelper_0 (ref), l_Character_1 (copy), v177 (ref), l_LookVector_1 (copy), l_Workspace_0 (ref), v185 (copy), v21 (ref)
                    l_l_AnimHelper_0_Anim_2:AdjustSpeed(1);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Step
                    });
                    local v186 = script.FallSmoke:Clone();
                    v186.Position = (CFrame.lookAt(v177, v177 + l_LookVector_1) * CFrame.new(0, 0, 0)).Position - Vector3.new(0, 3, 0, 0);
                    v186.Parent = l_Workspace_0.Debris;
                    for _, v188 in v186.Particle:GetChildren() do
                        v188.Enabled = false;
                        v188:Emit(v188:GetAttribute("EmitCount"));
                    end;
                    if v185 then
                        task.defer(function() --[[ Line: 946 ]]
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
                    task.wait(1.0666666666666667);
                    if v185 then
                        task.defer(function() --[[ Line: 963 ]]
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
                    v186:Destroy();
                end);
                if v155 or l_LocalPlayer_0.Character == l_Damager_1 then
                    task.delay(0.8333333333333334, function() --[[ Line: 982 ]]
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
                local v192 = {
                    Victim = l_Character_1, 
                    LookVector = l_LookVector_1, 
                    EndPosition = v177, 
                    VictimPosition = l_PrimaryPart_1.Position, 
                    TargetVector = v177 - v177, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_1, 
                    TargetTime = 0.7575757575757576, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v192);
                if l_Occupied_1 and l_LocalPlayer_0.Character == l_Character_1 then
                    l_Occupied_1.Target.Value = l_LookVector_1;
                    l_Occupied_1.LockedOn.Value = l_Damager_1;
                end;
                local l_CameraSettings_1 = l_Workspace_0:FindFirstChild("CameraSettings");
                local _ = l_CameraSettings_1.CameraTarget;
                local _ = l_CameraSettings_1.CameraMode;
                local _ = l_CameraSettings_1.Variant;
                local _ = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                local l_Vignette_1 = l_Main_0.DownFrame.Vignette;
                local v199 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v200 = l_LocalPlayer_0.Character == l_Character_1;
                if v200 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v199, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v200 then
                    l_Occupied_1.LerpMult.Value = 0.1;
                end;
                if v200 or l_LocalPlayer_0.Character == l_Damager_1 then
                    task.defer(function() --[[ Line: 1045 ]]
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
                    local l_ColorCorrection_2 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_2.Saturation = 0;
                    l_ColorCorrection_2.Contrast = 0;
                    l_ColorCorrection_2.Enabled = true;
                    local v202 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_2, v202, {
                        Saturation = -1, 
                        Contrast = 0.5
                    }):Play();
                    local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_1.Size = 0;
                    l_MenuBlur_1.Enabled = true;
                    local v204 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_1, v204, {
                        Size = 10
                    }):Play();
                    local v205 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v205, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(0.7575757575757576, function() --[[ Line: 1079 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                end;
                local v206 = script.Particles.MainKO:Clone();
                v206.Parent = v21.GetWeldCharacter(l_Character_1).UpperTorso;
                local v207 = {
                    "HeartNormal", 
                    "HeartShatter", 
                    "HeartShatter2", 
                    "ParticleEmitter"
                };
                task.defer(function() --[[ Line: 1093 ]]
                    -- upvalues: v207 (copy), v21 (ref), l_SoundHelper_0 (ref), l_Character_1 (copy), v206 (copy)
                    for _, v209 in v207 do
                        if v209 == "ParticleEmitter" then
                            task.defer(function() --[[ Line: 1096 ]]
                                -- upvalues: v21 (ref)
                                v21.CameraShake({
                                    Preset = "HardHit", 
                                    WaitTime = 0.2, 
                                    Fade = 0.2
                                });
                            end);
                            l_SoundHelper_0:PlaySound({
                                Name = "Knockdown", 
                                Parent = l_Character_1.PrimaryPart, 
                                DirectCopy = script.Sounds.Break
                            });
                        end;
                        if v209 == "HeartNormal" then
                            task.delay(0.6, function() --[[ Line: 1144 ]]
                                -- upvalues: l_SoundHelper_0 (ref), l_Character_1 (ref)
                                l_SoundHelper_0:PlaySound({
                                    Name = "Knockdown", 
                                    Parent = l_Character_1.PrimaryPart, 
                                    DirectCopy = script.Sounds.Hit
                                });
                            end);
                        end;
                        if v206 and v206:FindFirstChild(v209) then
                            v206[v209]:Emit(1);
                            task.wait(v206[v209].Lifetime.Max - 0.03333333333333333);
                        end;
                    end;
                    task.wait(4);
                    if v206 then
                        v206:Destroy();
                    end;
                end);
                task.wait(1.4242424242424243);
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2, function() --[[ Line: 1165 ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_1:SetAttribute("GettingUp", nil);
                end);
                local v210 = tick();
                repeat
                    task.wait(0.1);
                until l_Character_1:GetAttribute("GettingUp") or not l_Character_1:IsDescendantOf(l_Workspace_0) or tick() - v210 > 10;
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                local v211 = {
                    HoldTime = 1.5
                };
                l_SoundHelper_0:PlaySound({
                    Name = "StartMatch", 
                    Parent = l_Workspace_0.Debris
                });
                task.wait(2);
                if v200 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_SoundHelper_0:PlaySound({
                        Name = "Box", 
                        Volume = 0.25, 
                        Parent = l_Workspace_0.Debris
                    });
                    if v185 then
                        task.defer(function() --[[ Line: 1202 ]]
                            -- upvalues: v21 (ref)
                            v21.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 0.2, 
                                Fade = 1
                            });
                        end);
                    end;
                    task.defer(function() --[[ Line: 1211 ]]
                        -- upvalues: v211 (copy), v154 (copy), v21 (ref)
                        v211.Image = v154.KO.K;
                        v21.TripleText(v211);
                    end);
                    task.wait(0.1);
                    task.defer(function() --[[ Line: 1217 ]]
                        -- upvalues: v211 (copy), v154 (copy), v21 (ref)
                        v211.Image = v154.KO.Dot1;
                        v21.TripleText(v211);
                    end);
                    task.wait(0.1);
                    task.defer(function() --[[ Line: 1223 ]]
                        -- upvalues: v211 (copy), v154 (copy), v21 (ref)
                        v211.Image = v154.KO.O;
                        v21.TripleText(v211);
                    end);
                    task.wait(0.1);
                    task.defer(function() --[[ Line: 1229 ]]
                        -- upvalues: v211 (copy), v154 (copy), v21 (ref)
                        v211.Image = v154.KO.Dot2;
                        v21.TripleText(v211);
                    end);
                end;
                if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                    l_Occupied_1.Target.Value = Vector3.new();
                end;
                task.wait(1.25);
                local v212 = false;
                local function v223() --[[ Line: 1240 ]] --[[ Name: Reset ]]
                    -- upvalues: v212 (ref), l_TweenService_0 (ref), v157 (copy), v158 (copy), l_Lighting_0 (ref), v159 (copy), l_Occupied_1 (copy), v200 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), l_Character_1 (copy), v178 (copy), l_l_AnimHelper_0_Anim_2 (copy), v154 (copy), l_Vignette_1 (copy), v199 (copy), v185 (copy), v161 (ref), v162 (ref)
                    if v212 then
                        return;
                    else
                        v212 = true;
                        l_TweenService_0:Create(v157, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v158):Play();
                        l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v159):Play();
                        if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                            l_Occupied_1.Target.Value = Vector3.new();
                        end;
                        if v200 then
                            l_Occupied_1.LerpMult.Value = 0;
                        end;
                        if v200 or l_LocalPlayer_0.Character == l_Damager_1 then
                            local l_ColorCorrection_3 = l_Lighting_0.ColorCorrection;
                            local v214 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                            l_TweenService_0:Create(l_ColorCorrection_3, v214, {
                                Saturation = 0, 
                                Contrast = 0
                            }):Play();
                        end;
                        if l_Damager_1 and l_Damager_1.PrimaryPart then
                            l_Damager_1.PrimaryPart.Anchored = false;
                        end;
                        if l_Character_1 and l_Character_1.PrimaryPart then
                            l_Character_1.PrimaryPart.Anchored = false;
                        end;
                        for v215, v216 in v178 do
                            v215.CollisionGroup = v216;
                        end;
                        l_l_AnimHelper_0_Anim_2:Stop(0);
                        if v154 then
                            v154:Destroy();
                        end;
                        if v200 or l_LocalPlayer_0.Character == l_Damager_1 then
                            l_TweenService_0:Create(l_Vignette_1, v199, {
                                ImageTransparency = 1
                            }):Play();
                        end;
                        if v154 then
                            v154:Destroy();
                        end;
                        if v185 then
                            task.defer(function() --[[ Line: 1281 ]]
                                -- upvalues: l_TweenService_0 (ref), v161 (ref), v162 (ref)
                                for v217 = 1, 8 do
                                    local l_l_TweenService_0_Value_3 = l_TweenService_0:GetValue(v217 / 8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                                    for _, v220 in v161 do
                                        if v220.LocalTransparencyModifier < 1000 then
                                            v220.LocalTransparencyModifier = 1 - l_l_TweenService_0_Value_3;
                                        end;
                                    end;
                                    task.wait(0.03333333333333333);
                                end;
                                for _, v222 in v162 do
                                    v222.Enabled = true;
                                end;
                            end);
                        end;
                        return;
                    end;
                end;
                local v224 = nil;
                if l_CharacterData_1 and l_CharacterData_1:FindFirstChild("Cutscene") then
                    v224 = l_CharacterData_1.Cutscene.Changed:Connect(function() --[[ Line: 1302 ]]
                        -- upvalues: v224 (ref), v223 (copy)
                        if v224 then
                            v224:Disconnect();
                        end;
                        task.wait(0.28);
                        v223();
                    end);
                end;
                task.wait(8);
                v223();
                return;
            end;
        end;
    end;
    v0.Use = function(v225) --[[ Line: 1313 ]] --[[ Name: Use ]]
        -- upvalues: v0 (copy)
        local _ = v225.Character;
        local _ = v225.Damager;
        if v225.IsKO then
            v0.KO(v225);
            return;
        else
            v0.Main(v225);
            return;
        end;
    end;
    return v0;
end;