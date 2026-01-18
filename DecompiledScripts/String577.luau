local l__Template_0 = require(script.Parent:WaitForChild("_Template"));
local l_Util_0 = require(script.Parent.Parent:WaitForChild("Util"));
local l_CreateStandardInitial_0 = l_Util_0.CreateStandardInitial;
local l_ExpectType_0 = l_Util_0.ExpectType;
local l_Expect_0 = l_Util_0.Expect;
local v5, v6 = l__Template_0.Create("String");
v6._Initial = l_CreateStandardInitial_0("string");
v6.MinLength = function(v7, v8) --[[ Line: 22 ]] --[[ Name: MinLength ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v8, l_Expect_0.NUMBER_OR_FUNCTION, 1);
    return v7:_AddConstraint(true, "MinLength", function(_, v10, v11) --[[ Line: 25 ]]
        if #v10 < v11 then
            return false, (("Length must be at least %*, got %*"):format(v11, #v10));
        else
            return true;
        end;
    end, v8);
end;
v6.MaxLength = function(v12, v13) --[[ Line: 35 ]] --[[ Name: MaxLength ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v13, l_Expect_0.NUMBER_OR_FUNCTION, 1);
    return v12:_AddConstraint(true, "MaxLength", function(_, v15, v16) --[[ Line: 38 ]]
        if v16 < #v15 then
            return false, (("Length must be at most %*, got %*"):format(v16, #v15));
        else
            return true;
        end;
    end, v13);
end;
v6.Pattern = function(v17, v18) --[[ Line: 48 ]] --[[ Name: Pattern ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v18, l_Expect_0.STRING_OR_FUNCTION, 1);
    return v17:_AddConstraint(false, "Pattern", function(_, v20, v21) --[[ Line: 51 ]]
        if string.match(v20, v21) ~= v20 then
            return false, (("String does not match pattern %*"):format(v21));
        else
            return true;
        end;
    end, v18);
end;
v6.Contains = function(v22, v23) --[[ Line: 61 ]] --[[ Name: Contains ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v23, l_Expect_0.STRING_OR_FUNCTION, 1);
    return v22:_AddConstraint(false, "Contains", function(_, v25, v26) --[[ Line: 64 ]]
        if string.find(v25, v26) == nil then
            return false, (("String does not contain substring %*"):format(v26));
        else
            return true;
        end;
    end, v23);
end;
local l_IsAValueIn_0 = l__Template_0.BaseMethods.IsAValueIn;
v6.InitialConstraintsDirectVariadic = function(v28, ...) --[[ Line: 74 ]]
    -- upvalues: l_IsAValueIn_0 (copy)
    return l_IsAValueIn_0(v28, {
        ...
    });
end;
return v5;