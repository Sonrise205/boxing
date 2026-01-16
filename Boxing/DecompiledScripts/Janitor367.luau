local l_RunService_0 = game:GetService("RunService");
local l_Heartbeat_0 = l_RunService_0.Heartbeat;
local function _() --[[ Line: 25 ]] --[[ Name: getPromiseReference ]]
    -- upvalues: l_RunService_0 (copy)
    if l_RunService_0:IsRunning() then
        return require(game:GetService("ReplicatedStorage").Framework).modules.Promise;
    else
        return;
    end;
end;
local v3 = newproxy(true);
getmetatable(v3).__tostring = function() --[[ Line: 33 ]]
    return "IndicesReference";
end;
local v4 = newproxy(true);
getmetatable(v4).__tostring = function() --[[ Line: 38 ]]
    return "LinkToInstanceIndex";
end;
local v5 = {
    IGNORE_MEMORY_DEBUG = true, 
    ClassName = "Janitor", 
    __index = {
        CurrentlyCleaning = true, 
        [v3] = nil
    }
};
local v6 = {
    ["function"] = true, 
    Promise = "cancel", 
    RBXScriptConnection = "Disconnect"
};
v5.new = function() --[[ Line: 64 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v5 (copy)
    return (setmetatable({
        CurrentlyCleaning = false, 
        [v3] = nil
    }, v5));
end;
v5.Is = function(v7) --[[ Line: 76 ]] --[[ Name: Is ]]
    -- upvalues: v5 (copy)
    local v8 = false;
    if type(v7) == "table" then
        v8 = getmetatable(v7) == v5;
    end;
    return v8;
end;
v5.is = v5.Is;
v5.__index.Add = function(v9, v10, v11, v12) --[[ Line: 89 ]] --[[ Name: Add ]]
    -- upvalues: v3 (copy), v6 (copy)
    if v12 then
        v9:Remove(v12);
        local v13 = v9[v3];
        if not v13 then
            v13 = {};
            v9[v3] = v13;
        end;
        v13[v12] = v10;
    end;
    local v14 = typeof(v10);
    if v14 == "table" and string.match(tostring(v10), "Promise") then
        v14 = "Promise";
    end;
    v11 = v11 or v6[v14] or "Destroy";
    if type(v10) ~= "function" and not v10[v11] then
        warn(string.format("Object %s doesn't have method %s, are you sure you want to add it? Traceback: %s", tostring(v10), tostring(v11), debug.traceback(nil, 2)));
    end;
    v9[v10] = {
        v11, 
        (debug.traceback(""))
    };
    return v10;
end;
v5.__index.Give = v5.__index.Add;
v5.__index.AddPromise = function(v15, v16) --[[ Line: 126 ]] --[[ Name: AddPromise ]]
    -- upvalues: l_RunService_0 (copy)
    local v17 = if l_RunService_0:IsRunning() then require(game:GetService("ReplicatedStorage").Framework).modules.Promise else nil;
    if v17 then
        if not v17.is(v16) then
            error(string.format("Invalid argument #1 to 'Janitor:AddPromise' (Promise expected, got %s (%s))", typeof(v16), (tostring(v16))));
        end;
        if v16:getStatus() == v17.Status.Started then
            local v18 = newproxy(false);
            local v22 = v15:Add(v17.new(function(v19, _, v21) --[[ Line: 134 ]]
                -- upvalues: v16 (copy)
                if v21(function() --[[ Line: 135 ]]
                    -- upvalues: v16 (ref)
                    v16:cancel();
                end) then
                    return;
                else
                    v19(v16);
                    return;
                end;
            end), "cancel", v18);
            v22:finallyCall(v15.Remove, v15, v18);
            return v22;
        else
            return v16;
        end;
    else
        return v16;
    end;
end;
v5.__index.GivePromise = v5.__index.AddPromise;
v5.__index.AddObject = function(v23, v24) --[[ Line: 156 ]] --[[ Name: AddObject ]]
    -- upvalues: l_RunService_0 (copy)
    local v25 = newproxy(false);
    local v26 = if l_RunService_0:IsRunning() then require(game:GetService("ReplicatedStorage").Framework).modules.Promise else nil;
    if v26 and v26.is(v24) then
        if v24:getStatus() == v26.Status.Started then
            local v27 = v23:Add(v26.resolve(v24), "cancel", v25);
            v27:finallyCall(v23.Remove, v23, v25);
            return v27, v25;
        else
            return v24;
        end;
    else
        return v23:Add(v24, false, v25), v25;
    end;
end;
v5.__index.GiveObject = v5.__index.AddObject;
v5.__index.Remove = function(v28, v29) --[[ Line: 179 ]] --[[ Name: Remove ]]
    -- upvalues: v3 (copy)
    local v30 = v28[v3];
    if v30 then
        local v31 = v30[v29];
        if v31 then
            local v32 = v28[v31];
            local v33 = v32 and v32[1];
            if v33 then
                if v33 == true then
                    v31();
                else
                    local v34 = v31[v33];
                    if v34 then
                        v34(v31);
                    end;
                end;
                v28[v31] = nil;
            end;
            v30[v29] = nil;
        end;
    end;
    return v28;
end;
v5.__index.Get = function(v35, v36) --[[ Line: 213 ]] --[[ Name: Get ]]
    -- upvalues: v3 (copy)
    local v37 = v35[v3];
    if v37 then
        return v37[v36];
    else
        return;
    end;
end;
v5.__index.Cleanup = function(v38) --[[ Line: 224 ]] --[[ Name: Cleanup ]]
    -- upvalues: v3 (copy)
    if not v38.CurrentlyCleaning then
        v38.CurrentlyCleaning = nil;
        for v39, v40 in next, v38 do
            if v39 ~= v3 then
                local v41 = type(v39);
                if v41 == "string" or v41 == "number" then
                    v38[v39] = nil;
                else
                    local v42 = v40[1];
                    local v43 = v40[2];
                    local function _(v44) --[[ Line: 241 ]] --[[ Name: warnUser ]]
                        -- upvalues: v43 (copy)
                        local v45 = debug.traceback("", 3);
                        local l_v43_0 = v43;
                        warn("-------- Janitor Error --------" .. "\n" .. tostring(v44) .. "\n" .. v45 .. "" .. l_v43_0);
                    end;
                    if v42 == true then
                        local l_status_0, l_result_0 = pcall(v39);
                        if not l_status_0 then
                            local v50 = debug.traceback("", 3);
                            warn("-------- Janitor Error --------" .. "\n" .. tostring(l_result_0) .. "\n" .. v50 .. "" .. v43);
                        end;
                    else
                        local v51 = v39[v42];
                        if v51 then
                            local l_status_1, l_result_1 = pcall(v51, v39);
                            local v54 = false;
                            if typeof(v39) == "Instance" then
                                v54 = v51 == "Destroy";
                            end;
                            if not l_status_1 and not v54 then
                                local v55 = debug.traceback("", 3);
                                warn("-------- Janitor Error --------" .. "\n" .. tostring(l_result_1) .. "\n" .. v55 .. "" .. v43);
                            end;
                        end;
                    end;
                    v38[v39] = nil;
                end;
            end;
        end;
        local v56 = v38[v3];
        if v56 then
            for v57 in next, v56 do
                v56[v57] = nil;
            end;
            v38[v3] = {};
        end;
        v38.CurrentlyCleaning = false;
    end;
end;
v5.__index.Clean = v5.__index.Cleanup;
v5.__index.Destroy = function(v58) --[[ Line: 284 ]] --[[ Name: Destroy ]]
    v58:Cleanup();
end;
v5.__call = v5.__index.Cleanup;
local v59 = {
    Connected = true
};
v59.__index = v59;
v59.Disconnect = function(v60) --[[ Line: 298 ]] --[[ Name: Disconnect ]]
    if v60.Connected then
        v60.Connected = false;
        v60.Connection:Disconnect();
    end;
end;
v59.__tostring = function(v61) --[[ Line: 305 ]] --[[ Name: __tostring ]]
    return "Disconnect<" .. tostring(v61.Connected) .. ">";
end;
v5.__index.LinkToInstance = function(v62, v63, v64) --[[ Line: 315 ]] --[[ Name: LinkToInstance ]]
    -- upvalues: v4 (copy), v59 (copy), l_Heartbeat_0 (copy)
    local v65 = nil;
    local v66 = v64 and newproxy(false) or v4;
    local v67 = v63.Parent == nil;
    local v68 = setmetatable({}, v59);
    local function v71(v69, v70) --[[ Line: 321 ]] --[[ Name: ChangedFunction ]]
        -- upvalues: v68 (copy), v67 (ref), l_Heartbeat_0 (ref), v65 (ref), v62 (copy)
        if v68.Connected then
            v69 = nil;
            v67 = v70 == nil;
            if v67 then
                coroutine.wrap(function() --[[ Line: 327 ]]
                    -- upvalues: l_Heartbeat_0 (ref), v68 (ref), v65 (ref), v62 (ref), v67 (ref)
                    l_Heartbeat_0:Wait();
                    if not v68.Connected then
                        return;
                    elseif not v65.Connected then
                        v62:Cleanup();
                        return;
                    else
                        while v67 and v65.Connected and v68.Connected do
                            l_Heartbeat_0:Wait();
                        end;
                        if v68.Connected and v67 then
                            v62:Cleanup();
                        end;
                        return;
                    end;
                end)();
            end;
        end;
    end;
    v65 = v63.AncestryChanged:Connect(v71);
    v68.Connection = v65;
    if v67 then
        local v72 = nil;
        local l_Parent_0 = v63.Parent;
        if v68.Connected then
            v72 = nil;
            v67 = l_Parent_0 == nil;
            if v67 then
                coroutine.wrap(function() --[[ Line: 327 ]]
                    -- upvalues: l_Heartbeat_0 (ref), v68 (copy), v65 (ref), v62 (copy), v67 (ref)
                    l_Heartbeat_0:Wait();
                    if not v68.Connected then
                        return;
                    elseif not v65.Connected then
                        v62:Cleanup();
                        return;
                    else
                        while v67 and v65.Connected and v68.Connected do
                            l_Heartbeat_0:Wait();
                        end;
                        if v68.Connected and v67 then
                            v62:Cleanup();
                        end;
                        return;
                    end;
                end)();
            end;
        end;
    end;
    v63 = nil;
    return v62:Add(v68, "Disconnect", v66);
end;
v5.__index.LinkToInstances = function(v74, ...) --[[ Line: 363 ]] --[[ Name: LinkToInstances ]]
    -- upvalues: v5 (copy)
    local v75 = v5.new();
    for _, v77 in ipairs({
        ...
    }) do
        v75:Add(v74:LinkToInstance(v77, true), "Disconnect");
    end;
    return v75;
end;
for v78, v79 in next, v5.__index do
    local v80 = string.sub(string.lower(v78), 1, 1) .. string.sub(v78, 2);
    v5.__index[v80] = v79;
end;
return v5;