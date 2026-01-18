return function(...) --[[ Line: 2 ]] --[[ Name: Merge1D ]]
    local v0 = select(1, ...);
    for v1 = 2, select("#", ...) do
        local v2 = select(v1, ...);
        if v2 then
            for v3, v4 in v2 do
                v0[v3] = v4;
            end;
        end;
    end;
    return v0;
end;