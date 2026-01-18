local v0 = require(script.Parent.Parent.process.bufferWriter);
local _ = require(script.Parent.Parent.types);
local l_u16_0 = v0.u16;
local l_writestring_0 = v0.writestring;
local l_dyn_alloc_0 = v0.dyn_alloc;
local v10 = {
    read = function(v5, v6) --[[ Line: 11 ]] --[[ Name: read ]]
        local v7 = buffer.readu16(v5, v6);
        return buffer.readstring(v5, v6 + 2, v7), v7 + 2;
    end, 
    write = function(v8) --[[ Line: 16 ]] --[[ Name: write ]]
        -- upvalues: l_u16_0 (copy), l_dyn_alloc_0 (copy), l_writestring_0 (copy)
        local v9 = string.len(v8);
        l_u16_0(v9);
        l_dyn_alloc_0(v9);
        l_writestring_0(v8);
    end
};
return function() --[[ Line: 25 ]]
    -- upvalues: v10 (copy)
    return v10;
end;