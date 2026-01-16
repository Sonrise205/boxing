local _ = require(script.Parent:WaitForChild("_SetType"));
return function(v1, v2) --[[ Line: 5 ]] --[[ Name: Intersection ]]
    local v3 = {};
    for v4 in v1 do
        if v2[v4] and v1[v4] then
            v3[v4] = true;
        end;
    end;
    return v3;
end;