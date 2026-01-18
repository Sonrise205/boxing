if not script then
    script = game:GetService("ReplicatedFirst").XSignal;
end;
local l_Connection_0 = require(script:WaitForChild("Connection"));
local l_TypeGuard_0 = require(script.Parent:WaitForChild("TypeGuard"));
local function v2() --[[ Line: 13 ]] --[[ Name: EmptyFunction ]]

end;
local v3 = l_TypeGuard_0.RBXScriptSignal():Or(l_TypeGuard_0.Object({
    Connect = l_TypeGuard_0.Function(), 
    Wait = l_TypeGuard_0.Function(), 
    Fire = l_TypeGuard_0.Function()
}));
local function v6(...) --[[ Line: 68 ]] --[[ Name: ErrorPcall ]]
    local l_status_0, l_result_0 = pcall(...);
    if not l_status_0 then
        task.spawn(error, l_result_0);
    end;
end;
local v7 = {};
v7.__index = v7;
local v8 = l_TypeGuard_0.Params(l_TypeGuard_0.Function():Optional(), l_TypeGuard_0.Function():Optional());
v7.new = function(v9, v10) --[[ Line: 83 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), v2 (copy), v7 (copy)
    v8(v9, v10);
    local v11 = setmetatable({
        _ConnectionCount = 0, 
        _Validator = v9, 
        _Immediate = v10, 
        _HeadConnection = false, 
        _OnConnectionsEmpty = v2, 
        _OnConnectionsPresent = v2, 
        Event = false
    }, v7);
    v11.Event = v11;
    return v11;
end;
v7.fromImmediate = function(v12) --[[ Line: 106 ]] --[[ Name: fromImmediate ]]
    -- upvalues: v7 (copy)
    return v7.new(nil, v12);
end;
local v13 = l_TypeGuard_0.Params(l_TypeGuard_0.Array(v3):MinLength(1):Or(v3));
v7.fromExtension = function(v14, ...) --[[ Line: 112 ]] --[[ Name: fromExtension ]]
    -- upvalues: v13 (copy), v7 (copy)
    v13(v14);
    if not v14[1] then
        v14 = {
            v14
        };
    end;
    local v15 = v7.new(...);
    local v16 = table.create(#v14);
    v15._OnConnectionsEmpty = function() --[[ Line: 126 ]]
        -- upvalues: v16 (copy)
        for v17, v18 in v16 do
            v18:Disconnect();
            v16[v17] = nil;
        end;
    end;
    v15._OnConnectionsPresent = function() --[[ Line: 134 ]]
        -- upvalues: v14 (ref), v16 (copy), v15 (copy)
        for v19, v20 in v14 do
            assert(v16[v19] == nil, ("Connection already created in slot %d"):format(v19));
            v16[v19] = v20:Connect(function(...) --[[ Line: 138 ]]
                -- upvalues: v15 (ref)
                v15:Fire(...);
            end);
        end;
    end;
    return v15;
end;
local v21 = l_TypeGuard_0.Params(l_TypeGuard_0.Function():Optional());
v7.Connect = function(v22, v23) --[[ Line: 149 ]] --[[ Name: Connect ]]
    -- upvalues: v21 (copy), l_Connection_0 (copy), v6 (copy)
    v21(v23);
    local v24 = l_Connection_0.new(v22, v23);
    v24:Reconnect();
    local l__Immediate_0 = v22._Immediate;
    if l__Immediate_0 then
        task.spawn(v6, l__Immediate_0, function(...) --[[ Line: 163 ]] --[[ Name: Wrapped ]]
            -- upvalues: v24 (copy), v22 (copy), v23 (copy)
            if v24.Connected then
                local l__Validator_0 = v22._Validator;
                if l__Validator_0 then
                    l__Validator_0(...);
                end;
                return v23(...);
            else
                return nil;
            end;
        end);
    end;
    return v24;
end;
v7.connect = v7.Connect;
local v27 = l_TypeGuard_0.Params(l_TypeGuard_0.Function():Optional());
v7.Once = function(v28, v29) --[[ Line: 186 ]] --[[ Name: Once ]]
    -- upvalues: v27 (copy)
    v27(v29);
    local v30 = nil;
    local v31 = nil;
    v31 = v28:Connect(function(...) --[[ Line: 193 ]]
        -- upvalues: v30 (ref), v31 (ref), v29 (copy)
        if v30 then
            return;
        else
            v30 = true;
            if v31 then
                v31:Disconnect();
            end;
            v29(...);
            return;
        end;
    end);
    if v30 then
        v31:Disconnect();
    end;
    return v31;
end;
v7.Fire = function(v32, ...) --[[ Line: 215 ]] --[[ Name: Fire ]]
    debug.profilebegin("XSignal.Fire");
    local l__Validator_1 = v32._Validator;
    if l__Validator_1 then
        l__Validator_1(...);
    end;
    local l__HeadConnection_0 = v32._HeadConnection;
    while l__HeadConnection_0 do
        task.spawn(l__HeadConnection_0.Callback, ...);
        l__HeadConnection_0 = l__HeadConnection_0._Next;
    end;
    debug.profileend();
end;
v7.fire = v7.Fire;
local v35 = l_TypeGuard_0.Params(l_TypeGuard_0.Number():Optional(), l_TypeGuard_0.Boolean():Optional());
v7.Wait = function(v36, v37, v38) --[[ Line: 238 ]] --[[ Name: Wait ]]
    -- upvalues: v35 (copy)
    v35(v37, v38);
    v37 = v37 or 120;
    local v39 = false;
    local v40 = false;
    local v41 = false;
    local v42 = nil;
    local v43 = coroutine.running();
    local v44 = v36:Connect(function(...) --[[ Line: 252 ]]
        -- upvalues: v42 (ref), v39 (ref), v41 (ref), v43 (copy)
        v42 = {
            ...
        };
        if not v39 or v41 then
            return;
        else
            task.spawn(v43);
            return;
        end;
    end);
    if v42 ~= nil then
        v44:Disconnect();
        return unpack(v42);
    else
        if v37 ~= 1e999 then
            task.delay(v37, function() --[[ Line: 268 ]]
                -- upvalues: v40 (ref), v42 (ref), v41 (ref), v43 (copy)
                if v40 then
                    return;
                else
                    v42 = {};
                    v41 = true;
                    task.spawn(v43);
                    return;
                end;
            end);
        end;
        v39 = true;
        coroutine.yield();
        v44:Disconnect();
        v40 = true;
        if v41 and v38 then
            error(("Wait call timed out (time elapsed: %d)"):format(v37));
        end;
        return unpack(v42);
    end;
end;
v7.wait = v7.Wait;
local v45 = l_TypeGuard_0.Params(l_TypeGuard_0.Number(), l_TypeGuard_0.Number():Optional(), l_TypeGuard_0.Boolean():Optional());
v7.CollectFull = function(v46, v47, v48, v49) --[[ Line: 295 ]] --[[ Name: CollectFull ]]
    -- upvalues: v45 (copy)
    v45(v47, v48, v49);
    v48 = v48 or 120;
    local v50 = table.create(v47);
    local v51 = coroutine.running();
    local v52 = false;
    local v53 = false;
    local v54 = false;
    local v55 = nil;
    v55 = v46:Connect(function(...) --[[ Line: 309 ]]
        -- upvalues: v53 (ref), v47 (ref), v50 (copy), v52 (ref), v51 (copy)
        if not v53 and v47 > 0 then
            v47 = v47 - 1;
            table.insert(v50, {
                ...
            });
        end;
        if v47 == 0 and v52 and not v53 then
            task.spawn(v51);
        end;
    end);
    task.delay(v48, function() --[[ Line: 320 ]]
        -- upvalues: v53 (ref), v54 (ref), v51 (copy)
        if v53 then
            return;
        else
            v54 = true;
            task.spawn(v51);
            return;
        end;
    end);
    v52 = true;
    if v47 > 0 then
        coroutine.yield();
    end;
    v53 = true;
    v55:Disconnect();
    if v54 and v49 then
        error(("Wait call timed out (time elapsed: %d)"):format(v48));
    end;
    return v50;
end;
local v56 = l_TypeGuard_0.Params(l_TypeGuard_0.Number(), l_TypeGuard_0.Number():Optional(), l_TypeGuard_0.Boolean():Optional());
v7.Collect = function(v57, v58, v59, v60) --[[ Line: 348 ]] --[[ Name: Collect ]]
    -- upvalues: v56 (copy)
    v56(v58, v59, v60);
    local v61 = table.create(v58);
    for v62, v63 in v57:CollectFull(v58, v59, v60) do
        v61[v62] = v63[1];
    end;
    return v61;
end;
v7.WaitIndefinite = function(v64) --[[ Line: 363 ]] --[[ Name: WaitIndefinite ]]
    return v64:Wait(1e999);
end;
v7.waitIndefinite = v7.WaitIndefinite;
v7.Destroy = function(v65) --[[ Line: 369 ]] --[[ Name: Destroy ]]
    local l__HeadConnection_1 = v65._HeadConnection;
    while l__HeadConnection_1 do
        l__HeadConnection_1:Disconnect();
        l__HeadConnection_1 = l__HeadConnection_1._Next;
    end;
end;
v7.DisconnectAll = v7.Destroy;
v7.disconnectAll = v7.Destroy;
local v67 = l_TypeGuard_0.Params(l_TypeGuard_0.Array(v3):MinLength(1), l_TypeGuard_0.Number():Optional(), l_TypeGuard_0.Boolean():Optional());
v7.AwaitFirst = function(v68, v69, v70) --[[ Line: 382 ]] --[[ Name: AwaitFirst ]]
    -- upvalues: v67 (copy)
    v67(v68, v69, v70);
    v69 = v69 or 120;
    local v71 = coroutine.running();
    local v72 = table.create(#v68);
    local v73 = false;
    local v74 = false;
    local v75 = false;
    local v76 = nil;
    for v77, v78 in v68 do
        v72[v77] = v78:Connect(function(...) --[[ Line: 399 ]]
            -- upvalues: v76 (ref), v73 (ref), v74 (ref), v71 (copy)
            if v76 == nil then
                v76 = {
                    ...
                };
            end;
            if v73 and not v74 then
                task.spawn(v71);
            end;
        end);
        if v76 then
            break;
        end;
    end;
    task.delay(v69, function() --[[ Line: 414 ]]
        -- upvalues: v74 (ref), v76 (ref), v75 (ref), v71 (copy)
        if v74 then
            return;
        else
            v76 = {};
            v75 = true;
            task.spawn(v71);
            return;
        end;
    end);
    v73 = true;
    if not v76 then
        coroutine.yield();
    end;
    v74 = true;
    for _, v80 in v72 do
        v80:Disconnect();
    end;
    if v75 and v70 then
        error(("Wait call timed out (time elapsed: %d)"):format(v69));
    end;
    return unpack(v76);
end;
v7.awaitFirst = v7.AwaitFirst;
local v81 = l_TypeGuard_0.Params(l_TypeGuard_0.Array(v3):MinLength(1), l_TypeGuard_0.Number():Optional(), l_TypeGuard_0.Boolean():Optional());
v7.AwaitAllFull = function(v82, v83, v84) --[[ Line: 447 ]] --[[ Name: AwaitAllFull ]]
    -- upvalues: v81 (copy)
    v81(v82, v83, v84);
    v83 = v83 or 120;
    local v85 = #v82;
    local v86 = 0;
    local v87 = table.create(v85);
    local v88 = table.create(v85);
    local v89 = coroutine.running();
    local v90 = false;
    local v91 = false;
    local v92 = false;
    local v93 = 0;
    for v94, v95 in v82 do
        local v96 = false;
        do
            local l_v96_0 = v96;
            v88[v94] = v95:Connect(function(...) --[[ Line: 470 ]]
                -- upvalues: l_v96_0 (ref), v86 (ref), v87 (copy), v94 (copy), v85 (copy), v90 (ref), v91 (ref), v89 (copy)
                if l_v96_0 then
                    return;
                else
                    l_v96_0 = true;
                    v86 = v86 + 1;
                    v87[v94] = {
                        ...
                    };
                    if v86 == v85 and v90 and not v91 then
                        task.spawn(v89);
                    end;
                    return;
                end;
            end);
            if l_v96_0 then
                v93 = v93 + 1;
            end;
        end;
    end;
    task.delay(v83, function() --[[ Line: 490 ]]
        -- upvalues: v91 (ref), v93 (ref), v85 (copy), v92 (ref), v89 (copy)
        if v91 then
            return;
        else
            v93 = v85;
            v92 = true;
            task.spawn(v89);
            return;
        end;
    end);
    v90 = true;
    if v93 ~= v85 then
        coroutine.yield();
    end;
    v91 = true;
    for _, v99 in v88 do
        v99:Disconnect();
    end;
    if v92 and v84 then
        error(("Wait call timed out (time elapsed: %d)"):format(v83));
    end;
    return v87;
end;
v7.awaitAllFull = v7.AwaitAllFull;
local v100 = l_TypeGuard_0.Params(l_TypeGuard_0.Array(v3):MinLength(1), l_TypeGuard_0.Number():Optional(), l_TypeGuard_0.Boolean():Optional());
v7.AwaitAll = function(v101, v102, v103) --[[ Line: 523 ]] --[[ Name: AwaitAll ]]
    -- upvalues: v100 (copy), v7 (copy)
    v100(v101, v102, v103);
    local v104 = v7.AwaitAllFull(v101, v102, v103);
    local v105 = table.create(#v104);
    for v106, v107 in v104 do
        v105[v106] = v107[1];
    end;
    return v105;
end;
v7.awaitAll = v7.AwaitAll;
return v7;