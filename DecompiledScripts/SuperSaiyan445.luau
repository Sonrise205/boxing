local v0 = {
    DelayTime = 6.833333333333333, 
    ServerDelayTime = 10.666666666666666, 
    RandomTime = 0, 
    Metadata = {
        DisplayName = "SUPER", 
        GlowColor = Color3.fromRGB(255, 243, 111), 
        Price = 94999, 
        New = true
    }, 
    OverrideBlob = "Simple", 
    Animations = {
        SSJ1 = 93604691452293, 
        SSJ1Camera = 71750678491466, 
        SSJ2 = 103662258661773, 
        SSJ2Camera = 134539117326414, 
        KO = 77177949147577
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
    local v23 = Random.new();
    local _ = require(l_ReplicatedStorage_0:WaitForChild("Modules", 10):WaitForChild("EmoteHelper", 10));
    local function _(v25, v26, v27) --[[ Line: 66 ]] --[[ Name: Lerp ]]
        return v25 + (v26 - v25) * v27;
    end;
    local l_NumberSequenceTween_0 = require(l_ReplicatedStorage_0:WaitForChild("NumberSequenceTween"));
    local function v39(v30, v31) --[[ Line: 70 ]] --[[ Name: SetTransparency ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), l_Workspace_0 (copy)
        for _, v33 in v30:GetDescendants() do
            if v33.Name == "UnusualParticle" then
                v33.Enabled = v31 == 0;
                if not v33.Enabled then
                    local l_Parent_1 = v33.Parent;
                    v33.Parent = l_ReplicatedStorage_0;
                    v33.Parent = l_Parent_1;
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
                        local l_Parent_2 = v37.Parent;
                        v37.Parent = l_ReplicatedStorage_0;
                        v37.Parent = l_Parent_2;
                    end;
                end;
                if (v37:IsA("BasePart") or v37:IsA("Decal")) and v37.LocalTransparencyModifier < 1000 then
                    v37.LocalTransparencyModifier = v31;
                end;
            end;
        end;
    end;
    weldAttachments = function(v40, v41) --[[ Line: 107 ]] --[[ Name: weldAttachments ]]
        local l_Weld_0 = Instance.new("Weld");
        l_Weld_0.Part0 = v40.Parent;
        l_Weld_0.Part1 = v41.Parent;
        l_Weld_0.C0 = v40.CFrame;
        l_Weld_0.C1 = v41.CFrame;
        l_Weld_0.Parent = v40.Parent;
        return l_Weld_0;
    end;
    local function _(v43, v44, v45, v46, v47, v48) --[[ Line: 117 ]] --[[ Name: buildWeld ]]
        local l_Weld_1 = Instance.new("Weld");
        l_Weld_1.Name = v43;
        l_Weld_1.Part0 = v45;
        l_Weld_1.Part1 = v46;
        l_Weld_1.C0 = v47;
        l_Weld_1.C1 = v48;
        l_Weld_1.Parent = v44;
        return l_Weld_1;
    end;
    local function v51(v52, v53) --[[ Line: 128 ]] --[[ Name: findFirstMatchingAttachment ]]
        -- upvalues: v51 (copy)
        for _, v55 in pairs(v52:GetChildren()) do
            if v55:IsA("Attachment") and v55.Name == v53 then
                return v55;
            elseif not v55:IsA("Accoutrement") and not v55:IsA("Tool") then
                local v56 = v51(v55, v53);
                if v56 then
                    return v56;
                end;
            end;
        end;
    end;
    addAccoutrement = function(v57, v58) --[[ Line: 141 ]] --[[ Name: addAccoutrement ]]
        -- upvalues: v51 (copy)
        v58.Parent = v57;
        local l_Handle_0 = v58:FindFirstChild("Handle");
        if l_Handle_0 then
            local l_Attachment_0 = l_Handle_0:FindFirstChildOfClass("Attachment");
            if l_Attachment_0 then
                local v61 = v51(v57, l_Attachment_0.Name);
                if v61 then
                    weldAttachments(v61, l_Attachment_0);
                    return;
                end;
            else
                local l_Head_0 = v57:FindFirstChild("Head");
                if l_Head_0 then
                    local v63 = CFrame.new(0, 0.5, 0);
                    local l_AttachmentPoint_0 = v58.AttachmentPoint;
                    local l_Weld_2 = Instance.new("Weld");
                    l_Weld_2.Name = "HeadWeld";
                    l_Weld_2.Part0 = l_Head_0;
                    l_Weld_2.Part1 = l_Handle_0;
                    l_Weld_2.C0 = v63;
                    l_Weld_2.C1 = l_AttachmentPoint_0;
                    l_Weld_2.Parent = l_Head_0;
                end;
            end;
        end;
    end;
    v0.Main = function(v66) --[[ Line: 162 ]] --[[ Name: Main ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), v22 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_Main_0 (copy), l_RunService_0 (copy), v39 (copy), v23 (copy), l_NumberSequenceTween_0 (copy)
        local v67 = tick();
        local l_Character_0 = v66.Character;
        local l_Damager_0 = v66.Damager;
        local l_StartPosition_0 = v66.StartPosition;
        local l_LookVector_0 = v66.LookVector;
        local l_FirstChild_1 = l_Workspace_0.States:FindFirstChild(l_Character_0.Name);
        local l_CharacterData_0 = l_FirstChild_1:FindFirstChild("CharacterData");
        local l_PlayerData_0 = l_FirstChild_1:FindFirstChild("PlayerData");
        local l_Occupied_0 = l_FirstChild_1:FindFirstChild("Occupied");
        if not l_CharacterData_0 or not l_PlayerData_0 or not l_Occupied_0 then
            return;
        else
            local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(l_Character_0);
            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
            local v78 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
            local l_Humanoid_1 = l_Damager_0:FindFirstChild("Humanoid");
            local v80 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
            if not v78 or not v80 then
                return;
            else
                local v81 = l_Assets_0.DownFrames.Default:Clone();
                local v82 = l_LocalPlayer_0.Character == l_Character_0;
                local v83 = v82 or l_LocalPlayer_0.Character == l_Damager_0;
                if v83 then
                    v81.Parent = l_Common_0;
                end;
                l_Damager_0:SetAttribute("CurrentEmote", nil);
                task.wait(0.03333333333333333);
                local v84 = v22.GetWeldCharacter(l_Character_0);
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = true;
                    local v85 = CFrame.lookAt(l_Character_0.PrimaryPart.Position, l_Damager_0.PrimaryPart.Position).LookVector * Vector3.new(1, 0, 1, 0);
                    if v85.Magnitude > 0.1 then
                        l_Character_0:PivotTo(CFrame.new(l_Character_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position + v85));
                    end;
                end;
                l_Character_0:SetAttribute("SSJ", true);
                local l_FirstChild_2 = l_Workspace_0.States:FindFirstChild(l_Character_0.Name);
                local v87 = l_FirstChild_2 and l_FirstChild_2:FindFirstChild("CharacterData");
                if v87 then
                    local v88 = false;
                    local v89 = {};
                    do
                        local l_v88_0 = v88;
                        local function v97() --[[ Line: 216 ]] --[[ Name: ResetAppearance ]]
                            -- upvalues: l_v88_0 (ref), l_Character_0 (copy)
                            if l_v88_0 then
                                return;
                            else
                                l_v88_0 = true;
                                if l_Character_0:GetAttribute("SSJ2") then
                                    return;
                                else
                                    l_Character_0:SetAttribute("SSJ", nil);
                                    for _, v92 in l_Character_0:GetDescendants() do
                                        if v92.Name == "SSJ" then
                                            v92:Destroy();
                                        end;
                                        if string.lower(v92.Name) == "face" then
                                            v92.Transparency = 0;
                                        end;
                                    end;
                                    l_Character_0.Head.LocalTransparencyModifier = 0;
                                    for _, v94 in l_Character_0:GetChildren() do
                                        if v94:IsA("Accessory") then
                                            for _, v96 in v94:GetDescendants() do
                                                if v96:IsA("ParticleEmitter") then
                                                    v96.Enabled = true;
                                                end;
                                                if v96:IsA("BasePart") then
                                                    v96.LocalTransparencyModifier = 0;
                                                    if v96.Transparency == 1 then
                                                        v96.Transparency = 0;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                    return;
                                end;
                            end;
                        end;
                        local l_v89_0 = v89 --[[ copy: 22 -> 71 ]];
                        v89[1] = l_Humanoid_0.Died:Connect(function() --[[ Line: 253 ]]
                            -- upvalues: l_v88_0 (ref), l_v89_0 (copy)
                            l_v88_0 = true;
                            for _, v100 in l_v89_0 do
                                v100:Disconnect();
                            end;
                        end);
                        local l_v97_0 = v97 --[[ copy: 23 -> 72 ]];
                        v89[2] = v84.ChildAdded:Connect(function(v102) --[[ Line: 261 ]]
                            -- upvalues: l_v97_0 (copy), l_v89_0 (copy)
                            if v102.Name ~= "ResetAppearance" then
                                return;
                            else
                                l_v97_0();
                                for _, v104 in l_v89_0 do
                                    v104:Disconnect();
                                end;
                                return;
                            end;
                        end);
                        v89[2] = v87.Opponent.Changed:Connect(function() --[[ Line: 271 ]]
                            -- upvalues: l_v97_0 (copy), l_v89_0 (copy)
                            task.wait(0.4);
                            l_v97_0();
                            for _, v106 in l_v89_0 do
                                v106:Disconnect();
                            end;
                        end);
                    end;
                end;
                local v107 = 0.1;
                local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_0, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_0, l_StartPosition_0 - l_LookVector_0, v107 + 0, l_l_RayHelper_0_EnvironmentWhitelist_0);
                local v112 = l_StartPosition_0 - l_LookVector_0 * v107;
                if l_l_RayHelper_0_RayWithWhiteList_0 then
                    v112 = l_StartPosition_0 - l_LookVector_0 * 0.1;
                end;
                local v113 = v0.ServerDelayTime / (v0.ServerDelayTime + v66.ExtraTime);
                local v114 = 0.6 * v113;
                local v115 = 1 * v113;
                local v116 = 0.25 / v114;
                local v117 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v118 = {};
                for _, v120 in l_Character_0:GetChildren() do
                    if v120:IsA("BasePart") and v120 ~= l_Character_0.PrimaryPart then
                        v118[v120] = v120.CollisionGroup;
                        v120.CollisionGroup = "None";
                    end;
                end;
                for _, v122 in (v80:GetPlayingAnimationTracks()) do
                    if v122.Priority == Enum.AnimationPriority.Action or v122.Priority == Enum.AnimationPriority.Action2 or v122.Priority == Enum.AnimationPriority.Action3 then
                        local l_Speed_0 = v122.Speed;
                        v122:AdjustSpeed(l_Speed_0 / 3);
                        task.delay(v116, function() --[[ Line: 319 ]]
                            -- upvalues: v122 (copy), l_Speed_0 (copy)
                            if not v122 then
                                return;
                            else
                                v122:AdjustSpeed(l_Speed_0);
                                return;
                            end;
                        end);
                    end;
                end;
                local v124 = l_Assets_0.Camera:Clone();
                v124.Parent = l_Workspace_0.Debris;
                v124:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 0, 0) * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                v124.Head.Transparency = 1;
                local v125 = {
                    AnimId = v0.Animations.SSJ1, 
                    FadeIn = 0.05, 
                    NameFade = 0.1, 
                    AnimSpeed = v114, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = v78, 
                    Weight = 1000, 
                    Looped = false, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v125);
                v125.AnimId = v0.Animations.SSJ1Camera;
                v125.Animator = v124.AnimationController;
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v125);
                local l_CFrame_0 = l_Character_0.PrimaryPart.CFrame;
                local _ = l_Workspace_0:GetServerTimeNow();
                local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
                l_ColorCorrectionEffect_0.Parent = l_Lighting_0;
                local _ = {};
                local _ = {};
                local _ = {
                    "Live", 
                    "Welds", 
                    "Debris", 
                    "Base"
                };
                if v83 then

                end;
                local v134 = v22.GetAtmosphere();
                local v135 = {
                    Density = v134.Density, 
                    Color = v134.Color, 
                    Haze = v134.Haze, 
                    Glare = v134.Glare, 
                    Decay = v134.Decay
                };
                local v136 = {
                    Density = 0.65, 
                    Color = Color3.fromRGB(0, 0, 0), 
                    Decay = Color3.fromRGB(0, 0, 0), 
                    Haze = 20, 
                    Glare = 0.1
                };
                if v83 then
                    l_TweenService_0:Create(v134, TweenInfo.new(10.666666666666666, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v136):Play();
                end;
                local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
                local v138 = {};
                local v139 = script.Knockdown:Clone();
                v139.CFrame = CFrame.lookAt(l_CFrame_0.Position, v112);
                v139.Position = v139.Position + Vector3.new(0, 0.75, 0, 0);
                v139.Parent = l_Workspace_0.Debris;
                for _, v141 in v139.Particle:GetChildren() do
                    v141.Enabled = false;
                    v141:Emit(v141:GetAttribute("EmitCount"));
                end;
                task.delay(5, function() --[[ Line: 401 ]]
                    -- upvalues: v139 (copy)
                    v139:Destroy();
                end);
                task.defer(function() --[[ Line: 405 ]]
                    -- upvalues: v83 (copy), l_ColorCorrectionEffect_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
                    if not v83 then
                        return;
                    else
                        l_ColorCorrectionEffect_0.Saturation = 0;
                        l_ColorCorrectionEffect_0.Contrast = 0;
                        l_ColorCorrectionEffect_0.Enabled = true;
                        local v142 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_ColorCorrectionEffect_0, v142, {
                            Saturation = -0.5, 
                            Contrast = 1
                        }):Play();
                        local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_0.Size = 0;
                        l_MenuBlur_0.Enabled = true;
                        local v144 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_0, v144, {
                            Size = 12
                        }):Play();
                        local v145 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_Lighting_0, v145, {
                            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                        }):Play();
                        return;
                    end;
                end);
                if v83 then
                    task.defer(function() --[[ Line: 427 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.3, 
                            Fade = 3
                        });
                    end);
                end;
                task.delay(0.5, function() --[[ Line: 436 ]]
                    -- upvalues: l_SoundHelper_0 (ref), v83 (copy), l_Workspace_0 (ref), l_Character_0 (copy), l_TweenService_0 (ref)
                    local v146 = l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v83 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Theme
                    });
                    task.wait(9);
                    l_TweenService_0:Create(v146, TweenInfo.new(6, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                        Volume = 0
                    }):Play();
                end);
                task.delay(v116 + 0.5, function() --[[ Line: 447 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), v115 (copy), l_l_AnimHelper_0_Anim_1 (copy), l_SoundHelper_0 (ref), v83 (copy), l_Workspace_0 (ref), l_Character_0 (copy), v22 (ref), l_LookVector_0 (copy)
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(v115);
                    l_l_AnimHelper_0_Anim_1:AdjustSpeed(v115);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v83 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Land1
                    });
                    if v83 then
                        v22.HUDShake({
                            Scale = 10, 
                            Damper = 0.09999999999999999
                        });
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.4, 
                            Fade = 2.5
                        });
                    end;
                    local v147 = script.FallSmoke2:Clone();
                    v147.Position = (CFrame.lookAt(l_Character_0.UpperTorso.Position, l_Character_0.UpperTorso.Position + l_LookVector_0) * CFrame.new(0, 0, 0)).Position - Vector3.new(0, 2.5999999046325684, 0, 0);
                    v147.Parent = l_Workspace_0.Debris;
                    for _, v149 in v147.Attachment:GetChildren() do
                        v149.Enabled = false;
                        v149.TimeScale = v149.TimeScale * 0.4;
                        v149:Emit(v149:GetAttribute("EmitCount"));
                    end;
                    task.wait(5);
                    v147:Destroy();
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
                local v155 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v82 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v155, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v82 then
                    l_Occupied_0.LerpMult.Value = 0.1;
                end;
                if v83 then
                    task.delay(0.3333333333333333 / v115, function() --[[ Line: 511 ]]
                        -- upvalues: v124 (copy), l_Character_0 (copy), l_CameraMode_0 (copy), l_CurrentCamera_0 (copy), l_TweenService_0 (ref), v115 (copy), l_RunService_0 (ref), v39 (ref), l_Damager_0 (copy), l_Vignette_0 (copy), v155 (copy), l_LocalPlayer_0 (ref), v22 (ref), l_Humanoid_1 (copy), l_LookVector_0 (copy)
                        v124:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 0, 0) * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                        l_CameraMode_0.Value = "Cutscene";
                        l_CurrentCamera_0.FieldOfView = 50;
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FieldOfView = 35
                        }):Play();
                        task.delay(0.5833333333333334 / v115, function() --[[ Line: 519 ]]

                        end);
                        l_RunService_0:BindToRenderStep("CameraRig", Enum.RenderPriority.Camera.Value + 6, function(_) --[[ Line: 523 ]]
                            -- upvalues: v124 (ref), l_RunService_0 (ref), l_CurrentCamera_0 (ref)
                            if not v124 or not v124:FindFirstChild("Head") then
                                l_RunService_0:UnbindFromRenderStep("CameraRig");
                                return;
                            else
                                l_CurrentCamera_0.CFrame = v124.Head.CFrame;
                                return;
                            end;
                        end);
                        v39(l_Damager_0, 1);
                        l_TweenService_0:Create(l_Vignette_0, v155, {
                            ImageTransparency = 0.2
                        }):Play();
                        if l_LocalPlayer_0.Character == l_Damager_0 then
                            v22.KnockdownWalk({
                                Damager = l_Damager_0, 
                                DamagerHumanoid = l_Humanoid_1, 
                                LookVector = l_LookVector_0
                            });
                        end;
                    end);
                end;
                local v157 = {};
                local v158 = script.Effects.Shake:Clone();
                local v159 = script.Effects.Rocks:Clone();
                task.delay(10, function() --[[ Line: 551 ]]
                    -- upvalues: v158 (copy), v159 (copy)
                    if v158 then
                        v158:Destroy();
                    end;
                    if v159 then
                        v159:Destroy();
                    end;
                end);
                v157[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Start"):Connect(function() --[[ Line: 556 ]]
                    -- upvalues: v158 (copy), v84 (copy), v159 (copy), v83 (copy), v22 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy), v23 (ref), l_TweenService_0 (ref), l_LookVector_0 (copy)
                    if v158 and v158.Parent ~= nil then
                        v158.Parent = v84.PrimaryPart;
                    end;
                    v159.Parent = v84.PrimaryPart;
                    task.defer(function() --[[ Line: 560 ]]
                        -- upvalues: v83 (ref), v22 (ref)
                        if not v83 then
                            return;
                        else
                            v22.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 2, 
                                Fade = 4
                            });
                            return;
                        end;
                    end);
                    local function v165(v160) --[[ Line: 570 ]] --[[ Name: CreateLightning ]]
                        -- upvalues: l_SoundHelper_0 (ref), v83 (ref), l_Workspace_0 (ref), l_Character_0 (ref), v23 (ref), v22 (ref), l_TweenService_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v83 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                            DirectCopy = script.Sounds.Lightning, 
                            Speed = v23:NextNumber(0.8, 1.1)
                        });
                        local v161 = script.Lightning:Clone();
                        v161.CFrame = l_Character_0.PrimaryPart.CFrame * v160;
                        local v162 = v161.Att0.WorldPosition.Y - v161.Position.Y;
                        v161.Lightning.Size = Vector3.new(v161.Lightning.Size.X, v162, v161.Lightning.Size.Z);
                        v161.Lightning.CFrame = CFrame.new(v161.Att0.WorldPosition) * CFrame.new(0, -(v162 / 2), 0);
                        v161.Att1.WorldPosition = v161.Lightning.Position - Vector3.new(0, v162 / 2, 0);
                        v161.Parent = workspace.Debris;
                        local l_Color_0 = v161.Clouds.Color;
                        task.defer(function() --[[ Line: 591 ]]
                            -- upvalues: v83 (ref), v22 (ref)
                            if not v83 then
                                return;
                            else
                                v22.CreateImpactFrame({
                                    Time = 0.06
                                });
                                return;
                            end;
                        end);
                        task.defer(function() --[[ Line: 599 ]]
                            -- upvalues: v161 (copy), v162 (copy), l_TweenService_0 (ref), l_Color_0 (copy)
                            local v164 = script.LightningHit:Clone();
                            v164.Position = v161.Lightning.Position - Vector3.new(0, v162 / 2, 0) + Vector3.new(0, 1.100000023841858, 0, 0);
                            v164.Parent = workspace.Debris;
                            v161.Lightning.Lightning:Emit(15);
                            v161.Lightning.Lightning1:Emit(15);
                            v161.Att0.Specs:Emit(5);
                            v161.Att0.Shards:Emit(15);
                            l_TweenService_0:Create(v161.Att0.Beam, TweenInfo.new(0.135, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Width0 = 6, 
                                Width1 = 6
                            }):Play();
                            l_TweenService_0:Create(v161.Att0.Beam1, TweenInfo.new(0.135, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Width0 = 7.5, 
                                Width1 = 7.5
                            }):Play();
                            l_TweenService_0:Create(v164, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
                                Orientation = v164.Orientation + Vector3.new(0, 360, 0, 0)
                            }):Play();
                            task.spawn(function() --[[ Line: 614 ]]
                                -- upvalues: v161 (ref), l_Color_0 (ref)
                                v161.Clouds.Color = ColorSequence.new(Color3.fromRGB(83, 82, 108));
                                task.wait(0.05);
                                v161.Clouds.Color = l_Color_0;
                            end);
                            v164.Attachment.Gradient:Emit(1);
                            v164.Attachment.Crack:Emit(1);
                            v164.Attachment.Secondary:Emit(10);
                            v164.Attachment.Shards:Emit(15);
                            v164.Attachment.Specs:Emit(15);
                            v164.Specs:Emit(25);
                            v164.Shards:Emit(25);
                            task.wait(0.135);
                            l_TweenService_0:Create(v161.Att0.Beam, TweenInfo.new(0.135, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Width0 = 0, 
                                Width1 = 0
                            }):Play();
                            l_TweenService_0:Create(v161.Att0.Beam1, TweenInfo.new(0.135, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Width0 = 0, 
                                Width1 = 0
                            }):Play();
                            task.wait(1);
                            task.spawn(function() --[[ Line: 634 ]]
                                -- upvalues: v161 (ref)
                                v161.Clouds.Enabled = false;
                            end);
                            task.wait(2.25);
                            v164:Destroy();
                            task.wait(6);
                            v161:Destroy();
                        end);
                    end;
                    task.defer(function() --[[ Line: 644 ]]
                        -- upvalues: v83 (ref), v22 (ref)
                        if not v83 then
                            return;
                        else
                            v22.CameraShake({
                                Preset = "SuperHardHit", 
                                WaitTime = 0.2, 
                                Fade = 1
                            });
                            return;
                        end;
                    end);
                    v165(CFrame.new(6.8, -4.8, -2));
                    task.wait(1.5);
                    task.defer(function() --[[ Line: 657 ]]
                        -- upvalues: v83 (ref), v22 (ref)
                        if not v83 then
                            return;
                        else
                            v22.CameraShake({
                                Preset = "SuperHardHit", 
                                WaitTime = 0.2, 
                                Fade = 1
                            });
                            return;
                        end;
                    end);
                    v165(CFrame.new(-5.3, -4.8, -5));
                    task.wait(1.5);
                    task.defer(function() --[[ Line: 670 ]]
                        -- upvalues: v83 (ref), v22 (ref)
                        if not v83 then
                            return;
                        else
                            v22.CameraShake({
                                Preset = "SuperHardHit", 
                                WaitTime = 0.2, 
                                Fade = 1
                            });
                            return;
                        end;
                    end);
                    v165(CFrame.new(3, -4.8, 10));
                    local v166 = script.FallSmoke:Clone();
                    v166.Position = (CFrame.lookAt(l_Character_0.UpperTorso.Position, l_Character_0.UpperTorso.Position + l_LookVector_0) * CFrame.new(0, 0, 0)).Position - Vector3.new(0, 2.5999999046325684, 0, 0);
                    v166.Parent = l_Workspace_0.Debris;
                    for _, v168 in v166.Particle:GetChildren() do
                        v168.TimeScale = v168.TimeScale * 0.65;
                        v168.Enabled = false;
                        v168:Emit(v168:GetAttribute("EmitCount") * 1.6);
                    end;
                    task.wait(5);
                    v166:Destroy();
                end);
                v157[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Zoom"):Connect(function() --[[ Line: 696 ]]
                    -- upvalues: v83 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v22 (ref)
                    if not v83 then
                        return;
                    else
                        task.wait(0.5);
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.3333333333333333, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FieldOfView = 27
                        }):Play();
                        task.defer(function() --[[ Line: 702 ]]
                            -- upvalues: v22 (ref)
                            v22.CreateImpactFrame({
                                Time = 0.06
                            });
                        end);
                        task.defer(function() --[[ Line: 708 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.1, 
                                Fade = 0.3
                            });
                        end);
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.3333333333333333, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FieldOfView = 26
                        }):Play();
                        return;
                    end;
                end);
                local function v198() --[[ Line: 719 ]] --[[ Name: UpdateAppearance ]]
                    -- upvalues: v66 (copy), l_Character_0 (copy), l_NumberSequenceTween_0 (ref)
                    if v66.OverrideBlob then
                        return;
                    else
                        local v169 = script.SSJ1Hair:Clone();
                        v169.Name = "SSJ";
                        v169.Parent = l_Character_0;
                        local l_Weld_3 = Instance.new("Weld");
                        l_Weld_3.Parent = v169;
                        l_Weld_3.Part0 = v169.PrimaryPart;
                        l_Weld_3.Part1 = l_Character_0.Head;
                        v169.Head.Color = l_Character_0.Head.Color;
                        for _, v172 in l_Character_0.Head:GetChildren() do
                            if v172:IsA("Decal") then
                                v172.Transparency = 1;
                            end;
                        end;
                        l_Character_0.Head.LocalTransparencyModifier = 1;
                        for _, v174 in script.SSJFace:GetChildren() do
                            local v175 = v174:Clone();
                            v175.Name = "SSJ";
                            v175.Parent = l_Character_0.Head;
                        end;
                        local v176 = {
                            Enum.AccessoryType.Hat, 
                            Enum.AccessoryType.Hair, 
                            Enum.AccessoryType.Face, 
                            Enum.AccessoryType.Eyebrow, 
                            Enum.AccessoryType.Eyelash, 
                            Enum.AccessoryType.Unknown
                        };
                        for _, v178 in l_Character_0:GetChildren() do
                            if v178:IsA("Accessory") and table.find(v176, v178.AccessoryType) then
                                for _, v180 in v178:GetDescendants() do
                                    if v180:IsA("ParticleEmitter") then
                                        v180.Enabled = false;
                                    end;
                                    if v180:IsA("BasePart") then
                                        v180.LocalTransparencyModifier = 1;
                                        if v180.Transparency == 0 then
                                            v180.Transparency = 1;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        for _, v182 in script.SSJ1Aura:GetChildren() do
                            local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(v182.Name);
                            if l_l_Character_0_FirstChild_0 then
                                for _, v185 in v182:GetChildren() do
                                    local v186 = v185:Clone();
                                    v186.Name = "SSJAura";
                                    v186.Parent = l_l_Character_0_FirstChild_0;
                                end;
                            end;
                        end;
                        for _, v188 in l_Character_0:GetChildren() do
                            if v188:IsA("BasePart") and v188.Transparency ~= 1 then
                                for _, v190 in script.Effects.SSJAura:GetChildren() do
                                    local v191 = v190:Clone();
                                    v191.Name = "SSJ";
                                    v191.Parent = v188;
                                end;
                            end;
                        end;
                        task.delay(3, function() --[[ Line: 797 ]]
                            -- upvalues: l_Character_0 (ref), l_NumberSequenceTween_0 (ref)
                            for _, v193 in l_Character_0:GetDescendants() do
                                if v193.Name == "SSJAura" then
                                    if v193:IsA("ParticleEmitter") then
                                        l_NumberSequenceTween_0.Tween(v193, 120, 1);
                                    else
                                        for _, v195 in v193:GetDescendants() do
                                            if v195:IsA("ParticleEmitter") then
                                                l_NumberSequenceTween_0.Tween(v195, 120, 1);
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                            task.wait(6);
                            for _, v197 in l_Character_0:GetDescendants() do
                                if v197.Name == "SSJAura" then
                                    v197:Destroy();
                                end;
                            end;
                        end);
                        return;
                    end;
                end;
                v157[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Super"):Connect(function() --[[ Line: 821 ]]
                    -- upvalues: v83 (copy), l_TweenService_0 (ref), v134 (copy), v135 (copy), v198 (copy), v158 (copy), v159 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy), l_CurrentCamera_0 (copy), v22 (ref)
                    if v83 then
                        l_TweenService_0:Create(v134, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v135):Play();
                    end;
                    v198();
                    for _, v200 in v158:GetChildren() do
                        v200.TimeScale = v200.TimeScale * 0.3;
                        v200.Enabled = false;
                    end;
                    for _, v202 in v159:GetChildren() do
                        v202.TimeScale = v202.TimeScale * 0.3;
                        v202.Enabled = false;
                    end;
                    task.delay(5, function() --[[ Line: 838 ]]
                        -- upvalues: v158 (ref), v159 (ref)
                        if v158 then
                            v158:Destroy();
                        end;
                        if v159 then
                            v159:Destroy();
                        end;
                    end);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v83 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.AuraBurst
                    });
                    if not v83 then
                        return;
                    else
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FieldOfView = 45
                        }):Play();
                        task.defer(function() --[[ Line: 853 ]]
                            -- upvalues: v22 (ref)
                            v22.CreateImpactFrame({
                                Time = 0.12
                            });
                        end);
                        task.defer(function() --[[ Line: 859 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "HardHitRoll", 
                                WaitTime = 0.4, 
                                Fade = 1
                            });
                        end);
                        local v203 = script.SSJ1AuraBurst:Clone();
                        v203.Parent = l_Workspace_0.Debris;
                        v203.CFrame = l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 2.5, 0);
                        for _, v205 in v203:GetDescendants() do
                            if v205:IsA("ParticleEmitter") then
                                v205.ZOffset = v205.ZOffset - 4;
                                v205.Rate = v205.Rate * 0.3;
                            end;
                        end;
                        task.wait(1);
                        for _, v207 in v203:GetDescendants() do
                            if v207:IsA("ParticleEmitter") then
                                v207.Enabled = false;
                            end;
                        end;
                        task.wait(5);
                        return;
                    end;
                end);
                v157[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 886 ]]
                    -- upvalues: l_SoundHelper_0 (ref), v83 (copy), l_Workspace_0 (ref), l_Character_0 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v22 (ref)
                    task.delay(1, function() --[[ Line: 887 ]]
                        -- upvalues: l_SoundHelper_0 (ref), v83 (ref), l_Workspace_0 (ref), l_Character_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v83 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                            DirectCopy = script.Sounds.Surprise
                        });
                    end);
                    if not v83 then
                        return;
                    else
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.3333333333333333, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FieldOfView = 26
                        }):Play();
                        task.defer(function() --[[ Line: 899 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.1, 
                                Fade = 1
                            });
                        end);
                        return;
                    end;
                end);
                task.wait(v116);
                local _ = {};
                task.wait(0.8333333333333334 / v115);
                local v209 = v0.DelayTime - l_Workspace_0.Ping.Value / 2 - v66.RandomMult * v0.RandomTime + v66.ExtraTime;
                if v83 then
                    local v210 = v209 - 5.25 - v66.ExtraTime;
                    local l_v210_0 = v210 --[[ copy: 63 -> 70 ]];
                    task.defer(function() --[[ Line: 930 ]]
                        -- upvalues: l_v210_0 (copy), v22 (ref), v66 (copy)
                        task.wait(l_v210_0);
                        v22.CameraShake({
                            Preset = "SuperLight", 
                            WaitTime = 6 + v66.ExtraTime, 
                            Fade = 2
                        });
                    end);
                end;
                task.delay(v209, function() --[[ Line: 941 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_Damager_0:SetAttribute("CurrentEmote", nil);
                local v213 = tick();
                repeat
                    task.wait(0.1);
                until l_Character_0:GetAttribute("GettingUp") or not l_Character_0:IsDescendantOf(l_Workspace_0) or tick() - v213 > 15;
                task.delay(0.25 / v115, function() --[[ Line: 957 ]]
                    -- upvalues: l_Lighting_0 (ref), l_l_Players_0_PlayerFromCharacter_0 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v22 (ref), l_TweenService_0 (ref)
                    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
                    if l_l_Players_0_PlayerFromCharacter_0 or l_LocalPlayer_0.Character == l_Damager_0 then
                        task.defer(function() --[[ Line: 961 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "Knockdown", 
                                WaitTime = 0.35, 
                                Fade = 1, 
                                FoV = 55, 
                                FoVMult = 1
                            });
                        end);
                        v22.HUDShake({
                            Scale = 20, 
                            Damper = 0.09999999999999999
                        });
                        l_ColorCorrection_0.Saturation = 0;
                        l_ColorCorrection_0.Contrast = 0;
                        l_ColorCorrection_0.Enabled = true;
                        local v215 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_ColorCorrection_0, v215, {
                            Saturation = -1, 
                            Contrast = 0.5
                        }):Play();
                        local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_1.Size = 0;
                        l_MenuBlur_1.Enabled = true;
                        local v217 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_1, v217, {
                            Size = 10
                        }):Play();
                        local v218 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_Lighting_0, v218, {
                            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                        }):Play();
                    end;
                    task.wait(0.7);
                end);
                task.delay(0.25, function() --[[ Line: 998 ]]
                    -- upvalues: v82 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v39 (ref), l_TweenService_0 (ref), l_Vignette_0 (copy), v155 (copy), l_CameraMode_0 (copy), l_Variant_0 (copy), l_RunService_0 (ref), v124 (copy)
                    if v82 or l_LocalPlayer_0.Character == l_Damager_0 then
                        v39(l_Damager_0, 0);
                        l_TweenService_0:Create(l_Vignette_0, v155, {
                            ImageTransparency = 1
                        }):Play();
                        l_CameraMode_0.Value = "";
                        l_Variant_0.Value = "";
                        l_RunService_0:UnbindFromRenderStep("CameraRig");
                    end;
                    if v124 then
                        v124:Destroy();
                    end;
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                task.delay(0.44999999999999996, function() --[[ Line: 1018 ]]
                    -- upvalues: v67 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v82 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), l_Workspace_0 (ref), v22 (ref), v81 (copy)
                    print(v67 - tick());
                    l_SoundHelper_0:PlaySound({
                        Name = "BoxLayer", 
                        Parent = l_Character_0.PrimaryPart
                    });
                    task.wait(0.2);
                    if v82 or l_LocalPlayer_0.Character == l_Damager_0 then
                        l_SoundHelper_0:PlaySound({
                            Name = "Box", 
                            Parent = l_Workspace_0.Debris
                        });
                    end;
                    task.wait(0.9);
                    if v82 or l_LocalPlayer_0.Character == l_Damager_0 then
                        v22.TripleText({
                            Image = v81.Box, 
                            HoldTime = 0.6666666666666666
                        });
                        v22.CameraShake({
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
                if v82 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Lighting_0, v117, {
                        ExposureCompensation = l_Workspace_0.Exposure.Value
                    }):Play();
                end;
                if v82 then
                    l_Occupied_0.LerpMult.Value = 0;
                end;
                if v82 or l_LocalPlayer_0.Character == l_Damager_0 then
                    local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
                    local v220 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                    l_TweenService_0:Create(l_ColorCorrection_1, v220, {
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
                for v221, v222 in v118 do
                    v221.CollisionGroup = v222;
                end;
                for _, v224 in v157 do
                    v224:Disconnect();
                end;
                task.wait(5);
                for _, v226 in v138 do
                    v226:Destroy();
                end;
                l_l_AnimHelper_0_Anim_0:Stop(0);
                if v81 then
                    v81:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.Getup = function(v227) --[[ Line: 1099 ]] --[[ Name: Getup ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), v22 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_Main_0 (copy), l_RunService_0 (copy), v39 (copy), l_NumberSequenceTween_0 (copy)
        local v228 = tick();
        local l_Character_1 = v227.Character;
        local l_Damager_1 = v227.Damager;
        local l_StartPosition_1 = v227.StartPosition;
        local l_LookVector_1 = v227.LookVector;
        local l_FirstChild_3 = l_Workspace_0.States:FindFirstChild(l_Character_1.Name);
        local l_CharacterData_1 = l_FirstChild_3:FindFirstChild("CharacterData");
        local l_PlayerData_1 = l_FirstChild_3:FindFirstChild("PlayerData");
        local l_Occupied_1 = l_FirstChild_3:FindFirstChild("Occupied");
        if not l_CharacterData_1 or not l_PlayerData_1 or not l_Occupied_1 then
            return;
        else
            local l_l_Players_0_PlayerFromCharacter_1 = l_Players_0:GetPlayerFromCharacter(l_Character_1);
            local l_Humanoid_2 = l_Character_1:FindFirstChild("Humanoid");
            local v239 = l_Humanoid_2 and l_Humanoid_2:FindFirstChild("Animator");
            local l_Humanoid_3 = l_Damager_1:FindFirstChild("Humanoid");
            local v241 = l_Humanoid_3 and l_Humanoid_3:FindFirstChild("Animator");
            if not v239 or not v241 then
                return;
            else
                local v242 = l_Assets_0.DownFrames.Default:Clone();
                local v243 = l_LocalPlayer_0.Character == l_Character_1;
                local v244 = v243 or l_LocalPlayer_0.Character == l_Damager_1;
                if v244 then
                    v242.Parent = l_Common_0;
                end;
                l_Damager_1:SetAttribute("CurrentEmote", nil);
                task.wait(0.03333333333333333);
                local v245 = v22.GetWeldCharacter(l_Character_1);
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = true;
                    local v246 = CFrame.lookAt(l_Character_1.PrimaryPart.Position, l_Damager_1.PrimaryPart.Position).LookVector * Vector3.new(1, 0, 1, 0);
                    if v246.Magnitude > 0.1 then
                        l_Character_1:PivotTo(CFrame.new(l_Character_1.PrimaryPart.Position, l_Character_1.PrimaryPart.Position + v246));
                    end;
                end;
                l_Character_1:SetAttribute("SSJ2", true);
                local l_FirstChild_4 = l_Workspace_0.States:FindFirstChild(l_Character_1.Name);
                local v248 = l_FirstChild_4 and l_FirstChild_4:FindFirstChild("CharacterData");
                if v248 then
                    local v249 = false;
                    local v250 = {};
                    do
                        local l_v249_0 = v249;
                        local function v260() --[[ Line: 1153 ]] --[[ Name: ResetAppearance ]]
                            -- upvalues: l_v249_0 (ref), l_Character_1 (copy), l_Workspace_0 (ref)
                            if l_v249_0 then
                                return;
                            else
                                l_v249_0 = true;
                                task.delay(0.2, function() --[[ Line: 1157 ]]
                                    -- upvalues: l_Character_1 (ref)
                                    l_Character_1:SetAttribute("SSJ2", nil);
                                    l_Character_1:SetAttribute("SSJ", nil);
                                end);
                                for _, v253 in l_Workspace_0.Debris:GetChildren() do
                                    if v253.Name == l_Character_1.Name .. "SSJ" then
                                        v253:Destroy();
                                    end;
                                end;
                                for _, v255 in l_Character_1:GetDescendants() do
                                    if v255.Name == "SSJ" then
                                        v255:Destroy();
                                    end;
                                    if string.lower(v255.Name) == "face" then
                                        v255.Transparency = 0;
                                    end;
                                end;
                                l_Character_1.Head.LocalTransparencyModifier = 0;
                                for _, v257 in l_Character_1:GetChildren() do
                                    if v257:IsA("Accessory") then
                                        v257.Parent = l_Character_1;
                                        for _, v259 in v257:GetDescendants() do
                                            if v259:IsA("ParticleEmitter") then
                                                v259.Enabled = true;
                                            end;
                                            if v259:IsA("BasePart") then
                                                v259.LocalTransparencyModifier = 0;
                                                if v259.Transparency == 1 then
                                                    v259.Transparency = 0;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                                return;
                            end;
                        end;
                        local l_v250_0 = v250 --[[ copy: 22 -> 71 ]];
                        v250[1] = l_Humanoid_2.Died:Connect(function() --[[ Line: 1200 ]]
                            -- upvalues: l_v249_0 (ref), l_v250_0 (copy)
                            l_v249_0 = true;
                            for _, v263 in l_v250_0 do
                                v263:Disconnect();
                            end;
                        end);
                        local l_v260_0 = v260 --[[ copy: 23 -> 72 ]];
                        v250[2] = v245.ChildAdded:Connect(function(v265) --[[ Line: 1208 ]]
                            -- upvalues: l_v260_0 (copy), l_v250_0 (copy)
                            if v265.Name ~= "ResetAppearance" then
                                return;
                            else
                                l_v260_0();
                                for _, v267 in l_v250_0 do
                                    v267:Disconnect();
                                end;
                                return;
                            end;
                        end);
                        v250[2] = v248.Opponent.Changed:Connect(function() --[[ Line: 1218 ]]
                            -- upvalues: l_v260_0 (copy), l_v250_0 (copy)
                            task.wait(0.4);
                            l_v260_0();
                            for _, v269 in l_v250_0 do
                                v269:Disconnect();
                            end;
                        end);
                    end;
                end;
                local v270 = 0.1;
                local l_l_RayHelper_0_EnvironmentWhitelist_1 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_1, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_1, l_StartPosition_1 - l_LookVector_1, v270 + 0, l_l_RayHelper_0_EnvironmentWhitelist_1);
                local v275 = l_StartPosition_1 - l_LookVector_1 * v270;
                if l_l_RayHelper_0_RayWithWhiteList_1 then
                    v275 = l_StartPosition_1 - l_LookVector_1 * 0.1;
                end;
                local v276 = v0.ServerDelayTime / (v0.ServerDelayTime + v227.ExtraTime);
                local v277 = 0.6 * v276;
                local v278 = 1 * v276;
                local v279 = 0.25 / v277;
                local v280 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v281 = {};
                for _, v283 in l_Character_1:GetChildren() do
                    if v283:IsA("BasePart") and v283 ~= l_Character_1.PrimaryPart then
                        v281[v283] = v283.CollisionGroup;
                        v283.CollisionGroup = "None";
                    end;
                end;
                for _, v285 in (v241:GetPlayingAnimationTracks()) do
                    if v285.Priority == Enum.AnimationPriority.Action or v285.Priority == Enum.AnimationPriority.Action2 or v285.Priority == Enum.AnimationPriority.Action3 then
                        local l_Speed_1 = v285.Speed;
                        v285:AdjustSpeed(l_Speed_1 / 3);
                        task.delay(v279, function() --[[ Line: 1266 ]]
                            -- upvalues: v285 (copy), l_Speed_1 (copy)
                            if not v285 then
                                return;
                            else
                                v285:AdjustSpeed(l_Speed_1);
                                return;
                            end;
                        end);
                    end;
                end;
                local v287 = l_Assets_0.Camera:Clone();
                v287.Parent = l_Workspace_0.Debris;
                v287:PivotTo(l_Character_1.PrimaryPart.CFrame * CFrame.new(0, 0, 0) * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                v287.Head.Transparency = 1;
                local v288 = {
                    AnimId = v0.Animations.SSJ2, 
                    FadeIn = 0.05, 
                    NameFade = 0.1, 
                    AnimSpeed = v277, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = v239, 
                    Weight = 1000, 
                    Looped = false, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v288);
                v288.AnimId = v0.Animations.SSJ2Camera;
                v288.Animator = v287.AnimationController;
                local l_l_AnimHelper_0_Anim_3 = l_AnimHelper_0:CreateAnim(v288);
                local l_CFrame_1 = l_Character_1.PrimaryPart.CFrame;
                local _ = l_Workspace_0:GetServerTimeNow();
                local l_ColorCorrectionEffect_1 = Instance.new("ColorCorrectionEffect");
                l_ColorCorrectionEffect_1.Parent = l_Lighting_0;
                local v294 = {};
                local v295 = {};
                local v296 = {
                    "Live", 
                    "Welds", 
                    "Debris"
                };
                if v244 then
                    local v297, v298 = v22.GetPartsToHide(l_Character_1, v296);
                    v294 = v297;
                    v295 = v298;
                end;
                local v299 = v22.GetAtmosphere();
                local v300 = {
                    Density = v299.Density, 
                    Color = v299.Color, 
                    Haze = v299.Haze, 
                    Glare = v299.Glare, 
                    Decay = v299.Decay
                };
                local v301 = {
                    Density = 0.8, 
                    Color = Color3.fromRGB(0, 0, 0), 
                    Decay = Color3.fromRGB(0, 0, 0), 
                    Haze = 20, 
                    Glare = 0.1
                };
                local l_CurrentCamera_1 = game.Workspace.CurrentCamera;
                local v303 = {};
                local v304 = script.Knockdown:Clone();
                v304.CFrame = CFrame.lookAt(l_CFrame_1.Position, v275);
                v304.Position = v304.Position + Vector3.new(0, 0.75, 0, 0);
                v304.Parent = l_Workspace_0.Debris;
                for _, v306 in v304.Particle:GetChildren() do
                    v306.Enabled = false;
                    v306:Emit(v306:GetAttribute("EmitCount"));
                end;
                task.delay(5, function() --[[ Line: 1344 ]]
                    -- upvalues: v304 (copy)
                    v304:Destroy();
                end);
                task.defer(function() --[[ Line: 1348 ]]
                    -- upvalues: v244 (copy), l_ColorCorrectionEffect_1 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
                    if not v244 then
                        return;
                    else
                        l_ColorCorrectionEffect_1.Saturation = 0;
                        l_ColorCorrectionEffect_1.Contrast = 0;
                        l_ColorCorrectionEffect_1.Enabled = true;
                        local v307 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_ColorCorrectionEffect_1, v307, {
                            Saturation = -0.5, 
                            Contrast = 1
                        }):Play();
                        local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_2.Size = 0;
                        l_MenuBlur_2.Enabled = true;
                        local v309 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_2, v309, {
                            Size = 12
                        }):Play();
                        local v310 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_Lighting_0, v310, {
                            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                        }):Play();
                        return;
                    end;
                end);
                task.delay(0.5, function() --[[ Line: 1369 ]]
                    -- upvalues: l_SoundHelper_0 (ref), v244 (copy), l_Workspace_0 (ref), l_Character_1 (copy), l_TweenService_0 (ref)
                    local v311 = l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v244 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Theme2
                    });
                    task.wait(9);
                    l_TweenService_0:Create(v311, TweenInfo.new(6, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                        Volume = 0
                    }):Play();
                end);
                task.delay(v279 + 0.5, function() --[[ Line: 1380 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_2 (copy), v278 (copy), l_l_AnimHelper_0_Anim_3 (copy), l_SoundHelper_0 (ref), v244 (copy), l_Workspace_0 (ref), l_Character_1 (copy), l_LookVector_1 (copy)
                    l_l_AnimHelper_0_Anim_2:AdjustSpeed(v278);
                    l_l_AnimHelper_0_Anim_3:AdjustSpeed(v278);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v244 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Land1
                    });
                    local v312 = script.FallSmoke2:Clone();
                    v312.Position = (CFrame.lookAt(l_Character_1.UpperTorso.Position, l_Character_1.UpperTorso.Position + l_LookVector_1) * CFrame.new(0, 0, 0)).Position - Vector3.new(0, 2.5999999046325684, 0, 0);
                    v312.Parent = l_Workspace_0.Debris;
                    for _, v314 in v312.Attachment:GetChildren() do
                        v314.Enabled = false;
                        v314.TimeScale = v314.TimeScale * 0.4;
                        v314:Emit(v314:GetAttribute("EmitCount"));
                    end;
                    task.wait(5);
                    v312:Destroy();
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_1.PrimaryPart
                });
                if l_Occupied_1 and l_LocalPlayer_0.Character == l_Character_1 then
                    l_Occupied_1.Target.Value = l_LookVector_1;
                    l_Occupied_1.LockedOn.Value = l_Damager_1;
                end;
                local l_CameraSettings_1 = l_Workspace_0:FindFirstChild("CameraSettings");
                local _ = l_CameraSettings_1.CameraTarget;
                local l_CameraMode_1 = l_CameraSettings_1.CameraMode;
                local l_Variant_1 = l_CameraSettings_1.Variant;
                local l_Vignette_1 = l_Main_0.DownFrame.Vignette;
                local v320 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v243 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v320, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v243 then
                    l_Occupied_1.LerpMult.Value = 0.1;
                end;
                if v244 then
                    task.delay(0.3333333333333333 / v278, function() --[[ Line: 1431 ]]
                        -- upvalues: v287 (copy), l_Character_1 (copy), l_CameraMode_1 (copy), l_CurrentCamera_1 (copy), l_TweenService_0 (ref), v278 (copy), l_RunService_0 (ref), v39 (ref), l_Damager_1 (copy), l_Vignette_1 (copy), v320 (copy), l_LocalPlayer_0 (ref), v22 (ref), l_Humanoid_3 (copy), l_LookVector_1 (copy)
                        v287:PivotTo(l_Character_1.PrimaryPart.CFrame * CFrame.new(0, 0, 0) * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -3, 0));
                        l_CameraMode_1.Value = "Cutscene";
                        l_CurrentCamera_1.FieldOfView = 50;
                        l_TweenService_0:Create(l_CurrentCamera_1, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FieldOfView = 35
                        }):Play();
                        task.delay(0.5833333333333334 / v278, function() --[[ Line: 1439 ]]

                        end);
                        l_RunService_0:BindToRenderStep("CameraRig", Enum.RenderPriority.Camera.Value + 6, function(_) --[[ Line: 1443 ]]
                            -- upvalues: v287 (ref), l_CurrentCamera_1 (ref)
                            if not v287 then
                                return;
                            else
                                l_CurrentCamera_1.CFrame = v287.Head.CFrame;
                                return;
                            end;
                        end);
                        v39(l_Damager_1, 1);
                        l_TweenService_0:Create(l_Vignette_1, v320, {
                            ImageTransparency = 0.2
                        }):Play();
                        if l_LocalPlayer_0.Character == l_Damager_1 then
                            v22.KnockdownWalk({
                                Damager = l_Damager_1, 
                                DamagerHumanoid = l_Humanoid_3, 
                                LookVector = l_LookVector_1
                            });
                        end;
                    end);
                end;
                local v322 = {};
                local v323 = script.Effects.Shake:Clone();
                local v324 = script.Effects.Rocks:Clone();
                local v325 = nil;
                v322[1] = l_l_AnimHelper_0_Anim_2:GetMarkerReachedSignal("Start"):Connect(function() --[[ Line: 1469 ]]
                    -- upvalues: v244 (copy), l_TweenService_0 (ref), v299 (copy), v301 (copy), v294 (ref), v295 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_1 (copy), v325 (ref), v22 (ref), l_ColorCorrectionEffect_1 (copy), l_Lighting_0 (ref)
                    if not v244 then
                        return;
                    else
                        l_TweenService_0:Create(v299, TweenInfo.new(0.16666666666666666, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v301):Play();
                        task.defer(function() --[[ Line: 1474 ]]
                            -- upvalues: l_TweenService_0 (ref), v294 (ref)
                            for v326 = 1, 5 do
                                local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v326 / 5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                                for _, v329 in v294 do
                                    if v329.LocalTransparencyModifier < 1000 then
                                        v329.LocalTransparencyModifier = l_l_TweenService_0_Value_0;
                                    end;
                                end;
                                task.wait(0.03333333333333333);
                            end;
                        end);
                        for _, v331 in v295 do
                            v331.Enabled = false;
                        end;
                        task.delay(0.8, function() --[[ Line: 1492 ]]
                            -- upvalues: l_SoundHelper_0 (ref), v244 (ref), l_Workspace_0 (ref), l_Character_1 (ref)
                            l_SoundHelper_0:PlaySound({
                                Name = "Knockdown", 
                                Parent = v244 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                                DirectCopy = script.Sounds.Shing
                            });
                        end);
                        task.wait(1);
                        v325 = script.AngerBackdrop:Clone();
                        v325.Parent = l_Workspace_0.Debris;
                        v325:SetPrimaryPartCFrame(l_Character_1.PrimaryPart.CFrame * CFrame.new(-4, -1.4, 0));
                        task.defer(function() --[[ Line: 1506 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "SuperHardHit", 
                                WaitTime = 0.2, 
                                Fade = 0.4
                            });
                        end);
                        task.defer(function() --[[ Line: 1514 ]]
                            -- upvalues: v22 (ref)
                            v22.CreateImpactFrame({
                                Time = 0.06
                            });
                        end);
                        task.wait(1.6);
                        task.defer(function() --[[ Line: 1522 ]]
                            -- upvalues: v244 (ref), v22 (ref)
                            if not v244 then
                                return;
                            else
                                v22.CreateImpactFrame({
                                    Time = 0.06
                                });
                                return;
                            end;
                        end);
                        task.defer(function() --[[ Line: 1530 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 1.5, 
                                Fade = 1.5
                            });
                        end);
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v244 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                            DirectCopy = script.Sounds.Explosion
                        });
                        task.delay(0.5, function() --[[ Line: 1544 ]]
                            -- upvalues: l_ColorCorrectionEffect_1 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref)
                            l_ColorCorrectionEffect_1.Saturation = 0;
                            l_ColorCorrectionEffect_1.Contrast = 0;
                            l_ColorCorrectionEffect_1.Enabled = true;
                            local v332 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                            l_TweenService_0:Create(l_ColorCorrectionEffect_1, v332, {
                                Saturation = -0.6, 
                                Contrast = 1
                            }):Play();
                            local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                            l_MenuBlur_3.Size = 0;
                            l_MenuBlur_3.Enabled = true;
                            local v334 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                            l_TweenService_0:Create(l_MenuBlur_3, v334, {
                                Size = 30
                            }):Play();
                            local v335 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                            l_TweenService_0:Create(l_Lighting_0, v335, {
                                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.7
                            }):Play();
                            task.wait(1.9);
                            l_ColorCorrectionEffect_1.Saturation = 0;
                            l_ColorCorrectionEffect_1.Contrast = 0;
                            l_ColorCorrectionEffect_1.Enabled = true;
                            local v336 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                            l_TweenService_0:Create(l_ColorCorrectionEffect_1, v336, {
                                Saturation = -0.4, 
                                Contrast = 0.2
                            }):Play();
                            local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                            l_MenuBlur_4.Size = 0;
                            l_MenuBlur_4.Enabled = true;
                            local v338 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                            l_TweenService_0:Create(l_MenuBlur_4, v338, {
                                Size = 20
                            }):Play();
                            local v339 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                            l_TweenService_0:Create(l_Lighting_0, v339, {
                                ExposureCompensation = l_Lighting_0.ExposureCompensation + 1
                            }):Play();
                        end);
                        l_TweenService_0:Create(v325.Middle, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            Color = Color3.fromRGB(255, 62, 62)
                        }):Play();
                        local v340 = TweenInfo.new(9, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                        l_TweenService_0:Create(v325.BlackBottom, v340, {
                            Position = v325.BlackBottom.Position - Vector3.new(0, 100, 0, 0)
                        }):Play();
                        l_TweenService_0:Create(v325.BlackTop, v340, {
                            Position = v325.BlackTop.Position + Vector3.new(0, 100, 0, 0)
                        }):Play();
                        return;
                    end;
                end);
                local function v370() --[[ Line: 1589 ]] --[[ Name: UpdateAppearance ]]
                    -- upvalues: v227 (copy), l_Character_1 (copy), l_NumberSequenceTween_0 (ref)
                    if v227.OverrideBlob then
                        return;
                    else
                        local v341 = script.SSJ2Hair:Clone();
                        v341.Name = "SSJ";
                        v341.Parent = l_Character_1;
                        local l_Weld_4 = Instance.new("Weld");
                        l_Weld_4.Parent = v341;
                        l_Weld_4.Part0 = v341.PrimaryPart;
                        l_Weld_4.Part1 = l_Character_1.Head;
                        v341.Head.Color = l_Character_1.Head.Color;
                        for _, v344 in l_Character_1.Head:GetChildren() do
                            if v344:IsA("Decal") then
                                v344.Transparency = 1;
                            end;
                        end;
                        l_Character_1.Head.LocalTransparencyModifier = 1;
                        for _, v346 in script.SSJFace:GetChildren() do
                            local v347 = v346:Clone();
                            v347.Name = "SSJ";
                            v347.Parent = l_Character_1.Head;
                        end;
                        local v348 = {
                            Enum.AccessoryType.Hat, 
                            Enum.AccessoryType.Hair, 
                            Enum.AccessoryType.Face, 
                            Enum.AccessoryType.Eyebrow, 
                            Enum.AccessoryType.Eyelash
                        };
                        for _, v350 in l_Character_1:GetChildren() do
                            if v350:IsA("Accessory") and table.find(v348, v350.AccessoryType) then
                                for _, v352 in v350:GetDescendants() do
                                    if v352:IsA("ParticleEmitter") then
                                        v352.Enabled = false;
                                    end;
                                    if v352:IsA("BasePart") then
                                        v352.LocalTransparencyModifier = 1;
                                        if v352.Transparency == 0 then
                                            v352.Transparency = 1;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        for _, v354 in script.SSJ2Aura:GetChildren() do
                            local l_l_Character_1_FirstChild_0 = l_Character_1:FindFirstChild(v354.Name);
                            if l_l_Character_1_FirstChild_0 then
                                for _, v357 in v354:GetChildren() do
                                    local v358 = v357:Clone();
                                    v358.Name = "SSJAura";
                                    v358.Parent = l_l_Character_1_FirstChild_0;
                                end;
                            end;
                        end;
                        for _, v360 in l_Character_1:GetChildren() do
                            if v360:IsA("BasePart") and v360.Transparency ~= 1 then
                                for _, v362 in script.Effects.SSJAura:GetChildren() do
                                    local v363 = v362:Clone();
                                    v363.Name = "SSJ";
                                    v363.Parent = v360;
                                end;
                            end;
                        end;
                        task.delay(4, function() --[[ Line: 1666 ]]
                            -- upvalues: l_Character_1 (ref), l_NumberSequenceTween_0 (ref)
                            for _, v365 in l_Character_1:GetDescendants() do
                                if v365.Name == "SSJAura" then
                                    if v365:IsA("ParticleEmitter") then
                                        l_NumberSequenceTween_0.Tween(v365, 120, 1);
                                    else
                                        for _, v367 in v365:GetDescendants() do
                                            if v367:IsA("ParticleEmitter") then
                                                l_NumberSequenceTween_0.Tween(v367, 120, 1);
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                            task.wait(6);
                            for _, v369 in l_Character_1:GetDescendants() do
                                if v369.Name == "SSJAura" then
                                    v369:Destroy();
                                end;
                            end;
                        end);
                        return;
                    end;
                end;
                v322[2] = l_l_AnimHelper_0_Anim_2:GetMarkerReachedSignal("Charge"):Connect(function() --[[ Line: 1690 ]]
                    -- upvalues: v323 (copy), v245 (copy), v324 (copy), v244 (copy), v22 (ref), l_TweenService_0 (ref), v299 (copy), v300 (copy), v294 (ref), v295 (ref), v325 (ref), l_Character_1 (copy), v370 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_CurrentCamera_1 (copy)
                    v323.Parent = v245.PrimaryPart;
                    v324.Parent = v245.PrimaryPart;
                    for _, v372 in v323:GetChildren() do
                        v372.Rate = v372.Rate * 2.5;
                    end;
                    for _, v374 in v324:GetChildren() do
                        v374.Rate = v374.Rate * 1.5;
                    end;
                    task.defer(function() --[[ Line: 1702 ]]
                        -- upvalues: v244 (ref), v22 (ref)
                        if not v244 then
                            return;
                        else
                            v22.CreateImpactFrame({
                                Time = 0.12
                            });
                            return;
                        end;
                    end);
                    if v244 then
                        task.delay(0, function() --[[ Line: 1711 ]]
                            -- upvalues: l_TweenService_0 (ref), v299 (ref), v300 (ref), v294 (ref), v295 (ref), v325 (ref)
                            l_TweenService_0:Create(v299, TweenInfo.new(0.16666666666666666, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v300):Play();
                            task.defer(function() --[[ Line: 1714 ]]
                                -- upvalues: l_TweenService_0 (ref), v294 (ref)
                                for v375 = 1, 5 do
                                    local l_l_TweenService_0_Value_1 = l_TweenService_0:GetValue(v375 / 5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                                    for _, v378 in v294 do
                                        if v378.LocalTransparencyModifier < 1000 then
                                            v378.LocalTransparencyModifier = 1 - l_l_TweenService_0_Value_1;
                                        end;
                                    end;
                                    task.wait(0.03333333333333333);
                                end;
                            end);
                            for _, v380 in v295 do
                                v380.Enabled = true;
                            end;
                            if v325 then
                                v325:Destroy();
                            end;
                        end);
                    end;
                    for _, v382 in l_Character_1:GetDescendants() do
                        if v382.Name == "SSJ" then
                            v382:Destroy();
                        end;
                        if string.lower(v382.Name) == "face" then
                            v382.Transparency = 0;
                        end;
                    end;
                    v370();
                    task.delay(3.2, function() --[[ Line: 1748 ]]
                        -- upvalues: v323 (ref), v324 (ref)
                        for _, v384 in v323:GetChildren() do
                            v384.Enabled = false;
                        end;
                        for _, v386 in v324:GetChildren() do
                            v386.Enabled = false;
                        end;
                        task.wait(5);
                        if v323 then
                            v323:Destroy();
                        end;
                        if v324 then
                            v324:Destroy();
                        end;
                    end);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v244 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.AuraBurst
                    });
                    if not v244 then
                        return;
                    else
                        l_TweenService_0:Create(l_CurrentCamera_1, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FieldOfView = 45
                        }):Play();
                        task.defer(function() --[[ Line: 1772 ]]
                            -- upvalues: v22 (ref)
                            v22.CreateImpactFrame({
                                Time = 0.12
                            });
                        end);
                        task.defer(function() --[[ Line: 1778 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "HardHitRoll", 
                                WaitTime = 1.5, 
                                Fade = 2
                            });
                        end);
                        local v387 = script.SSJ2AuraBurst:Clone();
                        v387.Parent = l_Workspace_0.Debris;
                        v387.CFrame = l_Character_1.PrimaryPart.CFrame * CFrame.new(0, 6.2, 0);
                        for _, v389 in v387:GetDescendants() do
                            if v389:IsA("ParticleEmitter") then
                                v389.ZOffset = v389.ZOffset - 6;
                                v389.Rate = v389.Rate * 0.6;
                            end;
                        end;
                        task.wait(1.5);
                        for _, v391 in v387:GetDescendants() do
                            if v391:IsA("ParticleEmitter") then
                                v391.Enabled = false;
                            end;
                        end;
                        task.wait(5);
                        v387:Destroy();
                        return;
                    end;
                end);
                v322[3] = l_l_AnimHelper_0_Anim_2:GetMarkerReachedSignal("Final"):Connect(function() --[[ Line: 1806 ]]
                    -- upvalues: l_SoundHelper_0 (ref), v244 (copy), l_Workspace_0 (ref), l_Character_1 (copy), l_TweenService_0 (ref), l_CurrentCamera_1 (copy), v22 (ref)
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v244 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Surprise, 
                        Volume = 0.08
                    });
                    if not v244 then
                        return;
                    else
                        l_TweenService_0:Create(l_CurrentCamera_1, TweenInfo.new(0.3333333333333333, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FieldOfView = 26
                        }):Play();
                        task.defer(function() --[[ Line: 1818 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.1, 
                                Fade = 1
                            });
                        end);
                        return;
                    end;
                end);
                task.wait(v279);
                local _ = {};
                task.wait(0.8333333333333334 / v278);
                local v393 = v0.DelayTime - l_Workspace_0.Ping.Value / 2 - v227.RandomMult * v0.RandomTime + v227.ExtraTime;
                task.delay(v393, function() --[[ Line: 1838 ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_1:SetAttribute("GettingUp", nil);
                end);
                local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_Damager_1:SetAttribute("CurrentEmote", nil);
                local v395 = tick();
                repeat
                    task.wait(0.1);
                until l_Character_1:GetAttribute("GettingUp") or not l_Character_1:IsDescendantOf(l_Workspace_0) or tick() - v395 > 15;
                task.delay(0.25 / v278, function() --[[ Line: 1854 ]]
                    -- upvalues: l_Lighting_0 (ref), l_l_Players_0_PlayerFromCharacter_1 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), v22 (ref), l_TweenService_0 (ref)
                    local l_ColorCorrection_2 = l_Lighting_0.ColorCorrection;
                    if l_l_Players_0_PlayerFromCharacter_1 or l_LocalPlayer_0.Character == l_Damager_1 then
                        task.defer(function() --[[ Line: 1858 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "Knockdown", 
                                WaitTime = 0.35, 
                                Fade = 1, 
                                FoV = 55, 
                                FoVMult = 1
                            });
                        end);
                        v22.HUDShake({
                            Scale = 20, 
                            Damper = 0.09999999999999999
                        });
                        l_ColorCorrection_2.Saturation = 0;
                        l_ColorCorrection_2.Contrast = 0;
                        l_ColorCorrection_2.Enabled = true;
                        local v397 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_ColorCorrection_2, v397, {
                            Saturation = -1, 
                            Contrast = 0.5
                        }):Play();
                        local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_5.Size = 0;
                        l_MenuBlur_5.Enabled = true;
                        local v399 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_5, v399, {
                            Size = 10
                        }):Play();
                        local v400 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_Lighting_0, v400, {
                            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                        }):Play();
                    end;
                    task.wait(0.7);
                end);
                task.delay(0.25, function() --[[ Line: 1895 ]]
                    -- upvalues: v243 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), v39 (ref), l_TweenService_0 (ref), l_Vignette_1 (copy), v320 (copy), l_CameraMode_1 (copy), l_Variant_1 (copy), l_RunService_0 (ref), v287 (copy)
                    if v243 or l_LocalPlayer_0.Character == l_Damager_1 then
                        v39(l_Damager_1, 0);
                        l_TweenService_0:Create(l_Vignette_1, v320, {
                            ImageTransparency = 1
                        }):Play();
                        l_CameraMode_1.Value = "";
                        l_Variant_1.Value = "";
                        l_RunService_0:UnbindFromRenderStep("CameraRig");
                    end;
                    if v287 then
                        v287:Destroy();
                    end;
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                task.delay(0.44999999999999996, function() --[[ Line: 1915 ]]
                    -- upvalues: v228 (copy), l_SoundHelper_0 (ref), l_Character_1 (copy), v243 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), l_Workspace_0 (ref), v22 (ref), v242 (copy)
                    print(v228 - tick());
                    l_SoundHelper_0:PlaySound({
                        Name = "BoxLayer", 
                        Parent = l_Character_1.PrimaryPart
                    });
                    task.wait(0.2);
                    if v243 or l_LocalPlayer_0.Character == l_Damager_1 then
                        l_SoundHelper_0:PlaySound({
                            Name = "Box", 
                            Parent = l_Workspace_0.Debris
                        });
                    end;
                    task.wait(0.9);
                    if v243 or l_LocalPlayer_0.Character == l_Damager_1 then
                        v22.TripleText({
                            Image = v242.Box, 
                            HoldTime = 0.6666666666666666
                        });
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.1, 
                            Fade = 0.5
                        });
                    end;
                end);
                if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                    l_Occupied_1.Target.Value = Vector3.new();
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "Rustle3", 
                    Parent = l_Character_1.PrimaryPart, 
                    Volume = 1
                });
                task.wait(1.25);
                if v243 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Lighting_0, v280, {
                        ExposureCompensation = l_Workspace_0.Exposure.Value
                    }):Play();
                end;
                if v243 then
                    l_Occupied_1.LerpMult.Value = 0;
                end;
                if v243 or l_LocalPlayer_0.Character == l_Damager_1 then
                    local l_ColorCorrection_3 = l_Lighting_0.ColorCorrection;
                    local v402 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                    l_TweenService_0:Create(l_ColorCorrection_3, v402, {
                        Saturation = 0, 
                        Contrast = 0
                    }):Play();
                end;
                if l_Damager_1 and l_Damager_1.PrimaryPart then
                    l_Damager_1.PrimaryPart.Anchored = false;
                end;
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = false;
                end;
                for v403, v404 in v281 do
                    v403.CollisionGroup = v404;
                end;
                for _, v406 in v322 do
                    v406:Disconnect();
                end;
                task.wait(5);
                for _, v408 in v303 do
                    v408:Destroy();
                end;
                l_l_AnimHelper_0_Anim_2:Stop(0);
                if v242 then
                    v242:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.KO = function(v409) --[[ Line: 1996 ]] --[[ Name: KO ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), v22 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), v39 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy)
        local l_Character_2 = v409.Character;
        local l_Damager_2 = v409.Damager;
        local l_StartPosition_2 = v409.StartPosition;
        local l_LookVector_2 = v409.LookVector;
        local l_FirstChild_5 = l_Workspace_0.States:FindFirstChild(l_Character_2.Name);
        local l_CharacterData_2 = l_FirstChild_5:FindFirstChild("CharacterData");
        local l_PlayerData_2 = l_FirstChild_5:FindFirstChild("PlayerData");
        local l_Occupied_2 = l_FirstChild_5:FindFirstChild("Occupied");
        if not l_CharacterData_2 or not l_PlayerData_2 or not l_Occupied_2 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_2);
            local l_Humanoid_4 = l_Character_2:FindFirstChild("Humanoid");
            local v420 = l_Humanoid_4 and l_Humanoid_4:FindFirstChild("Animator");
            local l_Humanoid_5 = l_Damager_2:FindFirstChild("Humanoid");
            local v422 = l_Humanoid_5 and l_Humanoid_5:FindFirstChild("Animator");
            if not v420 or not v422 then
                return;
            else
                local v423 = l_Assets_0.DownFrames.Default:Clone();
                local v424 = l_LocalPlayer_0.Character == l_Character_2;
                if v424 or l_LocalPlayer_0.Character == l_Damager_2 then
                    v423.Parent = l_Common_0;
                end;
                local v425 = v22.GetWeldCharacter(l_Character_2);
                local v426 = 3.5;
                local l_l_RayHelper_0_EnvironmentWhitelist_2 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_2, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_2, l_StartPosition_2 - l_LookVector_2, v426 + 0, l_l_RayHelper_0_EnvironmentWhitelist_2);
                local v431 = l_StartPosition_2 - l_LookVector_2 * v426;
                if l_l_RayHelper_0_RayWithWhiteList_2 then
                    v431 = l_StartPosition_2 - l_LookVector_2 * 2;
                end;
                local v432 = {};
                for _, v434 in l_Character_2:GetChildren() do
                    if v434:IsA("BasePart") and v434 ~= l_Character_2.PrimaryPart then
                        v432[v434] = v434.CollisionGroup;
                        v434.CollisionGroup = "None";
                    end;
                end;
                if l_Character_2 and l_Character_2.PrimaryPart then
                    l_Character_2.PrimaryPart.Anchored = true;
                end;
                for _, v436 in (v422:GetPlayingAnimationTracks()) do
                    if v436.Priority ~= Enum.AnimationPriority.Idle then
                        v436:AdjustSpeed(v436.Speed / 3);
                    end;
                end;
                local v437 = {
                    AnimId = v0.Animations.KO, 
                    FadeIn = 0.05, 
                    NameFade = 0.1, 
                    AnimSpeed = 0.22, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_4, 
                    Weight = 10000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_4 = l_AnimHelper_0:CreateAnim(v437);
                l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_2.PrimaryPart
                });
                local v439 = v424 or l_LocalPlayer_0.Character == l_Damager_2;
                task.delay(0.1, function() --[[ Line: 2085 ]]
                    -- upvalues: v22 (ref)
                    v22.CreateImpactFrame({
                        Time = 0.06
                    });
                end);
                task.delay(0.7575757575757576, function() --[[ Line: 2091 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_4 (copy), l_SoundHelper_0 (ref), l_Character_2 (copy), v431 (ref), l_LookVector_2 (copy), l_Workspace_0 (ref), v439 (copy), v22 (ref), v425 (copy), v39 (ref)
                    l_l_AnimHelper_0_Anim_4:AdjustSpeed(0.86);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = l_Character_2.PrimaryPart, 
                        DirectCopy = script.Sounds.Step
                    });
                    local v440 = script.FallSmoke:Clone();
                    v440.Position = (CFrame.lookAt(v431, v431 + l_LookVector_2) * CFrame.new(0, 0, 2.5)).Position - Vector3.new(0, 3, 0, 0);
                    v440.Parent = l_Workspace_0.Debris;
                    for _, v442 in v440.Particle:GetChildren() do
                        v442.Enabled = false;
                        v442:Emit(v442:GetAttribute("EmitCount") * 0.3);
                    end;
                    if v439 then
                        task.defer(function() --[[ Line: 2110 ]]
                            -- upvalues: v22 (ref)
                            v22.HUDShake({
                                Scale = 10, 
                                Damper = 0.09999999999999999
                            });
                            v22.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 0.1, 
                                Fade = 2
                            });
                        end);
                    end;
                    task.delay(1.2, function() --[[ Line: 2124 ]]
                        -- upvalues: l_SoundHelper_0 (ref), v439 (ref), l_Workspace_0 (ref), l_Character_2 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Rustle4", 
                            Parent = v439 and l_Workspace_0.Debris or l_Character_2.PrimaryPart, 
                            Volume = 0.9
                        });
                        task.wait(0.8);
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v439 and l_Workspace_0.Debris or l_Character_2.PrimaryPart, 
                            DirectCopy = script.Sounds.Zanzoken
                        });
                    end);
                    task.wait(2.5);
                    if v439 then
                        task.defer(function() --[[ Line: 2142 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "SuperHardHit", 
                                WaitTime = 0.3, 
                                Fade = 1
                            });
                        end);
                    end;
                    for _, v444 in script.Effects.FlashStep:GetChildren() do
                        local v445 = v444:Clone();
                        v445.Parent = v425.UpperTorso;
                        v445.Enabled = true;
                        task.delay(0.4, function() --[[ Line: 2156 ]]
                            -- upvalues: v445 (copy)
                            v445.Enabled = false;
                            task.wait(2);
                            v445:Destroy();
                        end);
                    end;
                    task.wait(0.2);
                    v39(l_Character_2, 1);
                    task.wait(4);
                    v440:Destroy();
                end);
                if v424 or l_LocalPlayer_0.Character == l_Damager_2 then
                    task.delay(0.8333333333333334, function() --[[ Line: 2171 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Character_2 (copy)
                        l_SoundHelper_0:PlaySound({
                            Name = "Rustle3", 
                            Parent = l_Character_2.PrimaryPart, 
                            Volume = 2
                        });
                        task.wait(0.4666666666666667);
                        l_SoundHelper_0:PlaySound({
                            Name = "FeintRustle", 
                            Parent = l_Character_2.PrimaryPart, 
                            Volume = 0.3, 
                            Speed = 0.7
                        });
                    end);
                end;
                local l_PrimaryPart_0 = l_Character_2.PrimaryPart;
                local _ = l_PrimaryPart_0.CFrame;
                local l_l_Workspace_0_ServerTimeNow_2 = l_Workspace_0:GetServerTimeNow();
                local v449 = {
                    Victim = l_Character_2, 
                    LookVector = l_LookVector_2, 
                    EndPosition = v431, 
                    VictimPosition = l_PrimaryPart_0.Position, 
                    TargetVector = v431 - v431, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_2, 
                    TargetTime = 0.7575757575757576, 
                    HitIndex = 3
                };
                l_SimulateKnockbackBE_0:Fire(v449);
                if l_Occupied_2 and l_LocalPlayer_0.Character == l_Character_2 then
                    l_Occupied_2.Target.Value = l_LookVector_2;
                    l_Occupied_2.LockedOn.Value = l_Damager_2;
                end;
                local l_CameraSettings_2 = l_Workspace_0:FindFirstChild("CameraSettings");
                local _ = l_CameraSettings_2.CameraTarget;
                local _ = l_CameraSettings_2.CameraMode;
                local l_Variant_2 = l_CameraSettings_2.Variant;
                local l_CameraMode_3 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                local l_Vignette_2 = l_Main_0.DownFrame.Vignette;
                local v456 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v457 = l_LocalPlayer_0.Character == l_Character_2;
                if v457 or l_LocalPlayer_0.Character == l_Damager_2 then
                    l_TweenService_0:Create(l_Vignette_2, v456, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v457 then
                    l_Occupied_2.LerpMult.Value = 0.1;
                end;
                if v457 or l_LocalPlayer_0.Character == l_Damager_2 then
                    task.defer(function() --[[ Line: 2234 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "Knockdown", 
                            WaitTime = 0.5, 
                            Fade = 2, 
                            FoV = 55, 
                            FoVMult = 1
                        });
                    end);
                    v22.HUDShake({
                        Scale = 20, 
                        Damper = 0.09999999999999999
                    });
                    local l_ColorCorrection_4 = l_Lighting_0.ColorCorrection;
                    l_ColorCorrection_4.Saturation = 0;
                    l_ColorCorrection_4.Contrast = 0;
                    l_ColorCorrection_4.Enabled = true;
                    local v459 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrection_4, v459, {
                        Saturation = -1, 
                        Contrast = 0.5
                    }):Play();
                    local l_MenuBlur_6 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_6.Size = 0;
                    l_MenuBlur_6.Enabled = true;
                    local v461 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_6, v461, {
                        Size = 10
                    }):Play();
                    local v462 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v462, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                    }):Play();
                    task.delay(0.7575757575757576, function() --[[ Line: 2268 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.2, 
                            Fade = 1
                        });
                    end);
                end;
                task.wait(1.5327695560253698);
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2, function() --[[ Line: 2279 ]]
                    -- upvalues: l_Character_2 (copy)
                    l_Character_2:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_2:SetAttribute("GettingUp", nil);
                end);
                local v463 = tick();
                repeat
                    task.wait(0.1);
                until l_Character_2:GetAttribute("GettingUp") or not l_Character_2:IsDescendantOf(l_Workspace_0) or tick() - v463 > 10;
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                local v464 = {
                    HoldTime = 1.5
                };
                l_SoundHelper_0:PlaySound({
                    Name = "StartMatch", 
                    Parent = l_Workspace_0.Debris
                });
                task.wait(1);
                if v457 or l_LocalPlayer_0.Character == l_Damager_2 then
                    l_SoundHelper_0:PlaySound({
                        Name = "Box", 
                        Volume = 0.25, 
                        Parent = l_Workspace_0.Debris
                    });
                    if v439 then
                        task.defer(function() --[[ Line: 2316 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 0.2, 
                                Fade = 1
                            });
                        end);
                    end;
                    task.defer(function() --[[ Line: 2325 ]]
                        -- upvalues: v464 (copy), v423 (copy), v22 (ref)
                        v464.Image = v423.KO.K;
                        v22.TripleText(v464);
                    end);
                    task.wait(0.1);
                    task.defer(function() --[[ Line: 2331 ]]
                        -- upvalues: v464 (copy), v423 (copy), v22 (ref)
                        v464.Image = v423.KO.Dot1;
                        v22.TripleText(v464);
                    end);
                    task.wait(0.1);
                    task.defer(function() --[[ Line: 2337 ]]
                        -- upvalues: v464 (copy), v423 (copy), v22 (ref)
                        v464.Image = v423.KO.O;
                        v22.TripleText(v464);
                    end);
                    task.wait(0.1);
                    task.defer(function() --[[ Line: 2343 ]]
                        -- upvalues: v464 (copy), v423 (copy), v22 (ref)
                        v464.Image = v423.KO.Dot2;
                        v22.TripleText(v464);
                    end);
                end;
                if l_Occupied_2 and l_Occupied_2:FindFirstChild("Target") then
                    l_Occupied_2.Target.Value = Vector3.new();
                end;
                local v465 = false;
                task.wait(1.25);
                if v457 then
                    l_Occupied_2.LerpMult.Value = 0;
                end;
                task.delay(2, function() --[[ Line: 2359 ]]
                    -- upvalues: v457 (copy), l_LocalPlayer_0 (ref), l_Damager_2 (copy), l_CameraMode_3 (copy), l_Variant_2 (copy)
                    if v457 or l_LocalPlayer_0.Character == l_Damager_2 then
                        l_CameraMode_3.Value = "";
                        l_Variant_2.Value = "";
                    end;
                end);
                for v466, v467 in v432 do
                    v466.CollisionGroup = v467;
                end;
                local v468 = nil;
                if l_CharacterData_2 and l_CharacterData_2:FindFirstChild("Cutscene") then
                    v468 = l_CharacterData_2.Cutscene.Changed:Connect(function() --[[ Line: 2372 ]]
                        -- upvalues: v468 (ref), l_Character_2 (copy), v425 (copy), v39 (ref), l_Damager_2 (copy)
                        if v468 then
                            v468:Disconnect();
                        end;
                        task.wait(0.28);
                        l_Character_2:SetAttribute("SSJ", nil);
                        l_Character_2:SetAttribute("SSJ2", nil);
                        local l_StringValue_0 = Instance.new("StringValue");
                        l_StringValue_0.Name = "ResetAppearance";
                        l_StringValue_0.Parent = v425;
                        task.delay(1, function() --[[ Line: 2383 ]]
                            -- upvalues: l_StringValue_0 (copy)
                            l_StringValue_0:Destroy();
                        end);
                        v39(l_Character_2, 0);
                        if l_Damager_2 and l_Damager_2.PrimaryPart then
                            l_Damager_2.PrimaryPart.Anchored = false;
                        end;
                        if l_Character_2 and l_Character_2.PrimaryPart then
                            l_Character_2.PrimaryPart.Anchored = false;
                        end;
                    end);
                end;
                task.wait(5);
                if v457 or l_LocalPlayer_0.Character == l_Damager_2 then
                    l_TweenService_0:Create(l_Vignette_2, v456, {
                        ImageTransparency = 1
                    }):Play();
                end;
                task.wait(5);
                l_Character_2:SetAttribute("SSJ", nil);
                l_Character_2:SetAttribute("SSJ2", nil);
                v39(l_Character_2, 0);
                local l_StringValue_1 = Instance.new("StringValue");
                l_StringValue_1.Name = "ResetAppearance";
                l_StringValue_1.Parent = v425;
                task.delay(1, function() --[[ Line: 2415 ]]
                    -- upvalues: l_StringValue_1 (copy)
                    l_StringValue_1:Destroy();
                end);
                v465 = true;
                l_l_AnimHelper_0_Anim_4:Stop(0);
                if l_Damager_2 and l_Damager_2.PrimaryPart then
                    l_Damager_2.PrimaryPart.Anchored = false;
                end;
                if l_Character_2 and l_Character_2.PrimaryPart then
                    l_Character_2.PrimaryPart.Anchored = false;
                end;
                if v423 then
                    v423:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.Use = function(v471) --[[ Line: 2433 ]] --[[ Name: Use ]]
        -- upvalues: v0 (copy)
        local l_Character_3 = v471.Character;
        local _ = v471.Damager;
        if v471.IsKO then
            v0.KO(v471);
            return;
        elseif l_Character_3:GetAttribute("SSJ") then
            v0.Getup(v471);
            return;
        else
            v0.Main(v471);
            return;
        end;
    end;
    return v0;
end;