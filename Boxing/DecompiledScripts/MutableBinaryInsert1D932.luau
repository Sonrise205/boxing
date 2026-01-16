local l_BinarySearch1D_0 = require(script.Parent:WaitForChild("BinarySearch1D"));
return function(v1, v2) --[[ Line: 4 ]] --[[ Name: MutableBinaryInsert1D ]]
    -- upvalues: l_BinarySearch1D_0 (copy)
    table.insert(v1, l_BinarySearch1D_0(v1, v2, true) + 1, v2);
end;