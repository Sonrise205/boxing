local l_IsArray_0 = require(script.Parent.Parent:WaitForChild("Array"):WaitForChild("IsArray"));
local l_IsMap_0 = require(script.Parent:WaitForChild("IsMap"));
return function(v2) --[[ Line: 5 ]] --[[ Name: IsPureMap ]]
    -- upvalues: l_IsMap_0 (copy), l_IsArray_0 (copy)
    return l_IsMap_0(v2) and not l_IsArray_0(v2);
end;