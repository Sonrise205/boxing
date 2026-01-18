return function(...) --[[ Line: 2 ]] --[[ Name: Merge1D ]]
    local v0 = table.clone(select(1, ...));
    local v1 = #v0 + 1;
    for v2 = 2, select("#", ...) do
        local v3 = select(v2, ...);
        if v3 then
            local v4 = #v3;
            table.move(v3, 1, v4, v1, v0);
            v1 = v1 + v4;
        end;
    end;
    return v0;
end;