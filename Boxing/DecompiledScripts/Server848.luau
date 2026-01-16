local _ = require(script.Parent.Types);
local v1 = require(script.Parent.Utilities.isEditMode);
local v2 = require(script.PlayerContainers);
local v3 = require(script.ServerBridge);
local v4 = require(script.ServerIdentifiers);
local v5 = require(script.ServerProcess);
local v6 = {};
return {
    start = function() --[[ Line: 13 ]] --[[ Name: start ]]
        -- upvalues: v1 (copy), v4 (copy), v5 (copy)
        if v1 then
            return;
        else
            v4.start();
            v5.start();
            return;
        end;
    end, 
    makeBridge = function(v7) --[[ Line: 22 ]] --[[ Name: makeBridge ]]
        -- upvalues: v6 (copy), v3 (copy)
        if v6[v7] then
            return v6[v7];
        else
            local v8 = v3(v7);
            v6[v7] = v8;
            return v8;
        end;
    end, 
    ser = function(v9) --[[ Line: 34 ]] --[[ Name: ser ]]
        -- upvalues: v4 (copy)
        return v4.ser(v9);
    end, 
    deser = function(v10) --[[ Line: 38 ]] --[[ Name: deser ]]
        -- upvalues: v4 (copy)
        return v4.deser(v10);
    end, 
    makeIdentifier = function(v11) --[[ Line: 42 ]] --[[ Name: makeIdentifier ]]
        -- upvalues: v4 (copy)
        return v4.ref(v11);
    end, 
    playerContainers = function() --[[ Line: 46 ]] --[[ Name: playerContainers ]]
        -- upvalues: v2 (copy)
        return v2;
    end, 
    invalidPlayerhandler = function(v12) --[[ Line: 50 ]] --[[ Name: invalidPlayerhandler ]]
        -- upvalues: v5 (copy)
        v5.setInvalidPlayerFunction(v12);
    end
};