local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0:WaitForChild("AlignHelper"));
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("Styles"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("Bezier"));
local _ = require(l_Modules_0:WaitForChild("RayHelper"));
local l_Assets_0 = l_ReplicatedStorage_0:WaitForChild("Assets");
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local l_BubbleModule_0 = require(l_ReplicatedStorage_0:WaitForChild("BubbleModule"));
local l_Parent_0 = script.Parent.Parent;
local v21 = require(l_Parent_0);
local v22 = Random.new();
local function _(v23, v24, v25) --[[ Line: 32 ]] --[[ Name: Lerp ]]
    return v23 + (v24 - v23) * v25;
end;
local v27 = {
    Animations = {
        Character = 15644927506, 
        Victim = 15644936251, 
        Camera = 15644945168
    }
};
v27.Use = function(v28) --[[ Line: 42 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v21 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_TweenService_0 (copy), v27 (copy), l_AnimHelper_0 (copy), l_BubbleModule_0 (copy), v22 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
    local l_Character_0 = v28.Character;
    local l_Victim_0 = v28.Victim;
    local v31 = l_LocalPlayer_0.Character == l_Character_0;
    local v32 = l_LocalPlayer_0.Character == l_Victim_0;
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v34 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v36 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    for _, v38 in (v34:GetPlayingAnimationTracks()) do
        if v38.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_0 = v38.Speed;
            v38:AdjustSpeed(l_Speed_0 / 4);
            task.delay(2, function() --[[ Line: 64 ]]
                -- upvalues: v38 (copy), l_Speed_0 (copy)
                v38:AdjustSpeed(l_Speed_0);
            end);
        end;
    end;
    for _, v41 in (v36:GetPlayingAnimationTracks()) do
        if v41.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_1 = v41.Speed;
            v41:AdjustSpeed(l_Speed_1 / 4);
            task.delay(2, function() --[[ Line: 76 ]]
                -- upvalues: v41 (copy), l_Speed_1 (copy)
                v41:AdjustSpeed(l_Speed_1);
            end);
        end;
    end;
    task.defer(function() --[[ Line: 81 ]]
        -- upvalues: v31 (copy), v32 (copy), v21 (ref), l_Main_0 (ref)
        if v31 or v32 then
            v21.StatusFrame(v32, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v43 = l_Parent_0.UltimateStart:Clone();
    v43.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v43.Parent = l_Workspace_0.Debris;
    for _, v45 in v43.Particle:GetChildren() do
        v45.Enabled = false;
        v45:Emit(v45:GetAttribute("EmitCount"));
    end;
    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
    if v31 or v32 then
        task.delay(0.93, function() --[[ Line: 99 ]]
            -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
            local _ = l_SoundHelper_0:PlaySound({
                Name = "FreedomUltSong", 
                Parent = l_Workspace_0.Debris
            }).Volume;
        end);
    end;
    task.wait(0.5);
    local v48 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v49 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v31 or v32 then
        l_TweenService_0:Create(l_Main_0.White, v49, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v49, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v48, {
            ImageTransparency = 0.5
        }):Play();
    end;
    local v50 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v31 or v32) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_1 = v50.Volume;
    v50.Volume = 0;
    task.delay(0.25, function() --[[ Line: 128 ]]
        -- upvalues: v50 (copy), v31 (copy), v32 (copy), l_Volume_1 (copy), v28 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v50:Stop();
        if v31 or v32 then
            v50.Volume = l_Volume_1;
        else
            v50.Volume = l_Volume_1 / 5;
        end;
        v50:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v28.HasVoicelines then
            local v53 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = (not not v31 or v32) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v31 and not v32 then
                v53.Volume = v53.Volume / 5;
            end;
        end;
    end);
    task.wait(0.5);
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v31 or v32 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 60;
    end;
    local v56 = {
        Animator = v34, 
        AnimId = v27.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v57 = {
        Animator = v36, 
        AnimId = v27.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    v21.TeleportModel({
        Character = v28.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame * v28.Offset, 
        TeleportId = v28.TeleportId
    });
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v56);
    l_AnimHelper_0:CreateAnim(v57);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v56);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v57);
    local v60 = nil;
    local l_Whirlwind_0 = script.Whirlwind;
    local l_Value_0 = l_Workspace_0.States[l_Character_0.Name].PlayerData.Style.Value;
    if l_Value_0 == "FreedomHitman" then
        l_Whirlwind_0 = script.Hitman;
    elseif l_Value_0 == "FreedomSmash" then
        l_Whirlwind_0 = script.Smash;
    end;
    l_Whirlwind_0 = l_Whirlwind_0:Clone();
    l_Whirlwind_0.Parent = l_Workspace_0.Debris;
    l_Whirlwind_0.CFrame = l_Victim_0.PrimaryPart.CFrame;
    task.delay(30, function() --[[ Line: 209 ]]
        -- upvalues: l_Whirlwind_0 (ref)
        l_Whirlwind_0:Destroy();
    end);
    local v78 = {
        [1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Sway"):Connect(function() --[[ Line: 219 ]]
            -- upvalues: v31 (copy), v32 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref)
            if not v31 and not v32 then
                return;
            else
                l_ColorCorrection_0.Saturation = 0.1;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v63 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v63, {
                    Saturation = -0.1, 
                    Contrast = 0.1
                }):Play();
                local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                l_MenuBlur_0.Size = 0;
                l_MenuBlur_0.Enabled = true;
                local v65 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_0, v65, {
                    Size = 10
                }):Play();
                v21.HUDShake({
                    Scale = 20, 
                    Damper = 0.35
                });
                v21.CameraShake({
                    Preset = "SuperHardHit", 
                    WaitTime = 0.1, 
                    Fade = 0.1
                });
                return;
            end;
        end), 
        [2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Smash1"):Connect(function() --[[ Line: 248 ]]
            -- upvalues: l_Whirlwind_0 (ref), v31 (copy), v32 (copy), l_ColorCorrection_0 (copy), l_BubbleModule_0 (ref), l_Victim_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), l_Character_0 (copy)
            for _, v67 in l_Whirlwind_0.Uppercut:GetChildren() do
                v67:Emit(2);
            end;
            if not v31 and not v32 then
                return;
            else
                l_ColorCorrection_0.Saturation = 0.4;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(10, 10, 10, 0), 0.3);
                local v68 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v68, {
                    Saturation = -0.4, 
                    Contrast = 0.2
                }):Play();
                local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                l_MenuBlur_1.Size = 0;
                l_MenuBlur_1.Enabled = true;
                local v70 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_1, v70, {
                    Size = 20
                }):Play();
                local v71 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v71, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.1
                }):Play();
                task.defer(function() --[[ Line: 274 ]]
                    -- upvalues: v21 (ref)
                    v21.CreateImpactFrame({
                        Time = 0.08
                    });
                end);
                v21.SmashPunch({
                    nil, 
                    l_Character_0, 
                    0
                });
                v21.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.3, 
                    Fade = 0.2
                });
                return;
            end;
        end), 
        [3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Smash2"):Connect(function() --[[ Line: 291 ]]
            -- upvalues: l_Whirlwind_0 (ref), v31 (copy), v32 (copy), l_ColorCorrection_0 (copy), l_BubbleModule_0 (ref), l_Victim_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), l_Character_0 (copy)
            for _, v73 in l_Whirlwind_0.Uppercut:GetChildren() do
                v73:Emit(2);
            end;
            if not v31 and not v32 then
                return;
            else
                l_ColorCorrection_0.Saturation = 0.4;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(10, 10, 10, 0), 0.3);
                local v74 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v74, {
                    Saturation = -0.4, 
                    Contrast = 0.2
                }):Play();
                local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                l_MenuBlur_2.Size = 0;
                l_MenuBlur_2.Enabled = true;
                local v76 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_2, v76, {
                    Size = 20
                }):Play();
                local v77 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v77, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.1
                }):Play();
                task.defer(function() --[[ Line: 317 ]]
                    -- upvalues: v21 (ref)
                    v21.CreateImpactFrame({
                        Time = 0.08
                    });
                end);
                v21.SmashPunch({
                    nil, 
                    l_Character_0, 
                    0; 
                    IsRight = true
                });
                v21.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.3, 
                    Fade = 0.2
                });
                return;
            end;
        end)
    };
    local _ = function() --[[ Line: 335 ]] --[[ Name: CreateSlash ]]
        -- upvalues: l_Whirlwind_0 (ref), v21 (ref), l_Character_0 (copy), v22 (ref)
        task.defer(function() --[[ Line: 336 ]]
            -- upvalues: l_Whirlwind_0 (ref), v21 (ref), l_Character_0 (ref), v22 (ref)
            local v79 = l_Whirlwind_0.Slash:Clone();
            v79.Parent = v21.GetWeldCharacter(l_Character_0).PrimaryPart;
            v79.Orientation = Vector3.new(v22:NextNumber(0, 20), 0, v22:NextNumber(-40, 40));
            for _, v81 in v79:GetChildren() do
                v81:Emit(1);
            end;
            task.wait(5);
            v79:Destroy();
        end);
    end;
    v78[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Flicker1"):Connect(function() --[[ Line: 350 ]]
        -- upvalues: v21 (ref), l_Character_0 (copy), l_Whirlwind_0 (ref), v22 (ref), v31 (copy), v32 (copy)
        task.defer(function() --[[ Line: 351 ]]
            -- upvalues: v21 (ref), l_Character_0 (ref)
            v21.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "IronFist", 
                    TargetPart = "LeftHand", 
                    DelayTime = 0, 
                    HoldTime = 0.5, 
                    TimeScale = 0.3
                }
            });
        end);
        task.defer(function() --[[ Line: 336 ]]
            -- upvalues: l_Whirlwind_0 (ref), v21 (ref), l_Character_0 (ref), v22 (ref)
            local v83 = l_Whirlwind_0.Slash:Clone();
            v83.Parent = v21.GetWeldCharacter(l_Character_0).PrimaryPart;
            v83.Orientation = Vector3.new(v22:NextNumber(0, 20), 0, v22:NextNumber(-40, 40));
            for _, v85 in v83:GetChildren() do
                v85:Emit(1);
            end;
            task.wait(5);
            v83:Destroy();
        end);
        for _, v87 in l_Whirlwind_0.Right:GetChildren() do
            v87:Emit(2);
        end;
        v21.CameraShake({
            Preset = "MedHit", 
            WaitTime = 0.3, 
            FadeTime = 0.6
        });
        if not v31 and not v32 then
            return;
        else
            return;
        end;
    end);
    local v88 = 1;
    v78[5] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hit"):Connect(function() --[[ Line: 382 ]]
        -- upvalues: v88 (ref), l_Whirlwind_0 (ref), v21 (ref), l_Character_0 (copy), v22 (ref), v31 (copy), v32 (copy)
        v88 = v88 + 1;
        task.defer(function() --[[ Line: 336 ]]
            -- upvalues: l_Whirlwind_0 (ref), v21 (ref), l_Character_0 (ref), v22 (ref)
            local v89 = l_Whirlwind_0.Slash:Clone();
            v89.Parent = v21.GetWeldCharacter(l_Character_0).PrimaryPart;
            v89.Orientation = Vector3.new(v22:NextNumber(0, 20), 0, v22:NextNumber(-40, 40));
            for _, v91 in v89:GetChildren() do
                v91:Emit(1);
            end;
            task.wait(5);
            v89:Destroy();
        end);
        local l_Left_0 = l_Whirlwind_0.Left;
        local v93 = "RightHand";
        if v88 % 2 == 0 then
            l_Left_0 = l_Whirlwind_0.Right;
            v93 = "LeftHand";
        end;
        for _, v95 in l_Left_0:GetChildren() do
            v95:Emit(1);
        end;
        task.defer(function() --[[ Line: 399 ]]
            -- upvalues: v21 (ref), l_Character_0 (ref), v93 (ref)
            v21.AttackTrail({
                Character = l_Character_0, 
                TrailInfo = {
                    EffectName = "AttackTrail", 
                    TrailName = "IronFist", 
                    TargetPart = v93, 
                    DelayTime = 0, 
                    HoldTime = 0.16666666666666666, 
                    TimeScale = 1
                }
            });
        end);
        if not v31 and not v32 then
            return;
        else
            v21.HUDShake({
                Scale = 5 + 11 * (v88 / 8), 
                Damper = 0.35
            });
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                FadeTime = 0.1
            });
            return;
        end;
    end);
    v78[6] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Dash"):Connect(function() --[[ Line: 426 ]]
        -- upvalues: l_Character_0 (copy), v21 (ref)
        task.defer(function() --[[ Line: 427 ]]
            -- upvalues: l_Character_0 (ref), v21 (ref)
            local v96 = {
                Step = 1, 
                MaxTime = 0.3333333333333333, 
                DeleteDelay = 0.3, 
                AddTransparency = 0.98, 
                Character = l_Character_0
            };
            v21.AfterimageEffect(v96);
        end);
    end);
    v78[7] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("JumpStart"):Connect(function() --[[ Line: 440 ]]
        -- upvalues: v31 (copy), v32 (copy), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), l_Character_0 (copy), v21 (ref)
        if not v31 and not v32 then
            return;
        else
            local v97 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v97, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
            l_MenuBlur_3.Size = 0;
            l_MenuBlur_3.Enabled = true;
            local v99 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_3, v99, {
                Size = 10
            }):Play();
            local v100 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v100, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.defer(function() --[[ Line: 456 ]]
                -- upvalues: l_Character_0 (ref), v21 (ref)
                local v101 = {
                    Step = 1, 
                    MaxTime = 0.11666666666666667, 
                    DeleteDelay = 0.2, 
                    AddTransparency = 0.985, 
                    Character = l_Character_0
                };
                v21.AfterimageEffect(v101);
            end);
            return;
        end;
    end);
    local v102 = nil;
    v78[8] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Jump"):Connect(function() --[[ Line: 470 ]]
        -- upvalues: l_Whirlwind_0 (ref), v21 (ref), l_Character_0 (copy), v31 (copy), v32 (copy), l_BubbleModule_0 (ref), l_Victim_0 (copy), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), v102 (ref), l_CurrentCamera_0 (copy)
        local l_Smoke_0 = l_Whirlwind_0.Smoke;
        l_Smoke_0.Parent = v21.GetWeldCharacter(l_Character_0).PrimaryPart;
        for _, v105 in l_Smoke_0:GetChildren() do
            v105:Emit(v105:GetAttribute("EmitCount") or 0);
        end;
        task.delay(10, function() --[[ Line: 478 ]]
            -- upvalues: l_Smoke_0 (copy)
            if l_Smoke_0 then
                l_Smoke_0:Destroy();
            end;
        end);
        if not v31 and not v32 then
            return;
        else
            l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.5, Vector3.new(6, 6, 6, 0), 0.2);
            local v106 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v106, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
            l_MenuBlur_4.Size = 0;
            l_MenuBlur_4.Enabled = true;
            local v108 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_4, v108, {
                Size = 10
            }):Play();
            local v109 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v109, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.wait(0.6);
            v102 = l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 80
            });
            v102:Play();
            task.wait(0.3);
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.3, 
                Fade = 0.2
            });
            return;
        end;
    end);
    v78[9] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final1"):Connect(function() --[[ Line: 511 ]]
        -- upvalues: v31 (copy), v32 (copy), v102 (ref), l_CurrentCamera_0 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref)
        if not v31 and not v32 then
            return;
        else
            if v102 then
                v102:Cancel();
            end;
            l_CurrentCamera_0.FieldOfView = 60;
            l_ColorCorrection_0.Saturation = 0.4;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v110 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v110, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
            l_MenuBlur_5.Size = 0;
            l_MenuBlur_5.Enabled = true;
            local v112 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_5, v112, {
                Size = 20
            }):Play();
            local v113 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v113, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.defer(function() --[[ Line: 534 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.1
                });
            end);
            v21.CameraShake({
                Preset = "MedHit", 
                WaitTime = 1, 
                Fade = 2
            });
            return;
        end;
    end);
    v78[10] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final2"):Connect(function() --[[ Line: 547 ]]
        -- upvalues: v78 (copy), l_Whirlwind_0 (ref), v31 (copy), v32 (copy), v102 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), l_ColorCorrection_0 (copy), l_BubbleModule_0 (ref), l_Victim_0 (copy), l_Lighting_0 (ref), v21 (ref)
        for _, v115 in v78 do
            v115:Disconnect();
        end;
        for _, v117 in l_Whirlwind_0.Final:GetChildren() do
            v117:Emit(5);
        end;
        if not v31 and not v32 then
            return;
        else
            v102 = l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 80
            });
            v102:Play();
            l_ColorCorrection_0.Saturation = 0.4;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(10, 10, 10, 0), 0.3);
            local v118 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v118, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_6 = l_Lighting_0.MenuBlur;
            l_MenuBlur_6.Size = 0;
            l_MenuBlur_6.Enabled = true;
            local v120 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_6, v120, {
                Size = 20
            }):Play();
            local v121 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v121, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.defer(function() --[[ Line: 580 ]]
                -- upvalues: v21 (ref)
                v21.CreateImpactFrame({
                    Time = 0.1
                });
            end);
            v21.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 1, 
                Fade = 2
            });
            return;
        end;
    end);
    if v31 or v32 then
        local v122 = l_Assets_0.Camera:Clone();
        v122.Name = l_Character_0.Name .. "Camera";
        v122.Parent = l_Workspace_0.Debris;
        local v123 = 0;
        do
            local l_v123_0 = v123;
            local function v125() --[[ Line: 599 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v123_0 (ref), v122 (copy), l_Character_0 (copy)
                if os.time() - l_v123_0 < 0.5 then
                    return;
                else
                    l_v123_0 = os.time();
                    v122:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v125();
            local v126 = {
                Animator = v122.AnimationController.Animator, 
                AnimId = v27.Animations.Camera
            };
            v60 = l_AnimHelper_0:CreateAnim(v126);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 617 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v122 (copy), v125 (copy)
                l_CurrentCamera_0.CFrame = v122.Head.CFrame;
                v125();
            end);
            task.delay(12.5, function() --[[ Line: 622 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            end);
            task.wait(12.5);
            v60:AdjustSpeed(0.01);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.01);
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v48, {
                ImageTransparency = 1
            }):Play();
            l_TweenService_0:Create(l_Main_0.White, v49, {
                BackgroundTransparency = 0
            }):Play();
            if v102 then
                v102:Cancel();
            end;
            task.wait(0.3333333333333333);
            v60:Stop(0.1);
            if l_l_AnimHelper_0_Anim_1 then
                l_l_AnimHelper_0_Anim_1:Stop(0.1);
            end;
            l_l_AnimHelper_0_Anim_0:Stop(0.1);
            task.wait(0.4166666666666667);
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            l_CameraMode_0.Value = "";
            local v128 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
            l_TweenService_0:Create(l_ColorCorrection_0, v128, {
                Saturation = 0, 
                Contrast = 0
            }):Play();
            l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v48, {
                ImageTransparency = 1
            }):Play();
            local v129 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
            l_TweenService_0:Create(l_Lighting_0, v129, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.2, 
                Fade = 1
            });
            v122:Destroy();
        end;
    end;
    for _, v131 in v78 do
        v131:Disconnect();
    end;
    l_Victim_0.PrimaryPart.Anchored = false;
    l_Character_0.PrimaryPart.Anchored = false;
end;
return v27;