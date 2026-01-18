return function(v0, v1) --[[ Line: 2 ]] --[[ Name: SelectFirst1D ]]
    for v2, _ in v0 do
        local v4 = v0[v2];
        if v1(v4, v2) then
            return v4;
        end;
    end;
    return nil;
end;