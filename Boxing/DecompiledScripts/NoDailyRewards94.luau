return {
    ID = script.Name, 
    Layers = "*", 
    Variations = {
        Control = {
            Probability = 0.9, 
            Data = false
        }, 
        Variant1 = {
            Probability = 0.1, 
            Data = true
        }
    }, 
    Places = {
        "*"
    }, 
    EnrolAll = true, 
    ForceInStudio = "Variant1"
};