local v0 = {};
local l_Switch_0 = require(script.Parent:WaitForChild("Switch"));
local l_clamp_0 = math.clamp;
local l_floor_0 = math.floor;
local l_min_0 = math.min;
local l_max_0 = math.max;
local l_round_0 = math.round;
local _ = math.abs;
v0.snapToScale = function(v8, v9) --[[ Line: 12 ]] --[[ Name: snapToScale ]]
    -- upvalues: l_round_0 (copy), l_clamp_0 (copy)
    return (l_clamp_0(l_round_0(v8 / v9) * v9, 0, 1));
end;
lerp = function(v10, v11, v12) --[[ Line: 16 ]] --[[ Name: lerp ]]
    return (1 - v12) * v10 + v12 * v11;
end;
map = function(v13, v14, v15, v16, v17, v18) --[[ Line: 20 ]] --[[ Name: map ]]
    -- upvalues: v0 (copy), l_min_0 (copy), l_max_0 (copy)
    local v19 = lerp(v16, v17, v0.getAlphaBetween(v14, v15, v13));
    if not v18 then
        return v19;
    else
        if v16 < v17 then
            local l_v17_0 = v17;
            v17 = v16;
            v16 = l_v17_0;
        end;
        return (l_max_0(l_min_0(v19, v16), v17));
    end;
end;
v0.getNewPosition = function(v21) --[[ Line: 33 ]] --[[ Name: getNewPosition ]]
    -- upvalues: l_Switch_0 (copy)
    local v22 = v21._data.Button.AbsoluteSize[v21._config.Axis];
    local v23 = v21._holder.AbsoluteSize[v21._config.Axis];
    local v24 = v21._data.Button.AnchorPoint[v21._config.Axis];
    local v25 = v21._config.Padding / v23;
    local v26 = v24 * v22 / v23 + v25;
    local v27 = 2 * v22 * v24 - v22;
    local v28 = 1 - v26 + v27 / v23;
    local v29 = map(v21._data._percent, 0, 1, v26, v28, true);
    return l_Switch_0(v21._config.Axis)({
        X = UDim2.fromScale(v29, v21._data.Button.Position.Y.Scale), 
        Y = UDim2.fromScale(v21._data.Button.Position.X.Scale, v29)
    });
end;
v0.getScaleIncrement = function(v30) --[[ Line: 57 ]] --[[ Name: getScaleIncrement ]]
    return 1 / ((v30._config.SliderData.End - v30._config.SliderData.Start) / v30._config.SliderData.Increment);
end;
v0.getAlphaBetween = function(v31, v32, v33) --[[ Line: 61 ]] --[[ Name: getAlphaBetween ]]
    return (v33 - v31) / (v32 - v31);
end;
v0.getNewValue = function(v34) --[[ Line: 65 ]] --[[ Name: getNewValue ]]
    -- upvalues: l_floor_0 (copy)
    local v35 = lerp(v34._config.SliderData.Start, v34._config.SliderData.End, v34._data._percent);
    local v36 = 1 / v34._config.SliderData.Increment;
    return l_floor_0(v35 * v36) / v36;
end;
return v0;