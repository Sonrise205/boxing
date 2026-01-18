local l__Template_0 = require(script.Parent:WaitForChild("_Template"));
local l_Util_0 = require(script.Parent.Parent:WaitForChild("Util"));
local l_StructureStringMT_0 = l_Util_0.StructureStringMT;
local l_AssertIsTypeBase_0 = l_Util_0.AssertIsTypeBase;
local l_ExpectType_0 = l_Util_0.ExpectType;
local l_Expect_0 = l_Util_0.Expect;
local v6, v7 = l__Template_0.Create("Array");
v7._Initial = function(v8) --[[ Line: 28 ]] --[[ Name: _Initial ]]
    if type(v8) == "table" then
        local v9 = next(v8);
        if v9 == nil or v9 == 1 then
            return true;
        else
            return false, "Array is empty";
        end;
    else
        return false, (("Expected table, got %*"):format((type(v8))));
    end;
end;
v7.OfLength = function(v10, v11) --[[ Line: 55 ]] --[[ Name: OfLength ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v11, l_Expect_0.NUMBER_OR_FUNCTION, 1);
    return v10:_AddConstraint(true, "Length", function(_, v13, v14) --[[ Line: 58 ]]
        if #v13 ~= v14 then
            return false, (("Length must be %*, got %*"):format(v14, #v13));
        else
            return true;
        end;
    end, v11);
end;
v7.MinLength = function(v15, v16) --[[ Line: 68 ]] --[[ Name: MinLength ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v16, l_Expect_0.NUMBER_OR_FUNCTION, 1);
    return v15:_AddConstraint(true, "MinLength", function(_, v18, v19) --[[ Line: 71 ]]
        if #v18 < v19 then
            return false, (("Length must be at least %*, got %*"):format(v19, #v18));
        else
            return true;
        end;
    end, v16);
end;
v7.MaxLength = function(v20, v21) --[[ Line: 81 ]] --[[ Name: MaxLength ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v21, l_Expect_0.NUMBER_OR_FUNCTION, 1);
    return v20:_AddConstraint(true, "MaxLength", function(_, v23, v24) --[[ Line: 84 ]]
        if v24 < #v23 then
            return false, (("Length must be at most %*, got %*"):format(v24, #v23));
        else
            return true;
        end;
    end, v21);
end;
v7.Contains = function(v25, v26, v27) --[[ Line: 94 ]] --[[ Name: Contains ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    if v26 == nil then
        l_ExpectType_0(v26, l_Expect_0.SOMETHING, 1);
    end;
    if v27 then
        l_ExpectType_0(v27, l_Expect_0.NUMBER_OR_FUNCTION, 2);
    end;
    return v25:_AddConstraint(false, "Contains", function(_, v29, v30, v31) --[[ Line: 103 ]]
        if table.find(v29, v30, v31) == nil then
            return false, (("Value not found in array: %*"):format(v30));
        else
            return true;
        end;
    end, v26, v27);
end;
v7.OfType = function(v32, v33) --[[ Line: 113 ]] --[[ Name: OfType ]]
    -- upvalues: l_AssertIsTypeBase_0 (copy)
    l_AssertIsTypeBase_0(v33, 1);
    return v32:_AddConstraint(true, "OfType", function(_, v35, v36) --[[ Line: 116 ]]
        for v37, v38 in v35 do
            local v39, v40 = v36:_Check(v38);
            if not v39 then
                return false, (("[Index #%*] %*"):format(v37, v40));
            end;
        end;
        return true;
    end, v33);
end;
v7.OfStructure = function(v41, v42) --[[ Line: 130 ]] --[[ Name: OfStructure ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy), l_AssertIsTypeBase_0 (copy), l_StructureStringMT_0 (copy)
    l_ExpectType_0(v42, l_Expect_0.TABLE, 1);
    local v43 = table.create(#v42);
    for v44, v45 in v42 do
        l_AssertIsTypeBase_0(v45, v44);
        v43[v44] = v45;
    end;
    setmetatable(v43, l_StructureStringMT_0);
    return v41:_AddConstraint(true, "OfStructure", function(v46, v47, v48) --[[ Line: 143 ]]
        for v49, v50 in v48 do
            local v51, v52 = v50:_Check(v47[v49]);
            if not v51 then
                return false, (("[Index #%*] %*"):format(v49, v52));
            end;
        end;
        if v46._Tags.Strict then
            for v53 in v47 do
                if not v48[v53] then
                    return false, (("[Index #%*] Unexpected value (strict tag is present)"):format(v53));
                end;
            end;
        end;
        return true;
    end, v43, v42);
end;
v7.OfStructureStrict = function(v54, v55) --[[ Line: 169 ]] --[[ Name: OfStructureStrict ]]
    return v54:OfStructure(v55):Strict();
end;
v7.Strict = function(v56) --[[ Line: 174 ]] --[[ Name: Strict ]]
    return v56:_AddTag("Strict");
end;
v7.IsFrozen = function(v57) --[[ Line: 179 ]] --[[ Name: IsFrozen ]]
    return v57:_AddConstraint(true, "IsFrozen", function(_, v59) --[[ Line: 180 ]]
        if table.isfrozen(v59) then
            return true;
        else
            return false, "Table was not frozen";
        end;
    end);
end;
v7.IsOrdered = function(v60, v61) --[[ Line: 190 ]] --[[ Name: IsOrdered ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    if v61 ~= nil then
        l_ExpectType_0(v61, l_Expect_0.BOOLEAN_OR_FUNCTION, 1);
    end;
    return v60:_AddConstraint(true, "IsOrdered", function(_, v63, v64) --[[ Line: 195 ]]
        local v65 = not v64;
        local v66 = #v63;
        if v66 == 1 then
            return true;
        else
            local v67 = v63[1];
            for v68 = 2, v66 do
                local v69 = v63[v68];
                if v64 and v67 < v69 then
                    return false, (("Array is not ordered descending at index %*"):format(v68));
                elseif v65 and v69 < v67 then
                    return false, (("Array is not ordered ascending at index %*"):format(v68));
                else
                    v67 = v69;
                end;
            end;
            return true;
        end;
    end, v61);
end;
v7.InitialConstraint = v7.OfType;
return v6;