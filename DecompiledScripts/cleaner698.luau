if not script then
    script = game:GetService("ReplicatedFirst").Cleaner;
end;
local l_TypeGuard_0 = require(script.Parent:WaitForChild("TypeGuard"));
local v1 = l_TypeGuard_0.Object():OfStructure({
    __index = l_TypeGuard_0.Object(), 
    Destroy = l_TypeGuard_0.Function(), 
    new = l_TypeGuard_0.Function()
});
local v2 = l_TypeGuard_0.Object():OfStructure({
    IsCleaner = l_TypeGuard_0.Boolean()
});
local v3 = l_TypeGuard_0.Object():OfStructure({
    Destroy = l_TypeGuard_0.Function()
});
local v4 = l_TypeGuard_0.Object():OfStructure({
    Disconnect = l_TypeGuard_0.Function()
});
local v5 = l_TypeGuard_0.Object():OfStructure({
    IsCustomMethod = l_TypeGuard_0.Boolean()
});
local v7 = l_TypeGuard_0.Instance():Or(l_TypeGuard_0.Function()):Or(l_TypeGuard_0.Thread()):Or(l_TypeGuard_0.RBXScriptConnection()):Or(v2:Equals(function(v6) --[[ Line: 62 ]]
    return v6;
end):Negate()):Or(v3):Or(v4):Or(v5);
local v10 = {
    __index = function(_, v9) --[[ Line: 92 ]] --[[ Name: __index ]]
        error(("Object lifecycle ended, but key %s was indexed"):format((tostring(v9))));
    end
};
local v11 = {
    "Disconnect", 
    "Destroy", 
    "Clean"
};
local v12 = {};
v12.__index = v12;
local v13 = l_TypeGuard_0.Params(l_TypeGuard_0.Object());
v12.IsLocked = function(v14) --[[ Line: 105 ]] --[[ Name: IsLocked ]]
    -- upvalues: v13 (copy), v10 (copy)
    v13(v14);
    return getmetatable(v14) == v10;
end;
v12.isLocked = v12.IsLocked;
local v24 = {
    table = function(v15) --[[ Line: 117 ]]
        -- upvalues: v12 (copy), v11 (copy)
        local l_IsLocked_0 = v12.IsLocked;
        for _, v18 in v11 do
            if not l_IsLocked_0(v15) then
                local v19 = v15[v18];
                if v19 then
                    v19(v15);
                end;
            else
                break;
            end;
        end;
    end, 
    thread = function(v20) --[[ Line: 137 ]]
        pcall(task.cancel, v20);
    end, 
    ["function"] = function(v21) --[[ Line: 141 ]]
        v21();
    end, 
    RBXScriptConnection = function(v22) --[[ Line: 145 ]]
        v22:Disconnect();
    end, 
    Instance = function(v23) --[[ Line: 149 ]]
        v23:Destroy();
    end
};
v12.new = function() --[[ Line: 153 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy)
    return (setmetatable({
        IsCleaner = true, 
        _DidClean = false, 
        _CleanList = {}, 
        _Index = 1
    }, v12));
end;
local v25 = l_TypeGuard_0.VariadicWithContext(v7);
v12.Add = function(v26, ...) --[[ Line: 176 ]] --[[ Name: Add ]]
    -- upvalues: v25 (copy)
    v25(v26, ...);
    local l__CleanList_0 = v26._CleanList;
    local v28 = select("#", ...);
    local l__Index_0 = v26._Index;
    for v30 = 1, v28 do
        l__CleanList_0[l__Index_0] = select(v30, ...);
        l__Index_0 = l__Index_0 + 1;
    end;
    v26._Index = l__Index_0;
    if v26._DidClean then
        v26:Clean();
    end;
    return v26;
end;
v12.add = v12.Add;
v12.Clean = function(v31) --[[ Line: 205 ]] --[[ Name: Clean ]]
    -- upvalues: v24 (copy)
    local l__CleanList_1 = v31._CleanList;
    for v33, v34 in l__CleanList_1 do
        v24[typeof(v34)](v34);
        l__CleanList_1[v33] = nil;
    end;
    v31._Index = 1;
    v31._DidClean = true;
    return v31;
end;
v12.clean = v12.Clean;
v12.AddContext = function(v35) --[[ Line: 221 ]] --[[ Name: AddContext ]]
    return v35:Add(coroutine.running());
end;
v12.addContext = v12.AddContext;
local function v38(v36, v37, ...) --[[ Line: 226 ]] --[[ Name: CleanerSpawn ]]
    v36:AddContext();
    v37(...);
end;
local v39 = l_TypeGuard_0.Params(l_TypeGuard_0.Function());
v12.Spawn = function(v40, v41, ...) --[[ Line: 233 ]] --[[ Name: Spawn ]]
    -- upvalues: v39 (copy), v38 (copy)
    v39(v41);
    task.spawn(v38, v40, v41, ...);
    return v40;
end;
v12.spawn = v12.Spawn;
local function v44(v42, v43, ...) --[[ Line: 243 ]] --[[ Name: CleanerDelay ]]
    task.wait(v42);
    v43();
end;
local v45 = l_TypeGuard_0.Params(l_TypeGuard_0.Number(), l_TypeGuard_0.Function());
v12.Delay = function(v46, v47, v48, ...) --[[ Line: 250 ]] --[[ Name: Delay ]]
    -- upvalues: v45 (copy), v44 (copy)
    v45(v47, v48);
    v46:Spawn(v44, v47, v48, ...);
    return v46;
end;
v12.delay = v12.Delay;
local v49 = l_TypeGuard_0.Params(l_TypeGuard_0.Object());
v12.Lock = function(v50) --[[ Line: 264 ]] --[[ Name: Lock ]]
    -- upvalues: v49 (copy), v10 (copy)
    v49(v50);
    for v51 in v50 do
        v50[v51] = nil;
    end;
    setmetatable(v50, v10);
    table.freeze(v50);
end;
v12.lock = v12.Lock;
local v52 = l_TypeGuard_0.Params(v1);
v12.IsWrapped = function(v53) --[[ Line: 281 ]] --[[ Name: IsWrapped ]]
    -- upvalues: v52 (copy)
    v52(v53);
    return v53._CLEANER_WRAPPED ~= nil;
end;
v12.isWrapped = v12.IsWrapped;
local v54 = l_TypeGuard_0.Params(v1);
v12.Wrap = function(v55) --[[ Line: 292 ]] --[[ Name: Wrap ]]
    -- upvalues: v54 (copy), v12 (copy)
    v54(v55);
    assert(not v12.IsWrapped(v55), "Class already wrapped");
    local l_Destroy_0 = v55.Destroy;
    v55.Destroy = function(v57, ...) --[[ Line: 300 ]]
        -- upvalues: l_Destroy_0 (copy), v12 (ref)
        l_Destroy_0(v57, ...);
        v12.Lock(v57);
    end;
    v55._CLEANER_WRAPPED = true;
    return v55;
end;
v12.wrap = v12.Wrap;
local v58 = l_TypeGuard_0.Params(l_TypeGuard_0.Object(), l_TypeGuard_0.String());
v12.CustomMethod = function(v59, v60, ...) --[[ Line: 313 ]] --[[ Name: CustomMethod ]]
    -- upvalues: v58 (copy)
    v58(v59, v60);
    return {
        _Args = {
            ...
        }, 
        IsCustomMethod = true, 
        Destroy = function(v61) --[[ Line: 322 ]] --[[ Name: Destroy ]]
            -- upvalues: v59 (copy), v60 (copy)
            v59[v60](v59, unpack(v61._Args));
        end
    };
end;
v12.customMethod = v12.CustomMethod;
return v12;