local function v0(v1, v2) --[[ Line: 2 ]] --[[ Name: MergeDeep ]]
    -- upvalues: v0 (copy)
    if next(v1) == nil then
        return v2;
    elseif next(v2) == nil then
        return v1;
    elseif v2 == v1 then
        return v2;
    else
        local v3 = {};
        for v4, v5 in v1 do
            v3[v4] = v5;
        end;
        for v6, v7 in v2 do
            if typeof(v7) == "table" then
                local v8 = v1[v6];
                if typeof(v8) == "table" then
                    v3[v6] = v0(v8, v7);
                    continue;
                end;
            end;
            v3[v6] = v7;
        end;
        return v3;
    end;
end;
return v0;