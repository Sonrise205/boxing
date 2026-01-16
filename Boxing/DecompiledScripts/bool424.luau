local v0 = require(script.Parent.Parent.process.bufferWriter);
local _ = require(script.Parent.Parent.types);
local v4 = {
    read = function(v2, v3) --[[ Line: 11 ]] --[[ Name: read ]]
        return buffer.readu8(v2, v3) == 1, 1;
    end, 
    write = v0.bool
};
return function() --[[ Line: 18 ]]
    -- upvalues: v4 (copy)
    return v4;
end;