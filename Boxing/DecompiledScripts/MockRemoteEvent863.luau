local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    return (setmetatable({
        Bind = l_BindableEvent_0, 
        OnClientEvent = l_BindableEvent_0.Event, 
        OnServerEvent = l_BindableEvent_0.Event
    }, v0));
end;
v0.FireServer = function(v2, ...) --[[ Line: 16 ]] --[[ Name: FireServer ]]
    if v2.OnFire then
        v2.OnFire(...);
    end;
end;
v0.FireClient = function(v3, _, ...) --[[ Line: 22 ]] --[[ Name: FireClient ]]
    if v3.OnFire then
        v3.OnFire(...);
    end;
end;
v0.FireAllClients = function(v5, ...) --[[ Line: 28 ]] --[[ Name: FireAllClients ]]
    if v5.OnFire then
        v5.OnFire(...);
    end;
end;
return v0;