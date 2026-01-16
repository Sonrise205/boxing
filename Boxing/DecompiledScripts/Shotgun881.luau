local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v10 = {
    Animations = {
        Character = 134007715031591, 
        Victim = 15464133732, 
        Camera = 15464146719, 
        CharD = 131367966205650, 
        VicD = 125495317855579, 
        CamD = 70770120368533, 
        CharB = 124229856423896, 
        VicB = 131046552397788, 
        CamB = 110400822663431, 
        CharA = 130032747422790, 
        VicA = 127150035979785, 
        CamA = 73047954091005, 
        CharS = 101288541656798, 
        VicS = 127012805041875, 
        CamS = 113013663777580
    }, 
    GetShotgunScoreData = function(v7) --[[ Line: 34 ]] --[[ Name: GetShotgunScoreData ]]
        local v8 = "D";
        local v9 = -5;
        if v7 > 0.9 then
            return "S", 5;
        elseif v7 > 0.8 then
            return "A", 4;
        elseif v7 > 0.6 then
            return "B", 2;
        else
            if v7 > 0.4 then
                v8 = "C";
                v9 = 1;
            end;
            return v8, v9;
        end;
    end
};
if l_RunService_0:IsServer() then
    return v10;
else
    local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
    local _ = require(l_Modules_0:WaitForChild("AlignHelper"));
    local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
    local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
    local _ = require(l_Modules_0:WaitForChild("Styles"));
    local l_ReplicateMinigameData_0 = l_ReplicatedStorage_0:WaitForChild("UnreliableRemoteEvents"):WaitForChild("ReplicateMinigameData");
    local _ = require(l_ReplicatedStorage_0:WaitForChild("Bezier"));
    local _ = require(l_Modules_0:WaitForChild("RayHelper"));
    local l_Assets_0 = l_ReplicatedStorage_0:WaitForChild("Assets");
    local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
    local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
    local l_Common_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
    local l_BubbleModule_0 = require(l_ReplicatedStorage_0:WaitForChild("BubbleModule"));
    local l_Parent_0 = script.Parent.Parent;
    local v27 = require(l_Parent_0);
    local v28 = Random.new();
    local function _(v29, v30, v31) --[[ Line: 86 ]] --[[ Name: Lerp ]]
        return v29 + (v30 - v29) * v31;
    end;
    SpritesheetPlayer = function(v33) --[[ Line: 88 ]] --[[ Name: SpritesheetPlayer ]]
        local l_Image_0 = v33.Image;
        local l_Frames_0 = v33.Frames;
        local l_Framerate_0 = v33.Framerate;
        local l_RectSize_0 = v33.RectSize;
        local v38 = 0;
        local v39 = 0;
        l_Image_0.Visible = true;
        l_Image_0.ImageRectSize = l_RectSize_0;
        local function v41() --[[ Line: 100 ]] --[[ Name: Perform ]]
            -- upvalues: l_Frames_0 (copy), l_Image_0 (copy), l_RectSize_0 (copy), v38 (ref), v39 (ref), l_Framerate_0 (copy)
            for _ = 1, l_Frames_0.X * l_Frames_0.Y do
                l_Image_0.ImageRectOffset = Vector2.new(l_RectSize_0.X * v38, l_RectSize_0.Y * v39);
                v38 = v38 + 1;
                if v38 > l_Frames_0.X - 1 then
                    v38 = 0;
                    v39 = v39 + 1;
                end;
                task.wait(l_Framerate_0);
            end;
        end;
        if not v33.Looped then
            v41();
            l_Image_0.Visible = false;
        else
            task.defer(function() --[[ Line: 118 ]]
                -- upvalues: v41 (copy), v38 (ref), v39 (ref), l_Image_0 (copy), l_RectSize_0 (copy)
                while true do
                    v41();
                    v38 = 0;
                    v39 = 0;
                    l_Image_0.ImageRectOffset = Vector2.new(l_RectSize_0.X * v38, l_RectSize_0.Y * v39);
                end;
            end);
        end;
    end;
    v10.Use = function(v42) --[[ Line: 130 ]] --[[ Name: Use ]]
        -- upvalues: l_Common_0 (copy), l_LocalPlayer_0 (copy), l_Assets_0 (copy), v10 (copy), v27 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_TweenService_0 (copy), l_Players_0 (copy), v28 (copy), l_UserInputService_0 (copy), l_ReplicateMinigameData_0 (copy), l_AnimHelper_0 (copy), l_BubbleModule_0 (copy), l_ReplicatedStorage_0 (copy), l_RunService_0 (copy)
        local l_Character_0 = v42.Character;
        local l_Victim_0 = v42.Victim;
        local _ = tick();
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
        l_Frame_0.Position = UDim2.new(0, 0, 0, 0);
        l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
        l_Frame_0.BackgroundTransparency = 1;
        l_Frame_0.Visible = true;
        l_Frame_0.Parent = l_Common_0;
        local _ = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local _ = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local v50 = l_LocalPlayer_0.Character == l_Character_0;
        local v51 = l_LocalPlayer_0.Character == l_Victim_0;
        local v52 = false;
        local v53 = nil;
        if v50 or v51 then
            v53 = l_Assets_0.FNF_Minigame:Clone();
            v53.GameHandler.Enabled = false;
            v53.Main.Visible = false;
            v53.Name = l_Character_0.Name .. "FNF_Minigame";
            v53.Parent = l_LocalPlayer_0.PlayerGui;
            task.delay(25, function() --[[ Line: 163 ]]
                -- upvalues: v53 (ref)
                if v53 then
                    v53:Destroy();
                end;
            end);
            local l_ContentProvider_0 = game:GetService("ContentProvider");
            local v55 = {};
            for _, v57 in v10.Animations do
                local l_Animation_0 = Instance.new("Animation");
                l_Animation_0.AnimationId = "rbxassetid://" .. v57;
                table.insert(v55, l_Animation_0);
            end;
            l_ContentProvider_0:PreloadAsync(v55);
            local l_v55_0 = v55 --[[ copy: 13 -> 45 ]];
            task.delay(5, function() --[[ Line: 179 ]]
                -- upvalues: l_v55_0 (copy)
                for _, v61 in l_v55_0 do
                    v61:Destroy();
                end;
            end);
        end;
        local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
        local v63 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
        local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
        local v65 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
        for _, v67 in (v63:GetPlayingAnimationTracks()) do
            if v67.Priority ~= Enum.AnimationPriority.Idle then
                local l_Speed_0 = v67.Speed;
                v67:AdjustSpeed(l_Speed_0 / 4);
                task.delay(2, function() --[[ Line: 201 ]]
                    -- upvalues: v67 (copy), l_Speed_0 (copy)
                    v67:AdjustSpeed(l_Speed_0);
                end);
            end;
        end;
        for _, v70 in (v65:GetPlayingAnimationTracks()) do
            if v70.Priority ~= Enum.AnimationPriority.Idle then
                local l_Speed_1 = v70.Speed;
                v70:AdjustSpeed(l_Speed_1 / 4);
                task.delay(2, function() --[[ Line: 213 ]]
                    -- upvalues: v70 (copy), l_Speed_1 (copy)
                    v70:AdjustSpeed(l_Speed_1);
                end);
            end;
        end;
        task.defer(function() --[[ Line: 218 ]]
            -- upvalues: v50 (copy), v51 (copy), v27 (ref), l_Main_0 (ref)
            if v50 or v51 then
                v27.StatusFrame(v51, l_Main_0.StatusFrame.UltimateFrame);
            end;
        end);
        local v72 = l_Parent_0.UltimateStart:Clone();
        v72.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
        v72.Parent = l_Workspace_0.Debris;
        task.delay(20, function() --[[ Line: 228 ]]
            -- upvalues: v72 (copy)
            if v72 then
                v72:Destroy();
            end;
        end);
        for _, v74 in v72.Particle:GetChildren() do
            v74.Enabled = false;
            v74:Emit(v74:GetAttribute("EmitCount"));
        end;
        local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
        local v76 = l_SoundHelper_0:PlaySound({
            Name = "ShotgunSFX", 
            Parent = l_Character_0
        });
        v76.Volume = 0;
        task.delay(1.25, function() --[[ Line: 246 ]]
            -- upvalues: v76 (copy), v50 (copy), v51 (copy)
            v76:Stop();
            if v50 or v51 then
                v76.Volume = 0.3;
            else
                v76.Volume = 0.08;
            end;
            v76:Play();
            v76.TimePosition = 0.16666666666666666;
        end);
        task.wait(0.5);
        local v77 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
        local v78 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
        if v50 or v51 then
            l_TweenService_0:Create(l_Frame_0, v78, {
                BackgroundTransparency = 0
            }):Play();
            l_TweenService_0:Create(l_Lighting_0, v78, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
            }):Play();
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v77, {
                ImageTransparency = 0.5
            }):Play();
        end;
        task.wait(0.5);
        local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
        if v50 or v51 then
            l_CameraMode_0.Value = "Cutscene";
            l_CurrentCamera_0.FieldOfView = 60;
        end;
        task.spawn(function() --[[ Line: 280 ]]
            -- upvalues: v53 (ref), l_Main_0 (ref), l_Players_0 (ref), l_Character_0 (copy), v28 (ref), l_UserInputService_0 (ref), v51 (copy), v52 (ref), l_ReplicateMinigameData_0 (ref), l_CurrentCamera_0 (copy), l_TweenService_0 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref)
            if not v53 then
                return;
            else
                for _, v82 in l_Main_0:GetChildren() do
                    v82.Position = UDim2.new(v82.Position.X.Scale, 0, v82.Position.Y.Scale + 10);
                end;
                v53.Main.Visible = true;
                v53.Main.Size = UDim2.new(2.3, 0, 2.3, 0);
                local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(l_Character_0);
                local l_Settings_0 = v53.Settings;
                local v85 = {
                    "Shotgun1", 
                    "Shotgun2", 
                    "Shotgun3"
                };
                l_Settings_0.SongName.Value = v85[v28:NextInteger(1, #v85)];
                l_Settings_0.Difficulty.Value = l_l_Players_0_PlayerFromCharacter_0 and l_l_Players_0_PlayerFromCharacter_0:GetAttribute("SongDifficulty") or "normal";
                local l_GuiService_0 = game:GetService("GuiService");
                local v87 = l_UserInputService_0.GamepadEnabled or l_GuiService_0:IsTenFootInterface();
                if l_Settings_0.Difficulty.Value == "hard" and v87 then
                    l_Settings_0.Difficulty.Value = "hard";
                end;
                l_Settings_0.Autoplay.Value = v51;
                if v51 then
                    if l_Settings_0.Difficulty.Value == "easy" then
                        l_Settings_0.Difficulty.Value = "normal";
                    end;
                else
                    task.defer(function() --[[ Line: 312 ]]
                        -- upvalues: v52 (ref), l_ReplicateMinigameData_0 (ref), l_Character_0 (ref), l_Settings_0 (copy)
                        while not v52 do
                            l_ReplicateMinigameData_0:FireServer({
                                l_Character_0, 
                                l_Settings_0.ScoreProgress.Value, 
                                l_Settings_0.Combo.Value
                            });
                            task.wait(0.5);
                        end;
                    end);
                end;
                task.wait();
                l_CurrentCamera_0.FieldOfView = 65;
                v53.GameHandler.Enabled = true;
                task.wait(1);
                local v88 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                l_TweenService_0:Create(l_CurrentCamera_0, v88, {
                    FieldOfView = 55
                }):Play();
                task.wait(1);
                l_SoundHelper_0:PlaySound({
                    Name = "Ultimate", 
                    Parent = l_Workspace_0.Debris, 
                    DirectCopy = script.Woosh
                });
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FieldOfView = 65
                }):Play();
                l_TweenService_0:Create(v53.Main, v88, {
                    Size = UDim2.new(1, 0, 1, 0)
                }):Play();
                return;
            end;
        end);
        local v89 = {
            Animator = v63, 
            AnimId = v10.Animations.Character, 
            Priority = Enum.AnimationPriority.Action4, 
            FadeIn = 0
        };
        local v90 = {
            Animator = v65, 
            AnimId = v10.Animations.Victim, 
            Priority = Enum.AnimationPriority.Action4, 
            FadeIn = 0
        };
        v27.TeleportModel({
            Character = v42.Victim, 
            TargetCFrame = l_Character_0.PrimaryPart.CFrame * v42.Offset, 
            TeleportId = v42.TeleportId
        });
        l_Victim_0.PrimaryPart.Anchored = true;
        l_Character_0.PrimaryPart.Anchored = true;
        l_AnimHelper_0:CreateAnim(v89);
        l_AnimHelper_0:CreateAnim(v90);
        local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v89);
        local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v90);
        local v93 = nil;
        local v94 = script.Effects:Clone();
        v94.Parent = l_Workspace_0.Debris;
        v94.CFrame = l_Victim_0.PrimaryPart.CFrame;
        task.delay(30, function() --[[ Line: 380 ]]
            -- upvalues: v94 (copy)
            v94:Destroy();
        end);
        local v95 = {};
        task.defer(function() --[[ Line: 388 ]]
            -- upvalues: l_Character_0 (copy), v27 (ref)
            local v96 = {
                Step = 1, 
                MaxTime = 0.8333333333333334, 
                DeleteDelay = 0.1, 
                AddTransparency = 0.96, 
                Character = l_Character_0
            };
            v27.AfterimageEffect(v96);
        end);
        v95[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Dodge"):Connect(function() --[[ Line: 400 ]]
            -- upvalues: v50 (copy), v51 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v27 (ref)
            if not v50 and not v51 then
                return;
            else
                l_ColorCorrection_0.Saturation = 0.1;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v97 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v97, {
                    Saturation = -0.1, 
                    Contrast = 0.1
                }):Play();
                local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                l_MenuBlur_0.Size = 0;
                l_MenuBlur_0.Enabled = true;
                local v99 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_0, v99, {
                    Size = 10
                }):Play();
                v27.HUDShake({
                    Scale = 20, 
                    Damper = 0.35
                });
                v27.CameraShake({
                    Preset = "SuperHardHit", 
                    WaitTime = 0.1, 
                    Fade = 0.1
                });
                return;
            end;
        end);
        v95[2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Start1"):Connect(function() --[[ Line: 429 ]]
            -- upvalues: v27 (ref), l_Character_0 (copy), l_Victim_0 (copy), v50 (copy), v51 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
            task.defer(function() --[[ Line: 430 ]]
                -- upvalues: v27 (ref), l_Character_0 (ref)
                v27.AttackTrail({
                    Character = l_Character_0, 
                    TrailInfo = {
                        EffectName = "AttackTrail", 
                        TrailName = "Shotgun", 
                        TargetPart = "LeftHand", 
                        DelayTime = 0, 
                        HoldTime = 0.3333333333333333, 
                        TimeScale = 0.5
                    }
                });
            end);
            task.defer(function() --[[ Line: 444 ]]
                -- upvalues: v27 (ref), l_Victim_0 (ref)
                v27.AttackTrail({
                    Character = l_Victim_0, 
                    TrailInfo = {
                        EffectName = "AttackTrail", 
                        TargetPart = "LeftHand", 
                        DelayTime = 0, 
                        HoldTime = 0.3333333333333333, 
                        TimeScale = 0.5
                    }
                });
            end);
            if not v50 and not v51 then
                return;
            else
                l_ColorCorrection_0.Saturation = 0.1;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v100 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v100, {
                    Saturation = -0.1, 
                    Contrast = 0.1
                }):Play();
                local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                l_MenuBlur_1.Size = 0;
                l_MenuBlur_1.Enabled = true;
                local v102 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_1, v102, {
                    Size = 10
                }):Play();
                v27.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.2, 
                    Fade = 2
                });
                return;
            end;
        end);
        v95[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Uppercut"):Connect(function() --[[ Line: 480 ]]
            -- upvalues: v94 (copy), v50 (copy), v51 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), l_ColorCorrection_0 (copy), l_BubbleModule_0 (ref), l_Victim_0 (copy), l_Lighting_0 (ref), v27 (ref)
            for _, v104 in v94.Uppercut:GetChildren() do
                v104:Emit(2);
            end;
            if not v50 and not v51 then
                return;
            else
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FieldOfView = 50
                }):Play();
                l_ColorCorrection_0.Saturation = 0.4;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(10, 10, 10, 0), 0.3);
                local v105 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v105, {
                    Saturation = -0.4, 
                    Contrast = 0.2
                }):Play();
                local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                l_MenuBlur_2.Size = 0;
                l_MenuBlur_2.Enabled = true;
                local v107 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_2, v107, {
                    Size = 20
                }):Play();
                local v108 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v108, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.1
                }):Play();
                task.defer(function() --[[ Line: 508 ]]
                    -- upvalues: v27 (ref)
                    v27.CreateImpactFrame({
                        Time = 0.08
                    });
                end);
                v27.CameraShake({
                    Preset = "SuperHardHit", 
                    WaitTime = 1.5, 
                    Fade = 2
                });
                return;
            end;
        end);
        v95[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Barrage"):Connect(function() --[[ Line: 521 ]]
            -- upvalues: v50 (copy), v51 (copy), v27 (ref), l_Victim_0 (copy), l_Character_0 (copy), v28 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref)
            task.delay(0.16666666666666666, function() --[[ Line: 525 ]]
                -- upvalues: v50 (ref), v51 (ref), v27 (ref), l_Victim_0 (ref), l_Character_0 (ref), v28 (ref)
                task.defer(function() --[[ Line: 528 ]]
                    -- upvalues: v50 (ref), v51 (ref), v27 (ref)
                    if not v50 and not v51 then
                        return;
                    else
                        v27.CameraShake({
                            Preset = "HardHitRoll", 
                            WaitTime = 1, 
                            Fade = 0.5
                        });
                        return;
                    end;
                end);
                task.defer(function() --[[ Line: 538 ]]
                    -- upvalues: v50 (ref), v51 (ref), v27 (ref)
                    if not v50 and not v51 then
                        return;
                    else
                        v27.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 9.866666666666667, 
                            Fade = 1
                        });
                        return;
                    end;
                end);
                for v109 = 1, 72 do
                    if v109 % 2 == 0 then
                        task.defer(function() --[[ Line: 550 ]]
                            -- upvalues: l_Victim_0 (ref), l_Character_0 (ref), v28 (ref), v27 (ref)
                            local v110 = "Forward";
                            local v111 = math.random(1, 3);
                            if v111 == 2 then
                                v110 = "Left";
                            elseif v111 == 3 then
                                v110 = "Right";
                            end;
                            local v112 = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position) * CFrame.new(0, 0, -0.7);
                            if v110 == "Right" then
                                v112 = v112 * CFrame.new(v28:NextNumber(0.3, 0.8), 1 + v28:NextNumber(0, 0.4), 0);
                            elseif v110 == "Left" then
                                v112 = v112 * CFrame.new(-v28:NextNumber(0.3, 0.8), 1 + v28:NextNumber(0, 0.4), 0);
                            elseif v110 == "Forward" then
                                v112 = v112 * CFrame.new(0, 1, 0);
                            end;
                            v27.HitMain({
                                nil, 
                                l_Character_0, 
                                v112, 
                                l_Character_0
                            });
                        end);
                    end;
                    task.wait(0.11);
                end;
            end);
            v27.Shotgun({
                nil, 
                l_Character_0, 
                0.16666666666666666, 
                7.866666666666666, 
                60
            });
            local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
            l_MenuBlur_3.Size = 0;
            l_MenuBlur_3.Enabled = true;
            local v114 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_3, v114, {
                Size = 20
            }):Play();
        end);
        v95[5] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Start2"):Connect(function() --[[ Line: 599 ]]
            -- upvalues: v27 (ref), l_Character_0 (copy), v50 (copy), v51 (copy), l_CurrentCamera_0 (copy)
            task.defer(function() --[[ Line: 600 ]]
                -- upvalues: v27 (ref), l_Character_0 (ref)
                v27.AttackTrail({
                    Character = l_Character_0, 
                    TrailInfo = {
                        EffectName = "AttackTrail", 
                        TrailName = "Shotgun", 
                        TargetPart = "RightHand", 
                        DelayTime = 0, 
                        HoldTime = 0.3333333333333333, 
                        TimeScale = 0.5
                    }
                });
            end);
            if not v50 and not v51 then
                return;
            else
                l_CurrentCamera_0.FieldOfView = 60;
                return;
            end;
        end);
        v95[6] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 618 ]]
            -- upvalues: v95 (copy), v94 (copy), v50 (copy), v51 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), l_ColorCorrection_0 (copy), l_BubbleModule_0 (ref), l_Victim_0 (copy), l_Lighting_0 (ref), v27 (ref)
            for _, v116 in v95 do
                v116:Disconnect();
            end;
            for _, v118 in v94.Final:GetChildren() do
                v118.TimeScale = v118.TimeScale * 0.9;
                v118:Emit(v118:GetAttribute("EmitCount") or 1);
            end;
            if not v50 and not v51 then
                return;
            else
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FieldOfView = 70
                }):Play();
                l_ColorCorrection_0.Saturation = 0.4;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(10, 10, 10, 0), 0.3);
                local v119 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v119, {
                    Saturation = -0.4, 
                    Contrast = 0.2
                }):Play();
                local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                l_MenuBlur_4.Size = 0;
                l_MenuBlur_4.Enabled = true;
                local v121 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_4, v121, {
                    Size = 20
                }):Play();
                local v122 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v122, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                }):Play();
                task.defer(function() --[[ Line: 651 ]]
                    -- upvalues: v27 (ref)
                    v27.CreateImpactFrame({
                        Time = 0.1
                    });
                end);
                v27.CameraShake({
                    Preset = "HardHitRoll", 
                    WaitTime = 1, 
                    Fade = 2
                });
                return;
            end;
        end);
        local v123 = nil;
        local v124 = 2.7;
        v95[7] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("SlowStart"):Connect(function() --[[ Line: 668 ]]
            -- upvalues: v50 (copy), v51 (copy), l_CurrentCamera_0 (copy), l_Lighting_0 (ref), l_TweenService_0 (ref), v93 (ref), l_l_AnimHelper_0_Anim_1 (copy), l_l_AnimHelper_0_Anim_0 (copy), v53 (ref), v28 (ref), l_Frame_0 (copy), v52 (ref), v10 (ref), l_ReplicateMinigameData_0 (ref), l_Character_0 (copy), l_SoundHelper_0 (ref), v124 (ref), v42 (copy), v123 (ref), l_Main_0 (ref), l_UserInputService_0 (ref), l_Workspace_0 (ref), l_ReplicatedStorage_0 (ref), l_RunService_0 (ref)
            if v50 or v51 then
                l_CurrentCamera_0.FieldOfView = 70;
                local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
                l_MenuBlur_5.Size = 0;
                l_MenuBlur_5.Enabled = true;
                local v126 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                l_TweenService_0:Create(l_MenuBlur_5, v126, {
                    Size = 40
                }):Play();
            end;
            v93:AdjustSpeed(0.6);
            l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.6);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.6);
            task.wait(0.8611111111111112);
            v93:AdjustSpeed(1);
            l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
            task.wait(0.23333333333333334);
            v93:AdjustSpeed(0.25);
            task.wait(2.65);
            l_l_AnimHelper_0_Anim_1.TimePosition = 3.4833333333333334;
            l_l_AnimHelper_0_Anim_0.TimePosition = 3.4833333333333334;
            task.wait(2.65);
            l_l_AnimHelper_0_Anim_1.TimePosition = 3.4833333333333334;
            l_l_AnimHelper_0_Anim_0.TimePosition = 3.4833333333333334;
            task.wait(2.65);
            l_l_AnimHelper_0_Anim_1.TimePosition = 3.4833333333333334;
            l_l_AnimHelper_0_Anim_0.TimePosition = 3.4833333333333334;
            task.wait(1.1666666666666667);
            v93:AdjustSpeed(1);
            v93.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
            if v50 or v51 then
                local v127 = TweenInfo.new(4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                local v128 = TweenInfo.new(3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out);
                local v129 = TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0);
                l_TweenService_0:Create(v53.Main, v128, {
                    Size = UDim2.new(2.3, 0, 2.3, 0), 
                    Rotation = v28:NextNumber(-1, 1) * 2
                }):Play();
                task.wait(0.2);
                l_TweenService_0:Create(l_CurrentCamera_0, v127, {
                    FieldOfView = 50
                }):Play();
                task.wait(0.3);
                l_TweenService_0:Create(l_Frame_0, v129, {
                    BackgroundTransparency = 0
                }):Play();
                l_TweenService_0:Create(l_Lighting_0, v129, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 1
                }):Play();
                v52 = true;
                task.wait(0.5);
                local l_Settings_1 = v53.Settings;
                local l_Value_0 = l_Settings_1.ScoreProgress.Value;
                local v132, v133 = v10.GetShotgunScoreData(l_Value_0);
                l_ReplicateMinigameData_0:FireServer({
                    l_Character_0, 
                    l_Settings_1.ScoreProgress.Value, 
                    l_Settings_1.Combo.Value, 
                    true
                });
                task.wait(0.8);
                local l_FirstChild_0 = script.Subultimates:FindFirstChild(v132);
                do
                    local l_l_FirstChild_0_0 = l_FirstChild_0;
                    if not l_l_FirstChild_0_0 then
                        l_l_AnimHelper_0_Anim_0.TimePosition = 6.3;
                        l_l_AnimHelper_0_Anim_1.TimePosition = 6.3;
                        v93.TimePosition = 6.3;
                        local v136 = l_SoundHelper_0:PlaySound({
                            Name = "ShotgunSFXGradeC", 
                            Parent = l_Character_0
                        });
                        local l_v136_0 = v136 --[[ copy: 8 -> 17 ]];
                        task.delay(0, function() --[[ Line: 754 ]]
                            -- upvalues: l_v136_0 (copy), v50 (ref), v51 (ref)
                            l_v136_0.Volume = 0;
                            l_v136_0:Play();
                            l_v136_0.TimePosition = 6.2;
                            task.wait(1.5);
                            if v50 or v51 then
                                l_v136_0.Volume = 0.45;
                                return;
                            else
                                l_v136_0.Volume = 0.1;
                                return;
                            end;
                        end);
                    else
                        l_l_FirstChild_0_0 = require(l_l_FirstChild_0_0);
                        v124 = l_l_FirstChild_0_0.ExtraUltTime;
                        task.spawn(function() --[[ Line: 771 ]]
                            -- upvalues: l_l_FirstChild_0_0 (ref), v42 (ref)
                            l_l_FirstChild_0_0.Use(v42);
                        end);
                    end;
                    l_TweenService_0:Create(l_Frame_0, v129, {
                        BackgroundTransparency = 1
                    }):Play();
                    l_TweenService_0:Create(l_Lighting_0, v129, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation - 1
                    }):Play();
                    local l_MenuBlur_6 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_6.Size = 0;
                    l_MenuBlur_6.Enabled = true;
                    local v139 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                    l_TweenService_0:Create(l_MenuBlur_6, v139, {
                        Size = 0
                    }):Play();
                    task.wait(0.2);
                    v123 = script.Bonus:Clone();
                    v123.Parent = l_Main_0;
                    v123.Bonus.Text = "BONUS DAMAGE: " .. v133 .. "%";
                    v123.Letter.Text = v132;
                    v123.Shadow.Text = v132;
                    local l_FirstChild_1 = v123.Letter:FindFirstChild(v132);
                    if l_FirstChild_1 then
                        l_FirstChild_1.Enabled = true;
                    end;
                    local v141 = not l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.TouchEnabled;
                    v123.Size = UDim2.new(1.2 * (v141 and 1.2 or 1), 0, 1.2, 0);
                    if v141 then
                        for _, v143 in v123:GetDescendants() do
                            if v143:IsA("UIStroke") then
                                v143.Thickness = v143.Thickness / 1.5;
                            end;
                        end;
                    end;
                    l_TweenService_0:Create(v123, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Size = UDim2.new(1 * (v141 and 1.2 or 1), 0, 1, 0)
                    }):Play();
                    local function v145() --[[ Line: 812 ]] --[[ Name: PlayFire ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref), v123 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "FlameHit1", 
                            Parent = l_Workspace_0, 
                            Volume = 0.15
                        });
                        local v144 = {
                            Image = v123.Fire, 
                            Framerate = 0.05, 
                            Frames = Vector2.new(6, 3), 
                            RectSize = Vector2.new(170, 340)
                        };
                        SpritesheetPlayer(v144);
                    end;
                    task.delay(0.4, function() --[[ Line: 829 ]]
                        -- upvalues: v145 (copy)
                        v145();
                    end);
                    l_SoundHelper_0:PlaySound({
                        Name = "Ultimate", 
                        Parent = l_Workspace_0.Debris, 
                        DirectCopy = script.Woosh
                    });
                    local v146 = require(l_ReplicatedStorage_0:WaitForChild("Spring"), 30).new(Vector2.new());
                    v146.Speed = 75;
                    v146.Velocity = Vector2.new(v28:NextNumber(-0.5, 0.5), v28:NextNumber(-0.5, 0.5)) * 5;
                    v146.Damper = 0.06999999999999999;
                    local v147 = nil;
                    v147 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 847 ]]
                        -- upvalues: v123 (ref), v146 (copy)
                        if not v123 then
                            return;
                        else
                            v123.Position = UDim2.new(0.5 + v146.Position.X, 0, v146.Position.Y, 0);
                            return;
                        end;
                    end);
                    task.wait(5);
                    v147:Disconnect();
                    if v53 then
                        v53.Name = "Remove";
                        task.wait(10);
                        v53:Destroy();
                    end;
                end;
            end;
        end);
        if v50 or v51 then
            local v148 = l_Assets_0.Camera:Clone();
            v148.Name = l_Character_0.Name .. "Camera";
            v148.Parent = l_Workspace_0.Debris;
            local v149 = 0;
            do
                local l_v149_0 = v149;
                local function v151() --[[ Line: 870 ]] --[[ Name: UpdateCameraCFrame ]]
                    -- upvalues: l_v149_0 (ref), v148 (copy), l_Character_0 (copy)
                    if os.time() - l_v149_0 < 0.5 then
                        return;
                    else
                        l_v149_0 = os.time();
                        v148:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                        return;
                    end;
                end;
                v151();
                local v152 = {
                    Animator = v148.AnimationController.Animator, 
                    AnimId = v10.Animations.Camera
                };
                v93 = l_AnimHelper_0:CreateAnim(v152);
                l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 888 ]]
                    -- upvalues: l_CurrentCamera_0 (copy), v148 (copy), v151 (copy)
                    l_CurrentCamera_0.CFrame = v148.Head.CFrame;
                    v151();
                end);
                task.wait(15.833333333333334);
                task.wait(v124);
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                v93:AdjustSpeed(0.01);
                l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.01);
                l_TweenService_0:Create(l_Frame_0, v78, {
                    BackgroundTransparency = 0
                }):Play();
                task.wait(0.3333333333333333);
                v93:Stop(0.1);
                if l_l_AnimHelper_0_Anim_1 then
                    l_l_AnimHelper_0_Anim_1:Stop(0.1);
                end;
                l_l_AnimHelper_0_Anim_0:Stop(0.1);
                task.wait(0.16666666666666666);
                if v123 then
                    v123:Destroy();
                end;
                task.wait(0.25);
                if l_CurrentCamera_0.FieldOfView < 50 then
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        FieldOfView = 70
                    }):Play();
                end;
                local v154 = v27.UpdateTeleportId(v42.Victim);
                v27.TeleportModel({
                    Character = v42.Victim, 
                    TargetCFrame = l_Character_0.PrimaryPart.CFrame * v42.Offset, 
                    TeleportId = v154
                });
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                l_CameraMode_0.Value = "";
                for _, v156 in l_Main_0:GetChildren() do
                    v156.Position = UDim2.new(v156.Position.X.Scale, 0, v156.Position.Y.Scale - 10);
                end;
                l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v77, {
                    ImageTransparency = 1
                }):Play();
                local v157 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
                l_TweenService_0:Create(l_Lighting_0, v157, {
                    ExposureCompensation = workspace.Exposure.Value
                }):Play();
                v27.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.2, 
                    Fade = 1
                });
                v148:Destroy();
            end;
        end;
        for _, v159 in v95 do
            v159:Disconnect();
        end;
        l_Victim_0.PrimaryPart.Anchored = false;
        l_Character_0.PrimaryPart.Anchored = false;
    end;
    return v10;
end;