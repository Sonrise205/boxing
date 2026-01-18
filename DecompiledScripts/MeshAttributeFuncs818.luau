local v0 = {};
local l_RunService_0 = game:GetService("RunService");
local v2 = require("./HelperFunctions");
v0.RotationSpeed = function(v3, v4) --[[ Line: 6 ]] --[[ Name: RotationSpeed ]]
    -- upvalues: l_RunService_0 (copy)
    local v5 = v4 * 360 or 360;
    v3.Connections.Rotation = l_RunService_0.Heartbeat:Connect(function(v6) --[[ Line: 8 ]]
        -- upvalues: v3 (copy), v5 (copy)
        local l_ActiveMesh_0 = v3.ActiveMesh;
        l_ActiveMesh_0.CFrame = l_ActiveMesh_0.CFrame * CFrame.Angles(0, math.rad(v5 * v6), 0);
    end);
end;
v0.MinRotation = function(v8, v9) --[[ Line: 13 ]] --[[ Name: MinRotation ]]
    -- upvalues: v2 (copy)
    if not v8.Settings.MaxRotation then
        warn("Missing Property: Max Rotation Cannot Randomize Rotation");
        return;
    else
        local v10 = v2.VectorGenerateInRange(v9, v8.Settings.MaxRotation);
        local l_ActiveMesh_1 = v8.ActiveMesh;
        l_ActiveMesh_1.CFrame = l_ActiveMesh_1.CFrame * CFrame.Angles(v10.X, v10.Y, v10.Z);
        return;
    end;
end;
return v0;