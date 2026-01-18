local _ = require(script.Parent:WaitForChild("_SetType"));
return function(v1) --[[ Line: 5 ]] --[[ Name: FromKeys ]]
    local v2 = {};
    for v3 in v1 do
        v2[v3] = true;
    end;
    return v2;
end;