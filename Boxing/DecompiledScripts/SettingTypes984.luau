return {
    IncrementTypes = {
        Standard = {
            Min = 0.1, 
            Max = 10, 
            Increment = 0.1, 
            Default = 1
        }, 
        StandardZeroBase = {
            Min = 0, 
            Max = 10, 
            Increment = 0.1, 
            Default = 1
        }, 
        Integer = {
            Min = 1, 
            Max = 10, 
            Increment = 1, 
            Default = 3
        }
    }, 
    ValidateInput = function(v0, v1) --[[ Line: 62 ]] --[[ Name: ValidateNumber ]]
        local v2 = math.clamp(math.round(v0 / v1.Increment) * v1.Increment, v1.Min, v1.Max);
        local v3 = v1.Increment == 1 and "%d" or "%0.1f";
        return v2, string.format(v3, v2);
    end
};