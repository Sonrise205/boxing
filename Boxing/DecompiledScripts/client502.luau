local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = require(script.Parent.Parent.types);
local v3 = require(script.Parent.read);
local v4 = require(script.Parent.bufferWriter);
local l_alloc_0 = v4.alloc;
local l_u8_0 = v4.u8;
local l_load_0 = v4.load;
local function v10(v8, v9) --[[ Line: 12 ]] --[[ Name: onClientEvent ]]
    -- upvalues: v3 (copy)
    v3(v8, v9);
end;
local function v11() --[[ Line: 17 ]] --[[ Name: create ]]
    return {
        cursor = 0, 
        size = 256, 
        references = {}, 
        buff = buffer.create(256)
    };
end;
local function _(v12) --[[ Line: 26 ]] --[[ Name: dump ]]
    local l_cursor_0 = v12.cursor;
    local v14 = buffer.create(l_cursor_0);
    buffer.copy(v14, 0, v12.buff, 0, l_cursor_0);
    local l_v14_0 = v14;
    if #v12.references > 0 then
        return l_v14_0, v12.references;
    else
        return l_v14_0, nil;
    end;
end;
local v17 = v11();
local v18 = v11();
return {
    sendReliable = function(v19, v20, v21) --[[ Line: 41 ]] --[[ Name: sendReliable ]]
        -- upvalues: v17 (ref), l_load_0 (copy), l_alloc_0 (copy), l_u8_0 (copy), v4 (copy)
        v17 = l_load_0(v17);
        l_alloc_0(1);
        l_u8_0(v19);
        v20(v21);
        v17 = v4.export();
    end, 
    sendUnreliable = function(v22, v23, v24) --[[ Line: 51 ]] --[[ Name: sendUnreliable ]]
        -- upvalues: v18 (ref), l_load_0 (copy), l_alloc_0 (copy), l_u8_0 (copy), v4 (copy)
        v18 = l_load_0(v18);
        l_alloc_0(1);
        l_u8_0(v22);
        v23(v24);
        v18 = v4.export();
    end, 
    start = function() --[[ Line: 61 ]] --[[ Name: start ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), v10 (copy), l_RunService_0 (copy), v17 (ref), v18 (ref)
        local l_ByteNetReliable_0 = l_ReplicatedStorage_0:WaitForChild("ByteNetReliable");
        l_ByteNetReliable_0.OnClientEvent:Connect(v10);
        local l_ByteNetUnreliable_0 = l_ReplicatedStorage_0:WaitForChild("ByteNetUnreliable");
        l_ByteNetUnreliable_0.OnClientEvent:Connect(v10);
        l_RunService_0.Heartbeat:Connect(function() --[[ Line: 68 ]]
            -- upvalues: v17 (ref), l_ByteNetReliable_0 (copy), v18 (ref), l_ByteNetUnreliable_0 (copy)
            if v17.cursor > 0 then
                local l_v17_0 = v17;
                local l_cursor_1 = l_v17_0.cursor;
                local v29 = buffer.create(l_cursor_1);
                buffer.copy(v29, 0, l_v17_0.buff, 0, l_cursor_1);
                local l_v29_0 = v29;
                local v31 = if #l_v17_0.references > 0 then l_v17_0.references else nil;
                l_ByteNetReliable_0:FireServer(l_v29_0, v31);
                v17.cursor = 0;
                table.clear(v17.references);
            end;
            if v18.cursor > 0 then
                local l_v18_0 = v18;
                local l_cursor_2 = l_v18_0.cursor;
                local v34 = buffer.create(l_cursor_2);
                buffer.copy(v34, 0, l_v18_0.buff, 0, l_cursor_2);
                local l_v34_0 = v34;
                local v36 = if #l_v18_0.references > 0 then l_v18_0.references else nil;
                l_ByteNetUnreliable_0:FireServer(l_v34_0, v36);
                v18.cursor = 0;
                table.clear(v18.references);
            end;
        end);
    end
};