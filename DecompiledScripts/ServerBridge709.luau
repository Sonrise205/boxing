local v0 = require(script.Parent.Parent.Constants);
local v1 = require(script.Parent.Parent.Parent.RemotePacketSizeCounter);
local v2 = require(script.Parent.ServerProcess);
local v3 = require(script.Parent.Parent.Parent.TableKit);
local _ = require(script.Parent.Parent.Types);
local v5 = require(script.Parent.Parent.Utilities.Output);
local v6 = require(script.Parent.Parent.Utilities.tostringData);
local v7 = require(script.Parent.PlayerContainers);
local v8 = require(script.Parent.ServerConnection);
local v9 = require(script.Parent.ServerIdentifiers);
local v10 = {};
local v12 = {
    __index = v10, 
    __tostring = function(_) --[[ Line: 31 ]] --[[ Name: __tostring ]]
        return "ServerBridge";
    end
};
v10.InboundMiddleware = function(v13, v14) --[[ Line: 41 ]] --[[ Name: InboundMiddleware ]]
    -- upvalues: v5 (copy)
    v5.fatalAssert(tostring(v13) == "ServerBridge", "InboundMiddleware called with . instead of :");
    v13._inboundMiddleware = v14;
end;
v10.OutboundMiddleware = function(v15, v16) --[[ Line: 52 ]] --[[ Name: OutboundMiddleware ]]
    -- upvalues: v5 (copy)
    v5.fatalAssert(tostring(v15) == "ServerBridge", "OutboundMiddleware called with . instead of :");
    v15._outboundMiddleware = v16;
end;
v10.Connect = function(v17, v18, v19) --[[ Line: 66 ]] --[[ Name: Connect ]]
    -- upvalues: v5 (copy), v8 (copy), v9 (copy), v0 (copy), v6 (copy), v1 (copy)
    v5.fatalAssert(tostring(v17) == "ServerBridge", "Connect called with . instead of :");
    v5.typecheck("function", "Connect", "callback", v18);
    local v20 = debug.info(2, "l");
    local v21 = debug.info(2, "s");
    return v8(v17._identifier, function(v22, v23) --[[ Line: 73 ]]
        -- upvalues: v9 (ref), v17 (copy), v5 (ref), v0 (ref), v19 (copy), v6 (ref), v1 (ref), v21 (copy), v20 (copy), v18 (copy)
        if typeof(v23) == "table" and v23[1] == v9.ref("REQUEST") then
            return;
        else
            if v17.RateLimitActive then
                local v24 = math.round(os.clock() - os.clock() % 1);
                if v17._rateMap[v22] ~= nil then
                    if (v17._rateMap[v22][1] or 0) ~= v24 then
                        v17._rateMap[v22][2] = 0;
                        v17._rateMap[v22][1] = v24;
                    else
                        local v25 = v17._rateMap[v22];
                        v25[2] = v25[2] + 1;
                    end;
                else
                    v17._rateMap[v22] = {
                        v24, 
                        1
                    };
                end;
                if v17._rateMap[v22][2] >= v17._maxRate and not v17._overflowFunction(v22) then
                    return;
                end;
            end;
            if v17._inboundMiddleware ~= nil then
                local l_v23_0 = v23;
                for _, v28 in v17._inboundMiddleware do
                    local v29 = v28(v22, l_v23_0);
                    if typeof(v29) ~= "table" then
                        v5.silent(string.format("Inbound middleware on bridge %* did not return a table; ignoring the return.", v17._name));
                    else
                        l_v23_0 = v29;
                    end;
                end;
                if v17.Logging then
                    local v30 = string.format(v0.SERVER_CONNECT_LOG, v19 or v17._name, v22.Name, v6(v23), v1.GetDataByteSize(v23), v21, v20);
                    v5.log(v30);
                end;
                if v19 then
                    debug.profilebegin(v19);
                end;
                v18(v22, l_v23_0);
                if v19 then
                    debug.profileend();
                    return;
                end;
            else
                if v17.Logging then
                    local v31 = string.format(v0.SERVER_CONNECT_LOG, v19 or v17._name, v22.Name, v6(v23), v1.GetDataByteSize(v23), v21, v20);
                    v5.log(v31);
                end;
                if v19 then
                    debug.profilebegin(v19);
                end;
                v18(v22, v23);
                if v19 then
                    debug.profileend();
                end;
            end;
            return;
        end;
    end);
end;
v10.RateLimit = function(v32, v33, v34) --[[ Line: 175 ]] --[[ Name: RateLimit ]]
    -- upvalues: v5 (copy)
    v5.fatalAssert(tostring(v32) == "ServerBridge", "RateLimit called with . instead of :");
    v32.RateLimitActive = true;
    v32._overflowFunction = v34;
    v32._maxRate = v33;
end;
v10.DisableRateLimit = function(v35) --[[ Line: 186 ]] --[[ Name: DisableRateLimit ]]
    -- upvalues: v5 (copy)
    v5.fatalAssert(tostring(v35) == "ServerBridge", "DisableRateLimit called with . instead of :");
    v35.RateLimitActive = false;
end;
v10.Wait = function(v36) --[[ Line: 198 ]] --[[ Name: Wait ]]
    -- upvalues: v5 (copy)
    v5.fatalAssert(tostring(v36) == "ServerBridge", "Wait called with . instead of :");
    local v37 = coroutine.running();
    v36:Connect(function(v38, v39) --[[ Line: 201 ]]
        -- upvalues: v37 (copy)
        task.spawn(v37, v38, v39);
    end);
    return coroutine.yield();
end;
v10.Once = function(v40, v41) --[[ Line: 214 ]] --[[ Name: Once ]]
    -- upvalues: v5 (copy)
    v5.fatalAssert(tostring(v40) == "ServerBridge", "Once called with . instead of :");
    v5.typecheck("function", "Once", "callback", v41);
    local v42 = nil;
    v42 = v40:Connect(function(v43, v44) --[[ Line: 219 ]]
        -- upvalues: v42 (ref), v41 (copy)
        v42:Disconnect();
        v41(v43, v44);
    end);
    return v42;
end;
v10.Fire = function(v45, v46, v47) --[[ Line: 233 ]] --[[ Name: Fire ]]
    -- upvalues: v5 (copy), v7 (copy), v0 (copy), v3 (copy), v6 (copy), v1 (copy), v2 (copy)
    v5.fatalAssert(tostring(v45) == "ServerBridge", "Fire called with . instead of :");
    local v48 = nil;
    if typeof(v46) == "Instance" then
        if v46:IsA("Player") then
            v48 = v7.Single(v46);
        else
            v5.fatal("non-player instance passed into :Fire()");
        end;
    else
        if typeof(v46) == "nil" then
            v5.fatal("target parameter passed into ServerBridge:Fire() is nil");
        end;
        v5.typecheck("table", "Fire", "target", v46);
        v48 = v46;
    end;
    if v45._outboundMiddleware ~= nil then
        local l_v47_0 = v47;
        for _, v51 in v45._outboundMiddleware do
            local v52 = v51(l_v47_0);
            if typeof(v52) ~= "table" then
                v5.silent(string.format("Outbound middleware on bridge %* did not return a table; ignoring the return.", v45._name));
            else
                l_v47_0 = v52;
            end;
        end;
        if v45.Logging then
            v5.log((("%*:%*"):format(debug.info(2, "s"), (debug.info(2, "l")))));
            local v53 = string.format(v0.SERVER_FIRE_LOG, v45._name, v48.kind == "all" and "{all}" or if v48.kind == "single" then v48.value.Name else v3.ToArrayString(v48.value), v6(l_v47_0), v1.GetDataByteSize(l_v47_0));
            v5.log(v53);
        end;
        v2.addToQueue(v48, v45._identifier, l_v47_0);
        return;
    else
        if v45.Logging then
            v5.log((("%*:%*"):format(debug.info(2, "s"), (debug.info(2, "l")))));
            local v54 = string.format(v0.SERVER_FIRE_LOG, v45._name, v48.kind == "all" and "{all}" or if v48.kind == "single" then v48.value.Name else v3.ToArrayString(v48.value), v6(v47), v1.GetDataByteSize(v47));
            v5.log(v54);
        end;
        v2.addToQueue(v48, v45._identifier, v47);
        return;
    end;
end;
return function(v55) --[[ Line: 306 ]]
    -- upvalues: v9 (copy), v12 (copy), v2 (copy)
    local v56 = setmetatable({
        _identifier = v9.ref(v55), 
        _outboundMiddleware = nil, 
        _inboundMiddleware = nil, 
        _name = v55, 
        Logging = false, 
        OnServerInvoke = function() --[[ Line: 318 ]]

        end, 
        RateLimitActive = false, 
        _maxRate = 500, 
        _rateMap = {}, 
        _overflowFunction = function() --[[ Line: 324 ]] --[[ Name: _overflowFunction ]]
            return false;
        end
    }, v12);
    v2.registerBridge(v56._identifier);
    v2.connect(v56._identifier, function(v57, v58) --[[ Line: 331 ]]
        -- upvalues: v56 (copy), v9 (ref)
        if typeof(v58) ~= "table" then
            return;
        else
            if v56.OnServerInvoke ~= nil and v58[1] == v9.ref("REQUEST") then
                local v59 = v56.OnServerInvoke(v57, v58[3]);
                v56:Fire(v57, {
                    v9.ref("REQUEST"), 
                    v58[2], 
                    v59
                });
            end;
            return;
        end;
    end);
    return v56;
end;