local v0 = {
    DelayTime = 6.6, 
    ServerDelayTime = 10.5, 
    RandomTime = 0, 
    Metadata = {
        DisplayName = "LIBERATION", 
        GlowColor = Color3.fromRGB(105, 95, 220), 
        Price = 89999
    }, 
    Animations = {
        Knock = 18496777316, 
        KO = 18504563573
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
    local _ = require(l_ReplicatedStorage_0:WaitForChild("NumberSequenceTween"));
    v0.Main = function(v28) --[[ Line: 62 ]] --[[ Name: Main ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_SoundHelper_0 (copy), v21 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy), l_Main_0 (copy), l_ReplicatedStorage_0 (copy)
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
                        task.delay(0.625, function() --[[ Line: 132 ]]
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
                    AnimId = v0.Animations.Knock, 
                    FadeIn = 0.05, 
                    NameFade = 0.1, 
                    AnimSpeed = 0.4, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = v40, 
                    Weight = 1000, 
                    Looped = false, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v59);
                local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
                local _ = l_PrimaryPart_0.CFrame;
                local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
                local v64 = {
                    Victim = l_Character_0, 
                    LookVector = l_LookVector_0, 
                    EndPosition = v51 + Vector3.new(0, 0.800000011920929, 0, 0), 
                    VictimPosition = l_PrimaryPart_0.Position, 
                    TargetVector = v51 - v51, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_0, 
                    TargetTime = 0.016666666666666666, 
                    HitIndex = 3
                };
                local l_Head_0 = l_Character_0.Head;
                local l_PrimaryPart_1 = l_Character_0.PrimaryPart;
                local l_UpperTorso_0 = l_Character_0.UpperTorso;
                local v68 = {};
                for _, v70 in script.Particles.Head:GetChildren() do
                    v70 = v70:Clone();
                    table.insert(v68, v70);
                    v70.Parent = l_Head_0;
                end;
                for _, v72 in script.Particles.HumanoidRootPart:GetChildren() do
                    v72 = v72:Clone();
                    table.insert(v68, v72);
                    v72.Parent = l_PrimaryPart_1;
                end;
                for _, v74 in script.Particles.UpperTorso:GetChildren() do
                    v74 = v74:Clone();
                    table.insert(v68, v74);
                    v74.Parent = l_UpperTorso_0;
                end;
                local l_Crescent_0 = l_UpperTorso_0.PunchFX.Crescent;
                local l_Dash_0 = l_UpperTorso_0.PunchFX.Dash;
                local l_Smoke_0 = l_UpperTorso_0.PunchFX.Smoke;
                local l_LandDash_0 = l_UpperTorso_0.LandDash;
                local _ = l_PrimaryPart_1.Wind.Wind3;
                local l_LandWind_0 = l_PrimaryPart_1.Fall.LandWind;
                local l_LandRing_0 = l_PrimaryPart_1.Fall.LandRing;
                local l_LandSmoke_0 = l_PrimaryPart_1.Fall.LandSmoke;
                local l_Pebbles_0 = l_PrimaryPart_1.Fall.Pebbles;
                local l_Orbs_0 = l_UpperTorso_0.Heart.Orbs;
                local l_Ring_0 = l_UpperTorso_0.Heart.Ring;
                local l_Lightning_0 = l_UpperTorso_0.Heart.Lightning;
                local l_Lightning2_0 = l_UpperTorso_0.Heart.Lightning2;
                local l_Lightning3_0 = l_UpperTorso_0.Heart.Lightning3;
                local l_LightningBurst_0 = l_UpperTorso_0.Heart.LightningBurst;
                local l_LightningBurst2_0 = l_UpperTorso_0.Heart.LightningBurst2;
                local l_Laughter_0 = l_Head_0.Laughter;
                local l_MuscleL_0 = l_Head_0.MuscleL;
                local l_MuscleR_0 = l_Head_0.MuscleR;
                local l_Moon_0 = l_UpperTorso_0.Moon.Moon;
                local l_ChromeAbbreviation_0 = l_UpperTorso_0.Moon.ChromeAbbreviation;
                local l_Stars_0 = l_UpperTorso_0.Moon.Stars;
                local l_Orb_0 = l_UpperTorso_0.Moon.Orb;
                local l_Smokes2_0 = l_PrimaryPart_1.Wind.Smokes2;
                local l_GetupWind_0 = l_PrimaryPart_1.Wind.GetupWind;
                local l_Wind3_1 = l_PrimaryPart_1.Wind.Wind3;
                local _ = l_UpperTorso_0.BodySmoke;
                local l_BodySmoke2_0 = l_UpperTorso_0.BodySmoke2;
                local l_SmokeBurst_0 = l_UpperTorso_0.SmokeBurst;
                local v104 = script.Particles.LightningPart:Clone();
                v104.CFrame = l_Character_0.UpperTorso.CFrame;
                v104.Parent = l_Workspace_0.Debris;
                table.insert(v68, v104);
                local l_NormalLightning_0 = v104.NormalLightning;
                local l_BlackLightning_0 = v104.BlackLightning;
                task.defer(function() --[[ Line: 245 ]]
                    -- upvalues: l_Crescent_0 (copy), l_Dash_0 (copy), l_Smoke_0 (copy), l_Wind3_1 (copy)
                    l_Crescent_0:Emit(8);
                    l_Dash_0:Emit(20);
                    l_Smoke_0:Emit(15);
                    task.wait(0.13333333333333333);
                    l_Wind3_1:Emit(1);
                    task.wait(0.13333333333333333);
                    l_Wind3_1:Emit(1);
                    task.wait(0.13333333333333333);
                    l_Wind3_1:Emit(1);
                end);
                local v107 = {};
                v107[#v107 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("KB1"):Connect(function() --[[ Line: 261 ]]
                    -- upvalues: l_SimulateKnockbackBE_0 (ref), v64 (copy), l_Character_0 (copy)
                    l_SimulateKnockbackBE_0:Fire(v64);
                    if l_Character_0 and l_Character_0.PrimaryPart then
                        l_Character_0.PrimaryPart.Anchored = true;
                    end;
                end);
                local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                v107[#v107 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Land"):Connect(function() --[[ Line: 271 ]]
                    -- upvalues: l_SoundHelper_0 (ref), v45 (copy), l_Workspace_0 (ref), l_Character_0 (copy), l_LandDash_0 (copy), l_LandWind_0 (copy), l_LandRing_0 (copy), l_LandSmoke_0 (copy), l_Pebbles_0 (copy), v51 (ref), l_LookVector_0 (copy), v21 (ref), l_CurrentCamera_0 (copy), l_TweenService_0 (ref), l_BodySmoke2_0 (copy)
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v45 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Metal
                    });
                    l_LandDash_0:Emit(20);
                    l_LandWind_0:Emit(5);
                    l_LandRing_0:Emit(1);
                    l_LandSmoke_0:Emit(25);
                    l_Pebbles_0:Emit(10);
                    task.defer(function() --[[ Line: 284 ]]
                        -- upvalues: v51 (ref), l_LookVector_0 (ref), l_Workspace_0 (ref), v45 (ref), v21 (ref)
                        local v109 = script.FallSmoke:Clone();
                        v109.Position = (CFrame.lookAt(v51, v51 + l_LookVector_0) * CFrame.new(0, 0, 2.5)).Position - Vector3.new(0, 2.700000047683716, 0, 0);
                        v109.Parent = l_Workspace_0.Debris;
                        for _, v111 in v109.Particle:GetChildren() do
                            v111.Enabled = false;
                            v111:Emit(v111:GetAttribute("EmitCount"));
                        end;
                        if v45 then
                            v21.HUDShake({
                                Scale = 10, 
                                Damper = 0.09999999999999999
                            });
                        end;
                        task.wait(4);
                        v109:Destroy();
                    end);
                    if v45 then
                        task.defer(function() --[[ Line: 306 ]]
                            -- upvalues: l_CurrentCamera_0 (ref), l_TweenService_0 (ref), v21 (ref)
                            l_CurrentCamera_0.FieldOfView = 60;
                            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                FieldOfView = 35
                            }):Play();
                            v21.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.3, 
                                Fade = 1
                            });
                        end);
                    end;
                    task.wait(0.2);
                    l_BodySmoke2_0.Enabled = true;
                end);
                v107[#v107 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Beat1"):Connect(function() --[[ Line: 322 ]]
                    -- upvalues: l_Orbs_0 (copy), l_Ring_0 (copy), l_Lightning_0 (copy), l_SoundHelper_0 (ref), v45 (copy), l_Workspace_0 (ref), l_Character_0 (copy), v21 (ref)
                    l_Orbs_0:Emit(15);
                    l_Ring_0:Emit(1);
                    l_Lightning_0:Emit(1);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v45 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Lightning1
                    });
                    if v45 then
                        v21.CameraShake({
                            Preset = "LightHit", 
                            WaitTime = 0.2, 
                            Fade = 0.2
                        });
                    end;
                end);
                v107[#v107 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Beat2"):Connect(function() --[[ Line: 342 ]]
                    -- upvalues: l_Orbs_0 (copy), l_Ring_0 (copy), l_Lightning_0 (copy), l_LightningBurst_0 (copy), l_SoundHelper_0 (ref), v45 (copy), l_Workspace_0 (ref), l_Character_0 (copy), v21 (ref), l_BodySmoke2_0 (copy), l_TweenService_0 (ref), l_Laughter_0 (copy), l_Lightning2_0 (copy)
                    l_Orbs_0:Emit(15);
                    l_Ring_0:Emit(1);
                    l_Lightning_0:Emit(1);
                    l_LightningBurst_0:Emit(5);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v45 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Lightning2
                    });
                    task.defer(function() --[[ Line: 354 ]]
                        -- upvalues: l_SoundHelper_0 (ref), v45 (ref), l_Workspace_0 (ref), l_Character_0 (ref)
                        task.wait(0.25);
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v45 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                            DirectCopy = script.Sounds.Lightning4
                        });
                    end);
                    if v45 then
                        task.defer(function() --[[ Line: 365 ]]
                            -- upvalues: v21 (ref)
                            v21.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 0.2, 
                                Fade = 0.4
                            });
                        end);
                    end;
                    task.defer(function() --[[ Line: 374 ]]
                        -- upvalues: l_BodySmoke2_0 (ref), l_TweenService_0 (ref), l_Laughter_0 (ref)
                        task.wait(0.08333333333333333);
                        l_BodySmoke2_0.Enabled = true;
                        task.wait(3.6);
                        l_TweenService_0:Create(l_Laughter_0, TweenInfo.new(0.4166666666666667, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            TimeScale = 0.1
                        }):Play();
                        task.wait(0.4166666666666667);
                        l_TweenService_0:Create(l_Laughter_0, TweenInfo.new(0.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            TimeScale = 1
                        }):Play();
                        task.wait(0.31666666666666665);
                        l_BodySmoke2_0.Enabled = false;
                    end);
                    task.wait(0.13333333333333333);
                    l_Lightning2_0:Emit(1);
                end);
                v107[#v107 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Beat3"):Connect(function() --[[ Line: 393 ]]
                    -- upvalues: l_Orbs_0 (copy), l_Ring_0 (copy), l_Lightning_0 (copy), l_Lightning2_0 (copy), l_Lightning3_0 (copy), l_SoundHelper_0 (ref), v45 (copy), l_Workspace_0 (ref), l_Character_0 (copy), v21 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), l_Laughter_0 (copy), l_LightningBurst2_0 (copy), l_LightningBurst_0 (copy)
                    l_Orbs_0:Emit(15);
                    l_Ring_0:Emit(1);
                    l_Lightning_0:Emit(1);
                    l_Lightning2_0:Emit(1);
                    l_Lightning3_0:Emit(1);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v45 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Lightning3
                    });
                    if v45 then
                        task.defer(function() --[[ Line: 407 ]]
                            -- upvalues: v21 (ref)
                            v21.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 0.3, 
                                Fade = 0.6
                            });
                        end);
                        task.defer(function() --[[ Line: 415 ]]
                            -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_0 (ref)
                            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
                                FieldOfView = 70
                            }):Play();
                            task.wait(2.2);
                            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                FieldOfView = 43
                            }):Play();
                        end);
                    end;
                    l_Laughter_0.Enabled = true;
                    task.wait(0.11666666666666667);
                    l_LightningBurst2_0:Emit(5);
                    task.wait(0.16666666666666666);
                    l_Lightning3_0:Emit(1);
                    task.wait(0.06666666666666667);
                    l_LightningBurst_0:Emit(5);
                    task.wait(0.06666666666666667);
                    l_LightningBurst2_0:Emit(5);
                    task.wait(0.18333333333333332);
                    l_LightningBurst_0:Emit(5);
                    task.wait(0.08333333333333333);
                    l_LightningBurst2_0:Emit(5);
                    task.wait(0.1);
                    l_Lightning3_0:Emit(1);
                    task.wait(0.13333333333333333);
                    l_LightningBurst2_0:Emit(5);
                    task.wait(0.3);
                    l_LightningBurst2_0:Emit(5);
                    task.wait(0.26666666666666666);
                    l_LightningBurst2_0:Emit(5);
                    task.wait(0.016666666666666666);
                    l_Lightning3_0:Emit(1);
                end);
                v107[#v107 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Epic"):Connect(function() --[[ Line: 459 ]]
                    -- upvalues: v21 (ref), v104 (copy), l_Character_0 (copy), v51 (ref), l_LookVector_0 (copy), l_Workspace_0 (ref), l_SoundHelper_0 (ref), v45 (copy), v44 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), l_Lighting_0 (ref), l_TweenService_0 (ref), l_NormalLightning_0 (copy), l_BlackLightning_0 (copy), l_Smokes2_0 (copy), l_GetupWind_0 (copy), l_SmokeBurst_0 (copy), l_LandWind_0 (copy), l_LandRing_0 (copy), l_CurrentCamera_0 (copy)
                    task.defer(function() --[[ Line: 460 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "LightHit", 
                            WaitTime = 0.8, 
                            Fade = 0.6
                        });
                    end);
                    task.defer(function() --[[ Line: 468 ]]
                        -- upvalues: v104 (ref), l_Character_0 (ref), v51 (ref), l_LookVector_0 (ref), l_Workspace_0 (ref), l_SoundHelper_0 (ref), v45 (ref), v44 (ref), l_LocalPlayer_0 (ref), l_Damager_0 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref), v21 (ref), l_NormalLightning_0 (ref), l_BlackLightning_0 (ref), l_Smokes2_0 (ref)
                        v104.CFrame = l_Character_0.HumanoidRootPart.CFrame * CFrame.new(0, -1, 0);
                        local v112 = script.GroundSmoke:Clone();
                        v112.Position = (CFrame.lookAt(v51, v51 + l_LookVector_0) * CFrame.new(0.6, 0, 3.3)).Position - Vector3.new(0, 2.9100000858306885, 0, 0);
                        v112.Size = v112.Size + Vector3.new(3, 0, 3, 0);
                        v112.Parent = l_Workspace_0.Debris;
                        for _, v114 in v112:GetDescendants() do
                            if v114:IsA("ParticleEmitter") then
                                v114.Enabled = false;
                                v114:Emit(v114.Rate);
                            end;
                        end;
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v45 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                            DirectCopy = script.Sounds.Explosion
                        });
                        if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                            local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
                            l_ColorCorrection_0.Saturation = 0;
                            l_ColorCorrection_0.Contrast = 0;
                            l_ColorCorrection_0.Enabled = true;
                            local v116 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                            l_TweenService_0:Create(l_ColorCorrection_0, v116, {
                                Saturation = -1, 
                                Contrast = 0.5
                            }):Play();
                            local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                            l_MenuBlur_0.Size = 0;
                            l_MenuBlur_0.Enabled = true;
                            local v118 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                            l_TweenService_0:Create(l_MenuBlur_0, v118, {
                                Size = 30
                            }):Play();
                            v21.HUDShake({
                                Scale = 20, 
                                Damper = 0.09999999999999999
                            });
                        end;
                        v112.Decal2.Color3 = Color3.fromRGB(229, 37, 37);
                        task.defer(function() --[[ Line: 512 ]]
                            -- upvalues: l_TweenService_0 (ref), v112 (copy)
                            task.wait(2);
                            l_TweenService_0:Create(v112.Decal, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                Transparency = 1
                            }):Play();
                            l_TweenService_0:Create(v112.Decal1, TweenInfo.new(4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                Transparency = 1
                            }):Play();
                            l_TweenService_0:Create(v112.Decal2, TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                Transparency = 1
                            }):Play();
                            task.wait(8);
                            v112:Destroy();
                        end);
                        l_NormalLightning_0:Emit(5);
                        task.wait(0.15);
                        l_BlackLightning_0:Emit(5);
                        task.wait(0.06666666666666667);
                        l_NormalLightning_0:Emit(5);
                        task.wait(0.1);
                        l_Smokes2_0:Emit(1);
                        task.wait(0.03333333333333333);
                        l_BlackLightning_0:Emit(5);
                        task.wait(0.11666666666666667);
                        l_NormalLightning_0:Emit(5);
                        task.wait(0.06666666666666667);
                        l_Smokes2_0:Emit(1);
                        task.wait(0.06666666666666667);
                        l_BlackLightning_0:Emit(5);
                        task.wait(0.11666666666666667);
                        l_Smokes2_0:Emit(1);
                        task.wait(0.13333333333333333);
                        l_NormalLightning_0:Emit(5);
                        task.wait(0.06666666666666667);
                        l_Smokes2_0:Emit(1);
                        task.wait(0.06666666666666667);
                        l_BlackLightning_0:Emit(5);
                        task.wait(0.11666666666666667);
                        l_NormalLightning_0:Emit(5);
                        task.wait(0.016666666666666666);
                        l_Smokes2_0:Emit(1);
                        task.wait(0.11666666666666667);
                        l_BlackLightning_0:Emit(5);
                        task.wait(0.23333333333333334);
                        l_NormalLightning_0:Emit(5);
                        task.wait(0.13333333333333333);
                        l_BlackLightning_0:Emit(5);
                        task.wait(0.21666666666666667);
                        l_NormalLightning_0:Emit(5);
                        task.wait(0.25);
                        l_BlackLightning_0:Emit(5);
                        task.wait(0.1);
                        l_NormalLightning_0:Emit(5);
                    end);
                    task.delay(2.0166666666666666, function() --[[ Line: 582 ]]
                        -- upvalues: l_GetupWind_0 (ref), l_SmokeBurst_0 (ref)
                        l_GetupWind_0:Emit(5);
                        task.wait(1.4666666666666666);
                        l_GetupWind_0:Emit(5);
                        task.wait(0.75);
                        l_SmokeBurst_0:Emit(20);
                    end);
                    task.wait(0.25);
                    task.defer(function() --[[ Line: 594 ]]
                        -- upvalues: l_LandWind_0 (ref), l_LandRing_0 (ref), v45 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (ref), v21 (ref)
                        task.wait(0.11666666666666667);
                        l_LandWind_0:Emit(5);
                        task.wait(0.2833333333333333);
                        l_LandWind_0:Emit(5);
                        task.wait(0.26666666666666666);
                        l_LandWind_0:Emit(5);
                        task.wait(0.3);
                        l_LandWind_0:Emit(5);
                        task.wait(0.7);
                        l_LandRing_0:Emit(1);
                        if v45 then
                            task.defer(function() --[[ Line: 611 ]]
                                -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_0 (ref), v21 (ref)
                                task.wait(0.4);
                                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                    FieldOfView = 65
                                }):Play();
                                v21.CameraShake({
                                    Preset = "Vibration", 
                                    WaitTime = 0.1, 
                                    Fade = 0.3
                                });
                            end);
                        end;
                    end);
                end);
                v107[#v107 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("KB2"):Connect(function() --[[ Line: 627 ]]
                    -- upvalues: v64 (copy), l_Workspace_0 (ref), v44 (copy), l_Occupied_0 (copy), l_Character_0 (copy), l_TweenService_0 (ref), l_Laughter_0 (copy), l_Lightning3_0 (copy)
                    local l_v64_0 = v64;
                    l_v64_0.EndPosition = l_v64_0.EndPosition - Vector3.new(0, 0.800000011920929, 0, 0);
                    v64.CurrentTime = l_Workspace_0:GetServerTimeNow();
                    print(v64);
                    if v44 then
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if l_Character_0 and l_Character_0.PrimaryPart then
                        l_Character_0.PrimaryPart.Anchored = false;
                    end;
                    task.wait(0.2);
                    l_TweenService_0:Create(l_Laughter_0, TweenInfo.new(0.48333333333333334, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TimeScale = 0.1
                    }):Play();
                    task.wait(0.3);
                    l_Laughter_0.Enabled = false;
                    task.wait(1.5166666666666666);
                    l_TweenService_0:Create(l_Laughter_0, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TimeScale = 1
                    }):Play();
                    task.wait(0.08333333333333333);
                    l_Lightning3_0:Emit(1);
                end);
                v107[#v107 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Jump"):Connect(function() --[[ Line: 654 ]]
                    -- upvalues: l_SoundHelper_0 (ref), v45 (copy), l_Workspace_0 (ref), l_Character_0 (copy), l_MuscleR_0 (copy), l_MuscleL_0 (copy), l_Moon_0 (copy), l_Stars_0 (copy), l_Orb_0 (copy), l_TweenService_0 (ref), l_ChromeAbbreviation_0 (copy), l_Lightning2_0 (copy)
                    task.delay(1.7666666666666666, function() --[[ Line: 655 ]]
                        -- upvalues: l_SoundHelper_0 (ref), v45 (ref), l_Workspace_0 (ref), l_Character_0 (ref), l_MuscleR_0 (ref), l_MuscleL_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v45 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                            DirectCopy = script.Sounds.Timpa
                        });
                        l_MuscleR_0:Emit(1);
                        task.wait(0.18333333333333332);
                        l_MuscleL_0:Emit(1);
                    end);
                    l_Moon_0.Enabled = true;
                    task.wait(0.08333333333333333);
                    l_Stars_0:Emit(25);
                    l_Orb_0:Emit(1);
                    l_TweenService_0:Create(l_Orb_0, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TimeScale = 0.1
                    }):Play();
                    task.delay(0.4166666666666667, function() --[[ Line: 676 ]]
                        -- upvalues: l_TweenService_0 (ref), l_Orb_0 (ref)
                        l_TweenService_0:Create(l_Orb_0, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TimeScale = 1
                        }):Play();
                    end);
                    task.wait(0.16666666666666666);
                    l_ChromeAbbreviation_0:Emit(1);
                    task.wait(0.3333333333333333);
                    l_Moon_0.Enabled = false;
                    task.defer(function() --[[ Line: 686 ]]
                        -- upvalues: l_Lightning2_0 (ref)
                        task.wait(1.2333333333333334);
                        l_Lightning2_0:Emit(1);
                    end);
                end);
                task.delay(0.3333333333333333, function() --[[ Line: 692 ]]
                    -- upvalues: v21 (ref), v43 (copy)
                    v21.TripleText({
                        Image = v43.Down, 
                        HoldTime = 0.6666666666666666
                    });
                end);
                if v45 then
                    task.defer(function() --[[ Line: 700 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.3, 
                            Fade = 3
                        });
                    end);
                end;
                task.delay(0, function() --[[ Line: 709 ]]
                    -- upvalues: l_SoundHelper_0 (ref), v45 (copy), l_Workspace_0 (ref), l_Character_0 (copy), l_TweenService_0 (ref)
                    local v120 = l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v45 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Liberation
                    });
                    local l_Volume_0 = v120.Volume;
                    v120.Volume = 0;
                    v120.TimePosition = 2.19;
                    l_TweenService_0:Create(v120, TweenInfo.new(5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                        Volume = l_Volume_0
                    }):Play();
                end);
                task.delay(0.625, function() --[[ Line: 723 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), v45 (copy), v21 (ref)
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
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
                local v127 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v127, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v44 then
                    l_Occupied_0.LerpMult.Value = 0.1;
                end;
                task.wait(0.625);
                local _ = {};
                task.delay(0, function() --[[ Line: 773 ]]
                    -- upvalues: v21 (ref)
                    task.wait(1.3);
                    v21.CameraShake({
                        Preset = "HardHit", 
                        WaitTime = 0.2, 
                        Fade = 0.5
                    });
                end);
                local function v138(v129, v130) --[[ Line: 794 ]] --[[ Name: SetTransparency ]]
                    -- upvalues: l_ReplicatedStorage_0 (ref), l_Workspace_0 (ref)
                    for _, v132 in v129:GetDescendants() do
                        if v132.Name == "UnusualParticle" then
                            v132.Enabled = v130 == 0;
                            if not v132.Enabled then
                                local l_Parent_1 = v132.Parent;
                                v132.Parent = l_ReplicatedStorage_0;
                                v132.Parent = l_Parent_1;
                            end;
                        end;
                        if (v132:IsA("BasePart") or v132:IsA("Decal")) and v132.LocalTransparencyModifier < 1000 then
                            v132.LocalTransparencyModifier = v130;
                        end;
                    end;
                    local l_FirstChild_1 = l_Workspace_0.Welds:FindFirstChild(v129.Name);
                    if l_FirstChild_1 then
                        for _, v136 in l_FirstChild_1:GetDescendants() do
                            if v136.Name == "UnusualParticle" then
                                v136.Enabled = v130 == 0;
                                if not v136.Enabled then
                                    local l_Parent_2 = v136.Parent;
                                    v136.Parent = l_ReplicatedStorage_0;
                                    v136.Parent = l_Parent_2;
                                end;
                            end;
                            if (v136:IsA("BasePart") or v136:IsA("Decal")) and v136.LocalTransparencyModifier < 1000 then
                                v136.LocalTransparencyModifier = v130;
                            end;
                        end;
                    end;
                end;
                task.wait(0.8333333333333334);
                local v139 = v0.DelayTime - l_Workspace_0.Ping.Value / 2 - v28.RandomMult * v0.RandomTime + v28.ExtraTime;
                if v45 then
                    local v140 = v139 - 5.25 - v28.ExtraTime;
                    local l_v140_0 = v140 --[[ copy: 80 -> 87 ]];
                    task.defer(function() --[[ Line: 846 ]]
                        -- upvalues: l_v140_0 (copy), v21 (ref), v28 (copy)
                        task.wait(l_v140_0);
                        v21.CameraShake({
                            Preset = "SuperLight", 
                            WaitTime = 6 + v28.ExtraTime, 
                            Fade = 2
                        });
                    end);
                end;
                task.delay(v139, function() --[[ Line: 857 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                if v45 then
                    task.delay(0.5, function() --[[ Line: 867 ]]
                        -- upvalues: l_Variant_0 (copy), l_CameraMode_0 (copy), l_CameraTarget_0 (copy), l_Character_0 (copy), v138 (copy), l_Damager_0 (copy), l_TweenService_0 (ref), l_Vignette_0 (copy), v127 (copy), l_Lighting_0 (ref), l_LocalPlayer_0 (ref), v21 (ref), l_Humanoid_1 (copy), l_LookVector_0 (copy)
                        l_Variant_0.Value = "Gear5";
                        l_CameraMode_0.Value = "Knockdown";
                        l_CameraTarget_0.Value = l_Character_0;
                        v138(l_Damager_0, 1);
                        l_TweenService_0:Create(l_Vignette_0, v127, {
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
                    end);
                end;
                l_Damager_0:SetAttribute("CurrentEmote", nil);
                local v143 = tick();
                repeat
                    task.wait(0.1);
                until l_Character_0:GetAttribute("GettingUp") or not l_Character_0:IsDescendantOf(l_Workspace_0) or tick() - v143 > 15;
                task.delay(0.25, function() --[[ Line: 896 ]]
                    -- upvalues: l_Lighting_0 (ref), l_l_Players_0_PlayerFromCharacter_0 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v21 (ref), l_TweenService_0 (ref)
                    local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
                    if l_l_Players_0_PlayerFromCharacter_0 or l_LocalPlayer_0.Character == l_Damager_0 then
                        task.defer(function() --[[ Line: 900 ]]
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
                        local v145 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_ColorCorrection_1, v145, {
                            Saturation = -1, 
                            Contrast = 0.5
                        }):Play();
                        local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_1.Size = 0;
                        l_MenuBlur_1.Enabled = true;
                        local v147 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_1, v147, {
                            Size = 10
                        }):Play();
                        local v148 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_Lighting_0, v148, {
                            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                        }):Play();
                    end;
                    task.wait(0.7);
                end);
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v138(l_Damager_0, 0);
                    l_TweenService_0:Create(l_Vignette_0, v127, {
                        ImageTransparency = 1
                    }):Play();
                    task.defer(function() --[[ Line: 941 ]]
                        -- upvalues: l_CameraMode_0 (copy), l_Variant_0 (copy)
                        l_CameraMode_0.Value = "";
                        l_Variant_0.Value = "";
                    end);
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                task.delay(0.44999999999999996, function() --[[ Line: 954 ]]
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
                    local v150 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                    l_TweenService_0:Create(l_ColorCorrection_2, v150, {
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
                for v151, v152 in v53 do
                    v151.CollisionGroup = v152;
                end;
                for _, v154 in v107 do
                    v154:Disconnect();
                end;
                task.wait(5);
                for _, v156 in v68 do
                    v156:Destroy();
                end;
                l_l_AnimHelper_0_Anim_0:Stop(0);
                if v43 then
                    v43:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.KO = function(v157) --[[ Line: 1035 ]] --[[ Name: KO ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), v21 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy)
        local l_Character_1 = v157.Character;
        local l_Damager_1 = v157.Damager;
        local l_StartPosition_1 = v157.StartPosition;
        local l_LookVector_1 = v157.LookVector;
        local l_FirstChild_2 = l_Workspace_0.States:FindFirstChild(l_Character_1.Name);
        local l_CharacterData_1 = l_FirstChild_2:FindFirstChild("CharacterData");
        local l_PlayerData_1 = l_FirstChild_2:FindFirstChild("PlayerData");
        local l_Occupied_1 = l_FirstChild_2:FindFirstChild("Occupied");
        if not l_CharacterData_1 or not l_PlayerData_1 or not l_Occupied_1 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_1);
            local l_Humanoid_2 = l_Character_1:FindFirstChild("Humanoid");
            local v168 = l_Humanoid_2 and l_Humanoid_2:FindFirstChild("Animator");
            local l_Humanoid_3 = l_Damager_1:FindFirstChild("Humanoid");
            local v170 = l_Humanoid_3 and l_Humanoid_3:FindFirstChild("Animator");
            if not v168 or not v170 then
                return;
            else
                local v171 = l_Assets_0.DownFrames.Default:Clone();
                local v172 = l_LocalPlayer_0.Character == l_Character_1;
                if v172 or l_LocalPlayer_0.Character == l_Damager_1 then
                    v171.Parent = l_Common_0;
                end;
                local v173 = 3.5;
                local l_l_RayHelper_0_EnvironmentWhitelist_1 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_1, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_1, l_StartPosition_1 - l_LookVector_1, v173 + 0, l_l_RayHelper_0_EnvironmentWhitelist_1);
                local v178 = l_StartPosition_1 - l_LookVector_1 * v173;
                if l_l_RayHelper_0_RayWithWhiteList_1 then
                    v178 = l_StartPosition_1 - l_LookVector_1 * 2;
                end;
                local v179 = {};
                for _, v181 in l_Character_1:GetChildren() do
                    if v181:IsA("BasePart") and v181 ~= l_Character_1.PrimaryPart then
                        v179[v181] = v181.CollisionGroup;
                        v181.CollisionGroup = "None";
                    end;
                end;
                if not l_Character_1 or l_Character_1.PrimaryPart then

                end;
                for _, v183 in (v170:GetPlayingAnimationTracks()) do
                    if v183.Priority ~= Enum.AnimationPriority.Idle then
                        v183:AdjustSpeed(v183.Speed / 3);
                    end;
                end;
                local v184 = {
                    AnimId = v0.Animations.KO, 
                    FadeIn = 0.05, 
                    NameFade = 0.1, 
                    AnimSpeed = 0.12, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_2, 
                    Weight = 10000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v184);
                l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_1.PrimaryPart
                });
                local v186 = v172 or l_LocalPlayer_0.Character == l_Damager_1;
                task.delay(0.1, function() --[[ Line: 1122 ]]
                    -- upvalues: v186 (copy), v21 (ref)
                    if not v186 then
                        return;
                    else
                        task.defer(function() --[[ Line: 1125 ]]
                            -- upvalues: v21 (ref)
                            v21.CameraShake({
                                Preset = "Knockdown", 
                                WaitTime = 0.5, 
                                Fade = 2, 
                                FoV = 55, 
                                FoVMult = 1
                            });
                        end);
                        v21.CreateImpactFrame({
                            Time = 0.06
                        });
                        return;
                    end;
                end);
                task.delay(1.3888888888888888, function() --[[ Line: 1141 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_1 (copy)
                    l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.87);
                end);
                if v172 or l_LocalPlayer_0.Character == l_Damager_1 then
                    task.delay(0.8333333333333334, function() --[[ Line: 1146 ]]
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
                local l_PrimaryPart_2 = l_Character_1.PrimaryPart;
                local l_CFrame_1 = l_PrimaryPart_2.CFrame;
                local l_l_Workspace_0_ServerTimeNow_1 = l_Workspace_0:GetServerTimeNow();
                local v190 = {
                    Victim = l_Character_1, 
                    LookVector = l_LookVector_1, 
                    EndPosition = v178, 
                    VictimPosition = l_PrimaryPart_2.Position, 
                    TargetVector = v178 - v178, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_1, 
                    TargetTime = 1.3888888888888888, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v190);
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
                local l_Head_1 = l_Character_1.Head;
                local l_PrimaryPart_3 = l_Character_1.PrimaryPart;
                local l_UpperTorso_1 = l_Character_1.UpperTorso;
                local v202 = {};
                for _, v204 in script.Particles.Head:GetChildren() do
                    v204 = v204:Clone();
                    table.insert(v202, v204);
                    v204.Parent = l_Head_1;
                end;
                for _, v206 in script.Particles.HumanoidRootPart:GetChildren() do
                    v206 = v206:Clone();
                    table.insert(v202, v206);
                    v206.Parent = l_PrimaryPart_3;
                end;
                for _, v208 in script.Particles.UpperTorso:GetChildren() do
                    v208 = v208:Clone();
                    table.insert(v202, v208);
                    v208.Parent = l_UpperTorso_1;
                end;
                local l_LandWind_1 = l_PrimaryPart_3.Fall.LandWind;
                local l_LandRing_1 = l_PrimaryPart_3.Fall.LandRing;
                local l_BodySmoke2_1 = l_UpperTorso_1.BodySmoke2;
                local l_DrippingLines_0 = l_Head_1.DrippingLines;
                local l_Unhappy_0 = l_Head_1.FinalKnock.Unhappy;
                local l_DownedWind_0 = l_PrimaryPart_3.Faint.DownedWind;
                local l_Lightning2_1 = l_UpperTorso_1.Heart.Lightning2;
                local l_OrbsLast_0 = l_UpperTorso_1.OrbsLast;
                local l_Orbs_1 = l_UpperTorso_1.Heart.Orbs;
                local v218 = {
                    HoldTime = 1.5
                };
                local v219 = script.Knockdown:Clone();
                v219.CFrame = CFrame.lookAt(l_CFrame_1.Position, v178);
                v219.Position = v219.Position + Vector3.new(0, 0.75, 0, 0);
                v219.Parent = l_Workspace_0.Debris;
                for _, v221 in v219.Particle:GetChildren() do
                    v221.Enabled = false;
                    v221:Emit(v221:GetAttribute("EmitCount"));
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = v186 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                    DirectCopy = script.Sounds.Punch
                });
                local v222 = {};
                v222[#v222 + 1] = l_l_AnimHelper_0_Anim_1:GetMarkerReachedSignal("Land"):Connect(function() --[[ Line: 1265 ]]
                    -- upvalues: l_SoundHelper_0 (ref), v186 (copy), l_Workspace_0 (ref), l_Character_1 (copy), v178 (ref), l_LookVector_1 (copy), v21 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref), l_LandRing_1 (copy), l_LandWind_1 (copy), l_BodySmoke2_1 (copy), l_Unhappy_0 (copy), l_DrippingLines_0 (copy), l_Lightning2_1 (copy), l_Orbs_1 (copy), l_OrbsLast_0 (copy), l_DownedWind_0 (copy), v218 (copy), v171 (copy)
                    task.defer(function() --[[ Line: 1266 ]]
                        -- upvalues: l_SoundHelper_0 (ref), v186 (ref), l_Workspace_0 (ref), l_Character_1 (ref), v178 (ref), l_LookVector_1 (ref), v21 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v186 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                            DirectCopy = script.Sounds.Land1
                        });
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v186 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                            DirectCopy = script.Sounds.Metal2
                        });
                        local v223 = script.FallSmoke:Clone();
                        v223.Position = (CFrame.lookAt(v178, v178 + l_LookVector_1) * CFrame.new(0, 0, 2.5)).Position - Vector3.new(0, 2.700000047683716, 0, 0);
                        v223.Parent = l_Workspace_0.Debris;
                        for _, v225 in v223.Particle:GetChildren() do
                            v225.Enabled = false;
                            v225:Emit(v225:GetAttribute("EmitCount"));
                        end;
                        if v186 then
                            v21.HUDShake({
                                Scale = 10, 
                                Damper = 0.09999999999999999
                            });
                        end;
                        if v186 then
                            task.defer(function() --[[ Line: 1296 ]]
                                -- upvalues: v21 (ref)
                                v21.CameraShake({
                                    Preset = "SuperHardHit", 
                                    WaitTime = 0.4, 
                                    Fade = 1, 
                                    FoV = 60, 
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
                            local v227 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                            l_TweenService_0:Create(l_ColorCorrection_3, v227, {
                                Saturation = -1, 
                                Contrast = 0.5
                            }):Play();
                            local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                            l_MenuBlur_2.Size = 0;
                            l_MenuBlur_2.Enabled = true;
                            local v229 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                            l_TweenService_0:Create(l_MenuBlur_2, v229, {
                                Size = 10
                            }):Play();
                            local v230 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                            l_TweenService_0:Create(l_Lighting_0, v230, {
                                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                            }):Play();
                        end;
                        task.wait(4);
                        v223:Destroy();
                    end);
                    l_LandRing_1:Emit(1);
                    l_LandWind_1:Emit(5);
                    task.wait(0.019157088122605363);
                    l_BodySmoke2_1:Emit(10);
                    task.wait(0.3065134099616858);
                    l_Unhappy_0.Enabled = true;
                    task.wait(0.19157088122605362);
                    l_DrippingLines_0.Enabled = true;
                    task.wait(0.47892720306513414);
                    l_Lightning2_1:Emit(1);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v186 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Lightning2
                    });
                    task.defer(function() --[[ Line: 1357 ]]
                        -- upvalues: v186 (ref), v21 (ref)
                        if not v186 then
                            return;
                        else
                            task.wait(0.38314176245210724);
                            v21.CameraShake({
                                Preset = "LightHit", 
                                WaitTime = 2, 
                                Fade = 2
                            });
                            return;
                        end;
                    end);
                    task.wait(1.9157088122605366);
                    l_Orbs_1:Emit(15);
                    task.wait(0.019157088122605363);
                    l_Lightning2_1:Emit(1);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v186 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Lightning3
                    });
                    task.wait(0.8812260536398469);
                    l_Unhappy_0.Enabled = false;
                    l_DrippingLines_0.Enabled = false;
                    task.wait(0.0574712643678161);
                    l_BodySmoke2_1:Emit(25);
                    task.wait(0.019157088122605363);
                    l_OrbsLast_0:Emit(25);
                    task.wait(0.13409961685823754);
                    l_DownedWind_0:Emit(5);
                    task.defer(function() --[[ Line: 1393 ]]
                        -- upvalues: l_SoundHelper_0 (ref), v186 (ref), l_Workspace_0 (ref), l_Character_1 (ref), v178 (ref), l_LookVector_1 (ref), v21 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v186 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                            DirectCopy = script.Sounds.Land2
                        });
                        local v231 = script.FallSmoke:Clone();
                        v231.Position = (CFrame.lookAt(v178, v178 + l_LookVector_1) * CFrame.new(0, 0, 2.5)).Position - Vector3.new(0, 2.700000047683716, 0, 0);
                        v231.Parent = l_Workspace_0.Debris;
                        for _, v233 in v231.Particle:GetChildren() do
                            v233.Enabled = false;
                            v233:Emit(v233:GetAttribute("EmitCount"));
                        end;
                        if v186 then
                            v21.HUDShake({
                                Scale = 10, 
                                Damper = 0.09999999999999999
                            });
                        end;
                        if v186 then
                            task.defer(function() --[[ Line: 1418 ]]
                                -- upvalues: v21 (ref)
                                v21.CameraShake({
                                    Preset = "HardHit", 
                                    WaitTime = 0.4, 
                                    Fade = 1
                                });
                            end);
                            v21.HUDShake({
                                Scale = 20, 
                                Damper = 0.09999999999999999
                            });
                            local l_ColorCorrection_4 = l_Lighting_0.ColorCorrection;
                            l_ColorCorrection_4.Saturation = 0;
                            l_ColorCorrection_4.Contrast = 0;
                            l_ColorCorrection_4.Enabled = true;
                            local v235 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                            l_TweenService_0:Create(l_ColorCorrection_4, v235, {
                                Saturation = -1, 
                                Contrast = 0.5
                            }):Play();
                            local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                            l_MenuBlur_3.Size = 0;
                            l_MenuBlur_3.Enabled = true;
                            local v237 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                            l_TweenService_0:Create(l_MenuBlur_3, v237, {
                                Size = 10
                            }):Play();
                            local v238 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                            l_TweenService_0:Create(l_Lighting_0, v238, {
                                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                            }):Play();
                        end;
                        task.wait(4);
                        v231:Destroy();
                    end);
                    if v186 then
                        task.wait(0.9);
                        l_SoundHelper_0:PlaySound({
                            Name = "Box", 
                            Volume = 0.25, 
                            Parent = l_Workspace_0.Debris
                        });
                        if v186 then
                            task.defer(function() --[[ Line: 1464 ]]
                                -- upvalues: v21 (ref)
                                v21.CameraShake({
                                    Preset = "MedHit", 
                                    WaitTime = 0.2, 
                                    Fade = 1
                                });
                            end);
                        end;
                        task.defer(function() --[[ Line: 1473 ]]
                            -- upvalues: v218 (ref), v171 (ref), v21 (ref)
                            v218.Image = v171.KO.K;
                            v21.TripleText(v218);
                        end);
                        task.wait(0.1);
                        task.defer(function() --[[ Line: 1479 ]]
                            -- upvalues: v218 (ref), v171 (ref), v21 (ref)
                            v218.Image = v171.KO.Dot1;
                            v21.TripleText(v218);
                        end);
                        task.wait(0.1);
                        task.defer(function() --[[ Line: 1485 ]]
                            -- upvalues: v218 (ref), v171 (ref), v21 (ref)
                            v218.Image = v171.KO.O;
                            v21.TripleText(v218);
                        end);
                        task.wait(0.1);
                        task.defer(function() --[[ Line: 1491 ]]
                            -- upvalues: v218 (ref), v171 (ref), v21 (ref)
                            v218.Image = v171.KO.Dot2;
                            v21.TripleText(v218);
                        end);
                    end;
                end);
                task.wait(1.5804597701149425);
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2, function() --[[ Line: 1501 ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_1:SetAttribute("GettingUp", nil);
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                l_SoundHelper_0:PlaySound({
                    Name = "StartMatch", 
                    Parent = l_Workspace_0.Debris
                });
                if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                    l_Occupied_1.Target.Value = Vector3.new();
                end;
                task.wait(1.25);
                local v239 = false;
                local function v248() --[[ Line: 1522 ]] --[[ Name: Reset ]]
                    -- upvalues: v239 (ref), v222 (copy), v202 (copy), l_Occupied_1 (copy), v198 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), l_Lighting_0 (ref), l_TweenService_0 (ref), v219 (copy), l_Character_1 (copy), v179 (copy), l_l_AnimHelper_0_Anim_1 (copy), v171 (copy), l_Vignette_1 (copy), v197 (copy)
                    if v239 then
                        return;
                    else
                        v239 = true;
                        for _, v241 in v222 do
                            v241:Disconnect();
                        end;
                        for _, v243 in v202 do
                            v243:Destroy();
                        end;
                        if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                            l_Occupied_1.Target.Value = Vector3.new();
                        end;
                        if v198 then
                            l_Occupied_1.LerpMult.Value = 0;
                        end;
                        if v198 or l_LocalPlayer_0.Character == l_Damager_1 then
                            local l_ColorCorrection_5 = l_Lighting_0.ColorCorrection;
                            local v245 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                            l_TweenService_0:Create(l_ColorCorrection_5, v245, {
                                Saturation = 0, 
                                Contrast = 0
                            }):Play();
                        end;
                        if v219 then
                            v219:Destroy();
                        end;
                        if l_Damager_1 and l_Damager_1.PrimaryPart then
                            l_Damager_1.PrimaryPart.Anchored = false;
                        end;
                        if l_Character_1 and l_Character_1.PrimaryPart then
                            l_Character_1.PrimaryPart.Anchored = false;
                        end;
                        for v246, v247 in v179 do
                            v246.CollisionGroup = v247;
                        end;
                        l_l_AnimHelper_0_Anim_1:Stop(0);
                        if v171 then
                            v171:Destroy();
                        end;
                        if v198 or l_LocalPlayer_0.Character == l_Damager_1 then
                            l_TweenService_0:Create(l_Vignette_1, v197, {
                                ImageTransparency = 1
                            }):Play();
                        end;
                        if v171 then
                            v171:Destroy();
                        end;
                        return;
                    end;
                end;
                local v249 = nil;
                if l_CharacterData_1 and l_CharacterData_1:FindFirstChild("Cutscene") then
                    v249 = l_CharacterData_1.Cutscene.Changed:Connect(function() --[[ Line: 1573 ]]
                        -- upvalues: v249 (ref), v248 (copy)
                        if v249 then
                            v249:Disconnect();
                        end;
                        task.wait(0.28);
                        v248();
                    end);
                end;
                task.wait(8);
                v248();
                return;
            end;
        end;
    end;
    v0.Use = function(v250) --[[ Line: 1584 ]] --[[ Name: Use ]]
        -- upvalues: v0 (copy)
        local _ = v250.Character;
        local _ = v250.Damager;
        if v250.IsKO then
            v0.KO(v250);
            return;
        else
            v0.Main(v250);
            return;
        end;
    end;
    return v0;
end;