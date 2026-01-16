--!native
local l_Players_0 = game:GetService("Players");
local l_Workspace_0 = game:GetService("Workspace");
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local v3 = l_Workspace_0.States:WaitForChild(l_Players_0.LocalPlayer.Name, 10);
local v4 = v3:WaitForChild("CharacterData", 10);
local v5 = v3:WaitForChild("PlayerData", 10);
local _ = v4:WaitForChild("Opponent", 10);
local _ = v5:WaitForChild("Map", 10);
CharacterAdded = function(v8) --[[ Line: 36 ]] --[[ Name: CharacterAdded ]]
    -- upvalues: l_Players_0 (copy), l_CurrentCamera_0 (copy)
    if v8 == l_Players_0.LocalPlayer.Character then
        return;
    else
        local v9 = v8:WaitForChild("Humanoid", 10);
        local v10 = v9 and v9:FindFirstChild("Animator");
        if not v10 then
            return;
        else
            local v11 = nil;
            v11 = v10.AnimationPlayed:Connect(function(v12) --[[ Line: 45 ]]
                -- upvalues: v8 (copy), l_CurrentCamera_0 (ref)
                local v13 = true;
                if v12.Priority ~= Enum.AnimationPriority.Action4 then
                    v13 = true;
                    if v12.Priority ~= Enum.AnimationPriority.Action3 then
                        v13 = true;
                        if v12.Priority ~= Enum.AnimationPriority.Action2 then
                            v13 = v12.Priority == Enum.AnimationPriority.Action;
                        end;
                    end;
                end;
                if v12.Name == "Animation" and v13 then
                    v12.Looped = false;
                end;
                local v14 = v8.PrimaryPart and (l_CurrentCamera_0.CFrame.Position - v8.PrimaryPart.Position).Magnitude or 1000;
                if v14 >= 200 and (v12.Name == "Animation" or v12.Name == "Emote") and v12.Priority == Enum.AnimationPriority.Action then
                    v12.Looped = false;
                    v12:Stop(0.01);
                    v12:Destroy();
                    return;
                elseif v14 > 100 then
                    return;
                else
                    if v12.Name == "Animation" and v13 then
                        v12.Looped = false;
                        v12:Stop(0.01);
                        v12:Destroy();
                    end;
                    return;
                end;
            end);
            return;
        end;
    end;
end;
PlayerAdded = function(v15) --[[ Line: 81 ]] --[[ Name: PlayerAdded ]]
    -- upvalues: l_Players_0 (copy)
    if v15 == l_Players_0.LocalPlayer then
        return;
    else
        v15.CharacterAdded:Connect(function(v16) --[[ Line: 84 ]]
            CharacterAdded(v16);
        end);
        return;
    end;
end;
if not game:GetService("RunService"):IsStudio() then
    task.wait(8);
end;
local v17 = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules", 10):WaitForChild("EmoteHelper", 10));
for _, v19 in l_Workspace_0:WaitForChild("Live"):GetChildren() do
    v17.StopAnimsHack(v19);
end;
l_Workspace_0.Live.ChildAdded:Connect(function(v20) --[[ Line: 98 ]]
    CharacterAdded(v20);
end);
for _, v22 in l_Workspace_0:WaitForChild("Live"):GetChildren() do
    task.defer(function() --[[ Line: 103 ]]
        -- upvalues: v22 (copy)
        CharacterAdded(v22);
    end);
end;