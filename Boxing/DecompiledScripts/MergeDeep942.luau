local function v0(v1, v2) --[[ Line: 2 ]] --[[ Name: MergeDeep ]]
    -- upvalues: v0 (copy)
    if next(v1) == nil then
        return v2;
    elseif next(v2) == nil then
        return v1;
    elseif v1 == v2 then
        return v1;
    else
        local v3 = {};
        for v4, v5 in v1 do
            v3[v4] = v5;
        end;
        for v6, v7 in v2 do
            v3[v6] = type(v7) == "table" and v0(v3[v6] or {}, v7) or v7;
        end;
        return v3;
    end;
end;
return v0;