local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local _ = require(l_Parent_0.Shared);
local l_Symbol_0 = v1.Symbol;
local v5 = require(script.Parent["createSignal.roblox"]);
local v6 = l_Symbol_0("BindingImpl");
local v7 = {};
local v14 = {
    __index = {
        getValue = function(v8) --[[ Line: 47 ]] --[[ Name: getValue ]]
            -- upvalues: v7 (copy)
            return v7.getValue(v8);
        end, 
        map = function(v9, v10) --[[ Line: 51 ]] --[[ Name: map ]]
            -- upvalues: v7 (copy)
            return v7.map(v9, v10);
        end, 
        subscribe = function(v11, v12) --[[ Line: 55 ]] --[[ Name: subscribe ]]
            -- upvalues: v7 (copy)
            return v7.subscribe(v11, v12);
        end
    }, 
    __tostring = function(v13) --[[ Line: 61 ]] --[[ Name: __tostring ]]
        return string.format("RoactBinding(%s)", (tostring(v13:getValue())));
    end
};
v7.update = function(v15, v16) --[[ Line: 66 ]] --[[ Name: update ]]
    -- upvalues: v6 (copy)
    return v15[v6].update(v16);
end;
v7.subscribe = function(v17, v18) --[[ Line: 70 ]] --[[ Name: subscribe ]]
    -- upvalues: v6 (copy)
    return v17[v6].subscribe(v18);
end;
v7.getValue = function(v19) --[[ Line: 74 ]] --[[ Name: getValue ]]
    -- upvalues: v6 (copy)
    return v19[v6]:getValue();
end;
v7.create = function(v20) --[[ Line: 78 ]] --[[ Name: create ]]
    -- upvalues: v5 (copy), l_ReactSymbols_0 (copy), v6 (copy), v14 (copy)
    local v21, v22 = v5();
    local v23 = {
        value = v20, 
        subscribe = v21
    };
    v23.update = function(v24) --[[ Line: 85 ]] --[[ Name: update ]]
        -- upvalues: v23 (copy), v22 (copy)
        v23.value = v24;
        v22(v24);
    end;
    v23.getValue = function() --[[ Line: 90 ]] --[[ Name: getValue ]]
        -- upvalues: v23 (copy)
        return v23.value;
    end;
    local v25 = nil;
    if _G.__DEV__ then
        v25 = debug.traceback("Binding created at:", 3);
    end;
    return setmetatable({
        ["$$typeof"] = l_ReactSymbols_0.REACT_BINDING_TYPE, 
        [v6] = v23, 
        _source = v25
    }, v14), v23.update;
end;
v7.map = function(v26, v27) --[[ Line: 108 ]] --[[ Name: map ]]
    -- upvalues: l_ReactSymbols_0 (copy), v7 (copy), v6 (copy), v14 (copy)
    if _G.__DEV__ then
        local v28 = false;
        if typeof(v26) == "table" then
            v28 = v26["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
        end;
        assert(v28, "Expected `self` to be a binding");
        assert(typeof(v27) == "function", "Expected arg #1 to be a function");
    end;
    local v32 = {
        subscribe = function(v29) --[[ Line: 120 ]] --[[ Name: subscribe ]]
            -- upvalues: v7 (ref), v26 (copy), v27 (copy)
            return v7.subscribe(v26, function(v30) --[[ Line: 121 ]]
                -- upvalues: v29 (copy), v27 (ref)
                v29(v27(v30));
            end);
        end, 
        update = function(_) --[[ Line: 126 ]] --[[ Name: update ]]
            error("Bindings created by Binding:map(fn) cannot be updated directly", 2);
        end, 
        getValue = function() --[[ Line: 130 ]] --[[ Name: getValue ]]
            -- upvalues: v27 (copy), v26 (copy)
            return v27(v26:getValue());
        end
    };
    local v33 = nil;
    if _G.__DEV__ then
        v33 = debug.traceback("Mapped binding created at:", 3);
    end;
    return (setmetatable({
        ["$$typeof"] = l_ReactSymbols_0.REACT_BINDING_TYPE, 
        [v6] = v32, 
        _source = v33
    }, v14));
end;
v7.join = function(v34) --[[ Line: 151 ]] --[[ Name: join ]]
    -- upvalues: l_ReactSymbols_0 (copy), v7 (copy), v6 (copy), v14 (copy)
    if _G.__DEV__ then
        assert(typeof(v34) == "table", "Expected arg #1 to be of type table");
        for v35, v36 in v34 do
            if typeof(v36) ~= "table" or v36["$$typeof"] ~= l_ReactSymbols_0.REACT_BINDING_TYPE then
                local v37 = ("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format((tostring(v35)));
                error(v37, 2);
            end;
        end;
    end;
    local v38 = {};
    local function v42() --[[ Line: 167 ]] --[[ Name: getValue ]]
        -- upvalues: v34 (copy)
        local v39 = {};
        for v40, v41 in pairs(v34) do
            v39[v40] = v41:getValue();
        end;
        return v39;
    end;
    v38.subscribe = function(v43) --[[ Line: 178 ]] --[[ Name: subscribe ]]
        -- upvalues: v34 (copy), v7 (ref), v42 (copy)
        local v44 = {};
        for v45, v46 in v34 do
            v44[v45] = v7.subscribe(v46, function(_) --[[ Line: 183 ]]
                -- upvalues: v43 (copy), v42 (ref)
                v43((v42()));
            end);
        end;
        return function() --[[ Line: 188 ]]
            -- upvalues: v44 (ref)
            if v44 == nil then
                return;
            else
                for _, v49 in v44 do
                    v49();
                end;
                v44 = nil;
                return;
            end;
        end;
    end;
    v38.update = function(_) --[[ Line: 201 ]] --[[ Name: update ]]
        error("Bindings created by joinBindings(...) cannot be updated directly", 2);
    end;
    v38.getValue = function() --[[ Line: 205 ]] --[[ Name: getValue ]]
        -- upvalues: v42 (copy)
        return (v42());
    end;
    local v51 = nil;
    if _G.__DEV__ then
        v51 = debug.traceback("Joined binding created at:", 2);
    end;
    return (setmetatable({
        ["$$typeof"] = l_ReactSymbols_0.REACT_BINDING_TYPE, 
        [v6] = v38, 
        _source = v51
    }, v14));
end;
return v7;