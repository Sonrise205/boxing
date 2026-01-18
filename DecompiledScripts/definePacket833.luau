--!native
local _ = require(script.Parent.Parent.types);
local v1 = require(script.Parent.packet);
return function(v2) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 13 ]]
        -- upvalues: v1 (ref), v2 (copy)
        return v1(v2, v3);
    end;
end;