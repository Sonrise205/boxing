local v0 = Random.new();
return function(v1, v2) --[[ Line: 4 ]] --[[ Name: MutableShuffle ]]
    -- upvalues: v0 (copy)
    local v3 = v2 and Random.new(v2) or v0;
    local v4 = #v1;
    for v5 = 1, v4 do
        local v6 = v3:NextInteger(1, v4);
        local v7 = v1[v6];
        local v8 = v1[v5];
        v1[v5] = v7;
        v1[v6] = v8;
    end;
end;