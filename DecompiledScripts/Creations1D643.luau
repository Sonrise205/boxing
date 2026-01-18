return function(v0, v1) --[[ Line: 2 ]] --[[ Name: Creations1D ]]
    local v2 = {};
    for v3, v4 in v1 do
        if not v0[v3] then
            v2[v3] = v4;
        end;
    end;
    return v2;
end;