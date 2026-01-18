return function(v0, v1) --[[ Line: 2 ]] --[[ Name: Filter ]]
    local v2 = {};
    for v3, v4 in v0 do
        if v1(v4, v3) then
            v2[v3] = v4;
        end;
    end;
    return v2;
end;