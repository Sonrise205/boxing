local v0 = {
    ENUM_OR_ENUM_ITEM_OR_FUNCTION = {
        "Enum", 
        "EnumItem", 
        "function"
    }, 
    INSTANCE_OR_FUNCTION = {
        "Instance", 
        "function"
    }, 
    BOOLEAN_OR_FUNCTION = {
        "boolean", 
        "function"
    }, 
    STRING_OR_FUNCTION = {
        "string", 
        "function"
    }, 
    NUMBER_OR_FUNCTION = {
        "number", 
        "function"
    }, 
    TABLE_OR_FUNCTION = {
        "table", 
        "function"
    }, 
    SOMETHING = {
        "something"
    }, 
    FUNCTION = {
        "function"
    }, 
    BOOLEAN = {
        "boolean"
    }, 
    STRING = {
        "string"
    }, 
    TABLE = {
        "table"
    }
};
local function v4(v1) --[[ Line: 17 ]] --[[ Name: CreateStandardInitial ]]
    return function(v2) --[[ Line: 18 ]]
        -- upvalues: v1 (copy)
        local v3 = typeof(v2);
        if v3 == v1 then
            return true;
        else
            return false, (("Expected %*, got %*"):format(v1, v3));
        end;
    end;
end;
local function v11(v5, v6, v7) --[[ Line: 30 ]] --[[ Name: ExpectType ]]
    local v8 = typeof(v5);
    for _, v10 in v6 do
        if v8 == v10 then
            return;
        end;
    end;
    error((("Invalid argument #%* (%* expected, got %*)"):format(v7, table.concat(v6, " or "), v8)));
end;
local function v17(v12, v13) --[[ Line: 43 ]] --[[ Name: ConcatWithToString ]]
    local v14 = "";
    for _, v16 in v12 do
        v14 = v14 .. tostring(v16) .. v13;
    end;
    return v14 == "" and v14 or v14:sub(1, #v14 - #v13);
end;
AssertIsTypeBase = function(v18, v19) --[[ Line: 54 ]] --[[ Name: AssertIsTypeBase ]]
    -- upvalues: v0 (copy)
    local v20 = false;
    local l_TABLE_0 = v0.TABLE;
    local v22 = typeof(v18);
    for _, v24 in l_TABLE_0 do
        v20 = v22 == v24;
        if v20 then
            break;
        end;
    end;
    if not v20 then
        error((("Invalid argument #%* (%* expected, got %*)"):format(v19, table.concat(l_TABLE_0, " or "), v22)));
    end;
    v20 = false;
    assert(v18._TC, "Subject is not a TypeChecker.");
end;
local v33 = {
    __tostring = function(v25) --[[ Line: 61 ]] --[[ Name: __tostring ]]
        local v26 = {};
        for v27, v28 in v25 do
            table.insert(v26, tostring(v27) .. " = " .. tostring(v28));
        end;
        local v29 = "{";
        local v30 = "";
        for _, v32 in v26 do
            v30 = v30 .. tostring(v32) .. ", ";
        end;
        return v29 .. (v30 == "" and v30 or v30:sub(1, #v30 - 2)) .. "}";
    end
};
return {
    CreateStandardInitial = v4, 
    ConcatWithToString = v17, 
    AssertIsTypeBase = AssertIsTypeBase, 
    ExpectType = v11, 
    StructureStringMT = v33, 
    Expect = v0
};