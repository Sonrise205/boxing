return function(v0, v1) --[[ Line: 2 ]] --[[ Name: Changes1D ]]
    local v2 = {};
    for v3, v4 in v0 do
        local v5 = v1[v3];
        if v5 and v5 ~= v4 then
            v2[v3] = v5;
        end;
    end;
    return v2;
end;