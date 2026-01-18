local l__Template_0 = require(script.Parent:WaitForChild("_Template"));
local l_Util_0 = require(script.Parent.Parent:WaitForChild("Util"));
local l_ExpectType_0 = l_Util_0.ExpectType;
local l_Expect_0 = l_Util_0.Expect;
local v4, v5 = l__Template_0.Create("Enum");
v5._Initial = function(v6) --[[ Line: 16 ]] --[[ Name: _Initial ]]
    local v7 = typeof(v6);
    if v7 == "EnumItem" or v7 == "Enum" then
        return true;
    else
        return false, (("Expected EnumItem or Enum, got %*"):format(v7));
    end;
end;
v5.IsA = function(v8, v9) --[[ Line: 27 ]] --[[ Name: IsA ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v9, l_Expect_0.ENUM_OR_ENUM_ITEM_OR_FUNCTION, 1);
    return v8:_AddConstraint(true, "IsA", function(_, v11, v12) --[[ Line: 30 ]]
        if typeof(v12) == "EnumItem" then
            if v11 == v12 then
                return true;
            else
                return false, (("Expected %*, got %*"):format(v12, v11));
            end;
        elseif table.find(v12:GetEnumItems(), v11) == nil then
            return false, (("Expected a %*, got %*"):format(v12, v11));
        else
            return true;
        end;
    end, v9);
end;
v5.InitialConstraint = v5.IsA;
return v4;