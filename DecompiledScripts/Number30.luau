local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local v4 = require(l_ReplicatedStorage_0.PrivateServerPlusModules.SettingTypes);
local v5 = Random.new();
local function _() --[[ Line: 16 ]] --[[ Name: PlayPressSound ]]
    -- upvalues: l_SoundHelper_0 (copy), v5 (copy)
    l_SoundHelper_0:PlaySound({
        Name = "Pop2", 
        Parent = workspace.Debris, 
        Speed = v5:NextNumber(1.4, 1.6)
    });
end;
local v7 = TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local v8 = nil;
local v9 = nil;
local function _(v10, v11) --[[ Line: 33 ]] --[[ Name: TweenSmallerSize ]]
    -- upvalues: v9 (ref), v8 (ref), l_TweenService_0 (copy), v7 (copy)
    l_TweenService_0:Create(v10, v7, {
        Size = if v11 then v9 else v8
    }):Play();
end;
local function v18(v13) --[[ Line: 38 ]] --[[ Name: UpdateVisualState ]]
    -- upvalues: v4 (copy)
    local l_GuiInstance_0 = v13.GuiInstance;
    local l_IncrementType_0 = v13.OriginalInfo.IncrementType;
    local _, v17 = v4.ValidateInput(v13.CurrentValue, l_IncrementType_0);
    l_GuiInstance_0.Value.Text = v17;
end;
local _ = function(v19, v20) --[[ Line: 47 ]] --[[ Name: NextValue ]]
    -- upvalues: v4 (copy)
    local v21 = v19 + v20.Increment;
    local v22, _ = v4.ValidateInput(v21, v20);
    return v22;
end;
local _ = function(v25, v26) --[[ Line: 53 ]] --[[ Name: PreviousValue ]]
    -- upvalues: v4 (copy)
    local v27 = v25 - v26.Increment;
    local v28, _ = v4.ValidateInput(v27, v26);
    return v28;
end;
local function v50(v31) --[[ Line: 59 ]] --[[ Name: CreateConnections ]]
    -- upvalues: v9 (ref), l_TweenService_0 (copy), v7 (copy), l_SoundHelper_0 (copy), v5 (copy), v8 (ref), v4 (copy)
    local l_GuiInstance_1 = v31.GuiInstance;
    local l_MinusButton_0 = l_GuiInstance_1:FindFirstChild("MinusButton");
    local l_PlusButton_0 = l_GuiInstance_1:FindFirstChild("PlusButton");
    local l_IncrementType_1 = v31.OriginalInfo.IncrementType;
    local function _() --[[ Line: 66 ]] --[[ Name: PressDown ]]
        -- upvalues: l_GuiInstance_1 (copy), v9 (ref), l_TweenService_0 (ref), v7 (ref), l_SoundHelper_0 (ref), v5 (ref)
        l_TweenService_0:Create(l_GuiInstance_1, v7, {
            Size = v9
        }):Play();
        l_SoundHelper_0:PlaySound({
            Name = "Pop2", 
            Parent = workspace.Debris, 
            Speed = v5:NextNumber(1.4, 1.6)
        });
    end;
    local function _() --[[ Line: 71 ]] --[[ Name: PressUp ]]
        -- upvalues: l_GuiInstance_1 (copy), v8 (ref), l_TweenService_0 (ref), v7 (ref)
        l_TweenService_0:Create(l_GuiInstance_1, v7, {
            Size = v8
        }):Play();
    end;
    l_MinusButton_0.MouseButton1Down:Connect(function() --[[ Line: 75 ]]
        -- upvalues: l_GuiInstance_1 (copy), v9 (ref), l_TweenService_0 (ref), v7 (ref), l_SoundHelper_0 (ref), v5 (ref), v31 (copy), l_IncrementType_1 (copy), v4 (ref)
        l_TweenService_0:Create(l_GuiInstance_1, v7, {
            Size = v9
        }):Play();
        l_SoundHelper_0:PlaySound({
            Name = "Pop2", 
            Parent = workspace.Debris, 
            Speed = v5:NextNumber(1.4, 1.6)
        });
        local l_OnChange_0 = v31.OnChange;
        local l_CurrentValue_0 = v31.CurrentValue;
        local l_l_IncrementType_1_0 = l_IncrementType_1;
        local v41 = l_CurrentValue_0 - l_l_IncrementType_1_0.Increment;
        local v42, _ = v4.ValidateInput(v41, l_l_IncrementType_1_0);
        l_OnChange_0:Fire(v42);
    end);
    l_MinusButton_0.MouseButton1Up:Connect(function() --[[ Line: 80 ]]
        -- upvalues: l_GuiInstance_1 (copy), v8 (ref), l_TweenService_0 (ref), v7 (ref)
        l_TweenService_0:Create(l_GuiInstance_1, v7, {
            Size = v8
        }):Play();
    end);
    l_PlusButton_0.MouseButton1Down:Connect(function() --[[ Line: 84 ]]
        -- upvalues: l_GuiInstance_1 (copy), v9 (ref), l_TweenService_0 (ref), v7 (ref), l_SoundHelper_0 (ref), v5 (ref), v31 (copy), l_IncrementType_1 (copy), v4 (ref)
        l_TweenService_0:Create(l_GuiInstance_1, v7, {
            Size = v9
        }):Play();
        l_SoundHelper_0:PlaySound({
            Name = "Pop2", 
            Parent = workspace.Debris, 
            Speed = v5:NextNumber(1.4, 1.6)
        });
        local l_OnChange_1 = v31.OnChange;
        local l_CurrentValue_1 = v31.CurrentValue;
        local l_l_IncrementType_1_1 = l_IncrementType_1;
        local v47 = l_CurrentValue_1 + l_l_IncrementType_1_1.Increment;
        local v48, _ = v4.ValidateInput(v47, l_l_IncrementType_1_1);
        l_OnChange_1:Fire(v48);
    end);
    l_PlusButton_0.MouseButton1Up:Connect(function() --[[ Line: 89 ]]
        -- upvalues: l_GuiInstance_1 (copy), v8 (ref), l_TweenService_0 (ref), v7 (ref)
        l_TweenService_0:Create(l_GuiInstance_1, v7, {
            Size = v8
        }):Play();
    end);
end;
return function(v51, v52) --[[ Line: 95 ]] --[[ Name: WrapInstance ]]
    -- upvalues: v8 (ref), v9 (ref), v18 (copy), v50 (copy)
    local l_Number_0 = v51:FindFirstChild("Number");
    l_Number_0.Visible = true;
    v8 = l_Number_0.Size;
    v9 = UDim2.fromScale(v8.X.Scale * 0.95, v8.Y.Scale * 0.95);
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v55 = {
        CurrentValue = v52.IncrementType.Default, 
        GuiInstance = l_Number_0, 
        UpdateVisual = v18, 
        OnChange = l_BindableEvent_0, 
        OriginalInfo = v52
    };
    v50(v55);
    return v55;
end;