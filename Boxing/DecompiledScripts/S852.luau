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
local _ = require(l_ReplicatedStorage_0:WaitForChild("BubbleModule"));
local l_EffectHelper_0 = l_ReplicatedStorage_0.Modules.EffectHelper;
local v23 = require(l_EffectHelper_0);
local v24 = Random.new();
local function _(v25, v26, v27) --[[ Line: 36 ]] --[[ Name: Lerp ]]
    return v25 + (v26 - v25) * v27;
end;
local v29 = {
    ExtraUltTime = 5, 
    Animations = {
        Character = 101288541656798, 
        Victim = 127012805041875, 
        Camera = 113013663777580
    }
};
v29.Use = function(v30) --[[ Line: 48 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_TweenService_0 (copy), v29 (copy), v23 (copy), l_AnimHelper_0 (copy), v24 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
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
        Name = "ShotgunSFXGradeS", 
        Parent = l_Character_0
    });
    v40.Volume = 0;
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v33 or v34 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 25;
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
        TargetCFrame = l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 0, -3.6), 
        TeleportId = v46
    });
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v44);
    l_AnimHelper_0:CreateAnim(v45);
    task.delay(0, function() --[[ Line: 111 ]]
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
    v51[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Uppercut"):Connect(function() --[[ Line: 159 ]]
        -- upvalues: v50 (copy), v33 (copy), v34 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v23 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        for _, v54 in v50.Uppercut:GetChildren() do
            v54.TimeScale = v54.TimeScale / 3;
            v54:Emit(1);
        end;
        task.delay(0.8666666666666667, function() --[[ Line: 167 ]]
            -- upvalues: v50 (ref)
            for _, v56 in v50.Uppercut:GetChildren() do
                v56.TimeScale = v56.TimeScale * 3;
            end;
        end);
        if not v33 and not v34 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 26
            }):Play();
            task.defer(function() --[[ Line: 177 ]]
                -- upvalues: v23 (ref)
                v23.CameraShake({
                    Preset = "MedHit", 
                    WaitTime = 0.5, 
                    Fade = 0.5
                });
            end);
            task.defer(function() --[[ Line: 185 ]]
                -- upvalues: v23 (ref)
                v23.CreateImpactFrame({
                    Time = 0.1
                });
            end);
            task.wait(0.8666666666666667);
            task.defer(function() --[[ Line: 193 ]]
                -- upvalues: v23 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                v23.CreateImpactFrame({
                    Time = 0.1
                });
                l_ColorCorrection_0.Saturation = 0;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v57 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v57, {
                    Saturation = -0.4, 
                    Contrast = 0.6
                }):Play();
                local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                l_MenuBlur_0.Size = 0;
                l_MenuBlur_0.Enabled = true;
                local v59 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_0, v59, {
                    Size = 15
                }):Play();
                local v60 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v60, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.4
                }):Play();
            end);
            v23.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v23.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 1, 
                Fade = 1.5
            });
            return;
        end;
    end);
    local v61 = true;
    v51[2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hit"):Connect(function() --[[ Line: 229 ]]
        -- upvalues: l_Workspace_0 (ref), l_Victim_0 (copy), v24 (ref), v23 (ref), v30 (copy), l_Character_0 (copy), v46 (copy), v33 (copy), v34 (copy), v61 (ref), l_CurrentCamera_0 (copy), l_TweenService_0 (ref)
        local v62 = script.Explosion:Clone();
        v62.Parent = l_Workspace_0.Debris;
        v62.CFrame = l_Victim_0.Head.CFrame * CFrame.new(v24:NextNumber(-1, 1), v24:NextNumber(-1.5, 0), -1);
        for _, v64 in v62:GetDescendants() do
            if v64:IsA("ParticleEmitter") then
                v64:Emit(1);
            end;
        end;
        task.delay(6, function() --[[ Line: 239 ]]
            -- upvalues: v62 (copy)
            v62:Destroy();
        end);
        v23.TeleportModel({
            Character = v30.Victim, 
            TargetCFrame = l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 0, -4), 
            TeleportId = v46
        });
        if not v33 and not v34 then
            return;
        else
            if v61 then
                l_CurrentCamera_0.FieldOfView = 24;
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    FieldOfView = 36
                }):Play();
            end;
            v61 = false;
            v23.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.1, 
                Fade = 0.5
            });
            return;
        end;
    end);
    v51[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 266 ]]
        -- upvalues: v50 (copy), v33 (copy), v34 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v23 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        for _, v66 in v50.Uppercut:GetChildren() do
            v66:Emit(2);
        end;
        if not v33 and not v34 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 60
            }):Play();
            task.defer(function() --[[ Line: 275 ]]
                -- upvalues: v23 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                v23.CreateImpactFrame({
                    Time = 0.07692307692307693
                });
                l_ColorCorrection_0.Saturation = 0;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v67 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v67, {
                    Saturation = -0.2, 
                    Contrast = 0.3
                }):Play();
                local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                l_MenuBlur_1.Size = 0;
                l_MenuBlur_1.Enabled = true;
                local v69 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_1, v69, {
                    Size = 15
                }):Play();
                local v70 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v70, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.2
                }):Play();
            end);
            v23.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v23.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.5, 
                Fade = 0.8
            });
            return;
        end;
    end);
    v51[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Teleport"):Connect(function() --[[ Line: 310 ]]
        -- upvalues: v51 (copy), v33 (copy), v34 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v23 (ref), v30 (copy), l_Character_0 (copy), v46 (copy)
        for _, v72 in v51 do
            v72:Disconnect();
        end;
        if not v33 and not v34 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 35
            }):Play();
            v23.TeleportModel({
                Character = v30.Victim, 
                TargetCFrame = l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 0, -3.1), 
                TeleportId = v46
            });
            return;
        end;
    end);
    if v33 or v34 then
        local v73 = l_Assets_0.Camera:Clone();
        v73.Name = l_Character_0.Name .. "Camera";
        v73.Parent = l_Workspace_0.Debris;
        local v74 = 0;
        do
            local l_v74_0 = v74;
            local function v76() --[[ Line: 332 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v74_0 (ref), v73 (copy), l_Character_0 (copy)
                if os.time() - l_v74_0 < 0.5 then
                    return;
                else
                    l_v74_0 = os.time();
                    v73:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v76();
            local v77 = {
                Animator = v73.AnimationController.Animator, 
                AnimId = v29.Animations.Camera
            };
            v49 = l_AnimHelper_0:CreateAnim(v77);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 350 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v73 (copy), v43 (ref), v76 (copy)
                l_CurrentCamera_0.CFrame = v73.Head.CFrame * v43 * CFrame.new(0, 0, -0.35);
                v76();
            end);
            task.delay(8, function() --[[ Line: 355 ]]
                -- upvalues: v73 (copy)
                v73:Destroy();
            end);
        end;
    end;
    task.delay(8, function() --[[ Line: 361 ]]
        -- upvalues: v51 (copy)
        for _, v80 in v51 do
            v80:Disconnect();
        end;
    end);
end;
return v29;