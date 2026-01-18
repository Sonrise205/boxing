local l__Template_0 = require(script.Parent:WaitForChild("_Template"));
local l_Util_0 = require(script.Parent.Parent:WaitForChild("Util"));
local l_CreateStandardInitial_0 = l_Util_0.CreateStandardInitial;
local l_ExpectType_0 = l_Util_0.ExpectType;
local l_Expect_0 = l_Util_0.Expect;
local v5, v6 = l__Template_0.Create("Number");
v6._Initial = l_CreateStandardInitial_0("number");
v6.Integer = function(v7) --[[ Line: 27 ]] --[[ Name: Integer ]]
    return v7:_AddConstraint(true, "Integer", function(_, v9) --[[ Line: 28 ]]
        if v9 % 1 == 0 then
            return true;
        else
            return false, (("Expected integer form, got %*"):format(v9));
        end;
    end);
end;
v6.Decimal = function(v10) --[[ Line: 38 ]] --[[ Name: Decimal ]]
    return v10:_AddConstraint(true, "Decimal", function(_, v12) --[[ Line: 39 ]]
        if v12 % 1 ~= 0 then
            return true;
        else
            return false, (("Expected decimal form, got %*"):format(v12));
        end;
    end);
end;
v6.RangeInclusive = function(v13, v14, v15) --[[ Line: 49 ]] --[[ Name: RangeInclusive ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v14, l_Expect_0.NUMBER_OR_FUNCTION, 1);
    v15 = v15 == nil and v14 or v15;
    l_ExpectType_0(v15, l_Expect_0.NUMBER_OR_FUNCTION, 2);
    if v15 == v14 then
        return v13:Equals(v14);
    else
        return v13:GreaterThanOrEqualTo(v14):LessThanOrEqualTo(v15);
    end;
end;
v6.RangeExclusive = function(v16, v17, v18) --[[ Line: 62 ]] --[[ Name: RangeExclusive ]]
    return v16:GreaterThan(v17):LessThan(v18);
end;
v6.Positive = function(v19) --[[ Line: 67 ]] --[[ Name: Positive ]]
    return v19:_AddConstraint(true, "Positive", function(_, v21) --[[ Line: 68 ]]
        if v21 < 0 then
            return false, (("Expected positive number, got %*"):format(v21));
        else
            return true;
        end;
    end);
end;
v6.Negative = function(v22) --[[ Line: 78 ]] --[[ Name: Negative ]]
    return v22:_AddConstraint(true, "Negative", function(_, v24) --[[ Line: 79 ]]
        if v24 >= 0 then
            return false, (("Expected negative number, got %*"):format(v24));
        else
            return true;
        end;
    end);
end;
v6.IsNaN = function(v25) --[[ Line: 89 ]] --[[ Name: IsNaN ]]
    return v25:_AddConstraint(true, "IsNaN", function(_, v27) --[[ Line: 90 ]]
        if v27 ~= v27 then
            return true;
        else
            return false, (("Expected NaN, got %*"):format(v27));
        end;
    end);
end;
v6.IsInfinite = function(v28) --[[ Line: 100 ]] --[[ Name: IsInfinite ]]
    return v28:_AddConstraint(true, "IsInfinite", function(_, v30) --[[ Line: 101 ]]
        if v30 == 1e999 or v30 == -1e999 then
            return true;
        else
            return false, (("Expected infinite, got %*"):format(v30));
        end;
    end);
end;
v6.IsClose = function(v31, v32, v33) --[[ Line: 111 ]] --[[ Name: IsClose ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v32, l_Expect_0.NUMBER_OR_FUNCTION, 1);
    return v31:_AddConstraint(true, "IsClose", function(_, v35, v36, v37) --[[ Line: 115 ]]
        if math.abs(v35 - v36) < v37 then
            return true;
        else
            return false, (("Expected %* +/- %*, got %*"):format(v36, v37, v35));
        end;
    end, v32, v33 or 1.0E-5);
end;
v6.InitialConstraint = v6.RangeInclusive;
return v5;