local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v14 = {
    Lerp = function(v2, v3, v4) --[[ Line: 15 ]] --[[ Name: Lerp ]]
        return v2 + (v3 - v2) * v4;
    end, 
    QuadBezier = function(v5, v6, v7, v8) --[[ Line: 19 ]] --[[ Name: QuadBezier ]]
        return (1 - v5) ^ 2 * v6 + 2 * (1 - v5) * v5 * v7 + v5 ^ 2 * v8;
    end, 
    CubicBezier = function(v9, v10, v11, v12, v13) --[[ Line: 23 ]] --[[ Name: CubicBezier ]]
        return (1 - v9) ^ 3 * v10 + 3 * (1 - v9) ^ 2 * v9 * v11 + 3 * (1 - v9) * v9 ^ 2 * v12 + v9 ^ 3 * v13;
    end
};
SpawnEffect = function(v15, v16, v17, v18, v19, v20, v21, v22) --[[ Line: 27 ]] --[[ Name: SpawnEffect ]]
    -- upvalues: l_TweenService_0 (copy), v14 (copy), l_RunService_0 (copy)
    local v23 = nil;
    if v22 == nil then
        warn("No trail inserted.");
        return;
    elseif v16 == nil or v17 == nil or v18 == nil or v19 == nil or v20 == nil or v21 == nil then
        warn("Some values missing, make sure you correctly inserted all values into the function");
        return;
    else
        v23 = v15.WorldCFrame * CFrame.new(math.random(v16.X, v17.X), math.random(v16.Y, v17.Y), math.random(v16.Z, v17.Z));
        if v15 == nil then
            warn("RelativityAttachment not found.");
            return;
        else
            local v24 = v23 * CFrame.new(math.random(v20.X, v21.X), math.random(v20.Y, v21.Y), math.random(v20.Z, v21.Z));
            v22.Parent = workspace.Debris;
            v22.Position = v23.Position;
            game.Debris:AddItem(v22, 2.5);
            local v25 = 0;
            local v26 = TweenInfo.new(0.01);
            for v27 = 0, 1, v18 do
                v25 = v27;
                l_TweenService_0:Create(v22, v26, {
                    Position = v14.QuadBezier(v27, v23.Position, v24.Position, v15.WorldPosition)
                }):Play();
                l_RunService_0.Heartbeat:Wait();
            end;
            if v25 < 1 then
                l_TweenService_0:Create(v22, v26, {
                    Position = v14.QuadBezier(1, v23.Position, v24.Position, v15.WorldPosition)
                }):Play();
            end;
            return;
        end;
    end;
end;
v14.StartEffect = function(v28, v29, v30, v31, v32, v33, v34, v35, v36) --[[ Line: 63 ]] --[[ Name: StartEffect ]]
    for _ = 0, v30 do
        task.spawn(SpawnEffect, v28, v31, v32, v33, v34, v35, v36, v29:Clone());
        task.wait(v34);
    end;
end;
return v14;