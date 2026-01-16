local v0 = false;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_XSignal_0 = require(l_ReplicatedFirst_0:WaitForChild("XSignal"));
local l_Async_0 = require(l_ReplicatedFirst_0:WaitForChild("Async"));
local v6 = {
    InputModeChanged = l_XSignal_0.new(), 
    CurrentInterface = nil, 
    LastInputType = nil, 
    InputModeListeners = {
        Mouse = l_XSignal_0.new(), 
        Touch = l_XSignal_0.new(), 
        Controller = l_XSignal_0.new()
    }, 
    Interfaces = {
        Mouse = {
            [Enum.UserInputType.MouseMovement] = true, 
            [Enum.UserInputType.MouseButton1] = true, 
            [Enum.UserInputType.MouseButton2] = true, 
            [Enum.UserInputType.MouseButton3] = true, 
            [Enum.UserInputType.MouseWheel] = true, 
            [Enum.UserInputType.Keyboard] = true, 
            [Enum.UserInputType.Focus] = true
        }, 
        Touch = {
            [Enum.UserInputType.Touch] = true
        }, 
        Controller = {
            [Enum.UserInputType.Gamepad1] = true, 
            [Enum.UserInputType.Gamepad2] = true, 
            [Enum.UserInputType.Gamepad3] = true, 
            [Enum.UserInputType.Gamepad4] = true, 
            [Enum.UserInputType.Gamepad5] = true, 
            [Enum.UserInputType.Gamepad6] = true, 
            [Enum.UserInputType.Gamepad7] = true, 
            [Enum.UserInputType.Gamepad8] = true
        }
    }
};
v6._SetInputType = function(v7, v8) --[[ Line: 46 ]] --[[ Name: _SetInputType ]]
    -- upvalues: v6 (copy)
    if v6.LastInputType ~= v8 then
        v6.LastInputType = v8;
        v7:_ResolveInterface();
    end;
end;
v6._ResolveInterface = function(v9) --[[ Line: 53 ]] --[[ Name: _ResolveInterface ]]
    -- upvalues: v6 (copy), l_LocalPlayer_0 (copy)
    local l_LastInputType_0 = v6.LastInputType;
    local v11 = nil;
    for v12, v13 in v6.Interfaces do
        if v13[l_LastInputType_0] then
            v11 = v12;
            break;
        end;
    end;
    if not v11 then
        return;
    else
        if v9.CurrentInterface ~= v11 then
            v9.CurrentInterface = v11;
            v9.InputModeChanged:Fire(v11);
            v9.InputModeListeners[v11]:Fire();
            l_LocalPlayer_0:SetAttribute("Interface", v11);
        end;
        return;
    end;
end;
v6.GetInputModeChangedSignal = function(_, v15) --[[ Line: 76 ]] --[[ Name: GetInputModeChangedSignal ]]
    -- upvalues: v6 (copy)
    assert(v15, "No input mode given!");
    return v6.InputModeListeners[v15];
end;
v6.GetCurrentInputMode = function(v16) --[[ Line: 81 ]] --[[ Name: GetCurrentInputMode ]]
    return assert(v16.CurrentInterface, "Called too early!");
end;
l_UserInputService_0.LastInputTypeChanged:Connect(function(v17) --[[ Line: 85 ]]
    -- upvalues: v6 (copy)
    v6:_SetInputType(v17);
end);
l_Async_0.Timer(1, function() --[[ Line: 89 ]]
    -- upvalues: v6 (copy), l_UserInputService_0 (copy)
    v6:_SetInputType(l_UserInputService_0:GetLastInputType());
end);
local v18;
if game:GetService("RunService"):IsClient() then
    v18 = shared.BridgeNet2;
    if not v18 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v18 = shared.BridgeNet2;
        v0 = v18;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v18 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local v19 = v18.ReferenceBridge("SetInterface");
v6.InputModeChanged:Connect(function(v20) --[[ Line: 98 ]]
    -- upvalues: v19 (copy)
    v19:Fire(v20);
end);
v19:Fire(v6.CurrentInterface);
return v6;