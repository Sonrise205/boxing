local v0 = require(script.Parent.Parent.process.bufferWriter);
local _ = require(script.Parent.Parent.types);
local l_u16_0 = v0.u16;
local l_copy_0 = v0.copy;
local l_dyn_alloc_0 = v0.dyn_alloc;
local v11 = {
    read = function(v5, v6) --[[ Line: 9 ]] --[[ Name: read ]]
        local v7 = buffer.readu16(v5, v6);
        local v8 = buffer.create(v7);
        buffer.copy(v8, 0, v5, v6 + 2, v7);
        return v8, v7 + 2;
    end, 
    write = function(v9) --[[ Line: 18 ]] --[[ Name: write ]]
        -- upvalues: l_u16_0 (copy), l_dyn_alloc_0 (copy), l_copy_0 (copy)
        local v10 = buffer.len(v9);
        l_u16_0(v10);
        l_dyn_alloc_0(v10);
        l_copy_0(v9);
    end
};
return function() --[[ Line: 29 ]]
    -- upvalues: v11 (copy)
    return v11;
end;