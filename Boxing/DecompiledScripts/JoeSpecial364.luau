local v0 = {
    DelayTime = 8.2, 
    ServerDelayTime = 11.2, 
    Metadata = {
        DisplayName = "HOW ARE YOU SEEING THIS", 
        GlowColor = Color3.fromRGB(48, 178, 248), 
        IgnoreShop = true
    }, 
    Animations = {
        Start = 16728914680, 
        Loop = 16728929255, 
        End = 82128760035670
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
    local v17 = require(l_Modules_0.Cutscene.Utilities);
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
    local l_Common_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
    local l_SimulateKnockbackBE_0 = l_ReplicatedStorage_0:WaitForChild("RemoteEvents"):WaitForChild("SimulateKnockbackBE");
    local l_Parent_0 = script.Parent.Parent;
    local v23 = require(l_Parent_0);
    local _ = Random.new();
    local function _(v25, v26, v27) --[[ Line: 56 ]] --[[ Name: Lerp ]]
        return v25 + (v26 - v25) * v27;
    end;
    v0.Main = function(v29) --[[ Line: 58 ]] --[[ Name: Main ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_RayHelper_0 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy), v23 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_SoundHelper_0 (copy), l_Main_0 (copy), l_RunService_0 (copy), v17 (copy)
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
                local v46 = nil;
                if v45 then
                    v46 = script.ScreenGui:Clone();
                    v46.Parent = l_LocalPlayer_0.PlayerGui;
                    v46.CanvasGroup.VideoFrame.Looped = true;
                    v46.CanvasGroup.VideoFrame:Play();
                end;
                local v47 = 3;
                local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_0, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_0, l_StartPosition_0 - l_LookVector_0, v47 + 0, l_l_RayHelper_0_EnvironmentWhitelist_0);
                local v52 = l_StartPosition_0 - l_LookVector_0 * v47;
                if l_l_RayHelper_0_RayWithWhiteList_0 then
                    v52 = l_StartPosition_0 - l_LookVector_0 * 1;
                end;
                local v53 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Lighting_0, v53, {
                        ExposureCompensation = l_Workspace_0.Exposure.Value - 0.1
                    }):Play();
                end;
                task.delay(1.3111111111111113, function() --[[ Line: 121 ]]
                    -- upvalues: v52 (ref), l_LookVector_0 (copy), l_Workspace_0 (ref), v44 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v23 (ref)
                    local v54 = script.FallSmoke:Clone();
                    v54.Position = (CFrame.lookAt(v52, v52 + l_LookVector_0) * CFrame.new(0, 0, 1.5)).Position - Vector3.new(0, 2.8499999046325684, 0, 0);
                    v54.Parent = l_Workspace_0.Debris;
                    for _, v56 in v54.Particle:GetChildren() do
                        v56.Enabled = false;
                        v56:Emit(v56:GetAttribute("EmitCount"));
                    end;
                    if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                        task.defer(function() --[[ Line: 132 ]]
                            -- upvalues: v23 (ref)
                            v23.CameraShake({
                                Preset = "Knockdown", 
                                WaitTime = 0.3, 
                                Fade = 1, 
                                FoV = 55, 
                                FoVMult = 1
                            });
                        end);
                        v23.HUDShake({
                            Scale = 20, 
                            Damper = 0.09999999999999999
                        });
                    end;
                    task.wait(8);
                    v54:Destroy();
                end);
                local v57 = {};
                for _, v59 in l_Character_0:GetChildren() do
                    if v59:IsA("BasePart") and v59 ~= l_Character_0.PrimaryPart then
                        v57[v59] = v59.CollisionGroup;
                        v59.CollisionGroup = "None";
                    end;
                end;
                if not l_Character_0 or l_Character_0.PrimaryPart then

                end;
                for _, v61 in (v42:GetPlayingAnimationTracks()) do
                    if v61.Priority == Enum.AnimationPriority.Action or v61.Priority == Enum.AnimationPriority.Action2 or v61.Priority == Enum.AnimationPriority.Action3 then
                        local l_Speed_0 = v61.Speed;
                        v61:AdjustSpeed(l_Speed_0 / 1.8);
                        task.delay(1.377777777777778, function() --[[ Line: 172 ]]
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
                    FadeIn = 0.05, 
                    NameFade = 0.1, 
                    AnimSpeed = 0.75, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = v40, 
                    Weight = 1000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v63);
                task.delay(1.377777777777778, function() --[[ Line: 191 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_0 (copy)
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.7);
                end);
                local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
                local l_CFrame_0 = l_PrimaryPart_0.CFrame;
                local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
                local v68 = {
                    Victim = l_Character_0, 
                    LookVector = l_LookVector_0, 
                    EndPosition = v52, 
                    VictimPosition = l_PrimaryPart_0.Position, 
                    TargetVector = v52 - v52, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_0, 
                    TargetTime = 1.377777777777778, 
                    HitIndex = 4
                };
                l_SimulateKnockbackBE_0:Fire(v68);
                local v69 = script.Knockdown:Clone();
                v69.CFrame = CFrame.lookAt(l_CFrame_0.Position, v52);
                v69.Position = v69.Position + Vector3.new(0, 0.75, 0, 0);
                v69.Parent = l_Workspace_0.Debris;
                for _, v71 in v69.Particle:GetChildren() do
                    v71.Enabled = false;
                    v71:Emit(v71:GetAttribute("EmitCount"));
                end;
                task.delay(6, function() --[[ Line: 225 ]]
                    -- upvalues: v69 (copy)
                    v69:Destroy();
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
                local _ = l_CameraSettings_0.CameraTarget;
                local l_CameraMode_0 = l_CameraSettings_0.CameraMode;
                local l_Variant_0 = l_CameraSettings_0.Variant;
                local l_Vignette_0 = l_Main_0.DownFrame.Vignette;
                local v77 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v77, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v44 then
                    l_Occupied_0.LerpMult.Value = 0.1;
                end;
                if v45 then
                    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_0.Saturation = 0;
                    l_ColorCorrection_0.Contrast = 0;
                    l_ColorCorrection_0.Enabled = true;
                    local v79 = TweenInfo.new(2.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_0, v79, {
                        Saturation = -1.1, 
                        Contrast = 1.3
                    }):Play();
                    local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_0.Size = 0;
                    l_MenuBlur_0.Enabled = true;
                    local v81 = TweenInfo.new(2.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_0, v81, {
                        Size = 30
                    }):Play();
                end;
                task.wait(1.3944444444444446);
                local v82 = {};
                if v45 then
                    local _ = task.defer(function() --[[ Line: 281 ]]
                        -- upvalues: v46 (ref), l_TweenService_0 (ref), v82 (copy), l_RunService_0 (ref)
                        local l_MainFrame_0 = v46.CanvasGroup.MainFrame;
                        local l_MainLines_0 = l_MainFrame_0.MainLines;
                        local v85 = {
                            13884254447, 
                            13884254190, 
                            13884254026, 
                            13884253824, 
                            13884245899, 
                            13884245737, 
                            13884245536, 
                            13884245383, 
                            13884245250, 
                            13884245109
                        };
                        local v86 = 1;
                        local v87 = 0;
                        v46.Sound:Play();
                        l_TweenService_0:Create(v46.Sound, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Volume = 0.1
                        }):Play();
                        v82[#v82 + 1] = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 293 ]]
                            -- upvalues: v87 (ref), l_MainLines_0 (copy), v85 (copy), v86 (ref)
                            local v88 = tick();
                            if v88 - v87 >= 0.01 then
                                l_MainLines_0.Image = "rbxassetid://" .. v85[v86];
                                v86 = v86 + 1;
                                if v86 > #v85 then
                                    v86 = 1;
                                end;
                                v87 = v88;
                            end;
                        end);
                        v82[#v82 + 1] = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 308 ]]
                            -- upvalues: l_MainFrame_0 (copy)
                            if not l_MainFrame_0:FindFirstChild("RGBStatic") then
                                return;
                            else
                                l_MainFrame_0.RGBStatic.Position = UDim2.new(-math.random(20, 80) / 100, 0, 0, 0);
                                l_MainFrame_0.Lines.Position = UDim2.new(math.random(-1125, 125) / 1000, 0, 0, 0);
                                l_MainFrame_0.Static.Position = UDim2.new(-math.random(20, 80) / 100, 0, -math.random(20, 80) / 100, 0);
                                l_MainFrame_0.LeftBarOld.SideJitter.Position = UDim2.new(-math.random(20, 80) / 1000, 0, math.random(-1000, 0) / 1000, 0);
                                l_MainFrame_0.RightBarOld.SideJitter.Position = UDim2.new(-math.random(20, 80) / 1000, 0, math.random(-1000, 0) / 1000, 0);
                                l_MainFrame_0.TextFrame.Position = UDim2.new(0.5 + math.random(-100, 100) / 300000, 0, 0.5 + math.random(-100, 100) / 200000, 0);
                                return;
                            end;
                        end);
                    end);
                    v46.Enabled = true;
                    l_TweenService_0:Create(v46.Cover, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        BackgroundTransparency = 1
                    }):Play();
                    task.delay(2, function() --[[ Line: 328 ]]
                        -- upvalues: v46 (ref), l_Character_0 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_TweenService_0 (ref), v17 (ref), v23 (ref), l_Lighting_0 (ref), v45 (copy), l_CharacterData_0 (copy)
                        local l_MainFrame_1 = v46.CanvasGroup.MainFrame;
                        if l_Character_0:GetAttribute("ActiveNPC") then
                            l_MainFrame_1.TextFrame.Text1.Text = "I won't...";
                            l_MainFrame_1.TextFrame.Text2.Text = "I won't give up!";
                        else
                            l_SoundHelper_0:PlaySound({
                                Name = "Knockdown", 
                                Parent = l_Workspace_0.Debris, 
                                DirectCopy = script.Sounds.Standup
                            });
                        end;
                        local function v93(v91) --[[ Line: 342 ]] --[[ Name: AnimateText ]]
                            -- upvalues: l_TweenService_0 (ref)
                            local l_Size_0 = v91.Size;
                            v91.Size = UDim2.new(v91.Size.X.Scale, 0, v91.Size.Y.Scale * 1.1, 0);
                            l_TweenService_0:Create(v91, TweenInfo.new(0.03333333333333333, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                Size = l_Size_0
                            }):Play();
                        end;
                        task.wait(0.2);
                        l_MainFrame_1.TextFrame.Text1.Visible = true;
                        v93(l_MainFrame_1.TextFrame.Text1);
                        task.wait(0.9);
                        l_MainFrame_1.TextFrame.Text1.Visible = false;
                        task.wait(0.2);
                        l_MainFrame_1.TextFrame.Text2.Visible = true;
                        v93(l_MainFrame_1.TextFrame.Text2);
                        task.wait(1.1);
                        local v94 = TweenInfo.new(1.1, Enum.EasingStyle.Quint, Enum.EasingDirection.In);
                        l_TweenService_0:Create(l_MainFrame_1.LeftBarOld, v94, {
                            Position = UDim2.new(-0.3, 0, 0, 0)
                        }):Play();
                        l_TweenService_0:Create(l_MainFrame_1.RightBarOld, v94, {
                            Position = UDim2.new(1.2, 0, 0, 0)
                        }):Play();
                        task.delay(0.5, function() --[[ Line: 364 ]]
                            -- upvalues: l_TweenService_0 (ref), v46 (ref)
                            local v95 = TweenInfo.new(1.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In);
                            l_TweenService_0:Create(v46.CanvasGroup, v95, {
                                Size = UDim2.new(1.2, 0, 1.2, 0)
                            }):Play();
                        end);
                        v46.CanvasGroup.VideoFrame.Looped = false;
                        v46.CanvasGroup.VideoFrame.TimePosition = 0;
                        v46.CanvasGroup.VideoFrame.Visible = true;
                        v46.Burst:Play();
                        task.wait(0.9);
                        v46.Cover.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                        l_TweenService_0:Create(v46.Cover, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundTransparency = 0
                        }):Play();
                        local v96 = RaycastParams.new();
                        v96.FilterType = Enum.RaycastFilterType.Exclude;
                        v96.FilterDescendantsInstances = {
                            workspace.Debris, 
                            l_Workspace_0.Live
                        };
                        local v97 = script.Fire:Clone();
                        v97.Parent = workspace.Debris;
                        game.Debris:AddItem(v97, 8);
                        local v98 = workspace:Raycast(l_Character_0.UpperTorso.Position, Vector3.new(-0, -10, -0, -0), v96);
                        if v98 then
                            local v99 = v17.GetRaySurface(v98);
                            local l_CFrame_1 = l_Character_0.HumanoidRootPart.CFrame;
                            v97.CFrame = CFrame.new(v99.Position + Vector3.new(0, 0.10000000149011612, 0, 0), l_CFrame_1 * CFrame.new(0, 0, -40000).Position);
                        end;
                        task.delay(1.45, function() --[[ Line: 395 ]]
                            -- upvalues: v17 (ref), v97 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                            v17.Emit(v97);
                            l_SoundHelper_0:PlaySound({
                                Name = "Knockdown", 
                                Parent = l_Workspace_0.Debris, 
                                DirectCopy = script.Sounds.Explosion
                            });
                            for _, v102 in v97:GetDescendants() do
                                if v102:IsA("ParticleEmitter") then
                                    v102.Enabled = true;
                                    v102.TimeScale = v102.TimeScale * 0.65;
                                end;
                            end;
                            task.wait(0.4);
                            for _, v104 in v97:GetDescendants() do
                                if v104:IsA("ParticleEmitter") then
                                    v104.Enabled = false;
                                end;
                            end;
                        end);
                        task.wait(1.5);
                        task.defer(function() --[[ Line: 422 ]]
                            -- upvalues: v23 (ref)
                            v23.CameraShake({
                                Preset = "Knockdown", 
                                WaitTime = 1.2, 
                                Fade = 1.5, 
                                FoV = 110, 
                                FoVMult = 1.85
                            });
                        end);
                        v46.CanvasGroup.Visible = false;
                        local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_1.Size = 30;
                        l_MenuBlur_1.Enabled = true;
                        local v106 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
                        l_TweenService_0:Create(l_MenuBlur_1, v106, {
                            Size = 0
                        }):Play();
                        local v107 = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0);
                        l_Lighting_0.ExposureCompensation = 5;
                        l_TweenService_0:Create(l_Lighting_0, v107, {
                            ExposureCompensation = l_Workspace_0.Exposure.Value
                        }):Play();
                        l_TweenService_0:Create(v46.Cover, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            BackgroundTransparency = 1
                        }):Play();
                        task.wait(0.8);
                        if v45 then
                            l_Workspace_0:SetAttribute("VolumeOverride", 0);
                            task.wait(1.4);
                            l_Workspace_0:SetAttribute("VolumeOverride", nil);
                            l_Workspace_0:SetAttribute("DefaultPlaylist", "JoeLastStock");
                            local v108 = nil;
                            do
                                local l_v108_0 = v108;
                                l_v108_0 = l_CharacterData_0.Opponent.Changed:Connect(function() --[[ Line: 458 ]]
                                    -- upvalues: l_v108_0 (ref), l_Workspace_0 (ref)
                                    if l_v108_0 then
                                        l_v108_0:Disconnect();
                                    end;
                                    l_Workspace_0:SetAttribute("DefaultPlaylist", nil);
                                end);
                            end;
                        end;
                        task.wait(5);
                        v46:Destroy();
                    end);
                end;
                v63.Priority = Enum.AnimationPriority.Action3;
                v63.AnimId = v0.Animations.Loop;
                v63.Looped = true;
                v63.AnimSpeed = 1;
                local v110 = nil;
                local v111 = nil;
                task.delay(1, function() --[[ Line: 486 ]]
                    -- upvalues: v110 (ref), l_AnimHelper_0 (ref), v63 (copy)
                    v110 = l_AnimHelper_0:CreateAnim(v63);
                    v110.Name = "Remove";
                end);
                task.delay(6.5, function() --[[ Line: 491 ]]
                    -- upvalues: v63 (copy), v0 (ref), v110 (ref), v111 (ref), l_AnimHelper_0 (ref), l_Character_0 (copy)
                    v63.Priority = Enum.AnimationPriority.Action3;
                    v63.AnimId = v0.Animations.End;
                    v63.Looped = false;
                    v63.AnimSpeed = 0.5;
                    v63.FadeIn = 1;
                    v63.NameFade = 1;
                    if v110 then
                        v110:Stop(0);
                    end;
                    v111 = l_AnimHelper_0:CreateAnim(v63);
                    l_Character_0:SetAttribute("Dizzy", 1);
                    task.wait(1.6);
                    v111:AdjustSpeed(0.85);
                end);
                local v112 = v0.DelayTime - l_Workspace_0.Ping.Value / 2 - 2 * v29.RandomMult + v29.ExtraTime;
                task.delay(v112, function() --[[ Line: 513 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v77, {
                        ImageTransparency = 0.2
                    }):Play();
                    if l_LocalPlayer_0.Character == l_Damager_0 then
                        v23.KnockdownWalk({
                            Damager = l_Damager_0, 
                            DamagerHumanoid = l_Humanoid_1, 
                            LookVector = l_LookVector_0
                        });
                    end;
                end;
                l_Damager_0:SetAttribute("CurrentEmote", nil);
                local v114 = tick();
                repeat
                    task.wait(0.1);
                until l_Character_0:GetAttribute("GettingUp") or not l_Character_0:IsDescendantOf(l_Workspace_0) or tick() - v114 > 15;
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    v23.SetTransparency(l_Damager_0, 0);
                    l_TweenService_0:Create(l_Vignette_0, v77, {
                        ImageTransparency = 1
                    }):Play();
                    l_CameraMode_0.Value = "";
                    l_Variant_0.Value = "";
                end;
                if l_Occupied_0 and l_Occupied_0:FindFirstChild("Target") then
                    l_Occupied_0.Target.Value = Vector3.new();
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "Rustle3", 
                    Parent = l_Character_0.PrimaryPart, 
                    Volume = 1
                });
                task.wait(1.75);
                v111:Stop(0.67);
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Lighting_0, v53, {
                        ExposureCompensation = l_Workspace_0.Exposure.Value
                    }):Play();
                end;
                if v44 then
                    l_Occupied_0.LerpMult.Value = 0;
                end;
                if v44 or l_LocalPlayer_0.Character == l_Damager_0 then
                    local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
                    local v116 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                    l_TweenService_0:Create(l_ColorCorrection_1, v116, {
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
                for v117, v118 in v57 do
                    v117.CollisionGroup = v118;
                end;
                for _, v120 in v82 do
                    v120:Disconnect();
                end;
                task.wait(5);
                l_l_AnimHelper_0_Anim_0:Stop(0);
                v111:Stop(0);
                if v43 then
                    v43:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.Use = function(v121) --[[ Line: 599 ]] --[[ Name: Use ]]
        -- upvalues: v0 (copy)
        local _ = v121.Character;
        local _ = v121.Damager;
        local _ = v121.IsKO;
        v0.Main(v121);
    end;
    return v0;
end;