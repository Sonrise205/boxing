local v0 = require(script.Parent.ClientConnection);
local v1 = require(script.Parent.ClientIdentifiers);
local v2 = require(script.Parent.ClientProcess);
local v3 = require(script.Parent.Parent.Constants);
local v4 = require(script.Parent.Parent.Utilities.Output);
local v5 = require(script.Parent.Parent.Parent.TableKit);
local v6 = require(script.Parent.Parent.Parent.RemotePacketSizeCounter);
local _ = require(script.Parent.Parent.Types);
local v8 = require(script.Parent.Parent.Utilities.NetworkUtils);
local v9 = require(script.Parent.Parent.Utilities.tostringData);
local v10 = {};
local v12 = {
    __index = v10, 
    __tostring = function(_) --[[ Line: 22 ]] --[[ Name: __tostring ]]
        return "ClientBridge";
    end
};
v10.RateLimit = function(_) --[[ Line: 33 ]] --[[ Name: RateLimit ]]
    -- upvalues: v4 (copy)
    v4.warn("cannot call :RateLimit() from client");
end;
v10.DisableRateLimit = function(_) --[[ Line: 44 ]] --[[ Name: DisableRateLimit ]]
    -- upvalues: v4 (copy)
    v4.warn("cannot call :DisableRateLimit() from client");
end;
v10.InboundMiddleware = function(v15, v16) --[[ Line: 54 ]] --[[ Name: InboundMiddleware ]]
    -- upvalues: v4 (copy), v5 (copy)
    v4.fatalAssert(tostring(v15) == "ClientBridge", "InboundMiddleware called with . instead of :");
    v4.fatalAssert(typeof(v16) == "table", string.format("InboundMiddleware takes table, got %*", (typeof(v16))));
    v4.warnAssert(v5.IsArray(v16), "InboundMiddleware takes array, got dictionary.");
    v15._inboundMiddleware = v16;
end;
v10.OutboundMiddleware = function(v17, v18) --[[ Line: 71 ]] --[[ Name: OutboundMiddleware ]]
    -- upvalues: v4 (copy), v5 (copy)
    v4.fatalAssert(tostring(v17) == "ClientBridge", "OutboundMiddleware called with . instead of :");
    v4.fatalAssert(typeof(v18) == "table", string.format("OutboundMiddleware takes table, got %*", (typeof(v18))));
    v4.warnAssert(v5.IsArray(v18), "InboundMiddleware takes array, got dictionary.");
    v17._outboundMiddleware = v18;
end;
v10.Fire = function(v19, v20) --[[ Line: 88 ]] --[[ Name: Fire ]]
    -- upvalues: v4 (copy), v3 (copy), v9 (copy), v6 (copy), v2 (copy)
    v4.fatalAssert(tostring(v19) == "ClientBridge", "Fire called with . instead of :");
    if v19._outboundMiddleware ~= nil then
        local l_v20_0 = v20;
        for _, v23 in v19._outboundMiddleware do
            local v24 = v23(l_v20_0);
            if typeof(v24) ~= "table" then
                v4.silent(string.format("Inbound middleware on bridge %* did not return a table; ignoring the return.", v19._name));
            else
                l_v20_0 = v24;
            end;
        end;
        if v19.Logging then
            v4.log((("%*:%*"):format(debug.info(2, "s"), (debug.info(2, "l")))));
            local v25 = string.format(v3.CLIENT_FIRE_LOG, v19._name, v9(l_v20_0), v6.GetDataByteSize(l_v20_0));
            v4.log(v25);
        end;
        v2.addToQueue(v19._identifier, l_v20_0);
        return;
    else
        if v19.Logging then
            v4.log((("%*:%*"):format(debug.info(2, "s"), (debug.info(2, "l")))));
            local v26 = string.format(v3.CLIENT_FIRE_LOG, v19._name, v9(v20), v6.GetDataByteSize(v20));
            v4.log(v26);
        end;
        v2.addToQueue(v19._identifier, v20);
        return;
    end;
end;
v10.Connect = function(v27, v28, v29) --[[ Line: 144 ]] --[[ Name: Connect ]]
    -- upvalues: v4 (copy), v0 (copy), v1 (copy), v3 (copy), v9 (copy), v6 (copy)
    v4.fatalAssert(tostring(v27) == "ClientBridge", "connect called with . instead of :");
    v4.typecheck("function", "Connect", "callback", v28);
    local v30 = debug.info(2, "l");
    local v31 = debug.info(2, "s");
    return v0(v27._identifier, function(v32) --[[ Line: 151 ]]
        -- upvalues: v1 (ref), v27 (copy), v4 (ref), v3 (ref), v29 (copy), v9 (ref), v6 (ref), v31 (copy), v30 (copy), v28 (copy)
        if typeof(v32) == "table" and v32[1] == v1.ref("REQUEST", 3, false) then
            return;
        else
            if v27._inboundMiddleware ~= nil then
                local l_v32_0 = v32;
                for _, v35 in v27._inboundMiddleware do
                    local v36 = v35(l_v32_0);
                    if typeof(v36) ~= "table" then
                        v4.silent(string.format("Inbound middleware on bridge %* did not return a table; ignoring the return.", v27._name));
                    else
                        l_v32_0 = v36;
                    end;
                end;
                if v27.Logging then
                    local v37 = string.format(v3.CLIENT_CONNECT_LOG, v29 or v27._name, v9(l_v32_0), v6.GetDataByteSize(l_v32_0), v31, v30);
                    v4.log(v37);
                end;
                if v29 then
                    debug.profilebegin(v29);
                end;
                v28(l_v32_0);
                if v29 then
                    debug.profileend();
                    return;
                end;
            else
                if v27.Logging then
                    local v38 = string.format(v3.CLIENT_CONNECT_LOG, v29 or v27._name, v9(v32), v6.GetDataByteSize(v32), v31, v30);
                    v4.log(v38);
                end;
                if v29 then
                    debug.profilebegin(v29);
                end;
                v28(v32);
                if v29 then
                    debug.profileend();
                end;
            end;
            return;
        end;
    end);
end;
v10.Wait = function(v39) --[[ Line: 230 ]] --[[ Name: Wait ]]
    -- upvalues: v4 (copy)
    v4.fatalAssert(tostring(v39) == "ClientBridge", "Wait called with . instead of :");
    local v40 = coroutine.running();
    v39:Once(function(v41) --[[ Line: 234 ]]
        -- upvalues: v40 (copy)
        task.spawn(v40, v41);
    end);
    return coroutine.yield();
end;
v10.InvokeServerAsync = function(v42, v43) --[[ Line: 248 ]] --[[ Name: InvokeServerAsync ]]
    -- upvalues: v4 (copy), v8 (copy), v1 (copy), v2 (copy)
    v4.fatalAssert(tostring(v42) == "ClientBridge", "InvokeServerAsync called with . instead of :");
    local v44 = v8.FromHex(v8.CreateUUID());
    v42:Fire({
        v1.ref("REQUEST", 3, false), 
        v44, 
        v43
    });
    local v45 = coroutine.running();
    local v46 = nil;
    v46 = v2.connect(v42._identifier, function(v47) --[[ Line: 257 ]]
        -- upvalues: v1 (ref), v44 (copy), v46 (ref), v45 (copy)
        if typeof(v47) ~= "table" then
            return;
        else
            if v47[1] == v1.ref("REQUEST", 3, false) and v47[2] == v44 then
                v46();
                task.spawn(v45, v47[3]);
            end;
            return;
        end;
    end);
    return coroutine.yield();
end;
v10.Once = function(v48, v49) --[[ Line: 276 ]] --[[ Name: Once ]]
    -- upvalues: v4 (copy)
    v4.fatalAssert(tostring(v48) == "ClientBridge", "Once called with . instead of :");
    local v50 = nil;
    v50 = v48:Connect(function(v51) --[[ Line: 280 ]]
        -- upvalues: v50 (ref), v49 (copy)
        v50:Disconnect();
        v49(v51);
    end);
    return v50;
end;
v10.Destroy = function(v52) --[[ Line: 292 ]] --[[ Name: Destroy ]]
    -- upvalues: v4 (copy)
    v4.fatalAssert(tostring(v52) == "ClientBridge", "Destroy called with . instead of :");
    table.clear(v52);
    setmetatable(v52, nil);
end;
return function(v53) --[[ Line: 299 ]]
    -- upvalues: v1 (copy), v12 (copy), v2 (copy)
    local v54 = setmetatable({
        Logging = false, 
        _identifier = v1.ref(v53, 3, true), 
        _name = v53, 
        _inboundMiddleware = {}, 
        _outboundMiddleware = {}
    }, v12);
    v2.registerBridge(v54._identifier);
    return v54;
end;