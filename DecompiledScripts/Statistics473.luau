local v0 = {};
local v1 = require(script.Parent.Gaussian).new(0, 1);
v0.phiMajor = function(v2) --[[ Line: 6 ]] --[[ Name: phiMajor ]]
    -- upvalues: v1 (copy)
    return v1:cdf(v2);
end;
v0.phiMajorInverse = function(v3) --[[ Line: 10 ]] --[[ Name: phiMajorInverse ]]
    -- upvalues: v1 (copy)
    return v1:ppf(v3);
end;
v0.phiMinor = function(v4) --[[ Line: 14 ]] --[[ Name: phiMinor ]]
    -- upvalues: v1 (copy)
    return v1:pdf(v4);
end;
v0.v = function(v5, v6) --[[ Line: 18 ]] --[[ Name: v ]]
    -- upvalues: v0 (copy)
    local v7 = v5 - v6;
    local v8 = v0.phiMajor(v7);
    if v8 < 2.2204460492503E-16 then
        return -v7;
    else
        return v0.phiMinor(v7) / v8;
    end;
end;
v0.w = function(v9, v10) --[[ Line: 24 ]] --[[ Name: w ]]
    -- upvalues: v0 (copy)
    local v11 = v9 - v10;
    if v0.phiMajor(v11) < 2.2204460492503E-16 then
        if v9 < 0 then
            return 1;
        else
            return 0;
        end;
    else
        return v0.v(v9, v10) * (v0.v(v9, v10) + v11);
    end;
end;
v0.vt = function(v12, v13) --[[ Line: 33 ]] --[[ Name: vt ]]
    -- upvalues: v0 (copy)
    local v14 = math.abs(v12);
    local v15 = v0.phiMajor(v13 - v14) - v0.phiMajor(-v13 - v14);
    if v15 < 1.0E-5 then
        if v12 < 0 then
            return -v12 - v13;
        else
            return -v12 + v13;
        end;
    else
        local v16 = v0.phiMinor(-v13 - v14) - v0.phiMinor(v13 - v14);
        return (if v12 < 0 then -v16 else v16) / v15;
    end;
end;
v0.wt = function(v17, v18) --[[ Line: 44 ]] --[[ Name: wt ]]
    -- upvalues: v0 (copy)
    local v19 = math.abs(v17);
    local v20 = v0.phiMajor(v18 - v19) - v0.phiMajor(-v18 - v19);
    if v20 < 2.2204460492503E-16 then
        return 1;
    else
        return ((v18 - v19) * v0.phiMinor(v18 - v19) + (v18 + v19) * v0.phiMinor(-v18 - v19)) / v20 + v0.vt(v17, v18) * v0.vt(v17, v18);
    end;
end;
return v0;