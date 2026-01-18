local l_MutableMerge_0 = require(script.Parent:WaitForChild("MutableMerge"));
return function(v1, v2) --[[ Line: 4 ]] --[[ Name: Merge ]]
    -- upvalues: l_MutableMerge_0 (copy)
    if next(v1) == nil then
        return v2;
    elseif next(v2) == nil then
        return v1;
    else
        local v3 = {};
        l_MutableMerge_0(v3, v1);
        l_MutableMerge_0(v3, v2);
        return v3;
    end;
end;