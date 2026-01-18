local v0 = Random.new();
return function(v1, v2) --[[ Line: 4 ]] --[[ Name: SelectRandom ]]
    -- upvalues: v0 (copy)
    local v3 = (v2 and Random.new(v2) or v0):NextInteger(1, #v1);
    return v1[v3], v3;
end;