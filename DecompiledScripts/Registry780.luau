local _ = require(script.Parent.Parent:WaitForChild("XSignal"));
local v1 = require(script.Parent);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v3 (copy)
    return (setmetatable({
        _ComponentClass = v4, 
        Events = {
            OnComponentAdded = v1.GetAddedSignal(v4), 
            OnComponentRemoving = v1.GetRemovingSignal(v4)
        }
    }, v3));
end;
v3.GetComponents = function(v5) --[[ Line: 40 ]] --[[ Name: GetComponents ]]
    -- upvalues: v1 (copy)
    return v1.GetComponentsOfClass(v5._ComponentClass);
end;
v3.GetInstances = function(v6) --[[ Line: 45 ]] --[[ Name: GetInstances ]]
    -- upvalues: v1 (copy)
    return v1.GetInstancesOfClass(v6._ComponentClass);
end;
v3.GetComponent = function(v7, v8) --[[ Line: 50 ]] --[[ Name: GetComponent ]]
    -- upvalues: v1 (copy)
    return v1.GetComponent(v8, v7._ComponentClass);
end;
v3.AwaitComponentInit = function(v9, v10) --[[ Line: 55 ]] --[[ Name: AwaitComponentInit ]]
    -- upvalues: v1 (copy)
    return v1.AwaitComponentInit(v10, v9._ComponentClass);
end;
v3.ExpectComponent = function(v11, v12) --[[ Line: 60 ]] --[[ Name: ExpectComponent ]]
    -- upvalues: v1 (copy)
    return v1.ExpectComponent(v12, v11._ComponentClass);
end;
v3.GetComponentFromDescendant = function(v13, v14) --[[ Line: 65 ]] --[[ Name: GetComponentFromDescendant ]]
    -- upvalues: v1 (copy)
    return v1.GetComponentFromDescendant(v14, v13._ComponentClass);
end;
v3.GetRegistry = function(v15) --[[ Line: 70 ]] --[[ Name: GetRegistry ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v16 = v2[v15];
    if v16 then
        return v16;
    else
        v16 = v3.new(v15);
        v2[v15] = v16;
        return v16;
    end;
end;
return v3;