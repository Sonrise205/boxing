local v0 = Random.new();
return function(v1, v2, v3, v4) --[[ Line: 5 ]] --[[ Name: SelectWeighted1D ]]
    -- upvalues: v0 (copy)
    local v5 = v3 and Random.new(v3) or v0;
    local v6 = 0;
    if not v4 then
        v1 = table.clone(v1);
    end;
    for _, v8 in v1 do
        v6 = v6 + v8[v2];
    end;
    table.sort(v1, function(v9, v10) --[[ Line: 17 ]]
        -- upvalues: v2 (copy)
        return v9[v2] > v10[v2];
    end);
    local v11 = v5:NextNumber() * v6;
    for _, v13 in v1 do
        v11 = v11 - v13[v2];
        if v11 <= 0 then
            return v13;
        end;
    end;
    error("Failed to select weighted value.");
end;