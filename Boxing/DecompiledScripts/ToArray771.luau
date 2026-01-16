local _ = require(script.Parent:WaitForChild("_SetType"));
return function(v1) --[[ Line: 6 ]] --[[ Name: ToArray ]]
    local v2 = {};
    for v3 in v1 do
        table.insert(v2, v3);
    end;
    return v2;
end;