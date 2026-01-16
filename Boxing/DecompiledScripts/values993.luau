local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script.Parent.replicatedValue);
local v3 = l_RunService_0:IsServer() and "server" or "client";
local v4 = nil;
local v5 = {};
return {
    start = function() --[[ Line: 14 ]] --[[ Name: start ]]
        -- upvalues: v3 (copy), l_ReplicatedStorage_0 (copy), v4 (ref)
        if v3 == "server" then
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "BytenetStorage";
            l_Folder_0.Parent = l_ReplicatedStorage_0;
            v4 = l_Folder_0;
            return;
        else
            if v3 == "client" then
                v4 = l_ReplicatedStorage_0:WaitForChild("BytenetStorage");
            end;
            return;
        end;
    end, 
    access = function(v7) --[[ Line: 26 ]] --[[ Name: access ]]
        -- upvalues: v5 (copy), v3 (copy), v4 (ref), v2 (copy)
        if v5[v7] then
            return v5[v7];
        else
            if v3 == "client" then
                local l_v4_FirstChild_0 = v4:FindFirstChild(v7);
                if l_v4_FirstChild_0 and l_v4_FirstChild_0:IsA("StringValue") then
                    local v9 = v2(l_v4_FirstChild_0);
                    v5[v7] = v9;
                    return v9;
                end;
            elseif v3 == "server" then
                local l_StringValue_0 = Instance.new("StringValue");
                l_StringValue_0.Name = v7;
                l_StringValue_0.Parent = v4;
                local v11 = v2(l_StringValue_0);
                v5[v7] = v11;
                return v11;
            end;
            return v5[v7];
        end;
    end
};