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
local _ = l_Players_0.LocalPlayer.PlayerGui:WaitForChild("Common");
local v11 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local l_Parent_0 = script.Parent;
local _ = l_Parent_0.Button;
local l_Size_0 = l_Parent_0.Size;
local v15, v16 = l_MouseOver_0.MouseEnterLeaveEvent(l_Parent_0);
local v17 = false;
v15:Connect(function() --[[ Line: 26 ]]
    -- upvalues: v17 (ref)
    v17 = true;
end);
v16:Connect(function() --[[ Line: 30 ]]
    -- upvalues: v17 (ref), l_TweenService_0 (copy), l_Parent_0 (copy), v11 (copy), l_Size_0 (copy)
    v17 = false;
    l_TweenService_0:Create(l_Parent_0, v11, {
        Size = l_Size_0
    }):Play();
end);
local _ = game:GetService("GuiService");
l_Parent_0.Button.MouseButton1Down:Connect(function() --[[ Line: 37 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v11 (copy)
    l_TweenService_0:Create(l_Parent_0, v11, {
        Size = UDim2.new(l_Parent_0.Size.X.Scale * 0.95, 0, l_Parent_0.Size.Y.Scale * 0.9, 0)
    }):Play();
end);
local v19 = l_ReplicatedStorage_0:WaitForChild("Modules", 10):WaitForChild("EffectHelper", 10);
local _ = require(v19);
local l_Value_0 = workspace:WaitForChild("GameSettings", 30):WaitForChild("ShardsNeeded", 30).Value;
local v22 = false;
l_Parent_0.Button.MouseButton1Up:Connect(function() --[[ Line: 49 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v11 (copy), l_Size_0 (copy), v17 (ref), v22 (ref), l_ReplicatedStorage_0 (copy), l_Value_0 (copy)
    l_TweenService_0:Create(l_Parent_0, v11, {
        Size = l_Size_0
    }):Play();
    if not v17 then
        return;
    elseif v22 then
        return;
    else
        v22 = true;
        task.delay(1, function() --[[ Line: 55 ]]
            -- upvalues: v22 (ref)
            v22 = false;
        end);
        local l_Events_0 = l_ReplicatedStorage_0:FindFirstChild("Events");
        local v24 = l_Events_0 and l_Events_0:FindFirstChild("BasicMessage");
        local v25 = tonumber(script.Parent.Parent.Parent.Count.Text:match("%d+"));
        local v26 = l_Value_0 - v25;
        local v27 = script.Parent.Parent.Parent.Name:sub(1, -7):lower();
        v24:Fire({
            Message = ("You need <font color=\"%*\">%* more %* shards</font> for a guaranteed <font color=\"%*\"><flow>%* shiny.</flow>"):format(script.Parent.Parent.Color.Value, v26, v27, script.Parent.Parent.Color.Value, v27), 
            Color = Color3.fromRGB(255, 255, 255), 
            Sound = "PingAlert", 
            IsRainbow = false, 
            HoldTime = 3
        });
        return;
    end;
end);