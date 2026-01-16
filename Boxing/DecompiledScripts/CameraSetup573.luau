local v0 = {};
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game.Players.LocalPlayer.Character;
local v3 = require(l_ReplicatedStorage_0.CameraShaker);
local l_CurrentCamera_0 = workspace.CurrentCamera;
v0.UpdateCamera = function() --[[ Line: 10 ]]

end;
v0.UpdateShake = function(v5) --[[ Line: 14 ]]
    -- upvalues: l_CurrentCamera_0 (copy)
    l_CurrentCamera_0.CFrame = l_CurrentCamera_0.CFrame * v5;
end;
v0.camShake = v3.new(Enum.RenderPriority.Camera.Value + 9, v0.UpdateShake);
v0.camShake:Start();
v0.StartCamera = function() --[[ Line: 21 ]]
    -- upvalues: v0 (copy)
    v0.camShake:Start();
end;
v0.StopCamera = function() --[[ Line: 25 ]]
    -- upvalues: v0 (copy)
    v0:Stop();
end;
return v0;