local v0 = false;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("ReplicatedFirst");
local v6;
if game:GetService("RunService"):IsClient() then
    if not shared.BridgeNet2 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v0 = shared.BridgeNet2;
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
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_MouseOver_0 = require(l_ReplicatedStorage_0:WaitForChild("MouseOver"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local v12 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local l_Parent_0 = script.Parent;
local _ = l_Parent_0.Button;
local l_Size_0 = l_Parent_0.Size;
local v16, v17 = l_MouseOver_0.MouseEnterLeaveEvent(l_Parent_0);
local v18 = false;
v16:Connect(function() --[[ Line: 26 ]]
    -- upvalues: v18 (ref)
    v18 = true;
end);
v17:Connect(function() --[[ Line: 30 ]]
    -- upvalues: v18 (ref), l_TweenService_0 (copy), l_Parent_0 (copy), v12 (copy), l_Size_0 (copy)
    v18 = false;
    l_TweenService_0:Create(l_Parent_0, v12, {
        Size = l_Size_0
    }):Play();
end);
local _ = game:GetService("GuiService");
local function _() --[[ Line: 37 ]] --[[ Name: IsXbox ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    return l_LocalPlayer_0:GetAttribute("Interface") == "Controller";
end;
l_Parent_0.Button.MouseButton1Down:Connect(function() --[[ Line: 41 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v12 (copy), l_LocalPlayer_0 (copy)
    l_TweenService_0:Create(l_Parent_0, v12, {
        Size = UDim2.new(l_Parent_0.Size.X.Scale * 0.95, 0, l_Parent_0.Size.Y.Scale * 0.9, 0)
    }):Play();
    if l_LocalPlayer_0:GetAttribute("Interface") == "Controller" then
        local _ = l_Parent_0.Parent.Parent.Name;
        l_Parent_0.Sell:Fire();
    end;
end);
l_Parent_0.Button.MouseButton1Up:Connect(function() --[[ Line: 50 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v12 (copy), l_Size_0 (copy), v18 (ref), l_LocalPlayer_0 (copy)
    l_TweenService_0:Create(l_Parent_0, v12, {
        Size = l_Size_0
    }):Play();
    if not v18 then
        return;
    elseif l_LocalPlayer_0:GetAttribute("Interface") == "Controller" then
        return;
    else
        local _ = l_Parent_0.Parent.Parent.Name;
        l_Parent_0.Sell:Fire();
        return;
    end;
end);