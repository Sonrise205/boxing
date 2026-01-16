local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local v4 = Random.new();
local v5 = TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local function _() --[[ Line: 12 ]] --[[ Name: PlayPressSound ]]
    -- upvalues: l_SoundHelper_0 (copy), v4 (copy)
    l_SoundHelper_0:PlaySound({
        Name = "Pop2", 
        Parent = workspace.Debris, 
        Speed = v4:NextNumber(1.4, 1.6)
    });
end;
return function(v7) --[[ Line: 20 ]] --[[ Name: Wrap ]]
    -- upvalues: l_SoundHelper_0 (copy), v4 (copy), l_TweenService_0 (copy), v5 (copy)
    local l_Size_0 = v7.Size;
    local function v9() --[[ Line: 23 ]] --[[ Name: ClaimButtonUp ]]
        -- upvalues: l_SoundHelper_0 (ref), v4 (ref), l_TweenService_0 (ref), v7 (copy), v5 (ref), l_Size_0 (copy)
        l_SoundHelper_0:PlaySound({
            Name = "Pop2", 
            Parent = workspace.Debris, 
            Speed = v4:NextNumber(1.4, 1.6)
        });
        l_TweenService_0:Create(v7, v5, {
            Size = l_Size_0
        }):Play();
        l_TweenService_0:Create(v7.Main.Top, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, -0.1, 0)
        }):Play();
    end;
    local function v10() --[[ Line: 29 ]] --[[ Name: ClaimButtonDown ]]
        -- upvalues: l_TweenService_0 (ref), v7 (copy), v5 (ref), l_Size_0 (copy)
        l_TweenService_0:Create(v7, v5, {
            Size = UDim2.new(l_Size_0.X.Scale * 0.97, 0, l_Size_0.Y.Scale * 0.97, 0)
        }):Play();
        l_TweenService_0:Create(v7.Main.Top, TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0.01, 0)
        }):Play();
    end;
    v7.Button.MouseButton1Down:Connect(function() --[[ Line: 34 ]]
        -- upvalues: v10 (copy)
        v10();
    end);
    v7.Button.MouseButton1Up:Connect(function() --[[ Line: 38 ]]
        -- upvalues: v9 (copy)
        v9();
    end);
end;