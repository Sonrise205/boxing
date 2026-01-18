local l_IsMap1D_0 = require(script.Parent:WaitForChild("IsMap1D"));
local l_IsArray1D_0 = require(script.Parent.Parent:WaitForChild("Array"):WaitForChild("IsArray1D"));
return function(v2) --[[ Line: 5 ]] --[[ Name: IsMixed1D ]]
    -- upvalues: l_IsMap1D_0 (copy), l_IsArray1D_0 (copy)
    return l_IsMap1D_0(v2) and l_IsArray1D_0(v2);
end;