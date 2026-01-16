local _ = {
    InitialDistance = 25, 
    MinDistance = 10, 
    MaxDistance = 100, 
    InitialElevation = 35, 
    MinElevation = 35, 
    MaxElevation = 35, 
    ReferenceAzimuth = -45, 
    CWAzimuthTravel = 90, 
    CCWAzimuthTravel = 90, 
    UseAzimuthLimits = false
};
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_BaseCamera_0 = require(script.Parent:WaitForChild("BaseCamera"));
local v6 = setmetatable({}, l_BaseCamera_0);
v6.__index = v6;
v6.new = function() --[[ Line: 43 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCamera_0 (copy), v6 (copy)
    local v7 = setmetatable(l_BaseCamera_0.new(), v6);
    v7.lastUpdate = tick();
    v7.changedSignalConnections = {};
    v7.refAzimuthRad = nil;
    v7.curAzimuthRad = nil;
    v7.minAzimuthAbsoluteRad = nil;
    v7.maxAzimuthAbsoluteRad = nil;
    v7.useAzimuthLimits = nil;
    v7.curElevationRad = nil;
    v7.minElevationRad = nil;
    v7.maxElevationRad = nil;
    v7.curDistance = nil;
    v7.minDistance = nil;
    v7.maxDistance = nil;
    v7.gamepadDollySpeedMultiplier = 1;
    v7.lastUserPanCamera = tick();
    v7.externalProperties = {};
    v7.externalProperties.InitialDistance = 25;
    v7.externalProperties.MinDistance = 10;
    v7.externalProperties.MaxDistance = 100;
    v7.externalProperties.InitialElevation = 35;
    v7.externalProperties.MinElevation = 35;
    v7.externalProperties.MaxElevation = 35;
    v7.externalProperties.ReferenceAzimuth = -45;
    v7.externalProperties.CWAzimuthTravel = 90;
    v7.externalProperties.CCWAzimuthTravel = 90;
    v7.externalProperties.UseAzimuthLimits = false;
    v7:LoadNumberValueParameters();
    return v7;
end;
v6.LoadOrCreateNumberValueParameter = function(v8, v9, v10, v11) --[[ Line: 82 ]] --[[ Name: LoadOrCreateNumberValueParameter ]]
    local l_script_FirstChild_0 = script:FindFirstChild(v9);
    if l_script_FirstChild_0 and l_script_FirstChild_0:isA(v10) then
        v8.externalProperties[v9] = l_script_FirstChild_0.Value;
    elseif v8.externalProperties[v9] ~= nil then
        l_script_FirstChild_0 = Instance.new(v10);
        l_script_FirstChild_0.Name = v9;
        l_script_FirstChild_0.Parent = script;
        l_script_FirstChild_0.Value = v8.externalProperties[v9];
    else
        return;
    end;
    if v11 then
        if v8.changedSignalConnections[v9] then
            v8.changedSignalConnections[v9]:Disconnect();
        end;
        v8.changedSignalConnections[v9] = l_script_FirstChild_0.Changed:Connect(function(v13) --[[ Line: 102 ]]
            -- upvalues: v8 (copy), v9 (copy), v11 (copy)
            v8.externalProperties[v9] = v13;
            v11(v8);
        end);
    end;
end;
v6.SetAndBoundsCheckAzimuthValues = function(v14) --[[ Line: 109 ]] --[[ Name: SetAndBoundsCheckAzimuthValues ]]
    v14.minAzimuthAbsoluteRad = math.rad(v14.externalProperties.ReferenceAzimuth) - math.abs((math.rad(v14.externalProperties.CWAzimuthTravel)));
    v14.maxAzimuthAbsoluteRad = math.rad(v14.externalProperties.ReferenceAzimuth) + math.abs((math.rad(v14.externalProperties.CCWAzimuthTravel)));
    v14.useAzimuthLimits = v14.externalProperties.UseAzimuthLimits;
    if v14.useAzimuthLimits then
        v14.curAzimuthRad = math.max(v14.curAzimuthRad, v14.minAzimuthAbsoluteRad);
        v14.curAzimuthRad = math.min(v14.curAzimuthRad, v14.maxAzimuthAbsoluteRad);
    end;
end;
v6.SetAndBoundsCheckElevationValues = function(v15) --[[ Line: 119 ]] --[[ Name: SetAndBoundsCheckElevationValues ]]
    local v16 = math.max(v15.externalProperties.MinElevation, -80);
    local v17 = math.min(v15.externalProperties.MaxElevation, 80);
    v15.minElevationRad = math.rad((math.min(v16, v17)));
    v15.maxElevationRad = math.rad((math.max(v16, v17)));
    v15.curElevationRad = math.max(v15.curElevationRad, v15.minElevationRad);
    v15.curElevationRad = math.min(v15.curElevationRad, v15.maxElevationRad);
end;
v6.SetAndBoundsCheckDistanceValues = function(v18) --[[ Line: 135 ]] --[[ Name: SetAndBoundsCheckDistanceValues ]]
    v18.minDistance = v18.externalProperties.MinDistance;
    v18.maxDistance = v18.externalProperties.MaxDistance;
    v18.curDistance = math.max(v18.curDistance, v18.minDistance);
    v18.curDistance = math.min(v18.curDistance, v18.maxDistance);
end;
v6.LoadNumberValueParameters = function(v19) --[[ Line: 143 ]] --[[ Name: LoadNumberValueParameters ]]
    v19:LoadOrCreateNumberValueParameter("InitialElevation", "NumberValue", nil);
    v19:LoadOrCreateNumberValueParameter("InitialDistance", "NumberValue", nil);
    v19:LoadOrCreateNumberValueParameter("ReferenceAzimuth", "NumberValue", v19.SetAndBoundsCheckAzimuthValue);
    v19:LoadOrCreateNumberValueParameter("CWAzimuthTravel", "NumberValue", v19.SetAndBoundsCheckAzimuthValues);
    v19:LoadOrCreateNumberValueParameter("CCWAzimuthTravel", "NumberValue", v19.SetAndBoundsCheckAzimuthValues);
    v19:LoadOrCreateNumberValueParameter("MinElevation", "NumberValue", v19.SetAndBoundsCheckElevationValues);
    v19:LoadOrCreateNumberValueParameter("MaxElevation", "NumberValue", v19.SetAndBoundsCheckElevationValues);
    v19:LoadOrCreateNumberValueParameter("MinDistance", "NumberValue", v19.SetAndBoundsCheckDistanceValues);
    v19:LoadOrCreateNumberValueParameter("MaxDistance", "NumberValue", v19.SetAndBoundsCheckDistanceValues);
    v19:LoadOrCreateNumberValueParameter("UseAzimuthLimits", "BoolValue", v19.SetAndBoundsCheckAzimuthValues);
    v19.curAzimuthRad = math.rad(v19.externalProperties.ReferenceAzimuth);
    v19.curElevationRad = math.rad(v19.externalProperties.InitialElevation);
    v19.curDistance = v19.externalProperties.InitialDistance;
    v19:SetAndBoundsCheckAzimuthValues();
    v19:SetAndBoundsCheckElevationValues();
    v19:SetAndBoundsCheckDistanceValues();
end;
v6.GetModuleName = function(_) --[[ Line: 168 ]] --[[ Name: GetModuleName ]]
    return "OrbitalCamera";
end;
v6.SetInitialOrientation = function(v21, v22) --[[ Line: 172 ]] --[[ Name: SetInitialOrientation ]]
    -- upvalues: l_CameraUtils_0 (copy)
    if not v22 or not v22.RootPart then
        warn("OrbitalCamera could not set initial orientation due to missing humanoid");
        return;
    else
        assert(v22.RootPart, "");
        local l_Unit_0 = (v22.RootPart.CFrame.LookVector - Vector3.new(0, 0.23000000417232513, 0, 0)).Unit;
        local v24 = l_CameraUtils_0.GetAngleBetweenXZVectors(l_Unit_0, v21:GetCameraLookVector());
        local v25 = math.asin(v21:GetCameraLookVector().Y) - math.asin(l_Unit_0.Y);
        if not l_CameraUtils_0.IsFinite(v24) then
            v24 = 0;
        end;
        if not l_CameraUtils_0.IsFinite(v25) then
            v25 = 0;
        end;
        return;
    end;
end;
v6.GetCameraToSubjectDistance = function(v26) --[[ Line: 190 ]] --[[ Name: GetCameraToSubjectDistance ]]
    return v26.curDistance;
end;
v6.SetCameraToSubjectDistance = function(v27, v28) --[[ Line: 194 ]] --[[ Name: SetCameraToSubjectDistance ]]
    -- upvalues: l_Players_0 (copy)
    if l_Players_0.LocalPlayer then
        v27.currentSubjectDistance = math.clamp(v28, v27.minDistance, v27.maxDistance);
        v27.currentSubjectDistance = math.max(v27.currentSubjectDistance, v27.FIRST_PERSON_DISTANCE_THRESHOLD);
    end;
    v27.inFirstPerson = false;
    v27:UpdateMouseBehavior();
    return v27.currentSubjectDistance;
end;
v6.CalculateNewLookVector = function(v29, v30, v31) --[[ Line: 207 ]] --[[ Name: CalculateNewLookVector ]]
    local v32 = v30 or v29:GetCameraLookVector();
    local v33 = math.asin(v32.Y);
    local v34 = math.clamp(v31.Y, v33 - 1.3962634015954636, v33 - -1.3962634015954636);
    local v35 = Vector2.new(v31.X, v34);
    local v36 = CFrame.new(Vector3.new(0, 0, 0, 0), v32);
    return (CFrame.Angles(0, -v35.X, 0) * v36 * CFrame.Angles(-v35.Y, 0, 0)).LookVector;
end;
v6.Update = function(v37, _) --[[ Line: 218 ]] --[[ Name: Update ]]
    -- upvalues: l_CameraInput_0 (copy), l_Players_0 (copy), l_VRService_0 (copy)
    local v39 = tick();
    local v40 = v39 - v37.lastUpdate;
    local v41 = l_CameraInput_0.getRotation() ~= Vector2.new();
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    local l_Focus_0 = l_CurrentCamera_0.Focus;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v46 = l_CurrentCamera_0 and l_CurrentCamera_0.CameraSubject;
    local v47 = v46 and v46:IsA("VehicleSeat");
    local v48 = v46 and v46:IsA("SkateboardPlatform");
    if v37.lastUpdate == nil or v40 > 1 then
        v37.lastCameraTransform = nil;
    end;
    if v41 then
        v37.lastUserPanCamera = tick();
    end;
    local l_v37_SubjectPosition_0 = v37:GetSubjectPosition();
    if l_v37_SubjectPosition_0 and l_LocalPlayer_0 and l_CurrentCamera_0 then
        if v37.gamepadDollySpeedMultiplier ~= 1 then
            v37:SetCameraToSubjectDistance(v37.currentSubjectDistance * v37.gamepadDollySpeedMultiplier);
        end;
        local l_VREnabled_0 = l_VRService_0.VREnabled;
        l_Focus_0 = l_VREnabled_0 and v37:GetVRFocus(l_v37_SubjectPosition_0, v40) or CFrame.new(l_v37_SubjectPosition_0);
        local v51 = l_CameraInput_0.getRotation();
        local l_p_0 = l_Focus_0.p;
        if l_VREnabled_0 and not v37:IsInFirstPerson() then
            local l_v37_CameraHeight_0 = v37:GetCameraHeight();
            local v54 = l_v37_SubjectPosition_0 - l_CurrentCamera_0.CFrame.p;
            local l_Magnitude_0 = v54.Magnitude;
            if v37.currentSubjectDistance < l_Magnitude_0 or v51.X ~= 0 then
                local v56 = math.min(l_Magnitude_0, v37.currentSubjectDistance);
                v54 = v37:CalculateNewLookVector(v54.Unit * Vector3.new(1, 0, 1, 0), Vector2.new(v51.X, 0)) * v56;
                local v57 = l_p_0 - v54;
                local l_LookVector_0 = l_CurrentCamera_0.CFrame.LookVector;
                if v51.X ~= 0 then
                    l_LookVector_0 = v54;
                end;
                local v59 = Vector3.new(v57.X + l_LookVector_0.X, v57.Y, v57.Z + l_LookVector_0.Z);
                l_CFrame_0 = CFrame.new(v57, v59) + Vector3.new(0, l_v37_CameraHeight_0, 0);
            end;
        else
            v37.curAzimuthRad = v37.curAzimuthRad - v51.X;
            if v37.useAzimuthLimits then
                v37.curAzimuthRad = math.clamp(v37.curAzimuthRad, v37.minAzimuthAbsoluteRad, v37.maxAzimuthAbsoluteRad);
            else
                v37.curAzimuthRad = v37.curAzimuthRad ~= 0 and math.sign(v37.curAzimuthRad) * (math.abs(v37.curAzimuthRad) % 6.283185307179586) or 0;
            end;
            v37.curElevationRad = math.clamp(v37.curElevationRad + v51.Y, v37.minElevationRad, v37.maxElevationRad);
            local v60 = l_v37_SubjectPosition_0 + v37.currentSubjectDistance * (CFrame.fromEulerAnglesYXZ(-v37.curElevationRad, v37.curAzimuthRad, 0) * Vector3.new(0, 0, 1, 0));
            l_CFrame_0 = CFrame.new(v60, l_v37_SubjectPosition_0);
        end;
        v37.lastCameraTransform = l_CFrame_0;
        v37.lastCameraFocus = l_Focus_0;
        if (v47 or v48) and v46:IsA("BasePart") then
            v37.lastSubjectCFrame = v46.CFrame;
        else
            v37.lastSubjectCFrame = nil;
        end;
    end;
    v37.lastUpdate = v39;
    return l_CFrame_0, l_Focus_0;
end;
return v6;