local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_VRService_0 = game:GetService("VRService");
local _ = game:GetService("StarterGui");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Value_0 = Enum.ContextActionPriority.Default.Value;
local v9 = Vector2.new(1, 0.77) * 0.008726646259971648;
local v10 = Vector2.new(1, 0.77) * 0.12217304763960307;
local v11 = Vector2.new(1, 0.66) * 0.017453292519943295;
local v12 = Vector2.new(1, 0.77) * 0.06981317007977318;
local v13 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 30 ]]
    return UserSettings():IsUserFeatureEnabled("UserResetTouchStateOnMenuOpen");
end);
v13 = l_status_0 and l_result_0;
l_status_0 = nil;
l_result_0 = nil;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
l_status_0 = l_BindableEvent_0.Event;
l_result_0 = l_BindableEvent_1.Event;
local l_l_BindableEvent_0_0 = l_BindableEvent_0 --[[ copy: 16 -> 48 ]];
l_UserInputService_0.InputBegan:Connect(function(v19, v20) --[[ Line: 44 ]]
    -- upvalues: l_l_BindableEvent_0_0 (copy)
    if not v20 and v19.UserInputType == Enum.UserInputType.MouseButton2 then
        l_l_BindableEvent_0_0:Fire();
    end;
end);
local l_l_BindableEvent_1_0 = l_BindableEvent_1 --[[ copy: 17 -> 49 ]];
l_UserInputService_0.InputEnded:Connect(function(v22, _) --[[ Line: 50 ]]
    -- upvalues: l_l_BindableEvent_1_0 (copy)
    if v22.UserInputType == Enum.UserInputType.MouseButton2 then
        l_l_BindableEvent_1_0:Fire();
    end;
end);
l_BindableEvent_0 = nil;
l_BindableEvent_0 = function(v24) --[[ Line: 61 ]] --[[ Name: thumbstickCurve ]]
    local v25 = (math.exp((math.abs(v24) - 0.1) / 0.9 * 2) - 1) / 6.38905609893065;
    return math.sign(v24) * math.clamp(v25, 0, 1);
end;
l_BindableEvent_1 = function(v26) --[[ Line: 75 ]] --[[ Name: adjustTouchPitchSensitivity ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return v26;
    else
        local v28 = l_CurrentCamera_0.CFrame:ToEulerAnglesYXZ();
        if v26.Y * v28 >= 0 then
            return v26;
        else
            local v29 = (1 - (math.abs(v28) * 2 / 3.141592653589793) ^ 0.75) * 0.75 + 0.25;
            return Vector2.new(1, v29) * v26;
        end;
    end;
end;
local function v38(v30) --[[ Line: 101 ]] --[[ Name: isInDynamicThumbstickArea ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
    local v32 = l_PlayerGui_0 and l_PlayerGui_0:FindFirstChild("TouchGui");
    local v33 = v32 and v32:FindFirstChild("TouchControlFrame");
    local v34 = v33 and v33:FindFirstChild("DynamicThumbstickFrame");
    if not v34 then
        return false;
    elseif not v32.Enabled then
        return false;
    else
        local l_AbsolutePosition_0 = v34.AbsolutePosition;
        local v36 = l_AbsolutePosition_0 + v34.AbsoluteSize;
        local v37 = false;
        if v30.X >= l_AbsolutePosition_0.X then
            v37 = false;
            if v30.Y >= l_AbsolutePosition_0.Y then
                v37 = false;
                if v30.X <= v36.X then
                    v37 = v30.Y <= v36.Y;
                end;
            end;
        end;
        return v37;
    end;
end;
local v39 = 0.016666666666666666;
l_RunService_0.Stepped:Connect(function(_, v41) --[[ Line: 126 ]]
    -- upvalues: v39 (ref)
    v39 = v41;
end);
local v42 = {};
local v43 = {};
local v44 = 0;
do
    local l_v43_0, l_v44_0 = v43, v44;
    local function _() --[[ Line: 136 ]] --[[ Name: incPanInputCount ]]
        -- upvalues: l_v44_0 (ref)
        l_v44_0 = math.max(0, l_v44_0 + 1);
    end;
    local function _() --[[ Line: 140 ]] --[[ Name: decPanInputCount ]]
        -- upvalues: l_v44_0 (ref)
        l_v44_0 = math.max(0, l_v44_0 - 1);
    end;
    local function _() --[[ Line: 144 ]] --[[ Name: resetPanInputCount ]]
        -- upvalues: l_v44_0 (ref)
        l_v44_0 = 0;
    end;
    local v50 = {
        Thumbstick2 = Vector2.new()
    };
    local v51 = {
        Left = 0, 
        Right = 0, 
        I = 0, 
        O = 0
    };
    local v52 = {
        Movement = Vector2.new(), 
        Wheel = 0, 
        Pan = Vector2.new(), 
        Pinch = 0
    };
    local v53 = {
        Move = Vector2.new(), 
        Pinch = 0
    };
    local l_BindableEvent_2 = Instance.new("BindableEvent");
    v42.gamepadZoomPress = l_BindableEvent_2.Event;
    local v55 = l_VRService_0.VREnabled and Instance.new("BindableEvent") or nil;
    if l_VRService_0.VREnabled then
        v42.gamepadReset = v55.Event;
    end;
    local l_v50_0 = v50 --[[ copy: 26 -> 50 ]];
    v42.getRotationActivated = function() --[[ Line: 177 ]] --[[ Name: getRotationActivated ]]
        -- upvalues: l_v44_0 (ref), l_v50_0 (copy)
        local v57 = true;
        if l_v44_0 <= 0 then
            v57 = l_v50_0.Thumbstick2.Magnitude > 0;
        end;
        return v57;
    end;
    v42.getRotation = function(v58) --[[ Line: 181 ]] --[[ Name: getRotation ]]
        -- upvalues: l_UserGameSettings_0 (copy), v51 (copy), v39 (ref), l_v50_0 (copy), v52 (copy), l_BindableEvent_1 (copy), v53 (copy), v12 (copy), v9 (copy), v10 (copy), v11 (copy)
        local v59 = Vector2.new(1, l_UserGameSettings_0:GetCameraYInvertValue());
        local v60 = Vector2.new(v51.Right - v51.Left, 0) * v39;
        local l_Thumbstick2_0 = l_v50_0.Thumbstick2;
        local l_Movement_0 = v52.Movement;
        local l_Pan_0 = v52.Pan;
        local v64 = l_BindableEvent_1(v53.Move);
        if v58 then
            v60 = Vector2.new();
        end;
        return (v60 * 2.0943951023931953 + l_Thumbstick2_0 * v12 + l_Movement_0 * v9 + l_Pan_0 * v10 + v64 * v11) * v59;
    end;
    v42.getZoomDelta = function() --[[ Line: 205 ]] --[[ Name: getZoomDelta ]]
        -- upvalues: v51 (copy), v52 (copy), v53 (copy)
        local v65 = v51.O - v51.I;
        local v66 = -v52.Wheel + v52.Pinch;
        local v67 = -v53.Pinch;
        return v65 * 0.1 + v66 * 1 + v67 * 0.04;
    end;
    local function v72(_, _, v70) --[[ Line: 213 ]] --[[ Name: thumbstick ]]
        -- upvalues: l_v50_0 (copy), l_BindableEvent_0 (ref)
        local l_Position_0 = v70.Position;
        l_v50_0[v70.KeyCode.Name] = Vector2.new(l_BindableEvent_0(l_Position_0.X), -l_BindableEvent_0(l_Position_0.Y));
        return Enum.ContextActionResult.Pass;
    end;
    local function _(v73) --[[ Line: 219 ]] --[[ Name: mouseMovement ]]
        -- upvalues: v52 (copy)
        local l_Delta_0 = v73.Delta;
        v52.Movement = Vector2.new(l_Delta_0.X, l_Delta_0.Y);
    end;
    local _ = function(_, _, v78) --[[ Line: 224 ]] --[[ Name: mouseWheel ]]
        -- upvalues: v52 (copy)
        v52.Wheel = v78.Position.Z;
        return Enum.ContextActionResult.Pass;
    end;
    local function v83(_, v81, v82) --[[ Line: 229 ]] --[[ Name: keypress ]]
        -- upvalues: v51 (copy)
        v51[v82.KeyCode.Name] = v81 == Enum.UserInputState.Begin and 1 or 0;
    end;
    local function v87(_, v85, _) --[[ Line: 233 ]] --[[ Name: gamepadZoomPress ]]
        -- upvalues: l_BindableEvent_2 (copy)
        if v85 == Enum.UserInputState.Begin then
            l_BindableEvent_2:Fire();
        end;
    end;
    local function v91(_, v89, _) --[[ Line: 239 ]] --[[ Name: gamepadReset ]]
        -- upvalues: v55 (copy)
        if v89 == Enum.UserInputState.Begin then
            v55:Fire();
        end;
    end;
    local function v96() --[[ Line: 245 ]] --[[ Name: resetInputDevices ]]
        -- upvalues: l_v50_0 (copy), v51 (copy), v52 (copy), v53 (copy)
        for _, v93 in pairs({
            l_v50_0, 
            v51, 
            v52, 
            v53
        }) do
            for v94, v95 in pairs(v93) do
                if type(v95) == "boolean" then
                    v93[v94] = false;
                else
                    v93[v94] = v93[v94] * 0;
                end;
            end;
        end;
    end;
    local v97 = nil;
    local v98 = nil;
    local v99 = nil;
    local v100 = nil;
    local v101 = {};
    local v102 = nil;
    local v103 = nil;
    do
        local l_v101_0, l_v102_0, l_v103_0 = v101, v102, v103;
        v97 = function(v107, v108) --[[ Line: 269 ]] --[[ Name: touchBegan ]]
            -- upvalues: l_v102_0 (ref), v38 (copy), l_v44_0 (ref), l_v101_0 (ref)
            assert(v107.UserInputType == Enum.UserInputType.Touch);
            assert(v107.UserInputState == Enum.UserInputState.Begin);
            if l_v102_0 == nil and v38(v107.Position) and not v108 then
                l_v102_0 = v107;
                return;
            else
                if not v108 then
                    l_v44_0 = math.max(0, l_v44_0 + 1);
                end;
                l_v101_0[v107] = v108;
                return;
            end;
        end;
        v99 = function(v109, _) --[[ Line: 289 ]] --[[ Name: touchEnded ]]
            -- upvalues: l_v102_0 (ref), l_v101_0 (ref), l_v103_0 (ref), l_v44_0 (ref)
            assert(v109.UserInputType == Enum.UserInputType.Touch);
            assert(v109.UserInputState == Enum.UserInputState.End);
            if v109 == l_v102_0 then
                l_v102_0 = nil;
            end;
            if l_v101_0[v109] == false then
                l_v103_0 = nil;
                l_v44_0 = math.max(0, l_v44_0 - 1);
            end;
            l_v101_0[v109] = nil;
        end;
        v98 = function(v111, v112) --[[ Line: 308 ]] --[[ Name: touchChanged ]]
            -- upvalues: l_v102_0 (ref), l_v101_0 (ref), v53 (copy), l_v103_0 (ref)
            assert(v111.UserInputType == Enum.UserInputType.Touch);
            assert(v111.UserInputState == Enum.UserInputState.Change);
            if v111 == l_v102_0 then
                return;
            else
                if l_v101_0[v111] == nil then
                    l_v101_0[v111] = v112;
                end;
                local v113 = {};
                for v114, v115 in pairs(l_v101_0) do
                    if not v115 then
                        table.insert(v113, v114);
                    end;
                end;
                if #v113 == 1 and l_v101_0[v111] == false then
                    local l_Delta_1 = v111.Delta;
                    local l_v53_0 = v53;
                    l_v53_0.Move = l_v53_0.Move + Vector2.new(l_Delta_1.X, l_Delta_1.Y);
                end;
                if #v113 == 2 then
                    local l_Magnitude_0 = (v113[1].Position - v113[2].Position).Magnitude;
                    if l_v103_0 then
                        local l_v53_1 = v53;
                        l_v53_1.Pinch = l_v53_1.Pinch + (l_Magnitude_0 - l_v103_0);
                    end;
                    l_v103_0 = l_Magnitude_0;
                    return;
                else
                    l_v103_0 = nil;
                    return;
                end;
            end;
        end;
        v100 = function() --[[ Line: 352 ]] --[[ Name: resetTouchState ]]
            -- upvalues: l_v101_0 (ref), l_v102_0 (ref), l_v103_0 (ref), v13 (ref), l_v44_0 (ref)
            l_v101_0 = {};
            l_v102_0 = nil;
            l_v103_0 = nil;
            if v13 then
                l_v44_0 = 0;
            end;
        end;
    end;
    v101 = function(v120, v121, v122, v123) --[[ Line: 362 ]] --[[ Name: pointerAction ]]
        -- upvalues: v52 (copy)
        if not v123 then
            v52.Wheel = v120;
            v52.Pan = v121;
            v52.Pinch = -v122;
        end;
    end;
    do
        local l_v97_0, l_v98_0, l_v99_0, l_v100_0 = v97, v98, v99, v100;
        v102 = function(v128, v129) --[[ Line: 370 ]] --[[ Name: inputBegan ]]
            -- upvalues: l_v97_0 (ref), l_v44_0 (ref)
            if v128.UserInputType == Enum.UserInputType.Touch then
                l_v97_0(v128, v129);
                return;
            else
                if v128.UserInputType == Enum.UserInputType.MouseButton2 and not v129 then
                    l_v44_0 = math.max(0, l_v44_0 + 1);
                end;
                return;
            end;
        end;
        v103 = function(v130, v131) --[[ Line: 379 ]] --[[ Name: inputChanged ]]
            -- upvalues: l_v98_0 (ref), v52 (copy)
            if v130.UserInputType == Enum.UserInputType.Touch then
                l_v98_0(v130, v131);
                return;
            else
                if v130.UserInputType == Enum.UserInputType.MouseMovement then
                    local l_Delta_2 = v130.Delta;
                    v52.Movement = Vector2.new(l_Delta_2.X, l_Delta_2.Y);
                end;
                return;
            end;
        end;
        local function v135(v133, v134) --[[ Line: 388 ]] --[[ Name: inputEnded ]]
            -- upvalues: l_v99_0 (ref), l_v44_0 (ref)
            if v133.UserInputType == Enum.UserInputType.Touch then
                l_v99_0(v133, v134);
                return;
            else
                if v133.UserInputType == Enum.UserInputType.MouseButton2 then
                    l_v44_0 = math.max(0, l_v44_0 - 1);
                end;
                return;
            end;
        end;
        local v136 = false;
        v42.setInputEnabled = function(v137) --[[ Line: 399 ]] --[[ Name: setInputEnabled ]]
            -- upvalues: v136 (ref), v96 (copy), l_v100_0 (ref), l_ContextActionService_0 (copy), v72 (copy), l_Value_0 (copy), v83 (copy), l_VRService_0 (copy), v91 (copy), v87 (copy), l_v43_0 (ref), l_UserInputService_0 (copy), v102 (copy), v103 (copy), v135 (copy), v101 (copy), v13 (ref)
            if v136 == v137 then
                return;
            else
                v136 = v137;
                v96();
                l_v100_0();
                if v136 then
                    l_ContextActionService_0:BindActionAtPriority("RbxCameraThumbstick", v72, false, l_Value_0, Enum.KeyCode.Thumbstick2);
                    l_ContextActionService_0:BindActionAtPriority("RbxCameraKeypress", v83, false, l_Value_0, Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.I, Enum.KeyCode.O);
                    if l_VRService_0.VREnabled then
                        l_ContextActionService_0:BindAction("RbxCameraGamepadReset", v91, false, Enum.KeyCode.ButtonL3);
                    end;
                    l_ContextActionService_0:BindAction("RbxCameraGamepadZoom", v87, false, Enum.KeyCode.ButtonR3);
                    table.insert(l_v43_0, l_UserInputService_0.InputBegan:Connect(v102));
                    table.insert(l_v43_0, l_UserInputService_0.InputChanged:Connect(v103));
                    table.insert(l_v43_0, l_UserInputService_0.InputEnded:Connect(v135));
                    table.insert(l_v43_0, l_UserInputService_0.PointerAction:Connect(v101));
                    if v13 then
                        local l_GuiService_0 = game:GetService("GuiService");
                        table.insert(l_v43_0, l_GuiService_0.MenuOpened:connect(l_v100_0));
                        return;
                    end;
                else
                    l_ContextActionService_0:UnbindAction("RbxCameraThumbstick");
                    l_ContextActionService_0:UnbindAction("RbxCameraMouseMove");
                    l_ContextActionService_0:UnbindAction("RbxCameraMouseWheel");
                    l_ContextActionService_0:UnbindAction("RbxCameraKeypress");
                    l_ContextActionService_0:UnbindAction("RbxCameraGamepadZoom");
                    if l_VRService_0.VREnabled then
                        l_ContextActionService_0:UnbindAction("RbxCameraGamepadReset");
                    end;
                    for _, v140 in pairs(l_v43_0) do
                        v140:Disconnect();
                    end;
                    l_v43_0 = {};
                end;
                return;
            end;
        end;
        v42.getInputEnabled = function() --[[ Line: 471 ]] --[[ Name: getInputEnabled ]]
            -- upvalues: v136 (ref)
            return v136;
        end;
        v42.resetInputForFrameEnd = function() --[[ Line: 475 ]] --[[ Name: resetInputForFrameEnd ]]
            -- upvalues: v52 (copy), v53 (copy)
            v52.Movement = Vector2.new();
            v53.Move = Vector2.new();
            v53.Pinch = 0;
            v52.Wheel = 0;
            v52.Pan = Vector2.new();
            v52.Pinch = 0;
        end;
        l_UserInputService_0.WindowFocused:Connect(v96);
        l_UserInputService_0.WindowFocusReleased:Connect(v96);
    end;
end;
v43 = false;
v44 = false;
local v141 = 0;
do
    local l_v43_1, l_v44_1, l_v141_0 = v43, v44, v141;
    v42.getHoldPan = function() --[[ Line: 496 ]] --[[ Name: getHoldPan ]]
        -- upvalues: l_v43_1 (ref)
        return l_v43_1;
    end;
    v42.getTogglePan = function() --[[ Line: 500 ]] --[[ Name: getTogglePan ]]
        -- upvalues: l_v44_1 (ref)
        return l_v44_1;
    end;
    v42.getPanning = function() --[[ Line: 504 ]] --[[ Name: getPanning ]]
        -- upvalues: l_v44_1 (ref), l_v43_1 (ref)
        return l_v44_1 or l_v43_1;
    end;
    v42.setTogglePan = function(v145) --[[ Line: 508 ]] --[[ Name: setTogglePan ]]
        -- upvalues: l_v44_1 (ref)
        l_v44_1 = v145;
    end;
    local v146 = false;
    local v147 = nil;
    local v148 = nil;
    v42.enableCameraToggleInput = function() --[[ Line: 516 ]] --[[ Name: enableCameraToggleInput ]]
        -- upvalues: v146 (ref), l_v43_1 (ref), l_v44_1 (ref), v147 (ref), v148 (ref), l_status_0 (ref), l_v141_0 (ref), l_result_0 (ref), l_UserInputService_0 (copy)
        if v146 then
            return;
        else
            v146 = true;
            l_v43_1 = false;
            l_v44_1 = false;
            if v147 then
                v147:Disconnect();
            end;
            if v148 then
                v148:Disconnect();
            end;
            v147 = l_status_0:Connect(function() --[[ Line: 533 ]]
                -- upvalues: l_v43_1 (ref), l_v141_0 (ref)
                l_v43_1 = true;
                l_v141_0 = tick();
            end);
            v148 = l_result_0:Connect(function() --[[ Line: 538 ]]
                -- upvalues: l_v43_1 (ref), l_v141_0 (ref), l_v44_1 (ref), l_UserInputService_0 (ref)
                l_v43_1 = false;
                if tick() - l_v141_0 < 0.3 and (l_v44_1 or l_UserInputService_0:GetMouseDelta().Magnitude < 2) then
                    l_v44_1 = not l_v44_1;
                end;
            end);
            return;
        end;
    end;
    v42.disableCameraToggleInput = function() --[[ Line: 546 ]] --[[ Name: disableCameraToggleInput ]]
        -- upvalues: v146 (ref), v147 (ref), v148 (ref)
        if not v146 then
            return;
        else
            v146 = false;
            if v147 then
                v147:Disconnect();
                v147 = nil;
            end;
            if v148 then
                v148:Disconnect();
                v148 = nil;
            end;
            return;
        end;
    end;
end;
return v42;