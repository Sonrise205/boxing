local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_BaseCamera_0 = require(script.Parent:WaitForChild("BaseCamera"));
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local l_ZoomController_0 = require(script.Parent:WaitForChild("ZoomController"));
local l_VehicleCameraCore_0 = require(script:WaitForChild("VehicleCameraCore"));
local l_VehicleCameraConfig_0 = require(script:WaitForChild("VehicleCameraConfig"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = l_CameraUtils_0.map;
local l_Spring_0 = l_CameraUtils_0.Spring;
local l_mapClamp_0 = l_CameraUtils_0.mapClamp;
local l_sanitizeAngle_0 = l_CameraUtils_0.sanitizeAngle;
local function _(v13, v14) --[[ Line: 26 ]] --[[ Name: pitchVelocity ]]
    return (math.abs((v14.XVector:Dot(v13))));
end;
local function _(v16, v17) --[[ Line: 31 ]] --[[ Name: yawVelocity ]]
    return (math.abs((v17.YVector:Dot(v16))));
end;
local v19 = 0.016666666666666666;
l_RunService_0.Stepped:Connect(function(_, v21) --[[ Line: 37 ]]
    -- upvalues: v19 (ref)
    v19 = v21;
end);
local v22 = setmetatable({}, l_BaseCamera_0);
v22.__index = v22;
v22.new = function() --[[ Line: 44 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCamera_0 (copy), v22 (copy)
    local v23 = setmetatable(l_BaseCamera_0.new(), v22);
    v23:Reset();
    return v23;
end;
v22.Reset = function(v24) --[[ Line: 50 ]] --[[ Name: Reset ]]
    -- upvalues: l_VehicleCameraCore_0 (copy), l_Spring_0 (copy), l_VehicleCameraConfig_0 (copy), l_CameraUtils_0 (copy)
    v24.vehicleCameraCore = l_VehicleCameraCore_0.new(v24:GetSubjectCFrame());
    v24.pitchSpring = l_Spring_0.new(0, -math.rad(l_VehicleCameraConfig_0.pitchBaseAngle));
    v24.yawSpring = l_Spring_0.new(0, 0);
    v24.lastPanTick = 0;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v26 = l_CurrentCamera_0 and l_CurrentCamera_0.CameraSubject;
    assert(l_CurrentCamera_0);
    assert(v26);
    assert(v26:IsA("VehicleSeat"));
    local l_v26_ConnectedParts_0 = v26:GetConnectedParts(true);
    local v28, v29 = l_CameraUtils_0.getLooseBoundingSphere(l_v26_ConnectedParts_0);
    v24.assemblyRadius = math.max(v29, 0.001);
    v24.assemblyOffset = v26.CFrame:Inverse() * v28;
    v24:_StepInitialZoom();
end;
v22._StepInitialZoom = function(v30) --[[ Line: 74 ]] --[[ Name: _StepInitialZoom ]]
    -- upvalues: l_ZoomController_0 (copy), l_VehicleCameraConfig_0 (copy)
    v30:SetCameraToSubjectDistance((math.max(l_ZoomController_0.GetZoomRadius(), v30.assemblyRadius * l_VehicleCameraConfig_0.initialZoomRadiusMul)));
end;
v22._StepRotation = function(v31, v32, v33) --[[ Line: 81 ]] --[[ Name: _StepRotation ]]
    -- upvalues: l_CameraInput_0 (copy), l_sanitizeAngle_0 (copy), l_VehicleCameraConfig_0 (copy), l_mapClamp_0 (copy)
    local l_yawSpring_0 = v31.yawSpring;
    local l_pitchSpring_0 = v31.pitchSpring;
    local v36 = l_CameraInput_0.getRotation(true);
    local v37 = -v36.X;
    local v38 = -v36.Y;
    l_yawSpring_0.pos = l_sanitizeAngle_0(l_yawSpring_0.pos + v37);
    l_pitchSpring_0.pos = l_sanitizeAngle_0((math.clamp(l_pitchSpring_0.pos + v38, -1.3962634015954636, 1.3962634015954636)));
    if l_CameraInput_0.getRotationActivated() then
        v31.lastPanTick = os.clock();
    end;
    local v39 = -math.rad(l_VehicleCameraConfig_0.pitchBaseAngle);
    local v40 = math.rad(l_VehicleCameraConfig_0.pitchDeadzoneAngle);
    if os.clock() - v31.lastPanTick > l_VehicleCameraConfig_0.autocorrectDelay then
        local v41 = l_mapClamp_0(v33, l_VehicleCameraConfig_0.autocorrectMinCarSpeed, l_VehicleCameraConfig_0.autocorrectMaxCarSpeed, 0, l_VehicleCameraConfig_0.autocorrectResponse);
        l_yawSpring_0.freq = v41;
        l_pitchSpring_0.freq = v41;
        if l_yawSpring_0.freq < 0.001 then
            l_yawSpring_0.vel = 0;
        end;
        if l_pitchSpring_0.freq < 0.001 then
            l_pitchSpring_0.vel = 0;
        end;
        if math.abs((l_sanitizeAngle_0(v39 - l_pitchSpring_0.pos))) <= v40 then
            l_pitchSpring_0.goal = l_pitchSpring_0.pos;
        else
            l_pitchSpring_0.goal = v39;
        end;
    else
        l_yawSpring_0.freq = 0;
        l_yawSpring_0.vel = 0;
        l_pitchSpring_0.freq = 0;
        l_pitchSpring_0.vel = 0;
        l_pitchSpring_0.goal = v39;
    end;
    return CFrame.fromEulerAnglesYXZ(l_pitchSpring_0:step(v32), l_yawSpring_0:step(v32), 0);
end;
v22._GetThirdPersonLocalOffset = function(v42) --[[ Line: 144 ]] --[[ Name: _GetThirdPersonLocalOffset ]]
    -- upvalues: l_VehicleCameraConfig_0 (copy)
    return v42.assemblyOffset + Vector3.new(0, v42.assemblyRadius * l_VehicleCameraConfig_0.verticalCenterOffset, 0);
end;
v22._GetFirstPersonLocalOffset = function(v43, v44) --[[ Line: 148 ]] --[[ Name: _GetFirstPersonLocalOffset ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Character_0 and l_Character_0.Parent then
        local l_Head_0 = l_Character_0:FindFirstChild("Head");
        if l_Head_0 and l_Head_0:IsA("BasePart") then
            return v44:Inverse() * l_Head_0.Position;
        end;
    end;
    return v43:_GetThirdPersonLocalOffset();
end;
v22.Update = function(v47) --[[ Line: 162 ]] --[[ Name: Update ]]
    -- upvalues: v19 (ref), l_mapClamp_0 (copy)
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v49 = l_CurrentCamera_1 and l_CurrentCamera_1.CameraSubject;
    local l_vehicleCameraCore_0 = v47.vehicleCameraCore;
    assert(l_CurrentCamera_1);
    assert(v49);
    assert(v49:IsA("VehicleSeat"));
    local l_v19_0 = v19;
    v19 = 0;
    local l_v47_SubjectCFrame_0 = v47:GetSubjectCFrame();
    local l_v47_SubjectVelocity_0 = v47:GetSubjectVelocity();
    local l_v47_SubjectRotVelocity_0 = v47:GetSubjectRotVelocity();
    local v55 = math.abs((l_v47_SubjectVelocity_0:Dot(l_v47_SubjectCFrame_0.ZVector)));
    local v56 = math.abs((l_v47_SubjectCFrame_0.YVector:Dot(l_v47_SubjectRotVelocity_0)));
    local v57 = math.abs((l_v47_SubjectCFrame_0.XVector:Dot(l_v47_SubjectRotVelocity_0)));
    local v58 = v47:StepZoom();
    local v59 = v47:_StepRotation(l_v19_0, v55);
    local v60 = l_mapClamp_0(v58, 0.5, v47.assemblyRadius, 1, 0);
    local v61 = v47:_GetThirdPersonLocalOffset():Lerp(v47:_GetFirstPersonLocalOffset(l_v47_SubjectCFrame_0), v60);
    l_vehicleCameraCore_0:setTransform(l_v47_SubjectCFrame_0);
    local v62 = l_vehicleCameraCore_0:step(l_v19_0, v57, v56, v60);
    local v63 = CFrame.new(l_v47_SubjectCFrame_0 * v61) * v62 * v59;
    return v63 * CFrame.new(0, 0, v58), v63;
end;
v22.ApplyVRTransform = function(_) --[[ Line: 207 ]] --[[ Name: ApplyVRTransform ]]

end;
v22.EnterFirstPerson = function(v65) --[[ Line: 211 ]] --[[ Name: EnterFirstPerson ]]
    v65.inFirstPerson = true;
    v65:UpdateMouseBehavior();
end;
v22.LeaveFirstPerson = function(v66) --[[ Line: 216 ]] --[[ Name: LeaveFirstPerson ]]
    v66.inFirstPerson = false;
    v66:UpdateMouseBehavior();
end;
return v22;