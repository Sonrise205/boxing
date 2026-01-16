local v0 = {};
v0.__index = v0;
local v1 = {
    "CameraMinZoomDistance", 
    "CameraMaxZoomDistance", 
    "CameraMode", 
    "DevCameraOcclusionMode", 
    "DevComputerCameraMode", 
    "DevTouchCameraMode", 
    "DevComputerMovementMode", 
    "DevTouchMovementMode", 
    "DevEnableMouseLock"
};
local v2 = {
    "ComputerCameraMovementMode", 
    "ComputerMovementMode", 
    "ControlMode", 
    "GamepadCameraSensitivity", 
    "MouseSensitivity", 
    "RotationType", 
    "TouchCameraMovementMode", 
    "TouchMovementMode"
};
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_CameraUtils_0 = require(script:WaitForChild("CameraUtils"));
local l_CameraInput_0 = require(script:WaitForChild("CameraInput"));
local l_ClassicCamera_0 = require(script:WaitForChild("ClassicCamera"));
local l_OrbitalCamera_0 = require(script:WaitForChild("OrbitalCamera"));
local l_LegacyCamera_0 = require(script:WaitForChild("LegacyCamera"));
local l_VehicleCamera_0 = require(script:WaitForChild("VehicleCamera"));
local l_VRCamera_0 = require(script:WaitForChild("VRCamera"));
local l_VRVehicleCamera_0 = require(script:WaitForChild("VRVehicleCamera"));
local l_Invisicam_0 = require(script:WaitForChild("Invisicam"));
local l_Poppercam_0 = require(script:WaitForChild("Poppercam"));
local l_TransparencyController_0 = require(script:WaitForChild("TransparencyController"));
local l_MouseLockController_0 = require(script:WaitForChild("MouseLockController"));
local v20 = {};
local v21 = {};
local l_PlayerScripts_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerScripts");
l_PlayerScripts_0:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default);
l_PlayerScripts_0:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow);
l_PlayerScripts_0:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic);
l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default);
l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow);
l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic);
l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle);
v0.new = function() --[[ Line: 95 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), l_Players_0 (copy), l_TransparencyController_0 (copy), l_UserInputService_0 (copy), l_MouseLockController_0 (copy), l_RunService_0 (copy), v1 (copy), v2 (copy), l_UserGameSettings_0 (copy)
    local v23 = setmetatable({}, v0);
    v23.activeCameraController = nil;
    v23.activeOcclusionModule = nil;
    v23.activeTransparencyController = nil;
    v23.activeMouseLockController = nil;
    v23.currentComputerCameraMovementMode = nil;
    v23.cameraSubjectChangedConn = nil;
    v23.cameraTypeChangedConn = nil;
    for _, v25 in pairs(l_Players_0:GetPlayers()) do
        v23:OnPlayerAdded(v25);
    end;
    l_Players_0.PlayerAdded:Connect(function(v26) --[[ Line: 116 ]]
        -- upvalues: v23 (copy)
        v23:OnPlayerAdded(v26);
    end);
    v23.activeTransparencyController = l_TransparencyController_0.new();
    v23.activeTransparencyController:Enable(true);
    if not l_UserInputService_0.TouchEnabled then
        v23.activeMouseLockController = l_MouseLockController_0.new();
        local l_BindableToggleEvent_0 = v23.activeMouseLockController:GetBindableToggleEvent();
        if l_BindableToggleEvent_0 then
            l_BindableToggleEvent_0:Connect(function() --[[ Line: 127 ]]
                -- upvalues: v23 (copy)
                v23:OnMouseLockToggled();
            end);
        end;
    end;
    v23:ActivateCameraController(v23:GetCameraControlChoice());
    v23:ActivateOcclusionModule(l_Players_0.LocalPlayer.DevCameraOcclusionMode);
    v23:OnCurrentCameraChanged();
    l_RunService_0:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(v28) --[[ Line: 136 ]]
        -- upvalues: v23 (copy)
        v23:Update(v28);
    end);
    for _, v30 in pairs(v1) do
        l_Players_0.LocalPlayer:GetPropertyChangedSignal(v30):Connect(function() --[[ Line: 140 ]]
            -- upvalues: v23 (copy), v30 (copy)
            v23:OnLocalPlayerCameraPropertyChanged(v30);
        end);
    end;
    for _, v32 in pairs(v2) do
        l_UserGameSettings_0:GetPropertyChangedSignal(v32):Connect(function() --[[ Line: 146 ]]
            -- upvalues: v23 (copy), v32 (copy)
            v23:OnUserGameSettingsPropertyChanged(v32);
        end);
    end;
    game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 150 ]]
        -- upvalues: v23 (copy)
        v23:OnCurrentCameraChanged();
    end);
    return v23;
end;
v0.GetCameraMovementModeFromSettings = function(_) --[[ Line: 157 ]] --[[ Name: GetCameraMovementModeFromSettings ]]
    -- upvalues: l_Players_0 (copy), l_CameraUtils_0 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy)
    if l_Players_0.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
        return l_CameraUtils_0.ConvertCameraModeEnumToStandard(Enum.ComputerCameraMovementMode.Classic);
    else
        local v34 = nil;
        local v35 = nil;
        if l_UserInputService_0.TouchEnabled then
            v34 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_Players_0.LocalPlayer.DevTouchCameraMode);
            v35 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.TouchCameraMovementMode);
        else
            v34 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_Players_0.LocalPlayer.DevComputerCameraMode);
            v35 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.ComputerCameraMovementMode);
        end;
        if v34 == Enum.DevComputerCameraMovementMode.UserChoice then
            return v35;
        else
            return v34;
        end;
    end;
end;
v0.ActivateOcclusionModule = function(v36, v37) --[[ Line: 182 ]] --[[ Name: ActivateOcclusionModule ]]
    -- upvalues: l_Poppercam_0 (copy), l_Invisicam_0 (copy), v21 (copy), l_Players_0 (copy)
    local v38 = nil;
    if v37 == Enum.DevCameraOcclusionMode.Zoom then
        v38 = l_Poppercam_0;
    elseif v37 == Enum.DevCameraOcclusionMode.Invisicam then
        v38 = l_Invisicam_0;
    else
        warn("CameraScript ActivateOcclusionModule called with unsupported mode");
        return;
    end;
    v36.occlusionMode = v37;
    if v36.activeOcclusionModule and v36.activeOcclusionModule:GetOcclusionMode() == v37 then
        if not v36.activeOcclusionModule:GetEnabled() then
            v36.activeOcclusionModule:Enable(true);
        end;
        return;
    else
        local l_activeOcclusionModule_0 = v36.activeOcclusionModule;
        v36.activeOcclusionModule = v21[v38];
        if not v36.activeOcclusionModule then
            v36.activeOcclusionModule = v38.new();
            if v36.activeOcclusionModule then
                v21[v38] = v36.activeOcclusionModule;
            end;
        end;
        if v36.activeOcclusionModule then
            if v36.activeOcclusionModule:GetOcclusionMode() ~= v37 then
                warn("CameraScript ActivateOcclusionModule mismatch: ", v36.activeOcclusionModule:GetOcclusionMode(), "~=", v37);
            end;
            if l_activeOcclusionModule_0 then
                if l_activeOcclusionModule_0 ~= v36.activeOcclusionModule then
                    l_activeOcclusionModule_0:Enable(false);
                else
                    warn("CameraScript ActivateOcclusionModule failure to detect already running correct module");
                end;
            end;
            if v37 == Enum.DevCameraOcclusionMode.Invisicam then
                if l_Players_0.LocalPlayer.Character then
                    v36.activeOcclusionModule:CharacterAdded(l_Players_0.LocalPlayer.Character, l_Players_0.LocalPlayer);
                end;
            else
                for _, v41 in pairs(l_Players_0:GetPlayers()) do
                    if v41 and v41.Character then
                        v36.activeOcclusionModule:CharacterAdded(v41.Character, v41);
                    end;
                end;
                v36.activeOcclusionModule:OnCameraSubjectChanged(game.Workspace.CurrentCamera.CameraSubject);
            end;
            v36.activeOcclusionModule:Enable(true);
        end;
        return;
    end;
end;
v0.ShouldUseVehicleCamera = function(v42) --[[ Line: 261 ]] --[[ Name: ShouldUseVehicleCamera ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return false;
    else
        local l_CameraType_0 = l_CurrentCamera_0.CameraType;
        local l_CameraSubject_0 = l_CurrentCamera_0.CameraSubject;
        local v46 = true;
        if l_CameraType_0 ~= Enum.CameraType.Custom then
            v46 = l_CameraType_0 == Enum.CameraType.Follow;
        end;
        local v47 = l_CameraSubject_0 and l_CameraSubject_0:IsA("VehicleSeat") or false;
        local v48 = v42.occlusionMode ~= Enum.DevCameraOcclusionMode.Invisicam;
        return v47 and v46 and v48;
    end;
end;
v0.ActivateCameraController = function(v49, v50, v51) --[[ Line: 281 ]] --[[ Name: ActivateCameraController ]]
    -- upvalues: l_LegacyCamera_0 (copy), l_VRService_0 (copy), l_VRCamera_0 (copy), l_ClassicCamera_0 (copy), l_OrbitalCamera_0 (copy), l_VRVehicleCamera_0 (copy), l_VehicleCamera_0 (copy), v20 (copy)
    local v52 = nil;
    if v51 ~= nil then
        if v51 == Enum.CameraType.Scriptable then
            if v49.activeCameraController then
                v49.activeCameraController:Enable(false);
                v49.activeCameraController = nil;
            end;
            return;
        elseif v51 == Enum.CameraType.Custom then
            v50 = v49:GetCameraMovementModeFromSettings();
        elseif v51 == Enum.CameraType.Track then
            v50 = Enum.ComputerCameraMovementMode.Classic;
        elseif v51 == Enum.CameraType.Follow then
            v50 = Enum.ComputerCameraMovementMode.Follow;
        elseif v51 == Enum.CameraType.Orbital then
            v50 = Enum.ComputerCameraMovementMode.Orbital;
        elseif v51 == Enum.CameraType.Attach or v51 == Enum.CameraType.Watch or v51 == Enum.CameraType.Fixed then
            v52 = l_LegacyCamera_0;
        else
            warn("CameraScript encountered an unhandled Camera.CameraType value: ", v51);
        end;
    end;
    if not v52 then
        if l_VRService_0.VREnabled then
            v52 = l_VRCamera_0;
        elseif v50 == Enum.ComputerCameraMovementMode.Classic or v50 == Enum.ComputerCameraMovementMode.Follow or v50 == Enum.ComputerCameraMovementMode.Default or v50 == Enum.ComputerCameraMovementMode.CameraToggle then
            v52 = l_ClassicCamera_0;
        elseif v50 == Enum.ComputerCameraMovementMode.Orbital then
            v52 = l_OrbitalCamera_0;
        else
            warn("ActivateCameraController did not select a module.");
            return;
        end;
    end;
    if v49:ShouldUseVehicleCamera() then
        v52 = if l_VRService_0.VREnabled then l_VRVehicleCamera_0 else l_VehicleCamera_0;
    end;
    local v53 = nil;
    if not v20[v52] then
        v53 = v52.new();
        v20[v52] = v53;
    else
        v53 = v20[v52];
        if v53.Reset then
            v53:Reset();
        end;
    end;
    if v49.activeCameraController then
        if v49.activeCameraController ~= v53 then
            v49.activeCameraController:Enable(false);
            v49.activeCameraController = v53;
            v49.activeCameraController:Enable(true);
        elseif not v49.activeCameraController:GetEnabled() then
            v49.activeCameraController:Enable(true);
        end;
    elseif v53 ~= nil then
        v49.activeCameraController = v53;
        v49.activeCameraController:Enable(true);
    end;
    if v49.activeCameraController then
        if v50 ~= nil then
            v49.activeCameraController:SetCameraMovementMode(v50);
            return;
        elseif v51 ~= nil then
            v49.activeCameraController:SetCameraType(v51);
        end;
    end;
end;
v0.OnCameraSubjectChanged = function(v54) --[[ Line: 386 ]] --[[ Name: OnCameraSubjectChanged ]]
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v56 = l_CurrentCamera_1 and l_CurrentCamera_1.CameraSubject;
    if v54.activeTransparencyController then
        v54.activeTransparencyController:SetSubject(v56);
    end;
    if v54.activeOcclusionModule then
        v54.activeOcclusionModule:OnCameraSubjectChanged(v56);
    end;
    v54:ActivateCameraController(nil, l_CurrentCamera_1.CameraType);
end;
v0.OnCameraTypeChanged = function(v57, v58) --[[ Line: 401 ]] --[[ Name: OnCameraTypeChanged ]]
    -- upvalues: l_UserInputService_0 (copy), l_CameraUtils_0 (copy)
    if v58 == Enum.CameraType.Scriptable and l_UserInputService_0.MouseBehavior == Enum.MouseBehavior.LockCenter then
        l_CameraUtils_0.restoreMouseBehavior();
    end;
    v57:ActivateCameraController(nil, v58);
end;
v0.OnCurrentCameraChanged = function(v59) --[[ Line: 413 ]] --[[ Name: OnCurrentCameraChanged ]]
    local l_CurrentCamera_2 = game.Workspace.CurrentCamera;
    if not l_CurrentCamera_2 then
        return;
    else
        if v59.cameraSubjectChangedConn then
            v59.cameraSubjectChangedConn:Disconnect();
        end;
        if v59.cameraTypeChangedConn then
            v59.cameraTypeChangedConn:Disconnect();
        end;
        v59.cameraSubjectChangedConn = l_CurrentCamera_2:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 425 ]]
            -- upvalues: v59 (copy), l_CurrentCamera_2 (copy)
            v59:OnCameraSubjectChanged(l_CurrentCamera_2.CameraSubject);
        end);
        v59.cameraTypeChangedConn = l_CurrentCamera_2:GetPropertyChangedSignal("CameraType"):Connect(function() --[[ Line: 429 ]]
            -- upvalues: v59 (copy), l_CurrentCamera_2 (copy)
            v59:OnCameraTypeChanged(l_CurrentCamera_2.CameraType);
        end);
        v59:OnCameraSubjectChanged(l_CurrentCamera_2.CameraSubject);
        v59:OnCameraTypeChanged(l_CurrentCamera_2.CameraType);
        return;
    end;
end;
v0.OnLocalPlayerCameraPropertyChanged = function(v61, v62) --[[ Line: 437 ]] --[[ Name: OnLocalPlayerCameraPropertyChanged ]]
    -- upvalues: l_Players_0 (copy), l_CameraUtils_0 (copy)
    if v62 == "CameraMode" then
        if l_Players_0.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
            if not v61.activeCameraController or v61.activeCameraController:GetModuleName() ~= "ClassicCamera" then
                v61:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(Enum.DevComputerCameraMovementMode.Classic));
            end;
            if v61.activeCameraController then
                v61.activeCameraController:UpdateForDistancePropertyChange();
                return;
            end;
        elseif l_Players_0.LocalPlayer.CameraMode == Enum.CameraMode.Classic then
            local l_v61_CameraMovementModeFromSettings_0 = v61:GetCameraMovementModeFromSettings();
            v61:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_v61_CameraMovementModeFromSettings_0));
            return;
        else
            warn("Unhandled value for property player.CameraMode: ", l_Players_0.LocalPlayer.CameraMode);
            return;
        end;
    elseif v62 == "DevComputerCameraMode" or v62 == "DevTouchCameraMode" then
        local l_v61_CameraMovementModeFromSettings_1 = v61:GetCameraMovementModeFromSettings();
        v61:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_v61_CameraMovementModeFromSettings_1));
        return;
    elseif v62 == "DevCameraOcclusionMode" then
        v61:ActivateOcclusionModule(l_Players_0.LocalPlayer.DevCameraOcclusionMode);
        return;
    elseif v62 == "CameraMinZoomDistance" or v62 == "CameraMaxZoomDistance" then
        if v61.activeCameraController then
            v61.activeCameraController:UpdateForDistancePropertyChange();
            return;
        end;
    elseif v62 == "DevTouchMovementMode" then
        return;
    elseif v62 == "DevComputerMovementMode" then
        return;
    elseif v62 == "DevEnableMouseLock" then

    end;
end;
v0.OnUserGameSettingsPropertyChanged = function(v65, v66) --[[ Line: 481 ]] --[[ Name: OnUserGameSettingsPropertyChanged ]]
    -- upvalues: l_CameraUtils_0 (copy)
    if v66 == "ComputerCameraMovementMode" then
        local l_v65_CameraMovementModeFromSettings_0 = v65:GetCameraMovementModeFromSettings();
        v65:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_v65_CameraMovementModeFromSettings_0));
    end;
end;
v0.Update = function(v68, v69) --[[ Line: 494 ]] --[[ Name: Update ]]
    -- upvalues: l_CameraInput_0 (copy)
    if v68.activeCameraController then
        v68.activeCameraController:UpdateMouseBehavior();
        local v70, v71 = v68.activeCameraController:Update(v69);
        if v68.activeOcclusionModule then
            local v72, v73 = v68.activeOcclusionModule:Update(v69, v70, v71);
            v70 = v72;
            v71 = v73;
        end;
        local l_CurrentCamera_3 = game.Workspace.CurrentCamera;
        l_CurrentCamera_3.CFrame = v70;
        l_CurrentCamera_3.Focus = v71;
        if v68.activeTransparencyController then
            v68.activeTransparencyController:Update(v69);
        end;
        if l_CameraInput_0.getInputEnabled() then
            l_CameraInput_0.resetInputForFrameEnd();
        end;
    end;
end;
v0.GetCameraControlChoice = function(_) --[[ Line: 522 ]] --[[ Name: GetCameraControlChoice ]]
    -- upvalues: l_Players_0 (copy), l_UserInputService_0 (copy), l_CameraUtils_0 (copy), l_UserGameSettings_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        if l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Touch or l_UserInputService_0.TouchEnabled then
            if l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
                return l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.TouchCameraMovementMode);
            else
                return l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_LocalPlayer_0.DevTouchCameraMode);
            end;
        elseif l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice then
            local v77 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.ComputerCameraMovementMode);
            return l_CameraUtils_0.ConvertCameraModeEnumToStandard(v77);
        else
            return l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_LocalPlayer_0.DevComputerCameraMode);
        end;
    else
        return;
    end;
end;
v0.OnCharacterAdded = function(v78, v79, v80) --[[ Line: 545 ]] --[[ Name: OnCharacterAdded ]]
    if v78.activeOcclusionModule then
        v78.activeOcclusionModule:CharacterAdded(v79, v80);
    end;
end;
v0.OnCharacterRemoving = function(v81, v82, v83) --[[ Line: 551 ]] --[[ Name: OnCharacterRemoving ]]
    if v81.activeOcclusionModule then
        v81.activeOcclusionModule:CharacterRemoving(v82, v83);
    end;
end;
v0.OnPlayerAdded = function(v84, v85) --[[ Line: 557 ]] --[[ Name: OnPlayerAdded ]]
    v85.CharacterAdded:Connect(function(v86) --[[ Line: 558 ]]
        -- upvalues: v84 (copy), v85 (copy)
        v84:OnCharacterAdded(v86, v85);
    end);
    v85.CharacterRemoving:Connect(function(v87) --[[ Line: 561 ]]
        -- upvalues: v84 (copy), v85 (copy)
        v84:OnCharacterRemoving(v87, v85);
    end);
end;
v0.OnMouseLockToggled = function(v88) --[[ Line: 566 ]] --[[ Name: OnMouseLockToggled ]]
    if v88.activeMouseLockController then
        local l_IsMouseLocked_0 = v88.activeMouseLockController:GetIsMouseLocked();
        local l_MouseLockOffset_0 = v88.activeMouseLockController:GetMouseLockOffset();
        if v88.activeCameraController then
            v88.activeCameraController:SetIsMouseLocked(l_IsMouseLocked_0);
            v88.activeCameraController:SetMouseLockOffset(l_MouseLockOffset_0);
        end;
    end;
end;
l_PlayerScripts_0 = v0.new();
return {};