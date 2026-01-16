local v0, v1 = require(script.Parent:WaitForChild("_Template")).Create("Any");
v1._Initial = function(v2) --[[ Line: 8 ]] --[[ Name: _Initial ]]
    if v2 == nil then
        return false, "Expected something, got nil";
    else
        return true;
    end;
end;
return v0;