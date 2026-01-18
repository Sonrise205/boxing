local v0 = Random.new();
return function(v1, v2) --[[ Line: 4 ]] --[[ Name: Shuffle1D ]]
    -- upvalues: v0 (copy)
    local v3 = v2 and Random.new(v2) or v0;
    local v4 = #v1;
    local v5 = table.clone(v1);
    for v6 = 1, v4 do
        local v7 = v3:NextInteger(1, v4);
        local v8 = v5[v7];
        local v9 = v5[v6];
        v5[v6] = v8;
        v5[v7] = v9;
    end;
    return v5;
end;