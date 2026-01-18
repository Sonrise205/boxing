local v0 = {};
local v2 = {
    __index = v0, 
    __tostring = function(_) --[[ Line: 7 ]] --[[ Name: __tostring ]]
        return "ClientConnection";
    end
};
v0.Disconnect = function(v3) --[[ Line: 11 ]] --[[ Name: Disconnect ]]
    v3.Connected = nil;
    table.clear(v3);
    setmetatable(v3, nil);
end;
return function() --[[ Line: 18 ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        Connected = true, 
        _disconnectCallback = function() --[[ Line: 22 ]] --[[ Name: _disconnectCallback ]]

        end
    }, v2));
end;