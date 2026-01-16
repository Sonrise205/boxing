local _ = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_BaseCharacterController_0 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v4 = setmetatable({}, l_BaseCharacterController_0);
v4.__index = v4;
v4.new = function() --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCharacterController_0 (copy), v4 (copy)
    local v5 = setmetatable(l_BaseCharacterController_0.new(), v4);
    v5.isFollowStick = false;
    v5.thumbstickFrame = nil;
    v5.moveTouchObject = nil;
    v5.onTouchMovedConn = nil;
    v5.onTouchEndedConn = nil;
    v5.screenPos = nil;
    v5.stickImage = nil;
    v5.thumbstickSize = nil;
    return v5;
end;
v4.Enable = function(v6, v7, v8) --[[ Line: 32 ]] --[[ Name: Enable ]]
    if v7 == nil then
        return false;
    else
        v7 = v7 and true or false;
        if v6.enabled == v7 then
            return true;
        else
            v6.moveVector = Vector3.new(0, 0, 0, 0);
            v6.isJumping = false;
            if v7 then
                if not v6.thumbstickFrame then
                    v6:Create(v8);
                end;
                v6.thumbstickFrame.Visible = true;
            else
                v6.thumbstickFrame.Visible = false;
                v6:OnInputEnded();
            end;
            v6.enabled = v7;
            return;
        end;
    end;
end;
v4.OnInputEnded = function(v9) --[[ Line: 53 ]] --[[ Name: OnInputEnded ]]
    v9.thumbstickFrame.Position = v9.screenPos;
    v9.stickImage.Position = UDim2.new(0, v9.thumbstickFrame.Size.X.Offset / 2 - v9.thumbstickSize / 4, 0, v9.thumbstickFrame.Size.Y.Offset / 2 - v9.thumbstickSize / 4);
    v9.moveVector = Vector3.new(0, 0, 0, 0);
    v9.isJumping = false;
    v9.thumbstickFrame.Position = v9.screenPos;
    v9.moveTouchObject = nil;
end;
v4.Create = function(v10, v11) --[[ Line: 62 ]] --[[ Name: Create ]]
    -- upvalues: l_UserInputService_0 (copy), l_GuiService_0 (copy)
    if v10.thumbstickFrame then
        v10.thumbstickFrame:Destroy();
        v10.thumbstickFrame = nil;
        if v10.onTouchMovedConn then
            v10.onTouchMovedConn:Disconnect();
            v10.onTouchMovedConn = nil;
        end;
        if v10.onTouchEndedConn then
            v10.onTouchEndedConn:Disconnect();
            v10.onTouchEndedConn = nil;
        end;
    end;
    local v12 = math.min(v11.AbsoluteSize.X, v11.AbsoluteSize.Y) <= 500;
    v10.thumbstickSize = v12 and 70 or 120;
    v10.screenPos = v12 and UDim2.new(0, v10.thumbstickSize / 2 - 10, 1, -v10.thumbstickSize - 20) or UDim2.new(0, v10.thumbstickSize / 2, 1, -v10.thumbstickSize * 1.75);
    v10.thumbstickFrame = Instance.new("Frame");
    v10.thumbstickFrame.Name = "ThumbstickFrame";
    v10.thumbstickFrame.Active = true;
    v10.thumbstickFrame.Visible = false;
    v10.thumbstickFrame.Size = UDim2.new(0, v10.thumbstickSize, 0, v10.thumbstickSize);
    v10.thumbstickFrame.Position = v10.screenPos;
    v10.thumbstickFrame.BackgroundTransparency = 1;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "OuterImage";
    l_ImageLabel_0.Image = "rbxasset://textures/ui/TouchControlsSheet.png";
    l_ImageLabel_0.ImageRectOffset = Vector2.new();
    l_ImageLabel_0.ImageRectSize = Vector2.new(220, 220);
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Size = UDim2.new(0, v10.thumbstickSize, 0, v10.thumbstickSize);
    l_ImageLabel_0.Position = UDim2.new(0, 0, 0, 0);
    l_ImageLabel_0.Parent = v10.thumbstickFrame;
    v10.stickImage = Instance.new("ImageLabel");
    v10.stickImage.Name = "StickImage";
    v10.stickImage.Image = "rbxasset://textures/ui/TouchControlsSheet.png";
    v10.stickImage.ImageRectOffset = Vector2.new(220, 0);
    v10.stickImage.ImageRectSize = Vector2.new(111, 111);
    v10.stickImage.BackgroundTransparency = 1;
    v10.stickImage.Size = UDim2.new(0, v10.thumbstickSize / 2, 0, v10.thumbstickSize / 2);
    v10.stickImage.Position = UDim2.new(0, v10.thumbstickSize / 2 - v10.thumbstickSize / 4, 0, v10.thumbstickSize / 2 - v10.thumbstickSize / 4);
    v10.stickImage.ZIndex = 2;
    v10.stickImage.Parent = v10.thumbstickFrame;
    local v14 = nil;
    local function _(v15) --[[ Line: 115 ]] --[[ Name: DoMove ]]
        -- upvalues: v10 (copy)
        local v16 = v15 / (v10.thumbstickSize / 2);
        local l_magnitude_0 = v16.magnitude;
        if l_magnitude_0 < 0.05 then
            v16 = Vector3.new();
        else
            v16 = v16.unit * ((l_magnitude_0 - 0.05) / 0.95);
            v16 = Vector3.new(v16.X, 0, v16.Y);
        end;
        v10.moveVector = v16;
    end;
    local function v24(v19) --[[ Line: 133 ]] --[[ Name: MoveStick ]]
        -- upvalues: v14 (ref), v10 (copy)
        local v20 = Vector2.new(v19.X - v14.X, v19.Y - v14.Y);
        local l_magnitude_1 = v20.magnitude;
        local v22 = v10.thumbstickFrame.AbsoluteSize.X / 2;
        if v10.isFollowStick and v22 < l_magnitude_1 then
            local v23 = v20.unit * v22;
            v10.thumbstickFrame.Position = UDim2.new(0, v19.X - v10.thumbstickFrame.AbsoluteSize.X / 2 - v23.X, 0, v19.Y - v10.thumbstickFrame.AbsoluteSize.Y / 2 - v23.Y);
        else
            l_magnitude_1 = math.min(l_magnitude_1, v22);
            v20 = v20.unit * l_magnitude_1;
        end;
        v10.stickImage.Position = UDim2.new(0, v20.X + v10.stickImage.AbsoluteSize.X / 2, 0, v20.Y + v10.stickImage.AbsoluteSize.Y / 2);
    end;
    v10.thumbstickFrame.InputBegan:Connect(function(v25) --[[ Line: 150 ]]
        -- upvalues: v10 (copy), v14 (ref)
        if v10.moveTouchObject or v25.UserInputType ~= Enum.UserInputType.Touch or v25.UserInputState ~= Enum.UserInputState.Begin then
            return;
        else
            v10.moveTouchObject = v25;
            v10.thumbstickFrame.Position = UDim2.new(0, v25.Position.X - v10.thumbstickFrame.Size.X.Offset / 2, 0, v25.Position.Y - v10.thumbstickFrame.Size.Y.Offset / 2);
            v14 = Vector2.new(v10.thumbstickFrame.AbsolutePosition.X + v10.thumbstickFrame.AbsoluteSize.X / 2, v10.thumbstickFrame.AbsolutePosition.Y + v10.thumbstickFrame.AbsoluteSize.Y / 2);
            local _ = Vector2.new(v25.Position.X - v14.X, v25.Position.Y - v14.Y);
            return;
        end;
    end);
    v10.onTouchMovedConn = l_UserInputService_0.TouchMoved:Connect(function(v27, _) --[[ Line: 165 ]]
        -- upvalues: v10 (copy), v14 (ref), v24 (copy)
        if v27 == v10.moveTouchObject then
            v14 = Vector2.new(v10.thumbstickFrame.AbsolutePosition.X + v10.thumbstickFrame.AbsoluteSize.X / 2, v10.thumbstickFrame.AbsolutePosition.Y + v10.thumbstickFrame.AbsoluteSize.Y / 2);
            local v29 = Vector2.new(v27.Position.X - v14.X, v27.Position.Y - v14.Y) / (v10.thumbstickSize / 2);
            local l_magnitude_2 = v29.magnitude;
            if l_magnitude_2 < 0.05 then
                v29 = Vector3.new();
            else
                v29 = v29.unit * ((l_magnitude_2 - 0.05) / 0.95);
                v29 = Vector3.new(v29.X, 0, v29.Y);
            end;
            v10.moveVector = v29;
            v24(v27.Position);
        end;
    end);
    v10.onTouchEndedConn = l_UserInputService_0.TouchEnded:Connect(function(v31, _) --[[ Line: 175 ]]
        -- upvalues: v10 (copy)
        if v31 == v10.moveTouchObject then
            v10:OnInputEnded();
        end;
    end);
    l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 181 ]]
        -- upvalues: v10 (copy)
        if v10.moveTouchObject then
            v10:OnInputEnded();
        end;
    end);
    v10.thumbstickFrame.Parent = v11;
end;
return v4;