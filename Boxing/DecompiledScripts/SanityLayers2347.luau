return {
    ID = script.Name, 
    Layers = NumberRange.new(0.5, 1), 
    Variations = {
        Control = {
            Probability = 0.1, 
            Data = 0
        }, 
        Variant1 = {
            Probability = 0.45, 
            Data = 1
        }, 
        Variant2 = {
            Probability = 0.45, 
            Data = 2
        }
    }, 
    EnrolAll = true
};