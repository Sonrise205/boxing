local v0 = false;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Workspace_0 = game:GetService("Workspace");
local _ = game:GetService("ReplicatedFirst");
local v5;
if game:GetService("RunService"):IsClient() then
    v5 = shared.BridgeNet2;
    if not v5 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v5 = shared.BridgeNet2;
        v0 = v5;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v5 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local v6 = v5.ReferenceBridge("EquipKnockdownSet");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_MouseOver_0 = require(l_ReplicatedStorage_0:WaitForChild("MouseOver"));
local v10 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local l_Parent_0 = script.Parent;
local _ = l_Parent_0.Button;
local l_Size_0 = l_Parent_0.Size;
local v14, v15 = l_MouseOver_0.MouseEnterLeaveEvent(l_Parent_0);
local v16 = true;
v14:Connect(function() --[[ Line: 23 ]]
    -- upvalues: v16 (ref)
    v16 = true;
end);
v15:Connect(function() --[[ Line: 27 ]]
    -- upvalues: v16 (ref), l_TweenService_0 (copy), l_Parent_0 (copy), v10 (copy), l_Size_0 (copy)
    v16 = false;
    l_TweenService_0:Create(l_Parent_0, v10, {
        Size = l_Size_0
    }):Play();
end);
l_Parent_0.Button.MouseButton1Down:Connect(function() --[[ Line: 32 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v10 (copy)
    l_TweenService_0:Create(l_Parent_0, v10, {
        Size = UDim2.new(l_Parent_0.Size.X.Scale * 0.95, 0, l_Parent_0.Size.Y.Scale * 0.9, 0)
    }):Play();
end);
l_Parent_0.Button.MouseButton1Up:Connect(function() --[[ Line: 36 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v10 (copy), l_Size_0 (copy), v16 (ref), v6 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy)
    l_TweenService_0:Create(l_Parent_0, v10, {
        Size = l_Size_0
    }):Play();
    if not v16 then
        return;
    else
        local l_Name_0 = l_Parent_0.Parent.Name;
        v6:Fire(l_Name_0);
        l_SoundHelper_0:PlaySound({
            Name = "EquipGloves", 
            Parent = l_Workspace_0
        });
        return;
    end;
end);