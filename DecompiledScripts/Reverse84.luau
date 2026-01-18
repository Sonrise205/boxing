local l_MutableReverse_0 = require(script.Parent:WaitForChild("MutableReverse"));
return function(v1) --[[ Line: 4 ]] --[[ Name: Reverse ]]
    -- upvalues: l_MutableReverse_0 (copy)
    local v2 = table.clone(v1);
    l_MutableReverse_0(v2);
    return v2;
end;