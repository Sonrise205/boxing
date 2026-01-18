local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(script.Drag);
local v3 = {};
v3.__index = v3;
toPolar = function(v4) --[[ Line: 26 ]] --[[ Name: toPolar ]]
    return math.atan2(v4.y, v4.x), v4.Magnitude;
end;
radToDeg = function(v5) --[[ Line: 30 ]] --[[ Name: radToDeg ]]
    return (v5 + 3.141592653589793) / 6.283185307179586 * 360;
end;
template = function(v6, v7) --[[ Line: 34 ]] --[[ Name: template ]]
    v6 = v6 and typeof(v6) == "table" and v6 or {};
    for v8, v9 in pairs(v7) do
        if v6[v8] == nil then
            v6[v8] = v9;
        end;
    end;
    return v6;
end;
rotateVector = function(v10, v11) --[[ Line: 46 ]] --[[ Name: rotateVector ]]
    local v12 = math.rad(v11);
    local l_X_0 = v10.X;
    local l_Y_0 = v10.Y;
    return Vector2.new(l_X_0 * math.cos(v12) - l_Y_0 * math.sin(v12), l_X_0 * math.sin(v12) + l_Y_0 * math.cos(v12));
end;
roundToHundredths = function(v15) --[[ Line: 57 ]] --[[ Name: roundToHundredths ]]
    return math.ceil(v15 * 100) / 100;
end;
v3.New = function(v16, v17, v18) --[[ Line: 62 ]] --[[ Name: New ]]
    -- upvalues: v3 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy)
    v18 = template(v18, {
        Position = UDim2.new(0, 312, 0, 37), 
        Draggable = true, 
        RoundedCorners = true, 
        PrimaryColor = Color3.fromRGB(26, 26, 36), 
        SecondaryColor = Color3.fromRGB(36, 36, 46), 
        TopbarColor = Color3.fromRGB(21, 21, 31), 
        TextColor = Color3.fromRGB(255, 255, 255)
    });
    local v19 = setmetatable({
        Gui = v16, 
        Mouse = v17, 
        Color = Color3.fromRGB(255, 255, 255), 
        Params = v18
    }, v3);
    v19:Create();
    v19._wheelDownFunc = nil;
    v19._wheelUpFunc_uis = nil;
    local function _() --[[ Line: 89 ]] --[[ Name: _resetWheelFunc ]]
        -- upvalues: v19 (copy)
        if v19._wheelDownFunc then
            v19._wheelDownFunc:Disconnect();
            v19._wheelDownFunc = nil;
        end;
        if v19._wheelUpFunc_uis then
            v19._wheelUpFunc_uis:Disconnect();
            v19._wheelUpFunc_uis = nil;
        end;
    end;
    v19.Instance.Wheel.Button.MouseButton1Down:Connect(function() --[[ Line: 101 ]]
        -- upvalues: v19 (copy), l_RunService_0 (ref), l_UserInputService_0 (ref)
        v19.Instance.Parent.Topbar.Button.Visible = false;
        if v19._wheelDownFunc then
            v19._wheelDownFunc:Disconnect();
            v19._wheelDownFunc = nil;
        end;
        if v19._wheelUpFunc_uis then
            v19._wheelUpFunc_uis:Disconnect();
            v19._wheelUpFunc_uis = nil;
        end;
        v19._wheelDownFunc = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 105 ]]
            -- upvalues: v19 (ref)
            local l_v19_MouseToWheelPos_0 = v19:GetMouseToWheelPos();
            v19.Instance.Wheel.Image.Select.Position = UDim2.fromOffset(l_v19_MouseToWheelPos_0.X, l_v19_MouseToWheelPos_0.Y);
            v19:SetColorFromPos(l_v19_MouseToWheelPos_0);
        end);
        v19._wheelUpFunc_uis = l_UserInputService_0.InputEnded:Connect(function(v22, v23) --[[ Line: 112 ]]
            -- upvalues: v19 (ref)
            if v23 then
                return;
            else
                if v22.UserInputType == Enum.UserInputType.MouseButton1 or v22.UserInputType == Enum.UserInputType.Touch then
                    if v19._wheelDownFunc then
                        v19._wheelDownFunc:Disconnect();
                        v19._wheelDownFunc = nil;
                    end;
                    if v19._wheelUpFunc_uis then
                        v19._wheelUpFunc_uis:Disconnect();
                        v19._wheelUpFunc_uis = nil;
                    end;
                end;
                return;
            end;
        end);
    end);
    v19.Instance.Wheel.Button.MouseButton1Up:Connect(function() --[[ Line: 121 ]]
        -- upvalues: v19 (copy)
        v19.Instance.Parent.Topbar.Button.Visible = true;
        if v19._wheelDownFunc then
            v19._wheelDownFunc:Disconnect();
            v19._wheelDownFunc = nil;
        end;
        if v19._wheelUpFunc_uis then
            v19._wheelUpFunc_uis:Disconnect();
            v19._wheelUpFunc_uis = nil;
        end;
    end);
    v19._valueDownFunc = nil;
    v19._valueUpFunc_uis = nil;
    local function _() --[[ Line: 130 ]] --[[ Name: _resetValueFunc ]]
        -- upvalues: v19 (copy)
        if v19._valueDownFunc then
            v19._valueDownFunc:Disconnect();
            v19._valueDownFunc = nil;
        end;
        if v19._valueUpFunc_uis then
            v19._valueUpFunc_uis:Disconnect();
            v19._valueUpFunc_uis = nil;
        end;
    end;
    v19.Instance.Right.Value.Button.MouseButton1Down:Connect(function() --[[ Line: 142 ]]
        -- upvalues: v19 (copy), l_RunService_0 (ref), l_UserInputService_0 (ref)
        v19.Instance.Parent.Topbar.Button.Visible = false;
        if v19._valueDownFunc then
            v19._valueDownFunc:Disconnect();
            v19._valueDownFunc = nil;
        end;
        if v19._valueUpFunc_uis then
            v19._valueUpFunc_uis:Disconnect();
            v19._valueUpFunc_uis = nil;
        end;
        v19._valueDownFunc = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 146 ]]
            -- upvalues: v19 (ref)
            local l_v19_MouseToValuePos_0 = v19:GetMouseToValuePos();
            v19.Instance.Right.Value.Select.Position = UDim2.new(0, 0, l_v19_MouseToValuePos_0, 0);
            local v26, v27, _ = v19.Color:ToHSV();
            v19.Color = Color3.fromHSV(v19.CurrentHue or v26, v19.CurrentSaturation or v27, 1 - l_v19_MouseToValuePos_0);
            v19:UpdateColor();
        end);
        v19._valueUpFunc_uis = l_UserInputService_0.InputEnded:Connect(function(v29, v30) --[[ Line: 156 ]]
            -- upvalues: v19 (ref)
            if v30 then
                return;
            else
                if v29.UserInputType == Enum.UserInputType.MouseButton1 or v29.UserInputType == Enum.UserInputType.Touch then
                    if v19._valueDownFunc then
                        v19._valueDownFunc:Disconnect();
                        v19._valueDownFunc = nil;
                    end;
                    if v19._valueUpFunc_uis then
                        v19._valueUpFunc_uis:Disconnect();
                        v19._valueUpFunc_uis = nil;
                    end;
                end;
                return;
            end;
        end);
    end);
    v19.Instance.Right.Value.Button.MouseButton1Up:Connect(function() --[[ Line: 165 ]]
        -- upvalues: v19 (copy)
        v19.Instance.Parent.Topbar.Button.Visible = true;
        if v19._valueDownFunc then
            v19._valueDownFunc:Disconnect();
            v19._valueDownFunc = nil;
        end;
        if v19._valueUpFunc_uis then
            v19._valueUpFunc_uis:Disconnect();
            v19._valueUpFunc_uis = nil;
        end;
    end);
    v19:UpdateColor();
    v19.Instance.Bottom.Buttons.Confirm.MouseButton1Down:Connect(function() --[[ Line: 174 ]]
        -- upvalues: v19 (copy)
        v19.Instance.Parent.FinishedEvent:Fire(v19.Color);
        v19:Destroy();
    end);
    v19.Instance.Bottom.Buttons.Cancel.MouseButton1Down:Connect(function() --[[ Line: 179 ]]
        -- upvalues: v19 (copy)
        v19.Instance.Parent.CanceledEvent:Fire();
        v19:Destroy();
    end);
    for _, v32 in pairs(v19.Instance.Parent.Properties.RGB:GetChildren()) do
        if v32:IsA("Frame") then
            v32.Frame.TextBox.FocusLost:Connect(function() --[[ Line: 187 ]]
                -- upvalues: v32 (copy), v19 (copy)
                if not tonumber(v32.Frame.TextBox.Text) then
                    v32.Frame.TextBox.Text = "0";
                end;
                local v33 = tonumber(v19.Instance.Parent.Properties.RGB.R.Frame.TextBox.Text) or 0;
                local v34 = tonumber(v19.Instance.Parent.Properties.RGB.G.Frame.TextBox.Text) or 0;
                local v35 = tonumber(v19.Instance.Parent.Properties.RGB.B.Frame.TextBox.Text) or 0;
                v33 = math.clamp(v33, 0, 255);
                v34 = math.clamp(v34, 0, 255);
                v35 = math.clamp(v35, 0, 255);
                v19:SetColor(Color3.fromRGB(v33, v34, v35));
            end);
        end;
    end;
    for _, v37 in pairs(v19.Instance.Parent.Properties.HSV:GetChildren()) do
        if v37:IsA("Frame") then
            v37.Frame.TextBox.FocusLost:Connect(function() --[[ Line: 205 ]]
                -- upvalues: v37 (copy), v19 (copy)
                if not tonumber(v37.Frame.TextBox.Text) then
                    v37.Frame.TextBox.Text = "0";
                end;
                local v38 = tonumber(v19.Instance.Parent.Properties.HSV.H.Frame.TextBox.Text) or 0;
                local v39 = tonumber(v19.Instance.Parent.Properties.HSV.S.Frame.TextBox.Text) or 0;
                local v40 = tonumber(v19.Instance.Parent.Properties.HSV.V.Frame.TextBox.Text) or 0;
                v38 = math.clamp(v38, 0, 360);
                v39 = math.clamp(v39, 0, 1);
                v40 = math.clamp(v40, 0, 1);
                v19:SetColor(Color3.fromHSV(v38 / 360, v39, v40));
            end);
        end;
    end;
    v19.Instance.Parent.Content.Bottom.Hex.Frame.TextBox.FocusLost:Connect(function() --[[ Line: 221 ]]
        -- upvalues: v19 (copy)
        local l_Text_0 = v19.Instance.Parent.Content.Bottom.Hex.Frame.TextBox.Text;
        local l_status_0, _ = pcall(function() --[[ Line: 223 ]]
            -- upvalues: l_Text_0 (ref)
            l_Text_0 = Color3.fromHex(l_Text_0);
        end);
        if not l_status_0 then
            l_Text_0 = Color3.fromRGB(255, 255, 255);
        end;
        v19.Instance.Parent.Content.Bottom.Hex.Frame.TextBox.Text = l_Text_0:ToHex();
        v19:SetColor(l_Text_0);
    end);
    return v19;
end;
v3.Create = function(v44) --[[ Line: 240 ]] --[[ Name: Create ]]
    -- upvalues: l_UserInputService_0 (copy), v2 (copy)
    local v45 = script.ColorWindow:Clone();
    v45.Position = v44.Params.Position;
    v45.Parent = v44.Gui;
    v45.Visible = true;
    v44.Instance = v45.Content;
    for _, v47 in pairs(v45:GetDescendants()) do
        if not v44.Params.RoundedCorners and v47:IsA("UICorner") and v47.Parent.Name ~= "Select" then
            v47:Destroy();
        end;
        if v47:IsA("TextLabel") or v47:IsA("TextBox") or v47:IsA("ImageButton") then
            v47[(not not v47:IsA("TextLabel") or v47:IsA("TextBox")) and "TextColor3" or "ImageColor3"] = v44.Params.TextColor;
        end;
    end;
    v45.BackgroundColor3 = v44.Params.PrimaryColor;
    v45.Properties.BackgroundColor3 = v44.Params.PrimaryColor;
    v45.Properties.Line.BackgroundColor3 = v44.Params.SecondaryColor;
    v45.Content.Bottom.Hex.Frame.BackgroundColor3 = v44.Params.SecondaryColor;
    for _, v49 in pairs({
        v45.Properties.HSV, 
        v45.Properties.RGB
    }) do
        for _, v51 in pairs(v49:GetChildren()) do
            if v51:IsA("Frame") then
                v51.Frame.BackgroundColor3 = v44.Params.SecondaryColor;
            end;
        end;
    end;
    v45.Topbar.BackgroundColor3 = v44.Params.TopbarColor;
    v45.Topbar.Frame.BackgroundColor3 = v44.Params.TopbarColor;
    v44.Finished = v45.FinishedEvent.Event;
    v44.Canceled = v45.CanceledEvent.Event;
    v44.Updated = v45.UpdateEvent.Event;
    if v44.Params.Draggable and not l_UserInputService_0.TouchEnabled then
        v44.Drag = v2.New(v44.Instance.Parent);
        local l_Button_0 = v44.Instance.Parent.Topbar.Button;
        l_Button_0.MouseButton1Down:Connect(function() --[[ Line: 285 ]]
            -- upvalues: v44 (copy)
            v44.Drag:Start();
        end);
        l_Button_0.MouseButton1Up:Connect(function() --[[ Line: 289 ]]
            -- upvalues: v44 (copy)
            v44.Drag:Stop();
        end);
        v44._dragStopFunc = l_UserInputService_0.InputEnded:Connect(function(v53, v54) --[[ Line: 293 ]]
            -- upvalues: v44 (copy)
            if v54 then
                return;
            else
                if (v53.UserInputType == Enum.UserInputType.MouseButton1 or v53.UserInputType == Enum.UserInputType.Touch) and v44.Drag.Active then
                    v44.Drag:Stop();
                end;
                return;
            end;
        end);
    end;
end;
v3.Destroy = function(v55) --[[ Line: 306 ]] --[[ Name: Destroy ]]
    if v55.Instance and v55.Instance.Parent then
        v55.Instance.Parent:Destroy();
    end;
    if v55._dragStopFunc then
        v55._dragStopFunc:Disconnect();
        v55._dragStopFunc = nil;
    end;
    if v55._valueDownFunc then
        v55._valueDownFunc:Disconnect();
        v55._valueDownFunc = nil;
    end;
    if v55._valueUpFunc_uis then
        v55._valueUpFunc_uis:Disconnect();
        v55._valueUpFunc_uis = nil;
    end;
end;
v3.GetMouseToWheelPos = function(v56) --[[ Line: 329 ]] --[[ Name: GetMouseToWheelPos ]]
    local v57 = Vector2.new(v56.Mouse.X, v56.Mouse.Y);
    local l_AbsolutePosition_0 = v56.Instance.Wheel.Image.AbsolutePosition;
    local l_AbsoluteSize_0 = v56.Instance.Wheel.Image.AbsoluteSize;
    local v60 = v57 - l_AbsolutePosition_0;
    local v61 = l_AbsolutePosition_0 + l_AbsoluteSize_0 / 2;
    local v62 = l_AbsoluteSize_0.X / 2;
    local v63 = v61 - v57;
    if v62 < v63.Magnitude then
        return l_AbsoluteSize_0 / 2 - v63.Unit * v62;
    else
        return v60;
    end;
end;
v3.GetMouseToValuePos = function(v64) --[[ Line: 347 ]] --[[ Name: GetMouseToValuePos ]]
    local v65 = Vector2.new(v64.Mouse.X, v64.Mouse.Y);
    local l_AbsolutePosition_1 = v64.Instance.Right.Value.AbsolutePosition;
    local l_AbsoluteSize_1 = v64.Instance.Right.Value.AbsoluteSize;
    return (math.clamp((v65.Y - l_AbsolutePosition_1.Y) / l_AbsoluteSize_1.Y, 0, 1));
end;
v3.UpdateColor = function(v68) --[[ Line: 356 ]] --[[ Name: UpdateColor ]]
    v68.Instance.Parent.UpdateEvent:Fire(v68.Color);
    v68.Instance.Bottom.Color.Frame.BackgroundColor3 = v68.Color;
    v68.Instance.Parent.Properties.RGB.R.Frame.TextBox.Text = math.floor(v68.Color.R * 255 + 0.5);
    v68.Instance.Parent.Properties.RGB.G.Frame.TextBox.Text = math.floor(v68.Color.G * 255 + 0.5);
    v68.Instance.Parent.Properties.RGB.B.Frame.TextBox.Text = math.floor(v68.Color.B * 255 + 0.5);
    local v69, v70, v71 = v68.Color:ToHSV();
    v68.Instance.Parent.Properties.HSV.H.Frame.TextBox.Text = math.floor(v69 * 360 + 0.5);
    v68.Instance.Parent.Properties.HSV.S.Frame.TextBox.Text = roundToHundredths(v70);
    v68.Instance.Parent.Properties.HSV.V.Frame.TextBox.Text = roundToHundredths(v71);
    local v72 = v68.Color:ToHex();
    v68.Instance.Parent.Content.Bottom.Hex.Frame.TextBox.Text = string.format("#%s", string.lower(v72));
end;
v3.SetColorFromPos = function(v73, v74) --[[ Line: 374 ]] --[[ Name: SetColorFromPos ]]
    local l_AbsoluteSize_2 = v73.Instance.Wheel.Image.AbsoluteSize;
    local v76 = l_AbsoluteSize_2 / 2 - v74;
    local v77 = l_AbsoluteSize_2.X / 2;
    local _ = math.min(v76.Magnitude, v77);
    local v79, v80 = toPolar(v76 * Vector2.new(-1, 1));
    local v81 = radToDeg(v79) / 360;
    local v82 = v80 / v77;
    v81 = math.clamp(v81, 0, 1);
    v82 = math.clamp(v82, 0, 1);
    local _, _, v85 = v73.Color:ToHSV();
    v73.Color = Color3.fromHSV(v81, v82, v85);
    v73:UpdateColor();
    v73:SetValueGradient(v81, v82);
end;
v3.SetValueGradient = function(v86, v87, v88) --[[ Line: 396 ]] --[[ Name: SetValueGradient ]]
    v86.CurrentSaturation = v88;
    v86.CurrentHue = v87;
    local v89 = Color3.fromHSV(v87, v88, 1);
    v86.Instance.Right.Value.UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, v89), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    });
end;
v3.SetColor = function(v90, v91) --[[ Line: 408 ]] --[[ Name: SetColor ]]
    local v92, v93, v94 = v91:ToHSV();
    v90.Color = v91;
    local l_AbsoluteSize_3 = v90.Instance.Wheel.Image.AbsoluteSize;
    local _ = l_AbsoluteSize_3 / 2;
    local _ = l_AbsoluteSize_3.X / 2;
    local v98 = Vector2.new(0.5, 0.5);
    local v99 = Vector2.new(-1, 0);
    v99 = rotateVector(v99, v92 * -360);
    v98 = v98 - rotateVector(v99, 180) * v93 * 0.5;
    v90.Instance.Wheel.Image.Select.Position = UDim2.fromScale(v98.X, v98.Y);
    v90.Instance.Right.Value.Select.Position = UDim2.new(0, 0, 1 - v94, 0);
    v90:UpdateColor();
    v90:SetValueGradient(v92, v93);
end;
return v3;