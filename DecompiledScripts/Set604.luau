local _ = require(script:WaitForChild("_SetType"));
local v1 = {
    Difference = require(script:WaitForChild("Difference")), 
    Equals = require(script:WaitForChild("Equals")), 
    FromKeys = require(script:WaitForChild("FromKeys")), 
    FromValues = require(script:WaitForChild("FromValues")), 
    Insert = require(script:WaitForChild("Insert")), 
    Intersection = require(script:WaitForChild("Intersection")), 
    IsProperSubset = require(script:WaitForChild("IsProperSubset")), 
    IsSubset = require(script:WaitForChild("IsSubset")), 
    Remove = require(script:WaitForChild("Remove")), 
    SymmetricDifference = require(script:WaitForChild("SymmetricDifference")), 
    ToArray = require(script:WaitForChild("ToArray")), 
    Union = require(script:WaitForChild("Union"))
};
setmetatable(v1, {
    __call = function(_, ...) --[[ Line: 20 ]] --[[ Name: __call ]]
        -- upvalues: v1 (copy)
        return v1.FromValues(...);
    end
});
return v1;