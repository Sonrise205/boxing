local function v0(v1, v2) --[[ Line: 4 ]] --[[ Name: MergeDeep ]]
    -- upvalues: v0 (copy)
    local v3 = {};
    for v4, v5 in v2 do
        v3[v4] = v5;
    end;
    for v6, v7 in v1 do
        if type(v7) ~= "table" then
            v3[v6] = v7;
        else
            local v8 = v2[v6];
            local v9 = type(v8) == "table" and v8 or {};
            v3[v6] = v0(v7, v9);
        end;
    end;
    return v3;
end;
return v0;