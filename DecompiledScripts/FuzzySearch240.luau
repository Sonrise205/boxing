local v5 = {
    has_match = function(v0, v1, v2) --[[ Line: 28 ]] --[[ Name: has_match ]]
        if not v2 then
            v0 = string.lower(v0);
            v1 = string.lower(v1);
        end;
        local v3 = 1;
        for v4 = 1, string.len(v0) do
            v3 = string.find(v1, v0:sub(v4, v4), v3, true);
            if not v3 then
                return false;
            else
                v3 = v3 + 1;
            end;
        end;
        return true;
    end
};
local function _(v6) --[[ Line: 47 ]] --[[ Name: is_lower ]]
    return v6:match("%l");
end;
local function _(v8) --[[ Line: 51 ]] --[[ Name: is_upper ]]
    return v8:match("%u");
end;
local function v15(v10) --[[ Line: 55 ]] --[[ Name: precompute_bonus ]]
    local v11 = {};
    local v12 = "/";
    for v13 = 1, string.len(v10) do
        local v14 = v10:sub(v13, v13);
        if v12 == "/" or v12 == "\\" then
            v11[v13] = 0.9;
        elseif v12 == "-" or v12 == "_" or v12 == " " then
            v11[v13] = 0.8;
        elseif v12 == "." then
            v11[v13] = 0.6;
        elseif v12:match("%l") and v14:match("%u") then
            v11[v13] = 0.7;
        else
            v11[v13] = 0;
        end;
        v12 = v14;
    end;
    return v11;
end;
local function v32(v16, v17, v18, v19, v20) --[[ Line: 79 ]] --[[ Name: compute ]]
    -- upvalues: v15 (copy)
    local v21 = v15(v17);
    local v22 = string.len(v16);
    local v23 = string.len(v17);
    if not v20 then
        v16 = string.lower(v16);
        v17 = string.lower(v17);
    end;
    local v24 = {};
    for v25 = 1, v23 do
        v24[v25] = v17:sub(v25, v25);
    end;
    for v26 = 1, v22 do
        v18[v26] = {};
        v19[v26] = {};
        local v27 = -1e999;
        local v28 = v26 == v22 and -0.005 or -0.01;
        local v29 = v16:sub(v26, v26);
        for v30 = 1, v23 do
            if v29 == v24[v30] then
                local v31 = -1e999;
                if v26 == 1 then
                    v31 = (v30 - 1) * -0.005 + v21[v30];
                elseif v30 > 1 then
                    v31 = math.max(v19[v26 - 1][v30 - 1] + v21[v30], v18[v26 - 1][v30 - 1] + 1);
                end;
                v18[v26][v30] = v31;
                v27 = math.max(v31, v27 + v28);
                v19[v26][v30] = v27;
            else
                v18[v26][v30] = -1e999;
                v27 = v27 + v28;
                v19[v26][v30] = v27;
            end;
        end;
    end;
end;
v5.score = function(v33, v34, v35) --[[ Line: 139 ]] --[[ Name: score ]]
    -- upvalues: v32 (copy)
    local v36 = string.len(v33);
    local v37 = string.len(v34);
    if v36 == 0 or v37 == 0 or v37 > 1024 or v37 < v36 then
        return -1e999;
    elseif v36 == v37 then
        return 1e999;
    else
        local v38 = {};
        local v39 = {};
        v32(v33, v34, v38, v39, v35);
        return v39[v36][v37];
    end;
end;
v5.positions = function(v40, v41, v42) --[[ Line: 170 ]] --[[ Name: positions ]]
    -- upvalues: v32 (copy)
    local v43 = string.len(v40);
    local v44 = string.len(v41);
    if v43 == 0 or v44 == 0 or v44 > 1024 or v44 < v43 then
        return {}, -1e999;
    elseif v43 == v44 then
        local v45 = {};
        for v46 = 1, v43 do
            v45[v46] = v46;
        end;
        return v45, 1e999;
    else
        local v47 = {};
        local v48 = {};
        v32(v40, v41, v47, v48, v42);
        local v49 = {};
        local v50 = false;
        local l_v44_0 = v44;
        for v52 = v43, 1, -1 do
            while l_v44_0 >= 1 do
                if v47[v52][l_v44_0] ~= -1e999 and (v50 or v47[v52][l_v44_0] == v48[v52][l_v44_0]) then
                    local v53 = false;
                    if v52 ~= 1 then
                        v53 = false;
                        if l_v44_0 ~= 1 then
                            v53 = v48[v52][l_v44_0] == v47[v52 - 1][l_v44_0 - 1] + 1;
                        end;
                    end;
                    v50 = v53;
                    v49[v52] = l_v44_0;
                    l_v44_0 = l_v44_0 - 1;
                    break;
                else
                    l_v44_0 = l_v44_0 - 1;
                end;
            end;
        end;
        return v49, v48[v43][v44];
    end;
end;
v5.filter = function(v54, v55, v56) --[[ Line: 221 ]] --[[ Name: filter ]]
    -- upvalues: v5 (copy)
    local v57 = {};
    local v58 = 0;
    for v59, v60 in ipairs(v55) do
        if v5.has_match(v54, v60, v56) then
            local v61, v62 = v5.positions(v54, v60, v56);
            table.insert(v57, {
                v59, 
                v61, 
                v62
            });
            v58 = math.max(v58, v62);
        end;
    end;
    return v57, v58;
end;
v5.get_score_min = function() --[[ Line: 244 ]] --[[ Name: get_score_min ]]
    return -1e999;
end;
v5.get_score_max = function() --[[ Line: 249 ]] --[[ Name: get_score_max ]]
    return 1e999;
end;
v5.get_max_length = function() --[[ Line: 254 ]] --[[ Name: get_max_length ]]
    return 1024;
end;
v5.get_score_floor = function() --[[ Line: 262 ]] --[[ Name: get_score_floor ]]
    return -10.24;
end;
v5.get_score_ceiling = function() --[[ Line: 270 ]] --[[ Name: get_score_ceiling ]]
    return 1024;
end;
v5.get_implementation_name = function() --[[ Line: 275 ]] --[[ Name: get_implementation_name ]]
    return "lua";
end;
return v5;