local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Parent.replicated.values);
local _ = require(script.Parent.Parent.types);
local v3 = require(script.Parent.namespacesDependencies);
local v4 = require(script.Parent.packetIDs);
local v5 = l_RunService_0:IsServer() and "server" or "client";
local v6 = 0;
return function(v7, v8) --[[ Line: 19 ]]
    -- upvalues: v1 (copy), v3 (copy), v5 (copy), v6 (ref), v4 (copy)
    local v9 = v1.access(v7);
    v3.start(v7);
    local v10 = v8();
    local v11 = v3.empty();
    local v12 = {};
    if v5 == "server" then
        local v13 = {
            structs = {}, 
            packets = {}
        };
        for v14 in v10 do
            v6 = v6 + 1;
            v13.packets[v14] = v6;
            v12[v14] = v10[v14](v6);
            v4.set(v6, v12[v14]);
        end;
        for v15, v16 in v11 do
            v13.structs[v15] = v16;
        end;
        v9:write(v13);
        return v12;
    else
        if v5 == "client" then
            local v17 = v9:read();
            for v18, v19 in v10 do
                v12[v18] = v19(v17.packets[v18]);
                v4.set(v17.packets[v18], v12[v18]);
            end;
        end;
        return v12;
    end;
end;