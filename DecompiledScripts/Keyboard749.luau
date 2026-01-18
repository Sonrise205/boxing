local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_BaseCharacterController_0 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v3 = setmetatable({}, l_BaseCharacterController_0);
v3.__index = v3;
v3.new = function(v4) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCharacterController_0 (copy), v3 (copy)
    local v5 = setmetatable(l_BaseCharacterController_0.new(), v3);
    v5.CONTROL_ACTION_PRIORITY = v4;
    v5.textFocusReleasedConn = nil;
    v5.textFocusGainedConn = nil;
    v5.windowFocusReleasedConn = nil;
    v5.forwardValue = 0;
    v5.backwardValue = 0;
    v5.leftValue = 0;
    v5.rightValue = 0;
    v5.jumpEnabled = true;
    return v5;
end;
v3.Enable = function(v6, v7) --[[ Line: 39 ]] --[[ Name: Enable ]]
    -- upvalues: l_UserInputService_0 (copy)
    if not l_UserInputService_0.KeyboardEnabled then
        return false;
    elseif v7 == v6.enabled then
        return true;
    else
        v6.forwardValue = 0;
        v6.backwardValue = 0;
        v6.leftValue = 0;
        v6.rightValue = 0;
        v6.moveVector = Vector3.new(0, 0, 0, 0);
        v6.jumpRequested = false;
        v6:UpdateJump();
        if v7 then
            v6:BindContextActions();
            v6:ConnectFocusEventListeners();
        else
            v6:UnbindContextActions();
            v6:DisconnectFocusEventListeners();
        end;
        v6.enabled = v7;
        return true;
    end;
end;
v3.UpdateMovement = function(v8, v9) --[[ Line: 71 ]] --[[ Name: UpdateMovement ]]
    if v9 == Enum.UserInputState.Cancel then
        v8.moveVector = Vector3.new(0, 0, 0, 0);
        return;
    else
        v8.moveVector = Vector3.new(v8.leftValue + v8.rightValue, 0, v8.forwardValue + v8.backwardValue);
        return;
    end;
end;
v3.UpdateJump = function(v10) --[[ Line: 79 ]] --[[ Name: UpdateJump ]]
    v10.isJumping = v10.jumpRequested;
end;
v3.BindContextActions = function(v11) --[[ Line: 83 ]] --[[ Name: BindContextActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    local function v15(_, v13, _) --[[ Line: 89 ]]
        -- upvalues: v11 (copy)
        v11.forwardValue = v13 == Enum.UserInputState.Begin and -1 or 0;
        v11:UpdateMovement(v13);
        return Enum.ContextActionResult.Pass;
    end;
    local function v19(_, v17, _) --[[ Line: 95 ]]
        -- upvalues: v11 (copy)
        v11.backwardValue = v17 == Enum.UserInputState.Begin and 1 or 0;
        v11:UpdateMovement(v17);
        return Enum.ContextActionResult.Pass;
    end;
    local function v23(_, v21, _) --[[ Line: 101 ]]
        -- upvalues: v11 (copy)
        v11.leftValue = v21 == Enum.UserInputState.Begin and -1 or 0;
        v11:UpdateMovement(v21);
        return Enum.ContextActionResult.Pass;
    end;
    local function v27(_, v25, _) --[[ Line: 107 ]]
        -- upvalues: v11 (copy)
        v11.rightValue = v25 == Enum.UserInputState.Begin and 1 or 0;
        v11:UpdateMovement(v25);
        return Enum.ContextActionResult.Pass;
    end;
    local function v31(_, v29, _) --[[ Line: 113 ]]
        -- upvalues: v11 (copy)
        v11.jumpRequested = v11.jumpEnabled and v29 == Enum.UserInputState.Begin;
        v11:UpdateJump();
        return Enum.ContextActionResult.Pass;
    end;
    l_ContextActionService_0:BindActionAtPriority("moveForwardAction", v15, false, v11.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterForward);
    l_ContextActionService_0:BindActionAtPriority("moveBackwardAction", v19, false, v11.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterBackward);
    l_ContextActionService_0:BindActionAtPriority("moveLeftAction", v23, false, v11.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterLeft);
    l_ContextActionService_0:BindActionAtPriority("moveRightAction", v27, false, v11.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterRight);
    l_ContextActionService_0:BindActionAtPriority("jumpAction", v31, false, v11.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterJump);
end;
v3.UnbindContextActions = function(_) --[[ Line: 133 ]] --[[ Name: UnbindContextActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindAction("moveForwardAction");
    l_ContextActionService_0:UnbindAction("moveBackwardAction");
    l_ContextActionService_0:UnbindAction("moveLeftAction");
    l_ContextActionService_0:UnbindAction("moveRightAction");
    l_ContextActionService_0:UnbindAction("jumpAction");
end;
v3.ConnectFocusEventListeners = function(v33) --[[ Line: 141 ]] --[[ Name: ConnectFocusEventListeners ]]
    -- upvalues: l_UserInputService_0 (copy)
    local function v34() --[[ Line: 142 ]] --[[ Name: onFocusReleased ]]
        -- upvalues: v33 (copy)
        v33.moveVector = Vector3.new(0, 0, 0, 0);
        v33.forwardValue = 0;
        v33.backwardValue = 0;
        v33.leftValue = 0;
        v33.rightValue = 0;
        v33.jumpRequested = false;
        v33:UpdateJump();
    end;
    local function v36(_) --[[ Line: 152 ]] --[[ Name: onTextFocusGained ]]
        -- upvalues: v33 (copy)
        v33.jumpRequested = false;
        v33:UpdateJump();
    end;
    v33.textFocusReleasedConn = l_UserInputService_0.TextBoxFocusReleased:Connect(v34);
    v33.textFocusGainedConn = l_UserInputService_0.TextBoxFocused:Connect(v36);
    v33.windowFocusReleasedConn = l_UserInputService_0.WindowFocused:Connect(v34);
end;
v3.DisconnectFocusEventListeners = function(v37) --[[ Line: 162 ]] --[[ Name: DisconnectFocusEventListeners ]]
    if v37.textFocusReleasedConn then
        v37.textFocusReleasedConn:Disconnect();
        v37.textFocusReleasedConn = nil;
    end;
    if v37.textFocusGainedConn then
        v37.textFocusGainedConn:Disconnect();
        v37.textFocusGainedConn = nil;
    end;
    if v37.windowFocusReleasedConn then
        v37.windowFocusReleasedConn:Disconnect();
        v37.windowFocusReleasedConn = nil;
    end;
end;
return v3;