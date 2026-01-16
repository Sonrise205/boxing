local v0 = {};
v0.__index = v0;
local v1 = {};
v1.__index = v1;
local v2 = setmetatable({}, {
    __mode = "kv"
});
AddListItem = function(v3, v4) --[[ Line: 11 ]] --[[ Name: AddListItem ]]
    local v5 = {
        Signal = v3, 
        Callback = v4, 
        Last = v3.Last
    };
    if v5.Last then
        v5.Last.Next = v5;
    end;
    v3.Last = v5;
    return v5;
end;
DisconnectListItem = function(v6) --[[ Line: 20 ]] --[[ Name: DisconnectListItem ]]
    if v6.Signal.Last == v6 then
        v6.Signal.Last = v6.Last;
    end;
    if v6.Last then
        v6.Last.Next = v6.Next;
    end;
    if v6.Next then
        v6.Next.Last = v6.Last;
    end;
    v6.Callback = nil;
end;
v0.new = function() --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        Last = nil
    }, v0));
end;
v0.Connect = function(v7, v8) --[[ Line: 33 ]] --[[ Name: Connect ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v7.Killed then
        return;
    else
        local v9 = setmetatable({
            Connected = true
        }, v1);
        v2[v9] = AddListItem(v7, v8);
        return v9;
    end;
end;
v0.Wait = function(v10) --[[ Line: 42 ]] --[[ Name: Wait ]]
    if v10.Killed then
        return coroutine.yield();
    else
        AddListItem(v10, coroutine.running());
        return coroutine.yield();
    end;
end;
v0.Fire = function(v11, ...) --[[ Line: 50 ]] --[[ Name: Fire ]]
    if v11.Killed then
        return;
    else
        local l_Last_0 = v11.Last;
        while l_Last_0 do
            local l_Callback_0 = l_Last_0.Callback;
            local v14 = typeof(l_Callback_0);
            if v14 == "thread" then
                DisconnectListItem(l_Last_0);
                task.spawn(l_Callback_0, ...);
            elseif v14 == "function" then
                task.spawn(l_Callback_0, ...);
            end;
            l_Last_0 = l_Last_0.Last;
        end;
        return;
    end;
end;
v0.FireDeferred = function(v15, ...) --[[ Line: 70 ]] --[[ Name: FireDeferred ]]
    task.defer(v15.Fire, v15, ...);
end;
v0.Destroy = function(v16) --[[ Line: 74 ]] --[[ Name: Destroy ]]
    if v16.Killed then
        return;
    else
        v16.Killed = true;
        v16.Last = nil;
        return;
    end;
end;
v0.connect = v0.Connect;
v0.wait = v0.Wait;
v1.GetOnDisconnectSignal = function(v17) --[[ Line: 86 ]] --[[ Name: GetOnDisconnectSignal ]]
    -- upvalues: v0 (copy)
    if not v17.DisconnectSignal then
        v17.DisconnectSignal = v0.new();
    end;
    return v17.DisconnectSignal;
end;
v1.Disconnect = function(v18) --[[ Line: 94 ]] --[[ Name: Disconnect ]]
    -- upvalues: v2 (copy)
    if v18.Connected then
        v18.Connected = false;
        local v19 = v2[v18];
        if v19 then
            v2[v18] = nil;
            DisconnectListItem(v19);
        end;
        if v18.DisconnectSignal then
            v18.DisconnectSignal:Fire();
            v18.DisconnectSignal:Destroy();
        end;
    end;
end;
v1.disconnect = v1.Disconnect;
v1.Destroy = v1.Disconnect;
return v0;