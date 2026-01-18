return function(v0, v1, v2) --[[ Line: 2 ]] --[[ Name: FoldRight ]]
    local l_v2_0 = v2;
    local v4 = #v0;
    for v5 = v4, 1, -1 do
        l_v2_0 = v1(l_v2_0, v0[v5], v5, v4);
    end;
    return l_v2_0;
end;