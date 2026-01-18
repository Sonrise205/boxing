local v0 = {
    DelayTime = 6, 
    ServerDelayTime = 10, 
    Metadata = {
        DisplayName = "CRAFTED", 
        GlowColor = Color3.fromRGB(248, 140, 78), 
        Price = 54999
    }, 
    Animations = {
        Regular = 16639576416, 
        KO = 16632140256
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
    local l_Bezier_0 = require(l_ReplicatedStorage_0:WaitForChild("Bezier"));
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
    local function _(v24, v25, v26) --[[ Line: 54 ]] --[[ Name: Lerp ]]
        return v24 + (v25 - v24) * v26;
    end;
    v0.Main = function(v28) --[[ Line: 56 ]] --[[ Name: Main ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), v22 (copy), l_SoundHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy), l_ReplicatedStorage_0 (copy)
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
                local v45 = v44 or l_LocalPlayer_0.Character == l_Damager_0;
                local v46 = 4;
                local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_0, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_0, l_StartPosition_0 - l_LookVector_0, v46 + 2, l_l_RayHelper_0_EnvironmentWhitelist_0);
                local v51 = l_StartPosition_0 - l_LookVector_0 * v46;
                if l_l_RayHelper_0_RayWithWhiteList_0 then
                    v51 = l_StartPosition_0 - l_LookVector_0 * 2;
                end;
                local v52 = {};
                for _, v54 in l_Character_0:GetChildren() do
                    if v54:IsA("BasePart") and v54 ~= l_Character_0.PrimaryPart then
                        v52[v54] = v54.CollisionGroup;
                        v54.CollisionGroup = "None";
                    end;
                end;
                if not l_Character_0 or l_Character_0.PrimaryPart then

                end;
                for _, v56 in (v42:GetPlayingAnimationTracks()) do
                    if v56.Priority ~= Enum.AnimationPriority.Idle then
                        local l_Speed_0 = v56.Speed;
                        v56:AdjustSpeed(l_Speed_0 / 1.7);
                        task.delay(1, function() --[[ Line: 124 ]]
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
                    AnimId = v0.Animations.Regular, 
                    FadeIn = 0.05, 
                    AnimSpeed = 0.58, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_0, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v58);
                local v60 = script.Items:Clone();
                v60.Parent = l_Workspace_0.Debris;
                local l_Weld_0 = Instance.new("Weld");
                l_Weld_0.Parent = v60;
                l_Weld_0.Part0 = v60;
                l_Weld_0.Part1 = l_Character_0.RightHand;
                task.delay(10, function() --[[ Line: 150 ]]
                    -- upvalues: v60 (copy)
                    if v60 then
                        v60:Destroy();
                    end;
                end);
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2 - 2 * v28.RandomMult - 1 + v28.ExtraTime, function() --[[ Line: 154 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                local v70 = {
                    [1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Item"):Connect(function() --[[ Line: 161 ]]
                        -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), v60 (copy), v22 (ref), l_Character_0 (copy), l_SoundHelper_0 (ref)
                        l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
                        local function v66(v62) --[[ Line: 164 ]] --[[ Name: MakeVisible ]]
                            local v63 = false;
                            for _, v65 in v62:GetChildren() do
                                if v65:IsA("Decal") then
                                    v63 = true;
                                    v65.Transparency = 0;
                                end;
                            end;
                            if not v63 then
                                v62.Transparency = 0;
                            end;
                        end;
                        v66(v60.Dirt);
                        task.wait(0.7);
                        v60.Dirt:Destroy();
                        v66(v60.Crafting);
                        task.wait(0.35);
                        v60.Crafting:Destroy();
                        v66(v60.Gold);
                        task.wait(0.25);
                        v60.Gold:Destroy();
                        v66(v60.Wood);
                        task.wait(0.1);
                        v60.Wood:Destroy();
                        v66(v60.Pickaxe);
                        task.wait(0.7);
                        v60.Pickaxe:Destroy();
                        v66(v60.Steak);
                        task.wait(0.5);
                        local v67 = script.Food.Attachment:Clone();
                        v67.Parent = v22.GetWeldCharacter(l_Character_0):FindFirstChild("Head") or l_Character_0.Head;
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = l_Character_0.PrimaryPart, 
                            DirectCopy = script.Sounds.Eat
                        });
                        task.wait(1.5);
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = l_Character_0.PrimaryPart, 
                            DirectCopy = script.Sounds.Eat
                        });
                        task.wait(1.5);
                        for _, v69 in v67:GetChildren() do
                            v69.Enabled = false;
                        end;
                        task.wait(3);
                        v67:Destroy();
                    end)
                };
                local function v75(v71) --[[ Line: 226 ]] --[[ Name: HitEffect ]]
                    -- upvalues: v22 (ref), l_Character_0 (copy)
                    local v72 = script.HitEffect.Hit:Clone();
                    v72.Parent = v22.GetWeldCharacter(l_Character_0).PrimaryPart;
                    for _, v74 in v72:GetChildren() do
                        v74:Emit(v71);
                    end;
                    task.delay(3, function() --[[ Line: 234 ]]
                        -- upvalues: v72 (copy)
                        v72:Destroy();
                    end);
                end;
                v70[2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hurt"):Connect(function() --[[ Line: 239 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Character_0 (copy), v22 (ref), v75 (copy)
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Hurt
                    });
                    local v76 = script.Highlight:Clone();
                    v76.Parent = v22.GetWeldCharacter(l_Character_0);
                    v76.Adornee = l_Character_0;
                    v75(3);
                    task.wait(0.2);
                    v76:Destroy();
                end);
                v70[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 256 ]]
                    -- upvalues: v60 (copy)
                    if v60 then
                        v60:Destroy();
                    end;
                end);
                v75(5);
                local v77 = script.Highlight:Clone();
                v77.Parent = v22.GetWeldCharacter(l_Character_0);
                v77.Adornee = l_Character_0;
                task.delay(0.2, function() --[[ Line: 265 ]]
                    -- upvalues: v77 (copy)
                    v77:Destroy();
                end);
                local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                local l_CameraTarget_0 = l_CameraSettings_0.CameraTarget;
                local _ = l_CameraSettings_0.CameraMode;
                local l_Variant_0 = l_CameraSettings_0.Variant;
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Character_0.PrimaryPart, 
                    DirectCopy = script.Sounds.Hurt
                });
                local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
                local _ = l_PrimaryPart_0.CFrame;
                local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
                local v85 = {
                    Victim = l_Character_0, 
                    LookVector = l_LookVector_0, 
                    EndPosition = v51, 
                    VictimPosition = l_PrimaryPart_0.Position, 
                    TargetVector = v51 - v51, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_0, 
                    TargetTime = 0.6410256410256411, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v85);
                if l_Occupied_0 and l_LocalPlayer_0.Character == l_Character_0 then
                    l_Occupied_0.Target.Value = l_LookVector_0;
                    l_Occupied_0.LockedOn.Value = l_Damager_0;
                end;
                local l_Vignette_0 = l_Main_0.DownFrame.Vignette;
                local v87 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v87, {
                        ImageTransparency = 0.6
                    }):Play();
                end;
                local l_CameraMode_1 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_SoundHelper_0:PlaySound({
                        Name = "Cheering", 
                        Parent = l_Workspace_0.Debris
                    });
                    task.delay(0.2, function() --[[ Line: 322 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "KnockdownStart", 
                            Parent = l_Workspace_0.Debris
                        });
                    end);
                    task.delay(2.5, function() --[[ Line: 329 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Ringing", 
                            Parent = l_Workspace_0.Debris
                        });
                    end);
                    task.defer(function() --[[ Line: 336 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "Knockdown", 
                            WaitTime = 0.3, 
                            Fade = 1.5, 
                            FoV = 55, 
                            FoVMult = 1
                        });
                    end);
                    v22.HUDShake({
                        Scale = 20, 
                        Damper = 0.09999999999999999
                    });
                    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_0.Saturation = 0;
                    l_ColorCorrection_0.Contrast = 0;
                    l_ColorCorrection_0.Enabled = true;
                    local v90 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_0, v90, {
                        Saturation = 0.2, 
                        Contrast = 0.15
                    }):Play();
                    local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_0.Size = 0;
                    l_MenuBlur_0.Enabled = true;
                    local v92 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_0, v92, {
                        Size = 10
                    }):Play();
                    local v93 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v93, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(0.6410256410256411, function() --[[ Line: 370 ]]
                        -- upvalues: v22 (ref), v43 (copy)
                        v22.TripleText({
                            Image = v43.Down
                        });
                    end);
                    task.delay(0.6410256410256411, function() --[[ Line: 376 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                end;
                task.wait(2);
                local v94 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                task.defer(function() --[[ Line: 390 ]]
                    -- upvalues: v22 (ref), l_Character_0 (copy), v28 (copy), v0 (ref), v44 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy)
                    v22.DownCount({
                        Character = l_Character_0, 
                        Name = "Crafted", 
                        Speed = v28.ExtraTime / (v0.DelayTime + v28.ExtraTime), 
                        IsBillboard = not (v44 or l_LocalPlayer_0.Character == l_Damager_0)
                    });
                end);
                local function v104(v95, v96) --[[ Line: 400 ]] --[[ Name: SetTransparency ]]
                    -- upvalues: l_ReplicatedStorage_0 (ref), l_Workspace_0 (ref)
                    for _, v98 in v95:GetDescendants() do
                        if v98.Name == "UnusualParticle" then
                            v98.Enabled = v96 == 0;
                            if not v98.Enabled then
                                local l_Parent_1 = v98.Parent;
                                v98.Parent = l_ReplicatedStorage_0;
                                v98.Parent = l_Parent_1;
                            end;
                        end;
                        if (v98:IsA("BasePart") or v98:IsA("Decal")) and v98.LocalTransparencyModifier < 1000 then
                            v98.LocalTransparencyModifier = v96;
                        end;
                    end;
                    local l_FirstChild_1 = l_Workspace_0.Welds:FindFirstChild(v95.Name);
                    if l_FirstChild_1 then
                        for _, v102 in l_FirstChild_1:GetDescendants() do
                            if v102.Name == "UnusualParticle" then
                                v102.Enabled = v96 == 0;
                                if not v102.Enabled then
                                    local l_Parent_2 = v102.Parent;
                                    v102.Parent = l_ReplicatedStorage_0;
                                    v102.Parent = l_Parent_2;
                                end;
                            end;
                            if (v102:IsA("BasePart") or v102:IsA("Decal")) and v102.LocalTransparencyModifier < 1000 then
                                v102.LocalTransparencyModifier = v96;
                            end;
                        end;
                    end;
                end;
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_Variant_0.Value = "Craft";
                    l_CameraMode_1.Value = "Knockdown";
                    l_CameraTarget_0.Value = l_Character_0;
                    v104(l_Damager_0, 1);
                    l_TweenService_0:Create(l_Vignette_0, v87, {
                        ImageTransparency = 0.2
                    }):Play();
                    l_TweenService_0:Create(l_Lighting_0, v94, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.2
                    }):Play();
                    task.delay(1, function() --[[ Line: 447 ]]
                        -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v94 (copy)
                        l_TweenService_0:Create(l_Lighting_0, v94, {
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
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v87, {
                        ImageTransparency = 1
                    }):Play();
                end;
                local _ = {
                    HoldTime = 1.5
                };
                if v45 then
                    task.defer(function() --[[ Line: 471 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.4, 
                            Fade = 2
                        });
                    end);
                end;
                task.wait(0.2);
                task.wait(v0.DelayTime - l_Workspace_0.Ping.Value / 2 + v28.ExtraTime);
                l_l_AnimHelper_0_Anim_0:Stop(0.5);
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v87, {
                        ImageTransparency = 1
                    }):Play();
                    l_CameraMode_1.Value = "";
                    l_Variant_0.Value = "";
                    v104(l_Damager_0, 0);
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                task.delay(0.75, function() --[[ Line: 500 ]]
                    -- upvalues: v29 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v44 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v22 (ref), v43 (copy), l_Workspace_0 (ref)
                    print(v29 - tick());
                    l_SoundHelper_0:PlaySound({
                        Name = "BoxLayer", 
                        Parent = l_Character_0.PrimaryPart
                    });
                    if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                        v22.TripleText({
                            Image = v43.Box, 
                            HoldTime = 0.6666666666666666
                        });
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.4, 
                            Fade = 0.7
                        });
                    end;
                    task.wait(0.2);
                    if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                        l_SoundHelper_0:PlaySound({
                            Name = "Box", 
                            Parent = l_Workspace_0.Debris
                        });
                    end;
                end);
                for _, v107 in v70 do
                    v107:Disconnect();
                end;
                if l_Occupied_0 and l_Occupied_0:FindFirstChild("Target") then
                    l_Occupied_0.Target.Value = Vector3.new();
                end;
                if v44 then
                    l_CameraMode_1.Value = "";
                end;
                if l_Damager_0 and l_Damager_0.PrimaryPart then
                    l_Damager_0.PrimaryPart.Anchored = false;
                end;
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = false;
                end;
                for v108, v109 in v52 do
                    v108.CollisionGroup = v109;
                end;
                task.delay(5, function() --[[ Line: 552 ]]
                    -- upvalues: v43 (copy)
                    if v43 then
                        v43:Destroy();
                    end;
                end);
                return;
            end;
        end;
    end;
    v0.KO = function(v110) --[[ Line: 557 ]] --[[ Name: KO ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), v22 (copy), l_SoundHelper_0 (copy), v23 (copy), l_Bezier_0 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), l_Lighting_0 (copy)
        local l_Character_1 = v110.Character;
        local l_Damager_1 = v110.Damager;
        local l_StartPosition_1 = v110.StartPosition;
        local l_LookVector_1 = v110.LookVector;
        local l_FirstChild_2 = l_Workspace_0.States:FindFirstChild(l_Character_1.Name);
        local l_CharacterData_1 = l_FirstChild_2:FindFirstChild("CharacterData");
        local l_PlayerData_1 = l_FirstChild_2:FindFirstChild("PlayerData");
        local l_Occupied_1 = l_FirstChild_2:FindFirstChild("Occupied");
        if not l_CharacterData_1 or not l_PlayerData_1 or not l_Occupied_1 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_1);
            local l_Humanoid_2 = l_Character_1:FindFirstChild("Humanoid");
            local v121 = l_Humanoid_2 and l_Humanoid_2:FindFirstChild("Animator");
            local l_Humanoid_3 = l_Damager_1:FindFirstChild("Humanoid");
            local v123 = l_Humanoid_3 and l_Humanoid_3:FindFirstChild("Animator");
            if not v121 or not v123 then
                return;
            else
                local v124 = l_Assets_0.DownFrames.Default:Clone();
                local v125 = l_LocalPlayer_0.Character == l_Character_1;
                if v125 or l_LocalPlayer_0.Character == l_Damager_1 then
                    v124.Parent = l_Common_0;
                end;
                local v126 = v125 or l_LocalPlayer_0.Character == l_Damager_1;
                local v127 = 4;
                local l_l_RayHelper_0_EnvironmentWhitelist_1 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_1, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_1, l_StartPosition_1 - l_LookVector_1, v127 + 2, l_l_RayHelper_0_EnvironmentWhitelist_1);
                local v132 = l_StartPosition_1 - l_LookVector_1 * v127;
                if l_l_RayHelper_0_RayWithWhiteList_1 then
                    v132 = l_StartPosition_1 - l_LookVector_1 * 2;
                end;
                local v133 = {};
                for _, v135 in l_Character_1:GetChildren() do
                    if v135:IsA("BasePart") and v135 ~= l_Character_1.PrimaryPart then
                        v133[v135] = v135.CollisionGroup;
                        v135.CollisionGroup = "None";
                    end;
                end;
                if not l_Character_1 or l_Character_1.PrimaryPart then

                end;
                for _, v137 in (v123:GetPlayingAnimationTracks()) do
                    if v137.Priority ~= Enum.AnimationPriority.Idle then
                        local l_Speed_1 = v137.Speed;
                        v137:AdjustSpeed(l_Speed_1 / 1.7);
                        task.delay(1, function() --[[ Line: 623 ]]
                            -- upvalues: v137 (copy), l_Speed_1 (copy)
                            if not v137 then
                                return;
                            else
                                v137:AdjustSpeed(l_Speed_1);
                                return;
                            end;
                        end);
                    end;
                end;
                local v139 = {
                    AnimId = v0.Animations.KO, 
                    FadeIn = 0.05, 
                    AnimSpeed = 0.58, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_2, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v139);
                local v141 = script.Highlight:Clone();
                v141.Parent = v22.GetWeldCharacter(l_Character_1);
                v141.Adornee = l_Character_1;
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Character_1.PrimaryPart, 
                    DirectCopy = script.Sounds.Death
                });
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Character_1.PrimaryPart, 
                    DirectCopy = script.Sounds.Hurt
                });
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = l_Character_1.PrimaryPart, 
                    DirectCopy = script.Sounds.Song
                });
                if l_LocalPlayer_0.Character == l_Damager_1 then
                    local l_FirstChild_3 = l_Workspace_0.States:FindFirstChild(l_Damager_1.Name);
                    local l_CharacterData_2 = l_FirstChild_3:FindFirstChild("CharacterData");
                    local _ = l_FirstChild_3:FindFirstChild("Occupied");
                    l_CharacterData_2.Cutscene.Value = false;
                end;
                local v145 = l_LocalPlayer_0.Character == l_Character_1;
                task.delay(1.6666666666666667 / v139.AnimSpeed, function() --[[ Line: 675 ]]
                    -- upvalues: v141 (copy), l_Workspace_0 (ref), l_Character_1 (copy), v145 (copy), l_l_AnimHelper_0_Anim_1 (copy)
                    v141:Destroy();
                    local v146 = script.Particles:Clone();
                    v146.Parent = l_Workspace_0.Debris;
                    v146.CFrame = l_Character_1.PrimaryPart.CFrame * CFrame.new(0, -0.15, 0);
                    for _, v148 in v146:GetChildren() do
                        v148:Emit(12);
                    end;
                    local v149 = nil;
                    if not v145 then
                        v149 = script.KnockdownGui:Clone();
                        v149.CFrame = l_Character_1.PrimaryPart.CFrame;
                        v149.Parent = l_Workspace_0.Debris;
                    end;
                    task.wait(0.2);
                    l_l_AnimHelper_0_Anim_1.TimePosition = 1.8333333333333333;
                    l_l_AnimHelper_0_Anim_1:AdjustSpeed(0);
                    task.wait(4);
                    v146:Destroy();
                    l_l_AnimHelper_0_Anim_1:Stop(0);
                    v149:Destroy();
                end);
                task.delay(0.5, function() --[[ Line: 704 ]]
                    -- upvalues: v132 (ref), l_Workspace_0 (ref), v23 (ref), l_Bezier_0 (ref), l_RunService_0 (ref), l_TweenService_0 (ref), l_Damager_1 (copy), l_SoundHelper_0 (ref)
                    local v150 = {};
                    local v151 = v132 + Vector3.new(0, 0.5, 0, 0);
                    for _, v153 in script.Drops:GetChildren() do
                        local v154 = v153:Clone();
                        v154.Parent = l_Workspace_0.Debris;
                        v154:SetPrimaryPartCFrame(CFrame.new(v151));
                        local l_Unit_0 = (v23:NextUnitVector() * Vector3.new(1, 0, 1, 0)).Unit;
                        local v156 = v23:NextNumber(1.5, 6);
                        local v157 = v151 - Vector3.new(0, 2.6500000953674316, 0, 0) + l_Unit_0 * v156;
                        local v158 = (v157 + v151) / 2 + Vector3.new(0, 1.5, 0, 0);
                        local v159 = v157 + l_Unit_0 * (v156 / 20);
                        local v160 = v159 + l_Unit_0 * (v156 / 6);
                        table.insert(v150, {
                            Model = v154, 
                            Points = {
                                v159, 
                                v160
                            }, 
                            Curve = l_Bezier_0.new(v151, v158, v158, v157), 
                            RandomDelay = v23:NextNumber(0, 1)
                        });
                    end;
                    local v161 = nil;
                    local v162 = 0;
                    v161 = l_RunService_0.RenderStepped:Connect(function(v163) --[[ Line: 738 ]]
                        -- upvalues: v162 (ref), l_TweenService_0 (ref), v150 (ref), l_Damager_1 (ref), l_SoundHelper_0 (ref), v23 (ref)
                        local v164 = math.clamp(v162 / 0.75, 0, 1);
                        local v165 = math.clamp((v162 - 0.75) / 2, 0, 1);
                        v165 = l_TweenService_0:GetValue(v165, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
                        for _, v167 in v150 do
                            local l_Model_0 = v167.Model;
                            local l_Curve_0 = v167.Curve;
                            local l_Points_0 = v167.Points;
                            local l_RandomDelay_0 = v167.RandomDelay;
                            if not v167.Finished and l_Model_0 then
                                local v172 = CFrame.new(0, math.sin((l_RandomDelay_0 + v162) * 1.5) / 5, 0) * CFrame.Angles(0, math.rad(l_RandomDelay_0 + v162) * 10, 0);
                                if v164 < 1 then
                                    l_Model_0:SetPrimaryPartCFrame(CFrame.new(l_Curve_0:Get(v164)) * v172);
                                elseif (l_Model_0.PrimaryPart.Position - l_Damager_1.PrimaryPart.Position).Magnitude <= 5 then
                                    if not v167.FinishData then
                                        v167.FinishData = {
                                            CurrentPos = l_Model_0.PrimaryPart.Position, 
                                            TargetPos = l_Damager_1.PrimaryPart.Position, 
                                            CFrameAdd = v172, 
                                            StartTime = tick()
                                        };
                                    end;
                                    local l_FinishData_0 = v167.FinishData;
                                    local l_CFrameAdd_0 = l_FinishData_0.CFrameAdd;
                                    local l_StartTime_0 = l_FinishData_0.StartTime;
                                    local l_CurrentPos_0 = l_FinishData_0.CurrentPos;
                                    local l_TargetPos_0 = l_FinishData_0.TargetPos;
                                    l_TargetPos_0 = Vector3.new(l_TargetPos_0.X, l_CurrentPos_0.Y + 0.15, l_TargetPos_0.Z);
                                    local v178 = math.clamp((tick() - l_StartTime_0) / 0.35, 0, 1);
                                    v178 = l_TweenService_0:GetValue(v178, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
                                    l_Model_0:SetPrimaryPartCFrame(CFrame.new(l_CurrentPos_0 + (l_TargetPos_0 - l_CurrentPos_0) * v178) * l_CFrameAdd_0);
                                    if v178 >= 0.8 then
                                        v167.Finished = true;
                                        l_Model_0:Destroy();
                                        l_SoundHelper_0:PlaySound({
                                            Name = "Pop2", 
                                            Speed = v23:NextNumber(1.3, 1.7), 
                                            Parent = l_Damager_1.PrimaryPart
                                        });
                                    end;
                                else
                                    local l_new_0 = CFrame.new;
                                    local v180 = l_Points_0[1];
                                    l_Model_0:SetPrimaryPartCFrame(l_new_0(v180 + (l_Points_0[2] - v180) * v165) * v172);
                                end;
                            end;
                        end;
                        v162 = v162 + v163;
                    end);
                    task.wait(8);
                    v161:Disconnect();
                    for _, v182 in v150 do
                        v182.Model:Destroy();
                    end;
                    v150 = {};
                end);
                local l_PrimaryPart_1 = l_Character_1.PrimaryPart;
                local _ = l_PrimaryPart_1.CFrame;
                local l_l_Workspace_0_ServerTimeNow_1 = l_Workspace_0:GetServerTimeNow();
                local v186 = {
                    Victim = l_Character_1, 
                    LookVector = l_LookVector_1, 
                    EndPosition = v132, 
                    VictimPosition = l_PrimaryPart_1.Position, 
                    TargetVector = v132 - v132, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_1, 
                    TargetTime = 0.6410256410256411, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v186);
                if l_Occupied_1 and l_LocalPlayer_0.Character == l_Character_1 then
                    l_Occupied_1.Target.Value = l_LookVector_1;
                    l_Occupied_1.LockedOn.Value = l_Damager_1;
                end;
                local l_Vignette_1 = l_Main_0.DownFrame.Vignette;
                local v188 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v145 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v188, {
                        ImageTransparency = 0.6
                    }):Play();
                end;
                local l_CameraMode_2 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                if v145 then
                    local v190 = script.UIFrame:Clone();
                    v190.Name = "TransitionRemove";
                    v190.Parent = l_Common_0;
                    local v191 = script.ColorCorrection:Clone();
                    v191.Name = "TransitionRemove";
                    v191.Parent = game.Lighting;
                    l_CameraMode_2.Value = "Cutscene";
                    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        FieldOfView = 60
                    }):Play();
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                        CFrame = l_CurrentCamera_0.CFrame * CFrame.new(-2.8, -0.5, 2.2) * CFrame.Angles(0, 0, 0.08726646259971647)
                    }):Play();
                    local l_v191_0 = v191 --[[ copy: 39 -> 44 ]];
                    local l_v190_0 = v190 --[[ copy: 38 -> 45 ]];
                    task.delay(10, function() --[[ Line: 875 ]]
                        -- upvalues: l_v191_0 (copy), l_v190_0 (copy)
                        if l_v191_0 then
                            l_v191_0:Destroy();
                        end;
                        if l_v190_0 then
                            l_v190_0:Destroy();
                        end;
                    end);
                end;
                if v145 or l_LocalPlayer_0.Character == l_Damager_1 then
                    task.defer(function() --[[ Line: 882 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "Knockdown", 
                            WaitTime = 0.3, 
                            Fade = 1.5, 
                            FoV = 55, 
                            FoVMult = 1
                        });
                    end);
                    v22.HUDShake({
                        Scale = 20, 
                        Damper = 0.09999999999999999
                    });
                    local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_1.Saturation = 0;
                    l_ColorCorrection_1.Contrast = 0;
                    l_ColorCorrection_1.Enabled = true;
                    local v196 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_1, v196, {
                        Saturation = -1, 
                        Contrast = 0.5
                    }):Play();
                    local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_1.Size = 0;
                    l_MenuBlur_1.Enabled = true;
                    local v198 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_1, v198, {
                        Size = 10
                    }):Play();
                    local v199 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v199, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(0.6410256410256411, function() --[[ Line: 916 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                end;
                task.wait(1);
                if v145 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v188, {
                        ImageTransparency = 1
                    }):Play();
                end;
                local v200 = {
                    HoldTime = 1.5
                };
                if v126 then
                    task.defer(function() --[[ Line: 938 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.4, 
                            Fade = 2
                        });
                    end);
                end;
                task.wait(0.2);
                if l_LocalPlayer_0.Character == l_Damager_1 then
                    l_SoundHelper_0:PlaySound({
                        Name = "Box", 
                        Volume = 0.125, 
                        Parent = l_Workspace_0.Debris
                    });
                    task.defer(function() --[[ Line: 962 ]]
                        -- upvalues: v200 (copy), v124 (copy), v22 (ref)
                        v200.Image = v124.KO.K;
                        v22.TripleText(v200);
                    end);
                end;
                task.wait(v0.DelayTime - l_Workspace_0.Ping.Value / 2);
                if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                    l_Occupied_1.Target.Value = Vector3.new();
                end;
                if v145 then
                    l_CameraMode_2.Value = "";
                end;
                task.wait(5);
                if l_Damager_1 and l_Damager_1.PrimaryPart then
                    l_Damager_1.PrimaryPart.Anchored = false;
                end;
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = false;
                end;
                for v201, v202 in v133 do
                    v201.CollisionGroup = v202;
                end;
                task.delay(5, function() --[[ Line: 989 ]]
                    -- upvalues: v124 (copy)
                    if v124 then
                        v124:Destroy();
                    end;
                end);
                return;
            end;
        end;
    end;
    v0.Use = function(v203) --[[ Line: 994 ]] --[[ Name: Use ]]
        -- upvalues: v0 (copy)
        local _ = v203.Character;
        local _ = v203.Damager;
        if v203.IsKO then
            v0.KO(v203);
            return;
        else
            v0.Main(v203);
            return;
        end;
    end;
    return v0;
end;