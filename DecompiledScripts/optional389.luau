local v0 = require(script.Parent.Parent.process.bufferWriter);
local _ = require(script.Parent.Parent.types);
local l_bool_0 = v0.bool;
return function(v3) --[[ Line: 6 ]]
    -- upvalues: l_bool_0 (copy)
    local l_read_0 = v3.read;
    local l_write_0 = v3.write;
    return {
        read = function(v6, v7) --[[ Line: 16 ]] --[[ Name: read ]]
            -- upvalues: l_read_0 (copy)
            if buffer.readu8(v6, v7) == 0 then
                return nil, 1;
            else
                local v8, v9 = l_read_0(v6, v7 + 1);
                return v8, v9 + 1;
            end;
        end, 
        write = function(v10) --[[ Line: 27 ]] --[[ Name: write ]]
            -- upvalues: l_bool_0 (ref), l_write_0 (copy)
            local v11 = v10 ~= nil;
            l_bool_0(v11);
            if v11 then
                l_write_0(v10);
            end;
        end
    };
end;