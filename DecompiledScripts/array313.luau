local v0 = require(script.Parent.Parent.process.bufferWriter);
local _ = require(script.Parent.Parent.types);
local l_u16_0 = v0.u16;
return function(v3) --[[ Line: 9 ]]
    -- upvalues: l_u16_0 (copy)
    local l_write_0 = v3.write;
    local l_read_0 = v3.read;
    return {
        read = function(v6, v7) --[[ Line: 14 ]] --[[ Name: read ]]
            -- upvalues: l_read_0 (copy)
            local v8 = buffer.readu16(v6, v7);
            local v9 = v7 + 2;
            local v10 = {};
            for _ = 1, v8 do
                local v12, v13 = l_read_0(v6, v9);
                table.insert(v10, v12);
                v9 = v9 + v13;
            end;
            return v10, v9 - v7;
        end, 
        write = function(v14) --[[ Line: 28 ]] --[[ Name: write ]]
            -- upvalues: l_u16_0 (ref), l_write_0 (copy)
            local v15 = #v14;
            l_u16_0(v15);
            for v16 = 1, v15 do
                l_write_0(v14[v16]);
            end;
        end
    };
end;