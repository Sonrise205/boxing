local _ = require(script.Parent:WaitForChild("_SetType"));
return function(v1, v2) --[[ Line: 6 ]] --[[ Name: Remove ]]
    if v2 == nil then
        return v1;
    elseif next(v1) == nil then
        return v1;
    elseif v1[v2] == nil then
        return v1;
    else
        local v3 = {};
        for v4 in v1 do
            v3[v4] = true;
        end;
        v3[v2] = nil;
        return v3;
    end;
end;