local v0 = {};
local l_RunService_0 = game:GetService("RunService");
v0.Random = Random.new();
v0.GenerateInNumberRange = function(v2) --[[ Line: 6 ]] --[[ Name: GenerateInNumberRange ]]
    -- upvalues: v0 (copy)
    return v0.Random:NextNumber(v2.Min, v2.Max);
end;
v0.GenerateInRange = function(v3, v4) --[[ Line: 11 ]] --[[ Name: GenerateInRange ]]
    -- upvalues: v0 (copy)
    return v0.Random:NextNumber(v3, v4);
end;
v0.VectorGenerateInRange = function(v5, v6) --[[ Line: 16 ]] --[[ Name: VectorGenerateInRange ]]
    -- upvalues: v0 (copy)
    return (Vector3.new(v0.GenerateInRange(v5.X, v6.X), v0.GenerateInRange(v5.Y, v6.Y), v0.GenerateInRange(v5.Z, v6.Z)));
end;
v0.PlayFlipbook = function(v7) --[[ Line: 25 ]] --[[ Name: PlayFlipbook ]]
    -- upvalues: l_RunService_0 (copy)
    if not v7.Flipbook then
        return;
    else
        local v8 = {
            Passed = 0, 
            UpdatePassed = 0, 
            CurrentFrame = 1, 
            FramesPerSecond = #v7.Flipbook / v7.Settings.Duration
        };
        v7:SetActiveTexture(v7.Flipbook[v8.CurrentFrame]);
        v7.Connections.Flipbook = l_RunService_0.Heartbeat:Connect(function(v9) --[[ Line: 37 ]]
            -- upvalues: v8 (copy), v7 (copy)
            local l_v8_0 = v8;
            l_v8_0.Passed = l_v8_0.Passed + v9;
            l_v8_0 = v8;
            l_v8_0.UpdatePassed = l_v8_0.UpdatePassed + v9;
            if v8.UpdatePassed < 1 / v8.FramesPerSecond then
                return;
            else
                l_v8_0 = v8;
                l_v8_0.CurrentFrame = l_v8_0.CurrentFrame + 1;
                if v8.CurrentFrame > #v7.Flipbook then
                    return;
                else
                    l_v8_0 = v7.Flipbook[v8.CurrentFrame];
                    v7:SetActiveTexture(l_v8_0);
                    v8.UpdatePassed = 0;
                    return;
                end;
            end;
        end);
        return;
    end;
end;
return v0;