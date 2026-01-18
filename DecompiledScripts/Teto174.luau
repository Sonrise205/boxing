local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("HttpService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0:WaitForChild("AlignHelper"));
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("Styles"));
local _ = require(l_Modules_0:WaitForChild("EffectHelper"));
local _ = require(l_Modules_0.Cutscene.Utilities);
local _ = require(l_Modules_0.Cutscene.Cutscene);
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local l_Parent_0 = script.Parent.Parent;
local v21 = require(l_Parent_0);
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local l_Debris_0 = workspace:WaitForChild("Debris");
local _ = Random.new();
local function _(v25, v26, v27) --[[ Line: 35 ]] --[[ Name: Lerp ]]
    return v25 + (v26 - v25) * v27;
end;
local v29 = {
    Animations = {
        Character = 107510585724303, 
        Victim = 112349302519163, 
        Camera = 137343644766601
    }, 
    CameraRig = script.CameraRig
};
local function _(v30) --[[ Line: 47 ]] --[[ Name: impactCorrection ]]
    -- upvalues: l_TweenService_0 (copy), l_Lighting_0 (copy)
    task.defer(function() --[[ Line: 48 ]]
        -- upvalues: l_TweenService_0 (ref), v30 (copy), l_Lighting_0 (ref)
        local v31 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        l_TweenService_0:Create(v30, v31, {
            Saturation = 0.15, 
            Contrast = 0.15
        }):Play();
        local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
        l_MenuBlur_0.Size = 0;
        l_MenuBlur_0.Enabled = true;
        local v33 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
        l_TweenService_0:Create(l_MenuBlur_0, v33, {
            Size = 15
        }):Play();
    end);
end;
local _ = function(_, _, _) --[[ Line: 61 ]] --[[ Name: WhiteFlash ]]
    -- upvalues: v21 (copy)
    v21.CreateImpactFrame({
        Time = 0.1
    });
end;
local _ = function(v39, v40, v41, v42) --[[ Line: 68 ]] --[[ Name: FastGhostEffectPartsOnly ]]
    task.spawn(function() --[[ Line: 69 ]]
        -- upvalues: v39 (copy), v40 (copy), v41 (copy), v42 (copy)
        local l_GhostTemplate_0 = script:FindFirstChild("GhostTemplate");
        if not l_GhostTemplate_0 then
            return;
        else
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = v39.Name .. "_Ghosts";
            l_Folder_0.Parent = workspace;
            local v45 = {};
            for _, v47 in (l_GhostTemplate_0:GetChildren()) do
                if v47:IsA("BasePart") then
                    local v48 = v47:Clone();
                    v48.Color = v48.Color:Lerp(v40, 0.5);
                    v48.Transparency = 0.8;
                    v48.Anchored = true;
                    v48.CanCollide = false;
                    v48.Parent = l_Folder_0;
                    table.insert(v45, {
                        clone = v48, 
                        originalName = v47.Name
                    });
                end;
            end;
            for _, v50 in v45 do
                local l_v39_FirstChild_0 = v39:FindFirstChild(v50.originalName, true);
                if l_v39_FirstChild_0 then
                    v50.clone.CFrame = l_v39_FirstChild_0.CFrame;
                end;
            end;
            local v52 = math.floor(v41 / v42);
            for v53 = 1, v52 do
                local v54 = v53 / v52;
                for _, v56 in v45 do
                    v56.clone.Transparency = math.clamp(0.5 + v54 * 0.5, 0, 1);
                end;
                task.wait(v42);
            end;
            l_Folder_0:Destroy();
            return;
        end;
    end);
end;
v29.Use = function(v58) --[[ Line: 111 ]] --[[ Name: Use ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Players_0 (copy), l_Debris_0 (copy), v21 (copy), l_Main_0 (copy), l_Parent_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), l_CurrentCamera_0 (copy), l_ReplicatedStorage_0 (copy), v29 (copy), l_AnimHelper_0 (copy)
    local l_Character_0 = v58.Character;
    local l_Victim_0 = v58.Victim;
    local v61 = l_LocalPlayer_0.Character == l_Character_0;
    local v62 = l_LocalPlayer_0.Character == l_Victim_0;
    local v63 = v62 or v61;
    local _ = l_Players_0:GetPlayerFromCharacter(l_Victim_0);
    local v65 = RaycastParams.new();
    v65.FilterType = Enum.RaycastFilterType.Exclude;
    v65.FilterDescendantsInstances = {
        l_Debris_0, 
        l_Character_0, 
        l_Victim_0
    };
    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
    local v67 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
    local l_Humanoid_1 = l_Victim_0:FindFirstChild("Humanoid");
    local v69 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
    local v70 = v21.GetWeldCharacter(l_Character_0);
    local v71 = v21.GetWeldCharacter(l_Victim_0);
    local function v78() --[[ Line: 137 ]] --[[ Name: SlowDownAnimations ]]
        -- upvalues: v67 (copy), v69 (copy)
        for _, v73 in (v67:GetPlayingAnimationTracks()) do
            if v73.Priority ~= Enum.AnimationPriority.Idle then
                local _ = v73.Speed;
                v73:AdjustSpeed(0.2);
            end;
        end;
        for _, v76 in (v69:GetPlayingAnimationTracks()) do
            if v76.Priority ~= Enum.AnimationPriority.Idle then
                local _ = v76.Speed;
                v76:AdjustSpeed(0.2);
            end;
        end;
    end;
    task.defer(function() --[[ Line: 155 ]]
        -- upvalues: v78 (copy)
        local v79 = tick();
        while tick() - v79 < 1 do
            v78();
            task.wait(0.1);
        end;
    end);
    task.defer(function() --[[ Line: 164 ]]
        -- upvalues: v63 (copy), v21 (ref), v62 (copy), l_Main_0 (ref)
        if v63 then
            v21.StatusFrame(v62, l_Main_0.StatusFrame.UltimateFrame);
        end;
    end);
    local v80 = l_Parent_0.UltimateStart:Clone();
    v80.CFrame = CFrame.lookAt(l_Victim_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position);
    v80.Parent = l_Debris_0;
    task.delay(20, function() --[[ Line: 174 ]]
        -- upvalues: v80 (copy)
        if v80 then
            v80:Destroy();
        end;
    end);
    for _, v82 in v80.Particle:GetChildren() do
        v82.Enabled = false;
        v82:Emit(v82:GetAttribute("EmitCount"));
    end;
    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
    local v84 = l_SoundHelper_0:PlaySound({
        Name = "SFX", 
        DirectCopy = script.SFX, 
        Parent = v63 and l_Workspace_0.Debris or l_Character_0.PrimaryPart
    });
    local l_Volume_0 = v84.Volume;
    v84.Volume = 0;
    task.delay(0, function() --[[ Line: 194 ]]
        -- upvalues: v84 (copy), v63 (copy), l_Volume_0 (copy)
        v84:Stop();
        if v63 then
            v84.Volume = l_Volume_0;
        else
            v84.Volume = l_Volume_0 / 5;
        end;
        v84:Play();
    end);
    local v86 = {
        "LeftFrame", 
        "RightFrame", 
        "MainFrame", 
        "UltimateFrame", 
        "HotbarFrame"
    };
    local v87 = nil;
    if v63 then
        task.delay(0.7, function() --[[ Line: 210 ]]
            -- upvalues: v87 (ref), l_LocalPlayer_0 (ref), v86 (copy), l_Main_0 (ref)
            v87 = script.TextGui:Clone();
            v87.Parent = l_LocalPlayer_0.PlayerGui;
            task.delay(20, function() --[[ Line: 214 ]]
                -- upvalues: v87 (ref)
                if v87 then
                    v87:Destroy();
                end;
            end);
            for _, v89 in v86 do
                local l_l_Main_0_FirstChild_0 = l_Main_0:FindFirstChild(v89);
                if l_l_Main_0_FirstChild_0 then
                    l_l_Main_0_FirstChild_0.Position = UDim2.new(10, 0, 0, 0);
                end;
            end;
        end);
    end;
    local v91 = nil;
    local v92 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
    local _ = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local _ = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
    local v95 = TweenInfo.new(0.55, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true);
    local v96 = nil;
    local v97 = nil;
    local v98 = nil;
    local v99 = nil;
    local v100 = nil;
    local v101 = nil;
    local v102 = {};
    local v103 = {};
    local v104 = nil;
    local v105 = {};
    local v106 = {};
    local v107 = {};
    if v63 then
        local v108, v109 = v21.GetPartsToHide(l_Character_0, v107);
        v105 = v108;
        v106 = v109;
    end;
    local v110 = nil;
    local v111 = {};
    local function v127() --[[ Line: 263 ]] --[[ Name: cleanup ]]
        -- upvalues: v91 (ref), v102 (copy), l_RunService_0 (ref), v99 (ref), l_Victim_0 (copy), l_Character_0 (copy), v97 (ref), v100 (ref), v101 (ref), v110 (ref), v111 (copy), l_Humanoid_1 (copy), v84 (copy), v87 (ref), v96 (ref), v98 (ref), v103 (copy), v104 (ref), v63 (copy), l_TweenService_0 (ref), l_Main_0 (ref), v92 (copy), v86 (copy), v105 (ref), v106 (ref), l_CurrentCamera_0 (ref), l_ReplicatedStorage_0 (ref)
        if v91 then
            return;
        else
            v91 = true;
            for _, v113 in v102 do
                v113:Disconnect();
            end;
            l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
            v99.Value = "";
            l_Victim_0.PrimaryPart.Anchored = false;
            l_Character_0.PrimaryPart.Anchored = false;
            if v97 then
                v97:Stop(0.01);
            end;
            if v100 then
                v100:Stop();
            end;
            if v101 then
                v101:Stop();
            end;
            if v110 then
                v110:Destroy();
            end;
            for _, v115 in v111 do
                v115:Cancel();
            end;
            for _, v117 in l_Humanoid_1:GetPlayingAnimationTracks() do
                v117:Stop();
            end;
            if v84 then
                v84:Destroy();
            end;
            if v87 then
                v87:Destroy();
            end;
            if v96 then
                v96:Destroy();
            end;
            if v98 then
                v98:Destroy();
            end;
            for _, v119 in v103 do
                v119:Destroy();
            end;
            if v104 then
                v104:Destroy();
            end;
            if v63 then
                l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v92, {
                    ImageTransparency = 1
                }):Play();
                v99.Value = "";
                for _, v121 in v86 do
                    local l_l_Main_0_FirstChild_1 = l_Main_0:FindFirstChild(v121);
                    if l_l_Main_0_FirstChild_1 then
                        l_l_Main_0_FirstChild_1.Position = UDim2.new(0, 0, 0, 0);
                    end;
                end;
                for _, v124 in v105 do
                    v124.LocalTransparencyModifier = 0;
                end;
                for _, v126 in v106 do
                    v126.Enabled = true;
                end;
                l_CurrentCamera_0.FieldOfView = 60;
                task.delay(1, function() --[[ Line: 344 ]]
                    -- upvalues: l_ReplicatedStorage_0 (ref)
                    l_ReplicatedStorage_0.Events.RefreshMapLighting:Fire();
                end);
            end;
            return;
        end;
    end;
    v102[#v102 + 1] = l_Character_0.AncestryChanged:Connect(function() --[[ Line: 350 ]]
        -- upvalues: l_Character_0 (copy), v127 (copy)
        task.wait(0.1);
        if l_Character_0.Parent == nil then
            v127();
        end;
    end);
    v102[#v102 + 1] = l_Victim_0.AncestryChanged:Connect(function() --[[ Line: 357 ]]
        -- upvalues: l_Victim_0 (copy), v127 (copy)
        task.wait(0.1);
        if l_Victim_0.Parent == nil then
            v127();
        end;
    end);
    task.wait(0.5);
    if v63 then
        l_TweenService_0:Create(l_Main_0.White, v95, {
            BackgroundTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Lighting_0, v95, {
            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
        }):Play();
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v92, {
            ImageTransparency = 0.5
        }):Play();
        task.delay(1, function() --[[ Line: 371 ]]
            -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v95 (copy)
            l_TweenService_0:Create(l_Lighting_0, v95, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
        end);
    end;
    local l_Volume_1 = v84.Volume;
    v84.Volume = 0;
    task.delay(0.35, function() --[[ Line: 379 ]]
        -- upvalues: v84 (copy), v63 (copy), l_Volume_1 (copy), v58 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_0 (copy)
        v84:Stop();
        if v63 then
            v84.Volume = l_Volume_1;
        else
            v84.Volume = l_Volume_1 / 5;
        end;
        v84:Play();
        local l_Voiceline_0 = script:FindFirstChild("Voiceline");
        if l_Voiceline_0 and v58.HasVoicelines then
            local v130 = l_SoundHelper_0:PlaySound({
                Name = "Voice", 
                DirectCopy = l_Voiceline_0, 
                Parent = v63 and l_Workspace_0.Debris or l_Character_0.PrimaryPart
            });
            if not v63 then
                v130.Volume = v130.Volume / 5;
            end;
        end;
    end);
    task.wait(0.5);
    if v63 then
        for _, v132 in v105 do
            v132.LocalTransparencyModifier = 1;
        end;
        for _, v134 in v106 do
            v134.Enabled = false;
        end;
        v21.SetTransparency(l_Character_0, 0);
        v21.SetTransparency(l_Victim_0, 0);
        v21.SetTransparency(v70, 0);
        v21.SetTransparency(v71, 0);
    end;
    v99 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
    local v135 = {
        Animator = v67, 
        AnimId = v29.Animations.Character, 
        Priority = Enum.AnimationPriority.Action4, 
        Looped = false, 
        FadeIn = 0
    };
    local v136 = {
        Animator = v69, 
        AnimId = v29.Animations.Victim, 
        Priority = Enum.AnimationPriority.Action4, 
        Looped = false, 
        FadeIn = 0
    };
    l_Victim_0.PrimaryPart.Anchored = true;
    l_Character_0.PrimaryPart.Anchored = true;
    warn("What! Anim Here");
    l_AnimHelper_0:CreateAnim(v135);
    l_AnimHelper_0:CreateAnim(v136);
    v100 = l_AnimHelper_0:CreateAnim(v135);
    v101 = l_AnimHelper_0:CreateAnim(v136);
    v100:AdjustWeight(10000);
    v101:AdjustWeight(10000);
    if v63 then
        v99.Value = "Cutscene";
        l_CurrentCamera_0.FieldOfView = 50;
        l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v92, {
            ImageTransparency = 1
        }):Play();
    end;
    v110 = script.VFX:Clone();
    v110.Parent = workspace.Debris;
    task.delay(0.5, function() --[[ Line: 468 ]]
        -- upvalues: v110 (ref), l_Character_0 (copy)
        v110:SetPrimaryPartCFrame(l_Character_0.PrimaryPart.CFrame);
    end);
    local l_MeshEmitModule_0 = require(l_ReplicatedStorage_0:WaitForChild("MeshEmitModule"));
    local v138 = false;
    for _, v140 in workspace:GetChildren() do
        if string.find(v140.Name, "m_") then
            v138 = true;
            break;
        end;
    end;
    local v141 = CFrame.new();
    local v142 = 0;
    v102[#v102 + 1] = v100:GetMarkerReachedSignal("VFX"):Connect(function() --[[ Line: 485 ]]
        -- upvalues: v91 (ref), v142 (ref), v63 (copy), v110 (ref), l_MeshEmitModule_0 (copy), l_Character_0 (copy), v138 (ref), v141 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (ref), v96 (ref), v98 (ref), l_Victim_0 (copy), v103 (copy), l_Lighting_0 (ref), v21 (ref), v97 (ref), v100 (ref), v101 (ref), v87 (ref), v111 (copy)
        if v91 then
            return;
        else
            v142 = v142 + 1;
            if v142 == 1 then
                if not v63 then
                    return;
                else
                    for _, v144 in v110.Vfx.Wind:GetDescendants() do
                        if v144:IsA("ParticleEmitter") then
                            local l_v144_Attribute_0 = v144:GetAttribute("EmitDelay");
                            if l_v144_Attribute_0 then
                                task.delay(l_v144_Attribute_0, function() --[[ Line: 499 ]]
                                    -- upvalues: v144 (copy)
                                    v144:Emit(v144:GetAttribute("EmitCount"));
                                end);
                            else
                                v144:Emit(v144:GetAttribute("EmitCount"));
                            end;
                        end;
                    end;
                    for _, v147 in (v110.MeshVfx.MeshWind1:GetChildren()) do
                        l_MeshEmitModule_0(v147.Start);
                    end;
                    for _, v149 in (v110.MeshVfx.MeshWind4:GetChildren()) do
                        l_MeshEmitModule_0(v149.Start);
                    end;
                    return;
                end;
            elseif v142 == 2 then
                for _, v151 in (v110.MeshVfx.MeshWind2:GetChildren()) do
                    l_MeshEmitModule_0(v151.Start);
                end;
                for _, v153 in (v110.MeshVfx.MeshWind3:GetChildren()) do
                    l_MeshEmitModule_0(v153.Start);
                end;
                for _, v155 in (v110.MeshVfx.MeshWind4:GetChildren()) do
                    l_MeshEmitModule_0(v155.Start);
                end;
                return;
            elseif v142 == 3 then
                local l_l_Character_0_0 = l_Character_0;
                local v157 = Color3.fromRGB(255, 255, 255);
                local l_spawn_0 = task.spawn;
                local v159 = 0.5;
                local v160 = 0.03;
                l_spawn_0(function() --[[ Line: 69 ]]
                    -- upvalues: l_l_Character_0_0 (copy), v157 (copy), v159 (copy), v160 (copy)
                    local l_GhostTemplate_1 = script:FindFirstChild("GhostTemplate");
                    if not l_GhostTemplate_1 then
                        return;
                    else
                        local l_Folder_1 = Instance.new("Folder");
                        l_Folder_1.Name = l_l_Character_0_0.Name .. "_Ghosts";
                        l_Folder_1.Parent = workspace;
                        local v163 = {};
                        for _, v165 in (l_GhostTemplate_1:GetChildren()) do
                            if v165:IsA("BasePart") then
                                local v166 = v165:Clone();
                                v166.Color = v166.Color:Lerp(v157, 0.5);
                                v166.Transparency = 0.8;
                                v166.Anchored = true;
                                v166.CanCollide = false;
                                v166.Parent = l_Folder_1;
                                table.insert(v163, {
                                    clone = v166, 
                                    originalName = v165.Name
                                });
                            end;
                        end;
                        for _, v168 in v163 do
                            local l_l_l_Character_0_0_FirstChild_0 = l_l_Character_0_0:FindFirstChild(v168.originalName, true);
                            if l_l_l_Character_0_0_FirstChild_0 then
                                v168.clone.CFrame = l_l_l_Character_0_0_FirstChild_0.CFrame;
                            end;
                        end;
                        local v170 = math.floor(v159 / v160);
                        for v171 = 1, v170 do
                            local v172 = v171 / v170;
                            for _, v174 in v163 do
                                v174.clone.Transparency = math.clamp(0.5 + v172 * 0.5, 0, 1);
                            end;
                            task.wait(v160);
                        end;
                        l_Folder_1:Destroy();
                        return;
                    end;
                end);
                return;
            elseif v142 == 4 then
                local l_l_Character_0_1 = l_Character_0;
                local v176 = Color3.fromRGB(255, 255, 255);
                local l_spawn_1 = task.spawn;
                local v178 = 0.5;
                local v179 = 0.03;
                l_spawn_1(function() --[[ Line: 69 ]]
                    -- upvalues: l_l_Character_0_1 (copy), v176 (copy), v178 (copy), v179 (copy)
                    local l_GhostTemplate_2 = script:FindFirstChild("GhostTemplate");
                    if not l_GhostTemplate_2 then
                        return;
                    else
                        local l_Folder_2 = Instance.new("Folder");
                        l_Folder_2.Name = l_l_Character_0_1.Name .. "_Ghosts";
                        l_Folder_2.Parent = workspace;
                        local v182 = {};
                        for _, v184 in (l_GhostTemplate_2:GetChildren()) do
                            if v184:IsA("BasePart") then
                                local v185 = v184:Clone();
                                v185.Color = v185.Color:Lerp(v176, 0.5);
                                v185.Transparency = 0.8;
                                v185.Anchored = true;
                                v185.CanCollide = false;
                                v185.Parent = l_Folder_2;
                                table.insert(v182, {
                                    clone = v185, 
                                    originalName = v184.Name
                                });
                            end;
                        end;
                        for _, v187 in v182 do
                            local l_l_l_Character_0_1_FirstChild_0 = l_l_Character_0_1:FindFirstChild(v187.originalName, true);
                            if l_l_l_Character_0_1_FirstChild_0 then
                                v187.clone.CFrame = l_l_l_Character_0_1_FirstChild_0.CFrame;
                            end;
                        end;
                        local v189 = math.floor(v178 / v179);
                        for v190 = 1, v189 do
                            local v191 = v190 / v189;
                            for _, v193 in v182 do
                                v193.clone.Transparency = math.clamp(0.5 + v191 * 0.5, 0, 1);
                            end;
                            task.wait(v179);
                        end;
                        l_Folder_2:Destroy();
                        return;
                    end;
                end);
                return;
            elseif v142 == 5 then
                local l_l_Character_0_2 = l_Character_0;
                local v195 = Color3.fromRGB(255, 255, 255);
                local l_spawn_2 = task.spawn;
                local v197 = 0.5;
                local v198 = 0.03;
                local l_v197_0 = v197 --[[ copy: 4 -> 11 ]];
                local l_v198_0 = v198 --[[ copy: 5 -> 12 ]];
                l_spawn_2(function() --[[ Line: 69 ]]
                    -- upvalues: l_l_Character_0_2 (copy), v195 (copy), l_v197_0 (copy), l_v198_0 (copy)
                    local l_GhostTemplate_3 = script:FindFirstChild("GhostTemplate");
                    if not l_GhostTemplate_3 then
                        return;
                    else
                        local l_Folder_3 = Instance.new("Folder");
                        l_Folder_3.Name = l_l_Character_0_2.Name .. "_Ghosts";
                        l_Folder_3.Parent = workspace;
                        local v203 = {};
                        for _, v205 in (l_GhostTemplate_3:GetChildren()) do
                            if v205:IsA("BasePart") then
                                local v206 = v205:Clone();
                                v206.Color = v206.Color:Lerp(v195, 0.5);
                                v206.Transparency = 0.8;
                                v206.Anchored = true;
                                v206.CanCollide = false;
                                v206.Parent = l_Folder_3;
                                table.insert(v203, {
                                    clone = v206, 
                                    originalName = v205.Name
                                });
                            end;
                        end;
                        for _, v208 in v203 do
                            local l_l_l_Character_0_2_FirstChild_0 = l_l_Character_0_2:FindFirstChild(v208.originalName, true);
                            if l_l_l_Character_0_2_FirstChild_0 then
                                v208.clone.CFrame = l_l_l_Character_0_2_FirstChild_0.CFrame;
                            end;
                        end;
                        local v210 = math.floor(l_v197_0 / l_v198_0);
                        for v211 = 1, v210 do
                            local v212 = v211 / v210;
                            for _, v214 in v203 do
                                v214.clone.Transparency = math.clamp(0.5 + v212 * 0.5, 0, 1);
                            end;
                            task.wait(l_v198_0);
                        end;
                        l_Folder_3:Destroy();
                        return;
                    end;
                end);
                for _, v216 in (v110.MeshVfx.MeshKick:GetChildren()) do
                    l_MeshEmitModule_0(v216.Start);
                end;
                return;
            elseif v142 == 6 then
                local l_l_Character_0_3 = l_Character_0;
                local v218 = Color3.fromRGB(255, 255, 255);
                local l_spawn_3 = task.spawn;
                local v220 = 0.5;
                local v221 = 0.03;
                l_spawn_3(function() --[[ Line: 69 ]]
                    -- upvalues: l_l_Character_0_3 (copy), v218 (copy), v220 (copy), v221 (copy)
                    local l_GhostTemplate_4 = script:FindFirstChild("GhostTemplate");
                    if not l_GhostTemplate_4 then
                        return;
                    else
                        local l_Folder_4 = Instance.new("Folder");
                        l_Folder_4.Name = l_l_Character_0_3.Name .. "_Ghosts";
                        l_Folder_4.Parent = workspace;
                        local v224 = {};
                        for _, v226 in (l_GhostTemplate_4:GetChildren()) do
                            if v226:IsA("BasePart") then
                                local v227 = v226:Clone();
                                v227.Color = v227.Color:Lerp(v218, 0.5);
                                v227.Transparency = 0.8;
                                v227.Anchored = true;
                                v227.CanCollide = false;
                                v227.Parent = l_Folder_4;
                                table.insert(v224, {
                                    clone = v227, 
                                    originalName = v226.Name
                                });
                            end;
                        end;
                        for _, v229 in v224 do
                            local l_l_l_Character_0_3_FirstChild_0 = l_l_Character_0_3:FindFirstChild(v229.originalName, true);
                            if l_l_l_Character_0_3_FirstChild_0 then
                                v229.clone.CFrame = l_l_l_Character_0_3_FirstChild_0.CFrame;
                            end;
                        end;
                        local v231 = math.floor(v220 / v221);
                        for v232 = 1, v231 do
                            local v233 = v232 / v231;
                            for _, v235 in v224 do
                                v235.clone.Transparency = math.clamp(0.5 + v233 * 0.5, 0, 1);
                            end;
                            task.wait(v221);
                        end;
                        l_Folder_4:Destroy();
                        return;
                    end;
                end);
                return;
            elseif v142 == 7 then
                local l_l_Character_0_4 = l_Character_0;
                local v237 = Color3.fromRGB(255, 255, 255);
                local l_spawn_4 = task.spawn;
                local v239 = 0.5;
                local v240 = 0.03;
                l_spawn_4(function() --[[ Line: 69 ]]
                    -- upvalues: l_l_Character_0_4 (copy), v237 (copy), v239 (copy), v240 (copy)
                    local l_GhostTemplate_5 = script:FindFirstChild("GhostTemplate");
                    if not l_GhostTemplate_5 then
                        return;
                    else
                        local l_Folder_5 = Instance.new("Folder");
                        l_Folder_5.Name = l_l_Character_0_4.Name .. "_Ghosts";
                        l_Folder_5.Parent = workspace;
                        local v243 = {};
                        for _, v245 in (l_GhostTemplate_5:GetChildren()) do
                            if v245:IsA("BasePart") then
                                local v246 = v245:Clone();
                                v246.Color = v246.Color:Lerp(v237, 0.5);
                                v246.Transparency = 0.8;
                                v246.Anchored = true;
                                v246.CanCollide = false;
                                v246.Parent = l_Folder_5;
                                table.insert(v243, {
                                    clone = v246, 
                                    originalName = v245.Name
                                });
                            end;
                        end;
                        for _, v248 in v243 do
                            local l_l_l_Character_0_4_FirstChild_0 = l_l_Character_0_4:FindFirstChild(v248.originalName, true);
                            if l_l_l_Character_0_4_FirstChild_0 then
                                v248.clone.CFrame = l_l_l_Character_0_4_FirstChild_0.CFrame;
                            end;
                        end;
                        local v250 = math.floor(v239 / v240);
                        for v251 = 1, v250 do
                            local v252 = v251 / v250;
                            for _, v254 in v243 do
                                v254.clone.Transparency = math.clamp(0.5 + v252 * 0.5, 0, 1);
                            end;
                            task.wait(v240);
                        end;
                        l_Folder_5:Destroy();
                        return;
                    end;
                end);
                return;
            elseif v142 == 8 then
                local l_l_Character_0_5 = l_Character_0;
                local v256 = Color3.fromRGB(255, 255, 255);
                local l_spawn_5 = task.spawn;
                local v258 = 0.5;
                local v259 = 0.03;
                l_spawn_5(function() --[[ Line: 69 ]]
                    -- upvalues: l_l_Character_0_5 (copy), v256 (copy), v258 (copy), v259 (copy)
                    local l_GhostTemplate_6 = script:FindFirstChild("GhostTemplate");
                    if not l_GhostTemplate_6 then
                        return;
                    else
                        local l_Folder_6 = Instance.new("Folder");
                        l_Folder_6.Name = l_l_Character_0_5.Name .. "_Ghosts";
                        l_Folder_6.Parent = workspace;
                        local v262 = {};
                        for _, v264 in (l_GhostTemplate_6:GetChildren()) do
                            if v264:IsA("BasePart") then
                                local v265 = v264:Clone();
                                v265.Color = v265.Color:Lerp(v256, 0.5);
                                v265.Transparency = 0.8;
                                v265.Anchored = true;
                                v265.CanCollide = false;
                                v265.Parent = l_Folder_6;
                                table.insert(v262, {
                                    clone = v265, 
                                    originalName = v264.Name
                                });
                            end;
                        end;
                        for _, v267 in v262 do
                            local l_l_l_Character_0_5_FirstChild_0 = l_l_Character_0_5:FindFirstChild(v267.originalName, true);
                            if l_l_l_Character_0_5_FirstChild_0 then
                                v267.clone.CFrame = l_l_l_Character_0_5_FirstChild_0.CFrame;
                            end;
                        end;
                        local v269 = math.floor(v258 / v259);
                        for v270 = 1, v269 do
                            local v271 = v270 / v269;
                            for _, v273 in v262 do
                                v273.clone.Transparency = math.clamp(0.5 + v271 * 0.5, 0, 1);
                            end;
                            task.wait(v259);
                        end;
                        l_Folder_6:Destroy();
                        return;
                    end;
                end);
                return;
            elseif v142 == 9 then
                for _, v275 in (v110.MeshVfx.MeshHit:GetChildren()) do
                    l_MeshEmitModule_0(v275.Start);
                end;
                return;
            elseif v142 == 10 then
                for _, v277 in {
                    Color3.fromRGB(255, 255, 255), 
                    Color3.fromRGB(255, 255, 255), 
                    Color3.fromRGB(255, 255, 255)
                } do
                    local l_l_Character_0_6 = l_Character_0;
                    local l_spawn_6 = task.spawn;
                    local v280 = 0.5;
                    local v281 = 0.03;
                    l_spawn_6(function() --[[ Line: 69 ]]
                        -- upvalues: l_l_Character_0_6 (copy), v277 (copy), v280 (copy), v281 (copy)
                        local l_GhostTemplate_7 = script:FindFirstChild("GhostTemplate");
                        if not l_GhostTemplate_7 then
                            return;
                        else
                            local l_Folder_7 = Instance.new("Folder");
                            l_Folder_7.Name = l_l_Character_0_6.Name .. "_Ghosts";
                            l_Folder_7.Parent = workspace;
                            local v284 = {};
                            for _, v286 in (l_GhostTemplate_7:GetChildren()) do
                                if v286:IsA("BasePart") then
                                    local v287 = v286:Clone();
                                    v287.Color = v287.Color:Lerp(v277, 0.5);
                                    v287.Transparency = 0.8;
                                    v287.Anchored = true;
                                    v287.CanCollide = false;
                                    v287.Parent = l_Folder_7;
                                    table.insert(v284, {
                                        clone = v287, 
                                        originalName = v286.Name
                                    });
                                end;
                            end;
                            for _, v289 in v284 do
                                local l_l_l_Character_0_6_FirstChild_0 = l_l_Character_0_6:FindFirstChild(v289.originalName, true);
                                if l_l_l_Character_0_6_FirstChild_0 then
                                    v289.clone.CFrame = l_l_l_Character_0_6_FirstChild_0.CFrame;
                                end;
                            end;
                            local v291 = math.floor(v280 / v281);
                            for v292 = 1, v291 do
                                local v293 = v292 / v291;
                                for _, v295 in v284 do
                                    v295.clone.Transparency = math.clamp(0.5 + v293 * 0.5, 0, 1);
                                end;
                                task.wait(v281);
                            end;
                            l_Folder_7:Destroy();
                            return;
                        end;
                    end);
                    task.wait(0.106);
                end;
                return;
            elseif v142 == 11 then
                if v63 and v138 then
                    v141 = CFrame.new();
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                        FieldOfView = 23
                    }):Play();
                end;
                local l_RushLines_0 = v110.Vfx:WaitForChild("RushLines");
                local v297 = v96 and v96.Bone;
                for _, v299 in (l_RushLines_0:GetDescendants()) do
                    if v299:IsA("ParticleEmitter") then
                        local v300 = v299:Clone();
                        v300.Parent = v297;
                        v300.Enabled = true;
                        task.delay(2.1, function() --[[ Line: 614 ]]
                            -- upvalues: v300 (copy)
                            v300.Enabled = false;
                            v300:Destroy();
                        end);
                    end;
                end;
                return;
            elseif v142 == 12 then
                for _, v302 in (v110.MeshVfx.MeshHitBig:GetChildren()) do
                    l_MeshEmitModule_0(v302.Start);
                end;
                return;
            elseif v142 == 13 then
                if v63 then
                    for _, v304 in v98.SideWays:GetChildren() do
                        if v304:IsA("Beam") then
                            v304.Enabled = false;
                        end;
                    end;
                    for _, v306 in v98.SideWays2:GetChildren() do
                        if v306:IsA("Beam") then
                            v306.Enabled = false;
                        end;
                    end;
                end;
                for _, v308 in v110.Vfx.Question:GetDescendants() do
                    if v308:IsA("ParticleEmitter") then
                        local l_v308_Attribute_0 = v308:GetAttribute("EmitDelay");
                        if l_v308_Attribute_0 then
                            task.delay(l_v308_Attribute_0, function() --[[ Line: 645 ]]
                                -- upvalues: v308 (copy)
                                v308:Emit(v308:GetAttribute("EmitCount"));
                            end);
                        else
                            v308:Emit(v308:GetAttribute("EmitCount"));
                        end;
                    end;
                end;
                return;
            elseif v142 == 14 then
                task.wait(0.4);
                for _, v311 in script.Head:GetChildren() do
                    local v312 = v311:Clone();
                    v312.Parent = l_Victim_0.Head;
                    table.insert(v103, v312);
                end;
                for _, v314 in l_Victim_0.Head:GetDescendants() do
                    if v314:IsA("ParticleEmitter") then
                        v314.Enabled = true;
                        task.delay(2.1, function() --[[ Line: 674 ]]
                            -- upvalues: v314 (copy)
                            v314.Enabled = false;
                        end);
                    end;
                end;
                return;
            elseif v142 == 15 then
                for _, v316 in v110.Vfx.Hit:GetDescendants() do
                    if v316:IsA("ParticleEmitter") then
                        local l_v316_Attribute_0 = v316:GetAttribute("EmitDelay");
                        if l_v316_Attribute_0 then
                            task.delay(l_v316_Attribute_0, function() --[[ Line: 684 ]]
                                -- upvalues: v316 (copy)
                                v316:Emit(v316:GetAttribute("EmitCount"));
                            end);
                        else
                            v316:Emit(v316:GetAttribute("EmitCount"));
                        end;
                    end;
                end;
                return;
            elseif v142 == 16 then
                for _, v319 in v110.Vfx.Hit2:GetDescendants() do
                    if v319:IsA("ParticleEmitter") then
                        local l_v319_Attribute_0 = v319:GetAttribute("EmitDelay");
                        if l_v319_Attribute_0 then
                            task.delay(l_v319_Attribute_0, function() --[[ Line: 697 ]]
                                -- upvalues: v319 (copy)
                                v319:Emit(v319:GetAttribute("EmitCount"));
                            end);
                        else
                            v319:Emit(v319:GetAttribute("EmitCount"));
                        end;
                    end;
                end;
                return;
            elseif v142 == 17 then
                for _, v322 in v110.Vfx.Hit3:GetDescendants() do
                    if v322:IsA("ParticleEmitter") then
                        local l_v322_Attribute_0 = v322:GetAttribute("EmitDelay");
                        if l_v322_Attribute_0 then
                            task.delay(l_v322_Attribute_0, function() --[[ Line: 710 ]]
                                -- upvalues: v322 (copy)
                                v322:Emit(v322:GetAttribute("EmitCount"));
                            end);
                        else
                            v322:Emit(v322:GetAttribute("EmitCount"));
                        end;
                    end;
                end;
                for _, v325 in (v110.MeshVfx.MeshWindHit3:GetChildren()) do
                    l_MeshEmitModule_0(v325.Start);
                end;
                for _, v327 in (v110.MeshVfx.MeshWind2Hit3:GetChildren()) do
                    l_MeshEmitModule_0(v327.Start);
                end;
                return;
            elseif v142 == 18 then
                for _, v329 in (v110.Vfx.Hit3.Bimki:GetDescendants()) do
                    if v329:IsA("Beam") then
                        local l_Transparency_0 = v329.Transparency;
                        task.spawn(function() --[[ Line: 739 ]]
                            -- upvalues: v329 (copy), l_Transparency_0 (copy)
                            v329.Enabled = true;
                            for v331 = 1, 10 do
                                local v332 = v331 / 10;
                                local v333 = {};
                                for _, v335 in l_Transparency_0.Keypoints do
                                    local v336 = 1 - v332 + v332 * v335.Value;
                                    table.insert(v333, NumberSequenceKeypoint.new(v335.Time, v336));
                                end;
                                v329.Transparency = NumberSequence.new(v333);
                                task.wait(0.01);
                            end;
                            v329.Transparency = l_Transparency_0;
                            task.wait(0.05);
                            for v337 = 1, 15 do
                                local v338 = v337 / 15;
                                local v339 = {};
                                for _, v341 in l_Transparency_0.Keypoints do
                                    local v342 = v341.Value + v338 * (1 - v341.Value);
                                    table.insert(v339, NumberSequenceKeypoint.new(v341.Time, v342));
                                end;
                                v329.Transparency = NumberSequence.new(v339);
                                task.wait(0.006666666666666667);
                            end;
                            v329.Enabled = false;
                            v329.Transparency = l_Transparency_0;
                        end);
                    end;
                end;
                return;
            else
                if v142 == 19 then
                    if v63 then
                        for _, v344 in v98.SideWays:GetChildren() do
                            if v344:IsA("Beam") then
                                v344.Enabled = true;
                            end;
                        end;
                        for _, v346 in v98.SideWays2:GetChildren() do
                            if v346:IsA("Beam") then
                                v346.Enabled = false;
                            end;
                        end;
                    end;
                    for _, v348 in v110.Vfx.GroundJump:GetDescendants() do
                        if v348:IsA("ParticleEmitter") then
                            local l_v348_Attribute_0 = v348:GetAttribute("EmitDelay");
                            if l_v348_Attribute_0 then
                                task.delay(l_v348_Attribute_0, function() --[[ Line: 799 ]]
                                    -- upvalues: v348 (copy)
                                    v348:Emit(v348:GetAttribute("EmitCount"));
                                end);
                            else
                                v348:Emit(v348:GetAttribute("EmitCount"));
                            end;
                        end;
                        if v63 and v138 then
                            for _, v351 in l_Lighting_0:GetChildren() do
                                if v351:IsA("Atmosphere") or v351:IsA("Sky") then
                                    v351:Destroy();
                                end;
                            end;
                            for _, v353 in script.Lighting:GetChildren() do
                                v353:Clone().Parent = l_Lighting_0;
                            end;
                        end;
                    end;
                    for _, v355 in (v110.MeshVfx.BigJump:GetChildren()) do
                        l_MeshEmitModule_0(v355.Start);
                    end;
                    if v63 then
                        v21.CreateImpactFrame({
                            Time = 0.03333333333333333
                        });
                        return;
                    end;
                elseif v142 == 20 then
                    if not v63 then
                        return;
                    else
                        for _, v357 in v96.Bone.MainBlick:GetDescendants() do
                            if v357:IsA("ParticleEmitter") then
                                local l_v357_Attribute_0 = v357:GetAttribute("EmitDelay");
                                if l_v357_Attribute_0 then
                                    task.delay(l_v357_Attribute_0, function() --[[ Line: 847 ]]
                                        -- upvalues: v357 (copy)
                                        v357:Emit(v357:GetAttribute("EmitCount"));
                                    end);
                                else
                                    v357:Emit(v357:GetAttribute("EmitCount"));
                                end;
                            end;
                        end;
                        local function v376(v359, v360, v361, v362, v363, v364, v365, v366, v367) --[[ Line: 856 ]] --[[ Name: CustomColorCorrectionFadeInOut ]]
                            local l_Lighting_1 = game:GetService("Lighting");
                            local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
                            l_ColorCorrectionEffect_0.Parent = l_Lighting_1;
                            local v370 = Color3.fromRGB(v359, v360, v361);
                            local v371 = Color3.fromRGB(255, 255, 255);
                            l_ColorCorrectionEffect_0.TintColor = v371;
                            l_ColorCorrectionEffect_0.Brightness = 0;
                            l_ColorCorrectionEffect_0.Contrast = 0;
                            l_ColorCorrectionEffect_0.Saturation = 0;
                            l_ColorCorrectionEffect_0.Enabled = true;
                            for v372 = 1, v367 do
                                local v373 = v372 / v367;
                                l_ColorCorrectionEffect_0.TintColor = v371:Lerp(v370, v373);
                                l_ColorCorrectionEffect_0.Brightness = v362 * v373;
                                l_ColorCorrectionEffect_0.Contrast = v363 * v373;
                                l_ColorCorrectionEffect_0.Saturation = v364 * v373;
                                task.wait(v366 / v367);
                            end;
                            task.wait(v365);
                            for v374 = 1, v367 do
                                local v375 = v374 / v367;
                                l_ColorCorrectionEffect_0.TintColor = v370:Lerp(v371, v375);
                                l_ColorCorrectionEffect_0.Brightness = v362 * (1 - v375);
                                l_ColorCorrectionEffect_0.Contrast = v363 * (1 - v375);
                                l_ColorCorrectionEffect_0.Saturation = v364 * (1 - v375);
                                task.wait(v366 / v367);
                            end;
                            l_ColorCorrectionEffect_0:Destroy();
                        end;
                        if v63 then
                            v376(255, 161, 99, 0.1, 2, 0, 1.4, 0.2, 20);
                            return;
                        end;
                    end;
                elseif v142 == 21 then
                    for _, v378 in (v110.Vfx.BeamWait:GetDescendants()) do
                        if v378:IsA("Beam") then
                            v378.Enabled = true;
                            task.delay(2.5, function() --[[ Line: 898 ]]
                                -- upvalues: v378 (copy)
                                v378.Enabled = false;
                            end);
                        end;
                    end;
                    v110.Vfx.Orb.Anchored = false;
                    v110.Vfx.Orb.CFrame = l_Character_0.UpperTorso.CFrame * CFrame.new(0, -4.25, 0);
                    v110.Vfx.Orb.WeldConstraint.Part1 = l_Character_0.UpperTorso;
                    for _, v380 in (v110.Vfx.Orb:GetDescendants()) do
                        if v380:IsA("ParticleEmitter") then
                            v380.Enabled = true;
                            task.delay(3, function() --[[ Line: 911 ]]
                                -- upvalues: v380 (copy)
                                v380.Enabled = false;
                            end);
                        end;
                    end;
                    return;
                elseif v142 == 22 then
                    for _, v382 in (v110.MeshVfx.MeshForWait.MeshUp1:GetChildren()) do
                        l_MeshEmitModule_0(v382.Start);
                    end;
                    for _, v384 in (v110.MeshVfx.MeshForWait.MeshUp2:GetChildren()) do
                        l_MeshEmitModule_0(v384.Start);
                    end;
                    for _, v386 in (v110.MeshVfx.MeshForWait.MeshDown1:GetChildren()) do
                        l_MeshEmitModule_0(v386.Start);
                    end;
                    return;
                elseif v142 == 23 then
                    return;
                elseif v142 == 24 then
                    local function v394(v387, v388, v389, v390, v391, v392) --[[ Line: 944 ]] --[[ Name: ColorCorrectionEffect ]]
                        local l_ColorCorrectionEffect_1 = Instance.new("ColorCorrectionEffect");
                        l_ColorCorrectionEffect_1.Saturation = v387;
                        l_ColorCorrectionEffect_1.Contrast = v388;
                        l_ColorCorrectionEffect_1.Parent = game:GetService("Lighting");
                        task.delay(v391, function() --[[ Line: 950 ]]
                            -- upvalues: l_ColorCorrectionEffect_1 (copy), v389 (copy), v390 (copy), v392 (copy)
                            l_ColorCorrectionEffect_1.Saturation = v389;
                            l_ColorCorrectionEffect_1.Contrast = v390;
                            task.wait(v392);
                            l_ColorCorrectionEffect_1:Destroy();
                        end);
                    end;
                    if v63 then
                        v394(-1, -3, -1, 3, 0.04, 0.05);
                    end;
                    for _, v396 in (v110.Vfx.ExplosionVfx.WindBeams:GetDescendants()) do
                        if v396:IsA("Beam") then
                            local l_Transparency_1 = v396.Transparency;
                            task.spawn(function() --[[ Line: 971 ]]
                                -- upvalues: v396 (copy), l_Transparency_1 (copy)
                                v396.Enabled = true;
                                for v398 = 1, 40 do
                                    local v399 = v398 / 40;
                                    local v400 = {};
                                    for _, v402 in l_Transparency_1.Keypoints do
                                        local v403 = 1 - v399 + v399 * v402.Value;
                                        table.insert(v400, NumberSequenceKeypoint.new(v402.Time, v403));
                                    end;
                                    v396.Transparency = NumberSequence.new(v400);
                                    task.wait(0.005);
                                end;
                                v396.Transparency = l_Transparency_1;
                                task.wait(0.5);
                                for v404 = 1, 40 do
                                    local v405 = v404 / 40;
                                    local v406 = {};
                                    for _, v408 in l_Transparency_1.Keypoints do
                                        local v409 = v408.Value + v405 * (1 - v408.Value);
                                        table.insert(v406, NumberSequenceKeypoint.new(v408.Time, v409));
                                    end;
                                    v396.Transparency = NumberSequence.new(v406);
                                    task.wait(0.005);
                                end;
                                v396.Enabled = false;
                                v396.Transparency = l_Transparency_1;
                            end);
                        end;
                    end;
                    return;
                elseif v142 == 25 then
                    for _, v411 in v110.Vfx.ExplosionVfx.VfxExp:GetDescendants() do
                        if v411:IsA("ParticleEmitter") then
                            local l_v411_Attribute_0 = v411:GetAttribute("EmitDelay");
                            if l_v411_Attribute_0 then
                                task.delay(l_v411_Attribute_0, function() --[[ Line: 1016 ]]
                                    -- upvalues: v411 (copy)
                                    v411:Emit(v411:GetAttribute("EmitCount"));
                                end);
                            else
                                v411:Emit(v411:GetAttribute("EmitCount"));
                            end;
                        end;
                    end;
                    for _, v414 in (v110.Vfx.ExplosionVfx.WindBeams:GetDescendants()) do
                        if v414:IsA("ParticleEmitter") then
                            v414.Enabled = true;
                            task.delay(0.7, function() --[[ Line: 1028 ]]
                                -- upvalues: v414 (copy)
                                v414.Enabled = false;
                            end);
                        end;
                    end;
                    task.delay(1, function() --[[ Line: 1034 ]]
                        -- upvalues: v97 (ref), v100 (ref), v101 (ref)
                        if v97 then
                            v97:AdjustSpeed(0);
                        end;
                        v100:AdjustSpeed(0);
                        v101:AdjustSpeed(0);
                    end);
                    return;
                elseif v142 == 26 then
                    for _, v416 in (v110.MeshVfx.Explosion:GetDescendants()) do
                        if v416.Name == "Start" then
                            l_MeshEmitModule_0(v416);
                        end;
                    end;
                    if not v63 then
                        v21.CreateImpactFrame({
                            Time = 0.1
                        });
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.3333333333333333, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            FieldOfView = 90
                        }):Play();
                        v21.CameraShake({
                            Preset = "SuperHardHit", 
                            WaitTime = 1, 
                            Fade = 2
                        });
                    end;
                    if not v87 then
                        return;
                    else
                        l_TweenService_0:Create(v87.ImageLabel, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                            ImageTransparency = 0.8
                        }):Play();
                        local v417 = l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                            ExposureCompensation = 5
                        });
                        v417:Play();
                        table.insert(v111, v417);
                    end;
                end;
                return;
            end;
        end;
    end);
    local _ = l_Lighting_0.ClockTime;
    if v63 then
        v104 = script.Map:Clone();
        v104.Parent = workspace.Debris;
        table.insert(v103, v104);
        v102[#v102 + 1] = v100:GetMarkerReachedSignal("Start"):Connect(function() --[[ Line: 1086 ]]
            -- upvalues: v91 (ref), v63 (copy), v21 (ref), l_Victim_0 (copy), l_Lighting_0 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (ref), l_ReplicatedStorage_0 (ref), v98 (ref), v104 (ref), l_Character_0 (copy), l_ColorCorrection_0 (copy)
            if v91 then
                return;
            elseif not v63 then
                v21.SetTransparency(l_Victim_0, 1);
                return;
            else
                local l_Brightness_0 = l_Lighting_0.Brightness;
                l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    ExposureCompensation = 0, 
                    Brightness = 0
                }):Play();
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.1666666666666667, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    FieldOfView = 17
                }):Play();
                local l_NumberSequenceTween_0 = require(l_ReplicatedStorage_0:WaitForChild("NumberSequenceTween"));
                for _, v422 in v98.SideWays3:GetChildren() do
                    if v422:IsA("Beam") then
                        l_NumberSequenceTween_0.Tween(v422, 0, 1);
                        task.defer(function() --[[ Line: 1109 ]]
                            -- upvalues: l_NumberSequenceTween_0 (copy), v422 (copy)
                            l_NumberSequenceTween_0.Tween(v422, 40, 0);
                        end);
                    end;
                end;
                v104:SetPrimaryPartCFrame(l_Character_0.PrimaryPart.CFrame);
                task.wait();
                l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(1.65, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    ExposureCompensation = 2.2, 
                    Brightness = l_Brightness_0
                }):Play();
                task.wait(1.6333333333333333);
                v21.CreateImpactFrame({
                    Time = 0.1
                });
                for _, v424 in v98.SideWays:GetChildren() do
                    if v424:IsA("Beam") then
                        v424.Enabled = false;
                    end;
                end;
                for _, v426 in v98.SideWays2:GetChildren() do
                    if v426:IsA("Beam") then
                        v426.Enabled = false;
                    end;
                end;
                for _, v428 in v98.SideWays3:GetChildren() do
                    if v428:IsA("Beam") then
                        v428.Enabled = false;
                    end;
                end;
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    FieldOfView = 30
                }):Play();
                v21.CameraShake({
                    Preset = "HardHitRoll", 
                    WaitTime = 0.3, 
                    Fade = 0.5
                });
                local l_l_ColorCorrection_0_0 = l_ColorCorrection_0;
                task.defer(function() --[[ Line: 48 ]]
                    -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrection_0_0 (copy), l_Lighting_0 (ref)
                    local v430 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_l_ColorCorrection_0_0, v430, {
                        Saturation = 0.15, 
                        Contrast = 0.15
                    }):Play();
                    local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                    l_MenuBlur_1.Size = 0;
                    l_MenuBlur_1.Enabled = true;
                    local v432 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_MenuBlur_1, v432, {
                        Size = 15
                    }):Play();
                end);
                return;
            end;
        end);
        v102[#v102 + 1] = v100:GetMarkerReachedSignal("DashEnd"):Connect(function() --[[ Line: 1181 ]]
            -- upvalues: v91 (ref), v63 (copy), v21 (ref), l_Victim_0 (copy), v138 (ref), v141 (ref), v105 (ref), v106 (ref), v104 (ref), l_ReplicatedStorage_0 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (ref)
            if v91 then
                return;
            elseif not v63 then
                v21.SetTransparency(l_Victim_0, 0);
                return;
            else
                if v138 then
                    v141 = CFrame.new(0, 0, -15);
                end;
                for _, v434 in v105 do
                    v434.LocalTransparencyModifier = 0;
                end;
                for _, v436 in v106 do
                    v436.Enabled = true;
                end;
                if v104 then
                    v104:Destroy();
                end;
                l_ReplicatedStorage_0.Events.RefreshMapLighting:Fire();
                l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    FieldOfView = v138 and 45 or 20
                }):Play();
                return;
            end;
        end);
        if v63 then
            v96 = script.CameraRig:Clone();
            v96.Name = l_Character_0.Name .. "Camera";
            v96.Parent = l_Debris_0;
            local v437 = l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 1.85, 0);
            v96:PivotTo(v437);
            v98 = script.Camera:Clone();
            v98.Parent = l_Debris_0;
            local v438 = {
                Animator = v96.AnimationController.Animator, 
                AnimId = v29.Animations.Camera
            };
            v97 = l_AnimHelper_0:CreateAnim(v438);
            v102[#v102 + 1] = v100:GetMarkerReachedSignal("RapidPunches"):Connect(function() --[[ Line: 1239 ]]
                -- upvalues: v91 (ref), v63 (copy), l_Victim_0 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (ref)
                if v91 then
                    return;
                elseif not v63 then
                    local v439 = {
                        "LeftLowerArm", 
                        "LeftUpperArm", 
                        "RightLowerArm", 
                        "RightUpperArm"
                    };
                    for _, v441 in l_Victim_0:GetDescendants() do
                        if v441:IsA("BasePart") and not table.find(v439, v441.Name) then
                            v441.LocalTransparencyModifier = v441.LocalTransparencyModifier + 1;
                        end;
                    end;
                    task.wait(2.1);
                    for _, v443 in l_Victim_0:GetDescendants() do
                        if v443:IsA("BasePart") and not table.find(v439, v443.Name) then
                            v443.LocalTransparencyModifier = v443.LocalTransparencyModifier - 1;
                        end;
                    end;
                    return;
                else
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2.683333333333333, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
                        FieldOfView = 25
                    }):Play();
                    return;
                end;
            end);
            v102[#v102 + 1] = v100:GetMarkerReachedSignal("Punches"):Connect(function() --[[ Line: 1266 ]]
                -- upvalues: v91 (ref), v100 (ref), v97 (ref), v101 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (ref), v21 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
                if v91 then
                    return;
                else
                    v100.TimePosition = v97.TimePosition;
                    v101.TimePosition = v97.TimePosition;
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.08333333333333333, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
                        FieldOfView = 24
                    }):Play();
                    task.spawn(function() --[[ Line: 1276 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.1, 
                            Fade = 1
                        });
                    end);
                    task.wait(0.2);
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.08333333333333333, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
                        FieldOfView = 28
                    }):Play();
                    task.spawn(function() --[[ Line: 1290 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.3, 
                            Fade = 1
                        });
                    end);
                    task.wait(0.7333333333333333);
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.3333333333333333, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
                        FieldOfView = 27
                    }):Play();
                    v21.CameraShake({
                        Preset = "MedHit", 
                        WaitTime = 0.3, 
                        Fade = 1
                    });
                    local l_l_ColorCorrection_0_1 = l_ColorCorrection_0;
                    task.defer(function() --[[ Line: 48 ]]
                        -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrection_0_1 (copy), l_Lighting_0 (ref)
                        local v445 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_l_ColorCorrection_0_1, v445, {
                            Saturation = 0.15, 
                            Contrast = 0.15
                        }):Play();
                        local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_2.Size = 0;
                        l_MenuBlur_2.Enabled = true;
                        local v447 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_2, v447, {
                            Size = 15
                        }):Play();
                    end);
                    task.wait(1.1666666666666667);
                    task.spawn(function() --[[ Line: 1314 ]]
                        -- upvalues: v21 (ref)
                        v21.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.3, 
                            Fade = 1
                        });
                    end);
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        FieldOfView = 50
                    }):Play();
                    return;
                end;
            end);
            v437 = script.Plush:Clone();
            v437.Anchored = true;
            v437.CFrame = CFrame.new(0, -100, 0);
            v437.Parent = game.Workspace.Debris;
            local v448 = false;
            v102[#v102 + 1] = v100:GetMarkerReachedSignal("Air"):Connect(function() --[[ Line: 1334 ]]
                -- upvalues: v91 (ref), v448 (ref), v437 (copy), l_Character_0 (copy), v138 (ref), l_ReplicatedStorage_0 (ref), v98 (ref), l_Lighting_0 (ref), l_CurrentCamera_0 (ref), l_TweenService_0 (ref)
                if v91 then
                    return;
                else
                    task.delay(1.1333333333333333, function() --[[ Line: 1337 ]]
                        -- upvalues: v448 (ref), v437 (ref), l_Character_0 (ref), v138 (ref), l_ReplicatedStorage_0 (ref)
                        if v448 then
                            return;
                        else
                            v437.Anchored = false;
                            v437.Transparency = 0;
                            local l_Weld_0 = Instance.new("Weld");
                            l_Weld_0.Parent = v437;
                            l_Weld_0.Part0 = v437;
                            l_Weld_0.Part1 = l_Character_0.UpperTorso;
                            l_Weld_0.C0 = CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -0.2, 0);
                            task.wait(0.16666666666666666);
                            if v138 then
                                l_ReplicatedStorage_0.Events.RefreshMapLighting:Fire();
                            end;
                            task.wait(3);
                            if v437 then
                                v437:Destroy();
                            end;
                            return;
                        end;
                    end);
                    for _, v451 in v98.SideWays:GetChildren() do
                        if v451:IsA("Beam") then
                            v451.Enabled = true;
                        end;
                    end;
                    for _, v453 in v98.SideWays2:GetChildren() do
                        if v453:IsA("Beam") then
                            v453.Enabled = true;
                        end;
                    end;
                    for _, v455 in v98.SideWays3:GetChildren() do
                        if v455:IsA("Beam") then
                            v455.Enabled = true;
                        end;
                    end;
                    local l_DepthOfField_0 = l_Lighting_0.DepthOfField;
                    l_DepthOfField_0.InFocusRadius = l_DepthOfField_0.InFocusRadius * 5;
                    l_CurrentCamera_0.FieldOfView = 20;
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.4166666666666667, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                        FieldOfView = 25
                    }):Play();
                    return;
                end;
            end);
            v102[#v102 + 1] = v100:GetMarkerReachedSignal("Falling"):Connect(function() --[[ Line: 1390 ]]
                -- upvalues: v91 (ref), v448 (ref), v21 (ref), l_Character_0 (copy), v437 (copy), l_Lighting_0 (ref), l_CurrentCamera_0 (ref), l_TweenService_0 (ref)
                if v91 then
                    return;
                else
                    v448 = true;
                    task.wait();
                    v21.SetTransparency(l_Character_0, 0);
                    if v437 then
                        v437:Destroy();
                    end;
                    local l_DepthOfField_1 = l_Lighting_0.DepthOfField;
                    l_DepthOfField_1.InFocusRadius = l_DepthOfField_1.InFocusRadius / 5;
                    l_CurrentCamera_0.FieldOfView = 20;
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.4166666666666667, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                        FieldOfView = 120
                    }):Play();
                    return;
                end;
            end);
            v102[#v102 + 1] = v100:GetMarkerReachedSignal("Explosion"):Connect(function() --[[ Line: 1408 ]]
                -- upvalues: v91 (ref), v98 (ref), v21 (ref), l_CurrentCamera_0 (ref), l_TweenService_0 (ref), l_ColorCorrection_0 (copy), l_Lighting_0 (ref)
                if v91 then
                    return;
                else
                    for _, v459 in v98.SideWays:GetChildren() do
                        if v459:IsA("Beam") then
                            v459.Enabled = true;
                        end;
                    end;
                    for _, v461 in v98.SideWays2:GetChildren() do
                        if v461:IsA("Beam") then
                            v461.Enabled = false;
                        end;
                    end;
                    for _, v463 in v98.SideWays3:GetChildren() do
                        if v463:IsA("Beam") then
                            v463.Enabled = false;
                        end;
                    end;
                    v21.CreateImpactFrame({
                        Time = 0.1
                    });
                    l_CurrentCamera_0.FieldOfView = 20;
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.3333333333333333, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        FieldOfView = 90
                    }):Play();
                    v21.CameraShake({
                        Preset = "SuperHardHit", 
                        WaitTime = 2, 
                        Fade = 4
                    });
                    local l_l_ColorCorrection_0_2 = l_ColorCorrection_0;
                    task.defer(function() --[[ Line: 48 ]]
                        -- upvalues: l_TweenService_0 (ref), l_l_ColorCorrection_0_2 (copy), l_Lighting_0 (ref)
                        local v465 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_l_ColorCorrection_0_2, v465, {
                            Saturation = 0.15, 
                            Contrast = 0.15
                        }):Play();
                        local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_3.Size = 0;
                        l_MenuBlur_3.Enabled = true;
                        local v467 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_3, v467, {
                            Size = 15
                        }):Play();
                    end);
                    return;
                end;
            end);
            local v468 = 0;
            l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 1448 ]]
                -- upvalues: l_CurrentCamera_0 (ref), v96 (ref), v141 (ref), v98 (ref), v468 (ref), l_Character_0 (copy), l_Victim_0 (copy), v58 (copy)
                l_CurrentCamera_0.CFrame = v96.Bone.CFrame * v141;
                if v98 then
                    v98.CFrame = l_CurrentCamera_0.CFrame;
                end;
                v468 = v468 + 1;
                if not l_Character_0 or not l_Character_0.PrimaryPart then
                    return;
                elseif not l_Victim_0 or not l_Victim_0.PrimaryPart then
                    return;
                else
                    l_Victim_0.PrimaryPart.Anchored = true;
                    l_Character_0.PrimaryPart.Anchored = true;
                    l_Character_0:PivotTo(v58.StartCFrame_Offset);
                    l_Victim_0:PivotTo(v58.VictimCFrame_Offset);
                    v96:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 1.85, 0));
                    return;
                end;
            end);
            task.delay(v58.Time - 0.55 - 0.5, function() --[[ Line: 1472 ]]
                -- upvalues: v91 (ref), l_TweenService_0 (ref), l_Main_0 (ref), v95 (copy)
                if v91 then
                    return;
                else
                    l_TweenService_0:Create(l_Main_0.White, v95, {
                        BackgroundTransparency = 0
                    }):Play();
                    return;
                end;
            end);
            task.wait(v58.Time - 0.5);
            if v91 then
                return;
            else
                local v470 = false;
                (function() --[[ Line: 1482 ]] --[[ Name: ResetPosition ]]
                    -- upvalues: v470 (ref), l_Character_0 (copy), v58 (copy), l_Victim_0 (copy), v21 (ref)
                    if v470 then
                        return;
                    else
                        v470 = true;
                        l_Character_0:SetPrimaryPartCFrame(v58.StartCFrame * CFrame.Angles(0, 0, 0));
                        l_Victim_0:SetPrimaryPartCFrame(v58.StartCFrame * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5));
                        task.delay(0.016666666666666666, function() --[[ Line: 1489 ]]
                            -- upvalues: l_Character_0 (ref), l_Victim_0 (ref), v21 (ref)
                            for _, v472 in {
                                l_Character_0, 
                                l_Victim_0, 
                                v21.GetWeldCharacter(l_Character_0), 
                                v21.GetWeldCharacter(l_Victim_0)
                            } do
                                for _, v474 in v472:GetDescendants() do
                                    if v474:IsA("BasePart") then
                                        local l_v474_Attribute_0 = v474:GetAttribute("PreviousCollisionGroup");
                                        if l_v474_Attribute_0 then
                                            v474.CollisionGroup = l_v474_Attribute_0;
                                            v474:SetAttribute("PreviousCollisionGroup", nil);
                                        end;
                                    end;
                                end;
                            end;
                        end);
                        return;
                    end;
                end)();
                v127();
                if v91 then
                    return;
                else
                    v21.CameraShake({
                        Preset = "HardHit", 
                        WaitTime = 0.2, 
                        Fade = 1
                    });
                    v21.HUDShake({
                        Scale = 20, 
                        Damper = 0.07777777777777778
                    });
                    l_TweenService_0:Create(l_Main_0.UltimateFrame.Vignette, v92, {
                        ImageTransparency = 1
                    }):Play();
                    --[[ close >= 53 ]]
                end;
            end;
        end;
    end;
end;
return v29;