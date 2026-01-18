local _ = Enum.ContextActionPriority.Default.Value;
local l_Players_0 = game:GetService("Players");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local v5 = {};
v5.__index = v5;
v5.new = function() --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), l_GameSettings_0 (copy), l_Players_0 (copy)
    local v6 = setmetatable({}, v5);
    v6.isMouseLocked = false;
    v6.savedMouseCursor = nil;
    v6.boundKeys = {
        Enum.KeyCode.LeftShift, 
        Enum.KeyCode.RightShift
    };
    v6.mouseLockToggledEvent = Instance.new("BindableEvent");
    local l_BoundKeys_0 = script:FindFirstChild("BoundKeys");
    if not l_BoundKeys_0 or not l_BoundKeys_0:IsA("StringValue") then
        if l_BoundKeys_0 then
            l_BoundKeys_0:Destroy();
        end;
        l_BoundKeys_0 = Instance.new("StringValue");
        assert(l_BoundKeys_0, "");
        l_BoundKeys_0.Name = "BoundKeys";
        l_BoundKeys_0.Value = "LeftShift,RightShift";
        l_BoundKeys_0.Parent = script;
    end;
    if l_BoundKeys_0 then
        l_BoundKeys_0.Changed:Connect(function(v8) --[[ Line: 52 ]]
            -- upvalues: v6 (copy)
            v6:OnBoundKeysObjectChanged(v8);
        end);
        v6:OnBoundKeysObjectChanged(l_BoundKeys_0.Value);
    end;
    l_GameSettings_0.Changed:Connect(function(v9) --[[ Line: 59 ]]
        -- upvalues: v6 (copy)
        if v9 == "ControlMode" or v9 == "ComputerMovementMode" then
            v6:UpdateMouseLockAvailability();
        end;
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevEnableMouseLock"):Connect(function() --[[ Line: 66 ]]
        -- upvalues: v6 (copy)
        v6:UpdateMouseLockAvailability();
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() --[[ Line: 71 ]]
        -- upvalues: v6 (copy)
        v6:UpdateMouseLockAvailability();
    end);
    v6:UpdateMouseLockAvailability();
    local v10 = game.Workspace:WaitForChild("States"):WaitForChild(l_Players_0.LocalPlayer.Name);
    local _ = v10:WaitForChild("PlayerData");
    local l_Equipped_0 = v10:WaitForChild("Occupied"):WaitForChild("Equipped");
    local function _() --[[ Line: 82 ]] --[[ Name: Toggled ]]
        -- upvalues: l_Equipped_0 (copy), v6 (copy)
        local v13 = l_Equipped_0.Value and not (workspace.CurrentMenu.Value == "Emotes");
        if workspace:GetAttribute("FreeMouse") then
            v13 = false;
        end;
        if v13 ~= v6.isMouseLocked then
            v6:OnMouseLockToggled();
        end;
    end;
    l_Equipped_0.Changed:Connect(function() --[[ Line: 94 ]]
        -- upvalues: l_Equipped_0 (copy), v6 (copy)
        local v15 = l_Equipped_0.Value and not (workspace.CurrentMenu.Value == "Emotes");
        if workspace:GetAttribute("FreeMouse") then
            v15 = false;
        end;
        if v15 ~= v6.isMouseLocked then
            v6:OnMouseLockToggled();
        end;
    end);
    workspace.CurrentMenu.Changed:Connect(function() --[[ Line: 98 ]]
        -- upvalues: l_Equipped_0 (copy), v6 (copy)
        local v16 = l_Equipped_0.Value and not (workspace.CurrentMenu.Value == "Emotes");
        if workspace:GetAttribute("FreeMouse") then
            v16 = false;
        end;
        if v16 ~= v6.isMouseLocked then
            v6:OnMouseLockToggled();
        end;
    end);
    workspace:GetAttributeChangedSignal("FreeMouse"):Connect(function() --[[ Line: 102 ]]
        -- upvalues: l_Equipped_0 (copy), v6 (copy)
        local v17 = l_Equipped_0.Value and not (workspace.CurrentMenu.Value == "Emotes");
        if workspace:GetAttribute("FreeMouse") then
            v17 = false;
        end;
        if v17 ~= v6.isMouseLocked then
            v6:OnMouseLockToggled();
        end;
    end);
    return v6;
end;
v5.GetIsMouseLocked = function(v18) --[[ Line: 109 ]] --[[ Name: GetIsMouseLocked ]]
    return v18.isMouseLocked;
end;
v5.GetBindableToggleEvent = function(v19) --[[ Line: 113 ]] --[[ Name: GetBindableToggleEvent ]]
    return v19.mouseLockToggledEvent.Event;
end;
v5.GetMouseLockOffset = function(_) --[[ Line: 117 ]] --[[ Name: GetMouseLockOffset ]]
    local l_CameraOffset_0 = script:FindFirstChild("CameraOffset");
    if l_CameraOffset_0 and l_CameraOffset_0:IsA("Vector3Value") then
        return l_CameraOffset_0.Value;
    else
        if l_CameraOffset_0 then
            l_CameraOffset_0:Destroy();
        end;
        l_CameraOffset_0 = Instance.new("Vector3Value");
        assert(l_CameraOffset_0, "");
        l_CameraOffset_0.Name = "CameraOffset";
        l_CameraOffset_0.Value = Vector3.new(1.75, 0, 0, 0);
        l_CameraOffset_0.Parent = script;
        if l_CameraOffset_0 and l_CameraOffset_0.Value then
            return l_CameraOffset_0.Value;
        else
            return (Vector3.new(1.75, 0, 0, 0));
        end;
    end;
end;
v5.UpdateMouseLockAvailability = function(v22) --[[ Line: 140 ]] --[[ Name: UpdateMouseLockAvailability ]]
    -- upvalues: l_Players_0 (copy), l_GameSettings_0 (copy)
    local l_DevEnableMouseLock_0 = l_Players_0.LocalPlayer.DevEnableMouseLock;
    local v24 = l_Players_0.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable;
    local v25 = l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch;
    local v26 = l_GameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove;
    if (l_DevEnableMouseLock_0 and v25 and not v26 and not v24) ~= v22.enabled then

    end;
end;
v5.OnBoundKeysObjectChanged = function(v27, v28) --[[ Line: 152 ]] --[[ Name: OnBoundKeysObjectChanged ]]
    v27.boundKeys = {};
    for v29 in string.gmatch(v28, "[^%s,]+") do
        for _, v31 in pairs(Enum.KeyCode:GetEnumItems()) do
            if v29 == v31.Name then
                v27.boundKeys[#v27.boundKeys + 1] = v31;
                break;
            end;
        end;
    end;
    v27:UnbindContextActions();
    v27:BindContextActions();
end;
v5.OnMouseLockToggled = function(v32) --[[ Line: 167 ]] --[[ Name: OnMouseLockToggled ]]
    -- upvalues: l_CameraUtils_0 (copy)
    v32.isMouseLocked = not v32.isMouseLocked;
    if v32.isMouseLocked then
        local l_CursorImage_0 = script:FindFirstChild("CursorImage");
        if not l_CursorImage_0 or not l_CursorImage_0:IsA("StringValue") or not l_CursorImage_0.Value then
            if l_CursorImage_0 then
                l_CursorImage_0:Destroy();
            end;
            l_CursorImage_0 = Instance.new("StringValue");
            assert(l_CursorImage_0, "");
            l_CursorImage_0.Name = "CursorImage";
            l_CursorImage_0.Value = "rbxasset://textures/MouseLockedCursor.png";
            l_CursorImage_0.Parent = script;
        end;
    else
        l_CameraUtils_0.restoreMouseIcon();
    end;
    v32.mouseLockToggledEvent:Fire();
end;
v5.DoMouseLockSwitch = function(v34, _, v36, _) --[[ Line: 192 ]] --[[ Name: DoMouseLockSwitch ]]
    if v36 == Enum.UserInputState.Begin then
        v34:OnMouseLockToggled();
        return Enum.ContextActionResult.Sink;
    else
        return Enum.ContextActionResult.Pass;
    end;
end;
v5.BindContextActions = function(_) --[[ Line: 200 ]] --[[ Name: BindContextActions ]]

end;
v5.UnbindContextActions = function(_) --[[ Line: 206 ]] --[[ Name: UnbindContextActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindAction("MouseLockSwitchAction");
end;
v5.IsMouseLocked = function(v40) --[[ Line: 210 ]] --[[ Name: IsMouseLocked ]]
    return v40.enabled and v40.isMouseLocked;
end;
v5.EnableMouseLock = function(v41, v42) --[[ Line: 214 ]] --[[ Name: EnableMouseLock ]]
    -- upvalues: l_CameraUtils_0 (copy)
    if v42 ~= v41.enabled then
        v41.enabled = v42;
        if v41.enabled then
            v41:BindContextActions();
            return;
        else
            l_CameraUtils_0.restoreMouseIcon();
            v41:UnbindContextActions();
            if v41.isMouseLocked then
                v41.mouseLockToggledEvent:Fire();
            end;
            v41.isMouseLocked = false;
        end;
    end;
end;
return v5;