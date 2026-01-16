local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        Connected = false, 
        Callback = v2, 
        _Signal = v1, 
        _Next = nil, 
        OnDisconnect = nil
    }, v0));
end;
v0.Disconnect = function(v3) --[[ Line: 23 ]] --[[ Name: Disconnect ]]
    if not v3.Connected then
        return;
    else
        local l__Signal_0 = v3._Signal;
        local l__HeadConnection_0 = l__Signal_0._HeadConnection;
        if not l__HeadConnection_0 then
            return;
        else
            if l__HeadConnection_0 == v3 then
                l__Signal_0._HeadConnection = v3._Next;
            else
                while l__HeadConnection_0._Next ~= v3 do
                    l__HeadConnection_0 = l__HeadConnection_0._Next;
                end;
                l__HeadConnection_0._Next = v3._Next;
            end;
            l__Signal_0._ConnectionCount = l__Signal_0._ConnectionCount - 1;
            if l__Signal_0._ConnectionCount == 0 then
                l__Signal_0._HeadConnection = false;
                l__Signal_0._OnConnectionsEmpty();
            end;
            v3.Connected = false;
            local l_OnDisconnect_0 = v3.OnDisconnect;
            if l_OnDisconnect_0 then
                l_OnDisconnect_0();
            end;
            return;
        end;
    end;
end;
v0.Reconnect = function(v7) --[[ Line: 63 ]] --[[ Name: Reconnect ]]
    if v7.Connected then
        return;
    else
        local l__Signal_1 = v7._Signal;
        local l__HeadConnection_1 = l__Signal_1._HeadConnection;
        if l__HeadConnection_1 then
            v7._Next = l__HeadConnection_1;
            l__Signal_1._HeadConnection = v7;
        else
            l__Signal_1._HeadConnection = v7;
        end;
        l__Signal_1._ConnectionCount = l__Signal_1._ConnectionCount + 1;
        if l__Signal_1._ConnectionCount == 1 then
            l__Signal_1._OnConnectionsPresent();
        end;
        v7.Connected = true;
        return;
    end;
end;
return v0;