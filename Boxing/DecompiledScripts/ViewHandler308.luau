local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Workspace_0 = game:GetService("Workspace");
local _ = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_MouseOver_0 = require(l_ReplicatedStorage_0:WaitForChild("MouseOver"));
local v7 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local l_Parent_0 = script.Parent;
local _ = l_Parent_0.Button;
local l_Size_0 = l_Parent_0.Size;
local v11, v12 = l_MouseOver_0.MouseEnterLeaveEvent(l_Parent_0);
local v13 = true;
local l_Parent_1 = script.Parent.Parent;
local l_l_Parent_1_0 = l_Parent_1;
local v16 = 0;
repeat
    l_l_Parent_1_0 = l_l_Parent_1_0.Parent;
    v16 = v16 + 1;
until l_l_Parent_1_0.Name == "Scroll" or v16 > 8;
local l_ViewCrate_0 = l_l_Parent_1_0.Parent.ViewCrate;
v11:Connect(function() --[[ Line: 34 ]]
    -- upvalues: v13 (ref)
    v13 = true;
end);
v12:Connect(function() --[[ Line: 38 ]]
    -- upvalues: v13 (ref), l_TweenService_0 (copy), l_Parent_0 (copy), v7 (copy), l_Size_0 (copy)
    v13 = false;
    l_TweenService_0:Create(l_Parent_0, v7, {
        Size = l_Size_0
    }):Play();
end);
l_Parent_0.Button.MouseButton1Down:Connect(function() --[[ Line: 43 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v7 (copy)
    l_TweenService_0:Create(l_Parent_0, v7, {
        Size = UDim2.new(l_Parent_0.Size.X.Scale * 0.95, 0, l_Parent_0.Size.Y.Scale * 0.9, 0)
    }):Play();
end);
l_Parent_0.Button.MouseButton1Up:Connect(function() --[[ Line: 47 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v7 (copy), l_Size_0 (copy), v13 (ref), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_ViewCrate_0 (copy), l_Parent_1 (copy)
    l_TweenService_0:Create(l_Parent_0, v7, {
        Size = l_Size_0
    }):Play();
    if not v13 then
        return;
    else
        l_SoundHelper_0:PlaySound({
            Name = "ButtonUI", 
            Parent = l_Workspace_0
        });
        l_ViewCrate_0:Fire(l_Parent_1.Name);
        return;
    end;
end);