local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_UIHelper_0 = require(l_Modules_0:WaitForChild("UIHelper"));
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_MouseOver_0 = require(l_ReplicatedStorage_0:WaitForChild("MouseOver"));
local v8 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local l_Parent_0 = script.Parent;
local _ = l_Parent_0.Button;
local l_Size_0 = l_Parent_0.Size;
local v12, v13 = l_MouseOver_0.MouseEnterLeaveEvent(l_Parent_0);
local v14 = true;
v12:Connect(function() --[[ Line: 24 ]]
    -- upvalues: v14 (ref)
    v14 = true;
end);
v13:Connect(function() --[[ Line: 28 ]]
    -- upvalues: v14 (ref), l_TweenService_0 (copy), l_Parent_0 (copy), v8 (copy), l_Size_0 (copy)
    v14 = false;
    l_TweenService_0:Create(l_Parent_0, v8, {
        Size = l_Size_0
    }):Play();
end);
l_Parent_0.Button.MouseButton1Down:Connect(function() --[[ Line: 33 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v8 (copy)
    l_TweenService_0:Create(l_Parent_0, v8, {
        Size = UDim2.new(l_Parent_0.Size.X.Scale * 0.95, 0, l_Parent_0.Size.Y.Scale * 0.9, 0)
    }):Play();
end);
local _ = l_ReplicatedStorage_0:WaitForChild("Gloves");
l_Parent_0.Button.MouseButton1Up:Connect(function() --[[ Line: 39 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v8 (copy), l_Size_0 (copy), v14 (ref), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_UIHelper_0 (copy), l_ReplicatedStorage_0 (copy), l_Players_0 (copy)
    l_TweenService_0:Create(l_Parent_0, v8, {
        Size = l_Size_0
    }):Play();
    if not v14 then
        return;
    else
        l_SoundHelper_0:PlaySound({
            Name = "ButtonUI", 
            Parent = l_Workspace_0
        });
        local v16 = l_UIHelper_0.CreateYesNoPrompt("PICK A STYLE?");
        v16.Execute.Event:Connect(function() --[[ Line: 50 ]]
            -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_ReplicatedStorage_0 (ref), l_Players_0 (ref), v16 (copy)
            l_SoundHelper_0:PlaySound({
                Name = "Claim", 
                Speed = 1.1, 
                Parent = l_Workspace_0
            });
            l_ReplicatedStorage_0:WaitForChild("UIs"):WaitForChild("PickAStyle"):Clone().Parent = l_Players_0.LocalPlayer.PlayerGui;
            workspace.CurrentMenu.Value = "hi";
            workspace.CurrentMenu.Value = "";
            v16.Visible = false;
        end);
        return;
    end;
end);