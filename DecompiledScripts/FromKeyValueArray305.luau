return function(v0) --[[ Line: 2 ]] --[[ Name: FromKeyValueArray ]]
    local v1 = {};
    for _, v3 in v0 do
        v1[v3.Key] = v3.Value;
    end;
    return v1;
end;