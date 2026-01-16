return function(v0) --[[ Line: 2 ]] --[[ Name: FromKeyValueArray1D ]]
    local v1 = {};
    for _, v3 in v0 do
        v1[v3[1]] = v3[2];
    end;
    return v1;
end;