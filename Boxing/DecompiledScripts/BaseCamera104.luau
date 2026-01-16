local _ = Vector2.new(0.2617993877991494, 0);
local _ = Vector2.new(0.7853981633974483, 0);
local _ = Vector2.new(0, 0);
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local l_ZoomController_0 = require(script.Parent:WaitForChild("ZoomController"));
local l_CameraToggleStateController_0 = require(script.Parent:WaitForChild("CameraToggleStateController"));
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_CameraUI_0 = require(script.Parent:WaitForChild("CameraUI"));
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("StarterGui");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v14 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 63 ]]
    return UserSettings():IsUserFeatureEnabled("UserCameraGamepadZoomFix");
end);
v14 = l_status_0 and l_result_0;
l_status_0 = {};
l_status_0.__index = l_status_0;
l_status_0.new = function() --[[ Line: 73 ]] --[[ Name: new ]]
    -- upvalues: l_status_0 (copy), l_LocalPlayer_0 (copy), l_UserGameSettings_0 (copy)
    local v17 = setmetatable({}, l_status_0);
    v17.FIRST_PERSON_DISTANCE_THRESHOLD = 1;
    v17.cameraType = nil;
    v17.cameraMovementMode = nil;
    v17.lastCameraTransform = nil;
    v17.lastUserPanCamera = tick();
    v17.humanoidRootPart = nil;
    v17.humanoidCache = {};
    v17.lastSubject = nil;
    v17.lastSubjectPosition = Vector3.new(0, 5, 0, 0);
    v17.lastSubjectCFrame = CFrame.new(v17.lastSubjectPosition);
    v17.defaultSubjectDistance = math.clamp(12.5, l_LocalPlayer_0.CameraMinZoomDistance, l_LocalPlayer_0.CameraMaxZoomDistance);
    v17.currentSubjectDistance = math.clamp(12.5, l_LocalPlayer_0.CameraMinZoomDistance, l_LocalPlayer_0.CameraMaxZoomDistance);
    v17.inFirstPerson = false;
    v17.inMouseLockedMode = false;
    v17.portraitMode = false;
    v17.isSmallTouchScreen = false;
    v17.resetCameraAngle = true;
    v17.enabled = false;
    v17.PlayerGui = nil;
    v17.cameraChangedConn = nil;
    v17.viewportSizeChangedConn = nil;
    v17.shouldUseVRRotation = false;
    v17.VRRotationIntensityAvailable = false;
    v17.lastVRRotationIntensityCheckTime = 0;
    v17.lastVRRotationTime = 0;
    v17.vrRotateKeyCooldown = {};
    v17.cameraTranslationConstraints = Vector3.new(1, 1, 1, 0);
    v17.humanoidJumpOrigin = nil;
    v17.trackingHumanoid = nil;
    v17.cameraFrozen = false;
    v17.subjectStateChangedConn = nil;
    v17.gamepadZoomPressConnection = nil;
    v17.mouseLockOffset = Vector3.new(0, 0, 0, 0);
    if l_LocalPlayer_0.Character then
        v17:OnCharacterAdded(l_LocalPlayer_0.Character);
    end;
    l_LocalPlayer_0.CharacterAdded:Connect(function(v18) --[[ Line: 141 ]]
        -- upvalues: v17 (copy)
        v17:OnCharacterAdded(v18);
    end);
    if v17.cameraChangedConn then
        v17.cameraChangedConn:Disconnect();
    end;
    v17.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 146 ]]
        -- upvalues: v17 (copy)
        v17:OnCurrentCameraChanged();
    end);
    v17:OnCurrentCameraChanged();
    if v17.playerCameraModeChangeConn then
        v17.playerCameraModeChangeConn:Disconnect();
    end;
    v17.playerCameraModeChangeConn = l_LocalPlayer_0:GetPropertyChangedSignal("CameraMode"):Connect(function() --[[ Line: 152 ]]
        -- upvalues: v17 (copy)
        v17:OnPlayerCameraPropertyChange();
    end);
    if v17.minDistanceChangeConn then
        v17.minDistanceChangeConn:Disconnect();
    end;
    v17.minDistanceChangeConn = l_LocalPlayer_0:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function() --[[ Line: 157 ]]
        -- upvalues: v17 (copy)
        v17:OnPlayerCameraPropertyChange();
    end);
    if v17.maxDistanceChangeConn then
        v17.maxDistanceChangeConn:Disconnect();
    end;
    v17.maxDistanceChangeConn = l_LocalPlayer_0:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function() --[[ Line: 162 ]]
        -- upvalues: v17 (copy)
        v17:OnPlayerCameraPropertyChange();
    end);
    if v17.playerDevTouchMoveModeChangeConn then
        v17.playerDevTouchMoveModeChangeConn:Disconnect();
    end;
    v17.playerDevTouchMoveModeChangeConn = l_LocalPlayer_0:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() --[[ Line: 167 ]]
        -- upvalues: v17 (copy)
        v17:OnDevTouchMovementModeChanged();
    end);
    v17:OnDevTouchMovementModeChanged();
    if v17.gameSettingsTouchMoveMoveChangeConn then
        v17.gameSettingsTouchMoveMoveChangeConn:Disconnect();
    end;
    v17.gameSettingsTouchMoveMoveChangeConn = l_UserGameSettings_0:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[ Line: 173 ]]
        -- upvalues: v17 (copy)
        v17:OnGameSettingsTouchMovementModeChanged();
    end);
    v17:OnGameSettingsTouchMovementModeChanged();
    l_UserGameSettings_0:SetCameraYInvertVisible();
    l_UserGameSettings_0:SetGamepadCameraSensitivityVisible();
    v17.hasGameLoaded = game:IsLoaded();
    if not v17.hasGameLoaded then
        v17.gameLoadedConn = game.Loaded:Connect(function() --[[ Line: 183 ]]
            -- upvalues: v17 (copy)
            v17.hasGameLoaded = true;
            v17.gameLoadedConn:Disconnect();
            v17.gameLoadedConn = nil;
        end);
    end;
    v17:OnPlayerCameraPropertyChange();
    return v17;
end;
l_status_0.GetModuleName = function(_) --[[ Line: 195 ]] --[[ Name: GetModuleName ]]
    return "BaseCamera";
end;
l_status_0.OnCharacterAdded = function(v20, v21) --[[ Line: 199 ]] --[[ Name: OnCharacterAdded ]]
    -- upvalues: l_UserInputService_0 (copy), l_LocalPlayer_0 (copy)
    v20.resetCameraAngle = v20.resetCameraAngle or v20:GetEnabled();
    v20.humanoidRootPart = nil;
    if l_UserInputService_0.TouchEnabled then
        v20.PlayerGui = l_LocalPlayer_0:WaitForChild("PlayerGui");
        for _, v23 in ipairs(v21:GetChildren()) do
            if v23:IsA("Tool") then
                v20.isAToolEquipped = true;
            end;
        end;
        v21.ChildAdded:Connect(function(v24) --[[ Line: 209 ]]
            -- upvalues: v20 (copy)
            if v24:IsA("Tool") then
                v20.isAToolEquipped = true;
            end;
        end);
        v21.ChildRemoved:Connect(function(v25) --[[ Line: 214 ]]
            -- upvalues: v20 (copy)
            if v25:IsA("Tool") then
                v20.isAToolEquipped = false;
            end;
        end);
    end;
end;
l_status_0.GetHumanoidRootPart = function(v26) --[[ Line: 222 ]] --[[ Name: GetHumanoidRootPart ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if not v26.humanoidRootPart and l_LocalPlayer_0.Character then
        local l_Humanoid_0 = l_LocalPlayer_0.Character:FindFirstChildOfClass("Humanoid");
        if l_Humanoid_0 then
            v26.humanoidRootPart = l_Humanoid_0.RootPart;
        end;
    end;
    return v26.humanoidRootPart;
end;
l_status_0.GetBodyPartToFollow = function(_, v29, _) --[[ Line: 234 ]] --[[ Name: GetBodyPartToFollow ]]
    if v29:GetState() == Enum.HumanoidStateType.Dead then
        local l_Parent_0 = v29.Parent;
        if l_Parent_0 and l_Parent_0:IsA("Model") then
            return l_Parent_0:FindFirstChild("Head") or v29.RootPart;
        end;
    end;
    return v29.RootPart;
end;
l_status_0.GetSubjectCFrame = function(v32) --[[ Line: 246 ]] --[[ Name: GetSubjectCFrame ]]
    local l_lastSubjectCFrame_0 = v32.lastSubjectCFrame;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v35 = l_CurrentCamera_0 and l_CurrentCamera_0.CameraSubject;
    if not v35 then
        return l_lastSubjectCFrame_0;
    else
        if v35:IsA("Humanoid") then
            local v36 = v35:GetState() == Enum.HumanoidStateType.Dead;
            local l_RootPart_0 = v35.RootPart;
            if v36 and v35.Parent and v35.Parent:IsA("Model") then
                l_RootPart_0 = v35.Parent:FindFirstChild("Head") or l_RootPart_0;
            end;
            if l_RootPart_0 and l_RootPart_0:IsA("BasePart") then
                local v38 = nil;
                if v35.RigType == Enum.HumanoidRigType.R15 then
                    if v35.AutomaticScalingEnabled then
                        v38 = Vector3.new(0, 1.5, 0, 0);
                        local l_RootPart_1 = v35.RootPart;
                        if l_RootPart_0 == l_RootPart_1 then
                            v38 = v38 + Vector3.new(0, (l_RootPart_1.Size.Y - Vector3.new(2, 2, 1, 0).Y) / 2, 0);
                        end;
                    else
                        v38 = Vector3.new(0, 2, 0, 0);
                    end;
                else
                    v38 = Vector3.new(0, 1.5, 0, 0);
                end;
                if v36 then
                    v38 = Vector3.new(0, 0, 0, 0);
                end;
                l_lastSubjectCFrame_0 = l_RootPart_0.CFrame * CFrame.new(v38 + v35.CameraOffset);
            end;
        elseif v35:IsA("BasePart") then
            l_lastSubjectCFrame_0 = v35.CFrame;
        elseif v35:IsA("Model") then
            l_lastSubjectCFrame_0 = if v35.PrimaryPart then v35:GetPrimaryPartCFrame() else CFrame.new();
        end;
        if l_lastSubjectCFrame_0 then
            v32.lastSubjectCFrame = l_lastSubjectCFrame_0;
        end;
        return l_lastSubjectCFrame_0;
    end;
end;
l_status_0.GetSubjectVelocity = function(_) --[[ Line: 312 ]] --[[ Name: GetSubjectVelocity ]]
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v42 = l_CurrentCamera_1 and l_CurrentCamera_1.CameraSubject;
    if not v42 then
        return (Vector3.new(0, 0, 0, 0));
    elseif v42:IsA("BasePart") then
        return v42.Velocity;
    else
        if v42:IsA("Humanoid") then
            local l_RootPart_2 = v42.RootPart;
            if l_RootPart_2 then
                return l_RootPart_2.Velocity;
            end;
        elseif v42:IsA("Model") then
            local l_PrimaryPart_0 = v42.PrimaryPart;
            if l_PrimaryPart_0 then
                return l_PrimaryPart_0.Velocity;
            end;
        end;
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
l_status_0.GetSubjectRotVelocity = function(_) --[[ Line: 341 ]] --[[ Name: GetSubjectRotVelocity ]]
    local l_CurrentCamera_2 = workspace.CurrentCamera;
    local v47 = l_CurrentCamera_2 and l_CurrentCamera_2.CameraSubject;
    if not v47 then
        return (Vector3.new(0, 0, 0, 0));
    elseif v47:IsA("BasePart") then
        return v47.RotVelocity;
    else
        if v47:IsA("Humanoid") then
            local l_RootPart_3 = v47.RootPart;
            if l_RootPart_3 then
                return l_RootPart_3.RotVelocity;
            end;
        elseif v47:IsA("Model") then
            local l_PrimaryPart_1 = v47.PrimaryPart;
            if l_PrimaryPart_1 then
                return l_PrimaryPart_1.RotVelocity;
            end;
        end;
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
l_status_0.StepZoom = function(v50) --[[ Line: 370 ]] --[[ Name: StepZoom ]]
    -- upvalues: l_CameraInput_0 (copy), l_ZoomController_0 (copy)
    local l_currentSubjectDistance_0 = v50.currentSubjectDistance;
    local v52 = l_CameraInput_0.getZoomDelta();
    if math.abs(v52) > 0 then
        local v53 = nil;
        v53 = if v52 > 0 then math.max(l_currentSubjectDistance_0 + v52 * (l_currentSubjectDistance_0 * 0.5 + 1), v50.FIRST_PERSON_DISTANCE_THRESHOLD) else math.max((l_currentSubjectDistance_0 + v52) / (1 - v52 * 0.5), 0.5);
        if v53 < v50.FIRST_PERSON_DISTANCE_THRESHOLD then
            v53 = 0.5;
        end;
        v50:SetCameraToSubjectDistance(v53);
    end;
    return l_ZoomController_0.GetZoomRadius();
end;
l_status_0.GetSubjectPosition = function(v54) --[[ Line: 395 ]] --[[ Name: GetSubjectPosition ]]
    local l_lastSubjectPosition_0 = v54.lastSubjectPosition;
    local l_CurrentCamera_3 = game.Workspace.CurrentCamera;
    local v57 = l_CurrentCamera_3 and l_CurrentCamera_3.CameraSubject;
    if v57 then
        if v57:IsA("Humanoid") then
            local v58 = v57:GetState() == Enum.HumanoidStateType.Dead;
            local l_RootPart_4 = v57.RootPart;
            if v58 and v57.Parent and v57.Parent:IsA("Model") then
                l_RootPart_4 = v57.Parent:FindFirstChild("Head") or l_RootPart_4;
            end;
            if l_RootPart_4 and l_RootPart_4:IsA("BasePart") then
                local v60 = nil;
                if v57.RigType == Enum.HumanoidRigType.R15 then
                    if v57.AutomaticScalingEnabled then
                        v60 = Vector3.new(0, 1.5, 0, 0);
                        if l_RootPart_4 == v57.RootPart then
                            v60 = v60 + Vector3.new(0, v57.RootPart.Size.Y / 2 - Vector3.new(2, 2, 1, 0).Y / 2, 0);
                        end;
                    else
                        v60 = Vector3.new(0, 2, 0, 0);
                    end;
                else
                    v60 = Vector3.new(0, 1.5, 0, 0);
                end;
                if v58 then
                    v60 = Vector3.new(0, 0, 0, 0);
                end;
                l_lastSubjectPosition_0 = l_RootPart_4.CFrame.p + l_RootPart_4.CFrame:vectorToWorldSpace(v60 + v57.CameraOffset);
            end;
        elseif v57:IsA("VehicleSeat") then
            l_lastSubjectPosition_0 = v57.CFrame.p + v57.CFrame:vectorToWorldSpace((Vector3.new(0, 5, 0, 0)));
        elseif v57:IsA("SkateboardPlatform") then
            l_lastSubjectPosition_0 = v57.CFrame.p + Vector3.new(0, 5, 0, 0);
        elseif v57:IsA("BasePart") then
            l_lastSubjectPosition_0 = v57.CFrame.p;
        elseif v57:IsA("Model") then
            l_lastSubjectPosition_0 = if v57.PrimaryPart then v57:GetPrimaryPartCFrame().p else v57:GetModelCFrame().p;
        end;
        v54.lastSubject = v57;
        v54.lastSubjectPosition = l_lastSubjectPosition_0;
        return l_lastSubjectPosition_0;
    else
        return nil;
    end;
end;
l_status_0.UpdateDefaultSubjectDistance = function(v61) --[[ Line: 465 ]] --[[ Name: UpdateDefaultSubjectDistance ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if v61.portraitMode then
        v61.defaultSubjectDistance = math.clamp(25, l_LocalPlayer_0.CameraMinZoomDistance, l_LocalPlayer_0.CameraMaxZoomDistance);
        return;
    else
        v61.defaultSubjectDistance = math.clamp(12.5, l_LocalPlayer_0.CameraMinZoomDistance, l_LocalPlayer_0.CameraMaxZoomDistance);
        return;
    end;
end;
l_status_0.OnViewportSizeChanged = function(v62) --[[ Line: 473 ]] --[[ Name: OnViewportSizeChanged ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_ViewportSize_0 = game.Workspace.CurrentCamera.ViewportSize;
    v62.portraitMode = l_ViewportSize_0.X < l_ViewportSize_0.Y;
    v62.isSmallTouchScreen = l_UserInputService_0.TouchEnabled and (l_ViewportSize_0.Y < 500 or l_ViewportSize_0.X < 700);
    v62:UpdateDefaultSubjectDistance();
end;
l_status_0.OnCurrentCameraChanged = function(v64) --[[ Line: 483 ]] --[[ Name: OnCurrentCameraChanged ]]
    -- upvalues: l_UserInputService_0 (copy)
    if l_UserInputService_0.TouchEnabled then
        if v64.viewportSizeChangedConn then
            v64.viewportSizeChangedConn:Disconnect();
            v64.viewportSizeChangedConn = nil;
        end;
        local l_CurrentCamera_4 = game.Workspace.CurrentCamera;
        if l_CurrentCamera_4 then
            v64:OnViewportSizeChanged();
            v64.viewportSizeChangedConn = l_CurrentCamera_4:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 494 ]]
                -- upvalues: v64 (copy)
                v64:OnViewportSizeChanged();
            end);
        end;
    end;
    if v64.cameraSubjectChangedConn then
        v64.cameraSubjectChangedConn:Disconnect();
        v64.cameraSubjectChangedConn = nil;
    end;
    local l_CurrentCamera_5 = game.Workspace.CurrentCamera;
    if l_CurrentCamera_5 then
        v64.cameraSubjectChangedConn = l_CurrentCamera_5:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 508 ]]
            -- upvalues: v64 (copy)
            v64:OnNewCameraSubject();
        end);
        v64:OnNewCameraSubject();
    end;
end;
l_status_0.OnDynamicThumbstickEnabled = function(v67) --[[ Line: 515 ]] --[[ Name: OnDynamicThumbstickEnabled ]]
    -- upvalues: l_UserInputService_0 (copy)
    if l_UserInputService_0.TouchEnabled then
        v67.isDynamicThumbstickEnabled = true;
    end;
end;
l_status_0.OnDynamicThumbstickDisabled = function(v68) --[[ Line: 521 ]] --[[ Name: OnDynamicThumbstickDisabled ]]
    v68.isDynamicThumbstickEnabled = false;
end;
l_status_0.OnGameSettingsTouchMovementModeChanged = function(v69) --[[ Line: 525 ]] --[[ Name: OnGameSettingsTouchMovementModeChanged ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_UserGameSettings_0 (copy)
    if l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice then
        if l_UserGameSettings_0.TouchMovementMode == Enum.TouchMovementMode.DynamicThumbstick or l_UserGameSettings_0.TouchMovementMode == Enum.TouchMovementMode.Default then
            v69:OnDynamicThumbstickEnabled();
            return;
        else
            v69:OnDynamicThumbstickDisabled();
        end;
    end;
end;
l_status_0.OnDevTouchMovementModeChanged = function(v70) --[[ Line: 536 ]] --[[ Name: OnDevTouchMovementModeChanged ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.DynamicThumbstick then
        v70:OnDynamicThumbstickEnabled();
        return;
    else
        v70:OnGameSettingsTouchMovementModeChanged();
        return;
    end;
end;
l_status_0.OnPlayerCameraPropertyChange = function(v71) --[[ Line: 544 ]] --[[ Name: OnPlayerCameraPropertyChange ]]
    v71:SetCameraToSubjectDistance(v71.currentSubjectDistance);
end;
l_status_0.InputTranslationToCameraAngleChange = function(_, v73, v74) --[[ Line: 549 ]] --[[ Name: InputTranslationToCameraAngleChange ]]
    return v73 * v74;
end;
l_status_0.GamepadZoomPress = function(v75) --[[ Line: 553 ]] --[[ Name: GamepadZoomPress ]]
    -- upvalues: v14 (ref), l_LocalPlayer_0 (copy)
    local l_v75_CameraToSubjectDistance_0 = v75:GetCameraToSubjectDistance();
    if v14 then
        local l_CameraMinZoomDistance_0 = l_LocalPlayer_0.CameraMinZoomDistance;
        local l_CameraMaxZoomDistance_0 = l_LocalPlayer_0.CameraMaxZoomDistance;
        local v79 = 0;
        if l_CameraMinZoomDistance_0 > 0.5 then
            v79 = l_CameraMinZoomDistance_0;
        end;
        local v80 = v79 + 10;
        local v81 = v80 + 10;
        if l_CameraMaxZoomDistance_0 < v81 then
            v81 = l_CameraMaxZoomDistance_0;
            v80 = v79 + (v81 - v79) / 2;
        end;
        if (v80 + v81) / 2 < l_v75_CameraToSubjectDistance_0 then
            v75:SetCameraToSubjectDistance(v80);
            return;
        elseif (v79 + v80) / 2 < l_v75_CameraToSubjectDistance_0 then
            v75:SetCameraToSubjectDistance(v79);
            return;
        else
            v75:SetCameraToSubjectDistance(v81);
            return;
        end;
    elseif l_v75_CameraToSubjectDistance_0 > 15 then
        v75:SetCameraToSubjectDistance(10);
        return;
    elseif l_v75_CameraToSubjectDistance_0 > 5 then
        v75:SetCameraToSubjectDistance(0);
        return;
    else
        v75:SetCameraToSubjectDistance(20);
        return;
    end;
end;
l_status_0.Enable = function(v82, v83) --[[ Line: 594 ]] --[[ Name: Enable ]]
    -- upvalues: l_CameraInput_0 (copy), l_LocalPlayer_0 (copy)
    if v82.enabled ~= v83 then
        v82.enabled = v83;
        if v82.enabled then
            l_CameraInput_0.setInputEnabled(true);
            v82.gamepadZoomPressConnection = l_CameraInput_0.gamepadZoomPress:Connect(function() --[[ Line: 600 ]]
                -- upvalues: v82 (copy)
                v82:GamepadZoomPress();
            end);
            if l_LocalPlayer_0.CameraMode == Enum.CameraMode.LockFirstPerson then
                v82.currentSubjectDistance = 0.5;
                if not v82.inFirstPerson then
                    v82:EnterFirstPerson();
                end;
            end;
        else
            l_CameraInput_0.setInputEnabled(false);
            if v82.gamepadZoomPressConnection then
                v82.gamepadZoomPressConnection:Disconnect();
                v82.gamepadZoomPressConnection = nil;
            end;
            v82:Cleanup();
        end;
        v82:OnEnable(v83);
    end;
end;
l_status_0.OnEnable = function(_, _) --[[ Line: 625 ]] --[[ Name: OnEnable ]]

end;
l_status_0.GetEnabled = function(v86) --[[ Line: 629 ]] --[[ Name: GetEnabled ]]
    return v86.enabled;
end;
l_status_0.Cleanup = function(v87) --[[ Line: 633 ]] --[[ Name: Cleanup ]]
    -- upvalues: l_CameraUtils_0 (copy)
    if v87.subjectStateChangedConn then
        v87.subjectStateChangedConn:Disconnect();
        v87.subjectStateChangedConn = nil;
    end;
    if v87.viewportSizeChangedConn then
        v87.viewportSizeChangedConn:Disconnect();
        v87.viewportSizeChangedConn = nil;
    end;
    v87.lastCameraTransform = nil;
    v87.lastSubjectCFrame = nil;
    l_CameraUtils_0.restoreMouseBehavior();
end;
l_status_0.UpdateMouseBehavior = function(v88) --[[ Line: 650 ]] --[[ Name: UpdateMouseBehavior ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_CameraUI_0 (copy), l_CameraInput_0 (copy), l_CameraToggleStateController_0 (copy), l_CameraUtils_0 (copy)
    local v89 = l_UserGameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove;
    if v88.isCameraToggle and v89 == false then
        l_CameraUI_0.setCameraModeToastEnabled(true);
        l_CameraInput_0.enableCameraToggleInput();
        l_CameraToggleStateController_0(v88.inFirstPerson);
        return;
    else
        l_CameraUI_0.setCameraModeToastEnabled(false);
        l_CameraInput_0.disableCameraToggleInput();
        if v88.inFirstPerson or v88.inMouseLockedMode then
            l_CameraUtils_0.setRotationTypeOverride(Enum.RotationType.CameraRelative);
            l_CameraUtils_0.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter);
            return;
        else
            l_CameraUtils_0.restoreRotationType();
            if l_CameraInput_0.getRotationActivated() then
                l_CameraUtils_0.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition);
                return;
            else
                l_CameraUtils_0.restoreMouseBehavior();
                return;
            end;
        end;
    end;
end;
l_status_0.UpdateForDistancePropertyChange = function(v90) --[[ Line: 678 ]] --[[ Name: UpdateForDistancePropertyChange ]]
    v90:SetCameraToSubjectDistance(v90.currentSubjectDistance);
end;
l_status_0.SetCameraToSubjectDistance = function(v91, v92) --[[ Line: 684 ]] --[[ Name: SetCameraToSubjectDistance ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ZoomController_0 (copy)
    local l_currentSubjectDistance_1 = v91.currentSubjectDistance;
    if l_LocalPlayer_0.CameraMode == Enum.CameraMode.LockFirstPerson then
        v91.currentSubjectDistance = 0.5;
        if not v91.inFirstPerson then
            v91:EnterFirstPerson();
        end;
    else
        local v94 = math.clamp(v92, l_LocalPlayer_0.CameraMinZoomDistance, l_LocalPlayer_0.CameraMaxZoomDistance);
        if v94 < 1 then
            v91.currentSubjectDistance = 0.5;
            if not v91.inFirstPerson then
                v91:EnterFirstPerson();
            end;
        else
            v91.currentSubjectDistance = v94;
            if v91.inFirstPerson then
                v91:LeaveFirstPerson();
            end;
        end;
    end;
    l_ZoomController_0.SetZoomParameters(v91.currentSubjectDistance, (math.sign(v92 - l_currentSubjectDistance_1)));
    return v91.currentSubjectDistance;
end;
l_status_0.SetCameraType = function(v95, v96) --[[ Line: 718 ]] --[[ Name: SetCameraType ]]
    v95.cameraType = v96;
end;
l_status_0.GetCameraType = function(v97) --[[ Line: 723 ]] --[[ Name: GetCameraType ]]
    return v97.cameraType;
end;
l_status_0.SetCameraMovementMode = function(v98, v99) --[[ Line: 728 ]] --[[ Name: SetCameraMovementMode ]]
    v98.cameraMovementMode = v99;
end;
l_status_0.GetCameraMovementMode = function(v100) --[[ Line: 732 ]] --[[ Name: GetCameraMovementMode ]]
    return v100.cameraMovementMode;
end;
l_status_0.SetIsMouseLocked = function(v101, v102) --[[ Line: 736 ]] --[[ Name: SetIsMouseLocked ]]
    v101.inMouseLockedMode = v102;
end;
l_status_0.GetIsMouseLocked = function(v103) --[[ Line: 740 ]] --[[ Name: GetIsMouseLocked ]]
    return v103.inMouseLockedMode;
end;
l_status_0.SetMouseLockOffset = function(v104, v105) --[[ Line: 744 ]] --[[ Name: SetMouseLockOffset ]]
    v104.mouseLockOffset = v105;
end;
l_status_0.GetMouseLockOffset = function(v106) --[[ Line: 748 ]] --[[ Name: GetMouseLockOffset ]]
    return v106.mouseLockOffset;
end;
l_status_0.InFirstPerson = function(v107) --[[ Line: 752 ]] --[[ Name: InFirstPerson ]]
    return v107.inFirstPerson;
end;
l_status_0.EnterFirstPerson = function(_) --[[ Line: 756 ]] --[[ Name: EnterFirstPerson ]]

end;
l_status_0.LeaveFirstPerson = function(_) --[[ Line: 760 ]] --[[ Name: LeaveFirstPerson ]]

end;
l_status_0.GetCameraToSubjectDistance = function(v110) --[[ Line: 765 ]] --[[ Name: GetCameraToSubjectDistance ]]
    return v110.currentSubjectDistance;
end;
l_status_0.GetMeasuredDistanceToFocus = function(_) --[[ Line: 772 ]] --[[ Name: GetMeasuredDistanceToFocus ]]
    local l_CurrentCamera_6 = game.Workspace.CurrentCamera;
    if l_CurrentCamera_6 then
        return (l_CurrentCamera_6.CoordinateFrame.p - l_CurrentCamera_6.Focus.p).magnitude;
    else
        return nil;
    end;
end;
l_status_0.GetCameraLookVector = function(_) --[[ Line: 780 ]] --[[ Name: GetCameraLookVector ]]
    return game.Workspace.CurrentCamera and game.Workspace.CurrentCamera.CFrame.LookVector or Vector3.new(0, 0, 1, 0);
end;
l_status_0.CalculateNewLookCFrameFromArg = function(v114, v115, v116) --[[ Line: 784 ]] --[[ Name: CalculateNewLookCFrameFromArg ]]
    local v117 = v115 or v114:GetCameraLookVector();
    local v118 = math.asin(v117.Y);
    local v119 = math.clamp(v116.Y, v118 + -1.3962634015954636, v118 + 1.3962634015954636);
    local v120 = Vector2.new(v116.X, v119);
    local v121 = CFrame.new(Vector3.new(0, 0, 0, 0), v117);
    return CFrame.Angles(0, -v120.X, 0) * v121 * CFrame.Angles(-v120.Y, 0, 0);
end;
l_status_0.CalculateNewLookVectorFromArg = function(v122, v123, v124) --[[ Line: 794 ]] --[[ Name: CalculateNewLookVectorFromArg ]]
    return v122:CalculateNewLookCFrameFromArg(v123, v124).LookVector;
end;
l_status_0.CalculateNewLookVectorVRFromArg = function(v125, v126) --[[ Line: 799 ]] --[[ Name: CalculateNewLookVectorVRFromArg ]]
    local l_unit_0 = ((v125:GetSubjectPosition() - game.Workspace.CurrentCamera.CFrame.p) * Vector3.new(1, 0, 1, 0)).unit;
    local v128 = Vector2.new(v126.X, 0);
    local v129 = CFrame.new(Vector3.new(0, 0, 0, 0), l_unit_0);
    return ((CFrame.Angles(0, -v128.X, 0) * v129 * CFrame.Angles(-v128.Y, 0, 0)).LookVector * Vector3.new(1, 0, 1, 0)).unit;
end;
l_status_0.GetHumanoid = function(v130) --[[ Line: 809 ]] --[[ Name: GetHumanoid ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local v131 = l_LocalPlayer_0 and l_LocalPlayer_0.Character;
    if v131 then
        local v132 = v130.humanoidCache[l_LocalPlayer_0];
        if v132 and v132.Parent == v131 then
            return v132;
        else
            v130.humanoidCache[l_LocalPlayer_0] = nil;
            local l_Humanoid_1 = v131:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_1 then
                v130.humanoidCache[l_LocalPlayer_0] = l_Humanoid_1;
            end;
            return l_Humanoid_1;
        end;
    else
        return nil;
    end;
end;
l_status_0.GetHumanoidPartToFollow = function(_, v135, v136) --[[ Line: 827 ]] --[[ Name: GetHumanoidPartToFollow ]]
    if v136 == Enum.HumanoidStateType.Dead then
        local l_Parent_1 = v135.Parent;
        if l_Parent_1 then
            return l_Parent_1:FindFirstChild("Head") or v135.Torso;
        else
            return v135.Torso;
        end;
    else
        return v135.Torso;
    end;
end;
l_status_0.OnNewCameraSubject = function(v138) --[[ Line: 841 ]] --[[ Name: OnNewCameraSubject ]]
    if v138.subjectStateChangedConn then
        v138.subjectStateChangedConn:Disconnect();
        v138.subjectStateChangedConn = nil;
    end;
end;
l_status_0.IsInFirstPerson = function(v139) --[[ Line: 848 ]] --[[ Name: IsInFirstPerson ]]
    return v139.inFirstPerson;
end;
l_status_0.Update = function(_, _) --[[ Line: 852 ]] --[[ Name: Update ]]
    error("BaseCamera:Update() This is a virtual function that should never be getting called.", 2);
end;
l_status_0.GetCameraHeight = function(v142) --[[ Line: 856 ]] --[[ Name: GetCameraHeight ]]
    -- upvalues: l_VRService_0 (copy)
    if l_VRService_0.VREnabled and not v142.inFirstPerson then
        return 0.25881904510252074 * v142.currentSubjectDistance;
    else
        return 0;
    end;
end;
return l_status_0;