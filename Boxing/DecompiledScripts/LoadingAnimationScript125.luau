local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script.Parent;
local v2 = TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, -1, true);
for _, v4 in l_Parent_0:GetChildren() do
    for _, v6 in v4:GetChildren() do
        l_TweenService_0:Create(v6, v2, {
            Size = UDim2.new(v6.Size.X.Scale * 0.5, 0, v6.Size.Y.Scale * 0.5, 0), 
            ImageColor3 = Color3.fromRGB(100, 100, 100)
        }):Play();
        task.wait(0.5);
    end;
end;