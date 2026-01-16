--!native
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = require(script.Parent.Parent.types);
local v4 = require(script.Parent.read);
local v5 = require(script.Parent.bufferWriter);
local l_alloc_0 = v5.alloc;
local l_u8_0 = v5.u8;
local l_load_0 = v5.load;
local v9 = {};
local v10 = {};
local function v11() --[[ Line: 20 ]] --[[ Name: create ]]
    return {
        cursor = 0, 
        size = 256, 
        references = {}, 
        buff = buffer.create(256)
    };
end;
local function _(v12) --[[ Line: 29 ]] --[[ Name: dump ]]
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
local function v22(v19, v20, v21) --[[ Line: 43 ]] --[[ Name: onServerEvent ]]
    -- upvalues: v4 (copy)
    if typeof(v20) ~= "buffer" then
        return;
    else
        v4(v20, v21, v19);
        return;
    end;
end;
local function v24(v23) --[[ Line: 52 ]] --[[ Name: playerAdded ]]
    -- upvalues: v9 (copy), v11 (copy), v10 (copy)
    if not v9[v23] then
        v9[v23] = v11();
    end;
    if not v10[v23] then
        v10[v23] = v11();
    end;
end;
return {
    sendAllReliable = function(v25, v26, v27) --[[ Line: 64 ]] --[[ Name: sendAllReliable ]]
        -- upvalues: l_load_0 (copy), v17 (ref), l_alloc_0 (copy), l_u8_0 (copy), v5 (copy)
        l_load_0(v17);
        l_alloc_0(1);
        l_u8_0(v25);
        v26(v27);
        v17 = v5.export();
    end, 
    sendAllUnreliable = function(v28, v29, v30) --[[ Line: 74 ]] --[[ Name: sendAllUnreliable ]]
        -- upvalues: l_load_0 (copy), v18 (ref), v11 (copy), l_alloc_0 (copy), l_u8_0 (copy), v5 (copy)
        l_load_0(v18 or v11());
        l_alloc_0(1);
        l_u8_0(v28);
        v29(v30);
        v18 = v5.export();
    end, 
    sendPlayerReliable = function(v31, v32, v33, v34) --[[ Line: 84 ]] --[[ Name: sendPlayerReliable ]]
        -- upvalues: l_load_0 (copy), v9 (copy), v11 (copy), l_alloc_0 (copy), l_u8_0 (copy), v5 (copy)
        l_load_0(v9[v31] or v11());
        l_alloc_0(1);
        l_u8_0(v32);
        v33(v34);
        v9[v31] = v5.export();
    end, 
    sendPlayerUnreliable = function(v35, v36, v37, v38) --[[ Line: 99 ]] --[[ Name: sendPlayerUnreliable ]]
        -- upvalues: l_load_0 (copy), v10 (copy), l_alloc_0 (copy), l_u8_0 (copy), v5 (copy)
        l_load_0(v10[v35]);
        l_alloc_0(1);
        l_u8_0(v36);
        v37(v38);
        v10[v35] = v5.export();
    end, 
    start = function() --[[ Line: 114 ]] --[[ Name: start ]]
        -- upvalues: v22 (copy), l_ReplicatedStorage_0 (copy), l_Players_0 (copy), v9 (copy), v11 (copy), v10 (copy), v24 (copy), l_RunService_0 (copy), v17 (ref), v18 (ref)
        local l_RemoteEvent_0 = Instance.new("RemoteEvent");
        l_RemoteEvent_0.Name = "ByteNetReliable";
        l_RemoteEvent_0.OnServerEvent:Connect(v22);
        l_RemoteEvent_0.Parent = l_ReplicatedStorage_0;
        local l_UnreliableRemoteEvent_0 = Instance.new("UnreliableRemoteEvent");
        l_UnreliableRemoteEvent_0.Name = "ByteNetUnreliable";
        l_UnreliableRemoteEvent_0.OnServerEvent:Connect(v22);
        l_UnreliableRemoteEvent_0.Parent = l_ReplicatedStorage_0;
        for _, v42 in l_Players_0:GetPlayers() do
            if not v9[v42] then
                v9[v42] = v11();
            end;
            if not v10[v42] then
                v10[v42] = v11();
            end;
        end;
        l_Players_0.PlayerAdded:Connect(v24);
        l_RunService_0.Heartbeat:Connect(function() --[[ Line: 131 ]]
            -- upvalues: v17 (ref), l_RemoteEvent_0 (copy), v18 (ref), l_UnreliableRemoteEvent_0 (copy), l_Players_0 (ref), v9 (ref), v10 (ref)
            if v17.cursor > 0 then
                local l_v17_0 = v17;
                local l_cursor_1 = l_v17_0.cursor;
                local v45 = buffer.create(l_cursor_1);
                buffer.copy(v45, 0, l_v17_0.buff, 0, l_cursor_1);
                local l_v45_0 = v45;
                local v47 = if #l_v17_0.references > 0 then l_v17_0.references else nil;
                l_RemoteEvent_0:FireAllClients(l_v45_0, v47);
                v17.cursor = 0;
                table.clear(v17.references);
            end;
            if v18.cursor > 0 then
                local l_v18_0 = v18;
                local l_cursor_2 = l_v18_0.cursor;
                local v50 = buffer.create(l_cursor_2);
                buffer.copy(v50, 0, l_v18_0.buff, 0, l_cursor_2);
                local l_v50_0 = v50;
                local v52 = if #l_v18_0.references > 0 then l_v18_0.references else nil;
                l_UnreliableRemoteEvent_0:FireAllClients(l_v50_0, v52);
                v18.cursor = 0;
                table.clear(v18.references);
            end;
            for _, v54 in l_Players_0:GetPlayers() do
                if v9[v54].cursor > 0 then
                    local v55 = v9[v54];
                    local l_cursor_3 = v55.cursor;
                    local v57 = buffer.create(l_cursor_3);
                    buffer.copy(v57, 0, v55.buff, 0, l_cursor_3);
                    local l_v57_0 = v57;
                    local v59 = if #v55.references > 0 then v55.references else nil;
                    l_RemoteEvent_0:FireClient(v54, l_v57_0, v59);
                    v9[v54].cursor = 0;
                    table.clear(v9[v54].references);
                end;
                if v10[v54].cursor > 0 then
                    local v60 = v10[v54];
                    local l_cursor_4 = v60.cursor;
                    local v62 = buffer.create(l_cursor_4);
                    buffer.copy(v62, 0, v60.buff, 0, l_cursor_4);
                    local l_v62_0 = v62;
                    local v64 = if #v60.references > 0 then v60.references else nil;
                    l_UnreliableRemoteEvent_0:FireClient(v54, l_v62_0, v64);
                    v10[v54].cursor = 0;
                    table.clear(v10[v54].references);
                end;
            end;
        end);
    end
};