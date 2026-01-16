return function(v0, v1) --[[ Line: 2 ]] --[[ Name: MutableMerge ]]
    table.move(v1, 1, #v1, #v0 + 1, v0);
end;