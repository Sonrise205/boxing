--!native
local _ = require(script.Parent.Parent.Types);
local function v12(v1, v2, v3, v4, v5, v6, v7) --[[ Line: 7 ]] --[[ Name: HermiteInterpolate ]]
    v6 = 1 + (v6 or 0);
    v7 = v7 or 0;
    local v8 = (v3 - v1) * v6 * (1 - v7) / 2;
    local v9 = (v4 - v2) * v6 * (1 + v7) / 2;
    local v10 = v5 * v5;
    local v11 = v10 * v5;
    return (v11 * 2 - v10 * 3 + 1) * v2 + (v11 - v10 * 2 + v5) * v8 + (v11 * -2 + v10 * 3) * v3 + (v11 - v10) * v9;
end;
local function _(v13, v14, v15, v16) --[[ Line: 20 ]] --[[ Name: HermiteInterpolatePiecewise ]]
    -- upvalues: v12 (copy)
    local v17 = #v13;
    if v14 >= 1 then
        return v13[v17];
    else
        local v18 = v17 - 3;
        local v19 = math.floor(v18 * v14 + 1);
        local v20 = (v14 - (v19 - 1) / v18) * v18;
        return (v12(v13[v19], v13[v19 + 1], v13[v19 + 2], v13[v19 + 3], v20, v15, v16));
    end;
end;
return function(v22, v23, v24) --[[ Line: 42 ]] --[[ Name: CreateHermiteInterpolatePiecewise ]]
    -- upvalues: v12 (copy)
    return function(v25) --[[ Line: 43 ]]
        -- upvalues: v22 (copy), v23 (copy), v24 (copy), v12 (ref)
        local l_v22_0 = v22;
        local l_Completion_0 = v25.Completion;
        local l_v23_0 = v23;
        local l_v24_0 = v24;
        local v30 = #l_v22_0;
        if l_Completion_0 >= 1 then
            return l_v22_0[v30];
        else
            local v31 = v30 - 3;
            local v32 = math.floor(v31 * l_Completion_0 + 1);
            local v33 = (l_Completion_0 - (v32 - 1) / v31) * v31;
            return (v12(l_v22_0[v32], l_v22_0[v32 + 1], l_v22_0[v32 + 2], l_v22_0[v32 + 3], v33, l_v23_0, l_v24_0));
        end;
    end;
end;