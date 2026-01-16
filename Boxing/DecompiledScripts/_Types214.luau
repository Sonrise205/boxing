local l_TypeGuard_0 = require(script.Parent.Parent:WaitForChild("TypeGuard"));
return {
    Experiment = l_TypeGuard_0.Object({
        ForceInStudio = l_TypeGuard_0.String():Optional(), 
        Variations = l_TypeGuard_0.Table(), 
        ForceUsers = l_TypeGuard_0.Table():Optional(), 
        Conclusion = l_TypeGuard_0.String():Optional(), 
        NumericID = l_TypeGuard_0.Number(), 
        Concluded = l_TypeGuard_0.Boolean():Optional(), 
        EnrolAll = l_TypeGuard_0.Boolean():Optional(), 
        Layers = l_TypeGuard_0.NumberRange():Optional(), 
        ID = l_TypeGuard_0.String()
    })
};