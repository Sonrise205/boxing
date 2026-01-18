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
local v7 = v6.ReferenceBridge("UseToken");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_MouseOver_0 = require(l_ReplicatedStorage_0:WaitForChild("MouseOver"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local v13 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local l_Parent_0 = script.Parent;
local _ = l_Parent_0.Button;
local l_Size_0 = l_Parent_0.Size;
local v17, v18 = l_MouseOver_0.MouseEnterLeaveEvent(l_Parent_0);
local v19 = false;
v17:Connect(function() --[[ Line: 27 ]]
    -- upvalues: v19 (ref)
    v19 = true;
end);
v18:Connect(function() --[[ Line: 31 ]]
    -- upvalues: v19 (ref), l_TweenService_0 (copy), l_Parent_0 (copy), v13 (copy), l_Size_0 (copy)
    v19 = false;
    l_TweenService_0:Create(l_Parent_0, v13, {
        Size = l_Size_0
    }):Play();
end);
local _ = game:GetService("GuiService");
l_Parent_0.Button.MouseButton1Down:Connect(function() --[[ Line: 38 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v13 (copy)
    l_TweenService_0:Create(l_Parent_0, v13, {
        Size = UDim2.new(l_Parent_0.Size.X.Scale * 0.95, 0, l_Parent_0.Size.Y.Scale * 0.9, 0)
    }):Play();
end);
local v21 = l_ReplicatedStorage_0:WaitForChild("Modules", 10);
local v22 = v21:WaitForChild("EffectHelper", 10);
local _ = require(v22);
local l_UIHelper_0 = require(v21:WaitForChild("UIHelper"));
l_Parent_0.Button.MouseButton1Up:Connect(function() --[[ Line: 47 ]]
    -- upvalues: l_TweenService_0 (copy), l_Parent_0 (copy), v13 (copy), l_Size_0 (copy), v19 (ref), l_UIHelper_0 (copy), l_LocalPlayer_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), v7 (copy)
    l_TweenService_0:Create(l_Parent_0, v13, {
        Size = l_Size_0
    }):Play();
    if not v19 then
        return;
    else
        l_UIHelper_0.CreateYesNoPrompt("OPEN LUCKY CRATE FROM THE PAST?").Execute.Event:Connect(function() --[[ Line: 53 ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_UIHelper_0 (ref), v7 (ref)
            if l_LocalPlayer_0:GetAttribute("LuckyCrates") <= 0 then
                l_SoundHelper_0:PlaySound({
                    Name = "Error", 
                    Parent = l_Workspace_0
                });
                l_UIHelper_0.CrateBuyLuckyCrates();
                return;
            else
                l_SoundHelper_0:PlaySound({
                    Name = "TimeWarp", 
                    Parent = workspace
                });
                task.wait(0.35);
                v7:Fire({
                    "FearToken", 
                    true
                });
                return;
            end;
        end);
        return;
    end;
end);