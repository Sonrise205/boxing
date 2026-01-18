local _ = require(script.Parent:WaitForChild("_SetType"));
return function(v1, v2) --[[ Line: 5 ]] --[[ Name: Outer ]]
    local v3 = {};
    for v4 in v1 do
        if not v2[v4] or not v1[v4] then
            v3[v4] = true;
        end;
    end;
    for v5 in v2 do
        if not v2[v5] or not v1[v5] then
            v3[v5] = true;
        end;
    end;
    return v3;
end;