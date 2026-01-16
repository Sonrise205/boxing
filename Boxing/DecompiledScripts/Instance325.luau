local l_CollectionService_0 = game:GetService("CollectionService");
local l__Template_0 = require(script.Parent:WaitForChild("_Template"));
local l_Util_0 = require(script.Parent.Parent:WaitForChild("Util"));
local l_CreateStandardInitial_0 = l_Util_0.CreateStandardInitial;
local l_StructureStringMT_0 = l_Util_0.StructureStringMT;
local l_AssertIsTypeBase_0 = l_Util_0.AssertIsTypeBase;
local l_ExpectType_0 = l_Util_0.ExpectType;
local l_Expect_0 = l_Util_0.Expect;
local function v10(v8, v9) --[[ Line: 32 ]] --[[ Name: Get ]]
    return v8[v9];
end;
local function _(v11, v12) --[[ Line: 36 ]] --[[ Name: TryGet ]]
    -- upvalues: v10 (copy)
    local l_status_0, l_result_0 = pcall(v10, v11, v12);
    if l_status_0 then
        return l_result_0;
    else
        return nil;
    end;
end;
local v16, v17 = l__Template_0.Create("Instance");
v17._Initial = l_CreateStandardInitial_0("Instance");
v17.OfStructure = function(v18, v19) --[[ Line: 50 ]] --[[ Name: OfStructure ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy), l_AssertIsTypeBase_0 (copy), l_StructureStringMT_0 (copy), v10 (copy)
    l_ExpectType_0(v19, l_Expect_0.TABLE, 1);
    local v20 = {};
    for v21, v22 in v19 do
        l_AssertIsTypeBase_0(v22, v21);
        v20[v21] = v22;
    end;
    setmetatable(v20, l_StructureStringMT_0);
    return v18:_AddConstraint(true, "OfStructure", function(v23, v24, v25) --[[ Line: 63 ]]
        -- upvalues: v10 (ref)
        for v26, v27 in v25 do
            local l_status_1, l_result_1 = pcall(v10, v24, v26);
            local v30 = if l_status_1 then l_result_1 else nil;
            l_status_1, l_result_1 = v27:_Check(v30);
            if not l_status_1 then
                return false, (("%*%*'] %*"):format(typeof(v30) == "Instance" and "[Instance '" or "[Property '", v26, l_result_1));
            end;
        end;
        if v23._Tags.Strict then
            for _, v32 in v24:GetChildren() do
                local l_Name_0 = v32.Name;
                if not v25[l_Name_0] then
                    return false, (("[Instance '%*'] unexpected (strict)"):format(l_Name_0));
                end;
            end;
        end;
        return true;
    end, v20);
end;
v17.IsA = function(v34, v35) --[[ Line: 91 ]] --[[ Name: IsA ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v35, l_Expect_0.STRING_OR_FUNCTION, 1);
    return v34:_AddConstraint(true, "IsA", function(_, v37, v38) --[[ Line: 94 ]]
        if not v37:IsA(v38) then
            return false, (("Expected %*, got %*"):format(v38, v37.ClassName));
        else
            return true;
        end;
    end, v35);
end;
v17.Strict = function(v39) --[[ Line: 104 ]] --[[ Name: Strict ]]
    return v39:_AddTag("Strict");
end;
v17.OfStructureStrict = function(v40, v41) --[[ Line: 109 ]] --[[ Name: OfStructureStrict ]]
    return v40:OfStructure(v41):Strict();
end;
v17.HasTag = function(v42, v43) --[[ Line: 114 ]] --[[ Name: HasTag ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy), l_CollectionService_0 (copy)
    l_ExpectType_0(v43, l_Expect_0.STRING_OR_FUNCTION, 1);
    return v42:_AddConstraint(false, "HasTag", function(_, v45, v46) --[[ Line: 117 ]]
        -- upvalues: l_CollectionService_0 (ref)
        if l_CollectionService_0:HasTag(v45, v46) then
            return true;
        else
            return false, (("Expected tag '%*' on Instance %*"):format(v46, (v45:GetFullName())));
        end;
    end, v43);
end;
v17.HasAttribute = function(v47, v48) --[[ Line: 127 ]] --[[ Name: HasAttribute ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v48, l_Expect_0.STRING_OR_FUNCTION, 1);
    return v47:_AddConstraint(false, "HasAttribute", function(_, v50, v51) --[[ Line: 130 ]]
        if v50:GetAttribute(v51) ~= nil then
            return true;
        else
            return false, (("Expected attribute '%*' to exist on Instance %*"):format(v51, (v50:GetFullName())));
        end;
    end, v48);
end;
v17.CheckAttribute = function(v52, v53, v54) --[[ Line: 140 ]] --[[ Name: CheckAttribute ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy), l_AssertIsTypeBase_0 (copy)
    l_ExpectType_0(v53, l_Expect_0.STRING_OR_FUNCTION, 1);
    l_AssertIsTypeBase_0(v54, 2);
    return v52:_AddConstraint(false, "CheckAttribute", function(_, v56, v57) --[[ Line: 144 ]]
        -- upvalues: v54 (copy)
        local v58, v59 = v54:_Check(v56:GetAttribute(v57));
        if not v58 then
            return false, (("Attribute '%*' not satisfied on Instance %*: %*"):format(v57, v56:GetFullName(), v59));
        else
            return true;
        end;
    end, v53, v54);
end;
v17.HasTags = function(v60, v61) --[[ Line: 156 ]] --[[ Name: HasTags ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy), l_CollectionService_0 (copy)
    l_ExpectType_0(v61, l_Expect_0.TABLE_OR_FUNCTION, 1);
    if type(v61) == "table" then
        for v62, v63 in v61 do
            assert(type(v63) == "string", (("Expected tag #%* to be a string"):format(v62)));
        end;
    end;
    return v60:_AddConstraint(false, "HasTags", function(_, v65, v66) --[[ Line: 165 ]]
        -- upvalues: l_CollectionService_0 (ref)
        for _, v68 in v66 do
            if not l_CollectionService_0:HasTag(v65, v68) then
                return false, (("Expected tag '%*' on Instance %*"):format(v68, (v65:GetFullName())));
            end;
        end;
        return true;
    end, v61);
end;
v17.HasAttributes = function(v69, v70) --[[ Line: 177 ]] --[[ Name: HasAttributes ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v70, l_Expect_0.TABLE_OR_FUNCTION, 1);
    if type(v70) == "table" then
        for v71, v72 in v70 do
            assert(type(v72) == "string", (("Expected attribute #%* to be a string"):format(v71)));
        end;
    end;
    return v69:_AddConstraint(false, "HasAttributes", function(_, v74, v75) --[[ Line: 186 ]]
        for _, v77 in v75 do
            if v74:GetAttribute(v77) == nil then
                return false, (("Expected attribute '%*' to exist on Instance %*"):format(v77, (v74:GetFullName())));
            end;
        end;
        return true;
    end, v70);
end;
v17.CheckAttributes = function(v78, v79) --[[ Line: 198 ]] --[[ Name: CheckAttributes ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy), l_AssertIsTypeBase_0 (copy)
    l_ExpectType_0(v79, l_Expect_0.TABLE, 1);
    for v80, v81 in v79 do
        assert(type(v80) == "string", (("Attribute '%*' was not a string"):format(v80)));
        l_AssertIsTypeBase_0(v81, "");
    end;
    return v78:_AddConstraint(false, "CheckAttributes", function(_, v83, v84) --[[ Line: 206 ]]
        for v85, v86 in v84 do
            local v87, v88 = v86:_Check(v83:GetAttribute(v85));
            if not v87 then
                return false, (("Attribute '%*' not satisfied on Instance %*: %*"):format(v85, v83:GetFullName(), v88));
            end;
        end;
        return true;
    end, v79);
end;
v17.IsDescendantOf = function(v89, v90) --[[ Line: 220 ]] --[[ Name: IsDescendantOf ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v90, l_Expect_0.INSTANCE_OR_FUNCTION, 1);
    return v89:_AddConstraint(true, "IsDescendantOf", function(_, v92, v93) --[[ Line: 223 ]]
        if v92:IsDescendantOf(v93) then
            return true;
        else
            return false, (("Expected Instance %* to be a descendant of %*"):format(v92:GetFullName(), (v93:GetFullName())));
        end;
    end, v90);
end;
v17.IsAncestorOf = function(v94, v95) --[[ Line: 233 ]] --[[ Name: IsAncestorOf ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v95, l_Expect_0.INSTANCE_OR_FUNCTION, 1);
    return v94:_AddConstraint(false, "IsAncestorOf", function(_, v97, v98) --[[ Line: 236 ]]
        if v97:IsAncestorOf(v98) then
            return true;
        else
            return false, (("Expected Instance %* to be an ancestor of %*"):format(v97:GetFullName(), (v98:GetFullName())));
        end;
    end, v95);
end;
v17.HasChild = function(v99, v100) --[[ Line: 246 ]] --[[ Name: HasChild ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v100, l_Expect_0.STRING_OR_FUNCTION, 1);
    return v99:_AddConstraint(false, "HasChild", function(_, v102, v103) --[[ Line: 249 ]]
        if v102:FindFirstChild(v103) then
            return true;
        else
            return false, (("Expected child '%*' to exist on Instance %*"):format(v103, (v102:GetFullName())));
        end;
    end, v100);
end;
v17.InitialConstraints = {
    v17.IsA, 
    v17.OfStructure
};
return v16;