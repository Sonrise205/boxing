local _ = Vector2.new(0, 0);
local v1 = 0;
local v2 = CFrame.fromOrientation(-0.2617993877991494, 0, 0);
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local l_BaseCamera_0 = require(script.Parent:WaitForChild("BaseCamera"));
local v8 = setmetatable({}, l_BaseCamera_0);
v8.__index = v8;
v8.new = function() --[[ Line: 34 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCamera_0 (copy), v8 (copy), l_CameraUtils_0 (copy)
    local v9 = setmetatable(l_BaseCamera_0.new(), v8);
    v9.isFollowCamera = false;
    v9.isCameraToggle = false;
    v9.lastUpdate = tick();
    v9.cameraToggleSpring = l_CameraUtils_0.Spring.new(5, 0);
    return v9;
end;
v8.GetCameraToggleOffset = function(v10, v11) --[[ Line: 45 ]] --[[ Name: GetCameraToggleOffset ]]
    -- upvalues: l_CameraInput_0 (copy), l_CameraUtils_0 (copy)
    if v10.isCameraToggle then
        local l_currentSubjectDistance_0 = v10.currentSubjectDistance;
        if l_CameraInput_0.getTogglePan() then
            v10.cameraToggleSpring.goal = math.clamp(l_CameraUtils_0.map(l_currentSubjectDistance_0, 0.5, v10.FIRST_PERSON_DISTANCE_THRESHOLD, 0, 1), 0, 1);
        else
            v10.cameraToggleSpring.goal = 0;
        end;
        local v13 = math.clamp(l_CameraUtils_0.map(l_currentSubjectDistance_0, 0.5, 64, 0, 1), 0, 1) + 1;
        return (Vector3.new(0, v10.cameraToggleSpring:step(v11) * v13, 0));
    else
        return (Vector3.new());
    end;
end;
v8.SetCameraMovementMode = function(v14, v15) --[[ Line: 63 ]] --[[ Name: SetCameraMovementMode ]]
    -- upvalues: l_BaseCamera_0 (copy)
    l_BaseCamera_0.SetCameraMovementMode(v14, v15);
    v14.isFollowCamera = v15 == Enum.ComputerCameraMovementMode.Follow;
    v14.isCameraToggle = v15 == Enum.ComputerCameraMovementMode.CameraToggle;
end;
v8.Update = function(v16) --[[ Line: 70 ]] --[[ Name: Update ]]
    -- upvalues: v2 (copy), l_Players_0 (copy), l_CameraInput_0 (copy), v1 (ref), l_CameraUtils_0 (copy), l_VRService_0 (copy)
    local v17 = tick();
    local v18 = v17 - v16.lastUpdate;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    local l_Focus_0 = l_CurrentCamera_0.Focus;
    local v22 = nil;
    if v16.resetCameraAngle then
        local l_v16_HumanoidRootPart_0 = v16:GetHumanoidRootPart();
        v22 = if l_v16_HumanoidRootPart_0 then (l_v16_HumanoidRootPart_0.CFrame * v2).lookVector else v2.lookVector;
        v16.resetCameraAngle = false;
    end;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_v16_Humanoid_0 = v16:GetHumanoid();
    local l_CameraSubject_0 = l_CurrentCamera_0.CameraSubject;
    local v27 = l_CameraSubject_0 and l_CameraSubject_0:IsA("VehicleSeat");
    local v28 = l_CameraSubject_0 and l_CameraSubject_0:IsA("SkateboardPlatform");
    local v29 = l_v16_Humanoid_0 and l_v16_Humanoid_0:GetState() == Enum.HumanoidStateType.Climbing;
    if v16.lastUpdate == nil or v18 > 1 then
        v16.lastCameraTransform = nil;
    end;
    local v30 = l_CameraInput_0.getRotation();
    v16:StepZoom();
    local l_v16_CameraHeight_0 = v16:GetCameraHeight();
    if l_CameraInput_0.getRotation() ~= Vector2.new() then
        v1 = 0;
        v16.lastUserPanCamera = tick();
    end;
    local v32 = v17 - v16.lastUserPanCamera < 2;
    local l_v16_SubjectPosition_0 = v16:GetSubjectPosition();
    if l_v16_SubjectPosition_0 and l_LocalPlayer_0 and l_CurrentCamera_0 then
        local l_v16_CameraToSubjectDistance_0 = v16:GetCameraToSubjectDistance();
        if l_v16_CameraToSubjectDistance_0 < 0.5 then
            l_v16_CameraToSubjectDistance_0 = 0.5;
        end;
        if v16:GetIsMouseLocked() and not v16:IsInFirstPerson() then
            local v35 = v16:CalculateNewLookCFrameFromArg(v22, v30);
            local l_v16_MouseLockOffset_0 = v16:GetMouseLockOffset();
            local v37 = l_v16_MouseLockOffset_0.X * v35.RightVector + l_v16_MouseLockOffset_0.Y * v35.UpVector + l_v16_MouseLockOffset_0.Z * v35.LookVector;
            if l_CameraUtils_0.IsFiniteVector3(v37) then
                l_v16_SubjectPosition_0 = l_v16_SubjectPosition_0 + v37;
            end;
        elseif not (l_CameraInput_0.getRotation() ~= Vector2.new()) and v16.lastCameraTransform then
            local v38 = v16:IsInFirstPerson();
            if (v27 or v28 or v16.isFollowCamera and v29) and v16.lastUpdate and l_v16_Humanoid_0 and l_v16_Humanoid_0.Torso then
                if v38 then
                    if v16.lastSubjectCFrame and (v27 or v28) and l_CameraSubject_0:IsA("BasePart") then
                        local v39 = -l_CameraUtils_0.GetAngleBetweenXZVectors(v16.lastSubjectCFrame.lookVector, l_CameraSubject_0.CFrame.lookVector);
                        if l_CameraUtils_0.IsFinite(v39) then
                            v30 = v30 + Vector2.new(v39, 0);
                        end;
                        v1 = 0;
                    end;
                elseif not v32 then
                    local l_lookVector_0 = l_v16_Humanoid_0.Torso.CFrame.lookVector;
                    v1 = math.clamp(v1 + 3.839724354387525 * v18, 0, 4.363323129985824);
                    local v41 = math.clamp(v1 * v18, 0, 1);
                    if v16:IsInFirstPerson() and (not v16.isFollowCamera or not v16.isClimbing) then
                        v41 = 1;
                    end;
                    local v42 = l_CameraUtils_0.GetAngleBetweenXZVectors(l_lookVector_0, v16:GetCameraLookVector());
                    if l_CameraUtils_0.IsFinite(v42) and math.abs(v42) > 1.0E-4 then
                        v30 = v30 + Vector2.new(v42 * v41, 0);
                    end;
                end;
            elseif v16.isFollowCamera and not v38 and not v32 and not l_VRService_0.VREnabled then
                local v43 = -(v16.lastCameraTransform.p - l_v16_SubjectPosition_0);
                local v44 = l_CameraUtils_0.GetAngleBetweenXZVectors(v43, v16:GetCameraLookVector());
                if l_CameraUtils_0.IsFinite(v44) and math.abs(v44) > 1.0E-4 and math.abs(v44) > 0.4 * v18 then
                    v30 = v30 + Vector2.new(v44, 0);
                end;
            end;
        end;
        if not v16.isFollowCamera then
            local l_VREnabled_0 = l_VRService_0.VREnabled;
            l_Focus_0 = if l_VREnabled_0 then v16:GetVRFocus(l_v16_SubjectPosition_0, v18) else CFrame.new(l_v16_SubjectPosition_0);
            local l_p_0 = l_Focus_0.p;
            if l_VREnabled_0 and not v16:IsInFirstPerson() then
                local l_magnitude_0 = (l_v16_SubjectPosition_0 - l_CurrentCamera_0.CFrame.p).magnitude;
                local l_v30_0 = v30;
                if l_v16_CameraToSubjectDistance_0 < l_magnitude_0 or l_v30_0.x ~= 0 then
                    local v49 = math.min(l_magnitude_0, l_v16_CameraToSubjectDistance_0);
                    local v50 = v16:CalculateNewLookVectorFromArg(nil, v30) * v49;
                    local v51 = l_p_0 - v50;
                    local l_lookVector_1 = l_CurrentCamera_0.CFrame.lookVector;
                    if l_v30_0.x ~= 0 then
                        l_lookVector_1 = v50;
                    end;
                    local v53 = Vector3.new(v51.x + l_lookVector_1.x, v51.y, v51.z + l_lookVector_1.z);
                    l_CFrame_0 = CFrame.new(v51, v53) + Vector3.new(0, l_v16_CameraHeight_0, 0);
                end;
            else
                shared.CameraRotation = v30;
                local v54 = v16:CalculateNewLookVectorFromArg(v22, v30);
                l_CFrame_0 = CFrame.new(l_p_0 - l_v16_CameraToSubjectDistance_0 * v54, l_p_0);
            end;
        else
            local v55 = v16:CalculateNewLookVectorFromArg(v22, v30);
            l_Focus_0 = if l_VRService_0.VREnabled then v16:GetVRFocus(l_v16_SubjectPosition_0, v18) else CFrame.new(l_v16_SubjectPosition_0);
            l_CFrame_0 = CFrame.new(l_Focus_0.p - l_v16_CameraToSubjectDistance_0 * v55, l_Focus_0.p) + Vector3.new(0, l_v16_CameraHeight_0, 0);
        end;
        local l_v16_CameraToggleOffset_0 = v16:GetCameraToggleOffset(v18);
        l_Focus_0 = l_Focus_0 + l_v16_CameraToggleOffset_0;
        l_CFrame_0 = l_CFrame_0 + l_v16_CameraToggleOffset_0;
        v16.lastCameraTransform = l_CFrame_0;
        v16.lastCameraFocus = l_Focus_0;
        if (v27 or v28) and l_CameraSubject_0:IsA("BasePart") then
            v16.lastSubjectCFrame = l_CameraSubject_0.CFrame;
        else
            v16.lastSubjectCFrame = nil;
        end;
    end;
    v16.lastUpdate = v17;
    return l_CFrame_0, l_Focus_0;
end;
v8.EnterFirstPerson = function(v57) --[[ Line: 249 ]] --[[ Name: EnterFirstPerson ]]
    v57.inFirstPerson = true;
    v57:UpdateMouseBehavior();
end;
v8.LeaveFirstPerson = function(v58) --[[ Line: 254 ]] --[[ Name: LeaveFirstPerson ]]
    v58.inFirstPerson = false;
    v58:UpdateMouseBehavior();
end;
return v8;