local function v0(v1, v2) --[[ Line: 1 ]] --[[ Name: CoreMerge ]]
    -- upvalues: v0 (copy)
    for v3, v4 in v2 do
        if typeof(v4) == "table" then
            local v5 = v1[v3];
            if not v5 then
                v5 = {};
                v1[v3] = v5;
            end;
            v0(v5, v4);
        else
            v1[v3] = v4;
        end;
    end;
end;
return function(...) --[[ Line: 21 ]] --[[ Name: MutableMergeDeep ]]
    -- upvalues: v0 (copy)
    local v6 = select(1, ...);
    for v7 = 2, select("#", ...) do
        local v8 = select(v7, ...);
        if v8 then
            v0(v6, v8);
        end;
    end;
    return v6;
end;