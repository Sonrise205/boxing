local _ = require(script.Parent:WaitForChild("_SetType"));
return function(v1) --[[ Line: 6 ]] --[[ Name: FromValues ]]
    local v2 = {};
    for _, v4 in v1 do
        v2[v4] = true;
    end;
    return v2;
end;