local _ = require(script.Parent.Parent.Parent.Types);
local v1 = require(script.Parent.Parent.Parent.Utilities.Output);
local v2 = {
    kind = "all", 
    value = nil
};
table.freeze(v2);
return function(...) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v2 (copy)
    v1.warnAssert(select("#", ...) == 0, "incorrect number of arguments passed to player container");
    return v2;
end;