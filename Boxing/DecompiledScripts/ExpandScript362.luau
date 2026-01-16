local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_ScrollingFrame_0 = l_Parent_0:WaitForChild("CategoryFrame"):WaitForChild("ScrollingFrame");
local v3 = false;
local l_BottomHolder_0 = l_Parent_0:WaitForChild("BottomHolder");
local _ = l_BottomHolder_0:WaitForChild("DirectSearch");
local l_ExpandButton_0 = l_BottomHolder_0:WaitForChild("ExpandButton");
local l_UIGridLayout_0 = l_ScrollingFrame_0.ItemFrame:WaitForChild("UIGridLayout");
local l_CellPadding_0 = l_UIGridLayout_0.CellPadding;
local l_CellSize_0 = l_UIGridLayout_0.CellSize;
local v10 = {
    Default = Color3.fromRGB(20, 20, 20), 
    Hover = Color3.fromRGB(70, 70, 70), 
    Pressed = Color3.fromRGB(132, 132, 132)
};
local l_Size_0 = l_ExpandButton_0.Expand.Size;
local v12 = UDim2.new(l_Size_0.X.Scale * 0.7, 0, l_Size_0.Y.Scale * 0.7, 0);
local v13 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
l_ExpandButton_0.MouseButton1Down:Connect(function() --[[ Line: 32 ]]
    -- upvalues: l_TweenService_0 (copy), l_ExpandButton_0 (copy), v13 (copy), v10 (copy), v3 (ref), v12 (copy), l_Size_0 (copy), l_UIGridLayout_0 (copy), l_CellSize_0 (copy), l_CellPadding_0 (copy)
    l_TweenService_0:Create(l_ExpandButton_0, v13, {
        BackgroundColor3 = v10.Pressed
    }):Play();
    v3 = not v3;
    l_ExpandButton_0.Expand.Visible = v3;
    l_ExpandButton_0.Compress.Visible = not v3;
    local v14 = v3 and l_ExpandButton_0.Compress or l_ExpandButton_0.Expand;
    v14.Size = v12;
    l_TweenService_0:Create(v14, v13, {
        Size = l_Size_0
    }):Play();
    l_UIGridLayout_0.CellSize = v3 and UDim2.new(l_CellSize_0.X.Scale * 1.5, 0, l_CellSize_0.Y.Scale * 1.5, 0) or l_CellSize_0;
    l_UIGridLayout_0.CellPadding = v3 and UDim2.new(l_CellPadding_0.X.Scale * 1.45, 0, l_CellPadding_0.Y.Scale * 1.45, 0) or l_CellPadding_0;
end);
l_ExpandButton_0.MouseButton1Up:Connect(function() --[[ Line: 51 ]]
    -- upvalues: l_TweenService_0 (copy), l_ExpandButton_0 (copy), v13 (copy), v10 (copy)
    l_TweenService_0:Create(l_ExpandButton_0, v13, {
        BackgroundColor3 = v10.Default
    }):Play();
end);
l_ExpandButton_0.MouseEnter:Connect(function() --[[ Line: 55 ]]
    -- upvalues: l_TweenService_0 (copy), l_ExpandButton_0 (copy), v13 (copy), v10 (copy)
    l_TweenService_0:Create(l_ExpandButton_0, v13, {
        BackgroundColor3 = v10.Hover
    }):Play();
end);
l_ExpandButton_0.MouseLeave:Connect(function() --[[ Line: 59 ]]
    -- upvalues: l_TweenService_0 (copy), l_ExpandButton_0 (copy), v13 (copy), v10 (copy)
    l_TweenService_0:Create(l_ExpandButton_0, v13, {
        BackgroundColor3 = v10.Default
    }):Play();
end);