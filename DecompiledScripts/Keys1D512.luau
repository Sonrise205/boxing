return function(v0) --[[ Line: 2 ]] --[[ Name: Keys1D ]]
    local v1 = {};
    local v2 = 1;
    for v3 in v0 do
        v1[v2] = v3;
        v2 = v2 + 1;
    end;
    return v1;
end;