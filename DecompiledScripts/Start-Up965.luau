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
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("Bezier"));
local _ = require(l_Modules_0:WaitForChild("RayHelper"));
local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local l_camShake_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
local v16 = require(l_Modules_0.Cutscene.Utilities);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local l_Common_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local l_Parent_0 = script.Parent.Parent;
local v21 = require(l_Parent_0);
local _ = require(l_Modules_0.Cutscene.Cutscene);
local _ = require(l_Modules_0.Cutscene.Viewport);
local _ = Random.new();
local function _(v25, v26, v27) --[[ Line: 35 ]] --[[ Name: Lerp ]]
    return v25 + (v26 - v25) * v27;
end;
local v29 = {
    Animations = {
        Character = 138138755224419, 
        Victim = 123642169711808, 
        Camera = 98949782932727
    }, 
    CameraRig = l_ReplicatedStorage_0.Assets.FoVCamera
};
local v30 = l_Parent_0:WaitForChild("JoeStyle", 10);
local v31 = require(v30:WaitForChild("QTE", 10));
local function _() --[[ Line: 50 ]] --[[ Name: GetInterface ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    return l_LocalPlayer_0:GetAttribute("Interface");
end;
local l_QTEInfo_0 = l_Styles_0.Joe.QTEInfo;
GetQTETime = function() --[[ Line: 55 ]] --[[ Name: GetQTETime ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_QTEInfo_0 (copy)
    if l_LocalPlayer_0:GetAttribute("Interface") == "Touch" then
        return l_QTEInfo_0.MobileTime;
    elseif l_LocalPlayer_0:GetAttribute("Interface") == "Controller" then
        return l_QTEInfo_0.GamepadTime;
    else
        return l_QTEInfo_0.PCTime;
    end;
end;
v29.Use = function(v34) --[[ Line: 65 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), v21 (copy), l_Players_0 (copy), l_Lighting_0 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Workspace_0 (copy), l_SoundHelper_0 (copy), l_TweenService_0 (copy), v31 (copy), l_Common_0 (copy), v29 (copy), l_AnimHelper_0 (copy), v16 (copy), l_camShake_0 (copy), l_RunService_0 (copy), l_ReplicatedStorage_0 (copy)
    local l_Character_0 = v34.Character;
    local l_Victim_0 = v34.Victim;
    local v37 = l_LocalPlayer_0.Character == l_Character_0;
    local v38 = l_LocalPlayer_0.Character == l_Victim_0;
    local v39 = v37 or v38;
    local v40 = v21.GetWeldCharacter(l_Character_0);
    local v41 = v21.GetWeldCharacter(l_Victim_0);
    local _ = l_Players_0:GetPlayerFromCharacter(l_Victim_0);
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v44 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v46 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    local _ = l_Lighting_0:FindFirstChild("ColorCorrection");
    local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
    l_ColorCorrectionEffect_0.Parent = l_Lighting_0;
    local l_v44_PlayingAnimationTracks_0 = v44:GetPlayingAnimationTracks();
    for _, v51 in l_v44_PlayingAnimationTracks_0 do
        if v51.Priority ~= Enum.AnimationPriority.Idle then
            local l_Speed_0 = v51.Speed;
            v51:AdjustSpeed(l_Speed_0 / 4);
            task.delay(2, function() --[[ Line: 99 ]]
                -- upvalues: v51 (copy), l_Speed_0 (copy)
                v51:AdjustSpeed(l_Speed_0);
            end);
        end;
    end;
    task.delay(0.1, function() --[[ Line: 104 ]]
        -- upvalues: l_v44_PlayingAnimationTracks_0 (ref), v46 (copy)
        l_v44_PlayingAnimationTracks_0 = v46:GetPlayingAnimationTracks();
        for _, v54 in l_v44_PlayingAnimationTracks_0 do
            if v54.Priority ~= Enum.AnimationPriority.Idle then
                local l_Speed_1 = v54.Speed;
                v54:AdjustSpeed(l_Speed_1 / 4);
                task.delay(2, function() --[[ Line: 112 ]]
                    -- upvalues: v54 (copy), l_Speed_1 (copy)
                    v54:AdjustSpeed(l_Speed_1);
                end);
            end;
        end;
    end);
    task.defer(function() --[[ Line: 118 ]]
        -- upvalues: v37 (copy), v38 (copy), v21 (ref), l_Main_0 (ref)
        if v37 or v38 then
            v21.StatusFrame(v38, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v56 = l_Parent_0.UltimateStart:Clone();
    v56.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v56.Parent = l_Workspace_0.Debris;
    task.delay(20, function() --[[ Line: 128 ]]
        -- upvalues: v56 (copy)
        if v56 then
            v56:Destroy();
        end;
    end);
    for _, v58 in v56.Particle:GetChildren() do
        v58.Enabled = false;
        v58:Emit(v58:GetAttribute("EmitCount"));
    end;
    local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
    local v60 = nil;
    task.delay(1.25, function() --[[ Line: 140 ]]
        -- upvalues: v60 (ref), l_SoundHelper_0 (ref), v37 (copy), v38 (copy), l_Workspace_0 (ref), l_Character_0 (copy)
        v60 = l_SoundHelper_0:PlaySound({
            Name = "Song", 
            DirectCopy = script.Song, 
            Parent = (not not v37 or v38) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
        });
    end);
    if v37 or v38 then
        task.defer(function() --[[ Line: 149 ]]
            -- upvalues: l_ColorCorrection_1 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref), v56 (copy)
            l_ColorCorrection_1.Saturation = 0;
            l_ColorCorrection_1.Contrast = 0;
            l_ColorCorrection_1.Enabled = true;
            local v61 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_1, v61, {
                Saturation = -0.7, 
                Contrast = 0.5
            }):Play();
            local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
            l_MenuBlur_0.Size = 0;
            l_MenuBlur_0.Enabled = true;
            local v63 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_0, v63, {
                Size = 10
            }):Play();
            local v64 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v64, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            task.delay(0.4, function() --[[ Line: 167 ]]
                -- upvalues: l_MenuBlur_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v64 (copy)
                l_MenuBlur_0.Enabled = false;
                l_TweenService_0:Create(l_Lighting_0, v64, {
                    ExposureCompensation = workspace.Exposure.Value
                }):Play();
            end);
            v21.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            v21.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.5, 
                Fade = 0.5
            });
            task.wait(5);
            v56:Destroy();
        end);
    end;
    task.spawn(function() --[[ Line: 188 ]]
        -- upvalues: v31 (ref)
        for _, v66 in v31.allTextures do
            game:GetService("ContentProvider"):PreloadAsync(v66);
        end;
    end);
    task.wait(0.5);
    local v67 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v68 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v69 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    if v37 or v38 then
        local v70 = l_Main_0.White:Clone();
        v70.Parent = l_Common_0;
        local l_v70_0 = v70 --[[ copy: 22 -> 56 ]];
        task.delay(3, function() --[[ Line: 203 ]]
            -- upvalues: l_v70_0 (copy)
            l_v70_0:Destroy();
        end);
        task.delay(0.55, function() --[[ Line: 207 ]]
            -- upvalues: v39 (copy), l_Main_0 (ref)
            if v39 then
                for _, v73 in l_Main_0:GetChildren() do
                    if v73:IsA("Frame") then
                        v73.Position = UDim2.new(0, 0, 10, 0);
                    end;
                end;
            end;
        end);
        l_TweenService_0:Create(v70, v69, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Main_0.White, v69, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v69, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v67, {
            ImageTransparency = 0.5
        }):Play();
        task.delay(1, function() --[[ Line: 221 ]]
            -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v69 (copy)
            l_TweenService_0:Create(l_Lighting_0, v69, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
        end);
    end;
    local v74 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v37 or v38) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v74.Volume;
    v74.Volume = 0;
    task.delay(0, function() --[[ Line: 235 ]]
        -- upvalues: v74 (copy), v37 (copy), v38 (copy), l_Volume_0 (copy)
        v74:Stop();
        if v37 or v38 then
            v74.Volume = l_Volume_0;
        else
            v74.Volume = l_Volume_0 / 5;
        end;
        v74:Play();
    end);
    task.wait(0.5);
    local l_CoreGuiEnabled_0 = game.StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Chat);
    if v39 then
        game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false);
    end;
    local v77 = nil;
    local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if v37 or v38 then
        l_CameraMode_0.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 45;
    end;
    local v80 = {
        Animator = v44, 
        AnimId = v29.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v81 = {
        Animator = v46, 
        AnimId = v29.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    if v39 then
        l_Victim_0.PrimaryPart.Anchored = true;
        l_Character_0.PrimaryPart.Anchored = true;
    end;
    task.delay(0.016666666666666666, function() --[[ Line: 283 ]]
        -- upvalues: l_Character_0 (copy), l_Victim_0 (copy), v21 (ref)
        for _, v83 in {
            l_Character_0, 
            l_Victim_0, 
            v21.GetWeldCharacter(l_Character_0), 
            v21.GetWeldCharacter(l_Victim_0)
        } do
            for _, v85 in v83:GetDescendants() do
                if v85:IsA("BasePart") and v85:GetAttribute("PreviousCollisionGroup") then
                    v85:SetAttribute("PreviousCollisionGroup", v85.CollisionGroup);
                    v85.CollisionGroup = "None";
                end;
            end;
        end;
    end);
    l_AnimHelper_0:CreateAnim(v80);
    l_AnimHelper_0:CreateAnim(v81);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v80);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v81);
    local v88 = {};
    local _ = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(0.5, 1), 
        NumberSequenceKeypoint.new(1, 1)
    });
    local v90 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(0.5, 0.5), 
        NumberSequenceKeypoint.new(1, 1)
    });
    local _ = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(0.1, 0.238727), 
        NumberSequenceKeypoint.new(0.2, 0), 
        NumberSequenceKeypoint.new(0.3, 0), 
        NumberSequenceKeypoint.new(0.58, 0.36), 
        NumberSequenceKeypoint.new(0.8, 1), 
        NumberSequenceKeypoint.new(1, 1)
    });
    local function v97(v92, v93, v94) --[[ Line: 328 ]] --[[ Name: tweenBeams ]]
        -- upvalues: v16 (ref)
        for _, v96 in v92:GetDescendants() do
            if v96:IsA("Beam") then
                if v94 then
                    v96.Transparency = NumberSequence.new(1);
                end;
                task.defer(function() --[[ Line: 335 ]]
                    -- upvalues: v16 (ref), v96 (copy), v93 (copy)
                    v16.TweenNumberSequence(v96.Transparency, v93, 50, 0.3, v96, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                end);
            end;
        end;
    end;
    local v98 = nil;
    local v99 = nil;
    l_camShake_0:ShakeOnce(3, 10, 0.6, 3, 0.1, 0.1);
    local v100 = {};
    local v101 = nil;
    local v102 = nil;
    local v103 = false;
    local function v113() --[[ Line: 356 ]] --[[ Name: cleanup ]]
        -- upvalues: v103 (ref), l_TweenService_0 (ref), l_ColorCorrection_1 (copy), l_Victim_0 (copy), l_Character_0 (copy), v100 (copy), l_CoreGuiEnabled_0 (copy), v77 (ref), v74 (copy), v60 (ref), l_ColorCorrectionEffect_0 (copy), v99 (ref), l_Main_0 (ref), v98 (ref), v88 (copy), l_Humanoid_1 (copy), l_Lighting_0 (ref), v67 (copy), l_RunService_0 (ref), l_CameraMode_0 (copy), v21 (ref)
        v103 = true;
        l_TweenService_0:Create(l_ColorCorrection_1, TweenInfo.new(1), {
            Saturation = 0, 
            Contrast = 0, 
            Brightness = 0, 
            TintColor = Color3.new(1, 1, 1)
        }):Play();
        l_Victim_0.PrimaryPart.Anchored = false;
        l_Character_0.PrimaryPart.Anchored = false;
        for _, v105 in v100 do
            v105 = false;
        end;
        game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, l_CoreGuiEnabled_0);
        if v77 then
            v77:Destroy();
        end;
        if v74 then
            v74:Destroy();
        end;
        if v60 then
            l_TweenService_0:Create(v60, TweenInfo.new(0.5), {
                Volume = 0
            }):Play();
            game.Debris:AddItem(v60, 3);
        end;
        if l_ColorCorrectionEffect_0 then
            l_ColorCorrectionEffect_0:Destroy();
        end;
        if v99 then
            v99:Destroy();
        end;
        for _, v107 in l_Main_0:GetChildren() do
            if v107:IsA("Frame") then
                v107.Position = UDim2.new(0, 0, 0, 0);
            end;
        end;
        if v98 then
            v98:Destroy();
        end;
        for _, v109 in v88 do
            v109:Disconnect();
        end;
        for _, v111 in l_Humanoid_1:GetPlayingAnimationTracks() do
            v111:Stop();
        end;
        local v112 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0);
        l_TweenService_0:Create(l_Lighting_0, v112, {
            ExposureCompensation = workspace.Exposure.Value
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v67, {
            ImageTransparency = 1
        }):Play();
        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
        l_CameraMode_0.Value = "";
        v21.SetTransparency(l_Character_0, 0);
        v21.SetTransparency(l_Victim_0, 0);
    end;
    l_Character_0.AncestryChanged:Connect(v113);
    l_Victim_0.AncestryChanged:Connect(v113);
    v88[#v88 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("FinishCharge"):Connect(function() --[[ Line: 425 ]]
        -- upvalues: v103 (ref), v37 (copy), v101 (ref), v102 (ref), v31 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v21 (ref)
        if v103 then
            return;
        else
            task.wait(0.3333333333333333);
            if v103 then
                return;
            else
                if v37 then
                    if v103 then
                        return;
                    else
                        local v114, v115 = v31:start({
                            targetTime = GetQTETime()
                        }, v103);
                        v101 = v114;
                        v102 = v115;
                        if v101 then
                            if v103 then
                                return;
                            else
                                game.ReplicatedStorage:WaitForChild("UnreliableRemoteEvents"):WaitForChild("ReplicateJoeQTE"):FireServer(true);
                                local v116 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                                l_TweenService_0:Create(l_Lighting_0, v116, {
                                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
                                }):Play();
                                task.spawn(function() --[[ Line: 457 ]]
                                    -- upvalues: v21 (ref)
                                    v21.CameraShake({
                                        Preset = "HardHit", 
                                        WaitTime = 0.2, 
                                        Fade = 0.6
                                    });
                                end);
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end);
    v88[#v88 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("WindStart"):Connect(function() --[[ Line: 468 ]]
        -- upvalues: v103 (ref), v39 (copy), l_TweenService_0 (ref), l_ColorCorrectionEffect_0 (copy), v68 (copy), l_Lighting_0 (ref), l_CoreGuiEnabled_0 (copy), v99 (ref), v40 (copy), v97 (copy), v90 (copy)
        if v103 then
            return;
        else
            if v39 then
                l_TweenService_0:Create(l_ColorCorrectionEffect_0, v68, {
                    Contrast = 0.4, 
                    Saturation = -0.35
                }):Play();
                l_TweenService_0:Create(l_Lighting_0.DepthOfField, v68, {
                    FarIntensity = 1, 
                    InFocusRadius = 30
                }):Play();
                game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, l_CoreGuiEnabled_0);
            end;
            v99 = script.WindArm.MainWindAtttachment:Clone();
            v99.Parent = v40:FindFirstChild("RightLowerArm");
            v97(v99, v90, true);
            return;
        end;
    end);
    v88[#v88 + 1] = l_l_AnimHelper_0_Anim_1:GetMarkerReachedSignal("WindStart"):Connect(function() --[[ Line: 493 ]]
        -- upvalues: v103 (ref), v98 (ref), v41 (copy), v97 (copy), v90 (copy)
        if v103 then
            return;
        else
            v98 = script.WindArm.MainWindAtttachment:Clone();
            v98.Parent = v41:FindFirstChild("LeftLowerArm");
            v97(v98, v90, true);
            return;
        end;
    end);
    task.delay(v34.Time, function() --[[ Line: 504 ]]
        -- upvalues: v103 (ref), v88 (copy)
        if v103 then
            return;
        else
            for _, v118 in v88 do
                v118:Disconnect();
            end;
            return;
        end;
    end);
    if v37 or v38 then
        v77 = l_ReplicatedStorage_0.Assets.FoVCamera:Clone();
        v77.Name = l_Character_0.Name .. "Camera";
        v77.Parent = l_Workspace_0.Debris;
        local v119 = 0;
        local function _() --[[ Line: 520 ]] --[[ Name: UpdateCameraCFrame ]]
            -- upvalues: v119 (ref), v77 (ref), v34 (copy)
            if os.time() - v119 < 0.5 then
                return;
            else
                v119 = os.time();
                v77:PivotTo(v34.StartCFrame * CFrame.new(0, -3, 0));
                return;
            end;
        end;
        if os.time() - v119 >= 0.5 then
            v119 = os.time();
            local v121 = v34.StartCFrame * CFrame.new(0, -3, 0);
            v77:PivotTo(v121);
        end;
        local v122 = {
            Animator = v77.AnimationController.Animator, 
            AnimId = v29.Animations.Camera
        };
        local _ = l_AnimHelper_0:CreateAnim(v122);
        local v124 = false;
        l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 539 ]]
            -- upvalues: v103 (ref), v124 (ref), l_CurrentCamera_0 (copy), v77 (ref)
            if v103 then
                v124 = true;
                return;
            elseif v124 then
                return;
            else
                l_CurrentCamera_0.CFrame = v77.CamPart.CFrame;
                l_CurrentCamera_0.FieldOfView = math.abs((v77.FovPart.Position - v77.RootPart.Position).Y);
                return;
            end;
        end);
        v88[#v88 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("WindStart"):Connect(function() --[[ Line: 551 ]]
            -- upvalues: v103 (ref), v124 (ref)
            if v103 then
                v124 = true;
                return;
            else
                return;
            end;
        end);
        if v103 then
            return;
        else
            task.wait(v34.Time);
            if not v103 then
                v124 = true;
                if l_ColorCorrectionEffect_0 then
                    l_ColorCorrectionEffect_0:Destroy();
                end;
                for _, v127 in v100 do
                    v127 = false;
                end;
                for _, v129 in v88 do
                    v129:Disconnect();
                end;
                if v99 then
                    v99:Destroy();
                end;
                if v98 then
                    v98:Destroy();
                end;
                for _, v131 in v40:GetDescendants() do
                    if v131.Name == "MainWindAtttachment" then
                        v131:Destroy();
                    end;
                end;
                if v77 then
                    v77:Destroy();
                end;
            end;
            --[[ close >= 45 ]]
        end;
    end;
end;
return v29;