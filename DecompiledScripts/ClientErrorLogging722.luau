local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ScriptContext_0 = game:GetService("ScriptContext");
local l_LogService_0 = game:GetService("LogService");
local l_Players_0 = game:GetService("Players");
local l_Async_0 = require(l_ReplicatedFirst_0:WaitForChild("Async"));
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
local l_ClientError_0 = l_ReplicatedStorage_0:WaitForChild("ClientError");
local function v11(v8) --[[ Line: 12 ]] --[[ Name: ReplacePlayerNames ]]
    -- upvalues: l_Players_0 (copy)
    assert(v8 and typeof(v8) == "string", "Expected ErrorMessage to be a string");
    for _, v10 in l_Players_0:GetPlayers() do
        if v8:find(v10.Name) then
            v8 = v8:gsub(v10.Name, "<Player>");
        end;
    end;
    return v8;
end;
local v12 = {};
local function v13() --[[ Line: 26 ]] --[[ Name: FireLogs ]]
    -- upvalues: v12 (copy), l_ClientError_0 (copy)
    if #v12 > 0 then
        l_ClientError_0:FireServer(v12);
        table.clear(v12);
    end;
end;
l_ScriptContext_0.Error:Connect(function(v14, v15, _) --[[ Line: 33 ]]
    -- upvalues: v12 (copy), v11 (copy), l_ClientError_0 (copy)
    table.insert(v12, {
        Time = os.time(os.date("!*t")) * 1000 * 1000 * 1000, 
        Type = Enum.MessageType.MessageError, 
        Message = v11(v14), 
        StackTrace = v11(v15)
    });
    if time() < 60 and #v12 > 0 then
        l_ClientError_0:FireServer(v12);
        table.clear(v12);
    end;
end);
l_LogService_0.MessageOut:Connect(function(v17, v18) --[[ Line: 46 ]]
    -- upvalues: v12 (copy), v11 (copy)
    if v18 == Enum.MessageType.MessageWarning then
        table.insert(v12, {
            Time = os.time(os.date("!*t")) * 1000 * 1000 * 1000, 
            Type = v18, 
            Message = v11(v17)
        });
    end;
end);
if game.PlaceId == l_Places_0.Ranked then
    l_Async_0.Timer(10, v13, "ErrorLogging");
    return;
else
    l_Async_0.Timer(60, v13, "ErrorLogging");
    return;
end;