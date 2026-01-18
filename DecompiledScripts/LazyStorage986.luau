local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TypeGuard_0 = require(l_ReplicatedFirst_0:WaitForChild("TypeGuard"));
local v5 = l_RunService_0:IsServer() and l_ServerStorage_0:WaitForChild("LazyStorage");
local l_LazyStorage_0 = l_ReplicatedStorage_0:WaitForChild("RemoteEvents"):WaitForChild("LazyStorage");
local v7 = {
    _Cache = {}
};
local v8 = l_TypeGuard_0.Params(l_TypeGuard_0.String());
v7.GetServer = function(_, v10) --[[ Line: 16 ]] --[[ Name: GetServer ]]
    -- upvalues: l_RunService_0 (copy), v8 (copy), v5 (copy)
    assert(l_RunService_0:IsServer(), "LazyStorage:GetServer can only be called on the server");
    v8(v10);
    return (v5:FindFirstChild(v10));
end;
local v11 = l_TypeGuard_0.Params(l_TypeGuard_0.String());
v7.Get = function(v12, v13) --[[ Line: 25 ]] --[[ Name: Get ]]
    -- upvalues: v11 (copy), l_RunService_0 (copy), v7 (copy), l_LazyStorage_0 (copy)
    v11(v13);
    if l_RunService_0:IsServer() then
        return v7:GetServer(v13);
    else
        local v14 = v12._Cache[v13];
        if v14 then
            return v14;
        else
            local v15 = l_LazyStorage_0:InvokeServer(v13);
            print(v15);
            if v15 then
                v12._Cache[v13] = v15;
            end;
            return v15;
        end;
    end;
end;
return v7;