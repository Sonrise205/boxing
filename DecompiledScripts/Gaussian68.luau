local function v4(v0) --[[ Line: 6 ]] --[[ Name: erfc ]]
    local v1 = math.abs(v0);
    local v2 = 1 / (v1 / 2 + 1);
    local v3 = v2 * math.exp(-v1 * v1 - 1.26551223 + v2 * (v2 * (v2 * (v2 * (v2 * (v2 * (v2 * (v2 * (v2 * 0.17087277 + -0.82215223) + 1.48851587) + -1.13520398) + 0.27886807) + -0.18628806) + 0.09678418) + 0.37409196) + 1.00002368));
    if v0 < 0 then
        return 2 - v3;
    else
        return v3;
    end;
end;
local function v11(v5) --[[ Line: 16 ]] --[[ Name: ierfc ]]
    -- upvalues: v4 (copy)
    if v5 >= 2 then
        return -100;
    elseif v5 <= 0 then
        return 100;
    else
        local v6 = if v5 < 1 then v5 else 2 - v5;
        local v7 = math.sqrt(math.log(v6 / 2) * -2);
        local v8 = ((v7 * 0.27061 + 2.30753) / (v7 * (v7 * 0.04481 + 0.99229) + 1) - v7) * -0.70711;
        for _ = 1, 2 do
            local v10 = v4(v8) - v6;
            v8 = v8 + v10 / (math.exp(-(v8 * v8)) * 1.1283791670955126 - v8 * v10);
        end;
        if v5 < 1 then
            return v8;
        else
            return -v8;
        end;
    end;
end;
local v12 = {};
v12.__index = v12;
local function v15(v13, v14) --[[ Line: 33 ]] --[[ Name: fromPrecisionMean ]]
    -- upvalues: v12 (copy)
    return v12.new(v14 / v13, 1 / v13);
end;
v12.__mul = function(v16, v17) --[[ Line: 37 ]]
    -- upvalues: v15 (copy)
    if type(v17) == "number" then
        return v16:scale(v17);
    else
        local v18 = 1 / v16.variance;
        local v19 = 1 / v17.variance;
        return v15(v18 + v19, v18 * v16.mean + v19 * v17.mean);
    end;
end;
v12.__div = function(v20, v21) --[[ Line: 48 ]]
    -- upvalues: v15 (copy)
    if type(v21) == "number" then
        return v20:scale(1 / v21);
    else
        local v22 = 1 / v20.variance;
        local v23 = 1 / v21.variance;
        return v15(v22 - v23, v22 * v20.mean - v23 * v21.mean);
    end;
end;
v12.__add = function(v24, v25) --[[ Line: 59 ]]
    -- upvalues: v12 (copy)
    if type(v25) == "number" then
        error("Only gaussians can be added");
    end;
    return v12.new(v24.mean + v25.mean, v24.variance + v25.variance);
end;
v12.__sub = function(v26, v27) --[[ Line: 66 ]]
    -- upvalues: v12 (copy)
    if type(v27) == "number" then
        error("Only gaussians can be subtracted");
    end;
    return v12.new(v26.mean - v27.mean, v26.variance + v27.variance);
end;
v12.new = function(v28, v29) --[[ Line: 73 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy)
    if v29 <= 0 then
        error("Variance must be > 0, but is " .. v29);
    end;
    return (setmetatable({
        mean = v28, 
        variance = v29, 
        standardDeviation = math.sqrt(v29)
    }, v12));
end;
v12.random = function(v30, v31) --[[ Line: 86 ]] --[[ Name: random ]]
    local l_mean_0 = v30.mean;
    local l_standardDeviation_0 = v30.standardDeviation;
    local v34 = {};
    for _ = 1, v31 do
        table.insert(v34, math.sqrt(math.log(math.random()) * -2) * math.cos(6.283185307179586 * math.random()) * l_standardDeviation_0 + l_mean_0);
    end;
    return v34;
end;
v12.pdf = function(v36, v37) --[[ Line: 99 ]] --[[ Name: pdf ]]
    return math.exp(-math.pow(v37 - v36.mean, 2) / (2 * v36.variance)) / (v36.standardDeviation * 2.5066282746310002);
end;
v12.cdf = function(v38, v39) --[[ Line: 106 ]] --[[ Name: cdf ]]
    -- upvalues: v4 (copy)
    return 0.5 * v4(-(v39 - v38.mean) / (v38.standardDeviation * 1.4142135623730951));
end;
v12.ppf = function(v40, v41) --[[ Line: 111 ]] --[[ Name: ppf ]]
    -- upvalues: v11 (copy)
    return v40.mean - v40.standardDeviation * 1.4142135623730951 * v11(v41 * 2);
end;
v12.scale = function(v42, v43) --[[ Line: 115 ]] --[[ Name: scale ]]
    -- upvalues: v12 (copy)
    return v12.new(v42.mean * v43, v42.variance * v43 * v43);
end;
return v12;