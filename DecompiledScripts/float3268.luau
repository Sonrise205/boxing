local v0 = require(script.Parent.Parent.process.bufferWriter);
local _ = require(script.Parent.Parent.types);
local v4 = {
    write = v0.f32, 
    read = function(v2, v3) --[[ Line: 9 ]] --[[ Name: read ]]
        return buffer.readf32(v2, v3), 4;
    end
};
return function() --[[ Line: 14 ]]
    -- upvalues: v4 (copy)
    return v4;
end;