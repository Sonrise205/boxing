local _ = require(script.Parent:WaitForChild("_SetType"));
return function(v1, v2) --[[ Line: 6 ]] --[[ Name: IsProperSubset ]]
    for v3 in v1 do
        if not v2[v3] then
            return false;
        end;
    end;
    for v4 in v2 do
        if not v1[v4] then
            return true;
        end;
    end;
    return false;
end;