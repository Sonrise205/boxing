local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Parent.namespaces.namespacesDependencies);
local v2 = require(script.Parent.Parent.replicated.values);
local _ = require(script.Parent.Parent.types);
local v4 = l_RunService_0:IsServer() and "server" or "client";
return function(v5) --[[ Line: 13 ]]
    -- upvalues: v4 (copy), v1 (copy), v2 (copy)
    local v6 = {};
    local v7 = {};
    if v4 == "server" then
        local v8 = {};
        local v9 = 0;
        for v10 in v5 do
            v9 = v9 + 1;
            v8[v10] = v9;
            v6[v9] = v5[v10];
            v7[v9] = v10;
        end;
        v1.add(v8);
    elseif v4 == "client" then
        v1.add(v5);
        local v11 = v1.currentName();
        for v12, v13 in v2.access(v11):read().structs[v1.currentLength()] do
            v6[v13] = v5[v12];
            v7[v13] = v12;
        end;
    end;
    return {
        read = function(v14, v15) --[[ Line: 75 ]] --[[ Name: read ]]
            -- upvalues: v5 (copy), v6 (copy), v7 (copy)
            local v16 = table.clone(v5);
            local l_v15_0 = v15;
            for v18, v19 in v6 do
                local v20, v21 = v19.read(v14, l_v15_0);
                v16[v7[v18]] = v20;
                l_v15_0 = l_v15_0 + v21;
            end;
            return v16, l_v15_0 - v15;
        end, 
        write = function(v22) --[[ Line: 90 ]] --[[ Name: write ]]
            -- upvalues: v6 (copy), v7 (copy)
            for v23, v24 in v6 do
                v24.write(v22[v7[v23]]);
            end;
        end
    };
end;