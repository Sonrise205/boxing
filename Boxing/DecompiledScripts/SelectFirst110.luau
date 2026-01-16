return function(v0, v1) --[[ Line: 2 ]] --[[ Name: SelectFirst ]]
    for v2 = 1, #v0 do
        local v3 = v0[v2];
        if v1(v3, v2) then
            return v3, v2;
        end;
    end;
    return nil, nil;
end;