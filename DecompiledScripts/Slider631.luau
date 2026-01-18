local v0 = {
    Sliders = {}
};
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_TweenService_0 = game:GetService("TweenService");
assert(l_RunService_0:IsClient(), "Slider module can only be used on the Client!");
local l_clamp_0 = math.clamp;
local _ = math.floor;
local _ = math.min;
local _ = math.max;
local _ = math.round;
local l_abs_0 = math.abs;
local _ = string.lower;
local l_upper_0 = string.upper;
local l_sub_0 = string.sub;
local l_format_0 = string.format;
local l_Utils_0 = script.Utils;
local v15 = require(l_Utils_0.Signal);
local v16 = require(l_Utils_0.Switch);
local v17 = require(l_Utils_0.VectorFuncs);
local v18 = require(l_Utils_0.SliderFuncs);
v0.__index = function(v19, v20) --[[ Line: 42 ]]
    -- upvalues: l_sub_0 (copy), l_format_0 (copy), v0 (copy)
    local v21 = {
        {
            ".OnChange", 
            ".Changed", 
            (rawget(v19, "Changed"))
        }
    };
    for _, v23 in ipairs(v21) do
        if l_sub_0(v23[1], 2) == v20 then
            warn(l_format_0("%s is deprecated, please use %s instead", v23[1], v23[2]));
            return v23[3];
        end;
    end;
    return v0[v20];
end;
v0.new = function(v24, v25) --[[ Line: 67 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), l_format_0 (copy), l_upper_0 (copy), v16 (copy), l_clamp_0 (copy), v18 (copy), v15 (copy)
    assert(pcall(function() --[[ Line: 68 ]]
        -- upvalues: v24 (copy)
        return v24.AbsoluteSize, v24.AbsolutePosition;
    end), "Holder argument does not have an AbsoluteSize/AbsolutePosition");
    local v26 = false;
    for _, v28 in ipairs(v0.Sliders) do
        if v28._holder == v24 then
            v26 = true;
            break;
        end;
    end;
    assert(not v26, "Cannot set two sliders with same frame!");
    assert(v25.SliderData.Increment ~= nil, "Failed to find Increment in SliderData table");
    assert(v25.SliderData.Start ~= nil, "Failed to find Start in SliderData table");
    assert(v25.SliderData.End ~= nil, "Failed to find End in SliderData table");
    assert(v25.SliderData.Increment > 0, "SliderData.Increment must be greater than 0");
    assert(v25.SliderData.End > v25.SliderData.Start, l_format_0("Slider end value must be greater than its start value! (%.1f <= %.1f)", v25.SliderData.End, v25.SliderData.Start));
    local v29 = setmetatable({}, v0);
    v29._holder = v24;
    v29._data = {
        Button = nil, 
        HolderButton = nil, 
        UiType = nil, 
        HolderPart = nil, 
        SurfaceGui = nil, 
        CLICK_OVERRIDE = false, 
        _mainConnection = nil, 
        _miscConnections = {}, 
        _inputPos = nil, 
        _percent = 0, 
        _value = 0, 
        _scaleIncrement = 0, 
        _currentTween = nil
    };
    v29._config = v25;
    v29._config.Axis = l_upper_0(v25.Axis or "X");
    v29._config.Padding = v25.Padding or 5;
    v29._config.MoveInfo = v25.MoveInfo or TweenInfo.new(0.2);
    v29._config.MoveType = v25.MoveType or "Tween";
    v29.IsHeld = false;
    local l_Slider_0 = v24:FindFirstChild("Slider");
    assert(l_Slider_0 ~= nil, "Failed to find slider button.");
    assert(l_Slider_0:IsA("GuiButton"), "Slider is not a GuiButton");
    v29._data.Button = l_Slider_0;
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.BackgroundTransparency = 1;
    l_TextButton_0.Text = "";
    l_TextButton_0.Name = "HolderClickButton";
    l_TextButton_0.Size = UDim2.fromScale(1, 1);
    l_TextButton_0.ZIndex = -1;
    l_TextButton_0.Parent = v29._holder;
    v29._data.HolderButton = l_TextButton_0;
    v29._data.UiType = v24:FindFirstAncestorOfClass("ScreenGui") and "ScreenGui" or v24:FindFirstAncestorOfClass("SurfaceGui") and "SurfaceGui" or nil;
    v29._data.HolderPart = v16(v29._data.UiType)({
        SurfaceGui = v24:FindFirstAncestorWhichIsA("BasePart"), 
        ScreenGui = nil
    });
    v29._data.SurfaceGui = v16(v29._data.UiType)({
        SurfaceGui = v24:FindFirstAncestorWhichIsA("SurfaceGui"), 
        ScreenGui = nil
    });
    v29._data._percent = 0;
    if v25.SliderData.DefaultValue then
        v25.SliderData.DefaultValue = l_clamp_0(v25.SliderData.DefaultValue, v25.SliderData.Start, v25.SliderData.End);
        v29._data._percent = v18.getAlphaBetween(v25.SliderData.Start, v25.SliderData.End, v25.SliderData.DefaultValue);
    end;
    v29._data._percent = l_clamp_0(v29._data._percent, 0, 1);
    v29._data._value = v18.getNewValue(v29);
    v29._data._scaleIncrement = v18.getScaleIncrement(v29);
    v29.Changed = v15.new();
    v29.Dragged = v15.new();
    v29.Released = v15.new();
    v29:Move();
    table.insert(v0.Sliders, v29);
    return v29;
end;
v0.Track = function(v32) --[[ Line: 169 ]] --[[ Name: Track ]]
    -- upvalues: l_UserInputService_0 (copy)
    for _, v34 in ipairs(v32._data._miscConnections) do
        v34:Disconnect();
    end;
    table.insert(v32._data._miscConnections, v32._data.Button.MouseButton1Down:Connect(function() --[[ Line: 174 ]]
        -- upvalues: v32 (copy)
        v32.IsHeld = true;
    end));
    table.insert(v32._data._miscConnections, v32._data.Button.MouseButton1Up:Connect(function() --[[ Line: 178 ]]
        -- upvalues: v32 (copy)
        if v32.IsHeld then
            v32.Released:Fire(v32._data._value);
        end;
        v32.IsHeld = false;
    end));
    table.insert(v32._data._miscConnections, v32._data.HolderButton.Activated:Connect(function(v35) --[[ Line: 185 ]]
        -- upvalues: v32 (copy)
        if v35.UserInputType == Enum.UserInputType.MouseButton1 or v35.UserInputType == Enum.UserInputType.Touch then
            v32._data._inputPos = v35.Position;
            v32._data.CLICK_OVERRIDE = true;
            v32:Update();
            v32._data.CLICK_OVERRIDE = false;
        end;
    end));
    if v32.Changed then
        v32.Changed:Fire(v32._data._value);
    end;
    if v32._data._mainConnection then
        v32._data._mainConnection:Disconnect();
    end;
    v32._data._mainConnection = l_UserInputService_0.InputChanged:Connect(function(v36, _) --[[ Line: 202 ]]
        -- upvalues: v32 (copy)
        if v36.UserInputType == Enum.UserInputType.MouseMovement or v36.UserInputType == Enum.UserInputType.Touch then
            v32._data._inputPos = v36.Position;
            v32:Update();
        end;
    end);
end;
v0.Update = function(v38) --[[ Line: 210 ]] --[[ Name: Update ]]
    -- upvalues: v16 (copy), v17 (copy), l_abs_0 (copy), v18 (copy), l_clamp_0 (copy)
    if v38.IsHeld and not v38._data.CLICK_OVERRIDE and v38._data._inputPos then
        local v48 = v16(v38._data.UiType)({
            ScreenGui = v38._data._inputPos[v38._config.Axis], 
            SurfaceGui = function() --[[ Line: 215 ]]
                -- upvalues: v38 (copy), v17 (ref), l_abs_0 (ref)
                local v39 = RaycastParams.new();
                v39.FilterType = Enum.RaycastFilterType.Include;
                v39.FilterDescendantsInstances = {
                    v38._data.HolderPart
                };
                local v40 = workspace.CurrentCamera:ScreenPointToRay(v38._data._inputPos.X, v38._data._inputPos.Y);
                local v41 = workspace:Raycast(v40.Origin, v40.Direction * 500, v39);
                if v41 then
                    local l_Instance_0 = v41.Instance;
                    local l_Position_0 = v41.Position;
                    local l_Normal_0 = v41.Normal;
                    if v17.normalVectorToFace(l_Instance_0, l_Normal_0) ~= v38._data.SurfaceGui.Face then
                        return;
                    else
                        local v45 = CFrame.new(l_Position_0, l_Position_0 + l_Normal_0);
                        local v46 = v17.getTopLeftCorners(l_Instance_0)[v38._data.SurfaceGui.Face]:ToObjectSpace(v45);
                        local v47 = v17.mapOffsetToFace(v46, v38._config.Axis, v38._data.SurfaceGui.Face);
                        return Vector2.new(l_abs_0(v47.X) * v38._data.SurfaceGui.PixelsPerStud, l_abs_0(v47.Y) * v38._data.SurfaceGui.PixelsPerStud)[v38._config.Axis];
                    end;
                else
                    return;
                end;
            end
        });
        if v48 then
            local v49 = v38._holder.AbsoluteSize[v38._config.Axis];
            local v50 = v38._holder.AbsolutePosition[v38._config.Axis];
            local v51 = l_clamp_0(v18.snapToScale((v48 - v50) / v49, v38._data._scaleIncrement), 0, 1);
            v38._data._percent = v51;
            v38.Dragged:Fire(v38._data._value);
            v38:Move();
        end;
    end;
end;
v0.Untrack = function(v52) --[[ Line: 264 ]] --[[ Name: Untrack ]]
    for _, v54 in ipairs(v52._data._miscConnections) do
        v54:Disconnect();
    end;
    if v52._data._mainConnection then
        v52._data._mainConnection:Disconnect();
    end;
    v52.IsHeld = false;
end;
v0.Reset = function(v55) --[[ Line: 274 ]] --[[ Name: Reset ]]
    -- upvalues: v18 (copy), l_clamp_0 (copy)
    for _, v57 in ipairs(v55._data._miscConnections) do
        v57:Disconnect();
    end;
    if v55._data._mainConnection then
        v55._data._mainConnection:Disconnect();
    end;
    v55.IsHeld = false;
    v55._data._percent = 0;
    if v55._config.SliderData.DefaultValue then
        v55._data._percent = v18.getAlphaBetween(v55._config.SliderData.Start, v55._config.SliderData.End, v55._config.SliderData.DefaultValue);
    end;
    v55._data._percent = l_clamp_0(v55._data._percent, 0, 1);
    v55:Move();
end;
v0.OverrideValue = function(v58, v59) --[[ Line: 292 ]] --[[ Name: OverrideValue ]]
    -- upvalues: v18 (copy), l_clamp_0 (copy)
    v58.IsHeld = false;
    v58._data._percent = v18.getAlphaBetween(v58._config.SliderData.Start, v58._config.SliderData.End, v59);
    v58._data._percent = l_clamp_0(v58._data._percent, 0, 1);
    v58._data._percent = v18.snapToScale(v58._data._percent, v58._data._scaleIncrement);
    v58:Move();
end;
v0.Move = function(v60) --[[ Line: 300 ]] --[[ Name: Move ]]
    -- upvalues: v18 (copy), v16 (copy), l_TweenService_0 (copy)
    v60._data._value = v18.getNewValue(v60);
    v16(v60._config.MoveType)({
        [{
            "Tween", 
            nil
        }] = function() --[[ Line: 304 ]]
            -- upvalues: v60 (copy), l_TweenService_0 (ref), v18 (ref)
            if v60._data._currentTween then
                v60._data._currentTween:Cancel();
            end;
            v60._data._currentTween = l_TweenService_0:Create(v60._data.Button, v60._config.MoveInfo, {
                Position = v18.getNewPosition(v60)
            });
            v60._data._currentTween:Play();
        end, 
        Instant = function() --[[ Line: 314 ]]
            -- upvalues: v60 (copy), v18 (ref)
            v60._data.Button.Position = v18.getNewPosition(v60);
        end, 
        Default = function() --[[ Line: 318 ]]
            print("Uh");
        end
    });
    v60.Changed:Fire(v60._data._value);
end;
v0.OverrideIncrement = function(v61, v62) --[[ Line: 325 ]] --[[ Name: OverrideIncrement ]]
    -- upvalues: v18 (copy), l_clamp_0 (copy)
    v61._config.SliderData.Increment = v62;
    v61._data._scaleIncrement = v18.getScaleIncrement(v61);
    v61._data._percent = l_clamp_0(v61._data._percent, 0, 1);
    v61._data._percent = v18.snapToScale(v61._data._percent, v61._data._scaleIncrement);
    v61:Move();
end;
v0.GetValue = function(v63) --[[ Line: 333 ]] --[[ Name: GetValue ]]
    return v63._data._value;
end;
v0.GetIncrement = function(v64) --[[ Line: 337 ]] --[[ Name: GetIncrement ]]
    return v64._data._increment;
end;
v0.Destroy = function(v65) --[[ Line: 341 ]] --[[ Name: Destroy ]]
    -- upvalues: v0 (copy)
    for _, v67 in ipairs(v65._data._miscConnections) do
        v67:Disconnect();
    end;
    if v65._data._mainConnection then
        v65._data._mainConnection:Disconnect();
    end;
    v65.Changed:Destroy();
    v65.Dragged:Destroy();
    v65.Released:Destroy();
    for v68 = 1, #v0.Sliders do
        if v0.Sliders[v68] == v65 then
            table.remove(v0.Sliders, v68);
        end;
    end;
    setmetatable(v65, nil);
    v65 = nil;
end;
l_UserInputService_0.InputEnded:Connect(function(v69, _) --[[ Line: 364 ]]
    -- upvalues: v0 (copy)
    if v69.UserInputType == Enum.UserInputType.MouseButton1 or v69.UserInputType == Enum.UserInputType.Touch then
        for _, v72 in ipairs(v0.Sliders) do
            if v72.IsHeld then
                v72.Released:Fire(v72._data._value);
            end;
            v72.IsHeld = false;
        end;
    end;
end);
return v0;