local l_VRBaseCamera_0 = require(script.Parent:WaitForChild("VRBaseCamera"));
local _ = require(script.Parent:WaitForChild("CameraInput"));
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local l_ZoomController_0 = require(script.Parent:WaitForChild("ZoomController"));
local _ = require(script.Parent:WaitForChild("VehicleCamera"));
local l_VehicleCameraCore_0 = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraCore"));
local l_VehicleCameraConfig_0 = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraConfig"));
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("VRService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Spring_0 = l_CameraUtils_0.Spring;
local l_mapClamp_0 = l_CameraUtils_0.mapClamp;
local _ = l_CameraUtils_0.sanitizeAngle;
local function _(v14, v15) --[[ Line: 35 ]] --[[ Name: pitchVelocity ]]
    return (math.abs((v15.XVector:Dot(v14))));
end;
local function _(v17, v18) --[[ Line: 40 ]] --[[ Name: yawVelocity ]]
    return (math.abs((v18.YVector:Dot(v17))));
end;
local v20 = 0.016666666666666666;
local v21 = setmetatable({}, l_VRBaseCamera_0);
v21.__index = v21;
v21.new = function() --[[ Line: 48 ]] --[[ Name: new ]]
    -- upvalues: l_VRBaseCamera_0 (copy), v21 (copy), l_RunService_0 (copy), v20 (ref)
    local v22 = setmetatable(l_VRBaseCamera_0.new(), v21);
    v22:Reset();
    l_RunService_0.Stepped:Connect(function(_, v24) --[[ Line: 53 ]]
        -- upvalues: v20 (ref)
        v20 = v24;
    end);
    return v22;
end;
v21.Reset = function(v25) --[[ Line: 60 ]] --[[ Name: Reset ]]
    -- upvalues: l_VehicleCameraCore_0 (copy), l_Spring_0 (copy), l_VehicleCameraConfig_0 (copy), l_CameraUtils_0 (copy)
    v25.vehicleCameraCore = l_VehicleCameraCore_0.new(v25:GetSubjectCFrame());
    v25.pitchSpring = l_Spring_0.new(0, -math.rad(l_VehicleCameraConfig_0.pitchBaseAngle));
    v25.yawSpring = l_Spring_0.new(0, 0);
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v27 = l_CurrentCamera_0 and l_CurrentCamera_0.CameraSubject;
    assert(l_CurrentCamera_0, "VRVehicleCamera initialization error");
    assert(v27);
    assert(v27:IsA("VehicleSeat"));
    local l_v27_ConnectedParts_0 = v27:GetConnectedParts(true);
    local v29, v30 = l_CameraUtils_0.getLooseBoundingSphere(l_v27_ConnectedParts_0);
    v25.assemblyRadius = math.max(v30, 0.001);
    v25.assemblyOffset = v27.CFrame:Inverse() * v29;
    v25.lastCameraFocus = nil;
    v25:_StepInitialZoom();
end;
v21._StepInitialZoom = function(v31) --[[ Line: 85 ]] --[[ Name: _StepInitialZoom ]]
    -- upvalues: l_ZoomController_0 (copy), l_VehicleCameraConfig_0 (copy)
    v31:SetCameraToSubjectDistance((math.max(l_ZoomController_0.GetZoomRadius(), v31.assemblyRadius * l_VehicleCameraConfig_0.initialZoomRadiusMul)));
end;
v21._GetThirdPersonLocalOffset = function(v32) --[[ Line: 92 ]] --[[ Name: _GetThirdPersonLocalOffset ]]
    -- upvalues: l_VehicleCameraConfig_0 (copy)
    return v32.assemblyOffset + Vector3.new(0, v32.assemblyRadius * l_VehicleCameraConfig_0.verticalCenterOffset, 0);
end;
v21._GetFirstPersonLocalOffset = function(v33, v34) --[[ Line: 96 ]] --[[ Name: _GetFirstPersonLocalOffset ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Character_0 and l_Character_0.Parent then
        local l_Head_0 = l_Character_0:FindFirstChild("Head");
        if l_Head_0 and l_Head_0:IsA("BasePart") then
            return v34:Inverse() * l_Head_0.Position;
        end;
    end;
    return v33:_GetThirdPersonLocalOffset();
end;
v21.Update = function(v37) --[[ Line: 110 ]] --[[ Name: Update ]]
    -- upvalues: v20 (ref), l_mapClamp_0 (copy), l_LocalPlayer_0 (copy)
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v39 = l_CurrentCamera_1 and l_CurrentCamera_1.CameraSubject;
    local l_vehicleCameraCore_0 = v37.vehicleCameraCore;
    assert(l_CurrentCamera_1);
    assert(v39);
    assert(v39:IsA("VehicleSeat"));
    local l_v20_0 = v20;
    v20 = 0;
    local l_v37_SubjectCFrame_0 = v37:GetSubjectCFrame();
    local l_v37_SubjectVelocity_0 = v37:GetSubjectVelocity();
    local l_v37_SubjectRotVelocity_0 = v37:GetSubjectRotVelocity();
    local _ = math.abs((l_v37_SubjectVelocity_0:Dot(l_v37_SubjectCFrame_0.ZVector)));
    local v46 = math.abs((l_v37_SubjectCFrame_0.YVector:Dot(l_v37_SubjectRotVelocity_0)));
    local v47 = math.abs((l_v37_SubjectCFrame_0.XVector:Dot(l_v37_SubjectRotVelocity_0)));
    local v48 = v37:StepZoom();
    local v49 = l_mapClamp_0(v48, 0.5, v37.assemblyRadius, 1, 0);
    local v50 = v37:_GetThirdPersonLocalOffset():Lerp(v37:_GetFirstPersonLocalOffset(l_v37_SubjectCFrame_0), v49);
    l_vehicleCameraCore_0:setTransform(l_v37_SubjectCFrame_0);
    local v51 = l_vehicleCameraCore_0:step(l_v20_0, v47, v46, v49);
    local v52 = nil;
    local v53 = nil;
    v37:UpdateFadeFromBlack(l_v20_0);
    if not v37:IsInFirstPerson() then
        v52 = CFrame.new(l_v37_SubjectCFrame_0 * v50) * v51;
        v53 = v52 * CFrame.new(0, 0, v48);
        if not v37.lastCameraFocus then
            v37.lastCameraFocus = v52;
            v37.needsReset = true;
        end;
        local v54 = v52.Position - l_CurrentCamera_1.CFrame.Position;
        local l_magnitude_0 = v54.magnitude;
        if v54.Unit:Dot(l_CurrentCamera_1.CFrame.LookVector) > 0.56 and l_magnitude_0 < 200 and not v37.needsReset then
            v52 = v37.lastCameraFocus;
            local l_p_0 = v52.p;
            local l_v37_CameraLookVector_0 = v37:GetCameraLookVector();
            local v58 = v37:CalculateNewLookVectorFromArg(Vector3.new(l_v37_CameraLookVector_0.X, 0, l_v37_CameraLookVector_0.Z).Unit, Vector2.new(0, 0));
            v53 = CFrame.new(l_p_0 - v48 * v58, l_p_0);
        else
            v37.currentSubjectDistance = 16;
            v37.lastCameraFocus = v37:GetVRFocus(l_v37_SubjectCFrame_0.Position, l_v20_0);
            v37.needsReset = false;
            v37:StartFadeFromBlack();
            v37:ResetZoom();
        end;
        v37:UpdateEdgeBlur(l_LocalPlayer_0, l_v20_0);
    else
        local l_Unit_0 = Vector3.new(v51.LookVector.X, 0, v51.LookVector.Z).Unit;
        local v60 = CFrame.new(v51.Position, l_Unit_0);
        v52 = CFrame.new(l_v37_SubjectCFrame_0 * v50) * v60;
        v53 = v52 * CFrame.new(0, 0, v48);
        v37:StartVREdgeBlur(l_LocalPlayer_0);
    end;
    return v53, v52;
end;
v21.EnterFirstPerson = function(v61) --[[ Line: 203 ]] --[[ Name: EnterFirstPerson ]]
    v61.inFirstPerson = true;
    v61:UpdateMouseBehavior();
end;
v21.LeaveFirstPerson = function(v62) --[[ Line: 208 ]] --[[ Name: LeaveFirstPerson ]]
    v62.inFirstPerson = false;
    v62:UpdateMouseBehavior();
end;
return v21;