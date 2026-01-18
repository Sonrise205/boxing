local _ = require(script.Parent:WaitForChild("_SetType"));
return function(v1, v2) --[[ Line: 6 ]] --[[ Name: IsSubset ]]
    for v3 in v1 do
        if not v2[v3] then
            return false;
        end;
    end;
    return true;
end;