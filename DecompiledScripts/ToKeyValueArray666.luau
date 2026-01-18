return function(v0) --[[ Line: 2 ]] --[[ Name: ToKeyValueArray ]]
    local v1 = {};
    for v2, v3 in v0 do
        table.insert(v1, {
            Key = v2, 
            Value = v3
        });
    end;
    return v1;
end;