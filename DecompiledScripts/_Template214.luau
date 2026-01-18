local l_Util_0 = require(script.Parent.Parent:WaitForChild("Util"));
local l_ConcatWithToString_0 = l_Util_0.ConcatWithToString;
local l_AssertIsTypeBase_0 = l_Util_0.AssertIsTypeBase;
local l_ExpectType_0 = l_Util_0.ExpectType;
local l_Expect_0 = l_Util_0.Expect;
local function v12(v5, v6) --[[ Line: 71 ]] --[[ Name: IsAKeyIn ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy), l_ConcatWithToString_0 (copy)
    l_ExpectType_0(v6, l_Expect_0.TABLE_OR_FUNCTION, 1);
    return v5:_AddConstraint(false, "IsAKeyIn", function(_, v8, v9) --[[ Line: 74 ]]
        -- upvalues: l_ConcatWithToString_0 (ref)
        if v9[v8] == nil then
            local v10 = {};
            for v11 in v9 do
                table.insert(v10, v11);
            end;
            return false, (("Key %* was not found in set (%*)"):format(v8, (l_ConcatWithToString_0(v10, ", "))));
        else
            return true;
        end;
    end, v6);
end;
local function v20(v13, v14) --[[ Line: 89 ]] --[[ Name: IsAValueIn ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v14, l_Expect_0.TABLE_OR_FUNCTION, 1);
    return v13:_AddConstraint(false, "IsAValueIn", function(_, v16, v17) --[[ Line: 92 ]]
        for _, v19 in v17 do
            if v19 == v16 then
                return true;
            end;
        end;
        return false, (("Value %* was not found in table %*"):format(v16, v17));
    end, v14);
end;
local function v26(v21, v22) --[[ Line: 103 ]] --[[ Name: Equals ]]
    return v21:_AddConstraint(true, "Equals", function(_, v24, v25) --[[ Line: 104 ]]
        if v24 == v25 then
            return true;
        else
            return false, (("Value %* does not equal %*"):format(v24, v25));
        end;
    end, v22);
end;
local function v32(v27, v28) --[[ Line: 113 ]] --[[ Name: GreaterThan ]]
    return v27:_AddConstraint(true, "GreaterThan", function(_, v30, v31) --[[ Line: 114 ]]
        if v31 < v30 then
            return true;
        else
            return false, (("Value %* is not greater than %*"):format(v30, v31));
        end;
    end, v28);
end;
local function v38(v33, v34) --[[ Line: 123 ]] --[[ Name: LessThan ]]
    return v33:_AddConstraint(true, "LessThan", function(_, v36, v37) --[[ Line: 124 ]]
        if v36 < v37 then
            return true;
        else
            return false, (("Value %* is not less than %*"):format(v36, v37));
        end;
    end, v34);
end;
local function v44(v39, v40) --[[ Line: 133 ]] --[[ Name: GreaterThanOrEqualTo ]]
    return v39:_AddConstraint(true, "GreaterThanOrEqualTo", function(_, v42, v43) --[[ Line: 134 ]]
        if v43 <= v42 then
            return true;
        else
            return false, (("Value %* is not greater than or equal to %*"):format(v42, v43));
        end;
    end, v40);
end;
local function v50(v45, v46) --[[ Line: 143 ]] --[[ Name: LessThanOrEqualTo ]]
    return v45:_AddConstraint(true, "LessThanOrEqualTo", function(_, v48, v49) --[[ Line: 144 ]]
        if v48 <= v49 then
            return true;
        else
            return false, (("Value %* is not less than or equal to %*"):format(v48, v49));
        end;
    end, v46);
end;
local v51 = {
    __mode = "ks"
};
local v52 = {};
local v53 = nil;
return {
    Create = function(v54) --[[ Line: 160 ]] --[[ Name: CreateTemplate ]]
        -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy), l_AssertIsTypeBase_0 (copy), v53 (ref), v51 (copy), v52 (copy), l_ConcatWithToString_0 (copy), v44 (copy), v50 (copy), v20 (copy), v32 (copy), v12 (copy), v38 (copy), v26 (copy)
        l_ExpectType_0(v54, l_Expect_0.STRING, 1);
        local v55 = {
            InitialConstraintsDirectVariadic = nil, 
            InitialConstraintsVariadic = nil, 
            InitialConstraints = nil, 
            InitialConstraint = nil, 
            Type = v54, 
            _TC = true
        };
        v55.__index = v55;
        v55.new = function(...) --[[ Line: 173 ]] --[[ Name: new ]]
            -- upvalues: v55 (copy)
            local v56 = {
                _Tags = {}, 
                _Disjunction = {}, 
                _Conjunction = {}, 
                _ActiveConstraints = {}, 
                _LastConstraint = ""
            };
            for v57, v58 in v55 do
                if v57 ~= "new" and v57 ~= "__index" and v57 ~= "__tostring" then
                    v56[v57] = v58;
                end;
            end;
            setmetatable(v56, {
                __tostring = v55.__tostring
            });
            local v59 = select("#", ...);
            local l_InitialConstraint_0 = v56.InitialConstraint;
            if l_InitialConstraint_0 and v59 > 0 then
                return l_InitialConstraint_0(v56, ...);
            else
                local l_InitialConstraints_0 = v55.InitialConstraints;
                if l_InitialConstraints_0 and v59 > 0 then
                    for v62 = 1, v59 do
                        v56 = l_InitialConstraints_0[v62](v56, select(v62, ...));
                    end;
                    return v56;
                else
                    local l_InitialConstraintsVariadic_0 = v55.InitialConstraintsVariadic;
                    if l_InitialConstraintsVariadic_0 and v59 > 0 then
                        for v64 = 1, v59 do
                            v56 = l_InitialConstraintsVariadic_0(v56, select(v64, ...));
                        end;
                        return v56;
                    else
                        local l_InitialConstraintsDirectVariadic_0 = v55.InitialConstraintsDirectVariadic;
                        if l_InitialConstraintsDirectVariadic_0 and v59 > 0 then
                            return l_InitialConstraintsDirectVariadic_0(v56, ...);
                        else
                            return v56;
                        end;
                    end;
                end;
            end;
        end;
        v55.Copy = function(v66) --[[ Line: 246 ]] --[[ Name: Copy ]]
            -- upvalues: v55 (copy)
            local v67 = v55.new();
            for v68, v69 in v66._Tags do
                v67._Tags[v68] = v69;
            end;
            for v70, v71 in v66._Disjunction do
                v67._Disjunction[v70] = v71;
            end;
            for v72, v73 in v66._Conjunction do
                v67._Conjunction[v72] = v73;
            end;
            for v74, v75 in v66._ActiveConstraints do
                v67._ActiveConstraints[v74] = v75;
            end;
            v67._Context = v66._Context;
            v67._FailMessage = v66._FailMessage;
            v67._LastConstraint = v66._LastConstraint;
            return v67;
        end;
        v55.Negate = function(v76) --[[ Line: 277 ]] --[[ Name: Negate ]]
            v76 = v76:Copy();
            local l__LastConstraint_0 = v76._LastConstraint;
            assert(l__LastConstraint_0 ~= "", "Nothing to negate! (No constraints active)");
            v76._ActiveConstraints[l__LastConstraint_0][4] = true;
            return v76;
        end;
        v55.FailMessage = function(v78, v79) --[[ Line: 288 ]] --[[ Name: FailMessage ]]
            -- upvalues: l_ExpectType_0 (ref), l_Expect_0 (ref)
            l_ExpectType_0(v79, l_Expect_0.STRING_OR_FUNCTION, 1);
            v78 = v78:Copy();
            v78._FailMessage = v79;
            return v78;
        end;
        v55.Cached = function(v80) --[[ Line: 297 ]] --[[ Name: Cached ]]
            return v80:_AddTag("Cached");
        end;
        v55.Optional = function(v81) --[[ Line: 302 ]] --[[ Name: Optional ]]
            return v81:_AddTag("Optional");
        end;
        v55.Or = function(v82, v83) --[[ Line: 307 ]] --[[ Name: Or ]]
            -- upvalues: l_AssertIsTypeBase_0 (ref)
            if type(v83) ~= "function" then
                l_AssertIsTypeBase_0(v83, 1);
            end;
            v82 = v82:Copy();
            table.insert(v82._Disjunction, v83);
            return v82;
        end;
        v55.And = function(v84, v85) --[[ Line: 318 ]] --[[ Name: And ]]
            -- upvalues: l_AssertIsTypeBase_0 (ref)
            l_AssertIsTypeBase_0(v85, 1);
            v84 = v84:Copy();
            table.insert(v84._Conjunction, v85);
            return v84;
        end;
        v55.Alias = function(v86, v87) --[[ Line: 327 ]] --[[ Name: Alias ]]
            -- upvalues: l_ExpectType_0 (ref), l_Expect_0 (ref)
            l_ExpectType_0(v87, l_Expect_0.STRING, 1);
            v86 = v86:Copy();
            v86._Alias = v87;
            return v86;
        end;
        v55.WithContext = function(v88, v89) --[[ Line: 337 ]] --[[ Name: WithContext ]]
            v88._Context = v89;
            return v88;
        end;
        v55.AsPredicate = function(v90) --[[ Line: 343 ]] --[[ Name: AsPredicate ]]
            return function(v91) --[[ Line: 344 ]]
                -- upvalues: v90 (copy)
                return v90:_Check(v91);
            end;
        end;
        v55.AsAssertion = function(v92) --[[ Line: 350 ]] --[[ Name: AsAssertion ]]
            return function(v93) --[[ Line: 351 ]]
                -- upvalues: v92 (copy)
                return v92:Assert(v93);
            end;
        end;
        v55.Check = function(v94, v95) --[[ Line: 357 ]] --[[ Name: Check ]]
            -- upvalues: v53 (ref)
            v53 = v94._Context;
            local v96, v97 = v94:_Check(v95);
            v53 = nil;
            return v96, v97;
        end;
        v55.Assert = function(v98, v99) --[[ Line: 365 ]] --[[ Name: Assert ]]
            assert(v98:Check(v99));
        end;
        v55._AddConstraint = function(v100, v101, v102, v103, ...) --[[ Line: 369 ]] --[[ Name: _AddConstraint ]]
            -- upvalues: l_ExpectType_0 (ref), l_Expect_0 (ref)
            if v101 ~= nil then
                l_ExpectType_0(v101, l_Expect_0.BOOLEAN, 1);
            end;
            l_ExpectType_0(v102, l_Expect_0.STRING, 2);
            l_ExpectType_0(v103, l_Expect_0.FUNCTION, 3);
            v100 = v100:Copy();
            local v104 = {
                ...
            };
            local v105 = false;
            for _, v107 in v104 do
                if type(v107) == "function" then
                    v105 = true;
                end;
            end;
            local l__ActiveConstraints_0 = v100._ActiveConstraints;
            if v101 then
                local v109 = false;
                for _, v111 in l__ActiveConstraints_0 do
                    if v111[5] == v102 then
                        v109 = true;
                        break;
                    end;
                end;
                if v109 then
                    error((("Attempt to apply a constraint marked as 'only once' more than once: %*."):format(v102)));
                end;
            end;
            local v112 = #l__ActiveConstraints_0 + 1;
            l__ActiveConstraints_0[v112] = {
                v103, 
                v104, 
                v105, 
                false, 
                v102
            };
            v100._LastConstraint = v112;
            return v100;
        end;
        v55._AddTag = function(v113, v114) --[[ Line: 414 ]] --[[ Name: _AddTag ]]
            -- upvalues: l_ExpectType_0 (ref), l_Expect_0 (ref)
            l_ExpectType_0(v114, l_Expect_0.STRING, 1);
            if v113._Tags[v114] then
                error((("Tag already exists: %*."):format(v114)));
            end;
            v113 = v113:Copy();
            v113._Tags[v114] = true;
            return v113;
        end;
        v55._CreateCache = function(v115) --[[ Line: 428 ]] --[[ Name: _CreateCache ]]
            -- upvalues: v51 (ref)
            local v116 = setmetatable({}, v51);
            v115._Cache = v116;
            return v116;
        end;
        v55._Check = function(v117, v118) --[[ Line: 435 ]] --[[ Name: _Check ]]
            -- upvalues: v52 (ref), v53 (ref)
            local l_Cached_0 = v117._Tags.Cached;
            local v120 = nil;
            if l_Cached_0 then
                v120 = v117._Cache or v117:_CreateCache();
                local v121 = v120[v118 or v52];
                if v121 then
                    return v121[1], v121[2];
                end;
            end;
            local l__Disjunction_0 = v117._Disjunction;
            for _, v124 in l__Disjunction_0 do
                if type(v124) == "function" then
                    v124 = v124(v117);
                end;
                if v124:_Check(v118) then
                    if l_Cached_0 then
                        v120[v118 or v52] = {
                            true
                        };
                    end;
                    return true;
                end;
            end;
            for _, v126 in v117._Conjunction do
                local v127, v128 = v126:_Check(v118);
                if not v127 then
                    local l__FailMessage_0 = v117._FailMessage;
                    local v130 = type(l__FailMessage_0) == "function" and l__FailMessage_0(v118, v53) or l__FailMessage_0 or ("[Conjunction %*] %*"):format(v126, v128);
                    if l_Cached_0 then
                        v120[v118 or v52] = {
                            false, 
                            v130
                        };
                    end;
                    return false, v130;
                end;
            end;
            if v117._Tags.Optional and v118 == nil then
                if l_Cached_0 then
                    v120[v118 or v52] = {
                        true
                    };
                end;
                return true;
            else
                local v131, v132 = v117._Initial(v118);
                if not v131 then
                    if l__Disjunction_0[1] then
                        local v133 = v117._FailMessage or ("Disjunctions failed on %*"):format(v117);
                        if l_Cached_0 then
                            v120[v118 or v52] = {
                                false, 
                                v133
                            };
                        end;
                        return false, v133;
                    else
                        v132 = v117._FailMessage or v132;
                        if l_Cached_0 then
                            v120[v118 or v52] = {
                                false, 
                                v132
                            };
                        end;
                        return false, v132;
                    end;
                else
                    for _, v135 in v117._ActiveConstraints do
                        local v136 = v135[1];
                        local v137 = v135[2];
                        local v138 = v135[3];
                        local v139 = v135[4];
                        local v140 = v135[5];
                        if v138 then
                            v137 = table.clone(v137);
                            for v141, v142 in v137 do
                                if type(v142) == "function" then
                                    v137[v141] = v142(v53);
                                end;
                            end;
                        end;
                        local v143, v144 = v136(v117, v118, unpack(v137));
                        if v139 then
                            v144 = if v143 then ("Constraint '%*' succeeded but was expected to fail on value %*"):format(v140, v118) else "";
                            v143 = not v143;
                        end;
                        if not v143 then
                            if l__Disjunction_0[1] then
                                local v145 = v117._FailMessage or ("Disjunctions failed on %*"):format(v117);
                                if l_Cached_0 then
                                    v120[v118 or v52] = {
                                        false, 
                                        v145
                                    };
                                end;
                                return false, v145;
                            else
                                v144 = v117._FailMessage or v144;
                                if l_Cached_0 then
                                    v120[v118 or v52] = {
                                        false, 
                                        v144
                                    };
                                end;
                                return false, v144;
                            end;
                        end;
                    end;
                    if l_Cached_0 then
                        v120[v118 or v52] = {
                            true
                        };
                    end;
                    return true;
                end;
            end;
        end;
        v55.__tostring = function(v146) --[[ Line: 578 ]] --[[ Name: __tostring ]]
            -- upvalues: l_ConcatWithToString_0 (ref)
            local l__Alias_0 = v146._Alias;
            if l__Alias_0 then
                return l__Alias_0;
            else
                local v148 = {};
                local l__ActiveConstraints_1 = v146._ActiveConstraints;
                if next(l__ActiveConstraints_1) ~= nil then
                    local v150 = {};
                    for _, v152 in l__ActiveConstraints_1 do
                        table.insert(v150, v152[5] .. "(" .. l_ConcatWithToString_0(v152[2], ", ") .. ")");
                    end;
                    table.insert(v148, "Constraints = {" .. l_ConcatWithToString_0(v150, ", ") .. "}");
                end;
                local l__Disjunction_1 = v146._Disjunction;
                if #l__Disjunction_1 > 0 then
                    local v154 = {};
                    for _, v156 in l__Disjunction_1 do
                        table.insert(v154, (tostring(v156)));
                    end;
                    table.insert(v148, "Or = {" .. l_ConcatWithToString_0(v154, ", ") .. "}");
                end;
                local l__Conjunction_0 = v146._Conjunction;
                if #l__Conjunction_0 > 0 then
                    local v158 = {};
                    for _, v160 in l__Conjunction_0 do
                        table.insert(v158, (tostring(v160)));
                    end;
                    table.insert(v148, "And = {" .. l_ConcatWithToString_0(v158, ", ") .. "}");
                end;
                local l__Context_0 = v146._Context;
                if l__Context_0 then
                    table.insert(v148, "Context = " .. tostring(l__Context_0));
                end;
                return v146.Type .. "(" .. l_ConcatWithToString_0(v148, ", ") .. ")";
            end;
        end;
        v55.GreaterThanOrEqualTo = v44;
        v55.LessThanOrEqualTo = v50;
        v55.IsAValueIn = v20;
        v55.GreaterThan = v32;
        v55.IsAKeyIn = v12;
        v55.LessThan = v38;
        v55.Equals = v26;
        return function(...) --[[ Line: 644 ]]
            -- upvalues: v55 (copy)
            return v55.new(...);
        end, v55;
    end, 
    BaseMethods = {
        GreaterThanOrEqualTo = v44, 
        LessThanOrEqualTo = v50, 
        IsAValueIn = v20, 
        GreaterThan = v32, 
        IsAKeyIn = v12, 
        LessThan = v38, 
        Equals = v26
    }
};