local l_MutableShuffle_0 = require(script.Parent:WaitForChild("MutableShuffle"));
return function(v1, v2) --[[ Line: 4 ]] --[[ Name: Shuffle ]]
    -- upvalues: l_MutableShuffle_0 (copy)
    local v3 = table.clone(v1);
    l_MutableShuffle_0(v3, v2);
    return v3;
end;