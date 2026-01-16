return function(v0, ...) --[[ Line: 2 ]] --[[ Name: MutableMergeMany ]]
    for v1 = 1, select("#", ...) do
        local v2 = select(v1, ...);
        table.move(v2, 1, #v2, #v0 + 1, v0);
    end;
end;