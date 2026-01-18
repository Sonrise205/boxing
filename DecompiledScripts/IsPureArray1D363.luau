local l_IsArray1D_0 = require(script.Parent:WaitForChild("IsArray1D"));
local l_IsMap1D_0 = require(script.Parent.Parent:WaitForChild("Map"):WaitForChild("IsMap1D"));
return function(v2) --[[ Line: 5 ]] --[[ Name: IsPureArray1D ]]
    -- upvalues: l_IsArray1D_0 (copy), l_IsMap1D_0 (copy)
    return l_IsArray1D_0(v2) and not l_IsMap1D_0(v2);
end;