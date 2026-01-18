local v0 = false;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Workspace_0 = game:GetService("Workspace");
local _ = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_UIHelper_0 = require(l_Modules_0:WaitForChild("UIHelper"));
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_MouseOver_0 = require(l_ReplicatedStorage_0:WaitForChild("MouseOver"));
local v9 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local l_Parent_0 = script.Parent;
local _ = l_Parent_0.Button;
local l_Size_0 = l_Parent_0.Size;
local v13, v14 = l_MouseOver_0.MouseEnterLeaveEvent(l_Parent_0);
local v15 = true;
local _ = game:GetService("ReplicatedFirst");
local v17;
if game:GetService("RunService"):IsClient() then
    v17 = shared.BridgeNet2;
    if not v17 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v17 = shared.BridgeNet2;
        v0 = v17;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v17 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local v18 = v17.ReferenceBridge("UseEmoteSpin");
v13:Connect(function() --[[ Line: 28 ]]
    -- upvalues: v15 (ref)
    v15 = true;
end);
v14:Connect(function() --[[ Line: 32 ]]
    -- upvalues: v15 (ref), l_TweenService_0 (copy), l_Parent_0 (copy), v9 (copy), l_Size_0 (copy)
    v15 = false;
    l_TweenService_0:Create(l_Parent_0, v9, {
        Size = l_Size_0
    }):Play();
end);
l_Parent_0.Button.MouseButton1Down:Connect(function() --[[ Line: 37 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v9 (copy)
    l_TweenService_0:Create(l_Parent_0, v9, {
        Size = UDim2.new(l_Parent_0.Size.X.Scale * 0.95, 0, l_Parent_0.Size.Y.Scale * 0.9, 0)
    }):Play();
end);
l_Parent_0.Button.MouseButton1Up:Connect(function() --[[ Line: 41 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v9 (copy), l_Size_0 (copy), v15 (ref), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_UIHelper_0 (copy), v18 (copy)
    l_TweenService_0:Create(l_Parent_0, v9, {
        Size = l_Size_0
    }):Play();
    if not v15 then
        return;
    else
        l_SoundHelper_0:PlaySound({
            Name = "ButtonUI", 
            Parent = l_Workspace_0
        });
        local v19 = l_UIHelper_0.CreateYesNoPrompt("USE EMOTE SPIN?");
        v19.Execute.Event:Connect(function() --[[ Line: 52 ]]
            -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref), v18 (ref), v19 (copy)
            l_SoundHelper_0:PlaySound({
                Name = "Claim", 
                Speed = 1.1, 
                Parent = l_Workspace_0
            });
            v18:Fire(false);
            v19.Visible = false;
        end);
        return;
    end;
end);