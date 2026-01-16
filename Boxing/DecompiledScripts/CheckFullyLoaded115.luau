local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
repeat
    task.wait();
until l_LocalPlayer_0.Character and l_LocalPlayer_0.Character.Parent == workspace.Live;
local l_Character_0 = l_LocalPlayer_0.Character;
local v2 = l_Character_0:WaitForChild("Humanoid", 10);
local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
task.spawn(function() --[[ Line: 11 ]]
    -- upvalues: l_PrimaryPart_0 (copy), v2 (copy), l_Character_0 (copy), l_LocalPlayer_0 (copy)
    local v4 = false;
    while true do
        if task.wait(0.3) then
            local v5 = 0.5 * l_PrimaryPart_0.Size.Y + v2.HipHeight;
            local v6 = Ray.new(l_PrimaryPart_0.Position, Vector3.new(0, -1, 0, 0) * (v5 + 0.1));
            local _, _, _, v10 = workspace:FindPartOnRay(v6, l_Character_0);
            if v10 and v10 ~= Enum.Material.Air then
                local l_UserInputService_0 = game:GetService("UserInputService");
                local v12 = not l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.TouchEnabled;
                task.wait(v12 and 4 or 2);
                local _ = game:GetService("ReplicatedFirst");
                local v14;
                if game:GetService("RunService"):IsClient() then
                    v14 = shared.BridgeNet2;
                    if not v14 then
                        repeat
                            task.wait();
                        until shared.BridgeNet2;
                        v14 = shared.BridgeNet2;
                        v4 = v14;
                    else
                        v4 = true;
                    end;
                end;
                if not v4 then
                    if not v4 then
                        v14 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
                    end;
                end;
                v4 = false;
                local v15 = v14.ReferenceBridge("TryHandleRanked");
                repeat
                    task.wait(1);
                until l_LocalPlayer_0:GetAttribute("Loaded");
                v15:Fire(false);
                return;
            end;
        else
            return;
        end;
    end;
end);