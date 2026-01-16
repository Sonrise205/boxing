local v0 = require(script.Parent.Parent.process.bufferWriter);
local v1 = require(script.Parent.Parent.process.readRefs);
local _ = require(script.Parent.Parent.types);
local l_reference_0 = v0.reference;
local l_alloc_0 = v0.alloc;
return function() --[[ Line: 8 ]]
    -- upvalues: l_alloc_0 (copy), l_reference_0 (copy), v1 (copy)
    return {
        write = function(v5) --[[ Line: 10 ]] --[[ Name: write ]]
            -- upvalues: l_alloc_0 (ref), l_reference_0 (ref)
            l_alloc_0(1);
            l_reference_0(v5);
        end, 
        read = function(v6, v7) --[[ Line: 15 ]] --[[ Name: read ]]
            -- upvalues: v1 (ref)
            local v8 = v1.get();
            if not v8 then
                return nil, 1;
            else
                return v8[buffer.readu8(v6, v7)], 1;
            end;
        end
    };
end;