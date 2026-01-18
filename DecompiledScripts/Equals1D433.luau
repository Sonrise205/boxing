return function(v0, v1) --[[ Line: 2 ]] --[[ Name: Equals1D ]]
    for v2, v3 in v0 do
        if v3 ~= v1[v2] then
            return false;
        end;
    end;
    for v4, v5 in v1 do
        if v5 ~= v0[v4] then
            return false;
        end;
    end;
    return true;
end;