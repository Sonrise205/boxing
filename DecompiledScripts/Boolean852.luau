local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local _ = require(l_ReplicatedStorage_0.PrivateServerPlusModules.SettingTypes);
local v5 = Random.new();
local v6 = Color3.fromRGB(145, 240, 67);
local v7 = Color3.fromRGB(255, 89, 38);
local v8 = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out);
local function _() --[[ Line: 19 ]] --[[ Name: PlayPressSound ]]
    -- upvalues: l_SoundHelper_0 (copy), v5 (copy)
    l_SoundHelper_0:PlaySound({
        Name = "Pop2", 
        Parent = workspace.Debris, 
        Speed = v5:NextNumber(1.4, 1.6)
    });
end;
local function v13(v10) --[[ Line: 29 ]] --[[ Name: UpdateVisualState ]]
    -- upvalues: l_TweenService_0 (copy), v8 (copy), v6 (copy), v7 (copy)
    local l_Switch_0 = v10.GuiInstance:WaitForChild("ToggleContainer"):WaitForChild("Switch");
    local l_Color_0 = l_Switch_0:WaitForChild("Color");
    l_TweenService_0:Create(l_Switch_0, v8, {
        Position = UDim2.new(v10.CurrentValue and 1 or 0, 0, 0.5, 0)
    }):Play();
    l_TweenService_0:Create(l_Color_0, v8, {
        BackgroundColor3 = v10.CurrentValue and v6 or v7
    }):Play();
end;
local function v19(v14) --[[ Line: 40 ]] --[[ Name: CreateConnections ]]
    -- upvalues: v6 (copy), v7 (copy), l_SoundHelper_0 (copy), v5 (copy)
    local l_GuiInstance_0 = v14.GuiInstance;
    local l_Switch_1 = l_GuiInstance_0:WaitForChild("ToggleContainer"):WaitForChild("Switch");
    local l_Color_1 = l_Switch_1:WaitForChild("Color");
    local l_Button_0 = l_GuiInstance_0:WaitForChild("Button");
    l_Color_1.BackgroundColor3 = v14.CurrentValue and v6 or v7;
    l_Switch_1.Position = UDim2.new(v14.CurrentValue and 1 or 0, 0, 0.5, 0);
    l_Button_0.MouseButton1Down:Connect(function() --[[ Line: 51 ]]
        -- upvalues: l_SoundHelper_0 (ref), v5 (ref), v14 (copy)
        l_SoundHelper_0:PlaySound({
            Name = "Pop2", 
            Parent = workspace.Debris, 
            Speed = v5:NextNumber(1.4, 1.6)
        });
        v14.OnChange:Fire(not v14.CurrentValue);
    end);
end;
return function(v20, v21) --[[ Line: 58 ]] --[[ Name: WrapInstance ]]
    -- upvalues: v13 (copy), v19 (copy)
    local l_Boolean_0 = v20:FindFirstChild("Boolean");
    l_Boolean_0.Visible = true;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v24 = {
        CurrentValue = v21.Default, 
        GuiInstance = l_Boolean_0, 
        UpdateVisual = v13, 
        OnChange = l_BindableEvent_0, 
        OriginalInfo = v21
    };
    v19(v24);
    return v24;
end;