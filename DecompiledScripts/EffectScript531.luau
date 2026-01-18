local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_Parent_0 = script.Parent;
local v5 = Random.new();
local v6 = TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local function _() --[[ Line: 12 ]] --[[ Name: PlayPressSound ]]
    -- upvalues: l_SoundHelper_0 (copy), v5 (copy)
    l_SoundHelper_0:PlaySound({
        Name = "Pop2", 
        Parent = workspace.Debris, 
        Speed = v5:NextNumber(1.4, 1.6)
    });
end;
local l_Size_0 = l_Parent_0.Size;
ClaimButtonUp = function() --[[ Line: 21 ]] --[[ Name: ClaimButtonUp ]]
    -- upvalues: l_SoundHelper_0 (copy), v5 (copy), l_TweenService_0 (copy), l_Parent_0 (copy), v6 (copy), l_Size_0 (copy)
    l_SoundHelper_0:PlaySound({
        Name = "Pop2", 
        Parent = workspace.Debris, 
        Speed = v5:NextNumber(1.4, 1.6)
    });
    l_TweenService_0:Create(l_Parent_0, v6, {
        Size = l_Size_0
    }):Play();
    l_TweenService_0:Create(l_Parent_0.Main.Top, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, -0.1, 0)
    }):Play();
end;
ClaimButtonDown = function() --[[ Line: 27 ]] --[[ Name: ClaimButtonDown ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v6 (copy), l_Size_0 (copy)
    l_TweenService_0:Create(l_Parent_0, v6, {
        Size = UDim2.new(l_Size_0.X.Scale * 0.97, 0, l_Size_0.Y.Scale * 0.97, 0)
    }):Play();
    l_TweenService_0:Create(l_Parent_0.Main.Top, TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0.01, 0)
    }):Play();
end;
l_Parent_0.Button.MouseButton1Down:Connect(function() --[[ Line: 32 ]]
    ClaimButtonDown();
end);
l_Parent_0.Button.MouseButton1Up:Connect(function() --[[ Line: 36 ]]
    ClaimButtonUp();
end);