return function(v0, v1, v2) --[[ Line: 2 ]] --[[ Name: Map ]]
    local v3 = table.create(v2 or #v0);
    local v4 = 1;
    for v5 = 1, #v0 do
        local v6 = v1(v0[v5], v5);
        if v6 ~= nil then
            v3[v4] = v6;
            v4 = v4 + 1;
        end;
    end;
    return v3;
end;