return function(v0, v1, v2) --[[ Line: 2 ]] --[[ Name: Cut1D ]]
    local v3 = #v0;
    assert(v1 >= 1, "Start index less than 1!");
    assert(v2 >= 1, "End index greater than 1!");
    assert(v1 <= v3, "Start index beyond array length!");
    assert(v2 <= v3, "End index beyond array length!");
    local v4 = v2 - v1;
    local v5 = math.abs(v4);
    if v5 == v3 - 1 then
        return v0;
    elseif v4 > 0 then
        return table.move(v0, v1, v2, 1, {});
    else
        local v6 = table.create(v5);
        local v7 = 1;
        for v8 = v1, v2, -1 do
            v6[v7] = v0[v8];
            v7 = v7 + 1;
        end;
        return v6;
    end;
end;