local _ = require(script.Parent.Parent.types);
local v3 = {
    write = require(script.Parent.Parent.process.bufferWriter).u8, 
    read = function(v1, v2) --[[ Line: 9 ]] --[[ Name: read ]]
        return buffer.readu8(v1, v2), 1;
    end
};
return function() --[[ Line: 14 ]]
    -- upvalues: v3 (copy)
    return v3;
end;