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
local _ = Random.new();
local function _(v25, v26, v27) --[[ Line: 36 ]] --[[ Name: Lerp ]]
    return v25 + (v26 - v25) * v27;
end;
local v29 = {
    ExtraUltTime = 4.766666666666667, 
    Animations = {
        Character = 130032747422790, 
        Victim = 127150035979785, 
        Camera = 73047954091005
    }
};
local function v39(v30, v31) --[[ Line: 48 ]] --[[ Name: SetTransparency ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_Workspace_0 (copy)
    for _, v33 in v30:GetDescendants() do
        if v33.Name == "UnusualParticle" then
            v33.Enabled = v31 == 0;
            if not v33.Enabled then
                local l_Parent_0 = v33.Parent;
                v33.Parent = l_ReplicatedStorage_0;
                v33.Parent = l_Parent_0;
            end;
        end;
        if (v33:IsA("BasePart") or v33:IsA("Decal")) and v33.LocalTransparencyModifier < 1000 then
            v33.LocalTransparencyModifier = v31;
        end;
    end;
    local l_FirstChild_0 = l_Workspace_0.Welds:FindFirstChild(v30.Name);
    if l_FirstChild_0 then
        for _, v37 in l_FirstChild_0:GetDescendants() do
            if v37.Name == "UnusualParticle" then
                v37.Enabled = v31 == 0;
                if not v37.Enabled then
                    local l_Parent_1 = v37.Parent;
                    v37.Parent = l_ReplicatedStorage_0;
                    v37.Parent = l_Parent_1;
                end;
            end;
            if (v37:IsA("BasePart") or v37:IsA("Decal")) and v37.LocalTransparencyModifier < 1000 then
                v37.LocalTransparencyModifier = v31;
            end;
        end;
    end;
end;
v29.Use = function(v40) --[[ Line: 85 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_TweenService_0 (copy), v29 (copy), v23 (copy), l_AnimHelper_0 (copy), v39 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
    local l_Character_0 = v40.Character;
    local l_Victim_0 = v40.Victim;
    local v43 = l_LocalPlayer_0.Character == l_Character_0;
    local v44 = l_LocalPlayer_0.Character == l_Victim_0;
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v46 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v48 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
    local v50 = l_SoundHelper_0:PlaySound({
        Name = "ShotgunSFXGradeS", 
        Parent = l_Character_0
    });
    v50.Volume = 0;
    local v51 = l_SoundHelper_0:PlaySound({
        Name = "ShotgunSFXGradeA", 
        Parent = l_Character_0
    });
    v51.Volume = 0;
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v43 or v44 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 25;
        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            FieldOfView = 30
        }):Play();
    end;
    local v54 = CFrame.new(0, -0.3, 0);
    local v55 = {
        Animator = v46, 
        AnimId = v29.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v56 = {
        Animator = v48, 
        AnimId = v29.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v57 = v23.UpdateTeleportId(v40.Victim);
    v23.TeleportModel({
        Character = v40.Victim, 
        TargetCFrame = l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 0, -3.6), 
        TeleportId = v57
    });
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    l_AnimHelper_0:CreateAnim(v55);
    l_AnimHelper_0:CreateAnim(v56);
    task.delay(0, function() --[[ Line: 155 ]]
        -- upvalues: v50 (copy), v43 (copy), v44 (copy)
        v50:Stop();
        if v43 or v44 then
            v50.Volume = 0.3;
        else
            v50.Volume = 0.05;
        end;
        v50:Play();
    end);
    task.delay(0, function() --[[ Line: 167 ]]
        -- upvalues: v51 (copy), v43 (copy), v44 (copy)
        v51:Stop();
        if v43 or v44 then
            v51.Volume = 0.45;
        else
            v51.Volume = 0.1;
        end;
        v51.TimePosition = 0.1;
        v51:Play();
    end);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v55);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v56);
    local v60 = nil;
    task.delay(0.3333333333333333, function() --[[ Line: 184 ]]
        -- upvalues: l_l_AnimHelper_0_Anim_1 (copy), l_l_AnimHelper_0_Anim_0 (copy), v60 (ref), v54 (ref)
        l_l_AnimHelper_0_Anim_1.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
        if v60 then
            v60.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
        end;
        task.wait(1);
        v54 = CFrame.new();
    end);
    local v61 = script.Effects:Clone();
    v61.Parent = l_Workspace_0.Debris;
    v61.CFrame = l_Character_0.PrimaryPart.CFrame;
    task.delay(30, function() --[[ Line: 196 ]]
        -- upvalues: v61 (copy)
        v61:Destroy();
    end);
    local v62 = {};
    task.defer(function() --[[ Line: 204 ]]
        -- upvalues: l_Character_0 (copy), v23 (ref)
        local v63 = {
            Step = 1, 
            MaxTime = 0.8333333333333334, 
            DeleteDelay = 0.1, 
            AddTransparency = 0.96, 
            Character = l_Character_0
        };
        v23.AfterimageEffect(v63);
    end);
    v62[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Start"):Connect(function() --[[ Line: 216 ]]
        -- upvalues: v61 (copy), v43 (copy), v44 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v23 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        for _, v65 in v61.Uppercut:GetChildren() do
            v65.TimeScale = v65.TimeScale / 3;
            v65:Emit(1);
        end;
        task.delay(0.8666666666666667, function() --[[ Line: 224 ]]
            -- upvalues: v61 (ref)
            for _, v67 in v61.Uppercut:GetChildren() do
                v67.TimeScale = v67.TimeScale * 3;
            end;
        end);
        if not v43 and not v44 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 26
            }):Play();
            task.defer(function() --[[ Line: 234 ]]
                -- upvalues: v23 (ref)
                v23.CameraShake({
                    Preset = "MedHit", 
                    WaitTime = 0.5, 
                    Fade = 0.5
                });
            end);
            task.defer(function() --[[ Line: 242 ]]
                -- upvalues: v23 (ref)
                v23.CreateImpactFrame({
                    Time = 0.1
                });
            end);
            task.wait(0.8666666666666667);
            task.defer(function() --[[ Line: 250 ]]
                -- upvalues: v23 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                v23.CreateImpactFrame({
                    Time = 0.1
                });
                l_ColorCorrection_0.Saturation = 0;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v68 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v68, {
                    Saturation = -0.4, 
                    Contrast = 0.6
                }):Play();
                local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                l_MenuBlur_0.Size = 0;
                l_MenuBlur_0.Enabled = true;
                local v70 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_0, v70, {
                    Size = 15
                }):Play();
                local v71 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v71, {
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
    v62[2] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Hide"):Connect(function() --[[ Line: 285 ]]
        -- upvalues: v43 (copy), v44 (copy), l_CurrentCamera_0 (copy), l_TweenService_0 (ref), v39 (ref), l_Character_0 (copy)
        if not v43 and not v44 then
            return;
        else
            l_CurrentCamera_0.FieldOfView = 12;
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 30
            }):Play();
            task.wait(0.9);
            v39(l_Character_0, 1);
            return;
        end;
    end);
    v62[3] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Show"):Connect(function() --[[ Line: 295 ]]
        -- upvalues: v43 (copy), v44 (copy), v39 (ref), l_Character_0 (copy), l_CurrentCamera_0 (copy), l_TweenService_0 (ref)
        if not v43 and not v44 then
            return;
        else
            v39(l_Character_0, 0);
            l_CurrentCamera_0.FieldOfView = 15;
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                FieldOfView = 30
            }):Play();
            task.wait(2);
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 25
            }):Play();
            return;
        end;
    end);
    v62[4] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Zoom"):Connect(function() --[[ Line: 308 ]]
        -- upvalues: v43 (copy), v44 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy)
        if not v43 and not v44 then
            return;
        else
            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 15
            }):Play();
            return;
        end;
    end);
    local v72 = nil;
    v62[5] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 315 ]]
        -- upvalues: v61 (copy), v43 (copy), v44 (copy), v72 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v23 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
        for _, v74 in v61.Final:GetChildren() do
            v74.TimeScale = v74.TimeScale * 0.9;
            v74:Emit(v74:GetAttribute("EmitCount") or 1);
        end;
        if not v43 and not v44 then
            return;
        else
            v72 = l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 27
            });
            v72:Play();
            task.defer(function() --[[ Line: 326 ]]
                -- upvalues: v23 (ref), l_ColorCorrection_0 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                v23.CreateImpactFrame({
                    Time = 0.07692307692307693
                });
                l_ColorCorrection_0.Saturation = 0;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local v75 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_0, v75, {
                    Saturation = -0.2, 
                    Contrast = 0.3
                }):Play();
                local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                l_MenuBlur_1.Size = 0;
                l_MenuBlur_1.Enabled = true;
                local v77 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_1, v77, {
                    Size = 15
                }):Play();
                local v78 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v78, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.2
                }):Play();
            end);
            v23.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v23.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 1.5, 
                Fade = 2
            });
            return;
        end;
    end);
    if v43 or v44 then
        local v79 = l_Assets_0.Camera:Clone();
        v79.Name = l_Character_0.Name .. "Camera";
        v79.Parent = l_Workspace_0.Debris;
        local v80 = 0;
        do
            local l_v80_0 = v80;
            local function v82() --[[ Line: 367 ]] --[[ Name: UpdateCameraCFrame ]]
                -- upvalues: l_v80_0 (ref), v79 (copy), l_Character_0 (copy)
                if os.time() - l_v80_0 < 0.5 then
                    return;
                else
                    l_v80_0 = os.time();
                    v79:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                    return;
                end;
            end;
            v82();
            local v83 = {
                Animator = v79.AnimationController.Animator, 
                AnimId = v29.Animations.Camera
            };
            v60 = l_AnimHelper_0:CreateAnim(v83);
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 385 ]]
                -- upvalues: l_CurrentCamera_0 (copy), v79 (copy), v54 (ref), v82 (copy)
                l_CurrentCamera_0.CFrame = v79.Head.CFrame * v54 * CFrame.new(0, 0, -0.35);
                v82();
            end);
            task.delay(8, function() --[[ Line: 390 ]]
                -- upvalues: v79 (copy)
                v79:Destroy();
            end);
        end;
    end;
    task.delay(8, function() --[[ Line: 396 ]]
        -- upvalues: v62 (copy)
        for _, v86 in v62 do
            v86:Disconnect();
        end;
    end);
end;
return v29;