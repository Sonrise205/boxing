local l_IsArray_0 = require(script.Parent:WaitForChild("IsArray"));
local l_IsMap_0 = require(script.Parent.Parent:WaitForChild("Map"):WaitForChild("IsMap"));
return function(v2) --[[ Line: 5 ]] --[[ Name: IsPureArray ]]
    -- upvalues: l_IsArray_0 (copy), l_IsMap_0 (copy)
    return l_IsArray_0(v2) and not l_IsMap_0(v2);
end;