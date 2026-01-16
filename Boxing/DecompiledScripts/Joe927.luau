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
local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
local l_Catalog_0 = l_ReplicatedStorage_0:WaitForChild("Catalog");
local l_SearchHelper_0 = require(l_Catalog_0:WaitForChild("SearchHelper"));
local v14 = require(l_Modules_0.Cutscene.Utilities);
local _ = require(l_Modules_0.Cutscene.Cutscene);
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local l_camShake_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local l_Parent_0 = script.Parent.Parent;
local v22 = require(l_Parent_0);
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local l_Debris_0 = workspace:WaitForChild("Debris");
local v25 = Random.new();
local function _(v26, v27, v28) --[[ Line: 37 ]] --[[ Name: Lerp ]]
    return v26 + (v27 - v26) * v28;
end;
local v30 = {
    Animations = {
        Character = 128471528916121, 
        Victim = 78542794378712, 
        Camera = 128801803853395
    }, 
    CameraRig = l_ReplicatedStorage_0.Assets.FoVCamera
};
local function _(v31) --[[ Line: 49 ]] --[[ Name: impactCorrection ]]
    -- upvalues: l_TweenService_0 (copy), l_Lighting_0 (copy)
    task.defer(function() --[[ Line: 50 ]]
        -- upvalues: l_TweenService_0 (ref), v31 (copy), l_Lighting_0 (ref)
        local v32 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        l_TweenService_0:Create(v31, v32, {
            Saturation = -0.3, 
            Contrast = 7
        }):Play();
        local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
        l_MenuBlur_0.Size = 0;
        l_MenuBlur_0.Enabled = true;
        local v34 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
        l_TweenService_0:Create(l_MenuBlur_0, v34, {
            Size = 30
        }):Play();
    end);
end;
v30.Use = function(v36) --[[ Line: 63 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Players_0 (copy), l_Debris_0 (copy), v22 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_TweenService_0 (copy), l_RunService_0 (copy), v25 (copy), l_SearchHelper_0 (copy), v30 (copy), l_AnimHelper_0 (copy), l_EffectHelper_0 (copy), l_CurrentCamera_0 (copy), v14 (copy), l_camShake_0 (copy), l_ReplicatedStorage_0 (copy)
    local l_Character_0 = v36.Character;
    local l_Victim_0 = v36.Victim;
    local v39 = l_LocalPlayer_0.Character == l_Character_0;
    local v40 = l_LocalPlayer_0.Character == l_Victim_0;
    local _ = l_Players_0:GetPlayerFromCharacter(l_Victim_0);
    local v42 = RaycastParams.new();
    v42.FilterType = Enum.RaycastFilterType.Exclude;
    v42.FilterDescendantsInstances = {
        l_Debris_0, 
        l_Character_0, 
        l_Victim_0
    };
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v44 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v46 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    local v47 = v22.GetWeldCharacter(l_Character_0);
    local v48 = v22.GetWeldCharacter(l_Victim_0);
    local function v55() --[[ Line: 87 ]] --[[ Name: SlowDownAnimations ]]
        -- upvalues: v44 (copy), v46 (copy)
        for _, v50 in (v44:GetPlayingAnimationTracks()) do
            if v50.Priority ~= Enum.AnimationPriority.Idle then
                local _ = v50.Speed;
                v50:AdjustSpeed(0.2);
            end;
        end;
        for _, v53 in (v46:GetPlayingAnimationTracks()) do
            if v53.Priority ~= Enum.AnimationPriority.Idle then
                local _ = v53.Speed;
                v53:AdjustSpeed(0.2);
            end;
        end;
    end;
    task.defer(function() --[[ Line: 105 ]]
        -- upvalues: v55 (copy)
        local v56 = tick();
        while tick() - v56 < 1 do
            v55();
            task.wait(0.1);
        end;
    end);
    task.defer(function() --[[ Line: 114 ]]
        -- upvalues: v39 (copy), v40 (copy), v22 (ref), l_Main_0 (ref)
        if v39 or v40 then
            v22.StatusFrame(v40, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v57 = l_Parent_0.UltimateStart:Clone();
    v57.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v57.Parent = l_Debris_0;
    local l_ClockTime_0 = l_Lighting_0.ClockTime;
    local v59 = false;
    local function _() --[[ Line: 128 ]] --[[ Name: CancelScript ]]
        -- upvalues: v59 (ref)
        v59 = true;
    end;
    local v61 = {};
    task.delay(20, function() --[[ Line: 134 ]]
        -- upvalues: v57 (copy)
        if v57 then
            v57:Destroy();
        end;
    end);
    for _, v63 in v57.Particle:GetChildren() do
        v63.Enabled = false;
        v63:Emit(v63:GetAttribute("EmitCount"));
    end;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    local v71 = nil;
    local v72 = nil;
    local v73 = nil;
    local v74 = nil;
    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
    local v76 = {};
    local v77 = {};
    local v78 = {};
    local v79 = {};
    local v80 = {};
    local v81 = {};
    if v39 or v40 then
        v64 = script.Impact:Clone();
        v64.Parent = l_Players_0.LocalPlayer.PlayerGui;
        v66 = script.VHS:Clone();
        v66.Parent = game.Players.LocalPlayer.PlayerGui;
        for _, v83 in ipairs(v66:GetDescendants()) do
            if v83:IsA("ImageLabel") then
                v80[v83] = v83.ImageTransparency;
                v83.ImageTransparency = 1;
            end;
        end;
        v67 = script.Ring:Clone();
        v67.Name = "JoeRing";
        v67.Parent = workspace.Debris;
    end;
    local v84 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local v85 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v86 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
    local v87 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    local v88 = v22.GetAtmosphere();
    local v89 = {
        Density = v88.Density, 
        Color = v88.Color, 
        Haze = v88.Haze, 
        Glare = v88.Glare, 
        Decay = v88.Decay
    };
    local v90 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = (not not v39 or v40) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v90.Volume;
    v90.Volume = 0;
    task.delay(1, function() --[[ Line: 218 ]]
        -- upvalues: v90 (copy), v39 (copy), v40 (copy), l_Volume_0 (copy)
        v90:Stop();
        if v39 or v40 then
            v90.Volume = l_Volume_0;
        else
            v90.Volume = l_Volume_0 / 5;
        end;
        v90:Play();
    end);
    local v92 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.MONOLITH, 
        Parent = (not not v39 or v40) and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_1 = v92.Volume;
    v92.Volume = 0;
    task.delay(0, function() --[[ Line: 239 ]]
        -- upvalues: v92 (copy), l_TweenService_0 (ref), v39 (copy), v40 (copy), l_Volume_1 (copy)
        v92:Stop();
        l_TweenService_0:Create(v92, TweenInfo.new(14, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            Volume = (not not v39 or v40) and l_Volume_1 or l_Volume_1 / 5
        }):Play();
        v92:Play();
        v92.TimePosition = 26;
    end);
    local function v108() --[[ Line: 247 ]] --[[ Name: cleanup ]]
        -- upvalues: v61 (copy), l_RunService_0 (ref), v71 (ref), v59 (ref), l_TweenService_0 (ref), l_Lighting_0 (ref), v86 (copy), l_ColorCorrection_0 (copy), l_Victim_0 (copy), l_Character_0 (copy), l_ClockTime_0 (copy), l_Humanoid_1 (copy), v88 (copy), v89 (copy), v90 (copy), v92 (copy), v67 (ref), v66 (ref), v64 (ref), v69 (ref), v70 (ref), v74 (ref), v73 (ref), v68 (ref), v77 (ref), v78 (ref), v79 (copy), v81 (copy), v76 (copy), l_Main_0 (ref), v84 (copy), v22 (ref)
        for _, v95 in v61 do
            v95:Disconnect();
        end;
        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
        v71.Value = "";
        v59 = true;
        l_TweenService_0:Create(l_Lighting_0, v86, {
            ExposureCompensation = workspace.Exposure.Value
        }):Play();
        l_TweenService_0:Create(l_ColorCorrection_0, TweenInfo.new(1), {
            Saturation = 0, 
            Contrast = 0, 
            Brightness = 0, 
            TintColor = Color3.new(1, 1, 1)
        }):Play();
        l_Victim_0.PrimaryPart.Anchored = false;
        l_Character_0.PrimaryPart.Anchored = false;
        l_Lighting_0.ClockTime = l_ClockTime_0;
        for _, v97 in l_Humanoid_1:GetPlayingAnimationTracks() do
            v97:Stop();
        end;
        l_TweenService_0:Create(v88, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v89):Play();
        if v90 then
            v90:Destroy();
        end;
        if v92 then
            l_TweenService_0:Create(v92, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Volume = 0
            }):Play();
            task.delay(1, function() --[[ Line: 280 ]]
                -- upvalues: v92 (ref)
                v92:Destroy();
            end);
        end;
        if v67 then
            v67:Destroy();
        end;
        if v66 then
            v66:Destroy();
        end;
        if v64 then
            v64:Destroy();
        end;
        if v69 then
            v69:Destroy();
        end;
        if v70 then
            v70:Destroy();
        end;
        if v74 then
            v74:Destroy();
        end;
        if v73 then
            v73:Destroy();
        end;
        if v68 then
            v68:Destroy();
        end;
        for _, v99 in v77 do
            v99.LocalTransparencyModifier = 0;
        end;
        for _, v101 in v78 do
            v101.Enabled = true;
        end;
        for v102, v103 in v79 do
            v102.CollisionGroup = v103;
        end;
        for _, v105 in v81 do
            v105:Destroy();
        end;
        for _, v107 in v76 do
            v107:Destroy();
        end;
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v84, {
            ImageTransparency = 1
        }):Play();
        v22.SetTransparency(l_Character_0, 0);
        v22.SetTransparency(l_Victim_0, 0);
    end;
    v61[#v61 + 1] = l_Character_0.AncestryChanged:Connect(function() --[[ Line: 343 ]]
        -- upvalues: l_Character_0 (copy), v108 (copy)
        task.wait(0.1);
        if l_Character_0.Parent == nil then
            v108();
        end;
    end);
    v61[#v61 + 1] = l_Victim_0.AncestryChanged:Connect(function() --[[ Line: 350 ]]
        -- upvalues: l_Victim_0 (copy), v108 (copy)
        task.wait(0.1);
        if l_Victim_0.Parent == nil then
            v108();
        end;
    end);
    local function v115(v109, v110, v111) --[[ Line: 357 ]] --[[ Name: TweenVHSBars ]]
        -- upvalues: l_TweenService_0 (ref)
        if v111 then
            local l_Position_0 = v111.MainFrame.LeftBar.Position;
            local l_Position_1 = v111.MainFrame.RightBar.Position;
            local v114 = TweenInfo.new(v110 or 1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
            l_TweenService_0:Create(v111.MainFrame.LeftBar, v114, {
                Position = UDim2.new(l_Position_0.X.Scale, 0, l_Position_0.Y.Scale - (v109 or 0), 0)
            }):Play();
            l_TweenService_0:Create(v111.MainFrame.RightBar, v114, {
                Position = UDim2.new(l_Position_1.X.Scale, 0, l_Position_1.Y.Scale + (v109 or 0), 0)
            }):Play();
        end;
    end;
    if v39 or v40 then
        local _ = task.defer(function() --[[ Line: 370 ]]
            -- upvalues: v65 (ref), v66 (ref), v61 (copy), l_RunService_0 (ref), v25 (ref)
            v65 = v66.MainFrame;
            local l_MainLines_0 = v65.MainLines;
            local v117 = {
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
            local v118 = 1;
            local v119 = 0;
            v61[#v61 + 1] = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 379 ]]
                -- upvalues: v119 (ref), l_MainLines_0 (copy), v117 (copy), v118 (ref)
                local v120 = tick();
                if v120 - v119 >= 0.01 then
                    l_MainLines_0.Image = "rbxassetid://" .. v117[v118];
                    v118 = v118 + 1;
                    if v118 > #v117 then
                        v118 = 1;
                    end;
                    v119 = v120;
                end;
            end);
            task.spawn(function() --[[ Line: 394 ]]
                -- upvalues: v61 (ref), l_RunService_0 (ref), v65 (ref), v25 (ref)
                v61[#v61 + 1] = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 395 ]]
                    -- upvalues: v65 (ref), v25 (ref)
                    if not v65 then
                        return;
                    else
                        if v65.RGBStatic then
                            v65.RGBStatic.Position = UDim2.new(-math.random(20, 80) / 100, 0, 0, 0);
                            v65.Lines.Position = UDim2.new(math.random(-1125, 125) / 1000, 0, 0, 0);
                            v65.Static.Position = UDim2.new(-math.random(20, 80) / 100, 0, -math.random(20, 80) / 100, 0);
                            v65.LeftBar.SideJitter.Position = UDim2.new(v25:NextNumber(0, 0.06), 0, v25:NextNumber(0, 0.06), 0);
                            v65.RightBar.SideJitter.Position = UDim2.new(v25:NextNumber(0, 0.06), 0, v25:NextNumber(0, 0.06), 0);
                            v65.LeftBarOld.SideJitter.Position = UDim2.new(-math.random(20, 80) / 1000, 0, math.random(-1000, 0) / 1000, 0);
                            v65.RightBarOld.SideJitter.Position = UDim2.new(-math.random(20, 80) / 1000, 0, math.random(-1000, 0) / 1000, 0);
                        end;
                        return;
                    end;
                end);
            end);
        end);
        v115(0.25, 0.1, v66);
        for v122, v123 in v80 do
            l_TweenService_0:Create(v122, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ImageTransparency = v123
            }):Play();
        end;
        v64.VideoFrame.Looped = true;
        v64.VideoFrame:Play();
        task.defer(function() --[[ Line: 425 ]]
            -- upvalues: l_ColorCorrection_0 (copy), l_TweenService_0 (ref), v85 (copy), l_Lighting_0 (ref), v86 (copy), v22 (ref), v57 (copy)
            l_ColorCorrection_0.Saturation = 0;
            l_ColorCorrection_0.Contrast = 0;
            l_ColorCorrection_0.Enabled = true;
            l_TweenService_0:Create(l_ColorCorrection_0, v85, {
                Saturation = -0.7, 
                Contrast = 0.5
            }):Play();
            local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
            l_MenuBlur_1.Size = 0;
            l_MenuBlur_1.Enabled = true;
            local v125 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_1, v125, {
                Size = 10
            }):Play();
            l_TweenService_0:Create(l_Lighting_0, v86, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.3
            }):Play();
            v22.HUDShake({
                Scale = 20, 
                Damper = 0.09999999999999999
            });
            task.wait(5);
            v57:Destroy();
        end);
    end;
    task.wait(0.5);
    local v126 = l_Character_0 and l_Character_0:WaitForChild("Humanoid", 20);
    local v127 = v126 and v126:FindFirstChild("HumanoidDescription", 20);
    local v128 = l_SearchHelper_0.ConvertToBlob(v127);
    local v129 = l_SearchHelper_0.ConvertToBlob(script.JoeAvatar.Humanoid.HumanoidDescription);
    local v130 = Color3.fromRGB(228, 236, 255);
    if v39 or v40 then
        l_TweenService_0:Create(v66.White, v87, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v87, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v84, {
            ImageTransparency = 0.5
        }):Play();
        v73 = Instance.new("ColorCorrectionEffect");
        v73.Parent = l_Lighting_0;
        v73.Saturation = 0.16;
        v73.Brightness = 0.04;
        v73.Contrast = 0.32;
        v73.TintColor = v130;
        v74 = Instance.new("BloomEffect");
        v74.Parent = l_Lighting_0;
        v74.Threshold = 1.2;
    end;
    task.wait(0.5);
    task.spawn(function() --[[ Line: 480 ]]
        -- upvalues: l_SearchHelper_0 (ref), v127 (copy), v129 (copy), l_Character_0 (copy), v128 (copy)
        l_SearchHelper_0.WriteBlobToDescription(v127, v129);
        l_SearchHelper_0.UpdateModelAppearance(l_Character_0);
        task.wait(0.08333333333333333);
        l_SearchHelper_0.WriteBlobToDescription(v127, v128);
        l_SearchHelper_0.UpdateModelAppearance(l_Character_0);
    end);
    task.delay(0, function() --[[ Line: 489 ]]
        -- upvalues: v22 (ref), l_Character_0 (copy)
        v22.SetTransparency(l_Character_0, 1);
        task.wait(0.8333333333333334);
        v22.SetTransparency(l_Character_0, 0);
    end);
    local v131 = {
        Animator = v44, 
        AnimId = v30.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    local v132 = {
        Animator = v46, 
        AnimId = v30.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        FadeIn = 0
    };
    l_AnimHelper_0:CreateAnim(v131);
    l_AnimHelper_0:CreateAnim(v132);
    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v131);
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v132);
    local v135 = {
        "Welds", 
        "Ring"
    };
    if v39 or v40 then
        l_Lighting_0.ClockTime = 0;
        l_TweenService_0:Create(v88, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Density = 0.5, 
            Color = Color3.fromRGB(56, 56, 56), 
            Decay = Color3.fromRGB(62, 68, 81), 
            Haze = 3.5
        }):Play();
    end;
    if v39 or v40 then
        local l_StartCFrame_0 = v36.StartCFrame;
        v67:PivotTo(l_StartCFrame_0);
        local v137, v138 = l_EffectHelper_0.GetPartsToHide(l_Character_0, v135);
        v77 = v137;
        v78 = v138;
        for _, v140 in v77 do
            v140.LocalTransparencyModifier = 1;
        end;
        for _, v142 in v78 do
            v142.Enabled = false;
        end;
        for _, v144 in l_Character_0:GetDescendants() do
            if v144:IsA("BasePart") or v144:IsA("MeshPart") then
                v144.LocalTransparencyModifier = 0;
            end;
        end;
        for _, v146 in l_Victim_0:GetDescendants() do
            if v146:IsA("BasePart") or v146:IsA("MeshPart") then
                v146.LocalTransparencyModifier = 0;
            end;
        end;
        for _, v148 in v67:GetDescendants() do
            if v148:IsA("BasePart") or v148:IsA("MeshPart") then
                v148.LocalTransparencyModifier = 0;
            end;
        end;
    end;
    v71 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    if v39 or v40 then
        v71.Value = "Cutscene";
        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            FieldOfView = 32
        }):Play();
        v70 = script.Camera:Clone();
        v70.Parent = l_Debris_0;
        local v149 = script.Lighting:Clone();
        v149.Parent = game.Lighting;
        local l_v149_0 = v149 --[[ copy: 60 -> 82 ]];
        task.delay(20, function() --[[ Line: 572 ]]
            -- upvalues: l_v149_0 (copy)
            l_v149_0:Destroy();
        end);
        for _, v152 in v149:GetChildren() do
            table.insert(v76, v152);
            v152.Parent = l_Lighting_0;
        end;
        for _, v154 in l_Character_0:GetChildren() do
            if v154:IsA("Accessory") then
                for _, v156 in v154:GetChildren() do
                    if v156:IsA("BasePart") then
                        if not v156:GetAttribute("PreviousTransparency") then
                            v156:SetAttribute("PreviousTransparency", v156.Transparency);
                        end;
                        v156.Transparency = 1;
                    end;
                end;
            end;
            if v154.Name == "Head" then
                v154.LocalTransparencyModifier = 1;
            end;
        end;
    end;
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    task.delay(0.016666666666666666, function() --[[ Line: 603 ]]
        -- upvalues: l_Character_0 (copy), l_Victim_0 (copy), v22 (ref)
        for _, v158 in {
            l_Character_0, 
            l_Victim_0, 
            v22.GetWeldCharacter(l_Character_0), 
            v22.GetWeldCharacter(l_Victim_0)
        } do
            for _, v160 in v158:GetDescendants() do
                if v160:IsA("BasePart") and v160:GetAttribute("PreviousCollisionGroup") then
                    v160:SetAttribute("PreviousCollisionGroup", v160.CollisionGroup);
                    v160.CollisionGroup = "None";
                end;
            end;
        end;
    end);
    task.defer(function() --[[ Line: 618 ]]
        -- upvalues: v22 (ref), l_Character_0 (copy)
        v22.AttackTrail({
            Character = l_Character_0, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "UltimateTrail", 
                TargetPart = "RightHand", 
                DelayTime = 0, 
                HoldTime = 1, 
                TimeScale = 0.3
            }
        });
    end);
    local l_Aura_0 = script.Aura;
    local v162 = script.First:Clone();
    local v163 = script.Knockdown:Clone();
    v163.Parent = l_Debris_0;
    local v164 = script.Shine.Shine:Clone();
    v164.Parent = l_Victim_0.LowerTorso;
    local v165 = script.Floor:Clone();
    v165.Parent = l_Debris_0;
    local v166 = script.Effects.Mid:Clone();
    v166.Parent = v47:FindFirstChild("Head") or l_Character_0.Head;
    local v167 = script.Effects.Mid:Clone();
    v167.Parent = v47:FindFirstChild("Head") or l_Character_0.Head;
    local v168 = script.Effects.Hit:Clone();
    v168.Parent = v48:FindFirstChild("Head") or l_Victim_0.Head;
    local v169 = script.Effects.Hit:Clone();
    v169.Parent = v48:FindFirstChild("Head") or l_Victim_0.Head;
    local v170 = script.Effects.Slow:Clone();
    v170.Parent = v48:FindFirstChild("Head") or l_Victim_0.Head;
    v61[#v61 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("First"):Connect(function() --[[ Line: 662 ]]
        -- upvalues: v59 (ref), v162 (copy), l_Debris_0 (ref), l_Character_0 (copy), v14 (ref), v39 (copy), v40 (copy), v70 (ref), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v22 (ref)
        if v59 then
            return;
        else
            v162.Parent = l_Debris_0;
            v162.CFrame = l_Character_0.HumanoidRootPart.CFrame;
            game.Debris:AddItem(v162, 4);
            v14.Emit(v162);
            if v39 or v40 then
                for _, v172 in l_Character_0:GetChildren() do
                    if v172:IsA("Accessory") then
                        for _, v174 in v172:GetChildren() do
                            if v174:IsA("BasePart") then
                                v174.Transparency = v174:GetAttribute("PreviousTransparency") or 0;
                            end;
                        end;
                    end;
                    if v172.Name == "Head" then
                        v172.LocalTransparencyModifier = 0;
                    end;
                end;
                v70.Spec20O.Enabled = false;
                local l_l_ColorCorrection_0_0 = l_ColorCorrection_0;
                task.defer(function() --[[ Line: 50 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrection_0_0 (copy), l_Lighting_0 (ref)
                    local v176 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_ColorCorrection_0_0, v176, {
                        Saturation = -0.3, 
                        Contrast = 7
                    }):Play();
                    local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_2.Size = 0;
                    l_MenuBlur_2.Enabled = true;
                    local v178 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_2, v178, {
                        Size = 30
                    }):Play();
                end);
                v22.HUDShake({
                    Scale = 20, 
                    Damper = 0.09999999999999999
                });
                task.defer(function() --[[ Line: 694 ]]
                    -- upvalues: v22 (ref)
                    v22.CameraShake({
                        Preset = "HardHit", 
                        WaitTime = 0.2, 
                        Fade = 0.5
                    });
                end);
            end;
            return;
        end;
    end);
    v61[#v61 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Knockdown"):Connect(function() --[[ Line: 705 ]]
        -- upvalues: v59 (ref), v14 (ref), v163 (copy), l_Character_0 (copy), v42 (copy), v39 (copy), v40 (copy)
        if v59 then
            return;
        else
            v14.Emit(v163);
            game.Debris:AddItem(v163, 4);
            local v179 = workspace:Raycast(l_Character_0.LowerTorso.Position, Vector3.new(-0, -10, -0, -0), v42);
            if v179 then
                local v180 = v14.GetRaySurface(v179);
                local l_CFrame_0 = l_Character_0.HumanoidRootPart.CFrame;
                v163.CFrame = CFrame.new(v180.Position, l_CFrame_0 * CFrame.new(0, 0, -40000).Position);
            end;
            if v39 or v40 then
                task.wait(0.9166666666666666);
                for _, v183 in l_Character_0:GetChildren() do
                    if v183:IsA("Accessory") then
                        for _, v185 in v183:GetChildren() do
                            if v185:IsA("BasePart") then
                                if not v185:GetAttribute("PreviousTransparency") then
                                    v185:SetAttribute("PreviousTransparency", v185.Transparency);
                                end;
                                v185.Transparency = 1;
                            end;
                        end;
                    end;
                    if v183.Name == "Head" then
                        v183.LocalTransparencyModifier = 1;
                    end;
                end;
            end;
            return;
        end;
    end);
    local v186 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(0.5, 1), 
        NumberSequenceKeypoint.new(1, 1)
    });
    local v187 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(0.5, 0.5), 
        NumberSequenceKeypoint.new(1, 1)
    });
    v61[#v61 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("WakeUp"):Connect(function() --[[ Line: 753 ]]
        -- upvalues: v59 (ref), v39 (copy), v40 (copy), v70 (ref), v14 (ref), v164 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v86 (copy), v165 (copy), l_Victim_0 (copy), v42 (copy), l_Debris_0 (ref), v186 (copy)
        if v59 then
            return;
        else
            if v39 or v40 then
                v70.Up.Beam.Enabled = true;
                v70.Up.Beam101.Enabled = true;
            end;
            v14.Emit(v164);
            game.Debris:AddItem(v164, 5);
            l_TweenService_0:Create(l_Lighting_0, v86, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 2
            }):Play();
            v14.Emit(v165);
            game.Debris:AddItem(v165, 4);
            local v188 = workspace:Raycast(l_Victim_0.LowerTorso.Position, Vector3.new(-0, -10, -0, -0), v42);
            if v188 then
                local v189 = v14.GetRaySurface(v188);
                local l_CFrame_1 = l_Victim_0.HumanoidRootPart.CFrame;
                v165.CFrame = CFrame.new(v189.Position, l_CFrame_1 * CFrame.new(0, 0, -40000).Position);
            end;
            local v191 = script.fastShards:Clone();
            v191.Parent = l_Debris_0;
            v191.CFrame = l_Victim_0.HumanoidRootPart.CFrame;
            task.wait(1.5);
            if v59 then
                return;
            else
                v191.Waves.Enabled = false;
                if v39 or v40 then
                    task.defer(function() --[[ Line: 787 ]]
                        -- upvalues: v14 (ref), v70 (ref), v186 (ref)
                        v14.TweenNumberSequence(v70.Up.Beam101.Transparency, v186, 50, 1, v70.Up.Beam101, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                    end);
                    v14.TweenNumberSequence(v70.Up.Beam.Transparency, v186, 50, 1, v70.Up.Beam, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                end;
                return;
            end;
        end;
    end);
    v61[#v61 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("LeftL"):Connect(function() --[[ Line: 795 ]]
        -- upvalues: v59 (ref), l_Character_0 (copy), v14 (ref)
        if v59 then
            return;
        else
            local v192 = script.Heavy.Attachment:Clone();
            v192.Parent = l_Character_0.LeftFoot;
            v14.Emit(v192);
            game.Debris:AddItem(v192, 3);
            return;
        end;
    end);
    v61[#v61 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("RightL"):Connect(function() --[[ Line: 803 ]]
        -- upvalues: v59 (ref), l_Character_0 (copy), v14 (ref)
        if v59 then
            return;
        else
            local v193 = script.Heavy.Attachment:Clone();
            v193.Parent = l_Character_0.LeftFoot;
            v14.Emit(v193);
            game.Debris:AddItem(v193, 3);
            return;
        end;
    end);
    local v194 = 0;
    local v195 = nil;
    local function v196() --[[ Line: 814 ]] --[[ Name: BecomeJoe ]]
        -- upvalues: v195 (ref), v73 (ref), l_SearchHelper_0 (ref), v127 (copy), v129 (copy), l_Character_0 (copy), v126 (copy)
        if not v195 then
            v195 = v73.Brightness;
        end;
        l_SearchHelper_0.WriteBlobToDescription(v127, v129);
        l_SearchHelper_0.UpdateModelAppearance(l_Character_0);
        v126:BuildRigFromAttachments();
        v73.Brightness = 0.5;
        v73.TintColor = Color3.fromRGB(255, 253, 228);
    end;
    local function _() --[[ Line: 828 ]] --[[ Name: UndoJoe ]]
        -- upvalues: l_SearchHelper_0 (ref), v127 (copy), v128 (copy), l_Character_0 (copy), v126 (copy), v73 (ref), v195 (ref), v130 (copy)
        l_SearchHelper_0.WriteBlobToDescription(v127, v128);
        l_SearchHelper_0.UpdateModelAppearance(l_Character_0);
        v126:BuildRigFromAttachments();
        v73.Brightness = v195;
        v73.TintColor = v130;
    end;
    v61[#v61 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("RightA"):Connect(function() --[[ Line: 838 ]]
        -- upvalues: v59 (ref), v14 (ref), v166 (copy), v39 (copy), v40 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v22 (ref), v194 (ref), v196 (copy)
        if v59 then
            return;
        else
            v14.Emit(v166);
            game.Debris:AddItem(v166, 6);
            if v39 or v40 then
                local l_l_ColorCorrection_0_1 = l_ColorCorrection_0;
                task.defer(function() --[[ Line: 50 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrection_0_1 (copy), l_Lighting_0 (ref)
                    local v199 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_ColorCorrection_0_1, v199, {
                        Saturation = -0.3, 
                        Contrast = 7
                    }):Play();
                    local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_3.Size = 0;
                    l_MenuBlur_3.Enabled = true;
                    local v201 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_3, v201, {
                        Size = 30
                    }):Play();
                end);
                v22.HUDShake({
                    Scale = 20, 
                    Damper = 0.09999999999999999
                });
                task.defer(function() --[[ Line: 852 ]]
                    -- upvalues: v22 (ref)
                    v22.CameraShake({
                        Preset = "HardHit", 
                        WaitTime = 0.2, 
                        Fade = 0.5
                    });
                end);
            end;
            if not v40 and not v39 then
                return;
            elseif v194 >= 2 then
                return;
            else
                v194 = v194 + 1;
                task.defer(function() --[[ Line: 866 ]]
                    -- upvalues: v22 (ref)
                    v22.CreateImpactFrame({
                        Time = 0.08333333333333333
                    });
                end);
                v196();
                return;
            end;
        end;
    end);
    v61[#v61 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("LeftA"):Connect(function() --[[ Line: 875 ]]
        -- upvalues: v59 (ref), v167 (copy), v47 (copy), l_Character_0 (copy), v14 (ref), v39 (copy), v40 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v22 (ref), l_SearchHelper_0 (ref), v127 (copy), v128 (copy), v126 (copy), v73 (ref), v195 (ref), v130 (copy)
        if v59 then
            return;
        else
            v167.Parent = v47:FindFirstChild("Head") or l_Character_0.Head;
            v14.Emit(v167);
            game.Debris:AddItem(v167, 6);
            if v39 or v40 then
                local l_l_ColorCorrection_0_2 = l_ColorCorrection_0;
                task.defer(function() --[[ Line: 50 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrection_0_2 (copy), l_Lighting_0 (ref)
                    local v203 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_ColorCorrection_0_2, v203, {
                        Saturation = -0.3, 
                        Contrast = 7
                    }):Play();
                    local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_4.Size = 0;
                    l_MenuBlur_4.Enabled = true;
                    local v205 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_4, v205, {
                        Size = 30
                    }):Play();
                end);
                v22.HUDShake({
                    Scale = 20, 
                    Damper = 0.09999999999999999
                });
                task.defer(function() --[[ Line: 890 ]]
                    -- upvalues: v22 (ref)
                    v22.CameraShake({
                        Preset = "HardHit", 
                        WaitTime = 0.2, 
                        Fade = 0.5
                    });
                end);
            end;
            if not v40 and not v39 then
                return;
            else
                l_SearchHelper_0.WriteBlobToDescription(v127, v128);
                l_SearchHelper_0.UpdateModelAppearance(l_Character_0);
                v126:BuildRigFromAttachments();
                v73.Brightness = v195;
                v73.TintColor = v130;
                task.delay(2, function() --[[ Line: 903 ]]
                    -- upvalues: l_SearchHelper_0 (ref), v127 (ref), v128 (ref), l_Character_0 (ref), v126 (ref), v73 (ref), v195 (ref), v130 (ref)
                    l_SearchHelper_0.WriteBlobToDescription(v127, v128);
                    l_SearchHelper_0.UpdateModelAppearance(l_Character_0);
                    v126:BuildRigFromAttachments();
                    v73.Brightness = v195;
                    v73.TintColor = v130;
                end);
                return;
            end;
        end;
    end);
    local v206 = nil;
    v206 = script.Head.MainEye:Clone();
    v61[#v61 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("EyeTrail"):Connect(function() --[[ Line: 911 ]]
        -- upvalues: v59 (ref), v206 (ref), v47 (copy), l_Character_0 (copy), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), v85 (copy), l_Aura_0 (copy), v81 (copy), v40 (copy), v39 (copy), v195 (ref), v73 (ref), v68 (ref), v70 (ref), v14 (ref), v187 (copy)
        if v59 then
            return;
        else
            v206.Parent = v47:FindFirstChild("Head") or l_Character_0.Head;
            l_TweenService_0:Create(l_ColorCorrection_0, v85, {
                Saturation = 0, 
                Contrast = 0
            }):Play();
            for _, v208 in l_Character_0:GetChildren() do
                if v208.Name ~= "HumanoidRootPart" and v208:IsA("MeshPart") or v208:IsA("BasePart") then
                    for _, v210 in l_Aura_0:GetChildren() do
                        if v210:IsA("ParticleEmitter") then
                            local v211 = v210:Clone();
                            v211.Parent = v208;
                            table.insert(v81, v211);
                        end;
                    end;
                end;
            end;
            if not v40 and not v39 then
                return;
            else
                if not v195 then
                    v195 = v73.Brightness;
                end;
                if v39 or v40 then
                    for _, v213 in v68:GetChildren() do
                        if v213.Name == "Bottom" then
                            l_TweenService_0:Create(v213, TweenInfo.new(0.3), {
                                Transparency = 1
                            }):Play();
                        end;
                    end;
                    l_TweenService_0:Create(v70.SideWays, TweenInfo.new(1), {
                        CFrame = v70.SideWays.CFrame * CFrame.Angles(0, 0, -1.3868735302197341)
                    }):Play();
                    v70.SideWays.Beam.Enabled = true;
                    v70.SideWays.Beam101.Enabled = true;
                    task.defer(function() --[[ Line: 947 ]]
                        -- upvalues: v14 (ref), v70 (ref), v187 (ref)
                        v14.TweenNumberSequence(v70.SideWays.Beam101.Transparency, v187, 50, 0.5, v70.SideWays.Beam101, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                    end);
                    v14.TweenNumberSequence(v70.SideWays.Beam.Transparency, v187, 50, 0.5, v70.SideWays.Beam, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                end;
                return;
            end;
        end;
    end);
    v61[#v61 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Charge"):Connect(function() --[[ Line: 956 ]]
        -- upvalues: v59 (ref), v39 (copy), v40 (copy), l_camShake_0 (ref)
        if v59 then
            return;
        else
            if v39 or v40 then
                l_camShake_0:ShakeOnce(3, 10, 0.2, 2, 0.1, 20);
            end;
            if not v39 and not v40 then
                return;
            else
                return;
            end;
        end;
    end);
    v61[#v61 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Slow"):Connect(function() --[[ Line: 966 ]]
        -- upvalues: v59 (ref), v39 (copy), v40 (copy), v70 (ref), v14 (ref), v170 (ref), l_TweenService_0 (ref)
        if v59 then
            return;
        else
            if v39 or v40 then
                v70.SideWays.Beam.Enabled = false;
                v70.SideWays.Beam101.Enabled = false;
            end;
            v14.Emit(v170);
            game.Debris:AddItem(v170, 6);
            for _, v215 in v170:GetDescendants() do
                if v215:IsA("ParticleEmitter") then
                    l_TweenService_0:Create(v215, TweenInfo.new(0.1), {
                        TimeScale = 0
                    }):Play();
                end;
            end;
            return;
        end;
    end);
    v61[#v61 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("After"):Connect(function() --[[ Line: 983 ]]
        -- upvalues: v59 (ref), v206 (ref), v170 (ref), v48 (copy), l_Victim_0 (copy), v14 (ref), v39 (copy), v40 (copy), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v22 (ref)
        if v59 then
            return;
        else
            v206:Destroy();
            v170:Destroy();
            v170 = script.Effects.Hit:Clone();
            v170.Parent = v48:FindFirstChild("Head") or l_Victim_0.Head;
            v14.Emit(v170);
            game.Debris:AddItem(v170, 6);
            if v39 or v40 then
                local l_l_ColorCorrection_0_3 = l_ColorCorrection_0;
                task.defer(function() --[[ Line: 50 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrection_0_3 (copy), l_Lighting_0 (ref)
                    local v217 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_ColorCorrection_0_3, v217, {
                        Saturation = -0.3, 
                        Contrast = 7
                    }):Play();
                    local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_5.Size = 0;
                    l_MenuBlur_5.Enabled = true;
                    local v219 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_5, v219, {
                        Size = 30
                    }):Play();
                end);
                v22.HUDShake({
                    Scale = 20, 
                    Damper = 0.09999999999999999
                });
                task.defer(function() --[[ Line: 1002 ]]
                    -- upvalues: v22 (ref)
                    v22.CameraShake({
                        Preset = "HardHit", 
                        WaitTime = 0.3, 
                        Fade = 0.5
                    });
                end);
            end;
            return;
        end;
    end);
    v61[#v61 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("1"):Connect(function() --[[ Line: 1012 ]]
        -- upvalues: v59 (ref), v14 (ref), v169 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v39 (copy), v40 (copy), v72 (ref), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v22 (ref)
        if v59 then
            return;
        else
            v14.Emit(v169);
            game.Debris:AddItem(v169, 6);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(1.2);
            l_l_AnimHelper_0_Anim_1:AdjustSpeed(1.2);
            if v39 or v40 then
                v72:AdjustSpeed(1.2);
                l_ColorCorrection_0.Saturation = 0.1;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local l_l_ColorCorrection_0_4 = l_ColorCorrection_0;
                task.defer(function() --[[ Line: 50 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrection_0_4 (copy), l_Lighting_0 (ref)
                    local v221 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_ColorCorrection_0_4, v221, {
                        Saturation = -0.3, 
                        Contrast = 7
                    }):Play();
                    local l_MenuBlur_6 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_6.Size = 0;
                    l_MenuBlur_6.Enabled = true;
                    local v223 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_6, v223, {
                        Size = 30
                    }):Play();
                end);
                v22.HUDShake({
                    Scale = 20, 
                    Damper = 0.35
                });
                v22.CameraShake({
                    Preset = "HardHitRoll", 
                    WaitTime = 0.1, 
                    Fade = 0.15
                });
            end;
            if not v39 and not v40 then
                return;
            else
                return;
            end;
        end;
    end);
    v61[#v61 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("2"):Connect(function() --[[ Line: 1044 ]]
        -- upvalues: v59 (ref), v14 (ref), v168 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v39 (copy), v40 (copy), v72 (ref), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v22 (ref), l_SearchHelper_0 (ref), v127 (copy), v128 (copy), l_Character_0 (copy), v73 (ref), v195 (ref), v115 (copy), v66 (ref), v196 (copy), v126 (copy), v130 (copy)
        if v59 then
            return;
        else
            v14.Emit(v168);
            game.Debris:AddItem(v168, 6);
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
            l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
            if v39 or v40 then
                v72:AdjustSpeed(1);
                l_ColorCorrection_0.Saturation = 0.1;
                l_ColorCorrection_0.Contrast = 0;
                l_ColorCorrection_0.Enabled = true;
                local l_l_ColorCorrection_0_5 = l_ColorCorrection_0;
                task.defer(function() --[[ Line: 50 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrection_0_5 (copy), l_Lighting_0 (ref)
                    local v225 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_ColorCorrection_0_5, v225, {
                        Saturation = -0.3, 
                        Contrast = 7
                    }):Play();
                    local l_MenuBlur_7 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_7.Size = 0;
                    l_MenuBlur_7.Enabled = true;
                    local v227 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_7, v227, {
                        Size = 30
                    }):Play();
                end);
                v22.HUDShake({
                    Scale = 20, 
                    Damper = 0.35
                });
                v22.CameraShake({
                    Preset = "HardHitRoll", 
                    WaitTime = 0.1, 
                    Fade = 0.15
                });
            end;
            if not v39 and not v40 then
                return;
            else
                l_SearchHelper_0.WriteBlobToDescription(v127, v128);
                l_SearchHelper_0.UpdateModelAppearance(l_Character_0);
                v73.Brightness = v195;
                if v39 or v40 then
                    task.delay(1, function() --[[ Line: 1082 ]]
                        -- upvalues: v115 (ref), v66 (ref)
                        v115(0, 0.5, v66);
                    end);
                end;
                if not v39 and not v40 then
                    return;
                else
                    task.wait(1.1);
                    for _ = 1, 4 do
                        v196();
                        task.wait(0.05);
                        l_SearchHelper_0.WriteBlobToDescription(v127, v128);
                        l_SearchHelper_0.UpdateModelAppearance(l_Character_0);
                        v126:BuildRigFromAttachments();
                        v73.Brightness = v195;
                        v73.TintColor = v130;
                    end;
                    return;
                end;
            end;
        end;
    end);
    v61[#v61 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Speedlines (Arm2)"):Connect(function() --[[ Line: 1097 ]]
        -- upvalues: v59 (ref), v39 (copy), v40 (copy), v70 (ref), v72 (ref), l_camShake_0 (ref), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy)
        if v59 then
            return;
        else
            if v39 or v40 then
                v70.Spec20O.Enabled = true;
                v72:AdjustSpeed(0.2);
                l_camShake_0:ShakeOnce(3, 10, 0.2, 1, 0.1, 20);
            end;
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.2);
            l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.2);
            task.delay(0.5, function() --[[ Line: 1108 ]]
                -- upvalues: l_l_AnimHelper_0_Anim_0 (ref), l_l_AnimHelper_0_Anim_1 (ref), v39 (ref), v40 (ref), v72 (ref)
                l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
                l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
                if v39 or v40 then
                    v72:AdjustSpeed(1);
                    l_l_AnimHelper_0_Anim_0.TimePosition = v72.TimePosition;
                    l_l_AnimHelper_0_Anim_1.TimePosition = v72.TimePosition;
                end;
            end);
            return;
        end;
    end);
    v61[#v61 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("3"):Connect(function() --[[ Line: 1121 ]]
        -- upvalues: v59 (ref), v70 (ref), v39 (copy), v40 (copy), v115 (copy), v66 (ref), v48 (copy), l_Victim_0 (copy), v14 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_ColorCorrection_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref), v22 (ref)
        if v59 then
            return;
        else
            if v70 then
                v70:Destroy();
            end;
            if v39 or v40 then
                v115(0.1, 2, v66);
            end;
            local v229 = script.Effects.Final:Clone();
            v229.Parent = v48:FindFirstChild("Head") or l_Victim_0.Head;
            v14.Emit(v229);
            game.Debris:AddItem(v229, 6);
            if v39 or v40 then
                l_SoundHelper_0:PlaySound({
                    Name = "TakamuraSFX", 
                    Parent = l_Workspace_0.Debris, 
                    Volume = 0.18
                }).TimePosition = 11.1;
                local l_l_ColorCorrection_0_6 = l_ColorCorrection_0;
                task.defer(function() --[[ Line: 50 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrection_0_6 (copy), l_Lighting_0 (ref)
                    local v231 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_ColorCorrection_0_6, v231, {
                        Saturation = -0.3, 
                        Contrast = 7
                    }):Play();
                    local l_MenuBlur_8 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_8.Size = 0;
                    l_MenuBlur_8.Enabled = true;
                    local v233 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_8, v233, {
                        Size = 30
                    }):Play();
                end);
                v22.HUDShake({
                    Scale = 20, 
                    Damper = 0.09999999999999999
                });
                task.defer(function() --[[ Line: 1153 ]]
                    -- upvalues: v22 (ref)
                    v22.CameraShake({
                        Preset = "HardHit", 
                        WaitTime = 1.5, 
                        Fade = 0.5
                    });
                end);
            end;
            return;
        end;
    end);
    if v39 or v40 then
        v69 = l_ReplicatedStorage_0.Assets.FoVCamera:Clone();
        v69.Name = l_Character_0.Name .. "Camera";
        v69.Parent = l_Debris_0;
        local v234 = 0;
        local function _() --[[ Line: 1169 ]] --[[ Name: UpdateCameraCFrame ]]
            -- upvalues: v234 (ref), v69 (ref), v36 (copy)
            if os.time() - v234 < 0.5 then
                return;
            else
                v234 = os.time();
                v69:PivotTo(v36.StartCFrame * CFrame.new(0, -3, 0));
                return;
            end;
        end;
        if os.time() - v234 >= 0.5 then
            v234 = os.time();
            local v236 = v36.StartCFrame * CFrame.new(0, -3, 0);
            v69:PivotTo(v236);
        end;
        local v237 = {
            Animator = v69.AnimationController.Animator, 
            AnimId = v30.Animations.Camera
        };
        v72 = l_AnimHelper_0:CreateAnim(v237);
        v61[#v61 + 1] = v72:GetMarkerReachedSignal("Hide"):Connect(function() --[[ Line: 1187 ]]
            -- upvalues: v59 (ref), v39 (copy), v40 (copy), v115 (copy), v66 (ref), l_Character_0 (copy), v61 (copy), v72 (ref), l_TweenService_0 (ref)
            if v59 then
                return;
            else
                if v39 and v40 then
                    v115(0, 0.5, v66);
                    for _, v239 in l_Character_0:GetChildren() do
                        if v239:IsA("Accessory") then
                            for _, v241 in v239:GetChildren() do
                                if v241:IsA("BasePart") then
                                    if not v241:GetAttribute("PreviousTransparency") then
                                        v241:SetAttribute("PreviousTransparency", v241.Transparency);
                                    end;
                                    v241.Transparency = 1;
                                end;
                            end;
                        end;
                        if v239.Name == "Head" then
                            v239.LocalTransparencyModifier = 1;
                        end;
                    end;
                end;
                v61[#v61 + 1] = v72:GetMarkerReachedSignal("Unhide"):Connect(function() --[[ Line: 1212 ]]
                    -- upvalues: v59 (ref), l_Character_0 (ref), v39 (ref), v40 (ref), v115 (ref), v66 (ref), l_TweenService_0 (ref)
                    if v59 then
                        return;
                    else
                        for _, v243 in l_Character_0:GetChildren() do
                            if v243:IsA("Accessory") then
                                for _, v245 in v243:GetChildren() do
                                    if v245:IsA("BasePart") then
                                        v245.Transparency = v245:GetAttribute("PreviousTransparency");
                                        v245:SetAttribute("PreviousTransparency", nil);
                                    end;
                                end;
                            end;
                            if v243.Name == "Head" then
                                v243.LocalTransparencyModifier = 0;
                            end;
                        end;
                        if v39 and v40 then
                            v115(0.05, 1, v66);
                        end;
                        local v246 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                        l_TweenService_0:Create(v66.MainFrame.LeftBarOld, v246, {
                            Position = UDim2.new(v66.MainFrame.LeftBarOld.Position.X.Scale - 0.045, 0, v66.MainFrame.LeftBarOld.Position.Y.Scale, 0)
                        }):Play();
                        l_TweenService_0:Create(v66.MainFrame.RightBarOld, v246, {
                            Position = UDim2.new(v66.MainFrame.RightBarOld.Position.X.Scale + 0.045, 0, v66.MainFrame.RightBarOld.Position.Y.Scale, 0)
                        }):Play();
                        task.wait(1);
                        if v59 then
                            return;
                        else
                            if v39 and v40 then
                                v115(0, 5, v66);
                            end;
                            return;
                        end;
                    end;
                end);
                return;
            end;
        end);
        v61[#v61 + 1] = v72:GetMarkerReachedSignal("Slowmo"):Connect(function() --[[ Line: 1245 ]]
            -- upvalues: v59 (ref), v39 (copy), v40 (copy), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), v85 (copy), v47 (copy), l_Character_0 (copy), v48 (copy), v14 (ref), v187 (copy), v68 (ref), l_Debris_0 (ref), v36 (copy), v186 (copy)
            if v59 then
                return;
            else
                if not v39 or v40 then

                end;
                l_TweenService_0:Create(l_ColorCorrection_0, v85, {
                    Saturation = -0.7, 
                    Contrast = 0.5
                }):Play();
                local v247 = script.WindArm.MainWindAtttachment:Clone();
                v247.Parent = v47:FindFirstChild("RightLowerArm") or l_Character_0.RightLowerArm;
                local v248 = script.WindArm.MainWindAtttachment:Clone();
                v248.Parent = v48:FindFirstChild("RightLowerArm") or v48.RightLowerArm;
                local _ = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(0.1, 0.238727), 
                    NumberSequenceKeypoint.new(0.2, 0), 
                    NumberSequenceKeypoint.new(0.3, 0), 
                    NumberSequenceKeypoint.new(0.58, 0.36), 
                    NumberSequenceKeypoint.new(0.8, 1), 
                    NumberSequenceKeypoint.new(1, 1)
                });
                local function v255(v250, v251, v252) --[[ Line: 1270 ]] --[[ Name: tweenBeams ]]
                    -- upvalues: v14 (ref)
                    for _, v254 in v250:GetDescendants() do
                        if v254:IsA("Beam") then
                            if v252 then
                                v254.Transparency = NumberSequence.new(1);
                            end;
                            task.defer(function() --[[ Line: 1277 ]]
                                -- upvalues: v14 (ref), v254 (copy), v251 (copy)
                                v14.TweenNumberSequence(v254.Transparency, v251, 50, 0.3, v254, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                            end);
                        end;
                    end;
                end;
                v255(v247, v187, true);
                v255(v248, v187, true);
                if v39 or v40 then
                    if v59 then
                        return;
                    else
                        v68 = script.BlackBox:Clone();
                        v68.Parent = l_Debris_0;
                        v68:PivotTo(v36.StartCFrame + Vector3.new(0, 0.009999999776482582, 0, 0));
                        for _, v257 in v68:GetChildren() do
                            if v257.Name == "Bottom" then
                                l_TweenService_0:Create(v257, TweenInfo.new(0.3), {
                                    Transparency = 0
                                }):Play();
                            end;
                        end;
                    end;
                end;
                task.spawn(function() --[[ Line: 1301 ]]
                    -- upvalues: v255 (copy), v247 (copy), v186 (ref), v248 (copy)
                    wait(2.23);
                    v255(v247, v186, false);
                    v255(v248, v186, false);
                end);
                return;
            end;
        end);
        local v258 = CFrame.new();
        v61[#v61 + 1] = v72:GetMarkerReachedSignal("Speedlines"):Connect(function() --[[ Line: 1310 ]]
            -- upvalues: v59 (ref), v70 (ref), v39 (copy), v40 (copy), l_TweenService_0 (ref), v66 (ref), v22 (ref), l_Victim_0 (copy), v258 (ref)
            if v59 then
                return;
            else
                v70.Spec20O.Enabled = true;
                if not v39 or v40 then

                end;
                local v259 = TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                l_TweenService_0:Create(v66.MainFrame.LeftBarOld, v259, {
                    Position = UDim2.new(v66.MainFrame.LeftBarOld.Position.X.Scale - 0.5, 0, v66.MainFrame.LeftBarOld.Position.Y.Scale, 0)
                }):Play();
                l_TweenService_0:Create(v66.MainFrame.RightBarOld, v259, {
                    Position = UDim2.new(v66.MainFrame.RightBarOld.Position.X.Scale + 0.5, 0, v66.MainFrame.RightBarOld.Position.Y.Scale, 0)
                }):Play();
                for _, v261 in v66.MainFrame:GetChildren() do
                    if v261:IsA("ImageLabel") then
                        l_TweenService_0:Create(v261, v259, {
                            ImageTransparency = 1
                        }):Play();
                    end;
                end;
                if v39 or v40 then
                    v22.SetTransparency(l_Victim_0, 1);
                    v258 = CFrame.new(0, 0, 0.5);
                end;
                return;
            end;
        end);
        v61[#v61 + 1] = v72:GetMarkerReachedSignal("Video"):Connect(function() --[[ Line: 1334 ]]
            -- upvalues: v59 (ref), v70 (ref), v22 (ref), l_Victim_0 (copy), v258 (ref), v64 (ref), v92 (copy), l_TweenService_0 (ref), v88 (copy)
            if v59 then
                return;
            else
                v70.Spec20O.Enabled = false;
                v22.SetTransparency(l_Victim_0, 0);
                v258 = CFrame.new(0, 0, 0);
                task.wait(0.16666666666666666);
                v64.VideoFrame.TimePosition = 0;
                if v59 then
                    return;
                else
                    task.wait(0.1);
                    if v59 then
                        return;
                    else
                        v64.Frame.Visible = true;
                        v64.VideoFrame.Visible = true;
                        v92.UnderwaterEffect.Enabled = true;
                        l_TweenService_0:Create(v88, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                            Density = 0.5, 
                            Color = Color3.fromRGB(56, 56, 56), 
                            Decay = Color3.fromRGB(164, 179, 213), 
                            Haze = 3.5, 
                            Glare = 9
                        }):Play();
                        return;
                    end;
                end;
            end;
        end);
        v61[#v61 + 1] = v72:GetMarkerReachedSignal("Delete"):Connect(function() --[[ Line: 1362 ]]
            -- upvalues: v64 (ref), v92 (copy), v59 (ref), v258 (ref)
            task.wait(0.3333333333333333);
            v64:Destroy();
            v92.UnderwaterEffect.Enabled = false;
            if v59 then
                return;
            else
                task.wait(0.2);
                if v59 then
                    return;
                else
                    v258 = CFrame.new();
                    return;
                end;
            end;
        end);
        l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 1372 ]]
            -- upvalues: l_CurrentCamera_0 (ref), v69 (ref), v258 (ref), v70 (ref), v234 (ref), v36 (copy)
            l_CurrentCamera_0.CFrame = v69.CamPart.CFrame * v258;
            l_CurrentCamera_0.FieldOfView = math.abs((v69.FovPart.Position - v69.RootPart.Position).Y);
            if v70 then
                v70.CFrame = l_CurrentCamera_0.CFrame;
            end;
            if os.time() - v234 < 0.5 then
                return;
            else
                v234 = os.time();
                v69:PivotTo(v36.StartCFrame * CFrame.new(0, -3, 0));
                return;
            end;
        end);
        if v59 then
            return;
        else
            task.delay(v36.Time - 0.55, function() --[[ Line: 1385 ]]
                -- upvalues: l_RunService_0 (ref), v92 (copy), l_TweenService_0 (ref), v59 (ref), l_Main_0 (ref), v87 (copy), v76 (copy), v72 (ref), v84 (copy), l_Lighting_0 (ref), v86 (copy), v79 (copy), v22 (ref), v71 (ref), v39 (copy), v40 (copy), v88 (copy), v89 (copy), v61 (copy), v69 (ref), v70 (ref), v68 (ref), v66 (ref), v67 (ref), v74 (ref), v73 (ref), l_ClockTime_0 (copy), v77 (ref), v78 (ref)
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                if v92 then
                    l_TweenService_0:Create(v92, TweenInfo.new(6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Volume = 0
                    }):Play();
                end;
                if v59 then
                    return;
                else
                    l_TweenService_0:Create(l_Main_0.White, v87, {
                        BackgroundTransparency = 0
                    }):Play();
                    for _, v264 in v76 do
                        v264:Destroy();
                    end;
                    v72:Stop(0.1);
                    l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v84, {
                        ImageTransparency = 1
                    }):Play();
                    l_TweenService_0:Create(l_Lighting_0, v86, {
                        ExposureCompensation = workspace.Exposure.Value
                    }):Play();
                    for v265, v266 in v79 do
                        v265.CollisionGroup = v266;
                    end;
                    v22.CameraShake({
                        Preset = "HardHit", 
                        WaitTime = 0.2, 
                        Fade = 1
                    });
                    l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                    v71.Value = "";
                    if v39 or v40 then
                        l_TweenService_0:Create(v88, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v89):Play();
                    end;
                    if v39 or v40 then
                        for _, v268 in v61 do
                            v268:Disconnect();
                        end;
                        if v69 then
                            v69:Destroy();
                        end;
                        if v70 then
                            v70:Destroy();
                        end;
                        if v68 then
                            v68:Destroy();
                        end;
                        if v66 then
                            v66:Destroy();
                        end;
                        if v67 then
                            v67:Destroy();
                        end;
                        if v74 then
                            v74:Destroy();
                        end;
                        if v73 then
                            v73:Destroy();
                        end;
                        l_Lighting_0.ClockTime = l_ClockTime_0;
                        for _, v270 in v77 do
                            v270.LocalTransparencyModifier = 0;
                        end;
                        for _, v272 in v78 do
                            v272.Enabled = true;
                        end;
                    end;
                    return;
                end;
            end);
            --[[ close >= 77 ]]
        end;
    end;
    task.wait(v36.Time);
    for _, v274 in v61 do
        v274:Disconnect();
    end;
    if v59 then
        return;
    else
        for _, v276 in v81 do
            v276.Enabled = false;
        end;
        if v59 then
            return;
        else
            for _, v278 in v81 do
                v278:Destroy();
            end;
            if l_l_AnimHelper_0_Anim_1 then
                l_l_AnimHelper_0_Anim_1:Stop(0.1);
            end;
            l_l_AnimHelper_0_Anim_0:Stop(0.1);
            local v279 = false;
            (function() --[[ Line: 1491 ]] --[[ Name: ResetPosition ]]
                -- upvalues: v279 (ref), l_Character_0 (copy), v36 (copy), l_Victim_0 (copy), v22 (ref)
                if v279 then
                    return;
                else
                    v279 = true;
                    l_Character_0:SetPrimaryPartCFrame(v36.StartCFrame * CFrame.Angles(0, 3.141592653589793, 0));
                    l_Victim_0:SetPrimaryPartCFrame(v36.StartCFrame * CFrame.new(0, 0, 5));
                    task.delay(0.016666666666666666, function() --[[ Line: 1498 ]]
                        -- upvalues: l_Character_0 (ref), l_Victim_0 (ref), v22 (ref)
                        for _, v281 in {
                            l_Character_0, 
                            l_Victim_0, 
                            v22.GetWeldCharacter(l_Character_0), 
                            v22.GetWeldCharacter(l_Victim_0)
                        } do
                            for _, v283 in v281:GetDescendants() do
                                if v283:IsA("BasePart") then
                                    local l_v283_Attribute_0 = v283:GetAttribute("PreviousCollisionGroup");
                                    if l_v283_Attribute_0 then
                                        v283.CollisionGroup = l_v283_Attribute_0;
                                        v283:SetAttribute("PreviousCollisionGroup", nil);
                                    end;
                                end;
                            end;
                        end;
                        l_Victim_0.PrimaryPart.Anchored = false;
                        l_Character_0.PrimaryPart.Anchored = false;
                    end);
                    return;
                end;
            end)();
            return;
        end;
    end;
end;
return v30;