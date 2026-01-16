local v0 = {
    DelayTime = 8.833333333333334, 
    ServerDelayTime = 12.6, 
    Metadata = {
        DisplayName = "YAKUZA", 
        GlowColor = Color3.fromRGB(81, 248, 100), 
        Price = 49999
    }, 
    Animations = {
        Start = 16883910457, 
        Loop = 16885186464, 
        End = 16883079186, 
        KO = 16883910457, 
        Camera = 16884412159
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
    local function _(v24, v25, v26) --[[ Line: 59 ]] --[[ Name: Lerp ]]
        return v24 + (v25 - v24) * v26;
    end;
    local _ = require(l_ReplicatedStorage_0:WaitForChild("NumberSequenceTween"));
    v0.Main = function(v29) --[[ Line: 63 ]] --[[ Name: Main ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), l_SoundHelper_0 (copy), v0 (copy), v22 (copy), l_AnimHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), l_TweenService_0 (copy), l_ReplicatedStorage_0 (copy), l_RunService_0 (copy), l_Lighting_0 (copy)
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
                local v45 = v44 or l_LocalPlayer_0.Character == l_Damager_0;
                local v46 = 0.1;
                local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_0, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_0, l_StartPosition_0 - l_LookVector_0, v46 + 0, l_l_RayHelper_0_EnvironmentWhitelist_0);
                local v51 = l_StartPosition_0 - l_LookVector_0 * v46;
                if l_l_RayHelper_0_RayWithWhiteList_0 then
                    v51 = l_StartPosition_0 - l_LookVector_0 * 0.1;
                end;
                local v52 = script.CameraRig:Clone();
                v52.Parent = l_Workspace_0.Debris;
                v52:SetPrimaryPartCFrame(CFrame.new(v51, l_StartPosition_0) * CFrame.new(0, -3, 0.82) * CFrame.Angles(0, 1.5707963267948966, 0));
                if v45 then
                    local function v54(v53) --[[ Line: 113 ]] --[[ Name: Count ]]
                        -- upvalues: v52 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        v52.Torso.Particle[v53]:Emit(1);
                        v52.Torso.Particle.Orb:Emit(1);
                        v52.Torso.Particle.Shine:Emit(1);
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = l_Workspace_0.Debris, 
                            DirectCopy = script.Sounds.Count
                        });
                    end;
                    local l_v54_0 = v54 --[[ copy: 26 -> 71 ]];
                    task.delay(3, function() --[[ Line: 125 ]]
                        -- upvalues: l_v54_0 (copy)
                        l_v54_0(3);
                        task.wait(2.5);
                        l_v54_0(2);
                        task.wait(2.5);
                        l_v54_0(1);
                    end);
                end;
                v51 = v51 + Vector3.new(0, 0.699999988079071, 0, 0);
                local v56 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v57 = {};
                for _, v59 in l_Character_0:GetChildren() do
                    if v59:IsA("BasePart") and v59 ~= l_Character_0.PrimaryPart then
                        v57[v59] = v59.CollisionGroup;
                        v59.CollisionGroup = "None";
                    end;
                end;
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = true;
                end;
                for _, v61 in (v42:GetPlayingAnimationTracks()) do
                    if v61.Priority == Enum.AnimationPriority.Action or v61.Priority == Enum.AnimationPriority.Action2 or v61.Priority == Enum.AnimationPriority.Action3 then
                        local l_Speed_0 = v61.Speed;
                        v61:AdjustSpeed(l_Speed_0 / 3);
                        task.delay(2.5, function() --[[ Line: 167 ]]
                            -- upvalues: v61 (copy), l_Speed_0 (copy)
                            if not v61 then
                                return;
                            else
                                v61:AdjustSpeed(l_Speed_0);
                                return;
                            end;
                        end);
                    end;
                end;
                local v63 = {
                    AnimId = v0.Animations.Start, 
                    FadeIn = 0.5, 
                    NameFade = 0.3, 
                    AnimSpeed = 0.2, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = v40, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local v64 = {
                    AnimId = v0.Animations.Camera, 
                    AnimSpeed = 0.2, 
                    Animator = v52.Humanoid.Animator
                };
                local v65 = {};
                local v66 = {};
                local v67 = {
                    "Live", 
                    "Welds"
                };
                if v45 then
                    local v68, v69 = v22.GetPartsToHide(l_Character_0, v67);
                    v65 = v68;
                    v66 = v69;
                end;
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v63);
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v64);
                task.delay(0.3333333333333333, function() --[[ Line: 201 ]]
                    -- upvalues: v22 (ref), v43 (copy)
                    v22.TripleText({
                        Image = v43.Down, 
                        HoldTime = 0.6666666666666666
                    });
                end);
                task.delay(0.625, function() --[[ Line: 208 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), l_SoundHelper_0 (ref), v45 (copy), l_Workspace_0 (ref), l_Character_0 (copy), v51 (ref), l_LookVector_0 (copy), v22 (ref)
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
                    l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
                    task.wait(0.15625);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v45 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Metal
                    });
                    local v72 = script.FallSmoke:Clone();
                    v72.Position = (CFrame.lookAt(v51, v51 + l_LookVector_0) * CFrame.new(0, 0, 3.5)).Position - Vector3.new(0, 4.300000190734863, 0, 0);
                    v72.Parent = l_Workspace_0.Debris;
                    for _, v74 in v72.Particle:GetChildren() do
                        v74.Enabled = false;
                        v74:Emit(v74:GetAttribute("EmitCount"));
                    end;
                    if v45 then
                        task.defer(function() --[[ Line: 230 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.3, 
                                Fade = 2
                            });
                        end);
                        v22.HUDShake({
                            Scale = 20, 
                            Damper = 0.09999999999999999
                        });
                    end;
                    task.wait(8);
                    v72:Destroy();
                end);
                local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
                local l_CFrame_0 = l_PrimaryPart_0.CFrame;
                local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
                local v78 = {
                    Victim = l_Character_0, 
                    LookVector = l_LookVector_0, 
                    EndPosition = v51, 
                    VictimPosition = l_PrimaryPart_0.Position, 
                    TargetVector = v51 - v51, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_0, 
                    TargetTime = 1.25, 
                    HitIndex = 3
                };
                print(v78);
                l_SimulateKnockbackBE_0:Fire(v78);
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2 + v29.ExtraTime, function() --[[ Line: 268 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                local v79 = script.Knockdown:Clone();
                v79.CFrame = CFrame.lookAt(l_CFrame_0.Position, v51);
                v79.Position = v79.Position + Vector3.new(0, 0.75, 0, 0);
                v79.Parent = l_Workspace_0.Debris;
                for _, v81 in v79.Particle:GetChildren() do
                    v81.Enabled = false;
                    v81:Emit(v81:GetAttribute("EmitCount"));
                end;
                task.delay(6, function() --[[ Line: 285 ]]
                    -- upvalues: v79 (copy)
                    v79:Destroy();
                end);
                local v82 = l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = v45 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                    DirectCopy = script.Sounds.Song
                });
                if not v45 then
                    v82.Volume = v82.Volume / 2;
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_0.PrimaryPart
                });
                if l_Occupied_0 and l_LocalPlayer_0.Character == l_Character_0 then
                    l_Occupied_0.Target.Value = l_LookVector_0;
                    l_Occupied_0.LockedOn.Value = l_Damager_0;
                end;
                local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                local _ = l_CameraSettings_0.CameraTarget;
                local l_CameraMode_0 = l_CameraSettings_0.CameraMode;
                local l_Variant_0 = l_CameraSettings_0.Variant;
                local l_Vignette_0 = l_Main_0.DownFrame.Vignette;
                local v88 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v88, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v44 then
                    l_Occupied_0.LerpMult.Value = 0.1;
                end;
                local function v98(v89, v90) --[[ Line: 325 ]] --[[ Name: SetTransparency ]]
                    -- upvalues: l_ReplicatedStorage_0 (ref), l_Workspace_0 (ref)
                    for _, v92 in v89:GetDescendants() do
                        if v92.Name == "UnusualParticle" then
                            v92.Enabled = v90 == 0;
                            if not v92.Enabled then
                                local l_Parent_1 = v92.Parent;
                                v92.Parent = l_ReplicatedStorage_0;
                                v92.Parent = l_Parent_1;
                            end;
                        end;
                        if (v92:IsA("BasePart") or v92:IsA("Decal")) and v92.LocalTransparencyModifier < 1000 then
                            v92.LocalTransparencyModifier = v90;
                        end;
                    end;
                    local l_FirstChild_1 = l_Workspace_0.Welds:FindFirstChild(v89.Name);
                    if l_FirstChild_1 then
                        for _, v96 in l_FirstChild_1:GetDescendants() do
                            if v96.Name == "UnusualParticle" then
                                v96.Enabled = v90 == 0;
                                if not v96.Enabled then
                                    local l_Parent_2 = v96.Parent;
                                    v96.Parent = l_ReplicatedStorage_0;
                                    v96.Parent = l_Parent_2;
                                end;
                            end;
                            if (v96:IsA("BasePart") or v96:IsA("Decal")) and v96.LocalTransparencyModifier < 1000 then
                                v96.LocalTransparencyModifier = v90;
                            end;
                        end;
                    end;
                end;
                local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                local v100 = v22.GetAtmosphere();
                local v101 = {};
                if v100 then
                    v101 = {
                        Density = v100.Density, 
                        Color = v100.Color, 
                        Decay = v100.Decay, 
                        Haze = v100.Haze
                    };
                end;
                if v45 then
                    task.delay(0.9333333333333333, function() --[[ Line: 377 ]]
                        -- upvalues: l_CameraMode_0 (copy), l_RunService_0 (ref), l_CurrentCamera_0 (copy), v52 (copy), l_TweenService_0 (ref), v98 (copy), l_Damager_0 (copy), l_Vignette_0 (copy), v88 (copy), v100 (copy), v65 (ref), l_LocalPlayer_0 (ref), v22 (ref), l_Humanoid_1 (copy), l_LookVector_0 (copy)
                        l_CameraMode_0.Value = "Cutscene";
                        l_RunService_0:BindToRenderStep("CameraRig", Enum.RenderPriority.Camera.Value + 6, function(_) --[[ Line: 380 ]]
                            -- upvalues: l_CurrentCamera_0 (ref), v52 (ref)
                            l_CurrentCamera_0.CFrame = v52.Torso.CFrame;
                        end);
                        task.defer(function() --[[ Line: 384 ]]
                            -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_0 (ref)
                            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                FieldOfView = 35
                            }):Play();
                        end);
                        v98(l_Damager_0, 1);
                        l_TweenService_0:Create(l_Vignette_0, v88, {
                            ImageTransparency = 0.2
                        }):Play();
                        l_TweenService_0:Create(v100, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Density = 1, 
                            Color = Color3.fromRGB(34, 61, 76), 
                            Decay = Color3.fromRGB(110, 57, 125), 
                            Haze = 20
                        }):Play();
                        for v103 = 1, 20 do
                            local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v103 / 20, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                            for _, v106 in v65 do
                                if v106.LocalTransparencyModifier < 1000 then
                                    v106.LocalTransparencyModifier = l_l_TweenService_0_Value_0;
                                end;
                            end;
                            task.wait(0.03333333333333333);
                        end;
                        if l_LocalPlayer_0.Character == l_Damager_0 then
                            v22.KnockdownWalk({
                                Damager = l_Damager_0, 
                                DamagerHumanoid = l_Humanoid_1, 
                                LookVector = l_LookVector_0
                            });
                        end;
                    end);
                end;
                local v107 = script.Smoke:Clone();
                v107.Parent = v45 and l_Workspace_0.Debris or nil;
                v107.CFrame = CFrame.lookAt(v51, v51 + l_LookVector_0) * CFrame.new(0, -4, 0);
                local v108 = tick();
                task.wait(2.5);
                for _, v110 in v66 do
                    v110.Enabled = false;
                end;
                l_l_AnimHelper_0_Anim_0.Priority = Enum.AnimationPriority.Action2;
                v63.Priority = Enum.AnimationPriority.Action2;
                v63.AnimId = v0.Animations.Loop;
                v63.Looped = true;
                v63.AnimSpeed = 1;
                v63.NameFade = 0.1;
                local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v63);
                if l_l_AnimHelper_0_Anim_2 then
                    l_l_AnimHelper_0_Anim_2.Name = "Remove";
                end;
                task.wait(0.16666666666666666);
                local v112 = 9.166666666666666 - (tick() - v108);
                if v45 then
                    task.delay(v112 - 0.05, function() --[[ Line: 447 ]]
                        -- upvalues: v22 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (copy)
                        task.defer(function() --[[ Line: 448 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.3, 
                                Fade = 1
                            });
                        end);
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.36666666666666664, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FieldOfView = 40
                        }):Play();
                        task.wait(0.36666666666666664);
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FieldOfView = 30
                        }):Play();
                        task.wait(0.43333333333333335);
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FieldOfView = 70
                        }):Play();
                    end);
                end;
                local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_Damager_0:SetAttribute("CurrentEmote", nil);
                local _ = tick();
                local v115 = {};
                task.wait(v112);
                v107.Attachment.Glow.Enabled = false;
                local v116 = script.Particles.TorsoSpark:Clone();
                local v117 = script.Particles.TorsoSpark2:Clone();
                local v118 = script.Particles.Aura:Clone();
                local v119 = script.Particles.Ring:Clone();
                local v120 = script.Particles.Particle:Clone();
                local v121 = v22.GetWeldCharacter(l_Character_0);
                v116.Parent = v121.UpperTorso;
                v117.Parent = v121.UpperTorso;
                v120.Parent = v121.PrimaryPart;
                v118.Parent = v121.UpperTorso;
                v119.Parent = v121.UpperTorso;
                v116:Emit(50);
                v117:Emit(50);
                v118:Emit(20);
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Character_0.PrimaryPart, 
                    DirectCopy = script.Sounds.Heal
                });
                task.delay(0.48333333333333334, function() --[[ Line: 504 ]]
                    -- upvalues: v117 (copy), v118 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v22 (ref), v45 (copy), l_Lighting_0 (ref), l_TweenService_0 (ref), v100 (copy), v101 (ref), v65 (ref), v66 (ref)
                    v117.Enabled = true;
                    task.wait(0.18333333333333332);
                    v118.Enabled = true;
                    l_SoundHelper_0:PlaySound({
                        Name = "Rustle1", 
                        Parent = l_Character_0.PrimaryPart, 
                        Volume = 0.9, 
                        Speed = 0.8
                    });
                    task.wait(0.5833333333333334);
                    v117.Enabled = false;
                    v118.Enabled = false;
                    task.defer(function() --[[ Line: 520 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.5, 
                            Fade = 2
                        });
                    end);
                    if v45 then
                        local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
                        l_ColorCorrection_0.Saturation = 0;
                        l_ColorCorrection_0.Contrast = 0;
                        l_ColorCorrection_0.Enabled = true;
                        local v123 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_ColorCorrection_0, v123, {
                            Saturation = -1, 
                            Contrast = 0.5
                        }):Play();
                        local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_0.Size = 0;
                        l_MenuBlur_0.Enabled = true;
                        local v125 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_0, v125, {
                            Size = 10
                        }):Play();
                        local v126 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_Lighting_0, v126, {
                            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                        }):Play();
                        l_TweenService_0:Create(v100, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v101):Play();
                        for v127 = 1, 8 do
                            local l_l_TweenService_0_Value_1 = l_TweenService_0:GetValue(v127 / 8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                            for _, v130 in v65 do
                                if v130.LocalTransparencyModifier < 1000 then
                                    v130.LocalTransparencyModifier = 1 - l_l_TweenService_0_Value_1;
                                end;
                            end;
                            task.wait(0.03333333333333333);
                        end;
                        for _, v132 in v66 do
                            v132.Enabled = true;
                        end;
                    end;
                end);
                task.delay(1.35, function() --[[ Line: 567 ]]
                    -- upvalues: v120 (copy), v116 (copy)
                    v120.GroundSmoke:Emit(1);
                    v120.Crescent:Emit(5);
                    v120.Spark2:Emit(25);
                    v116:Emit(50);
                end);
                task.delay(2.1666666666666665, function() --[[ Line: 575 ]]
                    -- upvalues: v118 (copy), v116 (copy), v117 (copy)
                    v118:Emit(15);
                    v116:Emit(25);
                    v117:Emit(25);
                end);
                v63.Priority = Enum.AnimationPriority.Action3;
                v63.AnimId = v0.Animations.End;
                v63.Looped = false;
                v63.AnimSpeed = 1;
                v63.FadeIn = 0.3;
                v63.NameFade = 0.5;
                v63.StopInfo = {
                    StopDelay = 2.4666666666666663, 
                    StopTime = 0.5, 
                    Weight = 1
                };
                local l_l_AnimHelper_0_Anim_3 = l_AnimHelper_0:CreateAnim(v63);
                task.delay(0.8333333333333334, function() --[[ Line: 597 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_2 (copy), v107 (copy), l_Workspace_0 (ref), l_Character_0 (copy), l_LookVector_0 (copy), v51 (ref), l_PrimaryPart_0 (copy), l_SimulateKnockbackBE_0 (ref)
                    if l_l_AnimHelper_0_Anim_0 then
                        l_l_AnimHelper_0_Anim_0:Stop(0.1);
                    end;
                    if l_l_AnimHelper_0_Anim_2 then
                        l_l_AnimHelper_0_Anim_2:Stop(0.1);
                    end;
                    for _, v135 in v107:GetDescendants() do
                        if v135:IsA("ParticleEmitter") then
                            v135.Enabled = false;
                        end;
                    end;
                    local l_l_Workspace_0_ServerTimeNow_1 = l_Workspace_0:GetServerTimeNow();
                    local v137 = {
                        Victim = l_Character_0, 
                        LookVector = l_LookVector_0, 
                        EndPosition = v51 - Vector3.new(0, 0.699999988079071, 0, 0), 
                        VictimPosition = l_PrimaryPart_0.Position, 
                        TargetVector = v51 - v51, 
                        StartTime = l_l_Workspace_0_ServerTimeNow_1, 
                        TargetTime = 0.6666666666666666, 
                        HitIndex = 3
                    };
                    print(v137);
                    l_SimulateKnockbackBE_0:Fire(v137);
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                task.delay(1.8055555555555556, function() --[[ Line: 631 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (copy), v44 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), l_Workspace_0 (ref), v45 (copy), v22 (ref), v43 (copy)
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
                    if v45 then
                        v22.TripleText({
                            Image = v43.Box, 
                            HoldTime = 0.6666666666666666
                        });
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.1, 
                            Fade = 0.5
                        });
                    end;
                end);
                if l_Damager_0 and l_Damager_0.PrimaryPart then
                    l_Damager_0.PrimaryPart.Anchored = true;
                end;
                task.wait(2.1666666666666665);
                if v45 then
                    v98(l_Damager_0, 0);
                    l_TweenService_0:Create(l_Vignette_0, v88, {
                        ImageTransparency = 1
                    }):Play();
                    task.defer(function() --[[ Line: 670 ]]
                        -- upvalues: v44 (copy), v22 (ref), l_RunService_0 (ref), l_CameraMode_0 (copy), l_Variant_0 (copy), v52 (copy)
                        if v44 then
                            task.delay(0.3, function() --[[ Line: 672 ]]
                                -- upvalues: v22 (ref)
                                v22.CameraShake({
                                    Preset = "Knockdown", 
                                    WaitTime = 0.15, 
                                    Fade = 0.5, 
                                    FoV = 65, 
                                    FoVMult = 1
                                });
                            end);
                            task.wait(v44 and 0 or 0.7);
                        end;
                        l_RunService_0:UnbindFromRenderStep("CameraRig");
                        l_CameraMode_0.Value = "";
                        l_Variant_0.Value = "";
                        if v52 then
                            v52:Destroy();
                        end;
                    end);
                end;
                if l_Occupied_0 and l_Occupied_0:FindFirstChild("Target") then
                    l_Occupied_0.Target.Value = Vector3.new();
                end;
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Lighting_0, v56, {
                        ExposureCompensation = l_Workspace_0.Exposure.Value
                    }):Play();
                end;
                if v44 then
                    l_Occupied_0.LerpMult.Value = 0;
                end;
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
                    local v139 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                    l_TweenService_0:Create(l_ColorCorrection_1, v139, {
                        Saturation = 0, 
                        Contrast = 0
                    }):Play();
                end;
                for v140, v141 in v57 do
                    v140.CollisionGroup = v141;
                end;
                for _, v143 in v115 do
                    v143:Disconnect();
                end;
                if l_Damager_0 and l_Damager_0.PrimaryPart then
                    l_Damager_0.PrimaryPart.Anchored = false;
                end;
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = false;
                end;
                task.wait(5);
                if l_l_AnimHelper_0_Anim_0 then
                    l_l_AnimHelper_0_Anim_0:Stop(0.1);
                end;
                if l_l_AnimHelper_0_Anim_2 then
                    l_l_AnimHelper_0_Anim_2:Stop(0.1);
                end;
                if l_l_AnimHelper_0_Anim_3 then
                    l_l_AnimHelper_0_Anim_3:Stop(0.1);
                end;
                if v43 then
                    v43:Destroy();
                end;
                if v52 then
                    v52:Destroy();
                end;
                v107:Destroy();
                v116:Destroy();
                v117:Destroy();
                v120:Destroy();
                v118:Destroy();
                v119:Destroy();
                return;
            end;
        end;
    end;
    v0.KO = function(v144) --[[ Line: 743 ]] --[[ Name: KO ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), v22 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), l_Main_0 (copy), l_TweenService_0 (copy), l_ReplicatedStorage_0 (copy), l_RunService_0 (copy), l_Lighting_0 (copy)
        local l_Character_1 = v144.Character;
        local l_Damager_1 = v144.Damager;
        local l_StartPosition_1 = v144.StartPosition;
        local l_LookVector_1 = v144.LookVector;
        local l_FirstChild_2 = l_Workspace_0.States:FindFirstChild(l_Character_1.Name);
        local l_CharacterData_1 = l_FirstChild_2:FindFirstChild("CharacterData");
        local l_PlayerData_1 = l_FirstChild_2:FindFirstChild("PlayerData");
        local l_Occupied_1 = l_FirstChild_2:FindFirstChild("Occupied");
        if not l_CharacterData_1 or not l_PlayerData_1 or not l_Occupied_1 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_1);
            local l_Humanoid_2 = l_Character_1:FindFirstChild("Humanoid");
            local v155 = l_Humanoid_2 and l_Humanoid_2:FindFirstChild("Animator");
            local l_Humanoid_3 = l_Damager_1:FindFirstChild("Humanoid");
            local v157 = l_Humanoid_3 and l_Humanoid_3:FindFirstChild("Animator");
            if not v155 or not v157 then
                return;
            else
                local v158 = l_Assets_0.DownFrames.Yakuza:Clone();
                local v159 = l_LocalPlayer_0.Character == l_Character_1;
                if v159 or l_LocalPlayer_0.Character == l_Damager_1 then
                    v158.Parent = l_Common_0;
                end;
                local v160 = v159 or l_LocalPlayer_0.Character == l_Damager_1;
                local v161 = 0.1;
                local l_l_RayHelper_0_EnvironmentWhitelist_1 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_1, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_1, l_StartPosition_1 - l_LookVector_1, v161 + 0, l_l_RayHelper_0_EnvironmentWhitelist_1);
                local v166 = l_StartPosition_1 - l_LookVector_1 * v161;
                if l_l_RayHelper_0_RayWithWhiteList_1 then
                    v166 = l_StartPosition_1 - l_LookVector_1 * 0.1;
                end;
                local v167 = script.CameraRig:Clone();
                v167.Parent = l_Workspace_0.Debris;
                v167:SetPrimaryPartCFrame(CFrame.new(v166, l_StartPosition_1) * CFrame.new(0, -3.5, 0.82) * CFrame.Angles(0, 1.5707963267948966, 0));
                v166 = v166 + Vector3.new(0, 0.699999988079071, 0, 0);
                local v168 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v169 = {};
                for _, v171 in l_Character_1:GetChildren() do
                    if v171:IsA("BasePart") and v171 ~= l_Character_1.PrimaryPart then
                        v169[v171] = v171.CollisionGroup;
                        v171.CollisionGroup = "None";
                    end;
                end;
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = true;
                end;
                for _, v173 in (v157:GetPlayingAnimationTracks()) do
                    if v173.Priority == Enum.AnimationPriority.Action or v173.Priority == Enum.AnimationPriority.Action2 or v173.Priority == Enum.AnimationPriority.Action3 then
                        local l_Speed_1 = v173.Speed;
                        v173:AdjustSpeed(l_Speed_1 / 3);
                        task.delay(3.75, function() --[[ Line: 823 ]]
                            -- upvalues: v173 (copy), l_Speed_1 (copy)
                            if not v173 then
                                return;
                            else
                                v173:AdjustSpeed(l_Speed_1);
                                return;
                            end;
                        end);
                    end;
                end;
                local v175 = {
                    AnimId = v0.Animations.Start, 
                    FadeIn = 0.05, 
                    NameFade = 0.1, 
                    AnimSpeed = 0.1, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = v155, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local v176 = {
                    AnimId = v0.Animations.Camera, 
                    AnimSpeed = 0.1, 
                    Animator = v167.Humanoid.Animator
                };
                local v177 = {};
                local v178 = {};
                local v179 = {
                    "Live", 
                    "Welds"
                };
                if v160 then
                    local v180, v181 = v22.GetPartsToHide(l_Character_1, v179);
                    v177 = v180;
                    v178 = v181;
                end;
                local l_l_AnimHelper_0_Anim_4 = l_AnimHelper_0:CreateAnim(v175);
                local _ = l_AnimHelper_0:CreateAnim(v176);
                task.delay(1.25, function() --[[ Line: 857 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_4 (copy), l_SoundHelper_0 (ref), v160 (copy), l_Workspace_0 (ref), l_Character_1 (copy), v166 (ref), l_LookVector_1 (copy), v22 (ref)
                    l_l_AnimHelper_0_Anim_4:AdjustSpeed(0.2);
                    task.wait(0.3125);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v160 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Metal
                    });
                    local v184 = script.FallSmoke:Clone();
                    v184.Position = (CFrame.lookAt(v166, v166 + l_LookVector_1) * CFrame.new(0, 0, 3.5)).Position - Vector3.new(0, 4.300000190734863, 0, 0);
                    v184.Parent = l_Workspace_0.Debris;
                    for _, v186 in v184.Particle:GetChildren() do
                        v186.Enabled = false;
                        v186:Emit(v186:GetAttribute("EmitCount"));
                    end;
                    if v160 then
                        task.defer(function() --[[ Line: 877 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.3, 
                                Fade = 2
                            });
                        end);
                        v22.HUDShake({
                            Scale = 20, 
                            Damper = 0.09999999999999999
                        });
                    end;
                    task.wait(7);
                    l_l_AnimHelper_0_Anim_4:Stop(0);
                    v184:Destroy();
                end);
                local l_PrimaryPart_1 = l_Character_1.PrimaryPart;
                local l_CFrame_1 = l_PrimaryPart_1.CFrame;
                local l_l_Workspace_0_ServerTimeNow_2 = l_Workspace_0:GetServerTimeNow();
                local _ = {
                    Victim = l_Character_1, 
                    LookVector = l_LookVector_1, 
                    EndPosition = v166, 
                    VictimPosition = l_PrimaryPart_1.Position, 
                    TargetVector = v166 - v166, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_2, 
                    TargetTime = 2.5, 
                    HitIndex = 3
                };
                local v191 = script.Knockdown:Clone();
                v191.CFrame = CFrame.lookAt(l_CFrame_1.Position, v166);
                v191.Position = v191.Position + Vector3.new(0, 0.75, 0, 0);
                v191.Parent = l_Workspace_0.Debris;
                for _, v193 in v191.Particle:GetChildren() do
                    v193.Enabled = false;
                    v193:Emit(v193:GetAttribute("EmitCount"));
                end;
                task.delay(6, function() --[[ Line: 925 ]]
                    -- upvalues: v191 (copy)
                    v191:Destroy();
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_1.PrimaryPart
                });
                task.defer(function() --[[ Line: 934 ]]
                    -- upvalues: v22 (ref)
                    v22.CameraShake({
                        Preset = "Knockdown", 
                        WaitTime = 0.2, 
                        Fade = 1, 
                        FoV = 55, 
                        FoVMult = 1
                    });
                end);
                if l_Occupied_1 and l_LocalPlayer_0.Character == l_Character_1 then
                    l_Occupied_1.Target.Value = l_LookVector_1;
                    l_Occupied_1.LockedOn.Value = l_Damager_1;
                end;
                local l_CameraSettings_1 = l_Workspace_0:FindFirstChild("CameraSettings");
                local _ = l_CameraSettings_1.CameraTarget;
                local l_CameraMode_1 = l_CameraSettings_1.CameraMode;
                local l_Variant_1 = l_CameraSettings_1.Variant;
                local l_Vignette_1 = l_Main_0.DownFrame.Vignette;
                local v199 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v159 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v199, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v159 then
                    l_Occupied_1.LerpMult.Value = 0.1;
                end;
                local function v209(v200, v201) --[[ Line: 966 ]] --[[ Name: SetTransparency ]]
                    -- upvalues: l_ReplicatedStorage_0 (ref), l_Workspace_0 (ref)
                    for _, v203 in v200:GetDescendants() do
                        if v203.Name == "UnusualParticle" then
                            v203.Enabled = v201 == 0;
                            if not v203.Enabled then
                                local l_Parent_3 = v203.Parent;
                                v203.Parent = l_ReplicatedStorage_0;
                                v203.Parent = l_Parent_3;
                            end;
                        end;
                        if (v203:IsA("BasePart") or v203:IsA("Decal")) and v203.LocalTransparencyModifier < 1000 then
                            v203.LocalTransparencyModifier = v201;
                        end;
                    end;
                    local l_FirstChild_3 = l_Workspace_0.Welds:FindFirstChild(v200.Name);
                    if l_FirstChild_3 then
                        for _, v207 in l_FirstChild_3:GetDescendants() do
                            if v207.Name == "UnusualParticle" then
                                v207.Enabled = v201 == 0;
                                if not v207.Enabled then
                                    local l_Parent_4 = v207.Parent;
                                    v207.Parent = l_ReplicatedStorage_0;
                                    v207.Parent = l_Parent_4;
                                end;
                            end;
                            if (v207:IsA("BasePart") or v207:IsA("Decal")) and v207.LocalTransparencyModifier < 1000 then
                                v207.LocalTransparencyModifier = v201;
                            end;
                        end;
                    end;
                end;
                local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
                local v211 = v22.GetAtmosphere();
                local v212 = {
                    Density = v211.Density, 
                    Color = v211.Color, 
                    Decay = v211.Decay, 
                    Haze = v211.Haze
                };
                if v160 then
                    task.delay(0.9333333333333333, function() --[[ Line: 1014 ]]
                        -- upvalues: l_CameraMode_1 (copy), l_RunService_0 (ref), l_CurrentCamera_1 (copy), v167 (copy), l_TweenService_0 (ref), v209 (copy), l_Damager_1 (copy), l_Vignette_1 (copy), v199 (copy), v211 (copy), v178 (ref), v177 (ref)
                        l_CameraMode_1.Value = "Cutscene";
                        l_RunService_0:BindToRenderStep("CameraRig", Enum.RenderPriority.Camera.Value + 6, function(_) --[[ Line: 1017 ]]
                            -- upvalues: l_CurrentCamera_1 (ref), v167 (ref)
                            l_CurrentCamera_1.CFrame = v167.Torso.CFrame;
                        end);
                        task.defer(function() --[[ Line: 1021 ]]
                            -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_1 (ref)
                            l_TweenService_0:Create(l_CurrentCamera_1, TweenInfo.new(4.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                FieldOfView = 35
                            }):Play();
                        end);
                        v209(l_Damager_1, 1);
                        l_TweenService_0:Create(l_Vignette_1, v199, {
                            ImageTransparency = 0.2
                        }):Play();
                        l_TweenService_0:Create(v211, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Density = 1, 
                            Color = Color3.fromRGB(46, 25, 77), 
                            Decay = Color3.fromRGB(125, 125, 125), 
                            Haze = 20
                        }):Play();
                        for _, v215 in v178 do
                            v215.Enabled = false;
                        end;
                        for v216 = 1, 20 do
                            local l_l_TweenService_0_Value_2 = l_TweenService_0:GetValue(v216 / 20, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                            for _, v219 in v177 do
                                if v219.LocalTransparencyModifier < 1000 then
                                    v219.LocalTransparencyModifier = l_l_TweenService_0_Value_2;
                                end;
                            end;
                            task.wait(0.03333333333333333);
                        end;
                    end);
                end;
                local v220 = script.Smoke:Clone();
                v220.Parent = v160 and l_Workspace_0.Debris or nil;
                v220.CFrame = CFrame.lookAt(v166, v166 + l_LookVector_1) * CFrame.new(0, -4, 0);
                if v160 then
                    task.delay(0.3, function() --[[ Line: 1058 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = l_Workspace_0.Debris, 
                            DirectCopy = script.Sounds.GameOver
                        });
                    end);
                    task.delay(1, function() --[[ Line: 1066 ]]
                        -- upvalues: v22 (ref), v158 (copy), l_TweenService_0 (ref)
                        v22.TripleText({
                            Image = v158.KO, 
                            HoldTime = 1.5, 
                            TweenSpeed = 1
                        });
                        v158.KO.ImageTransparency = 1;
                        v158.KO.Visible = true;
                        v158.Glow.ImageTransparency = 1;
                        v158.Glow.Visible = true;
                        l_TweenService_0:Create(v158, TweenInfo.new(8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            BackgroundTransparency = 0
                        }):Play();
                        l_TweenService_0:Create(v158.KO, TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            ImageTransparency = 0
                        }):Play();
                        task.wait(0.5);
                        l_TweenService_0:Create(v158.Glow, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, -1, true), {
                            ImageTransparency = 0
                        }):Play();
                    end);
                end;
                local _ = tick();
                task.wait(3.75);
                for _, v223 in v178 do
                    v223.Enabled = false;
                end;
                local v224 = false;
                local function v235() --[[ Line: 1095 ]] --[[ Name: Reset ]]
                    -- upvalues: v224 (ref), v22 (ref), v209 (copy), l_Character_1 (copy), l_Occupied_1 (copy), v159 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v168 (copy), l_Workspace_0 (ref), v160 (copy), l_Vignette_1 (copy), v199 (copy), l_RunService_0 (ref), l_CameraMode_1 (copy), l_Variant_1 (copy), v169 (copy), l_l_AnimHelper_0_Anim_4 (copy), v158 (copy), v167 (copy), v211 (copy), v212 (copy), v177 (ref), v178 (ref)
                    if v224 then
                        return;
                    else
                        v224 = true;
                        task.defer(function() --[[ Line: 1099 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.5, 
                                Fade = 2
                            });
                        end);
                        v209(l_Character_1, 0);
                        if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                            l_Occupied_1.Target.Value = Vector3.new();
                        end;
                        if v159 or l_LocalPlayer_0.Character == l_Damager_1 then
                            l_TweenService_0:Create(l_Lighting_0, v168, {
                                ExposureCompensation = l_Workspace_0.Exposure.Value
                            }):Play();
                        end;
                        if v159 then
                            l_Occupied_1.LerpMult.Value = 0;
                        end;
                        if v159 or l_LocalPlayer_0.Character == l_Damager_1 then
                            local l_ColorCorrection_2 = l_Lighting_0.ColorCorrection;
                            local v226 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                            l_TweenService_0:Create(l_ColorCorrection_2, v226, {
                                Saturation = 0, 
                                Contrast = 0
                            }):Play();
                        end;
                        if v160 then
                            v209(l_Damager_1, 0);
                            l_TweenService_0:Create(l_Vignette_1, v199, {
                                ImageTransparency = 1
                            }):Play();
                            task.defer(function() --[[ Line: 1129 ]]
                                -- upvalues: v160 (ref), v22 (ref), l_RunService_0 (ref), l_CameraMode_1 (ref), l_Variant_1 (ref)
                                if v160 then
                                    task.delay(0.3, function() --[[ Line: 1131 ]]
                                        -- upvalues: v22 (ref)
                                        v22.CameraShake({
                                            Preset = "Knockdown", 
                                            WaitTime = 0.15, 
                                            Fade = 0.5, 
                                            FoV = 65, 
                                            FoVMult = 1
                                        });
                                    end);
                                end;
                                l_RunService_0:UnbindFromRenderStep("CameraRig");
                                l_CameraMode_1.Value = "";
                                l_Variant_1.Value = "";
                            end);
                        end;
                        if l_Damager_1 and l_Damager_1.PrimaryPart then
                            l_Damager_1.PrimaryPart.Anchored = false;
                        end;
                        if l_Character_1 and l_Character_1.PrimaryPart then
                            l_Character_1.PrimaryPart.Anchored = false;
                        end;
                        for v227, v228 in v169 do
                            v227.CollisionGroup = v228;
                        end;
                        l_l_AnimHelper_0_Anim_4:Stop(0);
                        if v158 then
                            v158:Destroy();
                        end;
                        if v167 then
                            v167:Destroy();
                        end;
                        if v159 or l_LocalPlayer_0.Character == l_Damager_1 then
                            l_TweenService_0:Create(l_Vignette_1, v199, {
                                ImageTransparency = 1
                            }):Play();
                        end;
                        if v158 then
                            v158:Destroy();
                        end;
                        if v160 then
                            task.defer(function() --[[ Line: 1173 ]]
                                -- upvalues: l_TweenService_0 (ref), v211 (ref), v212 (ref), v177 (ref), v178 (ref)
                                l_TweenService_0:Create(v211, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v212):Play();
                                for v229 = 1, 8 do
                                    local l_l_TweenService_0_Value_3 = l_TweenService_0:GetValue(v229 / 8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                                    for _, v232 in v177 do
                                        if v232.LocalTransparencyModifier < 1000 then
                                            v232.LocalTransparencyModifier = 1 - l_l_TweenService_0_Value_3;
                                        end;
                                    end;
                                    task.wait(0.03333333333333333);
                                end;
                                for _, v234 in v178 do
                                    v234.Enabled = true;
                                end;
                            end);
                        end;
                        return;
                    end;
                end;
                task.delay(2.5, function() --[[ Line: 1195 ]]
                    -- upvalues: v220 (copy)
                    for _, v237 in v220:GetDescendants() do
                        if v237:IsA("ParticleEmitter") then
                            v237.Enabled = false;
                        end;
                    end;
                    task.wait(5);
                    v220:Destroy();
                end);
                local v238 = nil;
                if l_CharacterData_1 and l_CharacterData_1:FindFirstChild("Cutscene") then
                    v238 = l_CharacterData_1.Cutscene.Changed:Connect(function() --[[ Line: 1207 ]]
                        -- upvalues: v238 (ref), v235 (copy)
                        if v238 then
                            v238:Disconnect();
                        end;
                        task.wait(0.28);
                        v235();
                    end);
                end;
                task.wait(8);
                v235();
                return;
            end;
        end;
    end;
    v0.Use = function(v239) --[[ Line: 1218 ]] --[[ Name: Use ]]
        -- upvalues: v0 (copy)
        local _ = v239.Character;
        local _ = v239.Damager;
        if v239.IsKO then
            v0.KO(v239);
            return;
        else
            v0.Main(v239);
            return;
        end;
    end;
    return v0;
end;