return function(...) --[[ Line: 2 ]] --[[ Name: Merge1D ]]
    local v0 = {};
    for v1 = 1, select("#", ...) do
        if select(v1, ...) then
            for v2, v3 in select(v1, ...) do
                v0[v2] = v3;
            end;
        end;
    end;
    return v0;
end;