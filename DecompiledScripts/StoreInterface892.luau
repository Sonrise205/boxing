--!native
if not script then
    script = game:GetService("ReplicatedFirst").Vapor.StoreInterface;
end;
local l_RunService_0 = game:GetService("RunService");
local _ = require(script.Parent.Parent.XSignal);
local v2 = require(script.Parent.GeneralStore);
local l__BuildFromPath_0 = v2._BuildFromPath;
local l__RemoveNode_0 = v2._RemoveNode;
local v5 = l_RunService_0:IsServer();
local v6 = {
    __mode = "v"
};
local v7 = {};
local function v8(v9, v10) --[[ Line: 60 ]] --[[ Name: _Extend ]]
    -- upvalues: v8 (copy), v5 (copy), v6 (copy), v7 (copy)
    if type(v10) == "table" then
        local l_v9_0 = v9;
        for _, v13 in v10 do
            l_v9_0 = v8(l_v9_0, v13);
        end;
        return l_v9_0;
    else
        local v14 = rawget(v9, "_Cache");
        if not v14 then
            v14 = {};
            v9._Cache = v14;
        end;
        local v15 = v14[v10];
        if v15 then
            return v15;
        else
            if v5 and not getmetatable(v14) then
                setmetatable(v14, v6);
            end;
            local v16 = table.clone(v9._Path);
            table.insert(v16, v10);
            v15 = v7.new(v9._StoreObject, v16);
            v14[v10] = v15;
            return v15;
        end;
    end;
end;
v7.__index = function(v17, v18) --[[ Line: 91 ]] --[[ Name: __index ]]
    -- upvalues: v7 (copy), v8 (copy)
    return rawget(v17, v18) or v7[v18] or v8(v17, v18);
end;
v7.new = function(v19, v20) --[[ Line: 95 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        _StoreObject = assert(v19, "No StoreContainer object given!"), 
        _Cache = nil, 
        _Path = v20 or {}
    }, v7));
end;
v7.Get = function(v21, ...) --[[ Line: 104 ]] --[[ Name: Get ]]
    return v21._StoreObject.Get(v21._Path, ...);
end;
v7.Set = function(v22, ...) --[[ Line: 108 ]] --[[ Name: Set ]]
    v22._StoreObject.Set(v22._Path, ...);
end;
v7.Await = function(v23, ...) --[[ Line: 112 ]] --[[ Name: Await ]]
    return v23._StoreObject.Await(v23._Path, ...);
end;
v7.Merge = function(v24, v25, v26) --[[ Line: 116 ]] --[[ Name: Merge ]]
    -- upvalues: l__BuildFromPath_0 (copy), l__RemoveNode_0 (copy)
    if next(v24._Path) == nil then
        v24._StoreObject.Merge(v25, v26);
        return;
    else
        v24._StoreObject.Merge(l__BuildFromPath_0(v24._Path, v25 == nil and l__RemoveNode_0 or v25), v26);
        return;
    end;
end;
v7.Increment = function(v27, v28, v29, ...) --[[ Line: 124 ]] --[[ Name: Increment ]]
    local v30 = true;
    if type(v28) ~= "number" then
        v30 = v28 == nil;
    end;
    assert(v30, ("Invalid argument #1 (expected number, got %s)"):format((type(v28))));
    local v31 = v27:Get();
    if v29 and v31 == nil then
        v31 = v29;
        v27:Set(v29);
    else
        assert(type(v31) == "number", ("Invalid existing value for %s (expected number, got %s)"):format(tostring(v27), (type(v31))));
    end;
    v30 = v31 + (v28 or 1);
    v27:Set(v30, ...);
    return v30;
end;
v7.Remove = function(v32, v33) --[[ Line: 141 ]] --[[ Name: Remove ]]
    assert(v32:IsArray() or v32:IsEmpty(), "Item was not an array");
    local v34 = v32:Get();
    local v35 = #v34;
    v33 = v33 or v35;
    local v36 = v34[v33];
    if v35 > 0 then
        table.remove(v34, v33);
        v32:Set(v34);
    end;
    return v36, v33;
end;
v7.Insert = function(v37, ...) --[[ Line: 157 ]] --[[ Name: Insert ]]
    assert(v37:IsArray() or v37:IsEmpty(), "Item was not an array");
    local v38 = v37:Get();
    table.insert(v38, ...);
    v37:Set(v38);
end;
v7.IsContainer = function(v39) --[[ Line: 166 ]] --[[ Name: IsContainer ]]
    return type(v39:Get()) == "table";
end;
v7.IsArray = function(v40) --[[ Line: 170 ]] --[[ Name: IsArray ]]
    return v40:IsContainer() and v40:Get()[1] ~= nil;
end;
v7.IsEmpty = function(v41) --[[ Line: 174 ]] --[[ Name: IsEmpty ]]
    return v41:IsContainer() and next(v41:Get()) == nil;
end;
v7.IsMap = function(v42) --[[ Line: 178 ]] --[[ Name: IsMap ]]
    return v42:IsContainer() and not v42:IsArray() and next(v42:Get()) ~= nil;
end;
v7.IsLeaf = function(v43) --[[ Line: 182 ]] --[[ Name: IsLeaf ]]
    local v44 = false;
    if v43:Get() ~= nil then
        v44 = not v43:IsContainer();
    end;
    return v44;
end;
v7.GetValueChangedSignal = function(v45) --[[ Line: 187 ]] --[[ Name: GetValueChangedSignal ]]
    return v45._StoreObject.GetValueChangedSignal(v45._Path);
end;
v7.GetSubValueChangedSignal = function(v46) --[[ Line: 191 ]] --[[ Name: GetSubValueChangedSignal ]]
    return v46._StoreObject.GetSubValueChangedSignal(v46._Path);
end;
v7.Extend = v8;
v7.ExclusiveSync = function(v47, v48) --[[ Line: 199 ]] --[[ Name: ExclusiveSync ]]
    assert(type(v48) == "table", "Players must be a table or '*'");
    v47._StoreObject.ExclusiveSync(v47._Path, v48);
end;
v7.SetDebugLog = function(v49, v50) --[[ Line: 204 ]] --[[ Name: SetDebugLog ]]
    v49._StoreObject.SetDebugLog(v50);
end;
v7.Destroy = function(_) --[[ Line: 208 ]] --[[ Name: Destroy ]]

end;
return table.freeze(v7);