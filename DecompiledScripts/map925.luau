local v0 = require(script.Parent.Parent.process.bufferWriter);
local _ = require(script.Parent.Parent.types);
local l_u16_0 = v0.u16;
return function(v3, v4) --[[ Line: 7 ]]
    -- upvalues: l_u16_0 (copy)
    local l_write_0 = v3.write;
    local l_write_1 = v4.write;
    return {
        read = function(v7, v8) --[[ Line: 16 ]] --[[ Name: read ]]
            -- upvalues: v3 (copy), v4 (copy)
            local v9 = {};
            local l_v8_0 = v8;
            local v11 = buffer.readu16(v7, l_v8_0);
            l_v8_0 = l_v8_0 + 2;
            for _ = 1, v11 do
                local v13, v14 = v3.read(v7, l_v8_0);
                l_v8_0 = l_v8_0 + v14;
                local v15, v16 = v4.read(v7, l_v8_0);
                l_v8_0 = l_v8_0 + v16;
                v9[v13] = v15;
            end;
            return v9, l_v8_0 - v8;
        end, 
        write = function(v17) --[[ Line: 38 ]] --[[ Name: write ]]
            -- upvalues: l_u16_0 (ref), l_write_0 (copy), l_write_1 (copy)
            local v18 = 0;
            for _ in v17 do
                v18 = v18 + 1;
            end;
            l_u16_0(v18);
            for v20, v21 in v17 do
                l_write_0(v20);
                l_write_1(v21);
            end;
        end
    };
end;