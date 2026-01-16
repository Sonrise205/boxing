local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Collections);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local v5 = require(l_Parent_1.Boolean);
local v6 = require(l_Parent_1.String);
local _ = require(l_Parent_1.ES7Types);
local l_inspect_0 = v2.inspect;
local v9 = require(l_Parent_0.Error);
local v10 = require(l_Parent_1.InstanceOf);
local v12 = {
    stderr = {
        isTTY = false, 
        columns = 0, 
        hasColors = function(_) --[[ Line: 62 ]] --[[ Name: hasColors ]]
            return true;
        end
    }
};
ErrorCaptureStackTrace = function(v13, ...) --[[ Line: 69 ]] --[[ Name: ErrorCaptureStackTrace ]]
    -- upvalues: v9 (copy)
    v9.captureStackTrace(v13, ...);
end;
local function _(v14) --[[ Line: 74 ]] --[[ Name: removeColors ]]
    return v14;
end;
local v16 = "";
local v17 = "";
local v18 = "";
local v19 = "";
local v20 = {
    deepStrictEqual = "Expected values to be strictly deep-equal:", 
    strictEqual = "Expected values to be strictly equal:", 
    strictEqualObject = "Expected \"actual\" to be reference-equal to \"expected\":", 
    deepEqual = "Expected values to be loosely deep-equal:", 
    notDeepStrictEqual = "Expected \"actual\" not to be strictly deep-equal to:", 
    notStrictEqual = "Expected \"actual\" to be strictly unequal to:", 
    notStrictEqualObject = "Expected \"actual\" not to be reference-equal to \"expected\":", 
    notDeepEqual = "Expected \"actual\" not to be loosely deep-equal to:", 
    notIdentical = "Values have same structure but are not reference-equal:", 
    notDeepEqualUnequal = "Expected values not to be loosely deep-equal:"
};
local _ = function(v21) --[[ Line: 102 ]] --[[ Name: copyError ]]
    -- upvalues: l_Object_0 (copy)
    local v22 = l_Object_0.keys(v21);
    local v23 = {};
    for _, v25 in v22 do
        v23[v25] = v21[v25];
    end;
    v23.message = v21.message;
    return v23;
end;
local function _(v27) --[[ Line: 113 ]] --[[ Name: inspectValue ]]
    -- upvalues: l_inspect_0 (copy)
    return l_inspect_0(v27, {
        compact = false, 
        customInspect = false, 
        depth = 1000, 
        maxArrayLength = 1e999, 
        showHidden = false, 
        showProxy = false, 
        sorted = true, 
        getters = true
    });
end;
local function v60(v29, v30, v31) --[[ Line: 128 ]] --[[ Name: createErrDiff ]]
    -- upvalues: l_inspect_0 (copy), v6 (copy), v5 (copy), v20 (copy), v12 (copy), v16 (ref), v19 (ref), l_Array_0 (copy), v17 (ref), v18 (ref)
    local v32 = "";
    local v33 = "";
    local v34 = "";
    local v35 = false;
    local v36 = l_inspect_0(v29, {
        compact = false, 
        customInspect = false, 
        depth = 1000, 
        maxArrayLength = 1e999, 
        showHidden = false, 
        showProxy = false, 
        sorted = true, 
        getters = true
    });
    local v37 = v6.split(v36, "\n");
    local v38 = v6.split(l_inspect_0(v30, {
        compact = false, 
        customInspect = false, 
        depth = 1000, 
        maxArrayLength = 1e999, 
        showHidden = false, 
        showProxy = false, 
        sorted = true, 
        getters = true
    }), "\n");
    local v39 = 0;
    local v40 = "";
    if v31 == "strictEqual" and (typeof(v29) == "table" and v29 ~= nil and typeof(v30) == "table" and v30 ~= nil or typeof(v29) == "function" and typeof(v30) == "function") then
        v31 = "strictEqualObject";
    end;
    if #v37 == 1 and #v38 == 1 and v37[1] ~= v38[1] then
        local v41 = v37[1];
        local v42 = if v5.toJSBoolean(false) then v38[1] else v38[1];
        local v43 = string.len(v41) + string.len(v42);
        if v43 <= 12 then
            if (typeof(v29) ~= "table" or v29 == nil) and (typeof(v30) ~= "table" or v30 == nil) and (v29 ~= 0 or v30 ~= 0) then
                return ("%s\n\n"):format(v20[v31]) .. ("%s !== %s\n"):format(v37[1], v38[1]);
            end;
        elseif v31 ~= "strictEqualObject" and v43 < if v12.stderr.isTTY then v12.stderr.columns else 80 then
            while string.sub(v41, v39 + 1, v39 + 1) == string.sub(v42, v39 + 1, v39 + 1) do
                v39 = v39 + 1;
            end;
            if v39 > 2 then
                v40 = ("\n  %s^"):format(string.rep(" ", v39));
                v39 = 0;
            end;
        end;
    end;
    local v44 = v37[#v37];
    local v45 = v38[#v38];
    while v44 == v45 do
        local l_v39_0 = v39;
        v39 = v39 + 1;
        if l_v39_0 < 3 then
            v34 = ("\n  %s%s"):format(v44, v34);
        else
            v32 = v44;
        end;
        table.remove(v37);
        table.remove(v38);
        if #v37 ~= 0 and #v38 ~= 0 then
            v44 = v37[#v37];
            v45 = v38[#v38];
        else
            break;
        end;
    end;
    local v47 = math.max(#v37, #v38);
    if v47 == 0 then
        local v48 = v6.split(v36, "\n");
        if #v48 > 50 then
            v48[47] = ("%s...%s"):format(v16, v19);
            while #v48 > 47 do
                table.remove(v48);
            end;
        end;
        return ("%s\n\n"):format(v20.notIdentical) .. ("%s\n"):format(l_Array_0.join(v48, "\n"));
    else
        if v39 >= 5 then
            v34 = ("\n%s...%s%s"):format(v16, v19, v34);
            v35 = true;
        end;
        if v32 ~= "" then
            v34 = ("\n  %s%s"):format(v32, v34);
            v32 = "";
        end;
        local v49 = 0;
        local v50 = 0;
        local v51 = v20[v31] .. ("\n%s+ actual%s %s- expected%s"):format(v17, v19, v18, v19);
        local v52 = (" %s...%s Lines skipped"):format(v16, v19);
        local l_v37_0 = v37;
        local v54 = ("%s+%s"):format(v17, v19);
        local v55 = #v38;
        if #v37 < v47 then
            l_v37_0 = v38;
            v54 = ("%s-%s"):format(v18, v19);
            v55 = #v37;
        end;
        for v56 = 1, v47 do
            v39 = v56;
            if v55 < v56 then
                if v50 > 2 then
                    if v50 > 3 then
                        if v50 > 4 then
                            if v50 == 5 then
                                v33 = v33 .. ("\n  %s"):format(l_v37_0[v56 - 3]);
                                v49 = v49 + 1;
                            else
                                v33 = v33 .. ("\n%s...%s"):format(v16, v19);
                                v35 = true;
                            end;
                        end;
                        v33 = v33 .. ("\n  %s"):format(l_v37_0[v56 - 2]);
                        v49 = v49 + 1;
                    end;
                    v33 = v33 .. ("\n  %s"):format(l_v37_0[v56 - 1]);
                    v49 = v49 + 1;
                end;
                v50 = 0;
                if l_v37_0 == v37 then
                    v33 = v33 .. ("\n%s %s"):format(v54, l_v37_0[v56]);
                else
                    v32 = v32 .. ("\n%s %s"):format(v54, l_v37_0[v56]);
                end;
                v49 = v49 + 1;
            else
                local v57 = v38[v56];
                local v58 = v37[v56];
                local v59 = false;
                if v58 ~= v57 then
                    v59 = not v5.toJSBoolean(v6.endsWith(v58, ",")) or v6.slice(v58, 0, -1) ~= v57;
                end;
                if v59 and v6.endsWith(v57, ",") and v6.slice(v57, 0, -1) == v58 then
                    v59 = false;
                    v58 = v58 .. ",";
                end;
                if v59 then
                    if v50 > 2 then
                        if v50 > 3 then
                            if v50 > 4 then
                                if v50 == 5 then
                                    v33 = v33 .. ("\n  %s"):format(v37[v56 - 3]);
                                    v49 = v49 + 1;
                                else
                                    v33 = v33 .. ("\n%s...%s"):format(v16, v19);
                                    v35 = true;
                                end;
                            end;
                            v33 = v33 .. ("\n  %s"):format(v37[v56 - 2]);
                            v49 = v49 + 1;
                        end;
                        v33 = v33 .. ("\n  %s"):format(v37[v56 - 1]);
                        v49 = v49 + 1;
                    end;
                    v50 = 0;
                    v33 = v33 .. ("\n%s+%s %s"):format(v17, v19, v58);
                    v32 = v32 .. ("\n%s-%s %s"):format(v18, v19, v57);
                    v49 = v49 + 2;
                else
                    v33 = v33 .. v32;
                    v32 = "";
                    v50 = v50 + 1;
                    if v50 <= 2 then
                        v33 = v33 .. ("\n  %s"):format(v58);
                        v49 = v49 + 1;
                    end;
                end;
            end;
            if v49 > 50 and v56 < v47 - 2 then
                return ("%s%s\n%s\n%s...%s%s\n"):format(v51, v52, v33, v16, v19, v32) .. ("%s...%s"):format(v16, v19);
            end;
        end;
        return ("%s%s\n%s%s%s%s"):format(v51, if v35 then v52 else "", v33, v32, v34, v40);
    end;
end;
local v61 = setmetatable({}, {
    __index = v9
});
v61.__index = v61;
v61.__tostring = function(v62) --[[ Line: 408 ]]
    return v62:toString();
end;
v61.new = function(v63) --[[ Line: 421 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), v61 (copy), v12 (copy), v16 (ref), v17 (ref), v19 (ref), v18 (ref), l_Array_0 (copy), l_Object_0 (copy), v10 (copy), v60 (copy), v20 (copy), v6 (copy), l_inspect_0 (copy), v5 (copy)
    local v64 = nil;
    local l_message_0 = v63.message;
    local l_operator_0 = v63.operator;
    local l_stackStartFn_0 = v63.stackStartFn;
    local l_actual_0 = v63.actual;
    local l_expected_0 = v63.expected;
    if l_message_0 ~= nil then
        v64 = setmetatable(v9.new((tostring(l_message_0))), v61);
    else
        if v12.stderr.isTTY then
            if v12.stderr:hasColors() then
                v16 = "\027[34m";
                v17 = "\027[32m";
                v19 = "\027[39m";
                v18 = "\027[31m";
            else
                v16 = "";
                v17 = "";
                v19 = "";
                v18 = "";
            end;
        end;
        if typeof(l_actual_0) == "table" and l_actual_0 ~= nil and typeof(l_expected_0) == "table" and l_expected_0 ~= nil and l_Array_0.indexOf(l_Object_0.keys(l_actual_0), "stack") ~= -1 and v10(l_actual_0, v9) and l_Array_0.indexOf(l_Object_0.keys(l_expected_0), "stack") ~= -1 and v10(l_expected_0, v9) then
            local l_l_actual_0_0 = l_actual_0;
            local v71 = l_Object_0.keys(l_l_actual_0_0);
            local v72 = {};
            for _, v74 in v71 do
                v72[v74] = l_l_actual_0_0[v74];
            end;
            v72.message = l_l_actual_0_0.message;
            l_actual_0 = v72;
            l_l_actual_0_0 = l_expected_0;
            v71 = l_Object_0.keys(l_l_actual_0_0);
            v72 = {};
            for _, v76 in v71 do
                v72[v76] = l_l_actual_0_0[v76];
            end;
            v72.message = l_l_actual_0_0.message;
            l_expected_0 = v72;
        end;
        if l_operator_0 == "deepStrictEqual" or l_operator_0 == "strictEqual" then
            v64 = setmetatable(v9.new(v60(l_actual_0, l_expected_0, l_operator_0)), v61);
        elseif l_operator_0 == "notDeepStrictEqual" or l_operator_0 == "notStrictEqual" then
            local v77 = v20[l_operator_0];
            local v78 = v6.split(l_inspect_0(l_actual_0, {
                compact = false, 
                customInspect = false, 
                depth = 1000, 
                maxArrayLength = 1e999, 
                showHidden = false, 
                showProxy = false, 
                sorted = true, 
                getters = true
            }), "\n");
            if l_operator_0 == "notStrictEqual" and (typeof(l_actual_0) == "table" and l_actual_0 ~= nil or typeof(l_actual_0) == "function") then
                v77 = v20.notStrictEqualObject;
            end;
            if #v78 > 50 then
                v78[47] = ("%s...%s"):format(v16, v19);
                while #v78 > 47 do
                    table.remove(v78);
                end;
            end;
            v64 = if #v78 == 1 then setmetatable(v9.new(("%s%s%s"):format(v77, string.len(v78[1]) > 5 and "\n\n" or " ", v78[1])), v61) else setmetatable(v9.new(("%s\n\n%s\n"):format(v77, l_Array_0.join(v78, "\n"))), v61);
        else
            local v79 = l_inspect_0(l_actual_0, {
                compact = false, 
                customInspect = false, 
                depth = 1000, 
                maxArrayLength = 1e999, 
                showHidden = false, 
                showProxy = false, 
                sorted = true, 
                getters = true
            });
            local v80 = l_inspect_0(l_expected_0, {
                compact = false, 
                customInspect = false, 
                depth = 1000, 
                maxArrayLength = 1e999, 
                showHidden = false, 
                showProxy = false, 
                sorted = true, 
                getters = true
            });
            local v81 = v20[tostring(l_operator_0)];
            if l_operator_0 == "notDeepEqual" and v79 == v80 then
                v79 = ("%s\n\n%s"):format(v81, v79);
                if string.len(v79) > 1024 then
                    v79 = ("%s..."):format(v6.slice(v79, 0, 1021));
                end;
                v64 = setmetatable(v9.new(v79), v61);
            else
                if string.len(v79) > 512 then
                    v79 = ("%s..."):format(v6.slice(v79, 0, 509));
                end;
                if string.len(v80) > 512 then
                    v80 = ("%s..."):format(v6.slice(v80, 0, 509));
                end;
                if l_operator_0 == "deepEqual" then
                    v79 = ("%s\n\n%s\n\nshould loosely deep-equal\n\n"):format(v81, v79);
                else
                    local v82 = v20[("%sUnequal"):format((tostring(l_operator_0)))];
                    if v5.toJSBoolean(v82) then
                        v79 = ("%s\n\n%s\n\nshould not loosely deep-equal\n\n"):format(v82, v79);
                    else
                        v80 = (" %s %s"):format(tostring(l_operator_0), v80);
                    end;
                end;
                v64 = setmetatable(v9.new(("%s%s"):format(v79, v80)), v61);
            end;
        end;
    end;
    v64.generatedMessage = not v5.toJSBoolean(l_message_0);
    v64.name = "AssertionError [ERR_ASSERTION]";
    v64.code = "ERR_ASSERTION";
    v64.actual = l_actual_0;
    v64.expected = l_expected_0;
    v64.operator = l_operator_0;
    ErrorCaptureStackTrace(v64, l_stackStartFn_0 or v61.new);
    v64.name = "AssertionError";
    return v64;
end;
v61.toString = function(v83) --[[ Line: 590 ]] --[[ Name: toString ]]
    return ("%s [%s]: %s"):format(v83.name, v83.code, v83.message);
end;
v61.name = "AssertionError";
return {
    AssertionError = v61
};