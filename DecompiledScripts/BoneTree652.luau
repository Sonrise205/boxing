--!native
local l_Lighting_0 = game:GetService("Lighting");
local l_Dependencies_0 = script.Parent.Parent:WaitForChild("Dependencies");
local _ = require(script.Parent:WaitForChild("Bone"));
local l_Config_0 = require(l_Dependencies_0:WaitForChild("Config"));
local l_DefaultObjectSettings_0 = require(l_Dependencies_0:WaitForChild("DefaultObjectSettings"));
local l_Gizmo_0 = require(l_Dependencies_0:WaitForChild("Debug"):WaitForChild("Gizmo"));
local l_Utilities_0 = require(l_Dependencies_0:WaitForChild("Utilities"));
local v7 = Random.new(1029410295159813);
local l_SB_VERBOSE_LOG_0 = l_Utilities_0.SB_VERBOSE_LOG;
local function _(v9) --[[ Line: 49 ]] --[[ Name: SafeUnit ]]
    if v9.Magnitude == 0 then
        return (Vector3.new(0, 0, 0, 0));
    else
        return v9.Unit;
    end;
end;
local function _(v11, v12, v13, v14, v15, v16) --[[ Line: 58 ]] --[[ Name: map ]]
    local v17 = (v11 - v12) / (v13 - v12) * (v15 - v14) + v14;
    if not v16 then
        return v17;
    elseif v14 < v15 then
        return v14 < (v17 < v15 and v17 or v15) and (v17 < v15 and v17 or v15) or v14;
    else
        return v15 < (v17 < v14 and v17 or v14) and (v17 < v14 and v17 or v14) or v15;
    end;
end;
local v19 = {};
v19.__index = v19;
v19.new = function(v20, v21, v22) --[[ Line: 166 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), v19 (copy), l_DefaultObjectSettings_0 (copy)
    local v23 = setmetatable({
        WindOffset = v7:NextNumber(0, 1000000), 
        Root = v20:IsA("Bone") and v20 or nil, 
        RootPart = v21, 
        RootPartSize = v21.Size, 
        Bones = {}, 
        Settings = v22, 
        UpdateRate = 0, 
        InView = true, 
        AccumulatedDelta = 0, 
        BoundingBoxCFrame = v21.CFrame, 
        BoundingBoxSize = v21.Size, 
        Destroyed = false, 
        IsSkippingUpdates = false, 
        InWorkspace = false, 
        Force = Vector3.new(0, 0, 0, 0), 
        ObjectMove = Vector3.new(0, 0, 0, 0), 
        ObjectVelocity = Vector3.new(0, 0, 0, 0), 
        ObjectAcceleration = Vector3.new(0, 0, 0, 0), 
        ObjectPreviousPosition = v21.Position
    }, v19);
    v23.InWorkspace = v21:IsDescendantOf(workspace);
    v23.DestroyConnection = v21.AncestryChanged:ConnectParallel(function() --[[ Line: 194 ]]
        -- upvalues: v21 (copy), v23 (copy)
        if not v21:IsDescendantOf(game) then
            v23.Destroyed = true;
        end;
        v23.InWorkspace = v21:IsDescendantOf(workspace);
    end);
    v23.AttributeConnection = v21.AttributeChanged:ConnectParallel(function(v24) --[[ Line: 202 ]]
        -- upvalues: v22 (copy), v21 (copy), l_DefaultObjectSettings_0 (ref)
        v22[v24] = v21:GetAttribute(v24) or l_DefaultObjectSettings_0[v24];
    end);
    return v23;
end;
v19.UpdateBoundingBox = function(v25) --[[ Line: 234 ]] --[[ Name: UpdateBoundingBox ]]
    if not v25.InView then
        v25.BoundingBoxCFrame = v25.RootPart.CFrame;
        v25.BoundingBoxSize = v25.RootPart.Size;
        return;
    else
        local v26 = Vector3.new(1e999, 1e999, 1e999, 0);
        local v27 = Vector3.new(-1e999, -1e999, -1e999, -0);
        for _, v29 in v25.Bones do
            local v30 = v29.Position - v29.LastPosition;
            local v31 = v29.Position + v30;
            v26 = v26:Min(v31);
            v27 = v27:Max(v31);
        end;
        local v32 = (v26 + v27) * 0.5;
        v25.BoundingBoxCFrame = CFrame.new(v32);
        v25.BoundingBoxSize = v25.RootPartSize:Max(v27 - v26);
        return;
    end;
end;
v19.UpdateThrottling = function(v33, v34) --[[ Line: 271 ]] --[[ Name: UpdateThrottling ]]
    local l_Settings_0 = v33.Settings;
    local l_Magnitude_0 = (v34 - workspace.CurrentCamera.CFrame.Position).Magnitude;
    if l_Settings_0.ActivationDistance < l_Magnitude_0 then
        v33.UpdateRate = 0;
        return;
    else
        local l_ThrottleDistance_0 = l_Settings_0.ThrottleDistance;
        local l_ActivationDistance_0 = l_Settings_0.ActivationDistance;
        local v39 = (l_Magnitude_0 - l_ThrottleDistance_0) / (l_ActivationDistance_0 - l_ThrottleDistance_0) * 1 + 0;
        local v40 = 1 - if (v39 < 1 and v39 or 1) > 0 then v39 < 1 and v39 or 1 else 0;
        v33.UpdateRate = l_Settings_0.UpdateRate * v40;
        return;
    end;
end;
v19.PreUpdate = function(v41, _) --[[ Line: 292 ]] --[[ Name: PreUpdate ]]
    local l_Position_0 = v41.RootPart.CFrame.Position;
    local l_ObjectVelocity_0 = v41.ObjectVelocity;
    v41.ObjectMove = l_Position_0 - v41.ObjectPreviousPosition;
    v41.ObjectVelocity = v41.ObjectMove;
    v41.ObjectAcceleration = l_ObjectVelocity_0 - v41.ObjectVelocity;
    v41.ObjectPreviousPosition = l_Position_0;
    v41.RootPartSize = v41.RootPart.Size;
    v41:UpdateThrottling(l_Position_0);
    v41:UpdateBoundingBox();
    for _, v46 in v41.Bones do
        v46:PreUpdate(v41);
    end;
end;
v19.StepPhysics = function(v47, v48) --[[ Line: 317 ]] --[[ Name: StepPhysics ]]
    -- upvalues: l_Lighting_0 (copy), l_DefaultObjectSettings_0 (copy)
    local l_Settings_1 = v47.Settings;
    local v50 = l_Settings_1.Gravity + l_Settings_1.Force;
    if l_Settings_1.MatchWorkspaceWind == true then
        local l_GlobalWind_0 = workspace.GlobalWind;
        l_Settings_1.WindDirection = if l_GlobalWind_0.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else l_GlobalWind_0.Unit;
        l_Settings_1.WindSpeed = l_GlobalWind_0.Magnitude;
    else
        local v52 = l_Lighting_0:GetAttribute("WindDirection") or l_DefaultObjectSettings_0.WindDirection;
        local v53 = l_Lighting_0:GetAttribute("WindSpeed") or l_DefaultObjectSettings_0.WindSpeed;
        l_Settings_1.WindDirection = if v52.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v52.Unit;
        l_Settings_1.WindSpeed = v53;
    end;
    l_Settings_1.WindStrength = l_Lighting_0:GetAttribute("WindStrength") or l_DefaultObjectSettings_0.WindStrength;
    for _, v55 in v47.Bones do
        v55:StepPhysics(v47, v50, v48);
    end;
end;
v19.Constrain = function(v56, v57, v58) --[[ Line: 347 ]] --[[ Name: Constrain ]]
    for _, v60 in v56.Bones do
        v60:Constrain(v56, v57, v58);
    end;
end;
v19.SkipUpdate = function(v61) --[[ Line: 357 ]] --[[ Name: SkipUpdate ]]
    for _, v63 in v61.Bones do
        v63:SkipUpdate();
    end;
    v61.IsSkippingUpdates = true;
end;
v19.SolveTransform = function(v64, v65) --[[ Line: 369 ]] --[[ Name: SolveTransform ]]
    for _, v67 in v64.Bones do
        v67:SolveTransform(v64, v65);
    end;
    v64.IsSkippingUpdates = false;
end;
v19.ApplyTransform = function(v68) --[[ Line: 381 ]] --[[ Name: ApplyTransform ]]
    for _, v70 in v68.Bones do
        v70:ApplyTransform(v68);
    end;
end;
v19.DrawDebug = function(v71, v72, v73, v74, v75, v76, v77, v78, v79) --[[ Line: 399 ]] --[[ Name: DrawDebug ]]
    -- upvalues: l_Gizmo_0 (copy)
    local v80 = Color3.fromRGB(248, 168, 20);
    local v81 = Color3.fromRGB(76, 208, 223);
    local v82 = Color3.fromRGB(255, 89, 89);
    local v83 = Color3.new(1, 0, 0);
    local v84 = Color3.new(0, 1, 0);
    local v85 = Color3.new(0, 0, 1);
    if v79 then
        local v86 = v71.RootPart.Position + Vector3.new(0, v71.RootPart.Size.Y * 0.5 + 1, 0);
        l_Gizmo_0.SetStyle(v83, 0, true);
        l_Gizmo_0.Arrow:Draw(v86, v86 + v71.ObjectMove, 0.025, 0.1, 6);
        l_Gizmo_0.SetStyle(v84, 0, true);
        l_Gizmo_0.Arrow:Draw(v86, v86 + v71.ObjectVelocity, 0.025, 0.1, 6);
        l_Gizmo_0.SetStyle(v85, 0, true);
        l_Gizmo_0.Arrow:Draw(v86, v86 + v71.ObjectAcceleration, 0.025, 0.1, 6);
    end;
    l_Gizmo_0.PushProperty("AlwaysOnTop", false);
    if v77 then
        l_Gizmo_0.PushProperty("Color3", v81);
        l_Gizmo_0.Box:Draw(v71.BoundingBoxCFrame, v71.BoundingBoxSize, true);
    end;
    if v76 then
        l_Gizmo_0.PushProperty("Color3", v81);
        l_Gizmo_0.Box:Draw(v71.RootPart.CFrame, v71.RootPart.Size, true);
        l_Gizmo_0.SetStyle(v82, 0.75, false);
        l_Gizmo_0.VolumeBox:Draw(v71.RootPart.CFrame, v71.RootPart.Size);
        l_Gizmo_0.PushProperty("Transparency", 0);
    end;
    for v87, v88 in v71.Bones do
        local l_Position_1 = v88.Bone.TransformedWorldCFrame.Position;
        local v90 = v71.Bones[v88.ParentIndex];
        v88:DrawDebug(v71, v72, v73, v74, v75, v78);
        if v73 and v87 ~= 1 then
            l_Gizmo_0.PushProperty("Color3", v80);
            l_Gizmo_0.Ray:Draw(v90.Bone.TransformedWorldCFrame.Position, l_Position_1);
        end;
    end;
end;
v19.DrawOverlay = function(v91, v92) --[[ Line: 464 ]] --[[ Name: DrawOverlay ]]
    -- upvalues: l_Config_0 (copy)
    if l_Config_0.DEBUG_OVERLAY_TREE_INFO or l_Config_0.DEBUG_OVERLAY_TREE_OBJECTS then
        v92.Text((("Root Part: %*"):format(v91.RootPart.Name)));
        v92.Text((("Root Bone: %*"):format(v91.Root.Name)));
        v92.Text((("Root Part Size: %*"):format((string.format("%.3f, %.3f, %.3f", v91.RootPart.Size.X, v91.RootPart.Size.Y, v91.RootPart.Size.Z)))));
    end;
    if l_Config_0.DEBUG_OVERLAY_TREE_INFO or l_Config_0.DEBUG_OVERLAY_TREE_NUMERICS then
        v92.Text((("Update Rate: %*"):format((string.format("%.3f", v91.UpdateRate)))));
        v92.Text((("In View: %*"):format(v91.InView)));
        v92.Text((("Accumulated Delta: %*"):format((string.format("%.3f", v91.AccumulatedDelta)))));
        v92.Text((("Force: %*"):format((string.format("%.3f, %.3f, %.3f", v91.Force.X, v91.Force.Y, v91.Force.Z)))));
    end;
    local v93 = Color3.new(0.486275, 0.431373, 1);
    local v94 = Color3.new(1, 1, 1);
    if l_Config_0.DEBUG_OVERLAY_BONE then
        for v95, v96 in v91.Bones do
            if l_Config_0.DEBUG_OVERLAY_MAX_BONES <= 0 or l_Config_0.DEBUG_OVERLAY_BONE_OFFSET + l_Config_0.DEBUG_OVERLAY_MAX_BONES > v95 then
                if v95 >= l_Config_0.DEBUG_OVERLAY_BONE_OFFSET then
                    v92.Begin(("Bone %*"):format(v95), v93, v94);
                    v96:DrawOverlay(v92);
                    v92.End();
                end;
            else
                break;
            end;
        end;
    end;
end;
v19.Destroy = function(v97) --[[ Line: 500 ]] --[[ Name: Destroy ]]
    -- upvalues: l_SB_VERBOSE_LOG_0 (copy)
    l_SB_VERBOSE_LOG_0("Destroy BoneTree");
    task.synchronize();
    v97.DestroyConnection:Disconnect();
    v97.AttributeConnection:Disconnect();
    for _, v99 in v97.Bones do
        v99:Destroy();
    end;
    setmetatable(v97, nil);
    task.desynchronize();
end;
return v19;