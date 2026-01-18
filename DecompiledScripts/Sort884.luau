return function(v0, v1) --[[ Line: 2 ]] --[[ Name: Sort ]]
    local v2 = table.clone(v0);
    table.sort(v2, v1);
    return v2;
end;