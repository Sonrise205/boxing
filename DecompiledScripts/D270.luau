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
    ExtraUltTime = 3.1666666666666665, 
    Animations = {
        Character = 131367966205650, 
        Victim = 125495317855579, 
        Camera = 70770120368533
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
        Name = "ShotgunSFXGradeD", 
        Parent = l_Character_0
    });
    v40.Volume = 0;
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v33 or v34 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 60;
        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            FieldOfView = 20
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
        TargetCFrame = l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 0, -4.02), 
        TeleportId = v46
    });
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v44);
    l_AnimHelper_0:CreateAnim(v45);
    task.delay(0.4666666666666667, function() --[[ Line: 111 ]]
        -- upvalues: v40 (copy), v33 (copy), v34 (copy)
        v40:Stop();
        if v33 or v34 then
            v40.Volume = 0.6;
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
    task.delay(0.8333333333333334, function() --[[ Line: 159 ]]
        -- upvalues: v51 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v49 (ref), v33 (copy), v34 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), l_ColorCorrection_0 (copy), l_BubbleModule_0 (ref), l_Victim_0 (copy), l_Lighting_0 (ref), v23 (ref)
        for _, v54 in v51 do
            v54:Disconnect();
        end;
        l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.6);
        l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.6);
        v49:AdjustSpeed(0.6);
        if not v33 and not v34 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 20
            }):Play();
            l_ColorCorrection_0.Saturation = 0.4;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            l_BubbleModule_0.CreateBubble(l_Victim_0.UpperTorso.CFrame, Vector3.new(0, 0, 0, 0), 0.3, Vector3.new(10, 10, 10, 0), 0.3);
            local v55 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_0, v55, {
                Saturation = -0.4, 
                Contrast = 0.2
            }):Play();
            local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
            l_MenuBlur_0.Size = 0;
            l_MenuBlur_0.Enabled = true;
            local v57 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_0, v57, {
                Size = 20
            }):Play();
            local v58 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v58, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.defer(function() --[[ Line: 190 ]]
                -- upvalues: v23 (ref)
                v23.CreateImpactFrame({
                    Time = 0.1
                });
            end);
            v23.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 2, 
                Fade = 2
            });
            return;
        end;
    end);
    if v33 or v34 then
        local v59 = l_Assets_0.Camera:Clone();
        v59.Name = l_Character_0.Name .. "Camera";
        v59.Parent = l_Workspace_0.Debris;
        local v60 = 0;
        do
            local l_v60_0 = v60;
            local function v62() --[[ Line: 209 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v60_0 (ref), v59 (copy), l_Character_0 (copy)
                if os.time() - l_v60_0 < 0.5 then
                    return;
                else
                    l_v60_0 = os.time();
                    v59:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v62();
            local v63 = {
                Animator = v59.AnimationController.Animator, 
                AnimId = v29.Animations.Camera
            };
            v49 = l_AnimHelper_0:CreateAnim(v63);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 227 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v59 (copy), v43 (ref), v62 (copy)
                l_CurrentCamera_0.CFrame = v59.Head.CFrame * v43;
                v62();
            end);
            task.delay(8, function() --[[ Line: 232 ]]
                -- upvalues: v59 (copy)
                v59:Destroy();
            end);
        end;
    end;
    task.delay(8, function() --[[ Line: 238 ]]
        -- upvalues: v51 (copy)
        for _, v66 in v51 do
            v66:Disconnect();
        end;
    end);
end;
return v29;