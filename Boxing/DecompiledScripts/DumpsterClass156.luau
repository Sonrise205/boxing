local v0 = {};
v0.__index = v0;
local v4 = setmetatable({
    ["function"] = function(v1) --[[ Line: 7 ]]
        return v1();
    end, 
    Instance = game.Destroy, 
    RBXScriptConnection = Instance.new("BindableEvent").Event:Connect(function() --[[ Line: 11 ]]

    end).Disconnect, 
    thread = task.cancel
}, {
    __index = function(_, v3) --[[ Line: 15 ]] --[[ Name: __index ]]
        error(("Can't dump item of type '%s'"):format(v3), 3);
    end
});
v0.new = function() --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({}, v0));
end;
v0.dump = function(v5, v6) --[[ Line: 26 ]] --[[ Name: dump ]]
    -- upvalues: v4 (copy)
    v5[v6] = v4[typeof(v6)];
    return v6;
end;
v0.burn = function(v7) --[[ Line: 31 ]] --[[ Name: burn ]]
    for v8, v9 in pairs(v7) do
        v9(v8);
    end;
    table.clear(v7);
end;
return v0;