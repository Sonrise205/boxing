local v2 = {
    z = function(v0) --[[ Line: 3 ]] --[[ Name: z ]]
        return v0.z or 3;
    end, 
    mu = function(v1) --[[ Line: 7 ]] --[[ Name: mu ]]
        return v1.mu or 25;
    end
};
v2.sigma = function(v3) --[[ Line: 11 ]] --[[ Name: sigma ]]
    -- upvalues: v2 (copy)
    return v3.sigma or v2.mu(v3) / v2.z(v3);
end;
v2.epsilon = function(v4) --[[ Line: 15 ]] --[[ Name: epsilon ]]
    return v4.epsilon or 1.0E-4;
end;
v2.beta = function(v5) --[[ Line: 19 ]] --[[ Name: beta ]]
    -- upvalues: v2 (copy)
    return v5.beta or v2.sigma(v5) / 2;
end;
v2.betaSq = function(v6) --[[ Line: 23 ]] --[[ Name: betaSq ]]
    -- upvalues: v2 (copy)
    return v2.beta(v6) ^ 2;
end;
return v2;