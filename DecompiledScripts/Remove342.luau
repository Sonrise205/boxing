return function(v0, v1) --[[ Line: 2 ]] --[[ Name: Remove ]]
    local v2 = #v0;
    if v2 == 0 then
        return v0;
    else
        v1 = v1 or v2;
        assert(v1 > 0, "Index must be greater than 0");
        assert(v1 <= v2, "Index out of bounds");
        local v3 = table.create(v2 - 1);
        table.move(v0, 1, v1 - 1, 1, v3);
        table.move(v0, v1 + 1, v2, v1, v3);
        return v3;
    end;
end;