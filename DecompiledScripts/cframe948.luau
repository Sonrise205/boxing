local v0 = require(script.Parent.Parent.process.bufferWriter);
local _ = require(script.Parent.Parent.types);
local l_f32NoAlloc_0 = v0.f32NoAlloc;
local l_alloc_0 = v0.alloc;
local v20 = {
    read = function(v4, v5) --[[ Line: 9 ]] --[[ Name: read ]]
        local v6 = buffer.readf32(v4, v5);
        local v7 = buffer.readf32(v4, v5 + 4);
        local v8 = buffer.readf32(v4, v5 + 8);
        local v9 = Vector3.new(buffer.readf32(v4, v5 + 12), buffer.readf32(v4, v5 + 16), (buffer.readf32(v4, v5 + 20)));
        local l_Magnitude_0 = v9.Magnitude;
        return CFrame.fromAxisAngle(v9, l_Magnitude_0) + Vector3.new(v6, v7, v8), 24;
    end, 
    write = function(v11) --[[ Line: 23 ]] --[[ Name: write ]]
        -- upvalues: l_alloc_0 (copy), l_f32NoAlloc_0 (copy)
        local l_X_0 = v11.X;
        local l_Y_0 = v11.Y;
        local l_Z_0 = v11.Z;
        local v15, v16 = v11:ToAxisAngle();
        local l_X_1 = v15.X;
        local l_Y_1 = v15.Y;
        local l_Z_1 = v15.Z;
        v15 = v15 * v16;
        l_alloc_0(24);
        l_f32NoAlloc_0(l_X_0);
        l_f32NoAlloc_0(l_Y_0);
        l_f32NoAlloc_0(l_Z_0);
        l_f32NoAlloc_0(l_X_1);
        l_f32NoAlloc_0(l_Y_1);
        l_f32NoAlloc_0(l_Z_1);
    end
};
return function() --[[ Line: 42 ]]
    -- upvalues: v20 (copy)
    return v20;
end;