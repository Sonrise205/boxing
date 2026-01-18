local v0 = false;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("ReplicatedFirst");
local v6;
if game:GetService("RunService"):IsClient() then
    v6 = shared.BridgeNet2;
    if not v6 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v6 = shared.BridgeNet2;
        v0 = v6;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v6 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
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
local v17 = false;
l_Parent_0.Button.MouseButton1Up:Connect(function() --[[ Line: 38 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v10 (copy), l_Size_0 (copy), v16 (ref), v17 (ref), l_ReplicatedStorage_0 (copy), l_Workspace_0 (copy), l_Players_0 (copy), l_SoundHelper_0 (copy), v6 (copy)
    l_TweenService_0:Create(l_Parent_0, v10, {
        Size = l_Size_0
    }):Play();
    if not v16 then
        return;
    elseif v17 then
        return;
    else
        v17 = true;
        task.delay(1, function() --[[ Line: 44 ]]
            -- upvalues: v17 (ref)
            v17 = false;
        end);
        local l_Name_0 = l_Parent_0.Parent.Name;
        local l_Entrances_0 = require(l_ReplicatedStorage_0:WaitForChild("Modules"):WaitForChild("EffectHelper"):WaitForChild("Entrances"));
        if not l_Entrances_0[l_Name_0] then
            return;
        elseif l_Entrances_0[l_Name_0].Metadata.Price > l_Workspace_0.States[l_Players_0.LocalPlayer.Name].PlayerData.Cash.Value then
            l_SoundHelper_0:PlaySound({
                Name = "Error", 
                Parent = l_Workspace_0
            });
            return;
        else
            v6.ReferenceBridge("PurchaseEntrance"):Fire(l_Name_0);
            l_SoundHelper_0:PlaySound({
                Name = "GetMoney", 
                Parent = l_Workspace_0
            });
            return;
        end;
    end;
end);