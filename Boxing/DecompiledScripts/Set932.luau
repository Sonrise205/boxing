local _ = require(script:WaitForChild("_SetType"));
local v1 = {
    FromValues = require(script:WaitForChild("FromValues")), 
    FromKeys = require(script:WaitForChild("FromKeys")), 
    Intersection = require(script:WaitForChild("Intersection")), 
    Negation = require(script:WaitForChild("Negation")), 
    Union = require(script:WaitForChild("Union")), 
    Outer = require(script:WaitForChild("Outer"))
};
setmetatable(v1, {
    __call = function(_, ...) --[[ Line: 15 ]] --[[ Name: __call ]]
        -- upvalues: v1 (copy)
        return v1.FromValues(...);
    end
});
return v1;