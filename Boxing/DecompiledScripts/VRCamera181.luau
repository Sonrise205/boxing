local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local _ = require(script.Parent:WaitForChild("CameraUtils"));
local l_VRBaseCamera_0 = require(script.Parent:WaitForChild("VRBaseCamera"));
local v6 = setmetatable({}, l_VRBaseCamera_0);
v6.__index = v6;
local v7 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
    return UserSettings():IsUserFeatureEnabled("UserFlagEnableVRUpdate3");
end);
v7 = l_status_0 and l_result_0;
l_status_0 = nil;
local v10;
l_result_0, v10 = pcall(function() --[[ Line: 33 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRPlaySeatedStanding");
end);
l_status_0 = l_result_0 and v10;
l_result_0 = nil;
local v11;
v10, v11 = pcall(function() --[[ Line: 40 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRFirstPersonRecenter");
end);
l_result_0 = v10 and v11;
v6.new = function() --[[ Line: 46 ]] --[[ Name: new ]]
    -- upvalues: l_VRBaseCamera_0 (copy), v6 (copy)
    local v12 = setmetatable(l_VRBaseCamera_0.new(), v6);
    v12.lastUpdate = tick();
    v12:Reset();
    return v12;
end;
v6.Reset = function(v13) --[[ Line: 55 ]] --[[ Name: Reset ]]
    v13.needsReset = true;
    v13.needsBlackout = true;
    v13.motionDetTime = 0;
    v13.blackOutTimer = 0;
    v13.lastCameraResetPosition = nil;
    v13.stepRotateTimeout = 0;
    v13.cameraOffsetRotation = 0;
    v13.cameraOffsetRotationDiscrete = 0;
end;
v6.Update = function(v14, v15) --[[ Line: 66 ]] --[[ Name: Update ]]
    -- upvalues: l_Players_0 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    local l_Focus_0 = l_CurrentCamera_0.Focus;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local _ = v14:GetHumanoid();
    local _ = l_CurrentCamera_0.CameraSubject;
    if v14.lastUpdate == nil or v15 > 1 then
        v14.lastCameraTransform = nil;
    end;
    v14:UpdateFadeFromBlack(v15);
    v14:UpdateEdgeBlur(l_LocalPlayer_0, v15);
    local l_lastSubjectPosition_0 = v14.lastSubjectPosition;
    local l_v14_SubjectPosition_0 = v14:GetSubjectPosition();
    if v14.needsBlackout then
        v14:StartFadeFromBlack();
        local v24 = math.clamp(v15, 1.0E-4, 0.1);
        v14.blackOutTimer = v14.blackOutTimer + v24;
        if v14.blackOutTimer > 0.1 and game:IsLoaded() then
            v14.needsBlackout = false;
            v14.needsReset = true;
        end;
    end;
    if l_v14_SubjectPosition_0 and l_LocalPlayer_0 and l_CurrentCamera_0 then
        l_Focus_0 = v14:GetVRFocus(l_v14_SubjectPosition_0, v15);
        if v14:IsInFirstPerson() then
            local v25, v26 = v14:UpdateFirstPersonTransform(v15, l_CFrame_0, l_Focus_0, l_lastSubjectPosition_0, l_v14_SubjectPosition_0);
            l_CFrame_0 = v25;
            l_Focus_0 = v26;
        else
            local v27, v28 = v14:UpdateThirdPersonTransform(v15, l_CFrame_0, l_Focus_0, l_lastSubjectPosition_0, l_v14_SubjectPosition_0);
            l_CFrame_0 = v27;
            l_Focus_0 = v28;
        end;
        v14.lastCameraTransform = l_CFrame_0;
        v14.lastCameraFocus = l_Focus_0;
    end;
    v14.lastUpdate = tick();
    return l_CFrame_0, l_Focus_0;
end;
v6.GetAvatarFeetWorldYValue = function(_) --[[ Line: 119 ]] --[[ Name: GetAvatarFeetWorldYValue ]]
    local l_CameraSubject_1 = workspace.CurrentCamera.CameraSubject;
    if not l_CameraSubject_1 then
        return nil;
    elseif l_CameraSubject_1:IsA("Humanoid") and l_CameraSubject_1.RootPart then
        local l_RootPart_0 = l_CameraSubject_1.RootPart;
        return l_RootPart_0.Position.Y - l_RootPart_0.Size.Y / 2 - l_CameraSubject_1.HipHeight;
    else
        return nil;
    end;
end;
v6.UpdateFirstPersonTransform = function(v32, v33, v34, v35, v36, v37) --[[ Line: 134 ]] --[[ Name: UpdateFirstPersonTransform ]]
    -- upvalues: l_result_0 (ref), l_VRService_0 (copy), l_Players_0 (copy), l_CameraInput_0 (copy), v7 (ref), l_UserGameSettings_0 (copy), l_status_0 (ref)
    if v32.needsReset then
        v32:StartFadeFromBlack();
        if l_result_0 then
            l_VRService_0:RecenterUserHeadCFrame();
        end;
        v32.needsReset = false;
        v32.stepRotateTimeout = 0.25;
        v32.VRCameraFocusFrozen = true;
        v32.cameraOffsetRotation = 0;
        v32.cameraOffsetRotationDiscrete = 0;
    end;
    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
    if (v36 - v37).magnitude > 0.01 then
        v32:StartVREdgeBlur(l_LocalPlayer_1);
    end;
    local l_p_0 = v35.p;
    local l_v32_CameraLookVector_0 = v32:GetCameraLookVector();
    l_v32_CameraLookVector_0 = Vector3.new(l_v32_CameraLookVector_0.X, 0, l_v32_CameraLookVector_0.Z).Unit;
    if v32.stepRotateTimeout > 0 then
        v32.stepRotateTimeout = v32.stepRotateTimeout - v33;
    end;
    local v41 = l_CameraInput_0.getRotation();
    local v42 = 0;
    if v7 and l_UserGameSettings_0.VRSmoothRotationEnabled then
        v42 = v41.X;
    elseif v32.stepRotateTimeout <= 0 and math.abs(v41.X) > 0.03 then
        v42 = 0.5;
        if v41.X < 0 then
            v42 = -0.5;
        end;
        v32.needsReset = true;
    end;
    local v43 = v32:CalculateNewLookVectorFromArg(l_v32_CameraLookVector_0, Vector2.new(v42, 0));
    v34 = CFrame.new(l_p_0 - 0.5 * v43, l_p_0);
    if l_status_0 then
        local l_v32_AvatarFeetWorldYValue_0 = v32:GetAvatarFeetWorldYValue();
        if l_UserGameSettings_0.VRPlayMode == Enum.VRPlayMode.Standing and l_v32_AvatarFeetWorldYValue_0 and l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.Floor) then
            local l_CurrentCamera_1 = workspace.CurrentCamera;
            local v46 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Floor).Position.Y * l_CurrentCamera_1.HeadScale;
            v34 = CFrame.new(v34.Position.X, l_v32_AvatarFeetWorldYValue_0 - v46, v34.Position.Z) * v34.Rotation;
        end;
        return v34, v34 * CFrame.new(0, 0, -0.5);
    else
        return v34, v35;
    end;
end;
v6.UpdateThirdPersonTransform = function(v47, v48, v49, v50, v51, v52) --[[ Line: 198 ]] --[[ Name: UpdateThirdPersonTransform ]]
    -- upvalues: l_Players_0 (copy), l_CameraInput_0 (copy), v7 (ref), l_UserGameSettings_0 (copy), l_VRService_0 (copy)
    local l_v47_CameraToSubjectDistance_0 = v47:GetCameraToSubjectDistance();
    if l_v47_CameraToSubjectDistance_0 < 0.5 then
        l_v47_CameraToSubjectDistance_0 = 0.5;
    end;
    if v51 ~= nil and v47.lastCameraFocus ~= nil then
        local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
        local v55 = v51 - v52;
        local l_MoveVector_0 = require(l_LocalPlayer_2:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule")):GetMoveVector();
        local v57 = true;
        if v55.magnitude <= 0.01 then
            v57 = l_MoveVector_0.magnitude > 0.01;
        end;
        if v57 then
            v47.motionDetTime = 0.1;
        end;
        v47.motionDetTime = v47.motionDetTime - v48;
        if v47.motionDetTime > 0 then
            v57 = true;
        end;
        if v57 and not v47.needsReset then
            v50 = v47.lastCameraFocus;
            v47.VRCameraFocusFrozen = true;
            return v49, v50;
        else
            local v58 = true;
            if v47.lastCameraResetPosition ~= nil then
                v58 = (v52 - v47.lastCameraResetPosition).Magnitude > 1;
            end;
            local v59 = l_CameraInput_0.getRotation();
            local v60 = v7 and v59 ~= Vector2.new();
            local v61 = false;
            if v60 and v59.X ~= 0 then
                local v62 = v47.cameraOffsetRotation + v59.X;
                if v62 < -3.141592653589793 then
                    v62 = 3.141592653589793 - (v62 + 3.141592653589793);
                elseif v62 > 3.141592653589793 then
                    v62 = -3.141592653589793 + (v62 - 3.141592653589793);
                end;
                v47.cameraOffsetRotation = math.clamp(v62, -3.141592653589793, 3.141592653589793);
                if l_UserGameSettings_0.VRSmoothRotationEnabled then
                    v47.cameraOffsetRotationDiscrete = v47.cameraOffsetRotation;
                    local l_v47_Humanoid_0 = v47:GetHumanoid();
                    local v64 = l_v47_Humanoid_0.Torso and l_v47_Humanoid_0.Torso.CFrame.lookVector or Vector3.new(1, 0, 0, 0);
                    local v65 = Vector3.new(v64.X, 0, v64.Z);
                    local v66 = v50.Position - v65 * l_v47_CameraToSubjectDistance_0;
                    local v67 = Vector3.new(v50.Position.X, v66.Y, v50.Position.Z);
                    v66 = v67 - (CFrame.new(v66, v67) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), v47.cameraOffsetRotationDiscrete)).LookVector * (v67 - v66).Magnitude;
                    v49 = CFrame.new(v66, v67);
                else
                    local v68 = math.floor(v47.cameraOffsetRotation * 12 / 12);
                    if v68 ~= v47.cameraOffsetRotationDiscrete then
                        v47.cameraOffsetRotationDiscrete = v68;
                        v61 = true;
                    end;
                end;
            end;
            if v47.VRCameraFocusFrozen and v58 or v47.needsReset or v61 then
                if not v61 then
                    v47.cameraOffsetRotationDiscrete = 0;
                    v47.cameraOffsetRotation = 0;
                end;
                l_VRService_0:RecenterUserHeadCFrame();
                v47.VRCameraFocusFrozen = false;
                v47.needsReset = false;
                v47.lastCameraResetPosition = v52;
                v47:ResetZoom();
                v47:StartFadeFromBlack();
                local l_v47_Humanoid_1 = v47:GetHumanoid();
                local v70 = l_v47_Humanoid_1.Torso and l_v47_Humanoid_1.Torso.CFrame.lookVector or Vector3.new(1, 0, 0, 0);
                local v71 = Vector3.new(v70.X, 0, v70.Z);
                local v72 = v50.Position - v71 * l_v47_CameraToSubjectDistance_0;
                local v73 = Vector3.new(v50.Position.X, v72.Y, v50.Position.Z);
                if v7 and v47.cameraOffsetRotation ~= 0 then
                    v72 = v73 - (CFrame.new(v72, v73) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), v47.cameraOffsetRotationDiscrete)).LookVector * (v73 - v72).Magnitude;
                end;
                v49 = CFrame.new(v72, v73);
            end;
        end;
    end;
    return v49, v50;
end;
v6.EnterFirstPerson = function(v74) --[[ Line: 311 ]] --[[ Name: EnterFirstPerson ]]
    -- upvalues: l_result_0 (ref), l_UserGameSettings_0 (copy)
    v74.inFirstPerson = true;
    if l_result_0 then
        v74.needsReset = true;
        v74.vrPlayModeChangedConnection = l_UserGameSettings_0:GetPropertyChangedSignal("VRPlayMode"):Connect(function() --[[ Line: 318 ]]
            -- upvalues: v74 (copy)
            v74.needsReset = true;
        end);
    end;
    v74:UpdateMouseBehavior();
end;
v6.LeaveFirstPerson = function(v75) --[[ Line: 326 ]] --[[ Name: LeaveFirstPerson ]]
    -- upvalues: l_result_0 (ref)
    v75.inFirstPerson = false;
    v75.needsReset = true;
    if l_result_0 and v75.vrPlayModeChangedConnection then
        v75.vrPlayModeChangedConnection:Disconnect();
        v75.vrPlayModeChangedConnection = nil;
    end;
    v75:UpdateMouseBehavior();
    if v75.VRBlur then
        v75.VRBlur.Visible = false;
    end;
end;
return v6;