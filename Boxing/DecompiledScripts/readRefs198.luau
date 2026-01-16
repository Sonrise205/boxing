--!native
local v0 = nil;
return {
    set = function(v1) --[[ Line: 6 ]] --[[ Name: set ]]
        -- upvalues: v0 (ref)
        v0 = v1;
    end, 
    get = function() --[[ Line: 10 ]] --[[ Name: get ]]
        -- upvalues: v0 (ref)
        return v0;
    end
};