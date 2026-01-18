local _ = require(script.Parent:WaitForChild("_SetType"));
return function(v1, v2) --[[ Line: 5 ]] --[[ Name: Union ]]
    if next(v1) == nil then
        return v2;
    elseif next(v2) == nil then
        return v1;
    else
        local v3 = {};
        for v4 in v1 do
            v3[v4] = true;
        end;
        for v5 in v2 do
            v3[v5] = true;
        end;
        return v3;
    end;
end;