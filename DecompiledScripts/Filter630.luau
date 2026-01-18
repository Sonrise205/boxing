return function(v0, v1, v2) --[[ Line: 2 ]] --[[ Name: Filter ]]
    local v3 = table.create(v2 or 0);
    local v4 = 1;
    for v5, v6 in v0 do
        if v1(v6, v5) then
            v3[v4] = v6;
            v4 = v4 + 1;
        end;
    end;
    return v3;
end;