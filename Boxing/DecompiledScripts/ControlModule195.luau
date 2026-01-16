local v0 = {};
v0.__index = v0;
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Workspace_0 = game:GetService("Workspace");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_VRService_0 = game:GetService("VRService");
local l_Keyboard_0 = require(script:WaitForChild("Keyboard"));
local l_Gamepad_0 = require(script:WaitForChild("Gamepad"));
local l_DynamicThumbstick_0 = require(script:WaitForChild("DynamicThumbstick"));
local v11 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 33 ]]
    return UserSettings():IsUserFeatureEnabled("UserHideControlsWhenMenuOpen");
end);
v11 = l_status_0 and l_result_0;
l_status_0 = nil;
local v14;
l_result_0, v14 = pcall(function() --[[ Line: 40 ]]
    return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate");
end);
l_status_0 = l_result_0 and v14;
l_result_0 = require(script:WaitForChild("TouchThumbstick"));
v14 = require(script:WaitForChild("ClickToMoveController"));
local l_TouchJump_0 = require(script:WaitForChild("TouchJump"));
local l_VehicleController_0 = require(script:WaitForChild("VehicleController"));
local l_Value_0 = Enum.ContextActionPriority.Default.Value;
local v18 = {
    [Enum.TouchMovementMode.DPad] = l_DynamicThumbstick_0, 
    [Enum.DevTouchMovementMode.DPad] = l_DynamicThumbstick_0, 
    [Enum.TouchMovementMode.Thumbpad] = l_DynamicThumbstick_0, 
    [Enum.DevTouchMovementMode.Thumbpad] = l_DynamicThumbstick_0, 
    [Enum.TouchMovementMode.Thumbstick] = l_result_0, 
    [Enum.DevTouchMovementMode.Thumbstick] = l_result_0, 
    [Enum.TouchMovementMode.DynamicThumbstick] = l_DynamicThumbstick_0, 
    [Enum.DevTouchMovementMode.DynamicThumbstick] = l_DynamicThumbstick_0, 
    [Enum.TouchMovementMode.ClickToMove] = v14, 
    [Enum.DevTouchMovementMode.ClickToMove] = v14, 
    [Enum.TouchMovementMode.Default] = l_DynamicThumbstick_0, 
    [Enum.ComputerMovementMode.Default] = l_Keyboard_0, 
    [Enum.ComputerMovementMode.KeyboardMouse] = l_Keyboard_0, 
    [Enum.DevComputerMovementMode.KeyboardMouse] = l_Keyboard_0, 
    [Enum.DevComputerMovementMode.Scriptable] = nil, 
    [Enum.ComputerMovementMode.ClickToMove] = v14, 
    [Enum.DevComputerMovementMode.ClickToMove] = v14
};
local v19 = {
    [Enum.UserInputType.Keyboard] = l_Keyboard_0, 
    [Enum.UserInputType.MouseButton1] = l_Keyboard_0, 
    [Enum.UserInputType.MouseButton2] = l_Keyboard_0, 
    [Enum.UserInputType.MouseButton3] = l_Keyboard_0, 
    [Enum.UserInputType.MouseWheel] = l_Keyboard_0, 
    [Enum.UserInputType.MouseMovement] = l_Keyboard_0, 
    [Enum.UserInputType.Gamepad1] = l_Gamepad_0, 
    [Enum.UserInputType.Gamepad2] = l_Gamepad_0, 
    [Enum.UserInputType.Gamepad3] = l_Gamepad_0, 
    [Enum.UserInputType.Gamepad4] = l_Gamepad_0
};
local v20 = nil;
v0.new = function() --[[ Line: 97 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), l_Players_0 (copy), v11 (ref), l_GuiService_0 (copy), l_VehicleController_0 (copy), l_Value_0 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy)
    local v21 = setmetatable({}, v0);
    v21.controllers = {};
    v21.activeControlModule = nil;
    v21.activeController = nil;
    v21.touchJumpController = nil;
    v21.moveFunction = l_Players_0.LocalPlayer.Move;
    v21.humanoid = nil;
    v21.lastInputType = Enum.UserInputType.None;
    v21.controlsEnabled = true;
    v21.humanoidSeatedConn = nil;
    v21.vehicleController = nil;
    v21.touchControlFrame = nil;
    if v11 then
        l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 119 ]]
            -- upvalues: v21 (copy)
            if v21.touchControlFrame and v21.touchControlFrame.Visible then
                v21.touchControlFrame.Visible = false;
            end;
        end);
        l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 125 ]]
            -- upvalues: v21 (copy)
            if v21.touchControlFrame then
                v21.touchControlFrame.Visible = true;
            end;
        end);
    end;
    v21.vehicleController = l_VehicleController_0.new(l_Value_0);
    l_Players_0.LocalPlayer.CharacterAdded:Connect(function(v22) --[[ Line: 134 ]]
        -- upvalues: v21 (copy)
        v21:OnCharacterAdded(v22);
    end);
    l_Players_0.LocalPlayer.CharacterRemoving:Connect(function(v23) --[[ Line: 135 ]]
        -- upvalues: v21 (copy)
        v21:OnCharacterRemoving(v23);
    end);
    if l_Players_0.LocalPlayer.Character then
        v21:OnCharacterAdded(l_Players_0.LocalPlayer.Character);
    end;
    l_RunService_0:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(v24) --[[ Line: 140 ]]
        -- upvalues: v21 (copy)
        v21:OnRenderStepped(v24);
    end);
    l_UserInputService_0.LastInputTypeChanged:Connect(function(v25) --[[ Line: 144 ]]
        -- upvalues: v21 (copy)
        v21:OnLastInputTypeChanged(v25);
    end);
    l_UserGameSettings_0:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[ Line: 149 ]]
        -- upvalues: v21 (copy)
        v21:OnTouchMovementModeChange();
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() --[[ Line: 152 ]]
        -- upvalues: v21 (copy)
        v21:OnTouchMovementModeChange();
    end);
    l_UserGameSettings_0:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function() --[[ Line: 156 ]]
        -- upvalues: v21 (copy)
        v21:OnComputerMovementModeChange();
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() --[[ Line: 159 ]]
        -- upvalues: v21 (copy)
        v21:OnComputerMovementModeChange();
    end);
    v21.playerGui = nil;
    v21.touchGui = nil;
    v21.playerGuiAddedConn = nil;
    l_GuiService_0:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function() --[[ Line: 168 ]]
        -- upvalues: v21 (copy)
        v21:UpdateTouchGuiVisibility();
        v21:UpdateActiveControlModuleEnabled();
    end);
    if l_UserInputService_0.TouchEnabled then
        v21.playerGui = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
        if v21.playerGui then
            v21:CreateTouchGuiContainer();
            v21:OnLastInputTypeChanged(l_UserInputService_0:GetLastInputType());
            return v21;
        else
            v21.playerGuiAddedConn = l_Players_0.LocalPlayer.ChildAdded:Connect(function(v26) --[[ Line: 179 ]]
                -- upvalues: v21 (copy), l_UserInputService_0 (ref)
                if v26:IsA("PlayerGui") then
                    v21.playerGui = v26;
                    v21:CreateTouchGuiContainer();
                    v21.playerGuiAddedConn:Disconnect();
                    v21.playerGuiAddedConn = nil;
                    v21:OnLastInputTypeChanged(l_UserInputService_0:GetLastInputType());
                end;
            end);
            return v21;
        end;
    else
        v21:OnLastInputTypeChanged(l_UserInputService_0:GetLastInputType());
        return v21;
    end;
end;
v0.GetMoveVector = function(v27) --[[ Line: 199 ]] --[[ Name: GetMoveVector ]]
    if v27.activeController then
        return v27.activeController:GetMoveVector();
    else
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
v0.GetActiveController = function(v28) --[[ Line: 206 ]] --[[ Name: GetActiveController ]]
    return v28.activeController;
end;
v0.UpdateActiveControlModuleEnabled = function(v29) --[[ Line: 211 ]] --[[ Name: UpdateActiveControlModuleEnabled ]]
    -- upvalues: l_Players_0 (copy), v14 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy), l_result_0 (copy), l_DynamicThumbstick_0 (copy)
    local function _() --[[ Line: 213 ]]
        -- upvalues: v29 (copy), l_Players_0 (ref)
        v29.activeController:Enable(false);
        if v29.moveFunction then
            v29.moveFunction(l_Players_0.LocalPlayer, Vector3.new(0, 0, 0, 0), true);
        end;
    end;
    local function v31() --[[ Line: 221 ]]
        -- upvalues: v29 (copy), v14 (ref), l_Players_0 (ref)
        if v29.activeControlModule == v14 then
            v29.activeController:Enable(true, l_Players_0.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice, v29.touchJumpController);
            return;
        elseif v29.touchControlFrame then
            v29.activeController:Enable(true, v29.touchControlFrame);
            return;
        else
            v29.activeController:Enable(true);
            return;
        end;
    end;
    if not v29.activeController then
        return;
    elseif not v29.controlsEnabled then
        v29.activeController:Enable(false);
        if v29.moveFunction then
            v29.moveFunction(l_Players_0.LocalPlayer, Vector3.new(0, 0, 0, 0), true);
        end;
        return;
    elseif not l_GuiService_0.TouchControlsEnabled and l_UserInputService_0.TouchEnabled and (v29.activeControlModule == v14 or v29.activeControlModule == l_result_0 or v29.activeControlModule == l_DynamicThumbstick_0) then
        v29.activeController:Enable(false);
        if v29.moveFunction then
            v29.moveFunction(l_Players_0.LocalPlayer, Vector3.new(0, 0, 0, 0), true);
        end;
        return;
    else
        v31();
        return;
    end;
end;
v0.Enable = function(v32, v33) --[[ Line: 261 ]] --[[ Name: Enable ]]
    if v33 == nil then
        v33 = true;
    end;
    v32.controlsEnabled = v33;
    if not v32.activeController then
        return;
    else
        v32:UpdateActiveControlModuleEnabled();
        return;
    end;
end;
v0.Disable = function(v34) --[[ Line: 275 ]] --[[ Name: Disable ]]
    v34.controlsEnabled = false;
    v34:UpdateActiveControlModuleEnabled();
end;
v0.SelectComputerMovementModule = function(_) --[[ Line: 283 ]] --[[ Name: SelectComputerMovementModule ]]
    -- upvalues: l_UserInputService_0 (copy), l_Players_0 (copy), v19 (copy), v20 (ref), l_UserGameSettings_0 (copy), l_Keyboard_0 (copy), v14 (copy), v18 (copy)
    if not l_UserInputService_0.KeyboardEnabled and not l_UserInputService_0.GamepadEnabled then
        return nil, false;
    else
        local v36 = nil;
        local l_DevComputerMovementMode_0 = l_Players_0.LocalPlayer.DevComputerMovementMode;
        if l_DevComputerMovementMode_0 == Enum.DevComputerMovementMode.UserChoice then
            v36 = v19[v20];
            if l_UserGameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and v36 == l_Keyboard_0 then
                v36 = v14;
            end;
        else
            v36 = v18[l_DevComputerMovementMode_0];
            if not v36 and l_DevComputerMovementMode_0 ~= Enum.DevComputerMovementMode.Scriptable then
                warn("No character control module is associated with DevComputerMovementMode ", l_DevComputerMovementMode_0);
            end;
        end;
        if v36 then
            return v36, true;
        elseif l_DevComputerMovementMode_0 == Enum.DevComputerMovementMode.Scriptable then
            return nil, true;
        else
            return nil, false;
        end;
    end;
end;
v0.SelectTouchModule = function(_) --[[ Line: 321 ]] --[[ Name: SelectTouchModule ]]
    -- upvalues: l_UserInputService_0 (copy), l_Players_0 (copy), v18 (copy), l_UserGameSettings_0 (copy)
    if not l_UserInputService_0.TouchEnabled then
        return nil, false;
    else
        local v39 = nil;
        local l_DevTouchMovementMode_0 = l_Players_0.LocalPlayer.DevTouchMovementMode;
        if l_DevTouchMovementMode_0 == Enum.DevTouchMovementMode.UserChoice then
            v39 = v18[l_UserGameSettings_0.TouchMovementMode];
        elseif l_DevTouchMovementMode_0 == Enum.DevTouchMovementMode.Scriptable then
            return nil, true;
        else
            v39 = v18[l_DevTouchMovementMode_0];
        end;
        return v39, true;
    end;
end;
local function v60(v41, v42) --[[ Line: 337 ]] --[[ Name: calculateRawMoveVector ]]
    -- upvalues: l_Workspace_0 (copy), l_VRService_0 (copy)
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if not l_CurrentCamera_0 then
        return v42;
    elseif v41:GetState() == Enum.HumanoidStateType.Swimming then
        return l_CurrentCamera_0.CFrame:VectorToWorldSpace(v42);
    else
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        if l_VRService_0.VREnabled and v41.RootPart and (v41.RootPart.CFrame.Position - l_CFrame_0.Position).Magnitude < 3 then
            l_CFrame_0 = l_CFrame_0 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        end;
        local v45 = nil;
        local v46 = nil;
        local _, _, _, v50, v51, v52, _, _, v55, _, _, v58 = l_CFrame_0:GetComponents();
        if v55 < 1 and v55 > -1 then
            v45 = v58;
            v46 = v52;
        else
            v45 = v50;
            v46 = -v51 * math.sign(v55);
        end;
        local v59 = math.sqrt(v45 * v45 + v46 * v46);
        return (Vector3.new((v45 * v42.X + v46 * v42.Z) / v59, 0, (v45 * v42.Z - v46 * v42.X) / v59));
    end;
end;
v0.OnRenderStepped = function(v61, v62) --[[ Line: 378 ]] --[[ Name: OnRenderStepped ]]
    -- upvalues: l_Gamepad_0 (copy), v60 (copy), l_Players_0 (copy)
    if v61.activeController and v61.activeController.enabled and v61.humanoid then
        v61.activeController:OnRenderStepped(v62);
        local l_MoveVector_0 = v61.activeController:GetMoveVector();
        local v64 = v61.activeController:IsMoveVectorCameraRelative();
        local l_v61_ClickToMoveController_0 = v61:GetClickToMoveController();
        if v61.activeController ~= l_v61_ClickToMoveController_0 then
            if l_MoveVector_0.magnitude > 0 then
                l_v61_ClickToMoveController_0:CleanupPath();
            else
                l_v61_ClickToMoveController_0:OnRenderStepped(v62);
                l_MoveVector_0 = l_v61_ClickToMoveController_0:GetMoveVector();
                v64 = l_v61_ClickToMoveController_0:IsMoveVectorCameraRelative();
            end;
        end;
        local v66 = false;
        if v61.vehicleController then
            local v67, v68 = v61.vehicleController:Update(l_MoveVector_0, v64, v61.activeControlModule == l_Gamepad_0);
            l_MoveVector_0 = v67;
            v66 = v68;
        end;
        if v64 then
            l_MoveVector_0 = v60(v61.humanoid, l_MoveVector_0);
        end;
        v61.moveFunction(l_Players_0.LocalPlayer, l_MoveVector_0, false);
        v61.humanoid.Jump = v61.activeController:GetIsJumping() or v61.touchJumpController and v61.touchJumpController:GetIsJumping();
    end;
end;
v0.OnHumanoidSeated = function(v69, v70, v71) --[[ Line: 421 ]] --[[ Name: OnHumanoidSeated ]]
    -- upvalues: l_Value_0 (copy)
    if v70 then
        if v71 and v71:IsA("VehicleSeat") then
            if not v69.vehicleController then
                v69.vehicleController = v69.vehicleController.new(l_Value_0);
            end;
            v69.vehicleController:Enable(true, v71);
            return;
        end;
    elseif v69.vehicleController then
        v69.vehicleController:Enable(false, v71);
    end;
end;
v0.OnCharacterAdded = function(v72, v73) --[[ Line: 436 ]] --[[ Name: OnCharacterAdded ]]
    v72.humanoid = v73:FindFirstChildOfClass("Humanoid");
    while not v72.humanoid do
        v73.ChildAdded:wait();
        v72.humanoid = v73:FindFirstChildOfClass("Humanoid");
    end;
    v72:UpdateTouchGuiVisibility();
    if v72.humanoidSeatedConn then
        v72.humanoidSeatedConn:Disconnect();
        v72.humanoidSeatedConn = nil;
    end;
    v72.humanoidSeatedConn = v72.humanoid.Seated:Connect(function(v74, v75) --[[ Line: 449 ]]
        -- upvalues: v72 (copy)
        v72:OnHumanoidSeated(v74, v75);
    end);
end;
v0.OnCharacterRemoving = function(v76, _) --[[ Line: 454 ]] --[[ Name: OnCharacterRemoving ]]
    v76.humanoid = nil;
    v76:UpdateTouchGuiVisibility();
end;
v0.UpdateTouchGuiVisibility = function(v78) --[[ Line: 460 ]] --[[ Name: UpdateTouchGuiVisibility ]]
    -- upvalues: l_GuiService_0 (copy)
    if v78.touchGui then
        local v79 = v78.humanoid and l_GuiService_0.TouchControlsEnabled;
        v78.touchGui.Enabled = not not v79;
    end;
end;
v0.SwitchToController = function(v80, v81) --[[ Line: 474 ]] --[[ Name: SwitchToController ]]
    -- upvalues: l_Value_0 (copy), v14 (copy), l_result_0 (copy), l_DynamicThumbstick_0 (copy), l_TouchJump_0 (copy)
    if not v81 then
        if v80.activeController then
            v80.activeController:Enable(false);
        end;
        v80.activeController = nil;
        v80.activeControlModule = nil;
        return;
    else
        if not v80.controllers[v81] then
            v80.controllers[v81] = v81.new(l_Value_0);
        end;
        if v80.activeController ~= v80.controllers[v81] then
            if v80.activeController then
                v80.activeController:Enable(false);
            end;
            v80.activeController = v80.controllers[v81];
            v80.activeControlModule = v81;
            if v80.touchControlFrame and (v80.activeControlModule == v14 or v80.activeControlModule == l_result_0 or v80.activeControlModule == l_DynamicThumbstick_0) then
                if not v80.controllers[l_TouchJump_0] then
                    v80.controllers[l_TouchJump_0] = l_TouchJump_0.new();
                end;
                v80.touchJumpController = v80.controllers[l_TouchJump_0];
                v80.touchJumpController:Enable(true, v80.touchControlFrame);
            elseif v80.touchJumpController then
                v80.touchJumpController:Enable(false);
            end;
            v80:UpdateActiveControlModuleEnabled();
        end;
        return;
    end;
end;
v0.OnLastInputTypeChanged = function(v82, v83) --[[ Line: 516 ]] --[[ Name: OnLastInputTypeChanged ]]
    -- upvalues: v20 (ref), v19 (copy)
    if v20 == v83 then
        warn("LastInputType Change listener called with current type.");
    end;
    v20 = v83;
    if v20 == Enum.UserInputType.Touch then
        local v84, v85 = v82:SelectTouchModule();
        if v85 then
            while not v82.touchControlFrame do
                wait();
            end;
            v82:SwitchToController(v84);
        end;
    elseif v19[v20] ~= nil then
        local v86 = v82:SelectComputerMovementModule();
        if v86 then
            v82:SwitchToController(v86);
        end;
    end;
    v82:UpdateTouchGuiVisibility();
end;
v0.OnComputerMovementModeChange = function(v87) --[[ Line: 543 ]] --[[ Name: OnComputerMovementModeChange ]]
    local v88, v89 = v87:SelectComputerMovementModule();
    if v89 then
        v87:SwitchToController(v88);
    end;
end;
v0.OnTouchMovementModeChange = function(v90) --[[ Line: 550 ]] --[[ Name: OnTouchMovementModeChange ]]
    local v91, v92 = v90:SelectTouchModule();
    if v92 then
        while not v90.touchControlFrame do
            wait();
        end;
        v90:SwitchToController(v91);
    end;
end;
v0.CreateTouchGuiContainer = function(v93) --[[ Line: 560 ]] --[[ Name: CreateTouchGuiContainer ]]
    -- upvalues: l_status_0 (ref)
    if v93.touchGui then
        v93.touchGui:Destroy();
    end;
    v93.touchGui = Instance.new("ScreenGui");
    v93.touchGui.Name = "TouchGui";
    v93.touchGui.ResetOnSpawn = false;
    v93.touchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    v93:UpdateTouchGuiVisibility();
    if l_status_0 then
        v93.touchGui.ClipToDeviceSafeArea = false;
    end;
    v93.touchControlFrame = Instance.new("Frame");
    v93.touchControlFrame.Name = "TouchControlFrame";
    v93.touchControlFrame.Size = UDim2.new(1, 0, 1, 0);
    v93.touchControlFrame.BackgroundTransparency = 1;
    v93.touchControlFrame.Parent = v93.touchGui;
    v93.touchGui.Parent = v93.playerGui;
end;
v0.GetClickToMoveController = function(v94) --[[ Line: 583 ]] --[[ Name: GetClickToMoveController ]]
    -- upvalues: v14 (copy), l_Value_0 (copy)
    if not v94.controllers[v14] then
        v94.controllers[v14] = v14.new(l_Value_0);
    end;
    return v94.controllers[v14];
end;
return v0.new();