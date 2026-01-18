local l_Snow_0 = game.Workspace.Snow;
local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
local v2 = CFrame.new(8, 3, -5);
local v3 = workspace:WaitForChild("States"):WaitForChild(game.Players.LocalPlayer.Name);
local l_CharacterData_0 = v3:WaitForChild("CharacterData");
local l_PlayerData_0 = v3:WaitForChild("PlayerData");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
if game.PlaceId == l_Places_0.Ranked then
    return;
else
    game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 14 ]]
        -- upvalues: l_Snow_0 (copy), l_CurrentCamera_0 (copy), v2 (copy), l_CharacterData_0 (copy), l_PlayerData_0 (copy)
        l_Snow_0.CFrame = l_CurrentCamera_0.CFrame:ToWorldSpace(v2) * CFrame.Angles(-1.5707963267948966, 1.0471975511965976, 0);
        l_Snow_0.ParticleEmitter.Acceleration = Vector3.new(math.sin(tick() / 1.5) * 4 + 4, math.sin(tick() / 4) * 2, math.sin(tick() / 5) * 1);
        l_Snow_0.ParticleEmitter.Enabled = not l_CharacterData_0.Opponent.Value;
        if l_CharacterData_0.Opponent.Value and l_PlayerData_0.Map.Value ~= "Default" then
            l_Snow_0.ParticleEmitter.Enabled = false;
            return;
        else
            l_Snow_0.ParticleEmitter.Enabled = true;
            return;
        end;
    end);
    return;
end;