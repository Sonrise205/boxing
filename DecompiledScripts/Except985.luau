local _ = require(script.Parent.Parent.Parent.Types);
local v1 = require(script.Parent.Parent.Parent.Utilities.Output);
return function(v2, ...) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    v1.warnAssert(select("#", ...) == 0, "incorrect number of arguments passed to player container");
    return {
        kind = "except", 
        value = v2
    };
end;