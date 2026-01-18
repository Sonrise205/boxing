local l__Template_0 = require(script.Parent:WaitForChild("_Template"));
local l_Util_0 = require(script.Parent.Parent:WaitForChild("Util"));
local l_StructureStringMT_0 = l_Util_0.StructureStringMT;
local l_AssertIsTypeBase_0 = l_Util_0.AssertIsTypeBase;
local l_ExpectType_0 = l_Util_0.ExpectType;
local l_Expect_0 = l_Util_0.Expect;
local v6, v7 = l__Template_0.Create("Object");
v7._Initial = function(v8) --[[ Line: 26 ]] --[[ Name: _Initial ]]
    if type(v8) == "table" then
        if rawget(v8, 1) == nil then
            return true;
        else
            return false, "Incorrect key type: numeric index [1]";
        end;
    else
        return false, (("Expected table, got %*"):format((type(v8))));
    end;
end;
v7.OfStructure = function(v9, v10) --[[ Line: 49 ]] --[[ Name: OfStructure ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy), l_AssertIsTypeBase_0 (copy), l_StructureStringMT_0 (copy)
    l_ExpectType_0(v10, l_Expect_0.TABLE, 1);
    local v11 = {};
    for v12, v13 in v10 do
        l_AssertIsTypeBase_0(v13, v12);
        v11[v12] = v13;
    end;
    setmetatable(v11, l_StructureStringMT_0);
    return v9:_AddConstraint(true, "OfStructure", function(v14, v15, v16) --[[ Line: 62 ]]
        for v17, v18 in v16 do
            local v19, v20 = v18:_Check(v15[v17]);
            if not v19 then
                return false, (("[Key '%*'] %*"):format(v17, v20));
            end;
        end;
        if v14._Tags.Strict then
            for v21 in v15 do
                if not v16[v21] then
                    return false, (("[Key '%*'] unexpected (strict)"):format(v21));
                end;
            end;
        end;
        return true;
    end, v11);
end;
v7.OfValueType = function(v22, v23) --[[ Line: 86 ]] --[[ Name: OfValueType ]]
    -- upvalues: l_AssertIsTypeBase_0 (copy)
    l_AssertIsTypeBase_0(v23, 1);
    return v22:_AddConstraint(true, "OfValueType", function(_, v25, v26) --[[ Line: 89 ]]
        for v27, v28 in v25 do
            local v29, v30 = v26:_Check(v28);
            if not v29 then
                return false, (("[OfValueType: Key '%*'] %*"):format(v27, v30));
            end;
        end;
        return true;
    end, v23);
end;
v7.OfKeyType = function(v31, v32) --[[ Line: 103 ]] --[[ Name: OfKeyType ]]
    -- upvalues: l_AssertIsTypeBase_0 (copy)
    l_AssertIsTypeBase_0(v32, 1);
    return v31:_AddConstraint(true, "OfKeyType", function(_, v34, v35) --[[ Line: 106 ]]
        for v36 in v34 do
            local v37, v38 = v35:_Check(v36);
            if not v37 then
                return false, (("[OfKeyType: Key '%*'] %*"):format(v36, v38));
            end;
        end;
        return true;
    end, v32);
end;
v7.Strict = function(v39) --[[ Line: 120 ]] --[[ Name: Strict ]]
    return v39:_AddTag("Strict");
end;
v7.OfStructureStrict = function(v40, v41) --[[ Line: 125 ]] --[[ Name: OfStructureStrict ]]
    return v40:OfStructure(v41):Strict();
end;
v7.IsFrozen = function(v42) --[[ Line: 130 ]] --[[ Name: IsFrozen ]]
    return v42:_AddConstraint(true, "IsFrozen", function(_, v44) --[[ Line: 131 ]]
        if table.isfrozen(v44) then
            return true;
        else
            return false, "Table was not frozen";
        end;
    end);
end;
v7.CheckMetatable = function(v45, v46) --[[ Line: 141 ]] --[[ Name: CheckMetatable ]]
    -- upvalues: l_AssertIsTypeBase_0 (copy)
    l_AssertIsTypeBase_0(v46, 1);
    return v45:_AddConstraint(true, "CheckMetatable", function(_, v48, v49) --[[ Line: 144 ]]
        local v50, v51 = v49:_Check((getmetatable(v48)));
        if v50 then
            return true;
        else
            return false, (("[Metatable] %*"):format(v51));
        end;
    end, v46);
end;
v7.OfClass = function(v52, v53) --[[ Line: 156 ]] --[[ Name: OfClass ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy), v6 (copy)
    l_ExpectType_0(v53, l_Expect_0.TABLE, 1);
    assert(v53.__index, "Class must have an __index");
    return v52:CheckMetatable(v6():Equals(v53));
end;
v7.InitialConstraint = v7.OfStructure;
return v6;