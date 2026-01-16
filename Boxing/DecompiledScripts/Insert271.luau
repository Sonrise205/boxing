return function(v0, v1, v2) --[[ Line: 2 ]] --[[ Name: Insert ]]
    local v3 = #v0 + 1;
    local v4 = table.create(v3);
    v2 = v2 or v3;
    local v5 = false;
    if v2 >= 1 then
        v5 = v2 <= v3;
    end;
    assert(v5, "Insert index out of array range");
    table.move(v0, 1, v2 - 1, 1, v4);
    v4[v2] = v1;
    table.move(v0, v2, v3 - 1, v2 + 1, v4);
    return v4;
end;