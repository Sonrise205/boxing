local v0 = false;
local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local _ = game:GetService("ReplicatedFirst");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("CollectionService");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0:WaitForChild("AlignHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local _ = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("UIHelper"));
local _ = require(l_Modules_0:WaitForChild("Styles"));
local _ = require(l_Modules_0:WaitForChild("Emotes"));
local l_BubbleModule_0 = require(l_ReplicatedStorage_0:WaitForChild("BubbleModule"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("Bezier"));
local _ = require(l_Modules_0:WaitForChild("RayHelper"));
local _ = l_ReplicatedStorage_0:WaitForChild("Assets");
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
local _ = require(l_ReplicatedStorage_0:WaitForChild("NumberSequenceTween"));
local _ = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules", 10):WaitForChild("EmoteHelper", 10));
local l_RemoteEvents_0 = l_ReplicatedStorage_0:WaitForChild("RemoteEvents");
local _ = l_RemoteEvents_0:WaitForChild("SimulateKnockbackBE");
local _ = l_RemoteEvents_0:WaitForChild("SetAngleBE");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local l_Common_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local _ = Random.new();
local function _(v33, v34, v35) --[[ Line: 43 ]] --[[ Name: Lerp ]]
    return v33 + (v34 - v33) * v35;
end;
local v37 = l_ReplicatedStorage_0:WaitForChild("NPCs", 10);
local l_Transitions_0 = require(l_Modules_0:WaitForChild("Transitions"));
local v39 = require(script.Parent);
local v40;
if game:GetService("RunService"):IsClient() then
    v40 = shared.BridgeNet2;
    if not v40 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v40 = shared.BridgeNet2;
        v0 = v40;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v40 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local v41 = v40.ReferenceBridge("StartNPCFight");
local _ = require(script.Parent:WaitForChild("Entrances"));
local l_ExposureCompensation_0 = l_Lighting_0.ExposureCompensation;
local v44 = l_Lighting_0:WaitForChild("Skybox", 20);
local v45 = l_Lighting_0:WaitForChild("DefaultAtmosphere", 20);
local v46 = l_ServerStorage_0:WaitForChild("LightingStorage", 20);
local v47 = {
    Ambient = l_Lighting_0.Ambient, 
    Brightness = l_Lighting_0.Brightness, 
    ColorShift_Bottom = l_Lighting_0.ColorShift_Bottom, 
    ColorShift_Top = l_Lighting_0.ColorShift_Top, 
    EnvironmentDiffuseScale = l_Lighting_0.EnvironmentDiffuseScale, 
    EnvironmentSpecularScale = l_Lighting_0.EnvironmentSpecularScale, 
    OutdoorAmbient = l_Lighting_0.OutdoorAmbient, 
    ShadowSoftness = l_Lighting_0.ShadowSoftness, 
    ClockTime = l_Lighting_0.ClockTime, 
    GeographicLatitude = l_Lighting_0.GeographicLatitude, 
    ExposureCompensation = l_ExposureCompensation_0
};
local v48 = {};
task.spawn(function() --[[ Line: 81 ]]
    -- upvalues: l_ContentProvider_0 (copy)
    l_ContentProvider_0:PreloadAsync({
        script
    });
end);
local v49 = {};
RemoveSceneLighting = function() --[[ Line: 87 ]] --[[ Name: RemoveSceneLighting ]]
    -- upvalues: l_RunService_0 (copy), l_ExposureCompensation_0 (copy), l_Workspace_0 (copy), v48 (ref), l_Lighting_0 (copy)
    l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
    for _, v51 in workspace:GetChildren() do
        if string.find(v51.Name, "Scene_") then
            v51:Destroy();
        end;
    end;
    workspace.Exposure.Value = l_ExposureCompensation_0;
    l_Workspace_0.InFocusRadius.Value = 0;
    l_Workspace_0.FoVMult.Value = 0;
    for _, v53 in v48 do
        v53.Enabled = true;
    end;
    v48 = {};
    for _, v55 in l_Lighting_0:GetChildren() do
        if v55.Name == "MapRemove" or v55.Name == "SkyRemove" then
            v55:Destroy();
        end;
    end;
end;
v49.CreateScene = function(v56, v57) --[[ Line: 112 ]] --[[ Name: CreateScene ]]
    -- upvalues: l_Transitions_0 (copy), l_Common_0 (copy), l_Lighting_0 (copy), l_ExposureCompensation_0 (copy), v44 (copy), v46 (copy), v45 (copy), v48 (ref), l_Workspace_0 (copy)
    local v58 = {
        FadeTime = 3, 
        HoldTime = 2.5, 
        StartFade = 1, 
        IgnoreSound = true, 
        ZIndex = 0
    };
    if v57 then
        v58 = {
            FadeTime = 0, 
            HoldTime = 0, 
            StartFade = 0, 
            IgnoreSound = true, 
            ZIndex = 0
        };
    end;
    task.spawn(function() --[[ Line: 132 ]]
        -- upvalues: l_Transitions_0 (ref), v58 (ref)
        l_Transitions_0.FadeTransition(v58);
    end);
    task.wait(v58.StartFade);
    l_Common_0.QuestNPC.Cinematic.Top.Visible = true;
    l_Common_0.QuestNPC.Cinematic.Bottom.Visible = true;
    l_Common_0.QuestNPC.Cinematic.Vignette.Visible = true;
    RemoveSceneLighting();
    local l_script_FirstChild_0 = script:FindFirstChild(v56);
    if not l_script_FirstChild_0 then
        return;
    else
        l_script_FirstChild_0 = l_script_FirstChild_0:Clone();
        l_script_FirstChild_0.Parent = workspace;
        l_script_FirstChild_0.Name = "Scene_" .. l_script_FirstChild_0.Name;
        local l_Lighting_1 = l_script_FirstChild_0:FindFirstChild("Lighting");
        local v61 = l_Lighting_1 and l_Lighting_1:FindFirstChild("Settings");
        if v61 then
            local v62 = require(v61);
            local v63 = v62.Lighting or {};
            for v64, v65 in v63 do
                l_Lighting_0[v64] = v65;
            end;
            workspace.Exposure.Value = l_Lighting_0.ExposureCompensation or l_ExposureCompensation_0;
            if v62.FocusRadius then
                workspace.InFocusRadius.Value = v62.FocusRadius;
            end;
        end;
        if l_Lighting_1 then
            local l_Skybox_0 = l_Lighting_1:FindFirstChild("Skybox");
            if l_Skybox_0 then
                l_Skybox_0 = l_Skybox_0:Clone();
                l_Skybox_0.Name = "SkyRemove";
                pcall(function() --[[ Line: 175 ]]
                    -- upvalues: v44 (ref), v46 (ref)
                    v44.Parent = v46;
                end);
                l_Skybox_0.Parent = l_Lighting_0;
            end;
            local l_DefaultAtmosphere_0 = l_Lighting_1:FindFirstChild("DefaultAtmosphere");
            do
                local l_l_DefaultAtmosphere_0_0 = l_DefaultAtmosphere_0;
                if l_l_DefaultAtmosphere_0_0 then
                    l_l_DefaultAtmosphere_0_0 = l_l_DefaultAtmosphere_0_0:Clone();
                    l_l_DefaultAtmosphere_0_0.Name = "SkyRemove";
                    task.delay(0.1, function() --[[ Line: 184 ]]
                        -- upvalues: l_l_DefaultAtmosphere_0_0 (ref), l_Lighting_0 (ref)
                        l_l_DefaultAtmosphere_0_0.Parent = l_Lighting_0;
                    end);
                    pcall(function() --[[ Line: 188 ]]
                        -- upvalues: v45 (ref), v46 (ref)
                        v45.Parent = v46;
                    end);
                end;
                for _, v70 in l_Lighting_1:GetChildren() do
                    if v70:IsA("ModuleScript") or v70:IsA("Atmosphere") or v70:IsA("Sky") then
                        --[[ close >= 12 ]]
                    else
                        v70 = v70:Clone();
                        local l_l_Lighting_0_FirstChild_0 = l_Lighting_0:FindFirstChild(v70.Name);
                        if l_l_Lighting_0_FirstChild_0 then
                            l_l_Lighting_0_FirstChild_0.Enabled = false;
                            table.insert(v48, l_l_Lighting_0_FirstChild_0);
                        end;
                        v70.Name = "MapRemove";
                        v70.Parent = l_Lighting_0;
                        do
                            local l_v70_0 = v70;
                            task.delay(1, function() --[[ Line: 204 ]]
                                -- upvalues: l_v70_0 (ref)
                                if l_v70_0 then
                                    l_v70_0.Enabled = true;
                                end;
                            end);
                        end;
                    end;
                end;
            end;
        end;
        l_Workspace_0.FoVMult.Value = 0;
        local l_Use_0 = l_script_FirstChild_0:FindFirstChild("Use");
        if l_Use_0 then
            require(l_Use_0).Use();
        end;
        return;
    end;
end;
v49.ResetScenes = function(v74) --[[ Line: 218 ]] --[[ Name: ResetScenes ]]
    -- upvalues: l_Transitions_0 (copy), l_Common_0 (copy), l_Workspace_0 (copy), v47 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), v46 (copy)
    local v75 = {
        FadeTime = 3, 
        HoldTime = 1.5, 
        StartFade = 1.5, 
        IgnoreSound = true, 
        ZIndex = 0
    };
    if v74 then
        v75 = {
            FadeTime = 0, 
            HoldTime = 0, 
            StartFade = 0, 
            IgnoreSound = true, 
            ZIndex = 0
        };
    end;
    task.spawn(function() --[[ Line: 237 ]]
        -- upvalues: l_Transitions_0 (ref), v75 (ref)
        l_Transitions_0.FadeTransition(v75);
    end);
    task.wait(v75.StartFade);
    l_Common_0.QuestNPC.Cinematic.Top.Visible = false;
    l_Common_0.QuestNPC.Cinematic.Bottom.Visible = false;
    l_Common_0.QuestNPC.Cinematic.Vignette.Visible = false;
    RemoveSceneLighting();
    l_Workspace_0.FoVMult.Value = 2;
    workspace.CurrentCamera.FieldOfView = 60;
    local v76 = false;
    for _, v78 in workspace:GetChildren() do
        if string.find(v78.Name, "m_") then
            v76 = true;
            break;
        end;
    end;
    if v76 then
        return;
    else
        for v79, v80 in v47 do
            l_Lighting_0[v79] = v80;
        end;
        l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0), {
            Ambient = v47.Ambient, 
            Brightness = v47.Brightness, 
            ColorShift_Bottom = v47.ColorShift_Bottom, 
            ColorShift_Top = v47.ColorShift_Top, 
            EnvironmentDiffuseScale = v47.EnvironmentDiffuseScale, 
            EnvironmentSpecularScale = v47.EnvironmentSpecularScale, 
            OutdoorAmbient = v47.OutdoorAmbient, 
            ShadowSoftness = v47.ShadowSoftness, 
            ClockTime = v47.ClockTime, 
            GeographicLatitude = v47.GeographicLatitude, 
            ExposureCompensation = v47.ExposureCompensation
        }):Play();
        local l_DefaultAtmosphere_1 = v46:FindFirstChild("DefaultAtmosphere");
        if l_DefaultAtmosphere_1 then
            local l_DefaultAtmosphere_2 = l_Lighting_0:FindFirstChild("DefaultAtmosphere");
            if l_DefaultAtmosphere_2 then
                l_DefaultAtmosphere_2:Destroy();
            end;
            task.delay(0.1, function() --[[ Line: 290 ]]
                -- upvalues: l_DefaultAtmosphere_1 (copy), l_Lighting_0 (ref), l_Workspace_0 (ref)
                l_DefaultAtmosphere_1.Parent = l_Lighting_0;
                l_Workspace_0.FoVMult.Value = 1;
            end);
        end;
        local l_Skybox_1 = v46:FindFirstChild("Skybox");
        if l_Skybox_1 then
            local l_Skybox_2 = l_Lighting_0:FindFirstChild("Skybox");
            if l_Skybox_2 then
                l_Skybox_2:Destroy();
            end;
            task.defer(function() --[[ Line: 301 ]]
                -- upvalues: l_Skybox_1 (copy), l_Lighting_0 (ref)
                l_Skybox_1.Parent = l_Lighting_0;
            end);
        end;
        return;
    end;
end;
v49.CreateFightFrame = function(v85) --[[ Line: 307 ]] --[[ Name: CreateFightFrame ]]
    -- upvalues: l_LocalPlayer_0 (copy), v37 (copy), l_Workspace_0 (copy), v41 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = v37:FindFirstChild(v85);
    local v88 = l_Workspace_0.States[l_Character_0.Name];
    local _ = v88.CharacterData;
    local l_PlayerData_0 = v88.PlayerData;
    local v91 = v37[v85];
    workspace.Settings.PerformanceMode.Value = false;
    l_PlayerData_0.Map.Value = v91.PlayerData.Map.Value;
    v41:Fire(v85);
end;
v49.CreateVoidFrame = function(v92) --[[ Line: 323 ]] --[[ Name: CreateVoidFrame ]]
    -- upvalues: l_Common_0 (copy), l_TweenService_0 (copy), v49 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_0.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Visible = true;
    l_Frame_0.Parent = l_Common_0;
    l_Common_0.Enabled = true;
    local v94 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    l_TweenService_0:Create(l_Frame_0, v94, {
        BackgroundTransparency = 0
    }):Play();
    task.wait(0.5);
    v49.CreateFightFrame(v92);
    task.wait(0.5);
    l_TweenService_0:Create(l_Frame_0, v94, {
        BackgroundTransparency = 1
    }):Play();
    task.wait(0.5);
    l_Frame_0:Destroy();
end;
v49.EventStartFight = function(v95) --[[ Line: 347 ]] --[[ Name: EventStartFight ]]
    -- upvalues: l_Workspace_0 (copy), l_RunService_0 (copy), l_Lighting_0 (copy), l_BubbleModule_0 (copy), v39 (copy), l_TweenService_0 (copy), l_Transitions_0 (copy), v49 (copy)
    local l_NPC_0 = v95.NPC;
    local l_Fight_0 = v95.Fight;
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    local v99 = script.EventStartFightParticles:Clone();
    v99.Parent = l_Workspace_0.Debris;
    local v100 = nil;
    v100 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 356 ]]
        -- upvalues: v99 (copy), l_CurrentCamera_0 (copy)
        v99.CFrame = l_CurrentCamera_0.CFrame * CFrame.new(0, 0, -2.8);
    end);
    task.delay(0.1, function() --[[ Line: 360 ]]
        -- upvalues: v99 (copy)
        for _, v102 in v99.Vortex:GetChildren() do
            v102:Emit(v102:GetAttribute("EmitCount"));
        end;
        for _, v104 in v99.Current:GetChildren() do
            v104.Enabled = true;
        end;
    end);
    local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
    l_ColorCorrectionEffect_0.Brightness = 0;
    l_ColorCorrectionEffect_0.Contrast = 0;
    l_ColorCorrectionEffect_0.Saturation = 0;
    l_ColorCorrectionEffect_0.Parent = l_Lighting_0;
    if l_NPC_0 then
        task.defer(function() --[[ Line: 377 ]]
            -- upvalues: l_BubbleModule_0 (ref), l_NPC_0 (copy)
            for _ = 1, 3 do
                l_BubbleModule_0.CreateBubble(l_NPC_0.PrimaryPart.CFrame, Vector3.new(5, 5, 5, 0), 0.6, Vector3.new(55, 55, 55, 0), 0.5);
                task.wait(0.15);
            end;
        end);
    end;
    task.defer(function() --[[ Line: 385 ]]
        -- upvalues: v39 (ref)
        v39.CameraShake({
            Preset = "SuperHardHit", 
            WaitTime = 0.3, 
            Fade = 0.8
        });
    end);
    l_Workspace_0.FoVMult.Value = 2;
    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        FieldOfView = 70
    }):Play();
    l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Brightness = 0, 
        Contrast = 2, 
        Saturation = -1
    }):Play();
    task.wait(0.3);
    l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Brightness = 0, 
        Contrast = 0.2, 
        Saturation = -0.8
    }):Play();
    local v107 = {
        FadeTime = 1.5, 
        HoldTime = 2, 
        IgnoreSound = true
    };
    task.spawn(function() --[[ Line: 421 ]]
        -- upvalues: l_Transitions_0 (ref), v107 (copy)
        l_Transitions_0.FadeTransition(v107);
    end);
    task.delay(v107.FadeTime, function() --[[ Line: 425 ]]
        -- upvalues: v49 (ref), l_Fight_0 (copy)
        v49.CreateFightFrame(l_Fight_0);
    end);
    l_Workspace_0.FoVMult.Value = 0.5;
    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        FieldOfView = 65
    }):Play();
    l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Brightness = 0, 
        Contrast = 0, 
        Saturation = 0
    }):Play();
    for _, v109 in v99.Current:GetChildren() do
        v109.Enabled = false;
    end;
    task.wait(1);
    l_Workspace_0.FoVMult.Value = 3;
    task.wait(4);
    v100:Disconnect();
    l_ColorCorrectionEffect_0:Destroy();
    v99:Destroy();
end;
return v49;