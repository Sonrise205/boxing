local v0 = require(script.Parent.MockConnection);
local v1 = require(script.Parent.Parent.Constants);
local v2 = require(script.Parent.Parent.Utilities.Output);
local v3 = require(script.Parent.Parent.Parent.TableKit);
local v4 = require(script.Parent.Parent.Parent.RemotePacketSizeCounter);
local _ = require(script.Parent.Parent.Types);
local v6 = require(script.Parent.Parent.Utilities.tostringData);
local v7 = {};
local v9 = {
    __index = v7, 
    __tostring = function(_) --[[ Line: 14 ]] --[[ Name: __tostring ]]
        return "ClientBridge";
    end
};
v7.RateLimit = function(_) --[[ Line: 18 ]] --[[ Name: RateLimit ]]
    -- upvalues: v2 (copy)
    v2.warn("cannot call :RateLimit() from client");
end;
v7.DisableRateLimit = function(_) --[[ Line: 22 ]] --[[ Name: DisableRateLimit ]]
    -- upvalues: v2 (copy)
    v2.warn("cannot call :DisableRateLimit() from client");
end;
v7.InboundMiddleware = function(v12, v13) --[[ Line: 26 ]] --[[ Name: InboundMiddleware ]]
    -- upvalues: v2 (copy), v3 (copy)
    v2.fatalAssert(tostring(v12) == "ClientBridge", "InboundMiddleware called with . instead of :");
    v2.fatalAssert(typeof(v13) == "table", string.format("InboundMiddleware takes table, got %*", (typeof(v13))));
    v2.warnAssert(v3.IsArray(v13), "InboundMiddleware takes array, got dictionary.");
    v12._inboundMiddleware = v13;
end;
v7.OutboundMiddleware = function(v14, v15) --[[ Line: 37 ]] --[[ Name: OutboundMiddleware ]]
    -- upvalues: v2 (copy), v3 (copy)
    v2.fatalAssert(tostring(v14) == "ClientBridge", "OutboundMiddleware called with . instead of :");
    v2.fatalAssert(typeof(v15) == "table", string.format("OutboundMiddleware takes table, got %*", (typeof(v15))));
    v2.warnAssert(v3.IsArray(v15), "InboundMiddleware takes array, got dictionary.");
    v14._outboundMiddleware = v15;
end;
v7.Fire = function(v16, v17) --[[ Line: 48 ]] --[[ Name: Fire ]]
    -- upvalues: v2 (copy), v1 (copy), v6 (copy), v4 (copy)
    v2.fatalAssert(tostring(v16) == "ClientBridge", "Fire called with . instead of :");
    if v16.Logging then
        local v18 = string.format(v1.CLIENT_FIRE_LOG, v16._name, v6(v17), v4.GetDataByteSize(v17));
        v2.log(v18);
    end;
end;
v7.Connect = function(v19, v20) --[[ Line: 62 ]] --[[ Name: Connect ]]
    -- upvalues: v2 (copy), v0 (copy)
    v2.fatalAssert(tostring(v19) == "ClientBridge", "connect called with . instead of :");
    v2.typecheck("function", "Connect", "callback", v20);
    return v0();
end;
v7.Wait = function(v21) --[[ Line: 69 ]] --[[ Name: Wait ]]
    -- upvalues: v2 (copy)
    v2.fatalAssert(tostring(v21) == "ClientBridge", "Wait called with . instead of :");
    local v22 = coroutine.running();
    v21:Once(function(v23) --[[ Line: 73 ]]
        -- upvalues: v22 (copy)
        task.spawn(v22, v23);
    end);
    return coroutine.yield();
end;
v7.InvokeServerAsync = function(v24, _) --[[ Line: 79 ]] --[[ Name: InvokeServerAsync ]]
    -- upvalues: v2 (copy)
    v2.fatalAssert(tostring(v24) == "ClientBridge", "InvokeServerAsync called with . instead of :");
    return coroutine.yield();
end;
v7.Once = function(v26, _) --[[ Line: 85 ]] --[[ Name: Once ]]
    -- upvalues: v2 (copy), v0 (copy)
    v2.fatalAssert(tostring(v26) == "ClientBridge", "Once called with . instead of :");
    return v0();
end;
v7.Destroy = function(v28) --[[ Line: 91 ]] --[[ Name: Destroy ]]
    -- upvalues: v2 (copy)
    v2.fatalAssert(tostring(v28) == "ClientBridge", "Destroy called with . instead of :");
    table.clear(v28);
    setmetatable(v28, nil);
end;
return function(v29) --[[ Line: 98 ]]
    -- upvalues: v9 (copy)
    return (setmetatable({
        Logging = false, 
        _identifier = v29, 
        _name = v29, 
        _inboundMiddleware = {}, 
        _outboundMiddleware = {}
    }, v9));
end;