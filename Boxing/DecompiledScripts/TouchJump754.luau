local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_BaseCharacterController_0 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v3 = setmetatable({}, l_BaseCharacterController_0);
v3.__index = v3;
v3.new = function() --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCharacterController_0 (copy), v3 (copy)
    local v4 = setmetatable(l_BaseCharacterController_0.new(), v3);
    v4.parentUIFrame = nil;
    v4.jumpButton = nil;
    v4.characterAddedConn = nil;
    v4.humanoidStateEnabledChangedConn = nil;
    v4.humanoidJumpPowerConn = nil;
    v4.humanoidParentConn = nil;
    v4.externallyEnabled = false;
    v4.jumpPower = 0;
    v4.jumpStateEnabled = true;
    v4.isJumping = false;
    v4.humanoid = nil;
    return v4;
end;
v3.EnableButton = function(v5, v6) --[[ Line: 38 ]] --[[ Name: EnableButton ]]
    -- upvalues: l_Players_0 (copy)
    if v6 then
        if not v5.jumpButton then
            v5:Create();
        end;
        local v7 = l_Players_0.LocalPlayer.Character and l_Players_0.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
        if v7 and v5.externallyEnabled and v5.externallyEnabled and v7.JumpPower > 0 then
            v5.jumpButton.Visible = true;
            return;
        end;
    else
        v5.jumpButton.Visible = false;
        v5.isJumping = false;
        v5.jumpButton.ImageRectOffset = Vector2.new(1, 146);
    end;
end;
v3.UpdateEnabled = function(v8) --[[ Line: 58 ]] --[[ Name: UpdateEnabled ]]
    if v8.jumpPower > 0 and v8.jumpStateEnabled then
        v8:EnableButton(true);
        return;
    else
        v8:EnableButton(false);
        return;
    end;
end;
v3.HumanoidChanged = function(v9, v10) --[[ Line: 66 ]] --[[ Name: HumanoidChanged ]]
    -- upvalues: l_Players_0 (copy)
    local v11 = l_Players_0.LocalPlayer.Character and l_Players_0.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
    if v11 then
        if v10 == "JumpPower" then
            v9.jumpPower = v11.JumpPower;
            v9:UpdateEnabled();
            return;
        elseif v10 == "Parent" and not v11.Parent then
            v9.humanoidChangeConn:Disconnect();
        end;
    end;
end;
v3.HumanoidStateEnabledChanged = function(v12, v13, v14) --[[ Line: 80 ]] --[[ Name: HumanoidStateEnabledChanged ]]
    if v13 == Enum.HumanoidStateType.Jumping then
        v12.jumpStateEnabled = v14;
        v12:UpdateEnabled();
    end;
end;
v3.CharacterAdded = function(v15, v16) --[[ Line: 87 ]] --[[ Name: CharacterAdded ]]
    if v15.humanoidChangeConn then
        v15.humanoidChangeConn:Disconnect();
        v15.humanoidChangeConn = nil;
    end;
    v15.humanoid = v16:FindFirstChildOfClass("Humanoid");
    while not v15.humanoid do
        v16.ChildAdded:wait();
        v15.humanoid = v16:FindFirstChildOfClass("Humanoid");
    end;
    v15.humanoidJumpPowerConn = v15.humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function() --[[ Line: 99 ]]
        -- upvalues: v15 (copy)
        v15.jumpPower = v15.humanoid.JumpPower;
        v15:UpdateEnabled();
    end);
    v15.humanoidParentConn = v15.humanoid:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 104 ]]
        -- upvalues: v15 (copy)
        if not v15.humanoid.Parent then
            v15.humanoidJumpPowerConn:Disconnect();
            v15.humanoidJumpPowerConn = nil;
            v15.humanoidParentConn:Disconnect();
            v15.humanoidParentConn = nil;
        end;
    end);
    v15.humanoidStateEnabledChangedConn = v15.humanoid.StateEnabledChanged:Connect(function(v17, v18) --[[ Line: 113 ]]
        -- upvalues: v15 (copy)
        v15:HumanoidStateEnabledChanged(v17, v18);
    end);
    v15.jumpPower = v15.humanoid.JumpPower;
    v15.jumpStateEnabled = v15.humanoid:GetStateEnabled(Enum.HumanoidStateType.Jumping);
    v15:UpdateEnabled();
end;
v3.SetupCharacterAddedFunction = function(v19) --[[ Line: 122 ]] --[[ Name: SetupCharacterAddedFunction ]]
    -- upvalues: l_Players_0 (copy)
    v19.characterAddedConn = l_Players_0.LocalPlayer.CharacterAdded:Connect(function(v20) --[[ Line: 123 ]]
        -- upvalues: v19 (copy)
        v19:CharacterAdded(v20);
    end);
    if l_Players_0.LocalPlayer.Character then
        v19:CharacterAdded(l_Players_0.LocalPlayer.Character);
    end;
end;
v3.Enable = function(v21, v22, v23) --[[ Line: 131 ]] --[[ Name: Enable ]]
    if v23 then
        v21.parentUIFrame = v23;
    end;
    v21.externallyEnabled = v22;
    v21:EnableButton(v22);
end;
v3.Create = function(v24) --[[ Line: 139 ]] --[[ Name: Create ]]
    -- upvalues: l_GuiService_0 (copy)
    if not v24.parentUIFrame then
        return;
    else
        if v24.jumpButton then
            v24.jumpButton:Destroy();
            v24.jumpButton = nil;
        end;
        local v25 = math.min(v24.parentUIFrame.AbsoluteSize.x, v24.parentUIFrame.AbsoluteSize.y) <= 500;
        local v26 = v25 and 70 or 120;
        v24.jumpButton = Instance.new("ImageButton");
        v24.jumpButton.Name = "JumpButton";
        v24.jumpButton.Visible = false;
        v24.jumpButton.BackgroundTransparency = 1;
        v24.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png";
        v24.jumpButton.ImageRectOffset = Vector2.new(1, 146);
        v24.jumpButton.ImageRectSize = Vector2.new(144, 144);
        v24.jumpButton.Size = UDim2.new(0, v26, 0, v26);
        v24.jumpButton.Position = v25 and UDim2.new(1, -(v26 * 1.5 - 10), 1, -v26 - 20) or UDim2.new(1, -(v26 * 1.5 - 10), 1, -v26 * 1.75);
        local v27 = nil;
        v24.jumpButton.InputBegan:connect(function(v28) --[[ Line: 166 ]]
            -- upvalues: v27 (ref), v24 (copy)
            if v27 or v28.UserInputType ~= Enum.UserInputType.Touch or v28.UserInputState ~= Enum.UserInputState.Begin then
                return;
            else
                v27 = v28;
                v24.jumpButton.ImageRectOffset = Vector2.new(146, 146);
                v24.isJumping = true;
                return;
            end;
        end);
        local function _() --[[ Line: 179 ]]
            -- upvalues: v27 (ref), v24 (copy)
            v27 = nil;
            v24.isJumping = false;
            v24.jumpButton.ImageRectOffset = Vector2.new(1, 146);
        end;
        v24.jumpButton.InputEnded:connect(function(v30) --[[ Line: 185 ]]
            -- upvalues: v27 (ref), v24 (copy)
            if v30 == v27 then
                v27 = nil;
                v24.isJumping = false;
                v24.jumpButton.ImageRectOffset = Vector2.new(1, 146);
            end;
        end);
        l_GuiService_0.MenuOpened:connect(function() --[[ Line: 191 ]]
            -- upvalues: v27 (ref), v24 (copy)
            if v27 then
                v27 = nil;
                v24.isJumping = false;
                v24.jumpButton.ImageRectOffset = Vector2.new(1, 146);
            end;
        end);
        if not v24.characterAddedConn then
            v24:SetupCharacterAddedFunction();
        end;
        v24.jumpButton.Parent = v24.parentUIFrame;
        return;
    end;
end;
return v3;