return {
    ID = script.Name, 
    Layers = "*", 
    Variations = {
        Control = {
            Probability = 0.7, 
            Data = 0
        }, 
        Variant1 = {
            Probability = 0.15, 
            Data = 1
        }, 
        Variant2 = {
            Probability = 0.15, 
            Data = 2
        }
    }, 
    Places = {
        "*"
    }, 
    EnrolAll = true, 
    ForceInStudio = "Variant1", 
    Conclusion = "Variant1"
};