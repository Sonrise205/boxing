return {
    ID = script.Name, 
    Layers = "*", 
    Variations = {
        Control = {
            Probability = 0.5, 
            Data = false
        }, 
        Variant1 = {
            Probability = 0.5, 
            Data = true
        }
    }, 
    Places = {
        "Main"
    }, 
    Conclusion = "Variant1"
};