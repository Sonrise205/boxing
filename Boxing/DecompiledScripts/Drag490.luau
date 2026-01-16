local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local v2 = {};
v2.__index = v2;
v2.New = function(v3) --[[ Line: 7 ]] --[[ Name: New ]]
    -- upvalues: v2 (copy)
    local v4 = setmetatable({}, v2);
    v4.Instance = v3;
    v4.Active = false;
    return v4;
end;
v2.Start = function(v5) --[[ Line: 15 ]] --[[ Name: Start ]]
    -- upvalues: l_UserInputService_0 (copy), l_RunService_0 (copy)
    if not v5.Active then
        v5.Active = true;
        local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
        local l_Position_0 = v5.Instance.Position;
        v5._dragFunc = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 21 ]]
            -- upvalues: l_UserInputService_0 (ref), l_l_UserInputService_0_MouseLocation_0 (copy), v5 (copy), l_Position_0 (copy)
            local v8 = l_UserInputService_0:GetMouseLocation() - l_l_UserInputService_0_MouseLocation_0;
            v5.Instance.Position = l_Position_0 + UDim2.fromOffset(v8.X, v8.Y);
        end);
    end;
end;
v2.Stop = function(v9) --[[ Line: 29 ]] --[[ Name: Stop ]]
    v9.Active = false;
    if v9._dragFunc then
        v9._dragFunc:Disconnect();
        v9._dragFunc = nil;
    end;
end;
return v2;