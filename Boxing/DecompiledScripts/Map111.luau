return function(v0, v1) --[[ Line: 2 ]] --[[ Name: Map ]]
    local v2 = {};
    for v3, v4 in v0 do
        local v5, v6 = v1(v4, v3);
        v2[v6 or v3] = v5;
    end;
    return v2;
end;