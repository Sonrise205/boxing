local v0 = require(script.Parent.Parent.Utilities.Output);
return function(v1) --[[ Line: 8 ]]
    -- upvalues: v0 (copy)
    v0.warn(string.format("Player %*:%* sent an invalid packet. Likely exploiter- or something interacted with the internal BridgeNet API.", v1.Name, v1.UserId));
end;