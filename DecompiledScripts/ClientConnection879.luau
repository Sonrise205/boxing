local v0 = require(script.Parent.ClientProcess);
local v1 = {};
local v3 = {
    __index = v1, 
    __tostring = function(_) --[[ Line: 9 ]] --[[ Name: __tostring ]]
        return "ClientConnection";
    end
};
v1.Disconnect = function(v4) --[[ Line: 13 ]] --[[ Name: Disconnect ]]
    v4.Connected = nil;
    v4._disconnectCallback();
    table.clear(v4);
    setmetatable(v4, nil);
end;
return function(v5, v6) --[[ Line: 22 ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v7 = setmetatable({
        Connected = true, 
        _disconnectCallback = function() --[[ Line: 26 ]] --[[ Name: _disconnectCallback ]]

        end
    }, v3);
    v7._disconnectCallback = v0.connect(v5, v6);
    return v7;
end;