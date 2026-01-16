local l_HttpService_0 = game:GetService("HttpService");
local v1 = game:GetService("RunService"):IsServer() and "server" or "client";
local v2 = {};
local v3 = {
    __index = v2
};
v2.write = function(v4, v5) --[[ Line: 16 ]] --[[ Name: write ]]
    -- upvalues: v1 (copy), l_HttpService_0 (copy)
    assert(v1 == "server", "cannot write to replicatdvalue on client");
    v4._luauData = v5;
    v4._value.Value = l_HttpService_0:JSONEncode(v5);
end;
v2.read = function(v6) --[[ Line: 25 ]] --[[ Name: read ]]
    return v6._luauData;
end;
return function(v7) --[[ Line: 29 ]]
    -- upvalues: v3 (copy), v1 (copy), l_HttpService_0 (copy)
    local v8 = setmetatable({}, v3);
    v8._luauData = {};
    v8._value = v7;
    if v1 == "client" then
        v8._luauData = table.freeze(l_HttpService_0:JSONDecode(v7.Value));
        v7.Changed:Connect(function(v9) --[[ Line: 40 ]]
            -- upvalues: v8 (copy), l_HttpService_0 (ref)
            if not v9 then
                return;
            else
                v8._luauData = table.freeze(l_HttpService_0:JSONDecode(v9));
                return;
            end;
        end);
    end;
    return v8;
end;