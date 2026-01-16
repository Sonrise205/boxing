local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_None_0 = Enum.UserInputType.None;
local l_BaseCharacterController_0 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v4 = setmetatable({}, l_BaseCharacterController_0);
v4.__index = v4;
v4.new = function(v5) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCharacterController_0 (copy), v4 (copy), l_None_0 (copy)
    local v6 = setmetatable(l_BaseCharacterController_0.new(), v4);
    v6.CONTROL_ACTION_PRIORITY = v5;
    v6.forwardValue = 0;
    v6.backwardValue = 0;
    v6.leftValue = 0;
    v6.rightValue = 0;
    v6.activeGamepad = l_None_0;
    v6.gamepadConnectedConn = nil;
    v6.gamepadDisconnectedConn = nil;
    return v6;
end;
v4.Enable = function(v7, v8) --[[ Line: 37 ]] --[[ Name: Enable ]]
    -- upvalues: l_UserInputService_0 (copy), l_None_0 (copy)
    if not l_UserInputService_0.GamepadEnabled then
        return false;
    elseif v8 == v7.enabled then
        return true;
    else
        v7.forwardValue = 0;
        v7.backwardValue = 0;
        v7.leftValue = 0;
        v7.rightValue = 0;
        v7.moveVector = Vector3.new(0, 0, 0, 0);
        v7.isJumping = false;
        if v8 then
            v7.activeGamepad = v7:GetHighestPriorityGamepad();
            if v7.activeGamepad ~= l_None_0 then
                v7:BindContextActions();
                v7:ConnectGamepadConnectionListeners();
            else
                return false;
            end;
        else
            v7:UnbindContextActions();
            v7:DisconnectGamepadConnectionListeners();
            v7.activeGamepad = l_None_0;
        end;
        v7.enabled = v8;
        return true;
    end;
end;
v4.GetHighestPriorityGamepad = function(_) --[[ Line: 77 ]] --[[ Name: GetHighestPriorityGamepad ]]
    -- upvalues: l_UserInputService_0 (copy), l_None_0 (copy)
    local l_l_UserInputService_0_ConnectedGamepads_0 = l_UserInputService_0:GetConnectedGamepads();
    local l_l_None_0_0 = l_None_0;
    for _, v13 in pairs(l_l_UserInputService_0_ConnectedGamepads_0) do
        if v13.Value < l_l_None_0_0.Value then
            l_l_None_0_0 = v13;
        end;
    end;
    return l_l_None_0_0;
end;
v4.BindContextActions = function(v14) --[[ Line: 88 ]] --[[ Name: BindContextActions ]]
    -- upvalues: l_None_0 (copy), l_ContextActionService_0 (copy)
    if v14.activeGamepad == l_None_0 then
        return false;
    else
        local function v18(_, v16, _) --[[ Line: 95 ]]
            -- upvalues: v14 (copy)
            v14.isJumping = v16 == Enum.UserInputState.Begin;
            return Enum.ContextActionResult.Sink;
        end;
        local function v22(_, v20, v21) --[[ Line: 100 ]]
            -- upvalues: v14 (copy)
            if v20 == Enum.UserInputState.Cancel then
                v14.moveVector = Vector3.new(0, 0, 0, 0);
                return Enum.ContextActionResult.Sink;
            elseif v14.activeGamepad ~= v21.UserInputType then
                return Enum.ContextActionResult.Pass;
            elseif v21.KeyCode ~= Enum.KeyCode.Thumbstick1 then
                return;
            else
                if v21.Position.magnitude > 0.2 then
                    v14.moveVector = Vector3.new(v21.Position.X, 0, -v21.Position.Y);
                else
                    v14.moveVector = Vector3.new(0, 0, 0, 0);
                end;
                return Enum.ContextActionResult.Sink;
            end;
        end;
        l_ContextActionService_0:BindActivate(v14.activeGamepad, Enum.KeyCode.ButtonR2);
        l_ContextActionService_0:BindActionAtPriority("jumpAction", v18, false, v14.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonA);
        l_ContextActionService_0:BindActionAtPriority("moveThumbstick", v22, false, v14.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Thumbstick1);
        return true;
    end;
end;
v4.UnbindContextActions = function(v23) --[[ Line: 129 ]] --[[ Name: UnbindContextActions ]]
    -- upvalues: l_None_0 (copy), l_ContextActionService_0 (copy)
    if v23.activeGamepad ~= l_None_0 then
        l_ContextActionService_0:UnbindActivate(v23.activeGamepad, Enum.KeyCode.ButtonR2);
    end;
    l_ContextActionService_0:UnbindAction("moveThumbstick");
    l_ContextActionService_0:UnbindAction("jumpAction");
end;
v4.OnNewGamepadConnected = function(v24) --[[ Line: 137 ]] --[[ Name: OnNewGamepadConnected ]]
    -- upvalues: l_None_0 (copy)
    local l_v24_HighestPriorityGamepad_0 = v24:GetHighestPriorityGamepad();
    if l_v24_HighestPriorityGamepad_0 == v24.activeGamepad then
        return;
    elseif l_v24_HighestPriorityGamepad_0 == l_None_0 then
        warn("Gamepad:OnNewGamepadConnected found no connected gamepads");
        v24:UnbindContextActions();
        return;
    else
        if v24.activeGamepad ~= l_None_0 then
            v24:UnbindContextActions();
        end;
        v24.activeGamepad = l_v24_HighestPriorityGamepad_0;
        v24:BindContextActions();
        return;
    end;
end;
v4.OnCurrentGamepadDisconnected = function(v26) --[[ Line: 164 ]] --[[ Name: OnCurrentGamepadDisconnected ]]
    -- upvalues: l_None_0 (copy), l_ContextActionService_0 (copy)
    if v26.activeGamepad ~= l_None_0 then
        l_ContextActionService_0:UnbindActivate(v26.activeGamepad, Enum.KeyCode.ButtonR2);
    end;
    local l_v26_HighestPriorityGamepad_0 = v26:GetHighestPriorityGamepad();
    if v26.activeGamepad ~= l_None_0 and l_v26_HighestPriorityGamepad_0 == v26.activeGamepad then
        warn("Gamepad:OnCurrentGamepadDisconnected found the supposedly disconnected gamepad in connectedGamepads.");
        v26:UnbindContextActions();
        v26.activeGamepad = l_None_0;
        return;
    elseif l_v26_HighestPriorityGamepad_0 == l_None_0 then
        v26:UnbindContextActions();
        v26.activeGamepad = l_None_0;
        return;
    else
        v26.activeGamepad = l_v26_HighestPriorityGamepad_0;
        l_ContextActionService_0:BindActivate(v26.activeGamepad, Enum.KeyCode.ButtonR2);
        return;
    end;
end;
v4.ConnectGamepadConnectionListeners = function(v28) --[[ Line: 189 ]] --[[ Name: ConnectGamepadConnectionListeners ]]
    -- upvalues: l_UserInputService_0 (copy)
    v28.gamepadConnectedConn = l_UserInputService_0.GamepadConnected:Connect(function(_) --[[ Line: 190 ]]
        -- upvalues: v28 (copy)
        v28:OnNewGamepadConnected();
    end);
    v28.gamepadDisconnectedConn = l_UserInputService_0.GamepadDisconnected:Connect(function(v30) --[[ Line: 194 ]]
        -- upvalues: v28 (copy)
        if v28.activeGamepad == v30 then
            v28:OnCurrentGamepadDisconnected();
        end;
    end);
end;
v4.DisconnectGamepadConnectionListeners = function(v31) --[[ Line: 202 ]] --[[ Name: DisconnectGamepadConnectionListeners ]]
    if v31.gamepadConnectedConn then
        v31.gamepadConnectedConn:Disconnect();
        v31.gamepadConnectedConn = nil;
    end;
    if v31.gamepadDisconnectedConn then
        v31.gamepadDisconnectedConn:Disconnect();
        v31.gamepadDisconnectedConn = nil;
    end;
end;
return v4;