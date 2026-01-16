return function(v0) --[[ Line: 2 ]] --[[ Name: MutableReverse ]]
    local v1 = #v0;
    for v2 = 1, math.floor(v1 / 2) do
        local v3 = v1 - v2 + 1;
        local v4 = v0[v3];
        local v5 = v0[v2];
        v0[v2] = v4;
        v0[v3] = v5;
    end;
end;