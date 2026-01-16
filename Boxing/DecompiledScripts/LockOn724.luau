local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_Workspace_0 = game:GetService("Workspace");
local l_StarterGui_0 = game:GetService("StarterGui");
local __ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local l_FoVMult_0 = l_Workspace_0:WaitForChild("FoVMult");
local v12 = 70;
local v13 = l_Workspace_0:WaitForChild("States"):WaitForChild(l_LocalPlayer_0.Name);
local l_CharacterData_0 = v13:WaitForChild("CharacterData");
local __ = v13:WaitForChild("PlayerData");
local l_Occupied_0 = v13:WaitForChild("Occupied");
local l_Cutscene_0 = l_CharacterData_0:WaitForChild("Cutscene");
local l_LockedOn_0 = l_Occupied_0:WaitForChild("LockedOn");
local __ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common", 10);
local v20 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main", 10);
local l_Parent_0 = script.Parent;
local l_PrimaryPart_0 = l_Parent_0.PrimaryPart;
local v23 = nil;
local v24 = nil;
local v25 = -0.5;
local v26 = {
    3, 
    30
};
local v27 = {
    Vector3.new(7, 4.5, 4, 0), 
    (Vector3.new(3, 5, 9, 0))
};
local v28 = {
    Vector3.new(-1.5, -1.2000000476837158, 0, 0), 
    (Vector3.new(0, -2, 0, 0))
};
local v29 = 0.16;
local v30 = RaycastParams.new();
v30.FilterDescendantsInstances = l_CollectionService_0:GetTagged("InvisTarget");
v30.FilterType = Enum.RaycastFilterType.Include;
v30.IgnoreWater = true;
l_Workspace_0.ChildAdded:Connect(function(v31) --[[ Line: 58 ]]
    -- upvalues: v30 (copy), l_CollectionService_0 (copy)
    if not string.find(v31.Name, "m_") then
        return;
    else
        v30.FilterDescendantsInstances = l_CollectionService_0:GetTagged("InvisTarget");
        return;
    end;
end);
l_LockedOn_0.Changed:Connect(function(v32) --[[ Line: 63 ]]
    -- upvalues: l_CurrentCamera_0 (copy), l_StarterGui_0 (copy)
    l_CurrentCamera_0.CameraType = v32 and Enum.CameraType.Scriptable or Enum.CameraType.Custom;
    if v32 then
        l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
        return;
    else
        l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
        return;
    end;
end);
local function __(v33, v34, v35) --[[ Line: 73 ]] --[[ Name: Lerp ]]
    return v33 + (v34 - v33) * v35;
end;
local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
local l_CameraTarget_0 = l_CameraSettings_0:WaitForChild("CameraTarget");
local l_CameraMode_0 = l_CameraSettings_0:WaitForChild("CameraMode");
local l_Variant_0 = l_CameraSettings_0:WaitForChild("Variant");
local v41 = "";
local v42 = 0;
local v43 = 20;
local l_v43_0 = v43;
l_ReplicatedStorage_0:WaitForChild("RemoteEvents"):WaitForChild("SetAngleBE").Event:Connect(function(v45) --[[ Line: 91 ]]
    -- upvalues: v42 (ref)
    v42 = v45;
end);
local l_DepthOfField_0 = l_Lighting_0:WaitForChild("DepthOfField");
local l_InFocusRadius_0 = l_DepthOfField_0.InFocusRadius;
local l_FarIntensity_0 = l_DepthOfField_0.FarIntensity;
local v49 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
GetFocusRadius = function() --[[ Line: 102 ]] --[[ Name: GetFocusRadius ]]
    -- upvalues: l_Workspace_0 (copy), l_InFocusRadius_0 (copy)
    return l_Workspace_0.InFocusRadius.Value > 0 and l_Workspace_0.InFocusRadius.Value or l_InFocusRadius_0;
end;
l_Workspace_0.InFocusRadius.Changed:Connect(function() --[[ Line: 106 ]]
    -- upvalues: l_DepthOfField_0 (copy), l_TweenService_0 (copy), v49 (copy)
    if l_DepthOfField_0.Enabled then
        l_TweenService_0:Create(l_DepthOfField_0, v49, {
            InFocusRadius = GetFocusRadius()
        }):Play();
    end;
end);
l_LockedOn_0.Changed:Connect(function(v50) --[[ Line: 112 ]]
    -- upvalues: l_DepthOfField_0 (copy), l_TweenService_0 (copy), v49 (copy), l_Occupied_0 (copy)
    if v50 then
        l_DepthOfField_0.Enabled = true;
        l_TweenService_0:Create(l_DepthOfField_0, v49, {
            InFocusRadius = GetFocusRadius()
        }):Play();
        return;
    else
        l_TweenService_0:Create(l_DepthOfField_0, v49, {
            InFocusRadius = 500
        }):Play();
        task.delay(2, function() --[[ Line: 118 ]]
            -- upvalues: v50 (copy), l_Occupied_0 (ref), l_DepthOfField_0 (ref)
            if v50 == l_Occupied_0.Equipped.Value then
                l_DepthOfField_0.Enabled = false;
            end;
        end);
        return;
    end;
end);
l_Cutscene_0.Changed:Connect(function(__) --[[ Line: 126 ]]
    -- upvalues: l_Cutscene_0 (copy), l_DepthOfField_0 (copy), l_TweenService_0 (copy), v49 (copy), l_LockedOn_0 (copy), l_FarIntensity_0 (copy)
    if l_Cutscene_0.Value then
        l_DepthOfField_0.Enabled = true;
        l_TweenService_0:Create(l_DepthOfField_0, v49, {
            InFocusRadius = 15, 
            FarIntensity = 0.8
        }):Play();
        return;
    else
        l_TweenService_0:Create(l_DepthOfField_0, v49, {
            InFocusRadius = l_LockedOn_0.Value and GetFocusRadius() or 500, 
            FarIntensity = l_FarIntensity_0
        }):Play();
        workspace:SetAttribute("LastCutsceneEnded", tick());
        return;
    end;
end);
local l_RunService_1 = game:GetService("RunService");
local l_CurrentCamera_1 = workspace.CurrentCamera;
local l_TweenService_1 = game:GetService("TweenService");
local function v56(v55) --[[ Line: 162 ]] --[[ Name: getJitter ]]
    return CFrame.new(math.random(-1, 1) * v55, math.random(-1, 1) * v55, math.random(-1, 1) * v55);
end;
local v89 = {
    SideRight = function(v57, v58, v59) --[[ Line: 174 ]]
        -- upvalues: v56 (copy), l_CurrentCamera_1 (copy)
        local v60 = (v57.Position + v58.Position) * 0.5;
        local v61 = CFrame.lookAt(v60 + Vector3.new(8, 2.5, 0, 0), v60) * v56(0.03);
        l_CurrentCamera_1.CFrame = l_CurrentCamera_1.CFrame:Lerp(v61, v59 * 3);
        local l_l_CurrentCamera_1_0 = l_CurrentCamera_1;
        local l_FieldOfView_0 = l_CurrentCamera_1.FieldOfView;
        local v64 = v59 * 2;
        l_l_CurrentCamera_1_0.FieldOfView = l_FieldOfView_0 + (70 - l_FieldOfView_0) * v64;
    end, 
    SideLeft = function(v65, v66, v67) --[[ Line: 183 ]]
        -- upvalues: v56 (copy), l_CurrentCamera_1 (copy)
        local v68 = (v65.Position + v66.Position) * 0.5;
        local v69 = CFrame.lookAt(v68 + Vector3.new(-8, 2.5, 0, 0), v68) * v56(0.03);
        l_CurrentCamera_1.CFrame = l_CurrentCamera_1.CFrame:Lerp(v69, v67 * 3);
        local l_l_CurrentCamera_1_1 = l_CurrentCamera_1;
        local l_FieldOfView_1 = l_CurrentCamera_1.FieldOfView;
        local v72 = v67 * 2;
        l_l_CurrentCamera_1_1.FieldOfView = l_FieldOfView_1 + (70 - l_FieldOfView_1) * v72;
    end, 
    BehindPlayer = function(v73, v74, v75) --[[ Line: 192 ]]
        -- upvalues: v56 (copy), l_CurrentCamera_1 (copy)
        local v76 = (v73.Position + v74.Position) * 0.5;
        local v77 = CFrame.lookAt(v73.Position + Vector3.new(0, 2, -6, 0), v76) * v56(0.05);
        l_CurrentCamera_1.CFrame = l_CurrentCamera_1.CFrame:Lerp(v77, v75 * 3);
        local l_l_CurrentCamera_1_2 = l_CurrentCamera_1;
        local l_FieldOfView_2 = l_CurrentCamera_1.FieldOfView;
        local v80 = v75 * 2;
        l_l_CurrentCamera_1_2.FieldOfView = l_FieldOfView_2 + (75 - l_FieldOfView_2) * v80;
    end, 
    SideHigh = function(v81, v82, v83) --[[ Line: 201 ]]
        -- upvalues: l_CurrentCamera_1 (copy)
        local v84 = (v81.Position + v82.Position) * 0.5;
        local v85 = CFrame.lookAt(v84 + Vector3.new(8, 5, 0, 0), v84);
        l_CurrentCamera_1.CFrame = l_CurrentCamera_1.CFrame:Lerp(v85, v83 * 2);
        local l_l_CurrentCamera_1_3 = l_CurrentCamera_1;
        local l_FieldOfView_3 = l_CurrentCamera_1.FieldOfView;
        local v88 = v83 * 2;
        l_l_CurrentCamera_1_3.FieldOfView = l_FieldOfView_3 + (65 - l_FieldOfView_3) * v88;
    end
};
local v90 = 0;
local v91 = 3;
local v92 = nil;
local __ = function(v93, v94, v95) --[[ Line: 214 ]] --[[ Name: SideFollowCamera ]]
    -- upvalues: v90 (ref), v91 (ref), v92 (ref), v89 (copy)
    v90 = v90 + v95;
    if v91 <= v90 or not v92 then
        v90 = 0;
        local v96 = {};
        for v97, __ in pairs(v89) do
            table.insert(v96, v97);
        end;
        v92 = v89[v96[math.random(1, #v96)]];
        v91 = math.random(2, 5);
    end;
    if v92 then
        v92(v93, v94, v95);
    end;
end;
local v100 = 0;
local function v113(v101, v102, v103) --[[ Line: 234 ]] --[[ Name: broadcastBoxingCamera ]]
    -- upvalues: v100 (ref)
    local l_CurrentCamera_2 = workspace.CurrentCamera;
    if not v101 or not v102 then
        return;
    else
        v100 = v100 + 0.002 * v103;
        local v105 = (v101.Position + v102.Position) / 2;
        local l_Unit_0 = (v102.Position - v101.Position).Unit;
        local v107 = v105 + Vector3.new(-l_Unit_0.Z, 0, l_Unit_0.X) * 24 + Vector3.new(0, math.sin(tick() * 1) * 0.15 + 3, 0);
        local v108 = math.clamp(20 + (v101.Position - v102.Position).Magnitude * 1.2, 20, 40);
        l_CurrentCamera_2.FieldOfView = l_CurrentCamera_2.FieldOfView + (v108 - l_CurrentCamera_2.FieldOfView) * math.clamp(v103 * 2, 0, 1);
        local l_Name_0 = v101.Parent.Name;
        local v110 = workspace:FindFirstChild("States") and workspace.States:FindFirstChild(l_Name_0) and workspace.States[l_Name_0]:FindFirstChild("CharacterData") and workspace.States[l_Name_0].CharacterData:FindFirstChild("Dashing");
        local v111 = v110 and v110.Value and 8 or 4;
        local v112 = CFrame.new(v107, v105 - Vector3.new(0, 0.6000000238418579, 0, 0));
        l_CurrentCamera_2.CFrame = l_CurrentCamera_2.CFrame:Lerp(v112, (math.clamp(v103 * v111, 0, 1)));
        return;
    end;
end;
local v114 = CFrame.new(0, 18, 10);
UpdateStartFightCamera = function(v115) --[[ Line: 289 ]] --[[ Name: UpdateStartFightCamera ]]
    -- upvalues: l_CameraTarget_0 (copy), l_CameraMode_0 (copy), v42 (ref), v114 (copy), l_Workspace_0 (copy), l_CurrentCamera_1 (copy)
    local l_Value_0 = l_CameraTarget_0.Value;
    if not l_Value_0 then
        l_CameraMode_0.Value = "";
    end;
    local l_Position_0 = l_Value_0.Position;
    local v118 = math.cos((math.rad(v42))) * 10;
    local v119 = math.sin((math.rad(v42))) * 10;
    local l_Position_1 = (l_Value_0.CFrame * v114 * l_Workspace_0.FightCameraOffset.Value).Position;
    v42 = v42 - v115 * 8;
    local v121 = CFrame.new(0, 0, 5);
    local v122 = CFrame.lookAt(l_Position_1, l_Position_0) * CFrame.new(v118, v119, 0);
    l_CurrentCamera_1.CFrame = l_CurrentCamera_1.CFrame:Lerp(CFrame.lookAt(v122.Position, l_Position_0) * v121, 1);
    local l_l_CurrentCamera_1_4 = l_CurrentCamera_1;
    local l_FieldOfView_4 = l_CurrentCamera_1.FieldOfView;
    l_l_CurrentCamera_1_4.FieldOfView = l_FieldOfView_4 + (60 - l_FieldOfView_4) * v115;
end;
local v125 = {
    Match = {
        StartOffset = CFrame.new(0, 7, 0), 
        FinalOffset = CFrame.new(-0.5, 1, 1), 
        DeltaMult = 2
    }, 
    Liver = {
        StartOffset = CFrame.new(0, 6, -5), 
        FinalOffset = CFrame.new(-0.5, -2, 1), 
        DeltaMult = 10
    }, 
    Craft = {
        StartOffset = CFrame.new(0, 3, -6), 
        FinalOffset = CFrame.new(-0.5, -1, 1), 
        DeltaMult = 11
    }, 
    Retro = {
        StartOffset = CFrame.new(0, 7, 0), 
        FinalOffset = CFrame.new(-0.1, -0.5, 1.5), 
        DeltaMult = 2
    }, 
    Peter = {
        StartOffset = CFrame.new(0.2, 4.5, -11), 
        FinalOffset = CFrame.new(0.2, -1, -6), 
        DeltaMult = 0.4
    }, 
    Cartoony = {
        StartOffset = CFrame.new(0, 4, -9), 
        FinalOffset = CFrame.new(0, 0, -6), 
        DeltaMult = 0.4
    }, 
    Barbarian = {
        StartOffset = CFrame.new(-9, -1.5, -8.3), 
        FinalOffset = CFrame.new(1.5, -0.5, -5), 
        DeltaMult = 10
    }, 
    Joe = {
        StartOffset = CFrame.new(0, 1, 4), 
        FinalOffset = CFrame.new(-0.5, -1, 8), 
        DeltaMult = 2
    }, 
    Yamcha = {
        StartOffset = CFrame.new(0, 7, 0), 
        FinalOffset = CFrame.new(-1.5, 2, 1), 
        DeltaMult = 2
    }, 
    Undertale = {
        StartOffset = CFrame.new(-1, -1.5, -9.3), 
        FinalOffset = CFrame.new(0, -0.5, -3), 
        DeltaMult = 3
    }, 
    Gear5 = {
        StartOffset = CFrame.new(-9, 4.5, -8.3), 
        FinalOffset = CFrame.new(-0.5, -0.5, -3.5), 
        DeltaMult = 2, 
        CameraMult = 2, 
        IgnoreFOV = true, 
        TargetPart = "UpperTorso"
    }, 
    Mahoraga = {
        StartOffset = CFrame.new(-3.5, 0.5, -11.3), 
        FinalOffset = CFrame.new(-0.5, -0.5, -3.5), 
        DeltaMult = 0.9, 
        CameraMult = 0.9, 
        IgnoreFOV = true, 
        TargetPart = "UpperTorso"
    }, 
    Yeonsu = {
        StartOffset = CFrame.new(0, 2.2, -11.3), 
        FinalOffset = CFrame.new(0, -0.5, -5.5), 
        DeltaMult = 1, 
        CameraMult = 1, 
        TargetPart = "UpperTorso"
    }, 
    Fight1 = {
        StartOffset = CFrame.new(0, 2.2, -11.3), 
        FinalOffset = CFrame.new(0, -0.5, -5.5), 
        DeltaMult = 1, 
        CameraMult = 1, 
        IgnoreFOV = true, 
        TargetPart = "UpperTorso"
    }, 
    Fight2 = {
        StartOffset = CFrame.new(0, 1.2, -11.3), 
        FinalOffset = CFrame.new(0, -0.5, 7.5), 
        DeltaMult = 1, 
        CameraMult = 1, 
        IgnoreFOV = true, 
        TargetPart = "UpperTorso"
    }, 
    Fight3 = {
        StartOffset = CFrame.new(-3.5, 0.5, -11.3), 
        FinalOffset = CFrame.new(-0.5, -0.5, 1.5), 
        DeltaMult = 2, 
        CameraMult = 2, 
        IgnoreFOV = true, 
        TargetPart = "UpperTorso"
    }
};
local v126 = 1;
UpdateKnockdownCamera = function(v127) --[[ Line: 441 ]] --[[ Name: UpdateKnockdownCamera ]]
    -- upvalues: l_CameraTarget_0 (copy), l_CameraMode_0 (copy), v42 (ref), v125 (copy), l_Variant_0 (copy), v126 (ref), l_CurrentCamera_1 (copy)
    local l_Value_1 = l_CameraTarget_0.Value;
    local l_PrimaryPart_1 = l_Value_1.PrimaryPart;
    if not l_Value_1 or not l_PrimaryPart_1 then
        l_CameraMode_0.Value = "";
    end;
    if not l_PrimaryPart_1 then
        warn("Update KD Camera issue? No targetrootpart");
        return;
    else
        local l_Position_2 = l_PrimaryPart_1.Position;
        local v131 = math.cos((math.rad(v42))) * 2;
        local v132 = math.sin((math.rad(v42))) * 2;
        local v133 = v125[l_Variant_0.Value];
        if v133.TargetPart then
            local l_l_Value_1_FirstChild_0 = l_Value_1:FindFirstChild(v133.TargetPart);
            if l_l_Value_1_FirstChild_0 then
                l_Position_2 = l_l_Value_1_FirstChild_0.Position;
            end;
        end;
        local l_Position_3 = (l_PrimaryPart_1.CFrame * v133.StartOffset).Position;
        v42 = v42 - v127 * v133.DeltaMult;
        local l_FinalOffset_0 = v133.FinalOffset;
        local v137 = CFrame.lookAt(l_Position_3, l_Position_2) * CFrame.new(v131, v132, 0);
        if v133.CameraMult then
            local l_v126_0 = v126;
            local v139 = v127 * v133.CameraMult;
            local v140 = v127 * 10;
            v126 = l_v126_0 + (v139 - l_v126_0) * v140;
        end;
        l_CurrentCamera_1.CFrame = l_CurrentCamera_1.CFrame:Lerp(CFrame.lookAt(v137.Position, l_Position_2) * l_FinalOffset_0, (math.clamp(v126, 0, 1)));
        if not v133.IgnoreFOV then
            local l_l_CurrentCamera_1_5 = l_CurrentCamera_1;
            local l_FieldOfView_5 = l_CurrentCamera_1.FieldOfView;
            local v143 = math.clamp(v127, 0, 1);
            l_l_CurrentCamera_1_5.FieldOfView = l_FieldOfView_5 + (60 - l_FieldOfView_5) * v143;
        end;
        return;
    end;
end;
local v144 = {};
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local v146 = 1 / require(l_Modules_0:WaitForChild("Styles")).Saeki.UltimateInfo.EyeDamageTime * 100;
local __ = {};
local __ = CFrame.new();
local __ = Vector3.new();
l_RunService_1:BindToRenderStep("LockCamera", Enum.RenderPriority.Camera.Value + 2, function(v150) --[[ Line: 511 ]]
    -- upvalues: l_Parent_0 (copy), l_Cutscene_0 (copy), v20 (copy), v43 (ref), l_TweenService_1 (copy), v146 (copy), v12 (ref), v144 (copy), l_CameraMode_0 (copy), l_v43_0 (ref), l_LockedOn_0 (copy), l_Workspace_0 (copy), l_CameraTarget_0 (copy), l_CurrentCamera_1 (copy), l_FoVMult_0 (copy), v41 (ref), v126 (ref), v42 (ref), v29 (ref), v23 (ref), v24 (ref), l_PrimaryPart_0 (copy), v113 (copy), v26 (copy), v27 (copy), v28 (copy), v25 (ref), v30 (copy)
    local l_l_Parent_0_Attribute_0 = l_Parent_0:GetAttribute("Dizzy");
    local l_l_Parent_0_Attribute_1 = l_Parent_0:GetAttribute("ClientEyeDamage");
    if l_l_Parent_0_Attribute_1 and not l_Cutscene_0.Value then
        local v153 = math.clamp(l_l_Parent_0_Attribute_1 / 100, 0, 1);
        local l_Saeki_0 = v20.Ultimates.Saeki;
        if l_l_Parent_0_Attribute_1 < 0.1 then
            l_Saeki_0.Visible = false;
            v43 = 20;
            l_Parent_0:SetAttribute("ClientEyeDamage", nil);
        else
            l_Saeki_0.Visible = true;
            local l_ImageTransparency_0 = l_Saeki_0.ImageTransparency;
            local l_l_TweenService_1_Value_0 = l_TweenService_1:GetValue(1 - v153, Enum.EasingStyle.Quint, Enum.EasingDirection.In);
            local v157 = v150 * 3;
            l_Saeki_0.ImageTransparency = l_ImageTransparency_0 + (l_l_TweenService_1_Value_0 - l_ImageTransparency_0) * v157;
            v43 = 20 + -16 * v153;
            l_Parent_0:SetAttribute("ClientEyeDamage", (math.clamp(l_l_Parent_0_Attribute_1 - v150 * v146, 0, 100)));
        end;
    elseif l_l_Parent_0_Attribute_0 then
        v43 = 20 * (1 + -0.15000000000000002 * math.clamp(l_l_Parent_0_Attribute_0, 0, 1));
    end;
    v150 = math.clamp(v150, 0, 1);
    local v158 = workspace:GetAttribute("DefaultFOV") or 70;
    if l_l_Parent_0_Attribute_0 then
        local l_v12_0 = v12;
        local v160 = math.sin((tick())) / 1.1;
        local v161 = math.clamp(l_l_Parent_0_Attribute_0, 0, 1);
        local v162 = v160 * (v161 + (0 - v161) * 1) + v158;
        local v163 = v150 * 5;
        v12 = l_v12_0 + (v162 - l_v12_0) * v163;
    else
        local l_v12_1 = v12;
        local v165 = v150 * 5;
        v12 = l_v12_1 + (v158 - l_v12_1) * v165;
    end;
    for v166, v167 in v144 do
        if tick() - v167 > 0.06666666666666667 then
            v166.LocalTransparencyModifier = v166.LocalTransparencyModifier - v150 * 2;
            if v166.LocalTransparencyModifier <= 0 then
                v144[v166] = nil;
            end;
        else
            v166.LocalTransparencyModifier = math.clamp(v166.LocalTransparencyModifier + v150 * 9, 0, 0.9);
        end;
    end;
    if not l_Parent_0 then
        return;
    elseif l_CameraMode_0.Value == "Freecam" then
        return;
    elseif l_CameraMode_0.Value == "StartFight" then
        UpdateStartFightCamera(v150);
        l_v43_0 = 0;
        return;
    else
        local l_Value_2 = l_LockedOn_0.Value;
        if l_Value_2 and l_Value_2.Parent ~= l_Workspace_0.Live then
            l_LockedOn_0.Value = nil;
            return;
        elseif not l_Cutscene_0.Value and not l_Value_2 then
            l_CameraTarget_0.Value = nil;
            l_CameraMode_0.Value = "";
            if l_CameraMode_0.Value == "" then
                local l_l_CurrentCamera_1_6 = l_CurrentCamera_1;
                local l_FieldOfView_6 = l_CurrentCamera_1.FieldOfView;
                local l_v12_2 = v12;
                local v172 = v150 * l_FoVMult_0.Value;
                l_l_CurrentCamera_1_6.FieldOfView = l_FieldOfView_6 + (l_v12_2 - l_FieldOfView_6) * v172;
            end;
            return;
        else
            if l_CameraMode_0.Value == "Knockdown" then
                if v41 ~= l_CameraMode_0.Value then
                    v126 = 1;
                    v42 = l_CameraTarget_0.Value and l_CameraTarget_0.Value.PrimaryPart.Orientation.Y - 180;
                end;
                UpdateKnockdownCamera(v150);
            end;
            v41 = l_CameraMode_0.Value;
            if l_CameraMode_0.Value == "" then
                local l_l_CurrentCamera_1_7 = l_CurrentCamera_1;
                local l_FieldOfView_7 = l_CurrentCamera_1.FieldOfView;
                local l_v12_3 = v12;
                local v176 = v150 * l_FoVMult_0.Value;
                l_l_CurrentCamera_1_7.FieldOfView = l_FieldOfView_7 + (l_v12_3 - l_FieldOfView_7) * v176;
            end;
            if l_CameraMode_0.Value ~= "" then
                return;
            else
                local v177, v178 = game:GetService("RunService").Stepped:Wait();
                _ = v177;
                v29 = v178;
                v29 = math.min(v29, 1);
                v177 = l_Value_2 and l_Value_2.PrimaryPart;
                if not v177 then
                    return;
                else
                    v178 = l_Workspace_0:FindFirstChild("FakeHRP");
                    local l_Position_4 = v177.Position;
                    if not v23 then
                        v23 = l_CurrentCamera_1.CFrame;
                        v24 = l_PrimaryPart_0.CFrame;
                        if not v178 then
                            local v180 = l_PrimaryPart_0:Clone();
                            v180.Name = "FakeHRP";
                            v180:ClearAllChildren();
                            v180.Anchored = true;
                            v180.CanCollide = false;
                            v180.Transparency = 1;
                            v180.Parent = l_Workspace_0;
                            v180.CFrame = CFrame.lookAt(l_PrimaryPart_0.Position, l_Position_4);
                        end;
                    end;
                    if not v178 or not l_PrimaryPart_0 then
                        return;
                    else
                        if workspace.FightCameraMode.Value == "ProCamera" then
                            v113(l_PrimaryPart_0, v177, v29);
                        else
                            local __ = v177.Size.Y / l_PrimaryPart_0.Size.Y;
                            local l_Magnitude_0 = (l_PrimaryPart_0.Position - l_Position_4).Magnitude;
                            l_v43_0 = math.clamp(l_v43_0 + v150 * 3, 0, v43);
                            local l_Position_5 = v178.Position;
                            local l_Position_6 = l_PrimaryPart_0.Position;
                            local v185 = math.min(workspace.FakeHRPLerp.Value * v150, 1);
                            v178.Position = l_Position_5 + (l_Position_6 - l_Position_5) * v185;
                            v178.CFrame = v178.CFrame:Lerp(CFrame.lookAt(v178.Position, l_Position_4), v29 * l_v43_0);
                            local v186 = math.clamp((l_Magnitude_0 - v26[1]) / (v26[2] - v26[1]), 0, 1);
                            l_Position_6 = v27[1];
                            l_Position_5 = l_Position_6 + (v27[2] - l_Position_6) * v186;
                            local v187 = v28[1];
                            l_Position_6 = v187 + (v28[2] - v187) * v186 + l_Parent_0.Humanoid.CameraOffset * Vector3.new(1, 0.8999999761581421, 1, 0);
                            v185 = (v178.CFrame * CFrame.new(l_Position_5)).Position;
                            v187 = (l_PrimaryPart_0.Position - l_Position_4).Magnitude;
                            local v188 = (v185 + l_Position_4) / 2;
                            local v189 = l_v43_0 * (workspace:GetAttribute("FoVLerpMult") or 1);
                            l_CurrentCamera_1.CFrame = l_CurrentCamera_1.CFrame:Lerp(CFrame.lookAt(v185, v188) * CFrame.new(l_Position_6) * CFrame.new(0, 0, v25) * workspace.DizzyOffset.Value, v29 * v189);
                            l_CurrentCamera_1.Focus = l_CurrentCamera_1.CFrame;
                        end;
                        v23 = l_CurrentCamera_1.CFrame;
                        v24 = l_PrimaryPart_0.CFrame;
                        for v190 = 0, 7 do
                            local v191 = CFrame.new(-2 + 4 * (v190 / 7), 0, 0);
                            local v192 = l_CurrentCamera_1.CFrame * v191;
                            local l_Magnitude_1 = (l_PrimaryPart_0.Position - l_CurrentCamera_1.CFrame.Position).Magnitude;
                            local v194 = workspace:Raycast(v192.Position, l_CurrentCamera_1.CFrame.LookVector.Unit * l_Magnitude_1, v30);
                            local v195 = v194 and v194.Instance;
                            if v195 and v195:IsA("BasePart") and v195.LocalTransparencyModifier < 1000 then
                                if v195.Parent.Name == "InvisModel" then
                                    for __, v197 in v195.Parent:GetChildren() do
                                        v144[v197] = tick();
                                        for __, v199 in v197:GetChildren() do
                                            if v199:IsA("Texture") then
                                                v144[v199] = tick();
                                            end;
                                        end;
                                    end;
                                else
                                    v144[v195] = tick();
                                    for __, v201 in v195:GetChildren() do
                                        if v201:IsA("Texture") then
                                            v144[v201] = tick();
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
end);
handler = function(v202) --[[ Line: 714 ]] --[[ Name: handler ]]
    -- upvalues: l_LockedOn_0 (copy), v25 (ref)
    if not l_LockedOn_0.Value then
        return;
    else
        if v202.Position.Z > 0 then
            if v25 > -4 then
                v25 = v25 - 0.5;
                return;
            end;
        elseif v25 < 6 then
            v25 = v25 + 0.5;
        end;
        return;
    end;
end;
l_UserInputService_0.InputChanged:Connect(function(v203) --[[ Line: 728 ]]
    if v203.UserInputType == Enum.UserInputType.MouseWheel then
        handler(v203);
    end;
end);