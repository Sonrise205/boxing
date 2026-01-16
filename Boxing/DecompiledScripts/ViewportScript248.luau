local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent;
local l_ViewportFrame_0 = l_Parent_0.ViewportFrame;
local l_Camera_0 = Instance.new("Camera");
l_Camera_0.Parent = l_ViewportFrame_0;
l_ViewportFrame_0.CurrentCamera = l_Camera_0;
l_Camera_0.Focus = l_ViewportFrame_0:WaitForChild("WorldModel"):WaitForChild("Pivot").CFrame * CFrame.new(0, 0, 0);
local l_identity_0 = CFrame.identity;
local v5 = 0;
local v6 = 0;
local v7 = 7.5;
task.spawn(function() --[[ Line: 17 ]]
    -- upvalues: l_Camera_0 (copy), l_identity_0 (ref), v7 (ref)
    while true do
        task.wait();
        l_Camera_0.CFrame = l_Camera_0.Focus * l_identity_0 * CFrame.new(0, -0.4, v7);
    end;
end);
l_Parent_0.InputChanged:Connect(function(v8) --[[ Line: 23 ]]
    -- upvalues: v7 (ref)
    if v8.UserInputType == Enum.UserInputType.MouseWheel then
        local v9 = -v8.Position.Z * 0.25;
        v7 = v7 + v9;
    end;
end);
l_Parent_0.InputBegan:Connect(function(v10) --[[ Line: 30 ]]
    -- upvalues: l_UserInputService_0 (copy), v5 (ref), v6 (ref), l_identity_0 (ref), l_Camera_0 (copy)
    local v11 = true;
    if v10.UserInputType ~= Enum.UserInputType.MouseButton1 then
        v11 = v10.UserInputType == Enum.UserInputType.Touch;
    end;
    local v12 = v10.UserInputType == Enum.UserInputType.MouseButton2;
    local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
    if not v11 and not v12 then
        return;
    else
        while v10.UserInputState ~= Enum.UserInputState.End do
            local l_l_UserInputService_0_MouseLocation_1 = l_UserInputService_0:GetMouseLocation();
            local v15 = l_l_UserInputService_0_MouseLocation_0 - l_l_UserInputService_0_MouseLocation_1;
            l_l_UserInputService_0_MouseLocation_0 = l_l_UserInputService_0_MouseLocation_1;
            if v11 then
                v5 = v5 + v15.X * 0.005;
                v6 = v6 + v15.Y * 0.005;
                v6 = math.clamp(v6, -1.5707963267948966, 1.5707963267948966);
                l_identity_0 = CFrame.fromOrientation(v6, v5, 0);
            elseif v12 then
                l_Camera_0.Focus = l_Camera_0.Focus * l_identity_0 * CFrame.new(v15.X * 0.005, -v15.Y * 0.005, 0) * l_identity_0:Inverse();
            end;
            task.wait();
        end;
        return;
    end;
end);