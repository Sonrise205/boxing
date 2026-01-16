return function(v0) --[[ Line: 2 ]] --[[ Name: Reverse1D ]]
    local v1 = #v0;
    local v2 = table.create(v1);
    for v3 = 1, v1 do
        v2[v3] = v0[v1 - v3 + 1];
    end;
    return v2;
end;