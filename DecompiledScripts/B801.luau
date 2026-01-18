local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0:WaitForChild("AlignHelper"));
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("Styles"));
local _ = l_ReplicatedStorage_0:WaitForChild("UnreliableRemoteEvents"):WaitForChild("ReplicateMinigameData");
local _ = require(l_ReplicatedStorage_0:WaitForChild("Bezier"));
local _ = require(l_Modules_0:WaitForChild("RayHelper"));
local l_Assets_0 = l_ReplicatedStorage_0:WaitForChild("Assets");
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local l_BubbleModule_0 = require(l_ReplicatedStorage_0:WaitForChild("BubbleModule"));
local l_EffectHelper_0 = l_ReplicatedStorage_0.Modules.EffectHelper;
local v23 = require(l_EffectHelper_0);
local _ = Random.new();
local function _(v25, v26, v27) --[[ Line: 36 ]] --[[ Name: Lerp ]]
    return v25 + (v26 - v25) * v27;
end;
local v29 = {
    ExtraUltTime = 3.5, 
    Animations = {
        Character = 72298681860983, 
        Victim = 131046552397788, 
        Camera = 110400822663431
    }
};
v29.Use = function(v30) --[[ Line: 48 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_TweenService_0 (copy), v29 (copy), v23 (copy), l_AnimHelper_0 (copy), l_BubbleModule_0 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
    local l_Character_0 = v30.Character;
    local l_Victim_0 = v30.Victim;
    local v33 = l_LocalPlayer_0.Character == l_Character_0;
    local v34 = l_LocalPlayer_0.Character == l_Victim_0;
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v36 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v38 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
    local v40 = l_SoundHelper_0:PlaySound({
        Name = "ShotgunSFXGradeB", 
        Parent = l_Character_0
    });
    v40.Volume = 0;
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v33 or v34 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 20;
        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            FieldOfView = 30
        }):Play();
    end;
    local v43 = CFrame.new(0, -0.3, 0);
    local v44 = {
        Animator = v36, 
        AnimId = v29.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v45 = {
        Animator = v38, 
        AnimId = v29.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v46 = v23.UpdateTeleportId(v30.Victim);
    v23.TeleportModel({
        Character = v30.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 0, -3.1), 
        TeleportId = v46
    });
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v44);
    l_AnimHelper_0:CreateAnim(v45);
    task.delay(0.8, function() --[[ Line: 111 ]]
        -- upvalues: v40 (copy), v33 (copy), v34 (copy)
        v40:Stop();
        if v33 or v34 then
            v40.Volume = 0.45;
        else
            v40.Volume = 0.1;
        end;
        v40:Play();
    end);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v44);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v45);
    local v49 = nil;
    task.delay(0.3333333333333333, function() --[[ Line: 127 ]]
        -- upvalues: l_l_AnimHelper_0_Anim_1 (copy), l_l_AnimHelper_0_Anim_0 (copy), v49 (ref), v43 (ref)
        l_l_AnimHelper_0_Anim_1.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
        if v49 then
            v49.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
        end;
        task.wait(1);
        v43 = CFrame.new();
    end);
    local v50 = script.Effects:Clone();
    v50.Parent = l_Workspace_0.Debris;
    v50.CFrame = l_Character_0.PrimaryPart.CFrame;
    task.delay(30, function() --[[ Line: 139 ]]
        -- upvalues: v50 (copy)
        v50:Destroy();
    end);
    local v51 = {};
    task.defer(function() --[[ Line: 147 ]]
        -- upvalues: l_Character_0 (copy), v23 (ref)
        local v52 = {
            Step = 1, 
            MaxTime = 0.8333333333333334, 
            DeleteDelay = 0.1, 
            AddTransparency = 0.96, 
            Character = l_Character_0
        };
        v23.AfterimageEffect(v52);
    end);
    v51[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hit1"):Connect(function() --[[ Line: 159 ]]
        -- upvalues: l_Workspace_0 (ref), l_Victim_0 (copy), v50 (copy), v33 (copy), v34 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), v23 (ref)
        local v53 = script.Explosion:Clone();
        v53.Parent = l_Workspace_0.Debris;
        v53.CFrame = l_Victim_0.Head.CFrame * CFrame.new(0, -1, 0);
        for _, v55 in v53:GetDescendants() do
            if v55:IsA("ParticleEmitter") then
                v55.TimeScale = 0.5;
                v55:Emit(v55:GetAttribute("EmitCount"));
            end;
        end;
        task.delay(6, function() --[[ Line: 171 ]]
            -- upvalues: v53 (copy)
            v53:Destroy();
        end);
        for _, v57 in v50.Uppercut:GetChildren() do
            v57:Emit(2);
        end;
        if not v33 and not v34 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 25
            }):Play();
            l_ColorCorrection_0.Saturation = 0.2;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v58 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v58, {
                Saturation = -0.3, 
                Contrast = 0.1
            }):Play();
            local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
            l_MenuBlur_0.Size = 0;
            l_MenuBlur_0.Enabled = true;
            local v60 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_0, v60, {
                Size = 10
            }):Play();
            local v61 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v61, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.1
            }):Play();
            v23.CameraShake({
                Preset = "SuperHardHit", 
                WaitTime = 0.5, 
                Fade = 0.5
            });
            return;
        end;
    end);
    v51[2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hit2"):Connect(function() --[[ Line: 206 ]]
        -- upvalues: v50 (copy), v33 (copy), v34 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v23 (ref)
        for _, v63 in v50.Uppercut:GetChildren() do
            v63:Emit(2);
        end;
        if not v33 and not v34 then
            return;
        else
            l_ColorCorrection_0.Saturation = 0.2;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v64 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v64, {
                Saturation = -0.3, 
                Contrast = 0.1
            }):Play();
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v66 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v66, {
                Size = 10
            }):Play();
            local v67 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v67, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.1
            }):Play();
            v23.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.3, 
                Fade = 0.3
            });
            return;
        end;
    end);
    v51[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hit3"):Connect(function() --[[ Line: 237 ]]
        -- upvalues: v50 (copy), v33 (copy), v34 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), l_ColorCorrection_0 (copy), l_Lighting_0 (ref), v23 (ref)
        for _, v69 in v50.Uppercut:GetChildren() do
            v69:Emit(2);
        end;
        if not v33 and not v34 then
            return;
        else
            task.delay(0.5, function() --[[ Line: 244 ]]
                -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_0 (ref)
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FieldOfView = 18
                }):Play();
            end);
            l_ColorCorrection_0.Saturation = 0.2;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            local v70 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v70, {
                Saturation = -0.3, 
                Contrast = 0.1
            }):Play();
            local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
            l_MenuBlur_2.Size = 0;
            l_MenuBlur_2.Enabled = true;
            local v72 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_2, v72, {
                Size = 10
            }):Play();
            local v73 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v73, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.1
            }):Play();
            v23.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.3, 
                Fade = 0.3
            });
            return;
        end;
    end);
    v51[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 272 ]]
        -- upvalues: v51 (copy), v50 (copy), v33 (copy), v34 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), l_ColorCorrection_0 (copy), l_BubbleModule_0 (ref), l_Victim_0 (copy), l_Lighting_0 (ref), v23 (ref)
        for _, v75 in v51 do
            v75:Disconnect();
        end;
        for _, v77 in v50.Final:GetChildren() do
            v77:Emit(5);
        end;
        if not v33 and not v34 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 22
            }):Play();
            l_ColorCorrection_0.Saturation = 0.4;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(10, 10, 10, 0), 0.3);
            local v78 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v78, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
            l_MenuBlur_3.Size = 0;
            l_MenuBlur_3.Enabled = true;
            local v80 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_3, v80, {
                Size = 20
            }):Play();
            local v81 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v81, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.defer(function() --[[ Line: 303 ]]
                -- upvalues: v23 (ref)
                v23.CreateImpactFrame({
                    Time = 0.1
                });
            end);
            v23.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 1, 
                Fade = 2
            });
            return;
        end;
    end);
    if v33 or v34 then
        local v82 = l_Assets_0.Camera:Clone();
        v82.Name = l_Character_0.Name .. "Camera";
        v82.Parent = l_Workspace_0.Debris;
        local v83 = 0;
        do
            local l_v83_0 = v83;
            local function v85() --[[ Line: 322 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v83_0 (ref), v82 (copy), l_Character_0 (copy)
                if os.time() - l_v83_0 < 0.5 then
                    return;
                else
                    l_v83_0 = os.time();
                    v82:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v85();
            local v86 = {
                Animator = v82.AnimationController.Animator, 
                AnimId = v29.Animations.Camera
            };
            v49 = l_AnimHelper_0:CreateAnim(v86);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 340 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v82 (copy), v43 (ref), v85 (copy)
                l_CurrentCamera_0.CFrame = v82.Head.CFrame * v43;
                v85();
            end);
            task.delay(8, function() --[[ Line: 345 ]]
                -- upvalues: v82 (copy)
                v82:Destroy();
            end);
        end;
    end;
    task.delay(8, function() --[[ Line: 351 ]]
        -- upvalues: v51 (copy)
        for _, v89 in v51 do
            v89:Disconnect();
        end;
    end);
end;
return v29;