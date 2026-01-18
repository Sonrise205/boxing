local v0 = nil;
local v1 = nil;
return {
    start = function(v2) --[[ Line: 10 ]] --[[ Name: start ]]
        -- upvalues: v0 (ref), v1 (ref)
        v0 = {};
        v1 = v2;
    end, 
    add = function(v3) --[[ Line: 15 ]] --[[ Name: add ]]
        -- upvalues: v0 (ref)
        if not v0 then
            return;
        else
            table.insert(v0, v3);
            return;
        end;
    end, 
    currentLength = function() --[[ Line: 23 ]] --[[ Name: currentLength ]]
        -- upvalues: v0 (ref)
        if v0 then
            return #v0;
        else
            return 0;
        end;
    end, 
    currentName = function() --[[ Line: 27 ]] --[[ Name: currentName ]]
        -- upvalues: v1 (ref)
        return v1;
    end, 
    empty = function() --[[ Line: 31 ]] --[[ Name: empty ]]
        -- upvalues: v0 (ref)
        if v0 == nil then
            return {};
        else
            local l_v0_0 = v0;
            v0 = nil;
            return l_v0_0;
        end;
    end
};