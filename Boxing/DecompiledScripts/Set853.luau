local _ = require(script:WaitForChild("_SetType"));
local v1 = {
    FromValues = require(script:WaitForChild("FromValues")), 
    FromKeys = require(script:WaitForChild("FromKeys")), 
    ToArray = require(script:WaitForChild("ToArray")), 
    SymmetricDifference = require(script:WaitForChild("SymmetricDifference")), 
    Intersection = require(script:WaitForChild("Intersection")), 
    Difference = require(script:WaitForChild("Difference")), 
    Insert = require(script:WaitForChild("Insert")), 
    Remove = require(script:WaitForChild("Remove")), 
    Union = require(script:WaitForChild("Union")), 
    IsProperSubset = require(script:WaitForChild("IsProperSubset")), 
    IsSubset = require(script:WaitForChild("IsSubset")), 
    Equals = require(script:WaitForChild("Equals"))
};
setmetatable(v1, {
    __call = function(_, ...) --[[ Line: 22 ]] --[[ Name: __call ]]
        -- upvalues: v1 (copy)
        return v1.FromValues(...);
    end
});
return v1;