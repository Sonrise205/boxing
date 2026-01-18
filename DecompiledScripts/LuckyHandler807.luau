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
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_MouseOver_0 = require(l_ReplicatedStorage_0:WaitForChild("MouseOver"));
local _ = l_Players_0.LocalPlayer.PlayerGui:WaitForChild("Common");
local v11 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local l_Parent_0 = script.Parent;
local _ = l_Parent_0.Button;
local l_Size_0 = l_Parent_0.Size;
local v15, v16 = l_MouseOver_0.MouseEnterLeaveEvent(l_Parent_0);
local v17 = false;
v15:Connect(function() --[[ Line: 27 ]]
    -- upvalues: v17 (ref)
    v17 = true;
end);
v16:Connect(function() --[[ Line: 31 ]]
    -- upvalues: v17 (ref), l_TweenService_0 (copy), l_Parent_0 (copy), v11 (copy), l_Size_0 (copy)
    v17 = false;
    l_TweenService_0:Create(l_Parent_0, v11, {
        Size = l_Size_0
    }):Play();
end);
local _ = game:GetService("GuiService");
l_Parent_0.Button.MouseButton1Down:Connect(function() --[[ Line: 38 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v11 (copy)
    l_TweenService_0:Create(l_Parent_0, v11, {
        Size = UDim2.new(l_Parent_0.Size.X.Scale * 0.95, 0, l_Parent_0.Size.Y.Scale * 0.9, 0)
    }):Play();
end);
local v19 = l_ReplicatedStorage_0:WaitForChild("Modules", 10);
local v20 = v19:WaitForChild("EffectHelper", 10);
local _ = require(v20);
local l_UIHelper_0 = require(v19:WaitForChild("UIHelper"));
l_Parent_0.Button.MouseButton1Up:Connect(function() --[[ Line: 47 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v11 (copy), l_Size_0 (copy), v17 (ref), l_UIHelper_0 (copy), l_SoundHelper_0 (copy)
    l_TweenService_0:Create(l_Parent_0, v11, {
        Size = l_Size_0
    }):Play();
    if not v17 then
        return;
    else
        l_UIHelper_0.CreateYesNoPrompt("USE GAMEPASS?").Execute.Event:Connect(function() --[[ Line: 53 ]]
            -- upvalues: l_SoundHelper_0 (ref)
            l_SoundHelper_0:PlaySound({
                Name = "TimeWarp", 
                Parent = workspace
            });
            task.wait(0.35);
        end);
        return;
    end;
end);