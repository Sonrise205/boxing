--!native
local _ = require(script.Parent.Parent.Types);
return function(v1, v2, v3) --[[ Line: 7 ]] --[[ Name: CreatePhysics ]]
    v3 = v3 or v2 - v2;
    return function(v4) --[[ Line: 10 ]]
        -- upvalues: v1 (copy), v2 (copy), v3 (ref)
        local l_Completion_0 = v4.Completion;
        return v1 + v2 * l_Completion_0 + v3 * (l_Completion_0 * l_Completion_0);
    end;
end;