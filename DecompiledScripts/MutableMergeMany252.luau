local l_MutableMerge_0 = require(script.Parent:WaitForChild("MutableMerge"));
return function(...) --[[ Line: 4 ]] --[[ Name: MutableMergeMany ]]
    -- upvalues: l_MutableMerge_0 (copy)
    local v1 = select(1, ...);
    for v2 = 2, select("#", ...) do
        local v3 = select(v2, ...);
        if v3 then
            l_MutableMerge_0(v1, v3);
        end;
    end;
    return v1;
end;