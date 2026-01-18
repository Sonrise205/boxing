--!native
local v0 = {};
return {
    set = function(v1, v2) --[[ Line: 11 ]] --[[ Name: set ]]
        -- upvalues: v0 (copy)
        v0[v1] = v2;
    end, 
    ref = function() --[[ Line: 16 ]] --[[ Name: ref ]]
        -- upvalues: v0 (copy)
        return v0;
    end
};