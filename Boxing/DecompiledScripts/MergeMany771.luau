return function(...) --[[ Line: 2 ]] --[[ Name: MergeMany ]]
    local v0 = select(1, ...);
    local v1 = table.clone(v0);
    local v2 = #v1 + 1;
    for v3 = 2, select("#", ...) do
        local v4 = select(v3, ...);
        if v4 then
            local v5 = #v4;
            table.move(v4, 1, v5, v2, v1);
            v2 = v2 + v5;
        end;
    end;
    return v1;
end;