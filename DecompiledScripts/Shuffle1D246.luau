local l_MutableShuffle1D_0 = require(script.Parent:WaitForChild("MutableShuffle1D"));
return function(v1, v2) --[[ Line: 4 ]] --[[ Name: Shuffle1D ]]
    -- upvalues: l_MutableShuffle1D_0 (copy)
    local v3 = table.clone(v1);
    l_MutableShuffle1D_0(v3, v2);
    return v3;
end;