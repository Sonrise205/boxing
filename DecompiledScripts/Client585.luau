local v0 = require(script.ClientBridge);
local v1 = require(script.ClientIdentifiers);
local v2 = require(script.ClientProcess);
local _ = require(script.Parent.Types);
local v4 = require(script.Parent.Utilities.isEditMode);
local v5 = {};
return {
    start = function() --[[ Line: 12 ]] --[[ Name: start ]]
        -- upvalues: v4 (copy), v2 (copy), v1 (copy)
        if v4 then
            return;
        else
            v2.start();
            v1.start();
            return;
        end;
    end, 
    ser = function(v6) --[[ Line: 21 ]] --[[ Name: ser ]]
        -- upvalues: v4 (copy), v1 (copy)
        if v4 then
            return v6;
        else
            return v1.ser(v6);
        end;
    end, 
    deser = function(v7) --[[ Line: 29 ]] --[[ Name: deser ]]
        -- upvalues: v4 (copy), v1 (copy)
        if v4 then
            return v7;
        else
            return v1.deser(v7);
        end;
    end, 
    makeIdentifier = function(v8, v9) --[[ Line: 37 ]] --[[ Name: makeIdentifier ]]
        -- upvalues: v4 (copy), v1 (copy)
        if v4 then
            return v8;
        else
            return v1.ref(v8, v9, false);
        end;
    end, 
    makeBridge = function(v10) --[[ Line: 45 ]] --[[ Name: makeBridge ]]
        -- upvalues: v5 (copy), v0 (copy)
        if v5[v10] then
            return v5[v10];
        else
            local v11 = v0(v10);
            v5[v10] = v11;
            return v11;
        end;
    end
};