local l_MutableReverse1D_0 = require(script.Parent:WaitForChild("MutableReverse1D"));
return function(v1) --[[ Line: 4 ]] --[[ Name: Reverse1D ]]
    -- upvalues: l_MutableReverse1D_0 (copy)
    local v2 = table.clone(v1);
    l_MutableReverse1D_0(v2);
    return v2;
end;