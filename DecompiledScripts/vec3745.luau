local v0 = require(script.Parent.Parent.process.bufferWriter);
local _ = require(script.Parent.Parent.types);
local l_f32NoAlloc_0 = v0.f32NoAlloc;
local l_alloc_0 = v0.alloc;
local v7 = {
    read = function(v4, v5) --[[ Line: 11 ]] --[[ Name: read ]]
        return Vector3.new(buffer.readf32(v4, v5), buffer.readf32(v4, v5 + 4), (buffer.readf32(v4, v5 + 8))), 12;
    end, 
    write = function(v6) --[[ Line: 15 ]] --[[ Name: write ]]
        -- upvalues: l_alloc_0 (copy), l_f32NoAlloc_0 (copy)
        l_alloc_0(12);
        l_f32NoAlloc_0(v6.X);
        l_f32NoAlloc_0(v6.Y);
        l_f32NoAlloc_0(v6.Z);
    end
};
return function() --[[ Line: 23 ]]
    -- upvalues: v7 (copy)
    return v7;
end;