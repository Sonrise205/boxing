--!native
local _ = require(script.Parent.Parent.types);
local v1 = nil;
local v2 = nil;
local v3 = nil;
local v4 = nil;
local v5 = nil;
local function v8(v6) --[[ Line: 27 ]] --[[ Name: alloc ]]
    -- upvalues: v3 (ref), v2 (ref), v4 (ref)
    if v3 + v6 < v2 then
        return;
    else
        v2 = math.floor(v2 * 1.5);
        local v7 = buffer.create(v2);
        buffer.copy(v7, 0, v4);
        v4 = v7;
        return;
    end;
end;
local function v11(v9) --[[ Line: 40 ]] --[[ Name: dyn_alloc ]]
    -- upvalues: v3 (ref), v2 (ref), v4 (ref)
    while v3 + v9 >= v2 do
        v2 = math.floor(v2 * 1.5);
    end;
    local v10 = buffer.create(v2);
    buffer.copy(v10, 0, v4);
    v4 = v10;
end;
return {
    alloc = v8, 
    dyn_alloc = v11, 
    u8 = function(v12) --[[ Line: 56 ]] --[[ Name: u8 ]]
        -- upvalues: v3 (ref), v2 (ref), v4 (ref)
        if v3 + 1 >= v2 then
            v2 = math.floor(v2 * 1.5);
            local v13 = buffer.create(v2);
            buffer.copy(v13, 0, v4);
            v4 = v13;
        end;
        buffer.writeu8(v4, v3, v12);
        v3 = v3 + 1;
    end, 
    i8 = function(v14) --[[ Line: 62 ]] --[[ Name: i8 ]]
        -- upvalues: v3 (ref), v2 (ref), v4 (ref)
        if v3 + 1 >= v2 then
            v2 = math.floor(v2 * 1.5);
            local v15 = buffer.create(v2);
            buffer.copy(v15, 0, v4);
            v4 = v15;
        end;
        buffer.writei8(v4, v3, v14);
        v3 = v3 + 1;
    end, 
    reference = function(v16) --[[ Line: 69 ]] --[[ Name: reference ]]
        -- upvalues: v5 (ref), v4 (ref), v3 (ref)
        table.insert(v5, v16);
        local v17 = #v5;
        buffer.writeu8(v4, v3, v17);
        v3 = v3 + 1;
        print(v5);
    end, 
    u16 = function(v18) --[[ Line: 78 ]] --[[ Name: u16 ]]
        -- upvalues: v3 (ref), v2 (ref), v4 (ref)
        if v3 + 2 >= v2 then
            v2 = math.floor(v2 * 1.5);
            local v19 = buffer.create(v2);
            buffer.copy(v19, 0, v4);
            v4 = v19;
        end;
        buffer.writeu16(v4, v3, v18);
        v3 = v3 + 2;
    end, 
    i16 = function(v20) --[[ Line: 84 ]] --[[ Name: i16 ]]
        -- upvalues: v3 (ref), v2 (ref), v4 (ref)
        if v3 + 2 >= v2 then
            v2 = math.floor(v2 * 1.5);
            local v21 = buffer.create(v2);
            buffer.copy(v21, 0, v4);
            v4 = v21;
        end;
        buffer.writeu16(v4, v3, v20);
        v3 = v3 + 2;
    end, 
    u32 = function(v22) --[[ Line: 90 ]] --[[ Name: u32 ]]
        -- upvalues: v3 (ref), v2 (ref), v4 (ref)
        if v3 + 4 >= v2 then
            v2 = math.floor(v2 * 1.5);
            local v23 = buffer.create(v2);
            buffer.copy(v23, 0, v4);
            v4 = v23;
        end;
        buffer.writeu32(v4, v3, v22);
        v3 = v3 + 4;
    end, 
    writestring = function(v24) --[[ Line: 96 ]] --[[ Name: writestring ]]
        -- upvalues: v4 (ref), v3 (ref)
        buffer.writestring(v4, v3, v24);
        v3 = v3 + string.len(v24);
    end, 
    i32 = function(v25) --[[ Line: 101 ]] --[[ Name: i32 ]]
        -- upvalues: v3 (ref), v2 (ref), v4 (ref)
        if v3 + 4 >= v2 then
            v2 = math.floor(v2 * 1.5);
            local v26 = buffer.create(v2);
            buffer.copy(v26, 0, v4);
            v4 = v26;
        end;
        buffer.writei32(v4, v3, v25);
        v3 = v3 + 4;
    end, 
    f32NoAlloc = function(v27) --[[ Line: 107 ]] --[[ Name: f32NoAlloc ]]
        -- upvalues: v4 (ref), v3 (ref)
        buffer.writef32(v4, v3, v27);
        v3 = v3 + 4;
    end, 
    f64NoAlloc = function(v28) --[[ Line: 112 ]] --[[ Name: f64NoAlloc ]]
        -- upvalues: v4 (ref), v3 (ref)
        buffer.writef64(v4, v3, v28);
        v3 = v3 + 4;
    end, 
    f32 = function(v29) --[[ Line: 117 ]] --[[ Name: f32 ]]
        -- upvalues: v3 (ref), v2 (ref), v4 (ref)
        if v3 + 4 >= v2 then
            v2 = math.floor(v2 * 1.5);
            local v30 = buffer.create(v2);
            buffer.copy(v30, 0, v4);
            v4 = v30;
        end;
        buffer.writef32(v4, v3, v29);
        v3 = v3 + 4;
    end, 
    f64 = function(v31) --[[ Line: 123 ]] --[[ Name: f64 ]]
        -- upvalues: v3 (ref), v2 (ref), v4 (ref)
        if v3 + 8 >= v2 then
            v2 = math.floor(v2 * 1.5);
            local v32 = buffer.create(v2);
            buffer.copy(v32, 0, v4);
            v4 = v32;
        end;
        buffer.writef64(v4, v3, v31);
        v3 = v3 + 8;
    end, 
    copy = function(v33) --[[ Line: 129 ]] --[[ Name: copy ]]
        -- upvalues: v4 (ref), v3 (ref)
        buffer.copy(v4, v3, v33);
        v3 = v3 + buffer.len(v33);
    end, 
    bool = function(v34) --[[ Line: 134 ]] --[[ Name: bool ]]
        -- upvalues: v3 (ref), v2 (ref), v4 (ref)
        if v3 + 1 >= v2 then
            v2 = math.floor(v2 * 1.5);
            local v35 = buffer.create(v2);
            buffer.copy(v35, 0, v4);
            v4 = v35;
        end;
        buffer.writeu8(v4, v3, v34 and 1 or 0);
        v3 = v3 + 1;
    end, 
    load = function(v36) --[[ Line: 140 ]] --[[ Name: load ]]
        -- upvalues: v1 (ref), v2 (ref), v3 (ref), v5 (ref), v4 (ref)
        v1 = v36;
        v2 = v36.size;
        v3 = v36.cursor;
        v5 = v36.references;
        v4 = v36.buff;
    end, 
    export = function() --[[ Line: 148 ]] --[[ Name: export ]]
        -- upvalues: v1 (ref), v2 (ref), v3 (ref), v5 (ref), v4 (ref)
        v1.size = v2;
        v1.cursor = v3;
        v1.references = v5;
        v1.buff = v4;
        return v1;
    end
};