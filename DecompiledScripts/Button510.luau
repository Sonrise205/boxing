local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local _ = require(l_ReplicatedStorage_0.PrivateServerPlusModules.SettingTypes);
local v5 = Random.new();
local v6 = TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local function _() --[[ Line: 20 ]] --[[ Name: PlayPressSound ]]
    -- upvalues: l_SoundHelper_0 (copy), v5 (copy)
    l_SoundHelper_0:PlaySound({
        Name = "Pop2", 
        Parent = workspace.Debris, 
        Speed = v5:NextNumber(1.4, 1.6)
    });
end;
local function v9(_) --[[ Line: 30 ]] --[[ Name: UpdateVisualState ]]

end;
local function v18(v10) --[[ Line: 35 ]] --[[ Name: CreateConnections ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_TweenService_0 (copy), v6 (copy), l_SoundHelper_0 (copy), v5 (copy)
    local l_GuiInstance_0 = v10.GuiInstance;
    local l_Size_0 = l_GuiInstance_0.Size;
    local v13 = nil;
    local l_ClientCallbackName_0 = v10.OriginalInfo.ClientCallbackName;
    if l_ClientCallbackName_0 then
        local l_FirstChild_0 = l_ReplicatedStorage_0.PrivateServerPlusModules.ButtonGuiCallbacks:FindFirstChild(l_ClientCallbackName_0);
        v13 = require(l_FirstChild_0);
    end;
    local function v16() --[[ Line: 47 ]] --[[ Name: ClaimButtonUp ]]
        -- upvalues: l_TweenService_0 (ref), l_GuiInstance_0 (copy), v6 (ref), l_Size_0 (copy), v13 (ref), v10 (copy)
        l_TweenService_0:Create(l_GuiInstance_0, v6, {
            Size = l_Size_0
        }):Play();
        l_TweenService_0:Create(l_GuiInstance_0.Main.Top, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, -0.1, 0)
        }):Play();
        if v13 then
            v13(v10);
            return;
        else
            v10.OnChange:Fire();
            return;
        end;
    end;
    local function v17() --[[ Line: 58 ]] --[[ Name: ClaimButtonDown ]]
        -- upvalues: l_SoundHelper_0 (ref), v5 (ref), l_TweenService_0 (ref), l_GuiInstance_0 (copy), v6 (ref), l_Size_0 (copy)
        l_SoundHelper_0:PlaySound({
            Name = "Pop2", 
            Parent = workspace.Debris, 
            Speed = v5:NextNumber(1.4, 1.6)
        });
        l_TweenService_0:Create(l_GuiInstance_0, v6, {
            Size = UDim2.new(l_Size_0.X.Scale * 0.97, 0, l_Size_0.Y.Scale * 0.97, 0)
        }):Play();
        l_TweenService_0:Create(l_GuiInstance_0.Main.Top, TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0.01, 0)
        }):Play();
    end;
    l_GuiInstance_0.Button.MouseButton1Down:Connect(v17);
    l_GuiInstance_0.Button.MouseButton1Up:Connect(v16);
end;
return function(v19, v20) --[[ Line: 69 ]] --[[ Name: WrapInstance ]]
    -- upvalues: v9 (copy), v18 (copy)
    local l_Button_0 = v19:FindFirstChild("Button");
    l_Button_0.Visible = true;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v23 = {
        CurrentValue = nil, 
        GuiInstance = l_Button_0, 
        UpdateVisual = v9, 
        OnChange = l_BindableEvent_0, 
        OriginalInfo = v20
    };
    v18(v23);
    return v23;
end;