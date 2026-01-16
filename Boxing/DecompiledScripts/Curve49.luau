local v0 = {};
v0.__index = v0;
v0.HermiteInterpolate = function(v1, v2, v3, v4, v5, v6, v7) --[[ Line: 9 ]] --[[ Name: HermiteInterpolate ]]
    local v8 = (v2 - v1) * (1 + v7) * (1 - v6) / 2 + (v3 - v2) * (1 - v7) * (1 - v6) / 2;
    local v9 = (v3 - v2) * (1 + v7) * (1 - v6) / 2 + (v4 - v3) * (1 - v7) * (1 - v6) / 2;
    local v10 = v5 ^ 2;
    local v11 = v10 * v5;
    local v12 = v11 * 2 - v10 * 3 + 1;
    local v13 = v11 - v10 * 2 + v5;
    local v14 = v11 - v10;
    local v15 = v11 * -2 + v10 * 3;
    return v12 * v2 + v13 * v8 + v14 * v9 + v15 * v3;
end;
v0.PiecewiseHermiteInterpolate = function(v16, v17, ...) --[[ Line: 22 ]] --[[ Name: PiecewiseHermiteInterpolate ]]
    -- upvalues: v0 (copy)
    local v18 = v17 * (#v16 - 3);
    if v18 == #v16 - 3 then
        v18 = v18 - 1.0E-8;
    end;
    local v19 = math.floor(v18) + 2;
    if v19 ~= 0 then
        local v20 = v16[v19 - 1];
        local v21 = v16[v19];
        local v22 = v16[v19 + 1];
        local v23 = v16[v19 + 2];
        return v0.HermiteInterpolate(v20, v21, v22, v23, v18 - (v19 - 2), ...);
    else
        return;
    end;
end;
v0.InterpolateBezier = function(v24, v25) --[[ Line: 41 ]] --[[ Name: InterpolateBezier ]]
    local v26 = {};
    for v27 = 1, #v24 do
        v26[v27] = v24[v27];
    end;
    while #v26 > 1 do
        local v28 = {};
        local v29 = 0;
        for v30 = 2, #v26 do
            v29 = v29 + 1;
            v28[v29] = v26[v30 - 1]:Lerp(v26[v30], v25);
        end;
        v26 = v28;
    end;
    return v26[1];
end;
v0.EstimateBezierLength = function(v31) --[[ Line: 63 ]] --[[ Name: EstimateBezierLength ]]
    local v32 = 0;
    for v33 = 2, #v31 do
        v32 = v32 + (v31[v33 - 1] - v31[v33]).Magnitude;
    end;
    return (v31[1] - v31[#v31]).Magnitude + v32 / 2;
end;
v0.GetEvenBezierPoints = function(_, v35, v36, v37) --[[ Line: 73 ]] --[[ Name: GetEvenBezierPoints ]]
    -- upvalues: v0 (copy)
    local v38 = {
        v35[1]
    };
    local v39 = v35[1];
    local v40 = 0;
    local v41 = math.ceil(v0.EstimateBezierLength(v35) * v37 * 10);
    local v42 = 0;
    while v42 <= 1 do
        v42 = v42 + 1 / v41;
        local v43 = v0.InterpolateBezier(v35, v42);
        v40 = v40 + (v43 - v39).Magnitude;
        while v36 <= v40 do
            local v44 = v40 - v36;
            table.insert(v38, v43 + (v39 - v43).Unit * v44);
            v40 = v44;
        end;
        v39 = v43;
    end;
    return v38;
end;
return v0;