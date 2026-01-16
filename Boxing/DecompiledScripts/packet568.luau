--!native
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local _ = require(script.Parent.Parent.types);
local v3 = require(script.Parent.Parent.process.client);
local v4 = require(script.Parent.Parent.process.server);
local v5 = l_RunService_0:IsServer() and "server" or "client";
return function(v6, v7) --[[ Line: 16 ]]
    -- upvalues: v4 (copy), v3 (copy), v5 (copy), l_Players_0 (copy)
    local v8 = {};
    local l_sendPlayerReliable_0 = v4.sendPlayerReliable;
    local l_sendAllReliable_0 = v4.sendAllReliable;
    local l_sendReliable_0 = v3.sendReliable;
    local l_write_0 = v6.value.write;
    local v13 = {};
    setmetatable(v13, {
        __index = function(v14) --[[ Line: 43 ]] --[[ Name: __index ]]
            -- upvalues: v5 (ref)
            if (v14 == "sendTo" or v14 == "sendToAllExcept" or v14 == "sendToAll") and v5 == "client" then
                error("You cannot use sendTo, sendToAllExcept, or sendToAll on the client");
                return;
            else
                if v14 == "send" and v5 == "server" then
                    error("You cannot use send on the server");
                end;
                return;
            end;
        end
    });
    v13.reader = v6.value.read;
    if v5 == "server" then
        v13.sendToList = function(v15, v16) --[[ Line: 59 ]] --[[ Name: sendToList ]]
            -- upvalues: l_sendPlayerReliable_0 (copy), v7 (copy), l_write_0 (copy)
            for _, v18 in v16 do
                l_sendPlayerReliable_0(v18, v7, l_write_0, v15);
            end;
        end;
        v13.sendTo = function(v19, v20) --[[ Line: 65 ]] --[[ Name: sendTo ]]
            -- upvalues: l_sendPlayerReliable_0 (copy), v7 (copy), l_write_0 (copy)
            l_sendPlayerReliable_0(v20, v7, l_write_0, v19);
        end;
        v13.sendToAllExcept = function(v21, v22) --[[ Line: 69 ]] --[[ Name: sendToAllExcept ]]
            -- upvalues: l_Players_0 (ref), l_sendPlayerReliable_0 (copy), v7 (copy), l_write_0 (copy)
            for _, v24 in l_Players_0:GetPlayers() do
                if v24 ~= v22 then
                    l_sendPlayerReliable_0(v24, v7, l_write_0, v21);
                end;
            end;
        end;
        v13.sendToAll = function(v25) --[[ Line: 77 ]] --[[ Name: sendToAll ]]
            -- upvalues: l_sendAllReliable_0 (copy), v7 (copy), l_write_0 (copy)
            l_sendAllReliable_0(v7, l_write_0, v25);
        end;
    elseif v5 == "client" then
        v13.send = function(v26) --[[ Line: 81 ]] --[[ Name: send ]]
            -- upvalues: l_sendReliable_0 (copy), v7 (copy), l_write_0 (copy)
            l_sendReliable_0(v7, l_write_0, v26);
        end;
    end;
    v13.wait = function() --[[ Line: 86 ]] --[[ Name: wait ]]
        -- upvalues: v8 (copy)
        local v27 = nil;
        local v28 = coroutine.running();
        table.insert(v8, function(v29, v30) --[[ Line: 91 ]]
            -- upvalues: v28 (copy), v8 (ref), v27 (ref)
            task.spawn(v28, v29, v30);
            table.remove(v8, v27);
        end);
        v27 = #v8;
        return coroutine.yield();
    end;
    v13.listen = function(v31) --[[ Line: 105 ]] --[[ Name: listen ]]
        -- upvalues: v8 (copy)
        table.insert(v8, v31);
    end;
    v13.getListeners = function() --[[ Line: 109 ]] --[[ Name: getListeners ]]
        -- upvalues: v8 (copy)
        return v8;
    end;
    return v13;
end;