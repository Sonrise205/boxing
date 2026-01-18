local l_BinarySearch_0 = require(script.Parent:WaitForChild("BinarySearch"));
return function(v1, v2) --[[ Line: 4 ]] --[[ Name: MutableBinaryInsert ]]
    -- upvalues: l_BinarySearch_0 (copy)
    table.insert(v1, l_BinarySearch_0(v1, v2, true) + 1, v2);
end;