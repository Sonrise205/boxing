local v0 = require(script.GetPromiseLibrary);
local v1 = require(script.Symbol);
local v2, v3 = v0();
local v4 = v1("IndicesReference");
local v5 = v1("LinkToInstanceIndex");
local v6 = {
    ClassName = "Janitor", 
    CurrentlyCleaning = true, 
    [v4] = nil
};
v6.__index = v6;
local v7 = {
    ["function"] = true, 
    RBXScriptConnection = "Disconnect"
};
v6.Is = function(v8) --[[ Line: 42 ]] --[[ Name: Is ]]
    -- upvalues: v6 (copy)
    local v9 = false;
    if type(v8) == "table" then
        v9 = getmetatable(v8) == v6;
    end;
    return v9;
end;
v6._Add = function(v10, v11, v12, v13) --[[ Line: 80 ]] --[[ Name: _Add ]]
    -- upvalues: v4 (copy), v7 (copy)
    if v13 then
        v10:Remove(v13);
        local v14 = v10[v4];
        if not v14 then
            v14 = {};
            v10[v4] = v14;
        end;
        v14[v13] = v11;
    end;
    v12 = v12 or v7[typeof(v11)] or "Destroy";
    if type(v11) ~= "function" and not v11[v12] then
        warn(string.format("Object %s doesn't have method %s, are you sure you want to add it? Traceback: %s", tostring(v11), tostring(v12), debug.traceback(nil, 2)));
    end;
    v10[v11] = v12;
    return v11;
end;
v6.Add = function(v15, ...) --[[ Line: 101 ]] --[[ Name: Add ]]
    for _, v17 in pairs({
        ...
    }) do
        v15:_Add(v17);
    end;
end;
v6.AddPromise = function(v18, v19) --[[ Line: 129 ]] --[[ Name: AddPromise ]]
    -- upvalues: v2 (copy), v3 (copy)
    if v2 then
        if not v3.is(v19) then
            error(string.format("Invalid argument #1 to 'Janitor:AddPromise' (Promise expected, got %s (%s))", typeof(v19), (tostring(v19))));
        end;
        if v19:getStatus() == v3.Status.Started then
            local v20 = newproxy(false);
            local v24 = v18:_Add(v3.new(function(v21, _, v23) --[[ Line: 137 ]]
                -- upvalues: v19 (copy)
                if v23(function() --[[ Line: 138 ]]
                    -- upvalues: v19 (ref)
                    v19:cancel();
                end) then
                    return;
                else
                    v21(v19);
                    return;
                end;
            end), "cancel", v20);
            v24:finallyCall(v18.Remove, v18, v20);
            return v24;
        else
            return v19;
        end;
    else
        return v19;
    end;
end;
v6.Remove = function(v25, v26) --[[ Line: 178 ]] --[[ Name: Remove ]]
    -- upvalues: v4 (copy)
    local v27 = v25[v4];
    if v27 then
        local v28 = v27[v26];
        if v28 then
            local v29 = v25[v28];
            if v29 then
                if v29 == true then
                    v28();
                else
                    local v30 = v28[v29];
                    if v30 then
                        v30(v28);
                    end;
                end;
                v25[v28] = nil;
            end;
            v27[v26] = nil;
        end;
    end;
    return v25;
end;
v6.Get = function(v31, v32) --[[ Line: 226 ]] --[[ Name: Get ]]
    -- upvalues: v4 (copy)
    local v33 = v31[v4];
    if v33 then
        return v33[v32];
    else
        return nil;
    end;
end;
local function _(v34) --[[ Line: 235 ]] --[[ Name: GetFenv ]]
    -- upvalues: v4 (copy)
    return function() --[[ Line: 236 ]]
        -- upvalues: v34 (copy), v4 (ref)
        for v35, v36 in pairs(v34) do
            if v35 ~= v4 then
                return v35, v36;
            end;
        end;
    end;
end;
v6.Cleanup = function(v38) --[[ Line: 258 ]] --[[ Name: Cleanup ]]
    -- upvalues: v4 (copy)
    if not v38.CurrentlyCleaning then
        v38.CurrentlyCleaning = nil;
        local function v41() --[[ Line: 236 ]]
            -- upvalues: v38 (copy), v4 (ref)
            for v39, v40 in pairs(v38) do
                if v39 ~= v4 then
                    return v39, v40;
                end;
            end;
        end;
        local v42, v43 = v41();
        while v42 and v43 do
            if v43 == true then
                v42();
            else
                local v44 = v42[v43];
                if v44 then
                    v44(v42);
                end;
            end;
            v38[v42] = nil;
            local v45, v46 = v41();
            v42 = v45;
            v43 = v46;
        end;
        local v47 = v38[v4];
        if v47 then
            table.clear(v47);
            v38[v4] = {};
        end;
        v38.CurrentlyCleaning = false;
    end;
end;
v6.Destroy = function(v48) --[[ Line: 296 ]] --[[ Name: Destroy ]]
    v48:Cleanup();
    table.clear(v48);
    setmetatable(v48, nil);
end;
v6.__call = v6.Cleanup;
local v49 = {
    Connected = true
};
v49.__index = v49;
v49.Disconnect = function(v50) --[[ Line: 317 ]] --[[ Name: Disconnect ]]
    if v50.Connected then
        v50.Connected = false;
        v50.Connection:Disconnect();
    end;
end;
v49._new = function(v51) --[[ Line: 324 ]] --[[ Name: _new ]]
    -- upvalues: v49 (copy)
    return (setmetatable({
        Connection = v51
    }, v49));
end;
v49.__tostring = function(v52) --[[ Line: 330 ]] --[[ Name: __tostring ]]
    return "RbxScriptConnection<" .. tostring(v52.Connected) .. ">";
end;
v6.LinkToInstance = function(v53, v54, v55) --[[ Line: 375 ]] --[[ Name: LinkToInstance ]]
    -- upvalues: v5 (copy), v49 (copy)
    local v56 = nil;
    local v57 = v55 and newproxy(false) or v5;
    local v58 = v54.Parent == nil;
    local v59 = setmetatable({}, v49);
    local function v62(v60, v61) --[[ Line: 381 ]] --[[ Name: ChangedFunction ]]
        -- upvalues: v59 (copy), v58 (ref), v56 (ref), v53 (copy)
        if v59.Connected then
            v60 = nil;
            v58 = v61 == nil;
            if v58 then
                task.defer(function() --[[ Line: 387 ]]
                    -- upvalues: v59 (ref), v56 (ref), v53 (ref), v58 (ref)
                    if not v59.Connected then
                        return;
                    elseif not v56.Connected then
                        v53:Cleanup();
                        return;
                    else
                        while v58 and v56.Connected and v59.Connected do
                            task.wait();
                        end;
                        if v59.Connected and v58 then
                            v53:Cleanup();
                        end;
                        return;
                    end;
                end);
            end;
        end;
    end;
    v56 = v54.AncestryChanged:Connect(v62);
    v59.Connection = v56;
    if v58 then
        local v63 = nil;
        local l_Parent_0 = v54.Parent;
        if v59.Connected then
            v63 = nil;
            v58 = l_Parent_0 == nil;
            if v58 then
                task.defer(function() --[[ Line: 387 ]]
                    -- upvalues: v59 (copy), v56 (ref), v53 (copy), v58 (ref)
                    if not v59.Connected then
                        return;
                    elseif not v56.Connected then
                        v53:Cleanup();
                        return;
                    else
                        while v58 and v56.Connected and v59.Connected do
                            task.wait();
                        end;
                        if v59.Connected and v58 then
                            v53:Cleanup();
                        end;
                        return;
                    end;
                end);
            end;
        end;
    end;
    v54 = nil;
    return v53:_Add(v59, "Disconnect", v57);
end;
v6.LinkToInstances = function(v65, ...) --[[ Line: 423 ]] --[[ Name: LinkToInstances ]]
    -- upvalues: v6 (copy)
    local v66 = v6.new();
    for _, v68 in ipairs({
        ...
    }) do
        v66:_Add(v65:LinkToInstance(v68, true), "Disconnect");
    end;
    return v66;
end;
v6.new = function() --[[ Line: 436 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v6 (copy)
    return (setmetatable({
        CurrentlyCleaning = false, 
        [v4] = nil
    }, v6));
end;
return v6;