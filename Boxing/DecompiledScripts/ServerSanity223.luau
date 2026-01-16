return {
    ID = script.Name, 
    Layers = "*", 
    Variations = {
        Control = {
            Probability = 0.8, 
            Data = false
        }, 
        Variant1 = {
            Probability = 0.2, 
            Data = true
        }
    }, 
    EnrolAll = true, 
    Places = {
        "Main"
    }, 
    ForceInStudio = "Control"
};