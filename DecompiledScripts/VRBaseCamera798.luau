local l_VRService_0 = game:GetService("VRService");
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_ZoomController_0 = require(script.Parent:WaitForChild("ZoomController"));
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_Lighting_0 = game:GetService("Lighting");
local l_RunService_0 = game:GetService("RunService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v7 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 29 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRApplyHeadScaleToHandPositions");
end);
v7 = l_status_0 and l_result_0;
l_status_0 = require(script.Parent:WaitForChild("BaseCamera"));
l_result_0 = setmetatable({}, l_status_0);
l_result_0.__index = l_result_0;
l_result_0.new = function() --[[ Line: 40 ]] --[[ Name: new ]]
    -- upvalues: l_status_0 (copy), l_result_0 (copy), l_LocalPlayer_0 (copy)
    local v10 = setmetatable(l_status_0.new(), l_result_0);
    v10.defaultDistance = 7;
    v10.defaultSubjectDistance = math.clamp(v10.defaultDistance, l_LocalPlayer_0.CameraMinZoomDistance, l_LocalPlayer_0.CameraMaxZoomDistance);
    v10.currentSubjectDistance = math.clamp(v10.defaultDistance, l_LocalPlayer_0.CameraMinZoomDistance, l_LocalPlayer_0.CameraMaxZoomDistance);
    v10.VRFadeResetTimer = 0;
    v10.VREdgeBlurTimer = 0;
    v10.gamepadResetConnection = nil;
    v10.needsReset = true;
    return v10;
end;
l_result_0.GetModuleName = function(_) --[[ Line: 59 ]] --[[ Name: GetModuleName ]]
    return "VRBaseCamera";
end;
l_result_0.GamepadZoomPress = function(v12) --[[ Line: 63 ]] --[[ Name: GamepadZoomPress ]]
    if v12:GetCameraToSubjectDistance() > 3.5 then
        v12:SetCameraToSubjectDistance(0);
        v12.currentSubjectDistance = 0;
    else
        v12:SetCameraToSubjectDistance(7);
        v12.currentSubjectDistance = 7;
    end;
    v12:GamepadReset();
    v12:ResetZoom();
end;
l_result_0.GamepadReset = function(v13) --[[ Line: 78 ]] --[[ Name: GamepadReset ]]
    v13.needsReset = true;
end;
l_result_0.ResetZoom = function(v14) --[[ Line: 82 ]] --[[ Name: ResetZoom ]]
    -- upvalues: l_ZoomController_0 (copy)
    l_ZoomController_0.SetZoomParameters(v14.currentSubjectDistance, 0);
    l_ZoomController_0.ReleaseSpring();
end;
l_result_0.OnEnable = function(v15, v16) --[[ Line: 87 ]] --[[ Name: OnEnable ]]
    -- upvalues: l_CameraInput_0 (copy), l_LocalPlayer_0 (copy), l_Lighting_0 (copy)
    if v16 then
        v15.gamepadResetConnection = l_CameraInput_0.gamepadReset:Connect(function() --[[ Line: 89 ]]
            -- upvalues: v15 (copy)
            v15:GamepadReset();
        end);
        return;
    else
        if v15.inFirstPerson then
            v15:GamepadZoomPress();
        end;
        if v15.gamepadResetConnection then
            v15.gamepadResetConnection:Disconnect();
            v15.gamepadResetConnection = nil;
        end;
        v15.VREdgeBlurTimer = 0;
        v15:UpdateEdgeBlur(l_LocalPlayer_0, 1);
        local l_VRFade_0 = l_Lighting_0:FindFirstChild("VRFade");
        if l_VRFade_0 then
            l_VRFade_0.Brightness = 0;
        end;
        return;
    end;
end;
l_result_0.UpdateDefaultSubjectDistance = function(v18) --[[ Line: 113 ]] --[[ Name: UpdateDefaultSubjectDistance ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    v18.defaultSubjectDistance = math.clamp(7, l_LocalPlayer_0.CameraMinZoomDistance, l_LocalPlayer_0.CameraMaxZoomDistance);
end;
l_result_0.GetCameraToSubjectDistance = function(v19) --[[ Line: 118 ]] --[[ Name: GetCameraToSubjectDistance ]]
    return v19.currentSubjectDistance;
end;
l_result_0.SetCameraToSubjectDistance = function(v20, v21) --[[ Line: 123 ]] --[[ Name: SetCameraToSubjectDistance ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ZoomController_0 (copy)
    local l_currentSubjectDistance_0 = v20.currentSubjectDistance;
    local v23 = math.clamp(v21, 0, l_LocalPlayer_0.CameraMaxZoomDistance);
    if v23 < 1 then
        v20.currentSubjectDistance = 0.5;
        if not v20.inFirstPerson then
            v20:EnterFirstPerson();
        end;
    else
        v20.currentSubjectDistance = v23;
        if v20.inFirstPerson then
            v20:LeaveFirstPerson();
        end;
    end;
    l_ZoomController_0.SetZoomParameters(v20.currentSubjectDistance, (math.sign(v21 - l_currentSubjectDistance_0)));
    return v20.currentSubjectDistance;
end;
l_result_0.GetVRFocus = function(v24, v25, v26) --[[ Line: 147 ]] --[[ Name: GetVRFocus ]]
    local v27 = v24.lastCameraFocus or v25;
    v24.cameraTranslationConstraints = Vector3.new(v24.cameraTranslationConstraints.x, math.min(1, v24.cameraTranslationConstraints.y + v26), v24.cameraTranslationConstraints.z);
    local v28 = Vector3.new(0, v24:GetCameraHeight(), 0);
    return (CFrame.new(Vector3.new(v25.x, v27.y, v25.z):Lerp(v25 + v28, v24.cameraTranslationConstraints.y)));
end;
l_result_0.StartFadeFromBlack = function(v29) --[[ Line: 163 ]] --[[ Name: StartFadeFromBlack ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_Lighting_0 (copy)
    if l_UserGameSettings_0.VignetteEnabled == false then
        return;
    else
        local l_VRFade_1 = l_Lighting_0:FindFirstChild("VRFade");
        if not l_VRFade_1 then
            l_VRFade_1 = Instance.new("ColorCorrectionEffect");
            l_VRFade_1.Name = "VRFade";
            l_VRFade_1.Parent = l_Lighting_0;
        end;
        l_VRFade_1.Brightness = -1;
        v29.VRFadeResetTimer = 0.1;
        return;
    end;
end;
l_result_0.UpdateFadeFromBlack = function(v31, v32) --[[ Line: 178 ]] --[[ Name: UpdateFadeFromBlack ]]
    -- upvalues: l_Lighting_0 (copy)
    local l_VRFade_2 = l_Lighting_0:FindFirstChild("VRFade");
    if v31.VRFadeResetTimer > 0 then
        v31.VRFadeResetTimer = math.max(v31.VRFadeResetTimer - v32, 0);
        local l_VRFade_3 = l_Lighting_0:FindFirstChild("VRFade");
        if l_VRFade_3 and l_VRFade_3.Brightness < 0 then
            l_VRFade_3.Brightness = math.min(l_VRFade_3.Brightness + v32 * 10, 0);
            return;
        end;
    elseif l_VRFade_2 then
        l_VRFade_2.Brightness = 0;
    end;
end;
l_result_0.StartVREdgeBlur = function(v35, v36) --[[ Line: 194 ]] --[[ Name: StartVREdgeBlur ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_RunService_0 (copy), l_VRService_0 (copy), v7 (ref)
    if l_UserGameSettings_0.VignetteEnabled == false then
        return;
    else
        local v37 = nil;
        v37 = workspace.CurrentCamera:FindFirstChild("VRBlurPart");
        if not v37 then
            v37 = Instance.new("Part");
            v37.Name = "VRBlurPart";
            v37.Parent = workspace.CurrentCamera;
            v37.CanTouch = false;
            v37.CanCollide = false;
            v37.CanQuery = false;
            v37.Anchored = true;
            v37.Size = Vector3.new(0.4399999976158142, 0.4699999988079071, 1, 0);
            v37.Transparency = 1;
            v37.CastShadow = false;
            l_RunService_0.RenderStepped:Connect(function(_) --[[ Line: 214 ]]
                -- upvalues: l_VRService_0 (ref), v7 (ref), v37 (ref)
                local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
                if v7 then
                    local v40 = workspace.CurrentCamera.CFrame * (CFrame.new(l_l_VRService_0_UserCFrame_0.p * workspace.CurrentCamera.HeadScale) * (l_l_VRService_0_UserCFrame_0 - l_l_VRService_0_UserCFrame_0.p));
                    v37.CFrame = v40 * CFrame.Angles(0, 3.141592653589793, 0) + v40.LookVector * (1.05 * workspace.CurrentCamera.HeadScale);
                    v37.Size = Vector3.new(0.4399999976158142, 0.4699999988079071, 1, 0) * workspace.CurrentCamera.HeadScale;
                    return;
                else
                    local v41 = workspace.Camera.CFrame * l_l_VRService_0_UserCFrame_0;
                    v37.CFrame = v41 * CFrame.Angles(0, 3.141592653589793, 0) + v41.LookVector * 1.05;
                    return;
                end;
            end);
        end;
        local l_VRBlurScreen_0 = v36.PlayerGui:FindFirstChild("VRBlurScreen");
        local v43 = nil;
        if l_VRBlurScreen_0 then
            v43 = l_VRBlurScreen_0:FindFirstChild("VRBlur");
        end;
        if not v43 then
            if not l_VRBlurScreen_0 then
                l_VRBlurScreen_0 = Instance.new("SurfaceGui") or Instance.new("ScreenGui");
            end;
            l_VRBlurScreen_0.Name = "VRBlurScreen";
            l_VRBlurScreen_0.Parent = v36.PlayerGui;
            l_VRBlurScreen_0.Adornee = v37;
            v43 = Instance.new("ImageLabel");
            v43.Name = "VRBlur";
            v43.Parent = l_VRBlurScreen_0;
            v43.Image = "rbxasset://textures/ui/VR/edgeBlur.png";
            v43.AnchorPoint = Vector2.new(0.5, 0.5);
            v43.Position = UDim2.new(0.5, 0, 0.5, 0);
            local v44 = workspace.CurrentCamera.ViewportSize.X * 2.3 / 512;
            local v45 = workspace.CurrentCamera.ViewportSize.Y * 2.3 / 512;
            v43.Size = UDim2.fromScale(v44, v45);
            v43.BackgroundTransparency = 1;
            v43.Active = true;
            v43.ScaleType = Enum.ScaleType.Stretch;
        end;
        v43.Visible = true;
        v43.ImageTransparency = 0;
        v35.VREdgeBlurTimer = 0.14;
        return;
    end;
end;
l_result_0.UpdateEdgeBlur = function(v46, v47, v48) --[[ Line: 268 ]] --[[ Name: UpdateEdgeBlur ]]
    local l_VRBlurScreen_1 = v47.PlayerGui:FindFirstChild("VRBlurScreen");
    local v50 = nil;
    if l_VRBlurScreen_1 then
        v50 = l_VRBlurScreen_1:FindFirstChild("VRBlur");
    end;
    if v50 then
        if v46.VREdgeBlurTimer > 0 then
            v46.VREdgeBlurTimer = v46.VREdgeBlurTimer - v48;
            local l_VRBlurScreen_2 = v47.PlayerGui:FindFirstChild("VRBlurScreen");
            if l_VRBlurScreen_2 then
                local l_VRBlur_0 = l_VRBlurScreen_2:FindFirstChild("VRBlur");
                if l_VRBlur_0 then
                    l_VRBlur_0.ImageTransparency = 1 - math.clamp(v46.VREdgeBlurTimer, 0.01, 0.14) * 7.142857142857142;
                    return;
                end;
            end;
        else
            v50.Visible = false;
        end;
    end;
end;
l_result_0.GetCameraHeight = function(v53) --[[ Line: 293 ]] --[[ Name: GetCameraHeight ]]
    if not v53.inFirstPerson then
        return 0.25881904510252074 * v53.currentSubjectDistance;
    else
        return 0;
    end;
end;
l_result_0.GetSubjectCFrame = function(v54) --[[ Line: 300 ]] --[[ Name: GetSubjectCFrame ]]
    -- upvalues: l_status_0 (copy)
    local v55 = l_status_0.GetSubjectCFrame(v54);
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v57 = l_CurrentCamera_0 and l_CurrentCamera_0.CameraSubject;
    if not v57 then
        return v55;
    else
        if v57:IsA("Humanoid") and v57:GetState() == Enum.HumanoidStateType.Dead and v57 == v54.lastSubject then
            v55 = v54.lastSubjectCFrame;
        end;
        if v55 then
            v54.lastSubjectCFrame = v55;
        end;
        return v55;
    end;
end;
l_result_0.GetSubjectPosition = function(v58) --[[ Line: 326 ]] --[[ Name: GetSubjectPosition ]]
    -- upvalues: l_status_0 (copy)
    local v59 = l_status_0.GetSubjectPosition(v58);
    local l_CurrentCamera_1 = game.Workspace.CurrentCamera;
    local v61 = l_CurrentCamera_1 and l_CurrentCamera_1.CameraSubject;
    if v61 then
        if v61:IsA("Humanoid") then
            if v61:GetState() == Enum.HumanoidStateType.Dead and v61 == v58.lastSubject then
                v59 = v58.lastSubjectPosition;
            end;
        elseif v61:IsA("VehicleSeat") then
            v59 = v61.CFrame.p + v61.CFrame:vectorToWorldSpace((Vector3.new(0, 4, 0, 0)));
        end;
        v58.lastSubjectPosition = v59;
        return v59;
    else
        return nil;
    end;
end;
return l_result_0;