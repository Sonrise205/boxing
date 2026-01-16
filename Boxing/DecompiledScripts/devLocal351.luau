local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("TeleportService");
local _ = game:GetService("Workspace");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v8 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
local _ = v8:WaitForChild("Humanoid");
local _ = v8:WaitForChild("HumanoidRootPart");
local l_EffectHelper_0 = require(l_ReplicatedStorage_0:WaitForChild("Modules"):WaitForChild("EffectHelper"));
local l_Entrances_0 = l_ReplicatedStorage_0.Modules.EffectHelper:WaitForChild("Entrances");
local _ = game:GetService("TeleportService"):GetLocalPlayerTeleportData();
if not l_Places_0.IsTesting() then
    return;
elseif not l_Entrances_0 then
    warn("Entrances folder not found in workspace.");
    return;
else
    local v20 = {
        [Enum.KeyCode.LeftShift and Enum.KeyCode.Semicolon] = function() --[[ Line: 29 ]]
            -- upvalues: l_EffectHelper_0 (copy), v8 (copy)
            l_EffectHelper_0.Entrance({
                Character = v8, 
                Target = v8.PrimaryPart, 
                IsInvolved = true, 
                Subeffect = script.EntranceValue.Value
            });
        end, 
        [Enum.KeyCode.LeftShift and Enum.KeyCode.H] = function() --[[ Line: 38 ]]
            -- upvalues: l_LocalPlayer_0 (copy)
            for _, v15 in {
                "Main", 
                "Panel"
            } do
                if not l_LocalPlayer_0.PlayerGui:FindFirstChild(v15) then
                    return;
                end;
            end;
            for _, v17 in l_LocalPlayer_0.PlayerGui:GetChildren() do
                if v17.Name ~= "Main" and v17:IsA("SurfaceGui") and v17:IsA("ScreenGui") then
                    v17.Enabled = not v17.Enabled;
                end;
            end;
            for _, v19 in l_LocalPlayer_0.PlayerGui:FindFirstChild("Main"):GetChildren() do
                if v19.Name ~= "WhiteFrame" then
                    v19.Visible = not v19.Visible;
                end;
            end;
        end
    };
    l_UserInputService_0.InputBegan:Connect(function(v21, v22) --[[ Line: 68 ]]
        -- upvalues: v20 (copy)
        if v22 then
            return;
        else
            local v23 = v20[v21.KeyCode];
            if v23 then
                v23();
            end;
            return;
        end;
    end);
    return;
end;