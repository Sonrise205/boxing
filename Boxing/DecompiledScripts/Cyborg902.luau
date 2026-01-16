local v0 = {
    DelayTime = 8, 
    ServerDelayTime = 11.2, 
    Metadata = {
        DisplayName = "CYBORG", 
        GlowColor = Color3.fromRGB(93, 240, 248), 
        Price = 79999
    }, 
    Animations = {
        Start = 16728914680, 
        Loop = 16728929255, 
        End = 16729025131, 
        KO = 16735715591
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
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), v21 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), l_ReplicatedStorage_0 (copy)
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
            local v38 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
            local l_Humanoid_1 = l_Damager_0:FindFirstChild("Humanoid");
            local v40 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
            if not v38 or not v40 then
                return;
            else
                local v41 = l_Assets_0.DownFrames.Default:Clone();
                local v42 = l_LocalPlayer_0.Character == l_Character_0;
                if v42 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v41.Parent = l_Common_0;
                end;
                local v43 = v42 or l_LocalPlayer_0.Character == l_Damager_0;
                local v44 = 3;
                local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_0, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_0, l_StartPosition_0 - l_LookVector_0, v44 + 0, l_l_RayHelper_0_EnvironmentWhitelist_0);
                local v49 = l_StartPosition_0 - l_LookVector_0 * v44;
                if l_l_RayHelper_0_RayWithWhiteList_0 then
                    v49 = l_StartPosition_0 - l_LookVector_0 * 1;
                end;
                local v50 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v42 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Lighting_0, v50, {
                        ExposureCompensation = l_Workspace_0.Exposure.Value - 0.1
                    }):Play();
                end;
                task.delay(0.7857142857142857, function() --[[ Line: 113 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (copy), v49 (ref), l_LookVector_0 (copy), l_Workspace_0 (ref), v42 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v21 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref)
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Clank
                    });
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Metal
                    });
                    local v51 = script.FallSmoke:Clone();
                    v51.Position = (CFrame.lookAt(v49, v49 + l_LookVector_0) * CFrame.new(0, 0, 1.5)).Position - Vector3.new(0, 2.8499999046325684, 0, 0);
                    v51.Parent = l_Workspace_0.Debris;
                    for _, v53 in v51.Particle:GetChildren() do
                        v53.Enabled = false;
                        v53:Emit(v53:GetAttribute("EmitCount"));
                    end;
                    if v42 or l_LocalPlayer_0.Character == l_Damager_0 then
                        task.defer(function() --[[ Line: 136 ]]
                            -- upvalues: v21 (ref)
                            v21.CameraShake({
                                Preset = "Knockdown", 
                                WaitTime = 0.3, 
                                Fade = 1, 
                                FoV = 55, 
                                FoVMult = 1
                            });
                        end);
                        local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
                        l_ColorCorrection_0.Saturation = 0;
                        l_ColorCorrection_0.Contrast = 0;
                        l_ColorCorrection_0.Enabled = true;
                        local v55 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_ColorCorrection_0, v55, {
                            Saturation = -1, 
                            Contrast = 0.5
                        }):Play();
                        local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_0.Size = 0;
                        l_MenuBlur_0.Enabled = true;
                        local v57 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_0, v57, {
                            Size = 10
                        }):Play();
                        v21.HUDShake({
                            Scale = 20, 
                            Damper = 0.09999999999999999
                        });
                    end;
                    task.wait(8);
                    v51:Destroy();
                end);
                local v58 = {};
                for _, v60 in l_Character_0:GetChildren() do
                    if v60:IsA("BasePart") and v60 ~= l_Character_0.PrimaryPart then
                        v58[v60] = v60.CollisionGroup;
                        v60.CollisionGroup = "None";
                    end;
                end;
                if not l_Character_0 or l_Character_0.PrimaryPart then

                end;
                for _, v62 in (v40:GetPlayingAnimationTracks()) do
                    if v62.Priority == Enum.AnimationPriority.Action or v62.Priority == Enum.AnimationPriority.Action2 or v62.Priority == Enum.AnimationPriority.Action3 then
                        local l_Speed_0 = v62.Speed;
                        v62:AdjustSpeed(l_Speed_0 / 1.8);
                        task.delay(0.9523809523809523, function() --[[ Line: 191 ]]
                            -- upvalues: v62 (copy), l_Speed_0 (copy)
                            if not v62 then
                                return;
                            else
                                v62:AdjustSpeed(l_Speed_0);
                                return;
                            end;
                        end);
                    end;
                end;
                local v64 = {
                    AnimId = v0.Animations.Start, 
                    FadeIn = 0.05, 
                    NameFade = 0.1, 
                    AnimSpeed = 1.05, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = v38, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v64);
                task.delay(0.3333333333333333, function() --[[ Line: 210 ]]
                    -- upvalues: v21 (ref), v41 (copy)
                    v21.TripleText({
                        Image = v41.Down, 
                        HoldTime = 0.6666666666666666
                    });
                end);
                task.delay(0.9523809523809523, function() --[[ Line: 217 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_0 (copy)
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.7);
                end);
                local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
                local l_CFrame_0 = l_PrimaryPart_0.CFrame;
                local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
                local v69 = {
                    Victim = l_Character_0, 
                    LookVector = l_LookVector_0, 
                    EndPosition = v49, 
                    VictimPosition = l_PrimaryPart_0.Position, 
                    TargetVector = v49 - v49, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_0, 
                    TargetTime = 0.9523809523809523, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v69);
                local v70 = script.Knockdown:Clone();
                v70.CFrame = CFrame.lookAt(l_CFrame_0.Position, v49);
                v70.Position = v70.Position + Vector3.new(0, 0.75, 0, 0);
                v70.Parent = l_Workspace_0.Debris;
                for _, v72 in v70.Particle:GetChildren() do
                    v72.Enabled = false;
                    v72:Emit(v72:GetAttribute("EmitCount"));
                end;
                task.delay(6, function() --[[ Line: 251 ]]
                    -- upvalues: v70 (copy)
                    v70:Destroy();
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
                local v78 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v42 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v78, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v42 then
                    l_Occupied_0.LerpMult.Value = 0.1;
                end;
                task.wait(0.869047619047619);
                local function v88(v79, v80) --[[ Line: 285 ]] --[[ Name: SetTransparency ]]
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
                v64.Priority = Enum.AnimationPriority.Action3;
                v64.AnimId = v0.Animations.Loop;
                v64.Looped = true;
                v64.AnimSpeed = 1;
                local v89 = nil;
                task.delay(1, function() --[[ Line: 328 ]]
                    -- upvalues: v89 (ref), l_AnimHelper_0 (ref), v64 (copy)
                    v89 = l_AnimHelper_0:CreateAnim(v64);
                    v89.Name = "Remove";
                end);
                local v90 = v0.DelayTime - l_Workspace_0.Ping.Value / 2 - 2 * v27.RandomMult + v27.ExtraTime;
                task.defer(function() --[[ Line: 337 ]]
                    -- upvalues: l_Workspace_0 (ref), v49 (ref), l_LookVector_0 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v21 (ref), v90 (copy)
                    local v91 = script.Lightning:Clone();
                    v91.Parent = l_Workspace_0.Debris;
                    v91.CFrame = CFrame.lookAt(v49, v49 + l_LookVector_0) * CFrame.new(0, -1, 2.5);
                    local function v94() --[[ Line: 342 ]] --[[ Name: EmitLightning ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (ref), v91 (copy), v21 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = l_Character_0.PrimaryPart, 
                            DirectCopy = script.Sounds.Lightning
                        });
                        task.defer(function() --[[ Line: 349 ]]
                            -- upvalues: v91 (ref), v21 (ref)
                            for _, v93 in v91:GetChildren() do
                                v93:Emit(v93:GetAttribute("EmitCount"));
                            end;
                            v21.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 0.15, 
                                Fade = 0.4
                            });
                        end);
                    end;
                    task.wait(v90 - 4);
                    v94();
                    task.wait(3);
                    v94();
                    task.wait(1.25);
                    v94();
                    task.wait(8);
                    v91:Destroy();
                end);
                task.defer(function() --[[ Line: 373 ]]
                    -- upvalues: v21 (ref), l_Character_0 (copy), v42 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v27 (copy), v0 (ref)
                    v21.DownCount({
                        Character = l_Character_0, 
                        IsBillboard = not (v42 or l_LocalPlayer_0.Character == l_Damager_0), 
                        Speed = v27.ExtraTime / (v0.DelayTime + v27.ExtraTime)
                    });
                end);
                task.delay(v90, function() --[[ Line: 381 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                if v42 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_Variant_0.Value = "Match";
                    l_CameraMode_0.Value = "Knockdown";
                    l_CameraTarget_0.Value = l_Character_0;
                    v88(l_Damager_0, 1);
                    l_TweenService_0:Create(l_Vignette_0, v78, {
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
                local v96 = tick();
                local v97 = {};
                repeat
                    task.wait(0.1);
                until l_Character_0:GetAttribute("GettingUp") or not l_Character_0:IsDescendantOf(l_Workspace_0) or tick() - v96 > 15;
                v64.Priority = Enum.AnimationPriority.Action4;
                v64.AnimId = v0.Animations.End;
                v64.Looped = false;
                v64.AnimSpeed = 0.7;
                v64.FadeIn = 0.1;
                v64.NameFade = 0.1;
                v64.StopInfo = {
                    StopDelay = 0.4666666666666666, 
                    StopTime = 0.4, 
                    Weight = 1
                };
                if v89 then
                    v89:Stop(0);
                end;
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v64);
                local v99 = {};
                for _, v101 in script.Particles:GetChildren() do
                    if v101.Name == "Thruster" then
                        local v102 = v101:Clone();
                        v102.Parent = v21.GetWeldCharacter(l_Character_0).UpperTorso;
                        for _, v104 in v102:GetChildren() do
                            v104.TimeScale = 0;
                        end;
                        table.insert(v99, v102);
                    end;
                end;
                task.delay(0.15, function() --[[ Line: 448 ]]
                    -- upvalues: v99 (copy)
                    for v105 = 1, 80 do
                        for _, v107 in v99 do
                            for _, v109 in v107:GetChildren() do
                                v109.TimeScale = v105 / 80;
                            end;
                        end;
                        task.wait(0.03333333333333333);
                    end;
                end);
                local v110 = l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_LocalPlayer_0.Character == l_Damager_0 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                    DirectCopy = script.Sounds.Rockets
                });
                task.delay(1.3095238095238095, function() --[[ Line: 467 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_LocalPlayer_0 (ref), l_Damager_0 (copy), l_Workspace_0 (ref), l_Character_0 (copy), l_TweenService_0 (ref), v110 (copy), v21 (ref), v99 (copy), v43 (copy), l_Lighting_0 (ref)
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_LocalPlayer_0.Character == l_Damager_0 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Explosion
                    });
                    l_TweenService_0:Create(v110, TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Volume = 0
                    }):Play();
                    local v111 = script.Particles.Explosion:Clone();
                    v111.Parent = v21.GetWeldCharacter(l_Character_0).UpperTorso;
                    for _, v113 in v99 do
                        for _, v115 in v113:GetChildren() do
                            v115.Enabled = false;
                        end;
                    end;
                    for _, v117 in v111:GetChildren() do
                        v117:Emit(v117:GetAttribute("EmitCount"));
                    end;
                    if v43 then
                        task.defer(function() --[[ Line: 490 ]]
                            -- upvalues: v21 (ref)
                            v21.CameraShake({
                                Preset = "Knockdown", 
                                WaitTime = 0.2, 
                                Fade = 0.9, 
                                FoV = 60, 
                                FoVMult = 1
                            });
                        end);
                    end;
                    local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_1.Saturation = 0;
                    l_ColorCorrection_1.Contrast = 0;
                    l_ColorCorrection_1.Enabled = true;
                    local v119 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_1, v119, {
                        Saturation = -1, 
                        Contrast = 0.2
                    }):Play();
                    local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_1.Size = 0;
                    l_MenuBlur_1.Enabled = true;
                    local v121 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_1, v121, {
                        Size = 10
                    }):Play();
                    local v122 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v122, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.wait(8);
                    v111:Destroy();
                    for _, v124 in v99 do
                        v124:Destroy();
                    end;
                end);
                if v42 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v88(l_Damager_0, 0);
                    l_TweenService_0:Create(l_Vignette_0, v78, {
                        ImageTransparency = 1
                    }):Play();
                    l_CameraMode_0.Value = "";
                    l_Variant_0.Value = "";
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                task.delay(0.44999999999999996, function() --[[ Line: 543 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (copy), v42 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), l_Workspace_0 (ref), v21 (ref), v41 (copy)
                    l_SoundHelper_0:PlaySound({
                        Name = "BoxLayer", 
                        Parent = l_Character_0.PrimaryPart
                    });
                    task.wait(0.2);
                    if v42 or l_LocalPlayer_0.Character == l_Damager_0 then
                        l_SoundHelper_0:PlaySound({
                            Name = "Box", 
                            Parent = l_Workspace_0.Debris
                        });
                    end;
                    task.wait(0.9);
                    if v42 or l_LocalPlayer_0.Character == l_Damager_0 then
                        task.defer(function() --[[ Line: 560 ]]
                            -- upvalues: v21 (ref)
                            v21.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 0.1, 
                                Fade = 0.5
                            });
                        end);
                        v21.TripleText({
                            Image = v41.Box, 
                            HoldTime = 0.6666666666666666
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
                if v42 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Lighting_0, v50, {
                        ExposureCompensation = l_Workspace_0.Exposure.Value
                    }):Play();
                end;
                if v42 then
                    l_Occupied_0.LerpMult.Value = 0;
                end;
                if v42 or l_LocalPlayer_0.Character == l_Damager_0 then
                    local l_ColorCorrection_2 = l_Lighting_0.ColorCorrection;
                    local v126 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                    l_TweenService_0:Create(l_ColorCorrection_2, v126, {
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
                for v127, v128 in v58 do
                    v127.CollisionGroup = v128;
                end;
                for _, v130 in v97 do
                    v130:Disconnect();
                end;
                task.wait(5);
                l_l_AnimHelper_0_Anim_0:Stop(0);
                l_l_AnimHelper_0_Anim_1:Stop(0);
                if v41 then
                    v41:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.KO = function(v131) --[[ Line: 621 ]] --[[ Name: KO ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), v21 (copy), l_SoundHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_TweenService_0 (copy), l_Main_0 (copy), l_Lighting_0 (copy)
        local l_Character_1 = v131.Character;
        local l_Damager_1 = v131.Damager;
        local l_StartPosition_1 = v131.StartPosition;
        local l_LookVector_1 = v131.LookVector;
        local l_FirstChild_2 = l_Workspace_0.States:FindFirstChild(l_Character_1.Name);
        local l_CharacterData_1 = l_FirstChild_2:FindFirstChild("CharacterData");
        local l_PlayerData_1 = l_FirstChild_2:FindFirstChild("PlayerData");
        local l_Occupied_1 = l_FirstChild_2:FindFirstChild("Occupied");
        if not l_CharacterData_1 or not l_PlayerData_1 or not l_Occupied_1 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_1);
            local l_Humanoid_2 = l_Character_1:FindFirstChild("Humanoid");
            local v142 = l_Humanoid_2 and l_Humanoid_2:FindFirstChild("Animator");
            local l_Humanoid_3 = l_Damager_1:FindFirstChild("Humanoid");
            local v144 = l_Humanoid_3 and l_Humanoid_3:FindFirstChild("Animator");
            if not v142 or not v144 then
                return;
            else
                local v145 = l_Assets_0.DownFrames.Default:Clone();
                local v146 = l_LocalPlayer_0.Character == l_Character_1;
                if v146 or l_LocalPlayer_0.Character == l_Damager_1 then
                    v145.Parent = l_Common_0;
                end;
                if not v146 then
                    local _ = l_LocalPlayer_0.Character == l_Damager_1;
                end;
                local v148 = 2;
                local l_l_RayHelper_0_EnvironmentWhitelist_1 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_1, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_1, l_StartPosition_1 - l_LookVector_1, v148 + 0, l_l_RayHelper_0_EnvironmentWhitelist_1);
                local v153 = l_StartPosition_1 - l_LookVector_1 * v148;
                if l_l_RayHelper_0_RayWithWhiteList_1 then
                    v153 = l_StartPosition_1 - l_LookVector_1 * 0.1;
                end;
                local v154 = {};
                for _, v156 in l_Character_1:GetChildren() do
                    if v156:IsA("BasePart") and v156 ~= l_Character_1.PrimaryPart then
                        v154[v156] = v156.CollisionGroup;
                        v156.CollisionGroup = "None";
                    end;
                end;
                if not l_Character_1 or l_Character_1.PrimaryPart then

                end;
                local l_v144_PlayingAnimationTracks_0 = v144:GetPlayingAnimationTracks();
                for _, v159 in l_v144_PlayingAnimationTracks_0 do
                    if v159.Priority ~= Enum.AnimationPriority.Idle then
                        v159:AdjustSpeed(v159.Speed / 3);
                    end;
                end;
                task.delay(0.5555555555555556, function() --[[ Line: 690 ]]
                    -- upvalues: l_v144_PlayingAnimationTracks_0 (copy)
                    for _, v161 in l_v144_PlayingAnimationTracks_0 do
                        if v161.Priority ~= Enum.AnimationPriority.Idle then
                            v161:AdjustSpeed(v161.Speed * 3);
                        end;
                    end;
                end);
                local v162 = {
                    AnimId = v0.Animations.KO, 
                    FadeIn = 0.05, 
                    AnimSpeed = 0.9, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_2, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local _ = l_AnimHelper_0:CreateAnim(v162);
                for _, v165 in script.Lightning:GetChildren() do
                    local v166 = v165:Clone();
                    v166.Parent = v21.GetWeldCharacter(l_Character_1).PrimaryPart;
                    v166.Enabled = true;
                    task.delay(1.4, function() --[[ Line: 714 ]]
                        -- upvalues: v166 (copy)
                        v166.Enabled = false;
                        task.wait(2);
                        v166:Destroy();
                    end);
                end;
                for _, v168 in script.Smoke:GetChildren() do
                    local v169 = v168:Clone();
                    v169.Parent = v21.GetWeldCharacter(l_Character_1).UpperTorso;
                    v169.Enabled = true;
                    task.delay(6, function() --[[ Line: 727 ]]
                        -- upvalues: v169 (copy)
                        v169.Enabled = false;
                        task.wait(5);
                        v169:Destroy();
                    end);
                end;
                local v170 = l_LocalPlayer_0.Character == l_Character_1;
                if v170 or l_LocalPlayer_0.Character == l_Damager_1 then
                    task.delay(0.8333333333333334, function() --[[ Line: 738 ]]
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
                    Name = "Knockdown", 
                    Parent = l_Character_1.PrimaryPart, 
                    DirectCopy = script.Sounds.Lightning
                });
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Character_1.PrimaryPart, 
                    DirectCopy = script.Sounds.PowerDown
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
                task.delay(1.2962962962962963, function() --[[ Line: 785 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Character_1 (copy), v170 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), v21 (ref), l_Workspace_0 (ref), l_LookVector_1 (copy), v153 (ref), l_PrimaryPart_1 (copy), l_SimulateKnockbackBE_0 (ref), l_CameraMode_2 (copy), l_TweenService_0 (ref)
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Clank
                    });
                    if v170 or l_LocalPlayer_0.Character == l_Damager_1 then
                        task.delay(0.3333333333333333, function() --[[ Line: 793 ]]
                            -- upvalues: v21 (ref)
                            task.defer(function() --[[ Line: 794 ]]
                                -- upvalues: v21 (ref)
                                v21.CameraShake({
                                    Preset = "HardHit", 
                                    WaitTime = 0.2, 
                                    Fade = 0.8
                                });
                            end);
                            v21.HUDShake({
                                Scale = 20, 
                                Damper = 0.09999999999999999
                            });
                        end);
                    end;
                    local l_l_Workspace_0_ServerTimeNow_1 = l_Workspace_0:GetServerTimeNow();
                    local v179 = {
                        Victim = l_Character_1, 
                        LookVector = l_LookVector_1, 
                        EndPosition = v153, 
                        VictimPosition = l_PrimaryPart_1.Position, 
                        TargetVector = v153 - v153, 
                        StartTime = l_l_Workspace_0_ServerTimeNow_1, 
                        TargetTime = 0.5555555555555556, 
                        HitIndex = 3
                    };
                    l_SimulateKnockbackBE_0:Fire(v179);
                    if v170 then
                        l_CameraMode_2.Value = "Cutscene";
                        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FieldOfView = 60
                        }):Play();
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                            CFrame = l_CurrentCamera_0.CFrame * CFrame.new(-3.1, -2, 4.7) * CFrame.Angles(0, 0, 0.06981317007977318)
                        }):Play();
                    end;
                end);
                local l_Vignette_1 = l_Main_0.DownFrame.Vignette;
                local v182 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v183 = l_LocalPlayer_0.Character == l_Character_1;
                if v183 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v182, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v183 then
                    l_Occupied_1.LerpMult.Value = 0.1;
                end;
                if v183 or l_LocalPlayer_0.Character == l_Damager_1 then
                    task.defer(function() --[[ Line: 852 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "Knockdown", 
                            WaitTime = 0.2, 
                            Fade = 1.5, 
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
                    local v185 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_3, v185, {
                        Saturation = -1, 
                        Contrast = 0.5
                    }):Play();
                    local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_2.Size = 0;
                    l_MenuBlur_2.Enabled = true;
                    local v187 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_2, v187, {
                        Size = 10
                    }):Play();
                    local v188 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v188, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(0.5555555555555556, function() --[[ Line: 886 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                end;
                task.wait(0.7407407407407407);
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2 - 2 * v131.RandomMult, function() --[[ Line: 897 ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_1:SetAttribute("GettingUp", nil);
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                local v189 = {
                    HoldTime = 1.5
                };
                l_SoundHelper_0:PlaySound({
                    Name = "StartMatch", 
                    Parent = l_Workspace_0.Debris
                });
                task.wait(2);
                if v183 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_SoundHelper_0:PlaySound({
                        Name = "Box", 
                        Volume = 0.25, 
                        Parent = l_Workspace_0.Debris
                    });
                    task.defer(function() --[[ Line: 928 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.4, 
                            Fade = 1
                        });
                    end);
                    task.defer(function() --[[ Line: 936 ]]
                        -- upvalues: v189 (copy), v145 (copy), v21 (ref)
                        v189.Image = v145.KO.K;
                        v21.TripleText(v189);
                    end);
                    task.wait(0.1);
                    task.defer(function() --[[ Line: 942 ]]
                        -- upvalues: v189 (copy), v145 (copy), v21 (ref)
                        v189.Image = v145.KO.Dot1;
                        v21.TripleText(v189);
                    end);
                    task.wait(0.1);
                    task.defer(function() --[[ Line: 948 ]]
                        -- upvalues: v189 (copy), v145 (copy), v21 (ref)
                        v189.Image = v145.KO.O;
                        v21.TripleText(v189);
                    end);
                    task.wait(0.1);
                    task.defer(function() --[[ Line: 954 ]]
                        -- upvalues: v189 (copy), v145 (copy), v21 (ref)
                        v189.Image = v145.KO.Dot2;
                        v21.TripleText(v189);
                    end);
                end;
                if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                    l_Occupied_1.Target.Value = Vector3.new();
                end;
                local v190 = false;
                task.wait(1.25);
                if v183 then
                    l_Occupied_1.LerpMult.Value = 0;
                end;
                task.delay(2, function() --[[ Line: 970 ]]
                    -- upvalues: v183 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), l_CameraMode_2 (copy), l_Variant_1 (copy)
                    if v183 or l_LocalPlayer_0.Character == l_Damager_1 then
                        l_CameraMode_2.Value = "";
                        l_Variant_1.Value = "";
                    end;
                end);
                for v191, v192 in v154 do
                    v191.CollisionGroup = v192;
                end;
                task.wait(5);
                if v183 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v182, {
                        ImageTransparency = 1
                    }):Play();
                end;
                task.wait(5);
                v190 = true;
                if l_Damager_1 and l_Damager_1.PrimaryPart then
                    l_Damager_1.PrimaryPart.Anchored = false;
                end;
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = false;
                end;
                if v145 then
                    v145:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.Use = function(v193) --[[ Line: 1001 ]] --[[ Name: Use ]]
        -- upvalues: v0 (copy)
        local _ = v193.Character;
        local _ = v193.Damager;
        if v193.IsKO then
            v0.KO(v193);
            return;
        else
            v0.Main(v193);
            return;
        end;
    end;
    return v0;
end;