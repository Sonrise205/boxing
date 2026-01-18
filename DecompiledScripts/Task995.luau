if not script then
    script = game:GetService("ReplicatedFirst").Async;
end;
local v0 = require(script.Parent);
local l_GetDescendants_0 = v0.GetDescendants;
local l_ResolveRoot_0 = v0.ResolveRoot;
local l_SpawnTimed_0 = v0.SpawnTimed;
local l_AwaitFirst_0 = v0.AwaitFirst;
local l_CancelRoot_0 = v0.CancelRoot;
local l_AwaitAll_0 = v0.AwaitAll;
local l_Results_0 = v0.Results;
local l_Resolve_0 = v0.Resolve;
local l_Cancel_0 = v0.Cancel;
local l_Delay_0 = v0.Delay;
local l_Defer_0 = v0.Defer;
local l_Spawn_0 = v0.Spawn;
local l_Await_0 = v0.Await;
local v14 = {};
v14.__index = v14;
v14.usingDelay = function(v15, v16, ...) --[[ Line: 49 ]] --[[ Name: usingDelay ]]
    -- upvalues: l_Delay_0 (copy), v14 (copy)
    return (setmetatable({
        _Thread = l_Delay_0(v15, v16, ...)
    }, v14));
end;
v14.usingDefer = function(v17, ...) --[[ Line: 58 ]] --[[ Name: usingDefer ]]
    -- upvalues: l_Defer_0 (copy), v14 (copy)
    return (setmetatable({
        _Thread = l_Defer_0(v17, ...)
    }, v14));
end;
v14.usingTimeLimit = function(v18, v19, v20) --[[ Line: 67 ]] --[[ Name: usingTimeLimit ]]
    -- upvalues: l_SpawnTimed_0 (copy), v14 (copy)
    return (setmetatable({
        _Thread = l_SpawnTimed_0(v18, v19, v20)
    }, v14));
end;
v14.usingSpawn = function(v21, ...) --[[ Line: 75 ]] --[[ Name: usingSpawn ]]
    -- upvalues: l_Spawn_0 (copy), v14 (copy)
    return (setmetatable({
        _Thread = l_Spawn_0(v21, ...)
    }, v14));
end;
v14.new = v14.usingTimeLimit;
v14.DidComplete = function(v22) --[[ Line: 88 ]] --[[ Name: DidComplete ]]
    -- upvalues: l_Results_0 (copy)
    return l_Results_0(v22._Thread) ~= nil;
end;
v14.DidSucceed = function(v23) --[[ Line: 94 ]] --[[ Name: DidSucceed ]]
    -- upvalues: l_Results_0 (copy)
    return l_Results_0(v23._Thread) == true;
end;
v14.DidFail = function(v24) --[[ Line: 100 ]] --[[ Name: DidFail ]]
    -- upvalues: l_Results_0 (copy)
    return l_Results_0(v24._Thread) == false;
end;
v14.Get = function(v25) --[[ Line: 107 ]] --[[ Name: Get ]]
    -- upvalues: l_Results_0 (copy)
    return l_Results_0(v25._Thread);
end;
v14.GetValue = function(v26) --[[ Line: 112 ]] --[[ Name: GetValue ]]
    -- upvalues: l_Results_0 (copy)
    local _, v28 = l_Results_0(v26._Thread);
    return v28;
end;
v14.Await = function(v29, v30) --[[ Line: 120 ]] --[[ Name: Await ]]
    -- upvalues: l_Await_0 (copy)
    return l_Await_0(v29._Thread, v30);
end;
v14.AwaitValue = function(v31, v32) --[[ Line: 125 ]] --[[ Name: AwaitValue ]]
    -- upvalues: l_Await_0 (copy)
    local _, v34 = l_Await_0(v31._Thread, v32);
    return v34;
end;
v14.Cancel = function(v35, v36) --[[ Line: 131 ]] --[[ Name: Cancel ]]
    -- upvalues: l_Cancel_0 (copy)
    l_Cancel_0(v35._Thread, v36);
end;
v14.Resolve = function(v37, v38) --[[ Line: 136 ]] --[[ Name: Resolve ]]
    -- upvalues: l_Resolve_0 (copy)
    l_Resolve_0(v37._Thread, v38);
end;
v14.CancelRoot = function(v39, v40) --[[ Line: 141 ]] --[[ Name: CancelRoot ]]
    -- upvalues: l_CancelRoot_0 (copy)
    l_CancelRoot_0(v39._Thread, v40);
end;
v14.ResolveRoot = function(v41, v42) --[[ Line: 146 ]] --[[ Name: ResolveRoot ]]
    -- upvalues: l_ResolveRoot_0 (copy)
    l_ResolveRoot_0(v41._Thread, v42);
end;
v14.AwaitDescendantCompletion = function(v43, v44) --[[ Line: 153 ]] --[[ Name: AwaitDescendantCompletion ]]
    -- upvalues: l_AwaitAll_0 (copy), l_GetDescendants_0 (copy)
    l_AwaitAll_0(l_GetDescendants_0(v43._Thread), v44);
end;
v14.AwaitAll = function(v45) --[[ Line: 159 ]] --[[ Name: AwaitAll ]]
    -- upvalues: l_AwaitAll_0 (copy)
    local v46 = table.create(#v45);
    for _, v48 in v45 do
        table.insert(v46, v48._Thread);
    end;
    return l_AwaitAll_0(v46);
end;
v14.AwaitAllValues = function(v49) --[[ Line: 171 ]] --[[ Name: AwaitAllValues ]]
    -- upvalues: l_AwaitAll_0 (copy)
    local v50 = table.create(#v49);
    for _, v52 in v49 do
        table.insert(v50, v52._Thread);
    end;
    return l_AwaitAll_0(v50);
end;
v14.AwaitFirst = function(v53) --[[ Line: 183 ]] --[[ Name: AwaitFirst ]]
    -- upvalues: l_AwaitFirst_0 (copy)
    local v54 = table.create(#v53);
    for _, v56 in v53 do
        table.insert(v54, v56._Thread);
    end;
    return l_AwaitFirst_0(v54);
end;
v14.AwaitFirstValue = function(v57) --[[ Line: 195 ]] --[[ Name: AwaitFirstValue ]]
    -- upvalues: l_AwaitFirst_0 (copy)
    local v58 = table.create(#v57);
    for _, v60 in v57 do
        table.insert(v58, v60._Thread);
    end;
    local _, v62 = l_AwaitFirst_0(v58);
    return v62;
end;
v14.OnFinish = v0.OnFinish;
v14.CreateRetrier = function(v63, v64, _) --[[ Line: 208 ]] --[[ Name: CreateRetrier ]]
    -- upvalues: v0 (copy)
    return function() --[[ Line: 209 ]]
        -- upvalues: v64 (copy), v0 (ref), v63 (copy)
        for _ = 1, v64 do
            local v67, v68 = v0.Await(v0.Spawn(v63));
            if v67 then
                return true, v68;
            end;
        end;
        return false, "RETRIES_EXHAUSTED";
    end;
end;
return v14;