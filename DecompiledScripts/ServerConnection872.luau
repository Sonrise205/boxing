local v0 = require(script.Parent.ServerProcess);
local v1 = {};
local v3 = {
    __index = v1, 
    __tostring = function(_) --[[ Line: 10 ]] --[[ Name: __tostring ]]
        return "ServerConnection";
    end
};
v1.Disconnect = function(v4) --[[ Line: 14 ]] --[[ Name: Disconnect ]]
    v4.Connected = nil;
    v4._disconnectCallback();
    table.clear(v4);
    setmetatable(v4, nil);
end;
return function(v5, v6) --[[ Line: 23 ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v7 = setmetatable({
        Connected = true, 
        _disconnectCallback = function() --[[ Line: 27 ]] --[[ Name: _disconnectCallback ]]

        end
    }, v3);
    v7._disconnectCallback = v0.connect(v5, v6);
    return v7;
end;