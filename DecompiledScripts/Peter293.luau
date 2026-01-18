local v0 = {
    DelayTime = 8, 
    ServerDelayTime = 12.25, 
    Metadata = {
        DisplayName = "KNEE PAIN", 
        GlowColor = Color3.fromRGB(188, 86, 248), 
        Price = 22222
    }, 
    Animations = {
        Start = 16705600896, 
        Loop = 16705530855, 
        End = 16705623972, 
        KO = 16707465436
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
    local v22 = Random.new();
    local function _(v23, v24, v25) --[[ Line: 57 ]] --[[ Name: Lerp ]]
        return v23 + (v24 - v23) * v25;
    end;
    v0.Main = function(v27) --[[ Line: 59 ]] --[[ Name: Main ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), v21 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy), l_ReplicatedStorage_0 (copy), v22 (copy)
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
                if l_LocalPlayer_0.Character == l_Character_0 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v42.Parent = l_Common_0;
                end;
                local v43 = 3.5;
                local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_0, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_0, l_StartPosition_0 - l_LookVector_0, v43 + 1.5, l_l_RayHelper_0_EnvironmentWhitelist_0);
                local v48 = l_StartPosition_0 - l_LookVector_0 * v43;
                if l_l_RayHelper_0_RayWithWhiteList_0 then
                    v48 = l_StartPosition_0 - l_LookVector_0 * 1;
                end;
                local v49 = {};
                for _, v51 in l_Character_0:GetChildren() do
                    if v51:IsA("BasePart") and v51 ~= l_Character_0.PrimaryPart then
                        v49[v51] = v51.CollisionGroup;
                        v51.CollisionGroup = "None";
                    end;
                end;
                if not l_Character_0 or l_Character_0.PrimaryPart then

                end;
                for _, v53 in (v41:GetPlayingAnimationTracks()) do
                    if v53.Priority == Enum.AnimationPriority.Action or v53.Priority == Enum.AnimationPriority.Action2 or v53.Priority == Enum.AnimationPriority.Action3 then
                        local l_Speed_0 = v53.Speed;
                        v53:AdjustSpeed(l_Speed_0 / 1.8);
                        task.delay(1.988888888888889, function() --[[ Line: 128 ]]
                            -- upvalues: v53 (copy), l_Speed_0 (copy)
                            if not v53 then
                                return;
                            else
                                v53:AdjustSpeed(l_Speed_0);
                                return;
                            end;
                        end);
                    end;
                end;
                local v55 = {
                    AnimId = v0.Animations.Start, 
                    FadeIn = 0.05, 
                    NameFade = 0, 
                    AnimSpeed = 0.6, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = v39, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v55);
                task.delay(0.7222222222222223, function() --[[ Line: 147 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_0 (ref)
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Character_0.PrimaryPart, 
                    DirectCopy = script.Sounds.Audience
                });
                task.delay(0.33333333333333337, function() --[[ Line: 157 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (copy), l_Damager_0 (copy), v21 (ref), v42 (copy)
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.MyLeg
                    });
                    task.wait(0.4);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Crash
                    });
                    l_SoundHelper_0:PlaySound({
                        Name = "VineBoom", 
                        Parent = l_Damager_0.PrimaryPart, 
                        Volume = 0.1
                    });
                    task.defer(function() --[[ Line: 177 ]]
                        -- upvalues: v21 (ref), v42 (ref)
                        v21.TripleText({
                            Image = v42.Down
                        });
                    end);
                    task.wait(0.5);
                    l_SoundHelper_0:PlaySound({
                        Name = "Rustle2", 
                        Parent = l_Character_0.PrimaryPart, 
                        Volume = 0.5, 
                        Speed = 0.8
                    });
                end);
                task.delay(0.388888888888889, function() --[[ Line: 192 ]]
                    -- upvalues: v48 (ref), l_LookVector_0 (copy), l_Workspace_0 (ref)
                    local v57 = script.FallSmoke:Clone();
                    v57.Position = (CFrame.lookAt(v48, v48 + l_LookVector_0) * CFrame.new(0, 0, 2)).Position - Vector3.new(0, 4, 0, 0);
                    v57.Parent = l_Workspace_0.Debris;
                    for _, v59 in v57.Particle:GetChildren() do
                        v59.Enabled = false;
                        v59:Emit(v59:GetAttribute("EmitCount"));
                    end;
                    task.wait(5);
                    v57:Destroy();
                end);
                local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
                local l_CFrame_0 = l_PrimaryPart_0.CFrame;
                local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
                local v63 = {
                    Victim = l_Character_0, 
                    LookVector = l_LookVector_0, 
                    EndPosition = v48, 
                    VictimPosition = l_PrimaryPart_0.Position, 
                    TargetVector = v48 - v48, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_0, 
                    TargetTime = 0.7222222222222223, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v63);
                local v64 = script.Knockdown:Clone();
                v64.CFrame = CFrame.lookAt(l_CFrame_0.Position, v48);
                v64.Position = v64.Position + Vector3.new(0, 0.75, 0, 0);
                v64.Parent = l_Workspace_0.Debris;
                for _, v66 in v64.Particle:GetChildren() do
                    v66.Enabled = false;
                    v66:Emit(v66:GetAttribute("EmitCount"));
                end;
                task.delay(6, function() --[[ Line: 236 ]]
                    -- upvalues: v64 (copy)
                    v64:Destroy();
                end);
                if l_Occupied_0 and l_LocalPlayer_0.Character == l_Character_0 then
                    l_Occupied_0.Target.Value = l_LookVector_0;
                    l_Occupied_0.LockedOn.Value = l_Damager_0;
                end;
                local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                local l_CameraTarget_0 = l_CameraSettings_0.CameraTarget;
                local l_CameraMode_0 = l_CameraSettings_0.CameraMode;
                local l_Variant_0 = l_CameraSettings_0.Variant;
                local l_Vignette_0 = l_Main_0.DownFrame.Vignette;
                local v72 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v73 = l_LocalPlayer_0.Character == l_Character_0;
                if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v72, {
                        ImageTransparency = 0.6
                    }):Play();
                end;
                if v73 then
                    l_Occupied_0.LerpMult.Value = 0.1;
                end;
                local _ = l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_0.PrimaryPart
                });
                if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
                    task.defer(function() --[[ Line: 270 ]]
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
                    local v76 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                    l_TweenService_0:Create(l_ColorCorrection_0, v76, {
                        Saturation = 0.2, 
                        Contrast = 0.1
                    }):Play();
                    local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_0.Size = 0;
                    l_MenuBlur_0.Enabled = true;
                    local v78 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_0, v78, {
                        Size = 10
                    }):Play();
                    local v79 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v79, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(0.7222222222222223, function() --[[ Line: 304 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 1, 
                            Fade = 2
                        });
                    end);
                end;
                local v80 = l_Damager_0.Name .. "Hit";
                for _, v82 in l_Workspace_0.Debris:GetChildren() do
                    if v82.Name == v80 then
                        v82:Destroy();
                    end;
                end;
                task.wait(1.988888888888889);
                local function v92(v83, v84) --[[ Line: 322 ]] --[[ Name: SetTransparency ]]
                    -- upvalues: l_ReplicatedStorage_0 (ref), l_Workspace_0 (ref)
                    for _, v86 in v83:GetDescendants() do
                        if v86.Name == "UnusualParticle" then
                            v86.Enabled = v84 == 0;
                            if not v86.Enabled then
                                local l_Parent_1 = v86.Parent;
                                v86.Parent = l_ReplicatedStorage_0;
                                v86.Parent = l_Parent_1;
                            end;
                        end;
                        if (v86:IsA("BasePart") or v86:IsA("Decal")) and v86.LocalTransparencyModifier < 1000 then
                            v86.LocalTransparencyModifier = v84;
                        end;
                    end;
                    local l_FirstChild_1 = l_Workspace_0.Welds:FindFirstChild(v83.Name);
                    if l_FirstChild_1 then
                        for _, v90 in l_FirstChild_1:GetDescendants() do
                            if v90.Name == "UnusualParticle" then
                                v90.Enabled = v84 == 0;
                                if not v90.Enabled then
                                    local l_Parent_2 = v90.Parent;
                                    v90.Parent = l_ReplicatedStorage_0;
                                    v90.Parent = l_Parent_2;
                                end;
                            end;
                            if (v90:IsA("BasePart") or v90:IsA("Decal")) and v90.LocalTransparencyModifier < 1000 then
                                v90.LocalTransparencyModifier = v84;
                            end;
                        end;
                    end;
                end;
                v55.Priority = Enum.AnimationPriority.Action3;
                v55.AnimId = v0.Animations.Loop;
                v55.Looped = true;
                v55.AnimSpeed = 1;
                v55.FadeIn = 0.1;
                l_l_AnimHelper_0_Anim_0:Stop(1);
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v55);
                l_l_AnimHelper_0_Anim_1.Name = "Remove";
                local v95 = {
                    [1] = l_l_AnimHelper_0_Anim_1:GetMarkerReachedSignal("PlaySound"):Connect(function(v94) --[[ Line: 370 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (copy), v22 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = l_Character_0.PrimaryPart, 
                            DirectCopy = script.Sounds[v94], 
                            Speed = script.Sounds[v94].PlaybackSpeed * v22:NextNumber(0.9, 1.1)
                        });
                    end)
                };
                task.wait(1);
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2 - 2 * v27.RandomMult + v27.ExtraTime, function() --[[ Line: 381 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                local v96 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_Variant_0.Value = "Peter";
                    l_CameraMode_0.Value = "Knockdown";
                    l_CameraTarget_0.Value = l_Character_0;
                    v92(l_Damager_0, 1);
                    l_TweenService_0:Create(l_Vignette_0, v72, {
                        ImageTransparency = 0.2
                    }):Play();
                    l_TweenService_0:Create(l_Lighting_0, v96, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.2
                    }):Play();
                    task.delay(1, function() --[[ Line: 400 ]]
                        -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v96 (copy)
                        l_TweenService_0:Create(l_Lighting_0, v96, {
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
                local v97 = tick();
                repeat
                    task.wait(0.1);
                until l_Character_0:GetAttribute("GettingUp") or not l_Character_0:IsDescendantOf(l_Workspace_0) or tick() - v97 > 15;
                if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Lighting_0, v96, {
                        ExposureCompensation = workspace.Exposure.Value
                    }):Play();
                    task.delay(1, function() --[[ Line: 423 ]]
                        -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v96 (copy)
                        l_TweenService_0:Create(l_Lighting_0, v96, {
                            ExposureCompensation = workspace.Exposure.Value
                        }):Play();
                    end);
                end;
                if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v92(l_Damager_0, 0);
                    l_TweenService_0:Create(l_Vignette_0, v72, {
                        ImageTransparency = 1
                    }):Play();
                    l_CameraMode_0.Value = "";
                    l_Variant_0.Value = "";
                end;
                v55.Priority = Enum.AnimationPriority.Action4;
                v55.AnimId = v0.Animations.End;
                v55.Looped = false;
                v55.Speed = 0.8;
                v55.StopInfo = {
                    StopDelay = 1.05, 
                    StopTime = 0.4, 
                    Weight = 1
                };
                if l_l_AnimHelper_0_Anim_1 then
                    l_l_AnimHelper_0_Anim_1:Stop(0);
                end;
                l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v55);
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                task.delay(1.15, function() --[[ Line: 457 ]]
                    -- upvalues: v28 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v73 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v21 (ref), v42 (copy), l_Workspace_0 (ref)
                    print(v28 - tick());
                    l_SoundHelper_0:PlaySound({
                        Name = "BoxLayer", 
                        Parent = l_Character_0.PrimaryPart
                    });
                    if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
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
                    if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
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
                if v73 then
                    l_Occupied_0.LerpMult.Value = 0;
                end;
                if v73 or l_LocalPlayer_0.Character == l_Damager_0 then
                    local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
                    local v99 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                    l_TweenService_0:Create(l_ColorCorrection_1, v99, {
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
                for v100, v101 in v49 do
                    v100.CollisionGroup = v101;
                end;
                for _, v103 in v95 do
                    v103:Disconnect();
                end;
                task.wait(5);
                l_l_AnimHelper_0_Anim_0:Stop(0);
                if v42 then
                    v42:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.KO = function(v104) --[[ Line: 528 ]] --[[ Name: KO ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_TweenService_0 (copy), l_Main_0 (copy), v21 (copy), l_Lighting_0 (copy)
        local l_Character_1 = v104.Character;
        local l_Damager_1 = v104.Damager;
        local l_StartPosition_1 = v104.StartPosition;
        local l_LookVector_1 = v104.LookVector;
        local l_FirstChild_2 = l_Workspace_0.States:FindFirstChild(l_Character_1.Name);
        local l_CharacterData_1 = l_FirstChild_2:FindFirstChild("CharacterData");
        local l_PlayerData_1 = l_FirstChild_2:FindFirstChild("PlayerData");
        local l_Occupied_1 = l_FirstChild_2:FindFirstChild("Occupied");
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
                local v119 = 2.5;
                local l_l_RayHelper_0_EnvironmentWhitelist_1 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_1, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_1, l_StartPosition_1 - l_LookVector_1, v119 + 1.5, l_l_RayHelper_0_EnvironmentWhitelist_1);
                local v124 = l_StartPosition_1 - l_LookVector_1 * v119;
                if l_l_RayHelper_0_RayWithWhiteList_1 then
                    v124 = l_StartPosition_1 - l_LookVector_1 * 0.5;
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
                        local _ = v129.Speed;
                    end;
                end;
                local v131 = {
                    AnimId = v0.Animations.KO, 
                    FadeIn = 0.05, 
                    AnimSpeed = 0.9, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_2, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local _ = l_AnimHelper_0:CreateAnim(v131);
                task.delay(0.2962962962962963, function() --[[ Line: 607 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Character_1 (copy)
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Snap
                    });
                end);
                local v133 = l_LocalPlayer_0.Character == l_Character_1;
                if v133 or l_LocalPlayer_0.Character == l_Damager_1 then
                    task.delay(0.8333333333333334, function() --[[ Line: 618 ]]
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
                local v137 = {
                    Victim = l_Character_1, 
                    LookVector = l_LookVector_1, 
                    EndPosition = v124, 
                    VictimPosition = l_PrimaryPart_1.Position, 
                    TargetVector = v124 - v124, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_1, 
                    TargetTime = 0.4074074074074074, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v137);
                if l_Occupied_1 and l_LocalPlayer_0.Character == l_Character_1 then
                    l_Occupied_1.Target.Value = l_LookVector_1;
                    l_Occupied_1.LockedOn.Value = l_Damager_1;
                end;
                local l_CameraSettings_1 = l_Workspace_0:FindFirstChild("CameraSettings");
                local _ = l_CameraSettings_1.CameraTarget;
                local l_CameraMode_1 = l_CameraSettings_1.CameraMode;
                local l_Variant_1 = l_CameraSettings_1.Variant;
                if v133 then
                    l_CameraMode_1.Value = "Cutscene";
                    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        FieldOfView = 60
                    }):Play();
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                        CFrame = l_CurrentCamera_0.CFrame * CFrame.new(-2.8, -2.5, 3.1) * CFrame.Angles(0, 0, 0.03490658503988659)
                    }):Play();
                end;
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
                local _ = l_SoundHelper_0:PlaySound({
                    Name = "VineBoom", 
                    Parent = l_Damager_1.PrimaryPart
                });
                if v145 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Audience
                    });
                    task.defer(function() --[[ Line: 702 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 1, 
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
                    local v148 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_2, v148, {
                        Saturation = -0.3, 
                        Contrast = 0.2
                    }):Play();
                    local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_1.Size = 0;
                    l_MenuBlur_1.Enabled = true;
                    local v150 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_1, v150, {
                        Size = 10
                    }):Play();
                    local v151 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v151, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(0.4074074074074074, function() --[[ Line: 736 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                end;
                task.wait(0.4074074074074074);
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2 - 2 * v104.RandomMult, function() --[[ Line: 747 ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_1:SetAttribute("GettingUp", nil);
                end);
                if v145 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v144, {
                        ImageTransparency = 1
                    }):Play();
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                local v152 = {
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
                    task.defer(function() --[[ Line: 782 ]]
                        -- upvalues: v152 (copy), v118 (copy), v21 (ref)
                        v152.Image = v118.KO.K;
                        v21.TripleText(v152);
                    end);
                end;
                if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                    l_Occupied_1.Target.Value = Vector3.new();
                end;
                task.wait(1.25);
                if v145 then
                    l_Occupied_1.LerpMult.Value = 0;
                end;
                task.delay(2, function() --[[ Line: 796 ]]
                    -- upvalues: v145 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), l_CameraMode_1 (copy), l_Variant_1 (copy)
                    if v145 or l_LocalPlayer_0.Character == l_Damager_1 then
                        l_CameraMode_1.Value = "";
                        l_Variant_1.Value = "";
                    end;
                end);
                for v153, v154 in v125 do
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
                if l_Damager_1 and l_Damager_1.PrimaryPart then
                    l_Damager_1.PrimaryPart.Anchored = false;
                end;
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = false;
                end;
                if v118 then
                    v118:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.Use = function(v155) --[[ Line: 828 ]] --[[ Name: Use ]]
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